@interface _MKFZone
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFZoneDatabaseID)databaseID;
- (NSArray)rooms;
- (void)addRoomsObject:(id)a3;
- (void)removeRoomsObject:(id)a3;
@end

@implementation _MKFZone

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(_MKFZone *)self rooms];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75___MKFZone_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke;
  v9[3] = &unk_264A22C50;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5726F0;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_189325 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_189325, &__block_literal_global_189326);
  }
  v2 = (void *)homeRelation__hmf_once_v1_189327;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  char v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)removeRoomsObject:(id)a3
{
}

- (void)addRoomsObject:(id)a3
{
}

- (NSArray)rooms
{
  v2 = [(_MKFZone *)self valueForKey:@"rooms_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFZoneDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFZoneDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFZone"];
}

@end