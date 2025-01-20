@interface UARPSupportedAccessoryA3053
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3053)init;
@end

@implementation UARPSupportedAccessoryA3053

- (UARPSupportedAccessoryA3053)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)UARPSupportedAccessoryA3053;
  v2 = [(UARPSupportedAccessoryAirPodsBud *)&v16 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3053 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = +[UARPSupportedAccessoryA3053 alternativeAppleModelNumbers];
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

    v9 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryAirPodsBud vendorID](UARPSupportedAccessoryAirPodsBud, "vendorID") productID:+[UARPSupportedAccessoryA3053 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v9;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3053";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"A3050", 0);
}

+ (unsigned)productID
{
  return 8217;
}

- (void).cxx_destruct
{
}

@end