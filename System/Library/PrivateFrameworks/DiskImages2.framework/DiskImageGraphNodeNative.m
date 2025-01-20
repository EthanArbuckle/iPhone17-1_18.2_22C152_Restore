@interface DiskImageGraphNodeNative
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4;
- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8;
- (NSURL)filePath;
- (id)URL;
- (id)toDIShadowNode;
- (id)toDictionary;
- (void)setFilePath:(id)a3;
@end

@implementation DiskImageGraphNodeNative

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DiskImageGraphNodeNative;
  if (objc_msgSendSuper2(&v10, sel_validateWithDictionary_error_, v6, a4))
  {
    BOOL v7 = 0;
    if ([v6 validateAndPopObjectForKey:@"FilePath" className:objc_opt_class() isOptional:0 error:a4])
    {
      if ([v6 count])
      {
        v8 = [NSString stringWithFormat:@"Validation failed, input contains unexpected data."];
        BOOL v7 = +[DIError failWithPOSIXCode:22 verboseInfo:v8 error:a4];
      }
      else
      {
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (+[DiskImageGraphNodeNative validateWithDictionary:v10 error:a6])
  {
    v20.receiver = self;
    v20.super_class = (Class)DiskImageGraphNodeNative;
    self = [(DiskImageGraphNode *)&v20 initWithDictionary:v10 updateChangesToDict:v8 workDir:v11 error:a6];
    if (!self) {
      goto LABEL_4;
    }
    v12 = NSURL;
    uint64_t v13 = [v10 objectForKey:@"FilePath"];
    v14 = [v12 fileURLWithPath:v13 relativeToURL:v11];
    filePath = self->_filePath;
    self->_filePath = v14;

    v16 = [(DiskImageGraphNodeNative *)self filePath];
    LOBYTE(v13) = [v16 checkResourceIsReachableAndReturnError:a6];

    if ((v13 & 1) == 0)
    {
      v17 = +[DIError nilWithPOSIXCode:2 verboseInfo:@"Image referenced in the pstack is unreachable." error:a6];
    }
    else
    {
LABEL_4:
      v17 = self;
      self = v17;
    }
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DiskImageGraphNodeNative;
  v16 = [(DiskImageGraphNode *)&v19 initWithTag:a4 UUID:a5 parentNode:a6 metadata:a7 isCache:v8];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_filePath, a3);
  }

  return v17;
}

- (void)setFilePath:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  v5 = [(DiskImageGraphNode *)self pstackDict];

  if (v5)
  {
    v6 = [(DiskImageGraphNode *)self pstackDict];
    BOOL v7 = [v8 relativeString];
    [v6 setObject:v7 forKey:@"FilePath"];
  }
}

- (BOOL)deleteImage
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(DiskImageGraphNodeNative *)self filePath];
  id v16 = 0;
  char v5 = [v3 removeItemAtURL:v4 error:&v16];
  id v6 = v16;

  if ((v5 & 1) == 0)
  {
    int v7 = *__error();
    if (DIForwardLogs())
    {
      id v8 = getDIOSLog();
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v9 = [(DiskImageGraphNodeNative *)self filePath];
      id v10 = [v6 description];
      *(_DWORD *)buf = 68158466;
      int v18 = 39;
      __int16 v19 = 2080;
      objc_super v20 = "-[DiskImageGraphNodeNative deleteImage]";
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      v12 = getDIOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [(DiskImageGraphNodeNative *)self filePath];
        v14 = [v6 description];
        *(_DWORD *)buf = 68158466;
        int v18 = 39;
        __int16 v19 = 2080;
        objc_super v20 = "-[DiskImageGraphNodeNative deleteImage]";
        __int16 v21 = 2112;
        v22 = v13;
        __int16 v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_21E237000, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed to delete %@: %@", buf, 0x26u);
      }
    }
    *__error() = v7;
  }

  return v5;
}

- (id)toDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)DiskImageGraphNodeNative;
  v3 = [(DiskImageGraphNode *)&v8 toDictionary];
  v4 = (void *)[v3 mutableCopy];

  char v5 = [(DiskImageGraphNodeNative *)self filePath];
  id v6 = [v5 relativePath];
  [v4 setObject:v6 forKeyedSubscript:@"FilePath"];

  return v4;
}

- (id)URL
{
  return self->_filePath;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
}

- (id)toDIShadowNode
{
  v3 = [DIShadowNode alloc];
  v4 = [(DiskImageGraphNodeNative *)self filePath];
  char v5 = [(DIShadowNode *)v3 initWithURL:v4 isCache:[(DiskImageGraphNode *)self isCache]];

  return v5;
}

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(DiskImageGraphNodeNative *)self filePath];
  objc_super v8 = +[DiskImageGraph getImageInfoDictWithURL:v7 error:a4];

  if (v8)
  {
    v9 = [v8 objectForKeyedSubscript:@"Image Format"];
    int v10 = [v9 isEqualToString:@"RAW"];

    if (v10)
    {
      int v11 = *__error();
      if (DIForwardLogs())
      {
        v12 = getDIOSLog();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v23 = 72;
        __int16 v24 = 2080;
        uint64_t v25 = "-[DiskImageGraphNodeNative(Append) validateAppendedImageWithInfo:error:]";
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();

        if (v13)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v13);
          free(v13);
        }
      }
      else
      {
        objc_super v20 = getDIOSLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v23 = 72;
          __int16 v24 = 2080;
          uint64_t v25 = "-[DiskImageGraphNodeNative(Append) validateAppendedImageWithInfo:error:]";
          _os_log_impl(&dword_21E237000, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Parent image is RAW, skipping shadow UUID validation on append.", buf, 0x12u);
        }
      }
      *__error() = v11;
      goto LABEL_13;
    }
    id v15 = [v6 objectForKeyedSubscript:@"Identity Info"];
    id v16 = [v15 objectForKeyedSubscript:@"Parent UUID"];
    v17 = [v8 objectForKeyedSubscript:@"Identity Info"];
    int v18 = [v17 objectForKeyedSubscript:@"UUID"];
    char v19 = [v16 isEqualToString:v18];

    if (v19)
    {
LABEL_13:
      BOOL v14 = 1;
      goto LABEL_14;
    }
    BOOL v14 = +[DIError failWithPOSIXCode:22 verboseInfo:@"UUID validation failed for appended image." error:a4];
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_14:

  return v14;
}

@end