@interface PHEditingExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)attemptUndoManagerAutoSetup;
- (NSUndoManager)undoManagerForBarButtons;
- (PUEditingExtensionUndoAdapter)undoAdapter;
- (PUEditingInitialPayload)_initialPayload;
- (id)_contentEditingController;
- (void)_releaseSandboxExtensions;
- (void)beginContentEditingWithCompletionHandler:(id)a3;
- (void)cancelContentEditingWithResponseHandler:(id)a3;
- (void)dealloc;
- (void)finishContentEditing;
- (void)queryHandlingCapabilityForAdjustmentData:(id)a3 withResponseHandler:(id)a4;
- (void)querySDKVersionWithResponseHandler:(id)a3;
- (void)queryShouldShowCancelConfirmationWithResponseHandler:(id)a3;
- (void)setAttemptUndoManagerAutoSetup:(BOOL)a3;
- (void)setHideNavigationController:(BOOL)a3;
- (void)setUndoAdapter:(id)a3;
- (void)setUndoManagerForBarButtons:(id)a3;
- (void)setupUndoProxyWithXPCListenerEndpoint:(id)a3 attemptUndoManagerAutoSetup:(BOOL)a4;
@end

@implementation PHEditingExtensionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManagerForBarButtons, 0);
  objc_storeStrong((id *)&self->_undoAdapter, 0);
  objc_storeStrong((id *)&self->__initialPayload, 0);
  objc_storeStrong((id *)&self->_videoPathSandboxExtensionHandleWrapper, 0);

  objc_storeStrong((id *)&self->_fullSizeImageSandboxExtensionHandleWrapper, 0);
}

- (NSUndoManager)undoManagerForBarButtons
{
  return self->_undoManagerForBarButtons;
}

- (void)setAttemptUndoManagerAutoSetup:(BOOL)a3
{
  self->_attemptUndoManagerAutoSetup = a3;
}

- (BOOL)attemptUndoManagerAutoSetup
{
  return self->_attemptUndoManagerAutoSetup;
}

- (void)setUndoAdapter:(id)a3
{
}

- (PUEditingExtensionUndoAdapter)undoAdapter
{
  return self->_undoAdapter;
}

- (PUEditingInitialPayload)_initialPayload
{
  return (PUEditingInitialPayload *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHideNavigationController:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PHEditingExtensionContext *)self _auxiliaryConnection];
  id v5 = [v4 remoteObjectProxy];

  [v5 setHideNavigationController:v3];
}

- (void)setUndoManagerForBarButtons:(id)a3
{
  objc_storeStrong((id *)&self->_undoManagerForBarButtons, a3);
  id v5 = a3;
  id v6 = [(PHEditingExtensionContext *)self undoAdapter];
  [v6 setUndoManager:v5];
}

- (void)querySDKVersionWithResponseHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t program_sdk_version = dyld_get_program_sdk_version();
  v4[2](v4, program_sdk_version);
}

- (void)cancelContentEditingWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__PHEditingExtensionContext_cancelContentEditingWithResponseHandler___block_invoke;
  v6[3] = &unk_2642C5640;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __69__PHEditingExtensionContext_cancelContentEditingWithResponseHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contentEditingController];
  [v2 cancelContentEditing];

  [*(id *)(a1 + 32) _releaseSandboxExtensions];
  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)finishContentEditing
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PHEditingExtensionContext_finishContentEditing__block_invoke;
  block[3] = &unk_2642C5618;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__PHEditingExtensionContext_finishContentEditing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contentEditingController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__PHEditingExtensionContext_finishContentEditing__block_invoke_2;
  v3[3] = &unk_2642C55F0;
  v3[4] = *(void *)(a1 + 32);
  [v2 finishContentEditingWithCompletionHandler:v3];
}

void __49__PHEditingExtensionContext_finishContentEditing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [*(id *)(a1 + 32) _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxy];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__PHEditingExtensionContext_finishContentEditing__block_invoke_3;
  v9[3] = &unk_2642C55C8;
  id v10 = v3;
  dispatch_semaphore_t v11 = v4;
  id v7 = v4;
  id v8 = v3;
  [v6 commitContentEditingOutput:v8 withCompletionHandler:v9];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __49__PHEditingExtensionContext_finishContentEditing__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_FailedToSaveCo.isa, *(void *)(a1 + 32), a2);
  }
  id v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

- (void)beginContentEditingWithCompletionHandler:(id)a3
{
  id v12 = a3;
  [(PHEditingExtensionContext *)self _releaseSandboxExtensions];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy_;
  v40[4] = __Block_byref_object_dispose_;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy_;
  v38[4] = __Block_byref_object_dispose_;
  id v39 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 1;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3810000000;
  v34[3] = &unk_217C695A3;
  long long v35 = *MEMORY[0x263F01090];
  uint64_t v36 = *(void *)(MEMORY[0x263F01090] + 16);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  id v33 = 0;
  dispatch_semaphore_t v4 = dispatch_group_create();
  id v5 = [(PHEditingExtensionContext *)self inputItems];
  id v6 = [v5 firstObject];

  id v7 = [v6 attachments];
  id v8 = [v7 firstObject];

  dispatch_group_enter(v4);
  uint64_t v9 = PUEditingInitialPayloadTypeIdentifier;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke;
  v22[3] = &unk_2642C5578;
  v25 = v32;
  id v10 = v4;
  v26 = v44;
  v27 = v42;
  v28 = v34;
  v29 = v37;
  v23 = v10;
  v24 = self;
  v30 = v40;
  v31 = v38;
  [v8 loadItemForTypeIdentifier:v9 options:0 completionHandler:v22];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke_2;
  block[3] = &unk_2642C55A0;
  v15 = v40;
  v16 = v38;
  v17 = v34;
  v18 = v44;
  v19 = v37;
  v20 = v42;
  block[4] = self;
  id v14 = v12;
  v21 = v32;
  id v11 = v12;
  dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
}

void __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v8 = objc_alloc(MEMORY[0x263F14DC8]);
    uint64_t v9 = [v5 fullSizeImageURL];
    id v10 = v9;
    if (!v9)
    {
      id v10 = [v5 videoURL];
    }
    uint64_t v11 = [v8 initWithAppropriateURL:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (!v9) {
    id v14 = [v5 adjustmentData];
    }
    v15 = [v5 placeholderImageData];
    uint64_t v16 = DCIM_newPLImageWithData();
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [v5 livePhotoStillDisplayTime];
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    *(_OWORD *)(v19 + 32) = v55;
    *(void *)(v19 + 48) = v56;
    uint64_t v20 = [v5 mediaType];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v5 playbackStyle];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMediaType:v20];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setMediaSubtypes:", objc_msgSend(v5, "mediaSubtypes"));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setPlaybackStyle:", objc_msgSend(v5, "playbackStyle"));
    v21 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v22 = [v5 creationDate];
    [v21 setCreationDate:v22];

    v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v24 = [v5 location];
    [v23 setLocation:v24];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAdjustmentData:v14];
    v25 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v26 = [v5 accessibilityDescription];
    [v25 setAccessibilityDescription:v26];

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setBaseVersion:", objc_msgSend(v5, "adjustmentBaseVersion"));
    uint64_t v27 = [v5 videoURL];
    uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    v30 = [v5 displaySizeImageData];
    if (v30)
    {
      v31 = (void *)DCIM_newPLImageWithData();
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDisplaySizeImage:v31];
    }
    v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v33 = [v5 uniformTypeIdentifier];
    [v32 setUniformTypeIdentifier:v33];

    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      v34 = [v5 videoPathSandboxExtensionToken];
      long long v35 = v34;
      if (!*(void *)(*(void *)(a1 + 40) + 32))
      {
        if ([v34 length])
        {
          v48 = NSNumber;
          id v49 = v35;
          [v49 UTF8String];
          uint64_t v50 = [v48 numberWithLongLong:sandbox_extension_consume()];
          uint64_t v51 = *(void *)(a1 + 40);
          v52 = *(void **)(v51 + 32);
          *(void *)(v51 + 32) = v50;

          if ([*(id *)(*(void *)(a1 + 40) + 32) longLongValue] == -1)
          {
            NSLog(&cfstr_FailedToConsum.isa, v49);
            uint64_t v53 = *(void *)(a1 + 40);
            v54 = *(void **)(v53 + 32);
            *(void *)(v53 + 32) = 0;
          }
        }
      }
    }
    uint64_t v36 = [v5 fullSizeImageURL];
    uint64_t v37 = *(void *)(*(void *)(a1 + 96) + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    id v39 = [v5 fullSizeImageURLSandboxExtensionToken];
    v40 = v39;
    if (!*(void *)(*(void *)(a1 + 40) + 24))
    {
      if ([v39 length])
      {
        id v41 = NSNumber;
        id v42 = v40;
        [v42 UTF8String];
        uint64_t v43 = [v41 numberWithLongLong:sandbox_extension_consume()];
        uint64_t v44 = *(void *)(a1 + 40);
        id v45 = *(void **)(v44 + 24);
        *(void *)(v44 + 24) = v43;

        if ([*(id *)(*(void *)(a1 + 40) + 24) longLongValue] == -1)
        {
          NSLog(&cfstr_FailedToConsum.isa, v42);
          uint64_t v46 = *(void *)(a1 + 40);
          v47 = *(void **)(v46 + 24);
          *(void *)(v46 + 24) = 0;
        }
      }
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setFullSizeImageOrientation:", objc_msgSend(v5, "fullSizeImageExifOrientation"));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 44) & 1) != 0)
  {
    id v3 = (void *)MEMORY[0x263F14E50];
    v11[0] = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v11[1] = v2;
    dispatch_semaphore_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v5 = [v3 livePhotoWithResourceFileURLs:v4 error:0];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLivePhoto:v5];
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 5) {
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setVideoURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setFullSizeImageURL:");
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setVideoURL:");
  }
  id v6 = [*(id *)(a1 + 32) _contentEditingController];
  [v6 startContentEditingWithInput:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) placeholderImage:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];

  if ([*(id *)(a1 + 32) attemptUndoManagerAutoSetup])
  {
    id v7 = [*(id *)(a1 + 32) _contentEditingController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = [v8 undoManager];
    [*(id *)(a1 + 32) setUndoManagerForBarButtons:v9];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setupUndoProxyWithXPCListenerEndpoint:(id)a3 attemptUndoManagerAutoSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v9 = [[PUEditingExtensionUndoProxyExtensionSide alloc] initWithEndpoint:v6];

  id v7 = [[PUEditingExtensionUndoAdapter alloc] initWithButtonHost:v9];
  [(PUEditingExtensionUndoProxyExtensionSide *)v9 setTarget:v7];
  id v8 = [(PHEditingExtensionContext *)self undoManagerForBarButtons];
  [(PUEditingExtensionUndoAdapter *)v7 setUndoManager:v8];

  [(PHEditingExtensionContext *)self setUndoAdapter:v7];
  [(PHEditingExtensionContext *)self setAttemptUndoManagerAutoSetup:v4];
}

- (void)queryShouldShowCancelConfirmationWithResponseHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PHEditingExtensionContext.m", 93, @"Invalid parameter not satisfying: %@", @"responseHandler" object file lineNumber description];
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke;
  block[3] = &unk_2642C5528;
  v15 = v6;
  uint64_t v16 = v17;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v8 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke_2;
  void v11[3] = &unk_2642C5550;
  id v12 = v5;
  v13 = v17;
  id v9 = v5;
  dispatch_group_notify(v7, v8, v11);

  _Block_object_dispose(v17, 8);
}

void __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _contentEditingController];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 shouldShowCancelConfirmation];

  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)queryHandlingCapabilityForAdjustmentData:(id)a3 withResponseHandler:(id)a4
{
  id v11 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PHEditingExtensionContext.m", 86, @"Invalid parameter not satisfying: %@", @"responseHandler" object file lineNumber description];
  }
  id v8 = [(PHEditingExtensionContext *)self _contentEditingController];
  uint64_t v9 = [v8 canHandleAdjustmentData:v11];

  v7[2](v7, v9);
}

- (void)_releaseSandboxExtensions
{
  fullSizeImageSandboxExtensionHandleWrapper = self->_fullSizeImageSandboxExtensionHandleWrapper;
  if (fullSizeImageSandboxExtensionHandleWrapper)
  {
    [(NSNumber *)fullSizeImageSandboxExtensionHandleWrapper longLongValue];
    sandbox_extension_release();
    BOOL v4 = self->_fullSizeImageSandboxExtensionHandleWrapper;
    self->_fullSizeImageSandboxExtensionHandleWrapper = 0;
  }
  videoPathSandboxExtensionHandleWrapper = self->_videoPathSandboxExtensionHandleWrapper;
  if (videoPathSandboxExtensionHandleWrapper)
  {
    [(NSNumber *)videoPathSandboxExtensionHandleWrapper longLongValue];
    sandbox_extension_release();
    id v6 = self->_videoPathSandboxExtensionHandleWrapper;
    self->_videoPathSandboxExtensionHandleWrapper = 0;
  }
}

- (id)_contentEditingController
{
  BOOL v4 = [(PHEditingExtensionContext *)self _principalObject];
  if (([v4 conformsToProtocol:&unk_26C858FC8] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PHEditingExtensionContext.m", 68, @"%@ not conforming to PHContentEditingController", v8 object file lineNumber description];
  }

  return v4;
}

- (void)dealloc
{
  [(PHEditingExtensionContext *)self _releaseSandboxExtensions];
  v3.receiver = self;
  v3.super_class = (Class)PHEditingExtensionContext;
  [(PHEditingExtensionContext *)&v3 dealloc];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1150 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1150, &__block_literal_global_17);
  }
  uint64_t v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

uint64_t __60__PHEditingExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C854AB8];
  _extensionAuxiliaryHostProtocol___interface = v0;

  return MEMORY[0x270F9A758](v0);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1152 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1152, &__block_literal_global_1153);
  }
  uint64_t v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

uint64_t __62__PHEditingExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C852B30];
  _extensionAuxiliaryVendorProtocol___interface = v0;

  return MEMORY[0x270F9A758](v0);
}

@end