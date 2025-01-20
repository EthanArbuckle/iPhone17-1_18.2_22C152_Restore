@interface _MKFRoom
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFRoomDatabaseID)databaseID;
- (NSArray)accessories;
- (NSArray)zones;
- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3;
@end

@implementation _MKFRoom

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFRoom"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4FE6E0;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_75627 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_75627, &__block_literal_global_75628);
  }
  v2 = (void *)homeRelation__hmf_once_v1_75629;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (NSArray)zones
{
  v2 = [(_MKFRoom *)self valueForKey:@"zones_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"applicationData" modelProtocol:@"MKFApplicationData" keyValue:0 createdNew:a3];
}

- (NSArray)accessories
{
  v2 = [(_MKFRoom *)self valueForKey:@"accessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFRoomDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFRoomDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(_MKFRoom *)self home];
  v6 = [v5 defaultRoom];

  if (v6 == self)
  {
    char v8 = 1;
  }
  else
  {
    v7 = [(_MKFRoom *)self accessories];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75___MKFRoom_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke;
    v10[3] = &unk_264A22C28;
    id v11 = v4;
    char v8 = objc_msgSend(v7, "na_any:", v10);
  }
  return v8;
}

@end