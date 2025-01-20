@interface UARPSupportedAccessoryA2562
+ (id)appleModelNumber;
+ (id)modelUUID;
- (UARPSupportedAccessoryA2562)init;
@end

@implementation UARPSupportedAccessoryA2562

- (UARPSupportedAccessoryA2562)init
{
  v11.receiver = self;
  v11.super_class = (Class)UARPSupportedAccessoryA2562;
  v2 = [(UARPSupportedAccessory *)&v11 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2562 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Sidekick"];
    v4 = [UARPAccessoryHardwareHDS alloc];
    id v5 = objc_alloc(MEMORY[0x263F08C38]);
    v6 = +[UARPSupportedAccessoryA2562 modelUUID];
    v7 = (void *)[v5 initWithUUIDString:v6];
    uint64_t v8 = [(UARPAccessoryHardwareHDS *)v4 initWithUUID:v7];
    hwID = v2->hwID;
    v2->hwID = (UARPAccessoryHardwareHDS *)v8;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2562";
}

+ (id)modelUUID
{
  return @"693FBEFE-C1E0-4125-96AC-10F8915DA1F3";
}

- (void).cxx_destruct
{
}

@end