@interface _MKFUserAccessCode
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFHome)home;
- (MKFUserAccessCodeDatabaseID)databaseID;
- (NSUUID)hmd_parentModelID;
@end

@implementation _MKFUserAccessCode

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E51E090;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_102889 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_102889, &__block_literal_global_102890);
  }
  v2 = (void *)homeRelation__hmf_once_v1_102891;
  return (NSPredicate *)v2;
}

- (MKFHome)home
{
  v2 = [(_MKFUserAccessCode *)self user];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFUserAccessCodeDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFUserAccessCodeDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (NSUUID)hmd_parentModelID
{
  uint64_t v3 = objc_opt_class();
  if (HMDManagedObjectClassIsBSORepresentable(v3))
  {
    v4 = [(NSManagedObject *)self hmd_lastKnownValueForKey:@"user"];
    if (v4
      || ([(NSManagedObject *)self hmd_lastKnownValueForKey:@"guest"],
          (v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = objc_msgSend(v4, "hmd_modelID");
    }
    else
    {
      v5 = 0;
    }
    return (NSUUID *)v5;
  }
  else
  {
    v7 = (HMDUserAccessCodeModel *)_HMFPreconditionFailure();
    [(HMDUserAccessCodeModel *)v7 cd_populateParentRelationshipInContext:v9 error:v10];
  }
  return result;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFUserAccessCode"];
}

@end