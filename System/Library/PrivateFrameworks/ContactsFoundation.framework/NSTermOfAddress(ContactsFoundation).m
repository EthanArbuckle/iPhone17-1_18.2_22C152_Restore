@interface NSTermOfAddress(ContactsFoundation)
+ (__CFString)localizedDescriptionForAddressingGrammars:()ContactsFoundation uppercased:;
+ (id)os_log;
+ (id)pronounDescriptionsForAddressingGrammars:()ContactsFoundation uppercased:;
+ (id)termOfAddressFromDataRepresentation:()ContactsFoundation;
+ (id)termOfAddressFromStringRepresentation:()ContactsFoundation;
+ (uint64_t)empty;
+ (uint64_t)localizedDescriptionForAddressingGrammars:()ContactsFoundation;
+ (uint64_t)unspecified;
- (__CFString)localizedShortDescription;
- (id)dataRepresentation;
- (id)locale;
- (id)localizedLanguageDescription;
- (id)pronounDescriptions;
- (id)stringRepresentation;
- (uint64_t)isUnspecified;
@end

@implementation NSTermOfAddress(ContactsFoundation)

+ (id)os_log
{
  if (os_log_cn_once_token_1_4 != -1) {
    dispatch_once(&os_log_cn_once_token_1_4, &__block_literal_global_7_0);
  }
  v0 = (void *)os_log_cn_once_object_1_4;

  return v0;
}

+ (uint64_t)unspecified
{
  return [MEMORY[0x1E4F29040] localizedForLanguageIdentifier:@"unt" withPronouns:MEMORY[0x1E4F1CBF0]];
}

+ (uint64_t)empty
{
  return [MEMORY[0x1E4F29040] localizedForLanguageIdentifier:&stru_1EE0267A8 withPronouns:MEMORY[0x1E4F1CBF0]];
}

+ (id)termOfAddressFromDataRepresentation:()ContactsFoundation
{
  if (a3)
  {
    v3 = objc_msgSend(a3, "_cn_trimTrailingZeros");
    v4 = +[CNDataEncoder decodeAddressingGrammarData:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)termOfAddressFromStringRepresentation:()ContactsFoundation
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithBase64EncodedString:v5 options:0];

    v7 = [a1 termOfAddressFromDataRepresentation:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)isUnspecified
{
  v1 = [a1 languageIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"unt"];

  return v2;
}

- (id)dataRepresentation
{
  v1 = +[CNDataEncoder encodeAddressingGrammar:a1];
  if (v1)
  {
    uint64_t v2 = v1;
    v3 = objc_msgSend(v1, "_cn_padDataToLength:", 280);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)stringRepresentation
{
  v1 = [a1 dataRepresentation];
  uint64_t v2 = v1;
  if (v1)
  {
    v3 = [v1 base64EncodedStringWithOptions:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)pronounDescriptions
{
  if ((CNIsAddressingGrammarEmpty_block_invoke((uint64_t)a1, a1) & 1) != 0
    || ([a1 pronouns],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        BOOL v3 = off_1EE0248A0((uint64_t)&__block_literal_global_5, v2),
        v2,
        v3))
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v5 = [a1 pronouns];
    v6 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_17);

    v4 = objc_msgSend(v6, "_cn_distinctObjects");
  }

  return v4;
}

+ (id)pronounDescriptionsForAddressingGrammars:()ContactsFoundation uppercased:
{
  id v5 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v5))
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__NSTermOfAddress_ContactsFoundation__pronounDescriptionsForAddressingGrammars_uppercased___block_invoke;
    v9[3] = &__block_descriptor_33_e35___NSString_16__0__NSTermOfAddress_8l;
    char v10 = a4;
    v7 = objc_msgSend(v5, "_cn_compactMap:", v9);
    v6 = objc_msgSend(v7, "_cn_distinctObjects");
  }

  return v6;
}

+ (uint64_t)localizedDescriptionForAddressingGrammars:()ContactsFoundation
{
  return [a1 localizedDescriptionForAddressingGrammars:a3 uppercased:0];
}

+ (__CFString)localizedDescriptionForAddressingGrammars:()ContactsFoundation uppercased:
{
  id v6 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v6))
  {
    v7 = &stru_1EE0267A8;
  }
  else
  {
    if ([v6 count] == 1)
    {
      v8 = [v6 firstObject];
      v9 = [v8 localizedShortDescription];
      char v10 = v9;
      if (a4)
      {
        v11 = [v8 locale];
        v7 = [v10 uppercaseStringWithLocale:v11];
      }
      else
      {
        v7 = v9;
      }
    }
    else
    {
      v8 = [a1 pronounDescriptionsForAddressingGrammars:v6 uppercased:a4];
      if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v8))
      {
        v7 = &stru_1EE0267A8;
      }
      else if ([v8 count] == 1)
      {
        v7 = [v8 firstObject];
      }
      else
      {
        uint64_t v12 = [v8 count];
        v13 = NSString;
        v14 = CNContactsFoundationBundle();
        v15 = v14;
        if (v12 == 2)
        {
          v16 = [v14 localizedStringForKey:@"ADDRESSING_GRAMMAR_DESCRIPTION_MULTIPLE-%@-%@" value:&stru_1EE0267A8 table:@"AddressingGrammar"];
          v17 = [v8 objectAtIndexedSubscript:0];
          v18 = [v8 objectAtIndexedSubscript:1];
          objc_msgSend(v13, "localizedStringWithFormat:", v16, v17, v18);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = [v14 localizedStringForKey:@"ADDRESSING_GRAMMAR_DESCRIPTION_MULTIPLE-%@-%@-%@" value:&stru_1EE0267A8 table:@"AddressingGrammar"];
          v17 = [v8 objectAtIndexedSubscript:0];
          v18 = [v8 objectAtIndexedSubscript:1];
          v19 = [v8 objectAtIndexedSubscript:2];
          objc_msgSend(v13, "localizedStringWithFormat:", v16, v17, v18, v19);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  return v7;
}

- (__CFString)localizedShortDescription
{
  v1 = [a1 pronounDescriptions];
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v1))
  {
    uint64_t v2 = &stru_1EE0267A8;
  }
  else if ([v1 count] == 1)
  {
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    uint64_t v3 = [v1 count];
    v4 = NSString;
    id v5 = CNContactsFoundationBundle();
    id v6 = v5;
    if (v3 == 2)
    {
      v7 = [v5 localizedStringForKey:@"ADDRESSING_GRAMMAR_DESCRIPTION-%@-%@" value:&stru_1EE0267A8 table:@"AddressingGrammar"];
      v8 = [v1 objectAtIndexedSubscript:0];
      v9 = [v1 objectAtIndexedSubscript:1];
      objc_msgSend(v4, "localizedStringWithFormat:", v7, v8, v9);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = [v5 localizedStringForKey:@"ADDRESSING_GRAMMAR_DESCRIPTION-%@-%@-%@" value:&stru_1EE0267A8 table:@"AddressingGrammar"];
      v8 = [v1 objectAtIndexedSubscript:0];
      v9 = [v1 objectAtIndexedSubscript:1];
      char v10 = [v1 objectAtIndexedSubscript:2];
      objc_msgSend(v4, "localizedStringWithFormat:", v7, v8, v9, v10);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (id)localizedLanguageDescription
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [a1 languageIdentifier];
  v4 = [v2 localizedStringForLanguageCode:v3];

  return v4;
}

- (id)locale
{
  v1 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v2 = [a1 languageIdentifier];
  uint64_t v3 = [v1 localeWithLocaleIdentifier:v2];

  return v3;
}

@end