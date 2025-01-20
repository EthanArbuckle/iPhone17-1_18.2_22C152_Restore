@interface CRKFeatures
+ (id)allClassroomCRKFeatures;
+ (id)allClassroomTopLevelRestrictions;
@end

@implementation CRKFeatures

+ (id)allClassroomCRKFeatures
{
  if (allClassroomCRKFeatures_onceToken != -1) {
    dispatch_once(&allClassroomCRKFeatures_onceToken, &__block_literal_global_52);
  }
  v2 = (void *)allClassroomCRKFeatures_allClassroomCRKFeatures;

  return v2;
}

void __38__CRKFeatures_allClassroomCRKFeatures__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v5 = +[CRKRestrictions classroomLockDeviceAllowed];
  v1 = +[CRKRestrictions classroomOpenAppAllowed];
  v2 = +[CRKRestrictions classroomScreenObservationAllowed];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v5, v1, v2, 0);
  v4 = (void *)allClassroomCRKFeatures_allClassroomCRKFeatures;
  allClassroomCRKFeatures_allClassroomCRKFeatures = v3;
}

+ (id)allClassroomTopLevelRestrictions
{
  if (allClassroomTopLevelRestrictions_onceToken != -1) {
    dispatch_once(&allClassroomTopLevelRestrictions_onceToken, &__block_literal_global_3_2);
  }
  v2 = (void *)allClassroomTopLevelRestrictions_allClassroomTopLevelRestrictions;

  return v2;
}

void __47__CRKFeatures_allClassroomTopLevelRestrictions__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v8 = +[CRKRestrictions remoteScreenObservationAllowed];
  v1 = +[CRKRestrictions screenShotAllowed];
  v2 = +[CRKRestrictions classroomAutomaticallyJoinClassesForced];
  uint64_t v3 = +[CRKRestrictions classroomRequestPermissionToLeaveClassesForced];
  v4 = +[CRKRestrictions classroomUnpromptedAppAndDeviceLockForced];
  id v5 = +[CRKRestrictions classroomUnpromptedScreenObservationForced];
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v7 = (void *)allClassroomTopLevelRestrictions_allClassroomTopLevelRestrictions;
  allClassroomTopLevelRestrictions_allClassroomTopLevelRestrictions = v6;
}

@end