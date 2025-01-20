@interface FPDTapToRadarManager
- (FPDTapToRadarManager)init;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 displayReason:(id)a10;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 displayReason:(id)a7;
@end

@implementation FPDTapToRadarManager

- (FPDTapToRadarManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)FPDTapToRadarManager;
  v2 = [(FPDTapToRadarManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.fileprovider.ttr-queue", v3);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 displayReason:(id)a7
{
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 displayReason:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (os_variant_has_internal_content())
  {
    executionQueue = self->_executionQueue;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke;
    v32[3] = &unk_1E6A761A0;
    v33 = v16;
    id v34 = v17;
    id v35 = v18;
    id v36 = v19;
    int64_t v40 = a7;
    id v37 = v20;
    id v38 = v21;
    id v39 = v22;
    dispatch_async(executionQueue, v32);

    v24 = v33;
  }
  else
  {
    v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[FPDTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:displayReason:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
}

void __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke(void *a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  v10 = NSClassFromString(&cfstr_Radardraft.isa);
  v11 = objc_opt_new();

  [v11 setTitle:a1[4]];
  [v11 setProblemDescription:a1[5]];
  [v11 setClassification:2];
  [v11 setReproducibility:6];
  NSClassFromString(&cfstr_Radarcomponent.isa);
  v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[[v12 alloc] initWithName:a1[6] version:a1[7] identifier:a1[11]];
  [v11 setComponent:v13];

  [v11 setAutoDiagnostics:6];
  [v11 setKeywords:a1[8]];
  [v11 setAttachments:a1[9]];
  [v11 setDeleteOnAttach:1];
  v14 = NSClassFromString(&cfstr_Taptoradarserv.isa);
  v15 = [v14 shared];
  [v15 createDraft:v11 forProcessNamed:@"FileProvider" withDisplayReason:a1[10] completionHandler:&__block_literal_global_21];
}

void __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = fp_current_or_default_log();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v2;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] 📡  Tap to radar returned error: (%@)", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke_21_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void).cxx_destruct
{
}

- (void)requestTapToRadarWithTitle:(NSObject *)a1 description:(uint64_t)a2 componentName:(uint64_t)a3 componentVersion:(uint64_t)a4 componentID:(uint64_t)a5 keywords:(uint64_t)a6 attachments:(uint64_t)a7 displayReason:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __141__FPDTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_displayReason___block_invoke_21_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D744C000, a1, a3, "[DEBUG] 📡  Tap to radar returned successfuly", a5, a6, a7, a8, 0);
}

@end