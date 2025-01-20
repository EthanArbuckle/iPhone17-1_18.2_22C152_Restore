@interface AppleDeviceQueryBasebandFirmwareSecurityInfoArmory
+ (id)query:(id)a3 forceCacheable:(BOOL)a4 withError:(id *)a5;
- (BOOL)loadFirmwareSecurityInfoBootedOS:(id *)a3;
- (BOOL)loadFirmwareSecurityInfoRestoreOS:(id *)a3;
- (NSDictionary)firmwareSecurityInfo;
- (id)query:(id)a3 forceCacheable:(BOOL)a4 withError:(id *)a5;
- (void)setFirmwareSecurityInfo:(id)a3;
@end

@implementation AppleDeviceQueryBasebandFirmwareSecurityInfoArmory

+ (id)query:(id)a3 forceCacheable:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = +[AppleDeviceQuerySingletonArmory sharedInstance];
  v9 = [v8 query:v7 forceCacheable:v6 withError:a5];

  return v9;
}

- (BOOL)loadFirmwareSecurityInfoRestoreOS:(id *)a3
{
  CFTypeRef cf = 0;
  v41 = 0;
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 628, @"Restore OS: loading firmware security info via BBUpdater", v3, v4, v5, v37);
  if (loadFirmwareSecurityInfoRestoreOS__once != -1) {
    dispatch_once(&loadFirmwareSecurityInfoRestoreOS__once, &__block_literal_global_156);
  }
  if (loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn
    && loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn
    && loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn)
  {
    fn = (const void *)loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn();
    if (fn)
    {
      CFDictionaryRef v18 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v18)
      {
        CFTypeRef cf = 0;
        if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn(fn, v18, &cf) || cf)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 652, @"BBUpdaterSetOptions failed: %@", v19, v20, v21, (uint64_t)cf);
        }
        else
        {
          if (loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn(fn, @"CopyIdentifier", &v41, &cf)&& !cf)
          {
            v22 = v41;
            if (v41)
            {
              [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self setFirmwareSecurityInfo:v41];

              v41 = 0;
              v23 = [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self firmwareSecurityInfo];
              ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 694, @"firmwareSecurityInfo is reloaded: %@", v24, v25, v26, (uint64_t)v23);

              BOOL v27 = 1;
              goto LABEL_30;
            }
            v32 = @"No firmwareSecurityInfo found";
            uint64_t v33 = 697;
            goto LABEL_24;
          }
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 658, @"BBUpdaterExecCommand(CopyIdentifier) failed: %@", v15, v16, v17, (uint64_t)cf);
        }
        v34 = (void *)MEMORY[0x263F087E8];
        CFTypeRef v35 = cf;
        goto LABEL_28;
      }
      v32 = @"fail to create an option CFDictionary for BBUpdater";
      uint64_t v33 = 665;
LABEL_24:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", v33, v32, v15, v16, v17, v38);
      v34 = (void *)MEMORY[0x263F087E8];
      CFTypeRef v35 = 0;
LABEL_28:
      id v31 = [v34 errorWithZhuGeErrorCode:4 underlyingError:v35];
      BOOL v27 = 0;
      goto LABEL_29;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 671, @"BBUpdaterExtremeCreate failed to create an updater", v11, v12, v13, v38);
    id v31 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:0];
    BOOL v27 = 0;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 677, @"didn't retrieve functions from BBUpdater dylib properly", v8, v9, v10, v38);
    if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn) {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 679, @"fail to load BBUpdaterExtremeCreate from BBUpdater dylib", v28, v29, v30, v39);
    }
    if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn) {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 682, @"fail to load BBUpdaterSetOptions from BBUpdater dylib", v28, v29, v30, v39);
    }
    if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn) {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 685, @"fail to load BBUpdaterExecCommand from BBUpdater dylib", v28, v29, v30, v39);
    }
    id v31 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:0];
    BOOL v27 = 0;
    fn = 0;
  }
  CFDictionaryRef v18 = 0;
LABEL_29:
  *a3 = v31;
LABEL_30:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v18) {
    CFRelease(v18);
  }
  if (fn) {
    CFRelease(fn);
  }
  return v27;
}

void __88__AppleDeviceQueryBasebandFirmwareSecurityInfoArmory_loadFirmwareSecurityInfoRestoreOS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = dlopen("/usr/lib/libBBUpdaterDynamic.dylib", 1);
  if (v9)
  {
    uint64_t v13 = v9;
    loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn = (uint64_t (*)(void))dlsym(v9, "BBUpdaterExtremeCreate");
    loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn = (uint64_t (*)(void, void, void))dlsym(v13, "BBUpdaterSetOptions");
    loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn = (uint64_t (*)(void, void, void, void))dlsym(v13, "BBUpdaterExecCommand");
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]_block_invoke", 641, @"fail to dlopen BBUpdater dylib", v10, v11, v12, a9);
  }
}

- (BOOL)loadFirmwareSecurityInfoBootedOS:(id *)a3
{
  id v26 = 0;
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 716, @"Booted OS: loading firmware security info via CoreTelephony", v3, v4, v5, v23);
  uint64_t v8 = +[AppleDeviceQueryBasebandConnectionArmory getCTServerConnection];
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = _CTServerConnectionCopyFirmwareSecurityInfo();
    uint64_t v25 = v13;
    BOOL v14 = v13 == 0;
    if (v13)
    {
      CTError_error_string(&v25);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 729, @"Failed to get fwSecurityInfo: %d:%d(%s)", v15, v16, v17, v13);
      *a3 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:0];
    }
    else
    {
      [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self setFirmwareSecurityInfo:v26];

      id v26 = 0;
      CFDictionaryRef v18 = [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self firmwareSecurityInfo];
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 737, @"firmwareSecurityInfo is reloaded: %@", v19, v20, v21, (uint64_t)v18);
    }
    CFRelease(v12);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 719, @"Failed to get CTServerConnection instance", v9, v10, v11, v24);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:39 underlyingError:0];
    BOOL v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (id)query:(id)a3 forceCacheable:(BOOL)a4 withError:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self firmwareSecurityInfo];

  if (v9 && a4) {
    goto LABEL_3;
  }
  if (isZhuGeInRestoreOS())
  {
    if (![(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self loadFirmwareSecurityInfoRestoreOS:a5])goto LABEL_12; {
  }
    }
  else if (![(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self loadFirmwareSecurityInfoBootedOS:a5])
  {
LABEL_12:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v10 = [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self firmwareSecurityInfo];

  if (v10)
  {
    BOOL v14 = [(AppleDeviceQueryBasebandFirmwareSecurityInfoArmory *)self firmwareSecurityInfo];
    uint64_t v15 = [v14 objectForKeyedSubscript:v8];

    if (v15) {
      goto LABEL_13;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory query:forceCacheable:withError:]", 770, @"key %@ does not exist in firmwareSecurityInfo", v16, v17, v18, (uint64_t)v8);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareSecurityInfoArmory query:forceCacheable:withError:]", 763, @"firmwareSecurityInfo can not be nil", v11, v12, v13, v20);
  }
  [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
  uint64_t v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v15;
}

- (NSDictionary)firmwareSecurityInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirmwareSecurityInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end