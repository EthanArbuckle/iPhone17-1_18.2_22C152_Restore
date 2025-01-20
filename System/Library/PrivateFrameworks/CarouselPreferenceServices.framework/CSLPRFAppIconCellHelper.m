@interface CSLPRFAppIconCellHelper
- (CSLPRFAppIconCellHelper)init;
- (CSLPRFAppIconCellHelperDelegate)delegate;
- (id)blankIcon;
- (id)fetchLazyIconForSpecifier:(id)a3;
- (void)didCompleteLoadForIdentifier:(id)a3;
- (void)loadIconForSpecifier:(id)a3 iconIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CSLPRFAppIconCellHelper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFAppIconCellHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFAppIconCellHelperDelegate *)WeakRetained;
}

- (void)didCompleteLoadForIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_outstandingRequests objectForKey:v4];
  [(NSMutableDictionary *)self->_outstandingRequests removeObjectForKey:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x263F60188];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "propertyForKey:", v10, (void)v16);
        int v14 = [v13 isEqual:v4];

        if (v14)
        {
          v15 = [(CSLPRFAppIconCellHelper *)self delegate];
          [v15 appIconCellHelper:self reloadSpecifier:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)loadIconForSpecifier:(id)a3 iconIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_outstandingRequests objectForKey:v7];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    [(NSMutableDictionary *)self->_outstandingRequests setObject:v8 forKey:v7];
  }
  if (([v8 containsObject:v6] & 1) == 0)
  {
    uint64_t v9 = [v8 count];
    [v8 addObject:v6];
    if (!v9)
    {
      objc_initWeak(&location, self);
      uint64_t v10 = [MEMORY[0x263F82B60] mainScreen];
      v11 = [v10 traitCollection];
      [v11 displayScale];
      double v13 = v12;

      int v14 = [MEMORY[0x263F57788] sharedInstance];
      if (v13 <= 2.0) {
        uint64_t v15 = 47;
      }
      else {
        uint64_t v15 = 48;
      }
      long long v16 = dispatch_get_global_queue(0, 0);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__CSLPRFAppIconCellHelper_loadIconForSpecifier_iconIdentifier___block_invoke;
      v17[3] = &unk_264A0B548;
      objc_copyWeak(&v19, &location);
      id v18 = v7;
      [v14 getIconForBundleID:v18 iconVariant:v15 queue:v16 block:v17 timeout:60.0];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __63__CSLPRFAppIconCellHelper_loadIconForSpecifier_iconIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = +[CSLPRFIconCache sharedIconCache];
      [v5 setIcon:v3 forName:*(void *)(a1 + 32)];
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__CSLPRFAppIconCellHelper_loadIconForSpecifier_iconIdentifier___block_invoke_2;
    v6[3] = &unk_264A0BCA8;
    v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __63__CSLPRFAppIconCellHelper_loadIconForSpecifier_iconIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteLoadForIdentifier:*(void *)(a1 + 40)];
}

- (id)fetchLazyIconForSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:*MEMORY[0x263F601A8]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [v4 propertyForKey:*MEMORY[0x263F60188]];
    if (v7)
    {
      uint64_t v8 = +[CSLPRFIconCache sharedIconCache];
      uint64_t v9 = [v8 iconForName:v7 fallBackToPersistentStoreIfNecessary:0];

      if (v9
        || (-[CSLPRFAppIconCellHelper loadIconForSpecifier:iconIdentifier:](self, "loadIconForSpecifier:iconIdentifier:", v4, v7), +[CSLPRFIconCache sharedIconCache](CSLPRFIconCache, "sharedIconCache"), v10 = objc_claimAutoreleasedReturnValue(), [v10 iconForName:v7 fallBackToPersistentStoreIfNecessary:1], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v10, v9))
      {
        [v4 setProperty:v9 forKey:*MEMORY[0x263F60140]];
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)blankIcon
{
  return 0;
}

- (CSLPRFAppIconCellHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFAppIconCellHelper;
  v2 = [(CSLPRFAppIconCellHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end