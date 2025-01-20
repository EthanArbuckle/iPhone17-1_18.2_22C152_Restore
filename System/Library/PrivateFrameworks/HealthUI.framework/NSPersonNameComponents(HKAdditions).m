@interface NSPersonNameComponents(HKAdditions)
- (BOOL)isGivenNameFirst;
@end

@implementation NSPersonNameComponents(HKAdditions)

- (BOOL)isGivenNameFirst
{
  return [MEMORY[0x1E4F28F38] _nameOrderWithOverridesForComponents:a1 options:0] != 2;
}

@end