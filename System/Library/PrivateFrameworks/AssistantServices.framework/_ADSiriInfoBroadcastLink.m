@interface _ADSiriInfoBroadcastLink
- (_ADSiriInfoBroadcastLink)init;
- (id)siriInfoToBeBroadcasted;
- (void)_broadcastSiriInfo:(BOOL)a3;
- (void)_configureRapportLinkAndReconnectNow:(BOOL)a3;
- (void)_handleFoundRemoteDevice:(id)a3;
- (void)_handleUpdatedLocalDevice:(id)a3;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4;
@end

@implementation _ADSiriInfoBroadcastLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_siriInfoCache, 0);
  objc_storeStrong((id *)&self->_rapportLink, 0);
}

- (void)_broadcastSiriInfo:(BOOL)a3
{
  BOOL v3 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100087B58;
  v13[3] = &unk_10050E138;
  v13[4] = self;
  v5 = objc_retainBlock(v13);
  v6 = v5;
  unint64_t v7 = self->_generation + 1;
  self->_generation = v7;
  if (v3)
  {
    ((void (*)(void *))v5[2])(v5);
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 250000000);
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100087C28;
    v10[3] = &unk_10050C148;
    v10[4] = self;
    unint64_t v12 = v7;
    id v11 = v6;
    dispatch_after(v8, queue, v10);
  }
}

- (void)_handleFoundRemoteDevice:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[_ADSiriInfoBroadcastLink _handleFoundRemoteDevice:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Remote device %@ found, broadcasting soon...", (uint8_t *)&v6, 0x16u);
  }
  [(_ADSiriInfoBroadcastLink *)self _broadcastSiriInfo:0];
}

- (void)_handleUpdatedLocalDevice:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_isLocalDeviceAvailble)
  {
    self->_isLocalDeviceAvailble = 1;
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      unint64_t v7 = "-[_ADSiriInfoBroadcastLink _handleUpdatedLocalDevice:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Local device %@ becomes available, broadcasting SiriInfo now...", (uint8_t *)&v6, 0x16u);
    }
    [(_ADSiriInfoBroadcastLink *)self _broadcastSiriInfo:1];
  }
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[_ADSiriInfoBroadcastLink rapportLinkDidInvalidate:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  [(_ADSiriInfoBroadcastLink *)self _configureRapportLinkAndReconnectNow:0];
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[_ADSiriInfoBroadcastLink rapportLinkDidInterrupt:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  [(_ADSiriInfoBroadcastLink *)self _configureRapportLinkAndReconnectNow:1];
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    v10 = "-[_ADSiriInfoBroadcastLink rapportLink:didFindDevice:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(_ADSiriInfoBroadcastLink *)self _handleFoundRemoteDevice:v7];
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    v10 = "-[_ADSiriInfoBroadcastLink rapportLink:didUpdateLocalDevice:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(_ADSiriInfoBroadcastLink *)self _handleUpdatedLocalDevice:v7];
}

- (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088274;
  block[3] = &unk_10050DCB8;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (id)siriInfoToBeBroadcasted
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100088598;
  id v10 = sub_1000885A8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000885B0;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_configureRapportLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  rapportLink = self->_rapportLink;
  if (rapportLink)
  {
    [(ADRapportLink *)rapportLink removeListener:self];
    [(ADRapportLink *)self->_rapportLink invalidate];
    uint64_t v6 = self->_rapportLink;
    self->_rapportLink = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100088748;
  v13[3] = &unk_10050E138;
  v13[4] = self;
  id v7 = objc_retainBlock(v13);
  uint64_t v8 = v7;
  if (v3)
  {
    ((void (*)(void *))v7[2])(v7);
  }
  else
  {
    dispatch_time_t v9 = dispatch_time(0, 20000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100088838;
    block[3] = &unk_10050E188;
    void block[4] = self;
    id v12 = v8;
    dispatch_after(v9, queue, block);
  }
}

- (_ADSiriInfoBroadcastLink)init
{
  v10.receiver = self;
  v10.super_class = (Class)_ADSiriInfoBroadcastLink;
  v2 = [(_ADSiriInfoBroadcastLink *)&v10 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("_ADSiriInfoBroadcastLink", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    siriInfoCache = v2->_siriInfoCache;
    v2->_siriInfoCache = v7;

    [(_ADSiriInfoBroadcastLink *)v2 _configureRapportLinkAndReconnectNow:1];
  }
  return v2;
}

@end