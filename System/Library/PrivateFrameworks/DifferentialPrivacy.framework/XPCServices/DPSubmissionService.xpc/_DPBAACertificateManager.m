@interface _DPBAACertificateManager
+ (id)signWithDeviceIdentity:(id)a3;
+ (id)signWithDeviceIdentity:(id)a3 canRecover:(BOOL *)a4;
+ (void)sleepForSeconds:(unsigned int)a3;
@end

@implementation _DPBAACertificateManager

+ (void)sleepForSeconds:(unsigned int)a3
{
}

+ (id)signWithDeviceIdentity:(id)a3
{
  id v4 = a3;
  v5 = +[_DPSubmissionServiceUserDefaults baaCertificateBackoffDate];
  if (v5)
  {
    v7 = +[NSDate now];
    v8 = [v7 dateByAddingTimeInterval:3600.0];
    id v9 = [v5 compare:v8];

    if ([v7 compare:v5] == (id)-1 && (unint64_t)v9 + 1 <= 1)
    {
      v16 = +[_DPLog service];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Backoff time was set, not going to try to get a BAA signature until %@.", buf, 0xCu);
      }

      v13 = 0;
      goto LABEL_26;
    }
  }
  unsigned int v11 = 0;
  char v23 = 0;
  int v12 = 10;
  *(void *)&long long v6 = 67109120;
  long long v22 = v6;
  do
  {
    v13 = objc_msgSend(a1, "signWithDeviceIdentity:canRecover:", v4, &v23, v22);
    if (v13) {
      break;
    }
    if (!v23)
    {
      v18 = +[_DPLog service];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10005736C(v18);
      }

      break;
    }
    if (v11 <= 1)
    {
      uint64_t v14 = arc4random_uniform(0xAu) + v12;
      v15 = +[_DPLog service];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v22;
        LODWORD(v25) = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Waiting for %u seconds until trying again to obtain BAA signature.", buf, 8u);
      }

      [a1 sleepForSeconds:v14];
      v12 *= 2;
    }
    ++v11;
  }
  while (v11 != 3);
  if (v23)
  {
    v19 = +[NSDate now];
    v20 = [v19 dateByAddingTimeInterval:3600.0];

    +[_DPSubmissionServiceUserDefaults setBAACertificateBackoffDate:v20];
  }
  else
  {
    +[_DPSubmissionServiceUserDefaults setBAACertificateBackoffDate:0];
  }
LABEL_26:

  return v13;
}

+ (id)signWithDeviceIdentity:(id)a3 canRecover:(BOOL *)a4
{
  id v5 = a3;
  if (DeviceIdentityIsSupported())
  {
    int v6 = DeviceIdentityUCRTAttestationSupported();
    v58[0] = &off_100079900;
    v57[0] = kMAOptionsBAAValidity;
    v57[1] = kMAOptionsBAASCRTAttestation;
    v7 = +[NSNumber numberWithBool:v6 ^ 1u];
    v58[1] = v7;
    v57[2] = kMAOptionsBAAKeychainAccessGroup;
    v58[2] = @"com.apple.DPSubmissionService";
    v8 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
    id v9 = [v8 mutableCopy];

    if ((+[_DPDeviceInfo isRunningAsLaunchDaemon] & 1) == 0) {
      [v9 setValue:@"differential-privacy-baa-signing" forKey:kMAOptionsBAAKeychainLabel];
    }
    *(void *)buf = 0;
    v46 = buf;
    uint64_t v47 = 0x3032000000;
    v48 = sub_10000DC44;
    v49 = sub_10000DC54;
    id v50 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = sub_10000DC44;
    v43 = sub_10000DC54;
    id v44 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_10000DC44;
    v37 = sub_10000DC54;
    id v38 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    v10 = dispatch_semaphore_create(0);
    id v27 = v5;
    DeviceIdentityIssueClientCertificateWithCompletion();
    dispatch_time_t v11 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      int v12 = +[_DPLog service];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000573B0(v12, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = 0;
      *a4 = 0;
    }
    else
    {
      *a4 = *((unsigned char *)v30 + 24);
      if (v34[5] && *((void *)v46 + 5) && v40[5])
      {
        v20 = +[_DPBAASignature signatureWithDeviceSignature:leafCertificate:intermediateCertificate:](_DPBAASignature, "signatureWithDeviceSignature:leafCertificate:intermediateCertificate:", _NSConcreteStackBlock, 3221225472, sub_10000DC5C, &unk_1000751A0, v10, v27, &v29, buf, &v39, &v33);
      }
      else
      {
        v21 = +[_DPLog service];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          BOOL v23 = v34[5] != 0;
          BOOL v24 = *((void *)v46 + 5) != 0;
          BOOL v25 = v40[5] != 0;
          *(_DWORD *)v51 = 67109632;
          BOOL v52 = v23;
          __int16 v53 = 1024;
          BOOL v54 = v24;
          __int16 v55 = 1024;
          BOOL v56 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "BAA signing failed! (signature: %d, leaf: %d, intermediate: %d)", v51, 0x14u);
        }

        v20 = 0;
      }
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v9 = +[_DPLog service];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "DeviceIdentity not supported on this platform.", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

@end