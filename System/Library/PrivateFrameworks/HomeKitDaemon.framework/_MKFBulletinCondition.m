@interface _MKFBulletinCondition
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFBulletinConditionDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFBulletinCondition

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4DA748;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_115202 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_115202, &__block_literal_global_115203);
  }
  v2 = (void *)homeRelation__hmf_once_v1_115204;
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
  v2 = [(_MKFBulletinCondition *)self bulletinRegistration];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFBulletinConditionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFBulletinConditionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFBulletinCondition"];
}

@end