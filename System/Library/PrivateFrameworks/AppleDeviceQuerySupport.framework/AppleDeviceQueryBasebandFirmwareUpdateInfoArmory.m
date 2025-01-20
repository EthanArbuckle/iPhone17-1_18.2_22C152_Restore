@interface AppleDeviceQueryBasebandFirmwareUpdateInfoArmory
+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5;
- (BOOL)loadFirmwareUpdateInfo:(id *)a3;
- (NSDictionary)firmwareUpdateInfo;
- (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5;
- (void)setFirmwareUpdateInfo:(id)a3;
@end

@implementation AppleDeviceQueryBasebandFirmwareUpdateInfoArmory

+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = +[AppleDeviceQuerySingletonArmory sharedInstance];
  v9 = [v8 query:v7 isCachable:v6 withError:a5];

  return v9;
}

- (BOOL)loadFirmwareUpdateInfo:(id *)a3
{
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v8 = +[AppleDeviceQueryBasebandConnectionArmory getCoreTelephonyClient];
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = (void *)v35[5];
    v35[5] = (uint64_t)v9;

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__AppleDeviceQueryBasebandFirmwareUpdateInfoArmory_loadFirmwareUpdateInfo___block_invoke;
    v21[3] = &unk_265234A88;
    v21[4] = &v28;
    v21[5] = &v22;
    v21[6] = &v34;
    [v8 getEuiccData:v21];
    dispatch_semaphore_wait((dispatch_semaphore_t)v35[5], 0xFFFFFFFFFFFFFFFFLL);
    if (v29[5] && !v23[5])
    {
      -[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory setFirmwareUpdateInfo:](self, "setFirmwareUpdateInfo:");
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:]", 565, @"firmwareUpdateInfo is reloaded", v17, v18, v19, v20);
      BOOL v15 = 1;
      goto LABEL_7;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:]", 558, @"Failed to get eUICC firmware info!", v11, v12, v13, v20);
    v14 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:v23[5]];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:]", 542, @"%@", v5, v6, v7, @"Failed to get CoreTelephonyClient instance");
    v14 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:@"Failed to get CoreTelephonyClient instance"];
  }
  BOOL v15 = 0;
  *a3 = v14;
LABEL_7:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v15;
}

void __75__AppleDeviceQueryBasebandFirmwareUpdateInfoArmory_loadFirmwareUpdateInfo___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

- (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(AppleDeviceQueryBasebandFirmwareUpdateInfoArmory *)self firmwareUpdateInfo];

  if (v9 && a4
    || [(AppleDeviceQueryBasebandFirmwareUpdateInfoArmory *)self loadFirmwareUpdateInfo:a5])
  {
    v10 = [(AppleDeviceQueryBasebandFirmwareUpdateInfoArmory *)self firmwareUpdateInfo];
    id v11 = [v10 objectForKeyedSubscript:v8];

    if (!v11)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory query:isCachable:withError:]", 587, @"key %@ does not exist in firmwareUpdateInfo", v12, v13, v14, (uint64_t)v8);
      *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (NSDictionary)firmwareUpdateInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirmwareUpdateInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end