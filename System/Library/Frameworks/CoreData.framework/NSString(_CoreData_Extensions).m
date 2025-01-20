@interface NSString(_CoreData_Extensions)
- (uint64_t)_caseInsensitiveNumericCompare:()_CoreData_Extensions;
@end

@implementation NSString(_CoreData_Extensions)

- (uint64_t)_caseInsensitiveNumericCompare:()_CoreData_Extensions
{
  uint64_t v5 = [a1 length];

  return objc_msgSend(a1, "compare:options:range:", a3, 65, 0, v5);
}

@end