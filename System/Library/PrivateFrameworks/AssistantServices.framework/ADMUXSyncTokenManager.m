@interface ADMUXSyncTokenManager
+ (id)sharedInstance;
- (ADMUXSyncTokenManager)init;
- (id)getSyncTokenForAssistantId:(id)a3 aceHost:(id)a4;
- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)updateSyncTokenForAssistantId:(id)a3 aceHost:(id)a4 token:(id)a5;
@end

@implementation ADMUXSyncTokenManager

- (void).cxx_destruct
{
}

- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  v8 = (void (**)(id, void, void *))a5;
  id v9 = a4;
  id v10 = a3;
  if ((AFDeviceSupportsSiriMUX() & 1) == 0)
  {
    v11 = +[AFError errorWithCode:1010];
    v8[2](v8, 0, v11);
  }
  v12 = [v10 objectForKey:@"SiriMuxTokenHost"];
  v13 = [v10 objectForKey:@"SiriMuxToken"];

  v14 = [v9 assistantIdentifier];

  v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315650;
    v18 = "-[ADMUXSyncTokenManager handleMuxTokenExchangeMessage:fromPeer:completion:]";
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 2112;
    v22 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Received token for aceHost: %@ from peer with assistantID: %@", (uint8_t *)&v17, 0x20u);
  }
  [(ADMUXSyncTokenManager *)self updateSyncTokenForAssistantId:v14 aceHost:v12 token:v13];
  if (v13 && v14)
  {
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:@"ADMUXSyncTokenReceivedNotification" object:v14];
  }
  ((void (**)(id, void *, void *))v8)[2](v8, &__NSDictionary0__struct, 0);
}

- (id)getSyncTokenForAssistantId:(id)a3 aceHost:(id)a4
{
  id v6 = a4;
  p_syncTokenLock = &self->_syncTokenLock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_syncTokenLock);
  id v9 = [(NSMutableDictionary *)self->_companionSyncTokens objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 objectForKey:v6];
  }
  else
  {
    id v10 = 0;
  }
  os_unfair_lock_unlock(p_syncTokenLock);

  return v10;
}

- (void)updateSyncTokenForAssistantId:(id)a3 aceHost:(id)a4 token:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11 && v8 && v9)
  {
    os_unfair_lock_lock(&self->_syncTokenLock);
    id v10 = [(NSMutableDictionary *)self->_companionSyncTokens objectForKey:v11];
    if (!v10) {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v10 setObject:v9 forKey:v8];
    [(NSMutableDictionary *)self->_companionSyncTokens setObject:v10 forKey:v11];
    os_unfair_lock_unlock(&self->_syncTokenLock);
  }
}

- (ADMUXSyncTokenManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADMUXSyncTokenManager;
  v2 = [(ADMUXSyncTokenManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    companionSyncTokens = v2->_companionSyncTokens;
    v2->_companionSyncTokens = v3;

    v2->_syncTokenLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100586098 != -1) {
    dispatch_once(&qword_100586098, &stru_100509450);
  }
  v2 = (void *)qword_1005860A0;
  return v2;
}

@end