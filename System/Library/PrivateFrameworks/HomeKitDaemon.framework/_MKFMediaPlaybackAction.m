@interface _MKFMediaPlaybackAction
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFMediaPlaybackActionDatabaseID)databaseID;
- (NSArray)accessories;
- (void)addAccessoriesObject:(id)a3;
- (void)removeAccessoriesObject:(id)a3;
@end

@implementation _MKFMediaPlaybackAction

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4C19D0;
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

- (void)removeAccessoriesObject:(id)a3
{
}

- (void)addAccessoriesObject:(id)a3
{
}

- (NSArray)accessories
{
  v2 = [(_MKFMediaPlaybackAction *)self valueForKey:@"accessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFMediaPlaybackAction *)self actionSet];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFMediaPlaybackActionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFMediaPlaybackActionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFMediaPlaybackAction"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end