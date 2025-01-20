@interface DADeviceObserverLocal
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
@end

@implementation DADeviceObserverLocal

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v3 = [(DADeviceObserverLocal *)self beginDiscoveringDevicesWithHandler:a3];
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B88;
  block[3] = &unk_100014670;
  id v9 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  v6 = +[NSUUID UUID];

  return v6;
}

@end