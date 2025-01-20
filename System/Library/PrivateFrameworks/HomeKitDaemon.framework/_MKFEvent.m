@interface _MKFEvent
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFEventDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFEvent

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E490B40;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_135256 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_135256, &__block_literal_global_135257);
  }
  v2 = (void *)homeRelation__hmf_once_v1_135258;
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
  v2 = [(_MKFEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  return 0;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFEvent"];
}

@end