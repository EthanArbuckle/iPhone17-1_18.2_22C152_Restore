@interface DEDAttachmentHandler
- (BOOL)compressOnAttach;
- (DEDAttachmentHandler)init;
- (OS_os_log)log;
- (id)_createEmptyMessageFileForDE:(id)a3 extensionName:(id)a4 withSessionIdentifier:(id)a5 device:(id)a6 withRootDir:(id)a7;
- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 rootDir:(id)a6;
- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 rootDir:(id)a7;
- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 rootDir:(id)a7 annotatedGroup:(id)a8;
- (id)collectedGroupsWithSessionIdentifier:(id)a3 matchingExtensions:(id)a4;
- (id)createEmptyMessageFileForDE:(id)a3 extensionName:(id)a4 withSessionIdentifier:(id)a5 device:(id)a6;
- (id)dedDirectory;
- (id)directoryForBugSessionIdentifier:(id)a3;
- (id)directoryForBugSessionIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)directoryForBugSessionWithIdentifier:(id)a3 extension:(id)a4 rootDirectory:(id)a5;
- (id)directoryForBugSessionWithIdentifier:(id)a3 extension:(id)a4 rootDirectory:(id)a5 createIfNeeded:(BOOL)a6;
- (id)directoryForBugSessionWithIdentifier:(id)a3 rootDirectory:(id)a4 createIfNeeded:(BOOL)a5;
- (id)extensionsWithFilesAttachedToSessionWithID:(id)a3 allExtensions:(id)a4;
- (id)identifierForAdoptingFile:(id)a3;
- (id)processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 annotatedGroup:(id)a7;
- (unint64_t)directorySizeForBugSessionIdentifier:(id)a3;
- (void)removeDEFiles:(id)a3 withSessionIdentifier:(id)a4;
- (void)removeDirectoryForBugSessionIdentifier:(id)a3;
- (void)setCompressOnAttach:(BOOL)a3;
- (void)setLog:(id)a3;
@end

@implementation DEDAttachmentHandler

- (DEDAttachmentHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)DEDAttachmentHandler;
  v2 = [(DEDAttachmentHandler *)&v5 init];
  if (v2)
  {
    v3 = +[DEDUtils sharedLog];
    [(DEDAttachmentHandler *)v2 setLog:v3];

    [(DEDAttachmentHandler *)v2 setCompressOnAttach:0];
  }
  return v2;
}

- (id)processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 annotatedGroup:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(DEDAttachmentHandler *)self dedDirectory];
  v17 = [(DEDAttachmentHandler *)self _processAttachments:v15 withSessionIdentifier:v14 extension:v13 shouldAddClassBDataProtection:v7 rootDir:v16 annotatedGroup:v12];

  return v17;
}

- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 rootDir:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(DEDAttachmentHandler *)self dedDirectory];
  id v13 = [(DEDAttachmentHandler *)self _processAttachments:v11 withSessionIdentifier:v10 extension:v9 shouldAddClassBDataProtection:0 rootDir:v12];

  return v13;
}

- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 rootDir:(id)a7
{
  return [(DEDAttachmentHandler *)self _processAttachments:a3 withSessionIdentifier:a4 extension:a5 shouldAddClassBDataProtection:a6 rootDir:a7 annotatedGroup:0];
}

- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 rootDir:(id)a7 annotatedGroup:(id)a8
{
  BOOL v10 = a6;
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v15)
  {
    v19 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      [(DEDAttachmentHandler *)v19 _processAttachments:v31 withSessionIdentifier:v32 extension:v33 shouldAddClassBDataProtection:v34 rootDir:v35 annotatedGroup:v36];
    }
    v37 = 0;
    goto LABEL_49;
  }
  BOOL v69 = v10;
  id v73 = v16;
  id v74 = v15;
  id v72 = v17;
  v19 = [(DEDAttachmentHandler *)self directoryForBugSessionWithIdentifier:v15 extension:v16 rootDirectory:v17 createIfNeeded:1];
  if (v18)
  {
    v20 = (void *)MEMORY[0x263F3A060];
    v21 = [v18 displayName];
    v22 = [v18 localizedDescription];
    v23 = [v18 iconType];
    v24 = [v18 additionalInfo];
    id v88 = 0;
    [v20 annotateURL:v19 displayName:v21 description:v22 iconType:v23 additionalInfo:v24 error:&v88];
    id v25 = v88;

    v26 = +[DEDUtils sharedLog];
    v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = [v19 lastPathComponent];
        v29 = [v18 description];
        *(_DWORD *)buf = 138543874;
        v95 = v28;
        __int16 v96 = 2114;
        id v97 = v29;
        __int16 v98 = 2114;
        id v99 = v25;
        _os_log_error_impl(&dword_21FE04000, v27, OS_LOG_TYPE_ERROR, "Failed to annotate [%{public}@] with [%{public}@] error: [%{public}@]", buf, 0x20u);
LABEL_11:
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v19 lastPathComponent];
      v29 = [v18 description];
      *(_DWORD *)buf = 138543618;
      v95 = v28;
      __int16 v96 = 2114;
      id v97 = v29;
      _os_log_impl(&dword_21FE04000, v27, OS_LOG_TYPE_DEFAULT, "Annotated [%{public}@] with [%{public}@]", buf, 0x16u);
      goto LABEL_11;
    }
  }
  id v70 = v14;
  id v71 = v18;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v14;
  uint64_t v38 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v85;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v85 != v40) {
          objc_enumerationMutation(obj);
        }
        v42 = *(NSObject **)(*((void *)&v84 + 1) + 8 * v41);
        id v83 = 0;
        v43 = [v42 sandboxExtensionHandleWithErrorOut:&v83];
        id v44 = v83;
        if (v44)
        {
          v45 = [(DEDAttachmentHandler *)self log];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v95 = v42;
            __int16 v96 = 2114;
            id v97 = v44;
            _os_log_error_impl(&dword_21FE04000, v45, OS_LOG_TYPE_ERROR, "Failed to get sandboxing handle on item [%{public}@] with error %{public}@", buf, 0x16u);
          }
        }
        v46 = [v42 shouldCompress];
        int v47 = [v46 BOOLValue];

        if (v47)
        {
          v48 = [(DEDAttachmentHandler *)self log];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:annotatedGroup:]((uint64_t)v92, (uint64_t)v42);
          }
        }
        else
        {
          v48 = objc_msgSend(NSNumber, "numberWithBool:", -[DEDAttachmentHandler compressOnAttach](self, "compressOnAttach"));
          [v42 setShouldCompress:v48];
        }

        v49 = [v42 shouldCompress];
        int v50 = [v49 BOOLValue];

        if (v50)
        {
          v51 = [(DEDAttachmentHandler *)self log];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            v52 = [v42 path];
            *(_DWORD *)buf = 138412290;
            v95 = v52;
            _os_log_impl(&dword_21FE04000, v51, OS_LOG_TYPE_INFO, "Will compress while attaching [%@]", buf, 0xCu);
          }
        }
        id v53 = (id)[v42 attachToDestinationDir:v19];

        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v39);
  }

  if (!v69) {
    goto LABEL_48;
  }
  v54 = [(DEDAttachmentHandler *)self log];
  id v16 = v73;
  id v15 = v74;
  id v18 = v71;
  id v17 = v72;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v95 = v19;
    _os_log_impl(&dword_21FE04000, v54, OS_LOG_TYPE_INFO, "Setting NSURLFileProtectionKey on [%{public}@]", buf, 0xCu);
  }

  v55 = [MEMORY[0x263F3A0A0] enumeratorForAllItems:v19];
  if (v55)
  {
    v75 = v19;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obja = v55;
    uint64_t v56 = [obja countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v80;
      uint64_t v59 = *MEMORY[0x263EFF650];
      uint64_t v60 = *MEMORY[0x263EFF640];
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v80 != v58) {
            objc_enumerationMutation(obja);
          }
          v62 = *(void **)(*((void *)&v79 + 1) + 8 * v61);
          v63 = (void *)MEMORY[0x223C5FD90]();
          uint64_t v89 = v59;
          uint64_t v90 = v60;
          v64 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          uint64_t v78 = 0;
          [v62 setResourceValues:v64 error:&v78];
          uint64_t v65 = v78;

          if (v65)
          {
            v66 = [(DEDAttachmentHandler *)self log];
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v95 = v75;
              _os_log_error_impl(&dword_21FE04000, v66, OS_LOG_TYPE_ERROR, "Failed to set ProtectionCompleteUnlessOpen on [%{public}@]", buf, 0xCu);
            }
          }
          ++v61;
        }
        while (v57 != v61);
        uint64_t v57 = [obja countByEnumeratingWithState:&v79 objects:v91 count:16];
      }
      while (v57);
    }

    v19 = v75;
LABEL_48:
    v19 = v19;
    v37 = v19;
    id v14 = v70;
    id v18 = v71;
    id v16 = v73;
    id v15 = v74;
    id v17 = v72;
    goto LABEL_49;
  }
  v68 = [(DEDAttachmentHandler *)self log];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
    -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:annotatedGroup:]();
  }

  v37 = 0;
  id v14 = v70;
LABEL_49:

  return v37;
}

- (void)removeDEFiles:(id)a3 withSessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(DEDAttachmentHandler *)self dedDirectory];
    id v9 = [(DEDAttachmentHandler *)self directoryForBugSessionWithIdentifier:v7 extension:v6 rootDirectory:v8 createIfNeeded:0];

    if (v9)
    {
      [MEMORY[0x263F3A0A0] removeFile:v9];
    }
    else
    {
      id v17 = [(DEDAttachmentHandler *)self log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[DEDAttachmentHandler removeDEFiles:withSessionIdentifier:]();
      }
    }
  }
  else
  {
    id v9 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler removeDEFiles:withSessionIdentifier:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (id)extensionsWithFilesAttachedToSessionWithID:(id)a3 allExtensions:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [(DEDAttachmentHandler *)self directoryForBugSessionIdentifier:a3];
    v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = [v7 path];
    char v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      if ([v6 count])
      {
        uint64_t v11 = [MEMORY[0x263F3A0A0] lsDir:v7];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke;
        v35[3] = &unk_26453A4F8;
        v35[4] = self;
        id v36 = v6;
        uint64_t v12 = [v11 ded_mapWithBlock:v35];

LABEL_13:
        goto LABEL_14;
      }
      uint64_t v11 = [(DEDAttachmentHandler *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DEDAttachmentHandler extensionsWithFilesAttachedToSessionWithID:allExtensions:](v11, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      uint64_t v11 = [(DEDAttachmentHandler *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DEDAttachmentHandler extensionsWithFilesAttachedToSessionWithID:allExtensions:](v11, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_13;
  }
  id v7 = [(DEDAttachmentHandler *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[DEDAttachmentHandler extensionsWithFilesAttachedToSessionWithID:allExtensions:](v7, v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v12 = (void *)MEMORY[0x263EFFA68];
LABEL_14:

  return v12;
}

id __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_2();
  }

  objc_super v5 = [v3 lastPathComponent];
  id v6 = [[DEDExtensionIdentifier alloc] initWithString:v5];
  id v7 = [(DEDExtensionIdentifier *)v6 extensionIdentifier];
  v8 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_25;
  v15[3] = &unk_26453A4D0;
  id v9 = v7;
  id v16 = v9;
  char v10 = objc_msgSend(v8, "ded_findWithBlock:", v15);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_1();
    }
  }
  return v11;
}

uint64_t __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)collectedGroupsWithSessionIdentifier:(id)a3 matchingExtensions:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v44 = a4;
  if (!a3)
  {
    id v6 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler collectedGroupsWithSessionIdentifier:matchingExtensions:](v6, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_30;
  }
  id v6 = [(DEDAttachmentHandler *)self directoryForBugSessionIdentifier:a3];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (!v9)
  {
LABEL_30:
    uint64_t v30 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_35;
  }
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  if ([v44 count])
  {
    v42 = +[DEDDevice currentDevice];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v39 = v6;
    id obj = [MEMORY[0x263F3A0A0] lsDir:v6];
    uint64_t v45 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v45)
    {
      uint64_t v43 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v50 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v12 = [(DEDAttachmentHandler *)self log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v11;
            _os_log_debug_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEBUG, "inspecting DE dir %@", buf, 0xCu);
          }

          uint64_t v13 = [v11 lastPathComponent];
          uint64_t v14 = [[DEDExtensionIdentifier alloc] initWithString:v13];
          uint64_t v15 = [(DEDExtensionIdentifier *)v14 extensionIdentifier];
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = __80__DEDAttachmentHandler_collectedGroupsWithSessionIdentifier_matchingExtensions___block_invoke;
          v47[3] = &unk_26453A4D0;
          id v16 = v15;
          id v48 = v16;
          uint64_t v17 = objc_msgSend(v44, "ded_findWithBlock:", v47);
          uint64_t v18 = v17;
          if (v17)
          {
            v46 = v13;
            uint64_t v19 = [v17 name];
            uint64_t v20 = (void *)v19;
            if (v19) {
              uint64_t v21 = (void *)v19;
            }
            else {
              uint64_t v21 = v16;
            }
            uint64_t v22 = v21;

            uint64_t v23 = [MEMORY[0x263F3A078] createWithName:v22 rootURL:v11];
            uint64_t v24 = [v18 identifier];
            uint64_t v25 = +[DEDAttachmentGroup groupWithDEGroup:v23 identifier:v24];

            uint64_t v26 = [v42 identifier];
            [v25 setDeviceID:v26];

            uint64_t v27 = [(DEDAttachmentHandler *)self log];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v25;
              _os_log_debug_impl(&dword_21FE04000, v27, OS_LOG_TYPE_DEBUG, "created group %@", buf, 0xCu);
            }

            if (v25)
            {
              [v40 addObject:v25];
            }
            else
            {
              uint64_t v28 = [(DEDAttachmentHandler *)self log];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                -[DEDAttachmentHandler collectedGroupsWithSessionIdentifier:matchingExtensions:]((uint64_t)v53, (uint64_t)v11);
              }
            }
            uint64_t v13 = v46;
          }
          else
          {
            uint64_t v22 = [(DEDAttachmentHandler *)self log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v11;
              _os_log_error_impl(&dword_21FE04000, v22, OS_LOG_TYPE_ERROR, "could not match de directory [%{public}@] to known extensions", buf, 0xCu);
            }
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v45);
    }

    uint64_t v29 = v40;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithArray:v40];
    id v6 = v39;
  }
  else
  {
    v42 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[DEDAttachmentHandler collectedGroupsWithSessionIdentifier:matchingExtensions:]();
    }
    uint64_t v30 = (void *)MEMORY[0x263EFFA68];
    uint64_t v29 = v40;
  }

LABEL_35:
  return v30;
}

uint64_t __80__DEDAttachmentHandler_collectedGroupsWithSessionIdentifier_matchingExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)createEmptyMessageFileForDE:(id)a3 extensionName:(id)a4 withSessionIdentifier:(id)a5 device:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(DEDAttachmentHandler *)self dedDirectory];
  uint64_t v15 = [(DEDAttachmentHandler *)self _createEmptyMessageFileForDE:v13 extensionName:v12 withSessionIdentifier:v11 device:v10 withRootDir:v14];

  return v15;
}

- (id)_createEmptyMessageFileForDE:(id)a3 extensionName:(id)a4 withSessionIdentifier:(id)a5 device:(id)a6 withRootDir:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13)
  {
    id v16 = NSString;
    uint64_t v17 = [a4 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    uint64_t v18 = [v16 stringWithFormat:@"EMPTY_%@.txt", v17];

    uint64_t v19 = (void *)MEMORY[0x263F08790];
    uint64_t v20 = [MEMORY[0x263EFF910] date];
    uint64_t v21 = [v19 localizedStringFromDate:v20 dateStyle:3 timeStyle:3];

    uint64_t v22 = NSString;
    uint64_t v23 = [v14 publicLogDescription];
    uint64_t v24 = [v14 build];
    uint64_t v25 = [v22 stringWithFormat:@"Diagnostic Extension [%@] ran on [%@] with build [%@] on [%@] and returned no files.", v12, v23, v24, v21];

    uint64_t v26 = [(DEDAttachmentHandler *)self directoryForBugSessionWithIdentifier:v13 extension:v12 rootDirectory:v15 createIfNeeded:1];
    uint64_t v27 = [v26 URLByAppendingPathComponent:v18];
    uint64_t v28 = [v27 path];
    [v25 writeToFile:v28 atomically:1 encoding:4 error:0];
  }
  else
  {
    uint64_t v29 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler _createEmptyMessageFileForDE:extensionName:withSessionIdentifier:device:withRootDir:](v29, v30, v31, v32, v33, v34, v35, v36);
    }

    uint64_t v26 = [NSURL URLWithString:@"/"];
  }

  return v26;
}

- (id)directoryForBugSessionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(DEDAttachmentHandler *)self dedDirectory];
    id v6 = [v5 URLByAppendingPathComponent:v4];
  }
  else
  {
    id v7 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler directoryForBugSessionIdentifier:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)directoryForBugSessionIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(DEDAttachmentHandler *)self directoryForBugSessionIdentifier:v6];
  if (!v4)
  {
LABEL_12:
    id v16 = v7;
    goto LABEL_13;
  }
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  uint64_t v11 = [(DEDAttachmentHandler *)self log];
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[DEDAttachmentHandler directoryForBugSessionIdentifier:createIfNeeded:]();
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "Bug session directory for session: [%{public}@] does not exist. Creating now", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v13 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v7];
  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v14 = (void *)v13;
  id v15 = [(DEDAttachmentHandler *)self log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[DEDAttachmentHandler directoryForBugSessionIdentifier:createIfNeeded:]();
  }

  id v16 = 0;
LABEL_13:

  return v16;
}

- (void)removeDirectoryForBugSessionIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(DEDAttachmentHandler *)self log];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v4;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "removing bug session directory [%{public}@]", (uint8_t *)&v17, 0xCu);
    }

    id v6 = [(DEDAttachmentHandler *)self directoryForBugSessionIdentifier:v4];
    if (v6)
    {
      id v7 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v8 = [v6 path];
      int v9 = [v7 fileExistsAtPath:v8];

      if (v9) {
        [MEMORY[0x263F3A0A0] removeFile:v6];
      }
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    -[DEDAttachmentHandler removeDirectoryForBugSessionIdentifier:](v6, v10, v11, v12, v13, v14, v15, v16);
  }
}

- (unint64_t)directorySizeForBugSessionIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_super v5 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler directorySizeForBugSessionIdentifier:](v5, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_9;
  }
  objc_super v5 = [(DEDAttachmentHandler *)self directoryForBugSessionIdentifier:v4];
  if (!v5)
  {
    uint64_t v14 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DEDAttachmentHandler directorySizeForBugSessionIdentifier:]();
    }

LABEL_9:
    unint64_t v6 = 0;
    goto LABEL_10;
  }
  unint64_t v6 = [MEMORY[0x263F3A0A0] getDirectorySize:v5];
LABEL_10:

  return v6;
}

- (id)identifierForAdoptingFile:(id)a3
{
  id v3 = [a3 lastPathComponent];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  return v4;
}

- (id)dedDirectory
{
  if (dedDirectory_onceToken != -1) {
    dispatch_once(&dedDirectory_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)dedDirectory_dedDirectory;
  return v2;
}

void __36__DEDAttachmentHandler_dedDirectory__block_invoke()
{
  v0 = +[DEDConfiguration sharedInstance];
  uint64_t v1 = [v0 dedDirectory];
  v2 = (void *)dedDirectory_dedDirectory;
  dedDirectory_dedDirectory = v1;

  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(id)dedDirectory_dedDirectory path];
  char v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0) {
    id v6 = (id)[MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:dedDirectory_dedDirectory];
  }
}

- (id)directoryForBugSessionWithIdentifier:(id)a3 rootDirectory:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v11 = [v9 URLByAppendingPathComponent:v8];
    uint64_t v12 = [v11 path];
    char v13 = [v10 fileExistsAtPath:v12];

    if (v5)
    {
      uint64_t v14 = [(DEDAttachmentHandler *)self log];
      uint64_t v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:]();
        }
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v26 = 138543362;
          uint64_t v27 = v11;
          _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_INFO, "creating bug session directory: [%{public}@]", (uint8_t *)&v26, 0xCu);
        }

        uint64_t v15 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v11];
        if (v15)
        {
          uint64_t v24 = [(DEDAttachmentHandler *)self log];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:](v15, v24);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v16 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v11 = [NSURL URLWithString:@"/"];
  }

  return v11;
}

- (id)directoryForBugSessionWithIdentifier:(id)a3 extension:(id)a4 rootDirectory:(id)a5 createIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    char v13 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v14 = [v12 URLByAppendingPathComponent:v10];
    uint64_t v15 = [v14 URLByAppendingPathComponent:v11];
    uint64_t v16 = [v15 path];
    char v17 = [v13 fileExistsAtPath:v16];

    uint64_t v18 = [(DEDAttachmentHandler *)self log];
    uint64_t v19 = v18;
    if ((v17 & 1) != 0 || !v6)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:]((uint64_t)v10, v15, v19);
      }
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v29 = 138543362;
        uint64_t v30 = v15;
        _os_log_impl(&dword_21FE04000, v19, OS_LOG_TYPE_INFO, "creating extension directory: [%{public}@]", (uint8_t *)&v29, 0xCu);
      }

      uint64_t v19 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v15];
      if (v19)
      {
        uint64_t v20 = [(DEDAttachmentHandler *)self log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:](v15, v19, v20);
        }
      }
    }
  }
  else
  {
    char v13 = [(DEDAttachmentHandler *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:](v13, v21, v22, v23, v24, v25, v26, v27);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)directoryForBugSessionWithIdentifier:(id)a3 extension:(id)a4 rootDirectory:(id)a5
{
  return [(DEDAttachmentHandler *)self directoryForBugSessionWithIdentifier:a3 extension:a4 rootDirectory:a5 createIfNeeded:1];
}

- (BOOL)compressOnAttach
{
  return self->_compressOnAttach;
}

- (void)setCompressOnAttach:(BOOL)a3
{
  self->_compressOnAttach = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_processAttachments:(uint64_t)a3 withSessionIdentifier:(uint64_t)a4 extension:(uint64_t)a5 shouldAddClassBDataProtection:(uint64_t)a6 rootDir:(uint64_t)a7 annotatedGroup:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:annotatedGroup:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not create enumerator for dir [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)_processAttachments:(uint64_t)a1 withSessionIdentifier:(uint64_t)a2 extension:shouldAddClassBDataProtection:rootDir:annotatedGroup:.cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "path");
  *(_DWORD *)uint64_t v4 = 138412290;
  void *v3 = v5;
  _os_log_debug_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEBUG, "shouldCompress = YES for [%@]", v4, 0xCu);
}

- (void)removeDEFiles:(uint64_t)a3 withSessionIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeDEFiles:withSessionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "directory to remove is nil", v1, 2u);
}

- (void)extensionsWithFilesAttachedToSessionWithID:(uint64_t)a3 allExtensions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)extensionsWithFilesAttachedToSessionWithID:(uint64_t)a3 allExtensions:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)extensionsWithFilesAttachedToSessionWithID:(uint64_t)a3 allExtensions:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "could not match de directory [%{public}@] to known extensions", v2, v3, v4, v5, v6);
}

void __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "Inspecting DE dir %@", v1, 0xCu);
}

- (void)collectedGroupsWithSessionIdentifier:(uint64_t)a3 matchingExtensions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)collectedGroupsWithSessionIdentifier:matchingExtensions:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "cannot build ded group list with empty extension, exiting", v1, 2u);
}

- (void)collectedGroupsWithSessionIdentifier:(uint64_t)a1 matchingExtensions:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "path");
  *(_DWORD *)uint64_t v4 = 138543362;
  void *v3 = v5;
  _os_log_error_impl(&dword_21FE04000, v2, OS_LOG_TYPE_ERROR, "could not create ded group from de dir [%{public}@]", v4, 0xCu);
}

- (void)_createEmptyMessageFileForDE:(uint64_t)a3 extensionName:(uint64_t)a4 withSessionIdentifier:(uint64_t)a5 device:(uint64_t)a6 withRootDir:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)directoryForBugSessionIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)directoryForBugSessionIdentifier:createIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "Bug session directory already exists", v1, 2u);
}

- (void)directoryForBugSessionIdentifier:createIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not create bug session directory with error: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)removeDirectoryForBugSessionIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)directorySizeForBugSessionIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)directorySizeForBugSessionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Failed to get directory for bug session [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)directoryForBugSessionWithIdentifier:(uint64_t)a3 rootDirectory:(uint64_t)a4 createIfNeeded:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "bug session directory already exists", v1, 2u);
}

- (void)directoryForBugSessionWithIdentifier:(void *)a1 rootDirectory:(NSObject *)a2 createIfNeeded:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "could not create bug session directory with error: [%{public}@]", v4, 0xCu);
}

- (void)directoryForBugSessionWithIdentifier:(uint64_t)a3 extension:(uint64_t)a4 rootDirectory:(uint64_t)a5 createIfNeeded:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)directoryForBugSessionWithIdentifier:(NSObject *)a3 extension:rootDirectory:createIfNeeded:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 path];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_21FE04000, a3, OS_LOG_TYPE_DEBUG, "extension directory for session (%@) already exists: %@", (uint8_t *)&v6, 0x16u);
}

- (void)directoryForBugSessionWithIdentifier:(NSObject *)a3 extension:rootDirectory:createIfNeeded:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 path];
  int v6 = [a2 localizedDescription];
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "could not create extension directory (%@) with error: [%{public}@]", (uint8_t *)&v7, 0x16u);
}

@end