@interface AppleDeviceQueryMobileEquipmentInfoArmory
+ (id)getMobileEquipInfoIn:(id)a3 ofSlot:(int64_t)a4;
+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5;
+ (id)query:(id)a3 ofSlot:(int64_t)a4 isCachable:(BOOL)a5 withError:(id *)a6;
+ (id)queryMobileEquipInfo:(id)a3 byKey:(id)a4 withError:(id *)a5;
- (BOOL)loadMobileEquipInfoList:(id *)a3;
- (CTMobileEquipmentInfoList)mobileEquipInfoList;
- (id)query:(id)a3 ofSlot:(int64_t)a4 isCachable:(BOOL)a5 withError:(id *)a6;
- (void)setMobileEquipInfoList:(id)a3;
@end

@implementation AppleDeviceQueryMobileEquipmentInfoArmory

+ (id)query:(id)a3 ofSlot:(int64_t)a4 isCachable:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  v10 = +[AppleDeviceQuerySingletonArmory sharedInstance];
  v11 = [v10 query:v9 ofSlot:a4 isCachable:v7 withError:a6];

  return v11;
}

+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = +[AppleDeviceQuerySingletonArmory sharedInstance];
  id v9 = [v8 query:v7 ofSlot:0 isCachable:v6 withError:a5];

  return v9;
}

+ (id)getMobileEquipInfoIn:(id)a3 ofSlot:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a3, "meInfoList", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v10 && [*(id *)(*((void *)&v13 + 1) + 8 * i) slotId] == a4)
        {
          id v11 = v10;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

+ (id)queryMobileEquipInfo:(id)a3 byKey:(id)a4 withError:(id *)a5
{
  uint64_t v6 = [a3 valueForKey:a4];
  if (!v6)
  {
    *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
  }

  return v6;
}

- (BOOL)loadMobileEquipInfoList:(id *)a3
{
  v5 = +[AppleDeviceQueryBasebandConnectionArmory getCoreTelephonyClient];
  id v9 = v5;
  if (v5)
  {
    id v19 = 0;
    v10 = [v5 getMobileEquipmentInfo:&v19];
    id v11 = v19;
    [(AppleDeviceQueryMobileEquipmentInfoArmory *)self setMobileEquipInfoList:v10];

    v12 = [(AppleDeviceQueryMobileEquipmentInfoArmory *)self mobileEquipInfoList];
    BOOL v13 = v12 != 0;

    if (v12)
    {
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:]", 353, @"mobileEquipInfoList is reloaded", v14, v15, v16, v18);
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:]", 348, @"Failed to get MobileEquipmentInfo: %@", v14, v15, v16, (uint64_t)v11);
      *a3 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:v11];
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:]", 340, @"Failed to get CoreTelephonyClient instance", v6, v7, v8, v18);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:39 underlyingError:0];
    BOOL v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)query:(id)a3 ofSlot:(int64_t)a4 isCachable:(BOOL)a5 withError:(id *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = [(AppleDeviceQueryMobileEquipmentInfoArmory *)self mobileEquipInfoList];

  if ((!v11 || !a5)
    && ![(AppleDeviceQueryMobileEquipmentInfoArmory *)self loadMobileEquipInfoList:a6])
  {
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  if ((unint64_t)(a4 - 1) > 1)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = [(AppleDeviceQueryMobileEquipmentInfoArmory *)self mobileEquipInfoList];
    BOOL v13 = [v19 meInfoList];

    uint64_t v20 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v20)
    {
LABEL_17:
      uint64_t v18 = 0;
      goto LABEL_22;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
LABEL_10:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v28 != v22) {
        objc_enumerationMutation(v13);
      }
      uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * v23);
      if (v24)
      {
        uint64_t v17 = +[AppleDeviceQueryMobileEquipmentInfoArmory queryMobileEquipInfo:v24 byKey:v10 withError:a6];
        if (v17) {
          break;
        }
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v21) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
    v12 = [(AppleDeviceQueryMobileEquipmentInfoArmory *)self mobileEquipInfoList];
    BOOL v13 = +[AppleDeviceQueryMobileEquipmentInfoArmory getMobileEquipInfoIn:v12 ofSlot:a4];

    if (!v13)
    {
      uint64_t v25 = 1;
      if (a4 != 1) {
        uint64_t v25 = 2;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory query:ofSlot:isCachable:withError:]", 373, @"no mobile equipment information of slot%d", v14, v15, v16, v25);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
      uint64_t v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    uint64_t v17 = +[AppleDeviceQueryMobileEquipmentInfoArmory queryMobileEquipInfo:v13 byKey:v10 withError:a6];
  }
  uint64_t v18 = (void *)v17;
LABEL_22:

LABEL_23:

  return v18;
}

- (CTMobileEquipmentInfoList)mobileEquipInfoList
{
  return (CTMobileEquipmentInfoList *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMobileEquipInfoList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end