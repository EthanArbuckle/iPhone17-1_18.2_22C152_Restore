@interface MCMContainerSchemaActionCopy
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionCopy)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionCopy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (BOOL)performWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [(NSURL *)self->_sourceURL path];
  v6 = [(NSURL *)self->_destURL path];
  if ([v5 isEqualToString:v6])
  {
    v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      __int16 v20 = 2114;
      v21 = 0;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to copy [%@] to itself: %{public}@", buf, 0x16u);
    }

    id v8 = 0;
    goto LABEL_6;
  }
  v9 = self->_sourceURL;
  destURL = self->_destURL;
  v16 = v9;
  id v17 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__MCMContainerSchemaActionCopy_performWithError___block_invoke;
  v15[3] = &unk_1E6A80A08;
  v15[4] = self;
  v11 = v9;
  LOBYTE(destURL) = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:destURL error:&v17 duringBlock:v15];
  id v8 = v17;

  if (destURL)
  {
LABEL_6:
    BOOL v12 = 1;
    goto LABEL_7;
  }
  v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "failed to copy [%@] to [%@]: %{public}@", buf, 0x20u);
  }

  if (a3)
  {
    id v8 = v8;
    BOOL v12 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_7:

  return v12;
}

uint64_t __49__MCMContainerSchemaActionCopy_performWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 URLByDeletingLastPathComponent];
  v7 = *(void **)(a1 + 32);
  v24[0] = 0;
  int v8 = [v7 makedirAtURL:v6 followTerminalSymlink:1 error:v24];
  id v9 = v24[0];
  if (v8)
  {
    char v23 = 0;
    v10 = +[MCMFileManager defaultManager];
    id v22 = v9;
    int v11 = [v10 itemAtURL:v5 followSymlinks:1 exists:&v23 isDirectory:0 error:&v22];
    id v12 = v22;

    if (!v11)
    {
      uint64_t v14 = 0;
      id v9 = v12;
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    if (!v23) {
      goto LABEL_6;
    }
    v13 = *(void **)(a1 + 32);
    id v21 = v12;
    uint64_t v14 = [v13 backupFileURL:v5 error:&v21];
    id v9 = v21;

    if (v14)
    {
      id v12 = v9;
LABEL_6:
      v16 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v20 = v12;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49__MCMContainerSchemaActionCopy_performWithError___block_invoke_2;
      v18[3] = &unk_1E6A809E0;
      id v19 = v5;
      uint64_t v14 = [v16 fixAndRetryIfPermissionsErrorWithURL:v15 error:&v20 duringBlock:v18];
      id v9 = v20;

      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!a3) {
    goto LABEL_14;
  }
LABEL_12:
  if ((v14 & 1) == 0) {
    *a3 = v9;
  }
LABEL_14:

  return v14;
}

uint64_t __49__MCMContainerSchemaActionCopy_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 copyItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

  return v7;
}

- (id)description
{
  v3 = [(id)objc_opt_class() actionIdentifier];
  v4 = [(NSURL *)self->_sourceURL path];
  id v5 = [(NSURL *)self->_destURL path];
  v6 = [v3 stringByAppendingFormat:@" [%@] → [%@]", v4, v5];

  return v6;
}

- (MCMContainerSchemaActionCopy)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCMContainerSchemaActionCopy;
  int v11 = [(MCMContainerSchemaActionBase *)&v17 initWithContext:a6];
  if (v11)
  {
    uint64_t v12 = [v9 fileURL];
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v12;

    uint64_t v14 = [v10 fileURL];
    destURL = v11->_destURL;
    v11->_destURL = (NSURL *)v14;

    if (!v11->_sourceURL || !v11->_destURL)
    {

      int v11 = 0;
    }
  }

  return v11;
}

+ (id)actionIdentifier
{
  v2 = @"copy";
  return @"copy";
}

@end