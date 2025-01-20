@interface ShimAccessoryMatterCapabilities
- (BOOL)isCapabilityAllowed:(int64_t)a3 vendorID:(int64_t)a4 productID:(int64_t)a5;
- (BOOL)isCapabilityAllowed:(int64_t)a3 vendorID:(int64_t)a4 productID:(int64_t)a5 firmwareVersion:(int64_t)a6;
@end

@implementation ShimAccessoryMatterCapabilities

- (BOOL)isCapabilityAllowed:(int64_t)a3 vendorID:(int64_t)a4 productID:(int64_t)a5
{
  LOBYTE(a5) = sub_22F6996BC(a3, a4, a5);
  swift_release();
  return a5 & 1;
}

- (BOOL)isCapabilityAllowed:(int64_t)a3 vendorID:(int64_t)a4 productID:(int64_t)a5 firmwareVersion:(int64_t)a6
{
  LOBYTE(a6) = sub_22F699994(a3, a4, a5, a6);
  swift_release();
  return a6 & 1;
}

@end