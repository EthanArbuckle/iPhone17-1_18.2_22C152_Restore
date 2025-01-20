@interface NSArray(CAMLWriter)
- (__CFString)CAMLType;
- (uint64_t)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSArray(CAMLWriter)

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  uint64_t result = [a1 count];
  if (result)
  {
    uint64_t v6 = result;
    for (uint64_t i = 0; i != v6; ++i)
      uint64_t result = objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "objectAtIndex:", i));
  }
  return result;
}

- (__CFString)CAMLType
{
  return @"NSArray";
}

@end