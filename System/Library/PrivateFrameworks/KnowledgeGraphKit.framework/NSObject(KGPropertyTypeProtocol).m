@interface NSObject(KGPropertyTypeProtocol)
- (uint64_t)kgPropertyType;
@end

@implementation NSObject(KGPropertyTypeProtocol)

- (uint64_t)kgPropertyType
{
  return 0;
}

@end