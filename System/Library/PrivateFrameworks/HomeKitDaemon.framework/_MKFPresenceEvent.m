@interface _MKFPresenceEvent
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)synchronizeGuestsRelationWith:(id)a3;
- (BOOL)synchronizeUsersRelationWith:(id)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFHome)home;
- (MKFPresenceEventDatabaseID)databaseID;
- (NSArray)guests;
- (NSArray)users;
- (void)addGuestsObject:(id)a3;
- (void)addUsersObject:(id)a3;
- (void)removeGuestsObject:(id)a3;
- (void)removeUsersObject:(id)a3;
@end

@implementation _MKFPresenceEvent

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (void)removeGuestsObject:(id)a3
{
}

- (void)addGuestsObject:(id)a3
{
}

- (BOOL)synchronizeGuestsRelationWith:(id)a3
{
  return [(NSManagedObject *)self mkf_synchronizeRelation:@"guests_" items:a3 allowCreation:0];
}

- (NSArray)guests
{
  v2 = [(_MKFPresenceEvent *)self valueForKey:@"guests_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeUsersObject:(id)a3
{
}

- (void)addUsersObject:(id)a3
{
}

- (BOOL)synchronizeUsersRelationWith:(id)a3
{
  return [(NSManagedObject *)self mkf_synchronizeRelation:@"users_" items:a3 allowCreation:0];
}

- (NSArray)users
{
  v2 = [(_MKFPresenceEvent *)self valueForKey:@"users_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFPresenceEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFPresenceEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFPresenceEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_MKFPresenceEvent;
  if (-[_MKFModel validateForInsertOrUpdate:](&v13, sel_validateForInsertOrUpdate_))
  {
    v5 = [(_MKFPresenceEvent *)self presenceType];
    v6 = [(_MKFPresenceEvent *)self activation];
    [v6 unsignedIntegerValue];

    uint64_t v7 = eventTypeForPresenceTypeAndGranularity();
    uint64_t v8 = userTypeForPresenceTypeAndGranularity();
    if (v7 == *MEMORY[0x263F0EA40] || v8 == *MEMORY[0x263F0EA48])
    {
      if (a3)
      {
        v10 = @"Invalid presenceType or activation";
LABEL_13:
        objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", v10);
        BOOL v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        return v11;
      }
    }
    else
    {
      if (v8 != 1)
      {
        BOOL v11 = 1;
        goto LABEL_16;
      }
      if (a3)
      {
        v10 = @"HMPresenceEventUserTypeCurrentUser must be resolved to a user list";
        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
    goto LABEL_16;
  }
  return 0;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4FB150;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_71638 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_71638, &__block_literal_global_71639);
  }
  v2 = (void *)homeRelation__hmf_once_v1_71640;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFPresenceEvent"];
}

@end