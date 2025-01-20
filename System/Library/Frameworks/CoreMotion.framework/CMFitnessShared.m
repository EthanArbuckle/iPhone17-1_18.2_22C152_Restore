@interface CMFitnessShared
+ (BOOL)isDeviceSatellitePaired;
+ (BOOL)isWorkoutEndReminderEnabledWhenDeviceIsInMoveTimeMode:(BOOL)a3 withCurrentSetting:(id)a4;
+ (BOOL)isWorkoutResumeReminderEnabledWhenDeviceIsInMoveTimeMode:(BOOL)a3 withCurrentSetting:(id)a4;
+ (BOOL)isWorkoutStartReminderEnabledWhenDeviceIsSatellitePaired:(BOOL)a3 isInMoveTimeMode:(BOOL)a4 withCurrentSetting:(id)a5;
@end

@implementation CMFitnessShared

+ (BOOL)isDeviceSatellitePaired
{
  Class v2 = (Class)off_1EB3BE8B0[0]();
  v5 = objc_msgSend_sharedInstance(v2, v3, v4);
  Class v6 = (Class)off_1EB3BE8B0[0]();
  uint64_t active = objc_msgSend_activePairedDeviceSelectorBlock(v6, v7, v8);
  AllDevicesWithArchivedAltAccountDevicesMatching = objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(v5, v10, active);
  Object = objc_msgSend_firstObject(AllDevicesWithArchivedAltAccountDevicesMatching, v12, v13);
  uint64_t v15 = off_1EB3BE8B8[0]();
  v17 = objc_msgSend_valueForProperty_(Object, v16, v15);

  return objc_msgSend_BOOLValue(v17, v18, v19);
}

+ (BOOL)isWorkoutStartReminderEnabledWhenDeviceIsSatellitePaired:(BOOL)a3 isInMoveTimeMode:(BOOL)a4 withCurrentSetting:(id)a5
{
  if (a4) {
    return 0;
  }
  if (a5) {
    return objc_msgSend_BOOLValue(a5, a2, a3);
  }
  return !a3;
}

+ (BOOL)isWorkoutEndReminderEnabledWhenDeviceIsInMoveTimeMode:(BOOL)a3 withCurrentSetting:(id)a4
{
  if (a3) {
    return 0;
  }
  if (a4) {
    return objc_msgSend_BOOLValue(a4, a2, a3);
  }
  return 1;
}

+ (BOOL)isWorkoutResumeReminderEnabledWhenDeviceIsInMoveTimeMode:(BOOL)a3 withCurrentSetting:(id)a4
{
  if (a3) {
    return 0;
  }
  if (a4) {
    return objc_msgSend_BOOLValue(a4, a2, a3);
  }
  return 1;
}

@end