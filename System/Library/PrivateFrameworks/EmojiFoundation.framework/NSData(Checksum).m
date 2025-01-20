@interface NSData(Checksum)
+ (uint64_t)SHA224ChecksumSize;
- (id)SHA224Checksum;
@end

@implementation NSData(Checksum)

- (id)SHA224Checksum
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (unsigned __int8 *)v6 - (([MEMORY[0x1E4F1C9B8] SHA224ChecksumSize] + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = a1;
  CC_SHA224((const void *)[v3 bytes], objc_msgSend(v3, "length"), v2);
  v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v2, objc_msgSend(MEMORY[0x1E4F1C9B8], "SHA224ChecksumSize"));
  return v4;
}

+ (uint64_t)SHA224ChecksumSize
{
  return 28;
}

@end