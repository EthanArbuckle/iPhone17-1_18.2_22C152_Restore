@interface MFDragSource
- (BOOL)allowsDragOverridingMasterSwitch;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (MFDragSource)initWithView:(id)a3 delegate:(id)a4;
- (MFDragSourceDelegate)delegate;
- (UIDragInteraction)dragInteraction;
- (UIView)sourceView;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)setAllowsDragOverridingMasterSwitch:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDragInteraction:(id)a3;
@end

@implementation MFDragSource

- (MFDragSource)initWithView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MFDragSource;
  v8 = [(MFDragSource *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sourceView, v6);
    [(MFDragSource *)v9 setDelegate:v7];
    v9->_delegateFlags.respondsToTeamDataForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToLocalObjectForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToTargetedPreviewForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToPreviewForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToSuggestedNameForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToDragWillEnd = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToAllowsMoveOperation = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToIsRestrictedToMail = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToDataOwner = objc_opt_respondsToSelector() & 1;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v9];
    [(MFDragSource *)v9 setDragInteraction:v10];

    v11 = [(MFDragSource *)v9 sourceView];
    v12 = [(MFDragSource *)v9 dragInteraction];
    [v11 addInteraction:v12];

    [(MFDragSource *)v9 setAllowsDragOverridingMasterSwitch:0];
  }

  return v9;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a4;
  id v7 = [a3 view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [(MFDragSource *)self delegate];
  v13 = objc_msgSend(v12, "dragSource:draggableItemsAtPoint:", self, v9, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__MFDragSource_dragInteraction_itemsForBeginningSession___block_invoke;
  v17[3] = &unk_1E5F7ABA8;
  v17[4] = self;
  id v14 = v12;
  id v18 = v14;
  v15 = objc_msgSend(v13, "ef_map:", v17);

  return v15;
}

id __57__MFDragSource_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v3];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v4];
  id v6 = *(unsigned char **)(a1 + 32);
  if (v6[12])
  {
    id v7 = objc_msgSend(*(id *)(a1 + 40), "dragSource:localObjectForDraggableItem:");
    [v5 setLocalObject:v7];

    id v6 = *(unsigned char **)(a1 + 32);
  }
  if (v6[8])
  {
    double v8 = objc_msgSend(*(id *)(a1 + 40), "dragSource:teamDataForDraggableItem:");
    double v9 = [v5 itemProvider];
    [v9 setTeamData:v8];

    id v6 = *(unsigned char **)(a1 + 32);
  }
  if (v6[11])
  {
    double v10 = objc_msgSend(*(id *)(a1 + 40), "dragSource:suggestedNameForDraggableItem:");
    double v11 = [v5 itemProvider];
    [v11 setSuggestedName:v10];
  }

  return v5;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_delegateFlags.respondsToTargetedPreviewForItem)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = [v9 localObject];
    v13 = [WeakRetained dragSource:self targetedPreviewForDraggableItem:v12];
  }
  else if (self->_delegateFlags.respondsToPreviewForItem)
  {
    id v14 = [(MFDragSource *)self delegate];
    v15 = [v9 localObject];
    v16 = [v14 dragSource:self previewForDraggableItem:v15];

    v17 = [v16 window];

    if (v17)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v16];
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x1E4FB1728]);
      v19 = [v8 view];
      [v16 center];
      double v21 = v20;
      double v23 = v22;
      if (v16) {
        [v16 transform];
      }
      else {
        memset(v28, 0, sizeof(v28));
      }
      v24 = objc_msgSend(v18, "initWithContainer:center:transform:", v19, v28, v21, v23);

      id v25 = objc_alloc_init(MEMORY[0x1E4FB1720]);
      v26 = [MEMORY[0x1E4FB1618] clearColor];
      [v25 setBackgroundColor:v26];

      v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v16 parameters:v25 target:v24];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v7 = a4;
  if (self->_delegateFlags.respondsToDragWillEnd)
  {
    id v10 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [v10 items];
    [WeakRetained dragSource:self willEndInteractionWithItems:v9 dropOperation:a5];

    id v7 = v10;
  }
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  id v5 = a4;
  if (self->_delegateFlags.respondsToAllowsMoveOperation)
  {
    id v6 = [(MFDragSource *)self delegate];
    char v7 = [v6 dragSource:self sessionAllowsMoveOperation:v5];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5 = a4;
  if (self->_delegateFlags.respondsToIsRestrictedToMail)
  {
    id v6 = [(MFDragSource *)self delegate];
    char v7 = [v6 dragSource:self sessionIsRestrictedToMail:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = a4;
  if (self->_delegateFlags.respondsToDataOwner)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v7 = [WeakRetained dragSource:self dataOwnerForSession:v5];
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (BOOL)allowsDragOverridingMasterSwitch
{
  return self->_allowsDragOverridingMasterSwitch;
}

- (void)setAllowsDragOverridingMasterSwitch:(BOOL)a3
{
  self->_allowsDragOverridingMasterSwitch = a3;
}

- (MFDragSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFDragSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_sourceView);
}

@end