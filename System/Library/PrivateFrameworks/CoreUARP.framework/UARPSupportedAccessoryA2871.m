@interface UARPSupportedAccessoryA2871
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2871)init;
- (id)description;
@end

@implementation UARPSupportedAccessoryA2871

- (UARPSupportedAccessoryA2871)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)UARPSupportedAccessoryA2871;
  v2 = [(UARPSupportedAccessoryBeatsBluetooth *)&v16 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2871 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Studio Buds"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = +[UARPSupportedAccessoryA2871 alternativeAppleModelNumbers];
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

    v9 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID") productID:+[UARPSupportedAccessoryA2871 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v9;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = +[UARPSupportedAccessoryA2871 appleModelNumber];
  [v3 appendFormat:@"Apple Model Number: %@\n", v4];

  [v3 appendFormat:@"HardwareID: %@\n", self->hwID];
  uint64_t v5 = [(UARPSupportedAccessory *)self downstreamAppleModelNumbers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(UARPSupportedAccessory *)self downstreamAppleModelNumbers];
    [v3 appendFormat:@", Downstream Apple Model Numbers = %@", v7];
  }
  uint64_t v8 = [(UARPSupportedAccessory *)self alternativeAppleModelNumbers];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(UARPSupportedAccessory *)self alternativeAppleModelNumbers];
    [v3 appendFormat:@", Alternative Apple Model Numbers = %@", v10];
  }
  v11 = [(UARPSupportedAccessory *)self mobileAssetAppleModelNumber];

  if (v11)
  {
    long long v12 = [(UARPSupportedAccessory *)self mobileAssetAppleModelNumber];
    [v3 appendFormat:@", Mobile Asset Apple Model Numbers = %@", v12];
  }
  [v3 appendFormat:@"\n"];
  long long v13 = [NSString stringWithString:v3];

  return v13;
}

+ (id)appleModelNumber
{
  return @"A2871";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"A2872", @"A2952", 0);
}

+ (unsigned)productID
{
  return 8214;
}

- (void).cxx_destruct
{
}

@end