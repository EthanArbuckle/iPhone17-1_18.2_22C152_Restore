@interface NSScanner(NSScannerUtils)
- (BOOL)mf_scanUpAndOverString:()NSScannerUtils;
- (id)mf_nextTokenWithPunctuation:()NSScannerUtils;
@end

@implementation NSScanner(NSScannerUtils)

- (id)mf_nextTokenWithPunctuation:()NSScannerUtils
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  unint64_t v6 = [a1 scanLocation];
  v7 = [a1 string];
  unint64_t v8 = [v7 length];
  if (v6 >= v8) {
    goto LABEL_7;
  }
  while (CFCharacterSetIsCharacterMember(Predefined, [v7 characterAtIndex:v6]))
  {
    if (v8 == ++v6)
    {
      unint64_t v6 = v8;
      goto LABEL_15;
    }
  }
  if (CFCharacterSetIsCharacterMember(a3, [v7 characterAtIndex:v6]))
  {
    unint64_t v8 = v6 + 1;
  }
  else
  {
LABEL_7:
    if (v6 >= v8)
    {
      unint64_t v8 = v6;
    }
    else
    {
      unint64_t v9 = v6;
      while (!CFCharacterSetIsCharacterMember(Predefined, [v7 characterAtIndex:v9])
           && !CFCharacterSetIsCharacterMember(a3, [v7 characterAtIndex:v9]))
      {
        if (v8 == ++v9) {
          goto LABEL_15;
        }
      }
      unint64_t v8 = v9;
    }
  }
LABEL_15:
  [a1 setScanLocation:v8];
  if (v8 == v6)
  {
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "substringWithRange:", v6, v8 - v6);
  }

  return v10;
}

- (BOOL)mf_scanUpAndOverString:()NSScannerUtils
{
  id v4 = a3;
  uint64_t v5 = [a1 scanLocation];
  unint64_t v6 = [a1 string];
  int v7 = [a1 caseSensitive];
  unint64_t v8 = [a1 string];
  uint64_t v9 = objc_msgSend(v6, "rangeOfString:options:range:", v4, v7 ^ 1u, v5, objc_msgSend(v8, "length") - v5);
  uint64_t v11 = v10;

  if (v11) {
    [a1 setScanLocation:v9 + v11];
  }

  return v11 != 0;
}

@end