@interface _MKFAccessory
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)hasRGCapableService;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFAccessoryDatabaseID)databaseID;
- (NSArray)actionMediaPlaybacks;
- (NSArray)allowedGuests;
- (NSArray)analysisEventBulletinRegistrations;
- (NSArray)cameraAccessModeBulletinRegistrations;
- (NSArray)cameraReachabilityBulletinRegistrations;
- (NSArray)cameraSignificantEventBulletinRegistrations;
- (NSArray)hostedAccessories;
- (NSArray)mediaPropertyNotificationRegistrations;
- (NSArray)outgoingInvitations;
- (NSArray)usersWithListeningHistoryEnabled;
- (NSArray)usersWithMediaContentProfileEnabled;
- (NSArray)usersWithPersonalRequestsEnabled;
- (id)findAllowedGuestsRelationWithModelID:(id)a3;
- (id)findOutgoingInvitationsRelationWithModelID:(id)a3;
- (id)materializeOrCreateAllowedGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3;
- (id)materializeOrCreateOutgoingInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateSoftwareUpdateRelation:(BOOL *)a3;
- (void)addAllowedGuestsObject:(id)a3;
- (void)addHostedAccessoriesObject:(id)a3;
- (void)addOutgoingInvitationsObject:(id)a3;
- (void)addUsersWithListeningHistoryEnabledObject:(id)a3;
- (void)addUsersWithMediaContentProfileEnabledObject:(id)a3;
- (void)addUsersWithPersonalRequestsEnabledObject:(id)a3;
- (void)removeAllowedGuestsObject:(id)a3;
- (void)removeHostedAccessoriesObject:(id)a3;
- (void)removeOutgoingInvitationsObject:(id)a3;
- (void)removeUsersWithListeningHistoryEnabledObject:(id)a3;
- (void)removeUsersWithMediaContentProfileEnabledObject:(id)a3;
- (void)removeUsersWithPersonalRequestsEnabledObject:(id)a3;
@end

@implementation _MKFAccessory

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4BCF88;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_21500 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_21500, &__block_literal_global_21501);
  }
  v2 = (void *)homeRelation__hmf_once_v1_21502;
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

- (void)removeOutgoingInvitationsObject:(id)a3
{
}

- (void)addOutgoingInvitationsObject:(id)a3
{
}

- (id)findOutgoingInvitationsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"outgoingInvitations_" modelProtocol:@"MKFOutgoingInvitation" keyValue:a3];
}

- (id)materializeOrCreateOutgoingInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"outgoingInvitations_" modelProtocol:@"MKFOutgoingInvitation" keyValue:a3 createdNew:a4];
}

- (NSArray)outgoingInvitations
{
  v2 = [(_MKFAccessory *)self valueForKey:@"outgoingInvitations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeAllowedGuestsObject:(id)a3
{
}

- (void)addAllowedGuestsObject:(id)a3
{
}

- (id)findAllowedGuestsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedGuests_" modelProtocol:@"MKFGuest" keyValue:a3];
}

- (id)materializeOrCreateAllowedGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedGuests_" modelProtocol:@"MKFGuest" keyValue:a3 createdNew:a4];
}

- (NSArray)allowedGuests
{
  v2 = [(_MKFAccessory *)self valueForKey:@"allowedGuests_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeUsersWithPersonalRequestsEnabledObject:(id)a3
{
}

- (void)addUsersWithPersonalRequestsEnabledObject:(id)a3
{
}

- (NSArray)usersWithPersonalRequestsEnabled
{
  v2 = [(_MKFAccessory *)self valueForKey:@"usersWithPersonalRequestsEnabled_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeUsersWithMediaContentProfileEnabledObject:(id)a3
{
}

- (void)addUsersWithMediaContentProfileEnabledObject:(id)a3
{
}

- (NSArray)usersWithMediaContentProfileEnabled
{
  v2 = [(_MKFAccessory *)self valueForKey:@"usersWithMediaContentProfileEnabled_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeUsersWithListeningHistoryEnabledObject:(id)a3
{
}

- (void)addUsersWithListeningHistoryEnabledObject:(id)a3
{
}

- (NSArray)usersWithListeningHistoryEnabled
{
  v2 = [(_MKFAccessory *)self valueForKey:@"usersWithListeningHistoryEnabled_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateSoftwareUpdateRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"softwareUpdate" modelProtocol:@"MKFSoftwareUpdate" keyValue:0 createdNew:a3];
}

- (NSArray)mediaPropertyNotificationRegistrations
{
  v2 = [(_MKFAccessory *)self valueForKey:@"mediaPropertyNotificationRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeHostedAccessoriesObject:(id)a3
{
}

- (void)addHostedAccessoriesObject:(id)a3
{
}

- (NSArray)hostedAccessories
{
  v2 = [(_MKFAccessory *)self valueForKey:@"hostedAccessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)cameraSignificantEventBulletinRegistrations
{
  v2 = [(_MKFAccessory *)self valueForKey:@"cameraSignificantEventBulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)cameraReachabilityBulletinRegistrations
{
  v2 = [(_MKFAccessory *)self valueForKey:@"cameraReachabilityBulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)cameraAccessModeBulletinRegistrations
{
  v2 = [(_MKFAccessory *)self valueForKey:@"cameraAccessModeBulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"applicationData" modelProtocol:@"MKFApplicationData" keyValue:0 createdNew:a3];
}

- (NSArray)analysisEventBulletinRegistrations
{
  v2 = [(_MKFAccessory *)self valueForKey:@"analysisEventBulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)actionMediaPlaybacks
{
  v2 = [(_MKFAccessory *)self valueForKey:@"actionMediaPlaybacks_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFAccessoryDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFAccessoryDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)hasRGCapableService
{
  return 0;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFAccessory"];
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4 = a3;
  if ([(_MKFAccessory *)self hasRGCapableService])
  {
    v5 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = v6;

    if (v7)
    {
      v8 = [v4 targetUser];
      v9 = [v8 allowedAccessories];
      char v10 = [v9 containsObject:v7];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end