@interface _MKFTrigger
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFTriggerDatabaseID)databaseID;
- (NSArray)actionSets;
- (void)addActionSetsObject:(id)a3;
- (void)removeActionSetsObject:(id)a3;
- (void)setActionSets:(id)a3;
@end

@implementation _MKFTrigger

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E53A660;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_213922 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_213922, &__block_literal_global_213923);
  }
  v2 = (void *)homeRelation__hmf_once_v1_213924;
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

- (void)removeActionSetsObject:(id)a3
{
}

- (void)addActionSetsObject:(id)a3
{
}

- (void)setActionSets:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(_MKFTrigger *)self setValue:v4 forKey:@"actionSets_"];
  }
  else
  {
    -[_MKFTrigger setValue:forKey:](self, "setValue:forKey:");
  }
}

- (NSArray)actionSets
{
  v2 = [(_MKFTrigger *)self valueForKey:@"actionSets_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFTriggerDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFTriggerDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFTrigger"];
}

@end