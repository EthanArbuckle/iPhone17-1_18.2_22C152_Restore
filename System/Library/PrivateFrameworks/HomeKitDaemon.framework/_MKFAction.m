@interface _MKFAction
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFActionDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFAction

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E48BCD0;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_103762 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_103762, &__block_literal_global_103763);
  }
  v2 = (void *)homeRelation__hmf_once_v1_103764;
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
  v2 = [(_MKFAction *)self actionSet];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFActionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFActionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFAction"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end