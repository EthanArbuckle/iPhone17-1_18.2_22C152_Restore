@interface DMCReturnToServiceHelper
+ (id)preseveReturnToServiceDataWithMDMProfileData:(id)a3 wifiProfileData:(id)a4 error:(id *)a5;
@end

@implementation DMCReturnToServiceHelper

+ (id)preseveReturnToServiceDataWithMDMProfileData:(id)a3 wifiProfileData:(id)a4 error:(id *)a5
{
  v7 = (objc_class *)MEMORY[0x263F38BB0];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  [v10 clear];
  v11 = [MEMORY[0x263EFF960] preferredLanguages];
  [v10 setLanguageStrings:v11];

  v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = [v12 localeIdentifier];
  [v10 setLocaleString:v13];

  [v10 setWifiProfileData:v8];
  [v10 setMdmProfileData:v9];

  v14 = [MEMORY[0x263F52808] sharedConfiguration];
  objc_msgSend(v10, "setIsSupervised:", objc_msgSend(v14, "isSupervised"));

  v15 = [MEMORY[0x263F52808] sharedConfiguration];
  if ([v15 isSupervised])
  {
    v16 = [MEMORY[0x263F52808] sharedConfiguration];
    char v17 = [v16 isTeslaEnrolled];

    if ((v17 & 1) == 0)
    {
      v18 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225D9B000, v18, OS_LOG_TYPE_DEFAULT, "Doing RRTS on non-ADE enrolled device, need to preserve the cloud config", buf, 2u);
      }
      v19 = [MEMORY[0x263F52808] sharedConfiguration];
      v20 = [v19 details];
      v21 = (void *)[v20 mutableCopy];

      uint64_t v22 = MEMORY[0x263EFFA80];
      [v21 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F52878]];
      [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x263F52880]];
      v23 = (void *)[v21 copy];
      [v10 setCloudConfigurationDetails:v23];
    }
  }
  else
  {
  }
  id v28 = 0;
  [v10 preserveWithError:&v28];
  id v24 = v28;
  v25 = v24;
  if (v24)
  {
    id v26 = 0;
    if (a5) {
      *a5 = v24;
    }
  }
  else
  {
    id v26 = v10;
  }

  return v26;
}

@end