@interface HUNearbySettings
+ (BOOL)isTimeStampExpired:(id)a3;
+ (id)dateFromTimeStamp:(id)a3;
+ (id)sharedInstance;
+ (id)timeStamp;
- (AXDispatchTimer)saveTimer;
- (BOOL)shouldStoreLocally;
- (HUNearbySettings)init;
- (NSMutableDictionary)collectedIncomingData;
- (NSMutableDictionary)collectedOutcomingData;
- (OS_dispatch_queue)saveQueue;
- (id)cleanUpExpiredFromSavedDomainData:(id)a3 isOutcoming:(BOOL)a4;
- (id)extractMessageIDsFromMessage:(id)a3;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (id)savedData;
- (id)savedDataForKey:(id)a3 fromData:(id)a4;
- (void)addCollectedData:(id)a3 toData:(id)a4 isOutcoming:(BOOL)a5;
- (void)addNewMessage:(id)a3 domain:(id)a4 numberData:(int64_t)a5 stringData:(id)a6 toDictionary:(id)a7;
- (void)cleanUpExpired:(id)a3 andSaveToData:(id)a4 forKey:(id)a5;
- (void)incomingIDSMessage:(id)a3 domain:(id)a4 deviceType:(int64_t)a5 deviceTypeDescription:(id)a6;
- (void)incomingXPCMessageID:(unint64_t)a3 fromPid:(int)a4;
- (void)processAndSaveCollectedDataWithCompletion:(id)a3;
- (void)processAndSaveCollectedTimeStamps;
- (void)saveCollectedDataWithCompletion:(id)a3;
- (void)savedData;
- (void)sentIDSMessage:(id)a3 domain:(id)a4 priority:(unint64_t)a5 priorityDescription:(id)a6;
- (void)setCollectedIncomingData:(id)a3;
- (void)setCollectedOutcomingData:(id)a3;
- (void)setSaveQueue:(id)a3;
- (void)setSaveTimer:(id)a3;
@end

@implementation HUNearbySettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_Settings_5;

  return v2;
}

uint64_t __34__HUNearbySettings_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HUNearbySettings);
  uint64_t v1 = sharedInstance_Settings_5;
  sharedInstance_Settings_5 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)timeStamp
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss:SS"];
  v3 = [MEMORY[0x263EFF910] now];
  v4 = [v2 stringFromDate:v3];

  return v4;
}

+ (id)dateFromTimeStamp:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss:SS"];
  v6 = [v5 dateFromString:v4];

  return v6;
}

+ (BOOL)isTimeStampExpired:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[HUNearbySettings dateFromTimeStamp:v3];
    id v5 = [MEMORY[0x263EFF910] now];
    [v5 timeIntervalSinceDate:v4];
    BOOL v7 = v6 > 86400.0;
  }
  else
  {
    v8 = HCLogHearingNearbyIDS();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[HUNearbySettings isTimeStampExpired:]((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
    }

    BOOL v7 = 1;
  }

  return v7;
}

- (HUNearbySettings)init
{
  v14.receiver = self;
  v14.super_class = (Class)HUNearbySettings;
  id v2 = [(HCSettings *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    collectedOutcomingData = v2->_collectedOutcomingData;
    v2->_collectedOutcomingData = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    collectedIncomingData = v2->_collectedIncomingData;
    v2->_collectedIncomingData = (NSMutableDictionary *)v5;

    BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v9 = dispatch_queue_create("hu_nearby_settings_queue", v8);
    saveQueue = v2->_saveQueue;
    v2->_saveQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v2->_saveQueue];
    saveTimer = v2->_saveTimer;
    v2->_saveTimer = (AXDispatchTimer *)v11;

    [(AXDispatchTimer *)v2->_saveTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(HUNearbySettings *)v2 processAndSaveCollectedTimeStamps];
  }
  return v2;
}

- (void)sentIDSMessage:(id)a3 domain:(id)a4 priority:(unint64_t)a5 priorityDescription:(id)a6
{
}

- (void)incomingIDSMessage:(id)a3 domain:(id)a4 deviceType:(int64_t)a5 deviceTypeDescription:(id)a6
{
}

- (void)incomingXPCMessageID:(unint64_t)a3 fromPid:(int)a4
{
  if (a3)
  {
    messageIdentifierDescription();
    double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = @"New XPC";
  }
  BOOL v7 = v6;
  [(HUNearbySettings *)self addNewMessage:MEMORY[0x263EFFA78] domain:@"com.apple.heard.xpc" numberData:a4 stringData:v6 toDictionary:self->_collectedIncomingData];
}

- (void)saveCollectedDataWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke;
  v6[3] = &unk_2640FF188;
  id v7 = v4;
  id v5 = v4;
  [(HUNearbySettings *)self processAndSaveCollectedDataWithCompletion:v6];
}

void __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke_2;
  block[3] = &unk_2640FF188;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addNewMessage:(id)a3 domain:(id)a4 numberData:(int64_t)a5 stringData:(id)a6 toDictionary:(id)a7
{
  id v12 = a4;
  uint64_t v13 = (NSMutableDictionary *)a7;
  if (v12)
  {
    id v14 = a6;
    id v15 = a3;
    v16 = [(NSMutableDictionary *)v13 objectForKey:v12];
    if (!v16) {
      v16 = objc_opt_new();
    }
    v17 = [v16 objectForKey:kAXSTimeStampsKey];
    if (!v17) {
      v17 = objc_opt_new();
    }
    v18 = objc_opt_new();
    v19 = +[HUNearbySettings timeStamp];
    [v18 addObject:v19];

    v20 = [NSNumber numberWithInteger:a5];
    [v18 addObject:v20];

    [v18 addObject:v14];
    v21 = [(HUNearbySettings *)self extractMessageIDsFromMessage:v15];

    [v18 addObjectsFromArray:v21];
    [v17 addObject:v18];
    [v16 setObject:v17 forKey:kAXSTimeStampsKey];
    collectedOutcomingData = self->_collectedOutcomingData;
    if (a5 == 2 && collectedOutcomingData == v13)
    {
      v23 = [v16 objectForKey:kAXSNoWakeCountKey];
      uint64_t v24 = [v23 unsignedIntegerValue];

      v25 = [NSNumber numberWithUnsignedInteger:v24 + 1];
      [v16 setObject:v25 forKey:kAXSNoWakeCountKey];
    }
    [(NSMutableDictionary *)v13 setObject:v16 forKey:v12];
    v26 = @"Incoming";
    if (collectedOutcomingData == v13) {
      v26 = @"Outcoming";
    }
    v27 = v26;
    v28 = HCLogHearingNearbyIDS();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[HUNearbySettings addNewMessage:domain:numberData:stringData:toDictionary:]();
    }
  }
}

- (void)processAndSaveCollectedTimeStamps
{
  uint64_t v3 = [(HUNearbySettings *)self saveTimer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke;
  v4[3] = &unk_2640FC960;
  v4[4] = self;
  [v3 afterDelay:v4 processBlock:600.0];
}

uint64_t __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke_2;
  v3[3] = &unk_2640FC960;
  v3[4] = v1;
  return [v1 processAndSaveCollectedDataWithCompletion:v3];
}

uint64_t __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) processAndSaveCollectedTimeStamps];
}

- (void)processAndSaveCollectedDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HUNearbyController sharedInstance];
  double v6 = [v5 nearbyUpdatesQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke;
  v8[3] = &unk_2640FCC78;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectedOutcomingData];
  uint64_t v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) collectedIncomingData];
  id v5 = (void *)[v4 copy];

  double v6 = [*(id *)(a1 + 32) collectedOutcomingData];
  [v6 removeAllObjects];

  id v7 = [*(id *)(a1 + 32) collectedIncomingData];
  [v7 removeAllObjects];

  v8 = [*(id *)(a1 + 32) saveQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2;
  v12[3] = &unk_2640FF1B0;
  id v13 = v3;
  id v14 = v5;
  id v9 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v9;
  id v10 = v5;
  id v11 = v3;
  dispatch_async(v8, v12);
}

uint64_t __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    id v2 = [*(id *)(a1 + 48) savedData];
    uint64_t v3 = objc_opt_new();
    id v4 = [*(id *)(a1 + 48) savedDataForKey:kAXSOutcomingDataKey fromData:v2];
    if ([*(id *)(a1 + 32) count]) {
      [*(id *)(a1 + 48) addCollectedData:*(void *)(a1 + 32) toData:v4 isOutcoming:1];
    }
    [*(id *)(a1 + 48) cleanUpExpired:v4 andSaveToData:v3 forKey:kAXSOutcomingDataKey];
    id v5 = [*(id *)(a1 + 48) savedDataForKey:kAXSIncomingDataKey fromData:v2];
    if ([*(id *)(a1 + 40) count]) {
      [*(id *)(a1 + 48) addCollectedData:*(void *)(a1 + 40) toData:v5 isOutcoming:0];
    }
    [*(id *)(a1 + 48) cleanUpExpired:v5 andSaveToData:v3 forKey:kAXSIncomingDataKey];
    [*(id *)(a1 + 48) setValue:v3 forPreferenceKey:kAXSNearbyPreference];
    double v6 = HCLogHearingNearbyIDS();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2_cold_1((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)savedData
{
  id v2 = [(HCSettings *)self objectValueForKey:kAXSNearbyPreference withClass:objc_opt_class() andDefaultValue:0];
  objc_opt_class();
  uint64_t v3 = 0;
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = (void *)[v2 mutableCopy];
  }
  id v4 = HCLogHearingNearbyIDS();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(HUNearbySettings *)(uint64_t)v3 savedData];
  }

  if (!v3) {
    uint64_t v3 = objc_opt_new();
  }

  return v3;
}

- (id)savedDataForKey:(id)a3 fromData:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 objectForKey:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = (void *)[v6 mutableCopy];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = HCLogHearingNearbyIDS();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[HUNearbySettings savedDataForKey:fromData:]();
  }

  if (!v7) {
    uint64_t v7 = objc_opt_new();
  }

  return v7;
}

- (void)addCollectedData:(id)a3 toData:(id)a4 isOutcoming:(BOOL)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HUNearbySettings_addCollectedData_toData_isOutcoming___block_invoke;
  v9[3] = &unk_2640FF1D8;
  id v10 = v7;
  BOOL v11 = a5;
  id v8 = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
}

void __56__HUNearbySettings_addCollectedData_toData_isOutcoming___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:kAXSTimeStampsKey];
  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 32) objectForKey:v17];
    id v8 = (void *)[v7 mutableCopy];
    if (!v8) {
      id v8 = objc_opt_new();
    }
    id v16 = [v7 objectForKey:kAXSTimeStampsKey];
    uint64_t v9 = (void *)[v16 mutableCopy];
    if (!v9) {
      uint64_t v9 = objc_opt_new();
    }
    [v9 addObjectsFromArray:v6];
    id v10 = [v7 objectForKey:kAXSNoWakeCountKey];
    uint64_t v11 = [v10 unsignedIntegerValue];

    uint64_t v12 = [v5 objectForKey:kAXSNoWakeCountKey];
    uint64_t v13 = [v12 unsignedIntegerValue];

    [v8 setObject:v9 forKey:kAXSTimeStampsKey];
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    [v8 setObject:v14 forKey:kAXSCountKey];

    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:v13 + v11];
      [v8 setObject:v15 forKey:kAXSNoWakeCountKey];
    }
    [*(id *)(a1 + 32) setObject:v8 forKey:v17];
  }
}

- (void)cleanUpExpired:(id)a3 andSaveToData:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  id v26 = 0;
  char v11 = [v10 isEqualToString:kAXSOutcomingDataKey];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__HUNearbySettings_cleanUpExpired_andSaveToData_forKey___block_invoke;
  v16[3] = &unk_2640FF200;
  v16[4] = self;
  char v20 = v11;
  id v12 = v8;
  id v17 = v12;
  v18 = &v27;
  v19 = &v21;
  [v12 enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v28[3]];
  [v12 setObject:v13 forKey:kAXSTotalCountKey];

  uint64_t v14 = v22[5];
  if (v14) {
    [v12 setObject:v14 forKey:kAXSTimeStampKey];
  }
  [v9 setObject:v12 forKey:v10];
  uint64_t v15 = HCLogHearingNearbyIDS();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[HUNearbySettings cleanUpExpired:andSaveToData:forKey:]();
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __56__HUNearbySettings_cleanUpExpired_andSaveToData_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (([v16 isEqualToString:kAXSTotalCountKey] & 1) == 0
    && ([v16 isEqualToString:kAXSTimeStampKey] & 1) == 0)
  {
    uint64_t v6 = [*(id *)(a1 + 32) cleanUpExpiredFromSavedDomainData:v5 isOutcoming:*(unsigned __int8 *)(a1 + 64)];
    [*(id *)(a1 + 40) setObject:v6 forKey:v16];
    id v7 = [v6 objectForKey:kAXSTimeStampsKey];
    id v8 = [v6 objectForKey:kAXSCountKey];
    uint64_t v9 = [v8 unsignedIntegerValue];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v9;
    if (![v7 count])
    {
LABEL_16:

      goto LABEL_17;
    }
    id v10 = [v7 objectAtIndexedSubscript:0];
    objc_opt_class();
    char v11 = 0;
    if (objc_opt_isKindOfClass())
    {
      if ([v10 count])
      {
        char v11 = [v10 objectAtIndexedSubscript:0];
      }
      else
      {
        char v11 = 0;
      }
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v12 + 40))
    {
      if (!v11)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v13 = +[HUNearbySettings dateFromTimeStamp:](HUNearbySettings, "dateFromTimeStamp:");
      uint64_t v14 = +[HUNearbySettings dateFromTimeStamp:v11];
      if ([v14 compare:v13] == -1) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v11);
      }
    }
    else
    {
      id v15 = v11;
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v15;
    }

    goto LABEL_15;
  }
LABEL_17:
}

- (id)cleanUpExpiredFromSavedDomainData:(id)a3 isOutcoming:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:kAXSTimeStampsKey];
  if ([v6 count])
  {
    BOOL v37 = v4;
    id v40 = v5;
    uint64_t v7 = [v5 mutableCopy];
    id v8 = (void *)[v6 mutableCopy];
    uint64_t v9 = objc_opt_new();
    if ([MEMORY[0x263F472B0] isInternalInstall]) {
      unint64_t v10 = 500;
    }
    else {
      unint64_t v10 = 100;
    }
    if (v10 >= [v8 count]) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = [v8 count] - v10;
    }
    v38 = (void *)v7;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
    v39 = v6;
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v41 = 0;
      uint64_t v15 = *(void *)v44;
      unint64_t v16 = 0x263EFF000uLL;
      unint64_t v17 = 0x2640FC000uLL;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v19 count])
          {
            char v20 = [v19 objectAtIndexedSubscript:0];
            if (([*(id *)(v17 + 1728) isTimeStampExpired:v20] & 1) != 0 || v42 >= 1)
            {
              uint64_t v21 = v9;
              unint64_t v22 = v16;
              id v23 = v12;
              unint64_t v24 = v17;
              v25 = v21;
              [v21 addObject:v19];
              id v26 = HCLogHearingNearbyIDS();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v19;
                _os_log_debug_impl(&dword_20CC86000, v26, OS_LOG_TYPE_DEBUG, "Will remove timeStamp: %@", buf, 0xCu);
              }

              if ((unint64_t)[v19 count] < 2)
              {
                unint64_t v17 = v24;
                id v12 = v23;
              }
              else
              {
                uint64_t v27 = [v19 objectAtIndexedSubscript:1];
                objc_opt_class();
                unint64_t v17 = v24;
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v28 = [v27 unsignedIntegerValue];
                  uint64_t v29 = v41;
                  if (v28 == 2) {
                    uint64_t v29 = v41 + 1;
                  }
                  uint64_t v41 = v29;
                }
                id v12 = v23;
              }
              unint64_t v16 = v22;
              uint64_t v30 = v42 - 1;
              if (v42 <= 0) {
                uint64_t v30 = 0;
              }
              uint64_t v42 = v30;
              uint64_t v9 = v25;
            }
          }
          else
          {
            [v9 addObject:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v14);
    }
    else
    {
      uint64_t v41 = 0;
    }

    [v12 removeObjectsInArray:v9];
    id v11 = v38;
    [v38 setObject:v12 forKey:kAXSTimeStampsKey];
    uint64_t v31 = [v12 count];
    v32 = [NSNumber numberWithUnsignedInteger:v31];
    [v38 setObject:v32 forKey:kAXSCountKey];

    if (v37)
    {
      v33 = [v38 objectForKey:kAXSNoWakeCountKey];
      uint64_t v34 = [v33 unsignedIntegerValue];

      v35 = [NSNumber numberWithInteger:(v34 - v41) & ~((v34 - v41) >> 63)];
      [v38 setObject:v35 forKey:kAXSNoWakeCountKey];
    }
    uint64_t v6 = v39;
    id v5 = v40;
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (id)extractMessageIDsFromMessage:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__HUNearbySettings_extractMessageIDsFromMessage___block_invoke;
    v6[3] = &unk_2640FCDB0;
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }

  return v4;
}

void __49__HUNearbySettings_extractMessageIDsFromMessage___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 unsignedIntValue];
      id v3 = messageIdentifierDescription();
      [*(id *)(a1 + 32) hcSafeAddObject:v3];
    }
  }
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return (id)kAXSNearbyPreferenceDomain;
}

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (NSMutableDictionary)collectedOutcomingData
{
  return self->_collectedOutcomingData;
}

- (void)setCollectedOutcomingData:(id)a3
{
}

- (NSMutableDictionary)collectedIncomingData
{
  return self->_collectedIncomingData;
}

- (void)setCollectedIncomingData:(id)a3
{
}

- (AXDispatchTimer)saveTimer
{
  return self->_saveTimer;
}

- (void)setSaveTimer:(id)a3
{
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (void)setSaveQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_collectedIncomingData, 0);

  objc_storeStrong((id *)&self->_collectedOutcomingData, 0);
}

+ (void)isTimeStampExpired:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addNewMessage:domain:numberData:stringData:toDictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20CC86000, v0, v1, "Collected IDS messages %@ statistics %@");
}

void __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)savedData
{
}

- (void)savedDataForKey:fromData:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20CC86000, v0, v1, "Saved IDS messages statistics %@\n%@");
}

- (void)cleanUpExpired:andSaveToData:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_20CC86000, v0, v1, "IDS statistics %@ data: %@");
}

@end