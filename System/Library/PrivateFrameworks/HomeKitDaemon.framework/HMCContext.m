@interface HMCContext
+ (BOOL)managedObjectIsMKF:(id)a3;
+ (Class)managedObjectClassFromProtocol:(id)a3;
+ (HMCContext)currentContext;
+ (id)findAccessoryNetworkProtectionGroupWithDatabaseID:(id)a3;
+ (id)findAccessoryNetworkProtectionGroupWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAccessoryNetworkProtectionGroupWithModelID:(id)a3;
+ (id)findAccessoryNetworkProtectionGroupWithModelID:(id)a3 error:(id *)a4;
+ (id)findAccessoryWithDatabaseID:(id)a3;
+ (id)findAccessoryWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAccessoryWithModelID:(id)a3;
+ (id)findAccessoryWithModelID:(id)a3 error:(id *)a4;
+ (id)findAccountHandleWithDatabaseID:(id)a3;
+ (id)findAccountHandleWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAccountHandleWithModelID:(id)a3;
+ (id)findAccountHandleWithModelID:(id)a3 error:(id *)a4;
+ (id)findAccountWithDatabaseID:(id)a3;
+ (id)findAccountWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAccountWithModelID:(id)a3;
+ (id)findAccountWithModelID:(id)a3 error:(id *)a4;
+ (id)findActionSetWithDatabaseID:(id)a3;
+ (id)findActionSetWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findActionSetWithModelID:(id)a3;
+ (id)findActionSetWithModelID:(id)a3 error:(id *)a4;
+ (id)findActionWithDatabaseID:(id)a3;
+ (id)findActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findActionWithModelID:(id)a3;
+ (id)findActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findAirPlayAccessoryWithDatabaseID:(id)a3;
+ (id)findAirPlayAccessoryWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAirPlayAccessoryWithModelID:(id)a3;
+ (id)findAirPlayAccessoryWithModelID:(id)a3 error:(id *)a4;
+ (id)findAllModelsOfType:(id)a3 error:(id *)a4;
+ (id)findAnalysisEventBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findAnalysisEventBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAnalysisEventBulletinRegistrationWithModelID:(id)a3;
+ (id)findAnalysisEventBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findAppleMediaAccessoryPowerActionWithDatabaseID:(id)a3;
+ (id)findAppleMediaAccessoryPowerActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAppleMediaAccessoryPowerActionWithModelID:(id)a3;
+ (id)findAppleMediaAccessoryPowerActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findAppleMediaAccessoryWithDatabaseID:(id)a3;
+ (id)findAppleMediaAccessoryWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findAppleMediaAccessoryWithModelID:(id)a3;
+ (id)findAppleMediaAccessoryWithModelID:(id)a3 error:(id *)a4;
+ (id)findApplicationDataWithDatabaseID:(id)a3;
+ (id)findApplicationDataWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findApplicationDataWithModelID:(id)a3;
+ (id)findApplicationDataWithModelID:(id)a3 error:(id *)a4;
+ (id)findBulletinConditionWithDatabaseID:(id)a3;
+ (id)findBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findBulletinConditionWithModelID:(id)a3;
+ (id)findBulletinConditionWithModelID:(id)a3 error:(id *)a4;
+ (id)findBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findBulletinRegistrationWithModelID:(id)a3;
+ (id)findBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findBulletinTimeSpecificationWithDatabaseID:(id)a3;
+ (id)findBulletinTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findBulletinTimeSpecificationWithModelID:(id)a3;
+ (id)findBulletinTimeSpecificationWithModelID:(id)a3 error:(id *)a4;
+ (id)findCalendarEventWithDatabaseID:(id)a3;
+ (id)findCalendarEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCalendarEventWithModelID:(id)a3;
+ (id)findCalendarEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findCameraAccessModeBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findCameraAccessModeBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCameraAccessModeBulletinRegistrationWithModelID:(id)a3;
+ (id)findCameraAccessModeBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findCameraReachabilityBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findCameraReachabilityBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCameraReachabilityBulletinRegistrationWithModelID:(id)a3;
+ (id)findCameraReachabilityBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findCameraSignificantEventBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findCameraSignificantEventBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCameraSignificantEventBulletinRegistrationWithModelID:(id)a3;
+ (id)findCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findCharacteristicBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicBulletinRegistrationWithModelID:(id)a3;
+ (id)findCharacteristicBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicEventWithDatabaseID:(id)a3;
+ (id)findCharacteristicEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicEventWithModelID:(id)a3;
+ (id)findCharacteristicEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicRangeEventWithDatabaseID:(id)a3;
+ (id)findCharacteristicRangeEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicRangeEventWithModelID:(id)a3;
+ (id)findCharacteristicRangeEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicValueEventWithDatabaseID:(id)a3;
+ (id)findCharacteristicValueEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicValueEventWithModelID:(id)a3;
+ (id)findCharacteristicValueEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicWithDatabaseID:(id)a3;
+ (id)findCharacteristicWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicWithInstanceID:(id)a3 service:(id)a4;
+ (id)findCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5;
+ (id)findCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4;
+ (id)findCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5;
+ (id)findCharacteristicWriteActionWithDatabaseID:(id)a3;
+ (id)findCharacteristicWriteActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findCharacteristicWriteActionWithModelID:(id)a3;
+ (id)findCharacteristicWriteActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findDeviceWithDatabaseID:(id)a3;
+ (id)findDeviceWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findDeviceWithDeviceIdentifier:(id)a3;
+ (id)findDeviceWithModelID:(id)a3;
+ (id)findDeviceWithModelID:(id)a3 error:(id *)a4;
+ (id)findDurationEventWithDatabaseID:(id)a3;
+ (id)findDurationEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findDurationEventWithModelID:(id)a3;
+ (id)findDurationEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findEventTriggerWithDatabaseID:(id)a3;
+ (id)findEventTriggerWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findEventTriggerWithModelID:(id)a3;
+ (id)findEventTriggerWithModelID:(id)a3 error:(id *)a4;
+ (id)findEventWithDatabaseID:(id)a3;
+ (id)findEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findEventWithModelID:(id)a3;
+ (id)findEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findFloatCharacteristicWithDatabaseID:(id)a3;
+ (id)findFloatCharacteristicWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findFloatCharacteristicWithInstanceID:(id)a3 service:(id)a4;
+ (id)findFloatCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5;
+ (id)findFloatCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4;
+ (id)findFloatCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5;
+ (id)findGuestAccessCodeWithDatabaseID:(id)a3;
+ (id)findGuestAccessCodeWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findGuestAccessCodeWithModelID:(id)a3;
+ (id)findGuestAccessCodeWithModelID:(id)a3 error:(id *)a4;
+ (id)findGuestWithDatabaseID:(id)a3;
+ (id)findGuestWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findGuestWithModelID:(id)a3;
+ (id)findGuestWithModelID:(id)a3 error:(id *)a4;
+ (id)findHAPAccessoryWithDatabaseID:(id)a3;
+ (id)findHAPAccessoryWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHAPAccessoryWithModelID:(id)a3;
+ (id)findHAPAccessoryWithModelID:(id)a3 error:(id *)a4;
+ (id)findHAPMetadataWithDatabaseID:(id)a3;
+ (id)findHAPMetadataWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHAPMetadataWithModelID:(id)a3;
+ (id)findHAPMetadataWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeAccessCodeWithDatabaseID:(id)a3;
+ (id)findHomeAccessCodeWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeAccessCodeWithModelID:(id)a3;
+ (id)findHomeAccessCodeWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeManagerHomeWithDatabaseID:(id)a3;
+ (id)findHomeManagerHomeWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeManagerHomeWithModelID:(id)a3;
+ (id)findHomeManagerHomeWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeManagerWithDatabaseID:(id)a3;
+ (id)findHomeManagerWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeManagerWithModelID:(id)a3;
+ (id)findHomeManagerWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeMediaSettingWithDatabaseID:(id)a3;
+ (id)findHomeMediaSettingWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeMediaSettingWithModelID:(id)a3;
+ (id)findHomeMediaSettingWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeNetworkRouterManagingDeviceSettingWithDatabaseID:(id)a3;
+ (id)findHomeNetworkRouterManagingDeviceSettingWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeNetworkRouterManagingDeviceSettingWithModelID:(id)a3;
+ (id)findHomeNetworkRouterManagingDeviceSettingWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeNetworkRouterSettingWithDatabaseID:(id)a3;
+ (id)findHomeNetworkRouterSettingWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeNetworkRouterSettingWithModelID:(id)a3;
+ (id)findHomeNetworkRouterSettingWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomePersonManagerSettingWithDatabaseID:(id)a3;
+ (id)findHomePersonManagerSettingWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomePersonManagerSettingWithModelID:(id)a3;
+ (id)findHomePersonManagerSettingWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomePersonWithDatabaseID:(id)a3;
+ (id)findHomePersonWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomePersonWithModelID:(id)a3;
+ (id)findHomePersonWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeSettingWithDatabaseID:(id)a3;
+ (id)findHomeSettingWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeSettingWithModelID:(id)a3;
+ (id)findHomeSettingWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeSoftwareUpdateSettingWithDatabaseID:(id)a3;
+ (id)findHomeSoftwareUpdateSettingWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeSoftwareUpdateSettingWithModelID:(id)a3;
+ (id)findHomeSoftwareUpdateSettingWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeThreadNetworkWithDatabaseID:(id)a3;
+ (id)findHomeThreadNetworkWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeThreadNetworkWithModelID:(id)a3;
+ (id)findHomeThreadNetworkWithModelID:(id)a3 error:(id *)a4;
+ (id)findHomeWithDatabaseID:(id)a3;
+ (id)findHomeWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findHomeWithModelID:(id)a3;
+ (id)findHomeWithModelID:(id)a3 error:(id *)a4;
+ (id)findIncomingInvitationWithDatabaseID:(id)a3;
+ (id)findIncomingInvitationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findIncomingInvitationWithModelID:(id)a3;
+ (id)findIncomingInvitationWithModelID:(id)a3 error:(id *)a4;
+ (id)findIntegerCharacteristicWithDatabaseID:(id)a3;
+ (id)findIntegerCharacteristicWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 service:(id)a4;
+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5;
+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4;
+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5;
+ (id)findInvitationWithDatabaseID:(id)a3;
+ (id)findInvitationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findInvitationWithModelID:(id)a3;
+ (id)findInvitationWithModelID:(id)a3 error:(id *)a4;
+ (id)findLocationEventWithDatabaseID:(id)a3;
+ (id)findLocationEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findLocationEventWithModelID:(id)a3;
+ (id)findLocationEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findMatterAttributeEventWithDatabaseID:(id)a3;
+ (id)findMatterAttributeEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMatterAttributeEventWithModelID:(id)a3;
+ (id)findMatterAttributeEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findMatterAttributeValueEventWithDatabaseID:(id)a3;
+ (id)findMatterAttributeValueEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMatterAttributeValueEventWithModelID:(id)a3;
+ (id)findMatterAttributeValueEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findMatterBulletinRegistrationWithDatabaseID:(id)a3;
+ (id)findMatterBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMatterBulletinRegistrationWithModelID:(id)a3;
+ (id)findMatterBulletinRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findMatterCommandActionWithDatabaseID:(id)a3;
+ (id)findMatterCommandActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMatterCommandActionWithModelID:(id)a3;
+ (id)findMatterCommandActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findMatterLocalKeyValuePairWithDatabaseID:(id)a3;
+ (id)findMatterLocalKeyValuePairWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMatterLocalKeyValuePairWithKey:(id)a3;
+ (id)findMatterLocalKeyValuePairWithKey:(id)a3 error:(id *)a4;
+ (id)findMatterPathWithDatabaseID:(id)a3;
+ (id)findMatterPathWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMatterPathWithModelID:(id)a3;
+ (id)findMatterPathWithModelID:(id)a3 error:(id *)a4;
+ (id)findMediaAccessoryWithDatabaseID:(id)a3;
+ (id)findMediaAccessoryWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMediaAccessoryWithModelID:(id)a3;
+ (id)findMediaAccessoryWithModelID:(id)a3 error:(id *)a4;
+ (id)findMediaPlaybackActionWithDatabaseID:(id)a3;
+ (id)findMediaPlaybackActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findMediaPlaybackActionWithModelID:(id)a3;
+ (id)findMediaPlaybackActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findModelObjectOfType:(id)a3 databaseID:(id)a4 error:(id *)a5;
+ (id)findModelObjectOfType:(id)a3 parentObjectID:(id)a4 template:(id)a5 substitutions:(id)a6 error:(id *)a7;
+ (id)findModelObjectOfType:(id)a3 template:(id)a4 substitutions:(id)a5 error:(id *)a6;
+ (id)findModelWithModelID:(id)a3 ofType:(id)a4 error:(id *)a5;
+ (id)findNaturalLightingActionWithDatabaseID:(id)a3;
+ (id)findNaturalLightingActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findNaturalLightingActionWithModelID:(id)a3;
+ (id)findNaturalLightingActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationActionSetWithDatabaseID:(id)a3;
+ (id)findNotificationRegistrationActionSetWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationActionSetWithModelID:(id)a3;
+ (id)findNotificationRegistrationActionSetWithModelID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationCharacteristicWithDatabaseID:(id)a3;
+ (id)findNotificationRegistrationCharacteristicWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationCharacteristicWithModelID:(id)a3;
+ (id)findNotificationRegistrationCharacteristicWithModelID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationMediaPropertyWithDatabaseID:(id)a3;
+ (id)findNotificationRegistrationMediaPropertyWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationMediaPropertyWithModelID:(id)a3;
+ (id)findNotificationRegistrationMediaPropertyWithModelID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationWithDatabaseID:(id)a3;
+ (id)findNotificationRegistrationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findNotificationRegistrationWithModelID:(id)a3;
+ (id)findNotificationRegistrationWithModelID:(id)a3 error:(id *)a4;
+ (id)findOutgoingInvitationWithDatabaseID:(id)a3;
+ (id)findOutgoingInvitationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findOutgoingInvitationWithModelID:(id)a3;
+ (id)findOutgoingInvitationWithModelID:(id)a3 error:(id *)a4;
+ (id)findPersonWithDatabaseID:(id)a3;
+ (id)findPersonWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findPersonWithModelID:(id)a3;
+ (id)findPersonWithModelID:(id)a3 error:(id *)a4;
+ (id)findPhotosPersonWithDatabaseID:(id)a3;
+ (id)findPhotosPersonWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findPhotosPersonWithModelID:(id)a3;
+ (id)findPhotosPersonWithModelID:(id)a3 error:(id *)a4;
+ (id)findPresenceBulletinConditionWithDatabaseID:(id)a3;
+ (id)findPresenceBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findPresenceBulletinConditionWithModelID:(id)a3;
+ (id)findPresenceBulletinConditionWithModelID:(id)a3 error:(id *)a4;
+ (id)findPresenceEventWithDatabaseID:(id)a3;
+ (id)findPresenceEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findPresenceEventWithModelID:(id)a3;
+ (id)findPresenceEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findRemovedUserAccessCodeWithDatabaseID:(id)a3;
+ (id)findRemovedUserAccessCodeWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findRemovedUserAccessCodeWithModelID:(id)a3;
+ (id)findRemovedUserAccessCodeWithModelID:(id)a3 error:(id *)a4;
+ (id)findResidentSelectionWithDatabaseID:(id)a3;
+ (id)findResidentSelectionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findResidentSelectionWithModelID:(id)a3;
+ (id)findResidentSelectionWithModelID:(id)a3 error:(id *)a4;
+ (id)findResidentWithDatabaseID:(id)a3;
+ (id)findResidentWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findResidentWithModelID:(id)a3;
+ (id)findResidentWithModelID:(id)a3 error:(id *)a4;
+ (id)findRoomWithDatabaseID:(id)a3;
+ (id)findRoomWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findRoomWithModelID:(id)a3;
+ (id)findRoomWithModelID:(id)a3 error:(id *)a4;
+ (id)findServiceGroupWithDatabaseID:(id)a3;
+ (id)findServiceGroupWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findServiceGroupWithModelID:(id)a3;
+ (id)findServiceGroupWithModelID:(id)a3 error:(id *)a4;
+ (id)findServiceWithDatabaseID:(id)a3;
+ (id)findServiceWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findServiceWithInstanceID:(id)a3 accessory:(id)a4;
+ (id)findServiceWithInstanceID:(id)a3 accessory:(id)a4 error:(id *)a5;
+ (id)findServiceWithInstanceID:(id)a3 accessoryDatabaseID:(id)a4;
+ (id)findServiceWithInstanceID:(id)a3 accessoryDatabaseID:(id)a4 error:(id *)a5;
+ (id)findServiceWithModelID:(id)a3;
+ (id)findServiceWithModelID:(id)a3 error:(id *)a4;
+ (id)findShortcutActionWithDatabaseID:(id)a3;
+ (id)findShortcutActionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findShortcutActionWithModelID:(id)a3;
+ (id)findShortcutActionWithModelID:(id)a3 error:(id *)a4;
+ (id)findSignificantTimeEventWithDatabaseID:(id)a3;
+ (id)findSignificantTimeEventWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findSignificantTimeEventWithModelID:(id)a3;
+ (id)findSignificantTimeEventWithModelID:(id)a3 error:(id *)a4;
+ (id)findSoftwareUpdateWithDatabaseID:(id)a3;
+ (id)findSoftwareUpdateWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findSoftwareUpdateWithModelID:(id)a3;
+ (id)findSoftwareUpdateWithModelID:(id)a3 error:(id *)a4;
+ (id)findStringCharacteristicWithDatabaseID:(id)a3;
+ (id)findStringCharacteristicWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findStringCharacteristicWithInstanceID:(id)a3 service:(id)a4;
+ (id)findStringCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5;
+ (id)findStringCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4;
+ (id)findStringCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5;
+ (id)findSunriseSunsetTimeSpecificationWithDatabaseID:(id)a3;
+ (id)findSunriseSunsetTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findSunriseSunsetTimeSpecificationWithModelID:(id)a3;
+ (id)findSunriseSunsetTimeSpecificationWithModelID:(id)a3 error:(id *)a4;
+ (id)findTimeOfDayTimeSpecificationWithDatabaseID:(id)a3;
+ (id)findTimeOfDayTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findTimeOfDayTimeSpecificationWithModelID:(id)a3;
+ (id)findTimeOfDayTimeSpecificationWithModelID:(id)a3 error:(id *)a4;
+ (id)findTimePeriodBulletinConditionWithDatabaseID:(id)a3;
+ (id)findTimePeriodBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findTimePeriodBulletinConditionWithModelID:(id)a3;
+ (id)findTimePeriodBulletinConditionWithModelID:(id)a3 error:(id *)a4;
+ (id)findTimerTriggerWithDatabaseID:(id)a3;
+ (id)findTimerTriggerWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findTimerTriggerWithModelID:(id)a3;
+ (id)findTimerTriggerWithModelID:(id)a3 error:(id *)a4;
+ (id)findTriggerWithDatabaseID:(id)a3;
+ (id)findTriggerWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findTriggerWithModelID:(id)a3;
+ (id)findTriggerWithModelID:(id)a3 error:(id *)a4;
+ (id)findUserAccessCodeWithDatabaseID:(id)a3;
+ (id)findUserAccessCodeWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findUserAccessCodeWithModelID:(id)a3;
+ (id)findUserAccessCodeWithModelID:(id)a3 error:(id *)a4;
+ (id)findUserActivityStatusWithDatabaseID:(id)a3;
+ (id)findUserActivityStatusWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findUserActivityStatusWithModelID:(id)a3;
+ (id)findUserActivityStatusWithModelID:(id)a3 error:(id *)a4;
+ (id)findUserWithDatabaseID:(id)a3;
+ (id)findUserWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findUserWithModelID:(id)a3;
+ (id)findUserWithModelID:(id)a3 error:(id *)a4;
+ (id)findWeekDayScheduleRuleWithDatabaseID:(id)a3;
+ (id)findWeekDayScheduleRuleWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findWeekDayScheduleRuleWithModelID:(id)a3;
+ (id)findWeekDayScheduleRuleWithModelID:(id)a3 error:(id *)a4;
+ (id)findYearDayScheduleRuleWithDatabaseID:(id)a3;
+ (id)findYearDayScheduleRuleWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findYearDayScheduleRuleWithModelID:(id)a3;
+ (id)findYearDayScheduleRuleWithModelID:(id)a3 error:(id *)a4;
+ (id)findZoneWithDatabaseID:(id)a3;
+ (id)findZoneWithDatabaseID:(id)a3 error:(id *)a4;
+ (id)findZoneWithModelID:(id)a3;
+ (id)findZoneWithModelID:(id)a3 error:(id *)a4;
+ (id)logCategory;
+ (id)synchronizationTokenFromLegacyModelID:(id)a3;
- (BOOL)isExecuting;
- (BOOL)save;
- (BOOL)save:(id *)a3;
- (HMCContext)initWithContext:(id)a3 partition:(id)a4;
- (HMCPartition)partition;
- (HMDBackingStore)backingStore;
- (HMDManagedObjectContext)managedObjectContext;
- (MKFHomeManager)homeManager;
- (NSString)name;
- (NSString)transactionAuthor;
- (id)createNewModelOfClass:(Class)a3;
- (id)findHomeManagerWithError:(id *)a3;
- (id)findLocalAccountWithError:(id *)a3;
- (id)findRemoteAccountsWithError:(id *)a3;
- (void)_executeBlockWithPinnedQueryGeneration:(id)a3;
- (void)assertIsExecuting;
- (void)deleteObject:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWaitWithPinnedQueryGeneration:(id)a3;
- (void)performBlockWithPinnedQueryGeneration:(id)a3;
- (void)reset;
- (void)rollback;
- (void)setBackingStore:(id)a3;
- (void)setIsExecuting:(BOOL)a3;
- (void)unsafeSynchronousBlock:(id)a3;
@end

@implementation HMCContext

+ (id)findServiceGroupWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findServiceGroupWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findServiceGroupWithModelID_error___hmf_once_t2, &__block_literal_global_305);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findServiceGroupWithModelID_error___hmf_once_v3;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E481130 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __65__HMCContext_MKFServiceGroup__findServiceGroupWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findServiceGroupWithModelID_error___hmf_once_v3;
  findServiceGroupWithModelID_error___hmf_once_v3 = v0;
}

+ (id)findServiceGroupWithModelID:(id)a3
{
  return +[HMCContext findServiceGroupWithModelID:a3 error:0];
}

+ (id)findServiceGroupWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E481130 databaseID:a3 error:a4];
}

+ (id)findServiceGroupWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E481130 databaseID:a3 error:0];
}

+ (id)findAccountWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAccountWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAccountWithModelID_error___hmf_once_t0, &__block_literal_global_3464);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findAccountWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E4870D8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __55__HMCContext_MKFAccount__findAccountWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAccountWithModelID_error___hmf_once_v1;
  findAccountWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findAccountWithModelID:(id)a3
{
  return +[HMCContext findAccountWithModelID:a3 error:0];
}

+ (id)findAccountWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4870D8 databaseID:a3 error:a4];
}

+ (id)findAccountWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4870D8 databaseID:a3 error:0];
}

+ (id)findCharacteristicWriteActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCharacteristicWriteActionWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCharacteristicWriteActionWithModelID_error___hmf_once_t1, &__block_literal_global_5384);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findCharacteristicWriteActionWithModelID_error___hmf_once_v2;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E48BE48 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __91__HMCContext_MKFCharacteristicWriteAction__findCharacteristicWriteActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCharacteristicWriteActionWithModelID_error___hmf_once_v2;
  findCharacteristicWriteActionWithModelID_error___hmf_once_v2 = v0;
}

+ (id)findCharacteristicWriteActionWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicWriteActionWithModelID:a3 error:0];
}

+ (id)findCharacteristicWriteActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E48BE48 databaseID:a3 error:a4];
}

+ (id)findCharacteristicWriteActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E48BE48 databaseID:a3 error:0];
}

+ (id)findDurationEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findDurationEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findDurationEventWithModelID_error___hmf_once_t0, &__block_literal_global_9583);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findDurationEventWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E490C70 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __67__HMCContext_MKFDurationEvent__findDurationEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findDurationEventWithModelID_error___hmf_once_v1;
  findDurationEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findDurationEventWithModelID:(id)a3
{
  return +[HMCContext findDurationEventWithModelID:a3 error:0];
}

+ (id)findDurationEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E490C70 databaseID:a3 error:a4];
}

+ (id)findDurationEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E490C70 databaseID:a3 error:0];
}

+ (id)findPhotosPersonWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findPhotosPersonWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findPhotosPersonWithModelID_error___hmf_once_t2, &__block_literal_global_296_10863);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findPhotosPersonWithModelID_error___hmf_once_v3;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E492490 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __65__HMCContext_MKFPhotosPerson__findPhotosPersonWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findPhotosPersonWithModelID_error___hmf_once_v3;
  findPhotosPersonWithModelID_error___hmf_once_v3 = v0;
}

+ (id)findPhotosPersonWithModelID:(id)a3
{
  return +[HMCContext findPhotosPersonWithModelID:a3 error:0];
}

+ (id)findPhotosPersonWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E492490 databaseID:a3 error:a4];
}

+ (id)findPhotosPersonWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E492490 databaseID:a3 error:0];
}

+ (id)findHomePersonManagerSettingWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomePersonManagerSettingWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomePersonManagerSettingWithModelID_error___hmf_once_t0, &__block_literal_global_11380);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findHomePersonManagerSettingWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E492C60 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __89__HMCContext_MKFHomePersonManagerSetting__findHomePersonManagerSettingWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomePersonManagerSettingWithModelID_error___hmf_once_v1;
  findHomePersonManagerSettingWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findHomePersonManagerSettingWithModelID:(id)a3
{
  return +[HMCContext findHomePersonManagerSettingWithModelID:a3 error:0];
}

+ (id)findHomePersonManagerSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E492C60 databaseID:a3 error:a4];
}

+ (id)findHomePersonManagerSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E492C60 databaseID:a3 error:0];
}

+ (id)findHomeManagerHomeWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeManagerHomeWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeManagerHomeWithModelID_error___hmf_once_t0, &__block_literal_global_16333);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findHomeManagerHomeWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E4B1518 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __71__HMCContext_MKFHomeManagerHome__findHomeManagerHomeWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeManagerHomeWithModelID_error___hmf_once_v1;
  findHomeManagerHomeWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findHomeManagerHomeWithModelID:(id)a3
{
  return +[HMCContext findHomeManagerHomeWithModelID:a3 error:0];
}

+ (id)findHomeManagerHomeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4B1518 databaseID:a3 error:a4];
}

+ (id)findHomeManagerHomeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4B1518 databaseID:a3 error:0];
}

+ (id)findAccessoryWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAccessoryWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAccessoryWithModelID_error___hmf_once_t2, &__block_literal_global_518);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findAccessoryWithModelID_error___hmf_once_v3;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E4BCF88 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __59__HMCContext_MKFAccessory__findAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAccessoryWithModelID_error___hmf_once_v3;
  findAccessoryWithModelID_error___hmf_once_v3 = v0;
}

+ (id)findAccessoryWithModelID:(id)a3
{
  return +[HMCContext findAccessoryWithModelID:a3 error:0];
}

+ (id)findAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4BCF88 databaseID:a3 error:a4];
}

+ (id)findAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4BCF88 databaseID:a3 error:0];
}

+ (id)findMediaPlaybackActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMediaPlaybackActionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMediaPlaybackActionWithModelID_error___hmf_once_t0, &__block_literal_global_24287);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findMediaPlaybackActionWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E4C19D0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __79__HMCContext_MKFMediaPlaybackAction__findMediaPlaybackActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMediaPlaybackActionWithModelID_error___hmf_once_v1;
  findMediaPlaybackActionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findMediaPlaybackActionWithModelID:(id)a3
{
  return +[HMCContext findMediaPlaybackActionWithModelID:a3 error:0];
}

+ (id)findMediaPlaybackActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C19D0 databaseID:a3 error:a4];
}

+ (id)findMediaPlaybackActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C19D0 databaseID:a3 error:0];
}

+ (id)findMatterAttributeValueEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMatterAttributeValueEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMatterAttributeValueEventWithModelID_error___hmf_once_t0, &__block_literal_global_27772);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findMatterAttributeValueEventWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E4C6900 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __91__HMCContext_MKFMatterAttributeValueEvent__findMatterAttributeValueEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMatterAttributeValueEventWithModelID_error___hmf_once_v1;
  findMatterAttributeValueEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findMatterAttributeValueEventWithModelID:(id)a3
{
  return +[HMCContext findMatterAttributeValueEventWithModelID:a3 error:0];
}

+ (id)findMatterAttributeValueEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C6900 databaseID:a3 error:a4];
}

+ (id)findMatterAttributeValueEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C6900 databaseID:a3 error:0];
}

+ (id)findSignificantTimeEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findSignificantTimeEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findSignificantTimeEventWithModelID_error___hmf_once_t0, &__block_literal_global_31327);
  }
  v12 = @"PRIMARYKEY";
  v13[0] = v6;
  v7 = NSDictionary;
  id v8 = (id)findSignificantTimeEventWithModelID_error___hmf_once_v1;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = +[HMCContext findModelObjectOfType:&unk_26E4C92D8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __81__HMCContext_MKFSignificantTimeEvent__findSignificantTimeEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findSignificantTimeEventWithModelID_error___hmf_once_v1;
  findSignificantTimeEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findSignificantTimeEventWithModelID:(id)a3
{
  return +[HMCContext findSignificantTimeEventWithModelID:a3 error:0];
}

+ (id)findSignificantTimeEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C92D8 databaseID:a3 error:a4];
}

+ (id)findSignificantTimeEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C92D8 databaseID:a3 error:0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setBackingStore:(id)a3
{
}

- (HMDBackingStore)backingStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingStore);
  return (HMDBackingStore *)WeakRetained;
}

- (HMCPartition)partition
{
  return self->_partition;
}

- (HMDManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (NSString)name
{
  return self->_name;
}

- (void)reset
{
  id v2 = [(HMCContext *)self managedObjectContext];
  [v2 reset];
}

- (void)rollback
{
  v3 = [(HMCContext *)self managedObjectContext];
  [v3 rollback];

  id v4 = [(HMCContext *)self managedObjectContext];
  [v4 reset];
}

- (BOOL)save
{
  return [(HMCContext *)self save:0];
}

- (BOOL)save:(id *)a3
{
  uint64_t v9 = 0;
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id *)&v9;
  }
  uint64_t v5 = [(HMCContext *)self managedObjectContext];
  char v6 = objc_msgSend(v5, "hmd_saveWithTransactionAuthor:error:", 6, v4);

  v7 = [(HMCContext *)self managedObjectContext];
  [v7 reset];

  return v6;
}

- (void)deleteObject:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(HMCContext *)self managedObjectContext];
    [v4 deleteObject:v8];
  }
  else
  {
    uint64_t v5 = (HMCContext *)_HMFPreconditionFailure();
    [(HMCContext *)v5 unsafeSynchronousBlock:v7];
  }
}

- (void)unsafeSynchronousBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMCContext *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__HMCContext_unsafeSynchronousBlock___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

uint64_t __37__HMCContext_unsafeSynchronousBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsExecuting:0];
}

- (id)createNewModelOfClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v5 = objc_alloc(MEMORY[0x263EFF280]);
    id v6 = [(objc_class *)a3 entity];
    id v7 = [(HMCContext *)self managedObjectContext];
    id v8 = (void *)[v5 initWithEntity:v6 insertIntoManagedObjectContext:v7];

    return v8;
  }
  else
  {
    v10 = (HMCContext *)_HMFPreconditionFailure();
    return [(HMCContext *)v10 homeManager];
  }
}

- (MKFHomeManager)homeManager
{
  id v2 = [(HMCContext *)self managedObjectContext];
  v3 = +[_MKFHomeManager fetchWithContext:v2 error:0];

  if (v3)
  {
    return (MKFHomeManager *)v3;
  }
  else
  {
    id v5 = (HMCContext *)_HMFPreconditionFailure();
    [(HMCContext *)v5 _executeBlockWithPinnedQueryGeneration:v7];
  }
  return result;
}

- (void)_executeBlockWithPinnedQueryGeneration:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  id v5 = [(HMCContext *)self managedObjectContext];
  SEL v6 = [v5 queryGenerationToken];

  if (v6) {
    _HMFPreconditionFailure();
  }
  id v7 = [(HMCContext *)self managedObjectContext];
  id v8 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
  id v24 = 0;
  char v9 = [v7 setQueryGenerationFromToken:v8 error:&v24];
  id v10 = v24;

  if (v9)
  {
    [(HMCContext *)self setIsExecuting:1];
    *(void *)buf = _HMFThreadLocalAsyncContextPush();
    v4[2](v4);
    _HMFThreadLocalAsyncContextPop();
    [(HMCContext *)self setIsExecuting:0];
    SEL v11 = [(HMCContext *)self managedObjectContext];
    id v23 = v10;
    char v12 = [v11 setQueryGenerationFromToken:0 error:&v23];
    id v13 = v23;

    if ((v12 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v17;
        __int16 v26 = 2114;
        id v27 = v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while unpinning the query generation : %{public}@", buf, 0x16u);
      }
    }
    v18 = [(HMCContext *)self managedObjectContext];
    [v18 reset];

    id v10 = v13;
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v22;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to pin context to current query generation: %{public}@", buf, 0x16u);
    }
  }
}

- (void)performBlockAndWaitWithPinnedQueryGeneration:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCContext *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMCContext_performBlockAndWaitWithPinnedQueryGeneration___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

uint64_t __59__HMCContext_performBlockAndWaitWithPinnedQueryGeneration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeBlockWithPinnedQueryGeneration:*(void *)(a1 + 40)];
}

- (void)performBlockWithPinnedQueryGeneration:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCContext *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMCContext_performBlockWithPinnedQueryGeneration___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __52__HMCContext_performBlockWithPinnedQueryGeneration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeBlockWithPinnedQueryGeneration:*(void *)(a1 + 40)];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCContext *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__HMCContext_performBlock___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __27__HMCContext_performBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsExecuting:0];
}

- (void)assertIsExecuting
{
  if (![(HMCContext *)self isExecuting])
  {
    id v2 = (HMCContext *)_HMFPreconditionFailure();
    [(HMCContext *)v2 initWithContext:v4 partition:v5];
  }
}

- (HMCContext)initWithContext:(id)a3 partition:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMCContext;
  char v9 = [(HMCContext *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v7 name];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v7 transactionAuthor];
    transactionAuthor = v9->_transactionAuthor;
    v9->_transactionAuthor = (NSString *)v12;

    objc_storeStrong((id *)&v9->_partition, a4);
    objc_storeStrong((id *)&v9->_managedObjectContext, a3);
    v9->_isExecuting = 0;
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_35804 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_35804, &__block_literal_global_286);
  }
  id v2 = (void *)logCategory__hmf_once_v15_35805;
  return v2;
}

void __25__HMCContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v15_35805;
  logCategory__hmf_once_v15_35805 = v0;
}

+ (id)findModelObjectOfType:(id)a3 parentObjectID:(id)a4 template:(id)a5 substitutions:(id)a6 error:(id *)a7
{
  return __findModelObjectOfType(a3, a4, a5, a6, (uint64_t *)a7);
}

+ (id)findModelObjectOfType:(id)a3 template:(id)a4 substitutions:(id)a5 error:(id *)a6
{
  return __findModelObjectOfType(a3, 0, a4, a5, (uint64_t *)a6);
}

+ (id)findModelObjectOfType:(id)a3 databaseID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  __managedObjectClassFromProtocol(v7);
  char v9 = +[HMCContext currentContext];
  uint64_t v10 = [v9 managedObjectContext];
  SEL v11 = [v8 objectID];
  uint64_t v12 = [v10 existingObjectWithID:v11 error:a5];

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = (void *)_HMFPreconditionFailure();
    return +[HMCContext findAllModelsOfType:v16 error:v17];
  }
  else
  {

    return v12;
  }
}

+ (id)findAllModelsOfType:(id)a3 error:(id *)a4
{
  id v5 = [(objc_class *)__managedObjectClassFromProtocol(a3) fetchRequest];
  id v6 = [v5 execute:a4];

  return v6;
}

+ (id)findModelWithModelID:(id)a3 ofType:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = findModelWithModelID_ofType_error___hmf_once_t10;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findModelWithModelID_ofType_error___hmf_once_t10, &__block_literal_global_265);
  }
  SEL v15 = @"OBJECTID";
  v16[0] = v9;
  uint64_t v10 = NSDictionary;
  id v11 = (id)findModelWithModelID_ofType_error___hmf_once_v11;
  uint64_t v12 = [v10 dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v13 = __findModelObjectOfType(v8, 0, v11, v12, (uint64_t *)a5);

  return v13;
}

void __48__HMCContext_findModelWithModelID_ofType_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $OBJECTID"];
  v1 = (void *)findModelWithModelID_ofType_error___hmf_once_v11;
  findModelWithModelID_ofType_error___hmf_once_id v11 = v0;
}

+ (Class)managedObjectClassFromProtocol:(id)a3
{
  id v3 = a3;
  id v4 = __managedObjectClassFromProtocol(v3);
  id v5 = [(objc_class *)v4 entity];
  int v6 = [v5 isAbstract];

  if (v6)
  {
    id v9 = (void *)_HMFPreconditionFailure();
    return (Class)+[HMCContext managedObjectIsMKF:v11];
  }
  else
  {
    uint64_t v7 = v4;

    return v7;
  }
}

+ (BOOL)managedObjectIsMKF:(id)a3
{
  uint64_t v3 = managedObjectIsMKF___hmf_once_t5;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&managedObjectIsMKF___hmf_once_t5, &__block_literal_global_35834);
  }
  char v5 = [(id)managedObjectIsMKF___hmf_once_v6 objectConforms:v4];

  return v5;
}

void __33__HMCContext_managedObjectIsMKF___block_invoke()
{
  uint64_t v0 = [[HMCConformanceCache alloc] initWithProtocol:&unk_26E480D78];
  v1 = (void *)managedObjectIsMKF___hmf_once_v6;
  managedObjectIsMKF___hmf_once_int v6 = (uint64_t)v0;
}

+ (HMCContext)currentContext
{
  id v2 = HMFRequireCurrentAsyncContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (HMCContext *)v2;
  }
  else
  {
    objc_opt_class();
    id v4 = (void *)_HMFPreconditionFailureWithFormat();
    return (HMCContext *)+[HMCContext synchronizationTokenFromLegacyModelID:v6];
  }
}

+ (id)synchronizationTokenFromLegacyModelID:(id)a3
{
  uint64_t v3 = a3;
  v5[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    [a3 getUUIDBytes:v5];
    uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:16];
  }
  return v3;
}

- (id)findHomeManagerWithError:(id *)a3
{
  id v4 = +[_MKFHomeManager fetchRequest];
  SEL v5 = [v4 execute:a3];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)findRemoteAccountsWithError:(id *)a3
{
  id v4 = +[_MKFAccount fetchRequest];
  SEL v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == 0", @"local");
  [v4 setPredicate:v5];

  id v6 = [v4 execute:a3];

  return v6;
}

- (id)findLocalAccountWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  SEL v5 = +[_MKFAccount fetchRequest];
  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == 1", @"local");
  [v5 setPredicate:v6];

  uint64_t v7 = [v5 execute:a3];
  id v8 = v7;
  if (v7)
  {
    if ((unint64_t)[v7 count] >= 2) {
      _HMFPreconditionFailure();
    }
    id v9 = [v8 firstObject];
    if ([v9 conformsToProtocol:&unk_26E4870D8]) {
      SEL v10 = v9;
    }
    else {
      SEL v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      SEL v15 = HMFGetLogIdentifier();
      id v16 = *a3;
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      id v21 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local account: %@", buf, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)findInvitationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findInvitationWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findInvitationWithModelID_error___hmf_once_t2, &__block_literal_global_317);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findInvitationWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4D5210 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __61__HMCContext_MKFInvitation__findInvitationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findInvitationWithModelID_error___hmf_once_v3;
  findInvitationWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findInvitationWithModelID:(id)a3
{
  return +[HMCContext findInvitationWithModelID:a3 error:0];
}

+ (id)findInvitationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4D5210 databaseID:a3 error:a4];
}

+ (id)findInvitationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4D5210 databaseID:a3 error:0];
}

+ (id)findTimePeriodBulletinConditionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findTimePeriodBulletinConditionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findTimePeriodBulletinConditionWithModelID_error___hmf_once_t0, &__block_literal_global_42467);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findTimePeriodBulletinConditionWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4DADE0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __95__HMCContext_MKFTimePeriodBulletinCondition__findTimePeriodBulletinConditionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findTimePeriodBulletinConditionWithModelID_error___hmf_once_v1;
  findTimePeriodBulletinConditionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findTimePeriodBulletinConditionWithModelID:(id)a3
{
  return +[HMCContext findTimePeriodBulletinConditionWithModelID:a3 error:0];
}

+ (id)findTimePeriodBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DADE0 databaseID:a3 error:a4];
}

+ (id)findTimePeriodBulletinConditionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DADE0 databaseID:a3 error:0];
}

+ (id)findPresenceBulletinConditionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findPresenceBulletinConditionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findPresenceBulletinConditionWithModelID_error___hmf_once_t0, &__block_literal_global_45929);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findPresenceBulletinConditionWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4DE2F0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __91__HMCContext_MKFPresenceBulletinCondition__findPresenceBulletinConditionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findPresenceBulletinConditionWithModelID_error___hmf_once_v1;
  findPresenceBulletinConditionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findPresenceBulletinConditionWithModelID:(id)a3
{
  return +[HMCContext findPresenceBulletinConditionWithModelID:a3 error:0];
}

+ (id)findPresenceBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DE2F0 databaseID:a3 error:a4];
}

+ (id)findPresenceBulletinConditionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DE2F0 databaseID:a3 error:0];
}

+ (id)findIncomingInvitationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findIncomingInvitationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findIncomingInvitationWithModelID_error___hmf_once_t0, &__block_literal_global_46515);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findIncomingInvitationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4DE788 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __77__HMCContext_MKFIncomingInvitation__findIncomingInvitationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findIncomingInvitationWithModelID_error___hmf_once_v1;
  findIncomingInvitationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findIncomingInvitationWithModelID:(id)a3
{
  return +[HMCContext findIncomingInvitationWithModelID:a3 error:0];
}

+ (id)findIncomingInvitationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DE788 databaseID:a3 error:a4];
}

+ (id)findIncomingInvitationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DE788 databaseID:a3 error:0];
}

+ (id)findTimeOfDayTimeSpecificationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_t0, &__block_literal_global_47268);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4DEA88 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __93__HMCContext_MKFTimeOfDayTimeSpecification__findTimeOfDayTimeSpecificationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_v1;
  findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return +[HMCContext findTimeOfDayTimeSpecificationWithModelID:a3 error:0];
}

+ (id)findTimeOfDayTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DEA88 databaseID:a3 error:a4];
}

+ (id)findTimeOfDayTimeSpecificationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DEA88 databaseID:a3 error:0];
}

+ (id)findCalendarEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCalendarEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCalendarEventWithModelID_error___hmf_once_t0, &__block_literal_global_48123);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCalendarEventWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4DFD20 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __67__HMCContext_MKFCalendarEvent__findCalendarEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCalendarEventWithModelID_error___hmf_once_v1;
  findCalendarEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findCalendarEventWithModelID:(id)a3
{
  return +[HMCContext findCalendarEventWithModelID:a3 error:0];
}

+ (id)findCalendarEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DFD20 databaseID:a3 error:a4];
}

+ (id)findCalendarEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DFD20 databaseID:a3 error:0];
}

+ (id)findHomeWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeWithModelID_error___hmf_once_t4;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeWithModelID_error___hmf_once_t4, &__block_literal_global_50583);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeWithModelID_error___hmf_once_v5;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4E3E20 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __49__HMCContext_MKFHome__findHomeWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeWithModelID_error___hmf_once_v5;
  findHomeWithModelID_error___hmf_once_uint64_t v5 = v0;
}

+ (id)findHomeWithModelID:(id)a3
{
  return +[HMCContext findHomeWithModelID:a3 error:0];
}

+ (id)findHomeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4E3E20 databaseID:a3 error:a4];
}

+ (id)findHomeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4E3E20 databaseID:a3 error:0];
}

+ (id)findLocationEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findLocationEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findLocationEventWithModelID_error___hmf_once_t0, &__block_literal_global_50935);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findLocationEventWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4E42A0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __67__HMCContext_MKFLocationEvent__findLocationEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findLocationEventWithModelID_error___hmf_once_v1;
  findLocationEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findLocationEventWithModelID:(id)a3
{
  return +[HMCContext findLocationEventWithModelID:a3 error:0];
}

+ (id)findLocationEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4E42A0 databaseID:a3 error:a4];
}

+ (id)findLocationEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4E42A0 databaseID:a3 error:0];
}

+ (id)findHomeThreadNetworkWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeThreadNetworkWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeThreadNetworkWithModelID_error___hmf_once_t2, &__block_literal_global_279_53264);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeThreadNetworkWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  SEL v10 = +[HMCContext findModelObjectOfType:&unk_26E4E6148 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __75__HMCContext_MKFHomeThreadNetwork__findHomeThreadNetworkWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeThreadNetworkWithModelID_error___hmf_once_v3;
  findHomeThreadNetworkWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findHomeThreadNetworkWithModelID:(id)a3
{
  return +[HMCContext findHomeThreadNetworkWithModelID:a3 error:0];
}

+ (id)findHomeThreadNetworkWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4E6148 databaseID:a3 error:a4];
}

+ (id)findHomeThreadNetworkWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4E6148 databaseID:a3 error:0];
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2, &__block_literal_global_324_56363);
  }
  id v10 = (id)findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  id v11 = [v8 objectID];
  v15[0] = @"OBJECTID";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v8;
  v16[1] = v9;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E4EA838 parentObjectID:v11 template:v10 substitutions:v12 error:a5];

  return v13;
}

void __104__HMCContext_MKFIntegerCharacteristic__findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"service = $PARENT AND instanceID = $SECONDARYKEY"];
  v1 = (void *)findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findIntegerCharacteristicWithInstanceID:a3 serviceDatabaseID:a4 error:0];
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findIntegerCharacteristicWithInstanceID_service_error___hmf_once_t0;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findIntegerCharacteristicWithInstanceID_service_error___hmf_once_t0, &__block_literal_global_56374);
  }
  v15[0] = @"PRIMARYKEY";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v9;
  v16[1] = v8;
  id v10 = NSDictionary;
  id v11 = (id)findIntegerCharacteristicWithInstanceID_service_error___hmf_once_v1;
  uint64_t v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E4EA838 template:v11 substitutions:v12 error:a5];

  return v13;
}

void __94__HMCContext_MKFIntegerCharacteristic__findIntegerCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"];
  v1 = (void *)findIntegerCharacteristicWithInstanceID_service_error___hmf_once_v1;
  findIntegerCharacteristicWithInstanceID_service_error___hmf_once_v1 = v0;
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findIntegerCharacteristicWithInstanceID:a3 service:a4 error:0];
}

+ (id)findIntegerCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4EA838 databaseID:a3 error:a4];
}

+ (id)findIntegerCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4EA838 databaseID:a3 error:0];
}

+ (id)findHomeSettingWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeSettingWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeSettingWithModelID_error___hmf_once_t2, &__block_literal_global_273);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeSettingWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E492B20 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __63__HMCContext_MKFHomeSetting__findHomeSettingWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeSettingWithModelID_error___hmf_once_v3;
  findHomeSettingWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findHomeSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeSettingWithModelID:a3 error:0];
}

+ (id)findHomeSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E492B20 databaseID:a3 error:a4];
}

+ (id)findHomeSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E492B20 databaseID:a3 error:0];
}

+ (id)findUserWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findUserWithModelID_error___hmf_once_t27;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findUserWithModelID_error___hmf_once_t27, &__block_literal_global_831);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findUserWithModelID_error___hmf_once_v28;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F4038 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __49__HMCContext_MKFUser__findUserWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findUserWithModelID_error___hmf_once_v28;
  findUserWithModelID_error___hmf_once_uint64_t v28 = v0;
}

+ (id)findUserWithModelID:(id)a3
{
  return +[HMCContext findUserWithModelID:a3 error:0];
}

+ (id)findUserWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F4038 databaseID:a3 error:a4];
}

+ (id)findUserWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F4038 databaseID:a3 error:0];
}

+ (id)findDeviceWithDeviceIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "predicateWithFormat:", @"(%K == $DEVICE_IDENTIFIER)", @"identifier");
  id v9 = @"DEVICE_IDENTIFIER";
  v10[0] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = +[HMCContext findModelObjectOfType:&unk_26E4F5978 template:v5 substitutions:v6 error:0];

  return v7;
}

+ (id)findDeviceWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findDeviceWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findDeviceWithModelID_error___hmf_once_t0, &__block_literal_global_65416);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findDeviceWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F5978 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __53__HMCContext_MKFDevice__findDeviceWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findDeviceWithModelID_error___hmf_once_v1;
  findDeviceWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findDeviceWithModelID:(id)a3
{
  return +[HMCContext findDeviceWithModelID:a3 error:0];
}

+ (id)findDeviceWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F5978 databaseID:a3 error:a4];
}

+ (id)findDeviceWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F5978 databaseID:a3 error:0];
}

+ (id)findBulletinTimeSpecificationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findBulletinTimeSpecificationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findBulletinTimeSpecificationWithModelID_error___hmf_once_t0, &__block_literal_global_66100);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findBulletinTimeSpecificationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4DE938 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __91__HMCContext_MKFBulletinTimeSpecification__findBulletinTimeSpecificationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findBulletinTimeSpecificationWithModelID_error___hmf_once_v1;
  findBulletinTimeSpecificationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findBulletinTimeSpecificationWithModelID:(id)a3
{
  return +[HMCContext findBulletinTimeSpecificationWithModelID:a3 error:0];
}

+ (id)findBulletinTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DE938 databaseID:a3 error:a4];
}

+ (id)findBulletinTimeSpecificationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DE938 databaseID:a3 error:0];
}

+ (id)findAppleMediaAccessoryPowerActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_t0, &__block_literal_global_66459);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F5B20 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __101__HMCContext_MKFAppleMediaAccessoryPowerAction__findAppleMediaAccessoryPowerActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_v1;
  findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findAppleMediaAccessoryPowerActionWithModelID:(id)a3
{
  return +[HMCContext findAppleMediaAccessoryPowerActionWithModelID:a3 error:0];
}

+ (id)findAppleMediaAccessoryPowerActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F5B20 databaseID:a3 error:a4];
}

+ (id)findAppleMediaAccessoryPowerActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F5B20 databaseID:a3 error:0];
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_t0, &__block_literal_global_67442);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F5FD8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __117__HMCContext_MKFHomeNetworkRouterManagingDeviceSetting__findHomeNetworkRouterManagingDeviceSettingWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_v1;
  findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeNetworkRouterManagingDeviceSettingWithModelID:a3 error:0];
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F5FD8 databaseID:a3 error:a4];
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F5FD8 databaseID:a3 error:0];
}

+ (id)findAirPlayAccessoryWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAirPlayAccessoryWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAirPlayAccessoryWithModelID_error___hmf_once_t2, &__block_literal_global_496);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findAirPlayAccessoryWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F8538 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __73__HMCContext_MKFAirPlayAccessory__findAirPlayAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAirPlayAccessoryWithModelID_error___hmf_once_v3;
  findAirPlayAccessoryWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findAirPlayAccessoryWithModelID:(id)a3
{
  return +[HMCContext findAirPlayAccessoryWithModelID:a3 error:0];
}

+ (id)findAirPlayAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F8538 databaseID:a3 error:a4];
}

+ (id)findAirPlayAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F8538 databaseID:a3 error:0];
}

+ (id)findHomeAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeAccessCodeWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeAccessCodeWithModelID_error___hmf_once_t0, &__block_literal_global_69530);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeAccessCodeWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F8740 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __69__HMCContext_MKFHomeAccessCode__findHomeAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeAccessCodeWithModelID_error___hmf_once_v1;
  findHomeAccessCodeWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findHomeAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findHomeAccessCodeWithModelID:a3 error:0];
}

+ (id)findHomeAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F8740 databaseID:a3 error:a4];
}

+ (id)findHomeAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F8740 databaseID:a3 error:0];
}

+ (id)findMatterBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMatterBulletinRegistrationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMatterBulletinRegistrationWithModelID_error___hmf_once_t0, &__block_literal_global_71480);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findMatterBulletinRegistrationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4FAF98 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __93__HMCContext_MKFMatterBulletinRegistration__findMatterBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMatterBulletinRegistrationWithModelID_error___hmf_once_v1;
  findMatterBulletinRegistrationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findMatterBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findMatterBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findMatterBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FAF98 databaseID:a3 error:a4];
}

+ (id)findMatterBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FAF98 databaseID:a3 error:0];
}

+ (id)findPresenceEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findPresenceEventWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findPresenceEventWithModelID_error___hmf_once_t2, &__block_literal_global_323);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findPresenceEventWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4FB150 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __67__HMCContext_MKFPresenceEvent__findPresenceEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findPresenceEventWithModelID_error___hmf_once_v3;
  findPresenceEventWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findPresenceEventWithModelID:(id)a3
{
  return +[HMCContext findPresenceEventWithModelID:a3 error:0];
}

+ (id)findPresenceEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FB150 databaseID:a3 error:a4];
}

+ (id)findPresenceEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FB150 databaseID:a3 error:0];
}

+ (id)findPersonWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findPersonWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findPersonWithModelID_error___hmf_once_t0, &__block_literal_global_74600);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findPersonWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E492308 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __53__HMCContext_MKFPerson__findPersonWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findPersonWithModelID_error___hmf_once_v1;
  findPersonWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findPersonWithModelID:(id)a3
{
  return +[HMCContext findPersonWithModelID:a3 error:0];
}

+ (id)findPersonWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E492308 databaseID:a3 error:a4];
}

+ (id)findPersonWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E492308 databaseID:a3 error:0];
}

+ (id)findGuestAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findGuestAccessCodeWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findGuestAccessCodeWithModelID_error___hmf_once_t2, &__block_literal_global_289);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findGuestAccessCodeWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4FE568 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __71__HMCContext_MKFGuestAccessCode__findGuestAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findGuestAccessCodeWithModelID_error___hmf_once_v3;
  findGuestAccessCodeWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findGuestAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findGuestAccessCodeWithModelID:a3 error:0];
}

+ (id)findGuestAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FE568 databaseID:a3 error:a4];
}

+ (id)findGuestAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FE568 databaseID:a3 error:0];
}

+ (id)findRoomWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findRoomWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findRoomWithModelID_error___hmf_once_t2, &__block_literal_global_305_75930);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findRoomWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4FE6E0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __49__HMCContext_MKFRoom__findRoomWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findRoomWithModelID_error___hmf_once_v3;
  findRoomWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findRoomWithModelID:(id)a3
{
  return +[HMCContext findRoomWithModelID:a3 error:0];
}

+ (id)findRoomWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FE6E0 databaseID:a3 error:a4];
}

+ (id)findRoomWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FE6E0 databaseID:a3 error:0];
}

+ (id)findServiceWithInstanceID:(id)a3 accessoryDatabaseID:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_t6;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_t6, &__block_literal_global_440);
  }
  id v10 = (id)findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_v7;
  id v11 = [v8 objectID];
  v15[0] = @"OBJECTID";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v8;
  v16[1] = v9;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E50B0B0 parentObjectID:v11 template:v10 substitutions:v12 error:a5];

  return v13;
}

void __78__HMCContext_MKFService__findServiceWithInstanceID_accessoryDatabaseID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"accessory = $PARENT AND instanceID = $SECONDARYKEY"];
  v1 = (void *)findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_v7;
  findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_uint64_t v7 = v0;
}

+ (id)findServiceWithInstanceID:(id)a3 accessoryDatabaseID:(id)a4
{
  return +[HMCContext findServiceWithInstanceID:a3 accessoryDatabaseID:a4 error:0];
}

+ (id)findServiceWithInstanceID:(id)a3 accessory:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findServiceWithInstanceID_accessory_error___hmf_once_t4;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findServiceWithInstanceID_accessory_error___hmf_once_t4, &__block_literal_global_432);
  }
  v15[0] = @"PRIMARYKEY";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v9;
  v16[1] = v8;
  id v10 = NSDictionary;
  id v11 = (id)findServiceWithInstanceID_accessory_error___hmf_once_v5;
  uint64_t v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E50B0B0 template:v11 substitutions:v12 error:a5];

  return v13;
}

void __68__HMCContext_MKFService__findServiceWithInstanceID_accessory_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"instanceID = $PRIMARYKEY AND accessory = $SECONDARYKEY"];
  v1 = (void *)findServiceWithInstanceID_accessory_error___hmf_once_v5;
  findServiceWithInstanceID_accessory_error___hmf_once_uint64_t v5 = v0;
}

+ (id)findServiceWithInstanceID:(id)a3 accessory:(id)a4
{
  return +[HMCContext findServiceWithInstanceID:a3 accessory:a4 error:0];
}

+ (id)findServiceWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findServiceWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findServiceWithModelID_error___hmf_once_t2, &__block_literal_global_423);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findServiceWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E50B0B0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __55__HMCContext_MKFService__findServiceWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findServiceWithModelID_error___hmf_once_v3;
  findServiceWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findServiceWithModelID:(id)a3
{
  return +[HMCContext findServiceWithModelID:a3 error:0];
}

+ (id)findServiceWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E50B0B0 databaseID:a3 error:a4];
}

+ (id)findServiceWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E50B0B0 databaseID:a3 error:0];
}

+ (id)findHAPMetadataWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHAPMetadataWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHAPMetadataWithModelID_error___hmf_once_t1, &__block_literal_global_84698);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHAPMetadataWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E50CA08 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __63__HMCContext_MKFHAPMetadata__findHAPMetadataWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHAPMetadataWithModelID_error___hmf_once_v2;
  findHAPMetadataWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findHAPMetadataWithModelID:(id)a3
{
  return +[HMCContext findHAPMetadataWithModelID:a3 error:0];
}

+ (id)findHAPMetadataWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E50CA08 databaseID:a3 error:a4];
}

+ (id)findHAPMetadataWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E50CA08 databaseID:a3 error:0];
}

+ (id)findHomeNetworkRouterSettingWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeNetworkRouterSettingWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeNetworkRouterSettingWithModelID_error___hmf_once_t2, &__block_literal_global_85073);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeNetworkRouterSettingWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E50CC30 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __89__HMCContext_MKFHomeNetworkRouterSetting__findHomeNetworkRouterSettingWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeNetworkRouterSettingWithModelID_error___hmf_once_v3;
  findHomeNetworkRouterSettingWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findHomeNetworkRouterSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeNetworkRouterSettingWithModelID:a3 error:0];
}

+ (id)findHomeNetworkRouterSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E50CC30 databaseID:a3 error:a4];
}

+ (id)findHomeNetworkRouterSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E50CC30 databaseID:a3 error:0];
}

+ (id)findCameraAccessModeBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_t1, &__block_literal_global_85981);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E50D1D8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __113__HMCContext_MKFCameraAccessModeBulletinRegistration__findCameraAccessModeBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_v2;
  findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findCameraAccessModeBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCameraAccessModeBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findCameraAccessModeBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E50D1D8 databaseID:a3 error:a4];
}

+ (id)findCameraAccessModeBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E50D1D8 databaseID:a3 error:0];
}

+ (id)findCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_t1, &__block_literal_global_90713);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E50FEC8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __125__HMCContext_MKFCameraSignificantEventBulletinRegistration__findCameraSignificantEventBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_v2;
  findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findCameraSignificantEventBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCameraSignificantEventBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findCameraSignificantEventBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E50FEC8 databaseID:a3 error:a4];
}

+ (id)findCameraSignificantEventBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E50FEC8 databaseID:a3 error:0];
}

+ (id)findResidentSelectionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findResidentSelectionWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findResidentSelectionWithModelID_error___hmf_once_t2, &__block_literal_global_290);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findResidentSelectionWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5109E0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __75__HMCContext_MKFResidentSelection__findResidentSelectionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findResidentSelectionWithModelID_error___hmf_once_v3;
  findResidentSelectionWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findResidentSelectionWithModelID:(id)a3
{
  return +[HMCContext findResidentSelectionWithModelID:a3 error:0];
}

+ (id)findResidentSelectionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5109E0 databaseID:a3 error:a4];
}

+ (id)findResidentSelectionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5109E0 databaseID:a3 error:0];
}

+ (id)findCharacteristicValueEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCharacteristicValueEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCharacteristicValueEventWithModelID_error___hmf_once_t0, &__block_literal_global_95510);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCharacteristicValueEventWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5146F0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __89__HMCContext_MKFCharacteristicValueEvent__findCharacteristicValueEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCharacteristicValueEventWithModelID_error___hmf_once_v1;
  findCharacteristicValueEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findCharacteristicValueEventWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicValueEventWithModelID:a3 error:0];
}

+ (id)findCharacteristicValueEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5146F0 databaseID:a3 error:a4];
}

+ (id)findCharacteristicValueEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5146F0 databaseID:a3 error:0];
}

+ (id)findResidentWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findResidentWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findResidentWithModelID_error___hmf_once_t2, &__block_literal_global_324_99581);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findResidentWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E518D18 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __57__HMCContext_MKFResident__findResidentWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findResidentWithModelID_error___hmf_once_v3;
  findResidentWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findResidentWithModelID:(id)a3
{
  return +[HMCContext findResidentWithModelID:a3 error:0];
}

+ (id)findResidentWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E518D18 databaseID:a3 error:a4];
}

+ (id)findResidentWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E518D18 databaseID:a3 error:0];
}

+ (id)findAppleMediaAccessoryWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAppleMediaAccessoryWithModelID_error___hmf_once_t8;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAppleMediaAccessoryWithModelID_error___hmf_once_t8, &__block_literal_global_102127);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findAppleMediaAccessoryWithModelID_error___hmf_once_v9;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E51D040 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __79__HMCContext_MKFAppleMediaAccessory__findAppleMediaAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAppleMediaAccessoryWithModelID_error___hmf_once_v9;
  findAppleMediaAccessoryWithModelID_error___hmf_once_id v9 = v0;
}

+ (id)findAppleMediaAccessoryWithModelID:(id)a3
{
  return +[HMCContext findAppleMediaAccessoryWithModelID:a3 error:0];
}

+ (id)findAppleMediaAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E51D040 databaseID:a3 error:a4];
}

+ (id)findAppleMediaAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E51D040 databaseID:a3 error:0];
}

+ (id)findUserAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findUserAccessCodeWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findUserAccessCodeWithModelID_error___hmf_once_t2, &__block_literal_global_281_103191);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findUserAccessCodeWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E51E090 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __69__HMCContext_MKFUserAccessCode__findUserAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findUserAccessCodeWithModelID_error___hmf_once_v3;
  findUserAccessCodeWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findUserAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findUserAccessCodeWithModelID:a3 error:0];
}

+ (id)findUserAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E51E090 databaseID:a3 error:a4];
}

+ (id)findUserAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E51E090 databaseID:a3 error:0];
}

+ (id)findActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findActionWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findActionWithModelID_error___hmf_once_t2, &__block_literal_global_276);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findActionWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E48BCD0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __53__HMCContext_MKFAction__findActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findActionWithModelID_error___hmf_once_v3;
  findActionWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findActionWithModelID:(id)a3
{
  return +[HMCContext findActionWithModelID:a3 error:0];
}

+ (id)findActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E48BCD0 databaseID:a3 error:a4];
}

+ (id)findActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E48BCD0 databaseID:a3 error:0];
}

+ (id)findHomeManagerWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeManagerWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeManagerWithModelID_error___hmf_once_t2, &__block_literal_global_115136);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeManagerWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E52DFF0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __63__HMCContext_MKFHomeManager__findHomeManagerWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeManagerWithModelID_error___hmf_once_v3;
  findHomeManagerWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findHomeManagerWithModelID:(id)a3
{
  return +[HMCContext findHomeManagerWithModelID:a3 error:0];
}

+ (id)findHomeManagerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E52DFF0 databaseID:a3 error:a4];
}

+ (id)findHomeManagerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E52DFF0 databaseID:a3 error:0];
}

+ (id)findBulletinConditionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findBulletinConditionWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findBulletinConditionWithModelID_error___hmf_once_t2, &__block_literal_global_276_115514);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findBulletinConditionWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4DA748 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __75__HMCContext_MKFBulletinCondition__findBulletinConditionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findBulletinConditionWithModelID_error___hmf_once_v3;
  findBulletinConditionWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findBulletinConditionWithModelID:(id)a3
{
  return +[HMCContext findBulletinConditionWithModelID:a3 error:0];
}

+ (id)findBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DA748 databaseID:a3 error:a4];
}

+ (id)findBulletinConditionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4DA748 databaseID:a3 error:0];
}

+ (id)findCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t4;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t4, &__block_literal_global_334_117933);
  }
  id v10 = (id)findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v5;
  id v11 = [v8 objectID];
  v15[0] = @"OBJECTID";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v8;
  v16[1] = v9;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E4EA688 parentObjectID:v11 template:v10 substitutions:v12 error:a5];

  return v13;
}

void __90__HMCContext_MKFCharacteristic__findCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"service = $PARENT AND instanceID = $SECONDARYKEY"];
  v1 = (void *)findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v5;
  findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_uint64_t v5 = v0;
}

+ (id)findCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findCharacteristicWithInstanceID:a3 serviceDatabaseID:a4 error:0];
}

+ (id)findCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findCharacteristicWithInstanceID_service_error___hmf_once_t2;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findCharacteristicWithInstanceID_service_error___hmf_once_t2, &__block_literal_global_322);
  }
  v15[0] = @"PRIMARYKEY";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v9;
  v16[1] = v8;
  id v10 = NSDictionary;
  id v11 = (id)findCharacteristicWithInstanceID_service_error___hmf_once_v3;
  uint64_t v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E4EA688 template:v11 substitutions:v12 error:a5];

  return v13;
}

void __80__HMCContext_MKFCharacteristic__findCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"];
  v1 = (void *)findCharacteristicWithInstanceID_service_error___hmf_once_v3;
  findCharacteristicWithInstanceID_service_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findCharacteristicWithInstanceID:a3 service:a4 error:0];
}

+ (id)findCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4EA688 databaseID:a3 error:a4];
}

+ (id)findCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4EA688 databaseID:a3 error:0];
}

+ (id)findUserActivityStatusWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findUserActivityStatusWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findUserActivityStatusWithModelID_error___hmf_once_t2, &__block_literal_global_120145);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findUserActivityStatusWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5321D0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __77__HMCContext_MKFUserActivityStatus__findUserActivityStatusWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findUserActivityStatusWithModelID_error___hmf_once_v3;
  findUserActivityStatusWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findUserActivityStatusWithModelID:(id)a3
{
  return +[HMCContext findUserActivityStatusWithModelID:a3 error:0];
}

+ (id)findUserActivityStatusWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5321D0 databaseID:a3 error:a4];
}

+ (id)findUserActivityStatusWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5321D0 databaseID:a3 error:0];
}

+ (id)findBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findBulletinRegistrationWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findBulletinRegistrationWithModelID_error___hmf_once_t2, &__block_literal_global_327_123086);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findBulletinRegistrationWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4FADC8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __81__HMCContext_MKFBulletinRegistration__findBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findBulletinRegistrationWithModelID_error___hmf_once_v3;
  findBulletinRegistrationWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FADC8 databaseID:a3 error:a4];
}

+ (id)findBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4FADC8 databaseID:a3 error:0];
}

+ (id)findMatterAttributeEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMatterAttributeEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMatterAttributeEventWithModelID_error___hmf_once_t0, &__block_literal_global_124644);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findMatterAttributeEventWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4C67C0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __81__HMCContext_MKFMatterAttributeEvent__findMatterAttributeEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMatterAttributeEventWithModelID_error___hmf_once_v1;
  findMatterAttributeEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findMatterAttributeEventWithModelID:(id)a3
{
  return +[HMCContext findMatterAttributeEventWithModelID:a3 error:0];
}

+ (id)findMatterAttributeEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C67C0 databaseID:a3 error:a4];
}

+ (id)findMatterAttributeEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4C67C0 databaseID:a3 error:0];
}

+ (id)findTimerTriggerWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findTimerTriggerWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findTimerTriggerWithModelID_error___hmf_once_t2, &__block_literal_global_349);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findTimerTriggerWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E53A7F0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __65__HMCContext_MKFTimerTrigger__findTimerTriggerWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findTimerTriggerWithModelID_error___hmf_once_v3;
  findTimerTriggerWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findTimerTriggerWithModelID:(id)a3
{
  return +[HMCContext findTimerTriggerWithModelID:a3 error:0];
}

+ (id)findTimerTriggerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E53A7F0 databaseID:a3 error:a4];
}

+ (id)findTimerTriggerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E53A7F0 databaseID:a3 error:0];
}

+ (id)findCameraReachabilityBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_t1, &__block_literal_global_132433);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E53D888 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __117__HMCContext_MKFCameraReachabilityBulletinRegistration__findCameraReachabilityBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_v2;
  findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findCameraReachabilityBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCameraReachabilityBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findCameraReachabilityBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E53D888 databaseID:a3 error:a4];
}

+ (id)findCameraReachabilityBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E53D888 databaseID:a3 error:0];
}

+ (id)findEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findEventWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findEventWithModelID_error___hmf_once_t2, &__block_literal_global_283);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findEventWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E490B40 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __51__HMCContext_MKFEvent__findEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findEventWithModelID_error___hmf_once_v3;
  findEventWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findEventWithModelID:(id)a3
{
  return +[HMCContext findEventWithModelID:a3 error:0];
}

+ (id)findEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E490B40 databaseID:a3 error:a4];
}

+ (id)findEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E490B40 databaseID:a3 error:0];
}

+ (id)findShortcutActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findShortcutActionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findShortcutActionWithModelID_error___hmf_once_t0, &__block_literal_global_140963);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findShortcutActionWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E54A680 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __69__HMCContext_MKFShortcutAction__findShortcutActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findShortcutActionWithModelID_error___hmf_once_v1;
  findShortcutActionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findShortcutActionWithModelID:(id)a3
{
  return +[HMCContext findShortcutActionWithModelID:a3 error:0];
}

+ (id)findShortcutActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E54A680 databaseID:a3 error:a4];
}

+ (id)findShortcutActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E54A680 databaseID:a3 error:0];
}

+ (id)findSoftwareUpdateWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findSoftwareUpdateWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findSoftwareUpdateWithModelID_error___hmf_once_t2, &__block_literal_global_308);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findSoftwareUpdateWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E54B228 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __69__HMCContext_MKFSoftwareUpdate__findSoftwareUpdateWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findSoftwareUpdateWithModelID_error___hmf_once_v3;
  findSoftwareUpdateWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findSoftwareUpdateWithModelID:(id)a3
{
  return +[HMCContext findSoftwareUpdateWithModelID:a3 error:0];
}

+ (id)findSoftwareUpdateWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E54B228 databaseID:a3 error:a4];
}

+ (id)findSoftwareUpdateWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E54B228 databaseID:a3 error:0];
}

+ (id)findMediaAccessoryWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMediaAccessoryWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMediaAccessoryWithModelID_error___hmf_once_t0, &__block_literal_global_145897);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findMediaAccessoryWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E4F82E0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __69__HMCContext_MKFMediaAccessory__findMediaAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMediaAccessoryWithModelID_error___hmf_once_v1;
  findMediaAccessoryWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findMediaAccessoryWithModelID:(id)a3
{
  return +[HMCContext findMediaAccessoryWithModelID:a3 error:0];
}

+ (id)findMediaAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F82E0 databaseID:a3 error:a4];
}

+ (id)findMediaAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E4F82E0 databaseID:a3 error:0];
}

+ (id)findGuestWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findGuestWithModelID_error___hmf_once_t11;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findGuestWithModelID_error___hmf_once_t11, &__block_literal_global_671);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findGuestWithModelID_error___hmf_once_v12;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E54F6E0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __51__HMCContext_MKFGuest__findGuestWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findGuestWithModelID_error___hmf_once_v12;
  findGuestWithModelID_error___hmf_once_uint64_t v12 = v0;
}

+ (id)findGuestWithModelID:(id)a3
{
  return +[HMCContext findGuestWithModelID:a3 error:0];
}

+ (id)findGuestWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E54F6E0 databaseID:a3 error:a4];
}

+ (id)findGuestWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E54F6E0 databaseID:a3 error:0];
}

+ (id)findHomePersonWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomePersonWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomePersonWithModelID_error___hmf_once_t2, &__block_literal_global_289_155326);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomePersonWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E555160 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __61__HMCContext_MKFHomePerson__findHomePersonWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomePersonWithModelID_error___hmf_once_v3;
  findHomePersonWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findHomePersonWithModelID:(id)a3
{
  return +[HMCContext findHomePersonWithModelID:a3 error:0];
}

+ (id)findHomePersonWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E555160 databaseID:a3 error:a4];
}

+ (id)findHomePersonWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E555160 databaseID:a3 error:0];
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2, &__block_literal_global_312_158058);
  }
  id v10 = (id)findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  id v11 = [v8 objectID];
  v15[0] = @"OBJECTID";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v8;
  v16[1] = v9;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E556FC8 parentObjectID:v11 template:v10 substitutions:v12 error:a5];

  return v13;
}

void __102__HMCContext_MKFStringCharacteristic__findStringCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"service = $PARENT AND instanceID = $SECONDARYKEY"];
  v1 = (void *)findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findStringCharacteristicWithInstanceID:a3 serviceDatabaseID:a4 error:0];
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findStringCharacteristicWithInstanceID_service_error___hmf_once_t0;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findStringCharacteristicWithInstanceID_service_error___hmf_once_t0, &__block_literal_global_158069);
  }
  v15[0] = @"PRIMARYKEY";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v9;
  v16[1] = v8;
  id v10 = NSDictionary;
  id v11 = (id)findStringCharacteristicWithInstanceID_service_error___hmf_once_v1;
  uint64_t v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E556FC8 template:v11 substitutions:v12 error:a5];

  return v13;
}

void __92__HMCContext_MKFStringCharacteristic__findStringCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"];
  v1 = (void *)findStringCharacteristicWithInstanceID_service_error___hmf_once_v1;
  findStringCharacteristicWithInstanceID_service_error___hmf_once_v1 = v0;
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findStringCharacteristicWithInstanceID:a3 service:a4 error:0];
}

+ (id)findStringCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E556FC8 databaseID:a3 error:a4];
}

+ (id)findStringCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E556FC8 databaseID:a3 error:0];
}

+ (id)findMatterLocalKeyValuePairWithKey:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMatterLocalKeyValuePairWithKey_error___hmf_once_t3;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMatterLocalKeyValuePairWithKey_error___hmf_once_t3, &__block_literal_global_268_164763);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findMatterLocalKeyValuePairWithKey_error___hmf_once_v4;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E55B648 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __83__HMCContext_MKFMatterLocalKeyValuePair__findMatterLocalKeyValuePairWithKey_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"key = $PRIMARYKEY"];
  v1 = (void *)findMatterLocalKeyValuePairWithKey_error___hmf_once_v4;
  findMatterLocalKeyValuePairWithKey_error___hmf_once_id v4 = v0;
}

+ (id)findMatterLocalKeyValuePairWithKey:(id)a3
{
  return +[HMCContext findMatterLocalKeyValuePairWithKey:a3 error:0];
}

+ (id)findMatterLocalKeyValuePairWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E55B648 databaseID:a3 error:a4];
}

+ (id)findMatterLocalKeyValuePairWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E55B648 databaseID:a3 error:0];
}

+ (id)findHAPAccessoryWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHAPAccessoryWithModelID_error___hmf_once_t9;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHAPAccessoryWithModelID_error___hmf_once_t9, &__block_literal_global_847);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHAPAccessoryWithModelID_error___hmf_once_v10;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E55CBD8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __65__HMCContext_MKFHAPAccessory__findHAPAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHAPAccessoryWithModelID_error___hmf_once_v10;
  findHAPAccessoryWithModelID_error___hmf_once_id v10 = v0;
}

+ (id)findHAPAccessoryWithModelID:(id)a3
{
  return +[HMCContext findHAPAccessoryWithModelID:a3 error:0];
}

+ (id)findHAPAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E55CBD8 databaseID:a3 error:a4];
}

+ (id)findHAPAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E55CBD8 databaseID:a3 error:0];
}

+ (id)findOutgoingInvitationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findOutgoingInvitationWithModelID_error___hmf_once_t4;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findOutgoingInvitationWithModelID_error___hmf_once_t4, &__block_literal_global_404);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findOutgoingInvitationWithModelID_error___hmf_once_v5;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E561650 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __77__HMCContext_MKFOutgoingInvitation__findOutgoingInvitationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findOutgoingInvitationWithModelID_error___hmf_once_v5;
  findOutgoingInvitationWithModelID_error___hmf_once_uint64_t v5 = v0;
}

+ (id)findOutgoingInvitationWithModelID:(id)a3
{
  return +[HMCContext findOutgoingInvitationWithModelID:a3 error:0];
}

+ (id)findOutgoingInvitationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E561650 databaseID:a3 error:a4];
}

+ (id)findOutgoingInvitationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E561650 databaseID:a3 error:0];
}

+ (id)findAccountHandleWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAccountHandleWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAccountHandleWithModelID_error___hmf_once_t0, &__block_literal_global_179738);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findAccountHandleWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E569980 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __67__HMCContext_MKFAccountHandle__findAccountHandleWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAccountHandleWithModelID_error___hmf_once_v1;
  findAccountHandleWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findAccountHandleWithModelID:(id)a3
{
  return +[HMCContext findAccountHandleWithModelID:a3 error:0];
}

+ (id)findAccountHandleWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E569980 databaseID:a3 error:a4];
}

+ (id)findAccountHandleWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E569980 databaseID:a3 error:0];
}

+ (id)findNotificationRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findNotificationRegistrationWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findNotificationRegistrationWithModelID_error___hmf_once_t2, &__block_literal_global_298_188417);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findNotificationRegistrationWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E571E98 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __89__HMCContext_MKFNotificationRegistration__findNotificationRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findNotificationRegistrationWithModelID_error___hmf_once_v3;
  findNotificationRegistrationWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findNotificationRegistrationWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationWithModelID:a3 error:0];
}

+ (id)findNotificationRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E571E98 databaseID:a3 error:a4];
}

+ (id)findNotificationRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E571E98 databaseID:a3 error:0];
}

+ (id)findZoneWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findZoneWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findZoneWithModelID_error___hmf_once_t2, &__block_literal_global_289_189618);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findZoneWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5726F0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __49__HMCContext_MKFZone__findZoneWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findZoneWithModelID_error___hmf_once_v3;
  findZoneWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findZoneWithModelID:(id)a3
{
  return +[HMCContext findZoneWithModelID:a3 error:0];
}

+ (id)findZoneWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5726F0 databaseID:a3 error:a4];
}

+ (id)findZoneWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5726F0 databaseID:a3 error:0];
}

+ (id)findAnalysisEventBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_t0, &__block_literal_global_190083);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5728E0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __107__HMCContext_MKFAnalysisEventBulletinRegistration__findAnalysisEventBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_v1;
  findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findAnalysisEventBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findAnalysisEventBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findAnalysisEventBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5728E0 databaseID:a3 error:a4];
}

+ (id)findAnalysisEventBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5728E0 databaseID:a3 error:0];
}

+ (id)findAccessoryNetworkProtectionGroupWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_t2, &__block_literal_global_285);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E572EF8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __103__HMCContext_MKFAccessoryNetworkProtectionGroup__findAccessoryNetworkProtectionGroupWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_v3;
  findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findAccessoryNetworkProtectionGroupWithModelID:(id)a3
{
  return +[HMCContext findAccessoryNetworkProtectionGroupWithModelID:a3 error:0];
}

+ (id)findAccessoryNetworkProtectionGroupWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E572EF8 databaseID:a3 error:a4];
}

+ (id)findAccessoryNetworkProtectionGroupWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E572EF8 databaseID:a3 error:0];
}

+ (id)findNotificationRegistrationMediaPropertyWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_t1, &__block_literal_global_195983);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E578618 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __115__HMCContext_MKFNotificationRegistrationMediaProperty__findNotificationRegistrationMediaPropertyWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_v2;
  findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findNotificationRegistrationMediaPropertyWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationMediaPropertyWithModelID:a3 error:0];
}

+ (id)findNotificationRegistrationMediaPropertyWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E578618 databaseID:a3 error:a4];
}

+ (id)findNotificationRegistrationMediaPropertyWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E578618 databaseID:a3 error:0];
}

+ (id)findYearDayScheduleRuleWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findYearDayScheduleRuleWithModelID_error___hmf_once_t4;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findYearDayScheduleRuleWithModelID_error___hmf_once_t4, &__block_literal_global_197222);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findYearDayScheduleRuleWithModelID_error___hmf_once_v5;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E579450 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __79__HMCContext_MKFYearDayScheduleRule__findYearDayScheduleRuleWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findYearDayScheduleRuleWithModelID_error___hmf_once_v5;
  findYearDayScheduleRuleWithModelID_error___hmf_once_uint64_t v5 = v0;
}

+ (id)findYearDayScheduleRuleWithModelID:(id)a3
{
  return +[HMCContext findYearDayScheduleRuleWithModelID:a3 error:0];
}

+ (id)findYearDayScheduleRuleWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E579450 databaseID:a3 error:a4];
}

+ (id)findYearDayScheduleRuleWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E579450 databaseID:a3 error:0];
}

+ (id)findMatterPathWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMatterPathWithModelID_error___hmf_once_t8;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMatterPathWithModelID_error___hmf_once_t8, &__block_literal_global_366_198555);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findMatterPathWithModelID_error___hmf_once_v9;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E57A8B8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __61__HMCContext_MKFMatterPath__findMatterPathWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMatterPathWithModelID_error___hmf_once_v9;
  findMatterPathWithModelID_error___hmf_once_id v9 = v0;
}

+ (id)findMatterPathWithModelID:(id)a3
{
  return +[HMCContext findMatterPathWithModelID:a3 error:0];
}

+ (id)findMatterPathWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E57A8B8 databaseID:a3 error:a4];
}

+ (id)findMatterPathWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E57A8B8 databaseID:a3 error:0];
}

+ (id)findActionSetWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findActionSetWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findActionSetWithModelID_error___hmf_once_t2, &__block_literal_global_375);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findActionSetWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E57F750 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __59__HMCContext_MKFActionSet__findActionSetWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findActionSetWithModelID_error___hmf_once_v3;
  findActionSetWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findActionSetWithModelID:(id)a3
{
  return +[HMCContext findActionSetWithModelID:a3 error:0];
}

+ (id)findActionSetWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E57F750 databaseID:a3 error:a4];
}

+ (id)findActionSetWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E57F750 databaseID:a3 error:0];
}

+ (id)findApplicationDataWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findApplicationDataWithModelID_error___hmf_once_t5;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findApplicationDataWithModelID_error___hmf_once_t5, &__block_literal_global_338_204510);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findApplicationDataWithModelID_error___hmf_once_v6;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E580A60 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __71__HMCContext_MKFApplicationData__findApplicationDataWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findApplicationDataWithModelID_error___hmf_once_v6;
  findApplicationDataWithModelID_error___hmf_once_id v6 = v0;
}

+ (id)findApplicationDataWithModelID:(id)a3
{
  return +[HMCContext findApplicationDataWithModelID:a3 error:0];
}

+ (id)findApplicationDataWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E580A60 databaseID:a3 error:a4];
}

+ (id)findApplicationDataWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E580A60 databaseID:a3 error:0];
}

+ (id)findSunriseSunsetTimeSpecificationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_t0, &__block_literal_global_205709);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E581590 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __101__HMCContext_MKFSunriseSunsetTimeSpecification__findSunriseSunsetTimeSpecificationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_v1;
  findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return +[HMCContext findSunriseSunsetTimeSpecificationWithModelID:a3 error:0];
}

+ (id)findSunriseSunsetTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E581590 databaseID:a3 error:a4];
}

+ (id)findSunriseSunsetTimeSpecificationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E581590 databaseID:a3 error:0];
}

+ (id)findHomeMediaSettingWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeMediaSettingWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeMediaSettingWithModelID_error___hmf_once_t0, &__block_literal_global_207074);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeMediaSettingWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E582BC8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __73__HMCContext_MKFHomeMediaSetting__findHomeMediaSettingWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeMediaSettingWithModelID_error___hmf_once_v1;
  findHomeMediaSettingWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findHomeMediaSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeMediaSettingWithModelID:a3 error:0];
}

+ (id)findHomeMediaSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E582BC8 databaseID:a3 error:a4];
}

+ (id)findHomeMediaSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E582BC8 databaseID:a3 error:0];
}

+ (id)findTriggerWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findTriggerWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findTriggerWithModelID_error___hmf_once_t2, &__block_literal_global_314);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findTriggerWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E53A660 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __55__HMCContext_MKFTrigger__findTriggerWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findTriggerWithModelID_error___hmf_once_v3;
  findTriggerWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findTriggerWithModelID:(id)a3
{
  return +[HMCContext findTriggerWithModelID:a3 error:0];
}

+ (id)findTriggerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E53A660 databaseID:a3 error:a4];
}

+ (id)findTriggerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E53A660 databaseID:a3 error:0];
}

+ (id)findNaturalLightingActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findNaturalLightingActionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findNaturalLightingActionWithModelID_error___hmf_once_t0, &__block_literal_global_222085);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findNaturalLightingActionWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E596630 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __83__HMCContext_MKFNaturalLightingAction__findNaturalLightingActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findNaturalLightingActionWithModelID_error___hmf_once_v1;
  findNaturalLightingActionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findNaturalLightingActionWithModelID:(id)a3
{
  return +[HMCContext findNaturalLightingActionWithModelID:a3 error:0];
}

+ (id)findNaturalLightingActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E596630 databaseID:a3 error:a4];
}

+ (id)findNaturalLightingActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E596630 databaseID:a3 error:0];
}

+ (id)findEventTriggerWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findEventTriggerWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findEventTriggerWithModelID_error___hmf_once_t2, &__block_literal_global_407);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findEventTriggerWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E596E90 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __65__HMCContext_MKFEventTrigger__findEventTriggerWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findEventTriggerWithModelID_error___hmf_once_v3;
  findEventTriggerWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findEventTriggerWithModelID:(id)a3
{
  return +[HMCContext findEventTriggerWithModelID:a3 error:0];
}

+ (id)findEventTriggerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E596E90 databaseID:a3 error:a4];
}

+ (id)findEventTriggerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E596E90 databaseID:a3 error:0];
}

+ (id)findCharacteristicBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_t0, &__block_literal_global_232299);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5A60D0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __109__HMCContext_MKFCharacteristicBulletinRegistration__findCharacteristicBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_v1;
  findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findCharacteristicBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicBulletinRegistrationWithModelID:a3 error:0];
}

+ (id)findCharacteristicBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5A60D0 databaseID:a3 error:a4];
}

+ (id)findCharacteristicBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5A60D0 databaseID:a3 error:0];
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2, &__block_literal_global_318);
  }
  id v10 = (id)findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  id v11 = [v8 objectID];
  v15[0] = @"OBJECTID";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v8;
  v16[1] = v9;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E5A6590 parentObjectID:v11 template:v10 substitutions:v12 error:a5];

  return v13;
}

void __100__HMCContext_MKFFloatCharacteristic__findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"service = $PARENT AND instanceID = $SECONDARYKEY"];
  v1 = (void *)findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findFloatCharacteristicWithInstanceID:a3 serviceDatabaseID:a4 error:0];
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = findFloatCharacteristicWithInstanceID_service_error___hmf_once_t0;
  id v8 = a4;
  id v9 = a3;
  if (v7 != -1) {
    dispatch_once(&findFloatCharacteristicWithInstanceID_service_error___hmf_once_t0, &__block_literal_global_233106);
  }
  v15[0] = @"PRIMARYKEY";
  v15[1] = @"SECONDARYKEY";
  v16[0] = v9;
  v16[1] = v8;
  id v10 = NSDictionary;
  id v11 = (id)findFloatCharacteristicWithInstanceID_service_error___hmf_once_v1;
  uint64_t v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = +[HMCContext findModelObjectOfType:&unk_26E5A6590 template:v11 substitutions:v12 error:a5];

  return v13;
}

void __90__HMCContext_MKFFloatCharacteristic__findFloatCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"];
  v1 = (void *)findFloatCharacteristicWithInstanceID_service_error___hmf_once_v1;
  findFloatCharacteristicWithInstanceID_service_error___hmf_once_v1 = v0;
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findFloatCharacteristicWithInstanceID:a3 service:a4 error:0];
}

+ (id)findFloatCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5A6590 databaseID:a3 error:a4];
}

+ (id)findFloatCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5A6590 databaseID:a3 error:0];
}

+ (id)findRemovedUserAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findRemovedUserAccessCodeWithModelID_error___hmf_once_t2;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findRemovedUserAccessCodeWithModelID_error___hmf_once_t2, &__block_literal_global_292);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findRemovedUserAccessCodeWithModelID_error___hmf_once_v3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5BC310 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __83__HMCContext_MKFRemovedUserAccessCode__findRemovedUserAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findRemovedUserAccessCodeWithModelID_error___hmf_once_v3;
  findRemovedUserAccessCodeWithModelID_error___hmf_once_uint64_t v3 = v0;
}

+ (id)findRemovedUserAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findRemovedUserAccessCodeWithModelID:a3 error:0];
}

+ (id)findRemovedUserAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5BC310 databaseID:a3 error:a4];
}

+ (id)findRemovedUserAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5BC310 databaseID:a3 error:0];
}

+ (id)findHomeSoftwareUpdateSettingWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_t0, &__block_literal_global_256913);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5C19F8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __91__HMCContext_MKFHomeSoftwareUpdateSetting__findHomeSoftwareUpdateSettingWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_v1;
  findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findHomeSoftwareUpdateSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeSoftwareUpdateSettingWithModelID:a3 error:0];
}

+ (id)findHomeSoftwareUpdateSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C19F8 databaseID:a3 error:a4];
}

+ (id)findHomeSoftwareUpdateSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C19F8 databaseID:a3 error:0];
}

+ (id)findCharacteristicEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCharacteristicEventWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCharacteristicEventWithModelID_error___hmf_once_t1, &__block_literal_global_259626);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCharacteristicEventWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5145D0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __79__HMCContext_MKFCharacteristicEvent__findCharacteristicEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCharacteristicEventWithModelID_error___hmf_once_v2;
  findCharacteristicEventWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findCharacteristicEventWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicEventWithModelID:a3 error:0];
}

+ (id)findCharacteristicEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5145D0 databaseID:a3 error:a4];
}

+ (id)findCharacteristicEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5145D0 databaseID:a3 error:0];
}

+ (id)findNotificationRegistrationActionSetWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findNotificationRegistrationActionSetWithModelID_error___hmf_once_t1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findNotificationRegistrationActionSetWithModelID_error___hmf_once_t1, &__block_literal_global_260323);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findNotificationRegistrationActionSetWithModelID_error___hmf_once_v2;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5C38E0 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __107__HMCContext_MKFNotificationRegistrationActionSet__findNotificationRegistrationActionSetWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findNotificationRegistrationActionSetWithModelID_error___hmf_once_v2;
  findNotificationRegistrationActionSetWithModelID_error___hmf_once_id v2 = v0;
}

+ (id)findNotificationRegistrationActionSetWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationActionSetWithModelID:a3 error:0];
}

+ (id)findNotificationRegistrationActionSetWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C38E0 databaseID:a3 error:a4];
}

+ (id)findNotificationRegistrationActionSetWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C38E0 databaseID:a3 error:0];
}

+ (id)findMatterCommandActionWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findMatterCommandActionWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findMatterCommandActionWithModelID_error___hmf_once_t0, &__block_literal_global_260862);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findMatterCommandActionWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5C3A50 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __79__HMCContext_MKFMatterCommandAction__findMatterCommandActionWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findMatterCommandActionWithModelID_error___hmf_once_v1;
  findMatterCommandActionWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findMatterCommandActionWithModelID:(id)a3
{
  return +[HMCContext findMatterCommandActionWithModelID:a3 error:0];
}

+ (id)findMatterCommandActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C3A50 databaseID:a3 error:a4];
}

+ (id)findMatterCommandActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C3A50 databaseID:a3 error:0];
}

+ (id)findCharacteristicRangeEventWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findCharacteristicRangeEventWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findCharacteristicRangeEventWithModelID_error___hmf_once_t0, &__block_literal_global_262760);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findCharacteristicRangeEventWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5C57C8 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __89__HMCContext_MKFCharacteristicRangeEvent__findCharacteristicRangeEventWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findCharacteristicRangeEventWithModelID_error___hmf_once_v1;
  findCharacteristicRangeEventWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findCharacteristicRangeEventWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicRangeEventWithModelID:a3 error:0];
}

+ (id)findCharacteristicRangeEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C57C8 databaseID:a3 error:a4];
}

+ (id)findCharacteristicRangeEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C57C8 databaseID:a3 error:0];
}

+ (id)findWeekDayScheduleRuleWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findWeekDayScheduleRuleWithModelID_error___hmf_once_t5;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findWeekDayScheduleRuleWithModelID_error___hmf_once_t5, &__block_literal_global_263948);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findWeekDayScheduleRuleWithModelID_error___hmf_once_v6;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5C7A08 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __79__HMCContext_MKFWeekDayScheduleRule__findWeekDayScheduleRuleWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findWeekDayScheduleRuleWithModelID_error___hmf_once_v6;
  findWeekDayScheduleRuleWithModelID_error___hmf_once_id v6 = v0;
}

+ (id)findWeekDayScheduleRuleWithModelID:(id)a3
{
  return +[HMCContext findWeekDayScheduleRuleWithModelID:a3 error:0];
}

+ (id)findWeekDayScheduleRuleWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C7A08 databaseID:a3 error:a4];
}

+ (id)findWeekDayScheduleRuleWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5C7A08 databaseID:a3 error:0];
}

+ (id)findNotificationRegistrationCharacteristicWithModelID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_t0;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_t0, &__block_literal_global_272935);
  }
  uint64_t v12 = @"PRIMARYKEY";
  v13[0] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = (id)findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_v1;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = +[HMCContext findModelObjectOfType:&unk_26E5D0820 template:v8 substitutions:v9 error:a4];

  return v10;
}

void __117__HMCContext_MKFNotificationRegistrationCharacteristic__findNotificationRegistrationCharacteristicWithModelID_error___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelID = $PRIMARYKEY"];
  v1 = (void *)findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_v1;
  findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_v1 = v0;
}

+ (id)findNotificationRegistrationCharacteristicWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationCharacteristicWithModelID:a3 error:0];
}

+ (id)findNotificationRegistrationCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:&unk_26E5D0820 databaseID:a3 error:a4];
}

+ (id)findNotificationRegistrationCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:&unk_26E5D0820 databaseID:a3 error:0];
}

@end