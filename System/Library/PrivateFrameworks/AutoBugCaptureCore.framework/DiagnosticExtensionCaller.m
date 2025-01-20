@interface DiagnosticExtensionCaller
+ (BOOL)getAttachmentsFrom:(id)a3 forBundleID:(id)a4 withParameters:(id)a5 queue:(id)a6 reply:(id)a7;
+ (id)sharedInstance;
- (BOOL)_getAttachmentsFrom:(id)a3 forBundleID:(id)a4 withParameters:(id)a5 queue:(id)a6 reply:(id)a7;
- (DiagnosticExtensionCaller)init;
- (id)_getDEExtensionWithIdentifier:(id)a3;
@end

@implementation DiagnosticExtensionCaller

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DiagnosticExtensionCaller_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred_0 != -1) {
    dispatch_once(&sharedInstance_pred_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

uint64_t __43__DiagnosticExtensionCaller_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (DiagnosticExtensionCaller)init
{
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticExtensionCaller;
  v2 = [(DiagnosticExtensionCaller *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    liveDEs = v2->_liveDEs;
    v2->_liveDEs = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)_getDEExtensionWithIdentifier:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    id v21 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v5 = *MEMORY[0x263F07FE0];
    v22[0] = *MEMORY[0x263F07FF8];
    v22[1] = v5;
    v23[0] = @"com.apple.diagnosticextensions-service";
    v23[1] = v3;
    objc_super v6 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v7 = (void *)MEMORY[0x263F08800];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__DiagnosticExtensionCaller__getDEExtensionWithIdentifier___block_invoke;
    v12[3] = &unk_263FC3720;
    v15 = &v16;
    id v13 = v3;
    v8 = v4;
    v14 = v8;
    [v7 extensionsWithMatchingAttributes:v6 completion:v12];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);
    id v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __59__DiagnosticExtensionCaller__getDEExtensionWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x263F3A088]);
          v15 = objc_msgSend(v14, "initWithNSExtension:", v13, (void)v27);
          [v7 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v10);
    }

    id v16 = (id)[v7 sortedArrayUsingComparator:&__block_literal_global_4];
    if ([v7 count])
    {
      uint64_t v17 = [v7 firstObject];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      if ((unint64_t)[v7 count] < 2)
      {
LABEL_19:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
        goto LABEL_20;
      }
      v20 = diagextLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v7 count];
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v32 = v21;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        v23 = "Found %ld DEs that matched with the identifier %@.";
        v24 = v20;
        uint32_t v25 = 22;
LABEL_17:
        _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
    else
    {
      v20 = diagextLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v26;
        v23 = "Did not find DE that matched with the identifier %@.";
        v24 = v20;
        uint32_t v25 = 12;
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  v7 = diagextLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = (uint64_t)v6;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Error discovering extensions: %@", buf, 0xCu);
  }
LABEL_20:
}

uint64_t __59__DiagnosticExtensionCaller__getDEExtensionWithIdentifier___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 attachmentsName];
  id v6 = [v4 attachmentsName];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (BOOL)_getAttachmentsFrom:(id)a3 forBundleID:(id)a4 withParameters:(id)a5 queue:(id)a6 reply:(id)a7
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v34 = a4;
  id v35 = a5;
  uint64_t v13 = a6;
  id v14 = a7;
  v15 = (void (**)(void, void, void))v14;
  if (v12 && v14)
  {
    id v16 = [(DiagnosticExtensionCaller *)self _getDEExtensionWithIdentifier:v12];
    BOOL v33 = v16 != 0;
    if (v16)
    {
      [(NSMutableArray *)self->_liveDEs addObject:v16];
      uint64_t v32 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v35];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v57 = 0;
      objc_initWeak(&location, v16);
      uint64_t v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v13);
      if (v17)
      {
        dispatch_time_t v18 = dispatch_time(0, 900000000000);
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke;
        handler[3] = &unk_263FC3748;
        objc_copyWeak(&v51, &location);
        v50 = buf;
        id v47 = v12;
        v48 = self;
        v49 = v15;
        dispatch_source_set_event_handler(v17, handler);
        dispatch_resume(v17);

        objc_destroyWeak(&v51);
      }
      else
      {
        uint64_t v22 = diagextLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v53 = 0;
          _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_ERROR, "Failed to create a timer.", v53, 2u);
        }
      }
      qos_class_t v23 = qos_class_self();
      qos_class_t v24 = v23;
      if (v23 <= QOS_CLASS_DEFAULT) {
        dispatch_qos_class_t v25 = QOS_CLASS_DEFAULT;
      }
      else {
        dispatch_qos_class_t v25 = v23;
      }
      if (v23 <= 0x14)
      {
        uint64_t v26 = diagextLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v53 = 67109376;
          *(_DWORD *)v54 = v25;
          *(_WORD *)&v54[4] = 1024;
          *(_DWORD *)&v54[6] = v24;
          _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_INFO, "Enforcing QoS %u over requested QoS %u to ensure timely launch of the diagnostic extension", v53, 0xEu);
        }
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_73;
      block[3] = &unk_263FC37C0;
      v37 = v16;
      id v21 = v32;
      id v38 = v21;
      long long v27 = v17;
      v39 = v27;
      v40 = v13;
      objc_copyWeak(&v45, &location);
      id v28 = v12;
      id v41 = v28;
      v44 = buf;
      v42 = self;
      v43 = v15;
      long long v29 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v25, 0, block);
      long long v30 = diagextLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v53 = 138412546;
        *(void *)v54 = v28;
        *(_WORD *)&v54[8] = 2112;
        id v55 = v21;
        _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_INFO, "Calling DE %@ with parameters: %@", v53, 0x16u);
      }

      v29[2](v29);
      objc_destroyWeak(&v45);

      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v20 = diagextLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_DEFAULT, "DECaller failing to find extension with name: %@", buf, 0xCu);
      }

      id v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
      ((void (**)(void, void, id))v15)[2](v15, 0, v21);
    }
  }
  else
  {
    id v16 = diagextLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = _Block_copy(v15);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "DECaller given a nil name (%@) or nil reply block (%p)", buf, 0x16u);
    }
    BOOL v33 = 0;
  }

  return v33;
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = diagextLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Diagnostic Extension %@ timed out. Moving on.", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);

    if (WeakRetained) {
      [*(id *)(*(void *)(a1 + 40) + 16) removeObject:WeakRetained];
    }
  }
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_73(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_2;
  v6[3] = &unk_263FC3798;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, (id *)(a1 + 96));
  id v9 = *(id *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 80);
  id v4 = (id)v5;
  long long v11 = v5;
  uint64_t v10 = *(void *)(a1 + 72);
  [v2 attachmentsForParameters:v3 andHandler:v6];

  objc_destroyWeak(&v12);
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  if (v4) {
    dispatch_source_cancel(v4);
  }
  long long v5 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_3;
  block[3] = &unk_263FC3770;
  objc_copyWeak(&v14, (id *)(a1 + 80));
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v8;
  long long v13 = v8;
  uint64_t v12 = *(void *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v14);
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = diagextLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    dispatch_qos_class_t v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v5;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Diagnostic Extension %@ returned with attachments: %@", buf, 0x16u);
  }
  dispatch_time_t v18 = WeakRetained;

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v17 = (void *)a1;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      long long v13 = v10;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        id v10 = objc_msgSend(v14, "attachmentType", v17);

        if ([v10 isEqualToString:@"DEAttachmentTypeItem"])
        {
          [v6 addObject:v14];
        }
        else
        {
          v15 = diagextLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            dispatch_qos_class_t v25 = v10;
            _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEFAULT, "Attachment type (%@) is not DEAttachmentTypeItem", buf, 0xCu);
          }
        }
        ++v12;
        long long v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  uint64_t v16 = *(void *)(v17[8] + 8);
  if (!*(unsigned char *)(v16 + 24))
  {
    *(unsigned char *)(v16 + 24) = 1;
    (*(void (**)(void))(v17[7] + 16))();
    if (v18) {
      [*(id *)(v17[6] + 16) removeObject:v18];
    }
  }
}

+ (BOOL)getAttachmentsFrom:(id)a3 forBundleID:(id)a4 withParameters:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = +[DiagnosticExtensionCaller sharedInstance];
  uint64_t v17 = v16;
  if (v16)
  {
    char v18 = [v16 _getAttachmentsFrom:v11 forBundleID:v12 withParameters:v13 queue:v14 reply:v15];
  }
  else
  {
    long long v19 = diagextLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v21 = 0;
      _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "DECaller: Failed to use DiagnosticExtensionCaller", v21, 2u);
    }

    char v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveDEs, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end