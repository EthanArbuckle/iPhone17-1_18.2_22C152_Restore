@interface NSString(EmailFoundationAdditions)
+ (__CFString)ef_emptyStringIfNil:()EmailFoundationAdditions;
+ (id)ef_UUID;
+ (id)ef_stringByIsolatingDirectionalityForString:()EmailFoundationAdditions;
- (BOOL)ef_caseInsensitiveIsEqualToString:()EmailFoundationAdditions;
- (BOOL)ef_hasCaseInsensitivePrefix:()EmailFoundationAdditions;
- (BOOL)ef_hasCaseInsensitiveSuffix:()EmailFoundationAdditions;
- (_BYTE)ef_sqliteAllocatedStringWithHexFromUTF8;
- (__CFString)ef_stringByTrimmingTrailingCharactersInSet:()EmailFoundationAdditions;
- (id)_ef_sqliteFormattedWithFormatSpecifier:()EmailFoundationAdditions;
- (id)ef_UTF8ConvertibleString;
- (id)ef_componentsSeparatedByString:()EmailFoundationAdditions maxSeparations:;
- (id)ef_declaredUTTypeFromExtension;
- (id)ef_filenameWithExtensionForMimeType:()EmailFoundationAdditions;
- (id)ef_md5Digest;
- (id)ef_pathByReplacingRelativePathWithFolderName:()EmailFoundationAdditions;
- (id)ef_quotedWordComponentsForLanguages:()EmailFoundationAdditions;
- (id)ef_sanitizedFileName;
- (id)ef_sha256Digest;
- (id)ef_sha256String;
- (id)ef_stringByAddingPercentEscapesUsingEncoding:()EmailFoundationAdditions;
- (id)ef_stringByApplyingJavaScriptArguments:()EmailFoundationAdditions;
- (id)ef_stringByEscapingForMessageBody;
- (id)ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:()EmailFoundationAdditions;
- (id)ef_stringByRFC5322Unfolding;
- (id)ef_stringByRemovingCharactersInSet:()EmailFoundationAdditions;
- (id)ef_stringByRemovingCharactersInSet:()EmailFoundationAdditions beforeOccurrencesOfString:;
- (id)ef_stringByRemovingQuotedSubstringsForLocales:()EmailFoundationAdditions tokenizationHandler:;
- (id)ef_stringByRemovingQuotesForLanguages:()EmailFoundationAdditions;
- (id)ef_stringByRemovingTokenizedLinksUsingTokenizationHandler:()EmailFoundationAdditions;
- (id)ef_stringByRemovingUnbalancedOpenQuote:()EmailFoundationAdditions closeQuote:;
- (id)ef_stringByRemovingUnbalancedQuotesForLanguages:()EmailFoundationAdditions;
- (id)ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:()EmailFoundationAdditions;
- (id)ef_stringByReplacingContiguousSequencesOfCharactersInSet:()EmailFoundationAdditions withString:;
- (id)ef_stringByReplacingPercentEscapesUsingEncoding:()EmailFoundationAdditions;
- (id)ef_stringByTrimmingLeadingCharactersInSet:()EmailFoundationAdditions;
- (id)ef_stringByTrimmingOuterQuotes;
- (id)ef_stringByTrimmingWhitespaceAndNewlineCharacters;
- (id)ef_stringWithNoExtraSpaces;
- (id)ef_substringWithIndexes:()EmailFoundationAdditions;
- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions;
- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions minimumWordLength:;
- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions minimumWordLength:componentLimit:remainingString:;
- (uint64_t)_lengthOfPrefixOfCharactersFromSet:()EmailFoundationAdditions range:;
- (uint64_t)_lengthOfSuffixOfCharactersFromSet:()EmailFoundationAdditions range:;
- (uint64_t)ef_SQLEscapedString;
- (uint64_t)ef_conformsToIWorkUTType;
- (uint64_t)ef_conformsToMarkupUTType;
- (uint64_t)ef_conformsToRFC822UTType;
- (uint64_t)ef_firstStrongDirectionalityIsLeftToRight;
- (uint64_t)ef_isUnsignedIntegerString;
- (uint64_t)ef_isWebAddress;
- (uint64_t)ef_lastStrongDirectionalityIsLeftToRight;
- (uint64_t)ef_lossyDefaultCStringBytes;
- (uint64_t)ef_quotedSQLEscapedString;
- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions;
- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions options:;
- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions options:range:;
- (uint64_t)ef_rangeOfWebAddressContainingRange:()EmailFoundationAdditions;
- (uint64_t)ef_stringByEscapingSingleQuotes;
@end

@implementation NSString(EmailFoundationAdditions)

- (id)ef_sanitizedFileName
{
  v1 = [a1 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  v3 = [v2 stringByReplacingOccurrencesOfString:@"\t" withString:@" "];

  return v3;
}

- (uint64_t)ef_lossyDefaultCStringBytes
{
  id v1 = a1;
  uint64_t v2 = [v1 _fastCStringContents:1];
  if (!v2)
  {
    uint64_t v3 = [v1 length];
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
    if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0x7FFFFFFFFFFFFFFELL, &v9, 1, 1, 0, v3, 0))
    {
      id v4 = [MEMORY[0x1E4F1CA58] dataWithLength:v9 + 1];
      uint64_t v2 = [v4 mutableBytes];
      if (v2
        && (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v2, v9, &v8, 1, 1, 0, v3, 0) & 1) != 0)
      {
        unint64_t v5 = v8;
        unint64_t v6 = v9;

        if (v5 == v6) {
          *(unsigned char *)(v2 + v9) = 0;
        }
      }
      else
      {
      }
    }
  }
  return v2;
}

- (id)ef_substringWithIndexes:()EmailFoundationAdditions
{
  id v4 = a3;
  if ([v4 rangeCount] == 1)
  {
    uint64_t v5 = [v4 rangeAtIndex:0];
    objc_msgSend(a1, "substringWithRange:", v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__NSString_EmailFoundationAdditions__ef_substringWithIndexes___block_invoke;
    v11[3] = &unk_1E6122A28;
    id v9 = v8;
    id v12 = v9;
    v13 = a1;
    [v4 enumerateRangesUsingBlock:v11];
    id v7 = v9;
  }
  return v7;
}

- (uint64_t)ef_quotedSQLEscapedString
{
  return objc_msgSend(a1, "_ef_sqliteFormattedWithFormatSpecifier:", "%Q");
}

- (id)_ef_sqliteFormattedWithFormatSpecifier:()EmailFoundationAdditions
{
  uint64_t v3 = sqlite3_mprintf(a3, [a1 UTF8String]);
  id v4 = (void *)[[NSString alloc] initWithBytesNoCopy:v3 length:strlen(v3) encoding:4 deallocator:&__block_literal_global_21];
  return v4;
}

- (id)ef_md5Digest
{
  id v1 = [a1 dataUsingEncoding:4];
  uint64_t v2 = objc_msgSend(v1, "ef_md5Digest");

  return v2;
}

+ (id)ef_UUID
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = [v0 UUIDString];

  return v1;
}

- (BOOL)ef_caseInsensitiveIsEqualToString:()EmailFoundationAdditions
{
  return [a1 compare:a3 options:1] == 0;
}

- (id)ef_stringByTrimmingWhitespaceAndNewlineCharacters
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (uint64_t)ef_SQLEscapedString
{
  return objc_msgSend(a1, "_ef_sqliteFormattedWithFormatSpecifier:", "%q");
}

- (id)ef_sha256Digest
{
  id v1 = [a1 dataUsingEncoding:4];
  uint64_t v2 = objc_msgSend(v1, "ef_sha256Digest");

  return v2;
}

- (id)ef_sha256String
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = (const char *)[a1 UTF8String];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)md = v2;
  long long v9 = v2;
  CC_LONG v3 = strlen(v1);
  CC_SHA256(v1, v3, md);
  id v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);
  uint64_t v6 = [NSString stringWithString:v4];

  return v6;
}

- (uint64_t)ef_firstStrongDirectionalityIsLeftToRight
{
  uint64_t v2 = [(__CFString *)a1 length];
  CFStringRef theString = a1;
  uint64_t v27 = 0;
  int64_t v28 = v2;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v25 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  int64_t v29 = 0;
  int64_t v30 = 0;
  v26 = CStringPtr;
  if (v2 >= 1)
  {
    int64_t v5 = 0;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23[6] = v6;
    v23[7] = v6;
    v23[4] = v6;
    v23[5] = v6;
    v23[2] = v6;
    v23[3] = v6;
    v23[0] = v6;
    v23[1] = v6;
    do
    {
      if (v5 < 0 || (int64_t v7 = v28, v28 <= v5))
      {
        UniChar v9 = 0;
      }
      else
      {
        if (v25)
        {
          UniChar v8 = v25[v27 + v5];
        }
        else if (v26)
        {
          UniChar v8 = v26[v27 + v5];
        }
        else
        {
          if (v30 <= v5 || (int64_t v14 = v29, v29 > v5))
          {
            int64_t v15 = v5 - 4;
            if ((unint64_t)v5 < 4) {
              int64_t v15 = 0;
            }
            if (v15 + 64 < v28) {
              int64_t v7 = v15 + 64;
            }
            int64_t v29 = v15;
            int64_t v30 = v7;
            v31.location = v27 + v15;
            v31.length = v7 - v15;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            int64_t v14 = v29;
          }
          UniChar v8 = *((_WORD *)v23 + v5 - v14);
        }
        UniChar v9 = v8;
        if (v8 >> 10 == 54 && v5 < v2 - 1)
        {
          int64_t v17 = v5 + 1;
          int64_t v18 = v28;
          if (v28 <= v5 + 1) {
            goto LABEL_50;
          }
          if (v25)
          {
            UniChar v19 = v25[v27 + v17];
          }
          else if (v26)
          {
            UniChar v19 = v26[v27 + v17];
          }
          else
          {
            if (v30 <= v17 || (int64_t v20 = v29, v29 > v17))
            {
              int64_t v21 = v5 - 3;
              if ((unint64_t)v5 < 3) {
                int64_t v21 = 0;
              }
              if (v21 + 64 < v28) {
                int64_t v18 = v21 + 64;
              }
              int64_t v29 = v21;
              int64_t v30 = v18;
              v32.location = v27 + v21;
              v32.length = v18 - v21;
              CFStringGetCharacters(theString, v32, (UniChar *)v23);
              int64_t v20 = v29;
            }
            UniChar v19 = *((_WORD *)v23 + v17 - v20);
          }
          if (v19 >> 10 != 55)
          {
LABEL_50:
            ++v5;
            goto LABEL_18;
          }
          UniChar v9 = (v9 << 10) + v19 + 9216;
          ++v5;
        }
      }
      uint64_t v10 = 1;
      uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
      if (!UnicodePropertyDataForPlane) {
        return v10;
      }
      unsigned int v12 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v9));
      if (v12 >= 0x13) {
        unsigned int v12 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + (v12 << 8) - 4864 + v9 + 256);
      }
      if (v12 == 1) {
        return v10;
      }
      if (v12 == 2 || v12 == 5) {
        return 0;
      }
LABEL_18:
      ++v5;
    }
    while (v5 < v2);
  }
  return 1;
}

- (uint64_t)ef_lastStrongDirectionalityIsLeftToRight
{
  uint64_t v2 = [(__CFString *)a1 length];
  CFStringRef theString = a1;
  uint64_t v26 = 0;
  uint64_t v27 = v2;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v24 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  v25 = CStringPtr;
  if (v2 >= 1)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22[6] = v5;
    v22[7] = v5;
    v22[4] = v5;
    v22[5] = v5;
    v22[2] = v5;
    v22[3] = v5;
    v22[0] = v5;
    v22[1] = v5;
    do
    {
      uint64_t v6 = v2 - 1;
      uint64_t v7 = v27;
      if (v27 >= v2)
      {
        if (v24)
        {
          UniChar v13 = v24[v26 + v6];
        }
        else if (v25)
        {
          UniChar v13 = v25[v26 + v6];
        }
        else
        {
          uint64_t v14 = v28;
          if (v29 < v2 || v28 >= v2)
          {
            uint64_t v16 = v2 - 5;
            if ((unint64_t)v2 < 5) {
              uint64_t v16 = 0;
            }
            if (v16 + 64 < v27) {
              uint64_t v7 = v16 + 64;
            }
            uint64_t v28 = v16;
            uint64_t v29 = v7;
            v30.location = v26 + v16;
            v30.length = v7 - v16;
            CFStringGetCharacters(theString, v30, (UniChar *)v22);
            uint64_t v14 = v28;
          }
          UniChar v13 = *((_WORD *)v22 + v6 - v14);
        }
        UniChar v8 = v13;
        if (v2 != 1 && (v13 & 0xFC00) == 0xDC00)
        {
          uint64_t v6 = v2 - 2;
          uint64_t v17 = v27;
          if (v27 <= v2 - 2) {
            goto LABEL_15;
          }
          if (v24)
          {
            UniChar v18 = v24[v26 + v6];
          }
          else if (v25)
          {
            UniChar v18 = v25[v26 + v6];
          }
          else
          {
            if (v29 <= v6 || (uint64_t v19 = v28, v28 > v6))
            {
              uint64_t v20 = v2 - 6;
              if ((unint64_t)v6 < 4) {
                uint64_t v20 = 0;
              }
              if (v20 + 64 < v27) {
                uint64_t v17 = v20 + 64;
              }
              uint64_t v28 = v20;
              uint64_t v29 = v17;
              v31.location = v26 + v20;
              v31.length = v17 - v20;
              CFStringGetCharacters(theString, v31, (UniChar *)v22);
              uint64_t v19 = v28;
            }
            UniChar v18 = *((_WORD *)v22 + v6 - v19);
          }
          if (v18 >> 10 != 54) {
            goto LABEL_15;
          }
          v8 += (v18 << 10) + 9216;
        }
      }
      else
      {
        UniChar v8 = 0;
      }
      uint64_t v9 = 1;
      uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
      if (!UnicodePropertyDataForPlane) {
        return v9;
      }
      unsigned int v11 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v8));
      if (v11 >= 0x13) {
        unsigned int v11 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + (v11 << 8) - 4864 + v8 + 256);
      }
      if (v11 == 1) {
        return v9;
      }
      if (v11 == 2 || v11 == 5) {
        return 0;
      }
LABEL_15:
      uint64_t v2 = v6;
    }
    while (v6 >= 1);
  }
  return 1;
}

- (_BYTE)ef_sqliteAllocatedStringWithHexFromUTF8
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 lengthOfBytesUsingEncoding:4];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = a1;
  }
  else
  {
    long long v5 = [a1 dataUsingEncoding:4 allowLossyConversion:1];
    id v4 = (id)[[NSString alloc] initWithData:v5 encoding:4];
    uint64_t v3 = [v4 lengthOfBytesUsingEncoding:4];
  }
  uint64_t v6 = sqlite3_malloc64((2 * v3) | 1);
  uint64_t v7 = [v4 length];
  uint64_t v14 = 0;
  uint64_t v15 = v7;
  UniChar v8 = v6;
  if (v7)
  {
    uint64_t v9 = v6;
    do
    {
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v16[14] = v10;
      v16[15] = v10;
      v16[12] = v10;
      v16[13] = v10;
      v16[10] = v10;
      v16[11] = v10;
      v16[8] = v10;
      v16[9] = v10;
      v16[7] = v10;
      v16[5] = v10;
      v16[6] = v10;
      v16[3] = v10;
      v16[4] = v10;
      v16[1] = v10;
      v16[2] = v10;
      v16[0] = v10;
      unint64_t v13 = 0;
      objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16, 256, &v13, 4, 0, v14, v7, &v14);
      if (v13)
      {
        for (unint64_t i = 0; i < v13; ++i)
        {
          *uint64_t v9 = a0123456789abcd[(unint64_t)*((unsigned __int8 *)v16 + i) >> 4];
          UniChar v8 = v9 + 2;
          v9[1] = a0123456789abcd[*((unsigned char *)v16 + i) & 0xF];
          v9 += 2;
        }
      }
      else
      {
        UniChar v8 = v9;
      }
      uint64_t v7 = v15;
      uint64_t v9 = v8;
    }
    while (v15);
  }
  *UniChar v8 = 0;

  return v6;
}

- (id)ef_stringByRemovingQuotedSubstringsForLocales:()EmailFoundationAdditions tokenizationHandler:
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28FD8], "ef_regularExpressionForQuotedStringsInLocales:", a3);
  UniChar v8 = objc_msgSend(v7, "ef_stringByRemovingTokensFromString:matchingOptions:tokenizationOptions:tokenizationHandler:", a1, 0, 3, v6);

  return v8;
}

- (id)ef_stringByRemovingUnbalancedOpenQuote:()EmailFoundationAdditions closeQuote:
{
  id v6 = a3;
  id v36 = a4;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v34 = [a1 length];
  uint64_t v7 = 0;
  int v33 = [v6 isEqualToString:v36];
  char v8 = v33 ^ 1;
  char v9 = 1;
  uint64_t v10 = v34;
  do
  {
    while (1)
    {
      if (v9)
      {
        unint64_t v11 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 0, v7, v10);
        uint64_t v13 = v12;
        if ((v8 & 1) == 0) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v13 = 0;
        unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        if ((v8 & 1) == 0)
        {
LABEL_4:
          uint64_t v14 = 0;
          unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
          if (!v13) {
            goto LABEL_11;
          }
          goto LABEL_8;
        }
      }
      unint64_t v15 = objc_msgSend(a1, "rangeOfString:options:range:", v36, 0, v7, v10);
      uint64_t v14 = v16;
      if (!v13) {
        goto LABEL_11;
      }
LABEL_8:
      if (v14)
      {
        uint64_t v17 = v36;
        if (v11 <= v15)
        {
          uint64_t v17 = v6;
          uint64_t v14 = v13;
          unint64_t v15 = v11;
        }
        goto LABEL_14;
      }
LABEL_11:
      if (v13)
      {
        char v8 = 0;
        uint64_t v17 = v6;
        unint64_t v15 = v11;
        uint64_t v14 = v13;
        goto LABEL_14;
      }
      char v9 = 0;
      uint64_t v17 = v36;
      if (!v14) {
        break;
      }
LABEL_14:
      id v18 = v17;
      if (v18)
      {
        uint64_t v19 = v18;
        if ([v18 isEqualToString:v6])
        {
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v15, v14);
          int64_t v21 = +[EFPair pairWithFirst:v20 second:v19];
          [v35 addObject:v21];
        }
        else
        {
          v22 = [v35 lastObject];
          uint64_t v20 = v22;
          if (v22)
          {
            v23 = [v22 second];
            int v24 = [v23 isEqualToString:v6];

            if (v24)
            {
              [v35 removeLastObject];
LABEL_22:

              uint64_t v7 = v15 + v14;
              uint64_t v10 = v34 - (v15 + v14);

              goto LABEL_23;
            }
          }
          int64_t v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v15, v14);
          v25 = +[EFPair pairWithFirst:v21 second:v19];
          [v35 addObject:v25];
        }
        goto LABEL_22;
      }
LABEL_23:
      if ((v9 & 1) == 0) {
        goto LABEL_24;
      }
    }
    char v8 = 0;
LABEL_24:
    ;
  }
  while ((v8 & 1) != 0);
  uint64_t v26 = [v35 count];
  if (v26)
  {
    if (v33)
    {
      if ((v26 & 1) == 0) {
        goto LABEL_30;
      }
      uint64_t v28 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v29 = [v35 lastObject];
      uint64_t v30 = [v28 arrayWithObject:v29];

      id v35 = (id)v30;
    }
    CFRange v31 = (void *)[a1 mutableCopy];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __88__NSString_EmailFoundationAdditions__ef_stringByRemovingUnbalancedOpenQuote_closeQuote___block_invoke;
    v37[3] = &unk_1E61229B0;
    id v27 = v31;
    id v38 = v27;
    [v35 enumerateObjectsWithOptions:2 usingBlock:v37];
  }
  else
  {
LABEL_30:
    id v27 = a1;
  }

  return v27;
}

- (id)ef_stringByRemovingUnbalancedQuotesForLanguages:()EmailFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  objc_msgSend(MEMORY[0x1E4F1CA20], "ef_quotePairsForLanguages:", a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      char v9 = v4;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        unint64_t v11 = objc_msgSend(v10, "first", (void)v14);
        uint64_t v12 = [v10 second];
        objc_msgSend(v9, "ef_stringByRemovingUnbalancedOpenQuote:closeQuote:", v11, v12);
        id v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v8;
        char v9 = v4;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)ef_stringByRemovingTokenizedLinksUsingTokenizationHandler:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:32 error:0];
  uint64_t v6 = objc_msgSend(v5, "ef_stringByRemovingTokensFromString:matchingOptions:tokenizationOptions:tokenizationHandler:", a1, 16, 2, v4);

  return v6;
}

- (id)ef_stringByRemovingQuotesForLanguages:()EmailFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  objc_msgSend(MEMORY[0x1E4F1CA20], "ef_quotePairsForLanguages:", a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "first", (void)v14);
        unint64_t v11 = [v4 stringByReplacingOccurrencesOfString:v10 withString:&stru_1F0EAE5A8];

        uint64_t v12 = [v9 second];
        id v4 = [v11 stringByReplacingOccurrencesOfString:v12 withString:&stru_1F0EAE5A8];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)ef_stringByTrimmingOuterQuotes
{
  id v1 = a1;
  if ((unint64_t)[v1 length] >= 2)
  {
    if ((int v2 = [v1 characterAtIndex:0],
          int v3 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1),
          v2 == 39)
      && v3 == 39
      || v2 == 34 && v3 == 34)
    {
      uint64_t v4 = objc_msgSend(v1, "substringWithRange:", 1, objc_msgSend(v1, "length") - 2);

      id v1 = (id)v4;
    }
  }
  return v1;
}

- (id)ef_stringByRemovingCharactersInSet:()EmailFoundationAdditions
{
  id v1 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
  int v2 = [v1 componentsJoinedByString:&stru_1F0EAE5A8];

  return v2;
}

- (id)ef_stringByRemovingCharactersInSet:()EmailFoundationAdditions beforeOccurrencesOfString:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[a1 mutableCopy];
  objc_msgSend(v8, "ef_removeCharactersInSet:beforeOccurrencesOfString:", v6, v7);

  return v8;
}

- (id)ef_stringByReplacingContiguousSequencesOfCharactersInSet:()EmailFoundationAdditions withString:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[a1 mutableCopy];
  objc_msgSend(v8, "ef_replaceContiguousSequencesOfCharactersInSet:withString:", v6, v7);

  return v8;
}

- (id)ef_stringByTrimmingLeadingCharactersInSet:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "ef_trimLeadingCharactersInSet:", v4);

  return v5;
}

- (__CFString)ef_stringByTrimmingTrailingCharactersInSet:()EmailFoundationAdditions
{
  id v4 = [a3 invertedSet];
  uint64_t v5 = [a1 rangeOfCharacterFromSet:v4 options:4];
  uint64_t v7 = v6;

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = &stru_1F0EAE5A8;
  }
  else if (v5 + v7 == [a1 length])
  {
    uint64_t v8 = (__CFString *)[a1 copy];
  }
  else
  {
    uint64_t v8 = [a1 substringToIndex:v5 + v7];
  }
  return v8;
}

- (id)ef_stringByRFC5322Unfolding
{
  id v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "ef_rfc5322Unfold");
  return v1;
}

- (id)ef_componentsSeparatedByString:()EmailFoundationAdditions maxSeparations:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    uint64_t v7 = [a1 componentsSeparatedByString:v6];
    if ([v7 count] <= (unint64_t)(a4 + 1))
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, a4);
      id v9 = (id)[v8 mutableCopy];

      uint64_t v10 = objc_msgSend(v7, "subarrayWithRange:", a4, objc_msgSend(v7, "count") - 1);
      unint64_t v11 = [v10 componentsJoinedByString:v6];

      [v9 addObject:v11];
    }
  }
  else
  {
    v13[0] = a1;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }

  return v9;
}

- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions
{
  int v3 = objc_msgSend(a1, "ef_wordComponentsForLocale:minimumWordLength:", a3, 0);
  return v3;
}

- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions minimumWordLength:
{
  id v4 = objc_msgSend(a1, "ef_wordComponentsForLocale:minimumWordLength:componentLimit:remainingString:", a3, a4, -1, 0);
  return v4;
}

- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions minimumWordLength:componentLimit:remainingString:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  CFLocaleRef v10 = a3;
  v26.length = CFStringGetLength(a1);
  v26.CFIndex location = 0;
  unint64_t v11 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v26, 4uLL, v10);
  if (v11)
  {
    CFLocaleRef v23 = v10;
    uint64_t v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (CFStringTokenizerAdvanceToNextToken(v11) && [v13 count] < a5)
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      if (CurrentTokenRange.length >= a4)
      {
        long long v15 = -[__CFString substringWithRange:](a1, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
        long long v16 = [v15 stringByTrimmingCharactersInSet:v12];
        uint64_t v17 = [v16 length];

        if (v17) {
          [v13 addObject:v15];
        }
      }
    }
    if (a6)
    {
      CFIndex location = CFStringTokenizerGetCurrentTokenRange(v11).location;
      if (location != -1)
      {
        uint64_t v19 = [(__CFString *)a1 substringFromIndex:location];
        uint64_t v20 = objc_msgSend(v19, "ef_stringByTrimmingLeadingCharactersInSet:", v12);

        if ([v20 length])
        {
          int64_t v21 = v20;
LABEL_18:
          CFRelease(v11);
          if (a6) {
            *a6 = v21;
          }

          CFLocaleRef v10 = v23;
          goto LABEL_21;
        }
      }
    }
    int64_t v21 = 0;
    goto LABEL_18;
  }
  if (a6) {
    *a6 = 0;
  }
  v24[0] = a1;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
LABEL_21:

  return v13;
}

- (id)ef_quotedWordComponentsForLanguages:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_localesFromLanguages:", v4);
  id v6 = objc_msgSend(MEMORY[0x1E4F28FD8], "ef_regularExpressionForQuotedStringsInLocales:", v5);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__NSString_EmailFoundationAdditions__ef_quotedWordComponentsForLanguages___block_invoke;
  v14[3] = &unk_1E61229D8;
  id v8 = v4;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  objc_msgSend(v6, "ef_enumerateTokensInString:options:usingBlock:", a1, 0, v14);
  unint64_t v11 = v17;
  id v12 = v9;

  return v12;
}

- (id)ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:()EmailFoundationAdditions
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__4;
  id v13 = __Block_byref_object_dispose__4;
  id v14 = (id)0xAAAAAAAAAAAAAAAALL;
  id v14 = (id)[a1 mutableCopy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__NSString_EmailFoundationAdditions__ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater___block_invoke;
  aBlock[3] = &unk_1E6122A00;
  aBlock[4] = &v9;
  id v4 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C", a3);
  v4[2](v4, v5, a3);

  v4[2](v4, @"%", a3);
  v4[2](v4, @"_", a3);
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)ef_hasCaseInsensitivePrefix:()EmailFoundationAdditions
{
  return [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ef_hasCaseInsensitiveSuffix:()EmailFoundationAdditions
{
  return [a1 rangeOfString:a3 options:13] != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)ef_stringByIsolatingDirectionalityForString:()EmailFoundationAdditions
{
  int v3 = [NSString stringWithFormat:@"⁨%@⁩", a3];
  return v3;
}

+ (__CFString)ef_emptyStringIfNil:()EmailFoundationAdditions
{
  if (a3) {
    return (__CFString *)a3;
  }
  else {
    return &stru_1F0EAE5A8;
  }
}

- (id)ef_stringWithNoExtraSpaces
{
  unint64_t v1 = 0;
  int v2 = (void *)[a1 mutableCopy];
  while (v1 < [v2 length])
  {
    int v3 = [v2 characterAtIndex:v1++];
    if (v3 == 32)
    {
      while (v1 < [v2 length] && objc_msgSend(v2, "characterAtIndex:", v1) == 32)
        objc_msgSend(v2, "deleteCharactersInRange:", v1, 1);
    }
  }
  if ([v2 length] && objc_msgSend(v2, "characterAtIndex:", 0) == 32) {
    objc_msgSend(v2, "deleteCharactersInRange:", 0, 1);
  }
  uint64_t v4 = [v2 length];
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    if ([v2 characterAtIndex:v4 - 1] == 32) {
      objc_msgSend(v2, "deleteCharactersInRange:", v5, 1);
    }
  }
  return v2;
}

- (id)ef_stringByAddingPercentEscapesUsingEncoding:()EmailFoundationAdditions
{
  id v1 = a1;
  int v2 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"&", @"%26", 2, 0, objc_msgSend(v1, "length"));

  int v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet");
  uint64_t v4 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  return v4;
}

- (id)ef_stringByReplacingPercentEscapesUsingEncoding:()EmailFoundationAdditions
{
  id v1 = a1;
  int v2 = [v1 stringByRemovingPercentEncoding];

  int v3 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"%26", @"&", 2, 0, objc_msgSend(v2, "length"));

  return v3;
}

- (id)ef_stringByApplyingJavaScriptArguments:()EmailFoundationAdditions
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"EFNSStringAdditions.m" lineNumber:559 description:@"Arguments is not a valid array."];
  }
  id v6 = &stru_1F0EAE5A8;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v5])
  {
    id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:0];
    id v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    uint64_t v9 = [v8 substringToIndex:1];
    if ([v9 isEqualToString:@"["])
    {
      id v10 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 1);
      char v11 = [v10 isEqualToString:@"]"];

      if (v11)
      {
LABEL_7:
        uint64_t v13 = objc_msgSend(v8, "substringWithRange:", 1, objc_msgSend(v8, "length") - 2);

        id v6 = (__CFString *)v13;
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"EFNSStringAdditions.m" lineNumber:566 description:@"Unexpected characters in sanitized string."];

    goto LABEL_7;
  }
LABEL_8:
  id v14 = [NSString stringWithFormat:@"%@(%@);", a1, v6];

  return v14;
}

- (uint64_t)ef_isWebAddress
{
  if (![a1 length]) {
    return 0;
  }
  int v2 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:32 error:0];
  uint64_t v3 = [a1 length];
  uint64_t v4 = objc_msgSend(v2, "firstMatchInString:options:range:", a1, 1, 0, v3);
  if ([v4 range]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v3 == v5;
  }
  if (v6)
  {
    id v8 = [v4 URL];
    uint64_t v7 = objc_msgSend(v8, "ef_isEligibleForRichLink");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)ef_rangeOfWebAddressContainingRange:()EmailFoundationAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![a1 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:32 error:0];
  objc_msgSend(v7, "matchesInString:options:range:", a1, 1, 0, objc_msgSend(a1, "length"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v23.CFIndex location = objc_msgSend(v12, "range", (void)v17);
        v24.CFIndex location = a3;
        v24.length = a4;
        if (NSIntersectionRange(v23, v24).length == a4)
        {
          uint64_t v13 = [v12 URL];
          int v14 = objc_msgSend(v13, "ef_isEligibleForRichLink");

          if (v14)
          {
            uint64_t v15 = [v12 range];
            goto LABEL_14;
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v15;
}

- (uint64_t)ef_isUnsignedIntegerString
{
  uint64_t result = [a1 length];
  if (result)
  {
    if (ef_isUnsignedIntegerString_onceToken != -1) {
      dispatch_once(&ef_isUnsignedIntegerString_onceToken, &__block_literal_global_77);
    }
    return [a1 rangeOfCharacterFromSet:ef_isUnsignedIntegerString_nonDigitCharacterSet] == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)ef_stringByEscapingForMessageBody
{
  id v1 = -[NSString _escapeForXML](a1);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\r\n", @"<BR>", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"<BR>", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\r", @"<BR>", 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

- (uint64_t)ef_conformsToMarkupUTType
{
  id v1 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a1];
  if ([v1 conformsToType:*MEMORY[0x1E4F44400]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 conformsToType:*MEMORY[0x1E4F44450]];
  }

  return v2;
}

- (uint64_t)ef_conformsToIWorkUTType
{
  return [a1 hasPrefix:@"com.apple.iwork"];
}

- (uint64_t)ef_conformsToRFC822UTType
{
  id v1 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a1];
  uint64_t v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.mail.email"];
  if ([v1 conformsToType:*MEMORY[0x1E4F443A8]]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v1 conformsToType:v2];
  }

  return v3;
}

- (id)ef_declaredUTTypeFromExtension
{
  uint64_t v2 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:a1];
  uint64_t v3 = v2;
  if (!v2 || [v2 isDynamic])
  {
    uint64_t v4 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:a1 conformingToType:*MEMORY[0x1E4F44468]];

    uint64_t v3 = (void *)v4;
  }
  return v3;
}

- (uint64_t)ef_stringByEscapingSingleQuotes
{
  return [a1 stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"];
}

- (id)ef_filenameWithExtensionForMimeType:()EmailFoundationAdditions
{
  id v4 = a3;
  if ([v4 length]
    && ([a1 pathExtension],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        !v6))
  {
    id v8 = [MEMORY[0x1E4F442D8] typeWithMIMEType:v4];
    uint64_t v9 = [v8 preferredFilenameExtension];
    if ([v9 length])
    {
      uint64_t v7 = [a1 stringByAppendingPathExtension:v9];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = a1;
  }
  id v11 = v10;

  return v11;
}

- (id)ef_pathByReplacingRelativePathWithFolderName:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 pathComponents];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__NSString_EmailFoundationAdditions__ef_pathByReplacingRelativePathWithFolderName___block_invoke;
  v10[3] = &unk_1E6122A50;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = objc_msgSend(v5, "ef_map:", v10);

  id v8 = [NSString pathWithComponents:v7];

  return v8;
}

- (id)ef_UTF8ConvertibleString
{
  id v1 = a1;
  if ([v1 UTF8String])
  {
    id v2 = v1;
  }
  else
  {
    _EFRepairString(v1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");
  id v6 = objc_msgSend(v5, "ef_stringByRemovingUnbalancedQuotesForLanguages:", v4);

  return v6;
}

- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "ef_rangeOfCharactersFromSet:options:", a3, 0);
}

- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions options:
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a1, "ef_rangeOfCharactersFromSet:options:range:", v6, a4, 0, objc_msgSend(a1, "length"));

  return v7;
}

- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions options:range:
{
  id v10 = a3;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL && a6)
  {
    if ((a4 & 4) != 0)
    {
      if ((a4 & 8) != 0)
      {
        uint64_t v13 = objc_msgSend(a1, "_lengthOfSuffixOfCharactersFromSet:range:", v10, a5, a6);
        if (v13) {
          uint64_t v11 = a5 + a6 - v13;
        }
        else {
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else if (a5 + a6 > a5)
      {
        while (1)
        {
          uint64_t v12 = objc_msgSend(a1, "_lengthOfSuffixOfCharactersFromSet:range:", v10, a5, a6);
          if (v12) {
            break;
          }
          --a6;
          if (a5 + a6 <= a5)
          {
LABEL_14:
            uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_23;
          }
        }
        uint64_t v11 = a5 - v12 + a6;
      }
    }
    else if ((a4 & 8) != 0)
    {
      if (objc_msgSend(a1, "_lengthOfPrefixOfCharactersFromSet:range:", v10, a5, a6)) {
        uint64_t v11 = a5;
      }
      else {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else if (a5 < a5 + a6)
    {
      uint64_t v11 = a5;
      while (!objc_msgSend(a1, "_lengthOfPrefixOfCharactersFromSet:range:", v10, v11, a6))
      {
        ++v11;
        if (!--a6) {
          goto LABEL_14;
        }
      }
    }
  }
LABEL_23:

  return v11;
}

- (uint64_t)_lengthOfPrefixOfCharactersFromSet:()EmailFoundationAdditions range:
{
  id v8 = a3;
  if (a4 < a4 + a5)
  {
    uint64_t v9 = 0;
    while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a4 + v9)) & 1) != 0)
    {
      if (a5 == ++v9) {
        goto LABEL_7;
      }
    }
    a5 = v9;
  }
LABEL_7:

  return a5;
}

- (uint64_t)_lengthOfSuffixOfCharactersFromSet:()EmailFoundationAdditions range:
{
  id v8 = a3;
  uint64_t v9 = 0;
  unint64_t v10 = a4 + a5;
  while (1)
  {
    uint64_t v11 = v10 + v9;
    if (v10 + v9 <= a4) {
      break;
    }
    --v9;
    if ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11 - 1)) & 1) == 0)
    {
      a5 = ~v9;
      break;
    }
  }

  return a5;
}

@end