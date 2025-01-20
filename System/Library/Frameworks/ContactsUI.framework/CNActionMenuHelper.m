@interface CNActionMenuHelper
- (BOOL)isMenuDisplayed;
- (NSArray)currentMenuItems;
- (NSArray)displayedMenuItems;
- (NSString)menuTitle;
- (UIDeferredMenuElement)deferredMenuItem;
- (id)configurationActionProviderWithActionBlock:(id)a3;
- (id)deferredMenuElementCompletionBlock;
- (id)menuForProviders;
- (id)menuProviderWithActionBlock:(id)a3;
- (id)targetedPreviewForSourceView:(id)a3;
- (void)replaceDeferredMenuItemWithMenuItems:(id)a3;
- (void)setCurrentMenuItems:(id)a3;
- (void)setDeferredMenuElementCompletionBlock:(id)a3;
- (void)setDeferredMenuItem:(id)a3;
- (void)setDisplayedMenuItems:(id)a3;
- (void)setIsMenuDisplayed:(BOOL)a3;
- (void)setMenuTitle:(id)a3;
- (void)setupDeferredMenuItem;
- (void)updateVisibleMenuWithMenuItems:(id)a3 contextMenuInteraction:(id)a4;
- (void)updateWithMenuItems:(id)a3 contextMenuInteraction:(id)a4;
- (void)willDismissMenu;
- (void)willDisplayMenuWithContextMenuInteraction:(id)a3;
@end

@implementation CNActionMenuHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredMenuElementCompletionBlock, 0);
  objc_storeStrong((id *)&self->_deferredMenuItem, 0);
  objc_storeStrong((id *)&self->_displayedMenuItems, 0);
  objc_storeStrong((id *)&self->_currentMenuItems, 0);

  objc_storeStrong((id *)&self->_menuTitle, 0);
}

- (void)setDeferredMenuElementCompletionBlock:(id)a3
{
}

- (id)deferredMenuElementCompletionBlock
{
  return self->_deferredMenuElementCompletionBlock;
}

- (void)setDeferredMenuItem:(id)a3
{
}

- (UIDeferredMenuElement)deferredMenuItem
{
  return self->_deferredMenuItem;
}

- (void)setIsMenuDisplayed:(BOOL)a3
{
  self->_isMenuDisplayed = a3;
}

- (BOOL)isMenuDisplayed
{
  return self->_isMenuDisplayed;
}

- (void)setDisplayedMenuItems:(id)a3
{
}

- (NSArray)displayedMenuItems
{
  return self->_displayedMenuItems;
}

- (void)setCurrentMenuItems:(id)a3
{
}

- (NSArray)currentMenuItems
{
  return self->_currentMenuItems;
}

- (void)setMenuTitle:(id)a3
{
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (void)willDismissMenu
{
  [(CNActionMenuHelper *)self setDisplayedMenuItems:0];
  [(CNActionMenuHelper *)self setCurrentMenuItems:0];
  [(CNActionMenuHelper *)self setIsMenuDisplayed:0];
  [(CNActionMenuHelper *)self setDeferredMenuItem:0];

  [(CNActionMenuHelper *)self setDeferredMenuElementCompletionBlock:0];
}

- (void)willDisplayMenuWithContextMenuInteraction:(id)a3
{
  id v4 = a3;
  [(CNActionMenuHelper *)self setIsMenuDisplayed:1];
  v5 = [(CNActionMenuHelper *)self deferredMenuItem];

  if (!v5)
  {
    v6 = [(CNActionMenuHelper *)self displayedMenuItems];
    v7 = [(CNActionMenuHelper *)self currentMenuItems];

    if (v6 != v7)
    {
      v8 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__CNActionMenuHelper_willDisplayMenuWithContextMenuInteraction___block_invoke;
      v10[3] = &unk_1E549BF80;
      v10[4] = self;
      id v11 = v4;
      id v9 = (id)[v8 afterDelay:v10 performBlock:0.1];
    }
  }
}

void __64__CNActionMenuHelper_willDisplayMenuWithContextMenuInteraction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentMenuItems];
  [v2 updateVisibleMenuWithMenuItems:v3 contextMenuInteraction:*(void *)(a1 + 40)];
}

- (void)replaceDeferredMenuItemWithMenuItems:(id)a3
{
  id v7 = a3;
  id v4 = [(CNActionMenuHelper *)self deferredMenuElementCompletionBlock];

  if (v4)
  {
    [(CNActionMenuHelper *)self setDisplayedMenuItems:v7];
    v5 = [(CNActionMenuHelper *)self deferredMenuElementCompletionBlock];
    v6 = [(CNActionMenuHelper *)self displayedMenuItems];
    ((void (**)(void, void *))v5)[2](v5, v6);

    [(CNActionMenuHelper *)self setDeferredMenuItem:0];
    [(CNActionMenuHelper *)self setDeferredMenuElementCompletionBlock:0];
  }
}

- (void)setupDeferredMenuItem
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CNActionMenuHelper_setupDeferredMenuItem__block_invoke;
  v4[3] = &unk_1E549BF58;
  v4[4] = self;
  id v3 = [MEMORY[0x1E4FB16B8] elementWithProvider:v4];
  [(CNActionMenuHelper *)self setDeferredMenuItem:v3];
}

void __43__CNActionMenuHelper_setupDeferredMenuItem__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) displayedMenuItems];
  id v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [*(id *)(a1 + 32) deferredMenuItem];
  if (v4 != v5)
  {

LABEL_3:
    [*(id *)(a1 + 32) setDeferredMenuElementCompletionBlock:v9];
    goto LABEL_6;
  }
  v6 = [*(id *)(a1 + 32) currentMenuItems];

  if (!v6) {
    goto LABEL_3;
  }
  id v7 = [*(id *)(a1 + 32) currentMenuItems];
  [*(id *)(a1 + 32) setDisplayedMenuItems:v7];

  v8 = [*(id *)(a1 + 32) displayedMenuItems];
  v9[2](v9, v8);

  [*(id *)(a1 + 32) setDeferredMenuItem:0];
LABEL_6:
}

- (void)updateVisibleMenuWithMenuItems:(id)a3 contextMenuInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__CNActionMenuHelper_updateVisibleMenuWithMenuItems_contextMenuInteraction___block_invoke;
  v9[3] = &unk_1E549BF30;
  id v11 = v12;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  [v7 updateVisibleMenuWithBlock:v9];

  _Block_object_dispose(v12, 8);
}

id __76__CNActionMenuHelper_updateVisibleMenuWithMenuItems_contextMenuInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    id v6 = v3;
  }
  else
  {
    *(unsigned char *)(v5 + 24) = 1;
    [*(id *)(a1 + 32) setDisplayedMenuItems:*(void *)(a1 + 40)];
    id v7 = [*(id *)(a1 + 32) displayedMenuItems];
    id v6 = [v4 menuByReplacingChildren:v7];
  }

  return v6;
}

- (void)updateWithMenuItems:(id)a3 contextMenuInteraction:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 count])
  {
    id v7 = [(CNActionMenuHelper *)self deferredMenuItem];

    if (v7)
    {
      [(CNActionMenuHelper *)self replaceDeferredMenuItemWithMenuItems:v10];
    }
    else
    {
      BOOL v8 = [(CNActionMenuHelper *)self isMenuDisplayed];
      id v9 = v10;
      if (!v8)
      {
LABEL_7:
        [(CNActionMenuHelper *)self setCurrentMenuItems:v9];
        goto LABEL_8;
      }
      [(CNActionMenuHelper *)self updateVisibleMenuWithMenuItems:v10 contextMenuInteraction:v6];
    }
    id v9 = v10;
    goto LABEL_7;
  }
LABEL_8:
}

- (id)targetedPreviewForSourceView:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v3 parameters:v4];

  return v6;
}

- (id)menuForProviders
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNActionMenuHelper *)self currentMenuItems];
  [(CNActionMenuHelper *)self setDisplayedMenuItems:v3];

  id v4 = [(CNActionMenuHelper *)self displayedMenuItems];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    [(CNActionMenuHelper *)self setupDeferredMenuItem];
    id v6 = [(CNActionMenuHelper *)self deferredMenuItem];
    v15[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(CNActionMenuHelper *)self setDisplayedMenuItems:v7];
  }
  BOOL v8 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v9 = [(CNActionMenuHelper *)self menuTitle];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_1ED8AC728;
  }
  v12 = [(CNActionMenuHelper *)self displayedMenuItems];
  char v13 = [v8 menuWithTitle:v11 children:v12];

  return v13;
}

- (id)menuProviderWithActionBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CNActionMenuHelper_menuProviderWithActionBlock___block_invoke;
  v8[3] = &unk_1E549BF08;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(v8);

  return v6;
}

uint64_t __50__CNActionMenuHelper_menuProviderWithActionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 menuForProviders];
}

- (id)configurationActionProviderWithActionBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CNActionMenuHelper_configurationActionProviderWithActionBlock___block_invoke;
  v8[3] = &unk_1E549BEE0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(v8);

  return v6;
}

uint64_t __65__CNActionMenuHelper_configurationActionProviderWithActionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 menuForProviders];
}

@end