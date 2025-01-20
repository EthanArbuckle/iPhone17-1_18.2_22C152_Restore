@interface AXCleanupSiriVoiceSubscriptionsSimpleTask
- (void)run:(id)a3;
@end

@implementation AXCleanupSiriVoiceSubscriptionsSimpleTask

- (void)run:(id)a3
{
  id v3 = a3;
  v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Task did begin", buf, 2u);
  }

  id v5 = objc_alloc_init((Class)SiriTTSDaemonSession);
  *(void *)buf = 0;
  v15 = buf;
  uint64_t v16 = 0x3032000000;
  v17 = sub_10000E398;
  v18 = sub_10000E3A8;
  id v19 = +[NSMutableArray array];
  v6 = AXLogAssetDaemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Asking SiriTTSDaemonSession for auto-downloaded voices", v13, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E3B0;
  v9[3] = &unk_100020CA0;
  v12 = buf;
  id v7 = v5;
  id v10 = v7;
  id v8 = v3;
  id v11 = v8;
  [v7 subscribedVoicesWithReply:v9];

  _Block_object_dispose(buf, 8);
}

@end