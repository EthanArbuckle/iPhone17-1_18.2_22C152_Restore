@interface CNUICoreContactScratchpad
+ (CNUICoreContactScratchpad)emptyScratchpad;
+ (id)editMatchingContact:(id)a3 inEdits:(id)a4;
+ (id)editsByReplacingEdit:(id)a3 withUpdatedEdit:(id)a4 inEdits:(id)a5;
+ (id)scratchpadByAddingUneditedContact:(id)a3 toScratchpad:(id)a4;
+ (id)scratchpadByRemovingModifiedContact:(id)a3 fromScratchpad:(id)a4;
+ (id)scratchpadBySettingModifiedContact:(id)a3 onExistingEditInScratchpad:(id)a4;
- (BOOL)containsContact:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNUICoreContactScratchpad)init;
- (CNUICoreContactScratchpad)initWithEdits:(id)a3;
- (NSSet)allContacts;
- (NSSet)edits;
- (NSSet)modifiedContacts;
- (id)description;
- (id)modifiedContactForContact:(id)a3;
- (id)modifiedIfPresentOtherwiseOriginalContactForContact:(id)a3;
- (id)scratchpadByAddingContacts:(id)a3;
- (id)scratchpadByKeepingContacts:(id)a3;
- (id)scratchpadByRemovingContacts:(id)a3;
- (unint64_t)hash;
@end

@implementation CNUICoreContactScratchpad

+ (CNUICoreContactScratchpad)emptyScratchpad
{
  v2 = objc_alloc_init(CNUICoreContactScratchpad);
  return v2;
}

- (CNUICoreContactScratchpad)init
{
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(CNUICoreContactScratchpad *)self initWithEdits:v3];

  return v4;
}

- (CNUICoreContactScratchpad)initWithEdits:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_51_0);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactScratchpad initWithEdits:]();
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CNUICoreContactScratchpad;
  v6 = [(CNUICoreContactScratchpad *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_edits, a3);
    v8 = v7;
  }

  return v7;
}

- (id)scratchpadByAddingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_51_0);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactScratchpad scratchpadByAddingContacts:]();
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CNUICoreContactScratchpad_scratchpadByAddingContacts___block_invoke;
  v7[3] = &unk_264017CF0;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "_cn_reduce:initialValue:", v7, self);

  return v5;
}

id __56__CNUICoreContactScratchpad_scratchpadByAddingContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  int v6 = [v5 containsContact:v4];
  v7 = objc_opt_class();
  if (v6) {
    [v7 scratchpadBySettingModifiedContact:v4 onExistingEditInScratchpad:v5];
  }
  else {
  v8 = [v7 scratchpadByAddingUneditedContact:v4 toScratchpad:v5];
  }

  return v8;
}

- (id)scratchpadByRemovingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_51_0);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactScratchpad scratchpadByRemovingContacts:]();
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CNUICoreContactScratchpad_scratchpadByRemovingContacts___block_invoke;
  v7[3] = &unk_264017CF0;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "_cn_reduce:initialValue:", v7, self);

  return v5;
}

id __58__CNUICoreContactScratchpad_scratchpadByRemovingContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 containsContact:v6])
  {
    id v7 = [(id)objc_opt_class() scratchpadByRemovingModifiedContact:v6 fromScratchpad:v5];
  }
  else
  {
    id v7 = *(id *)(a1 + 32);
  }
  v8 = v7;

  return v8;
}

- (id)scratchpadByKeepingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_51_0);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactScratchpad scratchpadByKeepingContacts:]();
    }
  }
  id v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_12);
  id v6 = [(CNUICoreContactScratchpad *)self allContacts];
  id v7 = [v6 allObjects];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__CNUICoreContactScratchpad_scratchpadByKeepingContacts___block_invoke;
  v13[3] = &unk_2640176E0;
  id v14 = v5;
  id v8 = v5;
  v9 = objc_msgSend(v7, "_cn_filter:", v13);

  objc_super v10 = [(CNUICoreContactScratchpad *)self scratchpadByRemovingContacts:v9];
  v11 = [v10 scratchpadByAddingContacts:v4];

  return v11;
}

uint64_t __57__CNUICoreContactScratchpad_scratchpadByKeepingContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)modifiedContactForContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(CNUICoreContactScratchpad *)self edits];
  id v7 = [v5 editMatchingContact:v4 inEdits:v6];

  if (v7 && [v7 originalAndModifiedDiffer])
  {
    id v8 = [v7 modified];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)modifiedIfPresentOtherwiseOriginalContactForContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(CNUICoreContactScratchpad *)self edits];
  id v7 = [v5 editMatchingContact:v4 inEdits:v6];

  if (v7)
  {
    id v8 = [v7 modified];

    if (v8) {
      [v7 modified];
    }
    else {
    v9 = [v7 original];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(CNUICoreContactScratchpad *)self edits];
  id v7 = [v5 editMatchingContact:v4 inEdits:v6];

  return v7 != 0;
}

- (NSSet)modifiedContacts
{
  v3 = [(CNUICoreContactScratchpad *)self edits];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__CNUICoreContactScratchpad_modifiedContacts__block_invoke;
  v7[3] = &unk_264017D18;
  v7[4] = self;
  id v4 = objc_msgSend(v3, "_cn_map:", v7);
  id v5 = objc_msgSend(v4, "_cn_filter:", *MEMORY[0x263F334C8]);

  return (NSSet *)v5;
}

id __45__CNUICoreContactScratchpad_modifiedContacts__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 original];
  id v4 = [v2 modifiedContactForContact:v3];

  return v4;
}

- (NSSet)allContacts
{
  v2 = [(CNUICoreContactScratchpad *)self edits];
  v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_21);

  return (NSSet *)v3;
}

uint64_t __40__CNUICoreContactScratchpad_allContacts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 modified];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNUICoreContactScratchpad *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (unint64_t v5 = (unint64_t)[(CNUICoreContactScratchpad *)self edits],
          unint64_t v6 = (unint64_t)[(CNUICoreContactScratchpad *)v4 edits],
          v5 | v6)
      && ![(id)v5 isEqual:v6])
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263F335E8];
  v3 = [(CNUICoreContactScratchpad *)self edits];
  unint64_t v4 = [v2 setHash:v3] + 527;

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  unint64_t v4 = [(CNUICoreContactScratchpad *)self edits];
  id v5 = (id)[v3 appendObject:v4 withName:@"edits"];

  unint64_t v6 = [v3 build];

  return v6;
}

+ (id)scratchpadByAddingUneditedContact:(id)a3 toScratchpad:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[CNUICoreContactEdit alloc] initWithContact:v6];

  id v8 = [v5 edits];

  v9 = [v8 setByAddingObject:v7];

  objc_super v10 = [[CNUICoreContactScratchpad alloc] initWithEdits:v9];
  return v10;
}

+ (id)scratchpadBySettingModifiedContact:(id)a3 onExistingEditInScratchpad:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 edits];
  v9 = [a1 editMatchingContact:v7 inEdits:v8];

  objc_super v10 = [v9 editBySettingModifiedContact:v7];

  v11 = objc_opt_class();
  v12 = [v6 edits];

  v13 = [v11 editsByReplacingEdit:v9 withUpdatedEdit:v10 inEdits:v12];

  id v14 = [[CNUICoreContactScratchpad alloc] initWithEdits:v13];
  return v14;
}

+ (id)editMatchingContact:(id)a3 inEdits:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__CNUICoreContactScratchpad_editMatchingContact_inEdits___block_invoke;
  v9[3] = &unk_264017D60;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a4, "_cn_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __57__CNUICoreContactScratchpad_editMatchingContact_inEdits___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modifiesContact:*(void *)(a1 + 32)];
}

+ (id)editsByReplacingEdit:(id)a3 withUpdatedEdit:(id)a4 inEdits:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __74__CNUICoreContactScratchpad_editsByReplacingEdit_withUpdatedEdit_inEdits___block_invoke;
  v17 = &unk_264017D88;
  id v18 = v7;
  id v19 = v8;
  id v9 = v8;
  id v10 = v7;
  v11 = objc_msgSend(a5, "_cn_map:", &v14);
  v12 = objc_msgSend(v11, "_cn_filter:", *MEMORY[0x263F334C8], v14, v15, v16, v17);

  return v12;
}

id __74__CNUICoreContactScratchpad_editsByReplacingEdit_withUpdatedEdit_inEdits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  int v5 = [v4 isEqual:v3];
  id v6 = v4;
  if (v5) {
    id v6 = *(void **)(a1 + 40);
  }
  id v7 = v6;

  return v7;
}

+ (id)scratchpadByRemovingModifiedContact:(id)a3 fromScratchpad:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 edits];
  id v9 = [a1 editMatchingContact:v7 inEdits:v8];

  id v10 = objc_opt_class();
  v11 = [v6 edits];

  v12 = [v10 editsByReplacingEdit:v9 withUpdatedEdit:0 inEdits:v11];

  v13 = [[CNUICoreContactScratchpad alloc] initWithEdits:v12];
  return v13;
}

- (NSSet)edits
{
  return self->_edits;
}

- (void).cxx_destruct
{
}

- (void)initWithEdits:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘edits’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)scratchpadByAddingContacts:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘contactsToAdd’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)scratchpadByRemovingContacts:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘contactsToRemove’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)scratchpadByKeepingContacts:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘contactsToKeep’ must be nonnull", v2, v3, v4, v5, v6);
}

@end