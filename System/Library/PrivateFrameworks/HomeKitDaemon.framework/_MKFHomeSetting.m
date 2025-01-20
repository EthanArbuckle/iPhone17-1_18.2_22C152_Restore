@interface _MKFHomeSetting
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomeSettingDatabaseID)databaseID;
@end

@implementation _MKFHomeSetting

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E492B20;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_57289 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_57289, &__block_literal_global_57290);
  }
  v2 = (void *)homeRelation__hmf_once_v1_57291;
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

- (MKFHomeSettingDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeSettingDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeSetting"];
}

@end