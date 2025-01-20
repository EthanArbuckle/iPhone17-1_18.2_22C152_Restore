@interface _MKFGuest
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)findGuestUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5;
+ (id)logCategory;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)isOwner;
- (BOOL)isOwnerOrAdmin;
- (BOOL)isResidentSyncParticipant;
- (BOOL)isRestrictedGuest;
- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3;
- (MKFGuestDatabaseID)databaseID;
- (NSArray)allowedAccessories;
- (NSArray)bulletinConditions;
- (NSArray)bulletinRegistrations;
- (NSArray)notificationRegistrations;
- (NSArray)presenceEvents;
- (NSArray)userActivityStatuses;
- (NSArray)weekDayScheduleRules;
- (NSArray)yearDayScheduleRules;
- (id)allowedAccessoryUUIDs;
- (id)castIfMemberIsGuest;
- (id)castIfMemberIsUser;
- (id)characteristicBulletinRegistrationForAccessory:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 deviceIdsIdentifier:(id)a6 context:(id)a7;
- (id)createAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4;
- (id)createAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3;
- (id)createAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3;
- (id)createAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4;
- (id)createBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3;
- (id)createBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3;
- (id)createNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4;
- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3;
- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3;
- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3;
- (id)findAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3;
- (id)findAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3;
- (id)findAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3;
- (id)findBulletinConditionsRelationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3;
- (id)findBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3;
- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3;
- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3;
- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3;
- (id)findUserActivityStatusesRelationWithModelID:(id)a3;
- (id)findWeekDayScheduleRulesRelationWithModelID:(id)a3;
- (id)findYearDayScheduleRulesRelationWithModelID:(id)a3;
- (id)materializeOrCreateAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinConditionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateUserActivityStatusesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateWeekDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateYearDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)matterBulletinRegistrationForEndpointID:(id)a3 accessoryUUID:(id)a4 deviceIdsIdentifier:(id)a5 context:(id)a6;
- (id)restrictedGuestSchedule;
- (void)addAllowedAccessoriesObject:(id)a3;
- (void)addBulletinConditionsObject:(id)a3;
- (void)addBulletinRegistrationsObject:(id)a3;
- (void)addNotificationRegistrationsObject:(id)a3;
- (void)addUserActivityStatusesObject:(id)a3;
- (void)addWeekDayScheduleRulesObject:(id)a3;
- (void)addYearDayScheduleRulesObject:(id)a3;
- (void)dematerializeAllowedAccessoriesRelationship;
- (void)dematerializeWeekDayRuleRelationship;
- (void)dematerializeYearDayRuleRelationship;
- (void)removeAllowedAccessoriesObject:(id)a3;
- (void)removeBulletinConditionsObject:(id)a3;
- (void)removeBulletinRegistrationsObject:(id)a3;
- (void)removeNotificationRegistrationsObject:(id)a3;
- (void)removeUserActivityStatusesObject:(id)a3;
- (void)removeWeekDayScheduleRulesObject:(id)a3;
- (void)removeYearDayScheduleRulesObject:(id)a3;
- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4;
@end

@implementation _MKFGuest

- (void)removeYearDayScheduleRulesObject:(id)a3
{
}

- (void)addYearDayScheduleRulesObject:(id)a3
{
}

- (id)findYearDayScheduleRulesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"yearDayScheduleRules_" modelProtocol:@"MKFYearDayScheduleRule" keyValue:a3];
}

- (id)materializeOrCreateYearDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"yearDayScheduleRules_" modelProtocol:@"MKFYearDayScheduleRule" keyValue:a3 createdNew:a4];
}

- (NSArray)yearDayScheduleRules
{
  v2 = [(_MKFGuest *)self valueForKey:@"yearDayScheduleRules_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeWeekDayScheduleRulesObject:(id)a3
{
}

- (void)addWeekDayScheduleRulesObject:(id)a3
{
}

- (id)findWeekDayScheduleRulesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"weekDayScheduleRules_" modelProtocol:@"MKFWeekDayScheduleRule" keyValue:a3];
}

- (id)materializeOrCreateWeekDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"weekDayScheduleRules_" modelProtocol:@"MKFWeekDayScheduleRule" keyValue:a3 createdNew:a4];
}

- (NSArray)weekDayScheduleRules
{
  v2 = [(_MKFGuest *)self valueForKey:@"weekDayScheduleRules_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeUserActivityStatusesObject:(id)a3
{
}

- (void)addUserActivityStatusesObject:(id)a3
{
}

- (id)findUserActivityStatusesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"userActivityStatuses_" modelProtocol:@"MKFUserActivityStatus" keyValue:a3];
}

- (id)materializeOrCreateUserActivityStatusesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"userActivityStatuses_" modelProtocol:@"MKFUserActivityStatus" keyValue:a3 createdNew:a4];
}

- (NSArray)userActivityStatuses
{
  v2 = [(_MKFGuest *)self valueForKey:@"userActivityStatuses_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)presenceEvents
{
  v2 = [(_MKFGuest *)self valueForKey:@"presenceEvents_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeNotificationRegistrationsObject:(id)a3
{
}

- (void)addNotificationRegistrationsObject:(id)a3
{
}

- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationMediaProperty" keyValue:a3];
}

- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationMediaProperty" keyValue:a3];
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationMediaProperty" keyValue:a3 createdNew:a4];
}

- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationCharacteristic" keyValue:a3];
}

- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationCharacteristic" keyValue:a3];
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationCharacteristic" keyValue:a3 createdNew:a4];
}

- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationActionSet" keyValue:a3];
}

- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationActionSet" keyValue:a3];
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"notificationRegistrations_" modelProtocol:@"MKFNotificationRegistrationActionSet" keyValue:a3 createdNew:a4];
}

- (id)createNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"notificationRegistrations_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"notificationRegistrations_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)notificationRegistrations
{
  v2 = [(_MKFGuest *)self valueForKey:@"notificationRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeBulletinRegistrationsObject:(id)a3
{
}

- (void)addBulletinRegistrationsObject:(id)a3
{
}

- (id)findBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFMatterBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFMatterBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFMatterBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)findBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCharacteristicBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCharacteristicBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCharacteristicBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)findBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraSignificantEventBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraSignificantEventBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraSignificantEventBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)findBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraReachabilityBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraReachabilityBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraReachabilityBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)findBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraAccessModeBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraAccessModeBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFCameraAccessModeBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)findBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)findBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFAnalysisEventBulletinRegistration" keyValue:a3];
}

- (id)createBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFAnalysisEventBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFAnalysisEventBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)createBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  id v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"bulletinRegistrations_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)bulletinRegistrations
{
  v2 = [(_MKFGuest *)self valueForKey:@"bulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeBulletinConditionsObject:(id)a3
{
}

- (void)addBulletinConditionsObject:(id)a3
{
}

- (id)findBulletinConditionsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"bulletinConditions_" modelProtocol:@"MKFPresenceBulletinCondition" keyValue:a3];
}

- (id)materializeOrCreateBulletinConditionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinConditions_" modelProtocol:@"MKFPresenceBulletinCondition" keyValue:a3 createdNew:a4];
}

- (NSArray)bulletinConditions
{
  v2 = [(_MKFGuest *)self valueForKey:@"bulletinConditions_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeAllowedAccessoriesObject:(id)a3
{
}

- (void)addAllowedAccessoriesObject:(id)a3
{
}

- (id)findAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)createAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3 createdNew:a4];
}

- (id)findAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3];
}

- (id)createAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3];
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3 createdNew:a4];
}

- (id)findAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3];
}

- (id)createAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3];
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3 createdNew:a4];
}

- (id)createAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  id v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)allowedAccessories
{
  v2 = [(_MKFGuest *)self valueForKey:@"allowedAccessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFGuestDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFGuestDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (void)dematerializeYearDayRuleRelationship
{
  id v3 = [(_MKFGuest *)self valueForKey:@"yearDayScheduleRules_"];
  [(_MKFModel *)self deleteObjects:v3];
}

- (void)dematerializeWeekDayRuleRelationship
{
  id v3 = [(_MKFGuest *)self valueForKey:@"weekDayScheduleRules_"];
  [(_MKFModel *)self deleteObjects:v3];
}

- (void)dematerializeAllowedAccessoriesRelationship
{
  id v3 = [MEMORY[0x263EFFA08] set];
  [(_MKFGuest *)self setValue:v3 forKey:@"allowedAccessories_"];
}

- (id)matterBulletinRegistrationForEndpointID:(id)a3 accessoryUUID:(id)a4 deviceIdsIdentifier:(id)a5 context:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_msgSend(v13, "hmd_assertIsExecuting");
  v14 = +[_MKFMatterBulletinRegistration fetchRequest];
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K.%K contains %@) AND (%K.%K.modelID contains %@)", @"guest", self, @"deviceIdsIdentifier", v12, @"matterPaths_", @"endpointID", v10, @"matterPaths_", @"accessory", v11];
  [v14 setPredicate:v15];

  id v25 = 0;
  v16 = [v13 executeFetchRequest:v14 error:&v25];
  id v17 = v25;
  if (v16)
  {
    v18 = [v16 firstObject];
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = v24 = v19;
      *(_DWORD *)buf = 138544130;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Matter bulletin registration with endpointID %@: on accessory %@, error: %@", buf, 0x2Au);

      v19 = v24;
    }

    v18 = 0;
  }

  return v18;
}

- (id)characteristicBulletinRegistrationForAccessory:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 deviceIdsIdentifier:(id)a6 context:(id)a7
{
  v52[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v37 = a7;
  v15 = +[_MKFCharacteristicBulletinRegistration fetchRequest];
  v36 = (void *)MEMORY[0x263F08A98];
  v38 = HAPInstanceIDFromValue();
  id v40 = v13;
  v52[0] = v38;
  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "longLongValue"));
  v52[1] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  v18 = HAPInstanceIDFromValue();
  v51[0] = v18;
  v41 = v12;
  v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
  v51[1] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
  v21 = v11;
  id v34 = v11;
  v22 = v14;
  v23 = [v36 predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K.%K IN %@) AND (%K.%K.%K IN %@) AND (%K.%K.%K.modelID == %@)", @"guest", self, @"deviceIdsIdentifier", v14, @"characteristic", @"instanceID", v17, @"characteristic", @"service", @"instanceID", v20, @"characteristic", @"service", @"accessory", v34];
  [v15 setPredicate:v23];

  v24 = v15;
  id v42 = 0;
  id v25 = [v37 executeFetchRequest:v15 error:&v42];
  id v26 = v42;
  if (v25)
  {
    v27 = [v25 firstObject];
    __int16 v28 = v40;
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    __int16 v30 = self;
    id v31 = HMFGetOSLogHandle();
    __int16 v28 = v40;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      __int16 v32 = v39 = v24;
      *(_DWORD *)buf = 138544130;
      v44 = v32;
      __int16 v45 = 2112;
      id v46 = v40;
      __int16 v47 = 2112;
      v48 = v21;
      __int16 v49 = 2112;
      id v50 = v26;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic bulletin registration with characteristic instanceID %@: on accessory %@, error: %@", buf, 0x2Au);

      v24 = v39;
    }

    v27 = 0;
  }

  return v27;
}

- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3
{
  id v4 = a3;
  [(_MKFGuest *)self dematerializeWeekDayRuleRelationship];
  [(_MKFGuest *)self dematerializeYearDayRuleRelationship];
  BOOL v5 = 1;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    id v6 = [v4 weekDayRules];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61___MKFGuest_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke;
    v10[3] = &unk_264A23280;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

    v7 = [v4 yearDayRules];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61___MKFGuest_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke_26;
    v9[3] = &unk_264A232A8;
    v9[4] = self;
    v9[5] = &v11;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

    BOOL v5 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (id)restrictedGuestSchedule
{
  id v3 = [(_MKFGuest *)self weekDayScheduleRules];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_147155);

  BOOL v5 = [(_MKFGuest *)self yearDayScheduleRules];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_22_147156);

  v7 = (void *)[objc_alloc(MEMORY[0x263F0E6E0]) initWithWeekDayRules:v4 yearDayRules:v6];
  return v7;
}

- (id)allowedAccessoryUUIDs
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(_MKFGuest *)self allowedAccessories];
  BOOL v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(_MKFGuest *)self allowedAccessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x230FBD990]();
        uint64_t v13 = [v11 modelID];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  char v14 = (void *)[v5 copy];
  return v14;
}

- (id)castIfMemberIsGuest
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)castIfMemberIsUser
{
  return 0;
}

- (BOOL)isRestrictedGuest
{
  v2 = [(_MKFGuest *)self privilege];
  char v3 = [v2 isEqualToNumber:&unk_26E472160];

  return v3;
}

- (BOOL)isResidentSyncParticipant
{
  v2 = [(_MKFGuest *)self privilege];
  BOOL v3 = +[_MKFUser isResidentSyncParticipantWithPrivilege:](_MKFUser, "isResidentSyncParticipantWithPrivilege:", [v2 unsignedIntegerValue]);

  return v3;
}

- (BOOL)isOwnerOrAdmin
{
  return 0;
}

- (BOOL)isOwner
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_147175 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_147175, &__block_literal_global_643);
  }
  v2 = (void *)logCategory__hmf_once_v10_147176;
  return v2;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E54F6E0;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t7 != -1) {
    dispatch_once(&homeRelation__hmf_once_t7, &__block_literal_global_75);
  }
  v2 = (void *)homeRelation__hmf_once_v8;
  return (NSPredicate *)v2;
}

+ (id)findGuestUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[_MKFGuest fetchRequest];
  id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@ && %K.%K == %@", @"reverseShareID", v8, @"home", @"modelID", v9];
  [v11 setPredicate:v12];

  [v11 setFetchLimit:2];
  id v23 = 0;
  uint64_t v13 = [v10 executeFetchRequest:v11 error:&v23];
  id v14 = v23;
  if (v13)
  {
    if ([v13 count] == 1)
    {
      v15 = [v13 firstObject];
      goto LABEL_10;
    }
    long long v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      uint64_t v21 = [v13 count];
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      v20 = "%{public}@Failed to fetch working store user resulted into error: %zd matching users";
      goto LABEL_8;
    }
  }
  else
  {
    long long v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2114;
      uint64_t v27 = (uint64_t)v14;
      v20 = "%{public}@Failed to fetch working store user resulted into error: %{public}@";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
    }
  }

  v15 = 0;
LABEL_10:

  return v15;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  id v11 = a3;
  uint64_t v6 = self;
  id v7 = a4;
  if ([(_MKFGuest *)v6 conformsToProtocol:&unk_26E4F21B0]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v7 targetUser];

  if (v9 == v10) {
    [v11 addCondition:@"userIsTargetUser"];
  }
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFGuest"];
}

@end