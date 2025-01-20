@interface _NBRegExMatcher
- (BOOL)matchNationalNumber:(id)a3 phoneNumberDesc:(id)a4 allowsPrefixMatch:(BOOL)a5;
@end

@implementation _NBRegExMatcher

- (BOOL)matchNationalNumber:(id)a3 phoneNumberDesc:(id)a4 allowsPrefixMatch:(BOOL)a5
{
  id v7 = a3;
  v8 = [a4 nationalNumberPattern];
  if ([v8 length])
  {
    v9 = +[_NBPhoneNumberUtil sharedInstance];
    v10 = [v9 entireRegularExpressionWithPattern:v8 options:0 error:0];

    if (v10)
    {
      uint64_t v11 = [v7 length];
      v12 = +[_NBRegularExpressionCache sharedInstance];
      v13 = [v12 regularExpressionForPattern:v8 error:0];

      if (v13)
      {
        v14 = objc_msgSend(v13, "firstMatchInString:options:range:", v7, 4, 0, v11);
        if ([v14 numberOfRanges])
        {
          v15 = objc_msgSend(v10, "firstMatchInString:options:range:", v7, 4, 0, v11);
          v16 = v15;
          BOOL v17 = a5 || [v15 numberOfRanges] != 0;
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end