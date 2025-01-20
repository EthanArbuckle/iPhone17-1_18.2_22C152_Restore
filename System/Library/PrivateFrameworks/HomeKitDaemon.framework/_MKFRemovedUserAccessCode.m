@interface _MKFRemovedUserAccessCode
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFRemovedUserAccessCodeDatabaseID)databaseID;
@end

@implementation _MKFRemovedUserAccessCode

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFRemovedUserAccessCode"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5BC310;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_248215 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_248215, &__block_literal_global_248216);
  }
  v2 = (void *)homeRelation__hmf_once_v1_248217;
  return (NSPredicate *)v2;
}

- (MKFRemovedUserAccessCodeDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFRemovedUserAccessCodeDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end