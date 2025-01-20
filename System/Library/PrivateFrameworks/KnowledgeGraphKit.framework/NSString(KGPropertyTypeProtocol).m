@interface NSString(KGPropertyTypeProtocol)
- (uint64_t)kgPropertyType;
@end

@implementation NSString(KGPropertyTypeProtocol)

- (uint64_t)kgPropertyType
{
  return 3;
}

@end