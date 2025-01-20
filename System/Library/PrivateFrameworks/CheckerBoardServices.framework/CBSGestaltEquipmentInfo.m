@interface CBSGestaltEquipmentInfo
+ (id)CurrentEquipmentInfo;
- (CBSGestaltEquipmentInfo)initWithSerialNumber:(id)a3 andMEID:(id)a4 andIMEIArray:(id)a5;
- (NSArray)imeiArray;
- (NSString)meid;
- (NSString)serialNumber;
@end

@implementation CBSGestaltEquipmentInfo

- (CBSGestaltEquipmentInfo)initWithSerialNumber:(id)a3 andMEID:(id)a4 andIMEIArray:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CBSGestaltEquipmentInfo;
  v12 = [(CBSGestaltEquipmentInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serialNumber, a3);
    objc_storeStrong((id *)&v13->_meid, a4);
    objc_storeStrong((id *)&v13->_imeiArray, a5);
  }

  return v13;
}

+ (id)CurrentEquipmentInfo
{
  if (CurrentEquipmentInfo_dispatchOnceToken != -1) {
    dispatch_once(&CurrentEquipmentInfo_dispatchOnceToken, &__block_literal_global);
  }
  v2 = (void *)CurrentEquipmentInfo_currentEquipmentInfo;
  return v2;
}

void __47__CBSGestaltEquipmentInfo_CurrentEquipmentInfo__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_semaphore_t v1 = dispatch_semaphore_create(0);
  id v2 = objc_alloc_init(MEMORY[0x263F02D30]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CBSGestaltEquipmentInfo_CurrentEquipmentInfo__block_invoke_3;
  v8[3] = &unk_265036DE8;
  id v10 = &v18;
  id v11 = &v12;
  v3 = v1;
  id v9 = v3;
  [v2 copyMobileEquipmentInfo:v8];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v3, v4);
  v5 = [CBSGestaltEquipmentInfo alloc];
  uint64_t v6 = [(CBSGestaltEquipmentInfo *)v5 initWithSerialNumber:v0 andMEID:v19[5] andIMEIArray:v13[5]];
  v7 = (void *)CurrentEquipmentInfo_currentEquipmentInfo;
  CurrentEquipmentInfo_currentEquipmentInfo = v6;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

intptr_t __47__CBSGestaltEquipmentInfo_CurrentEquipmentInfo__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = objc_msgSend(a2, "meInfoList", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v8 MEID];

        if (v9)
        {
          id v10 = [v8 MEID];
          uint64_t v11 = [v10 copy];
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
          v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;
        }
        uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        objc_super v15 = [v8 IMEI];
        v16 = (void *)[v15 copy];
        [v14 addObject:v16];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)meid
{
  return self->_meid;
}

- (NSArray)imeiArray
{
  return self->_imeiArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imeiArray, 0);
  objc_storeStrong((id *)&self->_meid, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end