@interface CKSocialLayerChatController
+ (id)chatIdentifierForMessageWithGUID:(id)a3;
+ (id)chatItemForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 chatItems:(id)a5;
- (BOOL)_controllerEligibleForSetConversation;
- (CKFullScreenBalloonViewControllerPhone)socialLayerFullScreenBalloonController;
- (CKSocialLayerChatController)initWithConversation:(id)a3;
- (NSString)attachmentGUID;
- (NSString)messageGUID;
- (id)selectedChatItems;
- (int64_t)messagePartIndexMatchingAttachementGUID;
- (void)_setConversationDeferredSetup;
- (void)dealloc;
- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4;
- (void)fullScreenBalloonViewController:(id)a3 replyButtonPressedForChatItem:(id)a4;
- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)fullScreenBalloonViewController:(id)a3 willAppearAnimated:(BOOL)a4;
- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3;
- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3;
- (void)prewarmAttachmentChatItemSize;
- (void)scrollToAndHighlightMessage;
- (void)setAttachmentGUID:(id)a3;
- (void)setMessageGUID:(id)a3;
- (void)setSocialLayerFullScreenBalloonController:(id)a3;
- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3;
- (void)showTapBackPicker;
@end

@implementation CKSocialLayerChatController

- (void)dealloc
{
  +[CKApplicationState setMainWindowForegroundActive:0];
  v3.receiver = self;
  v3.super_class = (Class)CKSocialLayerChatController;
  [(CKChatController *)&v3 dealloc];
}

- (CKSocialLayerChatController)initWithConversation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKSocialLayerChatController;
  objc_super v3 = [(CKChatController *)&v5 initWithConversation:a3];
  if (v3) {
    +[CKApplicationState setMainWindowForegroundActive:1];
  }
  return v3;
}

- (BOOL)_controllerEligibleForSetConversation
{
  [(CKCoreChatController *)self calculateTranscriptMarginInsets];
  BOOL v5 = v4 != *(double *)(MEMORY[0x1E4F437F8] + 8);
  if (v6 != *MEMORY[0x1E4F437F8]) {
    BOOL v5 = 1;
  }
  if (v3 != *(double *)(MEMORY[0x1E4F437F8] + 24)) {
    BOOL v5 = 1;
  }
  return v2 != *(double *)(MEMORY[0x1E4F437F8] + 16) || v5;
}

- (void)_setConversationDeferredSetup
{
  v5.receiver = self;
  v5.super_class = (Class)CKSocialLayerChatController;
  [(CKChatController *)&v5 _setConversationDeferredSetup];
  [(CKSocialLayerChatController *)self prewarmAttachmentChatItemSize];
  dispatch_time_t v3 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CKSocialLayerChatController__setConversationDeferredSetup__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __60__CKSocialLayerChatController__setConversationDeferredSetup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scrollToAndHighlightMessage];
}

- (void)setMessageGUID:(id)a3
{
}

- (void)setAttachmentGUID:(id)a3
{
}

+ (id)chatIdentifierForMessageWithGUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = (void *)IMDMessageRecordChatForMessageGUID();
  if (v4)
  {
    objc_super v5 = (void *)IMDChatRecordCopyChatIdentifier();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Couldn't find chat for message identifier: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)chatItemForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 chatItems:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__CKSocialLayerChatController_chatItemForMessageGUID_messagePartIndex_chatItems___block_invoke;
  aBlock[3] = &unk_1E5620D98;
  id v9 = v7;
  id v39 = v9;
  int64_t v40 = a4;
  uint64_t v10 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v11 = v8;
  uint64_t v29 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v29)
  {
    uint64_t v12 = *(void *)v35;
    uint64_t v27 = *(void *)v35;
    id v28 = v9;
    int64_t v26 = a4;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v11);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v14 aggregateChatItems];
        }
        else
        {
          v42 = v14;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        v15 = };
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              if objc_msgSend(v21, "canInlineReply", v26) && (v10[2](v10, v21))
              {
                id v24 = v14;

                v22 = v11;
                id v9 = v28;
                goto LABEL_27;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v41 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v12 = v27;
      }
      id v9 = v28;
      a4 = v26;
      uint64_t v29 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v29);
  }

  v22 = IMLogHandleForCategory();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v23) {
      +[CKSocialLayerChatController chatItemForMessageGUID:messagePartIndex:chatItems:]((uint64_t)v9, v22);
    }
  }
  else if (v23)
  {
    +[CKSocialLayerChatController chatItemForMessageGUID:messagePartIndex:chatItems:]((uint64_t)v9, a4, v22);
  }
  id v24 = 0;
LABEL_27:

  return v24;
}

BOOL __81__CKSocialLayerChatController_chatItemForMessageGUID_messagePartIndex_chatItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_super v5 = [v4 messageItem];
    double v6 = [v5 guid];
    BOOL v7 = [v6 isEqualToString:*(void *)(a1 + 32)]
      && (*(void *)(a1 + 40) == 0x7FFFFFFFFFFFFFFFLL || *(void *)(a1 + 40) == [v4 index]);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)selectedChatItems
{
  double v2 = [(CKCoreChatController *)self collectionViewController];
  id v3 = [v2 selectedChatItems];

  return v3;
}

- (int64_t)messagePartIndexMatchingAttachementGUID
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKSocialLayerChatController *)self attachmentGUID];
  if ([v3 length])
  {
    id v4 = [(CKCoreChatController *)self conversation];
    objc_super v5 = [(CKSocialLayerChatController *)self messageGUID];
    id v16 = v4;
    double v6 = [v4 ensureMessageWithGUIDIsLoaded:v5];
    BOOL v7 = [v6 messageParts];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = [v13 transferGUID];
          if ([v14 isEqualToString:v3]) {
            int64_t v11 = [v13 messagePartIndex];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (void)scrollToAndHighlightMessage
{
  id v3 = [(CKCoreChatController *)self collectionViewController];
  id v4 = [v3 collectionView];
  [v4 reloadData];

  id v7 = [(CKCoreChatController *)self conversation];
  objc_super v5 = [(CKSocialLayerChatController *)self messageGUID];
  double v6 = [v7 ensureMessageWithGUIDIsLoaded:v5];
  [(CKChatController *)self scrollToMessage:v6 atSpecificMessagePartIndex:[(CKSocialLayerChatController *)self messagePartIndexMatchingAttachementGUID] highlight:0 withInlineReplyOverlay:1];
}

- (void)prewarmAttachmentChatItemSize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(CKSocialLayerChatController *)self attachmentGUID];
      int v16 = 138412290;
      long long v17 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "prewarm chat item size for attachment guid: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  objc_super v5 = [(CKSocialLayerChatController *)self messageGUID];
  int64_t v6 = [(CKSocialLayerChatController *)self messagePartIndexMatchingAttachementGUID];
  if ([v5 length])
  {
    id v7 = [(CKCoreChatController *)self collectionViewController];
    uint64_t v8 = [v7 chatItems];

    uint64_t v9 = +[CKSocialLayerChatController chatItemForMessageGUID:v5 messagePartIndex:v6 chatItems:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      int64_t v11 = [v10 mediaObject];
      uint64_t v12 = [v11 forceInlinePreviewGeneration];

      v13 = [v10 mediaObject];
      [v13 setForceInlinePreviewGeneration:1];

      [v10 size];
      v14 = [v10 mediaObject];

      [v14 setForceInlinePreviewGeneration:v12];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Attempting to prewarm a message without a GUID", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)showTapBackPicker
{
  id v7 = [(CKCoreChatController *)self collectionViewController];
  id v3 = [(CKSocialLayerChatController *)self messageGUID];
  int64_t v4 = [(CKSocialLayerChatController *)self messagePartIndexMatchingAttachementGUID];
  objc_super v5 = [v7 chatItems];
  int64_t v6 = +[CKSocialLayerChatController chatItemForMessageGUID:v3 messagePartIndex:v4 chatItems:v5];

  [(CKSocialLayerChatController *)self showFullScreenAcknowledgmentPickerForChatItem:v6];
}

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "showFullScreenAcknowledgmentPickerForChatItem", buf, 2u);
    }
  }
  int64_t v6 = [(CKCoreChatController *)self chat];
  [v6 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B930]];
  [(CKScrollViewController *)self beginHoldingScrollGeometryUpdatesForReason:@"FullscreenBalloonMenuVisible"];
  id v7 = [(CKSocialLayerChatController *)self socialLayerFullScreenBalloonController];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Dismissing fullscreen balloon", v18, 2u);
      }
    }
    [(CKChatController *)self _dismissFullScreenBubbleViewControllerAnimated:1 withSendAnimation:0 completion:0];
  }
  uint64_t v9 = [(CKCoreChatController *)self _fullScreenBalloonViewControllerWithChatItem:v4];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Created fullscreen balloon", v17, 2u);
    }
  }
  [(CKSocialLayerChatController *)self addChildViewController:v9];
  int64_t v11 = [(CKSocialLayerChatController *)self view];
  uint64_t v12 = [v9 view];
  [v11 addSubview:v12];

  v13 = [v9 view];
  v14 = [(CKChatController *)self collectionView];
  [v14 frame];
  objc_msgSend(v13, "setFrame:");

  [v9 didMoveToParentViewController:self];
  [(CKSocialLayerChatController *)self setSocialLayerFullScreenBalloonController:v9];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Setup fullscreen balloon", v16, 2u);
    }
  }
}

- (NSString)attachmentGUID
{
  return self->_attachmentGUID;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (CKFullScreenBalloonViewControllerPhone)socialLayerFullScreenBalloonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_socialLayerFullScreenBalloonController);

  return (CKFullScreenBalloonViewControllerPhone *)WeakRetained;
}

- (void)setSocialLayerFullScreenBalloonController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_socialLayerFullScreenBalloonController);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_attachmentGUID, 0);
}

- (void)fullScreenBalloonViewController:(id)a3 replyButtonPressedForChatItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:replyButtonPressedForChatItem: ", buf, 2u);
    }
  }
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKSocialLayerChatController;
    [(CKChatController *)&v9 showInlineReplyControllerForChatItem:v7 presentKeyboard:1];
  }
  [(CKSocialLayerChatController *)self fullScreenBalloonViewControllerHandleDismissTap:v6];
}

- (void)fullScreenBalloonViewController:(id)a3 willAppearAnimated:(BOOL)a4
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:willAppearAnimated", v6, 2u);
    }
  }
}

- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:didAppearAnimated", buf, 2u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CKSocialLayerChatController;
  [(CKChatController *)&v8 fullScreenBalloonViewController:v6 didAppearAnimated:v4];
}

- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerDidDisappear", buf, 2u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CKSocialLayerChatController;
  [(CKChatController *)&v6 fullScreenBalloonViewControllerDidDisappear:v4];
}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerHandleDismissTap:", buf, 2u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__CKSocialLayerChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke;
  aBlock[3] = &unk_1E5620C40;
  void aBlock[4] = self;
  objc_super v6 = _Block_copy(aBlock);
  id v7 = [(CKSocialLayerChatController *)self socialLayerFullScreenBalloonController];
  [v7 performCancelAnimationWithCompletion:v6];
}

void __120__CKSocialLayerChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) socialLayerFullScreenBalloonController];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) socialLayerFullScreenBalloonController];
    [v3 willMoveToParentViewController:0];

    id v4 = [*(id *)(a1 + 32) socialLayerFullScreenBalloonController];
    objc_super v5 = [v4 view];
    [v5 removeFromSuperview];

    objc_super v6 = [*(id *)(a1 + 32) socialLayerFullScreenBalloonController];
    [v6 didMoveToParentViewController:0];

    [*(id *)(a1 + 32) setSocialLayerFullScreenBalloonController:0];
    id v7 = *(void **)(a1 + 32);
    id v8 = [v7 socialLayerFullScreenBalloonController];
    [v7 removeChildViewController:v8];
  }
}

- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = @"NO";
      *(_DWORD *)int v16 = 138412802;
      *(void *)&v16[4] = v11;
      if (v8) {
        v14 = @"YES";
      }
      *(_WORD *)&v16[12] = 2048;
      *(double *)&v16[14] = a4;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController: %@ verticallyScrollTranscriptByAmount: %.2f animated: %@ completion:", v16, 0x20u);
    }
  }
  v15 = [(CKCoreChatController *)self collectionViewController];
  [v15 verticallyScrollTranscriptByAmount:v8 animated:v12 completion:a4];
}

+ (void)chatItemForMessageGUID:(uint64_t)a1 messagePartIndex:(NSObject *)a2 chatItems:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Could not find chat item matching messageGUID: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)chatItemForMessageGUID:(uint64_t)a1 messagePartIndex:(uint64_t)a2 chatItems:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Could not find chat item matching messageGUID: %@ messagePartIndex: %ld", (uint8_t *)&v3, 0x16u);
}

@end