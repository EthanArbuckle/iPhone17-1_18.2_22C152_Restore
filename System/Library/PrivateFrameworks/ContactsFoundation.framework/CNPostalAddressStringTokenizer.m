@interface CNPostalAddressStringTokenizer
+ (id)countryCodeByLookingUpCountryName:(id)a3;
+ (id)countryCodeForCountryName:(id)a3;
+ (id)countryCodeFromCurrentLocale;
+ (id)countryCodeFromCurrentNetwork;
+ (id)countryCodeFromHomeNetwork;
+ (id)postalAddressFromString:(id)a3 error:(id *)a4;
+ (id)tokenNameForScannerResultType:(id)a3;
- (id)postalAddressFromString:(id)a3 error:(id *)a4;
@end

@implementation CNPostalAddressStringTokenizer

+ (id)postalAddressFromString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CNPostalAddressStringTokenizer);
  v7 = [(CNPostalAddressStringTokenizer *)v6 postalAddressFromString:v5 error:a4];

  return v7;
}

- (id)postalAddressFromString:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F5F158] scanString:a3];
  v6 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", &__block_literal_global_69);
  if (v6)
  {
    v27 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = [v6 subResults];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v14 = objc_opt_class();
          v15 = [v13 type];
          v16 = [v14 tokenNameForScannerResultType:v15];

          if (v16)
          {
            v17 = [v13 value];
            [v7 setObject:v17 forKeyedSubscript:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    v18 = [v7 objectForKeyedSubscript:@"ISOCountryCode"];
    v19 = v18;
    if (!v18 || ![v18 length])
    {
      v20 = objc_opt_class();
      v21 = [v7 objectForKeyedSubscript:@"country"];
      uint64_t v22 = [v20 countryCodeForCountryName:v21];

      v19 = (void *)v22;
    }
    id v5 = v27;
    v23 = [v19 uppercaseString];

    [v7 setObject:v23 forKeyedSubscript:@"ISOCountryCode"];
  }
  else
  {
    v24 = +[CNFoundationError errorWithCode:9 userInfo:0];
    v25 = v24;
    if (a4) {
      *a4 = v24;
    }

    id v7 = 0;
  }

  return v7;
}

BOOL __64__CNPostalAddressStringTokenizer_postalAddressFromString_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 category] == 3;
}

+ (id)tokenNameForScannerResultType:(id)a3
{
  v12[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F0C0];
  v11[0] = *MEMORY[0x1E4F5F0B0];
  v11[1] = v3;
  v12[0] = @"street";
  v12[1] = @"subLocality";
  uint64_t v4 = *MEMORY[0x1E4F5F0B8];
  v11[2] = *MEMORY[0x1E4F5EF88];
  v11[3] = v4;
  v12[2] = @"city";
  v12[3] = @"subAdministrativeArea";
  uint64_t v5 = *MEMORY[0x1E4F5F110];
  v11[4] = *MEMORY[0x1E4F5F0A8];
  v11[5] = v5;
  v12[4] = @"state";
  v12[5] = @"postalCode";
  v11[6] = *MEMORY[0x1E4F5EFD0];
  v12[6] = @"country";
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:7];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  return v9;
}

+ (id)countryCodeForCountryName:(id)a3
{
  uint64_t v4 = [a1 countryCodeByLookingUpCountryName:a3];
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v4))
  {

    uint64_t v4 = [a1 countryCodeFromCurrentNetwork];
    if ((BOOL)off_1EE025420((uint64_t)&__block_literal_global_119, v4))
    {

      uint64_t v4 = [a1 countryCodeFromHomeNetwork];
      if ((BOOL)off_1EE025420((uint64_t)&__block_literal_global_119, v4))
      {

        uint64_t v4 = [a1 countryCodeFromCurrentLocale];
      }
    }
  }

  return v4;
}

+ (id)countryCodeByLookingUpCountryName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[CNEnvironmentBase currentEnvironment];
    uint64_t v5 = [v4 currentLocale];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = objc_msgSend(MEMORY[0x1E4F1CA20], "ISOCountryCodes", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = *MEMORY[0x1E4F1C400];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = [v5 displayNameForKey:v10 value:v12];
          if (![v3 compare:v13 options:129])
          {
            id v14 = v12;

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)countryCodeFromCurrentNetwork
{
  return +[CNPhoneNumberHelper currentCountryCode];
}

+ (id)countryCodeFromHomeNetwork
{
  return +[CNPhoneNumberHelper homeCountryCode];
}

+ (id)countryCodeFromCurrentLocale
{
  v2 = +[CNEnvironmentBase currentEnvironment];
  id v3 = [v2 currentLocale];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F1C400]];

  return v4;
}

@end