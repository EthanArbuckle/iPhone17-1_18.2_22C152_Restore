@interface NSString(HFAdditions)
+ (id)hf_formattedPersonNameForFirstName:()HFAdditions lastName:;
+ (id)hf_stringWithFormat:()HFAdditions arguments:;
- (BOOL)hf_containsOnlyDecimalDigits;
- (BOOL)hf_isPhoneNumber;
- (id)hf_SHA1;
- (id)hf_SHA256;
- (id)hf_extractDecimalDigits;
- (id)hf_stringByTransformingFirstWordUsingBlock:()HFAdditions;
- (id)hf_stringByTrimmingTrailingHexCode;
- (id)hf_toHexString:()HFAdditions length:;
- (uint64_t)hf_UTF8Length;
- (uint64_t)hf_countForSubstring:()HFAdditions;
- (uint64_t)hf_isEmail;
- (uint64_t)hf_stringByCapitalizingFirstWord;
- (uint64_t)hf_stringByLowercasingFirstWord;
@end

@implementation NSString(HFAdditions)

- (id)hf_SHA1
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_SHA1((const void *)[v1 UTF8String], objc_msgSend(v1, "hf_UTF8Length"), md);
  v2 = objc_msgSend(v1, "hf_toHexString:length:", md, 20);
  return v2;
}

- (id)hf_SHA256
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_SHA256((const void *)[v1 UTF8String], objc_msgSend(v1, "hf_UTF8Length"), md);
  v2 = objc_msgSend(v1, "hf_toHexString:length:", md, 32);
  return v2;
}

- (BOOL)hf_isPhoneNumber
{
  if (![a1 length]) {
    return 0;
  }
  v2 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  [v2 addCharactersInString:@"+()-"];
  v3 = [MEMORY[0x263F08708] controlCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v2 formUnionWithCharacterSet:v4];

  uint64_t v5 = [a1 componentsSeparatedByCharactersInSet:v2];
  v6 = [v5 componentsJoinedByString:&stru_26C081158];

  BOOL v7 = [v6 length] == 0;
  return v7;
}

- (uint64_t)hf_isEmail
{
  if (qword_26AB2F158 != -1) {
    dispatch_once(&qword_26AB2F158, &__block_literal_global_105);
  }
  v2 = (void *)_MergedGlobals_258;
  return [v2 evaluateWithObject:a1];
}

+ (id)hf_formattedPersonNameForFirstName:()HFAdditions lastName:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    BOOL v7 = objc_opt_new();
    [v7 setGivenName:v5];
    [v7 setFamilyName:v6];
    v8 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v7 style:0 options:0];
  }
  else
  {
    if ([v5 length]) {
      id v9 = v6;
    }
    else {
      id v9 = v5;
    }
    v8 = v9;
  }

  return v8;
}

- (id)hf_stringByTransformingFirstWordUsingBlock:()HFAdditions
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3010000000;
  v24 = &unk_20BD7F5A6;
  long long v25 = xmmword_20BD13800;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  uint64_t v5 = [a1 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__NSString_HFAdditions__hf_stringByTransformingFirstWordUsingBlock___block_invoke;
  v11[3] = &unk_264095110;
  v13 = &v21;
  v14 = &v15;
  id v6 = v4;
  id v12 = v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 3, v11);
  uint64_t v7 = v22[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v7, v22[5], v16[5]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (uint64_t)hf_stringByCapitalizingFirstWord
{
  return objc_msgSend(a1, "hf_stringByTransformingFirstWordUsingBlock:", &__block_literal_global_18_3);
}

- (uint64_t)hf_stringByLowercasingFirstWord
{
  return objc_msgSend(a1, "hf_stringByTransformingFirstWordUsingBlock:", &__block_literal_global_20_7);
}

- (id)hf_extractDecimalDigits
{
  v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  v3 = [v2 invertedSet];
  id v4 = [a1 componentsSeparatedByCharactersInSet:v3];
  uint64_t v5 = [v4 componentsJoinedByString:&stru_26C081158];

  return v5;
}

- (BOOL)hf_containsOnlyDecimalDigits
{
  v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  v3 = [v2 invertedSet];

  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "length") != 0;
  return v4;
}

- (uint64_t)hf_UTF8Length
{
  return [a1 lengthOfBytesUsingEncoding:4];
}

- (id)hf_toHexString:()HFAdditions length:
{
  id v6 = [MEMORY[0x263F089D8] stringWithCapacity:2 * a4];
  if (a4)
  {
    uint64_t v7 = a4;
    do
    {
      objc_msgSend(v6, "appendFormat:", @"%02x", *a3);
      *a3++ = 0;
      --v7;
    }
    while (v7);
  }
  return v6;
}

- (uint64_t)hf_countForSubstring:()HFAdditions
{
  id v1 = objc_msgSend(a1, "componentsSeparatedByString:");
  uint64_t v2 = [v1 count] - 1;

  return v2;
}

- (id)hf_stringByTrimmingTrailingHexCode
{
  uint64_t v2 = [MEMORY[0x263F089C0] whitespaceCharacterSet];
  [v2 addCharactersInString:@"-"];
  v3 = [a1 componentsSeparatedByCharactersInSet:v2];
  BOOL v4 = [v3 lastObject];
  uint64_t v5 = [v4 uppercaseString];

  id v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789ABCDEF"];
  uint64_t v7 = [v6 invertedSet];

  uint64_t v8 = [v5 rangeOfCharacterFromSet:v7];
  if ((unint64_t)[v3 count] >= 2)
  {
    if ([v5 length] == 2)
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_4:
        id v9 = objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v5, "length"));
        id v10 = [v9 stringByTrimmingCharactersInSet:v2];

        goto LABEL_10;
      }
    }
    else if ([v5 length] == 4 && v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_4;
    }
  }
  id v10 = a1;
LABEL_10:

  return v10;
}

+ (id)hf_stringWithFormat:()HFAdditions arguments:
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 count] || !objc_msgSend(v6, "length")) {
    goto LABEL_5;
  }
  if ((unint64_t)[v7 count] >= 0x15)
  {
    uint64_t v8 = NSStringFromSelector(a2);
    NSLog(&cfstr_DoesnTSupportM.isa, v8, v7);

LABEL_5:
    id v9 = v6;
    goto LABEL_6;
  }
  v11 = NSString;
  uint64_t v12 = [v7 count];
  if (v12)
  {
    uint64_t v13 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v13 = 0;
  }
  unint64_t v14 = [v7 count];
  v27 = v11;
  if (v14 < 2)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = [v7 objectAtIndexedSubscript:1];
  }
  unint64_t v16 = [v7 count];
  if (v16 < 3)
  {
    v57 = 0;
  }
  else
  {
    v57 = [v7 objectAtIndexedSubscript:2];
  }
  unint64_t v17 = [v7 count];
  if (v17 < 4)
  {
    v56 = 0;
  }
  else
  {
    v56 = [v7 objectAtIndexedSubscript:3];
  }
  unint64_t v18 = [v7 count];
  if (v18 < 5)
  {
    v55 = 0;
  }
  else
  {
    v55 = [v7 objectAtIndexedSubscript:4];
  }
  unint64_t v19 = [v7 count];
  if (v19 < 6)
  {
    v54 = 0;
  }
  else
  {
    v54 = [v7 objectAtIndexedSubscript:5];
  }
  unint64_t v38 = [v7 count];
  if (v38 < 7)
  {
    v53 = 0;
  }
  else
  {
    v53 = [v7 objectAtIndexedSubscript:6];
  }
  unint64_t v37 = [v7 count];
  if (v37 < 8)
  {
    v52 = 0;
  }
  else
  {
    v52 = [v7 objectAtIndexedSubscript:7];
  }
  unint64_t v36 = [v7 count];
  if (v36 < 9)
  {
    v51 = 0;
  }
  else
  {
    v51 = [v7 objectAtIndexedSubscript:8];
  }
  unint64_t v35 = [v7 count];
  if (v35 < 0xA)
  {
    v50 = 0;
  }
  else
  {
    v50 = [v7 objectAtIndexedSubscript:9];
  }
  unint64_t v34 = [v7 count];
  if (v34 < 0xB)
  {
    v49 = 0;
  }
  else
  {
    v49 = [v7 objectAtIndexedSubscript:10];
  }
  unint64_t v33 = [v7 count];
  if (v33 < 0xC)
  {
    v48 = 0;
  }
  else
  {
    v48 = [v7 objectAtIndexedSubscript:11];
  }
  unint64_t v32 = [v7 count];
  if (v32 < 0xD)
  {
    v47 = 0;
  }
  else
  {
    v47 = [v7 objectAtIndexedSubscript:12];
  }
  unint64_t v31 = [v7 count];
  if (v31 < 0xE)
  {
    v46 = 0;
  }
  else
  {
    v46 = [v7 objectAtIndexedSubscript:13];
  }
  unint64_t v30 = [v7 count];
  if (v30 < 0xF)
  {
    v45 = 0;
  }
  else
  {
    v45 = [v7 objectAtIndexedSubscript:14];
  }
  unint64_t v29 = [v7 count];
  if (v29 < 0x10)
  {
    v44 = 0;
  }
  else
  {
    v44 = [v7 objectAtIndexedSubscript:15];
  }
  unint64_t v28 = [v7 count];
  unint64_t v39 = v19;
  if (v28 < 0x11)
  {
    v43 = 0;
  }
  else
  {
    v43 = [v7 objectAtIndexedSubscript:16];
  }
  unint64_t v20 = [v7 count];
  unint64_t v40 = v18;
  if (v20 < 0x12)
  {
    v42 = 0;
  }
  else
  {
    v42 = [v7 objectAtIndexedSubscript:17];
  }
  unint64_t v21 = [v7 count];
  unint64_t v41 = v17;
  if (v21 < 0x13)
  {
    v22 = 0;
  }
  else
  {
    v22 = [v7 objectAtIndexedSubscript:18];
  }
  v26 = (void *)v13;
  if ((unint64_t)[v7 count] <= 0x13)
  {
    objc_msgSend(v27, "localizedStringWithFormat:", v6, v13, v15, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44,
      v43,
      v42,
      v22,
      0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [v7 objectAtIndexedSubscript:19];
    unint64_t v25 = v14;
    v24 = uint64_t v23 = v12;
    objc_msgSend(v27, "localizedStringWithFormat:", v6, v13, v15, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44,
      v43,
      v42,
      v22,
      v24);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = v23;
    unint64_t v14 = v25;
  }
  if (v21 >= 0x13) {

  }
  if (v20 >= 0x12) {
  if (v28 >= 0x11)
  }

  if (v29 >= 0x10) {
  if (v30 >= 0xF)
  }

  if (v31 >= 0xE) {
  if (v32 >= 0xD)
  }

  if (v33 >= 0xC) {
  if (v34 >= 0xB)
  }

  if (v35 >= 0xA) {
  if (v36 >= 9)
  }

  if (v37 >= 8) {
  if (v38 >= 7)
  }

  if (v39 >= 6) {
  if (v40 >= 5)
  }

  if (v41 >= 4) {
  if (v16 >= 3)
  }

  if (v14 >= 2) {
  if (v12)
  }

LABEL_6:
  return v9;
}

@end