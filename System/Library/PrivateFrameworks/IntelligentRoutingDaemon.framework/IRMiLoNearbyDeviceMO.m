@interface IRMiLoNearbyDeviceMO
+ (id)fetchRequest;
+ (id)miLoNearbyDeviceMOWithMiLoNearbyDeviceDO:(id)a3 miloPrediction:(id)a4 inManagedObjectContext:(id)a5;
+ (void)setPropertiesOfMiLoNearbyDeviceMO:(id)a3 withIRMiLoNearbyDeviceDO:(id)a4;
- (id)convert;
@end

@implementation IRMiLoNearbyDeviceMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRMiLoNearbyDeviceMO"];
}

+ (id)miLoNearbyDeviceMOWithMiLoNearbyDeviceDO:(id)a3 miloPrediction:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRMiLoNearbyDeviceMO alloc] initWithContext:v7];

  [(IRMiLoNearbyDeviceMO *)v10 setPrediction:v8];
  +[IRMiLoNearbyDeviceMO setPropertiesOfMiLoNearbyDeviceMO:v10 withIRMiLoNearbyDeviceDO:v9];

  return v10;
}

+ (void)setPropertiesOfMiLoNearbyDeviceMO:(id)a3 withIRMiLoNearbyDeviceDO:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v6, "setHasBleRssi:", objc_msgSend(v5, "hasBleRssi"));
  id v7 = [v5 deviceIdentifier];

  [v6 setDeviceIdentifier:v7];
}

- (id)convert
{
  v3 = [IRMiLoNearbyDeviceDO alloc];
  uint64_t v4 = [(IRMiLoNearbyDeviceMO *)self hasBleRssi];
  id v5 = [(IRMiLoNearbyDeviceMO *)self deviceIdentifier];
  id v6 = [(IRMiLoNearbyDeviceDO *)v3 initWithHasBleRssi:v4 deviceIdentifier:v5];

  return v6;
}

@end