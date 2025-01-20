@interface NSString(HealthKit)
+ (id)hk_randomStringOfLength:()HealthKit;
- (BOOL)hk_isBase64;
- (BOOL)hk_isCaseInsensitiveSubstringInString:()HealthKit;
- (BOOL)hk_isValidPurposeString;
- (id)hk_MD5Hash;
- (id)hk_MD5HashAsUUID;
- (id)hk_SHA224Hash;
- (id)hk_SHA256Hash;
- (id)hk_SHA384Hash;
- (id)hk_SHA512Hash;
- (id)hk_copyNonEmptyString;
- (id)hk_firstWordCapitalizedStringWithLocale:()HealthKit;
- (id)hk_localizedFirstWordCapitalizedString;
- (id)hk_stringByAppendingKeyPathComponent:()HealthKit;
- (id)hk_stringByRemovingCharactersInSet:()HealthKit;
- (id)hk_stringByReplacingSpacesWithString:()HealthKit;
- (id)hk_stringByUnescapingJSONCharactersForDisplay;
- (id)hk_stringIndentedBy:()HealthKit prefix:;
- (id)hk_stripLeadingTrailingWhitespace;
- (id)hk_trimWhitespaceAndNewlines;
- (uint64_t)hk_stringByNormalizingSpaces;
- (uint64_t)hk_stringIndentedBy:()HealthKit;
- (void)hk_compareBuildVersionWithString:()HealthKit;
- (void)hk_isBetweenLowerBuildVersion:()HealthKit upperBuildVersion:;
@end

@implementation NSString(HealthKit)

- (id)hk_copyNonEmptyString
{
  v2 = (void *)[a1 length];
  if (v2) {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

- (void)hk_compareBuildVersionWithString:()HealthKit
{
  id v4 = a1;
  id v5 = a3;
  [v4 UTF8String];
  id v6 = v5;
  [v6 UTF8String];

  HKCompareBuildVersionStrings();
}

- (BOOL)hk_isValidPurposeString
{
  v2 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v3 = [v2 invertedSet];
  id v4 = objc_msgSend(a1, "hk_stringByRemovingCharactersInSet:", v3);

  BOOL v5 = (unint64_t)[v4 length] > 0xB;
  return v5;
}

- (id)hk_stripLeadingTrailingWhitespace
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (id)hk_trimWhitespaceAndNewlines
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (id)hk_stringByRemovingCharactersInSet:()HealthKit
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendString:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)hk_stringByNormalizingSpaces
{
  return objc_msgSend(a1, "hk_stringByReplacingSpacesWithString:", @" ");
}

- (id)hk_stringByReplacingSpacesWithString:()HealthKit
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [&unk_1EECE6D50 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      v10 = v5;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(&unk_1EECE6D50);
        }
        id v5 = [v10 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v12 + 1) + 8 * v9) withString:v4];

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [&unk_1EECE6D50 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)hk_stringByUnescapingJSONCharactersForDisplay
{
  v1 = [a1 stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\\\\" withString:@"\\"];

  return v2;
}

- (id)hk_stringByAppendingKeyPathComponent:()HealthKit
{
  id v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  uint64_t v6 = [v4 characterSetWithCharactersInString:@"."];
  uint64_t v7 = [a1 stringByTrimmingCharactersInSet:v6];
  uint64_t v8 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v7 isEqualToString:&stru_1EEC60288])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"%@.%@", v7, v8];
  }
  v10 = v9;

  return v10;
}

- (BOOL)hk_isCaseInsensitiveSubstringInString:()HealthKit
{
  return [a1 rangeOfString:a3 options:1] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)hk_firstWordCapitalizedStringWithLocale:()HealthKit
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3010000000;
  v20 = "";
  long long v21 = xmmword_19C3D4020;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__44;
  long long v15 = __Block_byref_object_dispose__44;
  id v16 = 0;
  uint64_t v5 = [a1 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__NSString_HealthKit__hk_firstWordCapitalizedStringWithLocale___block_invoke;
  v10[3] = &unk_1E58C66A0;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 3, v10);
  uint64_t v6 = v18;
  if (v18[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = a1;
  }
  else
  {
    uint64_t v8 = [(id)v12[5] capitalizedStringWithLocale:v4];
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v6[4], v6[5], v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

- (id)hk_localizedFirstWordCapitalizedString
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = objc_msgSend(a1, "hk_firstWordCapitalizedStringWithLocale:", v2);

  return v3;
}

- (BOOL)hk_isBase64
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  if ((v2 & 3) != 0) {
    return 0;
  }
  uint64_t v4 = v2;
  if (!v2) {
    return 1;
  }
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)v10 - ((v5 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "getCharacters:range:", v6, 0, v4);
  for (uint64_t i = (unsigned __int16 *)(v6 + 2); ; ++i)
  {
    int v8 = *(i - 1);
    BOOL v9 = (v8 - 48) >= 0xA && (v8 - 97) >= 0x1A;
    if (v9 && (v8 - 65) >= 0x1A && (v8 & 0xFFFFFFFB) != 0x2B) {
      break;
    }
    if (!--v4) {
      return 1;
    }
  }
  if (v8 != 61) {
    return 0;
  }
  if (v4 == 1) {
    return 1;
  }
  return v4 == 2 && *i == 61;
}

- (uint64_t)hk_stringIndentedBy:()HealthKit
{
  return objc_msgSend(a1, "hk_stringIndentedBy:prefix:", a3, 0);
}

- (id)hk_stringIndentedBy:()HealthKit prefix:
{
  uint64_t v5 = &stru_1EEC60288;
  if (a4) {
    uint64_t v5 = a4;
  }
  uint64_t v6 = [NSString stringWithFormat:@"%@%*s", v5, a3, ""];
  id v7 = [NSString stringWithFormat:@"\n%@", v6];
  int v8 = [a1 stringByReplacingOccurrencesOfString:@"\n" withString:v7];
  BOOL v9 = [v6 stringByAppendingString:v8];

  return v9;
}

- (void)hk_isBetweenLowerBuildVersion:()HealthKit upperBuildVersion:
{
  id v6 = a4;
  id v7 = a1;
  id v8 = a3;
  [v7 UTF8String];
  id v9 = v8;
  [v9 UTF8String];

  HKCompareBuildVersionStrings();
}

+ (id)hk_randomStringOfLength:()HealthKit
{
  if (a3 < 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSString+HealthKit.m", 168, @"Invalid parameter not satisfying: %@", @"length >= 0" object file lineNumber description];
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "hk_randomDataOfLength:", vcvtpd_s64_f64((double)a3 * 0.75));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 base64EncodedStringWithOptions:0];
    id v7 = [v6 substringToIndex:a3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)hk_SHA224Hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA224((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:56];
  for (uint64_t i = 0; i != 28; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)hk_SHA256Hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)hk_SHA384Hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA384((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:96];
  for (uint64_t i = 0; i != 48; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)hk_SHA512Hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA512((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:128];
  for (uint64_t i = 0; i != 64; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)hk_MD5Hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)hk_MD5HashAsUUID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 cStringUsingEncoding:4];
  objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v2, objc_msgSend(v1, "length"));
  id v3 = objc_claimAutoreleasedReturnValue();
  CC_MD5((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:md];

  return v4;
}

@end