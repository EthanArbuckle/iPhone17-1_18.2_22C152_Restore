@interface _MKFDevice
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFDeviceDatabaseID)databaseID;
@end

@implementation _MKFDevice

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4F5978;
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

- (MKFDeviceDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFDeviceDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFDevice"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end