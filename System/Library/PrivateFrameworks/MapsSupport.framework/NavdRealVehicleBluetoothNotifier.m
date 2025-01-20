@interface NavdRealVehicleBluetoothNotifier
- (NavdRealVehicleBluetoothNotifier)init;
- (id).cxx_construct;
- (void)clear;
- (void)showWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
@end

@implementation NavdRealVehicleBluetoothNotifier

- (NavdRealVehicleBluetoothNotifier)init
{
  v11.receiver = self;
  v11.super_class = (Class)NavdRealVehicleBluetoothNotifier;
  v2 = [(NavdRealVehicleBluetoothNotifier *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100020238(&v9, @"NavdRealVehicleBluetoothNotifierQueue", v3);
    dispatch_queue_t v4 = v9;
    dispatch_queue_t v9 = 0;
    innerQueue = v2->_queue._innerQueue;
    v2->_queue._innerQueue = (OS_dispatch_queue *)v4;

    v6 = v10;
    v10 = 0;
    name = v2->_queue._name;
    v2->_queue._name = v6;

    sub_100041D80((uint64_t)v2);
  }
  return v2;
}

- (void)showWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041EC8;
  v11[3] = &unk_10008C260;
  v12 = self;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  innerQueue = v12->_queue._innerQueue;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  dispatch_async(innerQueue, v11);
}

- (void)clear
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100041FD4;
  v3[3] = &unk_1000896E8;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end