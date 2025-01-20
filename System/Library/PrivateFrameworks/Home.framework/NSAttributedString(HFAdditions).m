@interface NSAttributedString(HFAdditions)
+ (id)hf_attributedLinkStringForAttributedString:()HFAdditions linkString:linkURL:;
+ (id)hf_attributedLinkStringForString:()HFAdditions linkString:linkURL:attributes:additionalLinkAttributes:;
+ (id)hf_attributedString:()HFAdditions withAppendedLinkString:linkURL:;
+ (id)hf_attributedStringForString:()HFAdditions withAppendedString:asURL:withAttributes:;
+ (id)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:forcePluralAgreement:;
+ (id)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:forcePluralAgreement:markdownFormat:;
+ (id)hf_attributedStringWithString:()HFAdditions insertingSystemImageNamed:;
+ (id)hf_attributedStringWithSystemImageNamed:()HFAdditions title:isRTL:;
+ (id)hf_loadFromHTMLWithString:()HFAdditions options:;
+ (id)hf_safeAttributedStringWithHTML:()HFAdditions attributes:;
+ (uint64_t)hf_attributedLinkStringForString:()HFAdditions linkString:linkURL:;
+ (uint64_t)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:;
- (double)hf_scaleFactorForBoundingSize:()HFAdditions minimumScaleFactor:maximumNumberOfLines:;
- (id)hf_attributedStringByTrimmingCharactersInCharacterSet:()HFAdditions;
- (id)hf_attributedStringWithDefaultAttributes:()HFAdditions;
- (id)hf_attributedStringWithDefaultAttributes:()HFAdditions inRange:;
- (id)hf_scaledAttributedStringWithBoundingSize:()HFAdditions minimumScaleFactor:maximumNumberOfLines:;
- (uint64_t)hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters;
- (uint64_t)hf_attributedStringScaledByFactor:()HFAdditions;
@end

@implementation NSAttributedString(HFAdditions)

+ (id)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:forcePluralAgreement:markdownFormat:
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v11 = a3;
  id v42 = a4;
  id v41 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(__CFString *)v11 length])
  {
    id v29 = objc_alloc(MEMORY[0x263F086A0]);
    v30 = &stru_26C081158;
LABEL_21:
    v28 = (void *)[v29 initWithString:v30];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![v42 length]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v41 string],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 length],
        v12,
        !v13))
  {
    id v29 = objc_alloc(MEMORY[0x263F086A0]);
    v30 = v11;
    goto LABEL_21;
  }
  if ([(__CFString *)v11 containsString:@"%"])
  {
    v14 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" "];
    v39 = v11;
    v15 = [(__CFString *)v11 componentsSeparatedByCharactersInSet:v14];

    v16 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v15;
    uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v44;
      uint64_t v20 = *MEMORY[0x263F08150];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v22 containsString:@"%"])
          {
            objc_msgSend(v16, "na_safeAddObject:", v22);
          }
          else
          {
            v23 = (void *)MEMORY[0x263F086A0];
            id v62 = v42;
            uint64_t v63 = v20;
            v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
            v64 = v24;
            v25 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
            v26 = objc_msgSend(v23, "localizedAttributedStringWithFormat:context:", v41, v25, v22);
            v27 = [v26 string];

            objc_msgSend(v16, "na_safeAddObject:", v27);
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v65 count:16];
      }
      while (v18);
    }

    v11 = [v16 componentsJoinedByString:@" "];

    v28 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11];
  }
  else
  {
    v32 = v11;
    v33 = (void *)MEMORY[0x263F086A0];
    uint64_t v34 = *MEMORY[0x263F08150];
    id v59 = v42;
    uint64_t v60 = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    v61 = v35;
    v36 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    v28 = objc_msgSend(v33, "localizedAttributedStringWithFormat:context:", v41, v36, v32);

    v37 = HFLogForCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413570;
      uint64_t v48 = a1;
      __int16 v49 = 2112;
      v50 = v38;
      __int16 v51 = 2112;
      id v52 = v42;
      __int16 v53 = 2112;
      v54 = v32;
      __int16 v55 = 2112;
      v56 = v28;
      __int16 v57 = 1024;
      int v58 = a5;
      _os_log_debug_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEBUG, "%@: %@ accessoryName: %@ | accessoryStatus: %@ | outputString: %@ | forcePluralAgreement:%{BOOL}d", buf, 0x3Au);
    }
    v11 = v32;
  }
LABEL_22:

  return v28;
}

+ (id)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:forcePluralAgreement:
{
  v7 = (void *)MEMORY[0x263F086E0];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 mainBundle];
  if (a5) {
    v11 = @"HFAccessoryStatusInflectionWithNameFormat_PluralAgreement";
  }
  else {
    v11 = @"HFAccessoryStatusInflectionWithNameFormat";
  }
  v12 = _HFLocalizedStringWithDefaultValue(v11, v11, 1);
  uint64_t v13 = [v10 localizedAttributedStringForKey:v12 value:&stru_26C081158 table:0];

  v14 = objc_msgSend(MEMORY[0x263F086A0], "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:markdownFormat:", v9, v8, a5, v13);

  return v14;
}

+ (uint64_t)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:
{
  return objc_msgSend(MEMORY[0x263F086A0], "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", a3, a4, 0);
}

- (double)hf_scaleFactorForBoundingSize:()HFAdditions minimumScaleFactor:maximumNumberOfLines:
{
  id v11 = objc_alloc_init(MEMORY[0x263F1C368]);
  [v11 setMinimumScaleFactor:a4];
  [v11 setMaximumNumberOfLines:a6];
  objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, v11, a2, a3);
  [v11 actualScaleFactor];
  double v13 = v12;

  return v13;
}

- (uint64_t)hf_attributedStringScaledByFactor:()HFAdditions
{
  uint64_t v4 = [a1 length];
  return objc_msgSend(a1, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v4, a2);
}

- (id)hf_scaledAttributedStringWithBoundingSize:()HFAdditions minimumScaleFactor:maximumNumberOfLines:
{
  objc_msgSend(a1, "hf_scaleFactorForBoundingSize:minimumScaleFactor:maximumNumberOfLines:");
  double v3 = v2;
  id v4 = a1;
  v5 = v4;
  if (v3 < 1.0)
  {
    uint64_t v6 = objc_msgSend(v4, "hf_attributedStringScaledByFactor:", v3);

    v5 = (void *)v6;
  }
  return v5;
}

+ (id)hf_attributedStringForString:()HFAdditions withAppendedString:asURL:withAttributes:
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  double v12 = [a3 stringByAppendingString:v11];
  double v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v12 attributes:v10];

  uint64_t v14 = [v12 rangeOfString:v11 options:4];
  uint64_t v16 = v15;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = *MEMORY[0x263F1C258];
    v20[0] = v9;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v13, "addAttributes:range:", v17, v14, v16);
  }
  return v13;
}

+ (id)hf_attributedString:()HFAdditions withAppendedLinkString:linkURL:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 stringByAppendingString:v9];
  id v11 = objc_msgSend(a1, "hf_attributedLinkStringForString:linkString:linkURL:", v10, v9, v8);

  return v11;
}

+ (uint64_t)hf_attributedLinkStringForString:()HFAdditions linkString:linkURL:
{
  return objc_msgSend(MEMORY[0x263F086A0], "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", a3, a4, a5, 0, 0);
}

+ (id)hf_attributedLinkStringForAttributedString:()HFAdditions linkString:linkURL:
{
  v22[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v7];
  id v11 = [v7 string];
  uint64_t v12 = [v11 rangeOfString:v8 options:4];
  uint64_t v14 = v13;

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [v7 string];
    NSLog(&cfstr_LinkstringIsEx.isa, v8, v15);
  }
  else
  {
    v21[0] = *MEMORY[0x263F1C240];
    uint64_t v16 = objc_msgSend(MEMORY[0x263F1C550], "hf_keyColor");
    uint64_t v17 = *MEMORY[0x263F1C258];
    v22[0] = v16;
    v22[1] = v9;
    uint64_t v18 = *MEMORY[0x263F1C2D8];
    v21[1] = v17;
    v21[2] = v18;
    v22[2] = &unk_26C0F6B70;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

    objc_msgSend(v10, "addAttributes:range:", v19, v12, v14);
  }

  return v10;
}

+ (id)hf_attributedLinkStringForString:()HFAdditions linkString:linkURL:attributes:additionalLinkAttributes:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = (objc_class *)MEMORY[0x263F089B8];
  id v16 = a6;
  uint64_t v17 = (void *)[[v15 alloc] initWithString:v11 attributes:v16];

  uint64_t v18 = [v11 rangeOfString:v12 options:4];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(&cfstr_LinkstringIsEx.isa, v12, v11);
  }
  else
  {
    uint64_t v20 = v18;
    uint64_t v21 = v19;
    v22 = [MEMORY[0x263EFF9A0] dictionary];
    [v22 setObject:&unk_26C0F6B70 forKey:*MEMORY[0x263F1C2D8]];
    v23 = objc_msgSend(MEMORY[0x263F1C550], "hf_keyColor");
    [v22 setObject:v23 forKey:*MEMORY[0x263F1C240]];

    objc_msgSend(v22, "na_safeSetObject:forKey:", v13, *MEMORY[0x263F1C258]);
    if (v14) {
      [v22 addEntriesFromDictionary:v14];
    }
    objc_msgSend(v17, "addAttributes:range:", v22, v20, v21);
  }
  return v17;
}

- (id)hf_attributedStringWithDefaultAttributes:()HFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_attributedStringWithDefaultAttributes:inRange:", v4, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (id)hf_attributedStringWithDefaultAttributes:()HFAdditions inRange:
{
  id v8 = a3;
  id v9 = objc_alloc(MEMORY[0x263F089B8]);
  id v10 = [a1 string];
  id v11 = (void *)[v9 initWithString:v10 attributes:v8];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke;
  v24[3] = &unk_2640962F0;
  id v12 = v11;
  id v25 = v12;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0, v24);
  uint64_t v13 = *MEMORY[0x263F1C238];
  id v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F1C238]];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x263F1C6C8];
    id v16 = [v8 objectForKeyedSubscript:v13];
    uint64_t v17 = [v15 configurationWithFont:v16];

    uint64_t v18 = *MEMORY[0x263F1C208];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke_2;
    void v21[3] = &unk_264096318;
    id v22 = v17;
    id v23 = v12;
    id v19 = v17;
    objc_msgSend(v23, "enumerateAttribute:inRange:options:usingBlock:", v18, a4, a5, 0, v21);
  }
  return v12;
}

- (id)hf_attributedStringByTrimmingCharactersInCharacterSet:()HFAdditions
{
  id v4 = a3;
  v5 = [a1 string];
  uint64_t v6 = [v4 invertedSet];

  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26C081158];
  }
  else
  {
    uint64_t v9 = v7;
    uint64_t v10 = [v5 rangeOfCharacterFromSet:v6 options:4];
    uint64_t v8 = objc_msgSend(a1, "attributedSubstringFromRange:", v9, v11 - v9 + v10);
  }
  id v12 = (void *)v8;

  return v12;
}

- (uint64_t)hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters
{
  if (!hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters)
  {
    double v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    double v3 = (void *)[v2 mutableCopy];

    [v3 addCharactersInString:@"\uFFFC"];
    uint64_t v4 = [v3 copy];
    v5 = (void *)hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters;
    hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters = v4;
  }
  return objc_msgSend(a1, "hf_attributedStringByTrimmingCharactersInCharacterSet:");
}

+ (id)hf_loadFromHTMLWithString:()HFAdditions options:
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x263F58190];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke;
  v8[3] = &unk_26408E4E0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 futureWithBlock:v8];

  return v6;
}

+ (id)hf_safeAttributedStringWithHTML:()HFAdditions attributes:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", @"</?\\s*i?frame[^>]*>", &stru_26C081158, 1025, 0, objc_msgSend(v7, "length"));

  id v9 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", @"</?\\s*img[^>]*>", &stru_26C081158, 1025, 0, objc_msgSend(v8, "length"));

  uint64_t v10 = objc_msgSend(a1, "hf_loadFromHTMLWithString:options:", v9, MEMORY[0x263EFFA78]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke;
  v15[3] = &unk_264096390;
  id v16 = v6;
  id v11 = v6;
  id v12 = [v10 flatMap:v15];
  uint64_t v13 = [v12 recover:&__block_literal_global_116];

  return v13;
}

+ (id)hf_attributedStringWithString:()HFAdditions insertingSystemImageNamed:
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F089B8];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithString:v7];
  uint64_t v9 = [v7 rangeOfString:@"%@"];
  uint64_t v11 = v10;

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [MEMORY[0x263F1C6B0] systemImageNamed:v5];
    uint64_t v13 = [MEMORY[0x263F1C370] textAttachmentWithImage:v12];
    id v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v13];
    objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v9, v11, v14);
  }
  uint64_t v15 = (void *)[v8 copy];

  return v15;
}

+ (id)hf_attributedStringWithSystemImageNamed:()HFAdditions title:isRTL:
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F1C370]);
    uint64_t v10 = [MEMORY[0x263F1C6B0] systemImageNamed:v7];
    uint64_t v11 = [v10 imageWithRenderingMode:2];
    [v9 setImage:v11];

    id v12 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v9];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (a5)
    {
      id v14 = [NSString stringWithFormat:@"%@ ", v8];
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v14];
      [v13 insertAttributedString:v15 atIndex:0];
    }
    else
    {
      id v14 = [NSString stringWithFormat:@" %@", v8];
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v14];
      [v13 appendAttributedString:v15];
    }

    id v16 = (void *)[v13 copy];
  }
  else
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26C081158];
  }

  return v16;
}

@end