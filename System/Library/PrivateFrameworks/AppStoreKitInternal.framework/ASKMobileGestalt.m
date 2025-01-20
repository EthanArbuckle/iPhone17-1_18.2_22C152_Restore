@interface ASKMobileGestalt
+ (BOOL)hasCapabilities:(id)a3;
+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4;
+ (BOOL)hasHEVCDecoding;
+ (BOOL)hasSystemTelephonyOfAnyKind;
+ (BOOL)hasVenice;
+ (BOOL)isAppleSiliconMac;
+ (BOOL)isCharonSupported;
+ (BOOL)isChinaSKUDevice;
+ (BOOL)isMandrakeSupported;
+ (BOOL)isStandaloneWatch;
+ (BOOL)wapiCapability;
+ (CGSize)mainScreenSize;
+ (NSString)activePairedSystemVersion;
+ (NSString)deviceClass;
+ (NSString)productType;
+ (double)mainScreenScale;
@end

@implementation ASKMobileGestalt

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return MEMORY[0x1F417CE00](@"any-telephony", a2);
}

+ (BOOL)hasVenice
{
  return MEMORY[0x1F417CE00](@"venice", a2);
}

+ (BOOL)wapiCapability
{
  return MEMORY[0x1F417CE00](@"wapi", a2);
}

+ (NSString)deviceClass
{
  return (NSString *)MGGetStringAnswer();
}

+ (NSString)productType
{
  return (NSString *)MGGetStringAnswer();
}

+ (BOOL)hasHEVCDecoding
{
  return MEMORY[0x1F417CE00](@"N8lZxRgC7lfdRS3dRLn+Ag", a2);
}

+ (BOOL)isCharonSupported
{
  return 0;
}

+ (BOOL)isMandrakeSupported
{
  return 0;
}

+ (BOOL)isChinaSKUDevice
{
  v2 = MGGetStringAnswer();
  BOOL v3 = [v2 caseInsensitiveCompare:@"CH"] == 0;

  return v3;
}

+ (BOOL)isStandaloneWatch
{
  return 0;
}

+ (NSString)activePairedSystemVersion
{
  if (activePairedSystemVersion_onceToken[0] != -1) {
    dispatch_once(activePairedSystemVersion_onceToken, &__block_literal_global);
  }
  v2 = (void *)activePairedSystemVersion_systemVersion;
  return (NSString *)v2;
}

void __45__ASKMobileGestalt_activePairedSystemVersion__block_invoke()
{
  v0 = [MEMORY[0x1E4F79EF0] sharedInstance];
  id v4 = [v0 getActivePairedDevice];

  v1 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F79E60]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  BOOL v3 = (void *)activePairedSystemVersion_systemVersion;
  activePairedSystemVersion_systemVersion = (uint64_t)v2;
}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

+ (BOOL)hasCapabilities:(id)a3
{
  return +[ASKMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:a3 isVisionOSCompatibleIOSApp:0];
}

+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    v9 = (const void *)*MEMORY[0x1E4F1CFD0];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isEqualToString:", &stru_1F3CF7B28, (void)v15) & 1) == 0)
        {
          v11 = (const void *)(v4 ? _MGCopyAnswerWithMode() : MGCopyAnswer());
          v12 = v11;
          if (v11) {
            CFRelease(v11);
          }
          if (v12 != v9)
          {
            BOOL v13 = 0;
            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

+ (CGSize)mainScreenSize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ASKMobileGestalt_mainScreenSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainScreenSize_once != -1) {
    dispatch_once(&mainScreenSize_once, block);
  }
  double v2 = *(double *)&mainScreenSize_screenSize_0;
  double v3 = *(double *)&mainScreenSize_screenSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __34__ASKMobileGestalt_mainScreenSize__block_invoke(uint64_t a1)
{
  id v8 = (id) MGCopyAnswer();
  uint64_t v2 = [v8 bytes];
  unint64_t v3 = [v8 length];
  if (v3 >= 0x10)
  {
    unint64_t v4 = (v3 & 0xFFFFFFFFFFFFFFF0) + v2;
    double v5 = *(double *)(v4 - 16);
    double v6 = *(double *)(v4 - 8);
    [*(id *)(a1 + 32) mainScreenScale];
    *(double *)&mainScreenSize_screenSize_0 = v5 / v7;
    *(double *)&mainScreenSize_screenSize_1 = v6 / v7;
  }
}

+ (double)mainScreenScale
{
  if (mainScreenScale_once != -1) {
    dispatch_once(&mainScreenScale_once, &__block_literal_global_32);
  }
  return *(double *)&mainScreenScale_scale;
}

void __35__ASKMobileGestalt_mainScreenScale__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v2 = v0;
    [v0 floatValue];
    v0 = v2;
    *(double *)&mainScreenScale_scale = v1;
  }
}

@end