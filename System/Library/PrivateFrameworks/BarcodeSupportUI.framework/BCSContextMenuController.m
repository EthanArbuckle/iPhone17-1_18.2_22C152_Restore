@interface BCSContextMenuController
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)finishAction;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setFinishAction:(id)a3;
- (void)showMenuForAction:(id)a3 fromView:(id)a4;
@end

@implementation BCSContextMenuController

- (void)showMenuForAction:(id)a3 fromView:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  objc_storeStrong((id *)&self->_viewForMenu, a4);
  v7 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = v6;
  id obj = [v6 actionPickerItems];
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x263F823D0];
        v14 = [v12 label];
        v15 = [v12 icon];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __55__BCSContextMenuController_showMenuForAction_fromView___block_invoke;
        v23[3] = &unk_26524C660;
        v23[4] = self;
        v23[5] = v12;
        v16 = [v13 actionWithTitle:v14 image:v15 identifier:0 handler:v23];

        [v7 addObject:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  v17 = [MEMORY[0x263F82940] menuWithChildren:v7];
  actionPickerMenu = self->_actionPickerMenu;
  self->_actionPickerMenu = v17;

  v19 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:self];
  [(UIView *)self->_viewForMenu addInteraction:v19];
  objc_msgSend(v19, "_presentMenuAtLocation:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

void __55__BCSContextMenuController_showMenuForAction_fromView___block_invoke(uint64_t a1)
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__BCSContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_26524C688;
  v6[4] = self;
  v4 = [MEMORY[0x263F82610] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];

  return v4;
}

id __82__BCSContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  -[UIView removeInteraction:](self->_viewForMenu, "removeInteraction:", a3, a4, a5);
  finishAction = (void (**)(id, BCSActionPickerItem *))self->_finishAction;
  if (finishAction) {
    finishAction[2](finishAction, self->_selectedItem);
  }
  selectedItem = self->_selectedItem;
  self->_selectedItem = 0;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F82EF8], "defaultStyle", a3, a4);
  [v4 setPreferredLayout:3];

  return v4;
}

- (id)finishAction
{
  return self->_finishAction;
}

- (void)setFinishAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishAction, 0);
  objc_storeStrong((id *)&self->_actionPickerMenu, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);

  objc_storeStrong((id *)&self->_viewForMenu, 0);
}

@end