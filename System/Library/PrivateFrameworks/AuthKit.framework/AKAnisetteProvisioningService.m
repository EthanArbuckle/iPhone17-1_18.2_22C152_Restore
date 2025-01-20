@interface AKAnisetteProvisioningService
- (AKAbsintheSigner)absintheSigner;
- (AKAnisetteProvisioningService)initWithClient:(id)a3;
- (AKAnisetteProvisioningService)initWithClient:(id)a3 authenticationContext:(id)a4;
- (AKAnisetteProvisioningService)initWithClient:(id)a3 context:(id)a4;
- (AKAttestationSigner)attestationSigner;
- (id)_clientAnisetteService;
- (id)_helperServiceForDevice:(id)a3;
- (id)_nativeAnisetteService;
- (id)_pairedDeviceAnisetteService;
- (id)anisetteDataForDevice:(id)a3 provisionIfNecessary:(BOOL)a4;
- (void)_attestationDataForRequestData:(id)a3 completion:(id)a4;
- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5;
- (void)absintheSignatureForData:(id)a3 completion:(id)a4;
- (void)attestationDataForDevice:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)attestationDataForRequestData:(id)a3 completion:(id)a4;
- (void)eraseAnisetteForDevice:(id)a3 completion:(id)a4;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5;
- (void)legacyAnisetteDataForDSID:(id)a3 device:(id)a4 completion:(id)a5;
- (void)postAttestationAnalyticsWithData:(id)a3 completion:(id)a4;
- (void)provisionAnisetteForDevice:(id)a3 completion:(id)a4;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setAbsintheSigner:(id)a3;
- (void)setAttestationSigner:(id)a3;
- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4;
- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5;
- (void)syncAnisetteWithSIMData:(id)a3 device:(id)a4 completion:(id)a5;
@end

@implementation AKAnisetteProvisioningService

- (AKAnisetteProvisioningService)initWithClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKAnisetteProvisioningService;
  v6 = [(AKAnisetteProvisioningService *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = +[AKAbsintheSigner sharedSigner];
    absintheSigner = v7->_absintheSigner;
    v7->_absintheSigner = (AKAbsintheSigner *)v8;

    uint64_t v10 = +[AKAttestationSigner sharedSigner];
    attestationSigner = v7->_attestationSigner;
    v7->_attestationSigner = (AKAttestationSigner *)v10;
  }
  return v7;
}

- (void)attestationDataForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    [(AKAnisetteProvisioningService *)self _attestationDataForRequestData:v6 completion:v7];
  }
  else
  {
    uint64_t v8 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001875B0();
    }

    v9 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v7[2](v7, 0, v9);
  }
}

- (void)_attestationDataForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAnisetteProvisioningService *)self _nativeAnisetteService];
  [v8 fetchAttestationDataForRequestData:v7 completion:v6];
}

- (id)_nativeAnisetteService
{
  nativeAnisetteService = self->_nativeAnisetteService;
  if (!nativeAnisetteService)
  {
    v4 = [[AKNativeAnisetteService alloc] initWithClient:self->_client];
    id v5 = self->_nativeAnisetteService;
    self->_nativeAnisetteService = v4;

    nativeAnisetteService = self->_nativeAnisetteService;
  }

  return nativeAnisetteService;
}

- (AKAnisetteProvisioningService)initWithClient:(id)a3 context:(id)a4
{
  id v7 = a4;
  id v8 = [(AKAnisetteProvisioningService *)self initWithClient:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v9;
}

- (AKAnisetteProvisioningService)initWithClient:(id)a3 authenticationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)AKAppleIDAuthenticationContext) initWithContext:v6];

  v9 = [(AKAnisetteProvisioningService *)self initWithClient:v7 context:v8];
  return v9;
}

- (id)anisetteDataForDevice:(id)a3 provisionIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000F8F0;
  v20 = sub_10000F7C8;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006DC74;
  v12[3] = &unk_1002295B0;
  id v8 = v6;
  id v13 = v8;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  [(AKAnisetteProvisioningService *)self fetchAnisetteDataAndProvisionIfNecessary:v4 device:v8 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)attestationDataForDevice:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@: Fetching attestation data for device (%@) with request (%@)", (uint8_t *)&v17, 0x20u);
  }

  v12 = [(AKAnisetteProvisioningService *)self _helperServiceForDevice:v8];
  char v13 = objc_opt_respondsToSelector();
  v14 = _AKLogSystem();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Calling anisette service (%@) for peer attestation data", (uint8_t *)&v17, 0x16u);
    }

    [v12 fetchPeerAttestationDataForRequest:v9 completion:v10];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138413058;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@: Unable to grab attestation data for device (%@) with request (%@) using anisette service (%@)", (uint8_t *)&v17, 0x2Au);
    }

    uint64_t v16 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8009 userInfo:0];
    v10[2](v10, 0, v16);
  }
}

- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = (void (**)(id, void))a4;
  if ([(AKClient *)client hasInternalPrivateAccess])
  {
    id v9 = +[AKBAATimeProvider sharedInstance];
    [v9 addServerAdjustment:v6];

    v8[2](v8, 0);
  }
  else
  {
    id v10 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001875E4();
    }

    uint64_t v11 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v8[2](v8, v11);

    id v8 = (void (**)(id, void))v11;
  }
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    [(AKAnisetteProvisioningService *)self _fetchAnisetteDataAndProvisionIfNecessary:v6 device:v8 completion:v9];
  }
  else
  {
    id v10 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001875B0();
    }

    uint64_t v11 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v9[2](v9, 0, v11);
  }
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = a3;
  if ([(AKClient *)client hasInternalPrivateAccess])
  {
    id v8 = [(AKAnisetteProvisioningService *)self _nativeAnisetteService];
    [v8 resetDeviceIdentityWithCompletion:v5];
  }
  else
  {
    BOOL v6 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100187618();
    }

    dispatch_semaphore_t v7 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    (*((void (**)(id, void *))v5 + 2))(v5, v7);
  }
}

- (void)postAttestationAnalyticsWithData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, void *))a4;
  if (![(AKClient *)self->_client hasInternalPrivateAccess])
  {
    char v13 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100187720();
    }

    v14 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v7[2](v7, v14);
    goto LABEL_12;
  }
  id v8 = +[AKDevice currentDevice];
  if (([v8 isInternalBuild] & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  id v9 = +[AKDevice currentDevice];
  unsigned __int8 v10 = [v9 isVirtualMachine];

  if (v10)
  {
    uint64_t v11 = +[AKConfiguration sharedConfiguration];
    id v12 = [v11 lastKnownIDMSEnvironment];

    if (v12)
    {
      id v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1001876E0();
      }
      goto LABEL_7;
    }
    v14 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:@"com.apple.authkit.baa.stats" error:0];
    v15 = [(AKClient *)self->_client name];
    [v14 setObject:v15 forKeyedSubscript:@"processName"];

    uint64_t v16 = [v6 endPointVIP];
    id v17 = [v16 length];

    if (v17)
    {
      uint64_t v18 = [v6 endPointVIP];
      [v14 setObject:v18 forKeyedSubscript:@"endPointVIP"];
    }
    __int16 v19 = [v6 requestMethod];
    id v20 = [v19 length];

    if (v20)
    {
      __int16 v21 = [v6 requestMethod];
      [v14 setObject:v21 forKeyedSubscript:@"requestMethod"];
    }
    id v22 = [v6 headerSize];
    if (v22)
    {
      __int16 v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 headerSize]);
      id v24 = objc_msgSend(v23, "ak_bucketWithSize:", 500);

      v25 = +[NSNumber numberWithInteger:v24];
      [v14 setObject:v25 forKeyedSubscript:@"headerSize"];
    }
    if ([v6 bodySize])
    {
      v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 bodySize]);
      id v27 = objc_msgSend(v26, "ak_bucketWithSize:", 1000);

      v28 = +[NSNumber numberWithInteger:v27];
      [v14 setObject:v28 forKeyedSubscript:@"bodySize"];

      if ((uint64_t)[v6 errorCode] < 1) {
        goto LABEL_28;
      }
    }
    else if ((uint64_t)[v6 errorCode] <= 0)
    {
      if (!v22)
      {
LABEL_31:
        v7[2](v7, 0);
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_28;
    }
    v29 = [v6 errorDomain];
    if (v29)
    {

LABEL_27:
      v30 = [v6 errorDomain];
      v31 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, [v6 errorCode], 0);

      [v14 populateUnderlyingErrorsStartingWithRootError:v31];
      goto LABEL_28;
    }
    if ([v6 errorCode]) {
      goto LABEL_27;
    }
LABEL_28:
    v32 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
    [v32 sendEvent:v14];
    v33 = _AKLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_10018764C(v14, v33);
    }

    goto LABEL_31;
  }
LABEL_8:
  v7[2](v7, 0);
LABEL_13:
}

- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  unsigned __int8 v10 = [(AKAnisetteProvisioningService *)self _helperServiceForDevice:v8];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 fetchAnisetteDataAndProvisionIfNecessary:v6 withCompletion:v9];
  }
  else
  {
    id v12 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100187754();
    }

    char v13 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8013 userInfo:0];
    v9[2](v9, 0, v13);
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void, void *))a5;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    uint64_t v11 = [(AKAnisetteProvisioningService *)self _helperServiceForDevice:v9];
    id v12 = v11;
    if (v11)
    {
      [v11 legacyAnisetteDataForDSID:v8 withCompletion:v10];
    }
    else
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001877BC();
      }

      v15 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8013 userInfo:0];
      v10[2](v10, 0, v15);
    }
  }
  else
  {
    char v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001875B0();
    }

    id v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v10[2](v10, 0, v12);
  }
}

- (void)provisionAnisetteForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v8 = [(AKAnisetteProvisioningService *)self _helperServiceForDevice:v6];
    id v9 = v8;
    if (v8)
    {
      [v8 provisionAnisetteWithCompletion:v7];
    }
    else
    {
      uint64_t v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100187824();
      }

      id v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8013 userInfo:0];
      v7[2](v7, 0, v12);
    }
  }
  else
  {
    unsigned __int8 v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10018788C();
    }

    id v9 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v7[2](v7, 0, v9);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void, void *))a5;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    uint64_t v11 = [(AKAnisetteProvisioningService *)self _helperServiceForDevice:v9];
    id v12 = v11;
    if (v11)
    {
      [v11 syncAnisetteWithSIMData:v8 completion:v10];
    }
    else
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001878C0();
      }

      v15 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8013 userInfo:0];
      v10[2](v10, 0, v15);
    }
  }
  else
  {
    char v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100187928();
    }

    id v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v10[2](v10, 0, v12);
  }
}

- (void)eraseAnisetteForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v8 = [(AKAnisetteProvisioningService *)self _helperServiceForDevice:v6];
    id v9 = v8;
    if (v8)
    {
      [v8 eraseAnisetteWithCompletion:v7];
    }
    else
    {
      uint64_t v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10018795C();
      }

      id v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8013 userInfo:0];
      v7[2](v7, 0, v12);
    }
  }
  else
  {
    unsigned __int8 v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001879C4();
    }

    id v9 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    v7[2](v7, 0, v9);
  }
}

- (id)_helperServiceForDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 linkType] == (id)1)
  {
    uint64_t v6 = [(AKAnisetteProvisioningService *)self _nativeAnisetteService];
LABEL_4:
    dispatch_semaphore_t v7 = (void *)v6;
    goto LABEL_5;
  }
  if ([v5 linkType] == (id)2)
  {
    uint64_t v6 = [(AKAnisetteProvisioningService *)self _pairedDeviceAnisetteService];
    goto LABEL_4;
  }
  if ([v5 linkType] == (id)3)
  {
    uint64_t v6 = [(AKAnisetteProvisioningService *)self _clientAnisetteService];
    goto LABEL_4;
  }
  dispatch_semaphore_t v7 = 0;
LABEL_5:

  return v7;
}

- (id)_pairedDeviceAnisetteService
{
  return +[AKPeerIDSAnisetteService sharedService];
}

- (id)_clientAnisetteService
{
  v2 = [[AKClientAnisetteService alloc] initWithClient:self->_client context:self->_context];

  return v2;
}

- (AKAbsintheSigner)absintheSigner
{
  return self->_absintheSigner;
}

- (void)setAbsintheSigner:(id)a3
{
}

- (AKAttestationSigner)attestationSigner
{
  return self->_attestationSigner;
}

- (void)setAttestationSigner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationSigner, 0);
  objc_storeStrong((id *)&self->_absintheSigner, 0);
  objc_storeStrong((id *)&self->_nativeAnisetteService, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)absintheSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = a4;
  if ([(AKClient *)client hasInternalPrivateAccess])
  {
    id v9 = +[NSURL URLWithString:@"https://www.apple.com"];
    id v10 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v9];
    [v10 setHTTPBody:v6];
    uint64_t v11 = [(AKAnisetteProvisioningService *)self absintheSigner];
    [v11 signatureForURLRequest:v10 completionHandler:v8];
  }
  else
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001879F8();
    }

    char v13 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  client = self->_client;
  id v11 = a5;
  if ([(AKClient *)client hasInternalPrivateAccess])
  {
    id v12 = [(AKAnisetteProvisioningService *)self attestationSigner];
    [v12 signaturesForData:v8 options:v9 completion:v11];
  }
  else
  {
    char v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001879F8();
    }

    id v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8002 userInfo:0];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v12);
  }
}

@end