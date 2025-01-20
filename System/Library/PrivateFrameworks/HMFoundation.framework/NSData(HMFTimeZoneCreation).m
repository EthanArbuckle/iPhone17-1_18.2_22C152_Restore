@interface NSData(HMFTimeZoneCreation)
- (uint64_t)decodeTimeZone;
@end

@implementation NSData(HMFTimeZoneCreation)

- (uint64_t)decodeTimeZone
{
  return objc_msgSend(MEMORY[0x1E4F1CAF0], "hmf_unarchiveFromData:error:", a1, 0);
}

@end