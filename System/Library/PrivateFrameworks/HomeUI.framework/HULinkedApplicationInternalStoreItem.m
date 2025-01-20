@interface HULinkedApplicationInternalStoreItem
- (HULinkedApplicationInternalStoreItem)initWithBundleIdentifier:(id)a3;
- (HULinkedApplicationInternalStoreItem)initWithBundleIdentifier:(id)a3 associatedAccessories:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HULinkedApplicationInternalStoreItem

- (HULinkedApplicationInternalStoreItem)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationInternalStoreItem;
  v6 = [(HULinkedApplicationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (HULinkedApplicationInternalStoreItem)initWithBundleIdentifier:(id)a3 associatedAccessories:(id)a4
{
  id v6 = a4;
  v7 = [(HULinkedApplicationInternalStoreItem *)self initWithBundleIdentifier:a3];
  v8 = v7;
  if (v7) {
    [(HULinkedApplicationItem *)v7 setAssociatedAccessories:v6];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HULinkedApplicationInternalStoreItem *)self bundleIdentifier];
  id v6 = (void *)[v5 copy];
  v7 = [(HULinkedApplicationItem *)self associatedAccessories];
  v8 = (void *)[v4 initWithBundleIdentifier:v6 associatedAccessories:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HULinkedApplicationInternalStoreItem;
  id v5 = [(HULinkedApplicationItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__HULinkedApplicationInternalStoreItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  id v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __68__HULinkedApplicationInternalStoreItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)[v3 mutableCopy];

  id v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = NSString;
  v8 = [WeakRetained bundleIdentifier];
  id v9 = [v7 stringWithFormat:@"https://appshack.swe.apple.com/apps/%@", v8];
  objc_super v10 = [v6 URLWithString:v9];
  [v5 setObject:v10 forKeyedSubscript:@"HFResultApplicationStoreURL"];

  v11 = NSNumber;
  v12 = (void *)MEMORY[0x1E4F68EE8];
  v13 = [WeakRetained bundleIdentifier];
  v14 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "canHandleBundleID:", v13));
  [v5 setObject:v14 forKeyedSubscript:@"HFResultApplicationIsInstalled"];

  v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v15;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end