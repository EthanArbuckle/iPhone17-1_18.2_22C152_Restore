@interface MFDropTarget
- (BOOL)_delegateCanDropItemsWithDropSession:(id)a3;
- (BOOL)_delegateHandlesDrops;
- (BOOL)_sessionContainsOnlyAcceptableTypeIdentifiers:(id)a3;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (MFDropTarget)initWithView:(id)a3 delegate:(id)a4;
- (MFDropTargetDelegate)delegate;
- (NSSet)acceptableUTIs;
- (UIDropInteraction)dropInteraction;
- (UIView)targetView;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)_delegateDidDropItemsWithDropSession:(id)a3;
- (void)_updateDelegateFlags;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)setAcceptableUTIs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation MFDropTarget

- (MFDropTarget)initWithView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFDropTarget;
  v8 = [(MFDropTarget *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(MFDropTarget *)v8 setTargetView:v6];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v9];
    dropInteraction = v9->_dropInteraction;
    v9->_dropInteraction = (UIDropInteraction *)v10;

    [v6 addInteraction:v9->_dropInteraction];
    [(MFDropTarget *)v9 setDelegate:v7];
    [(MFDropTarget *)v9 _updateDelegateFlags];
  }

  return v9;
}

- (void)_updateDelegateFlags
{
  id v3 = [(MFDropTarget *)self delegate];
  self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragEntered = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragExited = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragDidMoveToPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDidDropItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDataOwner = objc_opt_respondsToSelector() & 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5 = a4;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v13 = 0;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#DragAndDrop Dragging entered", v13, 2u);
  }

  if (self->_delegateFlags.respondsToDragEntered)
  {
    id v7 = [(MFDropTarget *)self delegate];
    v8 = [(MFDropTarget *)self targetView];
    [v5 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v7, "dropTarget:dragEnteredAtPoint:", self, v10, v12);
  }
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#DragAndDrop Dragging exited", v7, 2u);
  }

  if (self->_delegateFlags.respondsToDragExited)
  {
    id v6 = [(MFDropTarget *)self delegate];
    [v6 dropTargetDragExited:self];
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  if ([(MFDropTarget *)self _delegateHandlesDrops]) {
    BOOL v6 = [(MFDropTarget *)self _sessionContainsOnlyAcceptableTypeIdentifiers:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_delegateFlags.respondsToDragDidMoveToPoint)
  {
    v8 = [(MFDropTarget *)self targetView];
    [v7 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    objc_super v13 = [(MFDropTarget *)self delegate];
    objc_msgSend(v13, "dropTarget:dragDidMoveToPoint:", self, v10, v12);
  }
  if ([v7 allowsMoveOperation])
  {
    v14 = [v7 localDragSession];
    if (v14) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 2;
    }
  }
  else
  {
    uint64_t v15 = 2;
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v15];

  return v16;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#DragAndDrop Items dropped", v7, 2u);
  }

  [(MFDropTarget *)self _delegateDidDropItemsWithDropSession:v5];
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = a4;
  if (self->_delegateFlags.respondsToDataOwner)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v7 = [WeakRetained dropTarget:self dataOwnerForSession:v5];
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

- (BOOL)_sessionContainsOnlyAcceptableTypeIdentifiers:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v4 = [a3 items];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__MFDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke;
  v6[3] = &unk_1E5F7ABD0;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v4;
}

void __62__MFDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [a2 itemProvider];
  uint64_t v8 = [v7 registeredTypeIdentifiers];
  id v10 = [v6 setWithArray:v8];

  uint64_t v9 = [*(id *)(a1 + 32) acceptableUTIs];
  LOBYTE(v8) = [v9 intersectsSet:v10];

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)_delegateDidDropItemsWithDropSession:(id)a3
{
  id v11 = a3;
  v4 = [(MFDropTarget *)self targetView];
  [v11 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = [(MFDropTarget *)self delegate];
  id v10 = [v11 items];
  objc_msgSend(v9, "dropTarget:didDropDragItems:atPoint:", self, v10, v6, v8);
}

- (BOOL)_delegateHandlesDrops
{
  return self->_delegateFlags.respondsToDidDropItemsAtPoint != 0;
}

- (BOOL)_delegateCanDropItemsWithDropSession:(id)a3
{
  id v4 = a3;
  if (self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint)
  {
    double v5 = [(MFDropTarget *)self delegate];
    double v6 = [(MFDropTarget *)self targetView];
    [v4 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    char v11 = objc_msgSend(v5, "dropTarget:canDropDraggedItemsAtPoint:", self, v8, v10);
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (NSSet)acceptableUTIs
{
  return self->_acceptableUTIs;
}

- (void)setAcceptableUTIs:(id)a3
{
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (MFDropTargetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFDropTargetDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetView);

  objc_storeStrong((id *)&self->_acceptableUTIs, 0);
}

@end