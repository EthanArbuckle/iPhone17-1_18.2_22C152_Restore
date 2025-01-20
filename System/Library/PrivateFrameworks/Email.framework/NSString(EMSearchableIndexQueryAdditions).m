@interface NSString(EMSearchableIndexQueryAdditions)
- (id)em_stringForQuotingWithCharacter:()EMSearchableIndexQueryAdditions;
@end

@implementation NSString(EMSearchableIndexQueryAdditions)

- (id)em_stringForQuotingWithCharacter:()EMSearchableIndexQueryAdditions
{
  v4 = (void *)[a1 mutableCopy];
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v4, "length"));
  uint64_t v5 = 0;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    if (*((unsigned __int8 *)&em_stringForQuotingWithCharacter__map + 24 * v5) == a3) {
      break;
    }
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v7 & 1) == 0) {
      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", *((void *)&em_stringForQuotingWithCharacter__map + 3 * v5 + 1), *((void *)&em_stringForQuotingWithCharacter__map + 3 * v5 + 2), 0, 0, objc_msgSend(v4, "length"));
LABEL_6:
  return v4;
}

@end