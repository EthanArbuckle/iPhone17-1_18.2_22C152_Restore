@interface MNHybridLocationProvider
+ (id)navdInstance;
@end

@implementation MNHybridLocationProvider

+ (id)navdInstance
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000367D0;
  v7[3] = &unk_100089C78;
  v7[4] = a1;
  v2 = objc_retainBlock(v7);
  if (+[NSThread isMainThread])
  {
    if (qword_1000A2578 != -1) {
      dispatch_once(&qword_1000A2578, v2);
    }
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100036938;
    v5[3] = &unk_10008AEB0;
    v6 = v2;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  }
  id v3 = (id)qword_1000A2570;

  return v3;
}

@end