@interface NSMutableData(KAESGCM)
- (uint64_t)replaceTrailingWith7LSB:()KAESGCM;
@end

@implementation NSMutableData(KAESGCM)

- (uint64_t)replaceTrailingWith7LSB:()KAESGCM
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unint64_t v4 = bswap64(a3);
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:", objc_msgSend(a1, "length", v4, v5) - 7, 7, (char *)&v4 + 1);
}

@end