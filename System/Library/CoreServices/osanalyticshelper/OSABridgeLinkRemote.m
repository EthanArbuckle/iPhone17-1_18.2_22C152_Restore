@interface OSABridgeLinkRemote
+ (void)instantiate;
- (OSABridgeLinkRemote)init;
- (void)checkForPendingLogs;
- (void)enforceQuota;
- (void)handleLaunchEvent;
- (void)transferInternal:(id)a3 key:(id)a4;
@end

@implementation OSABridgeLinkRemote

+ (void)instantiate
{
  if (qword_1000262A8 != -1) {
    dispatch_once(&qword_1000262A8, &stru_100020FF0);
  }
}

- (OSABridgeLinkRemote)init
{
  if (OSAIsRSDDevice())
  {
    v15.receiver = self;
    v15.super_class = (Class)OSABridgeLinkRemote;
    v3 = [(OSABridgeLinkRemote *)&v15 init];
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.ReportCrash.xfer_queue", 0);
      serial_xfer_queue = v3->_serial_xfer_queue;
      v3->_serial_xfer_queue = (OS_dispatch_queue *)v4;

      uint64_t v6 = objc_opt_new();
      xfer_counts = v3->_xfer_counts;
      v3->_xfer_counts = (NSMutableDictionary *)v6;

      v8 = +[NSUserDefaults standardUserDefaults];
      v9 = [v8 dictionaryForKey:@"xfer-counts"];

      if (v9) {
        [(NSMutableDictionary *)v3->_xfer_counts addEntriesFromDictionary:v9];
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100015498((uint64_t *)&v3->_xfer_counts);
      }
      uint64_t v10 = objc_opt_new();
      bridgeEndpoint = v3->_bridgeEndpoint;
      v3->_bridgeEndpoint = (PCCBridgeEndpoint *)v10;

      v12 = (PCCProxiedDevice *)[objc_alloc((Class)PCCProxiedDevice) initWithEndpoint:v3->_bridgeEndpoint];
      bridgeLink = v3->_bridgeLink;
      v3->_bridgeLink = v12;

      if (!v3->_bridgeLink)
      {

        v3 = 0;
      }
    }
  }
  else
  {

    return 0;
  }
  return v3;
}

- (void)handleLaunchEvent
{
}

- (void)checkForPendingLogs
{
}

- (void)transferInternal:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serial_xfer_queue = self->_serial_xfer_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F664;
  block[3] = &unk_100020F80;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serial_xfer_queue, block);
}

- (void)enforceQuota
{
  id v6 = 0;
  uint64_t v7 = 0;
  int v2 = dirstat_np();
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v2 < 0)
  {
    if (v3)
    {
      dispatch_queue_t v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to dirstat [%s]", buf, 0xCu);
    }
  }
  else if (v3)
  {
    *(_DWORD *)buf = 134218240;
    id v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "enforceQuota usage: %llu bytes, %llu descendants", buf, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serial_xfer_queue, 0);
  objc_storeStrong((id *)&self->_xfer_counts, 0);
  objc_storeStrong((id *)&self->_bridgeEndpoint, 0);

  objc_storeStrong((id *)&self->_bridgeLink, 0);
}

@end