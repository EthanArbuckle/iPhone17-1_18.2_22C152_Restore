@interface HMDModernTransportMessageContext
+ (id)logCategory;
- (BOOL)didFallback;
- (BOOL)didNotifyDeviceReachability;
- (BOOL)didSucceedSending;
- (BOOL)didTimeout;
- (BOOL)expectsResponse;
- (HMDDateProvider)dateProvider;
- (HMDModernTransportMessageContext)initWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7;
- (HMDModernTransportMessageContext)initWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7 activityFactory:(id)a8 logEventSubmitter:(id)a9;
- (HMDModernTransportMessageContextOptions)options;
- (HMDNetworkActivityWrapper)messageNetworkActivity;
- (HMDNetworkActivityWrapperFactory)activityFactory;
- (HMDRemoteMessage)message;
- (HMDTimerProvider)timerProvider;
- (HMFMessageDestination)destination;
- (HMFTimer)fallbackTimer;
- (HMFTimer)responseTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSMapTable)inProgressTransportToStartTimeMap;
- (NSSet)inProgressTransports;
- (NSSet)remainingTransports;
- (NSString)messageName;
- (NSUUID)identifier;
- (NSUUID)messageID;
- (double)messageTimeout;
- (double)requestStartTime;
- (double)timeout;
- (double)timeoutRemaining;
- (id)_activityForTransport:(id)a1;
- (id)_attemptedTransports;
- (id)completionHandler;
- (id)fallbackCompletionBlock;
- (id)messageResponseHandler;
- (id)preparedMessageWithTimeout:(double)a3;
- (id)responseCompletionBlock;
- (int64_t)messageQualityOfService;
- (int64_t)messageType;
- (unint64_t)successfulResponseCount;
- (void)_completeTransportActivity:(void *)a3 txError:(void *)a4 rxError:;
- (void)completeSendingOverTransport:(id)a3 withError:(id)a4;
- (void)done;
- (void)receivedResponseOverTransport:(id)a3 withError:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDidFallback:(BOOL)a3;
- (void)setDidNotifyDeviceReachability:(BOOL)a3;
- (void)setDidTimeout:(BOOL)a3;
- (void)setFallbackCompletionBlock:(id)a3;
- (void)setFallbackTimer:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseCompletionBlock:(id)a3;
- (void)setResponseTimer:(id)a3;
- (void)startResponseTimerWithTimeInterval:(double)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)startSendingOverTransport:(id)a3;
- (void)startTransportFallbackTimerWithTimeInterval:(double)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDModernTransportMessageContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageResponseHandler, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_fallbackCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fallbackTimer, 0);
  objc_storeStrong(&self->_responseCompletionBlock, 0);
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_inProgressTransportToStartTimeMap, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_activityFactory, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageNetworkActivity, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_remainingTransports, 0);
}

- (int64_t)messageQualityOfService
{
  return self->_messageQualityOfService;
}

- (id)messageResponseHandler
{
  return self->_messageResponseHandler;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (double)messageTimeout
{
  return self->_messageTimeout;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (void)setMessage:(id)a3
{
}

- (HMDRemoteMessage)message
{
  return (HMDRemoteMessage *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFallbackCompletionBlock:(id)a3
{
}

- (id)fallbackCompletionBlock
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setFallbackTimer:(id)a3
{
}

- (HMFTimer)fallbackTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setResponseCompletionBlock:(id)a3
{
}

- (id)responseCompletionBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setResponseTimer:(id)a3
{
}

- (HMFTimer)responseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (NSMapTable)inProgressTransportToStartTimeMap
{
  return self->_inProgressTransportToStartTimeMap;
}

- (void)setDidFallback:(BOOL)a3
{
  self->_didFallback = a3;
}

- (BOOL)didFallback
{
  return self->_didFallback;
}

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 104, 1);
}

- (HMDNetworkActivityWrapperFactory)activityFactory
{
  return (HMDNetworkActivityWrapperFactory *)objc_getProperty(self, a2, 96, 1);
}

- (HMDTimerProvider)timerProvider
{
  return (HMDTimerProvider *)objc_getProperty(self, a2, 88, 1);
}

- (HMDDateProvider)dateProvider
{
  return (HMDDateProvider *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (HMDNetworkActivityWrapper)messageNetworkActivity
{
  return self->_messageNetworkActivity;
}

- (void)setDidNotifyDeviceReachability:(BOOL)a3
{
  self->_didNotifyDeviceReachability = a3;
}

- (BOOL)didNotifyDeviceReachability
{
  return self->_didNotifyDeviceReachability;
}

- (unint64_t)successfulResponseCount
{
  return self->_successfulResponseCount;
}

- (BOOL)didSucceedSending
{
  return self->_didSucceedSending;
}

- (NSSet)remainingTransports
{
  return &self->_remainingTransports->super;
}

- (HMDModernTransportMessageContextOptions)options
{
  return self->_options;
}

- (HMFMessageDestination)destination
{
  return self->_destination;
}

- (NSUUID)messageID
{
  return self->_messageID;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDModernTransportMessageContext *)self responseTimer];

  if (v5 == v4)
  {
    v9 = [(HMDModernTransportMessageContext *)self responseCompletionBlock];

    if (v9)
    {
      if (![(HMDModernTransportMessageContext *)self successfulResponseCount])
      {
        [(HMDModernTransportMessageContext *)self setDidTimeout:1];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v10 = -[HMDModernTransportMessageContext _attemptedTransports]((id *)&self->super.isa);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              v16 = objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", 8, (void)v19);
              v17 = -[HMDModernTransportMessageContext _activityForTransport:](self, v15);
              -[HMDModernTransportMessageContext _completeTransportActivity:txError:rxError:]((uint64_t)self, v17, 0, v16);
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v12);
        }
      }
      v18 = [(HMDModernTransportMessageContext *)self responseCompletionBlock];
      v18[2]();

      [(HMDModernTransportMessageContext *)self setResponseCompletionBlock:0];
    }
    [(HMDModernTransportMessageContext *)self setResponseTimer:0];
  }
  else
  {
    id v6 = [(HMDModernTransportMessageContext *)self fallbackTimer];

    if (v6 == v4)
    {
      v7 = [(HMDModernTransportMessageContext *)self fallbackCompletionBlock];

      if (v7)
      {
        [(HMDModernTransportMessageContext *)self setDidFallback:1];
        v8 = [(HMDModernTransportMessageContext *)self fallbackCompletionBlock];
        v8[2]();

        [(HMDModernTransportMessageContext *)self setFallbackCompletionBlock:0];
      }
      [(HMDModernTransportMessageContext *)self setFallbackTimer:0];
    }
  }
}

- (id)_attemptedTransports
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1[6] transports];
    v3 = (void *)[v2 mutableCopy];

    [v3 minusSet:v1[1]];
    v1 = (id *)[v3 copy];
  }
  return v1;
}

- (id)_activityForTransport:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    int v3 = [a2 transportType];
    uint64_t v4 = 3;
    if (v3 != 6) {
      uint64_t v4 = 0;
    }
    if (v3 == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = [v2 messageNetworkActivity];
    id v2 = [v6 childActivityWithLabel:v5 createIfNeeded:1];
  }
  return v2;
}

- (void)_completeTransportActivity:(void *)a3 txError:(void *)a4 rxError:
{
  v19[4] = *MEMORY[0x263EF8340];
  id v7 = a2;
  unint64_t v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)v9;
  if (a1)
  {
    if (v8)
    {
      uint64_t v11 = [(id)v8 code];
      uint64_t v12 = [(id)v8 domain];
      if (v10)
      {
LABEL_4:
        uint64_t v13 = [(id)v10 code];
        v14 = [(id)v10 domain];
LABEL_7:
        v18[0] = @"txErrorCode";
        v15 = [NSNumber numberWithInteger:v11];
        v19[0] = v15;
        v19[1] = v12;
        v18[1] = @"txErrorDomain";
        v18[2] = @"rxErrorCode";
        v16 = [NSNumber numberWithInteger:v13];
        v18[3] = @"rxErrorDomain";
        v19[2] = v16;
        v19[3] = v14;
        v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

        [v7 submitMetrics:v17 withName:@"transportNetworkActivityMetrics"];
        [v7 completeWithSuccess:(v8 | v10) == 0];

        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = @"None";
      if (v9) {
        goto LABEL_4;
      }
    }
    uint64_t v13 = 0;
    v14 = @"None";
    goto LABEL_7;
  }
LABEL_8:
}

- (void)done
{
  v25[7] = *MEMORY[0x263EF8340];
  int v3 = [(HMDModernTransportMessageContext *)self responseTimer];
  [v3 suspend];

  [(HMDModernTransportMessageContext *)self setResponseTimer:0];
  [(HMDModernTransportMessageContext *)self setResponseCompletionBlock:0];
  uint64_t v4 = [(HMDModernTransportMessageContext *)self fallbackTimer];
  [v4 suspend];

  [(HMDModernTransportMessageContext *)self setFallbackTimer:0];
  [(HMDModernTransportMessageContext *)self setFallbackCompletionBlock:0];
  if (self->_didSucceedSending)
  {
    if (![(HMDModernTransportMessageContext *)self expectsResponse])
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
    if ([(HMDModernTransportMessageContext *)self expectsResponse])
    {
      BOOL v5 = self->_successfulResponseCount != 0;
LABEL_7:
      BOOL v23 = v5;
      goto LABEL_8;
    }
  }
  BOOL v23 = 0;
LABEL_8:
  id v6 = [(HMDModernTransportMessageContext *)self dateProvider];
  [v6 timeIntervalSince1970];
  double v8 = v7;
  [(HMDModernTransportMessageContext *)self requestStartTime];
  double v10 = v8 - v9;

  v24[0] = @"remoteMessageName";
  uint64_t v11 = [(HMDModernTransportMessageContext *)self messageName];
  v25[0] = v11;
  v24[1] = @"messageType";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDModernTransportMessageContext messageType](self, "messageType"));
  v25[1] = v12;
  v24[2] = @"messageCompletionTime";
  uint64_t v13 = [NSNumber numberWithDouble:v10];
  v25[2] = v13;
  v24[3] = @"messageExpectsResponse";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDModernTransportMessageContext expectsResponse](self, "expectsResponse"));
  v25[3] = v14;
  v24[4] = @"messageTimedOut";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDModernTransportMessageContext didTimeout](self, "didTimeout"));
  v25[4] = v15;
  v24[5] = @"attemptedFallback";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDModernTransportMessageContext didFallback](self, "didFallback"));
  v25[5] = v16;
  v24[6] = @"numTransportsAttempted";
  v17 = NSNumber;
  v18 = -[HMDModernTransportMessageContext _attemptedTransports]((id *)&self->super.isa);
  long long v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  v25[6] = v19;
  long long v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  long long v21 = [(HMDModernTransportMessageContext *)self messageNetworkActivity];
  [v21 submitMetrics:v20 withName:@"modernTransportNetworkActivityMetrics"];

  long long v22 = [(HMDModernTransportMessageContext *)self messageNetworkActivity];
  [v22 completeWithSuccess:v23];
}

- (void)startTransportFallbackTimerWithTimeInterval:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  double v9 = [(HMDModernTransportMessageContext *)self fallbackTimer];

  if (!v9)
  {
    [(HMDModernTransportMessageContext *)self setFallbackCompletionBlock:v8];
    double v10 = [(HMDModernTransportMessageContext *)self timerProvider];
    uint64_t v11 = [v10 timerWithTimeInterval:0 options:a3];
    [(HMDModernTransportMessageContext *)self setFallbackTimer:v11];

    uint64_t v12 = [(HMDModernTransportMessageContext *)self fallbackTimer];
    [v12 setDelegate:self];

    uint64_t v13 = [(HMDModernTransportMessageContext *)self fallbackTimer];
    [v13 setDelegateQueue:v15];

    v14 = [(HMDModernTransportMessageContext *)self fallbackTimer];
    [v14 resume];
  }
}

- (void)startResponseTimerWithTimeInterval:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  double v9 = [(HMDModernTransportMessageContext *)self responseTimer];

  if (!v9)
  {
    [(HMDModernTransportMessageContext *)self setResponseCompletionBlock:v8];
    double v10 = [(HMDModernTransportMessageContext *)self timerProvider];
    uint64_t v11 = [v10 timerWithTimeInterval:0 options:a3];
    [(HMDModernTransportMessageContext *)self setResponseTimer:v11];

    uint64_t v12 = [(HMDModernTransportMessageContext *)self responseTimer];
    [v12 setDelegate:self];

    uint64_t v13 = [(HMDModernTransportMessageContext *)self responseTimer];
    [v13 setDelegateQueue:v15];

    v14 = [(HMDModernTransportMessageContext *)self responseTimer];
    [v14 resume];
  }
}

- (double)timeoutRemaining
{
  [(HMDModernTransportMessageContext *)self timeout];
  double v4 = v3;
  double result = 0.0;
  if (v4 >= 2.22044605e-16)
  {
    [(HMDModernTransportMessageContext *)self requestStartTime];
    if (v6 >= 2.22044605e-16)
    {
      double v7 = [(HMDModernTransportMessageContext *)self dateProvider];
      [v7 timeIntervalSince1970];
      double v9 = v8;
      [(HMDModernTransportMessageContext *)self requestStartTime];
      double v11 = v9 - v10;

      [(HMDModernTransportMessageContext *)self timeout];
      return v12 - v11;
    }
    else
    {
      [(HMDModernTransportMessageContext *)self timeout];
    }
  }
  return result;
}

- (id)preparedMessageWithTimeout:(double)a3
{
  BOOL v5 = [(HMDModernTransportMessageContext *)self message];
  double v6 = [(HMDModernTransportMessageContext *)self options];
  double v7 = [v5 headers];
  double v8 = (void *)[v7 mutableCopy];
  double v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  double v11 = v10;

  double v12 = NSNumber;
  [(HMDModernTransportMessageContext *)self requestStartTime];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  v14 = [v6 requestStartTimeHeaderKey];
  [v11 setObject:v13 forKeyedSubscript:v14];

  [v6 timeToLive];
  if (v15 >= 2.22044605e-16)
  {
    v16 = objc_msgSend(NSNumber, "numberWithDouble:");
    v17 = [v6 timeToLiveHeaderKey];
    [v11 setObject:v16 forKeyedSubscript:v17];
  }
  v31 = v6;
  v18 = [HMDRemoteMessage alloc];
  long long v19 = [v5 name];
  uint64_t v20 = [v5 qualityOfService];
  long long v21 = [v5 destination];
  long long v22 = [v5 messagePayload];
  uint64_t v23 = [v5 type];
  LOBYTE(v30) = [v5 isSecure];
  uint64_t v24 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v18, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v19, v20, v21, v22, v11, v23, a3, v30, [v5 restriction], objc_msgSend(v5, "sendOptions"));

  v25 = [v5 identifier];
  [(HMDRemoteMessage *)v24 setIdentifier:v25];

  v26 = [v5 userInfo];
  v27 = [(HMDRemoteMessage *)v24 internal];
  [v27 setUserInfo:v26];

  [(HMDRemoteMessage *)v24 setResponseHandler:0];
  v28 = [v5 transactionIdentifier];
  [(HMDRemoteMessage *)v24 setTransactionIdentifier:v28];

  if (![(HMDRemoteMessage *)v24 type]) {
    [(HMDRemoteMessage *)v24 setResponseRestriction:[(HMDRemoteMessage *)v24 restriction]];
  }

  return v24;
}

- (void)receivedResponseOverTransport:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = [(HMDModernTransportMessageContextOptions *)self->_options expectsMultipleResponses];
  if (!v6 || !v7)
  {
    double v8 = -[HMDModernTransportMessageContext _activityForTransport:](self, v9);
    if (([v8 isActivated] & 1) == 0) {
      [v8 activate];
    }
    -[HMDModernTransportMessageContext _completeTransportActivity:txError:rxError:]((uint64_t)self, v8, 0, v6);

    if (!v6) {
      ++self->_successfulResponseCount;
    }
  }
}

- (void)completeSendingOverTransport:(id)a3 withError:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HMDModernTransportMessageContext *)self options];
  id v9 = [v8 transports];
  char v10 = [v9 containsObject:v6];

  if ((v10 & 1) == 0)
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      v38 = HMFGetLogIdentifier();
      int v47 = 138543362;
      v48 = v38;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Invalid transport", (uint8_t *)&v47, 0xCu);
    }
    v39 = [[HMDAssertionLogEvent alloc] initWithReason:@"Invalid transport"];
    v40 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v40 submitLogEvent:v39];
  }
  double v11 = [(HMDModernTransportMessageContext *)self inProgressTransports];
  char v12 = [v11 containsObject:v6];

  if ((v12 & 1) == 0)
  {
    v41 = (void *)MEMORY[0x230FBD990]();
    v42 = self;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      v44 = HMFGetLogIdentifier();
      int v47 = 138543362;
      v48 = v44;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Transport has not started", (uint8_t *)&v47, 0xCu);
    }
    v45 = [[HMDAssertionLogEvent alloc] initWithReason:@"Transport has not started"];
    v46 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v46 submitLogEvent:v45];
  }
  uint64_t v13 = [(HMDModernTransportMessageContext *)self dateProvider];
  [v13 timeIntervalSince1970];
  double v15 = v14;
  v16 = [(NSMapTable *)self->_inProgressTransportToStartTimeMap objectForKey:v6];
  [v16 doubleValue];
  double v18 = v17;

  uint64_t v19 = [v6 transportType];
  [(NSMapTable *)self->_inProgressTransportToStartTimeMap removeObjectForKey:v6];
  if (v7)
  {
    uint64_t v20 = -[HMDModernTransportMessageContext _activityForTransport:](self, v6);
    long long v21 = self;
    long long v22 = v20;
    uint64_t v23 = v7;
LABEL_7:
    -[HMDModernTransportMessageContext _completeTransportActivity:txError:rxError:]((uint64_t)v21, v22, v23, 0);

    goto LABEL_8;
  }
  self->_didSucceedSending = 1;
  if (![(HMDModernTransportMessageContext *)self expectsResponse])
  {
    uint64_t v20 = -[HMDModernTransportMessageContext _activityForTransport:](self, v6);
    long long v21 = self;
    long long v22 = v20;
    uint64_t v23 = 0;
    goto LABEL_7;
  }
LABEL_8:
  if (v19 != 6
    || ([(HMDModernTransportMessageContext *)self options],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = [v24 expectRapportSuccess],
        v24,
        v25))
  {
    v26 = [(HMDModernTransportMessageContext *)self logEventSubmitter];
    v27 = +[HMDRemoteMessageTxReportLogEvent txReportForTransport:v19 latency:v15 - v18];
    [v26 submitLogEvent:v27 error:v7];
  }
  v28 = [(HMDModernTransportMessageContext *)self completionHandler];

  if (v28
    && (!v7
     || ![(NSMutableSet *)self->_remainingTransports count]
     && ![(NSMapTable *)self->_inProgressTransportToStartTimeMap count]))
  {
    v29 = [(HMDModernTransportMessageContext *)self completionHandler];
    ((void (**)(void, id))v29)[2](v29, v7);

    [(HMDModernTransportMessageContext *)self setCompletionHandler:0];
  }
  if (![(NSMutableSet *)self->_remainingTransports count]
    && ![(NSMapTable *)self->_inProgressTransportToStartTimeMap count]
    || self->_didSucceedSending)
  {
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      v34 = [(HMDModernTransportMessageContext *)v31 messageID];
      int v47 = 138543618;
      v48 = v33;
      __int16 v49 = 2114;
      v50 = v34;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ no longer needed, clearing message.", (uint8_t *)&v47, 0x16u);
    }
    [(HMDModernTransportMessageContext *)v31 setMessage:0];
  }
}

- (void)startSendingOverTransport:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDModernTransportMessageContext *)self options];
  id v6 = [v5 transports];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    double v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      long long v21 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Invalid transport", (uint8_t *)&v30, 0xCu);
    }
    long long v22 = [[HMDAssertionLogEvent alloc] initWithReason:@"Invalid transport"];
    uint64_t v23 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v23 submitLogEvent:v22];
  }
  if (([(NSMutableSet *)self->_remainingTransports containsObject:v4] & 1) == 0)
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    int v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      v27 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Transport already started", (uint8_t *)&v30, 0xCu);
    }
    v28 = [[HMDAssertionLogEvent alloc] initWithReason:@"Transport already started"];
    v29 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v29 submitLogEvent:v28];
  }
  double v8 = [(HMDModernTransportMessageContext *)self dateProvider];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  double v11 = [(HMDModernTransportMessageContext *)self messageNetworkActivity];
  char v12 = [v11 isActivated];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [(HMDModernTransportMessageContext *)self messageNetworkActivity];
    [v13 activate];
  }
  [(HMDModernTransportMessageContext *)self requestStartTime];
  if (v14 < 2.22044605e-16) {
    [(HMDModernTransportMessageContext *)self setRequestStartTime:v10];
  }
  double v15 = -[HMDModernTransportMessageContext _activityForTransport:](self, v4);
  if (([v15 isActivated] & 1) == 0) {
    [v15 activate];
  }
  [(NSMutableSet *)self->_remainingTransports removeObject:v4];
  inProgressTransportToStartTimeMap = self->_inProgressTransportToStartTimeMap;
  double v17 = [NSNumber numberWithDouble:v10];
  [(NSMapTable *)inProgressTransportToStartTimeMap setObject:v17 forKey:v4];
}

- (NSSet)inProgressTransports
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  double v3 = [(HMDModernTransportMessageContext *)self inProgressTransportToStartTimeMap];
  id v4 = [v3 keyEnumerator];
  BOOL v5 = [v4 allObjects];
  id v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

- (BOOL)expectsResponse
{
  id v2 = [(HMDModernTransportMessageContext *)self messageResponseHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)timeout
{
  BOOL v3 = [(HMDModernTransportMessageContext *)self options];
  [v3 timeoutOverride];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    [(HMDModernTransportMessageContext *)self messageTimeout];
  }
  else
  {
    id v6 = [(HMDModernTransportMessageContext *)self options];
    [v6 timeoutOverride];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (HMDModernTransportMessageContext)initWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  double v17 = +[HMDNetworkActivityWrapperFactory sharedInstance];
  double v18 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v19 = [(HMDModernTransportMessageContext *)self initWithMessage:v16 options:v15 completionHandler:v14 dateProvider:v13 timerProvider:v12 activityFactory:v17 logEventSubmitter:v18];

  return v19;
}

- (HMDModernTransportMessageContext)initWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7 activityFactory:(id)a8 logEventSubmitter:(id)a9
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v56 = a6;
  id v55 = a7;
  id v54 = a8;
  id v53 = a9;
  v57.receiver = self;
  v57.super_class = (Class)HMDModernTransportMessageContext;
  uint64_t v19 = [(HMDModernTransportMessageContext *)&v57 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_message, a3);
    uint64_t v21 = [v16 name];
    messageName = v20->_messageName;
    v20->_messageName = (NSString *)v21;

    v20->_messageType = [v16 type];
    uint64_t v23 = [v16 identifier];
    messageID = v20->_messageID;
    v20->_messageID = (NSUUID *)v23;

    uint64_t v25 = [v16 responseHandler];
    id messageResponseHandler = v20->_messageResponseHandler;
    v20->_id messageResponseHandler = (id)v25;

    [v16 timeout];
    v20->_messageTimeout = v27;
    uint64_t v28 = [v16 identifier];
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v28;

    if (![v16 type])
    {
      id v52 = v17;
      int v30 = [v16 transactionIdentifier];
      if (v30)
      {
        v31 = v30;
        uint64_t v32 = v30;
        v33 = (HMDAssertionLogEvent *)v20->_identifier;
        v20->_identifier = v32;
      }
      else
      {
        context = (void *)MEMORY[0x230FBD990]();
        v46 = v20;
        int v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v48 = v50 = v46;
          *(_DWORD *)buf = 138543362;
          v59 = v48;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Transaction ID should not be nil for a request message", buf, 0xCu);

          v46 = v50;
        }

        v33 = [[HMDAssertionLogEvent alloc] initWithReason:@"Transaction ID should not be nil for a request message"];
        __int16 v49 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v49 submitLogEvent:v33];

        v31 = 0;
      }

      id v17 = v52;
    }
    uint64_t v34 = objc_msgSend(v16, "destination", v50);
    destination = v20->_destination;
    v20->_destination = (HMFMessageDestination *)v34;

    v20->_messageQualityOfService = [v16 qualityOfService];
    objc_storeStrong((id *)&v20->_options, a4);
    uint64_t v36 = [v18 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = (id)v36;

    objc_storeStrong((id *)&v20->_dateProvider, a6);
    objc_storeStrong((id *)&v20->_timerProvider, a7);
    v38 = [v17 transports];
    uint64_t v39 = [v38 mutableCopy];
    remainingTransports = v20->_remainingTransports;
    v20->_remainingTransports = (NSMutableSet *)v39;

    uint64_t v41 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    inProgressTransportToStartTimeMap = v20->_inProgressTransportToStartTimeMap;
    v20->_inProgressTransportToStartTimeMap = (NSMapTable *)v41;

    objc_storeStrong((id *)&v20->_activityFactory, a8);
    objc_storeStrong((id *)&v20->_logEventSubmitter, a9);
    uint64_t v43 = [(HMDNetworkActivityWrapperFactory *)v20->_activityFactory networkActivityWrapperWithLabel:1];
    messageNetworkActivity = v20->_messageNetworkActivity;
    v20->_messageNetworkActivity = (HMDNetworkActivityWrapper *)v43;
  }
  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_272387 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_272387, &__block_literal_global_272388);
  }
  id v2 = (void *)logCategory__hmf_once_v7_272389;
  return v2;
}

void __47__HMDModernTransportMessageContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_272389;
  logCategory__hmf_once_v7_272389 = v0;
}

@end