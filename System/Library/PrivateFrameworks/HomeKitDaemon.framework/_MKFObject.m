@interface _MKFObject
+ (Protocol)backingModelProtocol;
- (MKFObjectDatabaseID)databaseID;
- (id)castIfAccessory;
- (id)castIfAccessoryNetworkProtectionGroup;
- (id)castIfAccount;
- (id)castIfAccountHandle;
- (id)castIfAction;
- (id)castIfActionSet;
- (id)castIfAirPlayAccessory;
- (id)castIfAnalysisEventBulletinRegistration;
- (id)castIfAppleMediaAccessory;
- (id)castIfAppleMediaAccessoryPowerAction;
- (id)castIfApplicationData;
- (id)castIfBulletinCondition;
- (id)castIfBulletinRegistration;
- (id)castIfBulletinTimeSpecification;
- (id)castIfCalendarEvent;
- (id)castIfCameraAccessModeBulletinRegistration;
- (id)castIfCameraReachabilityBulletinRegistration;
- (id)castIfCameraSignificantEventBulletinRegistration;
- (id)castIfCharacteristic;
- (id)castIfCharacteristicBulletinRegistration;
- (id)castIfCharacteristicEvent;
- (id)castIfCharacteristicRangeEvent;
- (id)castIfCharacteristicValueEvent;
- (id)castIfCharacteristicWriteAction;
- (id)castIfDevice;
- (id)castIfDurationEvent;
- (id)castIfEvent;
- (id)castIfEventTrigger;
- (id)castIfFloatCharacteristic;
- (id)castIfGuest;
- (id)castIfGuestAccessCode;
- (id)castIfHAPAccessory;
- (id)castIfHAPMetadata;
- (id)castIfHome;
- (id)castIfHomeAccessCode;
- (id)castIfHomeManager;
- (id)castIfHomeManagerHome;
- (id)castIfHomeMediaSetting;
- (id)castIfHomeNetworkRouterManagingDeviceSetting;
- (id)castIfHomeNetworkRouterSetting;
- (id)castIfHomePerson;
- (id)castIfHomePersonManagerSetting;
- (id)castIfHomeSetting;
- (id)castIfHomeSoftwareUpdateSetting;
- (id)castIfHomeThreadNetwork;
- (id)castIfIncomingInvitation;
- (id)castIfIntegerCharacteristic;
- (id)castIfInvitation;
- (id)castIfLocationEvent;
- (id)castIfMatterAttributeEvent;
- (id)castIfMatterAttributeValueEvent;
- (id)castIfMatterBulletinRegistration;
- (id)castIfMatterCommandAction;
- (id)castIfMatterLocalKeyValuePair;
- (id)castIfMatterPath;
- (id)castIfMediaAccessory;
- (id)castIfMediaPlaybackAction;
- (id)castIfNaturalLightingAction;
- (id)castIfNotificationRegistration;
- (id)castIfNotificationRegistrationActionSet;
- (id)castIfNotificationRegistrationCharacteristic;
- (id)castIfNotificationRegistrationMediaProperty;
- (id)castIfOutgoingInvitation;
- (id)castIfPerson;
- (id)castIfPhotosPerson;
- (id)castIfPresenceBulletinCondition;
- (id)castIfPresenceEvent;
- (id)castIfRemovedUserAccessCode;
- (id)castIfResident;
- (id)castIfResidentSelection;
- (id)castIfRoom;
- (id)castIfService;
- (id)castIfServiceGroup;
- (id)castIfShortcutAction;
- (id)castIfSignificantTimeEvent;
- (id)castIfSoftwareUpdate;
- (id)castIfStringCharacteristic;
- (id)castIfSunriseSunsetTimeSpecification;
- (id)castIfTimeOfDayTimeSpecification;
- (id)castIfTimePeriodBulletinCondition;
- (id)castIfTimerTrigger;
- (id)castIfTrigger;
- (id)castIfUser;
- (id)castIfUserAccessCode;
- (id)castIfUserActivityStatus;
- (id)castIfWeekDayScheduleRule;
- (id)castIfYearDayScheduleRule;
- (id)castIfZone;
@end

@implementation _MKFObject

+ (Protocol)backingModelProtocol
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (MKFObjectDatabaseID)databaseID
{
  v2 = [[MKFObjectDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)castIfZone
{
  return 0;
}

- (id)castIfYearDayScheduleRule
{
  return 0;
}

- (id)castIfWeekDayScheduleRule
{
  return 0;
}

- (id)castIfUserActivityStatus
{
  return 0;
}

- (id)castIfUserAccessCode
{
  return 0;
}

- (id)castIfUser
{
  return 0;
}

- (id)castIfTrigger
{
  return 0;
}

- (id)castIfTimerTrigger
{
  return 0;
}

- (id)castIfTimePeriodBulletinCondition
{
  return 0;
}

- (id)castIfTimeOfDayTimeSpecification
{
  return 0;
}

- (id)castIfSunriseSunsetTimeSpecification
{
  return 0;
}

- (id)castIfStringCharacteristic
{
  return 0;
}

- (id)castIfSoftwareUpdate
{
  return 0;
}

- (id)castIfSignificantTimeEvent
{
  return 0;
}

- (id)castIfShortcutAction
{
  return 0;
}

- (id)castIfServiceGroup
{
  return 0;
}

- (id)castIfService
{
  return 0;
}

- (id)castIfRoom
{
  return 0;
}

- (id)castIfResidentSelection
{
  return 0;
}

- (id)castIfResident
{
  return 0;
}

- (id)castIfRemovedUserAccessCode
{
  return 0;
}

- (id)castIfPresenceEvent
{
  return 0;
}

- (id)castIfPresenceBulletinCondition
{
  return 0;
}

- (id)castIfPhotosPerson
{
  return 0;
}

- (id)castIfPerson
{
  return 0;
}

- (id)castIfOutgoingInvitation
{
  return 0;
}

- (id)castIfNotificationRegistrationMediaProperty
{
  return 0;
}

- (id)castIfNotificationRegistrationCharacteristic
{
  return 0;
}

- (id)castIfNotificationRegistrationActionSet
{
  return 0;
}

- (id)castIfNotificationRegistration
{
  return 0;
}

- (id)castIfNaturalLightingAction
{
  return 0;
}

- (id)castIfMediaPlaybackAction
{
  return 0;
}

- (id)castIfMediaAccessory
{
  return 0;
}

- (id)castIfMatterLocalKeyValuePair
{
  return 0;
}

- (id)castIfMatterPath
{
  return 0;
}

- (id)castIfMatterBulletinRegistration
{
  return 0;
}

- (id)castIfMatterCommandAction
{
  return 0;
}

- (id)castIfMatterAttributeValueEvent
{
  return 0;
}

- (id)castIfMatterAttributeEvent
{
  return 0;
}

- (id)castIfLocationEvent
{
  return 0;
}

- (id)castIfInvitation
{
  return 0;
}

- (id)castIfIntegerCharacteristic
{
  return 0;
}

- (id)castIfIncomingInvitation
{
  return 0;
}

- (id)castIfHomeThreadNetwork
{
  return 0;
}

- (id)castIfHomeSoftwareUpdateSetting
{
  return 0;
}

- (id)castIfHomeSetting
{
  return 0;
}

- (id)castIfHomePersonManagerSetting
{
  return 0;
}

- (id)castIfHomePerson
{
  return 0;
}

- (id)castIfHomeNetworkRouterSetting
{
  return 0;
}

- (id)castIfHomeNetworkRouterManagingDeviceSetting
{
  return 0;
}

- (id)castIfHomeMediaSetting
{
  return 0;
}

- (id)castIfHomeManagerHome
{
  return 0;
}

- (id)castIfHomeManager
{
  return 0;
}

- (id)castIfHomeAccessCode
{
  return 0;
}

- (id)castIfHome
{
  return 0;
}

- (id)castIfHAPMetadata
{
  return 0;
}

- (id)castIfHAPAccessory
{
  return 0;
}

- (id)castIfGuestAccessCode
{
  return 0;
}

- (id)castIfGuest
{
  return 0;
}

- (id)castIfFloatCharacteristic
{
  return 0;
}

- (id)castIfEventTrigger
{
  return 0;
}

- (id)castIfEvent
{
  return 0;
}

- (id)castIfDurationEvent
{
  return 0;
}

- (id)castIfDevice
{
  return 0;
}

- (id)castIfCharacteristicWriteAction
{
  return 0;
}

- (id)castIfCharacteristicValueEvent
{
  return 0;
}

- (id)castIfCharacteristicRangeEvent
{
  return 0;
}

- (id)castIfCharacteristicEvent
{
  return 0;
}

- (id)castIfCharacteristicBulletinRegistration
{
  return 0;
}

- (id)castIfCharacteristic
{
  return 0;
}

- (id)castIfCameraSignificantEventBulletinRegistration
{
  return 0;
}

- (id)castIfCameraReachabilityBulletinRegistration
{
  return 0;
}

- (id)castIfCameraAccessModeBulletinRegistration
{
  return 0;
}

- (id)castIfCalendarEvent
{
  return 0;
}

- (id)castIfBulletinTimeSpecification
{
  return 0;
}

- (id)castIfBulletinRegistration
{
  return 0;
}

- (id)castIfBulletinCondition
{
  return 0;
}

- (id)castIfApplicationData
{
  return 0;
}

- (id)castIfAppleMediaAccessoryPowerAction
{
  return 0;
}

- (id)castIfAppleMediaAccessory
{
  return 0;
}

- (id)castIfAnalysisEventBulletinRegistration
{
  return 0;
}

- (id)castIfAirPlayAccessory
{
  return 0;
}

- (id)castIfActionSet
{
  return 0;
}

- (id)castIfAction
{
  return 0;
}

- (id)castIfAccountHandle
{
  return 0;
}

- (id)castIfAccount
{
  return 0;
}

- (id)castIfAccessoryNetworkProtectionGroup
{
  return 0;
}

- (id)castIfAccessory
{
  return 0;
}

@end