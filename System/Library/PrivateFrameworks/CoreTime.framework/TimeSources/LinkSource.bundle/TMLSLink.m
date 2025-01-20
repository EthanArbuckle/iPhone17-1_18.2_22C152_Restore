@interface TMLSLink
- (BOOL)isCompatible;
- (BOOL)isGizmo;
- (NSArray)registeredDevices;
- (OS_dispatch_workloop)workloop;
- (TMLSLink)initWithDelegate:(id)a3 clock:(id)a4 workloop:(id)a5;
- (TMLSLinkDelegate)delegate;
- (TMLSTransport)transport;
- (TMMonotonicClock)clock;
- (int)syncState;
- (void)convertBTTime:(id)a3;
- (void)convertBTTimeFinal:(id)a3;
- (void)createSyncTimer;
- (void)dataReceived:(id)a3;
- (void)didSendDataIdentifier:(id)a3 withError:(id)a4;
- (void)didUpdateDeviceRegistryCompatibilityState:(id)a3;
- (void)doBTConversionFailure;
- (void)doSyncRTC;
- (void)handleDeliveryOfIdentifier:(id)a3 withData:(id)a4 withError:(id)a5;
- (void)handleSyncTimer;
- (void)restartSync;
- (void)sendAutomaticTimeEnabled:(BOOL)a3;
- (void)sendBTConversionFailure;
- (void)sendData:(id)a3 localOnly:(BOOL)a4 nonWaking:(BOOL)a5;
- (void)sendData:(id)a3 localOnly:(BOOL)a4 nonWaking:(BOOL)a5 includeTinker:(BOOL)a6;
- (void)sendDrift:(double)a3;
- (void)sendReset;
- (void)sendSyncRequest;
- (void)sendTime:(double)a3 localRTC:(double)a4 uncertainty:(double)a5 source:(id)a6 reliable:(BOOL)a7;
- (void)sendTimeZone:(id)a3 forSource:(id)a4;
- (void)setClock:(id)a3;
- (void)setCompatible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGizmo:(BOOL)a3;
- (void)setRegisteredDevices:(id)a3;
- (void)setSyncState:(int)a3;
- (void)setTransport:(id)a3;
- (void)setWorkloop:(id)a3;
- (void)syncRTC;
- (void)updateCompatibilityState;
@end

@implementation TMLSLink

- (TMLSLink)initWithDelegate:(id)a3 clock:(id)a4 workloop:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TMLSLink;
  v12 = [(TMLSLink *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clock, a4);
    objc_storeStrong((id *)&v13->_delegate, a3);
    objc_storeStrong((id *)&v13->_workloop, a5);
    v14 = [[TMLSTransport alloc] initWithDelegate:v13 clock:v10 workloop:v11];
    transport = v13->_transport;
    v13->_transport = v14;

    id v16 = +[NRPairedDeviceRegistry sharedInstance];
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v13 selector:"didUpdateDeviceRegistryCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

    [(TMLSLink *)v13 createSyncTimer];
    uint64_t v18 = objc_opt_new();
    dataPendingSend = v13->_dataPendingSend;
    v13->_dataPendingSend = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    dataPendingRetry = v13->_dataPendingRetry;
    v13->_dataPendingRetry = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    pendingIdentifiers = v13->_pendingIdentifiers;
    v13->_pendingIdentifiers = (NSMutableDictionary *)v22;

    xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v24, "Notification", "com.apple.timesync.idslaunchnotification");
    xpc_set_event();
    [(TMLSLink *)v13 updateCompatibilityState];
  }
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_A084();
  }

  return v13;
}

- (void)sendTime:(double)a3 localRTC:(double)a4 uncertainty:(double)a5 source:(id)a6 reliable:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  v22[0] = &off_112A0;
  v21[0] = @"kTMLSLinkMsgKey";
  v21[1] = @"kTMLSLinkTimeKey";
  v13 = +[NSNumber numberWithDouble:a3];
  v22[1] = v13;
  v21[2] = @"kTMLSLinkRTCKey";
  v14 = +[NSNumber numberWithDouble:a4];
  v22[2] = v14;
  v21[3] = @"kTMLSLinkUncertaintyKey";
  v15 = +[NSNumber numberWithDouble:a5];
  v22[3] = v15;
  v22[4] = v12;
  v21[4] = @"kTMLSLinkSourceKey";
  v21[5] = @"kTMLSLinkReliableKey";
  id v16 = +[NSNumber numberWithBool:v7];
  v22[5] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];

  uint64_t v18 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    uint64_t v20 = v17;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "sendingTime: %@", (uint8_t *)&v19, 0xCu);
  }
  -[TMLSLink sendData:localOnly:nonWaking:includeTinker:](self, "sendData:localOnly:nonWaking:includeTinker:", v17, 0, 0, [v12 isEqualToString:@"TMLSSourceComputed"]);
}

- (void)sendTimeZone:(id)a3 forSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TMLSLink *)self isGizmo]) {
    sub_A0B8();
  }
  v12[0] = @"kTMLSLinkMsgKey";
  v12[1] = @"kTMLSLinkTimeZoneKey";
  v13[0] = &off_112B8;
  v13[1] = v6;
  v12[2] = @"kTMLSLinkSourceKey";
  v13[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v9 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "sendingTimeZone: %@", (uint8_t *)&v10, 0xCu);
  }
  [(TMLSLink *)self sendData:v8 localOnly:1 nonWaking:0];
}

- (void)sendAutomaticTimeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TMLSLink *)self isGizmo]) {
    sub_A0E4();
  }
  v10[0] = @"kTMLSLinkMsgKey";
  v10[1] = @"kTMLSLinkAutomaticTimeEnabledKey";
  v11[0] = &off_112D0;
  v5 = +[NSNumber numberWithBool:v3];
  v11[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v7 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "sendingAutomaticTimeEnabled: %@", (uint8_t *)&v8, 0xCu);
  }
  [(TMLSLink *)self sendData:v6 localOnly:1 nonWaking:0];
}

- (void)sendDrift:(double)a3
{
  v6[0] = @"kTMLSLinkMsgKey";
  v6[1] = @"kTMLSLinkDriftKey";
  v7[0] = &off_112E8;
  v4 = +[NSNumber numberWithDouble:a3];
  v7[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  [(TMLSLink *)self sendData:v5 localOnly:0 nonWaking:0];
}

- (void)sendReset
{
  CFStringRef v4 = @"kTMLSLinkMsgKey";
  v5 = &off_11300;
  BOOL v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [(TMLSLink *)self sendData:v3 localOnly:0 nonWaking:0 includeTinker:1];
}

- (void)dataReceived:(id)a3
{
  id v4 = a3;
  v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:0];
  id v6 = [v5 objectForKey:@"kTMLSLinkMsgKey"];
  unsigned int v7 = [v6 intValue];

  switch(v7)
  {
    case 1u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A110();
      }
      int v8 = [v5 objectForKey:@"kTMLSLinkTimeKey"];
      [v8 doubleValue];
      double v10 = v9;

      id v11 = [v5 objectForKey:@"kTMLSLinkRTCKey"];
      [v11 doubleValue];
      double v13 = v12;

      v14 = [v5 objectForKey:@"kTMLSLinkUncertaintyKey"];
      [v14 doubleValue];
      double v16 = v15;

      v17 = [v5 objectForKey:@"kTMLSLinkSourceKey"];
      uint64_t v18 = [v5 objectForKey:@"kTMLSLinkReliableKey"];
      unsigned int v19 = [v18 BOOLValue];

      if (v19)
      {
        uint64_t v20 = @"TMLSSourceComputedReliable";

        v17 = v20;
      }
      v21 = [(TMLSLink *)self delegate];
      [v21 link:self didReceiveTime:v17 remoteRTC:v10 uncertainty:v13 source:v16];
      goto LABEL_32;
    case 4u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A1A4();
      }
      v17 = [v5 objectForKey:@"kTMLSLinkTimeZoneKey"];
      v21 = [v5 objectForKey:@"kTMLSLinkSourceKey"];
      uint64_t v22 = [(TMLSLink *)self delegate];
      [v22 link:self didReceiveTimeZone:v17 forSource:v21];

      goto LABEL_32;
    case 5u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A1D8();
      }
      v23 = [v5 objectForKey:@"kTMLSLinkDriftKey"];
      [v23 doubleValue];
      double v25 = v24;

      v17 = [(TMLSLink *)self delegate];
      [v17 link:self didReceiveDrift:v25];
      goto LABEL_33;
    case 6u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A20C();
      }
      v17 = [(TMLSLink *)self delegate];
      [v17 linkDidReceiveReset:self];
      goto LABEL_33;
    case 7u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A170();
      }
      if (![(TMLSLink *)self isGizmo]) {
        sub_A144();
      }
      [(TMLSLink *)self syncRTC];
      break;
    case 8u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A240();
      }
      [(TMLSLink *)self convertBTTime:v5];
      break;
    case 9u:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A274();
      }
      [(TMLSLink *)self convertBTTimeFinal:v5];
      break;
    case 0xBu:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A2A8();
      }
      [(TMLSLink *)self doBTConversionFailure];
      break;
    case 0xCu:
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
        sub_A2DC();
      }
      v17 = [(TMLSLink *)self delegate];
      v21 = [v5 objectForKeyedSubscript:@"kTMLSLinkAutomaticTimeEnabledKey"];
      objc_msgSend(v17, "link:didReceiveAutomaticTimeEnabled:", self, objc_msgSend(v21, "BOOLValue"));
LABEL_32:

LABEL_33:
      break;
    default:
      break;
  }
}

- (void)didSendDataIdentifier:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSMutableDictionary *)self->_dataPendingSend objectForKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_dataPendingSend removeObjectForKey:v6];
  double v9 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "didSendDataIdentifier:%@ withError: %@ (data: %@)", buf, 0x20u);
  }
  id v10 = v7;
  id v11 = v8;
  AnalyticsSendEventLazy();
  if (v11)
  {
    double v12 = sub_70B4(v11);
    double v13 = [(NSMutableDictionary *)self->_pendingIdentifiers objectForKeyedSubscript:v12];
    unsigned __int8 v14 = [v13 isEqualToString:v6];

    if (v14)
    {
      [(TMLSLink *)self handleDeliveryOfIdentifier:v6 withData:v11 withError:v10];
    }
    else
    {
      double v16 = (void *)TIMELINK_FACILITY;
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
      {
        pendingIdentifiers = self->_pendingIdentifiers;
        uint64_t v18 = v16;
        unsigned int v19 = [(NSMutableDictionary *)pendingIdentifiers objectForKeyedSubscript:v12];
        *(_DWORD *)buf = 138412546;
        id v23 = v6;
        __int16 v24 = 2112;
        id v25 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%@ superseded by %@", buf, 0x16u);
      }
      id v20 = v10;
      AnalyticsSendEventLazy();
    }
  }
  else
  {
    double v15 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Do not remember sent message: %@", buf, 0xCu);
    }
    id v21 = v10;
    AnalyticsSendEventLazy();
    double v12 = v21;
  }
}

- (void)handleDeliveryOfIdentifier:(id)a3 withData:(id)a4 withError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  v52 = sub_7934;
  v53 = &unk_10670;
  id v11 = a5;
  id v54 = v11;
  id v12 = v10;
  id v55 = v12;
  AnalyticsSendEventLazy();
  double v13 = sub_70B4(v12);
  unsigned __int8 v14 = [(NSMutableDictionary *)self->_pendingIdentifiers objectForKeyedSubscript:v13];
  if (([v14 isEqualToString:v9] & 1) == 0)
  {
    v43 = +[NSAssertionHandler currentHandler];
    [v43 handleFailureInMethod:a2, self, @"TMLSLink.m", 383, @"Handling delivery of '%@' despite being superceded by '%@' on '%@' with error (%@) and data (%@)", v9, v14, v13, v11, v12 object file lineNumber description];
  }
  double v15 = [v12 objectForKeyedSubscript:@"kTMLSLinkMsgKey"];
  unsigned int v16 = [v15 integerValue];

  if (v16 != 9)
  {
    if (v16 == 7)
    {
      if ([(TMLSLink *)self isGizmo])
      {
        v44 = +[NSAssertionHandler currentHandler];
        [v44 handleFailureInMethod:a2 object:self file:@"TMLSLink.m" lineNumber:390 description:@"Gizmo should not have sent TMLS_MSG_SYNC_RTC_INIT"];
      }
      unsigned int v17 = [(TMLSLink *)self syncState];
      if (!v11)
      {
        if (v17 == 1)
        {
          [(TMLSLink *)self setSyncState:3];
          v31 = TIMELINK_FACILITY;
          if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "TMLS_MSG_SYNC_RTC_INIT sent successfully", buf, 2u);
          }
        }
        else
        {
          v41 = (void *)TIMELINK_FACILITY;
          if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
          {
            unsigned int v19 = v41;
            *(_DWORD *)buf = 67109120;
            LODWORD(v57) = [(TMLSLink *)self syncState];
            id v20 = "TMLS_MSG_SYNC_RTC_INIT sent successfully, but syncState is %d";
            id v21 = v19;
            os_log_type_t v22 = OS_LOG_TYPE_INFO;
            uint32_t v24 = 8;
            goto LABEL_17;
          }
        }
        goto LABEL_35;
      }
      if (v17 != 1)
      {
        uint64_t v18 = (void *)TIMELINK_FACILITY;
        if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
        {
          unsigned int v19 = v18;
          *(_DWORD *)buf = 138412546;
          id v57 = v11;
          __int16 v58 = 1024;
          LODWORD(v59) = [(TMLSLink *)self syncState];
          id v20 = "TMLS_MSG_SYNC_RTC_INIT send failure (%@), but syncState is %d";
          id v21 = v19;
          os_log_type_t v22 = OS_LOG_TYPE_INFO;
LABEL_16:
          uint32_t v24 = 18;
LABEL_17:
          _os_log_impl(&dword_0, v21, v22, v20, buf, v24);
LABEL_22:

          goto LABEL_35;
        }
        goto LABEL_35;
      }
    }
    else if (!v11)
    {
      goto LABEL_35;
    }
    id v25 = (int *)[v11 code];
    __int16 v26 = TIMELINK_FACILITY;
    if (v25 == &dword_18)
    {
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
      {
        pendingIdentifiers = self->_pendingIdentifiers;
        unsigned int v19 = v26;
        v28 = [(NSMutableDictionary *)pendingIdentifiers objectForKeyedSubscript:v13];
        *(_DWORD *)buf = 138412802;
        id v57 = v9;
        __int16 v58 = 2112;
        v59 = v13;
        __int16 v60 = 2112;
        id v61 = v28;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "%@ (%@) replaced by %@, not retrying", buf, 0x20u);

        goto LABEL_22;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v57 = v9;
        __int16 v58 = 2112;
        v59 = v13;
        __int16 v60 = 2112;
        id v61 = v11;
        _os_log_error_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "%@ (%@) send failure (%@), will retry", buf, 0x20u);
      }
      [(NSMutableDictionary *)self->_dataPendingRetry setObject:v12 forKeyedSubscript:v9];
      dispatch_time_t v29 = dispatch_time(0, 30000000000);
      v30 = [(TMLSLink *)self workloop];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_7A9C;
      block[3] = &unk_106C0;
      block[4] = self;
      id v47 = v9;
      id v48 = v13;
      id v49 = v12;
      dispatch_after(v29, v30, block);
    }
    goto LABEL_35;
  }
  if ([(TMLSLink *)self isGizmo])
  {
    v45 = +[NSAssertionHandler currentHandler];
    [v45 handleFailureInMethod:a2 object:self file:@"TMLSLink.m" lineNumber:414 description:@"Gizmo should not have sent TMLS_MSG_CONVERT_BT_TIME_FINAL"];
  }
  id v23 = (void *)TIMELINK_FACILITY;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = v23;
      *(_DWORD *)buf = 138412546;
      id v57 = v11;
      __int16 v58 = 1024;
      LODWORD(v59) = [(TMLSLink *)self syncState];
      id v20 = "TMLS_MSG_CONVERT_BT_TIME_FINAL send failure (%@), sync state, %d, dropping";
      id v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_16;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
      sub_A310(v23);
    }
    v32 = [(TMLSLink *)self delegate];
    v33 = [v12 objectForKeyedSubscript:@"kTMLSLinkRTCKey"];
    [v33 doubleValue];
    double v35 = v34;
    v36 = [v12 objectForKeyedSubscript:@"kTMLSLinkRemoteRTCKey"];
    [v36 doubleValue];
    double v38 = v37;
    v39 = [v12 objectForKeyedSubscript:@"kTMLSLinkUncertaintyKey"];
    [v39 doubleValue];
    [v32 link:self didSyncLocalRTC:v35 remoteRTC:v38 uncertainty:v40];

    [(TMLSLink *)self setSyncState:0];
  }
LABEL_35:
}

- (void)syncRTC
{
  unsigned int v3 = [(TMLSLink *)self syncState];
  id v4 = TIMELINK_FACILITY;
  BOOL v5 = os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Already syncing RTC", v6, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Syncing RTC", buf, 2u);
    }
    if ([(TMLSLink *)self isGizmo]) {
      [(TMLSLink *)self doSyncRTC];
    }
    else {
      [(TMLSLink *)self sendSyncRequest];
    }
  }
}

- (void)sendSyncRequest
{
  if ([(TMLSLink *)self syncState] < 2)
  {
    [(TMLSLink *)self setSyncState:1];
    CFStringRef v5 = @"kTMLSLinkMsgKey";
    id v6 = &off_11318;
    id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [(TMLSLink *)self sendData:v4 localOnly:1 nonWaking:1 includeTinker:1];
  }
  else
  {
    unsigned int v3 = (void *)TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_A398(v3);
    }
  }
}

- (void)sendBTConversionFailure
{
  CFStringRef v4 = @"kTMLSLinkMsgKey";
  CFStringRef v5 = &off_11330;
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [(TMLSLink *)self sendData:v3 localOnly:0 nonWaking:0];
}

- (void)doBTConversionFailure
{
  if ([(TMLSLink *)self isGizmo])
  {
    if ([(TMLSLink *)self syncState] == 4)
    {
      [(TMLSLink *)self restartSync];
    }
    else
    {
      CFStringRef v4 = (void *)TIMELINK_FACILITY;
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
      {
        CFStringRef v5 = v4;
        v6[0] = 67109120;
        v6[1] = [(TMLSLink *)self syncState];
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "conversion failure, but sync state is %d", (uint8_t *)v6, 8u);
      }
    }
  }
  else
  {
    unsigned int v3 = (void *)TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_A418(v3);
    }
  }
}

- (void)sendData:(id)a3 localOnly:(BOOL)a4 nonWaking:(BOOL)a5
{
}

- (void)sendData:(id)a3 localOnly:(BOOL)a4 nonWaking:(BOOL)a5 includeTinker:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  if ([(TMLSLink *)self isCompatible])
  {
    id v10 = sub_70B4(v9);
    id v11 = [(TMLSLink *)self transport];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8124;
    v14[3] = &unk_106E8;
    id v15 = v9;
    unsigned int v16 = self;
    id v17 = v10;
    id v12 = v10;
    [v11 sendData:v15 localOnly:1 nonWaking:v7 queueOne:v12 withHandler:v14 includeTinker:v6];
  }
  else
  {
    double v13 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Not compatible, dropping %@", buf, 0xCu);
    }
  }
}

- (void)doSyncRTC
{
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
    sub_A524();
  }
}

- (void)didUpdateDeviceRegistryCompatibilityState:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_A564((uint64_t)v4, v5);
  }
  workloop = self->_workloop;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8580;
  block[3] = &unk_10520;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workloop, block);
}

- (void)setCompatible:(BOOL)a3
{
  if (self->_compatible != a3)
  {
    self->_compatible = a3;
    if (a3)
    {
      if ([(TMLSLink *)self isGizmo])
      {
        [(TMLSLink *)self setSyncState:2];
        [(TMLSLink *)self sendReset];
      }
      else
      {
        [(TMLSLink *)self setSyncState:0];
        id v4 = [(TMLSLink *)self delegate];
        [v4 linkDidReceiveReset:self];
      }
    }
  }
}

- (void)updateCompatibilityState
{
  unsigned int v3 = [(TMLSLink *)self isCompatible];
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v5 = [v4 compatibilityState];

  unsigned int v6 = v5 - 2;
  BOOL v7 = CORETIME_DATA_FACILITY;
  if (os_log_type_enabled((os_log_t)CORETIME_DATA_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v9 = v5;
    __int16 v10 = 1024;
    unsigned int v11 = v3;
    __int16 v12 = 1024;
    BOOL v13 = v6 < 3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "cmd,updateCompatibilityState,raw,%d,old,%d,new,%d", buf, 0x14u);
  }
  AnalyticsSendEventLazy();
  [(TMLSLink *)self setCompatible:v6 < 3];
}

- (void)convertBTTime:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:@"kTMLSLinkRemoteMachKey"];
  id v6 = [v5 unsignedLongLongValue];

  BOOL v7 = [v4 objectForKey:@"kTMLSLinkRTCKey"];
  [v7 doubleValue];
  double v9 = v8;

  __int16 v10 = [v4 objectForKeyedSubscript:@"kTMLSLinkUncertaintyKey"];

  [v10 doubleValue];
  uint64_t v12 = v11;

  BOOL v13 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_A65C((uint64_t)v6, v13, v9);
  }
  unsigned __int8 v14 = [(TMLSLink *)self clock];
  id v15 = [v14 machTime];

  if (v6 <= v15)
  {
    id v17 = [(TMLSLink *)self clock];
    uint64_t v18 = [(TMLSLink *)self workloop];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_8A7C;
    v19[3] = &unk_10730;
    v19[4] = self;
    *(double *)&v19[5] = v9;
    v19[6] = v12;
    [v17 montonicTimeForMachTime:v6 toQueue:v18 withCompletionHandler:v19];
  }
  else
  {
    unsigned int v16 = (void *)TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_A5DC(v16);
    }
  }
}

- (void)convertBTTimeFinal:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:@"kTMLSLinkRemoteRTCKey"];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [v4 objectForKey:@"kTMLSLinkRTCKey"];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = [v4 objectForKey:@"kTMLSLinkUncertaintyKey"];

  [v11 doubleValue];
  double v13 = v12;

  unsigned __int8 v14 = (void *)TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v16 = v14;
    int v17 = 134218752;
    double v18 = v7;
    __int16 v19 = 2048;
    double v20 = v10;
    __int16 v21 = 2048;
    double v22 = v13;
    __int16 v23 = 1024;
    unsigned int v24 = [(TMLSLink *)self syncState];
    _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "convertBTTimeFinal, calling didSyncLocalRTC with localRTC: %f, remoteRTC: %f, uncertainty: %f, syncState: %d", (uint8_t *)&v17, 0x26u);
  }
  id v15 = [(TMLSLink *)self delegate];
  [v15 link:self didSyncLocalRTC:v7 remoteRTC:v10 uncertainty:v13];

  [(TMLSLink *)self setSyncState:0];
}

- (void)restartSync
{
  unsigned int v3 = (void *)TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_A7A0(v3);
  }
  if ([(TMLSLink *)self isGizmo])
  {
    if ([(TMLSLink *)self syncState])
    {
      [(TMLSLink *)self setSyncState:2];
      [(TMLSLink *)self doSyncRTC];
    }
    else if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR))
    {
      sub_A6E0();
    }
  }
  else
  {
    id v4 = (void *)TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_A720(v4);
    }
  }
}

- (void)setSyncState:(int)a3
{
  unsigned int v5 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    int syncState = self->_syncState;
    *(_DWORD *)buf = 67109376;
    int v15 = syncState;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "sync state transition from %d to %d", buf, 0xEu);
  }
  double v7 = CORETIME_DATA_FACILITY;
  if (os_log_type_enabled((os_log_t)CORETIME_DATA_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = self->_syncState;
    *(_DWORD *)buf = 67109376;
    int v15 = v8;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "cmd,SyncStateTransition,old,%d,new,%d", buf, 0xEu);
  }
  AnalyticsSendEventLazy();
  if (a3 <= 2)
  {
    double v9 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
      sub_A828((uint64_t)self, v9, v10);
    }
    dispatch_time_t v11 = -1;
LABEL_13:
    dispatch_source_set_timer((dispatch_source_t)self->_syncTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    goto LABEL_14;
  }
  if (self->_syncState <= 2u)
  {
    double v12 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
      sub_A89C(&self->_syncState, v12, v13);
    }
    dispatch_time_t v11 = dispatch_walltime(0, 30000000000);
    goto LABEL_13;
  }
LABEL_14:
  self->_int syncState = a3;
}

- (void)createSyncTimer
{
  unsigned int v3 = [(TMLSLink *)self workloop];
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  syncTimer = self->_syncTimer;
  self->_syncTimer = v4;

  dispatch_source_set_timer((dispatch_source_t)self->_syncTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  double v6 = self->_syncTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_9310;
  v7[3] = &unk_10780;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_syncTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleSyncTimer
{
  unsigned int v3 = (void *)TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5[0] = 67109120;
    v5[1] = [(TMLSLink *)self syncState];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "syncTimer fired, sync state %d", (uint8_t *)v5, 8u);
  }
  if ([(TMLSLink *)self syncState] >= 3)
  {
    if ([(TMLSLink *)self isGizmo])
    {
      [(TMLSLink *)self restartSync];
    }
    else
    {
      [(TMLSLink *)self setSyncState:1];
      [(TMLSLink *)self sendSyncRequest];
    }
  }
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (TMLSLinkDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (TMLSTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (BOOL)isCompatible
{
  return self->_compatible;
}

- (NSArray)registeredDevices
{
  return self->_registeredDevices;
}

- (void)setRegisteredDevices:(id)a3
{
}

- (BOOL)isGizmo
{
  return self->_gizmo;
}

- (void)setGizmo:(BOOL)a3
{
  self->_gizmo = a3;
}

- (int)syncState
{
  return self->_syncState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDevices, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_pendingIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataPendingRetry, 0);
  objc_storeStrong((id *)&self->_dataPendingSend, 0);

  objc_storeStrong((id *)&self->_syncTimer, 0);
}

@end