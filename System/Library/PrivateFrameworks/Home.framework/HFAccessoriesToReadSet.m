@interface HFAccessoriesToReadSet
- (HFAccessoriesToReadSet)initWithTransportType:(id)a3;
- (NSMutableDictionary)accessories;
- (NSNumber)transportKey;
- (int64_t)count;
- (void)addCharacteristic:(id)a3;
- (void)markCharacteristicAsRead:(id)a3 withLogger:(id)a4;
- (void)setAccessories:(id)a3;
- (void)setTransportKey:(id)a3;
@end

@implementation HFAccessoriesToReadSet

- (void)markCharacteristicAsRead:(id)a3 withLogger:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 service];
  v9 = [v8 accessory];

  v10 = [(HFAccessoriesToReadSet *)self accessories];
  v11 = [v9 uniqueIdentifier];
  v12 = [v10 objectForKeyedSubscript:v11];

  uint64_t v13 = [v12 count];
  [v12 removeObject:v7];

  if (![v12 count])
  {
    v14 = [(HFAccessoriesToReadSet *)self accessories];
    v15 = [v9 uniqueIdentifier];
    [v14 removeObjectForKey:v15];

    if (v13)
    {
      if (v6)
      {
        v16 = objc_msgSend(v6, "loggerActivity", 0, 0);
        os_activity_scope_enter(v16, &v27);

        v17 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [(HFAccessoriesToReadSet *)self accessories];
          uint64_t v19 = [v18 count];
          v20 = [(HFAccessoriesToReadSet *)self transportKey];
          v21 = +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", [v20 integerValue]);
          *(_DWORD *)buf = 138412802;
          v29 = v9;
          __int16 v30 = 2048;
          uint64_t v31 = v19;
          __int16 v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: All reads complete for accessory: %@ (%lu %@ accessories remaining)", buf, 0x20u);
        }
        os_activity_scope_leave(&v27);
      }
      else
      {
        v22 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [(HFAccessoriesToReadSet *)self accessories];
          uint64_t v24 = [v23 count];
          v25 = [(HFAccessoriesToReadSet *)self transportKey];
          v26 = +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", [v25 integerValue]);
          *(_DWORD *)buf = 138412802;
          v29 = v9;
          __int16 v30 = 2048;
          uint64_t v31 = v24;
          __int16 v32 = 2112;
          v33 = v26;
          _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: All reads complete for accessory: %@ (%lu %@ accessories remaining)", buf, 0x20u);
        }
      }
    }
  }
}

- (int64_t)count
{
  v2 = [(HFAccessoriesToReadSet *)self accessories];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)addCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = [v4 service];
  id v9 = [v5 accessory];

  id v6 = [(HFAccessoriesToReadSet *)self accessories];
  id v7 = [v9 uniqueIdentifier];
  v8 = objc_msgSend(v6, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_89);

  [v8 addObject:v4];
}

- (NSNumber)transportKey
{
  return self->_transportKey;
}

- (HFAccessoriesToReadSet)initWithTransportType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFAccessoriesToReadSet;
  id v6 = [(HFAccessoriesToReadSet *)&v10 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessories = v6->_accessories;
    v6->_accessories = v7;

    objc_storeStrong((id *)&v6->_transportKey, a3);
  }

  return v6;
}

id __44__HFAccessoriesToReadSet_addCharacteristic___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  return v0;
}

- (void)setAccessories:(id)a3
{
}

- (void)setTransportKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportKey, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end