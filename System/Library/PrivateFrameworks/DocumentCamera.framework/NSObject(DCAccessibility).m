@interface NSObject(DCAccessibility)
- (id)dcaxValueForKey:()DCAccessibility;
- (uint64_t)dcaxRespondsToSelector:()DCAccessibility fromExtrasProtocol:;
@end

@implementation NSObject(DCAccessibility)

- (uint64_t)dcaxRespondsToSelector:()DCAccessibility fromExtrasProtocol:
{
  int v4 = [a1 conformsToProtocol:a4];
  if (v4) {
    LOBYTE(v4) = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)dcaxValueForKey:()DCAccessibility
{
  id v4 = a3;
  v5 = [a1 valueForKey:v4];

  return v5;
}

@end