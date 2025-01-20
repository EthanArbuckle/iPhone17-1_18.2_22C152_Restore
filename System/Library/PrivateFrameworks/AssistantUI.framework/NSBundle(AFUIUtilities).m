@interface NSBundle(AFUIUtilities)
+ (uint64_t)afui_assistantUIFrameworkBundle;
- (CFArrayRef)_assistantUIlocalizationArrayForLanguageCode:()AFUIUtilities;
- (id)_assistantUILocalizedStringForKey:()AFUIUtilities value:table:language:;
- (id)_assistantUIStringForKey:()AFUIUtilities value:table:localizationLanguageCode:;
- (id)assistantUILocalizedStringForKey:()AFUIUtilities value:table:;
- (id)assistantUILocalizedStringFromSiriLanguageForKey:()AFUIUtilities table:;
- (id)assistantUILocalizedStringFromSystemLanguageForKey:()AFUIUtilities table:;
- (uint64_t)assistantLanguageIsRTL;
- (uint64_t)assistantUILocale;
- (uint64_t)assistantUILocalizedStringForKey:()AFUIUtilities table:;
@end

@implementation NSBundle(AFUIUtilities)

+ (uint64_t)afui_assistantUIFrameworkBundle
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AssistantUIFramework"];
}

- (uint64_t)assistantLanguageIsRTL
{
  v0 = (void *)MEMORY[0x263EFF960];
  v1 = SRUIFGetLanguageCode();
  if ([v0 characterDirectionForLanguage:v1] == 2)
  {
    uint64_t v2 = 1;
  }
  else
  {
    v3 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v2 = [v3 assistantLanguageForceRTL];
  }
  return v2;
}

- (uint64_t)assistantUILocale
{
  return MEMORY[0x270F72820]();
}

- (id)assistantUILocalizedStringFromSiriLanguageForKey:()AFUIUtilities table:
{
  v6 = (void *)MEMORY[0x263F285A0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 sharedPreferences];
  v10 = [v9 languageCode];
  v11 = [a1 _assistantUILocalizedStringForKey:v8 value:0 table:v7 language:v10];

  return v11;
}

- (id)assistantUILocalizedStringFromSystemLanguageForKey:()AFUIUtilities table:
{
  v6 = (void *)MEMORY[0x263EFF960];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 preferredLanguages];
  v10 = [v9 objectAtIndex:0];
  v11 = [a1 _assistantUILocalizedStringForKey:v8 value:0 table:v7 language:v10];

  return v11;
}

- (uint64_t)assistantUILocalizedStringForKey:()AFUIUtilities table:
{
  return [a1 assistantUILocalizedStringForKey:a3 value:0 table:a4];
}

- (id)assistantUILocalizedStringForKey:()AFUIUtilities value:table:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = SRUIFGetLanguageCode();
  v12 = [a1 _assistantUILocalizedStringForKey:v10 value:v9 table:v8 language:v11];

  return v12;
}

- (id)_assistantUILocalizedStringForKey:()AFUIUtilities value:table:language:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13) {
    goto LABEL_19;
  }
  [a1 _assistantUIlocalizationArrayForLanguageCode:v13];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v15)
  {

LABEL_19:
    v17 = 0;
LABEL_20:
    v21 = v10;
    if (v11)
    {
      if ([v11 length]) {
        v21 = v11;
      }
      else {
        v21 = v10;
      }
    }
    id v22 = v21;

    v17 = v22;
    goto LABEL_25;
  }
  uint64_t v16 = v15;
  id v24 = v13;
  v17 = 0;
  uint64_t v18 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      v20 = v17;
      if (*(void *)v26 != v18) {
        objc_enumerationMutation(v14);
      }
      v17 = [a1 _assistantUIStringForKey:v10 value:v11 table:v12 localizationLanguageCode:*(void *)(*((void *)&v25 + 1) + 8 * i)];

      if (v17
        && ([v17 isEqualToString:v10] & 1) == 0
        && (!v11 || ![v17 isEqualToString:v11]))
      {

        goto LABEL_16;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16) {
      continue;
    }
    break;
  }

  if (!v17)
  {
    id v13 = v24;
    goto LABEL_20;
  }
LABEL_16:
  id v13 = v24;
  if (![v17 length]) {
    goto LABEL_20;
  }
LABEL_25:

  return v17;
}

- (CFArrayRef)_assistantUIlocalizationArrayForLanguageCode:()AFUIUtilities
{
  id v4 = a3;
  CFArrayRef v5 = (const __CFArray *)[a1 localizations];
  CFArrayRef v6 = (const __CFArray *)[MEMORY[0x263EFF8C0] arrayWithObject:v4];

  CFArrayRef v7 = CFBundleCopyLocalizationsForPreferences(v5, v6);

  return v7;
}

- (id)_assistantUIStringForKey:()AFUIUtilities value:table:localizationLanguageCode:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  CFBundleGetBundleWithIdentifier((CFStringRef)[a1 bundleIdentifier]);
  id v14 = (void *)CFBundleCopyLocalizedStringForLocalization();

  return v14;
}

@end