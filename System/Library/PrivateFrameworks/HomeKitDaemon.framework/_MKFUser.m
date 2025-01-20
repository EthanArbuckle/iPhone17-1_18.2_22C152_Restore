@interface _MKFUser
+ (BOOL)isOwnerOrAdminWithPrivilege:(unint64_t)a3;
+ (BOOL)isOwnerWithPrivilege:(unint64_t)a3;
+ (BOOL)isResidentSyncParticipantWithPrivilege:(unint64_t)a3;
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)findUserUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5;
+ (id)logCategory;
+ (id)modelIDForParentRelationshipTo:(id)a3;
+ (id)sharedUserDataRootForUser:(id)a3 context:(id)a4;
- (BOOL)isOwner;
- (BOOL)isOwnerOrAdmin;
- (BOOL)isResidentSyncParticipant;
- (BOOL)isRestrictedGuest;
- (MKFUserDatabaseID)databaseID;
- (NSArray)accessoriesWithListeningHistoryEnabled;
- (NSArray)accessoriesWithMediaContentProfileEnabled;
- (NSArray)accessoriesWithPersonalRequestsEnabled;
- (NSArray)allowedAccessories;
- (NSArray)bulletinConditions;
- (NSArray)bulletinRegistrations;
- (NSArray)locationEvents;
- (NSArray)notificationRegistrations;
- (NSArray)pairedAirPlayAccessories;
- (NSArray)pairedHAPAccessories;
- (NSArray)personsFromPhotos;
- (NSArray)presenceEvents;
- (NSArray)triggers;
- (NSArray)userActivityStatuses;
- (_MKFUser)userWithAccessCode:(id)a3 context:(id)a4;
- (id)additionalModelsForSameUser;
- (id)castIfMemberIsGuest;
- (id)castIfMemberIsUser;
- (id)characteristicBulletinRegistrationForAccessory:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 deviceIdsIdentifier:(id)a6 context:(id)a7;
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
- (id)findAccessCodeRelationWithModelID:(id)a3;
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
- (id)findPersonsFromPhotosRelationWithModelID:(id)a3;
- (id)findUserActivityStatusesRelationWithModelID:(id)a3;
- (id)materializeOrCreateAccessCodeRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinConditionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeMatterBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreatePersonsFromPhotosRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateUserActivityStatusesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)matterBulletinRegistrationForEndpointID:(id)a3 accessoryUUID:(id)a4 deviceIdsIdentifier:(id)a5 context:(id)a6;
- (id)notificationRegistrationForCharacteristic:(id)a3 deviceIdsDestination:(id)a4 context:(id)a5;
- (id)notificationRegistrationForMediaProperty:(id)a3 mediaProfile:(id)a4 deviceIdsDestination:(id)a5 context:(id)a6;
- (id)sharedUserDataRoot;
- (void)addAccessoriesWithListeningHistoryEnabledObject:(id)a3;
- (void)addAccessoriesWithMediaContentProfileEnabledObject:(id)a3;
- (void)addAccessoriesWithPersonalRequestsEnabledObject:(id)a3;
- (void)addBulletinConditionsObject:(id)a3;
- (void)addBulletinRegistrationsObject:(id)a3;
- (void)addNotificationRegistrationsObject:(id)a3;
- (void)addPairedAirPlayAccessoriesObject:(id)a3;
- (void)addPairedHAPAccessoriesObject:(id)a3;
- (void)addPersonsFromPhotosObject:(id)a3;
- (void)addUserActivityStatusesObject:(id)a3;
- (void)removeAccessoriesWithListeningHistoryEnabledObject:(id)a3;
- (void)removeAccessoriesWithMediaContentProfileEnabledObject:(id)a3;
- (void)removeAccessoriesWithPersonalRequestsEnabledObject:(id)a3;
- (void)removeBulletinConditionsObject:(id)a3;
- (void)removeBulletinRegistrationsObject:(id)a3;
- (void)removeNotificationRegistrationsObject:(id)a3;
- (void)removePairedAirPlayAccessoriesObject:(id)a3;
- (void)removePairedHAPAccessoriesObject:(id)a3;
- (void)removePersonsFromPhotosObject:(id)a3;
- (void)removeUserActivityStatusesObject:(id)a3;
- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4;
@end

@implementation _MKFUser

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFUser"];
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
  v2 = [(_MKFUser *)self valueForKey:@"userActivityStatuses_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)triggers
{
  v2 = [(_MKFUser *)self valueForKey:@"triggers_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)presenceEvents
{
  v2 = [(_MKFUser *)self valueForKey:@"presenceEvents_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removePersonsFromPhotosObject:(id)a3
{
}

- (void)addPersonsFromPhotosObject:(id)a3
{
}

- (id)findPersonsFromPhotosRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"personsFromPhotos_" modelProtocol:@"MKFPhotosPerson" keyValue:a3];
}

- (id)materializeOrCreatePersonsFromPhotosRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"personsFromPhotos_" modelProtocol:@"MKFPhotosPerson" keyValue:a3 createdNew:a4];
}

- (NSArray)personsFromPhotos
{
  v2 = [(_MKFUser *)self valueForKey:@"personsFromPhotos_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removePairedHAPAccessoriesObject:(id)a3
{
}

- (void)addPairedHAPAccessoriesObject:(id)a3
{
}

- (NSArray)pairedHAPAccessories
{
  v2 = [(_MKFUser *)self valueForKey:@"pairedHAPAccessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removePairedAirPlayAccessoriesObject:(id)a3
{
}

- (void)addPairedAirPlayAccessoriesObject:(id)a3
{
}

- (NSArray)pairedAirPlayAccessories
{
  v2 = [(_MKFUser *)self valueForKey:@"pairedAirPlayAccessories_"];
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
  v2 = [(_MKFUser *)self valueForKey:@"notificationRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)locationEvents
{
  v2 = [(_MKFUser *)self valueForKey:@"locationEvents_"];
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
  v2 = [(_MKFUser *)self valueForKey:@"bulletinRegistrations_"];
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
  v2 = [(_MKFUser *)self valueForKey:@"bulletinConditions_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeAccessoriesWithPersonalRequestsEnabledObject:(id)a3
{
}

- (void)addAccessoriesWithPersonalRequestsEnabledObject:(id)a3
{
}

- (NSArray)accessoriesWithPersonalRequestsEnabled
{
  v2 = [(_MKFUser *)self valueForKey:@"accessoriesWithPersonalRequestsEnabled_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeAccessoriesWithMediaContentProfileEnabledObject:(id)a3
{
}

- (void)addAccessoriesWithMediaContentProfileEnabledObject:(id)a3
{
}

- (NSArray)accessoriesWithMediaContentProfileEnabled
{
  v2 = [(_MKFUser *)self valueForKey:@"accessoriesWithMediaContentProfileEnabled_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeAccessoriesWithListeningHistoryEnabledObject:(id)a3
{
}

- (void)addAccessoriesWithListeningHistoryEnabledObject:(id)a3
{
}

- (NSArray)accessoriesWithListeningHistoryEnabled
{
  v2 = [(_MKFUser *)self valueForKey:@"accessoriesWithListeningHistoryEnabled_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)findAccessCodeRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"accessCode" modelProtocol:@"MKFUserAccessCode" keyValue:a3];
}

- (id)materializeOrCreateAccessCodeRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accessCode" modelProtocol:@"MKFUserAccessCode" keyValue:a3 createdNew:a4];
}

- (MKFUserDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFUserDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"bulletinRegistrations_" modelProtocol:@"MKFMatterBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (id)castIfMemberIsGuest
{
  return 0;
}

- (NSArray)allowedAccessories
{
  return 0;
}

- (BOOL)isRestrictedGuest
{
  v2 = [(_MKFUser *)self privilege];
  char v3 = [v2 isEqualToNumber:&unk_26E471230];

  return v3;
}

- (id)castIfMemberIsUser
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (id)additionalModelsForSameUser
{
  v38[3] = *MEMORY[0x263EF8340];
  char v3 = [(_MKFUser *)self managedObjectContext];
  v4 = +[_MKFUser fetchRequest];
  v5 = (void *)MEMORY[0x263F08A98];
  id v6 = [(_MKFUser *)self home];
  v7 = [(_MKFUser *)self modelID];
  id v8 = [v5 predicateWithFormat:@"(%K == %@) AND (%K != %@)", @"home", v6, @"modelID", v7];
  [v4 setPredicate:v8];

  v38[0] = @"accountIdentifier";
  v38[1] = @"idsMergeIdentifier";
  v38[2] = @"modelID";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
  [v4 setPropertiesToFetch:v9];

  id v31 = 0;
  v10 = [v3 executeFetchRequest:v4 error:&v31];
  v11 = (_MKFUser *)v31;
  if (v10)
  {
    if (![v10 count])
    {
      v27 = [MEMORY[0x263EFFA08] set];
      goto LABEL_14;
    }
    v12 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v10, "count"));
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __39___MKFUser_additionalModelsForSameUser__block_invoke;
    v29[3] = &unk_264A1BAB8;
    v29[4] = self;
    id v13 = v12;
    id v30 = v13;
    objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
    uint64_t v14 = [v13 count];
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v33 = v19;
        __int16 v34 = 2112;
        v35 = v16;
        __int16 v36 = 2112;
        id v37 = v13;
        v20 = "%{public}@%@ matched additional models: %@";
        v21 = v17;
        uint32_t v22 = 32;
LABEL_12:
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
      }
    }
    else if (v18)
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      __int16 v34 = 2112;
      v35 = v16;
      v20 = "%{public}@%@ did not match any other models";
      v21 = v17;
      uint32_t v22 = 22;
      goto LABEL_12;
    }

    v27 = (void *)[v13 copy];

    goto LABEL_14;
  }
  v23 = (void *)MEMORY[0x230FBD990]();
  v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v33 = v26;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to find user models: %@", buf, 0x16u);
  }
  v27 = 0;
LABEL_14:

  return v27;
}

- (BOOL)isResidentSyncParticipant
{
  char v3 = objc_opt_class();
  v4 = [(_MKFUser *)self privilege];
  LOBYTE(v3) = objc_msgSend(v3, "isResidentSyncParticipantWithPrivilege:", objc_msgSend(v4, "unsignedIntegerValue"));

  return (char)v3;
}

- (BOOL)isOwnerOrAdmin
{
  char v3 = objc_opt_class();
  v4 = [(_MKFUser *)self privilege];
  LOBYTE(v3) = objc_msgSend(v3, "isOwnerOrAdminWithPrivilege:", objc_msgSend(v4, "unsignedIntegerValue"));

  return (char)v3;
}

- (BOOL)isOwner
{
  char v3 = objc_opt_class();
  v4 = [(_MKFUser *)self privilege];
  LOBYTE(v3) = objc_msgSend(v3, "isOwnerWithPrivilege:", objc_msgSend(v4, "unsignedIntegerValue"));

  return (char)v3;
}

- (id)sharedUserDataRoot
{
  char v3 = objc_opt_class();
  v4 = [(_MKFUser *)self managedObjectContext];
  v5 = [v3 sharedUserDataRootForUser:self context:v4];

  return v5;
}

- (id)notificationRegistrationForMediaProperty:(id)a3 mediaProfile:(id)a4 deviceIdsDestination:(id)a5 context:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[_MKFNotificationRegistrationMediaProperty fetchRequest];
  v15 = [v11 uniqueIdentifier];
  v16 = [v11 accessory];
  v17 = [v16 uuid];

  v27 = v10;
  BOOL v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == %@) AND (%K == %@) AND (%K.modelID == %@)", @"user", self, @"deviceIdsDestination", v12, @"mediaProperty", v10, @"mediaProfileIdentifier", v15, @"accessory", v17];
  [v14 setPredicate:v18];

  id v28 = 0;
  v19 = [v13 executeFetchRequest:v14 error:&v28];
  id v20 = v28;
  if (v19)
  {
    v21 = [v19 firstObject];
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    uint32_t v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      id v30 = v25;
      __int16 v31 = 2112;
      v32 = v27;
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for mediaProperty: %@, mediaProfile: %@, deviceIdsDestination: %@, error: %@", buf, 0x34u);
    }
    v21 = 0;
  }

  return v21;
}

- (id)notificationRegistrationForCharacteristic:(id)a3 deviceIdsDestination:(id)a4 context:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[_MKFNotificationRegistrationCharacteristic fetchRequest];
  id v12 = [v8 instanceID];
  id v13 = [v8 service];
  uint64_t v14 = [v13 instanceID];

  v15 = [v8 accessory];
  v16 = [v15 uuid];

  if (v12 && v14 && v16)
  {
    v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K.%K == %@) AND (%K.%K.%K == %@) AND (%K.%K.%K.modelID == %@)", @"user", self, @"deviceIdsDestination", v9, @"characteristic", @"instanceID", v12, @"characteristic", @"service", @"instanceID", v14, @"characteristic", @"service", @"accessory", v16];
    [v11 setPredicate:v17];

    id v31 = v10;
    id v33 = 0;
    BOOL v18 = [v10 executeFetchRequest:v11 error:&v33];
    id v19 = v33;
    if (v18)
    {
      id v20 = [v18 firstObject];
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v35 = v29;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2112;
        id v41 = v19;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for characteristic: %@, deviceIdsDestination: %@, error: %@", buf, 0x2Au);
      }
      id v20 = 0;
    }

    id v10 = v31;
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    uint32_t v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v32 = v9;
      v25 = id v24 = v10;
      *(_DWORD *)buf = 138544130;
      __int16 v35 = v25;
      __int16 v36 = 2112;
      id v37 = v12;
      __int16 v38 = 2112;
      id v39 = v14;
      __int16 v40 = 2112;
      id v41 = v16;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Error before fetching registration for characteristic, characteristic value should not be nil: instanceID: %@, serviceInstanceID: %@, accessoryUUID: %@", buf, 0x2Au);

      id v10 = v24;
      id v9 = v32;
    }

    id v20 = 0;
  }

  return v20;
}

- (_MKFUser)userWithAccessCode:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_MKFUserAccessCode fetchRequest];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"accessCode", v6, @"user", self];
  [v8 setPredicate:v9];

  id v19 = 0;
  id v10 = [v7 executeFetchRequest:v8 error:&v19];
  id v11 = v19;
  if (v10)
  {
    id v12 = [v10 firstObject];
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [(_MKFUser *)v14 modelID];
      *(_DWORD *)buf = 138544130;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch userAccessCodes with access code %@ and user UUID %@: %@", buf, 0x2Au);
    }
    id v12 = 0;
  }

  return (_MKFUser *)v12;
}

- (id)matterBulletinRegistrationForEndpointID:(id)a3 accessoryUUID:(id)a4 deviceIdsIdentifier:(id)a5 context:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_msgSend(v13, "hmd_assertIsExecuting");
  uint64_t v14 = +[_MKFMatterBulletinRegistration fetchRequest];
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K.%K contains %@) AND (%K.%K.modelID contains %@)", @"user", self, @"deviceIdsIdentifier", v12, @"matterPaths_", @"endpointID", v10, @"matterPaths_", @"accessory", v11];
  [v14 setPredicate:v15];

  id v25 = 0;
  v16 = [v13 executeFetchRequest:v14 error:&v25];
  id v17 = v25;
  if (v16)
  {
    BOOL v18 = [v16 firstObject];
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      __int16 v22 = v24 = v19;
      *(_DWORD *)buf = 138544130;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Matter bulletin registration with endpointID %@: on accessory %@, error: %@", buf, 0x2Au);

      id v19 = v24;
    }

    BOOL v18 = 0;
  }

  return v18;
}

- (id)characteristicBulletinRegistrationForAccessory:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 deviceIdsIdentifier:(id)a6 context:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[_MKFCharacteristicBulletinRegistration fetchRequest];
  BOOL v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K.%K == %@) AND (%K.%K.%K == %@) AND (%K.%K.%K.modelID == %@)", @"user", self, @"deviceIdsIdentifier", v15, @"characteristic", @"instanceID", v14, @"characteristic", @"service", @"instanceID", v13, @"characteristic", @"service", @"accessory", v12];
  [v17 setPredicate:v18];

  id v27 = 0;
  id v19 = [v16 executeFetchRequest:v17 error:&v27];
  id v20 = v27;
  if (v19)
  {
    v21 = [v19 firstObject];
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v29 = v25;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic bulletin registration with characteristic instanceID %@: on accessory %@, error: %@", buf, 0x2Au);
    }
    v21 = 0;
  }

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1) {
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_798);
  }
  v2 = (void *)logCategory__hmf_once_v26;
  return v2;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4F4038;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t23 != -1) {
    dispatch_once(&homeRelation__hmf_once_t23, &__block_literal_global_63139);
  }
  v2 = (void *)homeRelation__hmf_once_v24;
  return (NSPredicate *)v2;
}

+ (BOOL)isResidentSyncParticipantWithPrivilege:(unint64_t)a3
{
  return (a3 < 6) & (0x39u >> a3);
}

+ (BOOL)isOwnerOrAdminWithPrivilege:(unint64_t)a3
{
  return a3 - 3 < 2;
}

+ (BOOL)isOwnerWithPrivilege:(unint64_t)a3
{
  return a3 == 3;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)sharedUserDataRootForUser:(id)a3 context:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "hmd_coreData");
  id v8 = [v5 home];
  id v9 = [v8 modelID];

  id v10 = [v5 reverseShareID];
  if ([v5 isOwner])
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v5 modelID];
      *(_DWORD *)buf = 138543618;
      v63 = v13;
      __int16 v64 = 2112;
      v65 = v14;
      id v15 = "%{public}@Owner %@ does not have a reverse share for their own home";
LABEL_21:
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, v15, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (!v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v5 modelID];
      *(_DWORD *)buf = 138543618;
      v63 = v13;
      __int16 v64 = 2112;
      v65 = v14;
      id v15 = "%{public}@Shared user %@ does not have a reverse share assigned";
      goto LABEL_21;
    }
LABEL_22:

    id v35 = 0;
    goto LABEL_33;
  }
  id v16 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", v9];
  [v16 setPredicate:v17];

  id v60 = 0;
  BOOL v18 = [v6 executeFetchRequest:v16 error:&v60];
  id v19 = v60;
  v52 = v18;
  if (v18)
  {
    if ([v18 count])
    {
      v49 = v16;
      id v50 = v19;
      v54 = v10;
      v45 = v9;
      v46 = v7;
      id v47 = v6;
      id v48 = v5;
      id v20 = [v7 container];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obj = v18;
      uint64_t v21 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v57 != v23) {
              objc_enumerationMutation(obj);
            }
            id v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            __int16 v26 = [v25 objectID];
            id v27 = [v20 recordForManagedObjectID:v26];

            if (v27)
            {
              __int16 v28 = [v54 zoneID];
              id v29 = [v27 recordID];
              __int16 v30 = [v29 zoneID];
              char v31 = [v28 isEqual:v30];

              if (v31)
              {
                id v35 = v25;

                goto LABEL_31;
              }
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      __int16 v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v63 = v34;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to find associated shared data root for user", buf, 0xCu);
      }
      id v35 = 0;
LABEL_31:
      id v6 = v47;
      id v5 = v48;
      id v9 = v45;
      id v7 = v46;
      id v10 = v54;
      id v19 = v50;

      id v16 = v49;
      goto LABEL_32;
    }
    uint64_t v41 = MEMORY[0x230FBD990]();
    uint64_t v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = id v51 = v19;
      *(_DWORD *)buf = 138543618;
      v63 = v43;
      __int16 v64 = 2112;
      v65 = v9;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@No shared user data roots for home %@", buf, 0x16u);

      id v19 = v51;
    }

    __int16 v40 = (void *)v41;
  }
  else
  {
    uint64_t v36 = MEMORY[0x230FBD990]();
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v55 = v36;
      v39 = id v38 = v19;
      *(_DWORD *)buf = 138543874;
      v63 = v39;
      __int16 v64 = 2112;
      v65 = v9;
      __int16 v66 = 2112;
      id v67 = v38;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch shared user data roots for home %@: %@", buf, 0x20u);

      id v19 = v38;
      uint64_t v36 = v55;
    }

    __int16 v40 = (void *)v36;
  }
  id v35 = 0;
LABEL_32:

LABEL_33:
  return v35;
}

+ (id)findUserUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[_MKFUser fetchRequest];
  id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@ && %K.%K == %@", @"reverseShareID", v8, @"home", @"modelID", v9];
  [v11 setPredicate:v12];

  [v11 setFetchLimit:2];
  id v23 = 0;
  id v13 = [v10 executeFetchRequest:v11 error:&v23];
  id v14 = v23;
  if (v13)
  {
    if ([v13 count] == 1)
    {
      id v15 = [v13 firstObject];
      goto LABEL_10;
    }
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    BOOL v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v21 = [v13 count];
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      id v20 = "%{public}@Failed to fetch working store user resulted into error: %zd matching users";
      goto LABEL_8;
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    BOOL v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2114;
      uint64_t v27 = (uint64_t)v14;
      id v20 = "%{public}@Failed to fetch working store user resulted into error: %{public}@";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
    }
  }

  id v15 = 0;
LABEL_10:

  return v15;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  id v7 = a3;
  id v6 = [a4 targetUser];

  if (v6 == self) {
    [v7 addCondition:@"userIsTargetUser"];
  }
  if ([(_MKFUser *)self isOwner]) {
    [v7 addCondition:@"userIsOwner"];
  }
}

@end