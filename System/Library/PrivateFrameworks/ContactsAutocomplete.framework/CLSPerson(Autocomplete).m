@interface CLSPerson(Autocomplete)
- (uint64_t)acceptVisitor:()Autocomplete;
@end

@implementation CLSPerson(Autocomplete)

- (uint64_t)acceptVisitor:()Autocomplete
{
  return [a3 visitPerson:a1];
}

@end