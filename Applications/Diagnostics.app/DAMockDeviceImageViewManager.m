@interface DAMockDeviceImageViewManager
+ (id)sharedInstance;
- (void)deviceImageViewForDeviceState:(id)a3 completion:(id)a4;
@end

@implementation DAMockDeviceImageViewManager

+ (id)sharedInstance
{
  if (qword_100186958 != -1) {
    dispatch_once(&qword_100186958, &stru_10014BFB0);
  }
  v2 = (void *)qword_100186950;

  return v2;
}

- (void)deviceImageViewForDeviceState:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021324;
  v10[3] = &unk_10014B100;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

@end