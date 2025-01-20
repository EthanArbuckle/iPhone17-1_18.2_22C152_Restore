@interface HKWorkout(HDDataEntity)
- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:;
@end

@implementation HKWorkout(HDDataEntity)

- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12 = a3;
  id v13 = a6;
  v16.receiver = a1;
  v16.super_class = (Class)&off_1F187B540;
  if (objc_msgSendSuper2(&v16, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, v12, a4, a5, v13, a7))BOOL v14 = +[HDWorkoutEventEntity insertWorkoutEventsFromWorkout:a1 ownerID:v12 transaction:v13 error:a7]; {
  else
  }
    BOOL v14 = 0;

  return v14;
}

@end