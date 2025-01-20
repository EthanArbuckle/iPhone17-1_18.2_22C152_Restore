@interface FBKDECollector
+ (id)bundleIDsFromAreas:(id)a3;
+ (id)parametersForGatheringExtension:(id)a3 answers:(id)a4 session:(id)a5 givenParameters:(id)a6;
+ (id)parametersFromAnswers:(id)a3;
- (BOOL)alreadyHandledURL;
- (BOOL)hasFilePromises;
- (BOOL)hasUnmetRequirements;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadingBugSession;
- (FBKAttachmentListenerDelegate)listener;
- (FBKDECollector)initWithRequirements:(id)a3 forDevice:(id)a4 filerForm:(id)a5 extensionsFromURL:(id)a6 listener:(id)a7 shouldGetSessionStatus:(BOOL)a8 shouldCheckDeferredLogs:(BOOL)a9 attachmentDescriptors:(id)a10;
- (FBKFilerForm)form;
- (FBKGroupedDevice)device;
- (NSArray)attachmentDescriptors;
- (NSMutableSet)_attachments;
- (NSSet)sessionCapabilities;
- (NSString)bugSessionIdentifier;
- (NSString)description;
- (id)attachmentFromRequirement:(id)a3 withExtension:(id)a4;
- (id)attachmentFromRequirement:(id)a3 withExtension:(id)a4 urlExtension:(id)a5;
- (id)attachments;
- (id)bugSession;
- (id)collectorError;
- (id)gatherFilesForExtension:(id)a3 answers:(id)a4;
- (id)platform;
- (id)processAlreadyCollectedGroups:(id)a3 withRequirements:(id)a4;
- (id)processOngoingDECollections:(id)a3 withRequirements:(id)a4 isDeferred:(BOOL)a5;
- (id)requirements;
- (void)_addAttachment:(id)a3;
- (void)_didCollectGroup:(id)a3 forAttachment:(id)a4;
- (void)_removeAttachment:(id)a3;
- (void)_updateAttachment:(id)a3 withState:(int64_t)a4;
- (void)_updateAttachmentsWithRequirements:(id)a3 alreadyCollectedGroups:(id)a4 alreadyStartedCollections:(id)a5 deferredCollections:(id)a6;
- (void)cancelCollection:(id)a3;
- (void)fetchTextDataOnMatcherPredicates:(id)a3 completion:(id)a4;
- (void)finishInitializationWithCollected:(id)a3 device:(id)a4 error:(id)a5 form:(id)a6 ongoing:(id)a7 deferred:(id)a8 requirements:(id)a9 sessionCapabilities:(id)a10 urlExtensions:(id)a11;
- (void)gatherFilesForAttachment:(id)a3 answers:(id)a4;
- (void)processURLExtensions:(id)a3 withMatcherPredicates:(id)a4;
- (void)removeAllAttachments;
- (void)removeAttachment:(id)a3;
- (void)setAlreadyHandledURL:(BOOL)a3;
- (void)setAttachmentDescriptors:(id)a3;
- (void)setBugSessionIdentifier:(id)a3;
- (void)setForm:(id)a3;
- (void)setListener:(id)a3;
- (void)setLoadingBugSession:(BOOL)a3;
- (void)setSessionCapabilities:(id)a3;
- (void)set_attachments:(id)a3;
- (void)updateRequirements:(id)a3;
@end

@implementation FBKDECollector

- (FBKDECollector)initWithRequirements:(id)a3 forDevice:(id)a4 filerForm:(id)a5 extensionsFromURL:(id)a6 listener:(id)a7 shouldGetSessionStatus:(BOOL)a8 shouldCheckDeferredLogs:(BOOL)a9 attachmentDescriptors:(id)a10
{
  BOOL v31 = a8;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v33 = a6;
  id v34 = a7;
  id v32 = a10;
  v42.receiver = self;
  v42.super_class = (Class)FBKDECollector;
  v18 = [(FBKDECollector *)&v42 init];
  if (v18)
  {
    v19 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = [v17 filerFormID];
      int v21 = [v20 intValue];
      v22 = [v16 publicLogDescription];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v44 = v21;
      *(_WORD *)&v44[4] = 2114;
      *(void *)&v44[6] = v22;
      _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_INFO, "Initializing DE collector for filerForm [%i] device [%{public}@]", buf, 0x12u);
    }
    objc_storeStrong((id *)&v18->_attachmentDescriptors, a10);
    v23 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    [(FBKDECollector *)v18 set_attachments:v23];

    objc_storeStrong((id *)&v18->_device, a4);
    [(FBKDECollector *)v18 setForm:v17];
    [(FBKDECollector *)v18 setLoadingBugSession:1];
    v18->_alreadyHandledURL = 0;
    [(FBKDECollector *)v18 setListener:v34];
    v24 = +[FBKDEDHelper bugSessionIDForForm:v17 device:v16];
    [(FBKDECollector *)v18 setBugSessionIdentifier:v24];

    v25 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v15 valueForKeyPath:@"name"];
      v27 = [v17 filerFormID];
      int v28 = [v27 intValue];
      v29 = [v16 publicLogDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)v44 = v26;
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = v28;
      __int16 v45 = 2114;
      v46 = v29;
      _os_log_impl(&dword_22A36D000, v25, OS_LOG_TYPE_DEFAULT, "init DE collector. Reqs: %{public}@ Form: [%i] Device: [%{public}@] ", buf, 0x1Cu);
    }
    objc_initWeak((id *)buf, v18);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke;
    v35[3] = &unk_2648753A0;
    BOOL v41 = a9;
    objc_copyWeak(&v40, (id *)buf);
    id v36 = v16;
    id v37 = v17;
    id v38 = v15;
    id v39 = v33;
    +[FBKDEDHelper getSessionForForm:v37 device:v36 shouldGetSessionStatus:v31 completion:v35];

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }

  return v18;
}

void __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v12 identifier];
    *(_DWORD *)buf = 138543362;
    id v32 = v17;
    _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "Bug session started for session [%{public}@]", buf, 0xCu);
  }
  if (v12 && *(unsigned char *)(a1 + 72))
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_15;
    v22[3] = &unk_264875378;
    id v23 = v14;
    objc_copyWeak(&v30, (id *)(a1 + 64));
    id v24 = v13;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    id v27 = *(id *)(a1 + 48);
    id v28 = v15;
    id v29 = *(id *)(a1 + 56);
    [v12 getStateWithCompletion:v22];

    objc_destroyWeak(&v30);
    id WeakRetained = v23;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    int v21 = objc_opt_new();
    [WeakRetained finishInitializationWithCollected:v13 device:v20 error:v11 form:v19 ongoing:v14 deferred:v21 requirements:*(void *)(a1 + 48) sessionCapabilities:v15 urlExtensions:*(void *)(a1 + 56)];
  }
}

void __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_15(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_2;
  v8[3] = &unk_264875350;
  v17[1] = a2;
  id v9 = a1[4];
  objc_copyWeak(v17, a1 + 11);
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = v6;
  id v13 = a1[7];
  id v14 = a1[8];
  id v15 = a1[9];
  id v16 = a1[10];
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  objc_destroyWeak(v17);
}

void __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 104) == 3)
  {
    id v5 = (id)objc_opt_new();
    id v2 = *(id *)(a1 + 32);
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    id v2 = (id)objc_opt_new();
  }
  v3 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  [WeakRetained finishInitializationWithCollected:*(void *)(a1 + 40) device:*(void *)(a1 + 48) error:*(void *)(a1 + 56) form:*(void *)(a1 + 64) ongoing:v5 deferred:v3 requirements:*(void *)(a1 + 72) sessionCapabilities:*(void *)(a1 + 80) urlExtensions:*(void *)(a1 + 88)];
}

- (void)finishInitializationWithCollected:(id)a3 device:(id)a4 error:(id)a5 form:(id)a6 ongoing:(id)a7 deferred:(id)a8 requirements:(id)a9 sessionCapabilities:(id)a10 urlExtensions:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke;
  block[3] = &unk_2648753C8;
  block[4] = self;
  id v36 = v23;
  id v37 = v19;
  id v38 = v17;
  id v39 = v22;
  id v40 = v18;
  id v41 = v16;
  id v42 = v20;
  id v43 = v21;
  id v44 = v24;
  id v25 = v24;
  id v26 = v21;
  id v27 = v20;
  id v28 = v16;
  id v29 = v18;
  id v30 = v22;
  id v31 = v17;
  id v32 = v19;
  id v33 = v23;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setSessionCapabilities:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setLoadingBugSession:0];
  id v2 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 48) filerFormID];
    int v4 = [v3 intValue];
    id v5 = [*(id *)(a1 + 56) publicLogDescription];
    int v22 = 67109378;
    int v23 = v4;
    __int16 v24 = 2114;
    id v25 = v5;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "finished getting bug session for filerForm [%i] device [%{public}@]", (uint8_t *)&v22, 0x12u);
  }
  id v6 = [*(id *)(a1 + 32) listener];
  id v7 = [v6 popPendingRequirements];

  v8 = v7;
  if (!v7) {
    v8 = *(void **)(a1 + 64);
  }
  id v9 = v8;
  id v10 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 48) filerFormID];
    int v12 = [v11 intValue];
    id v13 = [*(id *)(a1 + 56) publicLogDescription];
    int v22 = 67109634;
    int v23 = v12;
    __int16 v24 = 2114;
    id v25 = v13;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "finished getting bug session for filerForm [%i] device [%{public}@] with requirements [%{public}@]", (uint8_t *)&v22, 0x1Cu);
  }
  if (*(void *)(a1 + 72))
  {
    id v14 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke_cold_1(a1, (id *)(a1 + 72), v14);
    }

    [*(id *)(a1 + 32) _updateAttachmentsWithRequirements:v9 alreadyCollectedGroups:0 alreadyStartedCollections:0 deferredCollections:0];
  }
  else
  {
    if ([*(id *)(a1 + 80) count])
    {
      id v15 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 80)];
    }
    else
    {
      id v15 = 0;
    }
    if ([*(id *)(a1 + 88) count])
    {
      id v16 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 88)];
    }
    else
    {
      id v16 = 0;
    }
    if ([*(id *)(a1 + 96) count])
    {
      id v17 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 96)];
    }
    else
    {
      id v17 = 0;
    }
    [*(id *)(a1 + 32) _updateAttachmentsWithRequirements:v9 alreadyCollectedGroups:v15 alreadyStartedCollections:v16 deferredCollections:v17];
    uint64_t v18 = *(void *)(a1 + 104);
    if (v18) {
      [*(id *)(a1 + 32) processURLExtensions:v18 withMatcherPredicates:v9];
    }
  }
  id v19 = [*(id *)(a1 + 32) listener];
  id v20 = *(void **)(a1 + 32);
  id v21 = [v20 attachments];
  [v19 attachmentProvider:v20 didFinishLoadingWithAttachments:v21 error:*(void *)(a1 + 72)];
}

- (id)gatherFilesForExtension:(id)a3 answers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FBKDECollector gatherFilesForExtension:answers:](v8);
  }

  id v9 = [FBKAttachment alloc];
  id v10 = [(FBKDECollector *)self identifier];
  id v11 = [(FBKDECollector *)self device];
  int v12 = [v11 identifier];
  id v13 = [(FBKAttachment *)v9 initWithCollectorIdentifier:v10 deviceUUID:v12];

  [(FBKAttachment *)v13 setExtension:v7];
  [(FBKAttachment *)v13 setAttachmentType:5];
  id v14 = [(FBKDECollector *)self attachmentDescriptors];
  id v15 = +[FBKAttachment descriptorForAttachment:v13 given:v14];
  id v16 = [v15 localizedDescription];
  [(FBKAttachment *)v13 setLocalizedAttachmentInfo:v16];

  [(FBKDECollector *)self _addAttachment:v13];
  [(FBKDECollector *)self gatherFilesForAttachment:v13 answers:v6];

  return v13;
}

- (id)bugSession
{
  v3 = [MEMORY[0x263F3A150] sharedInstance];
  int v4 = [(FBKDECollector *)self bugSessionIdentifier];
  id v5 = [v3 sessionForIdentifier:v4];

  return v5;
}

- (void)gatherFilesForAttachment:(id)a3 answers:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 extension];
  BOOL v9 = v8 == 0;

  id v10 = +[FBKLog attachHandle];
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBKDECollector gatherFilesForAttachment:answers:](v6);
    }

    [(FBKDECollector *)self _updateAttachment:v6 withState:5];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v6 displayName];
      id v13 = [(FBKDECollector *)self bugSession];
      id v14 = [v13 identifier];
      *(_DWORD *)buf = 138543618;
      id v38 = v12;
      __int16 v39 = 2114;
      id v40 = v14;
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "Gathering attachment [%{public}@] for [%{public}@]", buf, 0x16u);
    }
    [(FBKDECollector *)self _updateAttachment:v6 withState:1];
    if (v7)
    {
      uint64_t v15 = [v7 mutableCopy];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v16 = (void *)v15;
    id v17 = [(FBKDECollector *)self form];
    if (v17)
    {
      uint64_t v18 = [(FBKDECollector *)self form];
      BOOL v19 = [v18 filerFormType] == 0;

      if (v19)
      {
        id v20 = [(FBKDECollector *)self form];
        id v21 = [v20 answersDictionary];
        int v22 = [v21 objectForKeyedSubscript:@":de_parameter"];

        if (v22) {
          [v16 setObject:v22 forKeyedSubscript:@":de_parameter"];
        }
      }
    }
    int v23 = objc_opt_class();
    __int16 v24 = [v6 extension];
    id v25 = [(FBKDECollector *)self bugSession];
    __int16 v26 = [v6 urlExtension];
    id v27 = [v26 parameters];
    uint64_t v28 = [v23 parametersForGatheringExtension:v24 answers:v16 session:v25 givenParameters:v27];

    objc_initWeak(&location, self);
    id v29 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v6 extension];
      *(_DWORD *)buf = 138543618;
      id v38 = v30;
      __int16 v39 = 2114;
      id v40 = v28;
      _os_log_impl(&dword_22A36D000, v29, OS_LOG_TYPE_DEFAULT, "Gathering DE [%{public}@] with parameters [%{public}@]", buf, 0x16u);
    }
    id v31 = [(FBKDECollector *)self bugSession];
    id v32 = [v6 extension];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __51__FBKDECollector_gatherFilesForAttachment_answers___block_invoke;
    v33[3] = &unk_2648753F0;
    objc_copyWeak(&v35, &location);
    id v34 = v6;
    [v31 startDiagnosticExtension:v32 parameters:v28 completion:v33];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

void __51__FBKDECollector_gatherFilesForAttachment_answers___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didCollectGroup:v4 forAttachment:*(void *)(a1 + 32)];
}

+ (id)parametersForGatheringExtension:(id)a3 answers:(id)a4 session:(id)a5 givenParameters:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = [a1 parametersFromAnswers:v11];
    uint64_t v15 = (void *)[v14 mutableCopy];
  }
  else
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  }
  id v16 = [MEMORY[0x263F3A138] DEDExtensionHostAppKey];
  [v15 setObject:@"Feedback Assistant" forKeyedSubscript:v16];

  id v17 = [MEMORY[0x263F3A138] DEDAddEmptyFile];
  [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v17];

  if (v13)
  {
    [v15 addEntriesFromDictionary:v13];
  }
  else
  {
    uint64_t v18 = [v10 identifier];
    int v19 = [v18 isEqualToString:@"com.apple.DiagnosticExtensions.sysdiagnose"];

    if (v19)
    {
      id v20 = [v12 deviceIdentifier];

      if (v20)
      {
        id v21 = [v12 deviceIdentifier];
        int v22 = +[FBKGroupedDevice currentGroupedDevice];
        int v23 = [v22 identifier];
        uint64_t v24 = [v21 isEqualToString:v23] ^ 1;

        id v25 = [NSNumber numberWithBool:v24];
        [v15 setObject:v25 forKeyedSubscript:@"shouldCreateTarBall"];

        __int16 v26 = +[FBKLog attachHandle];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v30[0] = 67109120;
          v30[1] = v24;
          _os_log_impl(&dword_22A36D000, v26, OS_LOG_TYPE_INFO, "sysdiagnose shouldCreateTarBall [%i]", (uint8_t *)v30, 8u);
        }

        [v15 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisplayTarBall"];
      }
      else
      {
        id v27 = +[FBKLog attachHandle];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          +[FBKDECollector parametersForGatheringExtension:answers:session:givenParameters:](v27);
        }
      }
    }
  }
  uint64_t v28 = [NSDictionary dictionaryWithDictionary:v15];

  return v28;
}

- (id)requirements
{
  id v2 = [(FBKDECollector *)self _attachments];
  v3 = objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_20);

  return v3;
}

uint64_t __30__FBKDECollector_requirements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requirement];
}

- (void)updateRequirements:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(FBKDECollector *)self loadingBugSession])
  {
    id v5 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "update requirements came in while loading session on [%{public}@] will defer update", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [(FBKDECollector *)self _updateAttachmentsWithRequirements:v4 alreadyCollectedGroups:0 alreadyStartedCollections:0 deferredCollections:0];
  }
}

- (BOOL)hasFilePromises
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(FBKDECollector *)self _attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 hasFiles] & 1) != 0 || (objc_msgSend(v7, "isCollecting"))
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)hasUnmetRequirements
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(FBKDECollector *)self _attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v6 state] != 8)
        {
          int v7 = ([v6 hasFiles] & 1) != 0 ? 1 : objc_msgSend(v6, "isCollecting");
          uint64_t v8 = [v6 requirement];
          if (v8)
          {
            BOOL v9 = (void *)v8;
            long long v10 = [v6 requirement];
            int v11 = [v10 isAdditional] | v7;

            if (v11 != 1)
            {
              LOBYTE(v3) = 1;
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v3;
}

- (void)removeAllAttachments
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(FBKDECollector *)self attachments];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(FBKDECollector *)self removeAttachment:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)cancelCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDECollector *)self _attachments];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [v4 extension];

    if (v7)
    {
      uint64_t v8 = [(FBKDECollector *)self bugSession];
      long long v9 = [v4 extension];
      [v8 cancelDiagnosticExtension:v9];
    }
    else
    {
      uint64_t v8 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FBKDECollector cancelCollection:](v8);
      }
    }

    if ([v4 hasFiles] && objc_msgSend(v4, "hasGroup")) {
      [v4 remove];
    }
    long long v11 = [v4 requirement];
    long long v10 = v11;
    if (v11 && ([v11 isAdditional] & 1) == 0) {
      [(FBKDECollector *)self _updateAttachment:v4 withState:0];
    }
    else {
      [(FBKDECollector *)self _removeAttachment:v4];
    }
  }
  else
  {
    long long v10 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBKDECollector cancelCollection:]();
    }
  }
}

- (void)removeAttachment:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    long long v15 = self;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Will remove [%{public}@] in [%{public}@]", (uint8_t *)&v12, 0x16u);
  }

  int v6 = [(FBKDECollector *)self _attachments];
  int v7 = [v6 containsObject:v4];

  uint64_t v8 = +[FBKLog attachHandle];
  long long v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      long long v15 = self;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "removing [%{public}@] in [%{public}@]", (uint8_t *)&v12, 0x16u);
    }

    [v4 remove];
    long long v10 = [v4 requirement];
    long long v9 = v10;
    if (v10 && ([v10 isAdditional] & 1) == 0)
    {
      [v4 setUrlExtension:0];
      [v4 setState:0];
      long long v11 = [(FBKDECollector *)self listener];
      [v11 attachmentProvider:self didUpdateAttachment:v4];
    }
    else
    {
      [(FBKDECollector *)self _removeAttachment:v4];
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[FBKDECollector removeAttachment:]();
  }
}

- (id)platform
{
  uint64_t v3 = [(FBKDECollector *)self device];
  id v4 = [v3 platform];
  if (v4)
  {
    uint64_t v5 = [(FBKDECollector *)self device];
    id v6 = [v5 platform];
  }
  else
  {
    id v6 = (id)*MEMORY[0x263F3A100];
  }

  return v6;
}

- (id)attachments
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(FBKDECollector *)self _attachments];
  id v4 = [v2 setWithSet:v3];

  return v4;
}

- (void)fetchTextDataOnMatcherPredicates:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  uint64_t v8 = [(FBKDECollector *)self sessionCapabilities];
  if (!v8
    || (long long v9 = (void *)v8,
        [(FBKDECollector *)self sessionCapabilities],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v9,
        !v11))
  {
    long long v15 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FBKDECollector fetchTextDataOnMatcherPredicates:completion:](v15);
    }

    goto LABEL_11;
  }
  int v12 = [(FBKDECollector *)self sessionCapabilities];
  char v13 = [v12 containsObject:*MEMORY[0x263F3A0B0]];

  if ((v13 & 1) == 0)
  {
    uint64_t v16 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(FBKDECollector *)self bugSession];
      uint64_t v18 = [v17 identifier];
      int v19 = 138543618;
      id v20 = v18;
      __int16 v21 = 2082;
      int v22 = "-[FBKDECollector fetchTextDataOnMatcherPredicates:completion:]";
      _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "Session [%{public}@] does not have the required capability. Cannot [%{public}s]", (uint8_t *)&v19, 0x16u);
    }
LABEL_11:
    v7[2](v7);
    goto LABEL_12;
  }
  __int16 v14 = [(FBKDECollector *)self bugSession];
  +[FBKDEDHelper fetchTextDataOnMatcherPredicates:v6 fromSession:v14 completion:v7];

LABEL_12:
}

- (void)_addAttachment:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FBKDECollector *)self _attachments];
  [v5 addObject:v4];

  id v6 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(FBKDECollector *)self bugSessionIdentifier];
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2114;
    int v12 = v7;
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "DE Collector did add attachment [%{public}@] for collector [%{public}@]", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [(FBKDECollector *)self listener];
  [v8 attachmentProvider:self didAddAttachment:v4];
}

- (void)_updateAttachment:(id)a3 withState:(int64_t)a4
{
  id v6 = a3;
  [v6 setState:a4];
  int v7 = [(FBKDECollector *)self _attachments];
  char v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0)
  {
    int v9 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FBKDECollector _updateAttachment:withState:]();
    }
  }
  id v10 = [(FBKDECollector *)self listener];
  [v10 attachmentProvider:self didUpdateAttachment:v6];
}

- (void)_removeAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDECollector *)self _attachments];
  [v5 removeObject:v4];

  id v6 = [(FBKDECollector *)self listener];
  [v6 attachmentProvider:self didRemoveAttachment:v4];
}

- (void)_updateAttachmentsWithRequirements:(id)a3 alreadyCollectedGroups:(id)a4 alreadyStartedCollections:(id)a5 deferredCollections:(id)a6
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10) {
    uint64_t v14 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v10];
  }
  else {
    uint64_t v14 = objc_opt_new();
  }
  long long v15 = (void *)v14;
  if (v12)
  {
    uint64_t v16 = [(FBKDECollector *)self processOngoingDECollections:v12 withRequirements:v14 isDeferred:0];

    long long v15 = (void *)v16;
  }
  if (v13)
  {
    uint64_t v17 = [(FBKDECollector *)self processOngoingDECollections:v13 withRequirements:v15 isDeferred:1];

    long long v15 = (void *)v17;
  }
  v67 = v10;
  v65 = v12;
  v66 = v11;
  v64 = v13;
  if (v11)
  {
    uint64_t v18 = [(FBKDECollector *)self processAlreadyCollectedGroups:v11 withRequirements:v15];

    long long v15 = (void *)v18;
  }
  int v19 = [v15 allObjects];
  id v20 = (void *)[v19 mutableCopy];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  __int16 v21 = [(FBKDECollector *)self _attachments];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v83 != v24) {
          objc_enumerationMutation(v21);
        }
        __int16 v26 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        id v27 = [v26 requirement];
        int v28 = [v20 containsObject:v27];

        if (v28)
        {
          id v29 = [v26 requirement];
          [v20 removeObject:v29];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v23);
  }

  id v30 = [(FBKDECollector *)self _attachments];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __122__FBKDECollector__updateAttachmentsWithRequirements_alreadyCollectedGroups_alreadyStartedCollections_deferredCollections___block_invoke;
  v80[3] = &unk_264875278;
  id v63 = v15;
  id v81 = v63;
  uint64_t v31 = objc_msgSend(v30, "ded_selectItemsPassingTest:", v80);

  v62 = [(FBKDECollector *)self bugSession];
  if (v62)
  {
    v61 = v31;
    id v32 = [(FBKDECollector *)self bugSession];
    id v33 = [v32 knownExtensions];

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v34 = v20;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v76 objects:v90 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v77 != v37) {
            objc_enumerationMutation(v34);
          }
          __int16 v39 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          id v40 = [v39 deBundleIdentifier];
          uint64_t v41 = [v33 objectForKeyedSubscript:v40];

          if (v41)
          {
            id v42 = [(FBKDECollector *)self attachmentFromRequirement:v39 withExtension:v41];
            if (v42) {
              [(FBKDECollector *)self _addAttachment:v42];
            }
          }
          else
          {
            id v42 = +[FBKLog attachHandle];
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              id v43 = [v39 name];
              *(_DWORD *)buf = 138543362;
              v89 = v43;
              _os_log_impl(&dword_22A36D000, v42, OS_LOG_TYPE_INFO, "requirements updated, no extension found for requirement [%{public}@]", buf, 0xCu);
            }
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v76 objects:v90 count:16];
      }
      while (v36);
    }

    uint64_t v31 = v61;
  }
  else
  {
    id v33 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v33, OS_LOG_TYPE_DEFAULT, "requirements updated, no bug session found. Did not build Attachments", buf, 2u);
    }
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v44 = v31;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v73 != v47) {
          objc_enumerationMutation(v44);
        }
        [(FBKDECollector *)self _removeAttachment:*(void *)(*((void *)&v72 + 1) + 8 * k)];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v72 objects:v87 count:16];
    }
    while (v46);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v49 = [(FBKDECollector *)self _attachments];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v68 objects:v86 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v51; ++m)
      {
        if (*(void *)v69 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = *(void **)(*((void *)&v68 + 1) + 8 * m);
        uint64_t v55 = [v54 requirement];
        if (v55)
        {
          v56 = (void *)v55;
          v57 = [v54 requirement];
          char v58 = [v67 containsObject:v57];

          if ((v58 & 1) == 0)
          {
            v59 = +[FBKLog attachHandle];
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = [v54 displayName];
              *(_DWORD *)buf = 138543362;
              v89 = v60;
              _os_log_impl(&dword_22A36D000, v59, OS_LOG_TYPE_INFO, "Attachment [%{public}@] is not longer required", buf, 0xCu);
            }
            [v54 setRequirement:0];
          }
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v51);
  }
}

BOOL __122__FBKDECollector__updateAttachmentsWithRequirements_alreadyCollectedGroups_alreadyStartedCollections_deferredCollections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 8 || (objc_msgSend(v3, "isCollecting") & 1) != 0)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 requirement];
    BOOL v4 = ([v5 containsObject:v6] & 1) == 0
      && ([v3 hasFiles] & 1) == 0
      && [v3 attachmentType] == 1;
  }
  return v4;
}

- (id)attachmentFromRequirement:(id)a3 withExtension:(id)a4 urlExtension:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [FBKAttachment alloc];
  id v12 = [(FBKDECollector *)self bugSessionIdentifier];
  id v13 = [(FBKDECollector *)self device];
  uint64_t v14 = [v13 identifier];
  long long v15 = [(FBKAttachment *)v11 initWithRequirement:v10 urlExtension:v9 collectorIdentifier:v12 deviceUUID:v14];

  if ([(FBKAttachment *)v15 attachmentType] == 1)
  {
    [(FBKAttachment *)v15 setExtension:v8];
    uint64_t v16 = [(FBKDECollector *)self attachmentDescriptors];
    uint64_t v17 = +[FBKAttachment descriptorForAttachment:v15 given:v16];
    uint64_t v18 = [v17 localizedDescription];
    [(FBKAttachment *)v15 setLocalizedAttachmentInfo:v18];

    int v19 = [(FBKAttachment *)v15 extension];

    if (!v19)
    {
      [(FBKAttachment *)v15 setState:5];
      id v20 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[FBKDECollector attachmentFromRequirement:withExtension:urlExtension:](v15);
      }
    }
  }
  else if (![(FBKAttachment *)v15 attachmentType])
  {

    long long v15 = 0;
  }
  __int16 v21 = v15;

  return v21;
}

- (id)attachmentFromRequirement:(id)a3 withExtension:(id)a4
{
  return [(FBKDECollector *)self attachmentFromRequirement:a3 withExtension:a4 urlExtension:0];
}

- (id)processOngoingDECollections:(id)a3 withRequirements:(id)a4 isDeferred:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v37 = a4;
  id v34 = (id)[v37 mutableCopy];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v9)
  {
    id v11 = @"ongoing";
    if (v5) {
      id v11 = @"deferred";
    }
    id v32 = v11;
    uint64_t v12 = 8;
    if (!v5) {
      uint64_t v12 = 1;
    }
    uint64_t v35 = v12;
    uint64_t v36 = *(void *)v43;
    *(void *)&long long v10 = 138543618;
    long long v31 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v15 = +[FBKLog attachHandle];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v14 identifier];
          *(_DWORD *)buf = v31;
          uint64_t v47 = v32;
          __int16 v48 = 2114;
          v49 = v16;
          _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "will create attachment for [%{public}@] collection [%{public}@]", buf, 0x16u);
        }
        uint64_t v17 = [FBKAttachment alloc];
        uint64_t v18 = [(FBKDECollector *)self bugSessionIdentifier];
        int v19 = [(FBKDECollector *)self device];
        id v20 = [v19 identifier];
        __int16 v21 = [(FBKAttachment *)v17 initWithCollectorIdentifier:v18 deviceUUID:v20];

        [(FBKAttachment *)v21 setExtension:v14];
        [(FBKAttachment *)v21 setAttachmentType:1];
        [(FBKAttachment *)v21 setState:v35];
        uint64_t v22 = [(FBKDECollector *)self attachmentDescriptors];
        uint64_t v23 = +[FBKAttachment descriptorForAttachment:v21 given:v22];
        uint64_t v24 = [v23 localizedDescription];
        [(FBKAttachment *)v21 setLocalizedAttachmentInfo:v24];

        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke;
        v41[3] = &unk_264875418;
        v41[4] = v14;
        id v25 = [v37 objectsPassingTest:v41];
        __int16 v26 = [v25 anyObject];

        if (v26)
        {
          [(FBKAttachment *)v21 setRequirement:v26];
          [v34 removeObject:v26];
        }
        [(FBKDECollector *)self _addAttachment:v21];
        id v27 = objc_initWeak((id *)buf, self);
        int v28 = [(FBKDECollector *)self bugSession];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_2;
        v38[3] = &unk_2648753F0;
        objc_copyWeak(&v40, (id *)buf);
        id v29 = v21;
        __int16 v39 = v29;
        [v28 attachCompletionHandlerForOngoingOperation:v14 handler:v38];

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v9);
  }

  return v34;
}

uint64_t __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 deBundleIdentifier];
  BOOL v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_3;
  block[3] = &unk_264875440;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didCollectGroup:*(void *)(a1 + 32) forAttachment:*(void *)(a1 + 40)];
}

- (id)processAlreadyCollectedGroups:(id)a3 withRequirements:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v31 = a4;
  id v7 = (void *)[v31 mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v12 = +[FBKLog attachHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v11 rootURL];
          *(_DWORD *)buf = 138543362;
          uint64_t v41 = v13;
          _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "will create attachment for already collected group [%{public}@]", buf, 0xCu);
        }
        uint64_t v14 = [FBKAttachment alloc];
        long long v15 = [(FBKDECollector *)self bugSessionIdentifier];
        uint64_t v16 = [(FBKDECollector *)self device];
        uint64_t v17 = [v16 identifier];
        uint64_t v18 = [(FBKAttachment *)v14 initWithCollectorIdentifier:v15 deviceUUID:v17];

        [(FBKAttachment *)v18 setGroup:v11];
        [(FBKAttachment *)v18 setAttachmentType:1];
        [(FBKAttachment *)v18 setState:2];
        int v19 = [(FBKDECollector *)self bugSession];
        id v20 = [v19 knownExtensions];
        __int16 v21 = [v11 extensionID];
        uint64_t v22 = [v20 objectForKeyedSubscript:v21];
        [(FBKAttachment *)v18 setExtension:v22];

        uint64_t v23 = [(FBKDECollector *)self attachmentDescriptors];
        uint64_t v24 = +[FBKAttachment descriptorForAttachment:v18 given:v23];
        id v25 = [v24 localizedDescription];
        [(FBKAttachment *)v18 setLocalizedAttachmentInfo:v25];

        __int16 v26 = [(FBKAttachment *)v18 extension];

        if (v26)
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __65__FBKDECollector_processAlreadyCollectedGroups_withRequirements___block_invoke;
          v34[3] = &unk_264875418;
          id v27 = v18;
          uint64_t v35 = v27;
          int v28 = [v7 objectsPassingTest:v34];
          id v29 = [v28 anyObject];

          if (v29)
          {
            [(FBKAttachment *)v27 setRequirement:v29];
            [v7 removeObject:v29];
          }
        }
        [(FBKDECollector *)self _addAttachment:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  return v31;
}

uint64_t __65__FBKDECollector_processAlreadyCollectedGroups_withRequirements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 deBundleIdentifier];
  id v4 = [*(id *)(a1 + 32) extension];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)processURLExtensions:(id)a3 withMatcherPredicates:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __61__FBKDECollector_processURLExtensions_withMatcherPredicates___block_invoke;
  v40[3] = &unk_264875468;
  id v26 = v6;
  id v41 = v26;
  objc_msgSend(a3, "ded_selectItemsPassingTest:", v40);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v37;
    id v29 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v7;
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v9 = [(FBKDECollector *)self _attachments];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v33 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              long long v15 = [v8 extensionIdentifier];
              uint64_t v16 = [v14 extension];
              uint64_t v17 = [v16 identifier];
              int v18 = [v15 isEqualToString:v17];

              if (v18)
              {
                [v14 setUrlExtension:v8];
                self = v29;
                goto LABEL_18;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        self = v29;
        int v19 = [(FBKDECollector *)v29 bugSession];

        if (v19)
        {
          id v20 = [(FBKDECollector *)v29 bugSession];
          __int16 v21 = [v20 knownExtensions];
          uint64_t v22 = [v8 extensionIdentifier];
          uint64_t v9 = [v21 objectForKey:v22];

          uint64_t v23 = [(FBKDECollector *)v29 attachmentFromRequirement:0 withExtension:v9 urlExtension:v8];
          if (v23)
          {
            [(FBKDECollector *)v29 _addAttachment:v23];
          }
          else
          {
            id v25 = +[FBKLog attachHandle];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[FBKDECollector processURLExtensions:withMatcherPredicates:]((uint64_t)v43, (uint64_t)v8);
            }
          }
          uint64_t v24 = v31;
        }
        else
        {
          uint64_t v9 = +[FBKLog attachHandle];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[FBKDECollector processURLExtensions:withMatcherPredicates:]((uint64_t)v42, (uint64_t)v29);
          }
LABEL_18:
          uint64_t v24 = v31;
        }

        uint64_t v7 = v24 + 1;
      }
      while (v7 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v30);
  }
}

uint64_t __61__FBKDECollector_processURLExtensions_withMatcherPredicates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "deBundleIdentifier", (void)v14);
        uint64_t v10 = [v3 extensionIdentifier];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          uint64_t v12 = [v8 name];
          [v3 setName:v12];

          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_didCollectGroup:(id)a3 forAttachment:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 displayName];
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v9;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "collected: %{public}@", buf, 0xCu);
  }
  uint64_t v10 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [v7 extension];
    uint64_t v12 = [v11 identifier];
    id v13 = [v6 attachmentItems];
    uint64_t v14 = [v13 count];
    *(_DWORD *)buf = 138544130;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    id v24 = v6;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    __int16 v27 = 2114;
    uint64_t v28 = self;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Collected DE [%{public}@] with group [%{public}@] item count [%lu] from [%{public}@]", buf, 0x2Au);
  }
  long long v15 = [(FBKDECollector *)self attachments];
  char v16 = [v15 containsObject:v7];

  if (v16)
  {
    [v7 setGroup:v6];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __49__FBKDECollector__didCollectGroup_forAttachment___block_invoke;
    v19[3] = &unk_264874270;
    v19[4] = self;
    id v20 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v19);
  }
  else
  {
    long long v17 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = [v7 shortDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v18;
      _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "[%{public}@] does not belong to DE Collector. Ignoring collected Attachment Group", buf, 0xCu);
    }
  }
}

uint64_t __49__FBKDECollector__didCollectGroup_forAttachment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAttachment:*(void *)(a1 + 40) withState:2];
}

+ (id)parametersFromAnswers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [v4 objectForKey:@":area"];

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:@":area"];
    uint64_t v8 = [a1 bundleIDsFromAreas:v7];
    uint64_t v9 = [MEMORY[0x263F3A138] DEDExtensionAttachmentsParamBundleIDKey];
    [v5 setObject:v8 forKeyedSubscript:v9];
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@":de_parameter"];

  if (v10)
  {
    int v11 = [v4 objectForKeyedSubscript:@":de_parameter"];
    [v5 setObject:v11 forKeyedSubscript:@":de_parameter"];
  }

  return v5;
}

+ (id)bundleIDsFromAreas:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!bundleIDsFromAreas__map)
  {
    bundleIDsFromAreas__map = (uint64_t)&unk_26DE1EA88;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "componentsSeparatedByString:", @":", (void)v15);
        if ((unint64_t)[v10 count] >= 2)
        {
          int v11 = [v10 objectAtIndexedSubscript:1];
          uint64_t v12 = [(id)bundleIDsFromAreas__map objectForKey:v11];

          if (v12)
          {
            id v13 = [(id)bundleIDsFromAreas__map objectForKeyedSubscript:v11];

            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = v4;
LABEL_15:

  return v13;
}

- (id)collectorError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.appleseed.FeedbackAssistant.collector" code:-1 userInfo:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(FBKDECollector *)self identifier];
    uint64_t v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)FBKDECollector;
  id v3 = [(FBKDECollector *)&v11 description];
  id v4 = [(FBKDECollector *)self form];
  id v5 = [v4 filerFormID];
  uint64_t v6 = [v5 intValue];
  char v7 = [(FBKDECollector *)self device];
  uint64_t v8 = [v7 publicLogDescription];
  uint64_t v9 = [v3 stringByAppendingFormat:@"%d - %@", v6, v8];

  return (NSString *)v9;
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (NSArray)attachmentDescriptors
{
  return self->_attachmentDescriptors;
}

- (void)setAttachmentDescriptors:(id)a3
{
}

- (NSString)bugSessionIdentifier
{
  return self->_bugSessionIdentifier;
}

- (void)setBugSessionIdentifier:(id)a3
{
}

- (NSMutableSet)_attachments
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_attachments:(id)a3
{
}

- (FBKFilerForm)form
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_form);

  return (FBKFilerForm *)WeakRetained;
}

- (void)setForm:(id)a3
{
}

- (FBKAttachmentListenerDelegate)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);

  return (FBKAttachmentListenerDelegate *)WeakRetained;
}

- (void)setListener:(id)a3
{
}

- (NSSet)sessionCapabilities
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionCapabilities:(id)a3
{
}

- (BOOL)loadingBugSession
{
  return self->_loadingBugSession;
}

- (void)setLoadingBugSession:(BOOL)a3
{
  self->_loadingBugSession = a3;
}

- (BOOL)alreadyHandledURL
{
  return self->_alreadyHandledURL;
}

- (void)setAlreadyHandledURL:(BOOL)a3
{
  self->_alreadyHandledURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCapabilities, 0);
  objc_destroyWeak((id *)&self->_listener);
  objc_destroyWeak((id *)&self->_form);
  objc_storeStrong((id *)&self->__attachments, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentDescriptors, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

void __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 48) filerFormID];
  int v6 = [v5 intValue];
  char v7 = [*a2 description];
  v8[0] = 67109378;
  v8[1] = v6;
  __int16 v9 = 2114;
  uint64_t v10 = v7;
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "Could not get bug session for form [%i] Error [%{public}@]", (uint8_t *)v8, 0x12u);
}

- (void)gatherFilesForExtension:(os_log_t)log answers:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[FBKDECollector gatherFilesForExtension:answers:]";
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)gatherFilesForAttachment:(void *)a1 answers:.cold.1(void *a1)
{
  int v1 = [a1 displayName];
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "no extension found for attachment %{public}@", v4, v5, v6, v7, 2u);
}

+ (void)parametersForGatheringExtension:(os_log_t)log answers:session:givenParameters:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "bug session has nil device identifier", v1, 2u);
}

- (void)cancelCollection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "cancelling an operation not backed by an extension, this is not supported.", v1, 2u);
}

- (void)cancelCollection:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_22A36D000, v0, v1, "[%{public}@] cannot cancel [%{public}@]: Attachment not found");
}

- (void)removeAttachment:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_22A36D000, v0, v1, "[%{public}@] cannot remove [%{public}@]: Attachment not found");
}

- (void)fetchTextDataOnMatcherPredicates:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  uint64_t v2 = "-[FBKDECollector fetchTextDataOnMatcherPredicates:completion:]";
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "No capabilities found. Cannot [%{public}s]", (uint8_t *)&v1, 0xCu);
}

- (void)_updateAttachment:withState:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_22A36D000, v0, v1, "Tried to update attachment [%{public}@] that does not belong to collector [%{public}@]");
}

- (void)attachmentFromRequirement:(void *)a1 withExtension:urlExtension:.cold.1(void *a1)
{
  os_log_t v1 = [a1 displayName];
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "Can't gather extension for attachment [%{public}@].", v4, v5, v6, v7, 2u);
}

- (void)processURLExtensions:(uint64_t)a1 withMatcherPredicates:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "identifier");
  _DWORD *v3 = 138543362;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_2_1(&dword_22A36D000, v5, v6, "No bug session found while processing URL extensions for collector [%{public}@].");
}

- (void)processURLExtensions:(uint64_t)a1 withMatcherPredicates:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "extensionIdentifier");
  _DWORD *v3 = 138543362;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_2_1(&dword_22A36D000, v5, v6, "Could not create attachment for extension [%{public}@] from URLExtension");
}

@end