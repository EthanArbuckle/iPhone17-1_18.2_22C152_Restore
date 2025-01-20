@interface DIUserDataParams
+ (BOOL)supportsSecureCoding;
- (BOOL)embedWithError:(id *)a3;
- (BOOL)retrieveWithError:(id *)a3;
- (BOOL)supportsPstack;
- (DIUserDataParams)initWithCoder:(id)a3;
- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)userDict;
- (void)encodeWithCoder:(id)a3;
- (void)setUserDict:(id)a3;
@end

@implementation DIUserDataParams

- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DIUserDataParams;
  v4 = [(DIBaseParams *)&v8 initWithURL:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    userDict = v4->_userDict;
    v4->_userDict = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v5;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DIUserDataParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIUserDataParams;
  v5 = [(DIBaseParams *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userData"];
    if (v6)
    {
      v7 = (void *)MEMORY[0x263F08928];
      objc_super v8 = (void *)MEMORY[0x263EFFA08];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      id v16 = 0;
      uint64_t v12 = [v7 unarchivedObjectOfClasses:v11 fromData:v6 error:&v16];
      id v13 = v16;
      userDict = v5->_userDict;
      v5->_userDict = (NSDictionary *)v12;

      if (!v13) {
        goto LABEL_7;
      }
    }
    else
    {
      id v13 = +[DIError errorWithPOSIXCode:22 verboseInfo:@"Failed serializing user dictionary"];
    }
    [(DIBaseParams *)v5 setDeserializationError:v13];
LABEL_7:
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIUserDataParams;
  [(DIBaseParams *)&v17 encodeWithCoder:v4];
  v5 = (void *)MEMORY[0x263F08910];
  v6 = [(DIUserDataParams *)self userDict];
  id v16 = 0;
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v16];
  id v8 = v16;

  if (v8)
  {
    int v9 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v15 = 0;
      uint64_t v10 = getDIOSLog();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      int v19 = 36;
      __int16 v20 = 2080;
      v21 = "-[DIUserDataParams encodeWithCoder:]";
      __int16 v22 = 2114;
      id v23 = v8;
      LODWORD(v14) = 28;
      id v13 = buf;
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      uint64_t v12 = getDIOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        int v19 = 36;
        __int16 v20 = 2080;
        v21 = "-[DIUserDataParams encodeWithCoder:]";
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_impl(&dword_21E237000, v12, OS_LOG_TYPE_ERROR, "%.*s: Error encoding user dictionary: %{public}@", buf, 0x1Cu);
      }
    }
    *__error() = v9;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, @"userData", v13, v14, v15);
}

- (BOOL)retrieveWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (![(DIBaseParams *)self openExistingImageWithFlags:0 error:a3]) {
    return 0;
  }
  int v5 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v17 = 0;
    v6 = getDIOSLog();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 38;
    *(_WORD *)uint64_t v24 = 2080;
    *(void *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
    *(_WORD *)&v24[10] = 2114;
    *(void *)&v24[12] = self;
    LODWORD(v15) = 28;
    uint64_t v14 = buf;
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    int v9 = getDIOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 38;
      *(_WORD *)uint64_t v24 = 2080;
      *(void *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
      *(_WORD *)&v24[10] = 2114;
      *(void *)&v24[12] = self;
      _os_log_impl(&dword_21E237000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v5;
  *(void *)buf = 0;
  *(void *)uint64_t v24 = buf;
  *(void *)&v24[8] = 0x3032000000;
  *(void *)&v24[16] = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v24 + 40) connectWithError:a3] & 1) != 0
    && [(DIBaseParams *)self prepareImageWithXpcHandler:*(void *)(*(void *)v24 + 40) fileMode:2 error:a3])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    __int16 v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    uint64_t v10 = [*(id *)(*(void *)v24 + 40) remoteProxy];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__DIUserDataParams_retrieveWithError___block_invoke;
    v16[3] = &unk_2644A22B8;
    v16[4] = &v17;
    v16[5] = buf;
    [v10 retrieveUserDataWithParams:self reply:v16];

    char v8 = [*(id *)(*(void *)v24 + 40) completeCommandWithError:a3];
    if (v8)
    {
      v11 = [(id)v18[5] userDict];
      if (v11)
      {
        uint64_t v12 = [(id)v18[5] userDict];
      }
      else
      {
        uint64_t v12 = (void *)MEMORY[0x263EFFA78];
      }
      -[DIUserDataParams setUserDict:](self, "setUserDict:", v12, v14, v15);
      if (v11) {
    }
      }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    char v8 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v8;
}

void __38__DIUserDataParams_retrieveWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) signalCommandCompletedWithXpcError:v6];
}

- (BOOL)embedWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = [(DIUserDataParams *)self userDict];
  if (!v5) {
    return +[DIError failWithPOSIXCode:22 verboseInfo:@"userDict cannot be nil or empty" error:a3];
  }
  id v6 = [(DIUserDataParams *)self userDict];
  uint64_t v7 = [v6 count];

  if (!v7) {
    return +[DIError failWithPOSIXCode:22 verboseInfo:@"userDict cannot be nil or empty" error:a3];
  }
  if (![(DIBaseParams *)self openExistingImageWithFlags:2 error:a3]) {
    return 0;
  }
  int v8 = *__error();
  if (DIForwardLogs())
  {
    v15[5] = 0;
    int v9 = getDIOSLog();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 35;
    *(_WORD *)uint64_t v17 = 2080;
    *(void *)&v17[2] = "-[DIUserDataParams embedWithError:]";
    *(_WORD *)&v17[10] = 2114;
    *(void *)&v17[12] = self;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    uint64_t v12 = getDIOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 35;
      *(_WORD *)uint64_t v17 = 2080;
      *(void *)&v17[2] = "-[DIUserDataParams embedWithError:]";
      *(_WORD *)&v17[10] = 2114;
      *(void *)&v17[12] = self;
      _os_log_impl(&dword_21E237000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v8;
  *(void *)buf = 0;
  *(void *)uint64_t v17 = buf;
  *(void *)&v17[8] = 0x3032000000;
  *(void *)&v17[16] = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  uint64_t v19 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v17 + 40) connectWithError:a3] & 1) != 0
    && [(DIBaseParams *)self prepareImageWithXpcHandler:*(void *)(*(void *)v17 + 40) fileMode:4 error:a3])
  {
    id v13 = [*(id *)(*(void *)v17 + 40) remoteProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __35__DIUserDataParams_embedWithError___block_invoke;
    v15[3] = &unk_2644A22E0;
    v15[4] = buf;
    [v13 embedUserDataWithParams:self reply:v15];

    char v11 = [*(id *)(*(void *)v17 + 40) completeCommandWithError:a3];
  }
  else
  {
    char v11 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v11;
}

uint64_t __35__DIUserDataParams_embedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) signalCommandCompletedWithXpcError:a2];
}

- (NSDictionary)userDict
{
  return self->_userDict;
}

- (void)setUserDict:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end