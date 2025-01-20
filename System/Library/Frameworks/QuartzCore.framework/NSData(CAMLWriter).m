@interface NSData(CAMLWriter)
- (__CFString)CAMLType;
- (uint64_t)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSData(CAMLWriter)

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  uint64_t v4 = [a1 base64EncodedStringWithOptions:0];

  return [a3 setElementContent:v4];
}

- (__CFString)CAMLType
{
  return @"NSData";
}

@end