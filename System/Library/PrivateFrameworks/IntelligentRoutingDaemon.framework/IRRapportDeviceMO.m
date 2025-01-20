@interface IRRapportDeviceMO
+ (id)aVOutputDeviceMOFromRapportDeviceDO:(id)a3 inNode:(id)a4 withManagedObjectContext:(id)a5;
+ (id)fetchRequest;
+ (void)setPropertiesOfRapportDeviceMO:(id)a3 withRapportDO:(id)a4;
- (id)convert;
@end

@implementation IRRapportDeviceMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRRapportDeviceMO"];
}

+ (id)aVOutputDeviceMOFromRapportDeviceDO:(id)a3 inNode:(id)a4 withManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRRapportDeviceMO alloc] initWithContext:v7];

  [(IRRapportDeviceMO *)v10 setNode:v8];
  +[IRRapportDeviceMO setPropertiesOfRapportDeviceMO:v10 withRapportDO:v9];

  return v10;
}

+ (void)setPropertiesOfRapportDeviceMO:(id)a3 withRapportDO:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 rapportEffectiveID];
  [v6 setRapportEffectiveID:v7];

  id v8 = [v5 idsID];
  [v6 setIdsID:v8];

  id v9 = [v5 name];
  [v6 setName:v9];

  v10 = [v5 deviceModel];
  [v6 setDeviceModel:v10];

  v11 = [v5 mediaRemoteIdentifier];
  [v6 setMediaRemoteIdentifier:v11];

  v12 = [v5 iCloudId];
  [v6 setICloudId:v12];

  id v13 = [v5 mediaRouteIdentifier];

  [v6 setMediaRouteIdentifier:v13];
}

- (id)convert
{
  v3 = [IRRapportDeviceDO alloc];
  v4 = [(IRRapportDeviceMO *)self rapportEffectiveID];
  id v5 = [(IRRapportDeviceMO *)self idsID];
  id v6 = [(IRRapportDeviceMO *)self name];
  id v7 = [(IRRapportDeviceMO *)self deviceModel];
  id v8 = [(IRRapportDeviceMO *)self mediaRemoteIdentifier];
  id v9 = [(IRRapportDeviceMO *)self iCloudId];
  v10 = [(IRRapportDeviceMO *)self mediaRouteIdentifier];
  v11 = [(IRRapportDeviceDO *)v3 initWithRapportEffectiveID:v4 idsID:v5 name:v6 deviceModel:v7 mediaRemoteIdentifier:v8 iCloudId:v9 mediaRouteIdentifier:v10];

  return v11;
}

@end