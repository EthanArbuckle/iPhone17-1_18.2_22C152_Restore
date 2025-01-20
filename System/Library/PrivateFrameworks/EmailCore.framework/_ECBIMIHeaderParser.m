@interface _ECBIMIHeaderParser
+ (BOOL)_indicatorDataHasValidSVGProfile:(id)a3;
+ (BOOL)_versionIsValidWithScanner:(id)a3;
+ (ECBIMIData)bimiDataForHeaders:(uint64_t)a1;
+ (id)_hashFromIndicatorHashHeader:(id)a3 algorithm:(id *)a4;
+ (id)_locationFromLocationHeader:(id)a3 evidenceLocation:(id *)a4;
+ (id)_locationFromScanner:(id)a3 evidenceLocation:(id *)a4;
+ (id)_scanToNextTagForScanner:(id)a3 allowSemicolonSeparator:(BOOL)a4 value:(id *)a5;
+ (id)_scanToNextTagForScanner:(id)a3 url:(id *)a4;
@end

@implementation _ECBIMIHeaderParser

+ (ECBIMIData)bimiDataForHeaders:(uint64_t)a1
{
  id v2 = a2;
  v3 = self;
  v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@";"];
  v5 = [v2 firstHeaderForKey:@"bimi-indicator"];
  v6 = [v5 stringByTrimmingCharactersInSet:v4];
  v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v8 = objc_msgSend(v6, "ef_stringByRemovingCharactersInSet:", v7);

  v9 = [v2 firstHeaderForKey:@"bimi-location"];
  v10 = objc_msgSend(v9, "ef_stringByTrimmingTrailingCharactersInSet:", v4);

  if ([v8 length] || objc_msgSend(v10, "length"))
  {
    if (v8
      && (v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0]) != 0)
    {
      if (![v3 _indicatorDataHasValidSVGProfile:v11])
      {
        v20 = 0;
        v14 = 0;
        id v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
      int v12 = 1;
      v13 = v11;
      if (!v10) {
        goto LABEL_7;
      }
    }
    else
    {
      int v12 = 0;
      v13 = 0;
      if (!v10)
      {
LABEL_7:
        v14 = 0;
        id v15 = 0;
LABEL_10:
        if (v14) {
          int v16 = 1;
        }
        else {
          int v16 = v12;
        }
        if (v16 == 1)
        {
          v22 = v4;
          v17 = [v2 firstHeaderForKey:@"x-bimi-indicator-hash"];
          id v23 = 0;
          v18 = [v3 _hashFromIndicatorHashHeader:v17 algorithm:&v23];
          id v19 = v23;
          v20 = [[ECBIMIData alloc] initWithIndicator:v13 location:v14 evidenceLocation:v15 indicatorHash:v18 hashAlgorithm:v19];

          v11 = v13;
          v4 = v22;
        }
        else
        {
          v20 = 0;
          v14 = 0;
          v11 = v13;
        }
        goto LABEL_17;
      }
    }
    id v24 = 0;
    v14 = [v3 _locationFromLocationHeader:v10 evidenceLocation:&v24];
    id v15 = v24;
    goto LABEL_10;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

+ (BOOL)_indicatorDataHasValidSVGProfile:(id)a3
{
  id v3 = a3;
  v4 = -[_ECSVGProfileExtractor initWithSVGData:]((id *)[_ECSVGProfileExtractor alloc], v3);
  v5 = -[_ECSVGProfileExtractor namespace](v4);
  if (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", @"http://www.w3.org/2000/svg"))
  {
    v6 = -[_ECSVGProfileExtractor version](v4);
    if (objc_msgSend(v6, "ef_caseInsensitiveIsEqualToString:", @"1.2"))
    {
      v7 = -[_ECSVGProfileExtractor baseProfile](v4);
      char v8 = objc_msgSend(v7, "ef_caseInsensitiveIsEqualToString:", @"tiny-ps");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)_locationFromLocationHeader:(id)a3 evidenceLocation:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v6];
  if ([a1 _versionIsValidWithScanner:v7])
  {
    id v12 = 0;
    char v8 = [a1 _locationFromScanner:v7 evidenceLocation:&v12];
    id v9 = v12;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v8 = 0;
  id v9 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v9;
LABEL_6:
  id v10 = v8;

  return v10;
}

+ (BOOL)_versionIsValidWithScanner:(id)a3
{
  id v3 = a3;
  id v13 = 0;
  int v4 = [v3 scanUpToString:@"=" intoString:&v13];
  id v5 = v13;
  if (v4 && ([v3 scanString:@"=" intoString:0] & 1) != 0)
  {
    id v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v7 = objc_msgSend(v5, "ef_stringByTrimmingTrailingCharactersInSet:", v6);

    if ([v7 isEqualToString:@"v"])
    {
      id v12 = 0;
      LODWORD(v8) = [v3 scanUpToString:@";" intoString:&v12];
      id v9 = v12;
      if (v8)
      {
        if ([v3 scanString:@";" intoString:0])
        {
          char v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          id v10 = objc_msgSend(v9, "ef_stringByTrimmingTrailingCharactersInSet:", v8);

          LOBYTE(v8) = [v10 isEqualToString:@"BIMI1"];
          id v9 = v10;
        }
        else
        {
          LOBYTE(v8) = 0;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    v7 = v5;
  }

  return (char)v8;
}

+ (id)_locationFromScanner:(id)a3 evidenceLocation:(id *)a4
{
  id v6 = a3;
  id v18 = 0;
  v7 = [a1 _scanToNextTagForScanner:v6 url:&v18];
  id v8 = v18;
  if ([v6 isAtEnd])
  {
    if ([v7 isEqualToString:@"l"])
    {
      id v9 = v8;
    }
    else
    {
      if ([v7 isEqualToString:@"a"])
      {
        id v12 = v8;
        id v9 = 0;
        if (!a4) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      id v9 = 0;
    }
    id v12 = 0;
    if (!a4) {
      goto LABEL_13;
    }
LABEL_12:
    *a4 = v12;
    goto LABEL_13;
  }
  id v17 = 0;
  id v10 = [a1 _scanToNextTagForScanner:v6 url:&v17];
  id v11 = v17;
  if ([v6 isAtEnd]
    && ([v7 isEqualToString:@"l"]
     && (v9 = v8, id v12 = v11, ([v10 isEqualToString:@"a"] & 1) != 0)
     || [v7 isEqualToString:@"a"]
     && (v9 = v11, id v12 = v8, [v10 isEqualToString:@"l"])))
  {
    id v13 = v8;
    id v14 = v11;
  }
  else
  {
    id v9 = 0;
    id v12 = 0;
  }

  if (a4) {
    goto LABEL_12;
  }
LABEL_13:
  id v15 = v9;

  return v15;
}

+ (id)_scanToNextTagForScanner:(id)a3 url:(id *)a4
{
  id v8 = 0;
  id v5 = [a1 _scanToNextTagForScanner:a3 allowSemicolonSeparator:1 value:&v8];
  id v6 = v8;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
  }

  return v5;
}

+ (id)_hashFromIndicatorHashHeader:(id)a3 algorithm:(id *)a4
{
  id v16 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v16];
  id v6 = 0;
  v7 = 0;
  while (([v5 isAtEnd] & 1) == 0)
  {
    id v17 = 0;
    id v8 = [a1 _scanToNextTagForScanner:v5 allowSemicolonSeparator:0 value:&v17];
    id v9 = v17;
    if ([v8 isEqualToString:@"h"])
    {
      id v10 = v6;
      id v6 = v9;
      id v11 = v7;
    }
    else
    {
      id v10 = v7;
      id v11 = v9;
      if (![v8 isEqualToString:@"a"]) {
        goto LABEL_7;
      }
    }
    id v12 = v9;

    v7 = v11;
LABEL_7:
  }
  if (v6 && v7)
  {
    if (a4) {
      *a4 = v7;
    }
    id v13 = v6;
  }
  else
  {
    id v13 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v13;
}

+ (id)_scanToNextTagForScanner:(id)a3 allowSemicolonSeparator:(BOOL)a4 value:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v22 = 0;
  int v8 = [v7 scanUpToString:@"=" intoString:&v22];
  id v9 = v22;
  if (v8 && ([v7 scanString:@"=" intoString:0] & 1) != 0)
  {
    id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v11 = objc_msgSend(v9, "ef_stringByTrimmingTrailingCharactersInSet:", v10);

    id v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v13 = [v12 invertedSet];
    id v21 = 0;
    char v14 = [v7 scanCharactersFromSet:v13 intoString:&v21];
    id v15 = v21;

    if (v14)
    {
      id v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      [v7 scanCharactersFromSet:v16 intoString:0];

      if (v6)
      {
        id v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@";"];
        [v7 scanCharactersFromSet:v17 intoString:0];
        uint64_t v18 = objc_msgSend(v15, "ef_stringByTrimmingTrailingCharactersInSet:", v17);

        id v15 = (id)v18;
      }
      if (a5) {
        *a5 = v15;
      }
      id v19 = v11;
    }
    else
    {
      id v19 = 0;
      if (a5) {
        *a5 = 0;
      }
    }
  }
  else
  {
    id v19 = 0;
    if (a5) {
      *a5 = 0;
    }
    id v11 = v9;
  }

  return v19;
}

@end