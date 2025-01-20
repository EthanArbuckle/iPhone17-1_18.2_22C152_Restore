@interface HFMediaAccessControlEditorItemManager
- (HFMediaAccessControlEditorItemManager)initWithDelegate:(id)a3 home:(id)a4;
- (HFMediaAccessControlEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HFMediaAccessControlEditorItemModule)accessControlEditorItemModule;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HFMediaAccessControlEditorItemManager

- (HFMediaAccessControlEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessControlEditorItemManager.m", 16, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessControlEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HFMediaAccessControlEditorItemManager)initWithDelegate:(id)a3 home:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFMediaAccessControlEditorItemManager;
  v7 = [(HFItemManager *)&v11 initWithDelegate:a3 sourceItem:0];
  if (v7)
  {
    v8 = [[HFMediaAccessControlEditorItemModule alloc] initWithItemUpdater:v7 home:v6];
    accessControlEditorItemModule = v7->_accessControlEditorItemModule;
    v7->_accessControlEditorItemModule = v8;
  }
  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v3 = [(HFMediaAccessControlEditorItemManager *)self accessControlEditorItemModule];
  v4 = [v3 itemProviders];
  v5 = [v4 allObjects];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(HFMediaAccessControlEditorItemManager *)self accessControlEditorItemModule];
    id v6 = [v5 buildSectionsWithDisplayedItems:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (HFMediaAccessControlEditorItemModule)accessControlEditorItemModule
{
  return self->_accessControlEditorItemModule;
}

- (void).cxx_destruct
{
}

@end