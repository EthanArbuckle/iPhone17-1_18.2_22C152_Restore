@interface MCMContainerSchemaActionCopyContents
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionCopyContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionCopyContents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (BOOL)performWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(NSURL *)self->_sourceURL path];
  v6 = [(NSURL *)self->_destURL path];
  if ([v5 isEqualToString:v6])
  {
    v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to copy [%@] to itself: %@", buf, 0x16u);
    }

    id v8 = 0;
    BOOL v9 = 1;
  }
  else
  {
    v10 = self->_sourceURL;
    destURL = self->_destURL;
    v15 = v10;
    id v16 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke;
    v14[3] = &unk_1E6A80A08;
    v14[4] = self;
    v12 = v10;
    BOOL v9 = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:destURL error:&v16 duringBlock:v14];
    id v8 = v16;

    if (a3 && !v9)
    {
      id v8 = v8;
      BOOL v9 = 0;
      *a3 = v8;
    }
  }

  return v9;
}

uint64_t __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__13157;
  v54 = __Block_byref_object_dispose__13158;
  id v55 = 0;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v48[4] = &v50;
  id v49 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_1;
  v48[3] = &unk_1E6A809B8;
  char v6 = [v4 fixAndRetryIfPermissionsErrorWithURL:v5 error:&v49 duringBlock:v48];
  id v7 = v49;
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = *(void **)(a1 + 32);
    id v47 = v8;
    int v10 = [v9 makedirAtURL:v40 followTerminalSymlink:1 error:&v47];
    id v11 = v47;

    if (v10)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v12 = (id)v51[5];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v62 count:16];
      if (v13)
      {
        uint64_t v39 = *(void *)v64;
        *(void *)&long long v14 = 138412802;
        long long v36 = v14;
        id obj = v12;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v64 != v39) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            v17 = *(void **)(a1 + 40);
            v18 = objc_msgSend(v16, "lastPathComponent", v36);
            __int16 v19 = [v17 URLByAppendingPathComponent:v18 isDirectory:0];

            uint64_t v20 = [v16 lastPathComponent];
            uint64_t v21 = [v40 URLByAppendingPathComponent:v20 isDirectory:0];

            char v46 = 0;
            v22 = +[MCMFileManager defaultManager];
            id v45 = v11;
            LOBYTE(v17) = [v22 itemAtURL:v21 followSymlinks:1 exists:&v46 isDirectory:0 error:&v45];
            id v23 = v45;

            if ((v17 & 1) == 0)
            {
              id v11 = v23;
LABEL_27:

              v32 = obj;
              goto LABEL_28;
            }
            if (v46)
            {
              v24 = *(void **)(a1 + 32);
              id v44 = v23;
              int v25 = [v24 backupFileURL:v21 error:&v44];
              id v11 = v44;

              if (!v25) {
                goto LABEL_27;
              }
            }
            else
            {
              id v11 = v23;
            }
            v26 = *(void **)(a1 + 32);
            id v43 = 0;
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_2;
            v41[3] = &unk_1E6A809E0;
            id v27 = v21;
            id v42 = v27;
            LOBYTE(v26) = [v26 fixAndRetryIfPermissionsErrorWithURL:v19 error:&v43 duringBlock:v41];
            id v28 = v43;
            if ((v26 & 1) == 0)
            {
              v29 = container_log_handle_for_category();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v30 = [v19 path];
                v31 = [v27 path];
                *(_DWORD *)buf = v36;
                v57 = v30;
                __int16 v58 = 2112;
                v59 = v31;
                __int16 v60 = 2112;
                id v61 = v28;
                _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "failed to copy [%@] to [%@]: %@", buf, 0x20u);
              }
            }
          }
          id v12 = obj;
          uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v62 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      goto LABEL_23;
    }
  }
  else
  {
    v32 = [v7 domain];
    if ([v32 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      BOOL v33 = [v8 code] == 2;

      if (v33)
      {

        id v11 = 0;
LABEL_23:
        uint64_t v34 = 1;
        goto LABEL_32;
      }
      id v11 = v8;
    }
    else
    {
      id v11 = v8;
LABEL_28:
    }
  }
  if (a3)
  {
    id v11 = v11;
    uint64_t v34 = 0;
    *a3 = v11;
  }
  else
  {
    uint64_t v34 = 0;
  }
LABEL_32:

  _Block_object_dispose(&v50, 8);
  return v34;
}

BOOL __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  char v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 urlsForItemsInDirectoryAtURL:v5 error:a3];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

uint64_t __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  char v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 copyItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

  return v7;
}

- (id)description
{
  v3 = [(id)objc_opt_class() actionIdentifier];
  v4 = [(NSURL *)self->_sourceURL path];
  id v5 = [(NSURL *)self->_destURL path];
  char v6 = [v3 stringByAppendingFormat:@" [%@] → [%@]", v4, v5];

  return v6;
}

- (MCMContainerSchemaActionCopyContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCMContainerSchemaActionCopyContents;
  id v11 = [(MCMContainerSchemaActionBase *)&v17 initWithContext:a6];
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

      id v11 = 0;
    }
  }

  return v11;
}

+ (id)actionIdentifier
{
  v2 = @"copy-contents";
  return @"copy-contents";
}

@end