@interface CKMediaObjectAssetMenuBuilder
- (CKMediaObjectAssetMenuBuilderDelegate)delegate;
- (id)_copyActionForChatItems:(id)a3;
- (id)_deleteMenuForChatItems:(id)a3;
- (id)_exportActionForChatItems:(id)a3;
- (id)_exportMenuForChatItem:(id)a3;
- (id)_forwardActionForChatItems:(id)a3;
- (id)_forwardAndCopyMenuForChatItems:(id)a3;
- (id)_openActionForChatItems:(id)a3;
- (id)_quickLookActionForChatItems:(id)a3 cursorChatItem:(id)a4;
- (id)_quickLookAndOpenActionsForChatItems:(id)a3 cursorChatItem:(id)a4;
- (id)_quickLookAndOpenMenuForChatItems:(id)a3 cursorChatItem:(id)a4;
- (id)_replyActionForChatItem:(id)a3;
- (id)_tapbackActionForChatItem:(id)a3;
- (id)_tapbackAndReplyMenuForChatItems:(id)a3;
- (id)_tapbackElementsForChatItem:(id)a3;
- (id)contextMenuForChatItems:(id)a3 cursorChatItem:(id)a4 isCMM:(BOOL)a5;
- (void)_copyChatItems:(id)a3;
- (void)_deleteChatItems:(id)a3;
- (void)_forwardChatItems:(id)a3;
- (void)_openFile:(id)a3;
- (void)_openFiles:(id)a3;
- (void)_quickLookChatItem:(id)a3;
- (void)_replyToChatItem:(id)a3;
- (void)_tapbackChatItem:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CKMediaObjectAssetMenuBuilder

- (id)contextMenuForChatItems:(id)a3 cursorChatItem:(id)a4 isCMM:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CKMediaObjectAssetMenuBuilder_contextMenuForChatItems_cursorChatItem_isCMM___block_invoke;
  aBlock[3] = &unk_1E5622290;
  aBlock[4] = &v19;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  v11 = [(CKMediaObjectAssetMenuBuilder *)self _quickLookAndOpenMenuForChatItems:v8 cursorChatItem:v9];
  v10[2](v10, v11);

  v12 = [(CKMediaObjectAssetMenuBuilder *)self _exportMenuForChatItem:v8];
  v10[2](v10, v12);

  if (!a5)
  {
    v13 = [(CKMediaObjectAssetMenuBuilder *)self _tapbackAndReplyMenuForChatItems:v8];
    v10[2](v10, v13);
  }
  v14 = [(CKMediaObjectAssetMenuBuilder *)self _forwardAndCopyMenuForChatItems:v8];
  v10[2](v10, v14);

  if (!a5)
  {
    v15 = [(CKMediaObjectAssetMenuBuilder *)self _deleteMenuForChatItems:v8];
    v10[2](v10, v15);
  }
  if ([(id)v20[5] count])
  {
    v16 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v20[5]];
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v16;
}

uint64_t __78__CKMediaObjectAssetMenuBuilder_contextMenuForChatItems_cursorChatItem_isCMM___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) addObject:a2];
  }
  return result;
}

- (id)_quickLookAndOpenMenuForChatItems:(id)a3 cursorChatItem:(id)a4
{
  v4 = [(CKMediaObjectAssetMenuBuilder *)self _quickLookAndOpenActionsForChatItems:a3 cursorChatItem:a4];
  if ([v4 count])
  {
    v5 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_quickLookAndOpenActionsForChatItems:(id)a3 cursorChatItem:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 array];
  v10 = [(CKMediaObjectAssetMenuBuilder *)self _quickLookActionForChatItems:v8 cursorChatItem:v7];

  v11 = [(CKMediaObjectAssetMenuBuilder *)self _openActionForChatItems:v8];

  if (v10) {
    [v9 addObject:v10];
  }
  if (v11) {
    [v9 addObject:v11];
  }

  return v9;
}

- (id)_quickLookActionForChatItems:(id)a3 cursorChatItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F426E8];
  id v9 = CKFrameworkBundle();
  v10 = [v9 localizedStringForKey:@"QUICK_LOOK_MENU" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CKMediaObjectAssetMenuBuilder__quickLookActionForChatItems_cursorChatItem___block_invoke;
  v14[3] = &unk_1E56210D8;
  objc_copyWeak(&v16, &location);
  id v11 = v7;
  id v15 = v11;
  v12 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __77__CKMediaObjectAssetMenuBuilder__quickLookActionForChatItems_cursorChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _quickLookChatItem:*(void *)(a1 + 32)];
}

- (void)_quickLookChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  [v5 menuBuilder:self quickLookChatItem:v4];
}

- (id)_openActionForChatItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) mediaObject];
        id v11 = [v10 fileURL];
        v12 = [v11 path];

        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    id location = 0;
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4F426E8];
    v14 = CKFrameworkBundle();
    id v15 = [v14 localizedStringForKey:@"OPEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__CKMediaObjectAssetMenuBuilder__openActionForChatItems___block_invoke;
    v18[3] = &unk_1E56210D8;
    objc_copyWeak(&v20, &location);
    id v19 = v5;
    id v16 = [v13 actionWithTitle:v15 image:0 identifier:0 handler:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __57__CKMediaObjectAssetMenuBuilder__openActionForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _openFiles:*(void *)(a1 + 32)];
}

- (void)_openFiles:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(CKMediaObjectAssetMenuBuilder *)self _openFile:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_openFile:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initFileURLWithPath:v4];

  if (v6)
  {
    uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 openURL:v6 configuration:0 completionHandler:0];
  }
}

- (id)_exportMenuForChatItem:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKMediaObjectAssetMenuBuilder *)self _exportActionForChatItems:a3];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F42B80];
    v9[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = [v5 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_exportActionForChatItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 canExport])
        {
          long long v11 = [v10 mediaObject];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    long long v12 = (void *)MEMORY[0x1E4F426E8];
    v13 = CKFrameworkBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"SEARCH_ADD_TO_PHOTOS_LIBRARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke;
    v17[3] = &unk_1E56211C8;
    id v18 = v4;
    id v15 = [v12 actionWithTitle:v14 image:0 identifier:0 handler:v17];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke(uint64_t a1)
{
  v2 = [[CKMediaObjectExportManager alloc] initWithMediaObjects:*(void *)(a1 + 32)];
  [(CKMediaObjectExportManager *)v2 setMetricsSource:*MEMORY[0x1E4F6DB80]];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke_2;
  v3[3] = &unk_1E56211F0;
  id v4 = *(id *)(a1 + 32);
  [(CKMediaObjectExportManager *)v2 exportQueuedMediaObjectsWithCompletion:v3];
}

void __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void **)(a1 + 32);
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Successfully quick saved media objects: %@", (uint8_t *)&v10, 0xCu);
      }
LABEL_9:
    }
  }
  else if (v6)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Error quick saving media objects. error: %@, mediaObjects: %@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_9;
  }
}

- (id)_tapbackAndReplyMenuForChatItems:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1
    && ([(CKMediaObjectAssetMenuBuilder *)self delegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 shouldHideInteractionsForMenuBuilder:self],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v8 = [v4 firstObject];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    int v10 = [(CKMediaObjectAssetMenuBuilder *)self _tapbackElementsForChatItem:v8];
    if (v10) {
      [v9 addObjectsFromArray:v10];
    }
    id v11 = [(CKMediaObjectAssetMenuBuilder *)self _replyActionForChatItem:v8];
    if (v11) {
      [v9 addObject:v11];
    }
    if ([v9 count])
    {
      uint64_t v7 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v9];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_tapbackActionForChatItem:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F426E8];
  char v6 = CKFrameworkBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"TAPBACK_DETAILS_ELLIPSIS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CKMediaObjectAssetMenuBuilder__tapbackActionForChatItem___block_invoke;
  v11[3] = &unk_1E56210D8;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v5 actionWithTitle:v7 image:0 identifier:0 handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __59__CKMediaObjectAssetMenuBuilder__tapbackActionForChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _tapbackChatItem:*(void *)(a1 + 32)];
}

- (id)_tapbackElementsForChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  char v6 = [v5 menuBuilder:self tapbackElementsForChatItem:v4];

  return v6;
}

- (void)_tapbackChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  [v5 menuBuilder:self tapbackChatItem:v4];
}

- (id)_replyActionForChatItem:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F426E8];
  char v6 = CKFrameworkBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"INLINE_REPLY_MENU" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__CKMediaObjectAssetMenuBuilder__replyActionForChatItem___block_invoke;
  v11[3] = &unk_1E56210D8;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v5 actionWithTitle:v7 image:0 identifier:0 handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __57__CKMediaObjectAssetMenuBuilder__replyActionForChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _replyToChatItem:*(void *)(a1 + 32)];
}

- (void)_replyToChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  [v5 menuBuilder:self replyChatItem:v4];
}

- (id)_forwardAndCopyMenuForChatItems:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  char v6 = [(CKMediaObjectAssetMenuBuilder *)self _forwardActionForChatItems:v4];
  if (v6) {
    [v5 addObject:v6];
  }
  id v7 = [(CKMediaObjectAssetMenuBuilder *)self _copyActionForChatItems:v4];
  if (v7) {
    [v5 addObject:v7];
  }
  if ([v5 count])
  {
    id v8 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_forwardActionForChatItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 canForward]) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v11 = (void *)MEMORY[0x1E4F426E8];
    id v12 = CKFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"FORWARD_ELLIPSIS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__CKMediaObjectAssetMenuBuilder__forwardActionForChatItems___block_invoke;
    v16[3] = &unk_1E56210D8;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    uint64_t v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __60__CKMediaObjectAssetMenuBuilder__forwardActionForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _forwardChatItems:*(void *)(a1 + 32)];
}

- (void)_forwardChatItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  [v5 menuBuilder:self forwardChatItems:v4];
}

- (id)_copyActionForChatItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 canCopy]) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v11 = (void *)MEMORY[0x1E4F426E8];
    id v12 = CKFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"COPY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__CKMediaObjectAssetMenuBuilder__copyActionForChatItems___block_invoke;
    v16[3] = &unk_1E56210D8;
    objc_copyWeak(&v18, &location);
    id v17 = v5;
    uint64_t v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __57__CKMediaObjectAssetMenuBuilder__copyActionForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _copyChatItems:*(void *)(a1 + 32)];
}

- (void)_copyChatItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  [v5 menuBuilder:self copyChatItems:v4];
}

- (id)_deleteMenuForChatItems:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F426E8];
  id v6 = CKFrameworkBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"DELETE_ELLIPSIS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CKMediaObjectAssetMenuBuilder__deleteMenuForChatItems___block_invoke;
  v14[3] = &unk_1E56210D8;
  objc_copyWeak(&v16, &location);
  id v8 = v4;
  id v15 = v8;
  uint64_t v9 = [v5 actionWithTitle:v7 image:0 identifier:0 handler:v14];

  int v10 = (void *)MEMORY[0x1E4F42B80];
  v18[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v12 = [v10 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __57__CKMediaObjectAssetMenuBuilder__deleteMenuForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _deleteChatItems:*(void *)(a1 + 32)];
}

- (void)_deleteChatItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetMenuBuilder *)self delegate];
  [v5 menuBuilder:self deleteChatItems:v4];
}

- (CKMediaObjectAssetMenuBuilderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMediaObjectAssetMenuBuilderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end