@interface HULinkedApplicationInternalSideloadItem
- (HULinkedApplicationInternalSideloadItem)initWithBundleIdentifier:(id)a3;
- (HULinkedApplicationInternalSideloadItem)initWithBundleIdentifier:(id)a3 associatedAccessories:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HULinkedApplicationInternalSideloadItem

- (HULinkedApplicationInternalSideloadItem)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationInternalSideloadItem;
  v6 = [(HULinkedApplicationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (HULinkedApplicationInternalSideloadItem)initWithBundleIdentifier:(id)a3 associatedAccessories:(id)a4
{
  id v6 = a4;
  v7 = [(HULinkedApplicationInternalSideloadItem *)self initWithBundleIdentifier:a3];
  v8 = v7;
  if (v7) {
    [(HULinkedApplicationItem *)v7 setAssociatedAccessories:v6];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HULinkedApplicationInternalSideloadItem *)self bundleIdentifier];
  id v6 = (void *)[v5 copy];
  v7 = [(HULinkedApplicationItem *)self associatedAccessories];
  v8 = (void *)[v4 initWithBundleIdentifier:v6 associatedAccessories:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HULinkedApplicationInternalSideloadItem;
  id v4 = [(HULinkedApplicationItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HULinkedApplicationInternalSideloadItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

id __71__HULinkedApplicationInternalSideloadItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = NSNumber;
  id v5 = (void *)MEMORY[0x1E4F68EE8];
  id v6 = [*(id *)(a1 + 32) bundleIdentifier];
  v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "canHandleBundleID:", v6));
  [v3 setObject:v7 forKeyedSubscript:@"HFResultApplicationIsInstalled"];

  objc_super v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v8;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end