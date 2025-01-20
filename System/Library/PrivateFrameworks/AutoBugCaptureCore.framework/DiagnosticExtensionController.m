@interface DiagnosticExtensionController
- (DiagnosticExtensionController)initWithDestinationDirectory:(id)a3;
- (NSString)destinationRootDirectory;
- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensions:(id)a4 queue:(id)a5 reply:(id)a6;
- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 queue:(id)a5 reply:(id)a6;
@end

@implementation DiagnosticExtensionController

- (DiagnosticExtensionController)initWithDestinationDirectory:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DiagnosticExtensionController;
  v6 = [(DiagnosticExtensionController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_destinationRootDirectory, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v7->dateFormatter;
    v7->dateFormatter = v8;

    [(NSDateFormatter *)v7->dateFormatter setDateFormat:@"yyyy-MM-dd_HHmmss"];
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.autobugcapture.diagnosticExtension", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensions:(id)a4 queue:(id)a5 reply:(id)a6
{
  v20 = self;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [MEMORY[0x263EFF9A0] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
        v19 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v20);
        [v12 setObject:v19 forKeyedSubscript:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  [(DiagnosticExtensionController *)v20 collectDEPayloadsWithIdentifier:v21 diagnosticExtensionsWithParameters:v12 queue:v10 reply:v11];
}

- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 queue:(id)a5 reply:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  id v13 = a6;
  uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v36 = [v11 count];
  dateFormatter = self->dateFormatter;
  uint64_t v16 = [MEMORY[0x263EFF910] date];
  uint64_t v17 = [(NSDateFormatter *)dateFormatter stringFromDate:v16];
  uint64_t v18 = [v10 stringByAppendingFormat:@"-%@", v17];

  v19 = diagextLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v11 count];
    id v21 = [v11 allKeys];
    *(_DWORD *)buf = 134218242;
    uint64_t v39 = v20;
    __int16 v40 = 2112;
    v41 = v21;
    _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEFAULT, "Calling %ld DEs: %@", buf, 0x16u);
  }
  if (v34[3])
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke;
    v26[3] = &unk_263FC3610;
    v26[4] = self;
    id v27 = v14;
    v31 = v37;
    id v28 = v18;
    v32 = &v33;
    id v30 = v13;
    v29 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:v26];
  }
  else
  {
    long long v22 = diagextLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEFAULT, "List of DiagnosticExtensions to call was empty", buf, 2u);
    }

    if (v13)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_99;
      block[3] = &unk_263FC2E88;
      id v25 = v13;
      id v24 = v14;
      dispatch_async(v12, block);
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v37, 8);
}

void __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = diagextLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Ready to call DE %@", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_86;
    v16[3] = &unk_263FC35E8;
    id v17 = v7;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 72);
    id v18 = v11;
    uint64_t v23 = v12;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 32);
    id v19 = v13;
    uint64_t v20 = v14;
    uint64_t v24 = *(void *)(a1 + 80);
    id v22 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 56);
    id v15 = v7;
    +[DiagnosticExtensionCaller getAttachmentsFrom:v15 forBundleID:0 withParameters:v8 queue:v10 reply:v16];
  }
}

void __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = [MEMORY[0x263EFF9C0] set];
  id v9 = diagextLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v89 = (uint64_t)v7;
      __int16 v90 = 2048;
      uint64_t v91 = [v5 count];
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Reply for DE %@, with %ld attachments", buf, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v89 = (uint64_t)v7;
    __int16 v90 = 2112;
    uint64_t v91 = (uint64_t)v6;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Reply for DE %@, with error:%@", buf, 0x16u);
  }

  if ([v6 code] == 45)
  {
    id v11 = diagextLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v89 = (uint64_t)v7;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "DE %@ is not available on this device. Marking as not required.", buf, 0xCu);
    }

    id v9 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];
    goto LABEL_10;
  }
LABEL_11:
  ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v12 = [MEMORY[0x263EFF9C0] set];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_88;
  aBlock[3] = &unk_263FC35C0;
  id v13 = v12;
  id v86 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  v72 = v5;
  v73 = v14;
  if ([v5 count])
  {
    id v15 = diagextLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v5 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v89 = v16;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v7;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Processing %ld attachments from %@", buf, 0x16u);
    }
    id v68 = v13;
    uint64_t v69 = a1;
    id v70 = v7;
    id v71 = v6;

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obj = v5;
    uint64_t v76 = [obj countByEnumeratingWithState:&v81 objects:v98 count:16];
    id v17 = 0;
    if (v76)
    {
      char v77 = 0;
      uint64_t v75 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v76; ++i)
        {
          if (*(void *)v82 != v75) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          uint64_t v20 = diagextLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [v19 deleteOnAttach];
            id v22 = [v19 shouldCompress];
            uint64_t v23 = [v19 modificationDate];
            uint64_t v24 = [v19 filesize];
            *(_DWORD *)buf = 138413314;
            uint64_t v89 = (uint64_t)v19;
            __int16 v90 = 2112;
            uint64_t v91 = (uint64_t)v21;
            __int16 v92 = 2112;
            v93 = v22;
            __int16 v94 = 2112;
            v95 = v23;
            __int16 v96 = 2112;
            v97 = v24;
            _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_INFO, "Processing %@ (deleteOnAttach:%@, shouldCompress:%@, modificationDate:%@, fileSize:%@)", buf, 0x34u);
          }
          if (v17)
          {
            uint64_t v25 = [v19 modificationDate];
            if (v25)
            {
              id v26 = (void *)v25;
              uint64_t v27 = [v17 modificationDate];

              if (v27)
              {
                id v28 = [v17 modificationDate];
                v29 = [v19 modificationDate];
                uint64_t v30 = [v28 compare:v29];

                if (v30 == -1)
                {
                  id v31 = v19;

                  id v17 = v31;
                }
              }
            }
          }
          else
          {
            id v17 = v19;
          }
          v32 = [v19 path];

          if (v32)
          {
            if (v77)
            {
              char v77 = 1;
            }
            else
            {
              uint64_t v33 = [v19 deleteOnAttach];
              char v77 = [v33 BOOLValue];
            }
            v34 = [v19 path];
            uint64_t v35 = [v34 path];
            uint64_t v36 = [v35 length];

            if (v36)
            {
              (*((void (**)(void *, void *))v14 + 2))(v14, v19);
              v37 = [v34 path];
              [v8 addObject:v37];

              v38 = diagextLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                uint64_t v39 = [v19 deleteOnAttach];
                __int16 v40 = [v19 shouldCompress];
                v41 = [v19 modificationDate];
                [v19 filesize];
                v43 = uint64_t v42 = v8;
                *(_DWORD *)buf = 138413314;
                uint64_t v89 = (uint64_t)v19;
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v39;
                __int16 v92 = 2112;
                v93 = v40;
                __int16 v94 = 2112;
                v95 = v41;
                __int16 v96 = 2112;
                v97 = v43;
                _os_log_impl(&dword_209DBA000, v38, OS_LOG_TYPE_INFO, "Adding to archive: %@ (deleteOnAttach:%@, shouldCompress:%@, modificationDate:%@, fileSize:%@)", buf, 0x34u);

                id v8 = v42;
                uint64_t v14 = v73;
              }
            }
            else
            {
              v38 = diagextLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_209DBA000, v38, OS_LOG_TYPE_INFO, "Attachment did not have a path we could successfully determine.", buf, 2u);
              }
            }
          }
        }
        uint64_t v76 = [obj countByEnumeratingWithState:&v81 objects:v98 count:16];
      }
      while (v76);
    }
    else
    {
      char v77 = 0;
    }

    uint64_t v44 = v77 & 1;
    id v7 = v70;
    id v6 = v71;
    id v13 = v68;
    a1 = v69;
  }
  else
  {
    uint64_t v44 = 0;
  }
  if ([v8 count])
  {
    v45 = diagextLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v89 = (uint64_t)v8;
      _os_log_impl(&dword_209DBA000, v45, OS_LOG_TYPE_INFO, "Preparing to create archives with: %@", buf, 0xCu);
    }

    v46 = [*(id *)(a1 + 48) stringByAppendingFormat:@"-%@", *(void *)(a1 + 32)];
    v47 = [*(id *)(a1 + 56) destinationRootDirectory];
    v48 = [v47 stringByAppendingPathComponent:v46];

    v49 = diagextLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = [v8 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v89 = v50;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v48;
      _os_log_impl(&dword_209DBA000, v49, OS_LOG_TYPE_DEFAULT, "Creating archive with %ld files at: %@", buf, 0x16u);
    }

    v51 = [v8 allObjects];
    v52 = +[FileArchiver archiveWithPaths:v51 destinationDir:v48 deleteSource:v44];

    uint64_t v53 = [v52 length];
    v54 = diagextLogHandle();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
    if (v53)
    {
      if (v55)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v89 = (uint64_t)v46;
        _os_log_impl(&dword_209DBA000, v54, OS_LOG_TYPE_DEFAULT, "Archive creation for %@ was successful.", buf, 0xCu);
      }

      v87 = v52;
      v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
      [*(id *)(a1 + 40) setObject:v56 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    else
    {
      if (v55)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v89 = (uint64_t)v46;
        _os_log_impl(&dword_209DBA000, v54, OS_LOG_TYPE_DEFAULT, "Archive creation for %@ failed.", buf, 0xCu);
      }

      [*(id *)(a1 + 40) setObject:MEMORY[0x263EFFA68] forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  v57 = diagextLogHandle();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v59 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v89 = v58;
    __int16 v90 = 2048;
    uint64_t v91 = v59;
    _os_log_impl(&dword_209DBA000, v57, OS_LOG_TYPE_DEFAULT, "Received %ld DE results. (expecting %ld total)", buf, 0x16u);
  }

  unint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  unint64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (v60 >= v61)
  {
    if (*(void *)(a1 + 72))
    {
      v62 = diagextLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        uint64_t v63 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v89 = v63;
        _os_log_impl(&dword_209DBA000, v62, OS_LOG_TYPE_INFO, "Calling reply block with resultDict %@.", buf, 0xCu);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_95;
      block[3] = &unk_263FC2E88;
      v64 = *(NSObject **)(a1 + 64);
      id v80 = *(id *)(a1 + 72);
      id v79 = *(id *)(a1 + 40);
      dispatch_async(v64, block);

      unint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      unint64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
    if (v60 > v61)
    {
      v65 = diagextLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        uint64_t v66 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        uint64_t v67 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 134218240;
        uint64_t v89 = v66;
        __int16 v90 = 2048;
        uint64_t v91 = v67;
        _os_log_impl(&dword_209DBA000, v65, OS_LOG_TYPE_ERROR, "How did we get more than %ld results??? (counted %ld)", buf, 0x16u);
      }
    }
  }
}

void __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v12 = 0;
  v4 = [v3 sandboxExtensionHandleWithErrorOut:&v12];
  id v5 = v12;
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v6 = diagextLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 path];
      id v8 = [v7 path];
      uint64_t v9 = [v5 localizedDescription];
      BOOL v10 = (void *)v9;
      id v11 = @"Unknown";
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Could not consume extension handle for item with path '%@' due to error: %@", buf, 0x16u);
    }
  }
}

uint64_t __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (NSString)destinationRootDirectory
{
  return self->_destinationRootDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRootDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->dateFormatter, 0);
}

@end