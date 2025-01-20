@interface FindMyDeviceIdentityXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)baaIdentityAttestationForSigningRequest:(id)a3 completion:(id)a4;
- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4;
@end

@implementation FindMyDeviceIdentityXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = sub_100005770();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new XPC connection %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FindMyDeviceIdentityXPCInterface];
  [v5 setExportedInterface:v7];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100005770();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[FindMyDeviceIdentityXPCServer identityForPasscodeActivationUnlockWithContext:completion:]";
    __int16 v26 = 2048;
    id v27 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s with %ld context keys", buf, 0x16u);
  }

  int v9 = +[NSXPCConnection currentConnection];
  id v10 = [v9 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceIdentityXPCService.access"];

  if (v10 && ([&__kCFBooleanTrue isEqual:v10] & 1) != 0)
  {
    v11 = objc_alloc_init(FMDBAADataSource);
    v12 = objc_alloc_init(FMDSecuritySignatureDataSource);
    v13 = [[FMDPasscodeActivationUnlockIdentityEncoder alloc] initWithCertificateDataSource:v11 signatureDataSource:v12];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100005254;
    v20[3] = &unk_10000CC70;
    id v21 = v7;
    [(FMDPasscodeActivationUnlockIdentityEncoder *)v13 identityForPasscodeActivationUnlockWithContext:v6 completion:v20];
  }
  else
  {
    v14 = NSStringFromSelector(a2);
    v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v14];

    id v15 = objc_alloc((Class)NSError);
    uint64_t v16 = kFMDErrorDomain;
    if (v11) {
      CFStringRef v17 = (const __CFString *)v11;
    }
    else {
      CFStringRef v17 = &stru_10000F620;
    }
    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v23 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v12 = (FMDSecuritySignatureDataSource *)[v15 initWithDomain:v16 code:6 userInfo:v18];

    v19 = sub_100005770();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100007BCC((uint64_t)v11, v19);
    }

    if (v7) {
      (*((void (**)(id, void, FMDSecuritySignatureDataSource *))v7 + 2))(v7, 0, v12);
    }
  }
}

- (void)baaIdentityAttestationForSigningRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100005770();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 dataToSign];
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[FindMyDeviceIdentityXPCServer baaIdentityAttestationForSigningRequest:completion:]";
    __int16 v27 = 1024;
    BOOL v28 = v9 != 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s with %i", buf, 0x12u);
  }
  id v10 = +[NSXPCConnection currentConnection];
  v11 = [v10 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceIdentityXPCService.access"];

  if (v11 && ([&__kCFBooleanTrue isEqual:v11] & 1) != 0)
  {
    v12 = objc_alloc_init(FMDBAADataSource);
    v13 = objc_alloc_init(FMDSecuritySignatureDataSource);
    v14 = [[FMDActivationLockIdentityEncoder alloc] initWithCertificateDataSource:v12 signatureDataSource:v13];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000556C;
    v21[3] = &unk_10000CC98;
    id v22 = v7;
    [(FMDActivationLockIdentityEncoder *)v14 identityForActivationLockRequest:v6 completion:v21];
  }
  else
  {
    id v15 = NSStringFromSelector(a2);
    v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v15];

    id v16 = objc_alloc((Class)NSError);
    uint64_t v17 = kFMDErrorDomain;
    if (v12) {
      CFStringRef v18 = (const __CFString *)v12;
    }
    else {
      CFStringRef v18 = &stru_10000F620;
    }
    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v13 = (FMDSecuritySignatureDataSource *)[v16 initWithDomain:v17 code:6 userInfo:v19];

    v20 = sub_100005770();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100007BCC((uint64_t)v12, v20);
    }

    if (v7) {
      (*((void (**)(id, void, FMDSecuritySignatureDataSource *))v7 + 2))(v7, 0, v13);
    }
  }
}

@end