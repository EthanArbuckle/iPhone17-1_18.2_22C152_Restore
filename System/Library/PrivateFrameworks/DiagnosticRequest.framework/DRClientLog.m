@interface DRClientLog
+ (id)sandboxExtensionForLog:(id)a3 transferOwnership:(BOOL)a4;
- (BOOL)transferOwnership;
- (DRClientLog)initWithPath:(id)a3 transferOwnership:(BOOL)a4 errorOut:(id *)a5;
- (NSString)path;
- (NSString)sandboxExtension;
- (id)_checkPath;
- (id)description;
@end

@implementation DRClientLog

- (id)_checkPath
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v3 = [(DRClientLog *)self path];

  if (v3)
  {
    char v26 = 0;
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(DRClientLog *)self path];
    char v6 = [v4 fileExistsAtPath:v5 isDirectory:&v26];

    if ((v6 & 1) == 0)
    {
      v20 = DPLogHandle_ClientError();
      if (os_signpost_enabled(v20))
      {
        v21 = [(DRClientLog *)self path];
        int v31 = 138543362;
        v32 = v21;
        _os_signpost_emit_unreliably_with_name_impl();
      }
      id v22 = [NSString alloc];
      v23 = [(DRClientLog *)self path];
      v11 = (void *)[v22 initWithFormat:@"Log file '%@' does not exist", v23];

      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30 = v11;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = &v30;
      v15 = &v29;
      goto LABEL_13;
    }
    if (v26)
    {
      v7 = DPLogHandle_ClientError();
      if (os_signpost_enabled(v7))
      {
        v8 = [(DRClientLog *)self path];
        int v31 = 138543362;
        v32 = v8;
        _os_signpost_emit_unreliably_with_name_impl();
      }
      id v9 = [NSString alloc];
      v10 = [(DRClientLog *)self path];
      v11 = (void *)[v9 initWithFormat:@"Log file '%@' is a directory", v10];

      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28 = v11;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = &v28;
      v15 = &v27;
LABEL_13:
      v24 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
      v19 = [v12 errorWithDomain:@"DRClientLogError" code:0 userInfo:v24];

      goto LABEL_14;
    }
    v19 = 0;
  }
  else
  {
    v16 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v16))
    {
      LOWORD(v31) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @"Log path not provided by client";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v19 = [v17 errorWithDomain:@"DRClientLogError" code:0 userInfo:v18];
  }
LABEL_14:

  return v19;
}

+ (id)sandboxExtensionForLog:(id)a3 transferOwnership:(BOOL)a4
{
  id v4 = a3;
  [v4 UTF8String];
  uint64_t v5 = sandbox_extension_issue_file();
  if (v5)
  {
    char v6 = (void *)v5;
    v7 = [NSString stringWithUTF8String:v5];
    free(v6);
  }
  else
  {
    v8 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v8)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    v7 = 0;
  }

  return v7;
}

- (DRClientLog)initWithPath:(id)a3 transferOwnership:(BOOL)a4 errorOut:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DRClientLog;
  v10 = [(DRClientLog *)&v26 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v10->_path, a3);
  v12 = [(DRClientLog *)v11 _checkPath];
  v13 = v12;
  if (!v12)
  {
    v11->_transferOwnership = a4;
    v15 = objc_opt_class();
    v16 = [(DRClientLog *)v11 path];
    uint64_t v17 = objc_msgSend(v15, "sandboxExtensionForLog:transferOwnership:", v16, -[DRClientLog transferOwnership](v11, "transferOwnership"));
    sandboxExtension = v11->_sandboxExtension;
    v11->_sandboxExtension = (NSString *)v17;

    v19 = [(DRClientLog *)v11 sandboxExtension];

    if (!v19)
    {
      if (a5)
      {
        v21 = NSString;
        id v22 = [(DRClientLog *)v11 path];
        v23 = [v21 stringWithFormat:@"Could not create sandbox extension for '%@'. This may be due to lack of sufficient permissions to access the file.", v22];

        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v28[0] = v23;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        *a5 = [v24 errorWithDomain:@"DRClientLogError" code:0 userInfo:v25];
      }
      goto LABEL_5;
    }
LABEL_7:
    v14 = v11;
    goto LABEL_8;
  }
  if (a5) {
    *a5 = v12;
  }
LABEL_5:

  v14 = 0;
LABEL_8:

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  if (self->_transferOwnership) {
    uint64_t v5 = "Y";
  }
  else {
    uint64_t v5 = "N";
  }
  char v6 = (void *)[v3 initWithFormat:@"<%@: %@, transfer=%s >", v4, self->_path, v5];

  return v6;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)transferOwnership
{
  return self->_transferOwnership;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end