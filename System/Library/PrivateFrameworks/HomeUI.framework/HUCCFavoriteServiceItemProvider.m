@interface HUCCFavoriteServiceItemProvider
- (HMHome)home;
- (HUCCFavoriteServiceItemProvider)init;
- (HUCCFavoriteServiceItemProvider)initWithHome:(id)a3;
- (NSMutableSet)serviceLikeItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)maximumNumberOfItems;
- (void)setMaximumNumberOfItems:(unint64_t)a3;
- (void)setServiceLikeItems:(id)a3;
@end

@implementation HUCCFavoriteServiceItemProvider

- (HUCCFavoriteServiceItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCCFavoriteServiceItemProvider.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUCCFavoriteServiceItemProvider init]",
    v5);

  return 0;
}

- (HUCCFavoriteServiceItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUCCFavoriteServiceItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    serviceLikeItems = v7->_serviceLikeItems;
    v7->_serviceLikeItems = (NSMutableSet *)v8;

    v7->_maximumNumberOfItems = -1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUCCFavoriteServiceItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = (void *)MEMORY[0x1E4F69218];
  id v4 = [(HUCCFavoriteServiceItemProvider *)self home];
  id v5 = objc_msgSend(v3, "favoriteServicesForHome:withLimit:", v4, -[HUCCFavoriteServiceItemProvider maximumNumberOfItems](self, "maximumNumberOfItems"));

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6385A98;
  objc_copyWeak(&v13, &location);
  v6 = _Block_copy(aBlock);
  v7 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:0 itemMap:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E6385B38;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

id __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained home];
  v6 = objc_msgSend(v5, "hf_characteristicValueManager");

  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    if (objc_msgSend(v9, "hf_isMediaAccessory"))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F69280]);
      id v11 = [v9 mediaProfile];
      v12 = (void *)[v10 initWithValueSource:v6 mediaProfileContainer:v11];
    }
    else
    {
      if (objc_msgSend(v9, "hf_isProgrammableSwitch"))
      {
        v16 = (objc_class *)MEMORY[0x1E4F69420];
      }
      else if (objc_msgSend(v9, "hf_isRemoteControl"))
      {
        v16 = (objc_class *)MEMORY[0x1E4F69628];
      }
      else
      {
        v16 = (objc_class *)MEMORY[0x1E4F68E18];
      }
      v12 = (void *)[[v16 alloc] initWithAccessory:v9 valueSource:v6];
    }
  }
  else
  {
    objc_opt_class();
    id v13 = v7;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(MEMORY[0x1E4F69550], "itemClassForService:", v15)), "initWithValueSource:service:", v6, v15);
    }
    else
    {
      objc_opt_class();
      id v17 = v13;
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;

      if (v19)
      {
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F69538]) initWithValueSource:v6 serviceGroup:v19];
      }
      else
      {
        objc_opt_class();
        id v20 = v17;
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F69280]) initWithValueSource:v6 mediaProfileContainer:v22];
        }
        else
        {
          NSLog(&cfstr_UnsupportedHom_0.isa, v20);
          v12 = 0;
        }
      }
    }
  }

  return v12;
}

id __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained serviceLikeItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained serviceLikeItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUCCFavoriteServiceItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686B0];
  v8[0] = *MEMORY[0x1E4F686E0];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E4F686C0];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  id v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (unint64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (void)setMaximumNumberOfItems:(unint64_t)a3
{
  self->_maximumNumberOfItems = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (void)setServiceLikeItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end