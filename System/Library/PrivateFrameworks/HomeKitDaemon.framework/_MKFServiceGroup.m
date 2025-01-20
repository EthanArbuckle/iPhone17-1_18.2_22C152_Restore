@interface _MKFServiceGroup
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFServiceGroupDatabaseID)databaseID;
- (NSArray)services;
- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3;
- (void)addServicesObject:(id)a3;
- (void)removeServicesObject:(id)a3;
@end

@implementation _MKFServiceGroup

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E481130;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0, &__block_literal_global_905);
  }
  v2 = (void *)homeRelation__hmf_once_v1;
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

- (void)removeServicesObject:(id)a3
{
}

- (void)addServicesObject:(id)a3
{
}

- (NSArray)services
{
  v2 = [(_MKFServiceGroup *)self valueForKey:@"services_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"applicationData" modelProtocol:@"MKFApplicationData" keyValue:0 createdNew:a3];
}

- (MKFServiceGroupDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFServiceGroupDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  return 0;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFServiceGroup"];
}

@end