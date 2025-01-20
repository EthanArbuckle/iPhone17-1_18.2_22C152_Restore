@interface CKMediaObjectAssetActionManager
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)shouldHideInteractions;
- (BOOL)supportsActionType:(id)a3;
- (BOOL)supportsContextMenu;
- (CKMediaObjectAssetActionHelper)chatActionHelper;
- (CKMediaObjectAssetActionManager)initWithChatItem:(id)a3 presentedFromInlineReply:(BOOL)a4 chatActionHelper:(id)a5 selectionManager:(id)a6;
- (CKMessagePartChatItem)chatItem;
- (NSMutableDictionary)performerClassByType;
- (SEL)_barButtonSelectorByActionType:(id)a3;
- (UIMenu)actionContextMenu;
- (id)_currentlySelectedChatItemsOutCursorItem:(id *)a3;
- (id)_selectionSnapshotForPerformerClass:(Class)a3;
- (id)actionKeyCommands;
- (id)actionPerformerForActionType:(id)a3;
- (id)barButtonItemForActionType:(id)a3;
- (id)contextMenu;
- (id)contextMenuForChatItems:(id)a3 cursorChatItem:(id)a4 isCMM:(BOOL)a5;
- (id)menuBuilder:(id)a3 tapbackElementsForChatItem:(id)a4;
- (id)previewActionForActionType:(id)a3;
- (void)_handleAddToLibraryBarButtonItem:(id)a3;
- (void)_handleDeleteBarButtonItem:(id)a3;
- (void)_handlePreviewAction:(id)a3 actionType:(id)a4;
- (void)_handleReplyBarButtonItem:(id)a3;
- (void)_keyCommandCopy:(id)a3;
- (void)_keyCommandQuickLook:(id)a3;
- (void)_keyCommandReply:(id)a3;
- (void)_keyCommandSelectAll:(id)a3;
- (void)_keyCommandTapback:(id)a3;
- (void)_runDeleteActionPerformer;
- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4;
- (void)menuBuilder:(id)a3 copyChatItems:(id)a4;
- (void)menuBuilder:(id)a3 forwardChatItems:(id)a4;
- (void)menuBuilder:(id)a3 quickLookChatItem:(id)a4;
- (void)menuBuilder:(id)a3 replyChatItem:(id)a4;
- (void)menuBuilder:(id)a3 tapbackChatItem:(id)a4;
@end

@implementation CKMediaObjectAssetActionManager

- (CKMediaObjectAssetActionManager)initWithChatItem:(id)a3 presentedFromInlineReply:(BOOL)a4 chatActionHelper:(id)a5 selectionManager:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKMediaObjectAssetActionManager;
  v13 = [(PXAssetActionManager *)&v18 initWithSelectionManager:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_chatItem, a3);
    objc_storeWeak((id *)&v14->_chatActionHelper, v12);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    performerClassByType = v14->_performerClassByType;
    v14->_performerClassByType = v15;

    if (!a4)
    {
      [(NSMutableDictionary *)v14->_performerClassByType setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F90D60]];
      [(NSMutableDictionary *)v14->_performerClassByType setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F90C20]];
      [(NSMutableDictionary *)v14->_performerClassByType setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F90C60]];
      [(NSMutableDictionary *)v14->_performerClassByType setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F90DE0]];
    }
    [(NSMutableDictionary *)v14->_performerClassByType setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F90C48]];
  }

  return v14;
}

- (UIMenu)actionContextMenu
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(CKMediaObjectAssetActionManager *)self previewActionForActionType:*MEMORY[0x1E4F90D60]];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(CKMediaObjectAssetActionManager *)self previewActionForActionType:*MEMORY[0x1E4F90C48]];
  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [(CKMediaObjectAssetActionManager *)self previewActionForActionType:*MEMORY[0x1E4F90C60]];
  if (v6) {
    [v3 addObject:v6];
  }
  v7 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return (UIMenu *)v7;
}

- (BOOL)shouldHideInteractions
{
  v2 = self;
  id v3 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
  LOBYTE(v2) = [v3 shouldHideInteractionsForActionManager:v2];

  return (char)v2;
}

- (BOOL)supportsActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(CKMediaObjectAssetActionManager *)self performerClassByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  if (v4
    && [(PXActionManager *)self isActionTypeAllowed:v4]
    && ([(CKMediaObjectAssetActionManager *)self performerClassByType],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (void *)[v5 objectForKeyedSubscript:v4],
        v5,
        v6))
  {
    char v7 = [v6 canPerformWithActionManager:self];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  if ([(CKMediaObjectAssetActionManager *)self canPerformActionType:v4]
    && ([(CKMediaObjectAssetActionManager *)self performerClassByType],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (objc_class *)[v5 objectForKeyedSubscript:v4],
        v5,
        v6))
  {
    char v7 = (void *)[[v6 alloc] initWithActionType:v4];
    v8 = [(CKMediaObjectAssetActionManager *)self _selectionSnapshotForPerformerClass:v6];
    [v7 setSelectionSnapshot:v8];

    v9 = [(PXAssetActionManager *)self selectionManager];
    [v7 setSelectionManager:v9];

    v10 = [(CKMediaObjectAssetActionManager *)self chatItem];
    [v7 setChatItem:v10];

    id v11 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v7 setChatActionHelper:v11];

    id v12 = [(PXActionManager *)self performerDelegate];
    [v7 setDelegate:v12];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CKMediaObjectAssetActionManager *)self performerClassByType];
  uint64_t v6 = (void *)[v5 objectForKeyedSubscript:v4];

  char v7 = [(CKMediaObjectAssetActionManager *)self _barButtonSelectorByActionType:v4];

  return (id)[v6 createBarButtonItemWithTarget:self action:v7 actionManager:self];
}

- (id)previewActionForActionType:(id)a3
{
  id v4 = a3;
  if ([(CKMediaObjectAssetActionManager *)self canPerformActionType:v4]
    && ([(CKMediaObjectAssetActionManager *)self performerClassByType],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (void *)[v5 objectForKeyedSubscript:v4],
        v5,
        v6))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__CKMediaObjectAssetActionManager_previewActionForActionType___block_invoke;
    v9[3] = &unk_1E5624B40;
    v9[4] = self;
    id v10 = v4;
    char v7 = [v6 createPreviewActionWithActionManager:self handler:v9];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __62__CKMediaObjectAssetActionManager_previewActionForActionType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handlePreviewAction:a2 actionType:*(void *)(a1 + 40)];
}

- (id)contextMenu
{
  id v7 = 0;
  id v3 = [(CKMediaObjectAssetActionManager *)self _currentlySelectedChatItemsOutCursorItem:&v7];
  id v4 = v7;
  if ([v3 count])
  {
    v5 = [(CKMediaObjectAssetActionManager *)self contextMenuForChatItems:v3 cursorChatItem:v4 isCMM:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsContextMenu
{
  return 1;
}

- (id)actionKeyCommands
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@" " modifierFlags:0 action:sel__keyCommandQuickLook_];
  v10[0] = v2;
  id v3 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439D0] modifierFlags:0 action:sel__keyCommandDelete_];
  v10[1] = v3;
  id v4 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"r" modifierFlags:0x100000 action:sel__keyCommandReply_];
  v10[2] = v4;
  v5 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"t" modifierFlags:0x100000 action:sel__keyCommandTapback_];
  v10[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"a" modifierFlags:0x100000 action:sel__keyCommandSelectAll_];
  v10[4] = v6;
  id v7 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"c" modifierFlags:0x100000 action:sel__keyCommandCopy_];
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v6 = [(PXAssetActionManager *)self selectionManager];
  id v7 = [v6 selectionSnapshot];

  if (sel__keyCommandQuickLook_ == a3 || sel__keyCommandDelete_ == a3 || sel__keyCommandCopy_ == a3)
  {
    LOBYTE(v8) = [v7 isAnyItemSelected];
  }
  else if (sel__keyCommandReply_ == a3 || sel__keyCommandTapback_ == a3)
  {
    id v10 = [v7 selectedIndexPaths];
    if ([v10 count] == 1) {
      int v8 = ![(CKMediaObjectAssetActionManager *)self shouldHideInteractions];
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = sel__keyCommandSelectAll_ == a3;
  }

  return v8;
}

- (void)_keyCommandQuickLook:(id)a3
{
  id v7 = 0;
  id v4 = [(CKMediaObjectAssetActionManager *)self _currentlySelectedChatItemsOutCursorItem:&v7];
  id v5 = v7;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self quickLookChatItem:v5];
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager _keyCommandQuickLook:]();
    }
  }
}

- (void)_keyCommandReply:(id)a3
{
  id v7 = 0;
  id v4 = [(CKMediaObjectAssetActionManager *)self _currentlySelectedChatItemsOutCursorItem:&v7];
  id v5 = v7;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self presentInlineReplyControllerForChatItem:v5];
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager _keyCommandReply:]();
    }
  }
}

- (void)_keyCommandTapback:(id)a3
{
  id v7 = 0;
  id v4 = [(CKMediaObjectAssetActionManager *)self _currentlySelectedChatItemsOutCursorItem:&v7];
  id v5 = v7;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self tapbackChatItem:v5];
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager _keyCommandTapback:]();
    }
  }
}

- (void)_keyCommandSelectAll:(id)a3
{
  id v4 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
  [v4 selectAllForActionManager:self];
}

- (void)_keyCommandCopy:(id)a3
{
  id v4 = [(CKMediaObjectAssetActionManager *)self _currentlySelectedChatItemsOutCursorItem:0];
  if ([v4 count])
  {
    id v5 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v5 actionManager:self copyChatItems:v4];
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager _keyCommandCopy:]();
    }
  }
}

- (id)contextMenuForChatItems:(id)a3 cursorChatItem:(id)a4 isCMM:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  menuBuilder = self->_menuBuilder;
  if (!menuBuilder)
  {
    id v11 = objc_alloc_init(CKMediaObjectAssetMenuBuilder);
    id v12 = self->_menuBuilder;
    self->_menuBuilder = v11;

    [(CKMediaObjectAssetMenuBuilder *)self->_menuBuilder setDelegate:self];
    menuBuilder = self->_menuBuilder;
  }
  v13 = [(CKMediaObjectAssetMenuBuilder *)menuBuilder contextMenuForChatItems:v8 cursorChatItem:v9 isCMM:v5];

  return v13;
}

- (void)menuBuilder:(id)a3 quickLookChatItem:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self quickLookChatItem:v5];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager menuBuilder:quickLookChatItem:]();
    }
  }
}

- (void)menuBuilder:(id)a3 tapbackChatItem:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self tapbackChatItem:v5];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager menuBuilder:tapbackChatItem:]();
    }
  }
}

- (id)menuBuilder:(id)a3 tapbackElementsForChatItem:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    id v7 = [v6 actionManager:self tapbackElementsForChatItem:v5];
  }
  else
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager menuBuilder:tapbackElementsForChatItem:]();
    }

    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)menuBuilder:(id)a3 replyChatItem:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self presentInlineReplyControllerForChatItem:v5];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager menuBuilder:replyChatItem:]();
    }
  }
}

- (void)menuBuilder:(id)a3 copyChatItems:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self copyChatItems:v5];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager menuBuilder:copyChatItems:]();
    }
  }
}

- (void)menuBuilder:(id)a3 forwardChatItems:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    uint64_t v6 = [(CKMediaObjectAssetActionManager *)self chatActionHelper];
    [v6 actionManager:self forwardChatItems:v5];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectAssetActionManager menuBuilder:forwardChatItems:]();
    }
  }
}

- (SEL)_barButtonSelectorByActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F90C20]])
  {
    id v4 = sel__handleAddToLibraryBarButtonItem_;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F90D60]])
  {
    id v4 = sel__handleReplyBarButtonItem_;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F90DE0]])
  {
    id v4 = sel__handleDeleteBarButtonItem_;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_handleAddToLibraryBarButtonItem:(id)a3
{
}

- (void)_handleReplyBarButtonItem:(id)a3
{
}

- (void)_handleDeleteBarButtonItem:(id)a3
{
}

- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(CKMediaObjectAssetActionManager *)self actionPerformerForActionType:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__CKMediaObjectAssetActionManager_executeActionForActionType_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E56287E0;
  id v10 = v6;
  id v8 = v6;
  [v7 performActionWithCompletionHandler:v9];
}

uint64_t __84__CKMediaObjectAssetActionManager_executeActionForActionType_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3
{
  id v5 = [(PXAssetActionManager *)self selectionManager];
  id v6 = [v5 selectionSnapshot];

  if (([v6 isAnyItemSelected] & 1) != 0
    || ([(PXAssetActionManager *)self objectReference],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    if ([(objc_class *)a3 canPerformOnImplicitSelection]
      && ([v6 isAnyItemSelected] & 1) == 0)
    {
      v13 = [v6 dataSource];
      id v14 = objc_alloc(MEMORY[0x1E4F90660]);
      v15 = [v13 allItemIndexPaths];
      uint64_t v16 = [v14 initWithDataSource:v13 selectedIndexPaths:v15];

      id v6 = (void *)v16;
    }
  }
  else
  {
    id v8 = [v6 dataSource];
    uint64_t v9 = [v8 identifier];
    id v10 = [(PXAssetActionManager *)self objectReference];
    id v11 = v10;
    if (v10)
    {
      [v10 indexPath];
      uint64_t v12 = v27;
    }
    else
    {
      uint64_t v12 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
    }

    if (v9 != v12)
    {
      v17 = [v6 dataSource];
      objc_super v18 = [(PXAssetActionManager *)self objectReference];
      v19 = [v17 objectReferenceForObjectReference:v18];
      [(PXAssetActionManager *)self setObjectReference:v19];
    }
    id v20 = objc_alloc(MEMORY[0x1E4F90660]);
    v21 = [v6 dataSource];
    v22 = [(PXAssetActionManager *)self objectReference];
    v23 = v22;
    if (v22) {
      [v22 indexPath];
    }
    else {
      memset(v26, 0, sizeof(v26));
    }
    uint64_t v24 = [v20 initWithDataSource:v21 selectedIndexPath:v26];

    id v6 = (void *)v24;
  }

  return v6;
}

- (void)_handlePreviewAction:(id)a3 actionType:(id)a4
{
}

- (id)_currentlySelectedChatItemsOutCursorItem:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [(PXAssetActionManager *)self selectionManager];
  id v5 = [v4 selectionSnapshot];

  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [v5 selectedIndexPaths];
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v5 allItemsEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) chatItem];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [v8 count];
  if (a3 && v15)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    if (v5)
    {
      [v5 cursorIndexPath];
      uint64_t v16 = v23;
    }
    else
    {
      uint64_t v16 = 0;
    }
    if (v16 == *MEMORY[0x1E4F90E60])
    {
      v17 = IMLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:]();
      }

      *a3 = [v8 firstObject];
    }
    else
    {
      objc_super v18 = [v5 dataSource];
      v22[0] = v23;
      v22[1] = v24;
      v19 = [v18 objectAtIndexPath:v22];

      id v20 = [v19 chatItem];
      *a3 = v20;
    }
  }

  return v8;
}

- (void)_runDeleteActionPerformer
{
  v2 = [(CKMediaObjectAssetActionManager *)self actionPerformerForActionType:*MEMORY[0x1E4F90C60]];
  id v3 = [v2 selectionSnapshot];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke;
  v5[3] = &unk_1E56211F0;
  id v6 = v3;
  id v4 = v3;
  [v2 performActionWithCompletionHandler:v5];
}

void __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = IMLogHandleForCategory();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) selectedIndexPaths];
      int v9 = 134217984;
      uint64_t v10 = [v8 count];
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted %lu item(s)", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke_cold_1((uint64_t)v5, v7);
  }
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (CKMediaObjectAssetActionHelper)chatActionHelper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chatActionHelper);

  return (CKMediaObjectAssetActionHelper *)WeakRetained;
}

- (NSMutableDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_destroyWeak((id *)&self->_chatActionHelper);
  objc_storeStrong((id *)&self->_chatItem, 0);

  objc_storeStrong((id *)&self->_menuBuilder, 0);
}

- (void)_keyCommandQuickLook:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for key command quicklook action", v2, v3, v4, v5, v6);
}

- (void)_keyCommandReply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for key command reply action", v2, v3, v4, v5, v6);
}

- (void)_keyCommandTapback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for key command tapback action", v2, v3, v4, v5, v6);
}

- (void)_keyCommandCopy:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for key command copy action", v2, v3, v4, v5, v6);
}

- (void)menuBuilder:quickLookChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for context menu quicklook action", v2, v3, v4, v5, v6);
}

- (void)menuBuilder:tapbackChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for context menu tapback action", v2, v3, v4, v5, v6);
}

- (void)menuBuilder:tapbackElementsForChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for context menu tapback actions", v2, v3, v4, v5, v6);
}

- (void)menuBuilder:replyChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat item specified for context menu reply action", v2, v3, v4, v5, v6);
}

- (void)menuBuilder:copyChatItems:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat items specified for context menu copy action", v2, v3, v4, v5, v6);
}

- (void)menuBuilder:forwardChatItems:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No chat items specified for context menu forward action", v2, v3, v4, v5, v6);
}

- (void)_currentlySelectedChatItemsOutCursorItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No cursor item for non-empty selection. Falling back to an arbitrary selected item", v2, v3, v4, v5, v6);
}

void __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Error deleting chat items: %@", (uint8_t *)&v2, 0xCu);
}

@end