@interface _MKFHomeSoftwareUpdateSetting
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomeSoftwareUpdateSettingDatabaseID)databaseID;
@end

@implementation _MKFHomeSoftwareUpdateSetting

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeSoftwareUpdateSetting"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5C19F8;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFHomeSoftwareUpdateSettingDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeSoftwareUpdateSettingDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end