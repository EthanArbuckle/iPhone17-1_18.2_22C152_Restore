@interface _MKFAirPlayAccessory
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFAirPlayAccessoryDatabaseID)databaseID;
- (NSArray)pairedUsers;
- (void)addPairedUsersObject:(id)a3;
- (void)removePairedUsersObject:(id)a3;
@end

@implementation _MKFAirPlayAccessory

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4F8538;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_68678 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_68678, &__block_literal_global_68679);
  }
  v2 = (void *)homeRelation__hmf_once_v1_68680;
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

- (void)removePairedUsersObject:(id)a3
{
}

- (void)addPairedUsersObject:(id)a3
{
}

- (NSArray)pairedUsers
{
  v2 = [(_MKFAirPlayAccessory *)self valueForKey:@"pairedUsers_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFAirPlayAccessoryDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFAirPlayAccessoryDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFAirPlayAccessory"];
}

@end