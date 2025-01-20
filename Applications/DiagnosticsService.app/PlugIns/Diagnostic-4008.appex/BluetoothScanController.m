@interface BluetoothScanController
- (id)checkPresence;
- (void)start;
@end

@implementation BluetoothScanController

- (void)start
{
  id v4 = [(BluetoothScanController *)self checkPresence];
  if (([(BluetoothScanController *)self isCancelled] & 1) == 0)
  {
    v3 = [(BluetoothScanController *)self result];
    [v3 setStatusCode:v4];
  }
  [(BluetoothScanController *)self setFinished:1];
}

- (id)checkPresence
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100002FA4;
  v17 = sub_100002FB4;
  v18 = &off_100008530;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[@"com.apple.Diagnostics.DABluetooth" UTF8String], 0);
  v6 = objc_alloc_init(OSDBluetooth);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002FBC;
  v10[3] = &unk_100008270;
  v10[4] = self;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  [(OSDBluetooth *)v6 performScanOnQueue:v5 timeout:v10 gracePeriod:10.0 completionBlock:2.0];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

@end