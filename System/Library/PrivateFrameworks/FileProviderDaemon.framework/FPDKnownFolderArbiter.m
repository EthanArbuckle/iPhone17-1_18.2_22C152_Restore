@interface FPDKnownFolderArbiter
+ (NSURL)desktopURL;
+ (NSURL)documentsURL;
- (FPDKnownFolderArbiter)initWithServer:(id)a3;
- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)claimKnownFolders:(id)a3 domain:(id)a4 localizedReason:(id)a5 request:(id)a6 completionHandler:(id)a7;
- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)releaseKnownFolders:(unint64_t)a3 domain:(id)a4 localizedReason:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8;
- (void)selectNewDomain:(id)a3 knownFolders:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
@end

@implementation FPDKnownFolderArbiter

+ (NSURL)desktopURL
{
  return 0;
}

+ (NSURL)documentsURL
{
  return 0;
}

- (FPDKnownFolderArbiter)initWithServer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FPDKnownFolderArbiter;
  v5 = [(FPDKnownFolderArbiter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_server, v4);
    uint64_t v7 = objc_opt_new();
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v6->_operationQueue setName:@"Known Folder Arbiter"];
    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
  }

  return v6;
}

- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [FPDClaimKnownFolderOperation alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v13 = [(FPDClaimKnownFolderOperation *)v11 initWithDescriptors:v10 server:WeakRetained request:v9];

  LODWORD(v10) = [v9 qos];
  [(FPDClaimKnownFolderOperation *)v13 setQualityOfService:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__FPDKnownFolderArbiter_detachKnownFolders_request_completionHandler___block_invoke;
  v15[3] = &unk_1E6A76968;
  id v16 = v8;
  id v14 = v8;
  [(FPOperation *)v13 setFinishedBlock:v15];
  [(NSOperationQueue *)self->_operationQueue addOperation:v13];
}

uint64_t __70__FPDKnownFolderArbiter_detachKnownFolders_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [FPDAttachKnownFolderOperation alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v15 = [(FPDAttachKnownFolderOperation *)v13 initWithKnownFolderURLs:v12 onlyForDomain:0 server:WeakRetained options:a4 request:v11];

  LODWORD(a4) = [v11 qos];
  [(FPDAttachKnownFolderOperation *)v15 setQualityOfService:a4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__FPDKnownFolderArbiter_attachKnownFolders_options_request_completionHandler___block_invoke;
  v17[3] = &unk_1E6A76968;
  id v18 = v10;
  id v16 = v10;
  [(FPOperation *)v15 setFinishedBlock:v17];
  [(NSOperationQueue *)self->_operationQueue addOperation:v15];
}

uint64_t __78__FPDKnownFolderArbiter_attachKnownFolders_options_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)claimKnownFolders:(id)a3 domain:(id)a4 localizedReason:(id)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = fp_current_or_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v32 = [v13 providerDomainID];
    v33 = objc_msgSend(v32, "fp_obfuscatedProviderDomainID");
    *(_DWORD *)buf = 138412802;
    id v40 = v12;
    __int16 v41 = 2114;
    v42 = v33;
    __int16 v43 = 2114;
    id v44 = v15;
    _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] 🖥️  claiming known folders %@ from %{public}@ for %{public}@", buf, 0x20u);
  }
  uint64_t v18 = [v12 desktopLocation];
  if (v18
    && (v19 = (void *)v18,
        [v12 documentsLocation],
        v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    v21 = [v13 volume];
    int v22 = [v21 role];

    if (v22 == 1)
    {
      v23 = [FPDClaimKnownFolderOperation alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      v25 = [(FPDClaimKnownFolderOperation *)v23 initWithKnownFolderLocations:v12 domain:v13 server:WeakRetained localizedReason:v14 request:v15];

      -[FPDClaimKnownFolderOperation setQualityOfService:](v25, "setQualityOfService:", [v15 qos]);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __92__FPDKnownFolderArbiter_claimKnownFolders_domain_localizedReason_request_completionHandler___block_invoke;
      v35[3] = &unk_1E6A76968;
      id v36 = v16;
      [(FPOperation *)v25 setFinishedBlock:v35];
      [(NSOperationQueue *)self->_operationQueue addOperation:v25];
    }
    else
    {
      v26 = [v13 provider];
      v25 = [v26 providerDomainForDomain:v13];

      if ([(FPDClaimKnownFolderOperation *)v25 isiCloudDriveProvider])
      {
        v27 = FPLoc();
      }
      else
      {
        v34 = [(FPDClaimKnownFolderOperation *)v25 domainFullDisplayName];
        v27 = FPLoc();
      }
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28798];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38 = v27;
      v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v34);
      v31 = [v28 errorWithDomain:v29 code:18 userInfo:v30];
      (*((void (**)(id, void *))v16 + 2))(v16, v31);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"Desktop and Documents must be claimed");
    v25 = (FPDClaimKnownFolderOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, FPDClaimKnownFolderOperation *))v16 + 2))(v16, v25);
  }
}

uint64_t __92__FPDKnownFolderArbiter_claimKnownFolders_domain_localizedReason_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)releaseKnownFolders:(unint64_t)a3 domain:(id)a4 localizedReason:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a7;
  id v15 = (void (**)(id, void *))a8;
  id v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = [v13 providerDomainID];
    v21 = objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
    *(_DWORD *)buf = 67109634;
    int v25 = a3;
    __int16 v26 = 2114;
    v27 = v21;
    __int16 v28 = 2114;
    id v29 = v14;
    _os_log_debug_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] 🖥️  releasing known folders %x from %{public}@ for %{public}@", buf, 0x1Cu);
  }
  if ((~(_BYTE)a3 & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"Desktop and Documents must be released together");
    v19 = (FPDAttachKnownFolderOperation *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v19);
  }
  else
  {
    v17 = [FPDAttachKnownFolderOperation alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    v19 = [(FPDAttachKnownFolderOperation *)v17 initWithKnownFolders:a3 onlyForDomain:v13 server:WeakRetained options:a6 request:v14];

    -[FPDAttachKnownFolderOperation setQualityOfService:](v19, "setQualityOfService:", [v14 qos]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __102__FPDKnownFolderArbiter_releaseKnownFolders_domain_localizedReason_options_request_completionHandler___block_invoke;
    v22[3] = &unk_1E6A76968;
    v23 = v15;
    [(FPOperation *)v19 setFinishedBlock:v22];
    [(NSOperationQueue *)self->_operationQueue addOperation:v19];
  }
}

uint64_t __102__FPDKnownFolderArbiter_releaseKnownFolders_domain_localizedReason_options_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)selectNewDomain:(id)a3 knownFolders:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v20 = [v10 identifier];
    v21 = objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v21;
    __int16 v31 = 1024;
    int v32 = a4;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] 🖥️  select %{public}@ to back known folders %x for %@", buf, 0x1Cu);
  }
  if ((~(_BYTE)a4 & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"Desktop and Documents must be selected together");
    id v16 = (FPDClaimKnownFolderOperation *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v16);
  }
  else
  {
    if (v10)
    {
      id v14 = [FPDClaimKnownFolderOperation alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      id v16 = [(FPDClaimKnownFolderOperation *)v14 initWithKnownFolders:a4 domain:v10 server:WeakRetained request:v11];

      -[FPDClaimKnownFolderOperation setQualityOfService:](v16, "setQualityOfService:", [v11 qos]);
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke_2;
      int v25 = &unk_1E6A76968;
      __int16 v26 = v12;
      [(FPOperation *)v16 setFinishedBlock:&v22];
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v22, v23, v24, v25);
      v17 = v26;
    }
    else
    {
      uint64_t v18 = [FPDAttachKnownFolderOperation alloc];
      id v19 = objc_loadWeakRetained((id *)&self->_server);
      id v16 = [(FPDAttachKnownFolderOperation *)v18 initWithKnownFolders:a4 onlyForDomain:0 server:v19 options:3 request:v11];

      -[FPDClaimKnownFolderOperation setQualityOfService:](v16, "setQualityOfService:", [v11 qos]);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke;
      v27[3] = &unk_1E6A76968;
      __int16 v28 = v12;
      [(FPOperation *)v16 setFinishedBlock:v27];
      [(NSOperationQueue *)self->_operationQueue addOperation:v16];
      v17 = v28;
    }
  }
}

uint64_t __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_server);
}

@end