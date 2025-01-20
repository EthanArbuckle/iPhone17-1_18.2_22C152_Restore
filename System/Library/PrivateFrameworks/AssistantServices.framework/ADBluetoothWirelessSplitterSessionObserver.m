@interface ADBluetoothWirelessSplitterSessionObserver
+ (id)sharedWirelessSplitterSessionObserver;
- (id)_init;
- (void)_invalidate;
- (void)bluetoothWirelessSplitterSession:(id)a3 sessionInfoDidChangeFrom:(id)a4 to:(id)a5;
- (void)bluetoothWirelessSplitterSessionDidInvalidate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation ADBluetoothWirelessSplitterSessionObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_wirelessSplitterSession, 0);
}

- (void)bluetoothWirelessSplitterSessionDidInvalidate:(id)a3
{
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[ADBluetoothWirelessSplitterSessionObserver bluetoothWirelessSplitterSessionDidInvalidate:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Wireless Splitter session invalidated", (uint8_t *)&v5, 0xCu);
  }
  [(ADBluetoothWirelessSplitterSessionObserver *)self _invalidate];
  [(AFNotifyStatePublisher *)self->_publisher publishState:AFBluetoothWirelessSplitterSessionStateUnknown];
}

- (void)bluetoothWirelessSplitterSession:(id)a3 sessionInfoDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    v14 = "-[ADBluetoothWirelessSplitterSessionObserver bluetoothWirelessSplitterSession:sessionInfoDidChangeFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Wireless Splitter session info changed from %@ to %@", (uint8_t *)&v13, 0x20u);
  }
  id v12 = [v9 state];
  if (v12 != [v10 state]) {
    -[AFNotifyStatePublisher publishState:](self->_publisher, "publishState:", [v10 state] == (id)2);
  }
}

- (void)_invalidate
{
  [(ADBluetoothWirelessSplitterSession *)self->_wirelessSplitterSession removeObserver:self];
  wirelessSplitterSession = self->_wirelessSplitterSession;
  self->_wirelessSplitterSession = 0;
}

- (void)stopObserving
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100359F28;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startObserving
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100359FC8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)ADBluetoothWirelessSplitterSessionObserver;
  v2 = [(ADBluetoothWirelessSplitterSessionObserver *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADBluetoothWirelessSplitterSessionObserver", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)AFNotifyStatePublisher);
    v7 = +[NSString stringWithUTF8String:AFBluetoothWirelessSplitterSessionStateChanged];
    id v8 = (AFNotifyStatePublisher *)[v6 initWithName:v7 queue:v2->_queue];
    publisher = v2->_publisher;
    v2->_publisher = v8;
  }
  return v2;
}

+ (id)sharedWirelessSplitterSessionObserver
{
  if (qword_100586450 != -1) {
    dispatch_once(&qword_100586450, &stru_10050D878);
  }
  v2 = (void *)qword_100586458;
  return v2;
}

@end