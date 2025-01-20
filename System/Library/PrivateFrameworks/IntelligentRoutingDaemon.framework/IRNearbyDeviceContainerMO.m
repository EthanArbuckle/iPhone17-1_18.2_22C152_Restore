@interface IRNearbyDeviceContainerMO
+ (IRNearbyDeviceContainerMO)nearbyDeviceContainerMOWithNearbyDeviceContainerDO:(id)a3 replayEvent:(id)a4 inManagedObjectContext:(id)a5;
+ (id)fetchRequest;
+ (void)setPropertiesOfNearbyDeviceContainerMO:(id)a3 withNearbyDeviceContainerDO:(id)a4 inManagedObjectContext:(id)a5;
- (id)convert;
@end

@implementation IRNearbyDeviceContainerMO

+ (IRNearbyDeviceContainerMO)nearbyDeviceContainerMOWithNearbyDeviceContainerDO:(id)a3 replayEvent:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRNearbyDeviceContainerMO alloc] initWithContext:v7];
  [(IRNearbyDeviceContainerMO *)v10 setReplayEvent:v8];

  +[IRNearbyDeviceContainerMO setPropertiesOfNearbyDeviceContainerMO:v10 withNearbyDeviceContainerDO:v9 inManagedObjectContext:v7];

  return v10;
}

+ (void)setPropertiesOfNearbyDeviceContainerMO:(id)a3 withNearbyDeviceContainerDO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 nearbyDevices];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __127__IRNearbyDeviceContainerMO_Access__setPropertiesOfNearbyDeviceContainerMO_withNearbyDeviceContainerDO_inManagedObjectContext___block_invoke;
  v17 = &unk_2653A0E38;
  id v18 = v7;
  id v19 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 enumerateObjectsUsingBlock:&v14];

  v13 = objc_msgSend(v9, "freezeDateNIHomeDevice", v14, v15, v16, v17);

  [v12 setFreezeDateNIHomeDevice:v13];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRNearbyDeviceContainerMO"];
}

void __127__IRNearbyDeviceContainerMO_Access__setPropertiesOfNearbyDeviceContainerMO_withNearbyDeviceContainerDO_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRNearbyDeviceMO nearbyDeviceMOWithNearbyDeviceDO:a2 nearbyDeviceContainer:v2 inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 addNearbyDevicesObject:v3];
}

- (id)convert
{
  id v3 = objc_opt_new();
  v4 = [(IRNearbyDeviceContainerMO *)self nearbyDevices];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__IRNearbyDeviceContainerMO_Access__convert__block_invoke;
  v10[3] = &unk_2653A0E60;
  id v11 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v10];

  v6 = [IRNearbyDeviceContainerDO alloc];
  id v7 = [(IRNearbyDeviceContainerMO *)self freezeDateNIHomeDevice];
  id v8 = [(IRNearbyDeviceContainerDO *)v6 initWithFreezeDateNIHomeDevice:v7 nearbyDevices:v5];

  return v8;
}

void __44__IRNearbyDeviceContainerMO_Access__convert__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 convert];
  [v2 addObject:v3];
}

@end