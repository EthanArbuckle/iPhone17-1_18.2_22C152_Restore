@interface SAAlarmSnooze
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SAAlarmSnooze

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a5;
  v11 = sub_1002ABC8C(a3);
  v12 = [(SAAlarmSnooze *)self alarmIds];
  v13 = sub_10007AD38(v11, v12, v7);

  v14 = [v13 deviceInfo];
  id v15 = sub_1002ABD0C(v10, v14);

  v16 = [(SAAlarmSnooze *)self alarmIds];
  v17 = sub_10007AF80(v13, (uint64_t)v15, v16, @"snooze");

  return v17;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 1;
}

- (BOOL)ad_requiresDeviceContext
{
  return 1;
}

@end