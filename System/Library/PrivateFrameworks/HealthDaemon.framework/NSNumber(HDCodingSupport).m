@interface NSNumber(HDCodingSupport)
- (_BYTE)hk_hasFloatingPointValue;
@end

@implementation NSNumber(HDCodingSupport)

- (_BYTE)hk_hasFloatingPointValue
{
  result = (unsigned char *)[a1 objCType];
  if (result) {
    return (unsigned char *)((*result & 0xFD) == 100);
  }
  return result;
}

@end