@interface CLSGroup(Autocomplete)
- (uint64_t)acceptVisitor:()Autocomplete;
@end

@implementation CLSGroup(Autocomplete)

- (uint64_t)acceptVisitor:()Autocomplete
{
  return [a3 visitGroup:a1];
}

@end