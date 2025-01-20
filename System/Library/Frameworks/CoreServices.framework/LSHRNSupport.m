@interface LSHRNSupport
+ (BOOL)deviceConfiguredForHRN;
+ (id)vendorIDFromVendorName:(id)a3 seedData:(id)a4 error:(id *)a5;
+ (void)deviceConfiguredForHRN;
+ (void)invalidateCache;
+ (void)setActivationRecordOverride:(BOOL)a3;
+ (void)setActivationRecordOverrideNil;
+ (void)setFeatureFlagOverride:(BOOL)a3;
@end

@implementation LSHRNSupport

+ (BOOL)deviceConfiguredForHRN
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (MobileActivationLibrary(void)::frameworkLibrary
    || (v2 = dlopen("/System/Library/PrivateFrameworks/MobileActivation.framework/MobileActivation", 2),
        (MobileActivationLibrary(void)::frameworkLibrary = (uint64_t)v2) != 0))
  {
    if (initActivationObserver(void)::once != -1) {
      dispatch_once(&initActivationObserver(void)::once, &__block_literal_global_42);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&hrnLock);
    if (checkedFeatureFlag == 1)
    {
      int v3 = isHRN;
    }
    else
    {
      if (featureFlagOverride) {
        int v3 = featureFlagOverride == 1;
      }
      else {
        int v3 = _os_feature_enabled_impl();
      }
      isHRN = v3;
      checkedFeatureFlag = 1;
    }
    if ((checkedActivationRecord & 1) != 0 || v3) {
      goto LABEL_28;
    }
    switch(activationRecordOverride)
    {
      case -1:
        v20 = @"DeviceConfigurationFlags";
        v21 = &unk_1ECB438E8;
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        if (v5) {
          goto LABEL_20;
        }
        break;
      case 0:
        v19 = 0;
        v8 = softLinkMAECopyActivationRecordWithError[0];
        if (softLinkMAECopyActivationRecordWithError[0])
        {
          v5 = ((void (*)(uint64_t))softLinkMAECopyActivationRecordWithError[0])((uint64_t)&v19);
          v8 = v19;
        }
        else
        {
          v5 = 0;
        }
        v10 = v8;
        if (!v5)
        {
          v11 = _LSDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            +[LSHRNSupport deviceConfiguredForHRN];
          }
        }
LABEL_17:
        if (!v5) {
          break;
        }
LABEL_20:
        checkedActivationRecord = 1;
        v6 = objc_msgSend(v5, "objectForKeyedSubscript:", @"DeviceConfigurationFlags", v19);
        v7 = v6;
        if (v6)
        {
          isHRN = (~[v6 integerValue] & 0x21) == 0;
        }
        else
        {
          v9 = _LSDefaultLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            +[LSHRNSupport deviceConfiguredForHRN](v9);
          }
        }
        break;
      case 1:
        v22 = @"DeviceConfigurationFlags";
        v4 = [NSNumber numberWithUnsignedInteger:33];
        v23[0] = v4;
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

        goto LABEL_17;
    }
LABEL_28:
    os_unfair_lock_unlock((os_unfair_lock_t)&hrnLock);
    LOBYTE(v2) = isHRN != 0;
  }
  return (char)v2;
}

+ (void)invalidateCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&hrnLock);
  checkedFeatureFlag = 0;
  checkedActivationRecord = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&hrnLock);
}

+ (void)setActivationRecordOverrideNil
{
  activationRecordOverride = -2;
}

+ (void)setActivationRecordOverride:(BOOL)a3
{
  uint64_t v3 = 1;
  if (!a3) {
    uint64_t v3 = -1;
  }
  activationRecordOverride = v3;
}

+ (void)setFeatureFlagOverride:(BOOL)a3
{
  uint64_t v3 = 1;
  if (!a3) {
    uint64_t v3 = -1;
  }
  featureFlagOverride = v3;
}

+ (id)vendorIDFromVendorName:(id)a3 seedData:(id)a4 error:(id *)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v30[0] = 0;
  v30[1] = 0;
  id v9 = v7;
  [v9 UTF8String];
  id v10 = v9;
  strlen((const char *)[v10 UTF8String]);
  int Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CCStatusErrorDomain" code:Hkdf userInfo:0];
    uint64_t v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    id v20 = v8;
    [v20 bytes];
    [v20 length];
    if (!CCDeriveKey())
    {
      v28 = 0;
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v30];
      goto LABEL_8;
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CCStatusErrorDomain" code:0 userInfo:0];
    uint64_t v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:](v12, v13, v21, v22, v23, v24, v25, v26);
    }
  }

  v27 = 0;
  v28 = (void *)v12;
LABEL_8:
  if (a5 && v28) {
    *a5 = v28;
  }

  return v27;
}

+ (void)deviceConfiguredForHRN
{
}

+ (void)vendorIDFromVendorName:(uint64_t)a3 seedData:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)vendorIDFromVendorName:(uint64_t)a3 seedData:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end