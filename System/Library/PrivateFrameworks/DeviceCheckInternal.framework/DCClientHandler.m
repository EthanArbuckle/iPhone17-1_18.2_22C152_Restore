@interface DCClientHandler
- (BOOL)_isSupported;
- (DCClientHandler)initWithConnection:(id)a3;
- (id)_generateAppIDFromCurrentConnection;
- (id)_stringValueForEntitlement:(id)a3;
- (void)appAttestationAssert:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6;
- (void)appAttestationAttestKey:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6;
- (void)appAttestationCreateKey:(id)a3 completion:(id)a4;
- (void)appAttestationIsSupportedWithCompletion:(id)a3;
- (void)baaSignatureForData:(id)a3 completion:(id)a4;
- (void)baaSignaturesForData:(id)a3 completion:(id)a4;
- (void)fetchOpaqueBlobWithCompletion:(id)a3;
- (void)isSupportedDeviceWithCompletion:(id)a3;
@end

@implementation DCClientHandler

- (DCClientHandler)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = [(DCClientHandler *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)appAttestationIsSupportedWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  int IsSupported = AppAttest_AppAttestation_IsSupported();
  unsigned int IsEligibleApplication = AppAttest_AppAttestation_IsEligibleApplication();
  v8 = sub_1000036EC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100005BDC();
  }
  uint64_t v9 = IsSupported & IsEligibleApplication;

  v10 = sub_1000036EC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100005B5C();
  }

  v11 = sub_1000036EC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100005ADC();
  }

  v4[2](v4, v9, 0);
}

- (void).cxx_destruct
{
}

- (void)fetchOpaqueBlobWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id v5 = sub_100003944();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling device look up request", (uint8_t *)v12, 2u);
  }

  if ([(DCClientHandler *)self _isSupported])
  {
    v6 = [(DCClientHandler *)self _generateAppIDFromCurrentConnection];
    if (v6)
    {
      id v7 = objc_alloc_init((Class)DCContext);
      [v7 setClientAppID:v6];
      id v8 = objc_alloc((Class)DCDDeviceMetadata);
      id v9 = objc_alloc_init((Class)DCCryptoProxyImpl);
      id v10 = [v8 initWithContext:v7 cryptoProxy:v9];

      [v10 generateEncryptedBlobWithCompletion:v4];
    }
    else
    {
      v11 = sub_100003944();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000059E8();
      }

      id v7 = +[NSError dc_errorWithCode:0];
      v4[2](v4, 0, v7);
    }
  }
  else
  {
    v6 = +[NSError dc_errorWithCode:1];
    v4[2](v4, 0, v6);
  }
}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100005A1C();
  }

  if ([(DCClientHandler *)self _isSupported])
  {
    id v9 = [(DCClientHandler *)self _generateAppIDFromCurrentConnection];
    if (v9)
    {
      id v10 = objc_alloc_init((Class)DCContext);
      [v10 setClientAppID:v9];
      id v11 = objc_alloc((Class)DCDDeviceMetadata);
      id v12 = objc_alloc_init((Class)DCCryptoProxyImpl);
      id v13 = [v11 initWithContext:v10 cryptoProxy:v12];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100004D60;
      v15[3] = &unk_1000083B8;
      id v16 = v7;
      [v13 baaSignaturesForData:v6 completion:v15];
    }
    else
    {
      v14 = sub_100003944();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000059E8();
      }

      id v10 = +[NSError dc_errorWithCode:0];
      (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v10);
    }
  }
  else
  {
    id v9 = +[NSError errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10000 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100005A1C();
  }

  if ([(DCClientHandler *)self _isSupported])
  {
    id v9 = [(DCClientHandler *)self _generateAppIDFromCurrentConnection];
    if (v9)
    {
      id v10 = objc_alloc_init((Class)DCContext);
      [v10 setClientAppID:v9];
      id v11 = objc_alloc((Class)DCDDeviceMetadata);
      id v12 = objc_alloc_init((Class)DCCryptoProxyImpl);
      id v13 = [v11 initWithContext:v10 cryptoProxy:v12];

      [v13 baaSignatureForData:v6 completion:v7];
    }
    else
    {
      v14 = sub_100003944();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000059E8();
      }

      id v10 = +[NSError dc_errorWithCode:0];
      (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v10);
    }
  }
  else
  {
    id v9 = +[NSError errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10000 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
}

- (void)isSupportedDeviceWithCompletion:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(DCClientHandler *)self _isSupported], 0);
}

- (BOOL)_isSupported
{
  char IsSupported = DeviceIdentityIsSupported();
  v3 = sub_100003944();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100005A5C();
  }

  return IsSupported;
}

- (id)_generateAppIDFromCurrentConnection
{
  v3 = [(DCClientHandler *)self _stringValueForEntitlement:@"application-identifier"];
  if (![v3 length])
  {
    memset(&buf, 0, sizeof(buf));
    connection = self->_connection;
    if (connection) {
      [(NSXPCConnection *)connection auditToken];
    }
    audit_token_t token = buf;
    SecTaskRef v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v5)
    {
      id v6 = v5;
      id v7 = (void *)SecTaskCopyTeamIdentifier();
      id v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0);
      if (v7
        && [v7 length]
        && ([v7 isEqualToString:@"0000000000"] & 1) == 0)
      {
        id v9 = +[NSString stringWithFormat:@"%@.%@", v7, v8];
      }
      else
      {
        id v9 = v8;
      }
      id v10 = v9;

      id v11 = sub_100003944();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  Using codesign identifier: %@", (uint8_t *)&token, 0xCu);
      }

      CFRelease(v6);
      v3 = v10;
    }
  }
  id v12 = sub_100003944();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    buf.val[0] = 138412290;
    *(void *)&buf.val[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client App ID: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([v3 length]) {
    id v13 = v3;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)_stringValueForEntitlement:(id)a3
{
  v3 = [(NSXPCConnection *)self->_connection valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)appAttestationCreateKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  AppAttest_AppAttestation_CreateKey();
}

- (void)appAttestationAttestKey:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  AppAttest_AppAttestation_AttestKey();
}

- (void)appAttestationAssert:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  AppAttest_AppAttestation_Assert();
}

@end