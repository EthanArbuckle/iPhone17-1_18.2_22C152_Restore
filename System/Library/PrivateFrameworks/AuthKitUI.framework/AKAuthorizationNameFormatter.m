@interface AKAuthorizationNameFormatter
+ (id)validNameCharacterSet;
+ (void)_addSymbolModifiersToCharacterSet:(id)a3;
- (BOOL)_isOnlyWhitespace:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (id)_cleanNameString:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation AKAuthorizationNameFormatter

+ (id)validNameCharacterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AKAuthorizationNameFormatter_validNameCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (validNameCharacterSet_onceToken != -1) {
    dispatch_once(&validNameCharacterSet_onceToken, block);
  }
  v2 = (void *)validNameCharacterSet_sValidNameCharacterSet;

  return v2;
}

void __53__AKAuthorizationNameFormatter_validNameCharacterSet__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
  v2 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v6 formUnionWithCharacterSet:v2];

  v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [v6 formUnionWithCharacterSet:v3];

  [v6 removeCharactersInString:@"\t"];
  [*(id *)(a1 + 32) _addSymbolModifiersToCharacterSet:v6];
  objc_msgSend(v6, "addCharactersInRange:", 33, 94);
  uint64_t v4 = [v6 copy];
  v5 = (void *)validNameCharacterSet_sValidNameCharacterSet;
  validNameCharacterSet_sValidNameCharacterSet = v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (void *)[v3 copy];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  if (a3) {
    *a3 = a4;
  }
  return a3 != 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  id v10 = *a3;
  if ((unint64_t)[v10 length] <= 0x20)
  {
    if (![v10 length])
    {
      BOOL v11 = 1;
      goto LABEL_14;
    }
    if ([(AKAuthorizationNameFormatter *)self _isOnlyWhitespace:v10])
    {
      BOOL v11 = 0;
      *a3 = &stru_1F1EE8138;
      a4->location = 0;
      a4->length = 0;
      goto LABEL_14;
    }
    v12 = [(AKAuthorizationNameFormatter *)self _cleanNameString:v10];
    if ((unint64_t)[v12 length] <= 0x20)
    {
      if ([v12 isEqualToString:v10])
      {
        BOOL v11 = 1;
        goto LABEL_13;
      }
      if ([v12 length])
      {
        uint64_t v13 = [v10 length];
        a4->location += [v12 length] - v13;
        BOOL v11 = 0;
        *a3 = v12;
        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_isOnlyWhitespace:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 whitespaceCharacterSet];
  id v6 = [v5 invertedSet];

  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cleanNameString:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 whitespaceCharacterSet];
  id v6 = [v5 invertedSet];
  uint64_t v7 = [(id)objc_opt_class() validNameCharacterSet];
  v8 = [v7 invertedSet];

  v9 = [v4 componentsSeparatedByCharactersInSet:v8];

  id v10 = &stru_1F1EE8138;
  BOOL v11 = [v9 componentsJoinedByString:&stru_1F1EE8138];

  uint64_t v12 = [v11 rangeOfCharacterFromSet:v6 options:4];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = v12 + v13;
    if (v12 + v13 >= (unint64_t)[v11 length])
    {
      id v10 = &stru_1F1EE8138;
    }
    else
    {
      uint64_t v15 = [v11 rangeOfComposedCharacterSequenceAtIndex:v14];
      objc_msgSend(v11, "substringWithRange:", v15, v16);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  v17 = [v11 stringByTrimmingCharactersInSet:v5];

  v18 = [v17 stringByAppendingString:v10];

  return v18;
}

+ (void)_addSymbolModifiersToCharacterSet:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "addCharactersInRange:", 94, 95);
  objc_msgSend(v3, "addCharactersInRange:", 96, 97);
  objc_msgSend(v3, "addCharactersInRange:", 168, 169);
  objc_msgSend(v3, "addCharactersInRange:", 175, 176);
  objc_msgSend(v3, "addCharactersInRange:", 180, 181);
  objc_msgSend(v3, "addCharactersInRange:", 184, 185);
  objc_msgSend(v3, "addCharactersInRange:", 706, 710);
  objc_msgSend(v3, "addCharactersInRange:", 722, 736);
  objc_msgSend(v3, "addCharactersInRange:", 741, 748);
  objc_msgSend(v3, "addCharactersInRange:", 749, 750);
  objc_msgSend(v3, "addCharactersInRange:", 751, 768);
  objc_msgSend(v3, "addCharactersInRange:", 885, 886);
  objc_msgSend(v3, "addCharactersInRange:", 900, 902);
  objc_msgSend(v3, "addCharactersInRange:", 8125, 8126);
  objc_msgSend(v3, "addCharactersInRange:", 8127, 8130);
  objc_msgSend(v3, "addCharactersInRange:", 8141, 8144);
  objc_msgSend(v3, "addCharactersInRange:", 8157, 8160);
  objc_msgSend(v3, "addCharactersInRange:", 8173, 8176);
  objc_msgSend(v3, "addCharactersInRange:", 8189, 0x1FFFLL);
  objc_msgSend(v3, "addCharactersInRange:", 12443, 12445);
  objc_msgSend(v3, "addCharactersInRange:", 42752, 42775);
  objc_msgSend(v3, "addCharactersInRange:", 42784, 42786);
  objc_msgSend(v3, "addCharactersInRange:", 42889, 42891);
  objc_msgSend(v3, "addCharactersInRange:", 43867, 43868);
  objc_msgSend(v3, "addCharactersInRange:", 64434, 64450);
  objc_msgSend(v3, "addCharactersInRange:", 65342, 65343);
  objc_msgSend(v3, "addCharactersInRange:", 65344, 65345);
  objc_msgSend(v3, "addCharactersInRange:", 65507, 65508);
}

@end