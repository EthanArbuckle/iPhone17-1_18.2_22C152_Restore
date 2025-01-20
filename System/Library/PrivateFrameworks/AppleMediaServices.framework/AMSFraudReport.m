@interface AMSFraudReport
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)isFeatureSupportedForBag:(id)a3;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)addDeviceIdentityCertificateAndSignatureToRequest:(id)a3 parameters:(id)a4 bag:(id)a5;
+ (id)createBagForSubProfile;
+ (id)handleResponse:(id)a3 account:(id)a4 bag:(id)a5;
@end

@implementation AMSFraudReport

+ (NSString)bagSubProfile
{
  return (NSString *)@"FraudScoreReport";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

+ (id)handleResponse:(id)a3 account:(id)a4 bag:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[AMSURLSession defaultSession];
  v11 = AMSFraudReportHandleResponse(v10, v9, v8, v7);

  v12 = [v11 resultWithError:0];
  v13 = [v12 value];

  return v13;
}

+ (BOOL)isFeatureSupportedForBag:(id)a3
{
  v3 = AMSFraudReportIsFeatureSupportedForBag(a3);
  v4 = [v3 resultWithError:0];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (id)addDeviceIdentityCertificateAndSignatureToRequest:(id)a3 parameters:(id)a4 bag:(id)a5
{
  id v7 = a3;
  id v8 = AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest(v7, a4, a5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__AMSFraudReport_Deprecated__addDeviceIdentityCertificateAndSignatureToRequest_parameters_bag___block_invoke;
  v12[3] = &unk_1E559E998;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 thenWithBlock:v12];

  return v10;
}

AMSPromise *__95__AMSFraudReport_Deprecated__addDeviceIdentityCertificateAndSignatureToRequest_parameters_bag___block_invoke(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
}

@end