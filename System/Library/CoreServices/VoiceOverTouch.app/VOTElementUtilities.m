@interface VOTElementUtilities
+ (id)handleValueChangeForPhoneDeletionWithOldString:(id)a3 newString:(id)a4;
+ (id)phoneNumberWithoutFormattingCharacters:(id)a3;
+ (int64_t)findLocationOfDifferenceInOldString:(id)a3 withNewString:(id)a4;
@end

@implementation VOTElementUtilities

+ (id)phoneNumberWithoutFormattingCharacters:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[-()\\s]", &stru_1001B7888, 1024, 0, objc_msgSend(v3, "length"));

  return v4;
}

+ (id)handleValueChangeForPhoneDeletionWithOldString:(id)a3 newString:(id)a4
{
  id v5 = a4;
  v6 = +[VOTElementUtilities phoneNumberWithoutFormattingCharacters:a3];
  v7 = +[VOTElementUtilities phoneNumberWithoutFormattingCharacters:v5];

  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    int64_t v8 = +[VOTElementUtilities findLocationOfDifferenceInOldString:v6 withNewString:v7];
  }
  else
  {
    [v6 length];
    int64_t v8 = 0;
  }
  if (v8 + 1 <= (unint64_t)[v6 length])
  {
    v9 = objc_msgSend(v6, "substringWithRange:", v8, 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int64_t)findLocationOfDifferenceInOldString:(id)a3 withNewString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (char *)[v5 length];
  int64_t v8 = (char *)[v6 length];
  v9 = v8;
  if ((uint64_t)v7 >= (uint64_t)v8) {
    uint64_t v10 = (uint64_t)v8;
  }
  else {
    uint64_t v10 = (uint64_t)v7;
  }
  if (v10 < 1)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    while (sub_1000EC880((uint64_t)[v5 characterAtIndex:v11], (uint64_t)objc_msgSend(v6, "characterAtIndex:", v11)))
    {
      if ((char *)v10 == ++v11)
      {
        v11 = (char *)v10;
        break;
      }
    }
  }
  if ((uint64_t)v7 >= (uint64_t)v9 && v11 == v7) {
    int64_t v13 = (int64_t)(v7 - 1);
  }
  else {
    int64_t v13 = (int64_t)v11;
  }

  return v13;
}

@end