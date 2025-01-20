@interface UARPSupportedAccessoryA2617USB
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2617USB)init;
@end

@implementation UARPSupportedAccessoryA2617USB

- (UARPSupportedAccessoryA2617USB)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)UARPSupportedAccessoryA2617USB;
  v2 = [(UARPSupportedAccessoryAirPodsCaseUSB *)&v17 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2617USB appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2 Case"];
    [(UARPSupportedAccessory *)v2 setFusingOverrideUnfused:@"prod"];
    v4 = +[UARPSupportedAccessoryA2699 mobileAssetAppleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v4];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = +[UARPSupportedAccessoryA2617USB alternativeAppleModelNumbers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          [(UARPSupportedAccessory *)v2 addAlternativeAppleModelNumber:*(void *)(*((void *)&v13 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }

    [(UARPSupportedAccessory *)v2 setPersonalizationNotification:@"com.apple.uarp.BTLEServer.personalizationNeeded"];
    v10 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID") productID:+[UARPSupportedAccessoryA2617USB productID]];
    hwID = v2->hwID;
    v2->hwID = v10;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2617 appleModelNumber];
}

+ (id)alternativeAppleModelNumbers
{
  return +[UARPSupportedAccessoryA2617 alternativeAppleModelNumbers];
}

+ (unsigned)productID
{
  return 4373;
}

- (void).cxx_destruct
{
}

@end