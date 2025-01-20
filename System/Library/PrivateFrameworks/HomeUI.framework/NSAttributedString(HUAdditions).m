@interface NSAttributedString(HUAdditions)
+ (id)hu_attributedLinkStringForAttributedString:()HUAdditions linkString:linkURL:;
+ (id)hu_attributedLinkStringForString:()HUAdditions linkString:linkURL:attributes:additionalLinkAttributes:;
+ (id)hu_attributedString:()HUAdditions withAppendedLinkString:linkURL:;
+ (id)hu_attributedStringForString:()HUAdditions withAppendedString:asURL:withAttributes:;
+ (id)hu_attributedStringWithSystemImageNamed:()HUAdditions title:isRTL:;
+ (id)hu_safeAttributedStringWithHTML:()HUAdditions attributes:;
+ (uint64_t)hu_attributedLinkStringForString:()HUAdditions linkString:linkURL:;
- (double)hu_scaleFactorForBoundingSize:()HUAdditions minimumScaleFactor:maximumNumberOfLines:;
- (id)hu_attributedStringByTrimmingCharactersInCharacterSet:()HUAdditions;
- (id)hu_attributedStringWithDefaultAttributes:()HUAdditions;
- (id)hu_attributedStringWithDefaultAttributes:()HUAdditions inRange:;
- (id)hu_scaledAttributedStringWithBoundingSize:()HUAdditions minimumScaleFactor:maximumNumberOfLines:;
- (uint64_t)hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters;
- (uint64_t)hu_attributedStringScaledByFactor:()HUAdditions;
@end

@implementation NSAttributedString(HUAdditions)

- (double)hu_scaleFactorForBoundingSize:()HUAdditions minimumScaleFactor:maximumNumberOfLines:
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F42688]);
  [v11 setMinimumScaleFactor:a4];
  [v11 setMaximumNumberOfLines:a6];
  objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, v11, a2, a3);
  [v11 actualScaleFactor];
  double v13 = v12;

  return v13;
}

- (uint64_t)hu_attributedStringScaledByFactor:()HUAdditions
{
  uint64_t v4 = [a1 length];

  return objc_msgSend(a1, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v4, a2);
}

- (id)hu_scaledAttributedStringWithBoundingSize:()HUAdditions minimumScaleFactor:maximumNumberOfLines:
{
  objc_msgSend(a1, "hu_scaleFactorForBoundingSize:minimumScaleFactor:maximumNumberOfLines:");
  double v3 = v2;
  id v4 = a1;
  v5 = v4;
  if (v3 < 1.0)
  {
    uint64_t v6 = objc_msgSend(v4, "hu_attributedStringScaledByFactor:", v3);

    v5 = (void *)v6;
  }

  return v5;
}

+ (id)hu_attributedStringForString:()HUAdditions withAppendedString:asURL:withAttributes:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  double v12 = [a3 stringByAppendingString:v11];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v10];

  uint64_t v14 = [v12 rangeOfString:v11 options:4];
  uint64_t v16 = v15;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = *MEMORY[0x1E4F42530];
    v20[0] = v9;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v13, "addAttributes:range:", v17, v14, v16);
  }

  return v13;
}

+ (id)hu_attributedString:()HUAdditions withAppendedLinkString:linkURL:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 stringByAppendingString:v9];
  id v11 = objc_msgSend(a1, "hu_attributedLinkStringForString:linkString:linkURL:", v10, v9, v8);

  return v11;
}

+ (uint64_t)hu_attributedLinkStringForString:()HUAdditions linkString:linkURL:
{
  return objc_msgSend(MEMORY[0x1E4F28B18], "hu_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", a3, a4, a5, 0, 0);
}

+ (id)hu_attributedLinkStringForAttributedString:()HUAdditions linkString:linkURL:
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v7];
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
    uint64_t v16 = *MEMORY[0x1E4F42530];
    v19[0] = *MEMORY[0x1E4F425C8];
    v19[1] = v16;
    v20[0] = &unk_1F19B4C88;
    v20[1] = v9;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    objc_msgSend(v10, "addAttributes:range:", v17, v12, v14);
  }

  return v10;
}

+ (id)hu_attributedLinkStringForString:()HUAdditions linkString:linkURL:attributes:additionalLinkAttributes:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = (objc_class *)MEMORY[0x1E4F28E48];
  id v16 = a6;
  v17 = (void *)[[v15 alloc] initWithString:v11 attributes:v16];

  uint64_t v18 = [v11 rangeOfString:v12 options:4];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(&cfstr_LinkstringIsEx.isa, v12, v11);
  }
  else
  {
    uint64_t v20 = v18;
    uint64_t v21 = v19;
    v22 = [MEMORY[0x1E4F1CA60] dictionary];
    [v22 setObject:&unk_1F19B4C88 forKey:*MEMORY[0x1E4F425C8]];
    v23 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [v22 setObject:v23 forKey:*MEMORY[0x1E4F42510]];

    objc_msgSend(v22, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E4F42530]);
    if (v14) {
      [v22 addEntriesFromDictionary:v14];
    }
    objc_msgSend(v17, "addAttributes:range:", v22, v20, v21);
  }

  return v17;
}

- (id)hu_attributedStringWithDefaultAttributes:()HUAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hu_attributedStringWithDefaultAttributes:inRange:", v4, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (id)hu_attributedStringWithDefaultAttributes:()HUAdditions inRange:
{
  id v8 = a3;
  id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v10 = [a1 string];
  id v11 = (void *)[v9 initWithString:v10 attributes:v8];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke;
  v24[3] = &unk_1E638F680;
  id v12 = v11;
  id v25 = v12;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0, v24);
  uint64_t v13 = *MEMORY[0x1E4F42508];
  id v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F42A98];
    id v16 = [v8 objectForKeyedSubscript:v13];
    v17 = [v15 configurationWithFont:v16];

    uint64_t v18 = *MEMORY[0x1E4F424C0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke_2;
    v21[3] = &unk_1E638F6A8;
    id v22 = v17;
    id v23 = v12;
    id v19 = v17;
    objc_msgSend(v23, "enumerateAttribute:inRange:options:usingBlock:", v18, a4, a5, 0, v21);
  }

  return v12;
}

- (id)hu_attributedStringByTrimmingCharactersInCharacterSet:()HUAdditions
{
  id v4 = a3;
  v5 = [a1 string];
  uint64_t v6 = [v4 invertedSet];

  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F18F92B8];
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

- (uint64_t)hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters
{
  if (!hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters)
  {
    double v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    double v3 = (void *)[v2 mutableCopy];

    [v3 addCharactersInString:@"\uFFFC"];
    uint64_t v4 = [v3 copy];
    v5 = (void *)hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters;
    hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters = v4;
  }

  return objc_msgSend(a1, "hu_attributedStringByTrimmingCharactersInCharacterSet:");
}

+ (id)hu_safeAttributedStringWithHTML:()HUAdditions attributes:
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"</?\\s*i?frame[^>]*>", &stru_1F18F92B8, 1025, 0, objc_msgSend(v6, "length"));

  uint64_t v8 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", @"</?\\s*img[^>]*>", &stru_1F18F92B8, 1025, 0, objc_msgSend(v7, "length"));

  uint64_t v9 = [v8 dataUsingEncoding:10];
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v40 = *MEMORY[0x1E4F424F8];
  v41[0] = *MEMORY[0x1E4F42518];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  id v36 = 0;
  id v12 = (void *)[v10 initWithData:v9 options:v11 documentAttributes:0 error:&v36];
  id v13 = v36;
  id v14 = (void *)[v12 mutableCopy];

  if (v13 || !v14)
  {
    if (v13)
    {
      v30 = HFLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v13;
        _os_log_error_impl(&dword_1BE345000, v30, OS_LOG_TYPE_ERROR, "Error creating NSAttributedString from HTML data: %@", buf, 0xCu);
      }
    }
    id v29 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F18F92B8];
  }
  else
  {
    id v32 = v5;
    uint64_t v15 = [v14 length];
    id v16 = [v14 string];
    uint64_t v17 = objc_msgSend(v16, "rangeOfString:options:range:", @"\u2028", 0, 0, v15);
    uint64_t v19 = v18;

    while (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v14, "replaceCharactersInRange:withString:", v17, v19, @"\n");
      uint64_t v20 = v17 + 1;
      if (v15 == v20) {
        break;
      }
      uint64_t v21 = [v14 string];
      uint64_t v17 = objc_msgSend(v21, "rangeOfString:options:range:", @"\u2028", 0, v20, v15 - v20);
      uint64_t v19 = v22;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v37 = *MEMORY[0x1E4F42540];
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    id v25 = (void *)[v23 initWithArray:v24];

    uint64_t v26 = [v14 length];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __78__NSAttributedString_HUAdditions__hu_safeAttributedStringWithHTML_attributes___block_invoke;
    v33[3] = &unk_1E638F6D0;
    id v27 = v14;
    id v34 = v27;
    id v35 = v25;
    id v28 = v25;
    objc_msgSend(v27, "enumerateAttributesInRange:options:usingBlock:", 0, v26, 0, v33);
    id v5 = v32;
    if (v32) {
      objc_msgSend(v27, "addAttributes:range:", v32, 0, objc_msgSend(v27, "length"));
    }
    id v29 = v27;
  }

  return v29;
}

+ (id)hu_attributedStringWithSystemImageNamed:()HUAdditions title:isRTL:
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F42698]);
    id v10 = [MEMORY[0x1E4F42A80] systemImageNamed:v7];
    uint64_t v11 = [v10 imageWithRenderingMode:2];
    [v9 setImage:v11];

    id v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
    id v13 = (void *)[v12 mutableCopy];

    if (a5)
    {
      id v14 = [NSString stringWithFormat:@"%@ ", v8];
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
      [v13 insertAttributedString:v15 atIndex:0];
    }
    else
    {
      id v14 = [NSString stringWithFormat:@" %@", v8];
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
      [v13 appendAttributedString:v15];
    }

    id v16 = (void *)[v13 copy];
  }
  else
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F18F92B8];
  }

  return v16;
}

@end