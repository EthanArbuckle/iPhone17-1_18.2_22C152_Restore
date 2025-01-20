@interface CTDataUsagePolicies(DigitalSeparation)
+ (id)ds_DataUsagePolicyWithPolicy:()DigitalSeparation sourceName:;
@end

@implementation CTDataUsagePolicies(DigitalSeparation)

+ (id)ds_DataUsagePolicyWithPolicy:()DigitalSeparation sourceName:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_22;
  }
  v7 = +[DSSourceDescriptor sourceDescriptorForSource:v6];
  v8 = [v7 dataUsageBundleIdentifier];
  if (v8)
  {
    uint64_t v9 = ([v7 requiresWifi] & 1) != 0 || objc_msgSend(v5, "wifi") != 0;
    uint64_t v13 = ([v7 requiresCellular] & 1) != 0 || objc_msgSend(v5, "cellular") != 0;
    v14 = [v5 bundleId];
    if ([v14 isEqualToString:v8] && objc_msgSend(v5, "wifi") == v9)
    {
      uint64_t v15 = [v5 cellular];

      if (v15 == v13)
      {
        v11 = DSLogCTDataUsagePolicies();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
          goto LABEL_9;
        }
        int v17 = 138543362;
        id v18 = v8;
        v12 = "Data usage policy for %{public}@ is already configured";
        goto LABEL_8;
      }
    }
    else
    {
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263F02C58]), "init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:", v8, v13, v9, objc_msgSend(v5, "isManaged"), objc_msgSend(v5, "isRestricted"));
    goto LABEL_21;
  }
  v11 = DSLogCTDataUsagePolicies();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    id v18 = v6;
    v12 = "No data usage policy found for %{public}@";
LABEL_8:
    _os_log_impl(&dword_236090000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 0xCu);
  }
LABEL_9:

  v10 = 0;
LABEL_21:

LABEL_22:
  return v10;
}

@end