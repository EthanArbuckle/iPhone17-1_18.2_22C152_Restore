@interface CNContact
@end

@implementation CNContact

uint64_t __59__CNContact_CKAdditions__identifierForKey_withDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    v4 = [v3 value];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    v4 = [v3 value];
    uint64_t v5 = [v4 isLikePhoneNumber:*(void *)(a1 + 48)];
  }
  uint64_t v6 = v5;

LABEL_7:
  return v6;
}

@end