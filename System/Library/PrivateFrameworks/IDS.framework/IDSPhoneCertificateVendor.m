@interface IDSPhoneCertificateVendor
- (BOOL)_isPhoneCertificateVendorSupported;
- (IDSDaemonRequestTimer)daemonRequestTimer;
- (IDSPhoneCertificateVendor)initWithQueue:(id)a3;
- (IDSPhoneCertificateVendor)strongSelfReference;
- (OS_dispatch_queue)queue;
- (id)_clientErrorForCode:(int64_t)a3 underlyingError:(id)a4;
- (id)_debugDescriptionForErrorCode:(int64_t)a3;
- (id)_scheduleTimeoutForCarrierTokenCompletionBlock:(id)a3;
- (id)_scheduleTimeoutForPhoneAuthenticationCertificateRequestCompletionBlock:(id)a3;
- (id)_scheduleTimeoutForPhoneAuthenticationSignatureRequestCompletionBlock:(id)a3;
- (id)_scheduleTimeoutForPhoneSubscriptionSourceCompletionBlock:(id)a3;
- (int64_t)_subscriptionSourceForContext:(id)a3;
- (int64_t)_subscriptionSourceFromIntegerValue:(int64_t)a3;
- (int64_t)currentPhoneUserSubscriptionSourceWithError:(id *)a3;
- (void)_updateSelfRetentionBasedOnInFlightRequestCount;
- (void)authenticatePhoneWithCompletion:(id)a3;
- (void)dealloc;
- (void)didAuthenticatePhoneWithAuthenticationCertificateData:(id)a3 requestUUID:(id)a4 error:(id)a5;
- (void)didFetchPhoneUserSubscriptionSource:(id)a3 requestUUID:(id)a4 error:(id)a5;
- (void)didGeneratePhoneAuthenticationSignature:(id)a3 nonce:(id)a4 certificates:(id)a5 labelIDs:(id)a6 inputData:(id)a7 requestUUID:(id)a8 error:(id)a9;
- (void)didRequestCarrierTokenString:(id)a3 requestUUID:(id)a4 error:(id)a5;
- (void)didSetPhoneUserSubscriptionSource:(id)a3 requestUUID:(id)a4 error:(id)a5;
- (void)generatePhoneAuthenticationSignatureOverData:(id)a3 withCompletion:(id)a4;
- (void)requestCarrierTokenWithMessageBody:(id)a3 completion:(id)a4;
- (void)requestCarrierTokenWithParameters:(id)a3 completion:(id)a4;
- (void)requestCurrentPhoneUserSubscriptionSourceWithCompletion:(id)a3;
- (void)setCurrentPhoneUserSubscriptionSource:(int64_t)a3 completion:(id)a4;
- (void)setStrongSelfReference:(id)a3;
@end

@implementation IDSPhoneCertificateVendor

- (IDSPhoneCertificateVendor)initWithQueue:(id)a3
{
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDSPhoneCertificateVendor;
  v5 = [(IDSPhoneCertificateVendor *)&v14 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.IDS.IDSPhoneCertificateVendor", v6, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(IDSDaemonRequestTimer);
    daemonRequestTimer = v5->_daemonRequestTimer;
    v5->_daemonRequestTimer = v9;

    v11 = +[IDSDaemonController sharedInstance];
    v12 = [v11 listener];
    [v12 addHandler:v5];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[IDSDaemonController sharedInstance];
  v4 = [v3 listener];
  [v4 removeHandler:self];

  v5.receiver = self;
  v5.super_class = (Class)IDSPhoneCertificateVendor;
  [(IDSPhoneCertificateVendor *)&v5 dealloc];
}

- (void)authenticatePhoneWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(IDSPhoneCertificateVendor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19196197C;
  v7[3] = &unk_1E5729230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)generatePhoneAuthenticationSignatureOverData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSPhoneCertificateVendor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191961BDC;
  block[3] = &unk_1E572A968;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)requestCarrierTokenWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSPhoneCertificateVendor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191961E40;
  block[3] = &unk_1E572A968;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_updateSelfRetentionBasedOnInFlightRequestCount
{
  v3 = [(IDSPhoneCertificateVendor *)self daemonRequestTimer];
  [v3 inFlightRequestCount];

  MEMORY[0x1F4181798](self, sel_setStrongSelfReference_);
}

- (BOOL)_isPhoneCertificateVendorSupported
{
  return 1;
}

- (id)_debugDescriptionForErrorCode:(int64_t)a3
{
  if (a3 > -1101)
  {
    switch(a3)
    {
      case -1100:
        return @"Failed to fetch carrier token";
      case -900:
        return @"An unknown error occurred";
      case -1000:
        return @"Failed to fetch local phone authentication certificate";
    }
  }
  else
  {
    switch(a3)
    {
      case -4000:
        return @"The requested operation is not supported on this platform";
      case -3000:
        return @"Request timed out waiting for response from daemon";
      case -2000:
        return @"Failed to generate phone authentication signature";
    }
  }
  return @"Unknown phone certificate error";
}

- (id)_clientErrorForCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [(IDSPhoneCertificateVendor *)self _debugDescriptionForErrorCode:a3];
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSPhoneCertificateVendorErrorDomain" code:a3 userInfo:v7];

  return v9;
}

- (void)didAuthenticatePhoneWithAuthenticationCertificateData:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IDSPhoneCertificateVendor *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1919622F4;
  v15[3] = &unk_1E5729680;
  id v16 = v8;
  v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)didGeneratePhoneAuthenticationSignature:(id)a3 nonce:(id)a4 certificates:(id)a5 labelIDs:(id)a6 inputData:(id)a7 requestUUID:(id)a8 error:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = [(IDSPhoneCertificateVendor *)self queue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_191962658;
  v30[3] = &unk_1E572ADC0;
  id v31 = v17;
  v32 = self;
  id v33 = v21;
  id v34 = v15;
  id v35 = v16;
  id v36 = v18;
  id v37 = v19;
  id v38 = v20;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v16;
  id v27 = v15;
  id v28 = v21;
  id v29 = v17;
  dispatch_async(v22, v30);
}

- (void)didRequestCarrierTokenString:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IDSPhoneCertificateVendor *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191962A04;
  v15[3] = &unk_1E5729680;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (int64_t)_subscriptionSourceFromIntegerValue:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (int64_t)_subscriptionSourceForContext:(id)a3
{
  int64_t result = [a3 slotID];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (id)_scheduleTimeoutForPhoneAuthenticationSignatureRequestCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = [IDSDaemonResponseHandler alloc];
  id v6 = (void *)MEMORY[0x192FE03B0](v4);
  id v7 = [(IDSPhoneCertificateVendor *)self queue];
  id v8 = [(IDSDaemonResponseHandler *)v5 initWithBlock:v6 queue:v7];

  id v9 = [(IDSPhoneCertificateVendor *)self daemonRequestTimer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = sub_191962D48;
  id v16 = &unk_1E5729880;
  id v17 = self;
  id v18 = v4;
  id v10 = v4;
  v11 = [v9 scheduleTimeoutWithResponseHandler:v8 timeoutInterval:&v13 timeoutBlock:20.0];

  [(IDSPhoneCertificateVendor *)self _updateSelfRetentionBasedOnInFlightRequestCount];

  return v11;
}

- (id)_scheduleTimeoutForPhoneAuthenticationCertificateRequestCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = [IDSDaemonResponseHandler alloc];
  id v6 = (void *)MEMORY[0x192FE03B0](v4);
  id v7 = [(IDSPhoneCertificateVendor *)self queue];
  id v8 = [(IDSDaemonResponseHandler *)v5 initWithBlock:v6 queue:v7];

  id v9 = [(IDSPhoneCertificateVendor *)self daemonRequestTimer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = sub_191962F88;
  id v16 = &unk_1E5729880;
  id v17 = self;
  id v18 = v4;
  id v10 = v4;
  v11 = [v9 scheduleTimeoutWithResponseHandler:v8 timeoutInterval:&v13 timeoutBlock:360.0];

  [(IDSPhoneCertificateVendor *)self _updateSelfRetentionBasedOnInFlightRequestCount];

  return v11;
}

- (id)_scheduleTimeoutForCarrierTokenCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = [IDSDaemonResponseHandler alloc];
  id v6 = (void *)MEMORY[0x192FE03B0](v4);
  id v7 = [(IDSPhoneCertificateVendor *)self queue];
  id v8 = [(IDSDaemonResponseHandler *)v5 initWithBlock:v6 queue:v7];

  id v9 = [(IDSPhoneCertificateVendor *)self daemonRequestTimer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = sub_1919631C8;
  id v16 = &unk_1E5729880;
  id v17 = self;
  id v18 = v4;
  id v10 = v4;
  v11 = [v9 scheduleTimeoutWithResponseHandler:v8 timeoutInterval:&v13 timeoutBlock:360.0];

  [(IDSPhoneCertificateVendor *)self _updateSelfRetentionBasedOnInFlightRequestCount];

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSPhoneCertificateVendor)strongSelfReference
{
  return self->_strongSelfReference;
}

- (void)setStrongSelfReference:(id)a3
{
}

- (IDSDaemonRequestTimer)daemonRequestTimer
{
  return self->_daemonRequestTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonRequestTimer, 0);
  objc_storeStrong((id *)&self->_strongSelfReference, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestCarrierTokenWithMessageBody:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [[IDSCarrierTokenRequestParameters alloc] initWithSubscriptionSource:1 IMEI:@"TEST_IMEI" carrierNonce:@"TEST_NONCE"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191963414;
  v8[3] = &unk_1E572ADE8;
  id v9 = v5;
  id v7 = v5;
  [(IDSPhoneCertificateVendor *)self requestCarrierTokenWithParameters:v6 completion:v8];
}

- (void)setCurrentPhoneUserSubscriptionSource:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(IDSPhoneCertificateVendor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19196356C;
  block[3] = &unk_1E572A1E0;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)requestCurrentPhoneUserSubscriptionSourceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPhoneCertificateVendor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919637CC;
  v7[3] = &unk_1E5729230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)currentPhoneUserSubscriptionSourceWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DE188 != -1) {
    dispatch_once(&qword_1E92DE188, &unk_1EE246FC8);
  }
  id v5 = (void *)qword_1E92DE198;
  if (!qword_1E92DE198)
  {
    id v6 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_191A2EBC0(v6);
    }

    id v5 = (void *)qword_1E92DE198;
  }
  id v7 = [v5 sharedInstance];
  id v16 = 0;
  id v8 = [v7 selectedPhoneNumberRegistrationSubscriptionWithError:&v16];
  id v9 = v16;

  if (v8
    && (int64_t v10 = [(IDSPhoneCertificateVendor *)self _subscriptionSourceForContext:v8]) != 0)
  {
    int64_t v11 = v10;
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F6C3B8] sms];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      int64_t v18 = 0;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Unable to determine selected phone user subscription source synchronously {subscriptionSource: %ld, selectedContext: %@, subscriptionError: %@}", buf, 0x20u);
    }

    id v12 = [(IDSPhoneCertificateVendor *)self _clientErrorForCode:-900 underlyingError:v9];
    int64_t v11 = 0;
  }
  uint64_t v14 = [MEMORY[0x1E4F6C3B8] sms];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Returning current phone user subscription source synchronously {subscriptionSource: %ld, clientError: %@}", buf, 0x16u);
  }

  if (a3) {
    *a3 = v12;
  }

  return v11;
}

- (id)_scheduleTimeoutForPhoneSubscriptionSourceCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [IDSDaemonResponseHandler alloc];
  id v6 = (void *)MEMORY[0x192FE03B0](v4);
  id v7 = [(IDSPhoneCertificateVendor *)self queue];
  id v8 = [(IDSDaemonResponseHandler *)v5 initWithBlock:v6 queue:v7];

  id v9 = [(IDSPhoneCertificateVendor *)self daemonRequestTimer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = sub_191963CE0;
  id v16 = &unk_1E5729880;
  id v17 = self;
  id v18 = v4;
  id v10 = v4;
  int64_t v11 = [v9 scheduleTimeoutWithResponseHandler:v8 timeoutInterval:&v13 timeoutBlock:360.0];

  [(IDSPhoneCertificateVendor *)self _updateSelfRetentionBasedOnInFlightRequestCount];

  return v11;
}

- (void)didSetPhoneUserSubscriptionSource:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(IDSPhoneCertificateVendor *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191963EE8;
  v15[3] = &unk_1E5729680;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)didFetchPhoneUserSubscriptionSource:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(IDSPhoneCertificateVendor *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191964178;
  v15[3] = &unk_1E5729680;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

@end