@interface _MKFSoftwareUpdate
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFSoftwareUpdateDatabaseID)databaseID;
@end

@implementation _MKFSoftwareUpdate

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFSoftwareUpdate"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E54B228;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_141609 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_141609, &__block_literal_global_141610);
  }
  v2 = (void *)homeRelation__hmf_once_v1_141611;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFHome)home
{
  v2 = [(_MKFSoftwareUpdate *)self accessory];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFSoftwareUpdateDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFSoftwareUpdateDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end