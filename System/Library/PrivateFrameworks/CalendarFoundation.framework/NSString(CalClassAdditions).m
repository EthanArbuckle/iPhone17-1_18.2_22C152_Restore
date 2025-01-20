@interface NSString(CalClassAdditions)
+ (id)CalAutoCommentPrefix;
+ (id)ellipsisString;
+ (id)stringWithContentsOfFile:()CalClassAdditions usingEncoding:;
+ (id)stringWithFileSystemRepresentation:()CalClassAdditions;
- (BOOL)CalContainsSubstring:()CalClassAdditions;
- (BOOL)containsCaseAndDiacriticInsensitive:()CalClassAdditions;
- (BOOL)containsCaseInsensitive:()CalClassAdditions;
- (BOOL)hasPrefixCaseAndDiacriticInsensitive:()CalClassAdditions;
- (BOOL)hasPrefixCaseInsensitive:()CalClassAdditions;
- (BOOL)hasSuffixCaseInsensitive:()CalClassAdditions;
- (BOOL)isAddressBookURL;
- (BOOL)isEqualToStringCaseInsensitive:()CalClassAdditions;
- (BOOL)isMailURL;
- (BOOL)resemblesEmailAddress;
- (__CFString)CalSafeFilename;
- (__CFString)CalStringByRemovingAutoComment;
- (__CFString)stringByURLUnquoting;
- (id)CalAddressComment;
- (id)CalSafeHFSPathComponentName;
- (id)CalStringWithOnlyAutoComment;
- (id)CalUncommentedAddress;
- (id)appendSlashIfNeeded;
- (id)calDataDetectedURL;
- (id)cal_stringWithNormalizedSpacesForUnitTesting;
- (id)hostFromEmail;
- (id)phoneURL;
- (id)quote;
- (id)radarLink;
- (id)removeSlashIfNeeded;
- (id)searchAndReplaceString:()CalClassAdditions withString:;
- (id)stringAddingMailto;
- (id)stringAddingTel;
- (id)stringByRemovingLastPathComponent;
- (id)stringByRemovingPrefixCaseInsensitive:()CalClassAdditions;
- (id)stringByReplacingCharactersInSet:()CalClassAdditions withString:;
- (id)stringByTrimmingWhitespaceAndRemovingNewlines;
- (id)stringByURLQuotingPaths;
- (id)stringRemovingMailto;
- (id)stringRemovingTel;
- (id)trimChar:()CalClassAdditions;
- (id)trimCommas;
- (id)trimFinalChar:()CalClassAdditions;
- (id)trimFinalComma;
- (id)trimFirstChar:()CalClassAdditions;
- (id)trimFirstComma;
- (id)trimWhiteSpace;
- (id)unquote;
- (id)userFromEmail;
- (uint64_t)CalHasAutoCommentPrefix;
- (uint64_t)RTLString;
- (uint64_t)cal_isPhoneNumber;
- (uint64_t)cal_isWalletURL;
- (uint64_t)directionalityIsolatedString;
- (uint64_t)hasMailto;
- (uint64_t)hasTel;
- (uint64_t)isEqualAsURL:()CalClassAdditions;
- (uint64_t)isMessagesURL;
- (uint64_t)isPathToAppleScript;
- (uint64_t)isPathToBackupFile;
- (uint64_t)isPathToICalBookmark;
- (uint64_t)isPathToICalData;
- (uint64_t)isPathToVCalData;
- (uint64_t)stringByEncodingSlashes;
- (uint64_t)stringByRemovingCharactersInSet:()CalClassAdditions;
- (uint64_t)stringByURLEscapingAllReservedCharacters;
- (uint64_t)stringByURLQuoting;
- (void)cal_enumerateCharactersUsingBlock:()CalClassAdditions;
@end

@implementation NSString(CalClassAdditions)

- (id)trimWhiteSpace
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTrimWhitespace(v1);
  v2 = (void *)[(__CFString *)v1 copy];

  return v2;
}

- (id)quote
{
  if ([a1 rangeOfString:@"\""] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28E78] stringWithString:a1];
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\", @"'", 2, 0, objc_msgSend(v2, "length""));
  }

  return v2;
}

- (id)unquote
{
  if ([a1 rangeOfString:@"\\\""] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28E78] stringWithString:a1];
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\\\", @"\", 2, 0, objc_msgSend(v2, "length"));
  }

  return v2;
}

- (uint64_t)hasMailto
{
  return [a1 hasPrefixCaseInsensitive:@"mailto:"];
}

- (BOOL)hasPrefixCaseInsensitive:()CalClassAdditions
{
  return [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)stringRemovingMailto
{
  id v1 = a1;
  if ([v1 hasMailto])
  {
    uint64_t v2 = [v1 substringFromIndex:7];

    id v1 = (id)v2;
  }

  return v1;
}

- (uint64_t)isEqualAsURL:()CalClassAdditions
{
  id v4 = a3;
  v5 = [a1 appendSlashIfNeeded];
  v6 = [v5 stringByURLUnquoting];

  v7 = [v4 appendSlashIfNeeded];

  v8 = [v7 stringByURLUnquoting];

  uint64_t v9 = [v6 isEqualToString:v8];
  return v9;
}

- (id)appendSlashIfNeeded
{
  if ([a1 hasSuffix:@"/"])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 stringByAppendingString:@"/"];
  }

  return v2;
}

- (__CFString)stringByURLUnquoting
{
  id v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_1EE0C39E0);
  if (!v2) {
    id v2 = originalString;
  }

  return v2;
}

- (id)stringByTrimmingWhitespaceAndRemovingNewlines
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v5 = [v3 stringByReplacingCharactersInSet:v4 withString:@" "];

  return v5;
}

- (id)stringByReplacingCharactersInSet:()CalClassAdditions withString:
{
  id v6 = a4;
  v7 = [a1 componentsSeparatedByCharactersInSet:a3];
  v8 = [v7 componentsJoinedByString:v6];

  return v8;
}

- (BOOL)isMailURL
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES[c] 'message:.*'"];
  v3 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v4 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  if ([v2 evaluateWithObject:a1]
    && ([MEMORY[0x1E4F1CB10] URLWithString:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES[c] 'mailitem:[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}?.*'"];

    if ([v7 evaluateWithObject:a1])
    {
      v8 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      BOOL v6 = v8 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    id v2 = v7;
  }

  return v6;
}

- (BOOL)isAddressBookURL
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES[c] 'addressbook://[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}:ABPerson'"];
  if ([v2 evaluateWithObject:a1]
    && ([MEMORY[0x1E4F1CB10] URLWithString:a1],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES[c] 'addressbook://[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}'"];

    if ([v5 evaluateWithObject:a1])
    {
      BOOL v6 = [MEMORY[0x1E4F1CB10] URLWithString:a1];
      BOOL v4 = v6 != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
    id v2 = v5;
  }

  return v4;
}

- (BOOL)resemblesEmailAddress
{
  BOOL result = 0;
  if ([a1 rangeOfString:@"/"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = [a1 rangeOfString:@"@"];
    if (v2 != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "rangeOfString:options:range:", @".", 0, v2 + v3, objc_msgSend(a1, "length") - (v2 + v3)) != 0x7FFFFFFFFFFFFFFFLL)
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)hasPrefixCaseAndDiacriticInsensitive:()CalClassAdditions
{
  return a3 && [a1 rangeOfString:a3 options:137] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)removeSlashIfNeeded
{
  if ([a1 hasSuffix:@"/"])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (uint64_t)stringByEncodingSlashes
{
  if (stringByEncodingSlashes_onceToken != -1) {
    dispatch_once(&stringByEncodingSlashes_onceToken, &__block_literal_global_66);
  }
  uint64_t v2 = stringByEncodingSlashes_allowedCharacters;

  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (id)radarLink
{
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES[c] '<rdar:\\/\\/problem\\/\\\\d{8}\\>.*'"];
  if ([v2 evaluateWithObject:a1])
  {
    uint64_t v3 = objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "rangeOfString:", @">") + 1);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)stringByURLQuoting
{
  if (stringByURLQuoting_onceToken != -1) {
    dispatch_once(&stringByURLQuoting_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = stringByURLQuoting_allowedCharacters;

  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (id)stringByURLQuotingPaths
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  uint64_t v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

- (uint64_t)stringByURLEscapingAllReservedCharacters
{
  if (stringByURLEscapingAllReservedCharacters_onceToken != -1) {
    dispatch_once(&stringByURLEscapingAllReservedCharacters_onceToken, &__block_literal_global_9);
  }
  uint64_t v2 = stringByURLEscapingAllReservedCharacters_allowedCharacters;

  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (id)stringByRemovingLastPathComponent
{
  id v1 = [a1 stringByDeletingLastPathComponent];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];

  return v2;
}

- (BOOL)hasSuffixCaseInsensitive:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  uint64_t v6 = v5 - [v4 length];
  BOOL v7 = v6 >= 0 && objc_msgSend(a1, "compare:options:range:locale:", v4, 1, v6, objc_msgSend(v4, "length"), 0) == 0;

  return v7;
}

- (BOOL)containsCaseInsensitive:()CalClassAdditions
{
  return [a1 rangeOfString:a3 options:1] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsCaseAndDiacriticInsensitive:()CalClassAdditions
{
  return [a1 rangeOfString:a3 options:129] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEqualToStringCaseInsensitive:()CalClassAdditions
{
  return a1 == a3 || objc_msgSend(a1, "caseInsensitiveCompare:", v3, v4) == 0;
}

- (id)userFromEmail
{
  if ([a1 resemblesEmailAddress])
  {
    uint64_t v2 = [a1 componentsSeparatedByString:@"@"];
    uint64_t v3 = [v2 objectAtIndex:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)hostFromEmail
{
  if ([a1 resemblesEmailAddress])
  {
    uint64_t v2 = [a1 componentsSeparatedByString:@"@"];
    uint64_t v3 = [v2 lastObject];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)stringAddingMailto
{
  if ([a1 hasMailto])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [@"mailto:" stringByAppendingString:a1];
  }

  return v2;
}

- (uint64_t)hasTel
{
  return [a1 hasPrefixCaseInsensitive:@"tel:"];
}

- (id)stringAddingTel
{
  if ([a1 hasTel])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [@"tel:" stringByAppendingString:a1];
  }

  return v2;
}

- (id)stringRemovingTel
{
  id v1 = a1;
  if ([v1 hasTel])
  {
    uint64_t v2 = [v1 substringFromIndex:4];

    id v1 = (id)v2;
  }

  return v1;
}

- (uint64_t)isMessagesURL
{
  return [a1 hasPrefixCaseInsensitive:@"sms:"];
}

- (uint64_t)cal_isWalletURL
{
  return [a1 hasPrefixCaseInsensitive:@"shoebox://"];
}

- (uint64_t)cal_isPhoneNumber
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  if (v2)
  {
    uint64_t v3 = _phoneNumberDetector();
    uint64_t v4 = objc_msgSend(v3, "matchesInString:options:range:", a1, 0, 0, v2);

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "resultType", (void)v15) == 32)
          {
            v11 = [v10 URL];
            v12 = [v11 scheme];
            char v13 = [v12 isEqualToString:@"tel"];

            if (v13) {
              goto LABEL_14;
            }
          }
          else if ([v10 resultType] == 2048)
          {
LABEL_14:
            uint64_t v2 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v2 = 0;
LABEL_15:
  }
  return v2;
}

- (id)phoneURL
{
  uint64_t v2 = [a1 length];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = _phoneNumberDetector();
    id v5 = objc_msgSend(v4, "matchesInString:options:range:", a1, 0, 0, v3);

    if ([v5 count])
    {
      uint64_t v6 = [v5 firstObject];
      uint64_t v7 = [v6 phoneNumber];
      uint64_t v8 = [v6 URL];
      uint64_t v9 = v8;
      if (v8
        && ([v8 scheme],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v10 isEqualToString:@"tel"],
            v10,
            v11))
      {
        id v12 = v9;
      }
      else if ([v7 length])
      {
        char v13 = (void *)MEMORY[0x1E4F1CB10];
        v14 = [NSString stringWithFormat:@"%@:%@", @"tel", v7];
        id v12 = [v13 URLWithString:v14];

        if (!v12)
        {
          long long v15 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
          uint64_t v16 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v15];

          long long v17 = (void *)MEMORY[0x1E4F1CB10];
          long long v18 = [NSString stringWithFormat:@"%@:%@", @"tel", v16];
          id v12 = [v17 URLWithString:v18];

          uint64_t v7 = (void *)v16;
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)calDataDetectedURL
{
  uint64_t v2 = [a1 length];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = _phoneNumberDetector();
    id v5 = objc_msgSend(v4, "matchesInString:options:range:", a1, 0, 0, v3);

    if ([v5 count])
    {
      uint64_t v6 = [v5 firstObject];
      uint64_t v7 = [v6 URL];
      if (!v7)
      {
        uint64_t v8 = [v6 phoneNumber];
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          v10 = (void *)MEMORY[0x1E4F1CB10];
          int v11 = [NSString stringWithFormat:@"%@:%@", @"tel", v8];
          uint64_t v7 = [v10 URLWithString:v11];

          if (!v7)
          {
            id v12 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
            uint64_t v13 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v12];

            v14 = (void *)MEMORY[0x1E4F1CB10];
            long long v15 = [NSString stringWithFormat:@"%@:%@", @"tel", v13];
            uint64_t v7 = [v14 URLWithString:v15];

            uint64_t v9 = (void *)v13;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
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

  return v7;
}

- (id)CalUncommentedAddress
{
  objc_sync_enter(@"AddressParsing");
  uint64_t v2 = (void *)CalUncommentedAddress_uncommentedAddresses;
  if (!CalUncommentedAddress_uncommentedAddresses)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (void *)CalUncommentedAddress_uncommentedAddresses;
    CalUncommentedAddress_uncommentedAddresses = (uint64_t)v3;

    uint64_t v2 = (void *)CalUncommentedAddress_uncommentedAddresses;
  }
  id v5 = [v2 objectForKey:a1];
  objc_sync_exit(@"AddressParsing");
  if (!v5)
  {
    uint64_t v6 = [a1 length];
    uint64_t v7 = (char *)NSZoneMalloc(0, 2 * v6 + 2);
    uint64_t v8 = v7;
    uint64_t v9 = MEMORY[0x1E4F14390];
    v10 = v7;
    if (v6 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      char v13 = 0;
      char v23 = 0;
      char v24 = 1;
      v10 = v7;
      do
      {
        unsigned int v14 = [a1 characterAtIndex:v11];
        unsigned int v15 = v14;
        if (v14 == 92)
        {
          if (v11 + 1 >= v6)
          {
            if ((v13 & 1) == 0)
            {
              if (v12 < 1) {
                goto LABEL_21;
              }
LABEL_18:
              char v13 = 0;
              v12 -= v14 == 41;
              goto LABEL_27;
            }
LABEL_13:
            *(_WORD *)v10 = v14;
            v10 += 2;
            v13 &= v14 != 34;
            goto LABEL_27;
          }
          *(_WORD *)v10 = 92;
          *((_WORD *)v10 + 1) = [a1 characterAtIndex:v11 + 1];
          v10 += 4;
          ++v11;
        }
        else
        {
          if (v13) {
            goto LABEL_13;
          }
          if (v14 == 40)
          {
            char v13 = 0;
            ++v12;
          }
          else
          {
            if (v12 > 0) {
              goto LABEL_18;
            }
            if (v14 != 60)
            {
              if ((v23 & (v14 == 62)) != 0) {
                break;
              }
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL))
                {
LABEL_22:
                  char v13 = 0;
                  if ((v24 & 1) == 0)
                  {
                    *(_WORD *)v10 = 32;
                    v10 += 2;
                  }
                  char v24 = 1;
                  goto LABEL_27;
                }
              }
              else
              {
LABEL_21:
                if ((*(_DWORD *)(v9 + 4 * v14 + 60) & 0x4000) != 0) {
                  goto LABEL_22;
                }
              }
              char v24 = 0;
              *(_WORD *)v10 = v15;
              v10 += 2;
              v13 |= v15 == 34;
              goto LABEL_27;
            }
            char v13 = 0;
            char v23 = 1;
            v10 = v8;
          }
        }
LABEL_27:
        ++v11;
      }
      while (v11 < v6);
    }
    uint64_t v16 = v10 - v8;
    do
    {
      long long v17 = v10;
      uint64_t v18 = v16;
      if (v10 <= v8) {
        break;
      }
      v10 -= 2;
      unint64_t v19 = *((unsigned __int16 *)v17 - 1);
      int v20 = v19 > 0x7F ? __maskrune(v19, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v19 + 60) & 0x4000;
      uint64_t v16 = v18 - 2;
    }
    while (v20);
    *(_WORD *)long long v17 = 0;
    id v5 = (void *)[[NSString alloc] initWithCharacters:v8 length:v18 >> 1];
    NSZoneFree(0, v8);
    objc_sync_enter(@"AddressParsing");
    [(id)CalUncommentedAddress_uncommentedAddresses setObject:v5 forKey:a1];
    objc_sync_exit(@"AddressParsing");
  }
  id v21 = v5;

  return v21;
}

- (id)CalAddressComment
{
  objc_sync_enter(@"AddressParsing");
  uint64_t v2 = (void *)CalAddressComment_addressComments;
  if (!CalAddressComment_addressComments)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (void *)CalAddressComment_addressComments;
    CalAddressComment_addressComments = (uint64_t)v3;

    uint64_t v2 = (void *)CalAddressComment_addressComments;
  }
  id v5 = [v2 objectForKey:a1];
  objc_sync_exit(@"AddressParsing");
  if (v5) {
    goto LABEL_88;
  }
  uint64_t v6 = [a1 length];
  NSUInteger v7 = 2 * v6 + 2;
  uint64_t v8 = (unsigned __int16 *)NSZoneMalloc(0, v7);
  uint64_t v9 = (unsigned __int16 *)NSZoneMalloc(0, v7);
  [a1 getCharacters:v9];
  if (v6 < 1)
  {
    LOBYTE(v18) = 0;
    uint64_t v19 = 0;
    goto LABEL_67;
  }
  v40 = a1;
  int v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  BOOL v13 = 1;
  while (1)
  {
    int v14 = v9[v12];
    if (v14 != 92) {
      break;
    }
LABEL_20:
    BOOL v13 = ++v12 < v6;
    if (v6 == v12) {
      goto LABEL_21;
    }
  }
  if (v14 == 34 && v11 == 0)
  {
    uint64_t v11 = 0;
    v10 ^= 1u;
    goto LABEL_20;
  }
  if (!((v14 != 40) | v10 & 1))
  {
    int v10 = 0;
    ++v11;
    goto LABEL_20;
  }
  if (!((v14 != 41) | v10 & 1))
  {
    int v10 = 0;
    --v11;
    goto LABEL_20;
  }
  if (v14 != 60 || ((v10 ^ 1) & 1) == 0 || v11) {
    goto LABEL_20;
  }
LABEL_21:
  int v16 = 0;
  int v17 = 0;
  int v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  id v21 = v9;
  v22 = v8;
  do
  {
    unsigned int v23 = *v21;
    if (v23 != 92)
    {
      BOOL v24 = v19 == 0;
      if (v23 == 34 && v19 == 0)
      {
        uint64_t v19 = 0;
        v18 ^= 1u;
      }
      else
      {
        if ((v23 != 41) | v18 & 1) {
          goto LABEL_30;
        }
        int v18 = 0;
        --v19;
      }
LABEL_38:
      if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *v21 + 60) & 0x4000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_39;
    }
    if (((v21[1] != 0) & ~v16) != 0)
    {
      int v16 = 1;
      goto LABEL_56;
    }
    BOOL v24 = v19 == 0;
LABEL_30:
    int v26 = (v23 == 60) & ~(_BYTE)v18 & v24;
    if (v26) {
      uint64_t v19 = 0;
    }
    v17 |= v26;
    if (v23 <= 0x7F) {
      goto LABEL_38;
    }
    if (!__maskrune(v23, 0x4000uLL)) {
      goto LABEL_44;
    }
LABEL_39:
    if (!v20) {
      goto LABEL_51;
    }
    unint64_t v27 = *(v22 - 1);
    if (v27 > 0x7F)
    {
      if (__maskrune(v27, 0x4000uLL)) {
        goto LABEL_51;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v27 + 60) & 0x4000) != 0)
    {
      goto LABEL_51;
    }
LABEL_44:
    int v28 = *v21;
    if (v28 != 34 || v19)
    {
      if (v13)
      {
        if (v17)
        {
          int v17 = 1;
          goto LABEL_51;
        }
      }
      else if (v19 < 1)
      {
        goto LABEL_51;
      }
      ++v20;
      unsigned __int16 *v22 = v28;
    }
LABEL_51:
    int v29 = *v21;
    if ((v29 != 40) | v18 & 1)
    {
      int v16 = 0;
      int v30 = (v29 != 62) | v18 | (v19 != 0);
      if ((v30 & 1) == 0) {
        uint64_t v19 = 0;
      }
      v17 &= v30;
    }
    else
    {
      int v18 = 0;
      int v16 = 0;
      ++v19;
    }
LABEL_56:
    v22 = &v8[v20];
    ++v21;
    --v6;
  }
  while (v6);
  a1 = v40;
  if (v20 >= 1)
  {
    v22 = &v8[v20];
    do
    {
      unint64_t v31 = *(v22 - 1);
      if (v31 > 0x7F)
      {
        if (!__maskrune(v31, 0x4000uLL)) {
          goto LABEL_68;
        }
      }
      else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v31 + 60) & 0x4000) == 0)
      {
        goto LABEL_68;
      }
      --v22;
    }
    while (v20-- > 1);
LABEL_67:
    uint64_t v20 = 0;
    v22 = v8;
  }
LABEL_68:
  unsigned __int16 *v22 = 0;
  if (v19 || (v18 & 1) != 0)
  {
    id v36 = a1;
LABEL_80:
    if (!v36) {
      goto LABEL_81;
    }
    goto LABEL_85;
  }
  v22 = &v8[v20];
  if (v20 < 2) {
    goto LABEL_81;
  }
  v33 = 0;
  uint64_t v34 = v20 + 1;
  while (2)
  {
    int v35 = *v8;
    if (v35 == 39)
    {
      if (*(v22 - 1) != 39) {
        break;
      }
      goto LABEL_77;
    }
    if (v35 == 34 && *(v22 - 1) == 34)
    {
LABEL_77:
      *--v22 = 0;
      id v36 = [NSString stringWithCharacters:v8 + 1 length:v34 - 3];

      --v34;
      v33 = v36;
      if (v34 <= 2) {
        goto LABEL_80;
      }
      continue;
    }
    break;
  }
  id v36 = v33;
  if (v33) {
    goto LABEL_85;
  }
LABEL_81:
  if (v22 == v8)
  {
    id v36 = 0;
  }
  else
  {
    id v36 = [NSString stringWithCharacters:v8 length:v22 - v8];
  }
LABEL_85:
  NSZoneFree(0, v8);
  NSZoneFree(0, v9);
  if (v22 == v8)
  {
    id v37 = a1;

    id v36 = v37;
  }
  objc_sync_enter(@"AddressParsing");
  id v5 = (void *)[v36 copy];

  [(id)CalAddressComment_addressComments setObject:v5 forKey:a1];
  objc_sync_exit(@"AddressParsing");
LABEL_88:
  id v38 = v5;

  return v38;
}

- (uint64_t)directionalityIsolatedString
{
  return [NSString stringWithFormat:@"⁨%@⁩", a1];
}

- (uint64_t)RTLString
{
  return [NSString stringWithFormat:@"\u200F%@\u202C", a1];
}

+ (id)ellipsisString
{
  __int16 v2 = 8230;
  v0 = [NSString stringWithCharacters:&v2 length:1];

  return v0;
}

- (void)cal_enumerateCharactersUsingBlock:()CalClassAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [a1 length];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    unint64_t v8 = 32;
    do
    {
      if (v8 + v7 > v6) {
        unint64_t v8 = v6 - v7;
      }
      objc_msgSend(a1, "getCharacters:range:", v10, v7, v8);
      if (v8)
      {
        for (unint64_t i = 0; i < v8; ++i)
          v4[2](v4, (unsigned __int16)v10[i]);
      }
      v7 += 32;
    }
    while (v7 < v6);
  }
}

+ (id)stringWithContentsOfFile:()CalClassAdditions usingEncoding:
{
  id v5 = a3;
  unint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  if (v6)
  {
    unint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v6 encoding:a4];
  }
  else
  {
    NSLog(&cfstr_UnableToReadDa.isa, v5);
    unint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)isPathToAppleScript
{
  id v1 = [a1 pathExtension];
  __int16 v2 = [v1 lowercaseString];
  uint64_t v3 = [v2 isEqualToString:@"scpt"];

  return v3;
}

- (uint64_t)isPathToVCalData
{
  __int16 v2 = [a1 pathExtension];
  uint64_t v3 = [v2 lowercaseString];
  if ([v3 isEqualToString:@"vcs"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [a1 pathExtension];
    unint64_t v6 = [v5 lowercaseString];
    uint64_t v4 = [v6 isEqualToString:@"vcal"];
  }
  return v4;
}

- (uint64_t)isPathToICalData
{
  id v1 = [a1 pathExtension];
  __int16 v2 = [v1 lowercaseString];
  uint64_t v3 = [v2 isEqualToString:@"ics"];

  return v3;
}

- (uint64_t)isPathToBackupFile
{
  id v1 = [a1 pathExtension];
  __int16 v2 = [v1 lowercaseString];
  uint64_t v3 = [v2 isEqualToString:@"icbu"];

  return v3;
}

- (uint64_t)isPathToICalBookmark
{
  id v1 = [a1 pathExtension];
  __int16 v2 = [v1 lowercaseString];

  uint64_t v3 = [v2 isEqualToString:@"icaltodo"];
  return v3;
}

- (BOOL)CalContainsSubstring:()CalClassAdditions
{
  return [a1 rangeOfString:a3 options:2] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)trimFinalChar:()CalClassAdditions
{
  if ([a1 length]
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == a3)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (id)trimFirstChar:()CalClassAdditions
{
  if ([a1 length] && objc_msgSend(a1, "characterAtIndex:", 0) == a3)
  {
    id v5 = [a1 substringFromIndex:1];
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (id)trimChar:()CalClassAdditions
{
  uint64_t v4 = objc_msgSend(a1, "trimFirstChar:");
  id v5 = [v4 trimFinalChar:a3];

  return v5;
}

- (id)trimFinalComma
{
  if ([a1 length]
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)trimFirstComma
{
  if ([a1 length] && objc_msgSend(a1, "characterAtIndex:", 0) == 44)
  {
    id v2 = [a1 substringFromIndex:1];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)trimCommas
{
  id v1 = [a1 trimFirstComma];
  id v2 = [v1 trimFinalComma];

  return v2;
}

- (id)searchAndReplaceString:()CalClassAdditions withString:
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a1];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v8 setCharactersToBeSkipped:0];
  if ([v8 scanString:v6 intoString:0]) {
    [v9 appendString:v7];
  }
  id v16 = 0;
  int v10 = [v8 scanUpToString:v6 intoString:&v16];
  id v11 = v16;
  uint64_t v12 = v11;
  if (v10)
  {
    do
    {
      [v9 appendString:v12];
      if ([v8 scanString:v6 intoString:0]) {
        [v9 appendString:v7];
      }
      id v16 = v12;
      char v13 = [v8 scanUpToString:v6 intoString:&v16];
      id v14 = v16;

      uint64_t v12 = v14;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    id v14 = v11;
  }

  return v9;
}

+ (id)stringWithFileSystemRepresentation:()CalClassAdditions
{
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v4 stringWithFileSystemRepresentation:a3 length:strlen(a3)];

  return v5;
}

- (__CFString)CalSafeFilename
{
  if (CalSafeFilename_onceToken != -1) {
    dispatch_once(&CalSafeFilename_onceToken, &__block_literal_global_102);
  }
  id v2 = [a1 stringByReplacingCharactersInSet:CalSafeFilename_disallowedCharacters withString:@"-"];
  if ([(__CFString *)v2 hasPrefix:@"."])
  {
    do
    {
      uint64_t v3 = [(__CFString *)v2 substringFromIndex:1];

      id v2 = v3;
    }
    while (([(__CFString *)v3 hasPrefix:@"."] & 1) != 0);
  }
  else
  {
    uint64_t v3 = v2;
  }
  if (![(__CFString *)v3 length])
  {

    uint64_t v3 = @"-";
  }

  return v3;
}

- (id)CalSafeHFSPathComponentName
{
  id v1 = [a1 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
  id v2 = [v1 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

  return v2;
}

- (uint64_t)stringByRemovingCharactersInSet:()CalClassAdditions
{
  return [a1 stringByReplacingCharactersInSet:a3 withString:&stru_1EE0C39E0];
}

- (id)stringByRemovingPrefixCaseInsensitive:()CalClassAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 copy];
  if ([a1 hasPrefixCaseInsensitive:v4])
  {
    uint64_t v6 = objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));

    id v5 = (void *)v6;
  }

  return v5;
}

+ (id)CalAutoCommentPrefix
{
  if (CalAutoCommentPrefix_onceToken != -1) {
    dispatch_once(&CalAutoCommentPrefix_onceToken, &__block_literal_global_116);
  }
  v0 = (void *)CalAutoCommentPrefix_prefix;

  return v0;
}

- (uint64_t)CalHasAutoCommentPrefix
{
  id v1 = [a1 componentsSeparatedByString:@"\n"];
  id v2 = [v1 firstObject];

  uint64_t v3 = [NSString CalAutoCommentPrefix];
  uint64_t v4 = 1;
  id v5 = [v3 substringFromIndex:1];
  if (([v2 containsString:v3] & 1) == 0) {
    uint64_t v4 = [v2 containsString:v5];
  }

  return v4;
}

- (__CFString)CalStringByRemovingAutoComment
{
  id v2 = (__CFString *)[a1 copy];
  if ([a1 CalHasAutoCommentPrefix])
  {
    uint64_t v3 = [a1 rangeOfString:@"\n"];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = &stru_1EE0C39E0;
    }
    else
    {
      uint64_t v4 = [a1 substringFromIndex:v3 + 1];
    }

    id v2 = v4;
  }

  return v2;
}

- (id)CalStringWithOnlyAutoComment
{
  if ([a1 CalHasAutoCommentPrefix])
  {
    uint64_t v2 = [a1 rangeOfString:@"\n"];
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v3 = (void *)[a1 copy];
      uint64_t v4 = [v3 stringByAppendingString:@"\n"];
    }
    else
    {
      uint64_t v4 = [a1 substringToIndex:v2 + 1];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)cal_stringWithNormalizedSpacesForUnitTesting
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"  "];
  uint64_t v3 = [a1 stringByReplacingCharactersInSet:v2 withString:@" "];

  return v3;
}

@end