@interface _MKFAccessoryNetworkProtectionGroup
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFAccessoryNetworkProtectionGroupDatabaseID)databaseID;
@end

@implementation _MKFAccessoryNetworkProtectionGroup

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFAccessoryNetworkProtectionGroup"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E572EF8;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_190628 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_190628, &__block_literal_global_190629);
  }
  v2 = (void *)homeRelation__hmf_once_v1_190630;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFAccessoryNetworkProtectionGroupDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFAccessoryNetworkProtectionGroupDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end