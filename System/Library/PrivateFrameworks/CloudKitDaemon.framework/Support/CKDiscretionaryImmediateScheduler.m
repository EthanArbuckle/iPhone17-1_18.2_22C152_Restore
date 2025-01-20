@interface CKDiscretionaryImmediateScheduler
+ (double)minStartDelay;
+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11;
@end

@implementation CKDiscretionaryImmediateScheduler

+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11
{
  id v12 = a10;
  v13 = a9;
  v14 = objc_alloc_init(CKDiscretionarySchedulerTask);
  [(CKDiscretionarySchedulerTask *)v14 setState:a8];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007130;
  block[3] = &unk_100010628;
  id v18 = v12;
  id v15 = v12;
  dispatch_async(v13, block);

  return v14;
}

+ (double)minStartDelay
{
  return 0.0;
}

@end