@interface DAUtils
+ (id)decryptVehicleMobilizationData:(id)a3 forKeyWithIdentifier:(id)a4;
@end

@implementation DAUtils

+ (id)decryptVehicleMobilizationData:(id)a3 forKeyWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 encryptedRequest];
  v8 = [v6 ephemeralPublicKey];

  v9 = SESEndPointPrivacyDecryption();

  id v10 = 0;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAUtils decryptVehicleMobilizationData:forKeyWithIdentifier:]", 33, @"Result of decrypting vehicleMobilizationData: %@", v11, v12, v13, v14, (uint64_t)v10);

  return v9;
}

@end