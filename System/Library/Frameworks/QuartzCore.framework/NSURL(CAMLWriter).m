@interface NSURL(CAMLWriter)
- (__CFString)CAMLType;
- (uint64_t)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSURL(CAMLWriter)

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  CFStringRef v4 = CFURLGetString(a1);

  return [a3 setElementContent:v4];
}

- (__CFString)CAMLType
{
  return @"NSURL";
}

@end