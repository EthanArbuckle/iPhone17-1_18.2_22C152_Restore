@interface MCMContainerSchemaActionMove
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionMove)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionMove

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (BOOL)performWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = [(NSURL *)self->_sourceURL path];
  v6 = [(NSURL *)self->_destURL path];
  if ([v5 isEqualToString:v6])
  {
    v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to move [%@] to itself", buf, 0xCu);
    }

    id v8 = 0;
    goto LABEL_6;
  }
  v9 = self->_sourceURL;
  destURL = self->_destURL;
  id v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke;
  v17[3] = &unk_1E6A800B8;
  v17[4] = self;
  v18 = v9;
  id v11 = v6;
  id v19 = v11;
  id v12 = v5;
  id v20 = v12;
  v13 = v9;
  LOBYTE(destURL) = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:destURL error:&v21 duringBlock:v17];
  id v8 = v21;

  if (destURL)
  {
LABEL_6:
    BOOL v14 = 1;
    goto LABEL_7;
  }
  v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "failed to move [%@] to [%@]: %@", buf, 0x20u);
  }

  if (a3)
  {
    id v8 = v8;
    BOOL v14 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_7:

  return v14;
}

uint64_t __49__MCMContainerSchemaActionMove_performWithError___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8254;
  v41 = __Block_byref_object_dispose__8255;
  id v42 = 0;
  v6 = [v5 URLByDeletingLastPathComponent];
  v7 = (void *)a1[4];
  id v36 = 0;
  char v8 = [v7 makedirAtURL:v6 followTerminalSymlink:1 error:&v36];
  id v9 = v36;
  if ((v8 & 1) == 0) {
    goto LABEL_19;
  }
  v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke_1;
  v34[3] = &unk_1E6A809B8;
  v34[4] = &v37;
  id v35 = v9;
  [v10 fixAndRetryIfPermissionsErrorWithURL:v11 error:&v35 duringBlock:v34];
  id v12 = v35;

  v13 = (void *)v38[5];
  if (!v13)
  {
    v17 = [v12 domain];
    if ([v17 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      BOOL v18 = [v12 code] == 2;

      if (v18)
      {

        id v19 = container_log_handle_for_category();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = a1[6];
          uint64_t v20 = a1[7];
          *(_DWORD *)buf = 138412546;
          uint64_t v44 = v20;
          __int16 v45 = 2112;
          uint64_t v46 = v21;
          _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_INFO, "not moving: [%@] because it does not exist; leaving destination [%@]",
            buf,
            0x16u);
        }

        id v12 = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    goto LABEL_14;
  }
  if (![v13 isEqualToString:a1[6]])
  {
LABEL_14:
    id v23 = +[MCMFileManager defaultManager];
    int v24 = [v23 itemExistsAtURL:v5];

    if (!v24) {
      goto LABEL_17;
    }
    id v25 = (void *)a1[4];
    id v33 = v12;
    char v26 = [v25 backupFileURL:v5 error:&v33];
    id v9 = v33;

    if (v26)
    {
      id v12 = v9;
LABEL_17:
      uint64_t v28 = (void *)a1[4];
      uint64_t v27 = a1[5];
      id v32 = v12;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke_3;
      v30[3] = &unk_1E6A809E0;
      id v31 = v5;
      uint64_t v22 = [v28 fixAndRetryIfPermissionsErrorWithURL:v27 error:&v32 duringBlock:v30];
      id v9 = v32;

      if (!a3) {
        goto LABEL_22;
      }
LABEL_20:
      if ((v22 & 1) == 0)
      {
        id v12 = v9;
        uint64_t v22 = 0;
        *a3 = v12;
        goto LABEL_23;
      }
LABEL_22:
      id v12 = v9;
      goto LABEL_23;
    }
LABEL_19:
    uint64_t v22 = 0;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  BOOL v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = a1[6];
    uint64_t v15 = a1[7];
    *(_DWORD *)buf = 138412546;
    uint64_t v44 = v15;
    __int16 v45 = 2112;
    uint64_t v46 = v16;
    _os_log_impl(&dword_1D7739000, v14, OS_LOG_TYPE_INFO, "not moving: [%@] because it is a symlink to [%@]", buf, 0x16u);
  }

LABEL_12:
  uint64_t v22 = 1;
LABEL_23:
  _Block_object_dispose(&v37, 8);

  return v22;
}

BOOL __49__MCMContainerSchemaActionMove_performWithError___block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 targetOfSymbolicLinkAtURL:v5 error:a3];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

uint64_t __49__MCMContainerSchemaActionMove_performWithError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 moveItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

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

- (MCMContainerSchemaActionMove)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCMContainerSchemaActionMove;
  uint64_t v11 = [(MCMContainerSchemaActionBase *)&v17 initWithContext:a6];
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

      uint64_t v11 = 0;
    }
  }

  return v11;
}

+ (id)actionIdentifier
{
  v2 = @"move";
  return @"move";
}

@end