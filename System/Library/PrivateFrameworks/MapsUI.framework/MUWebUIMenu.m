@interface MUWebUIMenu
- (MUWebMenuButton)menuButton;
- (MUWebUIMenu)initWithFrame:(CGRect)a3;
- (MUWebUIMenuActionManager)menuActionManager;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setMenuActionManager:(id)a3;
- (void)setMenuButton:(id)a3;
@end

@implementation MUWebUIMenu

- (MUWebUIMenu)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUWebUIMenu;
  v3 = -[MUWebUIMenu initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUWebUIMenu *)v3 setContextMenuInteractionEnabled:1];
    [(MUWebUIMenu *)v4 setShowsMenuAsPrimaryAction:1];
    [(MUWebUIMenu *)v4 setIsAccessibilityElement:1];
    [(MUWebUIMenu *)v4 setAccessibilityTraits:*MEMORY[0x1E4FB2540]];
    [(MUWebUIMenu *)v4 setAccessibilityLabel:@"UIMenu"];
    [(MUWebUIMenu *)v4 setAccessibilityIdentifier:@"UIMenu"];
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(MUWebUIMenu *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E5750060;
  v6[4] = self;
  v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

id __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = [*(id *)(*(void *)(a1 + 32) + 456) menuItems];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9;
  v10 = &unk_1E5750038;
  objc_copyWeak(&v13, &location);
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = &v15;
  [v4 enumerateObjectsUsingBlock:&v7];

  v5 = objc_msgSend(MEMORY[0x1E4FB1970], "menuWithChildren:", v16[5], v7, v8, v9, v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasDisplayName])
  {
    v4 = [v3 symbolImage];
    v5 = (void *)MEMORY[0x1E4FB1818];
    if (v4)
    {
      v6 = [v3 symbolImage];
      id v7 = [v5 _systemImageNamed:v6];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    }

    uint64_t v8 = (void *)MEMORY[0x1E4FB13F0];
    v9 = [v3 displayName];
    v10 = [v3 menuItemId];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v14[3] = &unk_1E574F330;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    id v11 = v3;
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    uint64_t v16 = v12;
    id v13 = [v8 actionWithTitle:v9 image:v7 identifier:v10 handler:v14];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
    objc_destroyWeak(&v17);
  }
}

void __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained menuActionManager];
    [v3 performActionUsingArguments:*(void *)(a1 + 32) contextMenu:*(void *)(a1 + 40) completion:&__block_literal_global_21];

    id WeakRetained = v4;
  }
}

- (MUWebMenuButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
}

- (MUWebUIMenuActionManager)menuActionManager
{
  return self->_menuActionManager;
}

- (void)setMenuActionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuActionManager, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
}

@end