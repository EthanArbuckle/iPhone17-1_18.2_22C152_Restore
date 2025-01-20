@interface _MKFAccount
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFAccountDatabaseID)databaseID;
- (NSArray)devices;
- (NSArray)handles;
- (id)findDevicesRelationWithModelID:(id)a3;
- (id)findHandlesRelationWithModelID:(id)a3;
- (id)materializeOrCreateDevicesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateHandlesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)synchronizeDevicesRelationWith:(id)a3;
- (void)synchronizeHandlesRelationWith:(id)a3;
@end

@implementation _MKFAccount

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4870D8;
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

- (void)synchronizeHandlesRelationWith:(id)a3
{
}

- (id)findHandlesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"handles_" modelProtocol:@"MKFAccountHandle" keyValue:a3];
}

- (id)materializeOrCreateHandlesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"handles_" modelProtocol:@"MKFAccountHandle" keyValue:a3 createdNew:a4];
}

- (NSArray)handles
{
  v2 = [(_MKFAccount *)self valueForKey:@"handles_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeDevicesRelationWith:(id)a3
{
}

- (id)findDevicesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"devices_" modelProtocol:@"MKFDevice" keyValue:a3];
}

- (id)materializeOrCreateDevicesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"devices_" modelProtocol:@"MKFDevice" keyValue:a3 createdNew:a4];
}

- (NSArray)devices
{
  v2 = [(_MKFAccount *)self valueForKey:@"devices_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFAccountDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFAccountDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFAccount"];
}

@end