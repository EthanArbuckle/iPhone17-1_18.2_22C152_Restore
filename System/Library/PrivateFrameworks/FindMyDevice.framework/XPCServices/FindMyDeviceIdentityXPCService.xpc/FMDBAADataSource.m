@interface FMDBAADataSource
- (BOOL)passcodeActivationUnlockCertificateRequest:(id *)a3 withValidityInMins:(int64_t)a4 refKey:(__SecKey *)a5 error:(id *)a6;
- (void)activationLockCertificatesWithRequest:(id)a3 completion:(id)a4;
@end

@implementation FMDBAADataSource

- (BOOL)passcodeActivationUnlockCertificateRequest:(id *)a3 withValidityInMins:(int64_t)a4 refKey:(__SecKey *)a5 error:(id *)a6
{
  v18[0] = &off_10000F958;
  v17[0] = kMAOptionsBAASCRTAttestation;
  v17[1] = kMAOptionsBAAValidity;
  v9 = +[NSNumber numberWithInteger:a4];
  v18[1] = v9;
  v17[2] = kMAOptionsBAAOIDSToInclude;
  uint64_t v16 = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v18[2] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  v12 = DeviceIdentityCreateClientCertificateRequest();
  id v13 = 0;
  if (v13)
  {
    v14 = sub_100005770();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100007EB0((uint64_t)v13, v14);
    }

    if (a6) {
      *a6 = v13;
    }
  }
  if (a3) {
    *a3 = v12;
  }
  if (a5) {
    *a5 = 0;
  }

  return v13 != 0;
}

- (void)activationLockCertificatesWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v16[0] = kMAOptionsBAAValidity;
  id v6 = a3;
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 validityInMinutes]);
  v17[0] = v7;
  v16[1] = kMAOptionsBAASCRTAttestation;
  unsigned int v8 = [v6 useSCRT];

  v9 = &off_10000F970;
  if (v8) {
    v9 = &off_10000F958;
  }
  v17[1] = v9;
  v16[2] = kMAOptionsBAAOIDSToInclude;
  uint64_t v15 = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v10 = +[NSArray arrayWithObjects:&v15 count:1];
  v17[2] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  v12 = dispatch_get_global_queue(0, 0);
  v14 = v5;
  id v13 = v5;
  DeviceIdentityIssueClientCertificateWithCompletion();
}

@end