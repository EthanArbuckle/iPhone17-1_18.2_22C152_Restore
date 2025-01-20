@interface _MKFMatterBulletinRegistration
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFMatterBulletinRegistrationDatabaseID)databaseID;
- (NSArray)matterPaths;
- (id)findMatterPathsRelationWithModelID:(id)a3;
- (id)materializeOrCreateMatterPathsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)addMatterPathsObject:(id)a3;
- (void)removeMatterPathsObject:(id)a3;
@end

@implementation _MKFMatterBulletinRegistration

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4FAF98;
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

- (id)findMatterPathsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"matterPaths_" modelProtocol:@"MKFMatterPath" keyValue:a3];
}

- (id)materializeOrCreateMatterPathsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"matterPaths_" modelProtocol:@"MKFMatterPath" keyValue:a3 createdNew:a4];
}

- (NSArray)matterPaths
{
  v2 = [(_MKFMatterBulletinRegistration *)self valueForKey:@"matterPaths_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v3 = [(_MKFMatterBulletinRegistration *)self user];
  id v4 = [v3 home];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(_MKFMatterBulletinRegistration *)self guest];
    id v6 = [v7 home];
  }
  return (MKFHome *)v6;
}

- (MKFMatterBulletinRegistrationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFMatterBulletinRegistrationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFMatterBulletinRegistration"];
}

@end