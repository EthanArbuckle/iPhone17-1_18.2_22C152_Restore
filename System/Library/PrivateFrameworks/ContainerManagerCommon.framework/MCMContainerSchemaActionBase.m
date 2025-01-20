@interface MCMContainerSchemaActionBase
+ (id)actionIdentifier;
+ (id)actionWithName:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6;
+ (void)_resolveArguments:(id)a3 toPathArgument:(id *)a4 context:(id)a5;
+ (void)_resolveArguments:(id)a3 toSourcePathArgument:(id *)a4 destPathArgument:(id *)a5 destFinalPathArgument:(id *)a6 context:(id)a7;
- (BOOL)backupFileURL:(id)a3 error:(id *)a4;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5;
- (BOOL)makedirAtURL:(id)a3 followTerminalSymlink:(BOOL)a4 error:(id *)a5;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionBase)initWithContext:(id)a3;
- (MCMContainerSchemaContext)context;
- (NSString)description;
@end

@implementation MCMContainerSchemaActionBase

- (void).cxx_destruct
{
  p_context = &self->_context;

  objc_storeStrong((id *)p_context, 0);
}

- (MCMContainerSchemaContext)context
{
  return self->_context;
}

- (BOOL)performWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ was called on the base class %@", v5, v7 format];

  __break(1u);
  return result;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5
{
  id v8 = a3;
  v9 = (uint64_t (**)(id, id, id *))a5;
  v10 = [(MCMContainerSchemaActionBase *)self context];
  v11 = [v10 containerPath];

  v12 = [(MCMContainerSchemaActionBase *)self context];
  v13 = [v12 identifier];

  v14 = [(MCMContainerSchemaActionBase *)self context];
  v15 = [v14 libraryRepair];

  if (v15)
  {
    v16 = [v8 path];
    v17 = [v11 containerRootURL];
    v18 = [v17 path];
    int v19 = [v16 hasPrefix:v18];

    v20 = [(MCMContainerSchemaActionBase *)self context];
    v21 = [v20 libraryRepair];
    v22 = v21;
    if (v19) {
      char v23 = [v21 fixAndRetryIfPermissionsErrorWithURL:v8 containerPath:v11 containerIdentifier:v13 error:a4 duringBlock:v9];
    }
    else {
      char v23 = [v21 fixAndRetryIfPermissionsErrorWithURL:v8 error:a4 duringBlock:v9];
    }
    char v24 = v23;
  }
  else
  {
    char v24 = v9[2](v9, v8, a4);
  }

  return v24;
}

- (BOOL)makedirAtURL:(id)a3 followTerminalSymlink:(BOOL)a4 error:(id *)a5
{
  BOOL v42 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MCMContainerSchemaActionBase *)self context];
  id v8 = [v7 containerPath];
  v9 = [v8 containerDataURL];
  v41 = [v9 path];

  id v10 = v6;
  memset(&v54, 0, sizeof(v54));
  uint64_t v11 = sysconf(120);
  v40 = v10;
  if (v11 < 1)
  {
    id v22 = 0;
LABEL_17:
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_131;
    v43[3] = &unk_1E6A80A30;
    id v44 = v40;
    uint64_t v34 = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_131((uint64_t)v43);

    v38 = v44;
    id v22 = (id)v34;
    goto LABEL_18;
  }
  id v12 = 0;
  unint64_t v13 = v11 + 1;
  while (1)
  {
    id v10 = v10;
    if (lstat((const char *)[v10 fileSystemRepresentation], &v54))
    {
      if (*__error() != 2)
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_123;
        v47[3] = &unk_1E6A80A30;
        id v10 = v10;
        id v48 = v10;
        __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_123((uint64_t)v47);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        v38 = v48;
        goto LABEL_18;
      }

      v14 = +[MCMFileManager defaultManager];
      v15 = [(MCMContainerSchemaActionBase *)self context];
      uint64_t v16 = [v15 posixMode];
      v17 = [(MCMContainerSchemaActionBase *)self context];
      v18 = [v17 posixOwner];
      int v19 = [(MCMContainerSchemaActionBase *)self context];
      uint64_t v20 = [v19 dataProtectionClass];
      id v53 = 0;
      char v21 = [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 mode:v16 owner:v18 dataProtectionClass:v20 error:&v53];
      id v22 = v53;

      if ((v21 & 1) == 0)
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke;
        v49[3] = &unk_1E6A7FFC8;
        id v10 = v10;
        id v50 = v10;
        v51 = self;
        id v52 = v22;
        id v37 = v22;
        __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke((uint64_t)v49);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        v38 = v50;
        goto LABEL_18;
      }
      goto LABEL_14;
    }
    int v23 = v54.st_mode & 0xF000;
    if (v42 && v23 == 40960) {
      break;
    }
    if (v23 == 0x4000
      || ([v10 path],
          v31 = objc_claimAutoreleasedReturnValue(),
          int v32 = [v31 hasPrefix:v41],
          v31,
          !v32))
    {
      BOOL v35 = 1;
      goto LABEL_22;
    }
    id v45 = v12;
    BOOL v33 = [(MCMContainerSchemaActionBase *)self backupFileURL:v10 error:&v45];
    id v22 = v45;

    if (!v33) {
      goto LABEL_19;
    }
LABEL_14:
    --v13;
    id v12 = v22;
    if (v13 <= 1) {
      goto LABEL_17;
    }
  }
  char v24 = +[MCMFileManager defaultManager];
  id v46 = v12;
  v25 = [v24 targetOfSymbolicLinkAtURL:v10 error:&v46];
  id v22 = v46;

  if (v25)
  {
    v26 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    v27 = [v25 stringByAddingPercentEncodingWithAllowedCharacters:v26];

    v28 = (void *)MEMORY[0x1E4F1CB10];
    v29 = [v10 URLByDeletingLastPathComponent];
    uint64_t v30 = [v28 URLWithString:v27 relativeToURL:v29];

    id v10 = (id)v30;
    goto LABEL_14;
  }
  v38 = 0;
LABEL_18:

LABEL_19:
  if (a5)
  {
    id v12 = v22;
    BOOL v35 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v35 = 0;
    id v12 = v22;
  }
LABEL_22:

  return v35;
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke(uint64_t a1)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) context];
  v5 = (void *)[v2 initWithFormat:@"Failed to create sub-dir at %@ (protClass: %d)", v3, objc_msgSend(v4, "dataProtectionClass")];

  v22[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke"];
  v23[0] = v6;
  v23[1] = &unk_1F2F11B40;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v22[1] = @"SourceFileLine";
  v22[2] = v7;
  v23[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  if (*(void *)(a1 + 48))
  {
    v9 = (void *)[v8 mutableCopy];
    [v9 setObject:*(void *)(a1 + 48) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v10 = (void *)[v9 copy];

    if (*(void *)(a1 + 48))
    {
      uint64_t v11 = container_log_handle_for_category();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      int v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      unint64_t v13 = "%{public}@ (%{public}@)";
      v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v10 = v8;
  }
  uint64_t v11 = container_log_handle_for_category();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  int v19 = v5;
  unint64_t v13 = "%{public}@";
  v14 = v11;
  uint32_t v15 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_7:

  uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:6 userInfo:v10];

  return v16;
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_123(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Failed to stat [%@] when creating directories", v3];

  v10[0] = @"FunctionName";
  v5 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11B58;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_131(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"failed to resolve [%@] after %ld tries", v3, sysconf(120)];

  v10[0] = @"FunctionName";
  v5 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11B70;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:62 userInfo:v7];

  return v8;
}

- (BOOL)backupFileURL:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MCMContainerSchemaActionBase *)self context];
  id v8 = [v7 containerPath];
  v9 = [v8 containerDataURL];
  id v10 = [v9 path];

  uint64_t v11 = [v6 path];
  uint64_t v12 = [(MCMContainerSchemaActionBase *)self context];
  unint64_t v13 = [v12 homeDirectoryURL];
  v14 = [v13 path];
  char v15 = [v11 hasPrefix:v14];

  if ((v15 & 1) == 0)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke;
    v41[3] = &unk_1E6A80510;
    id v42 = v6;
    v43 = self;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke((uint64_t)v41);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v20 = 0;
    uint64_t v21 = v42;
    goto LABEL_5;
  }
  memset(&v47, 0, sizeof(v47));
  id v16 = v6;
  if (lstat((const char *)[v16 fileSystemRepresentation], &v47))
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96;
    v39[3] = &unk_1E6A80A30;
    id v17 = v16;
    id v40 = v17;
    v18 = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96((uint64_t)v39);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_102;
    v36[3] = &unk_1E6A80510;
    id v37 = v17;
    id v38 = v18;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_102((uint64_t)v36);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v20 = 0;
    uint64_t v21 = v40;
    goto LABEL_5;
  }
  int v22 = v47.st_mode & 0xF000;
  if (v22 != 0x4000 && v22 != 0x8000)
  {
    id v28 = v16;
    if (unlink((const char *)[v28 fileSystemRepresentation]) && *__error() != 2)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_108;
      v44[3] = &unk_1E6A7FF30;
      id v30 = v28;
      stat v46 = v47;
      id v45 = v30;
      v31 = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_108((uint64_t)v44);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_114;
      v33[3] = &unk_1E6A80510;
      id v34 = v30;
      id v35 = v31;
      __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_114((uint64_t)v33);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v20 = 0;
      uint64_t v21 = v45;
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  int v23 = [v16 path];
  int v24 = [v23 hasPrefix:v10];

  if (!v24)
  {
LABEL_16:
    id v19 = 0;
    goto LABEL_17;
  }
  v25 = +[MCMFileManager defaultManager];
  [v25 stripACLFromURL:v16 error:0];

  v26 = +[MCMFileManager defaultManager];
  id v32 = 0;
  char v27 = [v26 removeItemAtURL:v16 error:&v32];
  id v19 = v32;

  if (v27)
  {
LABEL_17:
    BOOL v20 = 1;
    goto LABEL_18;
  }
  uint64_t v21 = [v19 domain];
  if ([v21 isEqualToString:*MEMORY[0x1E4F28798]]) {
    BOOL v20 = [v19 code] == 2;
  }
  else {
    BOOL v20 = 0;
  }
LABEL_5:

  if (a4 && !v20)
  {
    id v19 = v19;
    BOOL v20 = 0;
    *a4 = v19;
  }
LABEL_18:

  return v20;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = [*(id *)(a1 + 40) context];
  v5 = [v4 homeDirectoryURL];
  id v6 = [v5 path];
  uint64_t v7 = (void *)[v2 initWithFormat:@"Request to backup file [%@] not in user's home directory: [%@]", v3, v6];

  v13[0] = @"FunctionName";
  id v8 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  v14[0] = v8;
  v14[1] = &unk_1F2F11AC8;
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v13[1] = @"SourceFileLine";
  v13[2] = v9;
  v14[2] = v7;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:82 userInfo:v10];

  return v11;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = __error();
  v5 = (void *)[v2 initWithFormat:@"Could not read file to back up: [%@]: %s", v3, strerror(*v4)];

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11AE0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_102(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not backup file: [%@]", v3];

  v12[0] = @"FunctionName";
  v5 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  v13[0] = v5;
  v13[1] = &unk_1F2F11AF8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v6;
  v13[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  if (*(void *)(a1 + 40))
  {
    id v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v9 = [v8 copy];

    uint64_t v7 = (void *)v9;
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:82 userInfo:v7];

  return v10;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_108(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = *(unsigned __int16 *)(a1 + 44);
  v5 = __error();
  uint64_t v6 = (void *)[v2 initWithFormat:@"Could not unlink path to back up [%@], mode = 0x%x: %s", v3, v4, strerror(*v5)];

  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F11B10;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_114(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not backup file: [%@]", v3];

  v12[0] = @"FunctionName";
  v5 = [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  v13[0] = v5;
  v13[1] = &unk_1F2F11B28;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v6;
  v13[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v9 = [v8 copy];

    uint64_t v7 = (void *)v9;
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:82 userInfo:v7];

  return v10;
}

- (NSString)description
{
  id v2 = NSString;

  return (NSString *)[v2 stringWithFormat:@"<undefined action>"];
}

- (MCMContainerSchemaActionBase)initWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerSchemaActionBase;
  uint64_t v6 = [(MCMContainerSchemaActionBase *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

+ (void)_resolveArguments:(id)a3 toPathArgument:(id *)a4 context:(id)a5
{
  id v16 = a5;
  uint64_t v7 = [a3 firstObject];
  uint64_t v8 = [v7 string];
  char v9 = [v8 hasPrefix:@"/"];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v16 containerPath];
    uint64_t v11 = [v10 containerDataURL];
    uint64_t v12 = [v11 path];
    unint64_t v13 = [v7 string];
    v14 = [v12 stringByAppendingPathComponent:v13];

    id v15 = objc_alloc((Class)objc_opt_class());
    uint64_t v7 = (void *)[v15 initWithString:v14];
  }
  if (a4) {
    *a4 = v7;
  }
}

+ (void)_resolveArguments:(id)a3 toSourcePathArgument:(id *)a4 destPathArgument:(id *)a5 destFinalPathArgument:(id *)a6 context:(id)a7
{
  id v43 = a3;
  id v11 = a7;
  uint64_t v12 = [v43 firstObject];
  if (v12) {
    [v43 removeObjectAtIndex:0];
  }
  uint64_t v13 = [v43 firstObject];
  v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = v12;
  }
  id v16 = v15;

  id v17 = v16;
  if (v12)
  {
    v18 = [v12 string];
    char v19 = [v18 hasPrefix:@"/"];

    if ((v19 & 1) == 0)
    {
      BOOL v20 = [v11 homeDirectoryURL];
      uint64_t v21 = [v20 path];
      int v22 = [v12 string];
      int v23 = [v21 stringByAppendingPathComponent:v22];

      id v24 = objc_alloc((Class)objc_opt_class());
      uint64_t v12 = (void *)[v24 initWithString:v23];
    }
  }
  if (!v17)
  {
    id v27 = 0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v25 = [v17 string];
  char v26 = [v25 hasPrefix:@"/"];

  if (v26)
  {
    id v27 = v17;
    if (!a4) {
      goto LABEL_15;
    }
LABEL_14:
    *a4 = v12;
    goto LABEL_15;
  }
  id v42 = a6;
  id v28 = [v17 string];
  v29 = [v11 containerPath];
  uint64_t v30 = [v29 containerDataURL];
  v31 = [(id)v30 path];
  id v32 = [v31 stringByAppendingPathComponent:v28];

  id v33 = objc_alloc((Class)objc_opt_class());
  id v27 = (id)[v33 initWithString:v32];

  id v34 = [v11 containerPath];
  id v35 = [v11 finalContainerPath];
  LOBYTE(v30) = [v34 isEqual:v35];

  id v17 = v27;
  if ((v30 & 1) == 0)
  {
    v36 = [v11 finalContainerPath];
    id v37 = [v36 containerDataURL];
    id v38 = [v37 path];
    [v38 stringByAppendingPathComponent:v28];
    v39 = v41 = v28;

    id v40 = objc_alloc((Class)objc_opt_class());
    id v17 = (id)[v40 initWithString:v39];

    id v28 = v41;
  }

  a6 = v42;
  if (a4) {
    goto LABEL_14;
  }
LABEL_15:
  if (a5) {
    *a5 = v27;
  }
  if (a6) {
    *a6 = v17;
  }
}

+ (id)actionIdentifier
{
  return @"<unknown action>";
}

+ (id)actionWithName:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6
{
  v32[1] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = (void *)[a4 mutableCopy];
  if (actionWithName_arguments_context_error__onceToken != -1) {
    dispatch_once(&actionWithName_arguments_context_error__onceToken, &__block_literal_global_6054);
  }
  uint64_t v13 = [v11 lowercaseString];

  v14 = (objc_class *)[(id)actionWithName_arguments_context_error__classLookup objectForKeyedSubscript:v13];
  if (v14)
  {
    id v15 = [v14 alloc];
    if (v15)
    {
      id v16 = v15;
      if ([v15 conformsToProtocol:&unk_1F2F1CAA8])
      {
        id v31 = 0;
        v32[0] = 0;
        id v30 = 0;
        [a1 _resolveArguments:v12 toSourcePathArgument:v32 destPathArgument:&v31 destFinalPathArgument:&v30 context:v10];
        id v17 = v32[0];
        id v18 = v31;
        id v19 = v30;
        BOOL v20 = (void *)[v16 initWithSourcePathArgument:v17 destinationPathArgument:v18 destFinalPathArgument:v19 context:v10];
      }
      else
      {
        if (![v16 conformsToProtocol:&unk_1F2F15FB0])
        {

          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2;
          v27[3] = &unk_1E6A80A30;
          id v28 = v13;
          uint64_t v21 = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2((uint64_t)v27);
          BOOL v20 = 0;
          id v17 = v28;
          goto LABEL_13;
        }
        id v29 = 0;
        [a1 _resolveArguments:v12 toPathArgument:&v29 context:v10];
        id v17 = v29;
        BOOL v20 = (void *)[v16 initWithPathArgument:v17 context:v10];
      }
      uint64_t v21 = 0;
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_82;
      v23[3] = &unk_1E6A80A30;
      id v24 = v13;
      uint64_t v21 = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_82((uint64_t)v23);
      BOOL v20 = 0;
      id v17 = v24;
    }
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_76;
    v25[3] = &unk_1E6A80A30;
    id v26 = v13;
    uint64_t v21 = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_76((uint64_t)v25);
    BOOL v20 = 0;
    id v17 = v26;
  }
LABEL_13:

  if (a6 && !v20) {
    *a6 = v21;
  }

  return v20;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"unknown initializer for action [%@]", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke_2"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11A80;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:81 userInfo:v4];

  return v6;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_76(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"unknown action [%@]", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11A98;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:81 userInfo:v4];

  return v6;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_82(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"action [%@] missing argument", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11AB0;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:81 userInfo:v4];

  return v6;
}

void __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke()
{
  v11[8] = *MEMORY[0x1E4F143B8];
  v0 = +[MCMContainerSchemaActionMove actionIdentifier];
  v10[0] = v0;
  v11[0] = objc_opt_class();
  v1 = +[MCMContainerSchemaActionMoveContents actionIdentifier];
  v10[1] = v1;
  v11[1] = objc_opt_class();
  id v2 = +[MCMContainerSchemaActionCopy actionIdentifier];
  v10[2] = v2;
  v11[2] = objc_opt_class();
  uint64_t v3 = +[MCMContainerSchemaActionCopyContents actionIdentifier];
  void v10[3] = v3;
  void v11[3] = objc_opt_class();
  uint64_t v4 = +[MCMContainerSchemaActionSymlink actionIdentifier];
  v10[4] = v4;
  void v11[4] = objc_opt_class();
  id v5 = +[MCMContainerSchemaActionUnlink actionIdentifier];
  v10[5] = v5;
  v11[5] = objc_opt_class();
  uint64_t v6 = +[MCMContainerSchemaActionMkdir actionIdentifier];
  v10[6] = v6;
  v11[6] = objc_opt_class();
  uint64_t v7 = +[MCMContainerSchemaActionStopBackupExclude actionIdentifier];
  v10[7] = v7;
  v11[7] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:8];
  char v9 = (void *)actionWithName_arguments_context_error__classLookup;
  actionWithName_arguments_context_error__classLookup = v8;
}

@end