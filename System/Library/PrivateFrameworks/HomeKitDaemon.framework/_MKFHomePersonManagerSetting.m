@interface _MKFHomePersonManagerSetting
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomePersonManagerSettingDatabaseID)databaseID;
@end

@implementation _MKFHomePersonManagerSetting

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E492C60;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFHomePersonManagerSettingDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomePersonManagerSettingDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomePersonManagerSetting"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end