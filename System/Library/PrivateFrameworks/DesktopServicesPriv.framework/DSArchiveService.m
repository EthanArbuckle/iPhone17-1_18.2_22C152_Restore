@interface DSArchiveService
- (DSArchiveServiceUnarchivingDelegate)unarchivingDelegate;
- (id)archiveItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8;
- (id)archiveItemsWithURLs:(id)a3 compressionFormat:(unint64_t)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6;
- (id)archiveItemsWithURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURL:(id)a7 completionHandler:(id)a8;
- (id)unarchiveItemAtURL:(id)a3 passphrase:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6;
- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURL:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8;
- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 acceptedFormats:(unint64_t)a6 completionHandler:(id)a7;
- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6;
- (id)unarchiveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 acceptedFormats:(unint64_t)a6 passphrases:(id)a7 completionHandler:(id)a8;
- (void)itemDescriptorsForItemAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5;
- (void)itemDescriptorsForItemAtURL:(id)a3 passphrases:(id)a4 completionHandler:(id)a5;
- (void)receiveArchivedItemsDescriptors:(id)a3 placeholderName:(id)a4 placeholderTypeIdentifier:(id)a5;
- (void)setUnarchivingDelegate:(id)a3;
@end

@implementation DSArchiveService

- (void)itemDescriptorsForItemAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v12[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v11 = 0;
  }
  [(DSArchiveService *)self itemDescriptorsForItemAtURL:v8 passphrases:v11 completionHandler:v10];
  if (v9) {
}
  }

- (void)itemDescriptorsForItemAtURL:(id)a3 passphrases:(id)a4 completionHandler:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = archiveServiceConnection(0);
  [v10 resume];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__DSArchiveService_itemDescriptorsForItemAtURL_passphrases_completionHandler___block_invoke;
  v20[3] = &unk_1E698FC20;
  id v11 = v9;
  id v22 = v11;
  id v12 = v10;
  id v21 = v12;
  v13 = [v12 remoteObjectProxyWithErrorHandler:v20];
  if (v7)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v7 readonly:1];
    if (v14)
    {
      [v13 itemDescriptorsForItemWithURLWrapper:v14 passphrases:v8 completionHandler:v11];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F289D0];
      v24[0] = v7;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      v18 = [v16 errorWithDomain:*MEMORY[0x1E4F281F8] code:257 userInfo:v17];

      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v18);
      [v12 invalidate];
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v15 = LogObj(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D343E000, v15, OS_LOG_TYPE_ERROR, "itemDescriptorsForItemAtURL: url is nil", v19, 2u);
    }

    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
    [v12 invalidate];
  }
}

void __78__DSArchiveService_itemDescriptorsForItemAtURL_passphrases_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

- (id)archiveItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v52 = a7;
  v13 = (void (**)(id, void, id))a8;
  v53 = v11;
  uint64_t v14 = [v11 count];
  if (v12 && v14)
  {
    char v66 = 0;
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = [v12 path];
    char v17 = [v15 fileExistsAtPath:v16 isDirectory:&v66];
    if (v66) {
      char v18 = v17;
    }
    else {
      char v18 = 0;
    }

    if (v18)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v53, "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v20 = v53;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v63;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v63 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v62 + 1) + 8 * i);
            v25 = objc_opt_class();
            id v61 = 0;
            v26 = [v25 wrapperWithURL:v24 readonly:1 error:&v61];
            id v27 = v61;
            if (!v26)
            {
              v42 = LogObj(0);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v72 = v27;
                _os_log_impl(&dword_1D343E000, v42, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: Couldn't get url wrapper: %@", buf, 0xCu);
              }

              v35 = 0;
              v13[2](v13, 0, v27);
              goto LABEL_32;
            }
            [v19 addObject:v26];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      id v20 = (id)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v12 readonly:0];
      if (v20)
      {
        v47 = archiveServiceConnection(0);
        [v47 resume];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke;
        v58[3] = &unk_1E698FC20;
        v28 = v13;
        id v60 = v28;
        id v29 = v47;
        id v59 = v29;
        v49 = [v29 remoteObjectProxyWithErrorHandler:v58];
        v48 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.ArchiveService" name:@"BackgroundArchive"];
        id v30 = objc_alloc(MEMORY[0x1E4F96318]);
        v31 = [MEMORY[0x1E4F96478] currentProcess];
        v67 = v48;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
        v33 = (void *)[v30 initWithExplanation:@"ArchiveServices archive operation" target:v31 attributes:v32];

        [v33 acquireWithInvalidationHandler:&__block_literal_global];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke_60;
        v54[3] = &unk_1E698FC68;
        v57 = v28;
        id v34 = v33;
        id v55 = v34;
        id v27 = v29;
        id v56 = v27;
        v35 = [v49 archiveItemsWithURLWrappers:v19 toURLWrapper:v20 options:a5 compressionFormat:a6 passphrase:v52 completionHandler:v54];
      }
      else
      {
        v44 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v68 = *MEMORY[0x1E4F289D0];
        id v69 = v12;
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        id v27 = [v44 errorWithDomain:*MEMORY[0x1E4F281F8] code:257 userInfo:v45];

        v46 = LogObj(0);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v72 = v27;
          _os_log_impl(&dword_1D343E000, v46, OS_LOG_TYPE_ERROR, "archiveItemsAtURLs: Couldn't get url wrapper for destination: %@", buf, 0xCu);
        }

        v35 = 0;
        v13[2](v13, 0, v27);
      }
LABEL_32:
    }
    else
    {
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F289D0];
      v74[0] = v12;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
      v19 = [v39 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v40];

      v41 = LogObj(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v19;
        _os_log_impl(&dword_1D343E000, v41, OS_LOG_TYPE_ERROR, "archiveItemsAtURLs: destination doesn't exist or isn't a directory: %@", buf, 0xCu);
      }

      v35 = 0;
      v13[2](v13, 0, v19);
    }
  }
  else
  {
    v36 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    if (![v11 count])
    {
      v37 = LogObj(0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v37, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: no urls", buf, 2u);
      }
    }
    if (!v12)
    {
      v38 = LogObj(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v38, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: destination is nil", buf, 2u);
      }
    }
    v13[2](v13, 0, v36);

    v35 = 0;
  }

  return v35;
}

void __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_ERROR, "Archive Service archive assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
}

- (id)unarchiveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 acceptedFormats:(unint64_t)a6 passphrases:(id)a7 completionHandler:(id)a8
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v55 = a7;
  v16 = (void (**)(id, void, uint64_t))a8;
  char v17 = [(DSArchiveService *)self unarchivingDelegate];

  if (v17) {
    unint64_t v18 = a5 | 0x100000;
  }
  else {
    unint64_t v18 = a5;
  }
  if (v14 && v15)
  {
    char v66 = 0;
    v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v20 = [v15 path];
    char v21 = [v19 fileExistsAtPath:v20 isDirectory:&v66];
    if (v66) {
      char v22 = v21;
    }
    else {
      char v22 = 0;
    }

    if ((v22 & 1) == 0)
    {
      id v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = *MEMORY[0x1E4F289D0];
      v73[0] = v15;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
      uint64_t v32 = [v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v31];

      v33 = LogObj(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v71 = v32;
        _os_log_impl(&dword_1D343E000, v33, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination doesn't exist or isn't a directory: %@", buf, 0xCu);
      }

      id v29 = 0;
      id v34 = (void *)v32;
      v16[2](v16, 0, v32);
      goto LABEL_34;
    }
    id v65 = 0;
    uint64_t v23 = [(id)objc_opt_class() wrapperWithURL:v14 readonly:0 error:&v65];
    id v24 = v65;
    v25 = v24;
    v54 = (void *)v23;
    if (v23)
    {
      id v52 = v24;
    }
    else
    {
      id v64 = v24;
      v54 = [(id)objc_opt_class() wrapperWithURL:v14 readonly:1 error:&v64];
      id v52 = v64;

      if (!v54)
      {
        v48 = LogObj(0);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v71 = (uint64_t)v52;
          _os_log_impl(&dword_1D343E000, v48, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for item: %@", buf, 0xCu);
        }

        id v29 = 0;
        id v34 = v52;
        v16[2](v16, 0, (uint64_t)v52);
        goto LABEL_34;
      }
    }
    v53 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v15 readonly:0];
    if (v53)
    {
      if (v17) {
        v35 = self;
      }
      else {
        v35 = 0;
      }
      v49 = archiveServiceConnection(v35);
      [v49 resume];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke;
      v61[3] = &unk_1E698FC20;
      v36 = v16;
      id v63 = v36;
      id v37 = v49;
      id v62 = v37;
      v50 = [v37 remoteObjectProxyWithErrorHandler:v61];
      v51 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.ArchiveService" name:@"BackgroundArchive"];
      id v38 = objc_alloc(MEMORY[0x1E4F96318]);
      v39 = [MEMORY[0x1E4F96478] currentProcess];
      v67 = v51;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      v41 = (void *)[v38 initWithExplanation:@"ArchiveServices unarchive operation" target:v39 attributes:v40];

      [v41 acquireWithInvalidationHandler:&__block_literal_global_66];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke_67;
      v56[3] = &unk_1E698FC90;
      id v57 = v14;
      id v60 = v36;
      id v42 = v41;
      id v58 = v42;
      id v43 = v37;
      id v59 = v43;
      id v29 = [v50 unarchiveItemWithURLWrapper:v54 toURLWrapper:v53 options:v18 passphrases:v55 acceptedFormats:a6 completionHandler:v56];
    }
    else
    {
      v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v68 = *MEMORY[0x1E4F289D0];
      id v69 = v15;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      id v43 = [v44 errorWithDomain:*MEMORY[0x1E4F281F8] code:257 userInfo:v45];

      v46 = LogObj(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v71 = (uint64_t)v43;
        _os_log_impl(&dword_1D343E000, v46, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for destination: %@", buf, 0xCu);
      }

      id v29 = 0;
      v16[2](v16, 0, (uint64_t)v43);
    }

    id v34 = v52;
LABEL_34:

    goto LABEL_35;
  }
  v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  if (!v14)
  {
    id v27 = LogObj(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D343E000, v27, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: url is nil", buf, 2u);
    }
  }
  if (!v15)
  {
    v28 = LogObj(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D343E000, v28, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination is nil", buf, 2u);
    }
  }
  v16[2](v16, 0, (uint64_t)v26);

  id v29 = 0;
LABEL_35:

  return v29;
}

void __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_ERROR, "Archive Service unarchive assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 domain];
  if ([v7 isEqualToString:@"com.apple.desktopservices.ArchiveService"])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -1000)
    {
      id v9 = (void *)MEMORY[0x1E4F1CA60];
      id v10 = [v6 userInfo];
      id v11 = [v9 dictionaryWithDictionary:v10];

      TCFURLInfo::LocalizedStringWithFileName(@"ArchiveEnterPassword", *(__CFString **)(a1 + 32), &v15);
      [v11 setObject:v15.fString.fRef forKeyedSubscript:*MEMORY[0x1E4F285A0]];
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);
      id v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = [v6 domain];
      uint64_t v14 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);

      id v6 = (id)v14;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) invalidate];
  [*(id *)(a1 + 48) invalidate];
}

- (id)archiveItemsWithURLs:(id)a3 compressionFormat:(unint64_t)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  id v6 = [(DSArchiveService *)self archiveItemsWithURLs:a3 passphrase:0 addToKeychain:0 compressionFormat:a4 destinationFolderURL:a5 completionHandler:a6];
  return v6;
}

- (id)archiveItemsWithURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURL:(id)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v34 = a4;
  id v36 = a7;
  id v33 = a8;
  uint64_t v32 = archiveServiceConnection(0);
  [v32 resume];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke;
  v46[3] = &unk_1E698FC20;
  id v13 = v33;
  id v48 = v13;
  id v14 = v32;
  id v47 = v14;
  v35 = [v14 remoteObjectProxyWithErrorHandler:v46];
  uint64_t v15 = [v37 count];
  if (v36 && v15)
  {
    BOOL v30 = v11;
    unint64_t v31 = a6;
    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v17 = v37;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          char v22 = objc_opt_class();
          id v41 = 0;
          uint64_t v23 = [v22 wrapperWithURL:v21 readonly:1 error:&v41];
          id v24 = v41;
          if (!v23)
          {
            v28 = LogObj(0);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v24;
              _os_log_impl(&dword_1D343E000, v28, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: Couldn't get url wrapper: %@", buf, 0xCu);
            }

            (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v24);
            [v14 invalidate];
            v25 = 0;
            goto LABEL_24;
          }
          [v16 addObject:v23];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v17 = (id)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v36 readonly:0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke_72;
    v38[3] = &unk_1E698FCB8;
    id v40 = v13;
    id v39 = v14;
    v25 = [v35 archiveItemsWithURLWrappers:v16 passphrase:v34 addToKeychain:v30 compressionFormat:v31 destinationFolderURLWrapper:v17 usePlaceholder:0 completionHandler:v38];

    id v24 = v40;
LABEL_24:
  }
  else
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    if (![v37 count])
    {
      v26 = LogObj(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v26, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: no urls", buf, 2u);
      }
    }
    if (!v36)
    {
      id v27 = LogObj(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v27, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: destination is nil", buf, 2u);
      }
    }
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v16);
    [v14 invalidate];
    v25 = 0;
  }

  return v25;
}

void __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke_72(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v11 url];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v7, v8);

  [*(id *)(a1 + 32) invalidate];
}

- (id)unarchiveItemAtURL:(id)a3 passphrase:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    v17[0] = v11;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = [(DSArchiveService *)self unarchiveItemAtURL:v10 passphrases:v14 addToKeychain:0 destinationFolderURL:v12 acceptedFormats:1 completionHandler:v13];
  if (v11) {

  }
  return v15;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  id v6 = [(DSArchiveService *)self unarchiveItemAtURL:a3 passphrases:a4 addToKeychain:0 destinationFolderURL:a5 acceptedFormats:1 completionHandler:a6];
  return v6;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 acceptedFormats:(unint64_t)a6 completionHandler:(id)a7
{
  id v7 = [(DSArchiveService *)self unarchiveItemAtURL:a3 passphrases:a4 addToKeychain:0 destinationFolderURL:a5 acceptedFormats:a6 completionHandler:a7];
  return v7;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURL:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v38 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = [(DSArchiveService *)self unarchivingDelegate];

  if (v17) {
    uint64_t v18 = self;
  }
  else {
    uint64_t v18 = 0;
  }
  id v36 = archiveServiceConnection(v18);
  [v36 resume];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke;
  v46[3] = &unk_1E698FC20;
  id v19 = v16;
  id v48 = v19;
  id v20 = v36;
  id v47 = v20;
  id v39 = [v20 remoteObjectProxyWithErrorHandler:v46];
  if (!v14 || !v15)
  {
    id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    if (!v14)
    {
      v25 = LogObj(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v25, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: url is nil", buf, 2u);
      }
    }
    if (!v15)
    {
      v26 = LogObj(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v26, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination is nil", buf, 2u);
      }
    }
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v24);
    [v20 invalidate];
    goto LABEL_17;
  }
  id v45 = 0;
  uint64_t v21 = [(id)objc_opt_class() wrapperWithURL:v14 readonly:0 error:&v45];
  id v22 = v45;
  uint64_t v23 = v22;
  if (!v21)
  {
    id v44 = v22;
    uint64_t v21 = [(id)objc_opt_class() wrapperWithURL:v14 readonly:1 error:&v44];
    id v37 = v44;

    if (v21) {
      goto LABEL_19;
    }
    id v34 = LogObj(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v37;
      _os_log_impl(&dword_1D343E000, v34, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for item: %@", buf, 0xCu);
    }

    id v24 = v37;
    (*((void (**)(id, void, id))v19 + 2))(v19, 0, v37);
    [v20 invalidate];
LABEL_17:
    id v27 = 0;
    goto LABEL_25;
  }
  id v37 = v22;
LABEL_19:
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v15 readonly:0];
  if (v28)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke_74;
    v40[3] = &unk_1E698FCE0;
    id v41 = v14;
    id v43 = v19;
    id v42 = v20;
    LOBYTE(v35) = 0;
    id v27 = [v39 unarchiveItemWithURLWrapper:v21 passphrases:v38 addToKeychain:v11 destinationFolderURLWrapper:v28 acceptedFormats:a7 exportsStreamingReceiver:v17 != 0 usePlaceholder:v35 completionHandler:v40];

    id v29 = v41;
  }
  else
  {
    BOOL v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F289D0];
    id v50 = v15;
    unint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v29 = [v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:257 userInfo:v31];

    uint64_t v32 = LogObj(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v29;
      _os_log_impl(&dword_1D343E000, v32, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for destination: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v29);
    [v20 invalidate];
    id v27 = 0;
  }

  id v24 = v37;
LABEL_25:

  return v27;
}

void __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if ([v7 isEqualToString:@"com.apple.desktopservices.ArchiveService"])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -1000)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
      id v10 = [v6 userInfo];
      BOOL v11 = [v9 dictionaryWithDictionary:v10];

      TCFURLInfo::LocalizedStringWithFileName(@"ArchiveEnterPassword", *(__CFString **)(a1 + 32), &v16);
      [v11 setObject:v16.fString.fRef forKeyedSubscript:*MEMORY[0x1E4F285A0]];
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
      id v12 = (void *)MEMORY[0x1E4F28C58];
      id v13 = [v6 domain];
      uint64_t v14 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);

      id v6 = (id)v14;
    }
  }
  else
  {
  }
  id v15 = [v5 url];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

- (void)receiveArchivedItemsDescriptors:(id)a3 placeholderName:(id)a4 placeholderTypeIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DSArchiveService *)self unarchivingDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v10 service:self didReceiveArchivedItemsDescriptors:v11 placeholderName:v8 placeholderTypeIdentifier:v9];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v10 service:self didReceiveArchivedItemsDescriptors:v11];
  }
}

- (DSArchiveServiceUnarchivingDelegate)unarchivingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unarchivingDelegate);
  return (DSArchiveServiceUnarchivingDelegate *)WeakRetained;
}

- (void)setUnarchivingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end