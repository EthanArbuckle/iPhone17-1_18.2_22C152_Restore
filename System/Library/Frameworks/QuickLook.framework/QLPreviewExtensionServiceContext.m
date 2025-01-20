@interface QLPreviewExtensionServiceContext
@end

@implementation QLPreviewExtensionServiceContext

void __73__QLPreviewExtensionServiceContext_iOS__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9564B8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface_0;
  _extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface_0 = v0;

  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9563E0];
  v3 = (void *)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface;
  _extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface = v2;

  [(id)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface setInterface:_extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface_0 forSelector:sel_presentShareSheetWithPopoverTracker_customSharedURL_dismissCompletion_ argumentIndex:0 ofReply:0];
  v4 = (void *)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface;
  v5 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v4 setClasses:v5 forSelector:sel_forwardMessageToHostOfCustomViewController_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface;
  v7 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v6 setClasses:v7 forSelector:sel_forwardMessageToHostOfCustomViewController_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C955FC8];
  v9 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  _extensionAuxiliaryVendorProtocol___interface_0 = v8;

  v10 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_loadPreviewControllerWithContents_context_completionHandler_ argumentIndex:0 ofReply:0];

  [(id)_extensionAuxiliaryVendorProtocol___interface_0 setInterface:_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface forSelector:sel_setHostViewControllerProxy_ argumentIndex:0 ofReply:0];
  v14 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  [v14 setClasses:v18 forSelector:sel_loadPreviewControllerWithContents_context_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C937418];
  v20 = (void *)_extensionAuxiliaryVendorProtocol___printerInterface_0;
  _extensionAuxiliaryVendorProtocol___printerInterface_0 = v19;

  [(id)_extensionAuxiliaryVendorProtocol___interface_0 setInterface:_extensionAuxiliaryVendorProtocol___printerInterface_0 forSelector:sel_getPrinterProxyWithCompletionHandler_ argumentIndex:0 ofReply:1];
  uint64_t v21 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9691A0];
  v22 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  _extensionAuxiliaryVendorProtocol___arqlInlineInterface = v21;

  v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51);
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface setClasses:v51 forSelector:sel_touchesCancelled_forUUID_ argumentIndex:0 ofReply:0];
  v26 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  v27 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v26 setClasses:v27 forSelector:sel_observeReturnedToInlineForUUID_completion_ argumentIndex:2 ofReply:1];

  v28 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  v29 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v28 setClasses:v29 forSelector:sel_sendARQLEvent_forUUID_completion_ argumentIndex:0 ofReply:0];

  v30 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  v31 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v30 setClasses:v31 forSelector:sel_sendARQLEvent_forUUID_completion_ argumentIndex:0 ofReply:1];

  [(id)_extensionAuxiliaryVendorProtocol___interface_0 setInterface:_extensionAuxiliaryVendorProtocol___arqlInlineInterface forSelector:sel_getARQLInlineProxyWithCompletionHandler_ argumentIndex:0 ofReply:1];
  uint64_t v32 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C971FF0];
  v33 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2;
  _extensionAuxiliaryVendorProtocol___arqlInlineInterface2 = v32;

  uint64_t v34 = MEMORY[0x263EF8708];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2 setXPCType:MEMORY[0x263EF8708] forSelector:sel_updateBounds_forUUID_fenceHandleCompletion_ argumentIndex:1 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2 setXPCType:v34 forSelector:sel_prepareFullscreenPreview_initialFrame_previewOptions_fenceHandleCompletion_ argumentIndex:1 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2 setXPCType:v34 forSelector:sel_observeReturnedToInlineForUUID_fenceHandleCompletion_ argumentIndex:1 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___interface_0 setInterface:_extensionAuxiliaryVendorProtocol___arqlInlineInterface2 forSelector:sel_getARQLInlineProxy2WithCompletionHandler_ argumentIndex:0 ofReply:1];
  uint64_t v35 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C972368];
  v36 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  _extensionAuxiliaryVendorProtocol___arqlInlineInterface3 = v35;

  v37 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v38 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v37 setClasses:v38 forSelector:sel_prepareInlinePreviewWithScopedURLWrapperAttributes_forUUID_completion_ argumentIndex:1 ofReply:1];

  v39 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v40 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v39 setClasses:v40 forSelector:sel_prepareInlinePreviewWithData_forUUID_completion_ argumentIndex:1 ofReply:1];

  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setClasses:v51 forSelector:sel_touchesBegan_forUUID_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setClasses:v51 forSelector:sel_touchesMoved_forUUID_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setClasses:v51 forSelector:sel_touchesEnded_forUUID_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setClasses:v51 forSelector:sel_touchesCancelled_forUUID_ argumentIndex:0 ofReply:0];
  v41 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v42 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v41 setClasses:v42 forSelector:sel_sendARQLEvent_forUUID_completion_ argumentIndex:0 ofReply:0];

  v43 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v44 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v43 setClasses:v44 forSelector:sel_sendARQLEvent_forUUID_completion_ argumentIndex:0 ofReply:1];

  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setXPCType:v34 forSelector:sel_updateBounds_forUUID_fenceHandleCompletion_ argumentIndex:1 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setXPCType:v34 forSelector:sel_prepareFullscreenPreview_initialFrame_previewOptions_fenceHandleCompletion_ argumentIndex:1 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 setXPCType:v34 forSelector:sel_observeReturnedToInlineForUUID_fenceHandleCompletion_ argumentIndex:1 ofReply:1];
  v45 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v46 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v45 setClasses:v46 forSelector:sel_observeReturnedToInlineForUUID_fenceHandleCompletion_ argumentIndex:2 ofReply:1];

  v47 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v48 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v47 setClasses:v48 forSelector:sel_inlinePreview_setRuntimeStateObserver_ argumentIndex:1 ofReply:1];

  v49 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  v50 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v49 setClasses:v50 forSelector:sel_inlinePreview_setCameraYaw_pitch_scale_options_ argumentIndex:4 ofReply:0];

  [(id)_extensionAuxiliaryVendorProtocol___interface_0 setInterface:_extensionAuxiliaryVendorProtocol___arqlInlineInterface3 forSelector:sel_getARQLInlineProxy3WithCompletionHandler_ argumentIndex:0 ofReply:1];
}

uint64_t __71__QLPreviewExtensionServiceContext_iOS__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C956028];
  uint64_t v1 = _extensionAuxiliaryHostProtocol___interface_0;
  _extensionAuxiliaryHostProtocol___interface_0 = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __52__QLPreviewExtensionServiceContext_iOS_protocolHost__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = (NSObject **)MEMORY[0x263F62940];
  v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = [v2 localizedDescription];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Error while calling service: %@ #Remote", (uint8_t *)&v7, 0xCu);
  }
}

void __58__QLPreviewExtensionServiceContext_iOS_previewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewViewController];
  [v2 previewWillAppear:*(unsigned __int8 *)(a1 + 40)];
}

void __57__QLPreviewExtensionServiceContext_iOS_previewDidAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewViewController];
  [v2 previewDidAppear:*(unsigned __int8 *)(a1 + 40)];
}

void __61__QLPreviewExtensionServiceContext_iOS_previewWillDisappear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewViewController];
  [v2 previewWillDisappear:*(unsigned __int8 *)(a1 + 40)];
}

void __60__QLPreviewExtensionServiceContext_iOS_previewDidDisappear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewViewController];
  [v2 previewDidDisappear:*(unsigned __int8 *)(a1 + 40)];
}

void __63__QLPreviewExtensionServiceContext_iOS_setAppearance_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewViewController];
  [v2 setAppearance:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

void __67__QLPreviewExtensionServiceContext_iOS_setHostViewControllerProxy___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewViewController];
  [v2 setHostViewControllerProxy:*(void *)(a1 + 40)];
}

void __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2;
  aBlock[3] = &unk_2642F70F0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  id v16 = v2;
  uint64_t v17 = v3;
  id v18 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [*(id *)(a1 + 40) previewViewController];
    objc_opt_respondsToSelector();

    int v7 = [*(id *)(a1 + 40) previewViewController];
    uint64_t v8 = [*(id *)(a1 + 32) searchableItemUniqueIdentifier];
    uint64_t v9 = [*(id *)(a1 + 32) queryString];
    [v7 preparePreviewOfSearchableItemWithIdentifier:v8 queryString:v9 completionHandler:v5];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v11 = *(void **)(a1 + 40);
    if (isKindOfClass)
    {
      uint64_t v12 = [v11 previewViewController];
      objc_opt_respondsToSelector();

      int v7 = [*(id *)(a1 + 40) previewViewController];
      v13 = [*(id *)(a1 + 32) fileURL];
      [v7 preparePreviewOfFileAtURL:v13 completionHandler:v5];
    }
    else
    {
      v14 = (void *)v11[4];
      v11[4] = 0;

      int v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.QLRemoteItemViewController" code:4 userInfo:0];
      v5[2](v5, v7);
    }
  }
}

void __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v4 = v3;
  QLRunInMainThread();
}

void __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  if (*(void *)(a1 + 32))
  {
    id v3 = (NSObject **)MEMORY[0x263F62940];
    id v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v14 = 138412546;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Error while attempting to load preview from preview item '%@': %@ #Remote", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    int v7 = [*(id *)(a1 + 48) previewViewController];
    uint64_t v8 = [v7 title];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 48) previewViewController];
      v10 = [v9 title];
      [v2 setObject:v10 forKey:@"title"];
    }
    v11 = (void *)MEMORY[0x263F08D40];
    uint64_t v12 = [*(id *)(a1 + 48) previewViewController];
    [v12 preferredContentSize];
    v13 = objc_msgSend(v11, "valueWithCGSize:");
    [v2 setObject:v13 forKey:@"preferredContentSize"];

    [*(id *)(a1 + 48) _startObservingPreviewControllerAttributeChanges];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  switch([v5 replyType])
  {
    case 0:
      [v5 contentSize];
      double v8 = v7;
      double v10 = v9;
      v11 = (void *)[objc_alloc(MEMORY[0x263F62908]) initWithPreview:*(void *)(a1 + 32)];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_2;
      v29[3] = &unk_2642F7118;
      id v30 = v5;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_3;
      v26[3] = &unk_2642F7140;
      id v27 = v30;
      id v28 = *(id *)(a1 + 48);
      objc_msgSend(v11, "drawInContextOfSize:drawingBlock:completionHandler:", v29, v26, v8, v10);

      id v12 = v30;
      goto LABEL_4;
    case 1:
      v11 = (void *)[objc_alloc(MEMORY[0x263F62908]) initWithPreview:*(void *)(a1 + 32)];
      [v5 contentSize];
      double v14 = v13;
      double v16 = v15;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_4;
      v24[3] = &unk_2642F7118;
      id v25 = v5;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_5;
      v21[3] = &unk_2642F7168;
      id v22 = v25;
      id v23 = *(id *)(a1 + 48);
      objc_msgSend(v11, "drawInPDFContextOfSize:drawingBlock:completionHandler:", v24, v21, v14, v16);

      id v12 = v25;
LABEL_4:

      goto LABEL_6;
    case 2:
      v11 = [v5 updateFromDocumentCreationBlock];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_6:

      goto LABEL_9;
    case 4:
      id v17 = (id)[v5 updateFromDataCreationBlock];
      goto LABEL_8;
    default:
LABEL_8:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
      id v18 = *(id *)(a1 + 40);
      uint64_t v19 = (NSObject **)MEMORY[0x263F62940];
      v20 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v20 = *v19;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v18;
        _os_log_impl(&dword_217F61000, v20, OS_LOG_TYPE_DEBUG, "Finished calling generation extension for: %@ #Remote", buf, 0xCu);
      }

      return;
  }
}

uint64_t __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) drawWithContext:a2];
}

void __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  double v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 updateWithImageData:a2 bitmapFormat:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) drawWithContext:a2];
}

void __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 updateWithPDFData:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79__QLPreviewExtensionServiceContext_iOS_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end