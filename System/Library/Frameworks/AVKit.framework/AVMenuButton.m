@interface AVMenuButton
+ (id)buttonWithAccessibilityIdentifier:(id)a3 accessibilityLabel:(id)a4 isSecondGeneration:(BOOL)a5;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)updateContextMenu;
@end

@implementation AVMenuButton

+ (id)buttonWithAccessibilityIdentifier:(id)a3 accessibilityLabel:(id)a4 isSecondGeneration:(BOOL)a5
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AVMenuButton;
  v5 = objc_msgSendSuper2(&v7, sel_buttonWithAccessibilityIdentifier_accessibilityLabel_isSecondGeneration_, a3, a4, a5);
  [v5 setShowsMenuAsPrimaryAction:1];
  [v5 setContextMenuInteractionEnabled:1];
  [v5 setAutoresizingMask:0];
  [v5 setAppliesTransformToImageViewWhenHighlighted:1];

  return v5;
}

- (void).cxx_destruct
{
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setPreferredMenuElementOrder:2];
  v10.receiver = self;
  v10.super_class = (Class)AVMenuButton;
  v8 = [(AVMenuButton *)&v10 _contextMenuInteraction:v7 styleForMenuWithConfiguration:v6];

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVMenuButton;
  [(AVMenuButton *)&v14 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__AVMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v12, &location);
  [v10 addCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __72__AVMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 menuButtonDidHideMenu:v3];
    }

    id WeakRetained = v3;
  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVMenuButton;
  id v8 = a3;
  [(AVMenuButton *)&v10 contextMenuInteraction:v8 willDisplayMenuForConfiguration:a4 animator:a5];
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);

  id v9 = [(AVButton *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 menuButtonWillShowMenu:self];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v5 = [(AVButton *)self delegate];

  if (v5)
  {
    id v6 = [(AVButton *)self delegate];
    id v7 = [v6 menuForMenuButton:self];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = (void *)MEMORY[0x1E4FB1678];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__AVMenuButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v12[3] = &unk_1E5FC1F00;
  id v13 = v7;
  id v9 = v7;
  objc_super v10 = [v8 configurationWithIdentifier:0 previewProvider:0 actionProvider:v12];

  return v10;
}

id __70__AVMenuButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateContextMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeMenuInteraction);
  if (WeakRetained)
  {
    v4 = [(AVButton *)self delegate];
    v5 = [v4 menuForMenuButton:self];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__AVMenuButton_updateContextMenu__block_invoke;
    v7[3] = &unk_1E5FC1ED8;
    id v8 = v5;
    id v6 = v5;
    [WeakRetained updateVisibleMenuWithBlock:v7];
  }
}

id __33__AVMenuButton_updateContextMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 32)];
  v5 = v3;
  if ([v4 count])
  {
    while (1)
    {
      v5 = [v4 lastObject];
      [v4 removeLastObject];
      id v6 = [v5 identifier];
      id v7 = [v3 identifier];
      int v8 = [v6 isEqualToString:v7];

      if (v8) {
        break;
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = objc_msgSend(v5, "children", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v4 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }

      if (![v4 count])
      {
        v5 = v3;
        goto LABEL_15;
      }
    }
  }
LABEL_15:

  return v5;
}

@end