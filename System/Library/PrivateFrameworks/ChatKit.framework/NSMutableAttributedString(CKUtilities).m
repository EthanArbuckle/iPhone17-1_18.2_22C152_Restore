@interface NSMutableAttributedString(CKUtilities)
- (void)__ck_filterAttributes:()CKUtilities;
- (void)__ck_removeAllAttributesExcept:()CKUtilities;
- (void)__ck_removeOccurencesOfString:()CKUtilities;
@end

@implementation NSMutableAttributedString(CKUtilities)

- (void)__ck_removeOccurencesOfString:()CKUtilities
{
  id v7 = a3;
  v4 = [a1 string];
  if ([v4 rangeOfString:v7 options:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      objc_msgSend(a1, "deleteCharactersInRange:", 0x7FFFFFFFFFFFFFFFLL, v5);
      v6 = [a1 string];

      v4 = v6;
    }
    while ([v6 rangeOfString:v7 options:2] == 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    v6 = v4;
  }
}

- (void)__ck_removeAllAttributesExcept:()CKUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__NSMutableAttributedString_CKUtilities____ck_removeAllAttributesExcept___block_invoke;
  v8[3] = &unk_1E5624018;
  id v9 = v6;
  v10 = a1;
  id v7 = v6;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v8);
}

- (void)__ck_filterAttributes:()CKUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke;
  v7[3] = &unk_1E5624068;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);
}

@end