@interface AKNativeAnisetteService
- (AKNativeAnisetteService)initWithClient:(id)a3;
- (BOOL)_shouldAddBAAHeaders;
- (id)_tq_anisetteDataForDSID:(unint64_t)a3 withError:(id *)a4;
- (id)_tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:(id *)a3;
- (void)_cleanUpCPIMBytes:(char *)a3 provisioningContext:(unsigned int)a4;
- (void)_createProvisioningEndURLRequestWithCPIM:(id)a3 withPreviousTransactionID:(id)a4 completion:(id)a5;
- (void)_createProvisioningStartURLRequestWithPreviousTXID:(id)a3 completion:(id)a4;
- (void)_createSyncURLRequestWithMID:(id)a3 SRM:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6;
- (void)_endProvisioningWithPreviousTransactionId:(id)a3 cpimData:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7;
- (void)_invokeTrafficRequest:(id)a3;
- (void)_processEndProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 cpimBytes:(char *)a7 provisioningContext:(unsigned int)a8 completion:(id)a9;
- (void)_processPendingRequests;
- (void)_processStartProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 completion:(id)a7;
- (void)_processSyncAnisetteResponse:(id)a3 completion:(id)a4;
- (void)_signRequestWithProvisioningHeaders:(id)a3 forUrlKey:(id)a4;
- (void)_signWithBAAHeadersIfNeededForKey:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)_startProvisioningWithPreviousTransactionId:(id)a3 completion:(id)a4;
- (void)_syncAnisetteWithMIDData:(id)a3 srmData:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6;
- (void)_tq_activateAndExecuteRequest:(id)a3;
- (void)_tq_eraseAnisetteWithCompletion:(id)a3;
- (void)_tq_invokeAnisetteTrafficRequest:(id)a3 withCompletion:(id)a4;
- (void)_tq_legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)_tq_processEndProvisioningResponse:(id)a3 error:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7;
- (void)_tq_processStartProvisioningResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_tq_provisionAnisetteWithCompletion:(id)a3;
- (void)_tq_syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchAttestationDataForRequestData:(id)a3 completion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKNativeAnisetteService

- (AKNativeAnisetteService)initWithClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKNativeAnisetteService;
  v6 = [(AKNativeAnisetteService *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = +[AKMIDValidator sharedValidator];
    midValidator = v7->_midValidator;
    v7->_midValidator = (AKMIDValidator *)v8;

    uint64_t v10 = +[AKStrongDeviceIdentitySigner sharedSigner];
    strongDeviceIdentitySigner = v7->_strongDeviceIdentitySigner;
    v7->_strongDeviceIdentitySigner = (AKStrongDeviceIdentitySigner *)v10;
  }
  return v7;
}

- (BOOL)_shouldAddBAAHeaders
{
  v2 = +[AKFeatureManager sharedManager];
  unsigned int v3 = [v2 isBAASupportedForVirtualMachines];

  v4 = _AKTrafficLogSubsystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v5) {
      sub_10017ECCC();
    }
    goto LABEL_15;
  }
  if (v5) {
    sub_10017EC98();
  }

  v6 = +[AKDevice currentDevice];
  unsigned __int8 v7 = [v6 isVirtualMachine];

  if ((v7 & 1) == 0)
  {
    v4 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10017EC64();
    }
    goto LABEL_15;
  }
  uint64_t v8 = +[AKDevice currentDevice];
  unsigned __int8 v9 = [v8 isStrongDeviceIdentitySupported];

  v4 = _AKTrafficLogSubsystem();
  BOOL v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if ((v9 & 1) == 0)
  {
    if (v10) {
      sub_10017EC30();
    }
LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  if (v10) {
    sub_10017EBFC();
  }
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (void)_tq_activateAndExecuteRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  v6 = [v5 trafficQueue];
  dispatch_assert_queue_V2(v6);

  unsigned __int8 v7 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10017EEA8();
  }

  uint64_t v8 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  [v8 setActiveSigningRequest:v4];

  unsigned __int8 v9 = [v4 signingBlock];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A170;
  v12[3] = &unk_100226C00;
  id v13 = v4;
  v14 = self;
  BOOL v10 = (void (*)(void *, id, void *))v9[2];
  id v11 = v4;
  v10(v9, v11, v12);
}

- (void)_tq_invokeAnisetteTrafficRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  unsigned __int8 v9 = [v8 trafficQueue];
  dispatch_assert_queue_V2(v9);

  id v22 = 0;
  BOOL v10 = [(AKNativeAnisetteService *)self _tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:&v22];
  id v11 = v22;
  if (!v10)
  {
    v12 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10017F09C();
    }

    id v21 = 0;
    BOOL v10 = [(AKNativeAnisetteService *)self _tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:&v21];
    id v11 = v21;
    if (v10)
    {
      id v13 = _AKTrafficLogSubsystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10017F068();
      }
    }
  }
  v14 = [v11 userInfo];
  v15 = [v14 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (v10 || ![v15 isAccountNotProvisioned])
  {
    [(AKMIDValidator *)self->_midValidator validateMID:v10 anisetteFetchError:v11];
    if (v7) {
      v7[2](v7, v10, v11);
    }
  }
  else if ([v6 shouldProvisionIfNeccessary])
  {
    [(AKMIDValidator *)self->_midValidator validateMID:0 anisetteFetchError:v11];
    v16 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10017F000();
    }

    v17 = +[AKURLBagService sharedBagService];
    [v17 clearCache];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000355D8;
    v19[3] = &unk_100227BD0;
    v19[4] = self;
    v20 = v7;
    [(AKNativeAnisetteService *)self _tq_provisionAnisetteWithCompletion:v19];
  }
  else
  {
    v18 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10017F034();
    }

    if (v7) {
      v7[2](v7, 0, v11);
    }
  }
}

- (id)_tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:(id *)a3
{
  BOOL v5 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v6 = [v5 trafficQueue];
  dispatch_assert_queue_V2(v6);

  unint64_t v7 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromLastKnownIDMSEnvironment];
  uint64_t v13 = 0;
  uint64_t v8 = +[AKADIProxy getIDMSRoutingInfo:&v13 forDSID:v7];
  if (v8)
  {
    uint64_t v9 = v8;
    BOOL v10 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10017F208();
    }

    if (a3)
    {
      +[NSError ak_wrappedAnisetteError:-8025 underlyingADIErrorCode:v9];
      id v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = [(AKNativeAnisetteService *)self _tq_anisetteDataForDSID:v7 withError:a3];
    [v11 setRoutingInfo:v13];
  }

  return v11;
}

- (void)fetchAttestationDataForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_10000F890;
  v44[4] = sub_10000F798;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_10000F890;
  v42[4] = sub_10000F798;
  id v43 = 0;
  uint64_t v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate();
  uint64_t v11 = v10;

  v12 = _AKSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SignAndAttestation", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignAndAttestation  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10000F890;
  v49 = sub_10000F798;
  id v50 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_10000F890;
  v40[4] = sub_10000F798;
  id v41 = 0;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000A0B0;
  v36[3] = &unk_100227B08;
  p_long long buf = &buf;
  v39 = v44;
  v16 = v15;
  v37 = v16;
  [(AKNativeAnisetteService *)self fetchAnisetteDataAndProvisionIfNecessary:1 withCompletion:v36];
  v17 = +[NSMutableDictionary dictionary];
  if ([(AKNativeAnisetteService *)self _shouldAddBAAHeaders])
  {
    dispatch_group_enter(v16);
    strongDeviceIdentitySigner = self->_strongDeviceIdentitySigner;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003551C;
    v32[3] = &unk_1002274B0;
    v34 = v40;
    v35 = v42;
    v33 = v16;
    [(AKStrongDeviceIdentitySigner *)strongDeviceIdentitySigner baaV1HeadersForRequestData:v6 completion:v32];
  }
  v19 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  v20 = [v19 trafficQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100006164;
  v23[3] = &unk_100227B30;
  v26 = v44;
  v27 = v42;
  v28 = &buf;
  v29 = v40;
  os_signpost_id_t v30 = v9;
  uint64_t v31 = v11;
  id v24 = v17;
  id v25 = v7;
  id v21 = v7;
  id v22 = v17;
  dispatch_group_notify(v16, v20, v23);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = [AKSigningTrafficClearanceRequest alloc];
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006534;
  v13[3] = &unk_100227B80;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  v12 = [(AKSigningTrafficClearanceRequest *)v8 initWithClient:client signingBlock:v13];
  [(AKSigningTrafficClearanceRequest *)v12 setShouldProvisionIfNeccessary:v4];
  [(AKNativeAnisetteService *)self _invokeTrafficRequest:v12];
}

- (id)_tq_anisetteDataForDSID:(unint64_t)a3 withError:(id *)a4
{
  id v6 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v7 = [v6 trafficQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10017F4B8();
  }

  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = 0;
  uint64_t v9 = +[AKADIProxy requestOTPForDSID:a3 outMID:&v24 outMIDSize:(char *)&v22 + 4 outOTP:&v23 outOTPSize:&v22];
  if (v9)
  {
    id v10 = +[NSError ak_wrappedAnisetteError:v9];
    unsigned int v11 = [v10 isAccountNotProvisioned];
    v12 = _AKTrafficLogSubsystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v13) {
        sub_10017F39C(a3);
      }
    }
    else if (v13)
    {
      sub_10017F42C();
    }

    if (a4)
    {
      id v10 = v10;
      id v20 = 0;
      *a4 = v10;
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v14 = objc_alloc((Class)NSData);
    id v10 = [v14 initWithBytesNoCopy:v24 length:HIDWORD(v22) freeWhenDone:0];
    id v15 = objc_alloc((Class)NSData);
    id v16 = [v15 initWithBytesNoCopy:v23 length:v22 freeWhenDone:0];
    v17 = [v10 base64EncodedStringWithOptions:0];
    v18 = [v16 base64EncodedStringWithOptions:0];
    v19 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10017F294((uint64_t)v17, (uint64_t)v18, v19);
    }

    if (v24) {
      +[AKADIProxy dispose:](AKADIProxy, "dispose:");
    }
    if (v23) {
      +[AKADIProxy dispose:](AKADIProxy, "dispose:");
    }
    id v20 = objc_alloc_init((Class)AKAnisetteData);
    [v20 setMachineID:v17];
    [v20 setOneTimePassword:v18];
  }

  return v20;
}

- (void)_processPendingRequests
{
  unsigned int v3 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  BOOL v4 = [v3 trafficQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005950;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_invokeTrafficRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10017ED00();
  }

  id v6 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v7 = [v6 trafficQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000562C;
  v9[3] = &unk_100226C00;
  id v10 = v4;
  unsigned int v11 = self;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [AKSigningTrafficClearanceRequest alloc];
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000358C0;
  v13[3] = &unk_100227B80;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = [(AKSigningTrafficClearanceRequest *)v8 initWithClient:client signingBlock:v13];
  [(AKNativeAnisetteService *)self _invokeTrafficRequest:v12];
}

- (void)_tq_legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  uint64_t v9 = [v8 trafficQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = +[NSScanner scannerWithString:v7];

  uint64_t v14 = 0;
  if ([v10 scanUnsignedLongLong:&v14])
  {
    id v13 = 0;
    uint64_t v11 = [(AKNativeAnisetteService *)self _tq_anisetteDataForDSID:v14 withError:&v13];
    id v12 = v13;
    v6[2](v6, v11, v12);

    id v6 = (void (**)(id, uint64_t, id))v11;
  }
  else
  {
    id v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8003 userInfo:0];
    v6[2](v6, 0, v12);
  }
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Fetching peer attestation data for request (%@)", (uint8_t *)&v10, 0x16u);
  }

  id v9 = objc_alloc_init((Class)AKAppleIDSigningController);
  [v9 setIsProxy:1];
  [v9 attestationDataForRequest:v6 completion:v7];
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [AKSigningTrafficClearanceRequest alloc];
  client = self->_client;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_100035CD8;
  __int16 v12 = &unk_100227C48;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = [(AKSigningTrafficClearanceRequest *)v5 initWithClient:client signingBlock:&v9];
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v8, v9, v10, v11, v12, v13);
}

- (void)_startProvisioningWithPreviousTransactionId:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035EA0;
  v8[3] = &unk_100227C98;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(AKNativeAnisetteService *)self _createProvisioningStartURLRequestWithPreviousTXID:v6 completion:v8];
}

- (void)_processStartProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v14)
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10017F614();
    }

    if (v16) {
      (*((void (**)(id, void, id, void, void, void))v16 + 2))(v16, 0, v14, 0, 0, 0);
    }
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [v13 statusCode];
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = +[NSNumber numberWithInteger:v18];
      *(_DWORD *)long long buf = 138412290;
      id v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Start provisioning response code: %@", buf, 0xCu);
    }
    if (!v12 || v18 == (id)200)
    {
      if (!v12)
      {
        id v25 = 0;
        if (!v15)
        {
LABEL_20:
          if (v18 == (id)436)
          {
            v26 = [v25 objectForKeyedSubscript:@"Response"];
            v27 = [v26 objectForKeyedSubscript:@"txid"];

            if (v27)
            {
              v28 = _AKLogSystem();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Attempting provisioning again...", buf, 2u);
              }

              [(AKNativeAnisetteService *)self _startProvisioningWithPreviousTransactionId:0 completion:v16];
            }

            goto LABEL_29;
          }
        }
LABEL_27:
        v29 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
        os_signpost_id_t v30 = [v29 trafficQueue];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10003646C;
        v31[3] = &unk_100227618;
        v31[4] = self;
        id v32 = v25;
        id v33 = 0;
        id v34 = v16;
        id v24 = v25;
        dispatch_async(v30, v31);

        goto LABEL_28;
      }
    }
    else
    {
      id v21 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
      uint64_t v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Start provisioning response body: %@", buf, 0xCu);
      }
    }
    id v25 = +[AAFSerialization dictionaryFromObject:v12 ofType:@"application/x-plist"];
    if (!v15) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
  uint64_t v23 = _AKLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10017F5AC();
  }

  if (v16)
  {
    id v24 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8008 userInfo:0];
    (*((void (**)(id, void, id, void, void, void))v16 + 2))(v16, 0, v24, 0, 0, 0);
LABEL_28:
  }
LABEL_29:
}

- (void)_tq_processStartProvisioningResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v10 = [v9 trafficQueue];
  dispatch_assert_queue_V2(v10);

  unint64_t v11 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment];
  if (v7)
  {
    unint64_t v12 = v11;
    id v13 = [v7 objectForKeyedSubscript:@"Response"];
    id v14 = [v13 objectForKeyedSubscript:@"spim"];

    if (!v14)
    {
      uint64_t v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10017F6B0();
      }

      id v15 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8008 userInfo:0];
      (*((void (**)(id, void, id, void, void, void))v8 + 2))(v8, 0, v15, 0, 0, 0);
      goto LABEL_21;
    }
    id v15 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v14 options:0];
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v16 = +[AKADIProxy startProvisioningWithDSID:SPIM:SPIMLength:outCPIM:outCPIMLength:outSession:](AKADIProxy, "startProvisioningWithDSID:SPIM:SPIMLength:outCPIM:outCPIMLength:outSession:", v12, [v15 bytes], objc_msgSend(v15, "length"), &v25, (char *)&v24 + 4, &v24);
    uint64_t v17 = v25;
    id v18 = _AKLogSystem();
    v19 = v18;
    if (v16 || !v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10017F6E4();
      }

      [(AKNativeAnisetteService *)self _cleanUpCPIMBytes:v25 provisioningContext:v24];
      if (!v8) {
        goto LABEL_21;
      }
      id v20 = +[NSError ak_wrappedAnisetteError:v16];
      (*((void (**)(id, void, void *, void, void, uint64_t))v8 + 2))(v8, 0, v20, 0, v24, v25);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ADIProvisioningStart succeeded!", v23, 2u);
      }

      id v20 = +[NSData dataWithBytes:v25 length:HIDWORD(v24)];
      if (v8) {
        (*((void (**)(id, uint64_t, void, void *, void, uint64_t))v8 + 2))(v8, 1, 0, v20, v24, v25);
      }
    }

LABEL_21:
    goto LABEL_22;
  }
  id v21 = _AKLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10017F67C();
  }

  if (v8)
  {
    id v14 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8007 userInfo:0];
    (*((void (**)(id, void, void *, void, void, void))v8 + 2))(v8, 0, v14, 0, 0, 0);
LABEL_22:
  }
}

- (void)_endProvisioningWithPreviousTransactionId:(id)a3 cpimData:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7
{
  id v12 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003689C;
  v15[3] = &unk_100227CE8;
  unsigned int v19 = a6;
  id v17 = a7;
  id v18 = a5;
  v15[4] = self;
  id v16 = v12;
  id v13 = v12;
  id v14 = v17;
  [(AKNativeAnisetteService *)self _createProvisioningEndURLRequestWithCPIM:a4 withPreviousTransactionID:v13 completion:v15];
}

- (void)_processEndProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 cpimBytes:(char *)a7 provisioningContext:(unsigned int)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  unsigned int v19 = (void (**)(id, void, id))a9;
  if (v17)
  {
    id v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10017F898();
    }

    if (v19) {
      v19[2](v19, 0, v17);
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [v16 statusCode];
    id v22 = v21;
    if (!v15 || v21 == (id)200)
    {
      if (!v15)
      {
        v26 = 0;
        if (!v18)
        {
LABEL_18:
          if (v22 == (id)436)
          {
            v27 = [v26 objectForKeyedSubscript:@"Response"];
            v28 = [v27 objectForKeyedSubscript:@"txid"];

            if (v28)
            {
              v29 = _AKLogSystem();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Attempting provisioning again...", buf, 2u);
              }

              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472;
              v39[2] = sub_100036E9C;
              v39[3] = &unk_100227D10;
              v39[4] = self;
              id v40 = 0;
              id v41 = v19;
              [(AKNativeAnisetteService *)self _startProvisioningWithPreviousTransactionId:0 completion:v39];
            }
            goto LABEL_27;
          }
        }
LABEL_25:
        id v32 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
        os_signpost_id_t v30 = [v32 trafficQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100036ECC;
        block[3] = &unk_100227D38;
        block[4] = self;
        id v34 = v26;
        id v35 = 0;
        v37 = a7;
        unsigned int v38 = a8;
        id v36 = v19;
        id v25 = v26;
        dispatch_async(v30, block);

        goto LABEL_26;
      }
    }
    else
    {
      id v31 = [objc_alloc((Class)NSString) initWithData:v15 encoding:4];
      uint64_t v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v43 = v31;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "End provisioning response body: %@", buf, 0xCu);
      }
    }
    v26 = +[AAFSerialization dictionaryFromObject:v15, @"application/x-plist", v31 ofType];
    if (!v18) {
      goto LABEL_18;
    }
    goto LABEL_25;
  }
  uint64_t v24 = _AKLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10017F830();
  }

  if (v19)
  {
    id v25 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8008 userInfo:0];
    v19[2](v19, 0, v25);
LABEL_26:
  }
LABEL_27:
}

- (void)_tq_processEndProvisioningResponse:(id)a3 error:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = (void (**)(id, void, void *))a7;
  id v13 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v14 = [v13 trafficQueue];
  dispatch_assert_queue_V2(v14);

  unint64_t v15 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment];
  if (v11)
  {
    unint64_t v16 = v15;
    id v17 = [v11 objectForKeyedSubscript:@"Response"];
    id v18 = [v17 objectForKeyedSubscript:@"ptm"];

    if (!v18)
    {
      unsigned int v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10017FAB4();
      }
    }
    id v20 = [v11 objectForKeyedSubscript:@"Response"];
    id v21 = [v20 objectForKeyedSubscript:@"tk"];

    if (!v21)
    {
      id v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10017FA80();
      }
    }
    uint64_t v23 = [v11 objectForKeyedSubscript:@"Response"];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"X-Apple-I-MD-RINFO"];

    if (v24)
    {
      if (v18 && v21)
      {
        uint64_t v25 = +[AKADIProxy setIDMSRoutingInfo:forDSID:](AKADIProxy, "setIDMSRoutingInfo:forDSID:", [v24 integerValue], v16);
        if (!v25)
        {
          id v32 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v18 options:0];
          id v33 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v21 options:0];
          id v31 = v32;
          id v39 = [v31 bytes];
          id v38 = [v31 length];
          id v41 = v33;
          unsigned int v34 = +[AKADIProxy endProvisioningWithSession:PTM:PTMLength:TK:TKLength:](AKADIProxy, "endProvisioningWithSession:PTM:PTMLength:TK:TKLength:", v8, v39, v38, [v41 bytes], objc_msgSend(v41, "length"));
          if (v34)
          {
            unsigned int v40 = v34;
            id v35 = _AKLogSystem();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              sub_10017F968();
            }

            [(AKNativeAnisetteService *)self _cleanUpCPIMBytes:a5 provisioningContext:v8];
            id v36 = +[NSError ak_wrappedAnisetteError:v40];
            v12[2](v12, 0, v36);
          }
          else
          {
            [(AKNativeAnisetteService *)self _cleanUpCPIMBytes:a5 provisioningContext:v8];
            v37 = _AKLogSystem();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "ADIProvisioningEnd succeeded!", buf, 2u);
            }

            v12[2](v12, 1, 0);
          }

          goto LABEL_25;
        }
        uint64_t v26 = v25;
        v27 = _AKLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10017F9F4();
        }

        [(AKNativeAnisetteService *)self _cleanUpCPIMBytes:a5 provisioningContext:v8];
        uint64_t v28 = +[NSError ak_wrappedAnisetteError:v26];
LABEL_24:
        id v31 = (id)v28;
        v12[2](v12, 0, (void *)v28);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      os_signpost_id_t v30 = _AKLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10017F934();
      }
    }
    [(AKNativeAnisetteService *)self _cleanUpCPIMBytes:a5 provisioningContext:v8];
    uint64_t v28 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8008 userInfo:0];
    goto LABEL_24;
  }
  [(AKNativeAnisetteService *)self _cleanUpCPIMBytes:a5 provisioningContext:v8];
  v29 = _AKLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10017F900();
  }

  id v18 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8007 userInfo:0];
  v12[2](v12, 0, v18);
LABEL_26:
}

- (void)_cleanUpCPIMBytes:(char *)a3 provisioningContext:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3) {
    +[AKADIProxy dispose:](AKADIProxy, "dispose:");
  }
  if (v4)
  {
    BOOL v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Destroying provisioning context.", v6, 2u);
    }

    +[AKADIProxy destroyProvisioningSession:v4];
  }
}

- (void)_tq_provisionAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v6 = [v5 trafficQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Kicking off Anisette provisioning....", buf, 2u);
  }

  uint64_t v8 = +[NSError ak_wrappedAnisetteError:](NSError, "ak_wrappedAnisetteError:", +[AKADIProxy isMachineProvisioned:](AKADIProxy, "isMachineProvisioned:", +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]));
  if ([v8 isAccountNotProvisioned])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000375D8;
    v11[3] = &unk_100227D60;
    v11[4] = self;
    id v12 = v4;
    [(AKNativeAnisetteService *)self _startProvisioningWithPreviousTransactionId:0 completion:v11];
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10017FAE8();
    }

    id v10 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8006 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

- (void)_signWithBAAHeadersIfNeededForKey:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AKURLBag sharedBag];
  unsigned int v11 = [v10 isBaaEnabledForKey:v7];

  if (v11)
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Signing with BAA headers for urlKey: %@", buf, 0xCu);
    }

    id v13 = objc_alloc_init((Class)AKAppleIDSigningController);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000377B8;
    v14[3] = &unk_100227DB0;
    id v15 = v8;
    id v16 = v9;
    [v13 signWithBAAHeaders:v15 completion:v14];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [AKSigningTrafficClearanceRequest alloc];
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000379CC;
  v13[3] = &unk_100227B80;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = [(AKSigningTrafficClearanceRequest *)v8 initWithClient:client signingBlock:v13];
  [(AKNativeAnisetteService *)self _invokeTrafficRequest:v12];
}

- (void)_syncAnisetteWithMIDData:(id)a3 srmData:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100037B90;
  v10[3] = &unk_100227E00;
  id v11 = self;
  id v12 = a6;
  id v9 = v12;
  [(AKNativeAnisetteService *)v11 _createSyncURLRequestWithMID:a3 SRM:a4 routingInfo:a5 completion:v10];
}

- (void)_processSyncAnisetteResponse:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  unint64_t v7 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment];
  if (v5)
  {
    unint64_t v8 = v7;
    id v9 = [v5 objectForKeyedSubscript:@"Response"];
    id v10 = [v9 objectForKeyedSubscript:@"Status"];

    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10017FD7C();
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v10 objectForKeyedSubscript:AKErrorStatusCodeKey];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 integerValue])
          {
            id v13 = _AKLogSystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              sub_10017FCE0();
            }

            id v14 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8011 userInfo:0];
            v6[2](v6, 0, v14);
LABEL_29:

            goto LABEL_30;
          }
        }
      }
      id v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Server sync looks like it succeeded.", buf, 2u);
      }
    }
    else
    {
      id v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10017FD48();
      }
    }

    id v17 = [v5 objectForKeyedSubscript:@"Response"];
    id v14 = [v17 objectForKeyedSubscript:@"X-Apple-I-MD-RINFO"];

    if (!v14) {
      goto LABEL_26;
    }
    id v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "We've been given new R-Info.", v25, 2u);
    }

    uint64_t v19 = +[AKADIProxy setIDMSRoutingInfo:forDSID:](AKADIProxy, "setIDMSRoutingInfo:forDSID:", [v14 integerValue], v8);
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = _AKLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10017FC54();
      }

      id v22 = +[NSError ak_wrappedAnisetteError:v20];
      v6[2](v6, 0, v22);
    }
    else
    {
LABEL_26:
      uint64_t v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Anisette sync is complete!", (uint8_t *)v24, 2u);
      }

      v6[2](v6, 1, 0);
    }
    goto LABEL_29;
  }
  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10017FC20();
  }

  id v10 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8007 userInfo:0];
  v6[2](v6, 0, v10);
LABEL_30:
}

- (void)_tq_syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v9 = [v8 trafficQueue];
  dispatch_assert_queue_V2(v9);

  if (v6 && [v6 length])
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resyncing Anisette provisioning data...", buf, 2u);
    }

    unint64_t v11 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment];
    uint64_t v32 = 0;
    *(void *)long long buf = 0;
    unsigned int v31 = 0;
    unsigned int v30 = 0;
    id v12 = v6;
    uint64_t v13 = +[AKADIProxy synchronizeWithDSID:SIM:SIMLength:outMID:outMIDLength:outSRM:outSRMLength:](AKADIProxy, "synchronizeWithDSID:SIM:SIMLength:outMID:outMIDLength:outSRM:outSRMLength:", v11, [v12 bytes], objc_msgSend(v12, "length"), buf, &v31, &v32, &v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100038708;
    v29[3] = &unk_100227E20;
    v29[4] = v32;
    v29[5] = *(void *)buf;
    id v14 = objc_retainBlock(v29);
    uint64_t v16 = v32;
    uint64_t v15 = *(void *)buf;
    id v17 = _AKLogSystem();
    id v18 = v17;
    if (!v13 && v16 && v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ADISynchronize succeeded!", v28, 2u);
      }

      uint64_t v19 = +[NSData dataWithBytes:*(void *)buf length:v31];
      uint64_t v20 = +[NSData dataWithBytes:v32 length:v30];
      *(void *)uint64_t v28 = 0;
      if (+[AKADIProxy getIDMSRoutingInfo:v28 forDSID:v11])
      {
        id v21 = _AKLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10017FEA8();
        }
      }
      uint64_t v22 = *(void *)v28;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100038798;
      v25[3] = &unk_100227C20;
      uint64_t v26 = v14;
      id v27 = v7;
      [(AKNativeAnisetteService *)self _syncAnisetteWithMIDData:v19 srmData:v20 routingInfo:v22 completion:v25];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10017FE1C();
      }

      ((void (*)(void *))v14[2])(v14);
      uint64_t v19 = +[NSError ak_wrappedAnisetteError:v13];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v19);
    }
  }
  else
  {
    uint64_t v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10017FDE8();
    }

    uint64_t v24 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8010 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v24);
  }
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [AKSigningTrafficClearanceRequest alloc];
  client = self->_client;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unint64_t v11 = sub_1000388E4;
  id v12 = &unk_100227C48;
  uint64_t v13 = self;
  id v14 = v4;
  id v7 = v4;
  unint64_t v8 = [(AKSigningTrafficClearanceRequest *)v5 initWithClient:client signingBlock:&v9];
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v8, v9, v10, v11, v12, v13);
}

- (void)_tq_eraseAnisetteWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v5 = +[AKNativeAnisetteServiceTrafficManager sharedSigningService];
  id v6 = [v5 trafficQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Erasing Anisette provisioning data...", buf, 2u);
  }

  uint64_t v8 = +[AKADIProxy eraseProvisioningForDSID:](AKADIProxy, "eraseProvisioningForDSID:", +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]);
  id v9 = _AKLogSystem();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10017FF9C();
    }

    id v11 = +[NSError ak_wrappedAnisetteError:v8];
    v4[2](v4, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Erasing Anisette data succeeded!", v16, 2u);
    }

    midValidator = self->_midValidator;
    id v15 = 0;
    unsigned __int8 v13 = [(AKMIDValidator *)midValidator resetKeychainCacheWithError:&v15];
    id v11 = v15;
    if ((v13 & 1) == 0)
    {
      id v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10017FF34();
      }
    }
    v4[2](v4, 1, 0);
  }
}

- (void)_createProvisioningStartURLRequestWithPreviousTXID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AKURLBag sharedBag];
  uint64_t v9 = AKURLBagKeyStartProvisioning;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100038CA8;
  v12[3] = &unk_100227E70;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 urlForKey:v9 completion:v12];
}

- (void)_createProvisioningEndURLRequestWithCPIM:(id)a3 withPreviousTransactionID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AKURLBag sharedBag];
  uint64_t v12 = AKURLBagKeyEndProvisioning;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100039068;
  v16[3] = &unk_100227E98;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = self;
  id v20 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [v11 urlForKey:v12 completion:v16];
}

- (void)_createSyncURLRequestWithMID:(id)a3 SRM:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[AKURLBag sharedBag];
  uint64_t v14 = AKURLBagKeySyncAnisette;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000393E8;
  v18[3] = &unk_100227EC0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  unint64_t v22 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  [v13 urlForKey:v14 completion:v18];
}

- (void)_signRequestWithProvisioningHeaders:(id)a3 forUrlKey:(id)a4
{
  id v9 = a3;
  objc_msgSend(v9, "ak_addClientInfoHeader");
  objc_msgSend(v9, "ak_addClientTimeHeader");
  objc_msgSend(v9, "ak_addDeviceMLBHeader");
  objc_msgSend(v9, "ak_addDeviceROMHeader");
  objc_msgSend(v9, "ak_addDeviceSerialNumberHeader");
  objc_msgSend(v9, "ak_addDeviceUDIDHeader");
  objc_msgSend(v9, "ak_addLocalUserUUIDHashHeader");
  objc_msgSend(v9, "ak_addInternalBuildHeader");
  objc_msgSend(v9, "ak_addSeedBuildHeader");
  if (+[AKDevice hasUniqueDeviceIdentifier]) {
    objc_msgSend(v9, "ak_addProvisioningUDIDHeader");
  }
  id v5 = [(AKClient *)self->_client fullName];
  id v6 = [v5 length];

  id v7 = v9;
  if (v6)
  {
    id v8 = [(AKClient *)self->_client fullName];
    objc_msgSend(v9, "ak_addClientApp:", v8);

    id v7 = v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongDeviceIdentitySigner, 0);
  objc_storeStrong((id *)&self->_midValidator, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end