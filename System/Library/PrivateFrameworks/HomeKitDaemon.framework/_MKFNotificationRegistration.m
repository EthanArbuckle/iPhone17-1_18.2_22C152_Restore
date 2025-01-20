@interface _MKFNotificationRegistration
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFNotificationRegistrationDatabaseID)databaseID;
@end

@implementation _MKFNotificationRegistration

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFNotificationRegistration"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E571E98;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_188133 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_188133, &__block_literal_global_188134);
  }
  v2 = (void *)homeRelation__hmf_once_v1_188135;
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

- (MKFHome)home
{
  v2 = [(_MKFNotificationRegistration *)self user];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFNotificationRegistrationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFNotificationRegistrationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end