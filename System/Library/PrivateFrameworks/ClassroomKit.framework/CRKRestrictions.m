@interface CRKRestrictions
+ (NSString)classroomAirPlayAllowed;
+ (NSString)classroomAutomaticallyJoinClassesForced;
+ (NSString)classroomDeviceSettingsModificationAllowed;
+ (NSString)classroomLockDeviceAllowed;
+ (NSString)classroomOpenAppAllowed;
+ (NSString)classroomOpenDeepLinkAllowed;
+ (NSString)classroomOpenURLAllowed;
+ (NSString)classroomRequestPermissionToLeaveClassesForced;
+ (NSString)classroomRoles;
+ (NSString)classroomScreenObservationAllowed;
+ (NSString)classroomUnpromptedAppAndDeviceLockForced;
+ (NSString)classroomUnpromptedScreenObservationForced;
+ (NSString)didChangeNotification;
+ (NSString)remoteScreenObservationAllowed;
+ (NSString)screenShotAllowed;
+ (NSString)unpromptedRemoteScreenObservationForced;
@end

@implementation CRKRestrictions

+ (NSString)didChangeNotification
{
  return (NSString *)(id)*MEMORY[0x263F53B40];
}

+ (NSString)classroomAirPlayAllowed
{
  return (NSString *)(id)*MEMORY[0x263F537F8];
}

+ (NSString)classroomAutomaticallyJoinClassesForced
{
  return (NSString *)(id)*MEMORY[0x263F53800];
}

+ (NSString)classroomDeviceSettingsModificationAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53808];
}

+ (NSString)classroomLockDeviceAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53810];
}

+ (NSString)classroomOpenAppAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53818];
}

+ (NSString)classroomOpenDeepLinkAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53820];
}

+ (NSString)classroomOpenURLAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53828];
}

+ (NSString)classroomRequestPermissionToLeaveClassesForced
{
  return (NSString *)(id)*MEMORY[0x263F53830];
}

+ (NSString)classroomRoles
{
  return (NSString *)(id)*MEMORY[0x263F53838];
}

+ (NSString)classroomScreenObservationAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53840];
}

+ (NSString)classroomUnpromptedAppAndDeviceLockForced
{
  return (NSString *)(id)*MEMORY[0x263F53848];
}

+ (NSString)classroomUnpromptedScreenObservationForced
{
  return (NSString *)(id)*MEMORY[0x263F53850];
}

+ (NSString)remoteScreenObservationAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53A18];
}

+ (NSString)screenShotAllowed
{
  return (NSString *)(id)*MEMORY[0x263F53A48];
}

+ (NSString)unpromptedRemoteScreenObservationForced
{
  return (NSString *)(id)*MEMORY[0x263F53A98];
}

@end