@interface IDSStewieRequester
- (FTMessageDelivery_DualMode)messageDelivery;
- (IDSPhoneUserRegistry)phoneUserRegistry;
- (IDSServerBag)bag;
- (IDSStewieCTClient)ctClient;
- (IDSStewieProvisionMessage)enqueuedMessage;
- (IDSStewieProvisionMessage)inProgressMessage;
- (IDSStewieRequester)initWithDelegate:(id)a3 queue:(id)a4 ctClient:(id)a5 store:(id)a6 userStore:(id)a7 bag:(id)a8;
- (IDSStewieRequesterDelegate)delegate;
- (IDSStewieStore)store;
- (IDSValidationQueue)validationQueue;
- (IMDispatchTimer)debounceTimer;
- (double)debounceTime;
- (double)maxRetryTime;
- (int)currentInfoEditCount;
- (os_unfair_lock_s)lock;
- (void)addClearRequest:(id)a3;
- (void)addCompletionBlockToMessage:(id)a3;
- (void)addDeviceAndPhoneFieldsToMessage:(id)a3;
- (void)addDeviceInfoRequest:(id)a3;
- (void)addHeartbeat;
- (void)addPhoneNumberSigsToMessage:(id)a3;
- (void)addPhoneNumbersRequest:(id)a3;
- (void)addSMSConfig:(id)a3;
- (void)addSessionKeyRequest:(id)a3;
- (void)addSignaturesAndSendMessage:(id)a3;
- (void)debounceTimerFired;
- (void)removeAndReportFailuresFromMessage:(id)a3 differingFromResponseCode:(int64_t)a4;
- (void)setBag:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setCurrentInfoEditCount:(int)a3;
- (void)setDebounceTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnqueuedMessage:(id)a3;
- (void)setInProgressMessage:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setPhoneUserRegistry:(id)a3;
- (void)setStore:(id)a3;
- (void)setValidationQueue:(id)a3;
@end

@implementation IDSStewieRequester

- (IDSStewieRequester)initWithDelegate:(id)a3 queue:(id)a4 ctClient:(id)a5 store:(id)a6 userStore:(id)a7 bag:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)IDSStewieRequester;
  v20 = [(IDSStewieRequester *)&v35 init];
  v21 = v20;
  if (v20)
  {
    v20->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_ctClient, a5);
    objc_storeWeak((id *)&v21->_delegate, v14);
    enqueuedMessage = v21->_enqueuedMessage;
    v21->_enqueuedMessage = 0;

    inProgressMessage = v21->_inProgressMessage;
    v21->_inProgressMessage = 0;

    v24 = +[IDSRegistrationCenter sharedInstance];
    uint64_t v25 = [v24 validationQueue];
    validationQueue = v21->_validationQueue;
    v21->_validationQueue = (IDSValidationQueue *)v25;

    objc_storeStrong((id *)&v21->_store, a6);
    v27 = [[IDSPhoneUserRegistry alloc] initWithQueue:v15 userStore:v18];
    phoneUserRegistry = v21->_phoneUserRegistry;
    v21->_phoneUserRegistry = v27;

    v29 = (FTMessageDelivery_DualMode *)[objc_alloc((Class)FTMessageDelivery_DualMode) initWithPreferedType:2];
    messageDelivery = v21->_messageDelivery;
    v21->_messageDelivery = v29;

    v31 = v21->_messageDelivery;
    v32 = +[IDSRegistrationRequestTracker sharedInstance];
    [(FTMessageDelivery_DualMode *)v31 addRequestObserver:v32];

    objc_storeStrong((id *)&v21->_bag, a8);
    v21->_currentInfoEditCount = 0;
    debounceTimer = v21->_debounceTimer;
    v21->_debounceTimer = 0;
  }
  return v21;
}

- (void)addHeartbeat
{
}

- (void)addDeviceInfoRequest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EB2A0;
  v5[3] = &unk_100985B98;
  id v6 = a3;
  id v4 = v6;
  sub_1001EAFA8((os_unfair_lock_s *)self, v5);
}

- (void)addSMSConfig:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EB410;
  v5[3] = &unk_100985B98;
  id v6 = a3;
  id v4 = v6;
  sub_1001EAFA8((os_unfair_lock_s *)self, v5);
}

- (void)addPhoneNumbersRequest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EB580;
  v5[3] = &unk_100985B98;
  id v6 = a3;
  id v4 = v6;
  sub_1001EAFA8((os_unfair_lock_s *)self, v5);
}

- (void)addSessionKeyRequest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EB6F0;
  v5[3] = &unk_100985B98;
  id v6 = a3;
  id v4 = v6;
  sub_1001EAFA8((os_unfair_lock_s *)self, v5);
}

- (void)addClearRequest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EB860;
  v5[3] = &unk_100985B98;
  id v6 = a3;
  id v4 = v6;
  sub_1001EAFA8((os_unfair_lock_s *)self, v5);
}

- (double)debounceTime
{
  v2 = [(IDSStewieRequester *)self bag];
  v3 = [v2 objectForKey:@"sps-prov-debounce-time"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = (double)(uint64_t)[v3 integerValue];
  }
  else {
    double v4 = 120.0;
  }
  if (+[IMUserDefaults stewieDebounceWindow] >= 1) {
    double v4 = (double)+[IMUserDefaults stewieDebounceWindow];
  }

  return v4;
}

- (double)maxRetryTime
{
  v2 = [(IDSStewieRequester *)self bag];
  v3 = [v2 objectForKey:@"sps-prov-max-retry-time"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = (double)(uint64_t)[v3 integerValue];
  }
  else {
    double v4 = 1800.0;
  }

  return v4;
}

- (void)addDeviceAndPhoneFieldsToMessage:(id)a3
{
  id v11 = a3;
  if ([v11 needsDeviceInfo])
  {
    double v4 = [(IDSStewieRequester *)self store];
    v5 = [v4 persistedDeviceInfo];

    if (v5) {
      [v11 addDeviceInfo:v5];
    }
  }
  if ([v11 wantsPhoneInfo])
  {
    id v6 = [(IDSStewieRequester *)self store];
    v7 = [v6 persistedPhoneNumberInfos];

    if (v7) {
      [v11 addPhoneNumberInfos:v7];
    }
  }
  v8 = [(IDSStewieRequester *)self store];
  [v8 rollAndPersistStewieLoggingGUIDIfNeeded];

  v9 = [(IDSStewieRequester *)self store];
  v10 = [v9 persistedStewieLoggingGUID];
  [v11 addLoggingGUID:v10];
}

- (void)addPhoneNumberSigsToMessage:(id)a3
{
  id v8 = a3;
  if ([v8 needsPhoneSigs])
  {
    double v4 = [(IDSStewieRequester *)self phoneUserRegistry];
    id v5 = [v4 phoneAuthenticationCertificatePublicKey];

    id v6 = [(IDSStewieRequester *)self phoneUserRegistry];
    id v7 = [v6 phoneAuthenticationCertificatePrivateKey];

    [v8 addPhoneSigsForPublicKey:v5 privateKey:v7];
  }
}

- (void)debounceTimerFired
{
  v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Debounce timer fired", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  sub_1001EC000((uint64_t)self);
  id v6 = 0;
  int v4 = sub_1001EC234((os_unfair_lock_s *)self, &v6);
  id v5 = v6;
  os_unfair_lock_unlock(&self->_lock);
  if (v4) {
    [(IDSStewieRequester *)self addSignaturesAndSendMessage:v5];
  }
}

- (void)addSignaturesAndSendMessage:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001EC580;
  v6[3] = &unk_100981968;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  sub_1001EBBF8(self, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)addCompletionBlockToMessage:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001ECB64;
  v5[3] = &unk_100985CB8;
  objc_copyWeak(&v6, &location);
  void v5[4] = self;
  [v4 setCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)removeAndReportFailuresFromMessage:(id)a3 differingFromResponseCode:(int64_t)a4
{
  id v15 = a3;
  id v6 = [v15 failuresOfType:1 withDifferingResponseCode:a4];
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    id v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_100985D18);
    id v8 = [(IDSStewieRequester *)self inProgressMessage];
    [v8 removePhoneNumberInfos:v7];

    os_unfair_lock_unlock(&self->_lock);
    v9 = [(IDSStewieRequester *)self delegate];
    [v9 requester:self receivedFailuresForPhoneNumberInfos:v6];
  }
  v10 = [v15 failuresOfType:2 withDifferingResponseCode:a4];
  id v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "__imArrayByApplyingBlock:", &stru_100985D38);
    v13 = [(IDSStewieRequester *)self inProgressMessage];
    [v13 removeSessionKeyInfos:v12];

    id v14 = [(IDSStewieRequester *)self delegate];
    [v14 requester:self receivedFailuresForSessionKeyInfos:v11];
  }
}

- (IDSStewieRequesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSStewieRequesterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (IDSStewieCTClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (IDSStewieProvisionMessage)enqueuedMessage
{
  return self->_enqueuedMessage;
}

- (void)setEnqueuedMessage:(id)a3
{
}

- (IDSStewieProvisionMessage)inProgressMessage
{
  return self->_inProgressMessage;
}

- (void)setInProgressMessage:(id)a3
{
}

- (FTMessageDelivery_DualMode)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSValidationQueue)validationQueue
{
  return self->_validationQueue;
}

- (void)setValidationQueue:(id)a3
{
}

- (IDSStewieStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (IDSPhoneUserRegistry)phoneUserRegistry
{
  return self->_phoneUserRegistry;
}

- (void)setPhoneUserRegistry:(id)a3
{
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (int)currentInfoEditCount
{
  return self->_currentInfoEditCount;
}

- (void)setCurrentInfoEditCount:(int)a3
{
  self->_currentInfoEditCount = a3;
}

- (IMDispatchTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_phoneUserRegistry, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_validationQueue, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_inProgressMessage, 0);
  objc_storeStrong((id *)&self->_enqueuedMessage, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end