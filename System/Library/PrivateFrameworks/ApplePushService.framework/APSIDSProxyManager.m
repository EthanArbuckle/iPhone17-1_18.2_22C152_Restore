@interface APSIDSProxyManager
+ (BOOL)shouldAssertWiFi;
+ (id)_idsSendQueue;
- (APSIDSProxyManager)init;
- (APSIDSProxyManagerDelegate)delegate;
- (BOOL)canUseProxy;
- (BOOL)isNearby;
- (NSMutableArray)deviceNotFoundMessageQueue;
- (NSString)recentDaemonAliveGuid;
- (PCPersistentTimer)deviceNotFoundTimer;
- (id)_recipientDevice;
- (void)__assertWiFiIfPossible;
- (void)_assertWiFiIfPossible;
- (void)_checkNearbyDevices:(id)a3;
- (void)_deviceNotFoundTimerFired;
- (void)_flushDeviceNotFoundMessageQueue;
- (void)_onQueue_checkNearbyDevices:(id)a3;
- (void)_retrieveAllDevicesAndDo:(id)a3;
- (void)_scheduleDeviceNotFoundTimer;
- (void)_sendDaemonAliveMessage;
- (void)dealloc;
- (void)removeAllPendingAPSMessages;
- (void)removeListener:(id)a3 environment:(id)a4;
- (void)sendAppTokenGenerateResponse:(id)a3 error:(id)a4 guid:(id)a5 environmentName:(id)a6;
- (void)sendExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4 guid:(id)a5 environmentName:(id)a6;
- (void)sendFilterWithEnvironmentName:(id)a3 guid:(id)a4 enabledTopics:(id)a5 ignoredTopics:(id)a6 opportunisticTopics:(id)a7 nonWakingTopics:(id)a8 topicSalts:(id)a9;
- (void)sendInactiveWithEnvironmentName:(id)a3 guid:(id)a4;
- (void)sendLargeMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendMessage:(id)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendMessageTracingStatus:(int)a3 topic:(id)a4 tracingUUID:(id)a5 token:(id)a6 guid:(id)a7 environmentName:(id)a8;
- (void)sendPresenceWithEnvironmentName:(id)a3 guid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12;
- (void)sendProxyIsConnected:(BOOL)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendProxyMessage:(id)a3;
- (void)sendProxyMessage:(id)a3 forAPSMessage:(id)a4;
- (void)sendPubSubChannelList:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6 environmentName:(id)a7 guid:(id)a8;
- (void)sendPubSubChannelListRequest:(int64_t)a3 environmentName:(id)a4 guid:(id)a5;
- (void)sendPubSubChannelListResponse:(id)a3 environmentName:(id)a4 guid:(id)a5;
- (void)sendPubSubUpdateMessage:(id)a3 connectionType:(int64_t)a4 environmentName:(id)a5 guid:(id)a6;
- (void)sendPushToken:(id)a3 guid:(id)a4 environmentName:(id)a5;
- (void)sendReceivedPush:(id)a3 forConnectionType:(int64_t)a4 generation:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7;
- (void)sendResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 connectionType:(int64_t)a6 generation:(unint64_t)a7 guid:(id)a8 environmentName:(id)a9;
- (void)sendReversePushResponse:(int64_t)a3 messageGUID:(id)a4 messageId:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 guid:(id)a9 environmentName:(id)a10;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceNotFoundMessageQueue:(id)a3;
- (void)setDeviceNotFoundTimer:(id)a3;
- (void)setListener:(id)a3 environment:(id)a4;
- (void)setRecentDaemonAliveGuid:(id)a3;
@end

@implementation APSIDSProxyManager

+ (id)_idsSendQueue
{
  if (qword_10015A928 != -1) {
    dispatch_once(&qword_10015A928, &stru_10012BDB8);
  }
  v2 = (void *)qword_10015A920;
  return v2;
}

- (APSIDSProxyManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)APSIDSProxyManager;
  v2 = [(APSIDSProxyManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = CUTWeakLinkClass();
    [(APSIDSProxyManager *)v2 _assertWiFiIfPossible];
    uint64_t v4 = +[NSMutableArray array];
    deviceNotFoundMessageQueue = v2->_deviceNotFoundMessageQueue;
    v2->_deviceNotFoundMessageQueue = (NSMutableArray *)v4;

    v6 = dispatch_get_global_queue(0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100080284;
    v8[3] = &unk_10012BDE0;
    uint64_t v10 = v3;
    v9 = v2;
    dispatch_async(v6, v8);
  }
  return v2;
}

- (void)dealloc
{
  [(APSIDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)APSIDSProxyManager;
  [(APSIDSProxyManager *)&v3 dealloc];
}

- (BOOL)canUseProxy
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL nearby = self->_nearby;
    int v6 = 138412802;
    if (nearby) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    v7 = self;
    __int16 v8 = 2112;
    CFStringRef v9 = @"NO";
    __int16 v10 = 2112;
    CFStringRef v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ canUseProxy: %@ isNearby: %@", (uint8_t *)&v6, 0x20u);
  }
  return 0;
}

- (void)setListener:(id)a3 environment:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  environmentToListener = self->_environmentToListener;
  if (!environmentToListener)
  {
    __int16 v8 = +[NSMapTable strongToWeakObjectsMapTable];
    CFStringRef v9 = self->_environmentToListener;
    self->_environmentToListener = v8;

    environmentToListener = self->_environmentToListener;
  }
  __int16 v10 = [v6 name];
  [(NSMapTable *)environmentToListener setObject:v11 forKey:v10];
}

- (void)removeListener:(id)a3 environment:(id)a4
{
  id v13 = a4;
  environmentToListener = self->_environmentToListener;
  id v7 = a3;
  __int16 v8 = [v13 name];
  id v9 = [(NSMapTable *)environmentToListener objectForKey:v8];

  if (v9 == v7)
  {
    __int16 v10 = self->_environmentToListener;
    id v11 = [v13 name];
    [(NSMapTable *)v10 removeObjectForKey:v11];

    if (![(NSMapTable *)self->_environmentToListener count])
    {
      v12 = self->_environmentToListener;
      self->_environmentToListener = 0;
    }
  }
}

- (id)_recipientDevice
{
  [(APSIDSService *)self->_idsService linkedDevicesWithRelationship:3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isActive", (void)v8))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)sendProxyMessage:(id)a3
{
}

- (void)sendProxyMessage:(id)a3 forAPSMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = APSEncodeDictionary();
  if (v8)
  {
    long long v9 = [(id)objc_opt_class() _idsSendQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000808F0;
    v10[3] = &unk_10012B7C0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v8;
    id v13 = v7;
    dispatch_async(v9, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ got nil data when encoding message %@", buf, 0x16u);
  }
}

- (void)_scheduleDeviceNotFoundTimer
{
  id v3 = [(APSIDSProxyManager *)self deviceNotFoundTimer];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"APSIDSProxyManager" serviceIdentifier:self target:"_deviceNotFoundTimerFired" selector:0 userInfo:120.0];
    [(APSIDSProxyManager *)self setDeviceNotFoundTimer:v4];

    v5 = [(APSIDSProxyManager *)self deviceNotFoundTimer];
    id v6 = +[NSRunLoop mainRunLoop];
    [v5 scheduleInRunLoop:v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      long long v8 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ scheduling timer to clean device not found queue.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_deviceNotFoundTimerFired
{
  id v3 = [(APSIDSProxyManager *)self deviceNotFoundTimer];
  [v3 invalidate];

  [(APSIDSProxyManager *)self setDeviceNotFoundTimer:0];
  id v4 = [(APSIDSProxyManager *)self deviceNotFoundMessageQueue];
  id v5 = [v4 count];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000CAE30((uint64_t)self);
    }
    id v6 = [(APSIDSProxyManager *)self deviceNotFoundMessageQueue];
    [v6 removeAllObjects];
  }
}

- (void)_flushDeviceNotFoundMessageQueue
{
  id obj = [(APSIDSProxyManager *)self deviceNotFoundMessageQueue];
  objc_sync_enter(obj);
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(APSIDSProxyManager *)self deviceNotFoundMessageQueue];
    *(_DWORD *)buf = 134217984;
    id v20 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%lu messages to redeliver.", buf, 0xCu);
  }
  id v5 = [(APSIDSProxyManager *)self deviceNotFoundMessageQueue];
  id v6 = [v5 copy];

  int v7 = [(APSIDSProxyManager *)self deviceNotFoundMessageQueue];
  [v7 removeAllObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resending pending proxy message %@", buf, 0xCu);
        }
        [(APSIDSProxyManager *)self sendProxyMessage:v12];
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_sync_exit(obj);
}

- (void)_sendDaemonAliveMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ sending daemonAliveMessage - we need fresh presences", buf, 0xCu);
  }
  id v3 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137638, @"c", 0];
  [(APSIDSProxyManager *)self sendProxyMessage:v3];
}

- (void)sendPushToken:(id)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send push token %@ with environment %@ and guid %@", buf, 0x2Au);
  }
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137650, @"c", v9, @"pG", v10, @"e", v8, @"t", 0];
  [(APSIDSProxyManager *)self sendProxyMessage:v11];
}

- (void)sendMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send message size %lu with environment %@ and guid %@", buf, 0x2Au);
  }
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137668, @"c", v8, @"pG", v9, @"e", v10, @"mS", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v11];
}

- (void)sendLargeMessageSize:(unint64_t)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send large message size %lu with environment %@ and guid %@", buf, 0x2Au);
  }
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137668, @"c", v8, @"pG", v9, @"e", v10, @"lS", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v11];
}

- (void)sendReceivedPush:(id)a3 forConnectionType:(int64_t)a4 generation:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send received push %@ with environment %@ and guid %@", buf, 0x2Au);
  }
  unint64_t v15 = +[NSNumber numberWithInteger:a4];
  __int16 v16 = +[NSNumber numberWithUnsignedInteger:a5];
  id v17 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137680, @"c", v13, @"pG", v14, @"e", v12, @"p", v15, @"i", v16, @"g", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v17];
}

- (void)sendPresenceWithEnvironmentName:(id)a3 guid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v29 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v28 = a12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v31 = self;
    __int16 v32 = 2112;
    id v33 = v17;
    __int16 v34 = 2112;
    id v35 = v18;
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2112;
    id v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send presence with environment %@ guid %@ hwVersion %@ token %@", buf, 0x34u);
  }
  id v25 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_100137698, @"c", v18, @"pG", v22, @"ce", v23, @"no", v24, @"si", v17, @"e", 0];
  v26 = v25;
  if (v20) {
    [v25 setObject:v20 forKey:@"hw"];
  }
  if (v21 && v29)
  {
    [v26 setObject:v21 forKey:@"sv"];
    [v26 setObject:v29 forKey:@"sb"];
  }
  if (v19) {
    [v26 setObject:v19 forKey:@"t"];
  }
  [(APSIDSProxyManager *)self sendProxyMessage:v26];
}

- (void)sendFilterWithEnvironmentName:(id)a3 guid:(id)a4 enabledTopics:(id)a5 ignoredTopics:(id)a6 opportunisticTopics:(id)a7 nonWakingTopics:(id)a8 topicSalts:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send filter with environment %@ guid %@", buf, 0x20u);
    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if (v17)
  {
    goto LABEL_3;
  }
  id v17 = +[NSArray array];
  if (v18)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
LABEL_12:
    id v19 = +[NSArray array];
    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  id v18 = +[NSArray array];
  if (!v19) {
    goto LABEL_12;
  }
LABEL_5:
  if (v20) {
    goto LABEL_6;
  }
LABEL_13:
  id v20 = +[NSArray array];
LABEL_6:
  if (!v21)
  {
    id v21 = +[NSDictionary dictionary];
  }
  id v22 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_1001376B0, @"c", v16, @"pG", v15, @"e", v17, @"eT", v18, @"iT", v19, @"oT", v20, @"nT", v21, @"tSal", 0];
  [(APSIDSProxyManager *)self sendProxyMessage:v22];
}

- (void)sendPubSubChannelList:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6 environmentName:(id)a7 guid:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send pubsub channel list", buf, 0xCu);
  }
  id v18 = +[NSNumber numberWithUnsignedInt:v12];
  id v19 = +[NSNumber numberWithInteger:a6];
  id v20 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_1001376C8, @"c", v14, @"cl", v18, @"mI", v15, @"t", v19, @"i", v16, @"e", v17, @"pG", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v20];
}

- (void)sendPubSubChannelListResponse:(id)a3 environmentName:(id)a4 guid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send pubsub channel list resposne", buf, 0xCu);
  }
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_1001376E0, @"c", v8, @"p", v9, @"e", v10, @"pG", 0];
  [(APSIDSProxyManager *)self sendProxyMessage:v11];
}

- (void)sendPubSubUpdateMessage:(id)a3 connectionType:(int64_t)a4 environmentName:(id)a5 guid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send pubsub update message", buf, 0xCu);
  }
  id v13 = +[NSNumber numberWithInteger:a4];
  id v14 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_1001376F8, @"c", v10, @"p", v13, @"i", v11, @"e", v12, @"pG", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v14];
}

- (void)sendPubSubChannelListRequest:(int64_t)a3 environmentName:(id)a4 guid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send pubsub channel request message", buf, 0xCu);
  }
  id v10 = +[NSNumber numberWithInteger:a3];
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137710, @"c", v10, @"i", v8, @"e", v9, @"pG", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v11];
}

- (void)sendInactiveWithEnvironmentName:(id)a3 guid:(id)a4
{
  id v5 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137728, @"c", a4, @"pG", a3, @"e", 0];
  [(APSIDSProxyManager *)self sendProxyMessage:v5];
}

- (void)sendResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 connectionType:(int64_t)a6 generation:(unint64_t)a7 guid:(id)a8 environmentName:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  id v19 = +[NSNumber numberWithInteger:a3];
  id v20 = +[NSNumber numberWithInteger:a6];
  id v21 = +[NSNumber numberWithUnsignedInteger:a7];
  id v23 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137740, @"c", v16, @"pG", v15, @"e", v19, @"r", v20, @"i", v21, @"g", v17, @"t", v18, @"mI", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v23];
}

- (void)sendMessageTracingStatus:(int)a3 topic:(id)a4 tracingUUID:(id)a5 token:(id)a6 guid:(id)a7 environmentName:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = +[NSNumber numberWithUnsignedInt:v12];
  id v20 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137758, @"c", v15, @"pG", v14, @"e", v19, @"r", v17, @"u", v16, @"t", v18, @"tS", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v20];
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 guid:(id)a9 environmentName:(id)a10
{
  uint64_t v12 = *(void *)&a6;
  int v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v16;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 1024;
    int v32 = v13;
    __int16 v33 = 1024;
    int v34 = v12;
    __int16 v35 = 2112;
    id v36 = v18;
    __int16 v37 = 2048;
    int64_t v38 = a8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to send filter with topic hash %@ base token %@ appId %hu expiration %u vapidHash %@ type %lu", buf, 0x40u);
  }
  if ((unint64_t)[v16 length] >= 0x14)
  {
    id v21 = +[NSNumber numberWithInteger:a8];
    id v22 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_100137770, @"c", v19, @"pG", v20, @"e", v16, @"tH", v17, @"t", v21, @"tT", 0];

    if (v18) {
      [v22 setObject:v18 forKeyedSubscript:@"vPK"];
    }
    if (v12)
    {
      id v23 = +[NSNumber numberWithUnsignedInt:v12];
      [v22 setObject:v23 forKeyedSubscript:@"eTTL"];
    }
    if (v13)
    {
      id v24 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
      [v22 setObject:v24 forKeyedSubscript:@"a"];
    }
    [(APSIDSProxyManager *)self sendProxyMessage:v22];
  }
}

- (void)sendMessage:(id)a3 guid:(id)a4 environmentName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 dictionaryRepresentation];
  uint64_t v12 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_100137788, @"c", v9, @"pG", v8, @"e", v11, @"rP", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v12 forAPSMessage:v10];
}

- (void)sendReversePushResponse:(int64_t)a3 messageGUID:(id)a4 messageId:(unint64_t)a5 guid:(id)a6 environmentName:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = +[NSNumber numberWithInteger:a3];
  id v16 = +[NSNumber numberWithUnsignedInteger:a5];
  id v17 = +[NSDictionary dictionaryWithObjectsAndKeys:&off_1001377A0, @"c", v13, @"pG", v12, @"e", v15, @"r", v16, @"mI", v14, @"mG", 0];

  [(APSIDSProxyManager *)self sendProxyMessage:v17];
}

- (void)sendExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4 guid:(id)a5 environmentName:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = objc_opt_new();
  [v12 setObject:&off_1001377B8 forKey:@"c"];
  [v12 setObject:v11 forKey:@"pG"];

  [v12 setObject:v10 forKey:@"e"];
  if (v14) {
    [v12 setObject:v14 forKey:@"st"];
  }
  if (v8)
  {
    id v13 = +[NSNumber numberWithBool:1];
    [v12 setObject:v13 forKey:@"rT"];
  }
  [(APSIDSProxyManager *)self sendProxyMessage:v12];
}

- (void)sendAppTokenGenerateResponse:(id)a3 error:(id)a4 guid:(id)a5 environmentName:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_opt_new();
  [v13 setObject:&off_1001377D0 forKey:@"c"];
  [v13 setObject:v12 forKey:@"pG"];

  [v13 setObject:v11 forKey:@"e"];
  if (v10)
  {
    id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    [v13 setObject:v14 forKey:@"er"];
  }
  if (v15) {
    [v13 setObject:v15 forKey:@"r"];
  }
  [(APSIDSProxyManager *)self sendProxyMessage:v13];
}

- (void)sendProxyIsConnected:(BOOL)a3 guid:(id)a4 environmentName:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = (id)objc_opt_new();
  [v11 setObject:&off_1001377E8 forKey:@"c"];
  [v11 setObject:v9 forKey:@"pG"];

  [v11 setObject:v8 forKey:@"e"];
  id v10 = +[NSNumber numberWithBool:v6];
  [v11 setObject:v10 forKey:@"cS"];

  [(APSIDSProxyManager *)self sendProxyMessage:v11];
}

- (void)removeAllPendingAPSMessages
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    apsOutgoingMessageMap = self->_apsOutgoingMessageMap;
    int v5 = 138412546;
    BOOL v6 = self;
    __int16 v7 = 2112;
    id v8 = apsOutgoingMessageMap;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ removed all pending messages in APSOutgoingMessageMap %@", (uint8_t *)&v5, 0x16u);
  }
  id v4 = self->_apsOutgoingMessageMap;
  self->_apsOutgoingMessageMap = 0;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v22 = self;
    if (v8) {
      CFStringRef v16 = @"YES";
    }
    __int16 v23 = 2112;
    id v24 = v14;
    __int16 v25 = 2112;
    CFStringRef v26 = v16;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ identifier %@ didSendWithSuccess %@ error %@", buf, 0x2Au);
  }
  if (!v8 && self->_nearby && [(NSString *)self->_recentDaemonAliveGuid isEqualToString:v14])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ previous daemonAlive failed, resending one now", buf, 0xCu);
    }
    [(APSIDSProxyManager *)self _sendDaemonAliveMessage];
  }
  id v17 = [(NSMutableDictionary *)self->_apsOutgoingMessageMap objectForKey:v14];
  id v18 = v17;
  if (v17)
  {
    if (!v8)
    {
      id v19 = [v17 originator];
      id v20 = APSError();
      objc_msgSend(v19, "handleResult:forSendingOutgoingMessageWithID:", v20, objc_msgSend(v18, "messageID", v15));
    }
    [(NSMutableDictionary *)self->_apsOutgoingMessageMap removeObjectForKey:v14];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v90 = a3;
  id v91 = a4;
  id v12 = a5;
  id v95 = a6;
  id v93 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v102 = self;
    __int16 v103 = 2112;
    id v104 = v12;
    __int16 v105 = 2112;
    id v106 = v95;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ incomingData %@ fromID %@", buf, 0x20u);
  }
  v92 = v12;
  id v13 = APSDecodeDictionary();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000CAEB0((uint64_t)self);
    }

    id v13 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v102 = self;
    __int16 v103 = 2112;
    id v104 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ received dictionary %@", buf, 0x16u);
  }
  id v14 = [v13 objectForKey:@"c"];
  id v15 = [v14 integerValue];

  v94 = [v13 objectForKey:@"pG"];
  uint64_t v16 = [v13 objectForKey:@"e"];
  id v17 = (void *)v16;
  switch((unint64_t)v15)
  {
    case 1uLL:
      id v18 = [v13 objectForKey:@"ce"];
      id v19 = [v13 objectForKey:@"no"];
      v89 = [v13 objectForKey:@"si"];
      v88 = [v13 objectForKey:@"t"];
      id v20 = [v13 objectForKey:@"hw"];
      id v21 = [v13 objectForKey:@"sv"];
      id v22 = [v13 objectForKey:@"sb"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138412546;
        v102 = self;
        __int16 v103 = 2112;
        id v104 = WeakRetained;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ sending presence request to delegate %@", buf, 0x16u);
      }
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 proxyManager:self incomingPresenceWithGuid:v94 token:v88 hwVersion:v20 swVersion:v21 swBuild:v22 certificate:v18 nonce:v19 signature:v89 environmentName:v17];

      goto LABEL_149;
    case 2uLL:
      __int16 v25 = [v13 objectForKey:@"t"];
      if (v17)
      {
        CFStringRef v26 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        CFStringRef v26 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v26 proxyManager:self incomingPushToken:v25 guid:v94 environmentName:v17];
      }
      goto LABEL_143;
    case 3uLL:
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      __int16 v27 = self->_environmentToListener;
      id v28 = [(NSMapTable *)v27 countByEnumeratingWithState:&v96 objects:v100 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v97;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v97 != v29) {
              objc_enumerationMutation(v27);
            }
            __int16 v31 = [(NSMapTable *)self->_environmentToListener objectForKey:*(void *)(*((void *)&v96 + 1) + 8 * i)];
            if (objc_opt_respondsToSelector()) {
              [v31 proxyManagerReceivedDaemonAliveNotification:self];
            }
          }
          id v28 = [(NSMapTable *)v27 countByEnumeratingWithState:&v96 objects:v100 count:16];
        }
        while (v28);
      }

      goto LABEL_149;
    case 4uLL:
      int v32 = [v13 objectForKey:@"eT"];
      __int16 v33 = [v13 objectForKey:@"iT"];
      int v34 = [v13 objectForKey:@"oT"];
      __int16 v35 = [v13 objectForKey:@"nT"];
      id v36 = [v13 objectForKey:@"tSal"];
      if (v17)
      {
        __int16 v37 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        __int16 v37 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v37 proxyManager:self incomingFilterForGuid:v94 environmentName:v17 enabledTopics:v32 ignoredTopics:v33 opportunisticTopics:v34 nonWakingTopics:v35 topicSalts:v36];
      }

      goto LABEL_149;
    case 5uLL:
      if (v16)
      {
        int64_t v38 = [(NSMapTable *)self->_environmentToListener objectForKey:v16];
      }
      else
      {
        int64_t v38 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v38 proxyManager:self inactiveReceivedForGuid:v94 environmentName:v17];
      }
      goto LABEL_148;
    case 6uLL:
      __int16 v25 = [v13 objectForKey:@"p"];
      CFStringRef v26 = [v13 objectForKey:@"i"];
      if (sub_1000064F8((unint64_t)[v26 integerValue]))
      {
        id v39 = [v13 objectForKey:@"g"];
        if (v17)
        {
          v40 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
        }
        else
        {
          v40 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          [v40 proxyManager:self receivedPush:v25 connectionType:v26 generation:v39 guid:v94 environmentName:v17];
        }

        goto LABEL_143;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_143;
      }
      goto LABEL_71;
    case 7uLL:
      v41 = [v13 objectForKey:@"r"];
      v42 = [v13 objectForKey:@"i"];
      if (sub_1000064F8((unint64_t)[v42 integerValue]))
      {
        v43 = [v13 objectForKey:@"g"];
        v44 = [v13 objectForKey:@"t"];
        v45 = [v13 objectForKey:@"mI"];
        if (v17)
        {
          v46 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
        }
        else
        {
          v46 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          [v46 proxyManager:self receivedPushAckResponse:v41 messageId:v45 token:v44 connectionType:v42 generation:v43 guid:v94 environmentName:v17];
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v84 = (APSIDSProxyManager *)[v42 integerValue];
        *(_DWORD *)buf = 134217984;
        v102 = v84;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for interface: %ld, failed to deliver", buf, 0xCu);
      }

      goto LABEL_149;
    case 8uLL:
      v47 = [v13 objectForKey:@"rP"];
      id v48 = [objc_alloc((Class)APSOutgoingMessage) initWithDictionary:v47];
      if (v17)
      {
        v49 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v49 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v49 proxyManager:self sendReversePush:v48 guid:v94 environmentName:v17];
      }
      goto LABEL_111;
    case 9uLL:
      v50 = [v13 objectForKey:@"r"];
      v51 = [v13 objectForKey:@"mG"];
      v52 = [v13 objectForKey:@"mI"];
      if (v17)
      {
        v53 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v53 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v53 proxyManager:self reversePushResponse:v50 messageGUID:v51 messageId:v52 guid:v94 environmentName:v17];
      }

      goto LABEL_149;
    case 0xAuLL:
      v54 = [v13 objectForKey:@"st"];
      v55 = [v13 objectForKey:@"rT"];

      if (v17)
      {
        v56 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v56 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v56 proxyManager:self expiredNonceWithServerTime:v54 shouldRollToken:v55 != 0 guid:v94 environmentName:v17];
      }

      goto LABEL_149;
    case 0xBuLL:
      v47 = [v13 objectForKey:@"mS"];
      id v48 = [v13 objectForKey:@"lS"];
      if (v17)
      {
        v49 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v49 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v49 proxyManager:self incomingMessageSize:v47 largeMessageSize:v48 guid:v94 environmentName:v17];
      }
      goto LABEL_111;
    case 0xCuLL:
      v57 = [v13 objectForKey:@"tH"];
      v58 = [v13 objectForKey:@"t"];
      v59 = [v13 objectForKey:@"a"];
      v60 = [v13 objectForKey:@"eTTL"];
      v61 = [v13 objectForKey:@"vPK"];
      uint64_t v62 = [v13 objectForKey:@"tT"];
      v63 = (void *)v62;
      v64 = &off_100137800;
      if (v62) {
        v64 = (_UNKNOWN **)v62;
      }
      v65 = v64;

      if (v17)
      {
        v66 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v66 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v66 proxyManager:self tokenGenerateWithTopicHash:v57 baseToken:v58 appId:v59 expirationTTL:v60 vapidPublicKeyHash:v61 type:v65 guid:v94 environmentName:v17];
      }

      goto LABEL_149;
    case 0xDuLL:
      v47 = [v13 objectForKey:@"r"];
      id v48 = [v13 objectForKey:@"er"];
      if (v17)
      {
        v49 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v49 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v49 proxyManager:self appTokenGenerateResponse:v47 error:v48 guid:v94 environmentName:v17];
      }
LABEL_111:

      goto LABEL_149;
    case 0xEuLL:
      v67 = [v13 objectForKey:@"cS"];
      id v68 = [v67 BOOLValue];

      if (v17)
      {
        v69 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v69 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v69 proxyManager:self isConnected:v68 guid:v94 environmentName:v17];
      }

      goto LABEL_149;
    case 0xFuLL:
      v70 = [v13 objectForKey:@"r"];
      id v71 = [v70 intValue];

      v72 = [v13 objectForKey:@"tS"];
      v73 = [v13 objectForKey:@"u"];
      v74 = [v13 objectForKey:@"t"];
      if (v17)
      {
        v75 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        v75 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v75 proxyManager:self messageTracingWithStatus:v71 topic:v72 tracingUUID:v73 token:v74 guid:v94 environmentName:v17];
      }

      goto LABEL_149;
    case 0x10uLL:
      v76 = [v13 objectForKey:@"cl"];
      v77 = [v13 objectForKey:@"mI"];
      id v78 = [v77 unsignedIntValue];

      v79 = [v13 objectForKey:@"t"];
      v80 = [v13 objectForKey:@"i"];
      if (sub_1000064F8((unint64_t)[v80 integerValue]))
      {
        if (v17)
        {
          v81 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
        }
        else
        {
          v81 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v81, "proxyManager:sendPubSubChannelList:messageID:token:connectionType:environmentName:guid:", self, v76, v78, v79, objc_msgSend(v80, "integerValue"), v17, v94);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v87 = (APSIDSProxyManager *)[v80 integerValue];
        *(_DWORD *)buf = 134217984;
        v102 = v87;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for channel list interface: %ld, failed to deliver", buf, 0xCu);
      }

      goto LABEL_149;
    case 0x11uLL:
      __int16 v25 = [v13 objectForKey:@"p"];
      if (v17)
      {
        CFStringRef v26 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
      }
      else
      {
        CFStringRef v26 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v26 proxyManager:self handlePubSubChannelListResponse:v25 environmentName:v17 guid:v94];
      }
      goto LABEL_143;
    case 0x12uLL:
      __int16 v25 = [v13 objectForKey:@"p"];
      CFStringRef v26 = [v13 objectForKey:@"i"];
      if (sub_1000064F8((unint64_t)[v26 integerValue]))
      {
        if (v17)
        {
          v82 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
        }
        else
        {
          v82 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v82, "proxyManager:handlePubSubUpdateMessage:connectionType:environmentName:guid:", self, v25, objc_msgSend(v26, "integerValue"), v17, v94);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_71:
        v85 = (APSIDSProxyManager *)[v26 integerValue];
        *(_DWORD *)buf = 134218242;
        v102 = v85;
        __int16 v103 = 2112;
        id v104 = v25;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for interface: %ld message parameters %@, failed to deliver", buf, 0x16u);
      }
LABEL_143:

LABEL_149:
      return;
    case 0x13uLL:
      int64_t v38 = [v13 objectForKey:@"i"];
      if (sub_1000064F8((unint64_t)[v38 integerValue]))
      {
        if (v17)
        {
          v83 = [(NSMapTable *)self->_environmentToListener objectForKey:v17];
        }
        else
        {
          v83 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v83, "proxyManager:handlePubSubChannelListRequest:envName:guid:", self, objc_msgSend(v38, "integerValue"), v17, v94);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v86 = (APSIDSProxyManager *)[v38 integerValue];
        *(_DWORD *)buf = 134217984;
        v102 = v86;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for interface: %ld, failed to deliver", buf, 0xCu);
      }
LABEL_148:

      goto LABEL_149;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v102 = self;
        __int16 v103 = 2112;
        id v104 = v13;
        __int16 v105 = 2048;
        id v106 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ received message %@ with unknown command %ld", buf, 0x20u);
      }
      goto LABEL_149;
  }
}

+ (BOOL)shouldAssertWiFi
{
  return 0;
}

- (void)__assertWiFiIfPossible
{
  BOOL nearby = self->_nearby;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_nearby) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    *(_DWORD *)id v10 = 136315906;
    *(void *)&v10[4] = "-[APSIDSProxyManager __assertWiFiIfPossible]";
    if (+[APSIDSProxyManager shouldAssertWiFi]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    if (nearby) {
      CFStringRef v6 = @"NO";
    }
    else {
      CFStringRef v6 = @"YES";
    }
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = v4;
    __int16 v11 = 2112;
    CFStringRef v12 = v5;
    __int16 v13 = 2112;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: isNearby: %@ shouldAssertWiFi: %@ assertWiFi: %@", v10, 0x2Au);
  }
  BOOL v7 = !nearby;
  BOOL v8 = +[PCPersistentInterfaceManager sharedInstance];
  [v8 enableWiFiAutoAssociation:v7 forDelegate:self];

  id v9 = +[PCPersistentInterfaceManager sharedInstance];
  [v9 enableWakeOnWiFi:v7 forDelegate:self];
}

- (void)_assertWiFiIfPossible
{
  if (+[APSIDSProxyManager shouldAssertWiFi])
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__assertWiFiIfPossible" object:0];
    if (self->_nearby)
    {
      [(APSIDSProxyManager *)self __assertWiFiIfPossible];
    }
    else
    {
      [(APSIDSProxyManager *)self performSelector:"__assertWiFiIfPossible" withObject:0 afterDelay:10.0];
    }
  }
}

- (void)_checkNearbyDevices:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(id)objc_opt_class() _idsSendQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008477C;
  v7[3] = &unk_100129D10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_onQueue_checkNearbyDevices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if [v9 isNearby] && (objc_msgSend(v9, "isActive"))
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100084914;
  v10[3] = &unk_10012BE08;
  v10[4] = self;
  char v11 = (char)v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_retrieveAllDevicesAndDo:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100084C64;
  v7[3] = &unk_10012B810;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084DA4;
  v4[3] = &unk_10012BE58;
  v4[4] = self;
  -[APSIDSProxyManager _retrieveAllDevicesAndDo:](self, "_retrieveAllDevicesAndDo:", v4, a4);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084E74;
  v4[3] = &unk_10012BE58;
  v4[4] = self;
  -[APSIDSProxyManager _retrieveAllDevicesAndDo:](self, "_retrieveAllDevicesAndDo:", v4, a4);
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084EEC;
  v4[3] = &unk_10012BE58;
  v4[4] = self;
  -[APSIDSProxyManager _retrieveAllDevicesAndDo:](self, "_retrieveAllDevicesAndDo:", v4, a4);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(id)objc_opt_class() _idsSendQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100085004;
  v9[3] = &unk_10012BE30;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (APSIDSProxyManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSIDSProxyManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isNearby
{
  return self->_nearby;
}

- (NSString)recentDaemonAliveGuid
{
  return self->_recentDaemonAliveGuid;
}

- (void)setRecentDaemonAliveGuid:(id)a3
{
}

- (NSMutableArray)deviceNotFoundMessageQueue
{
  return self->_deviceNotFoundMessageQueue;
}

- (void)setDeviceNotFoundMessageQueue:(id)a3
{
}

- (PCPersistentTimer)deviceNotFoundTimer
{
  return self->_deviceNotFoundTimer;
}

- (void)setDeviceNotFoundTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceNotFoundTimer, 0);
  objc_storeStrong((id *)&self->_deviceNotFoundMessageQueue, 0);
  objc_storeStrong((id *)&self->_apsOutgoingMessageMap, 0);
  objc_storeStrong((id *)&self->_recentDaemonAliveGuid, 0);
  objc_storeStrong((id *)&self->_environmentToListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end