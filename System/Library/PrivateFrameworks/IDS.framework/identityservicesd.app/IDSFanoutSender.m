@interface IDSFanoutSender
- (IDSAckStateMachine)ackStateMachine;
- (IDSFanoutSender)initWithGUID:(id)a3 service:(id)a4 messageDelivery:(id)a5 completionActivity:(id)a6 coalesceQueueManager:(id)a7;
- (void)finishedTrackingAPNSAcksWithURIs:(id)a3 guid:(id)a4;
- (void)finishedTrackingMadridAcksWithContext:(id)a3 uris:(id)a4 guid:(id)a5;
- (void)receivedAPNSAckForMessage:(id)a3 guid:(id)a4;
- (void)receivedErrorWithContext:(id)a3;
- (void)receivedRateLimitingResponseForTopic:(id)a3 ttr:(id)a4;
- (void)sendFanouts:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forURIs:(id)a6 messageQueue:(id)a7;
- (void)sendMMLs:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forService:(id)a6 sendMode:(id)a7 messageQueue:(id)a8;
@end

@implementation IDSFanoutSender

- (IDSFanoutSender)initWithGUID:(id)a3 service:(id)a4 messageDelivery:(id)a5 completionActivity:(id)a6 coalesceQueueManager:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IDSFanoutSender;
  v17 = [(IDSFanoutSender *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messageDelivery, a5);
    v19 = objc_alloc_init(IDSAckStateMachine);
    ackStateMachine = v18->_ackStateMachine;
    v18->_ackStateMachine = v19;

    objc_storeStrong((id *)&v18->_guid, a3);
    objc_storeStrong((id *)&v18->_service, a4);
    objc_storeStrong((id *)&v18->_completionActivity, a6);
    objc_storeStrong((id *)&v18->_coalesceQueueManager, a7);
  }

  return v18;
}

- (void)sendFanouts:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forURIs:(id)a6 messageQueue:(id)a7
{
  id v12 = a3;
  id v29 = a4;
  id v28 = a5;
  id v13 = a6;
  id v14 = a7;
  objc_storeStrong((id *)&self->_guidToDeliveryAcknowledgementBlock, a4);
  objc_storeStrong((id *)&self->_guidToSendCompletionBlock, a5);
  id v15 = objc_alloc_init(IDSAPNSAckTracker);
  id v16 = objc_alloc_init(IDSMadridAckTracker);
  [(IDSAPNSAckTracker *)v15 setDelegate:self];
  [(IDSMadridAckTracker *)v16 setDelegate:self];
  v26 = v15;
  [(IDSAPNSAckTracker *)v15 trackMessages:v12 forURIs:v13];
  v25 = v16;
  v27 = v13;
  [(IDSMadridAckTracker *)v16 trackMessages:v12 forURIs:v13 messageQueue:v14];
  [(IDSAckStateMachine *)self->_ackStateMachine setState:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        [(FTMessageDelivery *)self->_messageDelivery sendMessage:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        id v22 = [v14 count];
        objc_super v23 = +[IMMobileNetworkManager sharedInstance];
        v24 = v23;
        if (v22) {
          [v23 addFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
        else {
          [v23 removeFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }
}

- (void)sendMMLs:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forService:(id)a6 sendMode:(id)a7 messageQueue:(id)a8
{
  id v14 = a3;
  id v34 = a4;
  id v33 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  objc_storeStrong((id *)&self->_guidToDeliveryAcknowledgementBlock, a4);
  objc_storeStrong((id *)&self->_guidToSendCompletionBlock, a5);
  id v18 = objc_alloc_init(IDSAPNSAckTracker);
  id v19 = objc_alloc_init(IDSMadridAckTracker);
  [(IDSAPNSAckTracker *)v18 setDelegate:self];
  [(IDSMadridAckTracker *)v19 setDelegate:self];
  uint64_t v20 = [v14 allKeys];
  long long v31 = v16;
  long long v32 = v15;
  v21 = +[IDSMMLBuilder mmlsFromAggregates:v20 service:v15 sendMode:v16 guid:self->_guid];

  [(IDSAPNSAckTracker *)v18 trackMMLMessages:v21 forURIs:v14];
  long long v30 = v19;
  v35 = v14;
  [(IDSMadridAckTracker *)v19 trackMMLMessages:v21 forURIs:v14 messageQueue:v17];
  [(IDSAckStateMachine *)self->_ackStateMachine setState:1];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [(FTMessageDelivery *)self->_messageDelivery sendMessage:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        id v27 = [v17 count];
        id v28 = +[IMMobileNetworkManager sharedInstance];
        id v29 = v28;
        if (v27) {
          [v28 addFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
        else {
          [v28 removeFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v24);
  }
}

- (void)receivedAPNSAckForMessage:(id)a3 guid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received APNS Ack for GUID %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = [(NSDictionary *)self->_guidToDeliveryAcknowledgementBlock objectForKey:v7];

  if (v9)
  {
    v10 = [(NSDictionary *)self->_guidToDeliveryAcknowledgementBlock objectForKey:v7];
    ((void (**)(void, id))v10)[2](v10, v6);
  }
}

- (void)finishedTrackingAPNSAcksWithURIs:(id)a3 guid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ([(IDSAckStateMachine *)self->_ackStateMachine successful]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    v10 = [(IDSAckStateMachine *)self->_ackStateMachine error];
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 2112;
    CFStringRef v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished acks for GUID %@ success: %@ error: %@", (uint8_t *)&v17, 0x20u);
  }
  if ((id)[(IDSAckStateMachine *)self->_ackStateMachine state] != (id)3)
  {
    int v11 = [(NSDictionary *)self->_guidToSendCompletionBlock objectForKey:v7];

    if (v11)
    {
      uint64_t v12 = 2;
      [(IDSAckStateMachine *)self->_ackStateMachine setState:2];
      id v13 = objc_alloc((Class)IDSDeliveryContext);
      if ([(IDSAckStateMachine *)self->_ackStateMachine successful]) {
        uint64_t v12 = 0;
      }
      id v14 = [(IDSAckStateMachine *)self->_ackStateMachine error];
      id v15 = [v13 initWithResponseCode:v12 error:v14 lastCall:0];

      [v15 setDisplayURIs:v6];
      [v15 setLastCourierAck:1];
      id v16 = [(NSDictionary *)self->_guidToSendCompletionBlock objectForKey:v7];
      ((void (**)(void, id))v16)[2](v16, v15);
      [(IDSAckStateMachine *)self->_ackStateMachine setError:0];
    }
  }
}

- (void)receivedErrorWithContext:(id)a3
{
  id v9 = a3;
  [(IDSAckStateMachine *)self->_ackStateMachine setSuccessful:0];
  uint64_t v4 = [v9 responseError];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(IDSAckStateMachine *)self->_ackStateMachine error];

    if (!v6)
    {
      ackStateMachine = self->_ackStateMachine;
      v8 = [v9 responseError];
      [(IDSAckStateMachine *)ackStateMachine setError:v8];
    }
  }
}

- (void)finishedTrackingMadridAcksWithContext:(id)a3 uris:(id)a4 guid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter((os_activity_t)self->_completionActivity, &state);
  [(IDSAckStateMachine *)self->_ackStateMachine setState:3];
  int v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412546;
    id v26 = v10;
    __int16 v27 = 2112;
    CFStringRef v28 = (const __CFString *)service;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "OUTGOING-PUSH_FULLY_SENT:%@ SERVICE:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v22 = v10;
    id v23 = self->_service;
    _IDSLogV();
  }
  id v13 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(IDSAckStateMachine *)self->_ackStateMachine successful];
    uint64_t v15 = [(IDSAckStateMachine *)self->_ackStateMachine error];
    id v16 = (void *)v15;
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v26 = v10;
    __int16 v27 = 2112;
    if (v14) {
      CFStringRef v17 = @"YES";
    }
    CFStringRef v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finished sending GUID %@ success: %@ error: %@", buf, 0x20u);
  }
  id v18 = [(NSDictionary *)self->_guidToSendCompletionBlock objectForKey:v10];

  if (v18)
  {
    [v8 setDisplayURIs:v9];
    if ([(IDSAckStateMachine *)self->_ackStateMachine successful]) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 2;
    }
    [v8 setIdsResponseCode:v19];
    CFStringRef v20 = [(IDSAckStateMachine *)self->_ackStateMachine error];
    [v8 setResponseError:v20];

    [v8 setLastCall:1];
    __int16 v21 = [(NSDictionary *)self->_guidToSendCompletionBlock objectForKey:v10];
    ((void (**)(void, id))v21)[2](v21, v8);
    [(IDSAckStateMachine *)self->_ackStateMachine setError:0];
  }
  os_activity_scope_leave(&state);
}

- (void)receivedRateLimitingResponseForTopic:(id)a3 ttr:(id)a4
{
}

- (IDSAckStateMachine)ackStateMachine
{
  return self->_ackStateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackStateMachine, 0);
  objc_storeStrong((id *)&self->_guidToSendCompletionBlock, 0);
  objc_storeStrong((id *)&self->_guidToDeliveryAcknowledgementBlock, 0);
  objc_storeStrong((id *)&self->_coalesceQueueManager, 0);
  objc_storeStrong((id *)&self->_completionActivity, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_guid, 0);

  objc_storeStrong((id *)&self->_messageDelivery, 0);
}

@end