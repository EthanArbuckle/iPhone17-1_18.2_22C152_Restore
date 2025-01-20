@interface NSDictionary(CAMLWriter)
- (__CFString)CAMLType;
- (uint64_t)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSDictionary(CAMLWriter)

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  v5 = objc_msgSend((id)objc_msgSend(a1, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  uint64_t result = [v5 count];
  if (result)
  {
    uint64_t v7 = result;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [v5 objectAtIndex:i];
      uint64_t v10 = [a1 objectForKey:v9];
      [a3 beginPropertyElement:v9];
      [a3 encodeObject:v10];
      uint64_t result = [a3 endElement];
    }
  }
  return result;
}

- (__CFString)CAMLType
{
  return @"NSDictionary";
}

@end