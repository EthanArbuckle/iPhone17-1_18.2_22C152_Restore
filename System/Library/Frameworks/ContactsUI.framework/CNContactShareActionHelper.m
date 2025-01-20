@interface CNContactShareActionHelper
+ (BOOL)contact:(id)a3 hasPrivateProperties:(id)a4;
+ (BOOL)contactHasShareableAddressingGrammarValue:(id)a3;
+ (BOOL)contactsHavePrivateProperties:(id)a3;
+ (BOOL)contactsHaveShareableAddressingGrammarValue:(id)a3;
@end

@implementation CNContactShareActionHelper

+ (BOOL)contactHasShareableAddressingGrammarValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = [v3 valueForKey:*MEMORY[0x1E4F1AD88]];

  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  char v7 = objc_msgSend(v6, "_cn_any:", &__block_literal_global_28804);
  return v7;
}

uint64_t __72__CNContactShareActionHelper_contactHasShareableAddressingGrammarValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 value];

  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = (*(unsigned int (**)(void))(*MEMORY[0x1E4F5A250] + 16))() ^ 1;
  return v6;
}

+ (BOOL)contactsHaveShareableAddressingGrammarValue:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__CNContactShareActionHelper_contactsHaveShareableAddressingGrammarValue___block_invoke;
  v4[3] = &__block_descriptor_40_e19_B16__0__CNContact_8l;
  v4[4] = a1;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __74__CNContactShareActionHelper_contactsHaveShareableAddressingGrammarValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) contactHasShareableAddressingGrammarValue:a2];
}

+ (BOOL)contact:(id)a3 hasPrivateProperties:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v26 = *MEMORY[0x1E4F1AD88];
    uint64_t v24 = *MEMORY[0x1E4F5A258];
    uint64_t v23 = *MEMORY[0x1E4F5A258] + 16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = objc_msgSend(MEMORY[0x1E4F1B898], "contactPropertiesByKey", v23, v24);
        v13 = [v12 objectForKey:v11];

        v14 = [v5 valueForKey:v11];
        if (v14)
        {
          if ([v13 isSingleValue])
          {
            v15 = [v13 nilValue];

            if (v14 != v15)
            {
              id v16 = v14;
LABEL_21:

              BOOL v21 = 1;
              goto LABEL_22;
            }
          }
          if ([v13 isMultiValue])
          {
            objc_opt_class();
            id v16 = v14;
            if (objc_opt_isKindOfClass()) {
              v17 = v16;
            }
            else {
              v17 = 0;
            }
            id v18 = v17;

            if ([v11 isEqualToString:v26])
            {
              char v19 = [a1 contactHasShareableAddressingGrammarValue:v5];

              v14 = v16;
              if (v19) {
                goto LABEL_21;
              }
            }
            else
            {
              int v20 = (*(uint64_t (**)(uint64_t, id))(v24 + 16))(v24, v18);

              if (!v20) {
                goto LABEL_21;
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 0;
LABEL_22:

  return v21;
}

+ (BOOL)contactsHavePrivateProperties:(id)a3
{
  id v4 = a3;
  id v5 = +[CNContactCardFieldPicker privateCardPropertiesForContacts:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CNContactShareActionHelper_contactsHavePrivateProperties___block_invoke;
  v9[3] = &unk_1E5498AB0;
  id v10 = v5;
  id v11 = a1;
  id v6 = v5;
  char v7 = objc_msgSend(v4, "_cn_any:", v9);

  return v7;
}

uint64_t __60__CNContactShareActionHelper_contactsHavePrivateProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) contact:a2 hasPrivateProperties:*(void *)(a1 + 32)];
}

@end