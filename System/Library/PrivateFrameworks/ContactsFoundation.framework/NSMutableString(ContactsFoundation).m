@interface NSMutableString(ContactsFoundation)
- (uint64_t)_cn_appendNonNilString:()ContactsFoundation;
- (uint64_t)_cn_deleteCharactersInSet:()ContactsFoundation;
- (uint64_t)_cn_trim;
- (void)_cn_deleteCharactersInSet:()ContactsFoundation options:;
- (void)_cn_replaceOccurrencesOfString:()ContactsFoundation withString:;
- (void)_cn_trimLeadingWhitespace;
- (void)_cn_trimTrailingWhitespace;
@end

@implementation NSMutableString(ContactsFoundation)

- (uint64_t)_cn_appendNonNilString:()ContactsFoundation
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v4 = (id)[v4 length];
    id v5 = v7;
    if (v4)
    {
      id v4 = (id)[a1 appendString:v7];
      id v5 = v7;
    }
  }

  return MEMORY[0x1F41817F8](v4, v5);
}

- (uint64_t)_cn_trim
{
  objc_msgSend(a1, "_cn_trimLeadingWhitespace");

  return objc_msgSend(a1, "_cn_trimTrailingWhitespace");
}

- (void)_cn_trimLeadingWhitespace
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  objc_msgSend(a1, "_cn_deleteCharactersInSet:options:", v2, 8);
}

- (void)_cn_trimTrailingWhitespace
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  objc_msgSend(a1, "_cn_deleteCharactersInSet:options:", v2, 12);
}

- (uint64_t)_cn_deleteCharactersInSet:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_deleteCharactersInSet:options:", a3, 385);
}

- (void)_cn_deleteCharactersInSet:()ContactsFoundation options:
{
  id v9 = a3;
  uint64_t v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [a1 rangeOfCharacterFromSet:v9 options:a4])
      objc_msgSend(a1, "deleteCharactersInRange:", i, v7);
  }
}

- (void)_cn_replaceOccurrencesOfString:()ContactsFoundation withString:
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(a1, "length"));
}

@end