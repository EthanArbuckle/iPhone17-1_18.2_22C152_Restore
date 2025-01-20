@interface NSTimeZone(NSTimeZonePortCoding)
- (id)replacementObjectForPortCoder:()NSTimeZonePortCoding;
@end

@implementation NSTimeZone(NSTimeZonePortCoding)

- (id)replacementObjectForPortCoder:()NSTimeZonePortCoding
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isByref])
  {
    v6.receiver = a1;
    v6.super_class = (Class)NSTimeZone_0;
    return objc_msgSendSuper2(&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return a1;
}

@end