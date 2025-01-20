@interface _MKFHome
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)findHomeMemberUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5;
+ (id)findHomeMemberWithUUID:(id)a3 context:(id)a4;
- (BOOL)residentSyncClientDidSync;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFHomeDatabaseID)databaseID;
- (NSArray)accessories;
- (NSArray)actionSets;
- (NSArray)guestAccessCodes;
- (NSArray)guests;
- (NSArray)invitations;
- (NSArray)matterControllerLocalKeyValuePairs;
- (NSArray)networkProtectionGroups;
- (NSArray)persons;
- (NSArray)removedAccessCodes;
- (NSArray)residentSelections;
- (NSArray)residents;
- (NSArray)rooms;
- (NSArray)serviceGroups;
- (NSArray)settings;
- (NSArray)triggers;
- (NSArray)users;
- (NSArray)zones;
- (id)accessoryWithModelID:(id)a3 context:(id)a4;
- (id)createAccessoriesRelationOfType:(id)a3 modelID:(id)a4;
- (id)createAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3;
- (id)createAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3;
- (id)createAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3;
- (id)createTriggersRelationOfType:(id)a3 modelID:(id)a4;
- (id)createTriggersRelationOfTypeEventTriggerWithModelID:(id)a3;
- (id)createTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3;
- (id)findAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3;
- (id)findAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3;
- (id)findAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3;
- (id)findActionSetsRelationWithModelID:(id)a3;
- (id)findGuestAccessCodesRelationWithModelID:(id)a3;
- (id)findGuestsRelationWithModelID:(id)a3;
- (id)findHomeMemberWithUUID:(id)a3;
- (id)findInvitationsRelationWithModelID:(id)a3;
- (id)findMatterControllerLocalKeyValuePairsRelationWithKey:(id)a3;
- (id)findPersonsRelationWithModelID:(id)a3;
- (id)findRemovedAccessCodesRelationWithModelID:(id)a3;
- (id)findResidentSelectionsRelationWithModelID:(id)a3;
- (id)findResidentsRelationWithModelID:(id)a3;
- (id)findRoomsRelationWithModelID:(id)a3;
- (id)findServiceGroupsRelationWithModelID:(id)a3;
- (id)findSettingsRelationOfTypeHomeMediaSetting;
- (id)findSettingsRelationOfTypeHomeNetworkRouterManagingDeviceSetting;
- (id)findSettingsRelationOfTypeHomeNetworkRouterSetting;
- (id)findSettingsRelationOfTypeHomePersonManagerSetting;
- (id)findSettingsRelationOfTypeHomeSoftwareUpdateSetting;
- (id)findTriggersRelationOfTypeEventTriggerWithModelID:(id)a3;
- (id)findTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3;
- (id)findUsersRelationWithModelID:(id)a3;
- (id)findZonesRelationWithModelID:(id)a3;
- (id)guestAccessCode:(id)a3 withLabel:(id)a4 context:(id)a5;
- (id)homeMembers;
- (id)materializeOrCreateAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateActionSetsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3;
- (id)materializeOrCreateGuestAccessCodesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateMatterControllerLocalKeyValuePairsRelationWithKey:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNetworkProtectionGroupsRelation:(BOOL *)a3;
- (id)materializeOrCreatePersonsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateRemovedAccessCodesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateResidentSelectionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateResidentsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateRoomsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateServiceGroupsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateSettingsRelationOfTypeHomeMediaSetting:(BOOL *)a3;
- (id)materializeOrCreateSettingsRelationOfTypeHomeNetworkRouterManagingDeviceSetting:(BOOL *)a3;
- (id)materializeOrCreateSettingsRelationOfTypeHomeNetworkRouterSetting:(BOOL *)a3;
- (id)materializeOrCreateSettingsRelationOfTypeHomePersonManagerSetting:(BOOL *)a3;
- (id)materializeOrCreateSettingsRelationOfTypeHomeSoftwareUpdateSetting:(BOOL *)a3;
- (id)materializeOrCreateThreadNetworkRelation:(BOOL *)a3;
- (id)materializeOrCreateTriggersRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateTriggersRelationOfTypeEventTriggerWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateUsersRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateZonesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)addGuestAccessCodesObject:(id)a3;
- (void)addGuestsObject:(id)a3;
- (void)addMatterControllerLocalKeyValuePairsObject:(id)a3;
- (void)addPersonsObject:(id)a3;
- (void)addRemovedAccessCodesObject:(id)a3;
- (void)addResidentSelectionsObject:(id)a3;
- (void)addResidentsObject:(id)a3;
- (void)removeGuestAccessCodesObject:(id)a3;
- (void)removeGuestsObject:(id)a3;
- (void)removeMatterControllerLocalKeyValuePairsObject:(id)a3;
- (void)removePersonsObject:(id)a3;
- (void)removeRemovedAccessCodesObject:(id)a3;
- (void)removeResidentSelectionsObject:(id)a3;
- (void)removeResidentsObject:(id)a3;
- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4;
- (void)setDidOnboardEventLog:(id)a3;
- (void)synchronizeAccessoriesRelationWith:(id)a3;
- (void)synchronizeActionSetsRelationWith:(id)a3;
- (void)synchronizeInvitationsRelationWith:(id)a3;
- (void)synchronizeRoomsRelationWith:(id)a3;
- (void)synchronizeServiceGroupsRelationWith:(id)a3;
- (void)synchronizeTriggersRelationWith:(id)a3;
- (void)synchronizeUsersRelationWith:(id)a3;
- (void)synchronizeZonesRelationWith:(id)a3;
- (void)willSave;
@end

@implementation _MKFHome

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHome"];
}

- (void)removeGuestsObject:(id)a3
{
}

- (void)addGuestsObject:(id)a3
{
}

- (id)findGuestsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"guests_" modelProtocol:@"MKFGuest" keyValue:a3];
}

- (id)materializeOrCreateGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"guests_" modelProtocol:@"MKFGuest" keyValue:a3 createdNew:a4];
}

- (NSArray)guests
{
  v2 = [(_MKFHome *)self valueForKey:@"guests_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeZonesRelationWith:(id)a3
{
}

- (id)findZonesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"zones_" modelProtocol:@"MKFZone" keyValue:a3];
}

- (id)materializeOrCreateZonesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"zones_" modelProtocol:@"MKFZone" keyValue:a3 createdNew:a4];
}

- (NSArray)zones
{
  v2 = [(_MKFHome *)self valueForKey:@"zones_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeUsersRelationWith:(id)a3
{
}

- (id)findUsersRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"users_" modelProtocol:@"MKFUser" keyValue:a3];
}

- (id)materializeOrCreateUsersRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"users_" modelProtocol:@"MKFUser" keyValue:a3 createdNew:a4];
}

- (NSArray)users
{
  v2 = [(_MKFHome *)self valueForKey:@"users_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeTriggersRelationWith:(id)a3
{
}

- (id)findTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"triggers_" modelProtocol:@"MKFTimerTrigger" keyValue:a3];
}

- (id)createTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"triggers_" modelProtocol:@"MKFTimerTrigger" keyValue:a3];
}

- (id)materializeOrCreateTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"triggers_" modelProtocol:@"MKFTimerTrigger" keyValue:a3 createdNew:a4];
}

- (id)findTriggersRelationOfTypeEventTriggerWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"triggers_" modelProtocol:@"MKFEventTrigger" keyValue:a3];
}

- (id)createTriggersRelationOfTypeEventTriggerWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"triggers_" modelProtocol:@"MKFEventTrigger" keyValue:a3];
}

- (id)materializeOrCreateTriggersRelationOfTypeEventTriggerWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"triggers_" modelProtocol:@"MKFEventTrigger" keyValue:a3 createdNew:a4];
}

- (id)createTriggersRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"triggers_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateTriggersRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"triggers_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)triggers
{
  v2 = [(_MKFHome *)self valueForKey:@"triggers_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateThreadNetworkRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"threadNetwork" modelProtocol:@"MKFHomeThreadNetwork" keyValue:0 createdNew:a3];
}

- (id)findSettingsRelationOfTypeHomeSoftwareUpdateSetting
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeSoftwareUpdateSetting" keyValue:0];
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeSoftwareUpdateSetting:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeSoftwareUpdateSetting" keyValue:0 createdNew:a3];
}

- (id)findSettingsRelationOfTypeHomePersonManagerSetting
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"settings_" modelProtocol:@"MKFHomePersonManagerSetting" keyValue:0];
}

- (id)materializeOrCreateSettingsRelationOfTypeHomePersonManagerSetting:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"settings_" modelProtocol:@"MKFHomePersonManagerSetting" keyValue:0 createdNew:a3];
}

- (id)findSettingsRelationOfTypeHomeNetworkRouterSetting
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeNetworkRouterSetting" keyValue:0];
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeNetworkRouterSetting:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeNetworkRouterSetting" keyValue:0 createdNew:a3];
}

- (id)findSettingsRelationOfTypeHomeNetworkRouterManagingDeviceSetting
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeNetworkRouterManagingDeviceSetting" keyValue:0];
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeNetworkRouterManagingDeviceSetting:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeNetworkRouterManagingDeviceSetting" keyValue:0 createdNew:a3];
}

- (id)findSettingsRelationOfTypeHomeMediaSetting
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeMediaSetting" keyValue:0];
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeMediaSetting:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"settings_" modelProtocol:@"MKFHomeMediaSetting" keyValue:0 createdNew:a3];
}

- (NSArray)settings
{
  v2 = [(_MKFHome *)self valueForKey:@"settings_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeServiceGroupsRelationWith:(id)a3
{
}

- (id)findServiceGroupsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"serviceGroups_" modelProtocol:@"MKFServiceGroup" keyValue:a3];
}

- (id)materializeOrCreateServiceGroupsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"serviceGroups_" modelProtocol:@"MKFServiceGroup" keyValue:a3 createdNew:a4];
}

- (NSArray)serviceGroups
{
  v2 = [(_MKFHome *)self valueForKey:@"serviceGroups_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeRoomsRelationWith:(id)a3
{
}

- (id)findRoomsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"rooms_" modelProtocol:@"MKFRoom" keyValue:a3];
}

- (id)materializeOrCreateRoomsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"rooms_" modelProtocol:@"MKFRoom" keyValue:a3 createdNew:a4];
}

- (NSArray)rooms
{
  v2 = [(_MKFHome *)self valueForKey:@"rooms_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeResidentsObject:(id)a3
{
}

- (void)addResidentsObject:(id)a3
{
}

- (id)findResidentsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"residents_" modelProtocol:@"MKFResident" keyValue:a3];
}

- (id)materializeOrCreateResidentsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"residents_" modelProtocol:@"MKFResident" keyValue:a3 createdNew:a4];
}

- (NSArray)residents
{
  v2 = [(_MKFHome *)self valueForKey:@"residents_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeResidentSelectionsObject:(id)a3
{
}

- (void)addResidentSelectionsObject:(id)a3
{
}

- (id)findResidentSelectionsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"residentSelections_" modelProtocol:@"MKFResidentSelection" keyValue:a3];
}

- (id)materializeOrCreateResidentSelectionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"residentSelections_" modelProtocol:@"MKFResidentSelection" keyValue:a3 createdNew:a4];
}

- (NSArray)residentSelections
{
  v2 = [(_MKFHome *)self valueForKey:@"residentSelections_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeRemovedAccessCodesObject:(id)a3
{
}

- (void)addRemovedAccessCodesObject:(id)a3
{
}

- (id)findRemovedAccessCodesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"removedAccessCodes_" modelProtocol:@"MKFRemovedUserAccessCode" keyValue:a3];
}

- (id)materializeOrCreateRemovedAccessCodesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"removedAccessCodes_" modelProtocol:@"MKFRemovedUserAccessCode" keyValue:a3 createdNew:a4];
}

- (NSArray)removedAccessCodes
{
  v2 = [(_MKFHome *)self valueForKey:@"removedAccessCodes_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removePersonsObject:(id)a3
{
}

- (void)addPersonsObject:(id)a3
{
}

- (id)findPersonsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"persons_" modelProtocol:@"MKFHomePerson" keyValue:a3];
}

- (id)materializeOrCreatePersonsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"persons_" modelProtocol:@"MKFHomePerson" keyValue:a3 createdNew:a4];
}

- (NSArray)persons
{
  v2 = [(_MKFHome *)self valueForKey:@"persons_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateNetworkProtectionGroupsRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"networkProtectionGroups_" modelProtocol:@"MKFAccessoryNetworkProtectionGroup" keyValue:0 createdNew:a3];
}

- (NSArray)networkProtectionGroups
{
  v2 = [(_MKFHome *)self valueForKey:@"networkProtectionGroups_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeMatterControllerLocalKeyValuePairsObject:(id)a3
{
}

- (void)addMatterControllerLocalKeyValuePairsObject:(id)a3
{
}

- (id)findMatterControllerLocalKeyValuePairsRelationWithKey:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"matterControllerLocalKeyValuePairs_" modelProtocol:@"MKFMatterLocalKeyValuePair" keyValue:a3];
}

- (id)materializeOrCreateMatterControllerLocalKeyValuePairsRelationWithKey:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"matterControllerLocalKeyValuePairs_" modelProtocol:@"MKFMatterLocalKeyValuePair" keyValue:a3 createdNew:a4];
}

- (NSArray)matterControllerLocalKeyValuePairs
{
  v2 = [(_MKFHome *)self valueForKey:@"matterControllerLocalKeyValuePairs_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeInvitationsRelationWith:(id)a3
{
}

- (id)findInvitationsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"invitations_" modelProtocol:@"MKFOutgoingInvitation" keyValue:a3];
}

- (id)materializeOrCreateInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"invitations_" modelProtocol:@"MKFOutgoingInvitation" keyValue:a3 createdNew:a4];
}

- (NSArray)invitations
{
  v2 = [(_MKFHome *)self valueForKey:@"invitations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeGuestAccessCodesObject:(id)a3
{
}

- (void)addGuestAccessCodesObject:(id)a3
{
}

- (id)findGuestAccessCodesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"guestAccessCodes_" modelProtocol:@"MKFGuestAccessCode" keyValue:a3];
}

- (id)materializeOrCreateGuestAccessCodesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"guestAccessCodes_" modelProtocol:@"MKFGuestAccessCode" keyValue:a3 createdNew:a4];
}

- (NSArray)guestAccessCodes
{
  v2 = [(_MKFHome *)self valueForKey:@"guestAccessCodes_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"applicationData" modelProtocol:@"MKFApplicationData" keyValue:0 createdNew:a3];
}

- (void)synchronizeActionSetsRelationWith:(id)a3
{
}

- (id)findActionSetsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actionSets_" modelProtocol:@"MKFActionSet" keyValue:a3];
}

- (id)materializeOrCreateActionSetsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actionSets_" modelProtocol:@"MKFActionSet" keyValue:a3 createdNew:a4];
}

- (NSArray)actionSets
{
  v2 = [(_MKFHome *)self valueForKey:@"actionSets_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeAccessoriesRelationWith:(id)a3
{
}

- (id)findAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"accessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)createAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"accessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)materializeOrCreateAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3 createdNew:a4];
}

- (id)findAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"accessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3];
}

- (id)createAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"accessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3];
}

- (id)materializeOrCreateAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3 createdNew:a4];
}

- (id)findAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"accessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3];
}

- (id)createAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"accessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3];
}

- (id)materializeOrCreateAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3 createdNew:a4];
}

- (id)createAccessoriesRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  id v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"accessories_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accessories_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)accessories
{
  v2 = [(_MKFHome *)self valueForKey:@"accessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHomeDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_MKFHome;
  BOOL v5 = -[_MKFModel validateForInsertOrUpdate:](&v11, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    id v6 = [(_MKFHome *)self defaultRoom];

    if (v6)
    {
      v7 = [(_MKFHome *)self owner];

      if (v7)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if (a3)
      {
        id v8 = objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:managedObject:attributeName:", @"owner is required", self, @"owner");
        goto LABEL_9;
      }
    }
    else if (a3)
    {
      id v8 = objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"defaultRoom is required");
LABEL_9:
      id v9 = v8;
      LOBYTE(v5) = 0;
      *a3 = v9;
      return v5;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)residentSyncClientDidSync
{
  v2 = [(_MKFHome *)self residentSyncMetadata];
  v3 = [v2 lastSyncTimestamp];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)accessoryWithModelID:(id)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_MKFAccessory fetchRequest];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"home", self, @"modelID", v6];
  [v8 setPredicate:v9];

  id v18 = 0;
  v10 = [v7 executeFetchRequest:v8 error:&v18];
  id v11 = v18;
  if (v10)
  {
    v12 = [v10 firstObject];
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessories for modelID %@: %@", buf, 0x20u);
    }
    v12 = 0;
  }

  return v12;
}

- (id)homeMembers
{
  v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(_MKFHome *)self users];
  [v3 addObjectsFromArray:v4];

  BOOL v5 = [(_MKFHome *)self guests];
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)[v3 copy];
  return v6;
}

- (id)findHomeMemberWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  id v6 = [(_MKFHome *)self managedObjectContext];
  id v7 = [v5 findHomeMemberWithUUID:v4 context:v6];

  return v7;
}

- (void)setDidOnboardEventLog:(id)a3
{
  id v4 = (id)[a3 copy];
  [(_MKFHome *)self setDidOnboardMemory:v4];
}

- (id)guestAccessCode:(id)a3 withLabel:(id)a4 context:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[_MKFGuestAccessCode fetchRequest];
  v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == %@)", @"accessCode", v8, @"label", v9, @"home", self];
  [v11 setPredicate:v12];

  id v23 = 0;
  v13 = [v10 executeFetchRequest:v11 error:&v23];
  id v14 = v23;
  if (v13)
  {
    v15 = [v13 firstObject];
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      [(_MKFHome *)v17 modelID];
      v20 = id v22 = v16;
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      v29 = v20;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch guestAccessCodes with access code %@ and  %@: %@", buf, 0x2Au);

      v16 = v22;
    }

    v15 = 0;
  }

  return v15;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4E3E20;
}

+ (id)findHomeMemberUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[_MKFUser findUserUsingReverseShareID:v7 homeModelID:v8 context:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[_MKFGuest findGuestUsingReverseShareID:v7 homeModelID:v8 context:v9];
  }
  v13 = v12;

  return v13;
}

+ (id)findHomeMemberWithUUID:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_MKFModel modelWithModelID:v5 context:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[_MKFModel modelWithModelID:v5 context:v6];
  }
  id v10 = v9;

  return v10;
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if ([v5 targetIsResident]) {
    [v11 addCondition:@"resident"];
  }
  id v6 = [v5 targetUser];
  int v7 = [v6 isOwner];

  if (v7) {
    [v11 addCondition:@"owner"];
  }
  id v8 = [v5 targetUser];
  int v9 = [v8 isOwnerOrAdmin];

  if (v9) {
    [v11 addCondition:@"admin"];
  }
  id v10 = [v5 targetDeviceAddress];

  if (v10) {
    [v11 addCondition:@"fetch"];
  }
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (void)willSave
{
  v39[2] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)_MKFHome;
  [(_MKFModel *)&v37 willSave];
  if (([(_MKFHome *)self isUpdated] & 1) != 0 || [(_MKFHome *)self isInserted])
  {
    v3 = [(_MKFHome *)self owned];
    int v4 = [v3 BOOLValue];

    if (v4)
    {
      id v5 = [(_MKFHome *)self managedObjectContext];
      unint64_t v6 = objc_msgSend(v5, "hmd_transactionAuthor");

      if (v6 <= 0xB && ((1 << v6) & 0xC58) != 0)
      {
        int v7 = [(_MKFHome *)self changedValues];
        if ([v7 count])
        {
          id v8 = [v7 objectForKeyedSubscript:@"accessories_"];

          if (v8)
          {
            int v9 = [(_MKFHome *)self accessories];
            uint64_t v10 = [v9 count];

            id v11 = [(_MKFHome *)self numberOfCameras];
            id v12 = v11;
            if (v10)
            {
              uint64_t v32 = v7;
              uint64_t v31 = [v11 unsignedIntValue];

              v13 = +[HMDHAPMetadata getSharedInstance];
              id v14 = (void *)MEMORY[0x263EFFA08];
              uint64_t v15 = *MEMORY[0x263F0B0A8];
              v39[0] = *MEMORY[0x263F0B1B8];
              v39[1] = v15;
              v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
              v17 = [v14 setWithArray:v16];

              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              __int16 v30 = self;
              id v18 = [(_MKFHome *)self accessories];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = 0;
                uint64_t v22 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v34 != v22) {
                      objc_enumerationMutation(v18);
                    }
                    id v24 = [*(id *)(*((void *)&v33 + 1) + 8 * i) accessoryCategory];
                    uint64_t v25 = [v13 categoryForIdentifier:v24];

                    __int16 v26 = [v25 uuidStr];
                    unsigned int v27 = [v17 containsObject:v26];

                    v21 += v27;
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
                }
                while (v20);
              }
              else
              {
                uint64_t v21 = 0;
              }

              if (v21 != v31)
              {
                v29 = [NSNumber numberWithUnsignedInteger:v21];
                [(_MKFHome *)v30 setNumberOfCameras:v29];
              }
              int v7 = v32;
            }
            else
            {
              uint64_t v28 = [v11 isEqualToNumber:&unk_26E473930];

              if ((v28 & 1) == 0) {
                [(_MKFHome *)self setNumberOfCameras:&unk_26E473930];
              }
            }
          }
        }
      }
    }
  }
}

@end