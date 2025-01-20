@interface NSNumber(KGPropertyTypeProtocol)
- (uint64_t)kgPropertyType;
@end

@implementation NSNumber(KGPropertyTypeProtocol)

- (uint64_t)kgPropertyType
{
  id v1 = a1;
  if (CFNumberIsFloatType((CFNumberRef)v1))
  {
    uint64_t v2 = 2;
  }
  else if ([v1 compare:&unk_1F280F5C8] == 1)
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

@end