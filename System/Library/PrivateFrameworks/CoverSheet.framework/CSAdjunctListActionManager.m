@interface CSAdjunctListActionManager
- (BOOL)_actionIsInRelevantSlot:(id)a3;
- (BOOL)_handleLockScreenContentAction:(id)a3;
- (BOOL)handleAction:(id)a3 forProvider:(id)a4;
- (BOOL)handlesActionWithClass:(Class)a3;
- (CSAdjunctListActionManager)initWithItemDestination:(id)a3;
- (CSItemDestination)itemDestination;
- (void)setItemDestination:(id)a3;
@end

@implementation CSAdjunctListActionManager

- (CSAdjunctListActionManager)initWithItemDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSAdjunctListActionManager;
  v6 = [(CSAdjunctListActionManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemDestination, a3);
  }

  return v7;
}

- (BOOL)handlesActionWithClass:(Class)a3
{
  uint64_t v4 = objc_opt_class();

  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (BOOL)handleAction:(id)a3 forProvider:(id)a4
{
  id v5 = a3;
  if ([v5 isValid])
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v10 = v8;

    if ([(CSAdjunctListActionManager *)self _actionIsInRelevantSlot:v10]) {
      BOOL v9 = [(CSAdjunctListActionManager *)self _handleLockScreenContentAction:v10];
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_actionIsInRelevantSlot:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 slot];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4FA7040]];

  return v4;
}

- (BOOL)_handleLockScreenContentAction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 isValid])
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [v5 identifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke;
    v12[3] = &unk_1E6ADA888;
    id v7 = v6;
    id v13 = v7;
    objc_copyWeak(&v14, &location);
    [v5 setNullificationHandler:v12];
    v8 = [CSAdjunctListItem alloc];
    BOOL v9 = [v5 identifier];
    id v10 = [(CSAdjunctListItem *)v8 initWithIdentifier:v9];

    [(CSAdjunctListItem *)v10 addAction:v5];
    [(CSItemDestination *)self->_itemDestination addOrUpdateItem:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Setting content action nullification handler with identifier: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke_1;
  v4[3] = &unk_1E6AD9390;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v6);
}

void __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke_1(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[1] removeItemForIdentifier:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (CSItemDestination)itemDestination
{
  return self->_itemDestination;
}

- (void)setItemDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end