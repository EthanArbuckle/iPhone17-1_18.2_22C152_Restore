@interface NSString
@end

@implementation NSString

void __83__NSString_ContactsFoundationPhoneNumbers___cn_whitespaceExceptAscii32CharacterSet__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E58] whitespaceCharacterSet];
  objc_msgSend(v2, "removeCharactersInRange:", 32, 1);
  uint64_t v0 = [v2 copy];
  v1 = (void *)_cn_whitespaceExceptAscii32CharacterSet_cn_once_object_3;
  _cn_whitespaceExceptAscii32CharacterSet_cn_once_object_3 = v0;
}

uint64_t __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a1 + 32) & 4) != 0) {
    a3 = -1;
  }
  return a2 + a3;
}

uint64_t __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 40) & 4) != 0) {
    return [*(id *)(a1 + 32) length];
  }
  else {
    return 0;
  }
}

void __68__NSString_ContactsFoundationPhoneNumbers___cn_LTRControlCharacters__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\u202A\u202C\u202D"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)_cn_LTRControlCharacters_cn_once_object_2;
  _cn_LTRControlCharacters_cn_once_object_2 = v0;
}

void __74__NSString_ContactsFoundation___cn_rangeOfCommonPrefixWithString_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v11 = a3 + a4;
  if (a3 + a4 <= (unint64_t)[*(id *)(a1 + 32) length])
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 40), "compare:options:range:")) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
    }
  }
  else
  {
    *a7 = 1;
  }
}

void __44__NSString_ContactsFoundation___cn_flatMap___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (id)v2;
  if (v2) {
    v3 = (__CFString *)v2;
  }
  else {
    v3 = &stru_1EE0267A8;
  }
  [v1 appendString:v3];
}

void __76__NSString_ContactsFoundationPhoneNumbers___cn_phoneNumberInvalidCharacters__block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_opt_class(), "_cn_LTRControlCharacters");
  id v4 = (id)[v0 mutableCopy];

  v1 = objc_msgSend((id)objc_opt_class(), "_cn_whitespaceExceptAscii32CharacterSet");
  [v4 formUnionWithCharacterSet:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)_cn_phoneNumberInvalidCharacters_cn_once_object_1;
  _cn_phoneNumberInvalidCharacters_cn_once_object_1 = v2;
}

@end