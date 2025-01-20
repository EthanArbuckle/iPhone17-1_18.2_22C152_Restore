@interface NSString(CAMLWriter)
- (__CFString)CAMLType;
- (uint64_t)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSString(CAMLWriter)

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  return [a3 setElementContent:a1];
}

- (__CFString)CAMLType
{
  return @"string";
}

@end