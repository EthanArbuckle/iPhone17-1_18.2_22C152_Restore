@interface _MKFPresenceBulletinCondition
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFPresenceBulletinConditionDatabaseID)databaseID;
- (NSArray)guests;
- (NSArray)users;
- (id)findGuestsRelationWithModelID:(id)a3;
- (id)findUsersRelationWithModelID:(id)a3;
- (id)materializeOrCreateGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateUsersRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)addGuestsObject:(id)a3;
- (void)addUsersObject:(id)a3;
- (void)removeGuestsObject:(id)a3;
- (void)removeUsersObject:(id)a3;
@end

@implementation _MKFPresenceBulletinCondition

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFPresenceBulletinCondition"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4DE2F0;
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

- (void)removeGuestsObject:(id)a3
{
}

- (void)addGuestsObject:(id)a3
{
}

- (id)findGuestsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"guests_" modelProtocol:@"MKFGuest" keyValue:a3];
}

- (id)materializeOrCreateGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"guests_" modelProtocol:@"MKFGuest" keyValue:a3 createdNew:a4];
}

- (NSArray)guests
{
  v2 = [(_MKFPresenceBulletinCondition *)self valueForKey:@"guests_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeUsersObject:(id)a3
{
}

- (void)addUsersObject:(id)a3
{
}

- (id)findUsersRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"users_" modelProtocol:@"MKFUser" keyValue:a3];
}

- (id)materializeOrCreateUsersRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"users_" modelProtocol:@"MKFUser" keyValue:a3 createdNew:a4];
}

- (NSArray)users
{
  v2 = [(_MKFPresenceBulletinCondition *)self valueForKey:@"users_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFPresenceBulletinCondition *)self bulletinRegistration];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFPresenceBulletinConditionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFPresenceBulletinConditionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end