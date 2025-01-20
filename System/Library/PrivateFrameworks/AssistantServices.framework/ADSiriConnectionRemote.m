@interface ADSiriConnectionRemote
- (ADSiriConnectionRemote)init;
- (BOOL)_hasOrIsEstablishingNetworkConnection;
- (BOOL)_hasPeerConnection;
- (id)_networkConnectionProvider;
- (id)_peerConnection;
- (id)_prependHeader:(__CFHTTPMessage *)a3 toOutputBuffer:(id)a4;
- (id)_tryToReadHTTPHeaderIntoMessage:(__CFHTTPMessage *)a3 fromData:(id)a4 isComplete:(BOOL *)a5;
- (id)_tryToReadPeerStreamHeaderFromData:(id)a3 needsReconnect:(BOOL *)a4;
- (void)_cancelStaleNetworkTimer;
- (void)_closeNetworkConnection;
- (void)_closePeerConnection;
- (void)_connectionMetricsWithCompletion:(id)a3;
- (void)_didEstablishNetworkConnectionForProvider:(id)a3 initialPayload:(id)a4 ofLength:(unint64_t)a5 error:(id)a6;
- (void)_doMetricsBookkeepingForNetworkStreamStart;
- (void)_doMetricsBookkeepingForPeerStreamsStart;
- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5;
- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5 countAgainstFallbacksAllowed:(BOOL)a6;
- (void)_establishPeerConnection;
- (void)_fallbackWithSafetyNet;
- (void)_insertCompanionSpecificDataIntoHeader:(__CFHTTPMessage *)a3;
- (void)_networkConnectionDidEnd;
- (void)_networkConnectionDidOpen;
- (void)_networkConnectionErrorOccurred:(id)a3;
- (void)_networkConnectionFailure;
- (void)_networkConnectionReceivedData:(id)a3;
- (void)_peerConnectionDidEnd;
- (void)_peerConnectionFailure;
- (void)_peerConnectionReceivedData:(id)a3;
- (void)_peerReadStreamErrorOccurred:(id)a3;
- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4;
- (void)_preheat;
- (void)_prepareForSleep;
- (void)_registerForSleepNotification;
- (void)_restartConnectionProviders;
- (void)_setupStaleNetworkTimerForProvider:(id)a3;
- (void)_tryToWriteToNetworkConnection;
- (void)_unregisterForSleepNotification;
- (void)_waitForNetworkData;
- (void)_waitForPeerData;
- (void)_writeDataToNetwork:(id)a3;
- (void)_writeDataToPeer:(id)a3;
- (void)connectionProvider:(id)a3 receivedError:(id)a4;
- (void)dealloc;
- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4;
- (void)peerStreamConnection:(id)a3 requestMetrics:(id)a4;
- (void)peerStreamConnectionHasIncomingPeer:(id)a3;
@end

@implementation ADSiriConnectionRemote

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_networkURLFromPeer, 0);
  objc_storeStrong((id *)&self->_safetyNetBuffer, 0);
  objc_storeStrong((id *)&self->_networkURL, 0);
  objc_storeStrong((id *)&self->_staleNetworkTimerSource, 0);
  objc_storeStrong((id *)&self->_networkConnectionProvider, 0);
  objc_storeStrong((id *)&self->_networkOutputBuffer, 0);
  objc_storeStrong((id *)&self->_peerProvider, 0);
  objc_storeStrong((id *)&self->_peerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_doMetricsBookkeepingForNetworkStreamStart
{
  v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  self->_currentStartTime = v4;

  if (self->_firstStartTime <= 0.0) {
    self->_firstStartTime = self->_currentStartTime;
  }
  *(_OWORD *)&self->_currentOpenTime = 0u;
  ++self->_startCount;
}

- (void)_doMetricsBookkeepingForPeerStreamsStart
{
  self->_startCount = 0;
  self->_metricsCount = 0;
  self->_firstStartTime = -1.0;
}

- (void)_connectionMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)SiriCoreConnectionMetrics);
    ++self->_metricsCount;
    double currentOpenTime = self->_currentOpenTime;
    double firstStartTime = self->_firstStartTime;
    if (currentOpenTime > firstStartTime)
    {
      v8 = +[NSNumber numberWithDouble:currentOpenTime - firstStartTime];
      [v5 setTimeUntilOpen:v8];

      double firstStartTime = self->_firstStartTime;
    }
    double firstByteReadTime = self->_firstByteReadTime;
    if (firstByteReadTime > firstStartTime)
    {
      v10 = +[NSNumber numberWithDouble:firstByteReadTime - firstStartTime];
      [v5 setTimeUntilFirstByteRead:v10];
    }
    v11 = +[NSNumber numberWithUnsignedInteger:self->_startCount];
    [v5 setAttemptCount:v11];

    v12 = +[NSNumber numberWithUnsignedInteger:self->_metricsCount];
    [v5 setMetricsCount:v12];

    networkConnectionProvider = self->_networkConnectionProvider;
    if (networkConnectionProvider)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1002FECDC;
      v14[3] = &unk_10050E188;
      id v16 = v4;
      id v15 = v5;
      [(SiriCoreConnectionProvider *)networkConnectionProvider updateConnectionMetrics:v15 completion:v14];
    }
    else
    {
      (*((void (**)(id, id))v4 + 2))(v4, v5);
    }
  }
}

- (void)_unregisterForSleepNotification
{
  if (self->_ioConnect)
  {
    IOReturn v3 = IODeregisterForSystemPower(&self->_ioNotifier);
    if (v3)
    {
      IOReturn v4 = v3;
      id v5 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        v7 = "-[ADSiriConnectionRemote _unregisterForSleepNotification]";
        __int16 v8 = 1026;
        IOReturn v9 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Error deregistering for power notifications %{public}d", (uint8_t *)&v6, 0x12u);
      }
    }
    else
    {
      self->_ioNotifier = 0;
      IONotificationPortDestroy(self->_ioNotificationPortRef);
      self->_ioNotificationPortRef = 0;
      IOServiceClose(self->_ioConnect);
      self->_ioConnect = 0;
    }
  }
}

- (void)_registerForSleepNotification
{
  if (!self->_ioConnect)
  {
    io_connect_t v3 = IORegisterForSystemPower(self, &self->_ioNotificationPortRef, (IOServiceInterestCallback)sub_1002FEE68, &self->_ioNotifier);
    self->_ioConnect = v3;
    if (v3 + 1 >= 2)
    {
      ioNotificationPortRef = self->_ioNotificationPortRef;
      queue = self->_queue;
      IONotificationPortSetDispatchQueue(ioNotificationPortRef, queue);
    }
    else
    {
      self->_ioConnect = 0;
    }
  }
}

- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4
{
  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  int v6 = v7 >> 4;
  if (v6 != 1)
  {
    if (v6) {
      return;
    }
    [(ADSiriConnectionRemote *)self _prepareForSleep];
  }
  io_connect_t ioConnect = self->_ioConnect;
  IOAllowPowerChange(ioConnect, a4);
}

- (void)_prepareForSleep
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FEF50;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_writeDataToNetwork:(id)a3
{
  IOReturn v4 = a3;
  id v5 = v4;
  if (v4)
  {
    size_t size = dispatch_data_get_size(v4);
    networkConnectionProvider = self->_networkConnectionProvider;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002FF018;
    v8[3] = &unk_10050BB58;
    v8[4] = size;
    [(SiriCoreConnectionProvider *)networkConnectionProvider writeData:v5 completion:v8];
    if (!self->_dataHasBeenWrittenToNetwork)
    {
      self->_dataHasBeenWrittenToNetwork = 1;
      [(ADSiriConnectionRemote *)self _cancelStaleNetworkTimer];
    }
  }
}

- (void)_tryToWriteToNetworkConnection
{
  if (!self->_outgoingHTTPHeader)
  {
    networkOutputBuffer = self->_networkOutputBuffer;
    if (networkOutputBuffer)
    {
      data2 = networkOutputBuffer;
      IOReturn v4 = self->_networkOutputBuffer;
      self->_networkOutputBuffer = 0;

      [(ADSiriConnectionRemote *)self _writeDataToNetwork:data2];
      safetyNetBuffer = self->_safetyNetBuffer;
      if (safetyNetBuffer)
      {
        concat = (OS_dispatch_data *)dispatch_data_create_concat(safetyNetBuffer, data2);
        unint64_t v7 = self->_safetyNetBuffer;
        self->_safetyNetBuffer = concat;
      }
    }
  }
}

- (void)_networkConnectionErrorOccurred:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[ADSiriConnectionRemote _networkConnectionErrorOccurred:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(ADSiriConnectionRemote *)self _networkConnectionFailure];
}

- (void)_networkConnectionDidOpen
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    unint64_t v7 = "-[ADSiriConnectionRemote _networkConnectionDidOpen]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[NSProcessInfo processInfo];
  [v4 systemUptime];
  self->_double currentOpenTime = v5;

  [(ADSiriConnectionRemote *)self _tryToWriteToNetworkConnection];
}

- (void)_networkConnectionReceivedData:(id)a3
{
  id v4 = a3;
  size_t size = dispatch_data_get_size(v4);
  if (v4 && (size_t v6 = size) != 0)
  {
    [(ADSiriConnectionRemote *)self _writeDataToPeer:v4];
    safetyNetBuffer = self->_safetyNetBuffer;
    self->_safetyNetBuffer = 0;

    if (self->_firstByteReadTime == 0.0)
    {
      __int16 v8 = +[NSProcessInfo processInfo];
      [v8 systemUptime];
      self->_double firstByteReadTime = v9;
    }
    v10 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      id v16 = "-[ADSiriConnectionRemote _networkConnectionReceivedData:]";
      __int16 v17 = 2048;
      size_t v18 = v6;
      v11 = "%s read: %lu";
      v12 = v10;
      uint32_t v13 = 22;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    }
  }
  else
  {
    v14 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      id v16 = "-[ADSiriConnectionRemote _networkConnectionReceivedData:]";
      v11 = "%s zero length data";
      v12 = v14;
      uint32_t v13 = 12;
      goto LABEL_9;
    }
  }
}

- (void)_waitForNetworkData
{
  io_connect_t v3 = self->_networkConnectionProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002FF598;
  v5[3] = &unk_10050BB38;
  size_t v6 = v3;
  unint64_t v7 = self;
  id v4 = v3;
  [(SiriCoreConnectionProvider *)v4 readData:v5];
}

- (void)_writeDataToPeer:(id)a3
{
  if (a3)
  {
    size_t size = dispatch_data_get_size((dispatch_data_t)a3);
    peerProvider = self->_peerProvider;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002FF738;
    v7[3] = &unk_10050BB58;
    v7[4] = size;
    [(ADPeerConnectionProvider *)peerProvider writeData:a3 completion:v7];
  }
}

- (void)_peerReadStreamErrorOccurred:(id)a3
{
  id v4 = a3;
  double v5 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[ADSiriConnectionRemote _peerReadStreamErrorOccurred:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(ADSiriConnectionRemote *)self _peerConnectionFailure];
}

- (void)_peerConnectionReceivedData:(id)a3
{
  id v4 = a3;
  networkOutputBuffer = self->_networkOutputBuffer;
  if (networkOutputBuffer) {
    concat = (OS_dispatch_data *)dispatch_data_create_concat(networkOutputBuffer, v4);
  }
  else {
    concat = v4;
  }
  unint64_t v7 = self->_networkOutputBuffer;
  self->_networkOutputBuffer = concat;

  BOOL v8 = 0;
  unsigned __int8 v32 = 0;
  if (self->_networkURLFromPeer) {
    goto LABEL_8;
  }
  id v9 = [(ADSiriConnectionRemote *)self _tryToReadPeerStreamHeaderFromData:self->_networkOutputBuffer needsReconnect:&v32];
  v10 = self->_networkOutputBuffer;
  self->_networkOutputBuffer = v9;

  v11 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    networkURLFromPeer = self->_networkURLFromPeer;
    BOOL connectByPOP = self->_connectByPOP;
    *(_DWORD *)buf = 136315906;
    v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
    __int16 v35 = 2112;
    v36 = networkURLFromPeer;
    __int16 v37 = 1024;
    BOOL v38 = connectByPOP;
    __int16 v39 = 1024;
    int v40 = v32;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s read peer header %@ pop %d reconnect %d", buf, 0x22u);
  }
  v14 = self->_networkURLFromPeer;
  BOOL v8 = v14 != 0;
  if (v14)
  {
LABEL_8:
    outgoingHTTPHeader = self->_outgoingHTTPHeader;
    if (outgoingHTTPHeader)
    {
      unsigned __int8 v31 = 0;
      id v16 = [(ADSiriConnectionRemote *)self _tryToReadHTTPHeaderIntoMessage:outgoingHTTPHeader fromData:self->_networkOutputBuffer isComplete:&v31];
      __int16 v17 = self->_networkOutputBuffer;
      self->_networkOutputBuffer = v16;

      int v18 = v31;
      v19 = AFSiriLogContextProxy;
      BOOL v20 = os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v20)
        {
          *(_DWORD *)buf = 136315138;
          v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s HTTP Header is complete", buf, 0xCu);
        }
        [(ADSiriConnectionRemote *)self _insertCompanionSpecificDataIntoHeader:self->_outgoingHTTPHeader];
        v21 = [(ADSiriConnectionRemote *)self _prependHeader:self->_outgoingHTTPHeader toOutputBuffer:self->_networkOutputBuffer];
        v22 = self->_networkOutputBuffer;
        self->_networkOutputBuffer = v21;

        CFRelease(self->_outgoingHTTPHeader);
        self->_outgoingHTTPHeader = 0;
      }
      else if (v20)
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s HTTP Header is not complete", buf, 0xCu);
      }
    }
  }
  unsigned __int8 v23 = [(ADSiriConnectionRemote *)self _hasOrIsEstablishingNetworkConnection];
  if (v32) {
    unsigned __int8 v24 = 0;
  }
  else {
    unsigned __int8 v24 = v23;
  }
  if ((v24 & 1) == 0 && v8)
  {
    [(ADSiriConnectionRemote *)self _closeNetworkConnection];
    [(ADSiriConnectionRemote *)self _establishNetworkConnectionToURL:self->_networkURLFromPeer connectionId:self->_connectionId withPOP:self->_connectByPOP countAgainstFallbacksAllowed:0];
  }
  if ([(SiriCoreConnectionProvider *)self->_networkConnectionProvider isReady])
  {
    [(ADSiriConnectionRemote *)self _tryToWriteToNetworkConnection];
  }
  else
  {
    unsigned __int8 v25 = [(SiriCoreConnectionProvider *)self->_networkConnectionProvider isEstablishing];
    v26 = AFSiriLogContextProxy;
    BOOL v27 = os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Waiting for network connection", buf, 0xCu);
      }
    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Establishing network connection", buf, 0xCu);
      }
      networkURL = self->_networkURLFromPeer;
      if (networkURL)
      {
        connectionId = self->_connectionId;
        BOOL v30 = self->_connectByPOP;
      }
      else
      {
        connectionId = 0;
        BOOL v30 = 0;
        networkURL = self->_networkURL;
      }
      [(ADSiriConnectionRemote *)self _establishNetworkConnectionToURL:networkURL connectionId:connectionId withPOP:v30];
    }
  }
}

- (void)_waitForPeerData
{
  io_connect_t v3 = self->_peerProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002FFD60;
  v5[3] = &unk_10050BB38;
  void v5[4] = self;
  int v6 = v3;
  id v4 = v3;
  [(ADPeerConnectionProvider *)v4 readData:v5];
}

- (void)connectionProvider:(id)a3 receivedError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[ADSiriConnectionRemote connectionProvider:receivedError:]";
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100300024;
  v11[3] = &unk_10050E160;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)_cancelStaleNetworkTimer
{
  staleNetworkTimerSource = self->_staleNetworkTimerSource;
  if (staleNetworkTimerSource)
  {
    dispatch_source_cancel(staleNetworkTimerSource);
    id v4 = self->_staleNetworkTimerSource;
    self->_staleNetworkTimerSource = 0;
  }
}

- (void)_setupStaleNetworkTimerForProvider:(id)a3
{
  id v4 = a3;
  double v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v6 = dispatch_time(0, 180000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100300328;
  handler[3] = &unk_10050DCB8;
  id v7 = v5;
  id v12 = v7;
  uint32_t v13 = self;
  id v14 = v4;
  id v8 = v4;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  staleNetworkTimerSource = self->_staleNetworkTimerSource;
  self->_staleNetworkTimerSource = (OS_dispatch_source *)v7;
  id v10 = v7;
}

- (void)_networkConnectionDidEnd
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    double v5 = "-[ADSiriConnectionRemote _networkConnectionDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADSiriConnectionRemote *)self _networkConnectionFailure];
}

- (void)_networkConnectionFailure
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    dispatch_time_t v6 = "-[ADSiriConnectionRemote _networkConnectionFailure]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if (self->_safetyNetBuffer)
  {
    [(ADSiriConnectionRemote *)self _fallbackWithSafetyNet];
  }
  else if (self->_networkURLFromPeer)
  {
    [(ADSiriConnectionRemote *)self _restartConnectionProviders];
  }
  else
  {
    int v4 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      dispatch_time_t v6 = "-[ADSiriConnectionRemote _networkConnectionFailure]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Waiting for peer header before restarting peer streams", (uint8_t *)&v5, 0xCu);
    }
    [(ADSiriConnectionRemote *)self _closeNetworkConnection];
  }
}

- (void)_closeNetworkConnection
{
  networkConnectionProvider = self->_networkConnectionProvider;
  if (networkConnectionProvider)
  {
    int v4 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[ADSiriConnectionRemote _closeNetworkConnection]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
      networkConnectionProvider = self->_networkConnectionProvider;
    }
    [(SiriCoreConnectionProvider *)networkConnectionProvider close];
    int v5 = self->_networkConnectionProvider;
    self->_networkConnectionProvider = 0;

    self->_dataHasBeenWrittenToNetwork = 0;
    [(ADSiriConnectionRemote *)self _cancelStaleNetworkTimer];
  }
}

- (void)_didEstablishNetworkConnectionForProvider:(id)a3 initialPayload:(id)a4 ofLength:(unint64_t)a5 error:(id)a6
{
  id v10 = (SiriCoreConnectionProvider *)a3;
  v11 = (OS_dispatch_data *)a4;
  id v12 = a6;
  uint32_t v13 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315138;
    BOOL v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v29, 0xCu);
  }
  if (self->_networkConnectionProvider == v10)
  {
    if (!v12)
    {
      if (v11)
      {
        networkOutputBuffer = self->_networkOutputBuffer;
        if (networkOutputBuffer) {
          size_t size = dispatch_data_get_size(networkOutputBuffer);
        }
        else {
          size_t size = 0;
        }
        v19 = AFSiriLogContextProxy;
        if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_DEBUG))
        {
          int v29 = 136315650;
          BOOL v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
          __int16 v31 = 2048;
          unint64_t v32 = a5;
          __int16 v33 = 2048;
          size_t v34 = size;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s Stream opened with initial payload length %lu, networkOutputBuffer length %lu", (uint8_t *)&v29, 0x20u);
        }
        BOOL v20 = size >= a5;
        size_t v21 = size - a5;
        if (!v20 || self->_networkOutputBuffer != v11)
        {
          v22 = AFSiriLogContextProxy;
          if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
          {
            int v29 = 136315138;
            BOOL v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s NetworkOutputBuffer has been reset; initial payload set on this pair of streams is no longer valid",
              (uint8_t *)&v29,
              0xCu);
          }
          [(ADSiriConnectionRemote *)self _closeNetworkConnection];
          networkURLFromPeer = self->_networkURLFromPeer;
          if (networkURLFromPeer)
          {
            [(ADSiriConnectionRemote *)self _establishNetworkConnectionToURL:networkURLFromPeer connectionId:self->_connectionId withPOP:self->_connectByPOP];
            goto LABEL_32;
          }
          id v14 = AFSiriLogContextProxy;
          if (!os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO)) {
            goto LABEL_32;
          }
          int v29 = 136315138;
          BOOL v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
          __int16 v15 = "%s Waiting for peer header before restarting peer streams";
          goto LABEL_6;
        }
        safetyNetBuffer = self->_safetyNetBuffer;
        if (safetyNetBuffer)
        {
          safetyNetBuffer = dispatch_data_create_concat(safetyNetBuffer, (dispatch_data_t)v11);
          unsigned __int8 v25 = self->_safetyNetBuffer;
        }
        else
        {
          unsigned __int8 v25 = 0;
        }
        self->_safetyNetBuffer = (OS_dispatch_data *)safetyNetBuffer;

        v26 = self->_networkOutputBuffer;
        if (v26)
        {
          subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v26, a5, v21);
          v28 = self->_networkOutputBuffer;
          self->_networkOutputBuffer = subrange;
        }
      }
      self->_dataHasBeenWrittenToNetwork = 0;
      [(ADSiriConnectionRemote *)self _setupStaleNetworkTimerForProvider:v10];
      [(ADSiriConnectionRemote *)self _networkConnectionDidOpen];
      [(ADSiriConnectionRemote *)self _waitForNetworkData];
      [(ADSiriConnectionRemote *)self _tryToWriteToNetworkConnection];
      goto LABEL_32;
    }
    id v16 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315394;
      BOOL v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
      __int16 v31 = 2114;
      unint64_t v32 = (unint64_t)v12;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v29, 0x16u);
    }
    [(ADSiriConnectionRemote *)self _networkConnectionFailure];
  }
  else
  {
    id v14 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315138;
      BOOL v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
      __int16 v15 = "%s We no longer care about the streams we opened here";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v29, 0xCu);
    }
  }
LABEL_32:
}

- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5 countAgainstFallbacksAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  uint32_t v13 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
    __int16 v47 = 2112;
    size_t v48 = (size_t)v11;
    __int16 v49 = 2112;
    id v50 = v12;
    __int16 v51 = 1024;
    BOOL v52 = v7;
    __int16 v53 = 1024;
    BOOL v54 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ %@ %d %d", buf, 0x2Cu);
  }
  p_networkURL = &self->_networkURL;
  objc_storeStrong((id *)&self->_networkURL, a3);
  safetyNetBuffer = self->_safetyNetBuffer;
  if (!safetyNetBuffer) {
    goto LABEL_12;
  }
  if (self->_networkOutputBuffer)
  {
    concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_safetyNetBuffer, (dispatch_data_t)self->_networkOutputBuffer);
    __int16 v17 = self->_safetyNetBuffer;
    self->_safetyNetBuffer = concat;

    safetyNetBuffer = self->_safetyNetBuffer;
  }
  objc_storeStrong((id *)&self->_networkOutputBuffer, safetyNetBuffer);
  int v18 = AFSiriLogContextProxy;
  BOOL v19 = os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Using fallback path, but creating new safety net", buf, 0xCu);
    }
LABEL_12:
    BOOL v20 = (OS_dispatch_data *)&_dispatch_data_empty;
    id v21 = &_dispatch_data_empty;
    goto LABEL_13;
  }
  if (v19)
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Falling back", buf, 0xCu);
  }
  BOOL v20 = 0;
LABEL_13:
  v22 = self->_safetyNetBuffer;
  self->_safetyNetBuffer = v20;

  unsigned __int8 v23 = [(ADSiriConnectionRemote *)self _networkConnectionProvider];
  [v23 setConnectByPOPMethod:v7];
  [v23 setRetransmitConnectionDropTime:8.0];
  [v23 setStaleInterval:100.0];
  unsigned __int8 v24 = +[ADAccount activeAccount];
  if (![v24 connectionPolicyStatus])
  {
    unsigned __int8 v25 = [v24 saConnectionPolicy];
    [v23 setProviderConnectionPolicy:v25];
  }
  [(ADSiriConnectionRemote *)self _doMetricsBookkeepingForNetworkStreamStart];
  int64_t v26 = self->_networkConnectionSequenceNumber + 1;
  self->_networkConnectionSequenceNumber = v26;
  if (v7)
  {
    BOOL v27 = self->_networkOutputBuffer;
    v28 = v27;
    id v29 = v12;
    if (v27) {
      size_t size = dispatch_data_get_size((dispatch_data_t)v27);
    }
    else {
      size_t size = 0;
    }
    __int16 v31 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
      __int16 v47 = 2048;
      size_t v48 = size;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%s Will open stream with initial payload length %lu", buf, 0x16u);
    }
    id v12 = v29;
    p_networkURL = &self->_networkURL;
  }
  else
  {
    v28 = 0;
    size_t size = 0;
  }
  if ([v23 supportsInitialPayload])
  {
    if (v11)
    {
LABEL_25:
      unint64_t v32 = (NSURL *)v11;
      goto LABEL_28;
    }
  }
  else
  {
    +[NSAssertionHandler currentHandler];
    id v33 = v11;
    size_t v34 = p_networkURL;
    v36 = id v35 = v12;
    [v36 handleFailureInMethod:v39 object:self file:@"ADSiriConnectionRemote.m" lineNumber:416 description:@"Programming error: network stream provider should support initial payload."];

    id v12 = v35;
    p_networkURL = v34;
    id v11 = v33;
    if (v33) {
      goto LABEL_25;
    }
  }
  unint64_t v32 = *p_networkURL;
  if (!v32)
  {
    unint64_t v32 = +[NSError errorWithDomain:@"ADSiriConnectionRemoteErrorDomain" code:2 userInfo:0];
    [(ADSiriConnectionRemote *)self _didEstablishNetworkConnectionForProvider:v23 initialPayload:0 ofLength:0 error:v32];
    goto LABEL_31;
  }
LABEL_28:
  __int16 v37 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
    __int16 v47 = 2048;
    size_t v48 = v26;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s opening %lu", buf, 0x16u);
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100300FD4;
  v40[3] = &unk_10050BB10;
  int64_t v43 = v26;
  v40[4] = self;
  id v41 = v23;
  v42 = v28;
  size_t v44 = size;
  [v41 openConnectionForURL:v32 withConnectionId:v12 initialPayload:v42 completion:v40];

LABEL_31:
}

- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5
{
}

- (BOOL)_hasOrIsEstablishingNetworkConnection
{
  if ([(SiriCoreConnectionProvider *)self->_networkConnectionProvider isReady]) {
    return 1;
  }
  networkConnectionProvider = self->_networkConnectionProvider;
  return [(SiriCoreConnectionProvider *)networkConnectionProvider isEstablishing];
}

- (id)_networkConnectionProvider
{
  networkConnectionProvider = self->_networkConnectionProvider;
  if (!networkConnectionProvider)
  {
    int v4 = (SiriCoreConnectionProvider *)[objc_alloc((Class)SiriCoreNWConnection) initWithQueue:self->_queue];
    int v5 = self->_networkConnectionProvider;
    self->_networkConnectionProvider = v4;

    [(SiriCoreConnectionProvider *)self->_networkConnectionProvider setDelegate:self];
    networkConnectionProvider = self->_networkConnectionProvider;
  }
  return networkConnectionProvider;
}

- (void)peerStreamConnection:(id)a3 requestMetrics:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100301428;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)peerStreamConnectionHasIncomingPeer:(id)a3
{
  int v4 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADSiriConnectionRemote peerStreamConnectionHasIncomingPeer:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100301650;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4
{
  id v5 = a4;
  BOOL v6 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADSiriConnectionRemote peerStreamConnection:failedWithError:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10030193C;
  v9[3] = &unk_10050E160;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)_peerConnectionDidEnd
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSiriConnectionRemote _peerConnectionDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADSiriConnectionRemote *)self _restartConnectionProviders];
}

- (void)_peerConnectionFailure
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSiriConnectionRemote _peerConnectionFailure]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADSiriConnectionRemote *)self _restartConnectionProviders];
}

- (void)_restartConnectionProviders
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSiriConnectionRemote _restartConnectionProviders]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADSiriConnectionRemote *)self _closeNetworkConnection];
  [(ADSiriConnectionRemote *)self _closePeerConnection];
  [(ADSiriConnectionRemote *)self _establishPeerConnection];
}

- (void)_fallbackWithSafetyNet
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADSiriConnectionRemote _fallbackWithSafetyNet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  [(ADSiriConnectionRemote *)self _closeNetworkConnection];
  networkURLFromPeer = self->_networkURLFromPeer;
  if (networkURLFromPeer)
  {
    connectionId = self->_connectionId;
    BOOL connectByPOP = self->_connectByPOP;
  }
  else
  {
    connectionId = 0;
    BOOL connectByPOP = 0;
    networkURLFromPeer = self->_networkURL;
  }
  [(ADSiriConnectionRemote *)self _establishNetworkConnectionToURL:networkURLFromPeer connectionId:connectionId withPOP:connectByPOP];
}

- (id)_prependHeader:(__CFHTTPMessage *)a3 toOutputBuffer:(id)a4
{
  id v5 = a4;
  CFDataRef v6 = CFHTTPMessageCopySerializedMessage(a3);
  if (v6)
  {
    CFDataRef v7 = v6;
    CFRetain(v6);
    BytePtr = CFDataGetBytePtr(v7);
    size_t Length = CFDataGetLength(v7);
    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472;
    destructor[2] = sub_100301D58;
    destructor[3] = &unk_10050E350;
    destructor[4] = v7;
    id v10 = dispatch_data_create(BytePtr, Length, 0, destructor);
    CFRelease(v7);
  }
  else
  {
    id v10 = 0;
  }
  dispatch_data_t concat = dispatch_data_create_concat(v10, v5);

  return concat;
}

- (void)_insertCompanionSpecificDataIntoHeader:(__CFHTTPMessage *)a3
{
  CFStringRef v4 = (const __CFString *)AFProductType();
  CFHTTPMessageSetHeaderFieldValue(a3, @"X-Companion-Type", v4);
  CFStringRef v5 = (const __CFString *)AFBuildVersion();
  CFHTTPMessageSetHeaderFieldValue(a3, @"X-Companion-Build", v5);
}

- (id)_tryToReadHTTPHeaderIntoMessage:(__CFHTTPMessage *)a3 fromData:(id)a4 isComplete:(BOOL *)a5
{
  CFDataRef v7 = a4;
  id v8 = v7;
  if (v7 && dispatch_data_get_size(v7))
  {
    uint64_t v16 = 0;
    __int16 v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100301F28;
    v15[3] = &unk_10050BA98;
    v15[4] = &v16;
    v15[5] = a3;
    dispatch_data_apply(v8, v15);
    size_t v9 = v17[3];
    if (v9)
    {
      size_t size = dispatch_data_get_size(v8);
      if (size <= v9)
      {
        dispatch_data_t subrange = (dispatch_data_t)&_dispatch_data_empty;
        id v13 = &_dispatch_data_empty;
      }
      else
      {
        dispatch_data_t subrange = dispatch_data_create_subrange(v8, v9, size - v9);
      }

      id v8 = subrange;
    }
    if (a5) {
      *a5 = CFHTTPMessageIsHeaderComplete(a3) != 0;
    }
    id v12 = v8;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    id v12 = v8;
  }

  return v12;
}

- (id)_tryToReadPeerStreamHeaderFromData:(id)a3 needsReconnect:(BOOL *)a4
{
  CFDataRef v6 = a3;
  size_t size = dispatch_data_get_size(v6);
  dispatch_data_t subrange = v6;
  size_t v9 = [subrange bytes];
  id v33 = a4;
  if (!subrange) {
    goto LABEL_11;
  }
  id v10 = v9;
  size_t v11 = dispatch_data_get_size(subrange);
  if (v11 < 2) {
    goto LABEL_11;
  }
  if (v11 >= 6 && *(_WORD *)v10 == 17233)
  {
    unint64_t v12 = bswap32(*((unsigned __int16 *)v10 + 2)) >> 16;
    if (v11 - 6 >= v12)
    {
      int v13 = v10[2] & 1;
      id v14 = [objc_alloc((Class)NSString) initWithBytes:v10 + 6 length:v12 encoding:4];
      if (v14)
      {
        id v15 = [objc_alloc((Class)NSURL) initWithString:v14];
        size_t v16 = v12 + 6;
      }
      else
      {
        id v15 = 0;
        size_t v16 = -1;
      }

      goto LABEL_39;
    }
    goto LABEL_11;
  }
  __int16 v17 = 0;
  int v13 = 0;
  id v18 = 0;
  size_t v16 = 0;
  id v19 = 0;
  if (v11 < 8) {
    goto LABEL_49;
  }
  BOOL v20 = 0;
  if (*(_WORD *)v10 == 16977)
  {
    unint64_t v21 = bswap32(*((unsigned __int16 *)v10 + 1)) >> 16;
    if (v11 - 8 < v21)
    {
LABEL_11:
      __int16 v17 = 0;
      id v18 = 0;
      int v13 = 0;
      size_t v16 = 0;
      id v19 = 0;
      BOOL v20 = 0;
      goto LABEL_12;
    }
    id v29 = v10 + 8;
    id v30 = [objc_alloc((Class)NSString) initWithBytes:v10 + 8 length:v21 encoding:4];
    if (v30)
    {
      id v15 = [objc_alloc((Class)NSURL) initWithString:v30];
      size_t v16 = v21 + 8;
    }
    else
    {
      id v15 = 0;
      size_t v16 = -1;
    }

    if (!*((_WORD *)v10 + 2))
    {
      int v13 = 0;
LABEL_39:
      id v19 = 0;
LABEL_40:
      id v18 = v15;
      __int16 v17 = 0;
      BOOL v20 = v18;
      goto LABEL_12;
    }
    uint64_t v31 = __rev16(*((unsigned __int16 *)v10 + 2));
    id v19 = [objc_alloc((Class)NSString) initWithBytes:&v29[v21] length:v31 encoding:4];
    if (!v19)
    {
      int v13 = 0;
      size_t v16 = -1;
      goto LABEL_40;
    }
    v16 += v31;
    id v32 = v15;
    __int16 v17 = v32;
    int v13 = 0;
    if (v16)
    {
      BOOL v20 = v32;
      goto LABEL_13;
    }
    id v18 = 0;
LABEL_49:
    BOOL v20 = v17;
  }
LABEL_12:

  __int16 v17 = v18;
LABEL_13:

  v22 = AFSiriLogContextProxy;
  if ((v16 & 0x8000000000000000) != 0 || v16 > size)
  {
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v35 = "-[ADSiriConnectionRemote _tryToReadPeerStreamHeaderFromData:needsReconnect:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Bad Peer Header", buf, 0xCu);
    }
    [(ADSiriConnectionRemote *)self _peerConnectionFailure];
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v35 = "-[ADSiriConnectionRemote _tryToReadPeerStreamHeaderFromData:needsReconnect:]";
      __int16 v36 = 2112;
      __int16 v37 = v17;
      __int16 v38 = 1024;
      int v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Read Peer Header %@ %d", buf, 0x1Cu);
    }
    unsigned __int8 v23 = subrange;
    unsigned __int8 v24 = v23;
    if (subrange)
    {
      size_t v25 = dispatch_data_get_size(v23);
      if (v25 <= v16)
      {
        dispatch_data_t subrange = (dispatch_data_t)&_dispatch_data_empty;
        id v26 = &_dispatch_data_empty;
      }
      else
      {
        dispatch_data_t subrange = dispatch_data_create_subrange(v24, v16, v25 - v16);
      }
    }
  }
  objc_storeStrong((id *)&self->_networkURLFromPeer, v17);
  if (v17)
  {
    unsigned int v27 = [v17 isEqual:self->_networkURL] ^ 1;
    if (!v33) {
      goto LABEL_30;
    }
  }
  else
  {
    LOBYTE(v27) = 0;
    if (!v33) {
      goto LABEL_30;
    }
  }
  if (v13) {
    LOBYTE(v27) = 1;
  }
  *id v33 = v27;
LABEL_30:

  return subrange;
}

- (void)_closePeerConnection
{
  peerProvider = self->_peerProvider;
  if (peerProvider)
  {
    [(ADPeerConnectionProvider *)peerProvider close];
    CFStringRef v4 = self->_peerProvider;
    self->_peerProvider = 0;

    [(ADPeerStreamConnection *)self->_peerConnection close];
    networkOutputBuffer = self->_networkOutputBuffer;
    self->_networkOutputBuffer = 0;

    networkURLFromPeer = self->_networkURLFromPeer;
    self->_networkURLFromPeer = 0;

    outgoingHTTPHeader = self->_outgoingHTTPHeader;
    if (outgoingHTTPHeader)
    {
      CFRelease(outgoingHTTPHeader);
      self->_outgoingHTTPHeader = 0;
    }
  }
}

- (void)_establishPeerConnection
{
  io_connect_t v3 = AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    size_t v11 = "-[ADSiriConnectionRemote _establishPeerConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([(ADPeerConnectionProvider *)self->_peerProvider isEstablishing])
  {
    CFStringRef v4 = AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      size_t v11 = "-[ADSiriConnectionRemote _establishPeerConnection]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Already establishing peer streams!", buf, 0xCu);
    }
  }
  else
  {
    [(ADSiriConnectionRemote *)self _doMetricsBookkeepingForPeerStreamsStart];
    CFStringRef v5 = [[ADPeerConnectionProvider alloc] initWithQueue:self->_queue];
    [(ADPeerConnectionProvider *)self->_peerProvider close];
    objc_storeStrong((id *)&self->_peerProvider, v5);
    CFDataRef v6 = [(ADSiriConnectionRemote *)self _peerConnection];
    [(ADPeerConnectionProvider *)v5 setPeerStreamConnection:v6];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003025BC;
    v8[3] = &unk_10050CB48;
    v8[4] = self;
    size_t v9 = v5;
    CFDataRef v7 = v5;
    [(ADPeerConnectionProvider *)v7 openConnectionForURL:0 withConnectionId:0 initialPayload:0 completion:v8];
  }
}

- (BOOL)_hasPeerConnection
{
  return [(ADPeerConnectionProvider *)self->_peerProvider hasActiveConnection];
}

- (id)_peerConnection
{
  return self->_peerConnection;
}

- (void)_preheat
{
  if ([(ADPeerStreamConnection *)self->_peerConnection hasNearbyPeer])
  {
    [(ADSiriConnectionRemote *)self _establishPeerConnection];
    networkURLFromPeer = self->_networkURLFromPeer;
    if (!networkURLFromPeer) {
      networkURLFromPeer = self->_networkURL;
    }
    connectionId = self->_connectionId;
    BOOL connectByPOP = self->_connectByPOP;
    [(ADSiriConnectionRemote *)self _establishNetworkConnectionToURL:networkURLFromPeer connectionId:connectionId withPOP:connectByPOP];
  }
}

- (void)dealloc
{
  [(ADSiriConnectionRemote *)self _unregisterForSleepNotification];
  [(ADSiriConnectionRemote *)self _closePeerConnection];
  [(ADSiriConnectionRemote *)self _closeNetworkConnection];
  v3.receiver = self;
  v3.super_class = (Class)ADSiriConnectionRemote;
  [(ADSiriConnectionRemote *)&v3 dealloc];
}

- (ADSiriConnectionRemote)init
{
  v33.receiver = self;
  v33.super_class = (Class)ADSiriConnectionRemote;
  v2 = [(ADSiriConnectionRemote *)&v33 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    CFStringRef v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ADSiriConnectionRemote", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    CFDataRef v7 = +[ADAccount activeAccount];
    id v8 = [v7 saConnectionPolicy];
    size_t v9 = [v8 routes];
    id v10 = [v9 firstObject];

    size_t v11 = [v7 hostname];
    unint64_t v12 = [v11 stringByAppendingString:@"/ace"];
    if (v12) {
      id v13 = [objc_alloc((Class)NSURL) initWithString:v12];
    }
    else {
      id v13 = 0;
    }
    p_networkURL = &v2->_networkURL;
    objc_storeStrong((id *)&v2->_networkURL, v13);
    if (v12) {

    }
    if (*p_networkURL
      || (id v18 = AFSiriLogContextProxy, os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
      && (*(_DWORD *)buf = 136315138,
          id v35 = "-[ADSiriConnectionRemote init]",
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s _networkURL is set to nil", buf, 0xCu),
          *p_networkURL))
    {
      if (v10 && ![v7 connectionPolicyStatus])
      {
        id v15 = [v10 cname];
        size_t v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v10 host];
        }
        id v19 = v17;

        BOOL v20 = +[NSURLComponents componentsWithURL:*p_networkURL resolvingAgainstBaseURL:0];
        [v20 setHost:v19];
        uint64_t v21 = [v20 URL];
        v22 = (void *)*p_networkURL;
        void *p_networkURL = v21;

        size_t v11 = v19;
      }
    }
    unsigned __int8 v23 = [v10 type];
    v2->_BOOL connectByPOP = [v23 isEqualToString:SAConnectionPolicyTypePOPValue];

    unsigned __int8 v24 = [v10 connectionId];
    size_t v25 = (NSString *)[v24 copy];
    connectionId = v2->_connectionId;
    v2->_connectionId = v25;

    unsigned int v27 = [[ADPeerStreamConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.proxy" delegate:v2 listener:1];
    peerConnection = v2->_peerConnection;
    v2->_peerConnection = v27;

    id v29 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100302BDC;
    block[3] = &unk_10050E138;
    id v32 = v2;
    dispatch_async(v29, block);
  }
  return v2;
}

@end