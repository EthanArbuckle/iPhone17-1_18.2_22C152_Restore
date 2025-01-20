@interface NSNumber(CAMLWriter)
- (__CFString)CAMLType;
- (void)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSNumber(CAMLWriter)

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [a1 doubleValue];
  v6[0] = v4;
  CFStringRef v5 = CACreateStringWithDoubleArray((uint64_t)v6, 1uLL, 1.0e-12);
  [a3 setElementContent:v5];

  CFRelease(v5);
}

- (__CFString)CAMLType
{
  [a1 doubleValue];
  double v2 = floor(v1);
  if (fabs(v1) <= 2147483650.0 && v2 == v1) {
    return @"integer";
  }
  else {
    return @"real";
  }
}

@end