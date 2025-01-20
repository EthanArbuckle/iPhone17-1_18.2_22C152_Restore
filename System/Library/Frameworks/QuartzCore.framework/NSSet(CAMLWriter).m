@interface NSSet(CAMLWriter)
- (__CFString)CAMLType;
- (uint64_t)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSSet(CAMLWriter)

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  v4 = (void *)[a1 allObjects];
  uint64_t result = [v4 count];
  if (result)
  {
    uint64_t v6 = result;
    for (uint64_t i = 0; i != v6; ++i)
      uint64_t result = objc_msgSend(a3, "encodeObject:", objc_msgSend(v4, "objectAtIndex:", i));
  }
  return result;
}

- (__CFString)CAMLType
{
  return @"NSSet";
}

@end