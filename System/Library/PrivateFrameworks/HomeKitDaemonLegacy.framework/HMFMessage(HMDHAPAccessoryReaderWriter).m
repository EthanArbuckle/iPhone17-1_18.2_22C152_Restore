@interface HMFMessage(HMDHAPAccessoryReaderWriter)
- (uint64_t)isSingleReadWriteRequest;
@end

@implementation HMFMessage(HMDHAPAccessoryReaderWriter)

- (uint64_t)isSingleReadWriteRequest
{
  v2 = [a1 name];
  if ([v2 isEqualToString:@"kCharacteristicReadRequestKey"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 name];
    uint64_t v3 = [v4 isEqualToString:@"kCharacteristicWriteRequestKey"];
  }
  return v3;
}

@end