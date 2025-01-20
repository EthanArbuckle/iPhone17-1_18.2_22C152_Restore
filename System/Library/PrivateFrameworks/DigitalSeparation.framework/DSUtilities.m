@interface DSUtilities
+ (BOOL)isContactsTCC:(id)a3;
+ (BOOL)shouldShowBioRatchetFlow;
+ (id)allApps;
+ (id)allUserVisibleApps;
+ (id)contactsServices;
+ (id)localizedDetailStringWithTruncationFromArray:(id)a3 withType:(id)a4;
+ (id)tccServices;
@end

@implementation DSUtilities

+ (id)localizedDetailStringWithTruncationFromArray:(id)a3 withType:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([v7 count] == 2)
        {
          v25[0] = v6;
          v25[1] = @"DETAIL_TEXT_TRUNCATION";
          v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
          v15 = [v14 componentsJoinedByString:@"_"];

          v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v17 = [v16 localizedStringForKey:v15 value:&stru_26E96B9B0 table:0];

          v18 = objc_msgSend(NSString, "localizedStringWithFormat:", v17, objc_msgSend(v8, "count") - 2);
          [v7 addObject:v18];

          goto LABEL_11;
        }
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v19 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v7];

  return v19;
}

+ (id)allUserVisibleApps
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v3 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 developerType] == 3)
        {
          uint64_t v9 = [v8 bundleIdentifier];
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)allApps
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)SBSCopyDisplayIdentifiers();
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)tccServices
{
  if (tccServices_token != -1) {
    dispatch_once(&tccServices_token, &__block_literal_global_316);
  }
  id v2 = (void *)tccServices_tccServices;
  return v2;
}

uint64_t __26__DSUtilities_tccServices__block_invoke()
{
  tccServices_tccServices = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"DSLocationAlways", @"DSLocationWhenInUse", *MEMORY[0x263F7C500], *MEMORY[0x263F7C598], *MEMORY[0x263F7C510], *MEMORY[0x263F7C5B8], *MEMORY[0x263F7C590], *MEMORY[0x263F7C688], *MEMORY[0x263F7C508], *MEMORY[0x263F7C5C8], @"DSContacts", @"DSHealth", @"DSLocalNetwork", *MEMORY[0x263F7C5A8], *MEMORY[0x263F7C5F0], 0);
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isContactsTCC:(id)a3
{
  id v3 = a3;
  id v4 = +[DSUtilities contactsServices];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (id)contactsServices
{
  if (contactsServices_token != -1) {
    dispatch_once(&contactsServices_token, &__block_literal_global_333);
  }
  id v2 = (void *)contactsServices_contactsTCCs;
  return v2;
}

uint64_t __31__DSUtilities_contactsServices__block_invoke()
{
  contactsServices_contactsTCCs = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F7C4F8], *MEMORY[0x263F7C520], *MEMORY[0x263F7C528], 0);
  return MEMORY[0x270F9A758]();
}

+ (BOOL)shouldShowBioRatchetFlow
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    id v3 = [MEMORY[0x263F10488] sharedInstance];
    char v4 = [v3 isFeatureEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

@end