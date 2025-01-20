@interface BluetoothController
+ (id)sharedInstance;
- (BOOL)tetheringConnected;
- (BluetoothController)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)startWatchingForDevices;
- (void)stopWatchingForDevices;
@end

@implementation BluetoothController

- (BluetoothController)init
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_object_t v11 = dispatch_queue_create("CT.DATA.BTClient", v3);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v10, kCtLoggingSystemName, "DATA.BluetoothController");
  v9.receiver = self;
  v9.super_class = (Class)BluetoothController;
  v4 = [(BluetoothController *)&v9 initWithQueue:&v11 logContext:v10];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
  if (v11) {
    dispatch_release(v11);
  }
  if (v4)
  {
    v4->_discovery = 0;
    v4->_tetheringConnected = 0;
    [(BluetoothController *)v4 getLogContext];
    v5 = v8;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "init", v7, 2u);
    }
  }
  return v4;
}

+ (id)sharedInstance
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_101B13098, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_101B13098))
  {
    qword_101B13090 = objc_alloc_init(BluetoothController);
    __cxa_guard_release(&qword_101B13098);
  }
  return (id)qword_101B13090;
}

- (void)dealloc
{
  if (self)
  {
    [(BluetoothController *)self getLogContext];
    v3 = v6;
  }
  else
  {
    v3 = 0;
    *(void *)buf = 0;
    v6 = 0;
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }
  [(BluetoothController *)self stopWatchingForDevices];
  v4.receiver = self;
  v4.super_class = (Class)BluetoothController;
  [(BluetoothController *)&v4 dealloc];
}

- (void)startWatchingForDevices
{
  if (!self->_discovery)
  {
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    self->_discovery = v3;
    [(CBDiscovery *)v3 setDiscoveryFlags:0x200000];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1010272A4;
    v11[3] = &unk_1019B3470;
    v11[4] = self;
    [(BluetoothController *)self getQueue];
    [(CBDiscovery *)self->_discovery setDispatchQueue:(void)buf];
    if ((void)buf) {
      dispatch_release((dispatch_object_t)buf);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1010274C4;
    v10[3] = &unk_101A7F2F8;
    v10[4] = self;
    v10[5] = v11;
    [(CBDiscovery *)self->_discovery setDeviceFoundHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_101027684;
    v9[3] = &unk_101A7F2F8;
    v9[4] = self;
    v9[5] = v11;
    [(CBDiscovery *)self->_discovery setDeviceLostHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1010278E8;
    v8[3] = &unk_1019B3470;
    v8[4] = self;
    [(CBDiscovery *)self->_discovery setInvalidationHandler:v8];
    [(BluetoothController *)self getLogContext];
    objc_super v4 = *((void *)&buf + 1);
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&buf);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      discovery = self->_discovery;
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = discovery;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "start: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v6 = self->_discovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10102796C;
    v7[3] = &unk_101A6B540;
    v7[4] = self;
    [(CBDiscovery *)v6 activateWithCompletion:v7];
  }
}

- (void)stopWatchingForDevices
{
  discovery = self->_discovery;
  if (discovery)
  {
    [(CBDiscovery *)discovery invalidate];

    self->_discovery = 0;
  }
}

- (BOOL)tetheringConnected
{
  LOBYTE(self) = self->_tetheringConnected;
  pthread_mutex_unlock(&stru_101B0B848);
  return (char)self;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  return self;
}

@end