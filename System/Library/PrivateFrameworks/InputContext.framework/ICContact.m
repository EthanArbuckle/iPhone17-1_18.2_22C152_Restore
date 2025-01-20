@interface ICContact
@end

@implementation ICContact

void __21___ICContact_flatten__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 length])
  {
    if ([v5 rangeOfCharacterFromSet:*(void *)(a1 + 32)] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 40) addObject:v5];
    }
    else
    {
      v3 = [v5 componentsSeparatedByCharactersInSet:*(void *)(a1 + 32)];
      v4 = (void *)[v3 mutableCopy];

      [v4 removeObject:&stru_26E89F4A0];
      [*(id *)(a1 + 40) addObjectsFromArray:v4];
    }
  }
}

@end