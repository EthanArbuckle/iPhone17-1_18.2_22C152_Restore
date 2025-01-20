@interface NSBundle(SensorKit)
+ (uint64_t)_sr_validateRequiredFieldsForBundleIdentifier:()SensorKit sensors:error:;
- (uint64_t)_sr_validateRequiredFieldsForSensors:()SensorKit error:;
@end

@implementation NSBundle(SensorKit)

+ (uint64_t)_sr_validateRequiredFieldsForBundleIdentifier:()SensorKit sensors:error:
{
  v12[1] = *MEMORY[0x263EF8340];
  v8 = (void *)[NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0];
  self;
  v9 = +[NSBundle sk_bundleWithIdentifier:partnerAppDirectoryURL:](MEMORY[0x263F086E0], a3, v8);
  if (v9)
  {
    return objc_msgSend(v9, "_sr_validateRequiredFieldsForSensors:error:", a4, a5);
  }
  else
  {
    if (a5)
    {
      uint64_t v11 = *MEMORY[0x263F08320];
      v12[0] = @"Bundle couldn't be found";
      *a5 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", SRErrorDomain, 20480, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
    }
    return 0;
  }
}

- (uint64_t)_sr_validateRequiredFieldsForSensors:()SensorKit error:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!objc_msgSend(a1, "sk_usageDescription"))
  {
    if (a4)
    {
      v16 = @"NSSensorKitUsageDescription";
      uint64_t v17 = 20481;
LABEL_21:
      id v18 = +[SRError invalidInfoPlistErrorWithMissingKey:v16 code:v17];
      uint64_t result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  if (!objc_msgSend(a1, "sk_privacyURL"))
  {
    if (a4)
    {
      v16 = @"NSSensorKitPrivacyPolicyURL";
      uint64_t v17 = 20482;
      goto LABEL_21;
    }
    return 0;
  }
  if (![a1 objectForInfoDictionaryKey:@"NSSensorKitUsageDetail"]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      v16 = @"NSSensorKitUsageDetail";
      uint64_t v17 = 20483;
      goto LABEL_21;
    }
    return 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      v12 = (void *)MEMORY[0x223C5D6B0]();
      uint64_t v13 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v11), "infoPlistAuthorizationCategory");
      if (!v13)
      {
        if (_MergedGlobals_6 != -1) {
          dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
        }
        v19 = qword_26AB1A100;
        if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v11;
          _os_log_error_impl(&dword_21FCA3000, v19, OS_LOG_TYPE_ERROR, "Failed to find Info.plist authorization category key for %{public}@", buf, 0xCu);
          if (!a4) {
            goto LABEL_31;
          }
        }
        else if (!a4)
        {
          goto LABEL_31;
        }
        v20 = +[SRError errorWithCode:8194];
LABEL_30:
        *a4 = v20;
        goto LABEL_31;
      }
      uint64_t v14 = v13;
      if (!objc_msgSend((id)objc_msgSend(a1, "sk_perCategoryDetailDescription"), "objectForKeyedSubscript:", v13))
      {
        if (a4)
        {
          v20 = +[SRError invalidInfoPlistErrorWithMissingKey:v14 code:20484];
          goto LABEL_30;
        }
LABEL_31:
        return 0;
      }
    }
    uint64_t v8 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    uint64_t result = 1;
    if (v8) {
      continue;
    }
    return result;
  }
}

@end