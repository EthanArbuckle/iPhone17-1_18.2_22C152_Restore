@interface NSString(ContactsFoundationPhoneNumbers)
+ (id)_cn_LTRControlCharacters;
+ (id)_cn_phoneNumberInvalidCharacters;
+ (id)_cn_whitespaceExceptAscii32CharacterSet;
- (id)_cn_stringByNormalizingWhitespace;
- (id)_cn_stringBySanitizingPhoneNumber;
- (uint64_t)_cn_requiresPhoneNumberSanitizing;
@end

@implementation NSString(ContactsFoundationPhoneNumbers)

- (id)_cn_stringBySanitizingPhoneNumber
{
  v2 = objc_msgSend((id)objc_opt_class(), "_cn_LTRControlCharacters");
  v3 = [a1 stringByTrimmingCharactersInSet:v2];
  v4 = objc_msgSend(v3, "_cn_stringByNormalizingWhitespace");

  return v4;
}

- (id)_cn_stringByNormalizingWhitespace
{
  v2 = objc_msgSend((id)objc_opt_class(), "_cn_whitespaceExceptAscii32CharacterSet");
  if (objc_msgSend(a1, "_cn_containsCharacterInSet:", v2))
  {
    v3 = [a1 componentsSeparatedByCharactersInSet:v2];
    id v4 = [v3 componentsJoinedByString:@" "];
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

+ (id)_cn_whitespaceExceptAscii32CharacterSet
{
  if (_cn_whitespaceExceptAscii32CharacterSet_cn_once_token_3 != -1) {
    dispatch_once(&_cn_whitespaceExceptAscii32CharacterSet_cn_once_token_3, &__block_literal_global_69);
  }
  v0 = (void *)_cn_whitespaceExceptAscii32CharacterSet_cn_once_object_3;

  return v0;
}

+ (id)_cn_LTRControlCharacters
{
  if (_cn_LTRControlCharacters_cn_once_token_2 != -1) {
    dispatch_once(&_cn_LTRControlCharacters_cn_once_token_2, &__block_literal_global_91);
  }
  v0 = (void *)_cn_LTRControlCharacters_cn_once_object_2;

  return v0;
}

- (uint64_t)_cn_requiresPhoneNumberSanitizing
{
  v2 = objc_msgSend((id)objc_opt_class(), "_cn_phoneNumberInvalidCharacters");
  uint64_t v3 = objc_msgSend(a1, "_cn_containsCharacterInSet:", v2);

  return v3;
}

+ (id)_cn_phoneNumberInvalidCharacters
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NSString_ContactsFoundationPhoneNumbers___cn_phoneNumberInvalidCharacters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_cn_phoneNumberInvalidCharacters_cn_once_token_1 != -1) {
    dispatch_once(&_cn_phoneNumberInvalidCharacters_cn_once_token_1, block);
  }
  v1 = (void *)_cn_phoneNumberInvalidCharacters_cn_once_object_1;

  return v1;
}

@end