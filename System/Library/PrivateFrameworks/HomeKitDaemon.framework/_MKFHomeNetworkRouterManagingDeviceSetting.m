@interface _MKFHomeNetworkRouterManagingDeviceSetting
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomeNetworkRouterManagingDeviceSettingDatabaseID)databaseID;
@end

@implementation _MKFHomeNetworkRouterManagingDeviceSetting

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4F5FD8;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

- (MKFHomeNetworkRouterManagingDeviceSettingDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeNetworkRouterManagingDeviceSettingDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeNetworkRouterManagingDeviceSetting"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end