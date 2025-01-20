@interface NSString(ENScrubbing)
- (id)en_scrubUsingRegex:()ENScrubbing withMinLength:maxLength:invalidCharacterReplacement:;
- (uint64_t)en_scrubUsingRegex:()ENScrubbing withMinLength:maxLength:;
@end

@implementation NSString(ENScrubbing)

- (uint64_t)en_scrubUsingRegex:()ENScrubbing withMinLength:maxLength:
{
  return objc_msgSend(a1, "en_scrubUsingRegex:withMinLength:maxLength:invalidCharacterReplacement:", a3, a4, a5, 0);
}

- (id)en_scrubUsingRegex:()ENScrubbing withMinLength:maxLength:invalidCharacterReplacement:
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a1;
  if ([v12 length] >= (unint64_t)a4)
  {
    unint64_t v14 = a4;
    if ([v12 length] <= (unint64_t)a5)
    {
      v15 = v12;
    }
    else
    {
      v15 = [v12 substringToIndex:a5];
    }
    v16 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v10 options:0 error:0];
    v17 = objc_msgSend(v16, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
    if ([v17 count])
    {
      id v12 = v15;
LABEL_17:
      if ([v12 length] >= v14) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }

      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v15, "length"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (![v15 length])
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v18 = 0;
    while (1)
    {
      v19 = v17;
      v20 = objc_msgSend(v15, "substringWithRange:", v18, 1);
      v17 = objc_msgSend(v16, "matchesInString:options:range:", v20, 0, 0, 1);

      if ([v17 count]) {
        break;
      }
      if (v11)
      {
        v21 = v12;
        id v22 = v11;
        goto LABEL_14;
      }
LABEL_15:

      if (++v18 >= (unint64_t)[v15 length]) {
        goto LABEL_16;
      }
    }
    v21 = v12;
    id v22 = v20;
LABEL_14:
    [v21 appendString:v22];
    goto LABEL_15;
  }
  id v13 = 0;
LABEL_21:

  return v13;
}

@end