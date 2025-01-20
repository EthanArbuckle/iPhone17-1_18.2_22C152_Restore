@interface SOAnalytics
+ (void)analyticsForMDMProfiles:(id)a3 reason:(id)a4;
@end

@implementation SOAnalytics

+ (void)analyticsForMDMProfiles:(id)a3 reason:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = MEMORY[0x263EF8330];
        id v12 = v6;
        AnalyticsSendEventLazy();
      }
      uint64_t v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11, 3221225472, __46__SOAnalytics_analyticsForMDMProfiles_reason___block_invoke, &unk_26432AD98);
    }
    while (v8);
  }
}

id __46__SOAnalytics_analyticsForMDMProfiles_reason___block_invoke(uint64_t a1)
{
  v29[6] = *MEMORY[0x263EF8340];
  v29[0] = *(void *)(a1 + 32);
  v28[0] = @"reason";
  v28[1] = @"type";
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v2 = (void *)getSOFullProfileClass_softClass_0;
  uint64_t v27 = getSOFullProfileClass_softClass_0;
  if (!getSOFullProfileClass_softClass_0)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __getSOFullProfileClass_block_invoke_0;
    v23[3] = &unk_26432A2A8;
    v23[4] = &v24;
    __getSOFullProfileClass_block_invoke_0((uint64_t)v23);
    v2 = (void *)v25[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v24, 8);
  id v5 = *(void **)(a1 + 40);
  v4 = (id *)(a1 + 40);
  id v6 = objc_msgSend(v3, "stringWithProfileType:", objc_msgSend(v5, "type"));
  v29[1] = v6;
  v28[2] = @"isKerberosExtension";
  uint64_t v7 = NSNumber;
  uint64_t v8 = [*v4 extensionBundleIdentifier];
  uint64_t v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isEqualToString:", @"com.apple.AppSSOKerberos.KerberosExtension"));
  v29[2] = v9;
  v28[3] = @"authenticationMethod";
  v10 = [*v4 platformSSO];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"AuthenticationMethod"];
  id v12 = (void *)v11;
  long long v13 = &stru_26C9B0BC0;
  if (v11) {
    long long v13 = (__CFString *)v11;
  }
  v29[3] = v13;
  v28[4] = @"hasRegistrationToken";
  long long v14 = NSNumber;
  long long v15 = [*v4 pssoRegistrationToken];
  long long v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "length") != 0);
  v29[4] = v16;
  v28[5] = @"sharedDeviceKeys";
  v17 = [*v4 platformSSO];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"UseSharedDeviceKeys"];
  v19 = (void *)v18;
  v20 = &unk_26C9B5758;
  if (v18) {
    v20 = (void *)v18;
  }
  v29[5] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v21;
}

@end