@interface _MKFHomeNetworkRouterSetting
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomeNetworkRouterSettingDatabaseID)databaseID;
@end

@implementation _MKFHomeNetworkRouterSetting

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E50CC30;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFHomeNetworkRouterSettingDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeNetworkRouterSettingDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeNetworkRouterSetting"];
}

@end