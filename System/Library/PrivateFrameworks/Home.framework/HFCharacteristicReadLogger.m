@interface HFCharacteristicReadLogger
+ (id)nameForTransportType:(unint64_t)a3;
+ (id)transportKeyForCharacteristic:(id)a3;
- (HFCharacteristicReadLogger)init;
- (NSMutableDictionary)accessoriesToReadByTransport;
- (unint64_t)numberOfAccessoriesForTransportType:(unint64_t)a3;
- (void)addCharacteristic:(id)a3 withUpdateLogger:(id)a4;
- (void)markCharacteristicAsRead:(id)a3 withLogger:(id)a4;
- (void)setAccessoriesToReadByTransport:(id)a3;
@end

@implementation HFCharacteristicReadLogger

- (HFCharacteristicReadLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFCharacteristicReadLogger;
  v2 = [(HFCharacteristicReadLogger *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessoriesToReadByTransport = v2->_accessoriesToReadByTransport;
    v2->_accessoriesToReadByTransport = v3;
  }
  return v2;
}

- (void)addCharacteristic:(id)a3 withUpdateLogger:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HFCharacteristicReadLogger transportKeyForCharacteristic:v6];
  if (v7)
  {
    v9 = objc_msgSend(v7, "loggerActivity", 0, 0);
    os_activity_scope_enter(v9, &v26);

    v10 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", [v8 integerValue]);
      v12 = [v6 service];
      v13 = [v12 accessory];
      v14 = [v13 name];
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: %@ Accessory: %@", buf, 0x16u);
    }
    os_activity_scope_leave(&v26);
  }
  else
  {
    v21 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", [v8 integerValue]);
      v23 = [v6 service];
      v24 = [v23 accessory];
      v25 = [v24 name];
      *(_DWORD *)buf = 138412546;
      v28 = v22;
      __int16 v29 = 2112;
      v30 = v25;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: %@ Accessory: %@", buf, 0x16u);
    }
  }
  v15 = [(HFCharacteristicReadLogger *)self accessoriesToReadByTransport];
  v16 = [v15 objectForKeyedSubscript:v8];

  if (!v16)
  {
    v17 = [[HFAccessoriesToReadSet alloc] initWithTransportType:v8];
    v18 = [(HFCharacteristicReadLogger *)self accessoriesToReadByTransport];
    [v18 setObject:v17 forKeyedSubscript:v8];
  }
  v19 = [(HFCharacteristicReadLogger *)self accessoriesToReadByTransport];
  v20 = [v19 objectForKeyedSubscript:v8];
  [v20 addCharacteristic:v6];
}

- (unint64_t)numberOfAccessoriesForTransportType:(unint64_t)a3
{
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(HFCharacteristicReadLogger *)self accessoriesToReadByTransport];
  id v6 = [v5 objectForKeyedSubscript:v4];
  unint64_t v7 = [v6 count];

  return v7;
}

- (NSMutableDictionary)accessoriesToReadByTransport
{
  return self->_accessoriesToReadByTransport;
}

+ (id)nameForTransportType:(unint64_t)a3
{
  v3 = @"'Other' Transport";
  if (a3 == 1) {
    v3 = @"BLE";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"IP";
  }
}

- (void)markCharacteristicAsRead:(id)a3 withLogger:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = +[HFCharacteristicReadLogger transportKeyForCharacteristic:v7];
  unint64_t v9 = -[HFCharacteristicReadLogger numberOfAccessoriesForTransportType:](self, "numberOfAccessoriesForTransportType:", [v8 integerValue]);
  v10 = [(HFCharacteristicReadLogger *)self accessoriesToReadByTransport];
  v11 = [v10 objectForKeyedSubscript:v8];
  [v11 markCharacteristicAsRead:v7 withLogger:v6];

  if (v9
    && !-[HFCharacteristicReadLogger numberOfAccessoriesForTransportType:](self, "numberOfAccessoriesForTransportType:", [v8 integerValue]))
  {
    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v12 = [v6 loggerActivity];
      os_activity_scope_enter(v12, &state);

      v13 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", [v8 integerValue]);
        int v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Completed reads for %@ accessories.", (uint8_t *)&v17, 0xCu);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      v15 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", [v8 integerValue]);
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v16;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Completed reads for %@ accessories.", (uint8_t *)&state, 0xCu);
      }
    }
  }
}

+ (id)transportKeyForCharacteristic:(id)a3
{
  v3 = [a3 service];
  v4 = [v3 accessory];

  if ([v4 transportTypes])
  {
    v5 = &unk_26C0F6A38;
  }
  else if (([v4 transportTypes] & 2) != 0)
  {
    v5 = &unk_26C0F6A50;
  }
  else
  {
    v5 = &unk_26C0F6A68;
  }

  return v5;
}

- (void)setAccessoriesToReadByTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end