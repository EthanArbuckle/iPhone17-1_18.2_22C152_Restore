@interface HFBiomeUsageCountsByRoomFetchRequest
- (HFBiomeUsageCountsByRoomFetchRequest)initWithHome:(id)a3;
- (NSMapTable)accessoryRepresentablesByUniqueIdentifier;
- (NSMapTable)roomsByUniqueIdentifier;
- (NSMapTable)usageCountByAccessoryRepresentableByRoom;
- (id)_accessoryRepresentableWithUniqueIdentifierString:(id)a3 uniqueIdentifierToAccessoryRepesentableBlock:(id)a4;
- (id)_roomWithUniqueIdentifierString:(id)a3 uniqueIdentifierToRoomBlock:(id)a4;
- (id)filter;
- (void)_incrementUsageCountForAccessoryRepresentable:(id)a3 inRoom:(id)a4;
- (void)eventHandler:(id)a3;
- (void)setAccessoryRepresentablesByUniqueIdentifier:(id)a3;
- (void)setFilter:(id)a3;
- (void)setRoomsByUniqueIdentifier:(id)a3;
- (void)setUsageCountByAccessoryRepresentableByRoom:(id)a3;
@end

@implementation HFBiomeUsageCountsByRoomFetchRequest

- (HFBiomeUsageCountsByRoomFetchRequest)initWithHome:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFBiomeUsageCountsByRoomFetchRequest;
  v3 = [(HFBiomeAbstractFetchRequest *)&v11 initWithHome:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    usageCountByAccessoryRepresentableByRoom = v3->_usageCountByAccessoryRepresentableByRoom;
    v3->_usageCountByAccessoryRepresentableByRoom = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    roomsByUniqueIdentifier = v3->_roomsByUniqueIdentifier;
    v3->_roomsByUniqueIdentifier = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    accessoryRepresentablesByUniqueIdentifier = v3->_accessoryRepresentablesByUniqueIdentifier;
    v3->_accessoryRepresentablesByUniqueIdentifier = (NSMapTable *)v8;
  }
  return v3;
}

- (void)eventHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventBody];
  if (v5)
  {
    objc_initWeak(location, self);
    uint64_t v6 = [v5 roomUniqueIdentifier];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke;
    v24[3] = &unk_264094CD8;
    objc_copyWeak(&v25, location);
    v7 = [(HFBiomeUsageCountsByRoomFetchRequest *)self _roomWithUniqueIdentifierString:v6 uniqueIdentifierToRoomBlock:v24];

    uint64_t v8 = [v5 serviceGroupUniqueIdentifier];

    if (v8)
    {
      v9 = [v5 serviceGroupUniqueIdentifier];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_2;
      v22[3] = &unk_264094D00;
      objc_copyWeak(&v23, location);
      v10 = [(HFBiomeUsageCountsByRoomFetchRequest *)self _accessoryRepresentableWithUniqueIdentifierString:v9 uniqueIdentifierToAccessoryRepesentableBlock:v22];

      [(HFBiomeUsageCountsByRoomFetchRequest *)self _incrementUsageCountForAccessoryRepresentable:v10 inRoom:v7];
      objc_destroyWeak(&v23);
    }
    objc_super v11 = [v5 accessoryUniqueIdentifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_3;
    v20[3] = &unk_264094D00;
    objc_copyWeak(&v21, location);
    v12 = [(HFBiomeUsageCountsByRoomFetchRequest *)self _accessoryRepresentableWithUniqueIdentifierString:v11 uniqueIdentifierToAccessoryRepesentableBlock:v20];

    [(HFBiomeUsageCountsByRoomFetchRequest *)self _incrementUsageCountForAccessoryRepresentable:v12 inRoom:v7];
    v13 = [v5 serviceUniqueIdentifier];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_4;
    v18 = &unk_264094D00;
    objc_copyWeak(&v19, location);
    v14 = [(HFBiomeUsageCountsByRoomFetchRequest *)self _accessoryRepresentableWithUniqueIdentifierString:v13 uniqueIdentifierToAccessoryRepesentableBlock:&v15];

    -[HFBiomeUsageCountsByRoomFetchRequest _incrementUsageCountForAccessoryRepresentable:inRoom:](self, "_incrementUsageCountForAccessoryRepresentable:inRoom:", v14, v7, v15, v16, v17, v18);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
  }
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_roomWithIdentifier:", v3);

  return v6;
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceGroupWithIdentifier:", v3);

  v7 = [WeakRetained filter];
  if (((unsigned int (**)(void, void *))v7)[2](v7, v6)) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_accessoryWithIdentifier:", v3);

  v7 = [WeakRetained filter];
  if (((unsigned int (**)(void, void *))v7)[2](v7, v6)) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceWithIdentifier:", v3);

  v7 = [WeakRetained filter];
  if (((unsigned int (**)(void, void *))v7)[2](v7, v6)) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (void)_incrementUsageCountForAccessoryRepresentable:(id)a3 inRoom:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v14 = v6;
    id v7 = a3;
    uint64_t v8 = [(HFBiomeUsageCountsByRoomFetchRequest *)self usageCountByAccessoryRepresentableByRoom];
    id v9 = [v8 objectForKey:v14];

    if (!v9)
    {
      id v9 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v10 = [(HFBiomeUsageCountsByRoomFetchRequest *)self usageCountByAccessoryRepresentableByRoom];
      [v10 setObject:v9 forKey:v14];
    }
    objc_super v11 = [v9 objectForKey:v7];
    uint64_t v12 = [v11 unsignedIntegerValue];

    v13 = [NSNumber numberWithUnsignedInteger:v12 + 1];
    [v9 setObject:v13 forKey:v7];

    id v6 = v14;
  }
}

- (id)_accessoryRepresentableWithUniqueIdentifierString:(id)a3 uniqueIdentifierToAccessoryRepesentableBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = (objc_class *)MEMORY[0x263F08C38];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithUUIDString:v8];

  v10 = [(HFBiomeUsageCountsByRoomFetchRequest *)self accessoryRepresentablesByUniqueIdentifier];
  objc_super v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    objc_super v11 = v6[2](v6, v9);
    uint64_t v12 = [(HFBiomeUsageCountsByRoomFetchRequest *)self accessoryRepresentablesByUniqueIdentifier];
    [v12 setObject:v11 forKey:v9];
  }
  return v11;
}

- (id)_roomWithUniqueIdentifierString:(id)a3 uniqueIdentifierToRoomBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = (objc_class *)MEMORY[0x263F08C38];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithUUIDString:v8];

  v10 = [(HFBiomeUsageCountsByRoomFetchRequest *)self roomsByUniqueIdentifier];
  objc_super v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    objc_super v11 = v6[2](v6, v9);
    uint64_t v12 = [(HFBiomeUsageCountsByRoomFetchRequest *)self roomsByUniqueIdentifier];
    [v12 setObject:v11 forKey:v9];
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

- (NSMapTable)usageCountByAccessoryRepresentableByRoom
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsageCountByAccessoryRepresentableByRoom:(id)a3
{
}

- (NSMapTable)roomsByUniqueIdentifier
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRoomsByUniqueIdentifier:(id)a3
{
}

- (NSMapTable)accessoryRepresentablesByUniqueIdentifier
{
  return (NSMapTable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAccessoryRepresentablesByUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRepresentablesByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_roomsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_usageCountByAccessoryRepresentableByRoom, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end