@interface _MKFGuestAccessCode
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFGuestAccessCodeDatabaseID)databaseID;
@end

@implementation _MKFGuestAccessCode

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4FE568;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_75119 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_75119, &__block_literal_global_75120);
  }
  v2 = (void *)homeRelation__hmf_once_v1_75121;
  return (NSPredicate *)v2;
}

- (MKFGuestAccessCodeDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFGuestAccessCodeDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFGuestAccessCode"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end