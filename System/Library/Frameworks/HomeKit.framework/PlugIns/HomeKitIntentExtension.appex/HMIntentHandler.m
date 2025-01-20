@interface HMIntentHandler
+ (id)logCategory;
- (HMFTimer)intentTimer;
- (INControlHomeIntent)intent;
- (OS_dispatch_queue)clientQueue;
- (id)handlerForIntent:(id)a3;
- (id)responseHandler;
- (void)_handleRequestForIntent:(id)a3 payload:(id)a4 completion:(id)a5;
- (void)_reportToResponseHandlerWithOutcome:(id)a3;
- (void)_resetIntentTimer;
- (void)_startIntentTimer;
- (void)_startIntentTimerWithTimeInterval:(double)a3;
- (void)confirmControlHome:(id)a3 completion:(id)a4;
- (void)handleControlHome:(id)a3 completion:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setIntent:(id)a3;
- (void)setIntentTimer:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIntentHandler

+ (id)logCategory
{
  if (qword_100008928 != -1) {
    dispatch_once(&qword_100008928, &stru_100004298);
  }
  v2 = (void *)qword_100008930;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_intentTimer, 0);
}

- (void)setIntent:(id)a3
{
}

- (INControlHomeIntent)intent
{
  return self->_intent;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setIntentTimer:(id)a3
{
}

- (HMFTimer)intentTimer
{
  return self->_intentTimer;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMIntentHandler *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001B98;
  v7[3] = &unk_100004258;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_resetIntentTimer
{
  v3 = [(HMIntentHandler *)self intentTimer];
  [v3 suspend];

  [(HMIntentHandler *)self setIntentTimer:0];
}

- (void)_startIntentTimerWithTimeInterval:(double)a3
{
  id v4 = [objc_alloc((Class)HMFTimer) initWithTimeInterval:1 options:a3];
  [(HMIntentHandler *)self setIntentTimer:v4];

  v5 = [(HMIntentHandler *)self intentTimer];
  [v5 setDelegate:self];

  id v6 = [(HMIntentHandler *)self intentTimer];
  [v6 resume];
}

- (void)_startIntentTimer
{
}

- (void)_reportToResponseHandlerWithOutcome:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:HMIntentOutcomeSuccess])
  {
    id v5 = objc_alloc((Class)INControlHomeIntentResponse);
    uint64_t v6 = 3;
LABEL_15:
    id v11 = [v5 initWithCode:v6 userActivity:0];
LABEL_16:
    v18 = [(HMIntentHandler *)self responseHandler];

    if (v18)
    {
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [(HMIntentHandler *)v20 intent];
        int v26 = 138543874;
        v27 = v22;
        __int16 v28 = 2112;
        v29 = v23;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}@Invoking completion for intent %@ with response %@", (uint8_t *)&v26, 0x20u);
      }
      v24 = [(HMIntentHandler *)v20 responseHandler];
      ((void (**)(void, id))v24)[2](v24, v11);
    }
    [(HMIntentHandler *)self setIntent:0];
    [(HMIntentHandler *)self setResponseHandler:0];

    goto LABEL_21;
  }
  if ([v4 isEqualToString:HMIntentOutcomeInProgress])
  {
    id v5 = objc_alloc((Class)INControlHomeIntentResponse);
    uint64_t v6 = 2;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:HMIntentOutcomeFailure])
  {
    id v5 = objc_alloc((Class)INControlHomeIntentResponse);
    uint64_t v6 = 5;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:HMIntentOutcomeUnsecuringUnlockRequired])
  {
    id v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@This intent contains unsecuring actions and needs user's authentication", (uint8_t *)&v26, 0xCu);
    }
    id v11 = [objc_alloc((Class)INControlHomeIntentResponse) initWithCode:1 userActivity:0];
    [v11 _setRequiresAuthentication:1];
    goto LABEL_16;
  }
  unsigned int v12 = [v4 isEqualToString:HMIntentOutcomeUnsecuringNotAllowed];
  v14 = self;
  v15 = HMFGetOSLogHandle();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@This intent contains unsecuring actions but the device does not enable the passcode", (uint8_t *)&v26, 0xCu);
    }
    id v5 = objc_alloc((Class)INControlHomeIntentResponse);
    uint64_t v6 = 12;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v25 = HMFGetLogIdentifier();
    int v26 = 138543362;
    v27 = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Passed-in outcome is invalid", (uint8_t *)&v26, 0xCu);
  }
LABEL_21:
}

- (void)_handleRequestForIntent:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id))a5;
  id v11 = [(HMIntentHandler *)self responseHandler];

  if (v11)
  {
    id v12 = [objc_alloc((Class)INControlHomeIntentResponse) initWithCode:5 userActivity:0];
    v10[2](v10, v12);
  }
  else
  {
    v13 = +[HMFProductInfo productInfo];
    id v14 = [v13 productClass];

    if (v14 == (id)6)
    {
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@HomePod is not eligible for intent handling", buf, 0xCu);
      }
      [(HMIntentHandler *)v16 _reportToResponseHandlerWithOutcome:HMIntentOutcomeFailure];
    }
    else
    {
      [(HMIntentHandler *)self setIntent:v8];
      [(HMIntentHandler *)self setResponseHandler:v10];
      [(HMIntentHandler *)self _startIntentTimer];
      objc_initWeak((id *)buf, self);
      v19 = +[HMClientConnection sharedInstance];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000023A8;
      v20[3] = &unk_100004230;
      objc_copyWeak(&v24, (id *)buf);
      v23 = v10;
      id v21 = v9;
      id v22 = v8;
      [v19 sendIntentRequestCommand:v22 withPayload:v21 completionHandler:v20];

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)handleControlHome:(id)a3 completion:(id)a4
{
  v10[0] = kSiriIntentKey;
  id v6 = a4;
  id v7 = a3;
  id v8 = encodeRootObject();
  v10[1] = kSiriIntentRequestTypeKey;
  v11[0] = v8;
  v11[1] = &off_100004340;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(HMIntentHandler *)self _handleRequestForIntent:v7 payload:v9 completion:v6];
}

- (void)confirmControlHome:(id)a3 completion:(id)a4
{
  v10[0] = kSiriIntentKey;
  id v6 = a4;
  id v7 = a3;
  id v8 = encodeRootObject();
  v10[1] = kSiriIntentRequestTypeKey;
  v11[0] = v8;
  v11[1] = &off_100004328;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(HMIntentHandler *)self _handleRequestForIntent:v7 payload:v9 completion:v6];
}

- (id)handlerForIntent:(id)a3
{
  id v4 = [(HMIntentHandler *)self clientQueue];

  if (!v4)
  {
    HMDispatchQueueNameString();
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v5 UTF8String], 0);
    clientQueue = self->_clientQueue;
    self->_clientQueue = v6;

    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;

    intent = self->_intent;
    self->_intent = 0;
  }
  return self;
}

@end