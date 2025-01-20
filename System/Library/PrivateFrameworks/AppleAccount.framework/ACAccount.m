@interface ACAccount
@end

@implementation ACAccount

uint64_t __49__ACAccount_AppleAccount__aa_hasDuplicateAccount__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_aa_isExistingAccount:", a2);
}

uint64_t __49__ACAccount_AppleAccount__aa_hasDuplicateAccount__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "aa_isDuplicateAccount:", a2);
}

@end