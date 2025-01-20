@interface _MKFHomeMediaSetting
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomeMediaSettingDatabaseID)databaseID;
@end

@implementation _MKFHomeMediaSetting

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeMediaSetting"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E582BC8;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFHomeMediaSettingDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeMediaSettingDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end