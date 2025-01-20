@interface IDSActivityMonitorStateManager
+ (id)sharedInstance;
- (BOOL)isListeningOnActivity:(id)a3;
- (BOOL)startListeningOnActivity:(id)a3;
- (BOOL)stopListeningOnActivity:(id)a3;
- (FTMessageDelivery)messageDelivery;
- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 pushListener:(id)a8;
- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 queue:(id)a8;
- (IDSActivityPushListener)pushListener;
- (IDSActivityStateProvider)stateProvider;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSPeerIDManager)peerIDManager;
- (NSMutableDictionary)listenersByActivity;
- (NSMutableDictionary)topicStringToSubscribedInfo;
- (NSMutableSet)listeningOnActivities;
- (id)currentSubscriptionsForActivity:(id)a3;
- (id)storedUpdatesForActivity:(id)a3;
- (void)_subscribeForInfo:(id)a3 withDescription:(id)a4 resolvedTokens:(id)a5 withCompletion:(id)a6;
- (void)_updateListener;
- (void)ackUpdatesForActivity:(id)a3;
- (void)addListener:(id)a3 forActivity:(id)a4;
- (void)pushListener:(id)a3 receivedUpdatePush:(id)a4;
- (void)removeListener:(id)a3 forActivity:(id)a4;
- (void)removeSubscriptionForActivity:(id)a3 subActivity:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setListenersByActivity:(id)a3;
- (void)setListeningOnActivities:(id)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPushListener:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setStateProvider:(id)a3;
- (void)setTopicStringToSubscribedInfo:(id)a3;
- (void)setup;
- (void)storeSubscription:(id)a3 forActivity:(id)a4;
- (void)subscribeForInfo:(id)a3 onActivity:(id)a4 withCompletion:(id)a5;
- (void)unsubscribeForActivity:(id)a3 subActivity:(id)a4 withCompletion:(id)a5;
@end

@implementation IDSActivityMonitorStateManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E2AC;
  block[3] = &unk_10097EA18;
  block[4] = a1;
  if (qword_100A4A268 != -1) {
    dispatch_once(&qword_100A4A268, block);
  }
  v2 = (void *)qword_100A4A260;

  return v2;
}

- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 pushListener:(id)a8
{
  v14 = (IDSActivityPushListener *)a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = im_primary_queue();
  v21 = [(IDSActivityMonitorStateManager *)self initWithStateProvider:v19 messageDelivery:v18 peerIDManager:v17 accountController:v16 serviceController:v15 queue:v20];

  pushListener = v21->_pushListener;
  v21->_pushListener = v14;
  v23 = v14;

  [(IDSActivityPushListener *)v21->_pushListener setDelegate:v21];
  return v21;
}

- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 queue:(id)a8
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)IDSActivityMonitorStateManager;
  id v18 = [(IDSActivityMonitorStateManager *)&v28 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_stateProvider, a3);
    v20 = [[IDSActivityPushListener alloc] initWithQueue:v17 shouldDowngradeOnLock:0];
    pushListener = v19->_pushListener;
    v19->_pushListener = v20;

    objc_storeStrong((id *)&v19->_messageDelivery, a4);
    objc_storeStrong((id *)&v19->_peerIDManager, a5);
    objc_storeStrong((id *)&v19->_accountController, a6);
    objc_storeStrong((id *)&v19->_serviceController, a7);
    uint64_t v22 = +[NSMutableDictionary dictionary];
    topicStringToSubscribedInfo = v19->_topicStringToSubscribedInfo;
    v19->_topicStringToSubscribedInfo = (NSMutableDictionary *)v22;
  }
  [(IDSActivityPushListener *)v19->_pushListener setDelegate:v19];

  return v19;
}

- (void)setup
{
  id v5 = [(IDSActivityStateProvider *)self->_stateProvider storedActivityTopics];
  if ([v5 count])
  {
    v3 = (NSMutableSet *)[v5 mutableCopy];
    listeningOnActivities = self->_listeningOnActivities;
    self->_listeningOnActivities = v3;
  }
  [(IDSActivityMonitorStateManager *)self _updateListener];
}

- (void)addListener:(id)a3 forActivity:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unsigned int v7 = +[IDSDXPCActivityMonitor isActivityMonitorSupported];
  if (v6 && v7)
  {
    listenersByActivity = self->_listenersByActivity;
    if (!listenersByActivity)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v10 = self->_listenersByActivity;
      self->_listenersByActivity = v9;

      listenersByActivity = self->_listenersByActivity;
    }
    v11 = [(NSMutableDictionary *)listenersByActivity objectForKeyedSubscript:v6];
    if (!v11)
    {
      v11 = +[NSHashTable weakObjectsHashTable];
      [(NSMutableDictionary *)self->_listenersByActivity setObject:v11 forKeyedSubscript:v6];
    }
    [v11 addObject:v12];
  }
}

- (void)removeListener:(id)a3 forActivity:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    listenersByActivity = self->_listenersByActivity;
    if (listenersByActivity)
    {
      v8 = [(NSMutableDictionary *)listenersByActivity objectForKeyedSubscript:v6];
      v9 = v8;
      if (v8)
      {
        [v8 removeObject:v11];
        if (![v9 count]) {
          [(NSMutableDictionary *)self->_listenersByActivity setObject:0 forKeyedSubscript:v6];
        }
        if (![(NSMutableDictionary *)self->_listenersByActivity count])
        {
          v10 = self->_listenersByActivity;
          self->_listenersByActivity = 0;
        }
      }
    }
  }
}

- (NSMutableSet)listeningOnActivities
{
  listeningOnActivities = self->_listeningOnActivities;
  if (listeningOnActivities)
  {
    id v3 = [(NSMutableSet *)listeningOnActivities copy];
  }
  else
  {
    id v3 = +[NSSet set];
  }

  return (NSMutableSet *)v3;
}

- (BOOL)startListeningOnActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSMutableSet *)self->_listeningOnActivities containsObject:v4];
  if ((v5 & 1) == 0)
  {
    listeningOnActivities = self->_listeningOnActivities;
    if (!listeningOnActivities)
    {
      unsigned int v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v8 = self->_listeningOnActivities;
      self->_listeningOnActivities = v7;

      listeningOnActivities = self->_listeningOnActivities;
    }
    [(NSMutableSet *)listeningOnActivities addObject:v4];
    v9 = [(IDSActivityMonitorStateManager *)self stateProvider];
    v10 = [v9 storedActivityTopics];
    id v11 = +[NSMutableSet setWithSet:v10];

    [v11 addObject:v4];
    id v12 = [(IDSActivityMonitorStateManager *)self stateProvider];
    [v12 setStoredActivityTopics:v11];

    [(IDSActivityMonitorStateManager *)self _updateListener];
  }

  return v5 ^ 1;
}

- (BOOL)stopListeningOnActivity:(id)a3
{
  id v4 = a3;
  listeningOnActivities = self->_listeningOnActivities;
  if (listeningOnActivities
    && [(NSMutableSet *)listeningOnActivities containsObject:v4])
  {
    [(NSMutableSet *)self->_listeningOnActivities removeObject:v4];
    id v6 = [(IDSActivityMonitorStateManager *)self stateProvider];
    unsigned int v7 = [v6 storedActivityTopics];
    v8 = +[NSMutableSet setWithSet:v7];

    [v8 removeObject:v4];
    v9 = [(IDSActivityMonitorStateManager *)self stateProvider];
    [v9 setStoredActivityTopics:v8];

    [(IDSActivityMonitorStateManager *)self _updateListener];
    [(IDSActivityMonitorStateManager *)self ackUpdatesForActivity:v4];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isListeningOnActivity:(id)a3
{
  return [(NSMutableSet *)self->_listeningOnActivities containsObject:a3];
}

- (id)storedUpdatesForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IDSActivityMonitorStateManager *)self stateProvider];
  id v6 = [v5 storedUpdatesForActivity:v4];

  if (v6) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  return v8;
}

- (void)storeSubscription:(id)a3 forActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSActivityMonitorStateManager *)self stateProvider];
  [v8 storeSubscription:v7 forActivity:v6];
}

- (void)removeSubscriptionForActivity:(id)a3 subActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSActivityMonitorStateManager *)self stateProvider];
  [v8 removeSubscriptionForActivity:v7 subActivity:v6];
}

- (id)currentSubscriptionsForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IDSActivityMonitorStateManager *)self stateProvider];
  id v6 = [v5 storedSubscriptionsForActivity:v4];

  return v6;
}

- (void)ackUpdatesForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSActivityMonitorStateManager *)self stateProvider];
  [v5 storeUpdates:0 forActivity:v4];
}

- (void)subscribeForInfo:(id)a3 onActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void *))a5;
  id v11 = [(IDSActivityMonitorStateManager *)self topicStringToSubscribedInfo];
  id v12 = [v11 objectForKeyedSubscript:v9];

  v13 = +[NSDate date];
  v14 = [v12 expirationDate];
  id v15 = [v13 compare:v14];

  if (![v12 isIdentical:v8] || v15 == (id)1)
  {
    id v17 = objc_alloc_init(IDSActivityDescription);
    [(IDSActivityDescription *)v17 setActivity:v9];
    +[NSDate timeIntervalSinceReferenceDate];
    -[IDSActivityDescription setTimeSubscribed:](v17, "setTimeSubscribed:");
    id v18 = [v8 tokens];
    id v19 = [v18 count];

    if (v19)
    {
      v20 = [v8 tokens];
      [(IDSActivityMonitorStateManager *)self _subscribeForInfo:v8 withDescription:v17 resolvedTokens:v20 withCompletion:v10];
    }
    else
    {
      v21 = [v8 URIs];
      id v22 = [v21 count];

      if (!v22)
      {
        v34 = [v8 deviceUniqueIDs];
        id v35 = [v34 count];

        if (v35) {
          uint64_t v36 = -600;
        }
        else {
          uint64_t v36 = -104;
        }
        v38 = +[NSError errorWithDomain:IDSActivityMonitorErrorDomain code:v36 userInfo:0];
        v10[2](v10, v38);

        goto LABEL_16;
      }
      v23 = [(IDSActivityMonitorStateManager *)self serviceController];
      v20 = [v23 serviceWithIdentifier:v9];

      v24 = [(IDSActivityMonitorStateManager *)self accountController];
      id v25 = [v24 accountsOnService:v20 withType:1];
      id v26 = [v25 firstObject];

      if ([v26 isRegistered])
      {
        id v27 = [v26 unprefixedURIStringsFromRegistration];
        v42 = (void *)_IDSCopyCallerIDWithSelfMessagingHint();

        objc_super v28 = [v42 _bestGuessURI];
        [v26 service];
        v29 = v45 = v20;
        [v29 identifier];
        v30 = v44 = v26;
        v43 = +[IDSURI URIWithPrefixedURI:v28 withServiceLoggingHint:v30];

        v31 = [v44 primaryRegistration];
        v41 = [v31 registrationCert];

        v32 = [(IDSActivityMonitorStateManager *)self peerIDManager];
        v40 = [v8 URIs];
        v33 = [v45 identifier];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10002F1E0;
        v46[3] = &unk_10097EAB8;
        v46[4] = self;
        id v47 = v8;
        v48 = v17;
        v49 = v10;
        id v26 = v44;
        LOBYTE(v39) = 0;
        [v32 startQueryForURIs:v40 fromIdentity:v41 fromURI:v43 fromService:v33 forSending:0 forRefresh:0 isForced:v39 reason:@"ActivityMonitorSubscription" completionBlock:v46];

        v20 = v45;
      }
      else
      {
        v37 = +[NSError errorWithDomain:IDSActivityMonitorErrorDomain code:-200 userInfo:0];
        v10[2](v10, v37);
      }
    }

    goto LABEL_16;
  }
  id v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v51 = v9;
    __int16 v52 = 2112;
    id v53 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found existing identical subscription for topic %@ with info %@.", buf, 0x16u);
  }

  id v17 = +[NSError errorWithDomain:IDSActivityMonitorErrorDomain code:666 userInfo:0];
  v10[2](v10, v17);
LABEL_16:
}

- (void)unsubscribeForActivity:(id)a3 subActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(IDSActivityScribeMessage);
  id v12 = +[NSString stringWithFormat:@"%@%@", @"com.apple.icloud.presence.", v8];
  [(IDSActivityScribeMessage *)v11 setActivityTopic:v12];

  [(IDSActivityScribeMessage *)v11 setVersion:1];
  v13 = +[NSString stringGUID];
  [(IDSActivityScribeMessage *)v11 setMessageID:v13];

  v14 = +[NSData data];
  [(IDSActivityScribeMessage *)v11 setMetadataBlob:v14];

  [(IDSActivityScribeMessage *)v11 setSubActivity:v9];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002F5CC;
  v19[3] = &unk_10097EAE0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [(IDSActivityScribeMessage *)v11 setCompletionBlock:v19];
  id v18 = [(IDSActivityMonitorStateManager *)self messageDelivery];
  [v18 sendMessage:v11];
}

- (void)_subscribeForInfo:(id)a3 withDescription:(id)a4 resolvedTokens:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = [(IDSActivityMonitorStateManager *)self topicStringToSubscribedInfo];
  id v15 = [v11 activity];
  [v14 setObject:v10 forKeyedSubscript:v15];

  id v16 = objc_alloc_init(IDSActivityScribeMessage);
  [(IDSActivityScribeMessage *)v16 setTokens:v13];

  id v17 = [v11 activity];
  id v18 = +[NSString stringWithFormat:@"%@%@", @"com.apple.icloud.presence.", v17];
  [(IDSActivityScribeMessage *)v16 setActivityTopic:v18];

  id v19 = [v10 subActivity];
  [(IDSActivityScribeMessage *)v16 setSubActivity:v19];

  id v20 = [v10 appContext];
  [(IDSActivityScribeMessage *)v16 setMetadataBlob:v20];

  [(IDSActivityScribeMessage *)v16 setPushPriority:10];
  [(IDSActivityScribeMessage *)v16 setActivityPolicy:0];
  [(IDSActivityScribeMessage *)v16 setVersion:1];
  id v21 = +[NSString stringGUID];
  [(IDSActivityScribeMessage *)v16 setMessageID:v21];

  id v22 = [v10 expirationDate];
  [v22 timeIntervalSinceNow];
  [(IDSActivityScribeMessage *)v16 setTtl:vcvtpd_s64_f64(v23)];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002FAA0;
  v28[3] = &unk_10097EAE0;
  v28[4] = self;
  id v29 = v11;
  id v30 = v10;
  id v31 = v12;
  id v24 = v12;
  id v25 = v10;
  id v26 = v11;
  [(IDSActivityScribeMessage *)v16 setCompletionBlock:v28];
  id v27 = [(IDSActivityMonitorStateManager *)self messageDelivery];
  [v27 sendMessage:v16];
}

- (void)_updateListener
{
  id v3 = [(IDSActivityMonitorStateManager *)self listeningOnActivities];
  id v4 = objc_msgSend(v3, "__imSetByApplyingBlock:", &stru_10097EB20);
  id v5 = [(IDSActivityMonitorStateManager *)self pushListener];
  [v5 setTopicsToListenOn:v4];

  id v8 = [(IDSActivityMonitorStateManager *)self listeningOnActivities];
  BOOL v6 = [v8 count] != 0;
  id v7 = [(IDSActivityMonitorStateManager *)self pushListener];
  [v7 setShouldListen:v6];
}

- (void)pushListener:(id)a3 receivedUpdatePush:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 activityTopic];
  if ([v7 rangeOfString:@"com.apple.icloud.presence."])
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v7 substringFromIndex:v8];
  }

  if (!v9) {
    goto LABEL_38;
  }
  id v10 = [(IDSActivityMonitorStateManager *)self listeningOnActivities];
  unsigned int v11 = [v10 containsObject:v9];

  if (!v11) {
    goto LABEL_38;
  }
  id v52 = v5;
  id v12 = [(IDSActivityMonitorStateManager *)self serviceController];
  uint64_t v13 = [v12 serviceWithIdentifier:v9];

  v14 = [(IDSActivityMonitorStateManager *)self accountController];
  id v15 = [v14 accountsOnService:v13 withType:1];
  id v16 = [v15 firstObject];

  id v17 = 0;
  id v53 = (void *)v13;
  id v54 = v6;
  v56 = v9;
  id v51 = v16;
  if (v13 && v16)
  {
    if ([v16 isRegistered])
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v18 = [v16 registeredDevices];
      id v19 = [v18 countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v19)
      {
        id v20 = v19;
        id v17 = 0;
        uint64_t v21 = *(void *)v63;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v63 != v21) {
              objc_enumerationMutation(v18);
            }
            double v23 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            id v24 = [v23 pushToken];
            id v25 = [v6 token];
            unsigned int v26 = [v24 isEqualToData:v25];

            if (v26)
            {
              id v27 = v23;

              id v17 = v27;
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v62 objects:v72 count:16];
        }
        while (v20);

        if (v17) {
          goto LABEL_23;
        }
      }
      else
      {
      }
      objc_super v28 = [(IDSActivityMonitorStateManager *)self peerIDManager];
      id v29 = [v6 token];
      id v30 = +[IDSPushToken pushTokenWithData:v29];
      id v31 = [v53 identifier];
      v32 = [v28 urisMatchingPushToken:v30 service:v31];

      [0 addObjectsFromArray:v32];
      id v6 = v54;
    }
    id v17 = 0;
  }
LABEL_23:
  v55 = v17;
  id v33 = objc_alloc((Class)IDSActivityUpdate);
  uint64_t v34 = IDSActivityMonitorPresenceSubActivity;
  id v35 = [v6 token];
  id v36 = [v6 activityTimestamp];
  v37 = [v6 metadataBlob];
  id v38 = objc_msgSend(v33, "initWithSubActivity:pushToken:serverTimestamp:clientContext:isDeviceOnline:", v34, v35, v36, v37, objc_msgSend(v6, "activityStatus"));

  uint64_t v39 = [0 allObjects];
  if (v39)
  {
    [v38 setURIs:v39];
  }
  else
  {
    v40 = [v17 URIs];
    [v38 setURIs:v40];
  }
  v41 = +[IMRGLog registration];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v38;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Looking up for listeners for update: %@", buf, 0xCu);
  }

  v42 = [(IDSActivityMonitorStateManager *)self stateProvider];
  id v71 = v38;
  v43 = +[NSArray arrayWithObjects:&v71 count:1];
  [v42 storeUpdates:v43 forActivity:v56];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v44 = [(NSMutableDictionary *)self->_listenersByActivity objectForKeyedSubscript:v56];
  id v45 = [v44 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v59;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        v50 = +[IMRGLog registration];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v67 = v49;
          __int16 v68 = 2112;
          id v69 = v38;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Alerting listener %@ about update %@", buf, 0x16u);
        }

        [v49 activityMonitorManager:self receivedUpdate:v38 forActivity:v56];
      }
      id v46 = [v44 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v46);
  }

  id v5 = v52;
  id v6 = v54;
  id v9 = v56;
LABEL_38:
}

- (void)setListeningOnActivities:(id)a3
{
}

- (NSMutableDictionary)topicStringToSubscribedInfo
{
  return self->_topicStringToSubscribedInfo;
}

- (void)setTopicStringToSubscribedInfo:(id)a3
{
}

- (NSMutableDictionary)listenersByActivity
{
  return self->_listenersByActivity;
}

- (void)setListenersByActivity:(id)a3
{
}

- (IDSActivityStateProvider)stateProvider
{
  return self->_stateProvider;
}

- (void)setStateProvider:(id)a3
{
}

- (IDSActivityPushListener)pushListener
{
  return self->_pushListener;
}

- (void)setPushListener:(id)a3
{
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_peerIDManager, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_pushListener, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
  objc_storeStrong((id *)&self->_listenersByActivity, 0);
  objc_storeStrong((id *)&self->_topicStringToSubscribedInfo, 0);

  objc_storeStrong((id *)&self->_listeningOnActivities, 0);
}

@end