@interface _ECHeaderAuthenticationResultsParser
+ (BOOL)_propertiesWithScanner:(id)a3 intoArray:(id *)a4;
+ (BOOL)_scanQuotedValueWithScanner:(id)a3 intoString:(id *)a4;
+ (BOOL)_scanToCFWSOrEqualWithScanner:(id)a3 intoString:(id *)a4;
+ (BOOL)_scanToCFWSOrPeriodOrSemicolonWithScanner:(id)a3 intoString:(id *)a4;
+ (BOOL)_scanToCFWSOrSemicolonWithScanner:(id)a3 intoString:(id *)a4;
+ (BOOL)_skipCFWSWithScanner:(id)a3;
+ (BOOL)_statementWithScanner:(id)a3 intoStatement:(id *)a4;
+ (BOOL)_statementsWithScanner:(id)a3 intoArray:(id *)a4;
+ (id)_authenticationResultsForHeaderBodies:(id)a3;
+ (id)authenticationResultsForHeaders:(uint64_t)a1;
+ (id)authenticationResultsForRawHeaders:(uint64_t)a1;
+ (int64_t)_versionWithScanner:(id)a3;
@end

@implementation _ECHeaderAuthenticationResultsParser

+ (id)authenticationResultsForHeaders:(uint64_t)a1
{
  id v2 = a2;
  v3 = self;
  v4 = [v2 headersForKey:@"authentication-results"];
  v5 = [v3 _authenticationResultsForHeaderBodies:v4];

  return v5;
}

+ (id)authenticationResultsForRawHeaders:(uint64_t)a1
{
  id v2 = a2;
  v3 = self;
  v4 = [v2 headersForKey:@"authentication-results"];
  v5 = objc_msgSend(v4, "ef_mapSelector:", sel_body);

  v6 = [v3 _authenticationResultsForHeaderBodies:v5];

  return v6;
}

+ (id)_authenticationResultsForHeaderBodies:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke;
  v5[3] = &__block_descriptor_40_e49___ECHeaderAuthenticationResults_16__0__NSString_8l;
  v5[4] = a1;
  v3 = objc_msgSend(a3, "ef_compactMap:", v5);
  return v3;
}

+ (BOOL)_skipCFWSWithScanner:(id)a3
{
  id v3 = a3;
  if (_skipCFWSWithScanner__onceToken != -1) {
    dispatch_once(&_skipCFWSWithScanner__onceToken, &__block_literal_global_106);
  }
  v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v3 scanCharactersFromSet:v4 intoString:0];

  v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    id v14 = v5;
    int v7 = [v3 scanCharactersFromSet:_skipCFWSWithScanner__parentheses intoString:&v14];
    id v8 = v14;

    if (!v7)
    {
      BOOL v12 = v6 == 0;
      goto LABEL_17;
    }
    uint64_t v9 = [v8 length];
    if (v9) {
      break;
    }
LABEL_12:
    if (v6)
    {
      [v3 scanUpToCharactersFromSet:_skipCFWSWithScanner__parentheses intoString:0];
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      [v3 scanCharactersFromSet:v11 intoString:0];
    }
    v5 = v8;
  }
  uint64_t v10 = 0;
  while ([v8 characterAtIndex:v10] == 40)
  {
    ++v6;
LABEL_11:
    if (v9 == ++v10) {
      goto LABEL_12;
    }
  }
  if (v6)
  {
    --v6;
    goto LABEL_11;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

+ (BOOL)_scanToCFWSOrSemicolonWithScanner:(id)a3 intoString:(id *)a4
{
  id v5 = a3;
  if (_scanToCFWSOrSemicolonWithScanner_intoString__onceToken != -1) {
    dispatch_once(&_scanToCFWSOrSemicolonWithScanner_intoString__onceToken, &__block_literal_global_112);
  }
  char v6 = [v5 scanUpToCharactersFromSet:_scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon intoString:a4];

  return v6;
}

+ (BOOL)_scanQuotedValueWithScanner:(id)a3 intoString:(id *)a4
{
  id v6 = a3;
  if (_scanQuotedValueWithScanner_intoString__onceToken != -1) {
    dispatch_once(&_scanQuotedValueWithScanner_intoString__onceToken, &__block_literal_global_118);
  }
  if ([v6 scanCharactersFromSet:_scanQuotedValueWithScanner_intoString__quotes intoString:0])
  {
    if (![v6 scanUpToCharactersFromSet:_scanQuotedValueWithScanner_intoString__quotes intoString:a4])
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }
    char v7 = [v6 scanCharactersFromSet:_scanQuotedValueWithScanner_intoString__quotes intoString:0];
  }
  else
  {
    char v7 = [a1 _scanToCFWSOrSemicolonWithScanner:v6 intoString:a4];
  }
  BOOL v8 = v7;
LABEL_9:

  return v8;
}

+ (BOOL)_scanToCFWSOrEqualWithScanner:(id)a3 intoString:(id *)a4
{
  id v5 = a3;
  if (_scanToCFWSOrEqualWithScanner_intoString__onceToken != -1) {
    dispatch_once(&_scanToCFWSOrEqualWithScanner_intoString__onceToken, &__block_literal_global_123);
  }
  char v6 = [v5 scanUpToCharactersFromSet:_scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual intoString:a4];

  return v6;
}

+ (BOOL)_scanToCFWSOrPeriodOrSemicolonWithScanner:(id)a3 intoString:(id *)a4
{
  id v5 = a3;
  if (_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__onceToken != -1) {
    dispatch_once(&_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__onceToken, &__block_literal_global_128);
  }
  char v6 = [v5 scanUpToCharactersFromSet:_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon intoString:a4];

  return v6;
}

+ (int64_t)_versionWithScanner:(id)a3
{
  int64_t v4 = 1;
  if ([a3 scanInteger:&v4]) {
    return v4;
  }
  else {
    return 1;
  }
}

+ (BOOL)_statementsWithScanner:(id)a3 intoArray:(id *)a4
{
  id v6 = a3;
  if ([a1 _skipCFWSWithScanner:v6]
    && [v6 scanString:@";" intoString:0]
    && ([a1 _skipCFWSWithScanner:v6] & 1) != 0)
  {
    if ([v6 scanString:@"none" intoString:0])
    {
      if (a4) {
        *a4 = (id)MEMORY[0x1E4F1CBF0];
      }
      LOBYTE(v7) = 1;
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = 0;
      while (1)
      {
        id v13 = v10;
        int v7 = [a1 _statementWithScanner:v6 intoStatement:&v13];
        id v11 = v13;

        if (v11) {
          int v12 = v7;
        }
        else {
          int v12 = 0;
        }
        if (v12 != 1) {
          goto LABEL_20;
        }
        [v9 addObject:v11];
        if (([a1 _skipCFWSWithScanner:v6] & 1) == 0) {
          goto LABEL_19;
        }
        if ([v6 isAtEnd]) {
          break;
        }
        if ([v6 scanString:@";" intoString:0])
        {
          uint64_t v10 = v11;
          if ([a1 _skipCFWSWithScanner:v6]) {
            continue;
          }
        }
LABEL_19:
        LOBYTE(v7) = 0;
LABEL_20:
        if (!a4) {
          goto LABEL_22;
        }
LABEL_21:
        objc_msgSend(v9, "ef_notEmpty");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      LOBYTE(v7) = 1;
      if (a4) {
        goto LABEL_21;
      }
LABEL_22:
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)_statementWithScanner:(id)a3 intoStatement:(id *)a4
{
  id v6 = a3;
  id v20 = 0;
  int v7 = [a1 _scanToCFWSOrEqualWithScanner:v6 intoString:&v20];
  id v8 = v20;
  if (v7
    && [a1 _skipCFWSWithScanner:v6]
    && [v6 scanString:@"=" intoString:0]
    && [a1 _skipCFWSWithScanner:v6])
  {
    id v19 = 0;
    int v9 = [a1 _scanQuotedValueWithScanner:v6 intoString:&v19];
    id v10 = v19;
    if (v9 && ([a1 _skipCFWSWithScanner:v6] & 1) != 0)
    {
      if ([v6 scanString:@"reason" intoString:0])
      {
        if (![a1 _skipCFWSWithScanner:v6]
          || ![v6 scanString:@"=" intoString:0]
          || ![a1 _skipCFWSWithScanner:v6])
        {
          char v13 = 0;
          id v12 = 0;
          goto LABEL_25;
        }
        id v18 = 0;
        int v11 = [a1 _scanQuotedValueWithScanner:v6 intoString:&v18];
        id v12 = v18;
        if (!v11 || ([a1 _skipCFWSWithScanner:v6] & 1) == 0)
        {
          char v13 = 0;
LABEL_25:

          goto LABEL_15;
        }
      }
      else
      {
        id v12 = 0;
      }
      id v17 = 0;
      char v13 = [a1 _propertiesWithScanner:v6 intoArray:&v17];
      id v15 = v17;
      if (a4) {
        char v16 = v13;
      }
      else {
        char v16 = 0;
      }
      if (v16) {
        *a4 = [[ECHeaderAuthenticationResultStatement alloc] initWithMethod:v8 result:v10 reason:v12 properties:v15];
      }

      goto LABEL_25;
    }
    char v13 = 0;
  }
  else
  {
    char v13 = 0;
    id v10 = 0;
  }
LABEL_15:

  return v13;
}

+ (BOOL)_propertiesWithScanner:(id)a3 intoArray:(id *)a4
{
  id v5 = a3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (i = 0; ; i = v8)
  {
    id v22 = i;
    int v7 = [a1 _scanToCFWSOrPeriodOrSemicolonWithScanner:v5 intoString:&v22];
    id v8 = v22;

    if (!v7) {
      break;
    }
    if (([a1 _skipCFWSWithScanner:v5] & 1) == 0) {
      goto LABEL_16;
    }
    if ([v5 scanString:@"." intoString:0])
    {
      if (![a1 _skipCFWSWithScanner:v5])
      {
LABEL_16:
        id v10 = 0;
LABEL_17:
        id v12 = 0;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      id v21 = 0;
      int v9 = [a1 _scanToCFWSOrEqualWithScanner:v5 intoString:&v21];
      id v10 = v21;
      if (!v9
        || ![a1 _skipCFWSWithScanner:v5]
        || ![v5 scanString:@"=" intoString:0]
        || ![a1 _skipCFWSWithScanner:v5])
      {
        goto LABEL_17;
      }
      id v20 = 0;
      int v11 = [a1 _scanQuotedValueWithScanner:v5 intoString:&v20];
      id v12 = v20;
      if (!v11 || ![a1 _skipCFWSWithScanner:v5]) {
        goto LABEL_18;
      }
      char v13 = [[ECHeaderAuthenticationResultProperty alloc] initWithPropertyType:v8 property:v10 value:v12];
      [v19 addObject:v13];
    }
    else
    {
      [v8 componentsSeparatedByString:@"="];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if ([v10 count] != 2) {
        goto LABEL_19;
      }
      id v14 = [v10 firstObject];
      id v15 = [v14 lowercaseString];
      char v16 = [v15 hasPrefix:@"x-"];

      if ((v16 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  if (a4) {
    *a4 = v19;
  }
LABEL_20:

  return v7 ^ 1;
}

@end