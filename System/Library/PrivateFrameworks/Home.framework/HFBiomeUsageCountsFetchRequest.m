@interface HFBiomeUsageCountsFetchRequest
- (HFBiomeUsageCountsFetchRequest)initWithHome:(id)a3;
- (NSMapTable)accessoryRepresentablesByUniqueIdentifier;
- (NSMapTable)usageCountByAccessoryRepresentable;
- (id)_accessoryRepresentableWithUniqueIdentifierString:(id)a3 uniqueIdentifierToAccessoryRepesentableBlock:(id)a4;
- (id)filter;
- (void)_incrementUsageCountForAccessoryRepresentable:(id)a3;
- (void)eventHandler:(id)a3;
- (void)setAccessoryRepresentablesByUniqueIdentifier:(id)a3;
- (void)setFilter:(id)a3;
- (void)setUsageCountByAccessoryRepresentable:(id)a3;
@end

@implementation HFBiomeUsageCountsFetchRequest

- (HFBiomeUsageCountsFetchRequest)initWithHome:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HFBiomeUsageCountsFetchRequest;
  v3 = [(HFBiomeAbstractFetchRequest *)&v9 initWithHome:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    usageCountByAccessoryRepresentable = v3->_usageCountByAccessoryRepresentable;
    v3->_usageCountByAccessoryRepresentable = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    accessoryRepresentablesByUniqueIdentifier = v3->_accessoryRepresentablesByUniqueIdentifier;
    v3->_accessoryRepresentablesByUniqueIdentifier = (NSMapTable *)v6;
  }
  return v3;
}

- (void)eventHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventBody];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 serviceGroupUniqueIdentifier];

    if (v7)
    {
      objc_initWeak(&location, self);
      v8 = [v6 serviceGroupUniqueIdentifier];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke;
      v21[3] = &unk_264094D00;
      objc_copyWeak(&v22, &location);
      objc_super v9 = [(HFBiomeUsageCountsFetchRequest *)self _accessoryRepresentableWithUniqueIdentifierString:v8 uniqueIdentifierToAccessoryRepesentableBlock:v21];

      [(HFBiomeUsageCountsFetchRequest *)self _incrementUsageCountForAccessoryRepresentable:v9];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    objc_initWeak(&location, self);
    v10 = [v6 accessoryUniqueIdentifier];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_2;
    v19[3] = &unk_264094D00;
    objc_copyWeak(&v20, &location);
    v11 = [(HFBiomeUsageCountsFetchRequest *)self _accessoryRepresentableWithUniqueIdentifierString:v10 uniqueIdentifierToAccessoryRepesentableBlock:v19];

    [(HFBiomeUsageCountsFetchRequest *)self _incrementUsageCountForAccessoryRepresentable:v11];
    v12 = [v6 serviceUniqueIdentifier];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_3;
    v17 = &unk_264094D00;
    objc_copyWeak(&v18, &location);
    v13 = [(HFBiomeUsageCountsFetchRequest *)self _accessoryRepresentableWithUniqueIdentifierString:v12 uniqueIdentifierToAccessoryRepesentableBlock:&v14];

    -[HFBiomeUsageCountsFetchRequest _incrementUsageCountForAccessoryRepresentable:](self, "_incrementUsageCountForAccessoryRepresentable:", v13, v14, v15, v16, v17);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

id __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceGroupWithIdentifier:", v3);

  v7 = [WeakRetained filter];
  if (((unsigned int (**)(void, void *))v7)[2](v7, v6)) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

id __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_accessoryWithIdentifier:", v3);

  v7 = [WeakRetained filter];
  if (((unsigned int (**)(void, void *))v7)[2](v7, v6)) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

id __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceWithIdentifier:", v3);

  v7 = [WeakRetained filter];
  if (((unsigned int (**)(void, void *))v7)[2](v7, v6)) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (void)_incrementUsageCountForAccessoryRepresentable:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(HFBiomeUsageCountsFetchRequest *)self usageCountByAccessoryRepresentable];
    uint64_t v6 = [v5 objectForKey:v4];
    uint64_t v7 = [v6 unsignedIntegerValue];

    id v9 = [(HFBiomeUsageCountsFetchRequest *)self usageCountByAccessoryRepresentable];
    v8 = [NSNumber numberWithUnsignedInteger:v7 + 1];
    [v9 setObject:v8 forKey:v4];
  }
}

- (id)_accessoryRepresentableWithUniqueIdentifierString:(id)a3 uniqueIdentifierToAccessoryRepesentableBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263F08C38];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithUUIDString:v8];

  v10 = [(HFBiomeUsageCountsFetchRequest *)self accessoryRepresentablesByUniqueIdentifier];
  v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    v11 = v6[2](v6, v9);
    if (v11)
    {
      v12 = [(HFBiomeUsageCountsFetchRequest *)self accessoryRepresentablesByUniqueIdentifier];
      [v12 setObject:v11 forKey:v9];
    }
  }

  return v11;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSMapTable)usageCountByAccessoryRepresentable
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsageCountByAccessoryRepresentable:(id)a3
{
}

- (NSMapTable)accessoryRepresentablesByUniqueIdentifier
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccessoryRepresentablesByUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRepresentablesByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_usageCountByAccessoryRepresentable, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end