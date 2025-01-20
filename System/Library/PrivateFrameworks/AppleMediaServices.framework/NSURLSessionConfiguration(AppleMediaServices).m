@interface NSURLSessionConfiguration(AppleMediaServices)
+ (id)_URLBagCache;
+ (id)ams_configurationWithClientInfo:()AppleMediaServices bag:;
+ (id)ams_configurationWithProcessInfo:()AppleMediaServices bag:;
+ (id)ams_imageConfiguration;
- (id)ams_configureWithClientInfo:()AppleMediaServices bag:;
- (void)ams_configureWithProcessInfo:()AppleMediaServices bag:;
@end

@implementation NSURLSessionConfiguration(AppleMediaServices)

- (id)ams_configureWithClientInfo:()AppleMediaServices bag:
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AMSSetLogKeyIfNeeded();
  [a1 setHTTPShouldUsePipelining:1];
  objc_msgSend(a1, "set_timingDataOptions:", 69);
  objc_msgSend(a1, "set_tlsTrustPinningPolicyName:", *MEMORY[0x1E4F3BBE0]);
  if (+[AMSEphemeralDefaults preferEphemeralURLSessions])
  {
    [a1 setURLCache:0];
    [a1 setURLCredentialStorage:0];
    [a1 setRequestCachePolicy:1];
  }
  else
  {
    v9 = [MEMORY[0x1E4F18DD0] _URLBagCache];
    [a1 setURLCache:v9];
  }
  BOOL v10 = !os_variant_has_internal_content()
     || !+[AMSDefaults QAMode]
     && !+[AMSDefaults ignoreServerTrustEvaluation]
     && !+[AMSDefaults ss_ignoreServerTrustEvaluation];
  objc_msgSend(a1, "set_alwaysPerformDefaultTrustEvaluation:", v10);
  v11 = [v6 bundleIdentifier];

  if (v11) {
    objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:", 1);
  }
  v12 = [v6 auditTokenData];

  if (v12)
  {
    v13 = [v6 auditTokenData];
    objc_msgSend(a1, "set_sourceApplicationAuditTokenData:", v13);

    objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:", 1);
  }
  v14 = objc_alloc_init(AMSMutableBinaryPromise);
  v15 = [v7 doubleForKey:@"TLSSamplingPercentage"];
  v16 = [v7 doubleForKey:@"TLSSamplingSessionDuration"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke;
  v27[3] = &unk_1E55A0A18;
  v27[4] = a1;
  v28 = v14;
  v17 = v14;
  +[AMSDefaults shouldSampleWithPercentageValue:v15 sessionDurationValue:v16 identifier:0x1EDCB08C8 completion:v27];
  v18 = objc_alloc_init(AMSMutableBinaryPromise);
  v19 = [v7 doubleForKey:@"TFOSamplingPercentage"];
  v20 = [v7 doubleForKey:@"TFOSamplingSessionDuration"];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke_2;
  v25[3] = &unk_1E55A0A18;
  v25[4] = a1;
  v26 = v18;
  v21 = v18;
  +[AMSDefaults shouldSampleWithPercentageValue:v19 sessionDurationValue:v20 identifier:0x1EDCB08A8 completion:v25];
  v29[0] = v17;
  v29[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v23 = +[AMSBinaryPromise promiseWithAll:v22];

  return v23;
}

+ (id)_URLBagCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NSURLSessionConfiguration_AppleMediaServices___URLBagCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38E188 != -1) {
    dispatch_once(&qword_1EB38E188, block);
  }
  v1 = (void *)_MergedGlobals_163;
  return v1;
}

+ (id)ams_configurationWithProcessInfo:()AppleMediaServices bag:
{
  v1 = objc_msgSend(a1, "ams_configurationWithClientInfo:bag:");
  v2 = [v1 resultWithError:0];

  return v2;
}

+ (id)ams_configurationWithClientInfo:()AppleMediaServices bag:
{
  v5 = (void *)MEMORY[0x1E4F18DD0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultSessionConfiguration];
  v9 = objc_msgSend(v8, "ams_configureWithClientInfo:bag:", v7, v6);

  BOOL v10 = [v9 promiseAdapter];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__NSURLSessionConfiguration_AppleMediaServices__ams_configurationWithClientInfo_bag___block_invoke;
  v14[3] = &unk_1E559F370;
  id v15 = v8;
  id v11 = v8;
  v12 = [v10 thenWithBlock:v14];

  return v12;
}

+ (id)ams_imageConfiguration
{
  v0 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  if (+[AMSEphemeralDefaults preferEphemeralImageLoader])
  {
    uint64_t v1 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];

    v0 = (void *)v1;
  }
  [v0 setHTTPShouldUsePipelining:1];
  [v0 setTimeoutIntervalForRequest:30.0];
  return v0;
}

- (void)ams_configureWithProcessInfo:()AppleMediaServices bag:
{
  objc_msgSend(a1, "ams_configureWithClientInfo:bag:");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 resultWithError:0];
}

@end