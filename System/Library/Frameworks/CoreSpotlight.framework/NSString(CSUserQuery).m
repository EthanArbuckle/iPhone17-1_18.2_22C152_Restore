@interface NSString(CSUserQuery)
- (BOOL)containsCJK;
- (id)normalizeForSemanticSearch;
- (uint64_t)isAllNumbersOrSpaces;
@end

@implementation NSString(CSUserQuery)

- (id)normalizeForSemanticSearch
{
  uint64_t v1 = normalizeForSemanticSearch_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&normalizeForSemanticSearch_onceToken, &__block_literal_global_27);
  }
  v3 = objc_msgSend((id)normalizeForSemanticSearch_sRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), @" ");

  v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (uint64_t)isAllNumbersOrSpaces
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES %@", @"^[0-9.\\s]+$"];
  uint64_t v3 = [v2 evaluateWithObject:a1];

  return v3;
}

- (BOOL)containsCJK
{
  if (containsCJK_onceToken != -1) {
    dispatch_once(&containsCJK_onceToken, &__block_literal_global_65);
  }
  return objc_msgSend((id)containsCJK_sRegex, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;
}

@end