@interface CKDiscretionaryDASScheduler
+ (double)minStartDelay;
+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11;
@end

@implementation CKDiscretionaryDASScheduler

+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11
{
  BOOL v13 = a6;
  id v17 = a11;
  id v18 = a10;
  v19 = a9;
  id v20 = a7;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  dispatch_assert_queue_V2(v19);
  v24 = [[CKDiscretionaryDASSchedulerTask alloc] initWithOperationID:v23 group:v22 bundleID:v21 requiresPastBuddy:v13 options:v20 state:a8 queue:v19 startHandler:v18 suspendHandler:v17];

  [(CKDiscretionaryDASSchedulerTask *)v24 _schedule];
  return v24;
}

+ (double)minStartDelay
{
  return 1.0;
}

@end