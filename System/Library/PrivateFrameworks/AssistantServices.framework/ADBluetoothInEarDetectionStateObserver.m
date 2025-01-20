@interface ADBluetoothInEarDetectionStateObserver
+ (id)sharedObserver;
- (id)_init;
- (void)_invalidate;
- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5;
- (void)startObservingForBTAddress:(id)a3 forObserverID:(unint64_t)a4;
- (void)stopObservingForObserverID:(unint64_t)a3;
@end

@implementation ADBluetoothInEarDetectionStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    v15 = "-[ADBluetoothInEarDetectionStateObserver bluetoothDevice:headphoneInEarDetectionStateDidChangeFrom:to:]";
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s headphoneInEarDetectionStateDidChangeFrom from: %@ to: %@", (uint8_t *)&v14, 0x20u);
  }
  if (v9 != v10)
  {
    v12 = [v8 identifier];
    unint64_t v13 = +[AFBluetoothHeadphoneInEarDetectionState encodeForBTAddress:v12 headphoneInEarDetectionStateDidChangeFrom:v9 to:v10];

    [(AFNotifyStatePublisher *)self->_publisher publishState:v13];
  }
}

- (void)_invalidate
{
  bluetoothDevice = self->_bluetoothDevice;
  if (bluetoothDevice)
  {
    v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      v7 = "-[ADBluetoothInEarDetectionStateObserver _invalidate]";
      __int16 v8 = 2112;
      id v9 = bluetoothDevice;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Invallidating bluetooth device: %@", (uint8_t *)&v6, 0x16u);
      bluetoothDevice = self->_bluetoothDevice;
    }
    [(AFBluetoothDevice *)bluetoothDevice removeObserver:self];
    v5 = self->_bluetoothDevice;
    self->_bluetoothDevice = 0;
  }
}

- (void)stopObservingForObserverID:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10035A4B8;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startObservingForBTAddress:(id)a3 forObserverID:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035A7E8;
  block[3] = &unk_10050E278;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)ADBluetoothInEarDetectionStateObserver;
  v2 = [(ADBluetoothInEarDetectionStateObserver *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ADBluetoothInEarDetectionStateObserver", v5);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc((Class)AFNotifyStatePublisher);
    id v9 = +[NSString stringWithUTF8String:AFBluetoothInEarDetectionStateChanged];
    id v10 = (AFNotifyStatePublisher *)[v8 initWithName:v9 queue:v2->_queue];
    publisher = v2->_publisher;
    v2->_publisher = v10;
  }
  return v2;
}

+ (id)sharedObserver
{
  if (qword_100586460 != -1) {
    dispatch_once(&qword_100586460, &stru_10050D898);
  }
  v2 = (void *)qword_100586468;
  return v2;
}

@end