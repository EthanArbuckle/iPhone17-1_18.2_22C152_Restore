@interface _MKFResident
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFResidentDatabaseID)databaseID;
@end

@implementation _MKFResident

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E518D18;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_99291 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_99291, &__block_literal_global_99292);
  }
  v2 = (void *)homeRelation__hmf_once_v1_99293;
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

- (MKFResidentDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFResidentDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFResident"];
}

@end