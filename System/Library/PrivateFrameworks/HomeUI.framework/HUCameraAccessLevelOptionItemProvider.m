@interface HUCameraAccessLevelOptionItemProvider
- (HMHome)home;
- (HMUser)user;
- (HUCameraAccessLevelOptionItemProvider)init;
- (HUCameraAccessLevelOptionItemProvider)initWithUser:(id)a3 home:(id)a4;
- (NSMutableSet)items;
- (id)invalidationReasons;
- (id)reloadItems;
@end

@implementation HUCameraAccessLevelOptionItemProvider

- (HUCameraAccessLevelOptionItemProvider)initWithUser:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraAccessLevelOptionItemProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    uint64_t v11 = objc_opt_new();
    items = v10->_items;
    v10->_items = (NSMutableSet *)v11;
  }
  return v10;
}

- (HUCameraAccessLevelOptionItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithUser_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraAccessLevelOptionItemProvider.m", 61, @"%s is unavailable; use %@ instead",
    "-[HUCameraAccessLevelOptionItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_1E6386EF8;
  objc_copyWeak(&v9, &location);
  v3 = [(HFItemProvider *)self reloadItemsWithObjects:&unk_1F19B5660 keyAdaptor:&__block_literal_global_38 itemAdaptor:&__block_literal_global_41_0 filter:0 itemMap:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_5;
  v6[3] = &unk_1E6385B38;
  objc_copyWeak(&v7, &location);
  v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v4;
}

id __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 accessLevel];

  return [v2 numberWithUnsignedInteger:v3];
}

HUCameraAccessLevelOptionItem *__52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained items];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6386108;
  id v6 = v3;
  id v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  id v7 = (HUCameraAccessLevelOptionItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = [HUCameraAccessLevelOptionItem alloc];
    id v9 = [WeakRetained user];
    v10 = [WeakRetained home];
    id v7 = -[HUCameraAccessLevelOptionItem initWithUser:home:accessLevel:](v8, "initWithUser:home:accessLevel:", v9, v10, [v6 unsignedIntegerValue]);
  }

  return v7;
}

BOOL __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 accessLevel];
    BOOL v8 = v7 == [*(id *)(a1 + 32) unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __52__HUCameraAccessLevelOptionItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained items];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained items];
  BOOL v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUCameraAccessLevelOptionItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMUser)user
{
  return self->_user;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end