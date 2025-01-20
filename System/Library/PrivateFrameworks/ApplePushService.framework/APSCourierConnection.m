@interface APSCourierConnection
- (APSCourierConnection)initWithEnvironment:(id)a3;
- (APSCourierConnectionDelegate)delegate;
- (BOOL)didPushCauseWake;
- (BOOL)didPushCauseWakeOnInterface:(int64_t)a3;
- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4;
- (BOOL)hasConnectionEstablishTimer;
- (BOOL)hasConnectionEstablishTimerOnInterface:(int64_t)a3;
- (BOOL)hasKeepAliveResponseTimerOnInterface:(int64_t)a3;
- (BOOL)hasOpenConnection;
- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3;
- (BOOL)informingOfWrite;
- (BOOL)isConnected;
- (BOOL)isConnectedOnInterface:(int64_t)a3;
- (BOOL)isConnectingOnInterface:(int64_t)a3;
- (BOOL)isDualChannelAllowed;
- (BOOL)isExpensiveToUseInterface:(int64_t)a3;
- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface;
- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3;
- (BOOL)isKeepAliveProxySupportedOnSocketOnInterface:(int64_t)a3;
- (BOOL)isPackedFormatOnInterface:(int64_t)a3;
- (BOOL)isSuspendedOnInterface:(int64_t)a3;
- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3;
- (BOOL)minimumIntervalFallbackEnabledOnInterface:(int64_t)a3;
- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6 onInterface:(int64_t)a7;
- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled;
- (BOOL)remainsConnectedWhenWWANSuspends;
- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9;
- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4;
- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4 withDisconnectReason:(unsigned int)a5;
- (BOOL)shouldClientScheduleReconnectDueToFailureOnInterface:(int64_t)a3;
- (BOOL)shouldConnectOnInterface:(int64_t)a3;
- (Class)tcpStreamClass;
- (NSDate)lastConnected;
- (NSDictionary)connectionDebugInfo;
- (NSString)ifname;
- (NSString)redirectHost;
- (NSString)tcpInfoDescription;
- (double)currentKeepAliveInterval;
- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3;
- (double)expensiveConditionsBackOffInterval;
- (double)keepAliveGracePeriodOnInterface:(int64_t)a3;
- (double)minimumKeepAliveInterval;
- (double)wifiKeepAliveEarlyFireConstantInterval;
- (id)TCPStreamWithEnvironment:(id)a3;
- (id)_currentStream;
- (id)connectionAttemptsInExpensiveConditions;
- (id)currentKeepAliveStateOnInterface:(int64_t)a3;
- (id)interfaceNameForInterface:(int64_t)a3;
- (id)objectForKey:(id)a3 onInterface:(int64_t)a4;
- (id)pcInterfaceMonitorNonCellular;
- (id)pcInterfaceMonitorOnInterface:(int64_t)a3;
- (id)pcInterfaceMonitorWWAN;
- (id)serverAddressForInterface:(int64_t)a3;
- (id)serverHostnameForInterface:(int64_t)a3;
- (id)serverIPAddressForInterface:(int64_t)a3;
- (id)serverPortForInterface:(int64_t)a3;
- (id)streamForInterface:(int64_t)a3;
- (id)tcpInfoDescriptionForInterface:(int64_t)a3;
- (id)usingCachedIPAddressOnInterface:(int64_t)a3;
- (int)currentGrowthStageOnInterface:(int64_t)a3;
- (int)lastKeepAliveActionOnInterface:(int64_t)a3;
- (int)nwInterfaceTypeForInterface:(int64_t)a3;
- (int64_t)_interfaceForConnectionManager:(id)a3;
- (int64_t)_interfaceForProtocolParser:(id)a3;
- (int64_t)_interfaceForStream:(id)a3;
- (int64_t)connectingInterface;
- (int64_t)interfaceConstraintForInterface:(int64_t)a3;
- (int64_t)lastAttemptedInterface;
- (int64_t)nextConnectionAttemptInterface;
- (int64_t)preferredInterface;
- (unint64_t)countConnectedInterfaces;
- (unint64_t)countOfGrowthActionsOnInterface:(int64_t)a3;
- (unint64_t)countOpenConnections;
- (unint64_t)maxExpensiveConditionsConnectionAttempts;
- (unint64_t)tcpStream:(id)a3 dataReceived:(id)a4 isWakingMessage:(BOOL)a5;
- (unsigned)disconnectReason;
- (unsigned)redirectCount;
- (void)__updateConnectionManagerKeepAliveIntervalNonCellular;
- (void)__updateConnectionManagerKeepAliveIntervalWWAN;
- (void)_connectionEstablishTimerFired:(id)a3;
- (void)_handleDualModeState;
- (void)_keepAliveResponseTimerFired:(id)a3;
- (void)_prepareToParseOutgoingDataOnInterface:(int64_t)a3;
- (void)_updateConnectionManagerKeepAliveIntervalNonCellular;
- (void)_updateConnectionManagerKeepAliveIntervalWWAN;
- (void)clearConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)clearKeepAliveResponseTimerOnInterface:(int64_t)a3;
- (void)clearRedirectCount;
- (void)closeStreamForInterface:(int64_t)a3;
- (void)connectToEnvironment:(id)a3 onInterface:(int64_t)a4 allowedInterfaceConstraint:(int64_t)a5 useAlternatePort:(BOOL)a6 keepAliveProxyMode:(unint64_t)a7;
- (void)connectionManager:(id)a3 handleEvent:(int)a4 context:(id)a5;
- (void)dealloc;
- (void)holdPowerAssertionUntilStreamsQuiesce;
- (void)incrementRedirectCount;
- (void)protocolParser:(id)a3 receiveAPNSPackError:(id)a4;
- (void)resumeManagerWithAction:(int)a3 onInterface:(int64_t)a4;
- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8;
- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 onInterface:(int64_t)a17;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 onInterface:(int64_t)a13;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 onInterface:(int64_t)a12;
- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 onInterface:(int64_t)a10;
- (void)sendFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4 onInterface:(int64_t)a5;
- (void)sendFlushResponseMessageWithPaddingLength:(unint64_t)a3 onInterface:(int64_t)a4;
- (void)sendKeepAliveMessageWithMetadata:(id)a3 onInterface:(int64_t)a4;
- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6;
- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7;
- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3;
- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6;
- (void)sendSetActiveIntervalMessageWithInterval:(unsigned int)a3 onInterface:(int64_t)a4;
- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 onInterface:(int64_t)a9;
- (void)setConnectionAttemptsInExpensiveConditions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnectReason:(unsigned int)a3;
- (void)setEnableNonCellularOnConnectionManager:(BOOL)a3;
- (void)setExpensiveConditionsBackOffInterval:(double)a3;
- (void)setInformingOfWrite:(BOOL)a3;
- (void)setIsConnecting:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setIsDualChannelAllowed:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setKeepAliveConfiguration:(unint64_t)a3;
- (void)setKeepAliveGracePeriod:(double)a3 onInterface:(int64_t)a4;
- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setLastConnected:(id)a3;
- (void)setMaxExpensiveConditionsConnectionAttempts:(unint64_t)a3;
- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4 onInterface:(int64_t)a5;
- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3;
- (void)setRedirectHost:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setServerStatsExpectedKeepAlive:(double)a3 onInterface:(int64_t)a4;
- (void)setServerStatsMaxKeepAlive:(double)a3 onInterface:(int64_t)a4;
- (void)setServerStatsMinKeepAlive:(double)a3 onInterface:(int64_t)a4;
- (void)setStream:(id)a3 forInterface:(int64_t)a4;
- (void)setUsingCachedIPAddress:(id)a3 onInterface:(int64_t)a4;
- (void)setUsingServerStatsAggressively:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setWifiKeepAliveEarlyFireConstantInterval:(double)a3;
- (void)startConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4;
- (void)stopAndResetManagerOnInterface:(int64_t)a3;
- (void)stopManagerOnInterface:(int64_t)a3;
- (void)stopManagers;
- (void)tcpStream:(id)a3 errorOccured:(id)a4;
- (void)tcpStream:(id)a3 hasDeterminedServerHostname:(id)a4;
- (void)tcpStream:(id)a3 receivedServerBag:(id)a4;
- (void)tcpStreamDidFailToFindKeepAliveProxyInterface:(id)a3;
- (void)tcpStreamDidFailToForceKeepAliveProxyInterface:(id)a3;
- (void)tcpStreamDidFailToObtainKeepAliveProxy:(id)a3 willRetry:(BOOL)a4;
- (void)tcpStreamEndEncountered:(id)a3 withReason:(unsigned int)a4;
- (void)tcpStreamHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 maxEncoderTableSize:(unint64_t)a6 maxDecoderTableSize:(unint64_t)a7 secureHandshakeEnabled:(BOOL)a8;
- (void)updateConnectionManagerKeepAliveIntervalOnInterface:(int64_t)a3;
- (void)writeDataInBackground:(id)a3;
- (void)writeDataInBackground:(id)a3 onInterface:(int64_t)a4;
@end

@implementation APSCourierConnection

- (APSCourierConnection)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)APSCourierConnection;
  v5 = [(APSCourierConnection *)&v26 init];
  v6 = v5;
  if (v5)
  {
    v5->_lastAttemptedInterface = 3;
    v7 = [v4 domain];
    v8 = (NSString *)[v7 copy];
    domain = v6->_domain;
    v6->_domain = v8;

    unint64_t v10 = 0;
    v6->_redirectCount = 0;
    v6->_disconnectReason = 0;
    uint64_t v25 = APSBundleIdentifier;
    connectionManagers = v6->_connectionManagers;
    char v12 = 1;
    do
    {
      id v14 = objc_alloc((Class)NSString);
      v15 = [v4 domain];
      v16 = sub_100040D80(v10);
      id v17 = [v14 initWithFormat:@"%@(%@)-%@", v25, v15, v16];

      id v18 = [v4 priority];
      int v19 = v12 & 1;
      uint64_t v20 = 2;
      if ((v12 & 1) == 0) {
        uint64_t v20 = 3;
      }
      if (v18) {
        BOOL v21 = v20;
      }
      else {
        BOOL v21 = (v12 & 1) == 0;
      }
      v22 = (PCConnectionManager *)[objc_alloc((Class)PCConnectionManager) initWithConnectionClass:0 interfaceIdentifier:v12 & 1 guidancePriority:v21 delegate:v6 serviceIdentifier:v17];
      v23 = connectionManagers[v10];
      connectionManagers[v10] = v22;

      [(PCConnectionManager *)connectionManagers[v10] setOnlyAllowedStyle:0];
      char v12 = 0;
      unint64_t v10 = 1;
    }
    while (v19);
    v6->_maxExpensiveConditionsConnectionAttempts = 3;
    v6->_expensiveConditionsBackOffInterval = 600.0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2 = 0;
  streams = self->_streams;
  parsers = self->_parsers;
  usingCachedIPAddress = self->_usingCachedIPAddress;
  connectionManagers = self->_connectionManagers;
  keepAliveTimers = self->_keepAliveTimers;
  keepAlivePowerAssertions = self->_keepAlivePowerAssertions;
  connectionEstablishTimers = self->_connectionEstablishTimers;
  connectionEstablishPowerAssertions = self->_connectionEstablishPowerAssertions;
  char v11 = 1;
  do
  {
    char v12 = v11;
    [(APSTCPStream *)streams[v2] setDelegate:0];
    v13 = streams[v2];
    streams[v2] = 0;

    id v14 = parsers[v2];
    parsers[v2] = 0;

    v15 = usingCachedIPAddress[v2];
    usingCachedIPAddress[v2] = 0;

    [(PCConnectionManager *)connectionManagers[v2] stopManager];
    v16 = keepAliveTimers[v2];
    if (v16) {
      [(NSTimer *)v16 invalidate];
    }
    id v17 = keepAlivePowerAssertions[v2];
    if (v17)
    {
      keepAlivePowerAssertions[v2] = 0;
    }
    id v18 = connectionEstablishTimers[v2];
    if (v18) {
      [(NSTimer *)v18 invalidate];
    }
    int v19 = connectionEstablishPowerAssertions[v2];
    if (v19)
    {
      connectionEstablishPowerAssertions[v2] = 0;
    }
    char v11 = 0;
    uint64_t v2 = 1;
  }
  while ((v12 & 1) != 0);
  redirectHost = self->_redirectHost;
  self->_redirectHost = 0;

  v22.receiver = self;
  v22.super_class = (Class)APSCourierConnection;
  [(APSCourierConnection *)&v22 dealloc];
}

- (void)setStream:(id)a3 forInterface:(int64_t)a4
{
}

- (id)streamForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    id v4 = self->_streams[a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (int64_t)_interfaceForProtocolParser:(id)a3
{
  if (self->_parsers[1] == a3) {
    return 1;
  }
  if (self->_parsers[0] == a3) {
    return 0;
  }
  return 3;
}

- (void)_prepareToParseOutgoingDataOnInterface:(int64_t)a3
{
  if (!self->_informingOfWrite)
  {
    v5 = -[APSCourierConnection streamForInterface:](self, "streamForInterface:");
    unsigned int v6 = [v5 isConnected];

    if (v6)
    {
      self->_informingOfWrite = 1;
      v7 = [(APSCourierConnection *)self delegate];
      [v7 courierConnection:self aboutToWriteDataOnConnectedInterface:a3];

      self->_informingOfWrite = 0;
    }
  }
}

- (int64_t)_interfaceForStream:(id)a3
{
  if (self->_streams[1] == a3) {
    return 1;
  }
  if (self->_streams[0] == a3) {
    return 0;
  }
  return 3;
}

- (int64_t)_interfaceForConnectionManager:(id)a3
{
  if (self->_connectionManagers[1] == a3) {
    return 1;
  }
  if (self->_connectionManagers[0] == a3) {
    return 0;
  }
  return 3;
}

- (void)incrementRedirectCount
{
}

- (void)clearRedirectCount
{
  self->_redirectCount = 0;
}

- (unsigned)redirectCount
{
  return self->_redirectCount;
}

- (id)usingCachedIPAddressOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    id v4 = self->_usingCachedIPAddress[a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setUsingCachedIPAddress:(id)a3 onInterface:(int64_t)a4
{
  unsigned int v6 = (NSString *)a3;
  if (a4 >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_100040D80(a4);
    int v11 = 138412802;
    char v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked to set setCachedIPAddress %@ on invalid interface %@", (uint8_t *)&v11, 0x20u);
  }
  usingCachedIPAddress = self->_usingCachedIPAddress;
  if (usingCachedIPAddress[a4] != v6)
  {
    v9 = (NSString *)[(NSString *)v6 copy];
    unint64_t v10 = usingCachedIPAddress[a4];
    usingCachedIPAddress[a4] = v9;
  }
}

- (BOOL)isConnectingOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_isConnecting[a3];
}

- (void)setIsConnecting:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  if (a4 < 2)
  {
    self->_isConnecting[a4] = a3;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    v8 = sub_100040D80(a4);
    int v9 = 138412802;
    unint64_t v10 = self;
    __int16 v11 = 2112;
    CFStringRef v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked to set isConnecting %@ on invalid interface %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setIsSuspended:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  if (a4 < 2)
  {
    int v9 = self->_streams[a4];
    -[APSTCPStream setIsSuspended:](v9, "setIsSuspended:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    v8 = sub_100040D80(a4);
    int v10 = 138412802;
    __int16 v11 = self;
    __int16 v12 = 2112;
    CFStringRef v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked to set isSuspended %@ on invalid interface %@", (uint8_t *)&v10, 0x20u);
  }
}

- (BOOL)isSuspendedOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return [(APSTCPStream *)self->_streams[a3] isSuspended];
  }
  else {
    return 0;
  }
}

- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3
{
  if (self->_remainsConnectedWhenWWANSuspends != a3)
  {
    self->_BOOL remainsConnectedWhenWWANSuspends = a3;
    -[PCConnectionManager setAlwaysWantsInterfaceChangeCallbacks:](self->_connectionManagers[0], "setAlwaysWantsInterfaceChangeCallbacks:");
    id v4 = self->_connectionManagers[1];
    BOOL remainsConnectedWhenWWANSuspends = self->_remainsConnectedWhenWWANSuspends;
    [(PCConnectionManager *)v4 setAlwaysWantsInterfaceChangeCallbacks:remainsConnectedWhenWWANSuspends];
  }
}

- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3
{
  if (self->_powerOptimizationsForExpensiveNetworkingDisabled != a3)
  {
    self->_BOOL powerOptimizationsForExpensiveNetworkingDisabled = a3;
    -[PCConnectionManager setPowerOptimizationsForExpensiveNetworkingDisabled:](self->_connectionManagers[0], "setPowerOptimizationsForExpensiveNetworkingDisabled:");
    id v4 = self->_connectionManagers[1];
    BOOL powerOptimizationsForExpensiveNetworkingDisabled = self->_powerOptimizationsForExpensiveNetworkingDisabled;
    [(PCConnectionManager *)v4 setPowerOptimizationsForExpensiveNetworkingDisabled:powerOptimizationsForExpensiveNetworkingDisabled];
  }
}

- (void)setWifiKeepAliveEarlyFireConstantInterval:(double)a3
{
  if (self->_wifiKeepAliveEarlyFireConstantInterval != a3)
  {
    self->_wifiKeepAliveEarlyFireConstantInterval = a3;
    -[PCConnectionManager setNonCellularEarlyFireConstantInterval:](self->_connectionManagers[1], "setNonCellularEarlyFireConstantInterval:");
  }
}

- (void)setKeepAliveConfiguration:(unint64_t)a3
{
  double v4 = 60.0;
  if (a3 != 1) {
    double v4 = 0.0;
  }
  if (a3) {
    double v5 = v4;
  }
  else {
    double v5 = 300.0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    CFStringRef v7 = "-[APSCourierConnection setKeepAliveConfiguration:]";
    __int16 v8 = 2048;
    double v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = 0x417E133800000000;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: interval %f timeout %f", (uint8_t *)&v6, 0x20u);
  }
  [(PCConnectionManager *)self->_connectionManagers[1] setKeepAliveOverrideOnInterface:0 interval:v5 timeout:31536000.0];
}

- (id)connectionAttemptsInExpensiveConditions
{
  return self->_connectionAttemptsInExpensiveConditions;
}

- (void)setConnectionAttemptsInExpensiveConditions:(id)a3
{
  double v5 = (NSMutableArray *)a3;
  connectionAttemptsInExpensiveConditions = self->_connectionAttemptsInExpensiveConditions;
  p_connectionAttemptsInExpensiveConditions = &self->_connectionAttemptsInExpensiveConditions;
  if (connectionAttemptsInExpensiveConditions != v5)
  {
    __int16 v8 = v5;
    objc_storeStrong((id *)p_connectionAttemptsInExpensiveConditions, a3);
    double v5 = v8;
  }
}

- (BOOL)shouldConnectOnInterface:(int64_t)a3
{
  if (self->_powerOptimizationsForExpensiveNetworkingDisabled) {
    goto LABEL_19;
  }
  int v6 = [(APSCourierConnection *)self redirectHost];
  if (!v6)
  {
    if (![(APSCourierConnection *)self isExpensiveToUseInterface:a3]) {
      goto LABEL_19;
    }
    if (!self->_connectionAttemptsInExpensiveConditions)
    {
      CFStringRef v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      connectionAttemptsInExpensiveConditions = self->_connectionAttemptsInExpensiveConditions;
      self->_connectionAttemptsInExpensiveConditions = v7;
    }
    double v9 = +[NSMutableIndexSet indexSet];
    if ([(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions count])
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = +[NSDate date];
        __int16 v12 = [(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions objectAtIndexedSubscript:v10];
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        if (v14 < 0.0 || v14 > self->_expensiveConditionsBackOffInterval) {
          [v9 addIndex:v10];
        }
        ++v10;
      }
      while ((unint64_t)[(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions count] > v10);
    }
    [(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions removeObjectsAtIndexes:v9];
    v16 = +[NSDate date];
    if ((unint64_t)[(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions count] >= self->_maxExpensiveConditionsConnectionAttempts)
    {
      BOOL v20 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      objc_super v22 = sub_100040D80(a3);
      unint64_t maxExpensiveConditionsConnectionAttempts = self->_maxExpensiveConditionsConnectionAttempts;
      double expensiveConditionsBackOffInterval = self->_expensiveConditionsBackOffInterval;
      int v28 = 138413058;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v22;
      __int16 v32 = 2048;
      unint64_t v33 = maxExpensiveConditionsConnectionAttempts;
      __int16 v34 = 2048;
      double v35 = expensiveConditionsBackOffInterval;
      uint64_t v25 = "%@ Device is in bad cellular link quality and has exceeded max connection attempts allowed. Not attempting t"
            "o connect! {interface:%@, maxConnectionAttemptsAllowed:%lu, expensiveConditionsBackOffInterval:%f}";
    }
    else
    {
      if (![(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions count]
        || ([(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions lastObject],
            id v17 = objc_claimAutoreleasedReturnValue(),
            [v16 timeIntervalSinceDate:v17],
            double v19 = v18,
            v17,
            v19 > (double)(uint64_t)llround(self->_expensiveConditionsBackOffInterval/ (double)self->_maxExpensiveConditionsConnectionAttempts)))
      {
        [(NSMutableArray *)self->_connectionAttemptsInExpensiveConditions addObject:v16];
        BOOL v20 = 1;
LABEL_26:

        goto LABEL_20;
      }
      BOOL v20 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      objc_super v22 = sub_100040D80(a3);
      unint64_t v26 = self->_maxExpensiveConditionsConnectionAttempts;
      double v27 = self->_expensiveConditionsBackOffInterval;
      int v28 = 138413058;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v22;
      __int16 v32 = 2048;
      unint64_t v33 = v26;
      __int16 v34 = 2048;
      double v35 = v27;
      uint64_t v25 = "%@ Device is in bad cellular link quality and hasn't passed reconnect threshold. Not attempting to connect! "
            "{interface:%@, maxConnectionAttemptsAllowed:%lu, expensiveConditionsBackOffInterval:%f}";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v28, 0x2Au);

    BOOL v20 = 0;
    goto LABEL_26;
  }

LABEL_19:
  BOOL v20 = 1;
LABEL_20:
  return v20;
}

- (void)connectToEnvironment:(id)a3 onInterface:(int64_t)a4 allowedInterfaceConstraint:(int64_t)a5 useAlternatePort:(BOOL)a6 keepAliveProxyMode:(unint64_t)a7
{
  BOOL v7 = a6;
  id v11 = a3;
  if (a4 < 2)
  {
    if (!self->_isDualChannelAllowed)
    {
      int64_t v13 = [(APSCourierConnection *)self connectingInterface];
      if (v13 != 3)
      {
        unint64_t v14 = v13;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = sub_100040D80(v14);
          int v26 = 138412546;
          double v27 = self;
          __int16 v28 = 2112;
          v29 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ - INTEGRITY CHECK FAILED: closing the pending connection on %@", (uint8_t *)&v26, 0x16u);
        }
        [(APSCourierConnection *)self stopAndResetManagerOnInterface:v14];
        [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self disconnectStreamOnInterface:v14 withReason:1040];
      }
    }
    if (a4 == 1) {
      [(PCConnectionManager *)self->_connectionManagers[1] setEnableNonCellularConnections:1];
    }
    streams = self->_streams;
    id v17 = self->_streams[a4];
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v18)
      {
        double v19 = sub_100040D80(a4);
        BOOL v20 = streams[a4];
        int v26 = 138412802;
        double v27 = self;
        __int16 v28 = 2112;
        v29 = v19;
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ request to connect with preference %@ but we already have a stream %@", (uint8_t *)&v26, 0x20u);
      }
    }
    else
    {
      if (v18)
      {
        BOOL v21 = sub_100040D80(a4);
        int v26 = 138412546;
        double v27 = self;
        __int16 v28 = 2112;
        v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Opening stream on interface %@", (uint8_t *)&v26, 0x16u);
      }
      self->_lastAttemptedInterface = a4;
      objc_super v22 = +[PCCarrierBundleHelper helper];
      unsigned __int8 v23 = [v22 BOOLValueFromPushBundleForKey:APSForceKeepAliveV1Key error:0];

      if ((v23 & 1) == 0) {
        self->_keepAliveV2Supported[a4] = 1;
      }
      uint64_t v24 = [(APSCourierConnection *)self TCPStreamWithEnvironment:v11];
      uint64_t v25 = streams[a4];
      streams[a4] = (APSTCPStream *)v24;

      [(APSTCPStream *)streams[a4] setDelegate:self];
      [(APSTCPStream *)streams[a4] setForceWWANInterface:a4 == 0];
      [(APSTCPStream *)streams[a4] setUseAlternatePort:v7];
      [(APSTCPStream *)streams[a4] setRedirectHostname:self->_redirectHost];
      [(APSTCPStream *)streams[a4] setCachedIPAddress:self->_usingCachedIPAddress[a4]];
      [(APSTCPStream *)streams[a4] setRemainsConnectedWhenWWANSuspends:self->_remainsConnectedWhenWWANSuspends];
      [(APSTCPStream *)streams[a4] setAllowedInterfaceConstraint:a5];
      [(APSCourierConnection *)self setIsConnecting:1 onInterface:a4];
      [(APSTCPStream *)streams[a4] open];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = sub_100040D80(a4);
    int v26 = 138412546;
    double v27 = self;
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to connect with invalid interface %@", (uint8_t *)&v26, 0x16u);
  }
}

- (Class)tcpStreamClass
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    _os_feature_enabled_impl();
  }
  uint64_t v2 = objc_opt_class();
  return (Class)v2;
}

- (id)TCPStreamWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(-[APSCourierConnection tcpStreamClass](self, "tcpStreamClass")), "initWithEnvironment:", v4);

  return v5;
}

- (void)writeDataInBackground:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  if (a4 <= 1 && (BOOL v7 = self->_streams[a4]) != 0)
  {
    __int16 v8 = v7;
    [(APSTCPStream *)v7 writeDataInBackground:v6];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = sub_100040D80(a4);
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    int64_t v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Asked to write data but our stream for interface %@ is invalid", (uint8_t *)&v10, 0x16u);
  }
}

- (void)writeDataInBackground:(id)a3
{
  id v4 = a3;
  [(APSCourierConnection *)self writeDataInBackground:v4 onInterface:[(APSCourierConnection *)self preferredInterface]];
}

- (void)closeStreamForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    id v4 = (id *)(&self->super.isa + a3);
    [v4[2] close];
    [v4[2] setDelegate:0];
    id v5 = v4[2];
    v4[2] = 0;

    id v6 = v4[4];
    v4[4] = 0;
  }
}

- (void)stopManagers
{
  [(PCConnectionManager *)self->_connectionManagers[0] stopManager];
  uint64_t v3 = self->_connectionManagers[1];
  [(PCConnectionManager *)v3 stopManager];
}

- (void)stopManagerOnInterface:(int64_t)a3
{
  if (a3 == 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      __int16 v8 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to stopManager on None, stopping on all interfaces.", (uint8_t *)&v7, 0xCu);
    }
    [(PCConnectionManager *)self->_connectionManagers[0] stopManager];
    [(PCConnectionManager *)self->_connectionManagers[1] stopManager];
  }
  else if (a3 < 2)
  {
    id v6 = self->_connectionManagers[a3];
    [(PCConnectionManager *)v6 stopManager];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_100040D80(a3);
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to stopManager with invalid interface %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)stopAndResetManagerOnInterface:(int64_t)a3
{
  if (a3 == 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      __int16 v8 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to stopAndResetManager on None, stopping on all interfaces.", (uint8_t *)&v7, 0xCu);
    }
    [(PCConnectionManager *)self->_connectionManagers[0] stopAndResetManager];
    [(PCConnectionManager *)self->_connectionManagers[1] stopAndResetManager];
  }
  else if (a3 < 2)
  {
    id v6 = self->_connectionManagers[a3];
    [(PCConnectionManager *)v6 stopAndResetManager];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_100040D80(a3);
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to stopAndResetManager with invalid interface %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)pcInterfaceMonitorWWAN
{
  return [(APSCourierConnection *)self pcInterfaceMonitorOnInterface:0];
}

- (id)pcInterfaceMonitorNonCellular
{
  return [(APSCourierConnection *)self pcInterfaceMonitorOnInterface:1];
}

- (id)pcInterfaceMonitorOnInterface:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v5 = 1;
LABEL_5:
    id v6 = +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", v5, v3);
    return v6;
  }
  if (a3 == 1)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

- (BOOL)isExpensiveToUseInterface:(int64_t)a3
{
  uint64_t v3 = [(APSCourierConnection *)self pcInterfaceMonitorOnInterface:a3];
  unsigned __int8 v4 = [v3 isNetworkingPowerExpensiveToUse];

  return v4;
}

- (void)resumeManagerWithAction:(int)a3 onInterface:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a4 < 2)
  {
    if ([(APSTCPStream *)self->_streams[a4] isConnected]) {
      [(PCConnectionManager *)self->_connectionManagers[a4] setCurrentAddressFamily:[(APSTCPStream *)self->_streams[a4] ipAddressFamily] != 2];
    }
    unsigned int v8 = [(APSCourierConnection *)self keepAliveV2SupportedOnInterface:a4];
    __int16 v9 = self->_connectionManagers[a4];
    if (v8)
    {
      -[PCConnectionManager resumeManagerWithAction:forceGrow:](v9, "resumeManagerWithAction:forceGrow:", v5);
    }
    else
    {
      [(PCConnectionManager *)v9 resumeManagerWithAction:v5];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = sub_100040D80(a4);
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to resumeManager with action %d with invalid interface %@", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)setServerStatsMaxKeepAlive:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    unsigned int v8 = self->_connectionManagers[a4];
    -[PCConnectionManager setServerStatsMaxKeepAliveInterval:](v8, "setServerStatsMaxKeepAliveInterval:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = sub_100040D80(a4);
    int v9 = 138412802;
    int v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to set server stats max keep alive interval with interval %f with invalid interface %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setServerStatsMinKeepAlive:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    unsigned int v8 = self->_connectionManagers[a4];
    -[PCConnectionManager setServerStatsMinKeepAliveInterval:](v8, "setServerStatsMinKeepAliveInterval:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = sub_100040D80(a4);
    int v9 = 138412802;
    int v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to set server stats min keep alive interval with interval %f with invalid interface %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setServerStatsExpectedKeepAlive:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    unsigned int v8 = self->_connectionManagers[a4];
    -[PCConnectionManager setServerStatsExpectedKeepAliveInterval:](v8, "setServerStatsExpectedKeepAliveInterval:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = sub_100040D80(a4);
    int v9 = 138412802;
    int v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to set server stats expected keep alive interval with interval %f with invalid interface %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setUsingServerStatsAggressively:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  if (a4 < 2)
  {
    int v9 = self->_connectionManagers[a4];
    -[PCConnectionManager setUsingServerStatsAggressively:](v9, "setUsingServerStatsAggressively:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    unsigned int v8 = sub_100040D80(a4);
    int v10 = 138412802;
    __int16 v11 = self;
    __int16 v12 = 2112;
    CFStringRef v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to set using server stats aggressively %@ with invalid interface %@", (uint8_t *)&v10, 0x20u);
  }
}

- (double)keepAliveGracePeriodOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    CFStringRef v7 = self->_connectionManagers[a3];
    [(PCConnectionManager *)v7 keepAliveGracePeriod];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = sub_100040D80(a3);
      int v8 = 138412546;
      int v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get GracePeriod with invalid interface %@", (uint8_t *)&v8, 0x16u);
    }
    return 0.0;
  }
  return result;
}

- (void)setKeepAliveGracePeriod:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    int v8 = self->_connectionManagers[a4];
    -[PCConnectionManager setKeepAliveGracePeriod:](v8, "setKeepAliveGracePeriod:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = sub_100040D80(a4);
    int v9 = 138412802;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to setManager with GracePeriod:%f with invalid interface %@", (uint8_t *)&v9, 0x20u);
  }
}

- (BOOL)minimumIntervalFallbackEnabledOnInterface:(int64_t)a3
{
  return [(PCConnectionManager *)self->_connectionManagers[a3] minimumIntervalFallbackEnabled];
}

- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PCConnectionManager setMinimumIntervalFallbackEnabled:](self->_connectionManagers[0], "setMinimumIntervalFallbackEnabled:");
  BOOL v5 = self->_connectionManagers[1];
  [(PCConnectionManager *)v5 setMinimumIntervalFallbackEnabled:v3];
}

- (void)setEnableNonCellularOnConnectionManager:(BOOL)a3
{
}

- (void)updateConnectionManagerKeepAliveIntervalOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    if (a3)
    {
      [(APSCourierConnection *)self _updateConnectionManagerKeepAliveIntervalNonCellular];
    }
    else
    {
      [(APSCourierConnection *)self _updateConnectionManagerKeepAliveIntervalWWAN];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = sub_100040D80(a3);
    int v6 = 138412546;
    CFStringRef v7 = self;
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to update keepAliveInterval with invalid interface %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    self->_keepAliveV2Supported[a4] = a3;
    if (!a3)
    {
      [(APSCourierConnection *)self setKeepAliveGracePeriod:a4 onInterface:0.0];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = sub_100040D80(a4);
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to change keepAliveV2Supported with invalid interface %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_keepAliveV2Supported[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = sub_100040D80(a3);
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get keepAliveV2Supported with invalid interface %@", (uint8_t *)&v7, 0x16u);
  }
  return 1;
}

- (int)lastKeepAliveActionOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    int v7 = self->_connectionManagers[a3];
    return [(PCConnectionManager *)v7 lastProcessedAction];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = sub_100040D80(a3);
      int v8 = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get lastKeepAliveAction with invalid interface %@", (uint8_t *)&v8, 0x16u);
    }
    return 0;
  }
}

- (void)__updateConnectionManagerKeepAliveIntervalWWAN
{
  if ([(PCConnectionManager *)self->_connectionManagers[0] isRunning])
  {
    BOOL v3 = self->_connectionManagers[0];
    [(PCConnectionManager *)v3 resumeManagerWithAction:2];
  }
}

- (void)_updateConnectionManagerKeepAliveIntervalWWAN
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__updateConnectionManagerKeepAliveIntervalWWAN" object:0];
  [(APSCourierConnection *)self performSelector:"__updateConnectionManagerKeepAliveIntervalWWAN" withObject:0 afterDelay:5.0];
}

- (void)__updateConnectionManagerKeepAliveIntervalNonCellular
{
  if ([(PCConnectionManager *)self->_connectionManagers[1] isRunning])
  {
    BOOL v3 = self->_connectionManagers[1];
    [(PCConnectionManager *)v3 resumeManagerWithAction:2];
  }
}

- (void)_updateConnectionManagerKeepAliveIntervalNonCellular
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__updateConnectionManagerKeepAliveIntervalNonCellular" object:0];
  [(APSCourierConnection *)self performSelector:"__updateConnectionManagerKeepAliveIntervalNonCellular" withObject:0 afterDelay:5.0];
}

- (BOOL)hasConnectionEstablishTimer
{
  return self->_connectionEstablishTimers[0] || self->_connectionEstablishTimers[1] != 0;
}

- (BOOL)hasConnectionEstablishTimerOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_connectionEstablishTimers[a3] != 0;
}

- (void)startConnectionEstablishTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    [(APSCourierConnection *)self clearConnectionEstablishTimerOnInterface:a3];
    uint64_t v6 = APSBundleIdentifier;
    domain = self->_domain;
    int v8 = sub_100040D80(a3);
    __int16 v9 = +[NSString stringWithFormat:@"%@-connectionestablish-%@-%@", v6, domain, v8];

    __int16 v10 = [[APSPowerAssertion alloc] initWithName:v9 category:213 holdDuration:40.0];
    __int16 v11 = &self->super.isa + a3;
    Class v12 = v11[22];
    v11[22] = (Class)v10;

    uint64_t v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_connectionEstablishTimerFired:" selector:0 userInfo:0 repeats:30.0];
    Class v14 = v11[20];
    v11[20] = (Class)v13;
  }
}

- (void)clearConnectionEstablishTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    connectionEstablishTimers = self->_connectionEstablishTimers;
    uint64_t v6 = self->_connectionEstablishTimers[a3];
    if (v6)
    {
      [(NSTimer *)v6 invalidate];
      int v7 = connectionEstablishTimers[a3];
      connectionEstablishTimers[a3] = 0;
    }
    int v8 = self->_connectionEstablishPowerAssertions[a3];
    if (v8)
    {
      self->_connectionEstablishPowerAssertions[a3] = 0;
    }
  }
}

- (void)_connectionEstablishTimerFired:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  uint64_t v6 = 3;
  if (self->_connectionEstablishTimers[0] == (NSTimer *)v4) {
    uint64_t v6 = 0;
  }
  if (self->_connectionEstablishTimers[1] == (NSTimer *)v4) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v7 <= 1)
  {
    uint64_t v8 = v4;
    [(APSCourierConnection *)self clearConnectionEstablishTimerOnInterface:v7];
    uint64_t v4 = objc_opt_respondsToSelector();
    uint64_t v5 = v8;
    if (v4)
    {
      uint64_t v4 = (uint64_t)[(APSCourierConnectionDelegate *)self->_delegate courierConnection:self connectionEstablishTimerFiredOnInterface:v7];
      uint64_t v5 = v8;
    }
  }
  _objc_release_x1(v4, v5);
}

- (BOOL)hasKeepAliveResponseTimerOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_keepAliveTimers[a3] != 0;
}

- (void)startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 <= 1)
  {
    [(APSCourierConnection *)self clearKeepAliveResponseTimerOnInterface:a3];
    uint64_t v8 = APSBundleIdentifier;
    domain = self->_domain;
    __int16 v10 = sub_100040D80(a3);
    __int16 v11 = +[NSString stringWithFormat:@"%@-keepalive-%@-%@", v8, domain, v10];

    Class v12 = [(APSPowerAssertion_NoHold *)[APSPowerAssertion alloc] initWithName:v11 category:215];
    uint64_t v13 = &self->super.isa + a3;
    Class v14 = v13[18];
    v13[18] = (Class)v12;

    double v15 = 20.0;
    if (v4) {
      double v15 = 5.0;
    }
    uint64_t v16 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_keepAliveResponseTimerFired:" selector:0 userInfo:0 repeats:v15];
    Class v17 = v13[12];
    v13[12] = (Class)v16;
  }
}

- (void)clearKeepAliveResponseTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    keepAliveTimers = self->_keepAliveTimers;
    uint64_t v6 = self->_keepAliveTimers[a3];
    if (v6)
    {
      [(NSTimer *)v6 invalidate];
      unint64_t v7 = keepAliveTimers[a3];
      keepAliveTimers[a3] = 0;
    }
    uint64_t v8 = self->_keepAlivePowerAssertions[a3];
    if (v8)
    {
      self->_keepAlivePowerAssertions[a3] = 0;
    }
  }
}

- (void)_keepAliveResponseTimerFired:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  uint64_t v6 = 3;
  if (self->_keepAliveTimers[0] == (NSTimer *)v4) {
    uint64_t v6 = 0;
  }
  if (self->_keepAliveTimers[1] == (NSTimer *)v4) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v7 <= 1)
  {
    uint64_t v8 = v4;
    [(APSCourierConnection *)self clearKeepAliveResponseTimerOnInterface:v7];
    uint64_t v4 = objc_opt_respondsToSelector();
    uint64_t v5 = v8;
    if (v4)
    {
      uint64_t v4 = (uint64_t)[(APSCourierConnectionDelegate *)self->_delegate courierConnection:self keepAliveResponseTimerFiredOnInterface:v7];
      uint64_t v5 = v8;
    }
  }
  _objc_release_x1(v4, v5);
}

- (void)setObject:(id)a3 forKey:(id)a4 onInterface:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  if (v8 && a5 <= 1)
  {
    contexts = self->_contexts;
    __int16 v10 = contexts[a5];
    if (v14)
    {
      if (!v10)
      {
        __int16 v11 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
        Class v12 = contexts[a5];
        contexts[a5] = v11;

        __int16 v10 = contexts[a5];
      }
      [(NSMutableDictionary *)v10 setObject:v14 forKey:v8];
    }
    else
    {
      [(NSMutableDictionary *)v10 removeObjectForKey:v8];
      if (![(NSMutableDictionary *)contexts[a5] count])
      {
        uint64_t v13 = contexts[a5];
        contexts[a5] = 0;
      }
    }
  }
}

- (id)objectForKey:(id)a3 onInterface:(int64_t)a4
{
  if (a4 <= 1)
  {
    uint64_t v6 = -[NSMutableDictionary objectForKey:](self->_contexts[a4], "objectForKey:", a3, v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (APSCourierConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  uint64_t v5 = (APSCourierConnectionDelegate *)a3;
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  if (delegate != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_delegate, a3);
    uint64_t v5 = v8;
  }
}

- (id)_currentStream
{
  uint64_t v3 = [(APSCourierConnection *)self preferredInterface];
  if (v3 <= 1) {
    uint64_t v4 = self->_streams[v3];
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)serverAddressForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    uint64_t v5 = [(APSTCPStream *)self->_streams[a3] serverIPAddress];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)serverPortForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    uint64_t v4 = +[NSNumber numberWithUnsignedShort:[(APSTCPStream *)self->_streams[a3] serverPort]];
  }
  else
  {
    uint64_t v4 = &off_100137818;
  }
  return v4;
}

- (NSString)tcpInfoDescription
{
  uint64_t v2 = [(APSCourierConnection *)self _currentStream];
  uint64_t v3 = [v2 tcpInfoDescription];

  return (NSString *)v3;
}

- (id)tcpInfoDescriptionForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    uint64_t v5 = [(APSTCPStream *)self->_streams[a3] tcpInfoDescription];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (int64_t)nextConnectionAttemptInterface
{
  if ([(APSTCPStream *)self->_streams[1] isConnected]) {
    return 0;
  }
  if ([(APSTCPStream *)self->_streams[0] isConnected]) {
    return 1;
  }
  if (self->_streams[1]) {
    return 0;
  }
  if (self->_streams[0]) {
    return 1;
  }
  int64_t lastAttemptedInterface = self->_lastAttemptedInterface;
  int64_t v5 = 3;
  if (!lastAttemptedInterface) {
    int64_t v5 = 1;
  }
  if (lastAttemptedInterface == 1) {
    return 0;
  }
  else {
    return v5;
  }
}

- (int64_t)preferredInterface
{
  if ([(APSTCPStream *)self->_streams[1] isConnected]) {
    return 1;
  }
  if ([(APSTCPStream *)self->_streams[0] isConnected]) {
    return 0;
  }
  return 3;
}

- (int64_t)connectingInterface
{
  uint64_t v2 = 0;
  streams = self->_streams;
  int v4 = 1;
  int64_t v5 = 3;
  do
  {
    while (1)
    {
      int v6 = v4;
      unint64_t v7 = streams[v2];
      if (v7) {
        break;
      }
      int v4 = 0;
      uint64_t v2 = 1;
      if ((v6 & 1) == 0) {
        return v5;
      }
    }
    int64_t v8 = v2;
    unsigned int v9 = [(APSTCPStream *)v7 isConnected];
    int v4 = 0;
    uint64_t v2 = 1;
  }
  while ((v9 & v6 & 1) != 0);
  if (v9) {
    return 3;
  }
  else {
    return v8;
  }
}

- (int64_t)lastAttemptedInterface
{
  return self->_lastAttemptedInterface;
}

- (id)serverIPAddressForInterface:(int64_t)a3
{
  if (a3 <= 1 && (int64_t v5 = self->_streams[a3]) != 0)
  {
    int v6 = v5;
    unint64_t v7 = [(APSTCPStream *)v5 serverIPAddress];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = sub_100040D80(a3);
      int v10 = 138412546;
      __int16 v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked for serverIPAddress but we have no current stream for interface %@", (uint8_t *)&v10, 0x16u);
    }
    unint64_t v7 = 0;
  }
  return v7;
}

- (id)serverHostnameForInterface:(int64_t)a3
{
  if (a3 <= 1 && (int64_t v5 = self->_streams[a3]) != 0)
  {
    int v6 = v5;
    unint64_t v7 = [(APSTCPStream *)v5 serverHostname];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = sub_100040D80(a3);
      int v10 = 138412546;
      __int16 v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked for serverHostname but we have no current stream for interface %@", (uint8_t *)&v10, 0x16u);
    }
    unint64_t v7 = 0;
  }
  return v7;
}

- (id)interfaceNameForInterface:(int64_t)a3
{
  if (a3 <= 1 && (int64_t v5 = self->_streams[a3]) != 0)
  {
    int v6 = v5;
    unint64_t v7 = [(APSTCPStream *)v5 interfaceName];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = sub_100040D80(a3);
      int v10 = 138412546;
      __int16 v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked for interfaceName but we have no current stream for interface %@", (uint8_t *)&v10, 0x16u);
    }
    unint64_t v7 = 0;
  }
  return v7;
}

- (int)nwInterfaceTypeForInterface:(int64_t)a3
{
  uint64_t v3 = [(APSCourierConnection *)self interfaceNameForInterface:a3];
  int v4 = v3;
  if (v3)
  {
    [v3 UTF8String];
    int64_t v5 = nw_interface_create_with_name();
    nw_interface_type_t type = nw_interface_get_type(v5);
  }
  else
  {
    nw_interface_type_t type = nw_interface_type_other;
  }

  return type;
}

- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4
{
  return [(APSCourierConnection *)self setIsConnected:a3 onInterface:a4 withDisconnectReason:1010];
}

- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4 withDisconnectReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v7 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = sub_100040D80(a4);
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = self;
    __int16 v25 = 1024;
    *(_DWORD *)int v26 = v7;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v9;
    *(_WORD *)&v26[14] = 1024;
    *(_DWORD *)&v26[16] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Setting is connected %d on interface %@ with reason %u", buf, 0x22u);
  }
  if (a4 < 2)
  {
    if (!self->_isDualChannelAllowed
      && v7
      && [(APSCourierConnection *)self countConnectedInterfaces] >= 2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ - INTEGRITY CHECK FAILED: closing the old connections", buf, 0xCu);
      }
      unint64_t v14 = 0;
      char v15 = 1;
      *(void *)&long long v13 = 138412546;
      long long v22 = v13;
      do
      {
        char v16 = v15;
        if ([(APSTCPStream *)self->_streams[v14] isConnected])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            Class v17 = sub_100040D80(v14);
            *(_DWORD *)buf = v22;
            uint64_t v24 = self;
            __int16 v25 = 2112;
            *(void *)int v26 = v17;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ closing old connection on %@", buf, 0x16u);
          }
          [(APSCourierConnection *)self stopAndResetManagerOnInterface:v14];
          [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self disconnectStreamOnInterface:v14 withReason:5];
        }
        char v15 = 0;
        unint64_t v14 = 1;
      }
      while ((v16 & 1) != 0);
    }
    BOOL v18 = self->_streams[a4];
    unsigned __int8 v10 = [(APSTCPStream *)v18 isConnected];
    if (v18)
    {
      [(APSTCPStream *)v18 setIsConnected:v7];
    }
    else if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        double v19 = sub_100040D80(a4);
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = self;
        __int16 v25 = 2112;
        *(void *)int v26 = @"YES";
        *(_WORD *)&v26[8] = 2112;
        *(void *)&v26[10] = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Uh oh! Asked to set isConnected %@ on interface %@ but we have no stream for that interface!", buf, 0x20u);
      }
      goto LABEL_32;
    }
    if (a4 == 1 && !v7) {
      [(PCConnectionManager *)self->_connectionManagers[1] setEnableNonCellularConnections:0];
    }
    if (!v7)
    {
      BOOL v20 = +[NSDate date];
      [(APSCourierConnection *)self setLastConnected:v20];

      if (v5 <= 0x3E7 && ![(APSCourierConnection *)self disconnectReason]) {
        [(APSCourierConnection *)self setDisconnectReason:v5];
      }
    }
LABEL_32:

    return v10;
  }
  unsigned __int8 v10 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    __int16 v12 = sub_100040D80(a4);
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    *(void *)int v26 = v11;
    *(_WORD *)&v26[8] = 2112;
    *(void *)&v26[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: asked to set isConnected %@ on invalid interface %@", buf, 0x20u);

    return 0;
  }
  return v10;
}

- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4
{
  return [(APSTCPStream *)self->_streams[a4] generation] == a3;
}

- (BOOL)isConnected
{
  uint64_t v2 = 0;
  streams = self->_streams;
  char v4 = 1;
  do
  {
    unsigned int v5 = [(APSTCPStream *)streams[v2] isConnected];
    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v2 = 1;
  }
  while (!v5);
  return v5;
}

- (BOOL)isConnectedOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return [(APSTCPStream *)self->_streams[a3] isConnected];
  }
  else {
    return 0;
  }
}

- (unint64_t)countConnectedInterfaces
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  streams = self->_streams;
  char v5 = 1;
  do
  {
    char v6 = v5;
    unsigned int v7 = [(APSTCPStream *)streams[v2] isConnected];
    char v5 = 0;
    v3 += v7;
    uint64_t v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (unint64_t)countOpenConnections
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    unsigned int v7 = [(APSCourierConnection *)self hasOpenConnectionOnInterface:v3];
    char v5 = 0;
    v4 += v7;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  return v4;
}

- (BOOL)hasOpenConnection
{
  return self->_streams[0] || self->_streams[1] != 0;
}

- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_streams[a3] != 0;
}

- (BOOL)isKeepAliveProxySupportedOnSocketOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return [(APSTCPStream *)self->_streams[a3] isKeepAliveProxySupportedOnSocketInterface];
  }
  else {
    return 0;
  }
}

- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return [(APSTCPStream *)self->_streams[a3] isKeepAliveProxyConfigured];
  }
  else {
    return 0;
  }
}

- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface
{
  uint64_t v2 = 0;
  streams = self->_streams;
  char v4 = 1;
  do
  {
    unsigned int v5 = [(APSTCPStream *)streams[v2] isKeepAliveProxyConfigured];
    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v2 = 1;
  }
  while (!v5);
  return v5;
}

- (NSString)ifname
{
  uint64_t v3 = [(APSCourierConnection *)self preferredInterface];
  if (v3 > 1)
  {
    char v4 = 0;
  }
  else
  {
    char v4 = [(APSTCPStream *)self->_streams[v3] ifname];
  }
  return (NSString *)v4;
}

- (double)minimumKeepAliveInterval
{
  uint64_t v3 = [(APSCourierConnection *)self preferredInterface];
  connectionManagers = self->_connectionManagers;
  if (v3 < 2) {
    connectionManagers = &self->_connectionManagers[v3];
  }
  unsigned int v5 = *connectionManagers;
  [(PCConnectionManager *)v5 minimumKeepAliveInterval];
  return result;
}

- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3
{
  connectionManagers = self->_connectionManagers;
  if (a3 <= 1) {
    connectionManagers = &self->_connectionManagers[a3];
  }
  [(PCConnectionManager *)*connectionManagers currentKeepAliveInterval];
  return result;
}

- (id)currentKeepAliveStateOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    uint64_t v3 = [(PCConnectionManager *)self->_connectionManagers[a3] currentKeepAliveState];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown interface, not reporting a keep alive state.", v5, 2u);
    }
    uint64_t v3 = 0;
  }
  return v3;
}

- (int)currentGrowthStageOnInterface:(int64_t)a3
{
  connectionManagers = self->_connectionManagers;
  if (a3 <= 1) {
    connectionManagers = &self->_connectionManagers[a3];
  }
  return [(PCConnectionManager *)*connectionManagers currentGrowthStage];
}

- (BOOL)shouldClientScheduleReconnectDueToFailureOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return [(PCConnectionManager *)self->_connectionManagers[a3] shouldClientScheduleReconnectDueToFailure];
  }
  else {
    return 0;
  }
}

- (unint64_t)countOfGrowthActionsOnInterface:(int64_t)a3
{
  connectionManagers = self->_connectionManagers;
  if (a3 <= 1) {
    connectionManagers = &self->_connectionManagers[a3];
  }
  return (unint64_t)[(PCConnectionManager *)*connectionManagers countOfGrowthActions];
}

- (void)_handleDualModeState
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = @"YES";
    if (!self->_isDualChannelAllowed) {
      CFStringRef v3 = @"NO";
    }
    int v6 = 138412546;
    unsigned int v7 = self;
    __int16 v8 = 2112;
    CFStringRef v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: handleDualModeState isDualChannelAllowed %@", (uint8_t *)&v6, 0x16u);
  }
  if (![(APSCourierConnection *)self isDualChannelAllowed])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      unsigned int v7 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ dual channel is no longer allowed", (uint8_t *)&v6, 0xCu);
    }
    if ([(APSTCPStream *)self->_streams[0] isConnected])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ WWAN is connected; to be consistent, closing the non-cellular connection",
          (uint8_t *)&v6,
          0xCu);
      }
      [(APSCourierConnection *)self stopAndResetManagerOnInterface:1];
      [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self disconnectStreamOnInterface:1 withReason:5];
    }
    if ([(APSTCPStream *)self->_streams[1] isConnected])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ NonCellular is connected; to be consistent, closing the wwan connection",
          (uint8_t *)&v6,
          0xCu);
      }
      [(APSCourierConnection *)self stopAndResetManagerOnInterface:0];
      [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self disconnectStreamOnInterface:0 withReason:5];
    }
    char v4 = self->_streams[0];
    if (v4)
    {
      if (![(APSTCPStream *)v4 isConnected]
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ WWAN is connecting; to be consistent, closing the non-cellular connection",
          (uint8_t *)&v6,
          0xCu);
      }
      [(APSCourierConnection *)self stopAndResetManagerOnInterface:1];
      [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self disconnectStreamOnInterface:1 withReason:5];
    }
    unsigned int v5 = self->_streams[1];
    if (v5)
    {
      if (![(APSTCPStream *)v5 isConnected]
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ NonCellular is connecting; to be consistent, closing the wwan connection",
          (uint8_t *)&v6,
          0xCu);
      }
      [(APSCourierConnection *)self stopAndResetManagerOnInterface:0];
      [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self disconnectStreamOnInterface:0 withReason:5];
    }
    if ([(PCConnectionManager *)self->_connectionManagers[0] isRunning])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ WWAN's connection manager is running. To be consistent, stopping WiFi's manager", (uint8_t *)&v6, 0xCu);
      }
      [(APSCourierConnection *)self stopAndResetManagerOnInterface:1];
    }
    if ([(PCConnectionManager *)self->_connectionManagers[1] isRunning])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ WiFi's connection manager is running. To be consistent, stopping WWAN's manager", (uint8_t *)&v6, 0xCu);
      }
      [(APSCourierConnection *)self stopAndResetManagerOnInterface:0];
    }
  }
}

- (void)setIsDualChannelAllowed:(BOOL)a3
{
  if (self->_isDualChannelAllowed != a3) {
    self->_isDualChannelAllowed = a3;
  }
  [(APSCourierConnection *)self _handleDualModeState];
}

- (BOOL)isDualChannelAllowed
{
  return self->_isDualChannelAllowed;
}

- (BOOL)didPushCauseWake
{
  uint64_t v2 = 0;
  streams = self->_streams;
  int v4 = 1;
  do
  {
    while (1)
    {
      int v5 = v4;
      if (objc_opt_respondsToSelector()) {
        break;
      }
      int v4 = 0;
      BOOL result = 0;
      uint64_t v2 = 1;
      if ((v5 & 1) == 0) {
        return result;
      }
    }
    BOOL result = [(APSTCPStream *)streams[v2] didPushCauseWake];
    if (result) {
      break;
    }
    int v4 = 0;
    uint64_t v2 = 1;
  }
  while (((v5 ^ 1) & 1) == 0);
  return result;
}

- (BOOL)didPushCauseWakeOnInterface:(int64_t)a3
{
  if (a3 > 1) {
    return 0;
  }
  streams = self->_streams;
  return (objc_opt_respondsToSelector() & 1) != 0 && [(APSTCPStream *)streams[a3] didPushCauseWake];
}

- (int64_t)interfaceConstraintForInterface:(int64_t)a3
{
  if (a3 <= 1 && (CFStringRef v3 = self->_streams[a3]) != 0) {
    return [(APSTCPStream *)v3 interfaceConstraint];
  }
  else {
    return 0;
  }
}

- (void)holdPowerAssertionUntilStreamsQuiesce
{
  uint64_t v2 = 0;
  streams = self->_streams;
  char v4 = 1;
  do
  {
    char v5 = v4;
    if (objc_opt_respondsToSelector()) {
      [(APSTCPStream *)streams[v2] holdPowerAssertionUntilStreamQuiesces];
    }
    char v4 = 0;
    uint64_t v2 = 1;
  }
  while ((v5 & 1) != 0);
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 onInterface:(int64_t)a13
{
  id v17 = a11;
  id v18 = a10;
  id v27 = a9;
  id v19 = a8;
  id v26 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a13];
  BOOL v20 = self->_parsers[a13];
  BOOL v21 = [(APSCourierConnection *)self streamForInterface:a6];
  id v22 = [v21 interfaceConstraint];
  unsigned __int8 v23 = [(APSCourierConnection *)self lastConnected];
  LODWORD(v25) = [(APSCourierConnection *)self disconnectReason];
  LOBYTE(v24) = a12;
  id v31 = [(APSProtocolParser *)v20 copyConnectMessageWithToken:v26 state:a4 presenceFlags:a5 interface:a6 interfaceConstraint:v22 activeInterval:a7 metadata:v19 certificates:v27 nonce:v18 signature:v17 redirectCount:v24 lastConnected:v23 disconnectReason:v25];

  [(APSCourierConnection *)self writeDataInBackground:v31 onInterface:a13];
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 onInterface:(int64_t)a12
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a12];
  unsigned __int8 v23 = self->_parsers[a12];
  uint64_t v24 = [(APSCourierConnection *)self lastConnected];
  LODWORD(v26) = [(APSCourierConnection *)self disconnectReason];
  LOBYTE(v25) = a11;
  id v29 = [(APSProtocolParser *)v23 copyConnectMessageWithToken:v22 state:a4 presenceFlags:a5 metadata:v21 certificates:v20 nonce:v19 signature:v18 hostCertificateInfo:v17 redirectCount:v25 lastConnected:v24 disconnectReason:v26];

  [(APSCourierConnection *)self writeDataInBackground:v29 onInterface:a12];
}

- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 onInterface:(int64_t)a17
{
  id v24 = a16;
  id v25 = a11;
  id v26 = a10;
  id v48 = a9;
  id v27 = a8;
  id v28 = a7;
  id v29 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a17];
  __int16 v30 = &self->super.isa + a17;
  v50 = v28;
  if (v30[15])
  {
    unsigned int v31 = a6;
    v41 = v24;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = sub_100040D80(a4);
      *(_DWORD *)buf = 138412546;
      v53 = self;
      __int16 v54 = 2112;
      v55 = v32;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ copy presence message with APSProtocolSerialPresenceFlagEnableCachedIP on interface %@", buf, 0x16u);
    }
    unint64_t v33 = self->_parsers[a17];
    v40 = [(APSCourierConnection *)self streamForInterface:a4];
    id v34 = [v40 interfaceConstraint];
    v47 = [(APSCourierConnection *)self lastConnected];
    LODWORD(v39) = [(APSCourierConnection *)self disconnectReason];
    LOBYTE(v38) = a12;
    id v35 = -[APSProtocolParser copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:](v33, "copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:", v29, a4, v34, v31 | 0x100, a5, v50, a13, a14, a15, v27, v48, v26, v25, v38, v41,
            v47,
            v39);

    v36 = v40;
  }
  else
  {
    Class v43 = v30[4];
    v45 = [(APSCourierConnection *)self streamForInterface:a4];
    id v42 = [v45 interfaceConstraint];
    v44 = [(APSCourierConnection *)self lastConnected];
    LODWORD(v39) = [(APSCourierConnection *)self disconnectReason];
    v37 = v24;
    LOBYTE(v38) = a12;
    id v35 = -[objc_class copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:](v43, "copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:", v29, a4, v42, a6, a5, v50, a13, a14, a15, v27, v48, v26, v25, v38, v24,
            v44,
            v39);

    v36 = v45;
  }

  [(APSCourierConnection *)self writeDataInBackground:v35 onInterface:a17];
  [(APSCourierConnection *)self setDisconnectReason:0];
}

- (void)sendFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4 onInterface:(int64_t)a5
{
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a5];
  id v9 = [(APSProtocolParser *)self->_parsers[a5] copyFlushMessageWithWantPaddingLength:a3 paddingLength:a4];
  [(APSCourierConnection *)self writeDataInBackground:v9 onInterface:a5];
}

- (void)sendFlushResponseMessageWithPaddingLength:(unint64_t)a3 onInterface:(int64_t)a4
{
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a4];
  id v7 = [(APSProtocolParser *)self->_parsers[a4] copyFlushResponseMessageWithPaddingLength:a3];
  [(APSCourierConnection *)self writeDataInBackground:v7 onInterface:a4];
}

- (void)sendSetActiveIntervalMessageWithInterval:(unsigned int)a3 onInterface:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a4];
  id v7 = [(APSProtocolParser *)self->_parsers[a4] copySetActiveIntervalMessageWithInterval:v5];
  [(APSCourierConnection *)self writeDataInBackground:v7 onInterface:a4];
}

- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a5];
  id v9 = [(APSProtocolParser *)self->_parsers[a5] copySetActiveState:v7 forInterval:v6];
  [(APSCourierConnection *)self writeDataInBackground:v9 onInterface:a5];
}

- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a6];
  id v12 = [(APSProtocolParser *)self->_parsers[a6] copyMessageAcknowledgeMessageWithResponse:a3 messageId:v11 token:v10];

  [(APSCourierConnection *)self writeDataInBackground:v12 onInterface:a6];
}

- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3
{
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:");
  id v5 = [(APSProtocolParser *)self->_parsers[a3] copyMessageTransportAcknowledgeMessage];
  [(APSCourierConnection *)self writeDataInBackground:v5 onInterface:a3];
}

- (void)sendKeepAliveMessageWithMetadata:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a4];
  id v7 = [(APSProtocolParser *)self->_parsers[a4] copyKeepAliveMessageWithMetadata:v6];

  [(APSCourierConnection *)self writeDataInBackground:v7 onInterface:a4];
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 onInterface:(int64_t)a9
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a9];
  id v18 = [(APSProtocolParser *)self->_parsers[a9] copyTokenGenerateMessageWithTopicHash:v17 baseToken:v16 appId:v11 expirationTTL:v10 vapidPublicKeyHash:v15 type:a8];

  [(APSCourierConnection *)self writeDataInBackground:v18 onInterface:a9];
}

- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a8];
  id v15 = [(APSProtocolParser *)self->_parsers[a8] copyPresenceTrackingRequestWithMessageID:a3 pushToken:v14 salt:a5 trackingFlag:v10 timestamp:a7];

  [(APSCourierConnection *)self writeDataInBackground:v15 onInterface:a8];
}

- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a7];
  id v15 = [(APSProtocolParser *)self->_parsers[a7] copyMessageTracingAckWithTopicHash:v14 status:v8 tracingUUID:v13 token:v12];

  [(APSCourierConnection *)self writeDataInBackground:v15 onInterface:a7];
}

- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 onInterface:(int64_t)a10
{
  id v11 = [(APSProtocolParser *)self->_parsers[a10] copyFilterMessageWithEnabledHashes:a3 ignoredHashes:a4 opportunisticHashes:a5 nonWakingHashes:a6 pausedHashes:a7 token:a8 version:a9];
  [(APSCourierConnection *)self writeDataInBackground:v11 onInterface:a10];
}

- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a9];
  id v19 = [(APSProtocolParser *)self->_parsers[a9] copyMessageWithTopicHash:v18 identifier:a4 payload:v17 token:v16 isPlistFormat:v9 lastRTT:v15];

  [(APSCourierConnection *)self writeDataInBackground:v19 onInterface:a9];
  return v19 != 0;
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a5];
  id v9 = [(APSProtocolParser *)self->_parsers[a5] copyTaskControlMessageWithInput:v8 messageId:a4];

  [(APSCourierConnection *)self writeDataInBackground:v9 onInterface:a5];
}

- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = sub_100040D80(a6);
    int v14 = 138412546;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Sending pubsub message on interface %@", (uint8_t *)&v14, 0x16u);
  }
  [(APSCourierConnection *)self _prepareToParseOutgoingDataOnInterface:a6];
  id v13 = [(APSProtocolParser *)self->_parsers[a6] copyPubSubChannelListWithInput:v10 baseToken:v11 messageID:v7];
  [(APSCourierConnection *)self writeDataInBackground:v13 onInterface:a6];
}

- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6 onInterface:(int64_t)a7
{
  return [(APSProtocolParser *)self->_parsers[a7] parseMessage:a3 parameters:a4 isInvalid:a5 lengthParsed:a6];
}

- (BOOL)isPackedFormatOnInterface:(int64_t)a3
{
  return [(APSProtocolParser *)self->_parsers[a3] isPackedFormat];
}

- (void)connectionManager:(id)a3 handleEvent:(int)a4 context:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  delegate = self->_delegate;
  id v9 = a5;
  id v10 = a3;
  [(APSCourierConnectionDelegate *)delegate courierConnection:self connectionManager:v10 handleEvent:v5 context:v9 onInterface:[(APSCourierConnection *)self _interfaceForConnectionManager:v10]];
}

- (void)protocolParser:(id)a3 receiveAPNSPackError:(id)a4
{
  delegate = self->_delegate;
  id v7 = a4;
  [(APSCourierConnectionDelegate *)delegate courierConnection:self parserErrorMessage:v7 OnInterface:[(APSCourierConnection *)self _interfaceForProtocolParser:a3]];
}

- (unint64_t)tcpStream:(id)a3 dataReceived:(id)a4 isWakingMessage:(BOOL)a5
{
  BOOL v5 = a5;
  delegate = self->_delegate;
  id v9 = a4;
  id v10 = a3;
  int64_t v11 = [(APSCourierConnection *)self _interfaceForStream:v10];
  id v12 = [v10 generation];

  id v13 = [(APSCourierConnectionDelegate *)delegate courierConnection:self dataReceived:v9 onInterface:v11 withGeneration:v12 isWakingMessage:v5];
  return (unint64_t)v13;
}

- (void)tcpStreamEndEncountered:(id)a3 withReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  delegate = self->_delegate;
  int64_t v7 = [(APSCourierConnection *)self _interfaceForStream:a3];
  [(APSCourierConnectionDelegate *)delegate courierConnection:self streamEndedOnInterface:v7 withReason:v4];
}

- (void)tcpStream:(id)a3 errorOccured:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog networking];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    id v10 = [v6 tcpInfoDescription];
    if (v10)
    {
      int64_t v11 = +[APSLog networking];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000CAFB0((uint64_t)v10, v11);
      }
    }
  }
  [(APSCourierConnectionDelegate *)self->_delegate courierConnection:self errorOccured:v7 onInterface:[(APSCourierConnection *)self _interfaceForStream:v6]];
}

- (void)tcpStream:(id)a3 receivedServerBag:(id)a4
{
}

- (void)tcpStream:(id)a3 hasDeterminedServerHostname:(id)a4
{
  delegate = self->_delegate;
  id v7 = a4;
  [(APSCourierConnectionDelegate *)delegate courierConnection:self hasDeterminedServerHostname:v7 onInterface:[(APSCourierConnection *)self _interfaceForStream:a3]];
}

- (void)tcpStreamHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 maxEncoderTableSize:(unint64_t)a6 maxDecoderTableSize:(unint64_t)a7 secureHandshakeEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v18 = a4;
  int64_t v14 = [(APSCourierConnection *)self _interfaceForStream:a3];
  id v15 = objc_alloc_init(APSProtocolParser);
  __int16 v16 = &self->super.isa + v14;
  Class v17 = v16[4];
  v16[4] = (Class)v15;

  [(objc_class *)v16[4] setDelegate:self];
  [(objc_class *)v16[4] setIsPackedFormat:v11 maxEncoderTableSize:a6 maxDecoderTableSize:a7 interface:v14];
  [(APSCourierConnectionDelegate *)self->_delegate courierConnectionHasConnected:self context:v18 enabledPackedFormat:v11 secureHandshakeEnabled:v8 onInterface:v14];
}

- (double)currentKeepAliveInterval
{
  [(APSCourierConnectionDelegate *)self->_delegate currentKeepAliveInterval];
  return result;
}

- (void)tcpStreamDidFailToForceKeepAliveProxyInterface:(id)a3
{
  delegate = self->_delegate;
  int64_t v5 = [(APSCourierConnection *)self _interfaceForStream:a3];
  [(APSCourierConnectionDelegate *)delegate courierConnection:self failedToForceKeepAliveProxyOnInterface:v5];
}

- (void)tcpStreamDidFailToObtainKeepAliveProxy:(id)a3 willRetry:(BOOL)a4
{
  delegate = self->_delegate;
  int64_t v6 = -[APSCourierConnection _interfaceForStream:](self, "_interfaceForStream:", a3, a4);
  [(APSCourierConnectionDelegate *)delegate courierConnection:self failedToObtainKeepAliveProxyOnInterface:v6];
}

- (void)tcpStreamDidFailToFindKeepAliveProxyInterface:(id)a3
{
  delegate = self->_delegate;
  int64_t v5 = [(APSCourierConnection *)self _interfaceForStream:a3];
  [(APSCourierConnectionDelegate *)delegate courierConnection:self failedToFindKeepAliveProxyOnInterface:v5];
}

- (NSDictionary)connectionDebugInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [(APSTCPStream *)self->_streams[0] connectionDebugInfo];
  int64_t v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = @"N/A";
  }
  id v7 = sub_100040D80(0);
  [v3 setObject:v6 forKeyedSubscript:v7];

  uint64_t v8 = [(APSTCPStream *)self->_streams[1] connectionDebugInfo];
  BOOL v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"N/A";
  }
  BOOL v11 = sub_100040D80(1uLL);
  [v3 setObject:v10 forKeyedSubscript:v11];

  return (NSDictionary *)v3;
}

- (NSDate)lastConnected
{
  return self->_lastConnected;
}

- (void)setLastConnected:(id)a3
{
}

- (unsigned)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(unsigned int)a3
{
  self->_disconnectReason = a3;
}

- (NSString)redirectHost
{
  return self->_redirectHost;
}

- (void)setRedirectHost:(id)a3
{
}

- (BOOL)remainsConnectedWhenWWANSuspends
{
  return self->_remainsConnectedWhenWWANSuspends;
}

- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled
{
  return self->_powerOptimizationsForExpensiveNetworkingDisabled;
}

- (unint64_t)maxExpensiveConditionsConnectionAttempts
{
  return self->_maxExpensiveConditionsConnectionAttempts;
}

- (void)setMaxExpensiveConditionsConnectionAttempts:(unint64_t)a3
{
  self->_unint64_t maxExpensiveConditionsConnectionAttempts = a3;
}

- (double)expensiveConditionsBackOffInterval
{
  return self->_expensiveConditionsBackOffInterval;
}

- (void)setExpensiveConditionsBackOffInterval:(double)a3
{
  self->_double expensiveConditionsBackOffInterval = a3;
}

- (double)wifiKeepAliveEarlyFireConstantInterval
{
  return self->_wifiKeepAliveEarlyFireConstantInterval;
}

- (BOOL)informingOfWrite
{
  return self->_informingOfWrite;
}

- (void)setInformingOfWrite:(BOOL)a3
{
  self->_informingOfWrite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnected, 0);
  objc_storeStrong((id *)&self->_connectionAttemptsInExpensiveConditions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_connectionEstablishPowerAssertions[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_connectionEstablishTimers[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_keepAlivePowerAssertions[k + 1], 0);
  for (uint64_t m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_usingCachedIPAddress[m + 1], 0);
  for (uint64_t n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_keepAliveTimers[n + 1], 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_contexts[ii + 1], 0);
  for (juint64_t j = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_connectionManagers[jj + 1], 0);
  objc_storeStrong((id *)&self->_redirectHost, 0);
  for (kuint64_t k = 40; kk != 24; kk -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + kk), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + kk), 0);
    kk -= 8;
  }
  while (kk != 8);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end