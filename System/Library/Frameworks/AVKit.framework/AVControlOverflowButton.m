@interface AVControlOverflowButton
+ (id)firstGenerationButton;
+ (id)secondGenerationButton;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)updateContextMenu;
@end

@implementation AVControlOverflowButton

- (void).cxx_destruct
{
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setPreferredMenuElementOrder:2];
  v10.receiver = self;
  v10.super_class = (Class)AVControlOverflowButton;
  v8 = [(AVControlOverflowButton *)&v10 _contextMenuInteraction:v7 styleForMenuWithConfiguration:v6];

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVControlOverflowButton;
  [(AVControlOverflowButton *)&v14 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__AVControlOverflowButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v12, &location);
  [v10 addCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __83__AVControlOverflowButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 overflowButtonDidHideContextMenu:v3];
    }

    id WeakRetained = v3;
  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVControlOverflowButton;
  id v8 = a3;
  [(AVControlOverflowButton *)&v10 contextMenuInteraction:v8 willDisplayMenuForConfiguration:a4 animator:a5];
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);

  id v9 = [(AVButton *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 overflowButtonWillShowContextMenu:self];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x1E4FB1678];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__AVControlOverflowButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E5FC44D0;
  objc_copyWeak(&v10, &location);
  id v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __81__AVControlOverflowButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v3 overflowMenuItemsForControlOverflowButton:v4];

  id v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F09185C8 image:0 identifier:@"AVControlOverflowMenu" options:0 children:v5];

  return v6;
}

- (void)updateContextMenu
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_activeMenuInteraction = &self->_activeMenuInteraction;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeMenuInteraction);

  if (WeakRetained)
  {
    id v5 = [(AVButton *)self delegate];
    id v6 = [v5 overflowMenuItemsForControlOverflowButton:self];

    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v7 addObject:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v14 = objc_loadWeakRetained((id *)p_activeMenuInteraction);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__AVControlOverflowButton_updateContextMenu__block_invoke;
    v17[3] = &unk_1E5FC44A8;
    id v18 = v8;
    id v19 = v7;
    id v15 = v7;
    id v16 = v8;
    [v14 updateVisibleMenuWithBlock:v17];
  }
}

id __44__AVControlOverflowButton_updateContextMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:@"AVControlOverflowMenu"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F09185C8 image:0 identifier:@"AVControlOverflowMenu" options:0 children:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(a1 + 40)];
    id v6 = v3;
    if ([v7 count])
    {
      while (1)
      {
        id v6 = [v7 lastObject];
        [v7 removeLastObject];
        id v8 = [v6 identifier];
        uint64_t v9 = [v3 identifier];
        int v10 = [v8 isEqualToString:v9];

        if (v10) {
          break;
        }
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v11 = objc_msgSend(v6, "children", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v7 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v13);
        }

        if (![v7 count])
        {
          id v6 = v3;
          goto LABEL_17;
        }
      }
    }
LABEL_17:
  }

  return v6;
}

+ (id)secondGenerationButton
{
  v2 = AVLocalizedString(@"More Controls");
  id v3 = +[AVButton buttonWithAccessibilityIdentifier:@"More Controls" accessibilityLabel:v2 isSecondGeneration:1];

  [v3 setImageName:@"ellipsis.circle"];
  _CommonInit_24491(v3);

  return v3;
}

+ (id)firstGenerationButton
{
  v2 = AVLocalizedString(@"More Controls");
  id v3 = +[AVButton buttonWithAccessibilityIdentifier:@"More Controls" accessibilityLabel:v2 isSecondGeneration:0];

  [v3 setImageName:@"ellipsis"];
  _CommonInit_24491(v3);

  return v3;
}

@end