@interface CBDevice(HKCBDevice)
- (BOOL)isHearingAidCapable;
- (BOOL)isHearingTestCapable;
- (id)btAddress;
- (unint64_t)isGuestPaired;
@end

@implementation CBDevice(HKCBDevice)

- (unint64_t)isGuestPaired
{
  return ((unint64_t)[a1 deviceFlags] >> 25) & 1;
}

- (BOOL)isHearingAidCapable
{
  return [a1 hearingAidSupport] == 1;
}

- (BOOL)isHearingTestCapable
{
  return [a1 hearingTestSupport] == 1;
}

- (id)btAddress
{
  v1 = [a1 btAddressData];
  v2 = CUPrintNSDataAddress();

  return v2;
}

@end