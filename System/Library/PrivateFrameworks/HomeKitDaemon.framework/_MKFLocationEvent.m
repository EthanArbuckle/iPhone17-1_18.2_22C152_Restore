@interface _MKFLocationEvent
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)synchronizeUserRelationWith:(id)a3;
- (MKFHome)home;
- (MKFLocationEventDatabaseID)databaseID;
- (void)addUserObject:(id)a3;
- (void)removeUserObject:(id)a3;
@end

@implementation _MKFLocationEvent

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4E42A0;
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

- (void)removeUserObject:(id)a3
{
}

- (void)addUserObject:(id)a3
{
}

- (BOOL)synchronizeUserRelationWith:(id)a3
{
  return [(NSManagedObject *)self mkf_synchronizeRelation:@"user" items:a3 allowCreation:0];
}

- (MKFHome)home
{
  v2 = [(_MKFLocationEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFLocationEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFLocationEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFLocationEvent"];
}

@end