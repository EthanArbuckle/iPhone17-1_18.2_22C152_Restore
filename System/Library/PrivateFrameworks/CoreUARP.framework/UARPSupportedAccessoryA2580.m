@interface UARPSupportedAccessoryA2580
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2580)init;
@end

@implementation UARPSupportedAccessoryA2580

- (UARPSupportedAccessoryA2580)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)UARPSupportedAccessoryA2580;
  v2 = [(UARPSupportedAccessoryMagSafe *)&v16 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2580 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"MagSafe Charger"];
    [(UARPSupportedAccessory *)v2 setSupportsMappedAnalytics:1];
    [(UARPSupportedAccessory *)v2 setPersonalizationNotification:@"com.apple.uarp.UARPUpdaterServiceHID.personalizationNeeded"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = +[UARPSupportedAccessoryA2580 alternativeAppleModelNumbers];
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

    v9 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID") productID:+[UARPSupportedAccessoryA2580 productID]];
    hwID = v2->hwID;
    v2->hwID = v9;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2580";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"A3250", 0);
}

+ (unsigned)productID
{
  return 1286;
}

- (void).cxx_destruct
{
}

@end