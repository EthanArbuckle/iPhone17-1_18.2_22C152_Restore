@interface NSAttributedString(MKAttributedFormat)
+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:attributes:;
+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:attributes:error:;
+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:;
+ (void)_handleFormattingError:()MKAttributedFormat forString:;
- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat;
- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:;
- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:;
- (uint64_t)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:error:;
- (uint64_t)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat error:;
@end

@implementation NSAttributedString(MKAttributedFormat)

+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:attributes:error:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[[a1 alloc] initWithString:v12 attributes:v10];

  v14 = objc_msgSend(v13, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:error:", v11, v10, a6);

  return v14;
}

- (uint64_t)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat error:
{
  return objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:error:", a3, 0, a4);
}

- (uint64_t)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:error:
{
  return objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:", a3, a4, @"%{", @"}@", a5);
}

+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[[a1 alloc] initWithString:v18 attributes:v16];

  v20 = objc_msgSend(v19, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:", v17, v16, v15, v14, a8);

  return v20;
}

- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (id)MEMORY[0x1E4F1CC08];
  if (v12) {
    id v15 = v12;
  }
  v36 = v15;
  id v16 = [v13 substringToIndex:1];
  v35 = v13;
  id v17 = [v13 substringFromIndex:1];
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v19 = objc_alloc(MEMORY[0x1E4F28FE8]);
  v20 = [a1 string];
  v21 = (void *)[v19 initWithString:v20];

  [v21 setCharactersToBeSkipped:0];
  if ([v21 isAtEnd])
  {
LABEL_21:
    v30 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAttributedString:v18];
    goto LABEL_22;
  }
  uint64_t v22 = 0;
  while (1)
  {
    [v21 scanUpToString:v16 intoString:0];
    uint64_t v23 = [v21 scanLocation];
    if (v23 != v22)
    {
      v24 = objc_msgSend(a1, "attributedSubstringFromRange:", v22, v23 - v22);
      [v18 appendAttributedString:v24];
    }
    if (![v21 scanString:v16 intoString:0]) {
      goto LABEL_20;
    }
    if (![v21 scanString:v16 intoString:0]) {
      break;
    }
    objc_msgSend(a1, "attributedSubstringFromRange:", objc_msgSend(v21, "scanLocation") - 1, 1);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    [v18 appendAttributedString:v25];
LABEL_19:

LABEL_20:
    uint64_t v22 = [v21 scanLocation];
    if ([v21 isAtEnd]) {
      goto LABEL_21;
    }
  }
  if ([v17 length] && !objc_msgSend(v21, "scanString:intoString:", v17, 0)) {
    goto LABEL_20;
  }
  id v37 = 0;
  int v26 = [v21 scanUpToString:v14 intoString:&v37];
  id v25 = v37;
  int v27 = [v21 scanString:v14 intoString:0];
  if (v26 && v27)
  {
    v28 = [v11 objectForKeyedSubscript:v25];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 appendAttributedString:v28];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a7)
        {
          v40[0] = @"MKStringAttributedFormatErrorReplacementTokensKey";
          v40[1] = @"MKStringAttributedFormatErrorReplacementTokensKey";
          v41[0] = v11;
          v41[1] = v25;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
          *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKStringAttributedFormatErrorDomain" code:0 userInfo:v33];
        }
        goto LABEL_29;
      }
      v29 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v28 attributes:v36];
      [v18 appendAttributedString:v29];
    }
    goto LABEL_19;
  }
  if (!a7) {
    goto LABEL_30;
  }
  v38 = @"MKStringAttributedFormatErrorReplacementTokensKey";
  v32 = [NSNumber numberWithUnsignedInteger:v23];
  v39 = v32;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

  *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKStringAttributedFormatErrorDomain" code:1 userInfo:v28];
LABEL_29:

LABEL_30:
  v30 = 0;
LABEL_22:

  return v30;
}

+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:attributes:
{
  id v12 = 0;
  id v8 = a3;
  v9 = objc_msgSend(a1, "_mapkit_attributedStringWithBindingFormat:replacements:attributes:error:", v8, a4, a5, &v12);
  id v10 = v12;
  [a1 _handleFormattingError:v10 forString:v8];

  return v9;
}

- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:
{
  id v10 = 0;
  v5 = objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:error:", a3, a4, &v10);
  id v6 = v10;
  v7 = objc_opt_class();
  id v8 = [a1 string];
  [v7 _handleFormattingError:v6 forString:v8];

  return v5;
}

- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat
{
  id v9 = 0;
  v4 = objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:error:", a3, &v9);
  id v5 = v9;
  id v6 = objc_opt_class();
  v7 = [a1 string];
  [v6 _handleFormattingError:v5 forString:v7];

  return v4;
}

+ (void)_handleFormattingError:()MKAttributedFormat forString:
{
  id v11 = a3;
  id v5 = a4;
  if (v11)
  {
    if ([v11 code])
    {
      if ([v11 code] != 1) {
        goto LABEL_7;
      }
      id v6 = [v11 userInfo];
      v7 = [v6 objectForKeyedSubscript:@"MKStringAttributedFormatErrorReplacementTokensKey"];

      [MEMORY[0x1E4F1CA00] raise:@"MapsBindingFormatStringException", @"The format string '%@' has an unterminated replacement marker starting at %@.", v5, v7 format];
    }
    else
    {
      id v8 = [v11 userInfo];
      v7 = [v8 objectForKeyedSubscript:@"MKStringAttributedFormatErrorReplacementTokensKey"];

      id v9 = [v11 userInfo];
      id v10 = [v9 objectForKeyedSubscript:@"MKStringAttributedFormatErrorReplacementTokensKey"];

      [MEMORY[0x1E4F1CA00] raise:@"MapsBindingFormatArgumentException", @"The format string '%@' has specified a key '%@', but that key is not present or not a string or attributed string in the replacements dictionary (value: %@)", v5, v7, v10 format];
    }
  }
LABEL_7:
}

@end