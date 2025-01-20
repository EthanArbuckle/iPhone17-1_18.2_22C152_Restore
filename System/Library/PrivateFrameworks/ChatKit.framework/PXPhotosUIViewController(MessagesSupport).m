@interface PXPhotosUIViewController(MessagesSupport)
- (id)_assetReferenceForPreviewItem:()MessagesSupport;
- (id)additionalActivitiesTypesForPreviewController:()MessagesSupport;
- (id)chatItemForMediaObject:()MessagesSupport previewController:;
- (id)ck_chatController;
- (id)ck_transitionView;
- (id)excludedActivityTypesForPreviewController:()MessagesSupport;
- (id)previewController:()MessagesSupport transitionViewForPreviewItem:uncroppedSourceFrame:;
- (uint64_t)contextualCKChatItemsForPreviewController:()MessagesSupport;
- (uint64_t)invisibleInkEffectControllerForPreviewController:()MessagesSupport;
- (uint64_t)previewController:()MessagesSupport editingModeForPreviewItem:;
- (uint64_t)previewControllerDidDismiss:()MessagesSupport;
- (uint64_t)shouldHideInteractionOptions;
- (uint64_t)toolbarItemForIdentifier:()MessagesSupport;
- (void)_handleBackButton;
- (void)previewController:()MessagesSupport sendTapback:targetChatItem:isRemoval:;
- (void)previewController:()MessagesSupport shouldShowTapbackAttributionForChatItem:;
- (void)previewController:()MessagesSupport shouldShowTapbackPickerForChatItem:;
- (void)previewControllerIsInGroupConversation:()MessagesSupport;
- (void)previewControllerShouldEnableStickerTapbacks:()MessagesSupport;
- (void)previewControllerWillDismiss:()MessagesSupport;
- (void)replyButtonTappedForMediaObject:()MessagesSupport previewController:;
- (void)sendMessageAcknowledgment:()MessagesSupport chatItem:previewController:;
- (void)setCk_chatController:()MessagesSupport;
- (void)setCk_transitionView:()MessagesSupport;
- (void)shouldShowReplyButtonForMediaObject:()MessagesSupport previewController:;
@end

@implementation PXPhotosUIViewController(MessagesSupport)

- (id)ck_transitionView
{
  return objc_getAssociatedObject(a1, sel_ck_transitionView);
}

- (void)setCk_transitionView:()MessagesSupport
{
  id value = a3;
  objc_msgSend(a1, "ck_transitionView");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != value)
  {
    v5 = objc_msgSend(a1, "ck_transitionView");
    [v5 removeFromSuperview];

    objc_setAssociatedObject(a1, sel_ck_transitionView, value, (void *)1);
  }
}

- (id)ck_chatController
{
  v1 = objc_getAssociatedObject(a1, sel_ck_chatController);
  v2 = [v1 object];

  return v2;
}

- (void)setCk_chatController:()MessagesSupport
{
  if (a3)
  {
    id v4 = a3;
    id value = [[_CKPhotosSupportWeakBox alloc] initWithObject:v4];
  }
  else
  {
    id value = 0;
  }
  objc_setAssociatedObject(a1, sel_ck_chatController, value, (void *)1);
}

- (id)excludedActivityTypesForPreviewController:()MessagesSupport
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 currentPreviewItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 mediaType] & 0xFFFFFFFE) == 2)
  {
    v9[0] = *MEMORY[0x1E4F9F3C8];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Will exclude system UIActivityTypeSaveToCameraRoll from ShareSheet.", v8, 2u);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)additionalActivitiesTypesForPreviewController:()MessagesSupport
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 currentPreviewItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (([v5 mediaType] & 0xFFFFFFFE) == 2)
    {
      v6 = [[CKSaveToPhotosActivity alloc] initWithMediaObject:v5 presenterViewController:v3];
      v14[0] = v6;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 count];
      v10 = &stru_1EDE4CA38;
      if (!v9) {
        v10 = @" NOT";
      }
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Will%@ present additional activities on ShareSheet.", (uint8_t *)&v12, 0xCu);
    }
  }

  return v7;
}

- (uint64_t)shouldHideInteractionOptions
{
  v1 = objc_msgSend(a1, "ck_chatController");
  uint64_t v2 = [v1 shouldHideInteractionOptions];

  return v2;
}

- (id)_assetReferenceForPreviewItem:()MessagesSupport
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [a1 viewModel];
  v6 = [v5 currentDataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [a1 viewModel];
    uint64_t v9 = [v8 currentDataSource];

    v10 = [v9 assetReferenceForMediaObject:v4];
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (void)previewControllerWillDismiss:()MessagesSupport
{
  id v4 = a3;
  id v5 = [a1 viewModel];
  v6 = [v5 currentDataSource];

  v7 = [v4 dataSource];
  uint64_t v8 = [v7 numberOfPreviewItemsInPreviewController:v4];

  if ([v6 numberOfSections] < 1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = [v6 numberOfItemsInSection:0];
  }
  if (v8 == v9)
  {
    uint64_t v10 = [v4 currentPreviewItemIndex];
    v12[0] = [v6 identifier];
    v12[1] = 0;
    v12[2] = v10;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    v11 = [v6 assetReferenceAtItemIndexPath:v12];
    [a1 scrollToRevealAssetReference:v11 completion:&__block_literal_global_466_0];
  }
}

- (uint64_t)previewControllerDidDismiss:()MessagesSupport
{
  uint64_t v2 = [a1 hiddenAssetReferences];

  if (v2) {
    [a1 setHiddenAssetReferences:0 animationType:2];
  }

  return objc_msgSend(a1, "setCk_transitionView:", 0);
}

- (id)previewController:()MessagesSupport transitionViewForPreviewItem:uncroppedSourceFrame:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v32 = 138412290;
      id v33 = v9;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "QuickLook did request preview view for transition to item {%@}.", (uint8_t *)&v32, 0xCu);
    }
  }
  v11 = [a1 gridView];
  int v12 = [v11 rootLayout];
  v13 = [v12 createFenceWithType:2];

  [v13 setTimeout:0.2];
  v14 = [a1 _assetReferenceForPreviewItem:v9];
  if (v14)
  {
    v15 = [a1 regionOfInterestForAssetReference:v14 image:0 shouldSnapshotPlaceholder:0];
  }
  else
  {
    v15 = 0;
  }
  v16 = [v15 placeholderViewFactory];
  if (v16)
  {
    v17 = [v15 placeholderViewFactory];
    v18 = ((void (**)(void, void *))v17)[2](v17, v15);
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(a1, "setCk_transitionView:", v18);
  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v38[0] = v14;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    v21 = (void *)[v19 initWithArray:v20];
    [a1 setHiddenAssetReferences:v21 animationType:2];

    v22 = [a1 view];
    [v15 rectInCoordinateSpace:v22];
    objc_msgSend(v18, "setFrame:");

    v23 = [a1 view];
    [v23 addSubview:v18];

    [v18 bounds];
    *a5 = v24;
    a5[1] = v25;
    a5[2] = v26;
    a5[3] = v27;
  }
  if (IMOSLoggingEnabled())
  {
    v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      int v32 = 138412802;
      id v33 = v30;
      __int16 v34 = 2112;
      v35 = v15;
      __int16 v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "> For an item of type {%@} with a region of interest {%@}, we are returning preview view {%@}.", (uint8_t *)&v32, 0x20u);
    }
  }

  return v18;
}

- (uint64_t)previewController:()MessagesSupport editingModeForPreviewItem:
{
  return 0;
}

- (void)shouldShowReplyButtonForMediaObject:()MessagesSupport previewController:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 chatControllerPreviewDelegate];
  if (v7)
  {
    id v8 = [v6 chatControllerPreviewDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [v6 chatControllerPreviewDelegate];
      v7 = (void *)[v10 shouldShowReplyButtonForMediaObject:v5 previewController:v6];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)replyButtonTappedForMediaObject:()MessagesSupport previewController:
{
  id v17 = a3;
  id v6 = a4;
  v7 = [a1 chatItemForMediaObject:v17 previewController:v6];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      char v9 = [v8 mediaObject];
      uint64_t v10 = [v9 transferGUID];
      v11 = [v17 transferGUID];
      int v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        v13 = [a1 viewModel];
        v14 = [v13 assetActionManager];

        v15 = [v14 chatActionHelper];
        v16 = [v15 inlineReplyControllerForChatItem:v8];

        [v6 presentViewController:v16 animated:1 completion:0];
      }
    }
  }
}

- (id)chatItemForMediaObject:()MessagesSupport previewController:
{
  v1 = objc_msgSend(a1, "_assetReferenceForPreviewItem:");
  uint64_t v2 = [v1 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [v1 asset];
    id v5 = [v4 chatItem];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)previewControllerIsInGroupConversation:()MessagesSupport
{
  id v3 = a3;
  id v4 = [v3 chatControllerPreviewDelegate];
  if (v4)
  {
    id v5 = [v3 chatControllerPreviewDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [v3 chatControllerPreviewDelegate];
      id v4 = (void *)[v7 previewControllerIsInGroupConversation:v3];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)sendMessageAcknowledgment:()MessagesSupport chatItem:previewController:
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = [v7 chatControllerPreviewDelegate];
  if (v8)
  {
    char v9 = (void *)v8;
    uint64_t v10 = [v7 chatControllerPreviewDelegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      int v12 = [v7 chatControllerPreviewDelegate];
      [v12 sendMessageAcknowledgment:a3 chatItem:v13 previewController:v7];

      [v7 updateBarButtonItems];
    }
  }
}

- (void)previewController:()MessagesSupport sendTapback:targetChatItem:isRemoval:
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v16 chatControllerPreviewDelegate];
  if (v11)
  {
    int v12 = (void *)v11;
    id v13 = [v16 chatControllerPreviewDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [v16 chatControllerPreviewDelegate];
      [v15 previewController:v16 sendTapback:v9 targetChatItem:v10 isRemoval:a6];

      [v16 updateBarButtonItems];
    }
  }
}

- (void)previewController:()MessagesSupport shouldShowTapbackAttributionForChatItem:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 chatControllerPreviewDelegate];
  if (v7)
  {
    uint64_t v8 = [v5 chatControllerPreviewDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [v5 chatControllerPreviewDelegate];
      id v7 = (void *)[v10 previewController:v5 shouldShowTapbackAttributionForChatItem:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)previewController:()MessagesSupport shouldShowTapbackPickerForChatItem:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 chatControllerPreviewDelegate];
  if (v7)
  {
    uint64_t v8 = [v5 chatControllerPreviewDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [v5 chatControllerPreviewDelegate];
      id v7 = (void *)[v10 previewController:v5 shouldShowTapbackPickerForChatItem:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)previewControllerShouldEnableStickerTapbacks:()MessagesSupport
{
  id v3 = a3;
  id v4 = [v3 chatControllerPreviewDelegate];
  if (v4)
  {
    id v5 = [v3 chatControllerPreviewDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [v3 chatControllerPreviewDelegate];
      id v4 = (void *)[v7 previewControllerShouldEnableStickerTapbacks:v3];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)invisibleInkEffectControllerForPreviewController:()MessagesSupport
{
  return 0;
}

- (uint64_t)contextualCKChatItemsForPreviewController:()MessagesSupport
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)toolbarItemForIdentifier:()MessagesSupport
{
  return 0;
}

- (void)_handleBackButton
{
  id v2 = [a1 navigationController];
  v1 = [v2 presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

@end