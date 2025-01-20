@interface NSString(LPInternal)
- (BOOL)_lp_hasCaseInsensitiveSuffix:()LPInternal;
- (BOOL)_lp_isEqualIgnoringCase:()LPInternal;
- (BOOL)_lp_isEqualToAny:()LPInternal;
- (BOOL)_lp_isEqualToAnyIgnoringCase:()LPInternal;
- (BOOL)_lp_isLTRText;
- (uint64_t)_lp_directionallyIsolatedString;
- (uint64_t)_lp_stringType;
- (void)_lp_setStringType:()LPInternal;
@end

@implementation NSString(LPInternal)

- (BOOL)_lp_isEqualToAny:()LPInternal
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__NSString_LPInternal___lp_isEqualToAny___block_invoke;
  v4[3] = &unk_1E5B07168;
  v4[4] = a1;
  return [a3 indexOfObjectPassingTest:v4] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_lp_isEqualIgnoringCase:()LPInternal
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

- (BOOL)_lp_isEqualToAnyIgnoringCase:()LPInternal
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__NSString_LPInternal___lp_isEqualToAnyIgnoringCase___block_invoke;
  v4[3] = &unk_1E5B07168;
  v4[4] = a1;
  return [a3 indexOfObjectPassingTest:v4] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_lp_hasCaseInsensitiveSuffix:()LPInternal
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 rangeOfString:v4 options:13] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)_lp_directionallyIsolatedString
{
  return [NSString stringWithFormat:@"⁨%@⁩", a1];
}

- (uint64_t)_lp_stringType
{
  v2 = objc_getAssociatedObject(a1, a2);
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_lp_setStringType:()LPInternal
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_stringType, v2, (void *)1);
}

- (BOOL)_lp_isLTRText
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v2 = (void *)getNLLanguageRecognizerClass(void)::softClass;
  uint64_t v11 = getNLLanguageRecognizerClass(void)::softClass;
  if (!getNLLanguageRecognizerClass(void)::softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___ZL28getNLLanguageRecognizerClassv_block_invoke;
    v7[3] = &unk_1E5B04EB8;
    v7[4] = &v8;
    ___ZL28getNLLanguageRecognizerClassv_block_invoke((uint64_t)v7);
    id v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  uint64_t v4 = [v3 dominantLanguageForString:a1];
  if (v4) {
    BOOL v5 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v4] == 1;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

@end