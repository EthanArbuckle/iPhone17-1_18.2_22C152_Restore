@interface IRNearbyDeviceMO
+ (id)fetchRequest;
+ (id)nearbyDeviceMOWithNearbyDeviceDO:(id)a3 nearbyDeviceContainer:(id)a4 inManagedObjectContext:(id)a5;
+ (void)setPropertiesOfnearbyDeviceMO:(id)a3 withNearbyDeviceDO:(id)a4;
- (id)convert;
@end

@implementation IRNearbyDeviceMO

+ (id)nearbyDeviceMOWithNearbyDeviceDO:(id)a3 nearbyDeviceContainer:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRNearbyDeviceMO alloc] initWithContext:v7];

  [(IRNearbyDeviceMO *)v10 setNearbyDeviceContainer:v8];
  +[IRNearbyDeviceMO setPropertiesOfnearbyDeviceMO:v10 withNearbyDeviceDO:v9];

  return v10;
}

+ (void)setPropertiesOfnearbyDeviceMO:(id)a3 withNearbyDeviceDO:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 range];
  objc_msgSend(v6, "setRange:");
  id v7 = [v5 idsIdentifier];
  [v6 setIdsIdentifier:v7];

  id v8 = [v5 measurementDate];
  [v6 setMeasurementDate:v8];

  id v9 = [v5 mediaRemoteIdentifier];
  [v6 setMediaRemoteIdentifier:v9];

  id v10 = [v5 proximityType];

  [v6 setProximityType:v10];
}

- (id)convert
{
  v3 = [IRNearbyDeviceDO alloc];
  [(IRNearbyDeviceMO *)self range];
  double v5 = v4;
  id v6 = [(IRNearbyDeviceMO *)self idsIdentifier];
  id v7 = [(IRNearbyDeviceMO *)self mediaRemoteIdentifier];
  id v8 = [(IRNearbyDeviceMO *)self proximityType];
  id v9 = [(IRNearbyDeviceMO *)self measurementDate];
  id v10 = [(IRNearbyDeviceDO *)v3 initWithRange:v6 idsIdentifier:v7 mediaRemoteIdentifier:v8 proximityType:v9 measurementDate:v5];

  return v10;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRNearbyDeviceMO"];
}

@end