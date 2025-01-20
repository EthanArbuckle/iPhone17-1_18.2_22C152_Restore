@interface CKCMMAssetActionManager
+ (id)assetActionManagerWithCMMSession:(id)a3 chatItem:(id)a4 presentedFromInlineReply:(BOOL)a5 chatActionHelper:(id)a6 performerDelegate:(id)a7;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)presentedFromInlineReply;
- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4;
- (BOOL)supportsActionType:(id)a3;
- (CKMediaObjectAssetActionManager)messagesAssetActionManager;
- (PXCMMSession)session;
- (id)_destinationActionManagerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3;
- (id)barButtonItemForActionType:(id)a3;
- (id)photosAssetActionManager;
- (id)previewActionForActionType:(id)a3 image:(id)a4;
- (unint64_t)presentationSource;
- (void)_propagateObjectReference:(id)a3;
- (void)_propagatePerformerDelegate:(id)a3;
- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4;
- (void)setAdditionalPropertiesFromActionManager:(id)a3;
- (void)setMessagesAssetActionManager:(id)a3;
- (void)setObjectReference:(id)a3;
- (void)setPerformerDelegate:(id)a3;
- (void)setPhotosAssetActionManager:(id)a3;
- (void)setPresentedFromInlineReply:(BOOL)a3;
- (void)setSession:(id)a3;
@end

@implementation CKCMMAssetActionManager

- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v7];
  char v9 = [v8 shouldEnableActionType:v7 onAsset:v6];

  return v9;
}

- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v7];
  [v8 executeActionForActionType:v7 withCompletionHandler:v6];
}

+ (id)assetActionManagerWithCMMSession:(id)a3 chatItem:(id)a4 presentedFromInlineReply:(BOOL)a5 chatActionHelper:(id)a6 performerDelegate:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = [v15 viewModel];
  v17 = [v16 selectionManager];

  v18 = (void *)[objc_alloc((Class)a1) initWithSelectionManager:v17];
  [v18 setSession:v15];
  [v18 setPresentedFromInlineReply:v8];
  v19 = [MEMORY[0x1E4F904A8] assetActionManagerWithCMMSession:v15];

  [v18 setPhotosAssetActionManager:v19];
  v20 = [[CKMediaObjectAssetActionManager alloc] initWithChatItem:v14 presentedFromInlineReply:v8 chatActionHelper:v13 selectionManager:v17];

  [v18 setMessagesAssetActionManager:v20];
  [v18 _propagatePerformerDelegate:v12];

  return v18;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v4];
  id v6 = [v5 barButtonItemForActionType:v4];

  return v6;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v4];
  id v6 = [v5 actionPerformerForActionType:v4];

  return v6;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v4];
  char v6 = [v5 supportsActionType:v4];

  return v6;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v4];
  char v6 = [v5 canPerformActionType:v4];

  return v6;
}

- (id)previewActionForActionType:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CKCMMAssetActionManager *)self _destinationActionManagerForActionType:v7];
  char v9 = [v8 previewActionForActionType:v7 image:v6];

  return v9;
}

- (unint64_t)presentationSource
{
  return 2;
}

- (void)setAdditionalPropertiesFromActionManager:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKCMMAssetActionManager;
  [(PXAssetActionManager *)&v20 setAdditionalPropertiesFromActionManager:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 messagesAssetActionManager];
    id v7 = [v5 session];
    session = self->_session;
    self->_session = v7;

    char v9 = [MEMORY[0x1E4F904A8] assetActionManagerWithCMMSession:self->_session];
    id photosAssetActionManager = self->_photosAssetActionManager;
    self->_id photosAssetActionManager = v9;

    v11 = [CKMediaObjectAssetActionManager alloc];
    id v12 = [v6 chatItem];
    uint64_t v13 = [v5 presentedFromInlineReply];

    id v14 = [v6 chatActionHelper];
    id v15 = [v6 selectionManager];
    v16 = [(CKMediaObjectAssetActionManager *)v11 initWithChatItem:v12 presentedFromInlineReply:v13 chatActionHelper:v14 selectionManager:v15];
    messagesAssetActionManager = self->_messagesAssetActionManager;
    self->_messagesAssetActionManager = v16;

    v18 = [(PXActionManager *)self performerDelegate];
    [(CKCMMAssetActionManager *)self _propagatePerformerDelegate:v18];

    v19 = [(PXAssetActionManager *)self objectReference];
    [(CKCMMAssetActionManager *)self _propagateObjectReference:v19];
  }
}

- (void)setPerformerDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKCMMAssetActionManager;
  id v4 = a3;
  [(PXActionManager *)&v5 setPerformerDelegate:v4];
  -[CKCMMAssetActionManager _propagatePerformerDelegate:](self, "_propagatePerformerDelegate:", v4, v5.receiver, v5.super_class);
}

- (void)setObjectReference:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKCMMAssetActionManager;
  id v4 = a3;
  [(PXAssetActionManager *)&v5 setObjectReference:v4];
  -[CKCMMAssetActionManager _propagateObjectReference:](self, "_propagateObjectReference:", v4, v5.receiver, v5.super_class);
}

- (id)_destinationActionManagerForActionType:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F90C20]]) {
    [(CKCMMAssetActionManager *)self photosAssetActionManager];
  }
  else {
  id v4 = [(CKCMMAssetActionManager *)self messagesAssetActionManager];
  }

  return v4;
}

- (void)_propagatePerformerDelegate:(id)a3
{
  id v8 = a3;
  id v4 = [(CKCMMAssetActionManager *)self photosAssetActionManager];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKCMMAssetActionManager *)self photosAssetActionManager];
    [v6 setPerformerDelegate:v8];
  }
  id v7 = [(CKCMMAssetActionManager *)self messagesAssetActionManager];
  [v7 setPerformerDelegate:v8];
}

- (void)_propagateObjectReference:(id)a3
{
  id v8 = a3;
  id v4 = [(CKCMMAssetActionManager *)self photosAssetActionManager];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKCMMAssetActionManager *)self photosAssetActionManager];
    [v6 setObjectReference:v8];
  }
  id v7 = [(CKCMMAssetActionManager *)self messagesAssetActionManager];
  [v7 setObjectReference:v8];
}

- (CKMediaObjectAssetActionManager)messagesAssetActionManager
{
  return self->_messagesAssetActionManager;
}

- (void)setMessagesAssetActionManager:(id)a3
{
}

- (id)photosAssetActionManager
{
  return self->_photosAssetActionManager;
}

- (void)setPhotosAssetActionManager:(id)a3
{
}

- (BOOL)presentedFromInlineReply
{
  return self->_presentedFromInlineReply;
}

- (void)setPresentedFromInlineReply:(BOOL)a3
{
  self->_presentedFromInlineReply = a3;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_photosAssetActionManager, 0);

  objc_storeStrong((id *)&self->_messagesAssetActionManager, 0);
}

@end