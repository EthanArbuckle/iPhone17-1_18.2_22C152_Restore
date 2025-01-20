@interface NSData(HMFZeroing)
- (id)hmf_zeroingCopy;
@end

@implementation NSData(HMFZeroing)

- (id)hmf_zeroingCopy
{
  v1 = (void *)MEMORY[0x1E4F1C9B8];
  id v2 = a1;
  v3 = objc_msgSend(v1, "_newZeroingDataWithBytes:length:", objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
  return v3;
}

@end