@interface FMFContactUtility
+ (id)sharedInstance;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (id)contactKeys;
- (id)displayNameForContact:(id)a3 andHandle:(id)a4;
- (id)findOptimalContactInContacts:(id)a3;
- (id)getContactForHandle:(id)a3;
- (id)getContactForHandle:(id)a3 keysToFetch:(id)a4;
- (id)shortDisplayNameForContact:(id)a3 andHandle:(id)a4;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation FMFContactUtility

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate_3 != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate_3, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance__instance_2;

  return v2;
}

void __35__FMFContactUtility_sharedInstance__block_invoke()
{
  v0 = LogCategory_Daemon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20AD87000, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFContactUtility", v7, 2u);
  }

  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__instance_2;
  sharedInstance__instance_2 = v1;

  v3 = [MEMORY[0x263EFEA58] storeWithOptions:3];
  [(id)sharedInstance__instance_2 setContactStore:v3];

  id v4 = objc_alloc_init(MEMORY[0x263EFEA20]);
  [(id)sharedInstance__instance_2 setContactFormatter:v4];

  v5 = [(id)sharedInstance__instance_2 contactFormatter];
  [v5 setStyle:0];

  v6 = [(id)sharedInstance__instance_2 contactStore];
  [v6 requestAccessForEntityType:0 completionHandler:&__block_literal_global_6];
}

void __35__FMFContactUtility_sharedInstance__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __35__FMFContactUtility_sharedInstance__block_invoke_3_cold_1(a2, (uint64_t)v4, v5);
  }
}

- (id)shortDisplayNameForContact:(id)a3 andHandle:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_8;
  }
  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v8 = [v7 BOOLForKey:@"NSPersonNameDefaultShouldPreferNicknamesPreference"];

  if (!v8
    || ([v5 nickname],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        !v10))
  {
    v12 = [v5 givenName];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      uint64_t v11 = [v5 givenName];
      goto LABEL_7;
    }
LABEL_8:
    v14 = &stru_26BEE3E40;
    goto LABEL_9;
  }
  uint64_t v11 = [v5 nickname];
LABEL_7:
  v14 = (__CFString *)v11;
LABEL_9:
  if (([(__CFString *)v14 isEqualToString:&stru_26BEE3E40] & 1) != 0 || !v14)
  {
    int v16 = [v6 isPhoneNumber];
    String = [v6 identifier];
    if (v16)
    {
      v17 = (const void *)CFPhoneNumberCreate();

      String = (void *)CFPhoneNumberCreateString();
      if (v17) {
        CFRelease(v17);
      }
    }
    else
    {
    }
  }
  else
  {
    String = v14;
  }
  v18 = LogCategory_Daemon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v6 identifier];
    int v21 = 138412546;
    v22 = String;
    __int16 v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_20AD87000, v18, OS_LOG_TYPE_DEFAULT, "Short display name %@ found for handle %@", (uint8_t *)&v21, 0x16u);
  }

  return String;
}

- (id)displayNameForContact:(id)a3 andHandle:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v9 = [v8 BOOLForKey:@"NSPersonNameDefaultShouldPreferNicknamesPreference"];

    if (v9
      && ([v6 nickname],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v11))
    {
      v12 = [v6 nickname];
    }
    else
    {
      uint64_t v13 = [(FMFContactUtility *)self contactFormatter];
      v12 = [v13 stringFromPotentiallySuggestedContact:v6 relatedToProperty:0];
    }
  }
  else
  {
    v12 = &stru_26BEE3E40;
  }
  if (([(__CFString *)v12 isEqualToString:&stru_26BEE3E40] & 1) != 0 || !v12)
  {
    int v15 = [v7 isPhoneNumber];
    String = [v7 identifier];
    if (v15)
    {
      int v16 = (const void *)CFPhoneNumberCreate();

      String = (void *)CFPhoneNumberCreateString();
      if (v16) {
        CFRelease(v16);
      }
    }
    else
    {
    }
  }
  else
  {
    String = v12;
  }
  v17 = LogCategory_Daemon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v7 identifier];
    int v20 = 138412546;
    int v21 = String;
    __int16 v22 = 2112;
    __int16 v23 = v18;
    _os_log_impl(&dword_20AD87000, v17, OS_LOG_TYPE_DEFAULT, "Display name %@ found for handle %@", (uint8_t *)&v20, 0x16u);
  }

  return String;
}

- (id)getContactForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFContactUtility *)self contactKeys];
  id v6 = [(FMFContactUtility *)self getContactForHandle:v4 keysToFetch:v5];

  return v6;
}

- (id)getContactForHandle:(id)a3 keysToFetch:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v13 = 0;
    v14 = 0;
    id v15 = 0;
LABEL_15:
    __int16 v23 = 0;
    goto LABEL_17;
  }
  int v8 = (void *)MEMORY[0x21052D920]();
  if (![v6 isPhoneNumber])
  {
    int v16 = (void *)MEMORY[0x263EFE9F8];
    uint64_t v11 = [v6 identifier];
    uint64_t v12 = [v16 predicateForContactsMatchingEmailAddress:v11];
    goto LABEL_7;
  }
  id v9 = objc_alloc(MEMORY[0x263EFEB28]);
  uint64_t v10 = [v6 identifier];
  uint64_t v11 = (void *)[v9 initWithStringValue:v10];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v11];
LABEL_7:
    uint64_t v13 = (void *)v12;
    goto LABEL_8;
  }
  uint64_t v13 = 0;
LABEL_8:

  v17 = [MEMORY[0x263EFFA68] arrayByAddingObject:*MEMORY[0x263EFDFF8]];
  v18 = v17;
  if (v7)
  {
    uint64_t v19 = [v17 arrayByAddingObjectsFromArray:v7];

    v18 = (void *)v19;
  }
  int v20 = LogCategory_Daemon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v20, OS_LOG_TYPE_DEFAULT, "Get contacts...", buf, 2u);
  }

  int v21 = [(FMFContactUtility *)self contactStore];
  id v25 = 0;
  v14 = [v21 unifiedContactsMatchingPredicate:v13 keysToFetch:v18 error:&v25];
  id v15 = v25;

  __int16 v22 = LogCategory_Daemon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v14;
    _os_log_impl(&dword_20AD87000, v22, OS_LOG_TYPE_DEFAULT, "Contacts: %@", buf, 0xCu);
  }

  if (v15) {
    goto LABEL_15;
  }
  __int16 v23 = [(FMFContactUtility *)self findOptimalContactInContacts:v14];
LABEL_17:

  return v23;
}

- (id)findOptimalContactInContacts:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 firstObject];
  if ((unint64_t)[v3 count] >= 2)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = [v10 imageData];

          if (v11)
          {
            id v14 = v10;

            id v4 = v14;
            goto LABEL_17;
          }
          if ([v4 isSuggested] && (objc_msgSend(v10, "isSuggested") & 1) == 0)
          {
            uint64_t v12 = LogCategory_Daemon();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              [(FMFContactUtility *)&v16 findOptimalContactInContacts:v12];
            }

            id v13 = v10;
            id v4 = v13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }

  return v4;
}

- (id)contactKeys
{
  v20[32] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFE020];
  v20[0] = *MEMORY[0x263EFDFE0];
  v20[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFDFC8];
  v20[2] = *MEMORY[0x263EFE040];
  v20[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFDFB8];
  v20[4] = *MEMORY[0x263EFE038];
  v20[5] = v4;
  uint64_t v5 = *MEMORY[0x263EFE048];
  v20[6] = *MEMORY[0x263EFE0B8];
  v20[7] = v5;
  uint64_t v6 = *MEMORY[0x263EFE088];
  v20[8] = *MEMORY[0x263EFE050];
  v20[9] = v6;
  uint64_t v7 = *MEMORY[0x263EFE080];
  v20[10] = *MEMORY[0x263EFE090];
  v20[11] = v7;
  uint64_t v8 = *MEMORY[0x263EFDF70];
  v20[12] = *MEMORY[0x263EFE068];
  v20[13] = v8;
  uint64_t v9 = *MEMORY[0x263EFDF48];
  v20[14] = *MEMORY[0x263EFE018];
  v20[15] = v9;
  uint64_t v10 = *MEMORY[0x263EFE060];
  v20[16] = *MEMORY[0x263EFE058];
  v20[17] = v10;
  uint64_t v11 = *MEMORY[0x263EFE140];
  v20[18] = *MEMORY[0x263EFDFF8];
  v20[19] = v11;
  uint64_t v12 = *MEMORY[0x263EFE0A8];
  v20[20] = *MEMORY[0x263EFE0B0];
  v20[21] = v12;
  uint64_t v13 = *MEMORY[0x263EFE148];
  v20[22] = *MEMORY[0x263EFDFF0];
  v20[23] = v13;
  uint64_t v14 = *MEMORY[0x263EFDF80];
  v20[24] = *MEMORY[0x263EFE070];
  v20[25] = v14;
  uint64_t v15 = *MEMORY[0x263EFDF68];
  v20[26] = *MEMORY[0x263EFE0A0];
  v20[27] = v15;
  uint64_t v16 = *MEMORY[0x263EFE0F8];
  v20[28] = *MEMORY[0x263EFE150];
  v20[29] = v16;
  uint64_t v17 = *MEMORY[0x263EFE010];
  v20[30] = *MEMORY[0x263EFE110];
  v20[31] = v17;
  long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:32];

  return v18;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __35__FMFContactUtility_sharedInstance__block_invoke_3_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_20AD87000, log, OS_LOG_TYPE_ERROR, "Request access to contact store %d %@", (uint8_t *)v3, 0x12u);
}

- (void)findOptimalContactInContacts:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_20AD87000, log, OS_LOG_TYPE_DEBUG, "Overriding suggested contact with new contact", buf, 2u);
}

@end