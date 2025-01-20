@interface CNComposeRecipientNamer
+ (__CFString)nameForComposeRecipient:(uint64_t)a3 sources:;
+ (id)buildAdHocNameForGroup:(id)a3;
+ (id)displayStringForRecipient:(id)a3;
+ (id)nameForComposeRecipient:(uint64_t)a1;
+ (id)nameForGroup:(id)a3 sources:(unsigned int)a4;
+ (id)nameForPerson:(id)a3 sources:(unsigned int)a4;
+ (id)nameFromAddressForPerson:(id)a3;
+ (id)nameFromComponentsForPerson:(id)a3;
+ (id)nameFromContactForPerson:(id)a3;
+ (id)nameFromEmailAddressForPerson:(id)a3;
+ (id)nicknameForRecipient:(id)a3;
+ (id)os_log;
@end

@implementation CNComposeRecipientNamer

+ (id)os_log
{
  if (os_log_cn_once_token_1_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_9);
  }
  v2 = (void *)os_log_cn_once_object_1_1;

  return v2;
}

uint64_t __33__CNComposeRecipientNamer_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "compose-recipient-namer");
  uint64_t v1 = os_log_cn_once_object_1_1;
  os_log_cn_once_object_1_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)nameForComposeRecipient:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  v4 = +[CNComposeRecipientNamer nameForComposeRecipient:sources:](v3, v2, 0xFFFFFFFFLL);

  return v4;
}

+ (__CFString)nameForComposeRecipient:(uint64_t)a3 sources:
{
  id v4 = a2;
  v5 = self;
  if (v4)
  {
    if ([v4 isGroup]) {
      [v5 nameForGroup:v4 sources:a3];
    }
    else {
    v7 = [v5 nameForPerson:v4 sources:a3];
    }
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientShortNamer shortNameForComposeRecipient:](v6);
    }

    v7 = &stru_1F0EC0C28;
  }

  return v7;
}

+ (id)nameForGroup:(id)a3 sources:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = [a1 nicknameForRecipient:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_17;
    }
  }
  if ((a4 & 2) != 0)
  {
    v7 = [a1 displayStringForRecipient:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_17;
    }
  }
  if ((a4 & 4) != 0)
  {
    v7 = [a1 buildAdHocNameForGroup:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_17;
    }
  }
  if ((a4 & 0x80000000) != 0)
  {
    v7 = [v6 placeholderName];
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer nameForGroup:sources:]();
    }
  }
  else
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer nameForGroup:sources:]();
    }
    v7 = &stru_1F0EC0C28;
  }

LABEL_17:

  return v7;
}

+ (id)nicknameForRecipient:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  if ([v4 shortNameFormatPrefersNicknames])
  {
    v5 = [v3 nameComponents];
    id v6 = [v5 nickname];

    if (v6 && [v6 length])
    {
      v7 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[CNComposeRecipientNamer nicknameForRecipient:]();
      }
      goto LABEL_10;
    }
  }
  v7 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[CNComposeRecipientNamer nicknameForRecipient:]();
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

+ (id)displayStringForRecipient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 displayString];
  v5 = v4;
  if (!v4 || ![v4 length])
  {
    v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer displayStringForRecipient:]();
    }
    goto LABEL_10;
  }
  id v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[CNComposeRecipientNamer displayStringForRecipient:].cold.4((uint64_t)v5, v6);
  }

  int v7 = objc_msgSend(v5, "_cn_hasPrefix:", @"\u200E");
  v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CNComposeRecipientNamer displayStringForRecipient:v9];
    }
LABEL_10:

    id v10 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[CNComposeRecipientNamer displayStringForRecipient:]();
  }

  id v10 = v5;
LABEL_11:

  return v10;
}

+ (id)buildAdHocNameForGroup:(id)a3
{
  id v4 = a3;
  v5 = [v4 children];
  id v6 = objc_opt_new();
  int v7 = objc_alloc_init(CNNameListBuilderBlockDelegate);
  v8 = [v4 children];
  -[CNNameListBuilderBlockDelegate setCountOfNames:](v7, "setCountOfNames:", [v8 count]);

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke;
  v22[3] = &unk_1E6128C50;
  id v9 = v6;
  id v23 = v9;
  id v10 = v5;
  id v24 = v10;
  id v26 = a1;
  id v11 = v4;
  id v25 = v11;
  [(CNNameListBuilderBlockDelegate *)v7 setNameProviderBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke_10;
  v20[3] = &unk_1E6128660;
  id v12 = v9;
  id v21 = v12;
  [(CNNameListBuilderBlockDelegate *)v7 setLengthValidationBlock:v20];
  v13 = [[CNNameListBuilder alloc] initWithDelegate:v7];
  [(CNNameListBuilder *)v13 setShouldStripEllipses:1];
  v14 = [(CNNameListBuilder *)v13 build];
  v15 = v14;
  if (v14 && [v14 length])
  {
    v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer buildAdHocNameForGroup:]();
    }

    id v17 = v15;
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[CNComposeRecipientNamer buildAdHocNameForGroup:]();
    }

    id v17 = 0;
  }

  return v17;
}

id __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addIndex:a2];
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v5 = [v4 compositeName];
  id v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544387;
    v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2048;
    v20 = v4;
    __int16 v21 = 2113;
    v22 = v5;
    _os_log_debug_impl(&dword_1B5AF5000, v6, OS_LOG_TYPE_DEBUG, "Group %{public}@ %p contains member %{public}@ %p: %{private}@", (uint8_t *)&v13, 0x34u);
  }

  return v5;
}

BOOL __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke_10(uint64_t a1)
{
  return (unint64_t)[*(id *)(a1 + 32) count] < 2;
}

+ (id)nameForPerson:(id)a3 sources:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    int v7 = [a1 nicknameForRecipient:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_23;
    }
  }
  if ((a4 & 2) != 0)
  {
    int v7 = [a1 displayStringForRecipient:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_23;
    }
  }
  if ((a4 & 8) != 0)
  {
    int v7 = [a1 nameFromComponentsForPerson:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_23;
    }
  }
  if ((a4 & 0x10) != 0)
  {
    int v7 = [a1 nameFromContactForPerson:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_23;
    }
  }
  if ((a4 & 0x20) != 0)
  {
    int v7 = [a1 nameFromAddressForPerson:v6];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      goto LABEL_23;
    }
  }
  if ((a4 & 0x80000000) != 0)
  {
    int v7 = [v6 placeholderName];
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer nameForPerson:sources:]();
    }
  }
  else
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer nameForPerson:sources:]();
    }
    int v7 = &stru_1F0EC0C28;
  }

LABEL_23:

  return v7;
}

+ (id)nameFromComponentsForPerson:(id)a3
{
  id v3 = a3;
  id v4 = [v3 nameComponents];
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v5 setStyle:3];
    id v6 = [v5 stringFromPersonNameComponents:v4];
    int v7 = v6;
    if (v6 && [v6 length])
    {
      v8 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[CNComposeRecipientNamer nameFromComponentsForPerson:]();
      }

      id v9 = v7;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer nameFromComponentsForPerson:]();
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)nameFromContactForPerson:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contact];
  v5 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
  id v6 = v5;
  if (v5 && [v5 length])
  {
    int v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientNamer nameFromContactForPerson:]();
    }

    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)nameFromAddressForPerson:(id)a3
{
  id v4 = a3;
  if ([v4 kind] && objc_msgSend(v4, "kind") != 2)
  {
    uint64_t v5 = [v4 address];
  }
  else
  {
    uint64_t v5 = [a1 nameFromEmailAddressForPerson:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

+ (id)nameFromEmailAddressForPerson:(id)a3
{
  id v3 = a3;
  id v4 = [v3 address];
  if ([v4 length])
  {
    uint64_t v5 = objc_msgSend(v4, "ea_addressComment");
    id v6 = v5;
    if (v5 && ([v5 isEqualToString:v4] & 1) == 0)
    {
      id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[CNComposeRecipientNamer nameFromEmailAddressForPerson:]();
      }

      id v10 = v6;
    }
    else
    {
      int v7 = [v3 uncommentedAddress];
      id v8 = v7;
      if (v7 && [v7 length])
      {
        id v9 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          +[CNComposeRecipientNamer nameFromEmailAddressForPerson:]();
        }
      }
      else
      {
        id v9 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          +[CNComposeRecipientNamer nameFromEmailAddressForPerson:]();
        }
      }

      id v10 = v4;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)nameForGroup:sources:.cold.1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "Cannot determine a display name for group %{public}@ %p, and no placeholder value was requested.", v4, v5, v6, v7, v8);
}

+ (void)nameForGroup:sources:.cold.2()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Cannot determine a display name for group %{public}@ %p. Continuing with placeholder: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nicknameForRecipient:.cold.1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "No nickname from components for %{public}@ %p", v4, v5, v6, v7, v8);
}

+ (void)nicknameForRecipient:.cold.2()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using nickname from components for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)displayStringForRecipient:.cold.1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "No display name for %{public}@ %p", v4, v5, v6, v7, v8);
}

+ (void)displayStringForRecipient:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B5AF5000, log, OS_LOG_TYPE_ERROR, "Provided display name (%{private}@) for %p looks like it might be invalid; ignoring",
    (uint8_t *)&v3,
    0x16u);
}

+ (void)displayStringForRecipient:.cold.3()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using display name for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)displayStringForRecipient:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B5AF5000, a2, OS_LOG_TYPE_DEBUG, "Group’s display name: '%{private}@'", (uint8_t *)&v2, 0xCu);
}

+ (void)buildAdHocNameForGroup:.cold.1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (objc_class *)objc_opt_class();
  int v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B5AF5000, v0, OS_LOG_TYPE_ERROR, "Unable to build name for group %{public}@ %p", v3, 0x16u);
}

+ (void)buildAdHocNameForGroup:.cold.2()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using built name for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nameForPerson:sources:.cold.1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "Cannot determine a display name for %{public}@ %p, and no placeholder value was requested.", v4, v5, v6, v7, v8);
}

+ (void)nameForPerson:sources:.cold.2()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Cannot determine a display name for %{public}@ %p. Continuing with placeholder: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nameFromComponentsForPerson:.cold.1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "No name components available for %{public}@ %p", v4, v5, v6, v7, v8);
}

+ (void)nameFromComponentsForPerson:.cold.2()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using recipient’s name constructed from components for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nameFromContactForPerson:.cold.1()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using recipient’s name constructed from contact for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nameFromEmailAddressForPerson:.cold.1()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using possibly commented address for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nameFromEmailAddressForPerson:.cold.2()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using possibly commented address anyway for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)nameFromEmailAddressForPerson:.cold.3()
{
  OUTLINED_FUNCTION_3();
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B5AF5000, v2, v3, "Using comment from address for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);
}

@end