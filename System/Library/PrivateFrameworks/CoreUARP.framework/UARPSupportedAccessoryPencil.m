@interface UARPSupportedAccessoryPencil
+ (unsigned)vendorID;
- (UARPSupportedAccessoryPencil)init;
@end

@implementation UARPSupportedAccessoryPencil

- (UARPSupportedAccessoryPencil)init
{
  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryPencil;
  v2 = [(UARPSupportedAccessoryHID *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UARPSupportedAccessory *)v2 setModelName:@"Apple Pencil"];
  }
  return v3;
}

+ (unsigned)vendorID
{
  return 76;
}

@end