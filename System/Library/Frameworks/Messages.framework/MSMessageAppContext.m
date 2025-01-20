@interface MSMessageAppContext
@end

@implementation MSMessageAppContext

uint64_t __67___MSMessageAppContext__requestStickerExtensionMetadataDictionary___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 requestStickerExtensionMetadataDictionary:v4];
  }
  return result;
}

uint64_t __71___MSMessageAppContext__requestPresentationWithStickerType_identifier___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 requestPresentationWithStickerType:v4 identifier:v5];
  }
  return result;
}

void __77___MSMessageAppContext__becomeActiveWithConversationState_presentationState___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"));
    objc_msgSend(*(id *)(a1 + 32), "setPresentationContext:", objc_msgSend(*(id *)(a1 + 40), "presentationContext"));
    id obj = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 48)];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 56) willBecomeActiveWithConversation:obj];
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 56) setActiveConversation:obj];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), obj);
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 56) didBecomeActiveWithConversation:obj];
    }
    v2 = [MEMORY[0x1E4F42738] sharedApplication];
    int v3 = [v2 isPPTAvailable];

    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v5 = [v4 bundleIdentifier];

      v6 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:options:", @".", 4) + 1);
      v7 = [NSString stringWithFormat:@"%@-%@", v6, @"ExtensionLaunch"];
      v8 = [MEMORY[0x1E4F42738] sharedApplication];
      [v8 finishedIPTest:v7 waitForCommit:1 extraResults:0 withTeardownBlock:0];
    }
    v9 = [MEMORY[0x1E4F42738] sharedApplication];
    int v10 = [v9 isRunningTest:@"LiveBubbleLoadingTest"];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F42738] sharedApplication];
      [v11 finishedTest:@"LiveBubbleLoadingTest" waitForCommit:1 extraResults:0];
    }
  }
}

void __37___MSMessageAppContext__resignActive__block_invoke(uint64_t a1)
{
  v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37___MSMessageAppContext__resignActive__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = *(id *)(*(void *)(a1 + 32) + 40);
  if (v10)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) willResignActiveWithConversation:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) setActiveConversation:0];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) didResignActiveWithConversation:v10];
    }
  }
}

void __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke(uint64_t a1)
{
  v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_77;
    v17 = &unk_1E6E988B8;
    id v19 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 48);
    [v11 _validateMessageForSending:v12 conversation:v10 associatedText:v13 completionHandler:&v14];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "_releaseKeepAliveContext", v14, v15, v16, v17);
}

uint64_t __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_77(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

void __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke(uint64_t a1)
{
  v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 40)];
  if (*(void **)(*(void *)(a1 + 32) + 40) != v10)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 48) setActiveConversation:v10];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v10);
  }
}

void __88___MSMessageAppContext__requestContentSizeThatFits_presentationStyle_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) viewController];
  [*(id *)(a1 + 40) CGSizeValue];
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(v3, "contentSizeThatFits:");
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) viewController];
  if (!v10)
  {
    id v10 = [*(id *)(a1 + 32) stickerViewController];
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v10, "willTransitionToPresentationStyle:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"));
  }
}

void __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) viewController];
  if (!v10)
  {
    id v10 = [*(id *)(a1 + 32) stickerViewController];
  }
  objc_msgSend(*(id *)(a1 + 32), "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v10, "didTransitionToPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "presentationStyle"));
  }
}

void __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector()) {
    [v11 _didUpdateMessage:*(void *)(a1 + 48) conversation:v10];
  }
}

void __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector()) {
    [v11 didReceiveMessage:*(void *)(a1 + 48) conversation:v10];
  }
}

void __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector())
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      if (v12) {
        [v11 didStartSendingMessage:v12 conversation:v10];
      }
    }
  }
  [*(id *)(a1 + 32) _releaseKeepAliveContext];
}

void __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) updatedConversationForConversationState:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector())
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      if (v12) {
        [v11 didCancelSendingMessage:v12 conversation:v10];
      }
    }
  }
  [*(id *)(a1 + 32) _releaseKeepAliveContext];
}

void __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke(id *a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [a1[4] viewController];
  if ((objc_opt_respondsToSelector() & 1) != 0 && (a1[5] || a1[6]))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_93;
    block[3] = &unk_1E6E988E0;
    uint64_t v11 = &v21;
    id v21 = v10;
    uint64_t v12 = &v22;
    id v22 = a1[5];
    uint64_t v13 = &v23;
    id v23 = a1[7];
    uint64_t v14 = &v24;
    id v24 = a1[6];
    id v25 = a1[8];
    dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_11:
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (a1[5] || a1[6]))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_2;
    v15[3] = &unk_1E6E98930;
    uint64_t v11 = &v16;
    id v16 = v10;
    uint64_t v12 = &v17;
    id v17 = a1[5];
    uint64_t v13 = &v18;
    id v18 = a1[6];
    uint64_t v14 = &v19;
    id v19 = a1[8];
    dispatch_async(MEMORY[0x1E4F14428], v15);
    goto LABEL_11;
  }
LABEL_12:
  [a1[4] _releaseKeepAliveContext];
}

uint64_t __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_93(uint64_t a1)
{
  return [*(id *)(a1 + 32) willPresentEditingViewWithAssetURL:*(void *)(a1 + 40) sandboxExtension:*(void *)(a1 + 48) recipeData:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) willPresentEditingViewWithAssetURL:*(void *)(a1 + 40) recipeData:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] viewController];
  uint64_t v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 view];
    uint64_t v5 = [v4 window];
    *(_DWORD *)buf = 136315394;
    id v17 = "-[_MSMessageAppContext _requestSnapshotThatFits:completion:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1E4A76000, v3, OS_LOG_TYPE_DEFAULT, "LiveBubble. %s. view in window %@", buf, 0x16u);
  }
  uint64_t v6 = [v2 view];
  uint64_t v7 = [v6 window];

  if (v7)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke_96;
    uint64_t v13 = &unk_1E6E98958;
    id v14 = a1[5];
    id v15 = a1[6];
    uint64_t v8 = _Block_copy(&v10);
    id v9 = a1[5];
    if (v9)
    {
      objc_msgSend(v9, "CGSizeValue", v10, v11, v12, v13, v14);
      objc_msgSend(v2, "generateSnapshotWithContentSize:completion:", v8);
    }
    else
    {
      objc_msgSend(v2, "updateSnapshotWithCompletionBlock:", v8, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) CGSizeValue];
    uint64_t v5 = NSStringFromCGSize(v12);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1E4A76000, v4, OS_LOG_TYPE_DEFAULT, "LiveBubble. Responding to snapshot request that fits %@. image: %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3)
  {
    uint64_t v6 = UIImagePNGRepresentation(v3);
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector()) {
    [v10 _handleTextInputPayload:*(void *)(a1 + 40) withPayloadID:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __61___MSMessageAppContext__didRemoveAssetArchiveWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector())
  {
    [v2 _didRemoveAssetArchiveWithIdentifier:*(void *)(a1 + 40)];
    uint64_t v3 = ms_defaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1E4A76000, v3, OS_LOG_TYPE_DEFAULT, "Called -_didRemoveAssetArchiveWithIdentifier:", v4, 2u);
    }
  }
  [*(id *)(a1 + 32) _releaseKeepAliveContext];
}

void __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_104;
    v11[3] = &unk_1E6E98980;
    id v12 = *(id *)(a1 + 40);
    [v10 _prepareForPresentationWithCompletionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45___MSMessageAppContext__volumeButtonPressed___block_invoke(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45___MSMessageAppContext__volumeButtonPressed___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = [*(id *)(a1 + 32) viewController];
  if (objc_opt_respondsToSelector()) {
    [v10 _volumeButtonPressed:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __37___MSMessageAppContext__resignActive__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45___MSMessageAppContext__volumeButtonPressed___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end