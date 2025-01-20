@interface FPDVersionsFileCoordinationProviderDelegate
- (FPDVersionsFileCoordinationProviderDelegate)initWithExtensionManager:(id)a3;
- (id)_fileReactorID;
- (id)_physicalURLForURL:(id)a3;
- (id)_providedItemsOperationQueue;
- (id)_siblingDelegateForURL:(id)a3;
- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
@end

@implementation FPDVersionsFileCoordinationProviderDelegate

- (FPDVersionsFileCoordinationProviderDelegate)initWithExtensionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDVersionsFileCoordinationProviderDelegate;
  v6 = [(FPDVersionsFileCoordinationProviderDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_extensionManager, a3);
  }

  return v7;
}

- (id)_fileReactorID
{
  return @"com.apple.fileproviderd.versions";
}

- (id)_providedItemsOperationQueue
{
  if (_providedItemsOperationQueue_onceToken != -1) {
    dispatch_once(&_providedItemsOperationQueue_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_providedItemsOperationQueue_operationQueue;
  return v2;
}

uint64_t __75__FPDVersionsFileCoordinationProviderDelegate__providedItemsOperationQueue__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_providedItemsOperationQueue_operationQueue;
  _providedItemsOperationQueue_operationQueue = v0;

  [(id)_providedItemsOperationQueue_operationQueue setMaxConcurrentOperationCount:1];
  v2 = (void *)_providedItemsOperationQueue_operationQueue;
  return [v2 setName:@"com.apple.FileProvider.Versions"];
}

- (id)_physicalURLForURL:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDVersionsFileCoordinationProviderDelegate _physicalURLForURL:]();
  }

  id v39 = 0;
  id v40 = 0;
  id v38 = 0;
  id v6 = (id)[MEMORY[0x1E4F25D08] parseInfoFromVersionURL:v4 domainIdentifier:&v40 fpItemIdentifier:&v39 etag:&v38];
  id v7 = v40;
  id v8 = v39;
  id v9 = v38;
  v10 = v9;
  if (v7 && v8)
  {
    id v32 = v9;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v11 = self;
    v12 = [(FPDExtensionManager *)self->_extensionManager providerDomainsByID];
    v13 = [v12 allKeys];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "fp_toDomainIdentifier");
        if ([v19 isEqualToString:v7]) {
          break;
        }

        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      v21 = [(FPDExtensionManager *)v11->_extensionManager domainWithID:v18 reason:0];

      if (!v21) {
        goto LABEL_19;
      }
      v22 = [v21 versionsCache];
      v10 = v32;
      v23 = [v22 objectForKey:v32];

      if (v23)
      {
        v24 = [MEMORY[0x1E4F63BE8] manager];
        v25 = [v23 originalURL];
        id v33 = 0;
        v26 = [v24 permanentStorageForItemAtURL:v25 allocateIfNone:1 error:&v33];
        id v31 = v33;

        if (v26)
        {
          id v27 = [v23 physicalURL];
        }
        else
        {
          v29 = fp_current_or_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[FPDVersionsFileCoordinationProviderDelegate _physicalURLForURL:]();
          }

          id v27 = v4;
        }
        id v20 = v27;
      }
      else
      {
        v28 = fp_current_or_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[FPDVersionsFileCoordinationProviderDelegate _physicalURLForURL:]();
        }

        id v20 = v4;
      }
    }
    else
    {
LABEL_13:

LABEL_19:
      id v20 = v4;
      v10 = v32;
    }
  }
  else
  {
    id v20 = v4;
  }

  return v20;
}

- (id)_siblingDelegateForURL:(id)a3
{
  return 0;
}

- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v7 = a4;
  id v39 = a5;
  id v8 = [v7 readerID];
  [MEMORY[0x1E4F28CA0] _processIdentifierForID:v8];
  if (v8) {
    uint64_t v9 = [MEMORY[0x1E4F28CA0] _processIdentifierForID:v8];
  }
  else {
    uint64_t v9 = 0;
  }
  if (v7) {
    [v7 readerAuditToken];
  }
  else {
    memset(v62, 0, sizeof(v62));
  }
  v10 = [v7 kernelMaterializationInfo];
  v11 = [v10 fileMaterializationInfo];
  id v40 = +[FPDRequest requestForPID:v9 auditToken:v62 fromPOSIX:0 kernelFileInfo:v11];

  if (v40)
  {
    v12 = NSString;
    v13 = [v40 processName];
    id v38 = [v12 stringWithFormat:@"%@ (on behalf of %@)", 0, v13];
  }
  else
  {
    id v38 = 0;
  }
  uint64_t section = __fp_create_section();
  uint64_t v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend(v41, "fp_shortDescription");
    *(_DWORD *)buf = 134219010;
    uint64_t v65 = section;
    __int16 v66 = 2112;
    v67 = self;
    __int16 v68 = 2112;
    v69 = v15;
    __int16 v70 = 2112;
    v71 = v38;
    __int16 v72 = 2114;
    v73 = v8;
    _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx ⭕️ NSFileCoordinator requested %@ to provide item version at %@ (consumer: %@, readerID: %{public}@)", buf, 0x34u);
  }
  id v59 = 0;
  id v60 = 0;
  id v58 = 0;
  long long v37 = [MEMORY[0x1E4F25D08] parseInfoFromVersionURL:v41 domainIdentifier:&v60 fpItemIdentifier:&v59 etag:&v58];
  id v16 = v60;
  id v17 = v59;
  id v35 = v58;
  if (v16 && v17)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    v18 = [(FPDExtensionManager *)self->_extensionManager providerDomainsByID];
    v19 = [v18 allKeys];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v55;
LABEL_16:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v55 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v54 + 1) + 8 * v22);
        v24 = objc_msgSend(v23, "fp_toDomainIdentifier");
        if ([v24 isEqualToString:v16]) {
          break;
        }

        if (v20 == ++v22)
        {
          uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v63 count:16];
          if (v20) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
      id v27 = [(FPDExtensionManager *)self->_extensionManager domainWithID:v23 reason:0];

      if (!v27) {
        goto LABEL_28;
      }
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderDomainID:v16 itemIdentifier:v17];
      v29 = [v27 defaultBackend];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke;
      v42[3] = &unk_1E6A74300;
      id v43 = v41;
      id v44 = v38;
      id v45 = v8;
      id v52 = v39;
      id v30 = v27;
      id v46 = v30;
      id v31 = v28;
      id v47 = v31;
      id v48 = v35;
      id v49 = v40;
      SEL v53 = a2;
      id v50 = v17;
      v51 = self;
      [v29 URLForItemID:v31 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v49 completionHandler:v42];
    }
    else
    {
LABEL_22:

LABEL_28:
      id v32 = (void *)MEMORY[0x1E4F28CE0];
      FPProviderNotFoundErrorForURL();
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v31 = [v32 responseWithError:v30];
      (*((void (**)(id, id))v39 + 2))(v39, v31);
    }
  }
  else
  {
    if ([v37 isEqual:*MEMORY[0x1E4F63BD0]])
    {
      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = objc_msgSend(v41, "fp_shortDescription");
        -[FPDVersionsFileCoordinationProviderDelegate _provideItemAtURL:withInfo:completionHandler:](v26, (uint64_t)v8, (uint64_t)buf);
      }
    }
    else
    {
      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v33 = objc_msgSend(v41, "fp_shortDescription");
        -[FPDVersionsFileCoordinationProviderDelegate _provideItemAtURL:withInfo:completionHandler:](v33, (uint64_t)v8, (uint64_t)buf);
      }
    }

    id v30 = [MEMORY[0x1E4F28CE0] responseWithError:0];
    (*((void (**)(id, id))v39 + 2))(v39, v30);
  }

  __fp_leave_section_Notice();
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v24 = *(void *)(a1 + 104);
    v25 = [MEMORY[0x1E4F28CE0] responseWithError:v7];
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

    goto LABEL_10;
  }
  v10 = [v8 url];
  v11 = [MEMORY[0x1E4F63BE8] manager];
  id v44 = 0;
  v12 = [v11 permanentStorageForItemAtURL:v10 allocateIfNone:0 error:&v44];
  id v13 = v44;

  if (!v12)
  {
LABEL_9:

    v26 = *(void **)(a1 + 56);
    uint64_t v27 = *(void *)(a1 + 64);
    v28 = *(void **)(a1 + 72);
    uint64_t v29 = *(void *)(a1 + 80);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_15;
    v32[3] = &unk_1E6A742D8;
    id v33 = v28;
    id v34 = *(id *)(a1 + 64);
    id v35 = *(id *)(a1 + 48);
    id v41 = *(id *)(a1 + 104);
    id v36 = *(id *)(a1 + 32);
    id v37 = *(id *)(a1 + 56);
    id v30 = *(id *)(a1 + 88);
    uint64_t v42 = *(void *)(a1 + 112);
    uint64_t v31 = *(void *)(a1 + 96);
    id v38 = v30;
    uint64_t v39 = v31;
    id v40 = *(id *)(a1 + 40);
    [v26 downloadVersionWithItemID:v27 etag:v33 request:v29 completionHandler:v32];

    goto LABEL_10;
  }
  uint64_t v14 = [*(id *)(a1 + 32) lastPathComponent];
  uint64_t v15 = *MEMORY[0x1E4F63BB8];
  id v43 = v13;
  id v16 = [v12 additionWithName:v14 inNameSpace:v15 error:&v43];
  id v17 = v43;

  if (!v16)
  {
    id v13 = v17;
    goto LABEL_9;
  }
  v18 = fp_current_or_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    id v46 = v19;
    __int16 v47 = 2112;
    uint64_t v48 = v20;
    __int16 v49 = 2114;
    uint64_t v50 = v21;
    _os_log_impl(&dword_1D744C000, v18, OS_LOG_TYPE_DEFAULT, "[NOTICE] ✅ NSFileCoordinator: item exist on disk %@ (consumer: %@, readerID: %{public}@)", buf, 0x20u);
  }
  uint64_t v22 = *(void *)(a1 + 104);
  v23 = [MEMORY[0x1E4F28CE0] responseWithError:0];
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

LABEL_10:
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v76[7] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v54 = v9;
    id v13 = objc_opt_new();
    uint64_t v14 = [v10 lastEditorDeviceName];

    if (v14)
    {
      uint64_t v15 = [v10 lastEditorDeviceName];
      [v13 setObject:v15 forKeyedSubscript:@"fpVersionLastEditorDeviceName"];
    }
    id v53 = v12;
    id v16 = [v10 lastEditorNameComponents];

    if (v16)
    {
      id v17 = (void *)MEMORY[0x1E4F28DB0];
      v18 = [v10 lastEditorNameComponents];
      v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
      [v13 setObject:v19 forKeyedSubscript:@"fpVersionLastEditorNameComponents"];
    }
    v75[0] = *MEMORY[0x1E4F63BA8];
    uint64_t v20 = [v10 originalURL];
    uint64_t v21 = [v20 lastPathComponent];
    v76[0] = v21;
    v75[1] = *MEMORY[0x1E4F63B78];
    uint64_t v22 = [v10 displayName];
    uint64_t v23 = *MEMORY[0x1E4F63B90];
    uint64_t v24 = *MEMORY[0x1E4F63BB8];
    v76[1] = v22;
    v76[2] = v24;
    uint64_t v25 = *MEMORY[0x1E4F63B88];
    v75[2] = v23;
    v75[3] = v25;
    v26 = [*(id *)(a1 + 56) lastPathComponent];
    uint64_t v27 = *MEMORY[0x1E4F63BA0];
    v76[3] = v26;
    v76[4] = &unk_1F2EDBBC8;
    uint64_t v28 = *MEMORY[0x1E4F63B98];
    v75[4] = v27;
    v75[5] = v28;
    v75[6] = *MEMORY[0x1E4F63BB0];
    v76[5] = &unk_1F2EDBBE0;
    v76[6] = v13;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:7];

    id v30 = [MEMORY[0x1E4F63BE8] manager];
    uint64_t v31 = [v10 originalURL];
    id v68 = 0;
    id v32 = [v30 permanentStorageForItemAtURL:v31 allocateIfNone:1 error:&v68];
    id v33 = v68;

    if (v32)
    {
      id v51 = v33;
      id v67 = 0;
      [v32 prepareAdditionCreationWithItemAtURL:v11 byMoving:0 creationInfo:v29 error:&v67];
      v35 = id v34 = v11;
      id v36 = v67;
      id v52 = v29;
      if (v36)
      {
        id v37 = v34;
        id v38 = fp_current_or_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          __int16 v70 = v34;
          __int16 v71 = 2112;
          id v72 = v36;
          __int16 v73 = 2114;
          uint64_t v74 = v48;
          _os_log_error_impl(&dword_1D744C000, v38, OS_LOG_TYPE_ERROR, "[ERROR] ❌ NSFileCoordinator: Failed to prepare addition for item version %@: %@ (readerID: %{public}@)", buf, 0x20u);
        }

        uint64_t v39 = *(void *)(a1 + 96);
        id v40 = [MEMORY[0x1E4F28CE0] responseWithError:v36];
        (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);
      }
      else
      {
        uint64_t v50 = *(void **)(a1 + 64);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_28;
        v55[3] = &unk_1E6A742B0;
        id v56 = v10;
        id v57 = *(id *)(a1 + 48);
        id v58 = v35;
        id v59 = *(id *)(a1 + 72);
        id v60 = v32;
        id v61 = v29;
        id v45 = *(id *)(a1 + 56);
        uint64_t v46 = *(void *)(a1 + 80);
        id v62 = v45;
        uint64_t v63 = v46;
        long long v49 = *(_OWORD *)(a1 + 96);
        id v47 = (id)v49;
        long long v66 = v49;
        id v64 = *(id *)(a1 + 88);
        id v37 = v34;
        id v65 = v34;
        [v50 downloadVersionThumbnail:v54 version:v56 completionHandler:v55];

        id v40 = v56;
      }
      id v33 = v51;

      id v11 = v37;
      uint64_t v29 = v52;
    }
    else
    {
      id v43 = fp_current_or_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_15_cold_2(v10);
      }

      uint64_t v44 = *(void *)(a1 + 96);
      id v36 = [MEMORY[0x1E4F28CE0] responseWithError:v33];
      (*(void (**)(uint64_t, id))(v44 + 16))(v44, v36);
    }

    id v12 = v53;
    id v9 = v54;
  }
  else
  {
    id v41 = fp_current_or_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_15_cold_1();
    }

    uint64_t v42 = *(void *)(a1 + 96);
    id v13 = [MEMORY[0x1E4F28CE0] responseWithError:v12];
    (*(void (**)(uint64_t, void *))(v42 + 16))(v42, v13);
  }
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && !v9)
  {
    id v11 = *(void **)(a1 + 48);
    id v12 = [v7 url];
    id v47 = 0;
    int v13 = objc_msgSend(v11, "fp_associateThumbnailToVersionAtURL:thumbnailMetadata:error:", v12, v8, &v47);
    uint64_t v14 = v47;

    uint64_t v15 = fp_current_or_default_log();
    id v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v17 = objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
        v18 = *(NSObject **)(a1 + 56);
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        long long v49 = v17;
        __int16 v50 = 2112;
        id v51 = v18;
        __int16 v52 = 2112;
        uint64_t v53 = v19;
        __int16 v54 = 2114;
        long long v55 = v20;
        _os_log_impl(&dword_1D744C000, v16, OS_LOG_TYPE_INFO, "[INFO] Associated thumbnail data for %{public}@ for identifier: %@, version: %@ (readerID: %{public}@)", buf, 0x2Au);
      }
      uint64_t v21 = NSString;
      uint64_t v22 = [*(id *)(a1 + 48) path];
      uint64_t v23 = [v21 stringWithFormat:@"com.apple.fileprovider.thumbnail-available.%@", v22];
      uint64_t v24 = objc_msgSend(v23, "fp_libnotifyPerUserNotificationName");

      id v16 = v24;
      notify_post((const char *)[v16 UTF8String]);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v32 = *(void **)(a1 + 48);
      id v36 = *(NSObject **)(a1 + 56);
      uint64_t v37 = *(void *)(a1 + 32);
      id v33 = [v7 url];
      id v34 = [v14 fp_prettyDescription];
      uint64_t v35 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      long long v49 = v32;
      __int16 v50 = 2112;
      id v51 = v36;
      __int16 v52 = 2112;
      uint64_t v53 = v37;
      __int16 v54 = 2112;
      long long v55 = v33;
      __int16 v56 = 2114;
      id v57 = v34;
      __int16 v58 = 2114;
      uint64_t v59 = v35;
      _os_log_error_impl(&dword_1D744C000, v16, OS_LOG_TYPE_ERROR, "[ERROR] Failed to associate thumbnail data to promised URL %@ for identifier: %@, version: %@, thumbnailDataURL: %@, error: %{public}@ (readerID: %{public}@)", buf, 0x3Eu);
    }
    goto LABEL_11;
  }
  uint64_t v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void **)(a1 + 32);
    id v16 = objc_msgSend(v10, "fp_prettyDescription");
    uint64_t v26 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    long long v49 = v25;
    __int16 v50 = 2114;
    id v51 = v16;
    __int16 v52 = 2114;
    uint64_t v53 = v26;
    _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_INFO, "[INFO] failed to download thumbnail for version %@: %{public}@ (readerID: %{public}@)", buf, 0x20u);
LABEL_11:
  }
  uint64_t v27 = *(void *)(a1 + 48);
  uint64_t v29 = *(void **)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 72);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_32;
  v38[3] = &unk_1E6A74288;
  id v30 = *(id *)(a1 + 80);
  uint64_t v46 = *(void *)(a1 + 120);
  uint64_t v31 = *(void *)(a1 + 88);
  id v39 = v30;
  uint64_t v40 = v31;
  id v41 = *(id *)(a1 + 48);
  id v42 = *(id *)(a1 + 40);
  id v45 = *(id *)(a1 + 112);
  id v43 = *(id *)(a1 + 96);
  id v44 = *(id *)(a1 + 104);
  [v29 createAdditionStagedAtURL:v27 creationInfo:v28 completionHandler:v38];
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 url];
  id v8 = [v7 path];
  id v9 = [*(id *)(a1 + 32) path];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = *(void *)(a1 + 88);
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = [v5 url];
    uint64_t v28 = objc_msgSend(v27, "fp_shortDescription");
    uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
    id v30 = objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
    [v24 handleFailureInMethod:v25, v26, @"FPDVersionsFileCoordinationProviderDelegate.m", 244, @"Result URL %@ differs from requested URL %@ (staged was %@)", v28, v29, v30 object file lineNumber description];
  }
  id v11 = fp_current_or_default_log();
  id v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_32_cold_1(a1);
    }

    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = (void *)MEMORY[0x1E4F28CE0];
    id v15 = v6;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
      uint64_t v18 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412802;
      id v32 = v16;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      __int16 v35 = 2114;
      uint64_t v36 = v18;
      _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] ✅ NSFileCoordinator: providing item version at %@ (consumer: %@, readerID: %{public}@)", buf, 0x20u);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28CA0];
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v21 = *MEMORY[0x1E4F63BB8];
    uint64_t v22 = [v5 name];
    objc_msgSend(v19, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", v20, v21, v22, 0);

    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = (void *)MEMORY[0x1E4F28CE0];
    id v15 = 0;
  }
  uint64_t v23 = [v14 responseWithError:v15];
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v23);
}

- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28CC8];
  id v7 = a5;
  id v8 = [v6 providingRequiredResponse];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void).cxx_destruct
{
}

- (void)_physicalURLForURL:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] %@ failed to find version for %@");
}

- (void)_physicalURLForURL:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] %@ failed to find storage for %@");
}

- (void)_physicalURLForURL:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] %@ called for %@");
}

- (void)_provideItemAtURL:(void *)a1 withInfo:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_4((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ⛔️ NSFileCoordinator: Item URL %@ belongs to a conflict version and should already be present (readerID: %{public}@)", v4, 0x16u);
}

- (void)_provideItemAtURL:(void *)a1 withInfo:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_4((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ❌ NSFileCoordinator: Item URL %@ could not be parsed (readerID: %{public}@)", v4, 0x16u);
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_15_cold_1()
{
  uint64_t v0 = [0 originalURL];
  id v6 = objc_msgSend(v0, "fp_shortDescription");
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x34u);
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_15_cold_2(void *a1)
{
  os_log_t v1 = [a1 originalURL];
  id v7 = objc_msgSend(v1, "fp_shortDescription");
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_32_cold_1(uint64_t a1)
{
  id v6 = objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);
}

@end