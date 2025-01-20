@interface CKMediaObjectAssetActionPerformer
+ (BOOL)canPerformOnImplicitSelection;
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithActionManager:(id)a3 handler:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (CKMediaObjectAssetActionHelper)chatActionHelper;
- (CKMessagePartChatItem)chatItem;
- (void)setChatActionHelper:(id)a3;
- (void)setChatItem:(id)a3;
@end

@implementation CKMediaObjectAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 _selectionSnapshotForPerformerClass:a1];
  if (v5) {
    char v6 = [a1 canPerformWithActionManager:v4 selectionSnapshot:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  return 0;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return 0;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return 0;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v8 = a3;
  v9 = [a1 systemImageNameForActionManager:a5];
  if ([v9 length])
  {
    v10 = [MEMORY[0x1E4F42A80] systemImageNamed:v9];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithImage:v10 style:0 target:v8 action:a4];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)createPreviewActionWithActionManager:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 localizedTitleForUseCase:0 actionManager:v6];
  if ([v8 length])
  {
    v9 = [a1 systemImageNameForActionManager:v6];
    if ([v9 length])
    {
      v10 = (void *)MEMORY[0x1E4F42A80];
      v11 = [a1 systemImageNameForActionManager:v6];
      v12 = [v10 systemImageNamed:v11];
    }
    else
    {
      v12 = 0;
    }
    v13 = [MEMORY[0x1E4F426E8] actionWithTitle:v8 image:v12 identifier:0 handler:v7];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
}

- (CKMediaObjectAssetActionHelper)chatActionHelper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chatActionHelper);

  return (CKMediaObjectAssetActionHelper *)WeakRetained;
}

- (void)setChatActionHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chatActionHelper);

  objc_storeStrong((id *)&self->_chatItem, 0);
}

@end