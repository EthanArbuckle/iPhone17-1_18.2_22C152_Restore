@interface BSPlatform
+ (id)sharedInstance;
- (BOOL)hasGasGauge;
- (BOOL)hasOrbCapability;
- (BOOL)isCarrierInstall;
- (BOOL)isDeveloperInstall;
- (BOOL)isInternalInstall;
- (BOOL)isMultiCore;
- (NSString)localizedProductName;
- (NSString)operatingSystemName;
- (NSString)productBuildVersion;
- (NSString)productClass;
- (NSString)productHardwareModel;
- (NSString)productHardwareModelName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)uniqueDeviceIdentifier;
- (int)deviceClass;
- (int64_t)homeButtonType;
@end

@implementation BSPlatform

+ (id)sharedInstance
{
  if (qword_1EB21AFB8 != -1) {
    dispatch_once(&qword_1EB21AFB8, &__block_literal_global_3);
  }
  v2 = (void *)qword_1EB21AFB0;
  return v2;
}

- (int)deviceClass
{
  if (qword_1EB21B020 != -1) {
    dispatch_once(&qword_1EB21B020, &__block_literal_global_30_0);
  }
  return dword_1EB21AFAC;
}

- (int64_t)homeButtonType
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__BSPlatform_homeButtonType__block_invoke;
  block[3] = &unk_1E54457C8;
  block[4] = self;
  if (qword_1EB21B030 != -1) {
    dispatch_once(&qword_1EB21B030, block);
  }
  return qword_1EB21B028;
}

- (BOOL)hasGasGauge
{
  if (qword_1EB21B078 != -1) {
    dispatch_once(&qword_1EB21B078, &__block_literal_global_74);
  }
  return byte_1EB21AFAA;
}

void __28__BSPlatform_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BSPlatform);
  v1 = (void *)qword_1EB21AFB0;
  qword_1EB21AFB0 = (uint64_t)v0;
}

void __28__BSPlatform_homeButtonType__block_invoke(uint64_t a1)
{
  int v2 = MGGetSInt32Answer();
  uint64_t v3 = 2 * (v2 == 2);
  if (v2 == 1) {
    uint64_t v3 = 1;
  }
  qword_1EB21B028 = v3;
  if (*(void *)(a1 + 32))
  {
    CFDictionaryRef v4 = (const __CFDictionary *)MGCopyAnswer();
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      v6 = CFDictionaryGetValue(v4, @"ArtworkDeviceSubType");
      v7 = v6;
      if (v6) {
        BOOL v8 = [v6 intValue] == 2436;
      }
      else {
        BOOL v8 = 0;
      }
      CFRelease(v5);

      if (v8) {
        qword_1EB21B028 = 2;
      }
    }
  }
}

- (NSString)productVersion
{
  if (qword_1EB21AFC8 != -1) {
    dispatch_once(&qword_1EB21AFC8, &__block_literal_global_2);
  }
  int v2 = (void *)[(id)qword_1EB21AFC0 copy];
  return (NSString *)v2;
}

void __28__BSPlatform_productVersion__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB21AFC0;
  qword_1EB21AFC0 = v0;
}

- (NSString)productBuildVersion
{
  if (qword_1EB21AFD8 != -1) {
    dispatch_once(&qword_1EB21AFD8, &__block_literal_global_5);
  }
  int v2 = (void *)[(id)qword_1EB21AFD0 copy];
  return (NSString *)v2;
}

void __33__BSPlatform_productBuildVersion__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB21AFD0;
  qword_1EB21AFD0 = v0;
}

- (NSString)productType
{
  if (qword_1EB21AFE8 != -1) {
    dispatch_once(&qword_1EB21AFE8, &__block_literal_global_10);
  }
  int v2 = (void *)[(id)qword_1EB21AFE0 copy];
  return (NSString *)v2;
}

void __25__BSPlatform_productType__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB21AFE0;
  qword_1EB21AFE0 = v0;
}

- (NSString)productHardwareModel
{
  if (qword_1EB21AFF8 != -1) {
    dispatch_once(&qword_1EB21AFF8, &__block_literal_global_15);
  }
  int v2 = (void *)[(id)qword_1EB21AFF0 copy];
  return (NSString *)v2;
}

void __34__BSPlatform_productHardwareModel__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB21AFF0;
  qword_1EB21AFF0 = v0;
}

- (NSString)productHardwareModelName
{
  if (qword_1EB21B008 != -1) {
    dispatch_once(&qword_1EB21B008, &__block_literal_global_20);
  }
  int v2 = (void *)[(id)qword_1EB21B000 copy];
  return (NSString *)v2;
}

void __38__BSPlatform_productHardwareModelName__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB21B000;
  qword_1EB21B000 = v0;
}

- (NSString)productClass
{
  if (qword_1EB21B018 != -1) {
    dispatch_once(&qword_1EB21B018, &__block_literal_global_25);
  }
  int v2 = (void *)[(id)qword_1EB21B010 copy];
  return (NSString *)v2;
}

void __26__BSPlatform_productClass__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB21B010;
  qword_1EB21B010 = v0;
}

void __25__BSPlatform_deviceClass__block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  if ((v1 - 1) > 5) {
    int v2 = -1;
  }
  else {
    int v2 = dword_18AB4C1B8[v1 - 1];
  }
  dword_1EB21AFAC = v2;
}

- (NSString)localizedProductName
{
  if (qword_1EB21B040 != -1) {
    dispatch_once(&qword_1EB21B040, &__block_literal_global_44);
  }
  int v2 = (void *)[(id)qword_1EB21B038 copy];
  return (NSString *)v2;
}

void __34__BSPlatform_localizedProductName__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  int v1 = (void *)qword_1EB21B038;
  qword_1EB21B038 = v0;
}

- (NSString)operatingSystemName
{
  if (qword_1EB21B050 != -1) {
    dispatch_once(&qword_1EB21B050, &__block_literal_global_49);
  }
  int v2 = (void *)[(id)qword_1EB21B048 copy];
  return (NSString *)v2;
}

void __33__BSPlatform_operatingSystemName__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  int v1 = (void *)qword_1EB21B048;
  qword_1EB21B048 = v0;
}

- (NSString)uniqueDeviceIdentifier
{
  if (qword_1EB21B060 != -1) {
    dispatch_once(&qword_1EB21B060, &__block_literal_global_54);
  }
  int v2 = (void *)[(id)qword_1EB21B058 copy];
  return (NSString *)v2;
}

void __36__BSPlatform_uniqueDeviceIdentifier__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  int v1 = (void *)qword_1EB21B058;
  qword_1EB21B058 = v0;
}

- (BOOL)isInternalInstall
{
  return MEMORY[0x1F40CD648]("com.apple.baseboard", a2);
}

- (BOOL)isDeveloperInstall
{
  if (qword_1EB21B068 != -1) {
    dispatch_once(&qword_1EB21B068, &__block_literal_global_60);
  }
  return _MergedGlobals_6;
}

void __32__BSPlatform_isDeveloperInstall__block_invoke()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    int v1 = v0;
    _MergedGlobals_6 = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
}

- (BOOL)isCarrierInstall
{
  if (qword_1EB21B070 != -1) {
    dispatch_once(&qword_1EB21B070, &__block_literal_global_68);
  }
  return byte_1EB21AFA9;
}

void __30__BSPlatform_isCarrierInstall__block_invoke()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    int v1 = v0;
    byte_1EB21AFA9 = CFEqual(v0, @"Carrier") != 0;
    CFRelease(v1);
  }
}

- (BOOL)isMultiCore
{
  int v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = (unint64_t)[v2 processorCount] > 1;

  return v3;
}

uint64_t __25__BSPlatform_hasGasGauge__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB21AFAA = result;
  return result;
}

- (BOOL)hasOrbCapability
{
  if (qword_1EB21B080 != -1) {
    dispatch_once(&qword_1EB21B080, &__block_literal_global_79);
  }
  return byte_1EB21AFAB;
}

uint64_t __30__BSPlatform_hasOrbCapability__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB21AFAB = result;
  return result;
}

@end