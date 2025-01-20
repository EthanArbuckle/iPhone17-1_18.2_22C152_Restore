@interface _MKFMatterCommandAction
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFMatterCommandActionDatabaseID)databaseID;
- (NSArray)matterPaths;
- (void)addMatterPathsObject:(id)a3;
- (void)removeMatterPathsObject:(id)a3;
@end

@implementation _MKFMatterCommandAction

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFMatterCommandAction"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5C3A50;
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

- (void)removeMatterPathsObject:(id)a3
{
}

- (void)addMatterPathsObject:(id)a3
{
}

- (NSArray)matterPaths
{
  v2 = [(_MKFMatterCommandAction *)self valueForKey:@"matterPaths_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFMatterCommandAction *)self actionSet];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFMatterCommandActionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFMatterCommandActionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end