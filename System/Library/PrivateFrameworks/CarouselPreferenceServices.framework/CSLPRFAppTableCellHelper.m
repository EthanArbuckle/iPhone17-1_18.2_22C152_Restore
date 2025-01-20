@interface CSLPRFAppTableCellHelper
- (CSLPRFAppTableCellHelper)initWithTableCell:(id)a3;
- (id)blankIcon;
- (id)getLazyIcon;
@end

@implementation CSLPRFAppTableCellHelper

- (void).cxx_destruct
{
}

- (id)getLazyIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableCell);
  v4 = [WeakRetained getLazyIconID];

  if (v4)
  {
    v5 = +[CSLPRFIconCache sharedIconCache];
    v6 = [v5 iconForName:v4 fallBackToPersistentStoreIfNecessary:0];

    if (v6) {
      goto LABEL_10;
    }
    v7 = self;
    objc_sync_enter(v7);
    if (!v7->_requestInProgress)
    {
      v7->_requestInProgress = 1;
      objc_initWeak(&location, v7);
      v8 = [MEMORY[0x263F82B60] mainScreen];
      v9 = [v8 traitCollection];
      [v9 displayScale];
      double v11 = v10;

      v12 = [MEMORY[0x263F57788] sharedInstance];
      if (v11 <= 2.0) {
        uint64_t v13 = 47;
      }
      else {
        uint64_t v13 = 48;
      }
      v14 = dispatch_get_global_queue(0, 0);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __39__CSLPRFAppTableCellHelper_getLazyIcon__block_invoke;
      v16[3] = &unk_264A0B548;
      objc_copyWeak(&v18, &location);
      id v17 = v4;
      [v12 getIconForBundleID:v17 iconVariant:v13 queue:v14 block:v16 timeout:60.0];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v7);
  }
  v6 = 0;
LABEL_10:

  return v6;
}

void __39__CSLPRFAppTableCellHelper_getLazyIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = +[CSLPRFIconCache sharedIconCache];
      [v5 setIcon:v3 forName:*(void *)(a1 + 32)];

      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __39__CSLPRFAppTableCellHelper_getLazyIcon__block_invoke_2;
      v7[3] = &unk_264A0BCA8;
      v7[4] = WeakRetained;
      id v8 = v3;
      dispatch_async(MEMORY[0x263EF83A0], v7);
    }
    v6 = WeakRetained;
    objc_sync_enter(v6);
    v6[8] = 0;
    objc_sync_exit(v6);
  }
}

void __39__CSLPRFAppTableCellHelper_getLazyIcon__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained setIcon:*(void *)(a1 + 40)];
}

- (id)blankIcon
{
  p_tableCell = &self->_tableCell;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableCell);
  v4 = [WeakRetained getLazyIconID];

  v5 = +[CSLPRFIconCache sharedIconCache];
  v6 = [v5 iconForName:v4 fallBackToPersistentStoreIfNecessary:1];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_tableCell);
    id v8 = [v7 specifier];
    v9 = [v8 propertyForKey:*MEMORY[0x263F60148]];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      uint64_t v11 = [v6 imageFlippedForRightToLeftLayoutDirection];

      v6 = (void *)v11;
    }
  }

  return v6;
}

- (CSLPRFAppTableCellHelper)initWithTableCell:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSLPRFAppTableCellHelper;
  v5 = [(CSLPRFAppTableCellHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_tableCell, v4);
  }

  return v6;
}

@end