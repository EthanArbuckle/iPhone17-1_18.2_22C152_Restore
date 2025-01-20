@interface CLSClass(Autocomplete)
- (uint64_t)acceptVisitor:()Autocomplete;
@end

@implementation CLSClass(Autocomplete)

- (uint64_t)acceptVisitor:()Autocomplete
{
  return [a3 visitClass:a1];
}

@end