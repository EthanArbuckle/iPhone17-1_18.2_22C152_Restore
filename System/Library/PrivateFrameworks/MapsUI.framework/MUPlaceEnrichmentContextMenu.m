@interface MUPlaceEnrichmentContextMenu
- (MUPlaceEnrichmentAction)contextMenuAction;
- (MUPlaceEnrichmentActionHandler)enrichmentActionDelegate;
- (MUPlaceEnrichmentContextMenu)initWithFrame:(CGRect)a3;
- (MUPlaceEnrichmentSectionContextMenuDelegate)contextMenuDelegate;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setContextMenuAction:(id)a3;
- (void)setContextMenuDelegate:(id)a3;
- (void)setEnrichmentActionDelegate:(id)a3;
@end

@implementation MUPlaceEnrichmentContextMenu

- (MUPlaceEnrichmentContextMenu)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceEnrichmentContextMenu;
  v3 = -[MUPlaceEnrichmentContextMenu initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPlaceEnrichmentContextMenu *)v3 setContextMenuInteractionEnabled:1];
    [(MUPlaceEnrichmentContextMenu *)v4 setShowsMenuAsPrimaryAction:1];
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E5750060;
  v6[4] = self;
  v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

id __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) contextMenuAction];
  v5 = [v4 enrichmentAction];
  objc_super v6 = [v5 objectForKey:0x1EE3CE600];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_17;
  v9[3] = &unk_1E57500A0;
  objc_copyWeak(&v10, &location);
  v9[4] = &v12;
  [v6 enumerateObjectsUsingBlock:v9];
  v7 = [MEMORY[0x1E4FB1970] menuWithChildren:v13[5]];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4FB13F0];
  v5 = [v3 objectForKeyedSubscript:0x1EE3CE640];
  objc_super v6 = (void *)MEMORY[0x1E4FB1818];
  v7 = [v3 objectForKeyedSubscript:0x1EE3CE620];
  v8 = [v6 _systemImageNamed:v7];
  v9 = [v3 objectForKeyedSubscript:0x1EE3CE640];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v15 = &unk_1E574EC08;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v10 = v3;
  id v16 = v10;
  v11 = [v4 actionWithTitle:v5 image:v8 identifier:v9 handler:&v12];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", v11, v12, v13, v14, v15);
  objc_destroyWeak(&v17);
}

void __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v4 = [WeakRetained enrichmentActionDelegate];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_loadWeakRetained(v2);
    [v4 performActionUsingArguments:v5 contextMenu:v6 completion:&__block_literal_global_22];

    id WeakRetained = v7;
  }
}

- (MUPlaceEnrichmentAction)contextMenuAction
{
  return self->_contextMenuAction;
}

- (void)setContextMenuAction:(id)a3
{
}

- (MUPlaceEnrichmentSectionContextMenuDelegate)contextMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextMenuDelegate);
  return (MUPlaceEnrichmentSectionContextMenuDelegate *)WeakRetained;
}

- (void)setContextMenuDelegate:(id)a3
{
}

- (MUPlaceEnrichmentActionHandler)enrichmentActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enrichmentActionDelegate);
  return (MUPlaceEnrichmentActionHandler *)WeakRetained;
}

- (void)setEnrichmentActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enrichmentActionDelegate);
  objc_destroyWeak((id *)&self->_contextMenuDelegate);
  objc_storeStrong((id *)&self->_contextMenuAction, 0);
}

@end