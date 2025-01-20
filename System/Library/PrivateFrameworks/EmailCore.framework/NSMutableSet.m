@interface NSMutableSet
@end

@implementation NSMutableSet

void __98__NSMutableSet_ECEmailAddressConvertible__ec_emailAddressConvertiblesSetFromArray_includeInvalid___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 emailAddressValue];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

@end