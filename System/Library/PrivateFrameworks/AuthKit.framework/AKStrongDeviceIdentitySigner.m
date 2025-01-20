@interface AKStrongDeviceIdentitySigner
+ (id)sharedSigner;
- (AKStrongDeviceIdentifying)strongDeviceIdentifying;
- (AKStrongDeviceIdentitySigner)initWithStrongDeviceIdentifying:(id)a3;
- (BOOL)_chanceInOptionsCountUsingTenExponent:(unint64_t)a3;
- (BOOL)_shouldPostAnalyticsWithSamplingRate:(unint64_t)a3;
- (OS_dispatch_queue)reportingQueue;
- (OS_dispatch_queue)signingQueue;
- (id)_digestForSigningWithBody:(id)a3 header:(id)a4;
- (id)_headersToSignFromRequestData:(id)a3;
- (void)_baaV1HeadersForRequestData:(id)a3 completion:(id)a4;
- (void)_hostSignData:(id)a3 signatureKey:(id)a4 completion:(id)a5;
- (void)_hostSignDataList:(id)a3 completion:(id)a4;
- (void)_machineSignDataList:(id)a3 completion:(id)a4;
- (void)_reportBAASigningForEvent:(id)a3;
- (void)_shouldExcludeHostVIPForRequestData:(id)a3 completion:(id)a4;
- (void)_updateAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)attestationDataForOSVersionWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5;
- (void)baaV1HeadersForRequestData:(id)a3 completion:(id)a4;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setReportingQueue:(id)a3;
- (void)setSigningQueue:(id)a3;
- (void)setStrongDeviceIdentifying:(id)a3;
- (void)signData:(id)a3 completion:(id)a4;
@end

@implementation AKStrongDeviceIdentitySigner

+ (id)sharedSigner
{
  if (qword_100272328 != -1) {
    dispatch_once(&qword_100272328, &stru_100227460);
  }
  v2 = (void *)qword_100272320;

  return v2;
}

- (AKStrongDeviceIdentitySigner)initWithStrongDeviceIdentifying:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKStrongDeviceIdentitySigner;
  v6 = [(AKStrongDeviceIdentitySigner *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_strongDeviceIdentifying, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.authkit.AKStrongDeviceIdentitySigner", v8);
    signingQueue = v7->_signingQueue;
    v7->_signingQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.authkit.baa.reporting", v11);
    reportingQueue = v7->_reportingQueue;
    v7->_reportingQueue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

- (id)_headersToSignFromRequestData:(id)a3
{
  v3 = [a3 headers];
  if ([v3 count])
  {
    id v4 = [v3 mutableCopy];
    id v5 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = objc_msgSend(v4, "allKeys", 0);
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) lowercaseString];
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    dispatch_queue_t v12 = [v5 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    v13 = [v12 componentsJoinedByString:@":"];
    [v4 setObject:v13 forKey:AKRequestSigningHeaderSignedHeadersKey];
  }
  else
  {
    id v4 = +[NSMutableDictionary dictionary];
  }
  v14 = +[AKBAATimeProvider sharedInstance];
  objc_super v15 = [v14 adjustedDeviceTime];

  [v4 setObject:v15 forKey:AKRequestSigningHeaderClientTimeKey];
  [v4 setObject:AKRequestSigningHeaderVersionValue forKey:AKRequestSigningHeaderVersionKey];

  return v4;
}

- (void)baaV1HeadersForRequestData:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000290D4;
  v8[3] = &unk_100227488;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(AKStrongDeviceIdentitySigner *)self _shouldExcludeHostVIPForRequestData:v6 completion:v8];
}

- (void)_baaV1HeadersForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  id v7 = [(AKStrongDeviceIdentitySigner *)self _headersToSignFromRequestData:v6];
  id v8 = [v6 bodyDataHash];
  v35 = [(AKStrongDeviceIdentitySigner *)self _digestForSigningWithBody:v8 header:v7];

  id v9 = [(AKStrongDeviceIdentitySigner *)self _digestForSigningWithBody:0 header:v7];
  id v10 = +[AKDevice currentDevice];
  unsigned int v11 = [v10 isInternalBuild];

  if (v11)
  {
    dispatch_queue_t v12 = [v35 base64EncodedStringWithOptions:0];
    [v7 setValue:v12 forKey:AKRequestSigningHeaderInternalDigestKey];

    v13 = [v9 base64EncodedStringWithOptions:0];
    [v7 setValue:v13 forKey:AKRequestSigningHeaderAltInternalDigestKey];

    v14 = +[AKConfiguration sharedConfiguration];
    objc_super v15 = [v14 configurationValueForKey:@"_AKConfigKeyVMType"];
    v16 = [v15 stringValue];

    if (v16) {
      [v7 setValue:v16 forKey:AKVMTypeHeaderKey];
    }
  }
  long long v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10017DE9C();
  }

  [v7 setValue:@"1" forKey:AKRequestSigningHeaderFeatureHeadersKey];
  long long v18 = _AKSignpostLogSystem();
  uint64_t v19 = _AKSignpostCreate();
  uint64_t v33 = v20;
  os_signpost_id_t v21 = v19;

  v22 = _AKSignpostLogSystem();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "BAASigning", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v24 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BAASigning  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v62 = 0x3032000000;
  v63 = sub_10000F870;
  v64 = sub_10000F788;
  id v65 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = sub_10000F870;
  v57[4] = sub_10000F788;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_10000F870;
  v55[4] = sub_10000F788;
  id v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_10000F870;
  v53[4] = sub_10000F788;
  id v54 = 0;
  v25 = dispatch_group_create();
  dispatch_group_enter(v25);
  v60[0] = v35;
  v60[1] = v9;
  v26 = +[NSArray arrayWithObjects:v60 count:2];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100029730;
  v49[3] = &unk_1002274B0;
  v51 = v55;
  p_long long buf = &buf;
  v27 = v25;
  v50 = v27;
  [(AKStrongDeviceIdentitySigner *)self _machineSignDataList:v26 completion:v49];

  dispatch_group_enter(v27);
  v59[0] = v35;
  v59[1] = v9;
  v28 = +[NSArray arrayWithObjects:v59 count:2];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000297CC;
  v45[3] = &unk_1002274B0;
  v47 = v53;
  v48 = v57;
  v29 = v27;
  v46 = v29;
  [(AKStrongDeviceIdentitySigner *)self _hostSignDataList:v28 completion:v45];

  signingQueue = self->_signingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029868;
  block[3] = &unk_1002274D8;
  v39 = &buf;
  v40 = v57;
  v41 = v55;
  v42 = v53;
  os_signpost_id_t v43 = v21;
  uint64_t v44 = v33;
  id v37 = v7;
  id v38 = v34;
  id v31 = v34;
  id v32 = v7;
  dispatch_group_notify(v29, signingQueue, block);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)_machineSignDataList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10000F870;
  v14[4] = sub_10000F788;
  id v15 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:@"com.apple.authkit.baa.signing" error:0];
  +[NSMutableDictionary dictionary];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029B90;
  v10[3] = &unk_100227500;
  v13 = v14;
  v10[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(AKStrongDeviceIdentitySigner *)self signData:v6 completion:v10];

  _Block_object_dispose(v14, 8);
}

- (void)_hostSignDataList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] == (id)2)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_10000F870;
    v38[4] = sub_10000F788;
    id v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = sub_10000F870;
    v36[4] = sub_10000F788;
    id v37 = 0;
    id v8 = +[NSMutableDictionary dictionary];
    id v9 = dispatch_group_create();
    id v10 = [v6 objectAtIndexedSubscript:0];
    id v11 = [v6 objectAtIndexedSubscript:1];
    dispatch_group_enter(v9);
    uint64_t v12 = AKRequestSigningHeaderHostAltSignatureKey;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002A31C;
    v32[3] = &unk_100227528;
    v35 = v36;
    id v13 = v8;
    id v33 = v13;
    v14 = v9;
    id v34 = v14;
    [(AKStrongDeviceIdentitySigner *)self _hostSignData:v11 signatureKey:v12 completion:v32];
    if (([v11 isEqual:v10] & 1) == 0)
    {
      dispatch_group_enter(v14);
      uint64_t v15 = AKRequestSigningHeaderHostSignatureKey;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10002A3A4;
      v28[3] = &unk_100227528;
      id v31 = v38;
      id v29 = v13;
      v30 = v14;
      [(AKStrongDeviceIdentitySigner *)self _hostSignData:v10 signatureKey:v15 completion:v28];
    }
    signingQueue = self->_signingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002A42C;
    block[3] = &unk_100227550;
    v26 = v38;
    v27 = v36;
    id v22 = v13;
    id v23 = v11;
    id v24 = v10;
    id v25 = v7;
    id v17 = v10;
    id v18 = v11;
    id v19 = v13;
    dispatch_group_notify(v14, signingQueue, block);

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
  }
  else
  {
    uint64_t v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10017DF04();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_hostSignData:(id)a3 signatureKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AKDevice currentDevice];
  unsigned __int8 v12 = [v11 isVirtualMachine];

  if (v12)
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10017DF44((uint64_t)v9, v13);
    }

    v14 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:@"com.apple.authkit.baa.signing.host" error:0];
    uint64_t v15 = _AKSignpostLogSystem();
    os_signpost_id_t v16 = _AKSignpostCreate();
    uint64_t v18 = v17;

    id v19 = _AKSignpostLogSystem();
    uint64_t v20 = v19;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VMHostBAASigning", " enableTelemetry=YES ", buf, 2u);
    }

    os_signpost_id_t v21 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      os_signpost_id_t v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: VMHostBAASigning  enableTelemetry=YES ", buf, 0xCu);
    }

    id v22 = [(AKStrongDeviceIdentitySigner *)self strongDeviceIdentifying];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002A788;
    v24[3] = &unk_100227578;
    id v25 = v14;
    v26 = self;
    id v27 = v9;
    os_signpost_id_t v29 = v16;
    uint64_t v30 = v18;
    id v28 = v10;
    id v23 = v14;
    [v22 createHostSignatureForData:v8 completion:v24];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)signData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(AKStrongDeviceIdentitySigner *)self strongDeviceIdentifying];
    [v8 createBAASignatureForDataFields:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10017DFF0();
  }

  if (v7)
  {
    id v8 = +[NSError errorWithDomain:AKGenericErrorDomain code:-17003 userInfo:0];
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v8);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)attestationDataForOSVersionWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AKStrongDeviceIdentitySigner *)self strongDeviceIdentifying];
  [v11 createOSAttestationDataWithContext:v10 attestationNonce:v9 completion:v8];
}

- (id)_digestForSigningWithBody:(id)a3 header:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "count"))
  {
    id v7 = +[NSMutableArray array];
    id v8 = v7;
    id v30 = v5;
    if (v5)
    {
      id v9 = objc_msgSend(v5, "aaf_toHexString");
      id v10 = [v9 lowercaseString];

      [v8 addObject:v10];
    }
    else
    {
      [v7 addObject:&stru_100233250];
    }
    id v29 = v6;
    id v11 = [v6 mutableCopy];
    unsigned __int8 v12 = [v11 allKeys];
    id v13 = [v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v14 = [v13 mutableCopy];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v20 = [v19 lowercaseString];
          os_signpost_id_t v21 = [v11 objectForKeyedSubscript:v19];
          id v22 = +[NSCharacterSet whitespaceCharacterSet];
          id v23 = [v21 stringByTrimmingCharactersInSet:v22];

          id v24 = +[NSString stringWithFormat:@"%@=%@", v20, v23];
          [v8 addObject:v24];
        }
        id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    id v25 = [v8 componentsJoinedByString:@"|"];
    v26 = [v25 dataUsingEncoding:4];
    id v27 = objc_msgSend(v26, "ak_SHA256Data");

    id v6 = v29;
    id v5 = v30;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKStrongDeviceIdentitySigner *)self strongDeviceIdentifying];
  [v5 resetDeviceIdentityWithCompletion:v4];
}

- (void)_shouldExcludeHostVIPForRequestData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = [v5 requestURL];
  id v8 = [v7 host];

  if ([v8 length])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = [&off_10023B4A8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        unsigned __int8 v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(&off_10023B4A8);
          }
          if ([v8 hasSuffix:*(void *)(*((void *)&v22 + 1) + 8 * (void)v12)])
          {
            id v14 = +[AKConfiguration sharedConfiguration];
            id v15 = [v14 shouldEnableAttestationLogging];

            if (v15)
            {
              id v16 = _AKLogSystem();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v17 = [v5 requestURL];
                *(_DWORD *)long long buf = 138412290;
                id v27 = v17;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Excluding from attestation. URL - %@", buf, 0xCu);
              }
            }
            v6[2](v6, 1);
            goto LABEL_17;
          }
          unsigned __int8 v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [&off_10023B4A8 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v13 = +[AKURLBag sharedBag];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002B1C4;
    v18[3] = &unk_1002275A0;
    os_signpost_id_t v21 = v6;
    id v19 = v8;
    id v20 = v5;
    [v13 configurationValueForKey:@"baa-attestation-exclusion-vip" fromCache:1 completion:v18];
  }
  else
  {
    v6[2](v6, 0);
  }
LABEL_17:
}

- (void)_reportBAASigningForEvent:(id)a3
{
  id v4 = a3;
  reportingQueue = self->_reportingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B47C;
  v7[3] = &unk_100226C00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(reportingQueue, v7);
}

- (void)_updateAnalyticsEvent:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[AKDevice currentDevice];
  unsigned int v8 = [v7 isInternalBuild];

  if (v8)
  {
    id v9 = objc_msgSend(v6, "ak_allUnderlyingErrors");
    id v10 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v15), "localizedDescription", (void)v18);
          [v10 addObject:v16];

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v10 componentsJoinedByString:@"<<"];
    [v5 setObject:v17 forKeyedSubscript:kAAFTestSignatureString];
  }
}

- (BOOL)_shouldPostAnalyticsWithSamplingRate:(unint64_t)a3
{
  id v5 = +[AKConfiguration sharedConfiguration];
  id v6 = [v5 lastKnownIDMSEnvironment];

  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10017E154(v7);
    }

    return 0;
  }
  if (!a3) {
    return 0;
  }
  id v9 = +[AKDevice currentDevice];
  unsigned __int8 v10 = [v9 isInternalBuild];

  if (v10) {
    return 1;
  }

  return [(AKStrongDeviceIdentitySigner *)self _chanceInOptionsCountUsingTenExponent:a3];
}

- (BOOL)_chanceInOptionsCountUsingTenExponent:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  double v3 = __exp10((double)a3);
  return arc4random_uniform((unint64_t)v3) == 0;
}

- (AKStrongDeviceIdentifying)strongDeviceIdentifying
{
  return self->_strongDeviceIdentifying;
}

- (void)setStrongDeviceIdentifying:(id)a3
{
}

- (OS_dispatch_queue)signingQueue
{
  return self->_signingQueue;
}

- (void)setSigningQueue:(id)a3
{
}

- (OS_dispatch_queue)reportingQueue
{
  return self->_reportingQueue;
}

- (void)setReportingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingQueue, 0);
  objc_storeStrong((id *)&self->_signingQueue, 0);

  objc_storeStrong((id *)&self->_strongDeviceIdentifying, 0);
}

@end