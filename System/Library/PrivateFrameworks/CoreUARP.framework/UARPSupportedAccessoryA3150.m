@interface UARPSupportedAccessoryA3150
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3150)init;
@end

@implementation UARPSupportedAccessoryA3150

- (UARPSupportedAccessoryA3150)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)UARPSupportedAccessoryA3150;
  v2 = [(UARPSupportedAccessoryBeatsBluetooth *)&v16 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3150 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Buds"];
    [(UARPSupportedAccessory *)v2 setSupportsHeySiriCompact:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = +[UARPSupportedAccessoryA3150 alternativeAppleModelNumbers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          [(UARPSupportedAccessory *)v2 addAlternativeAppleModelNumber:*(void *)(*((void *)&v12 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v6);
    }

    v9 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID") productID:+[UARPSupportedAccessoryA3150 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v9;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3150";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"A3151", @"A3153", 0);
}

+ (unsigned)productID
{
  return 8230;
}

- (void).cxx_destruct
{
}

@end