@interface _MKFMediaAccessory
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFMediaAccessoryDatabaseID)databaseID;
@end

@implementation _MKFMediaAccessory

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4F82E0;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFMediaAccessoryDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFMediaAccessoryDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFMediaAccessory"];
}

@end