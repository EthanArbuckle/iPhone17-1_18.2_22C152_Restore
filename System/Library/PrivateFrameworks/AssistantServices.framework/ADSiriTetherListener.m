@interface ADSiriTetherListener
- (ADSiriTetherListener)init;
- (void)_handleNewConnection:(id)a3;
- (void)listen;
@end

@implementation ADSiriTetherListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_handleNewConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  v5 = (_xpc_connection_s *)kAssistantClientEntitlement;
  [kAssistantClientEntitlement UTF8String];
  v6 = (void *)xpc_connection_copy_entitlement_value();
  v7 = v6;
  if (v6 && xpc_BOOL_get_value(v6))
  {
    v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ADSiriTetherListener _handleNewConnection:]";
      __int16 v15 = 2048;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Tether attached %p", buf, 0x16u);
    }
    xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002CDF3C;
    handler[3] = &unk_10050A808;
    v9 = v4;
    v12 = v9;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_activate(v9);
  }
  else
  {
    v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ADSiriTetherListener _handleNewConnection:]";
      __int16 v15 = 2112;
      v16 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Client missing entitlement %@", buf, 0x16u);
    }
    xpc_connection_cancel(v4);
  }
}

- (void)listen
{
  if (self->_xpcListener)
  {
    objc_initWeak(&location, self);
    xpcListener = self->_xpcListener;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1002CE1F8;
    v4[3] = &unk_10050A7E0;
    objc_copyWeak(&v5, &location);
    xpc_connection_set_event_handler(xpcListener, v4);
    xpc_connection_activate(self->_xpcListener);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (ADSiriTetherListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)ADSiriTetherListener;
  v2 = [(ADSiriTetherListener *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create(0, v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = +[AFInstanceContext currentContext];
    uint64_t v7 = [v6 createXPCListenerForMachService:AFSiriTetherMachService targetQueue:v2->_queue flags:0];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (OS_xpc_object *)v7;

    if (!v2->_xpcListener)
    {
      v9 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v11 = v9;
        v12 = +[AFInstanceContext currentContext];
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[ADSiriTetherListener init]";
        __int16 v16 = 2112;
        v17 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Unable to create XPC listener from %@.", buf, 0x16u);
      }
    }
  }
  return v2;
}

@end