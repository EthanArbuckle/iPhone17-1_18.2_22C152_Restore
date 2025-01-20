@interface AKDeviceIdentityWrapper
- (AKDeviceIdentityWrapper)init;
- (BOOL)_isCachedAttestation:(id)a3;
- (BOOL)requiredOIDPresentInCertificates:(id)a3;
- (NSData)baaAttestationHash;
- (__SecKey)_retrieveDAK:(id)a3 error:(id *)a4;
- (id)_attestationWithDataCerts:(id)a3;
- (id)_attestationWithSecCertRefs:(id)a3;
- (id)_baaCertOptions;
- (id)_getAttestationData:(id)a3 rk:(__SecKey *)a4 dak:(__SecKey *)a5 error:(id *)a6;
- (id)_signatureForDataFields:(id)a3 withRefKey:(__SecKey *)a4 error:(id *)a5;
- (id)_splitStringIntoChunks:(id)a3;
- (unint64_t)_generateTTL;
- (void)_getDCRTWithContext:(id)a3 renewDCRT:(BOOL)a4 completion:(id)a5;
- (void)_issueDCRT:(BOOL)a3 completion:(id)a4;
- (void)_renewDCRTWithContext:(id)a3 completion:(id)a4;
- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)_updateRefKeyWithNonce:(id)a3 context:(id)a4 refkey:(__SecKey *)a5 error:(id *)a6;
- (void)createBAASignatureForDataFields:(id)a3 completion:(id)a4;
- (void)createHostSignatureForData:(id)a3 completion:(id)a4;
- (void)createOSAttestationDataWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setBaaAttestationHash:(id)a3;
@end

@implementation AKDeviceIdentityWrapper

- (AKDeviceIdentityWrapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKDeviceIdentityWrapper;
  v2 = [(AKDeviceIdentityWrapper *)&v7 init];
  if (v2)
  {
    v3 = +[AKConfiguration sharedConfiguration];
    uint64_t v4 = [v3 strongDeviceIdentityMarker];
    baaAttestationHash = v2->_baaAttestationHash;
    v2->_baaAttestationHash = (NSData *)v4;
  }
  return v2;
}

- (id)_splitStringIntoChunks:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableArray array];
  v5 = (char *)[v3 length];
  if (v5)
  {
    v6 = v5;
    unint64_t v7 = 0;
    do
    {
      if ((unint64_t)&v6[-v7] >= 0x40) {
        uint64_t v8 = 64;
      }
      else {
        uint64_t v8 = (uint64_t)&v6[-v7];
      }
      v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
      [v4 addObject:v9];
      v7 += v8;
    }
    while (v7 < (unint64_t)v6);
  }

  return v4;
}

- (void)createBAASignatureForDataFields:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AKDevice currentDevice];
  unsigned __int8 v9 = [v8 isStrongDeviceIdentitySupported];

  if (v9)
  {
    v10 = [(AKDeviceIdentityWrapper *)self _baaCertOptions];
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100193F90();
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000CB6E0;
    v13[3] = &unk_10022B4F0;
    id v15 = v7;
    v13[4] = self;
    id v14 = v6;
    sub_1000CB5B8(v10, v13);
  }
  else
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100193FC4();
    }

    v10 = +[NSError errorWithDomain:AKAttestationErrorDomain code:-10000 userInfo:0];
    if (v7) {
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v10);
    }
  }
}

- (id)_signatureForDataFields:(id)a3 withRefKey:(__SecKey *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        id v15 = +[AKSecurityHelper signData:v14 withKey:a4 error:&v20];
        id v16 = v20;
        if (v16)
        {
          v18 = v16;
          if (a5) {
            *a5 = v16;
          }

          id v17 = 0;
          goto LABEL_13;
        }
        [v8 addObject:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = [v8 copy];
LABEL_13:

  return v17;
}

- (void)createHostSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AKDevice currentDevice];
  unsigned __int8 v9 = [v8 isStrongDeviceIdentitySupported];

  if (v9)
  {
    id v10 = +[AKDevice currentDevice];
    unsigned __int8 v11 = [v10 isVirtualMachine];

    if (v11)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000CBD2C;
      v21[3] = &unk_10022B518;
      v21[4] = self;
      id v22 = v7;
      id v12 = v6;
      v13 = v21;
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      uint64_t v14 = off_1002726A0;
      v31 = off_1002726A0;
      if (!off_1002726A0)
      {
        long long v23 = _NSConcreteStackBlock;
        uint64_t v24 = 3221225472;
        v25 = sub_1000CE198;
        v26 = &unk_100226E40;
        v27 = &v28;
        id v15 = (void *)sub_1000CE024();
        id v16 = dlsym(v15, "DeviceIdentityCreateHostSignatureWithCompletion");
        *(void *)(v27[1] + 24) = v16;
        off_1002726A0 = *(_UNKNOWN **)(v27[1] + 24);
        uint64_t v14 = (void *)v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (!v14)
      {
        sub_10017CFA0();
        id v20 = v19;
        _Block_object_dispose(&v28, 8);
        _Unwind_Resume(v20);
      }
      ((void (*)(void, id, void, void *))v14)(0, v12, 0, v13);

      id v17 = v22;
      goto LABEL_13;
    }
    v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100194178();
    }
  }
  else
  {
    v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100193FC4();
    }
  }

  id v17 = +[NSError errorWithDomain:AKAttestationErrorDomain code:-10000 userInfo:0];
  if (v7) {
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v17);
  }
LABEL_13:
}

- (BOOL)_isCachedAttestation:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "ak_SHA256Data");
  v5 = [(AKDeviceIdentityWrapper *)self baaAttestationHash];
  unsigned __int8 v6 = [v4 isEqualToData:v5];

  if ((v6 & 1) == 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000CBFA4;
    v8[3] = &unk_100226C00;
    v8[4] = self;
    id v9 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100272688);
    sub_1000CBFA4((uint64_t)v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100272688);
  }
  return v6;
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1000CC23C();
  v22[0] = v4;
  v24[0] = @"com.apple.akd";
  v5 = sub_1000CC344();
  v22[1] = v5;
  v24[1] = @"com.apple.AuthKit";
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  unsigned __int8 v6 = (id *)qword_1002726B8;
  uint64_t v21 = qword_1002726B8;
  if (!qword_1002726B8)
  {
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000CE288;
    id v16 = &unk_100226E40;
    id v17 = &v18;
    id v7 = (void *)sub_1000CE024();
    v19[3] = (uint64_t)dlsym(v7, "kMAOptionsBAADeleteExistingKeysAndCerts");
    qword_1002726B8 = *(void *)(v17[1] + 24);
    unsigned __int8 v6 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
  {
    sub_10017CFA0();
    __break(1u);
  }
  id v23 = *v6;
  v24[2] = &off_10023B1D0;
  id v8 = v23;
  id v9 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v22 count:3];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CC44C;
  v11[3] = &unk_10022B540;
  id v12 = v3;
  id v10 = v3;
  sub_1000CB5B8(v9, v11);
}

- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4
{
  uint64_t v6 = kAAFDidSucceed;
  id v7 = a4;
  id v8 = a3;
  id v9 = v8;
  if (a4) {
    id v10 = &__kCFBooleanFalse;
  }
  else {
    id v10 = &__kCFBooleanTrue;
  }
  [v8 setObject:v10 forKeyedSubscript:v6];
  [v9 populateUnderlyingErrorsStartingWithRootError:v7];

  id v11 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v11 sendEvent:v9];
}

- (BOOL)requiredOIDPresentInCertificates:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = (char *)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_1000CC740();
        uint64_t v8 = SecCertificateCopyExtensionValue();
        if (v8)
        {
          id v9 = v8;
          id v11 = _AKLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            sub_100194340(v11);
          }

          BOOL v10 = 1;
          goto LABEL_15;
        }
      }
      v5 = (char *)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1001942B4(v9);
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (void)_issueDCRT:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v6 = (id *)qword_1002726C8;
    id v17 = (void *)qword_1002726C8;
    if (!qword_1002726C8)
    {
      id v7 = (void *)sub_1000CE378();
      v15[3] = (uint64_t)dlsym(v7, "kMAOptionsIgnoreExistingDCRT");
      qword_1002726C8 = v15[3];
      uint64_t v6 = (id *)v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v6)
    {
LABEL_11:
      sub_10017CFA0();
      __break(1u);
    }
    id v18 = *v6;
    v19 = &__kCFBooleanTrue;
    id v8 = v18;
    id v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = v5;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v12 = (void (*)(void, id, id))off_1002726D8;
  id v17 = off_1002726D8;
  if (!off_1002726D8)
  {
    long long v13 = (void *)sub_1000CE378();
    v15[3] = (uint64_t)dlsym(v13, "MAEIssueDCRTWithCompletion");
    off_1002726D8 = (_UNKNOWN *)v15[3];
    id v12 = (void (*)(void, id, id))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v12) {
    goto LABEL_11;
  }
  v12(0, v10, v11);
}

- (void)_renewDCRTWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = +[AKAccountManager sharedInstance];
  id v10 = [v9 primaryiCloudAccount];
  unsigned __int8 v11 = [v8 dcrtRenewalAttempted:v10];

  id v12 = +[AKAccountManager sharedInstance];
  long long v13 = +[AKAccountManager sharedInstance];
  uint64_t v14 = [v13 primaryiCloudAccount];
  [v12 setDCRTRenewalAttempted:1 forAccount:v14];

  long long v15 = _AKLogSystem();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v16) {
      sub_1001943CC();
    }

    if (v7)
    {
      id v17 = +[NSError errorWithDomain:AKAttestationErrorDomain code:-10012 userInfo:0];
      v7[2](v7, 0, v17);
    }
  }
  else
  {
    if (v16) {
      sub_100194460();
    }

    [(AKDeviceIdentityWrapper *)self _getDCRTWithContext:v6 renewDCRT:1 completion:v7];
  }
}

- (void)_getDCRTWithContext:(id)a3 renewDCRT:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  +[AAFAnalyticsEvent ak_analyticsEventWithContext:v8 eventName:@"com.apple.authkit.generateDCRT" error:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CCD5C;
  v13[3] = &unk_10022B568;
  v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v16 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v14;
  [(AKDeviceIdentityWrapper *)self _issueDCRT:v6 completion:v13];
}

- (void)_updateRefKeyWithNonce:(id)a3 context:(id)a4 refkey:(__SecKey *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:a4 eventName:@"com.apple.authkit.updateRefkeyWithNonce" error:0];
  SecKeySetParameter();
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100194684();
  }

  [(AKDeviceIdentityWrapper *)self _sendAnalyticsEvent:v10 withError:*a6];
}

- (__SecKey)_retrieveDAK:(id)a3 error:(id *)a4
{
  BOOL v6 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:a3 eventName:@"com.apple.authkit.retrieveDAK" error:0];
  id v12 = 0;
  id v7 = (__SecKey *)SecKeyCopySystemKey();
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001946FC((uint64_t *)&v12, v8, v9);
  }

  if (a4 && v12)
  {
    id v10 = v12;
    *a4 = v10;
    id v12 = 0;
  }
  else
  {
    id v10 = *a4;
  }
  [(AKDeviceIdentityWrapper *)self _sendAnalyticsEvent:v6 withError:v10];

  return v7;
}

- (id)_getAttestationData:(id)a3 rk:(__SecKey *)a4 dak:(__SecKey *)a5 error:(id *)a6
{
  id v8 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:a3 eventName:@"com.apple.authkit.generateOSVersionAttestationData" error:0];
  id v14 = 0;
  Attestation = (void *)SecKeyCreateAttestation();
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100194770((uint64_t *)&v14, v10, v11);
  }

  if (a6 && v14)
  {
    id v12 = v14;
    *a6 = v12;
    id v14 = 0;
  }
  else
  {
    id v12 = *a6;
  }
  [(AKDeviceIdentityWrapper *)self _sendAnalyticsEvent:v8 withError:v12];

  return Attestation;
}

- (void)createOSAttestationDataWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000CD318;
  v10[3] = &unk_10022B568;
  uint64_t v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v14;
  id v9 = v12;
  [(AKDeviceIdentityWrapper *)v11 _getDCRTWithContext:v9 renewDCRT:0 completion:v10];
}

- (id)_baaCertOptions
{
  uint64_t v2 = [(AKDeviceIdentityWrapper *)self _generateTTL];
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10019492C(v2, v3);
  }

  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  BOOL v4 = (id *)qword_1002726E0;
  uint64_t v32 = qword_1002726E0;
  if (!qword_1002726E0)
  {
    id v5 = (void *)sub_1000CE024();
    v30[3] = (uint64_t)dlsym(v5, "kMAOptionsBAAOIDDeviceOSInformation");
    qword_1002726E0 = v30[3];
    BOOL v4 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v4) {
    goto LABEL_26;
  }
  id v36 = *v4;
  id v6 = v36;
  id v7 = +[NSArray arrayWithObjects:&v36 count:1];

  id v8 = [v7 mutableCopy];
  id v9 = +[AKDevice currentDevice];
  unsigned int v10 = [v9 isVirtualMachine];

  if (!v10)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v11 = (void *)qword_1002726F0;
    uint64_t v32 = qword_1002726F0;
    if (!qword_1002726F0)
    {
      id v13 = (void *)sub_1000CE024();
      v30[3] = (uint64_t)dlsym(v13, "kMAOptionsBAAOIDUCRTDeviceIdentifiers");
      qword_1002726F0 = v30[3];
      uint64_t v11 = (void *)v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (v11) {
      goto LABEL_14;
    }
LABEL_26:
    sub_10017CFA0();
    __break(1u);
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v11 = (void *)qword_1002726E8;
  uint64_t v32 = qword_1002726E8;
  if (!qword_1002726E8)
  {
    id v12 = (void *)sub_1000CE024();
    v30[3] = (uint64_t)dlsym(v12, "kMAOptionsBAAOIDDeviceIdentifiers");
    qword_1002726E8 = v30[3];
    uint64_t v11 = (void *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v11) {
    goto LABEL_26;
  }
LABEL_14:
  [v8 addObject:*v11];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  id v14 = (id *)qword_1002726F8;
  uint64_t v32 = qword_1002726F8;
  if (!qword_1002726F8)
  {
    id v15 = (void *)sub_1000CE024();
    v30[3] = (uint64_t)dlsym(v15, "kMAOptionsBAAIgnoreExistingKeychainItems");
    qword_1002726F8 = v30[3];
    id v14 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v14) {
    goto LABEL_26;
  }
  id v16 = *v14;
  v33[0] = v16;
  v35[0] = &__kCFBooleanFalse;
  id v17 = sub_1000CC23C();
  v33[1] = v17;
  v35[1] = @"com.apple.akd";
  id v18 = sub_1000CC344();
  v33[2] = v18;
  v35[2] = @"com.apple.AuthKit";
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  v19 = (id *)qword_100272700;
  uint64_t v32 = qword_100272700;
  if (!qword_100272700)
  {
    uint64_t v20 = (void *)sub_1000CE024();
    v30[3] = (uint64_t)dlsym(v20, "kMAOptionsBAAValidity");
    qword_100272700 = v30[3];
    v19 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v19) {
    goto LABEL_26;
  }
  id v21 = *v19;
  v33[3] = v21;
  id v22 = +[NSNumber numberWithUnsignedInteger:v2];
  v35[3] = v22;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  id v23 = (id *)qword_100272708;
  uint64_t v32 = qword_100272708;
  if (!qword_100272708)
  {
    uint64_t v24 = (void *)sub_1000CE024();
    v30[3] = (uint64_t)dlsym(v24, "kMAOptionsBAAOIDSToInclude");
    qword_100272708 = v30[3];
    id v23 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v23) {
    goto LABEL_26;
  }
  id v34 = *v23;
  v35[4] = v8;
  id v25 = v34;
  v26 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v33 count:5];

  id v27 = [v26 copy];

  return v27;
}

- (unint64_t)_generateTTL
{
  uint64_t v2 = +[AKURLBag sharedBag];
  id v3 = [v2 baaValidity];

  unint64_t v4 = 262080;
  if ((unint64_t)v3 > 0x3FFC0) {
    unint64_t v4 = (unint64_t)v3;
  }
  if (v4 >= 0x80520) {
    return 525600;
  }
  else {
    return v4;
  }
}

- (id)_attestationWithSecCertRefs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CFDataRef v11 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v14 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v11, (void)v14);
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [(AKDeviceIdentityWrapper *)self _attestationWithDataCerts:v5];

  return v12;
}

- (id)_attestationWithDataCerts:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        CFDataRef v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", @"-----BEGIN CERTIFICATE-----", (void)v18);
        id v12 = [v11 base64EncodedStringWithOptions:0];
        id v13 = [(AKDeviceIdentityWrapper *)self _splitStringIntoChunks:v12];
        [v5 addObjectsFromArray:v13];
        [v5 addObject:@"-----END CERTIFICATE-----"];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  long long v14 = [v5 componentsJoinedByString:@"\n"];
  long long v15 = [v14 dataUsingEncoding:4];
  long long v16 = objc_msgSend(v15, "aaf_toCompressedData:", 517);

  return v16;
}

- (NSData)baaAttestationHash
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBaaAttestationHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end