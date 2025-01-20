@interface NSAffineTransform(CAMLWriter)
- (__CFString)CAMLType;
- (void)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSAffineTransform(CAMLWriter)

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 transformStruct];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  v10[0] = v7;
  v10[1] = v8;
  v10[2] = v9;
  CFStringRef v4 = CACreateStringWithDoubleArray((uint64_t)v10, 6uLL, 1.0e-12);
  if (v4)
  {
    CFStringRef v5 = v4;
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"matrix(%@)", v4);
    [a3 setElementContent:v6];
    CFRelease(v6);
    CFRelease(v5);
  }
}

- (__CFString)CAMLType
{
  return @"CGAffineTransform";
}

@end