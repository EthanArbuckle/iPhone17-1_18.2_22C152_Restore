@interface _MKFActionSet
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFActionSetDatabaseID)databaseID;
- (NSArray)actions;
- (NSArray)notificationRegistrations;
- (NSArray)triggers;
- (id)createActionsRelationOfType:(id)a3 modelID:(id)a4;
- (id)createActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3;
- (id)createActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3;
- (id)createActionsRelationOfTypeMatterCommandActionWithModelID:(id)a3;
- (id)createActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3;
- (id)createActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3;
- (id)createActionsRelationOfTypeShortcutActionWithModelID:(id)a3;
- (id)findActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3;
- (id)findActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3;
- (id)findActionsRelationOfTypeMatterCommandActionWithModelID:(id)a3;
- (id)findActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3;
- (id)findActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3;
- (id)findActionsRelationOfTypeShortcutActionWithModelID:(id)a3;
- (id)materializeOrCreateActionsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateActionsRelationOfTypeMatterCommandActionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateActionsRelationOfTypeShortcutActionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3;
- (void)synchronizeActionsRelationWith:(id)a3;
@end

@implementation _MKFActionSet

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  return 0;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFActionSet"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E57F750;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_203440 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_203440, &__block_literal_global_203441);
  }
  v2 = (void *)homeRelation__hmf_once_v1_203442;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSArray)triggers
{
  v2 = [(_MKFActionSet *)self valueForKey:@"triggers_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)notificationRegistrations
{
  v2 = [(_MKFActionSet *)self valueForKey:@"notificationRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"applicationData" modelProtocol:@"MKFApplicationData" keyValue:0 createdNew:a3];
}

- (void)synchronizeActionsRelationWith:(id)a3
{
}

- (id)findActionsRelationOfTypeShortcutActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actions_" modelProtocol:@"MKFShortcutAction" keyValue:a3];
}

- (id)createActionsRelationOfTypeShortcutActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:@"MKFShortcutAction" keyValue:a3];
}

- (id)materializeOrCreateActionsRelationOfTypeShortcutActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:@"MKFShortcutAction" keyValue:a3 createdNew:a4];
}

- (id)findActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actions_" modelProtocol:@"MKFNaturalLightingAction" keyValue:a3];
}

- (id)createActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:@"MKFNaturalLightingAction" keyValue:a3];
}

- (id)materializeOrCreateActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:@"MKFNaturalLightingAction" keyValue:a3 createdNew:a4];
}

- (id)findActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actions_" modelProtocol:@"MKFMediaPlaybackAction" keyValue:a3];
}

- (id)createActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:@"MKFMediaPlaybackAction" keyValue:a3];
}

- (id)materializeOrCreateActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:@"MKFMediaPlaybackAction" keyValue:a3 createdNew:a4];
}

- (id)findActionsRelationOfTypeMatterCommandActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actions_" modelProtocol:@"MKFMatterCommandAction" keyValue:a3];
}

- (id)createActionsRelationOfTypeMatterCommandActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:@"MKFMatterCommandAction" keyValue:a3];
}

- (id)materializeOrCreateActionsRelationOfTypeMatterCommandActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:@"MKFMatterCommandAction" keyValue:a3 createdNew:a4];
}

- (id)findActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actions_" modelProtocol:@"MKFCharacteristicWriteAction" keyValue:a3];
}

- (id)createActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:@"MKFCharacteristicWriteAction" keyValue:a3];
}

- (id)materializeOrCreateActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:@"MKFCharacteristicWriteAction" keyValue:a3 createdNew:a4];
}

- (id)findActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"actions_" modelProtocol:@"MKFAppleMediaAccessoryPowerAction" keyValue:a3];
}

- (id)createActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:@"MKFAppleMediaAccessoryPowerAction" keyValue:a3];
}

- (id)materializeOrCreateActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:@"MKFAppleMediaAccessoryPowerAction" keyValue:a3 createdNew:a4];
}

- (id)createActionsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"actions_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateActionsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  id v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"actions_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)actions
{
  v2 = [(_MKFActionSet *)self valueForKey:@"actions_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFActionSetDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFActionSetDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end