@interface CNComposeRecipientShortNamer
+ (__CFString)shortNameForComposeRecipient:(uint64_t)a1;
+ (id)buildAdHocNameForGroup:(id)a3;
+ (id)nameComponentsFromDisplayName:(id)a3;
+ (id)nameForGroup:(id)a3;
+ (id)nameForPerson:(id)a3;
+ (id)os_log;
+ (id)shortNameFromAddressForComposeRecipient:(id)a3;
+ (id)shortNameFromCompositeNameForComposeRecipient:(id)a3;
+ (id)shortNameFromDisplayStringForGroup:(id)a3;
+ (id)shortNameFromDisplayStringForPerson:(id)a3;
+ (id)shortNameFromNameComponents:(id)a3;
+ (id)shortNameFromNameComponentsForComposeRecipient:(id)a3;
@end

@implementation CNComposeRecipientShortNamer

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1) {
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_2);
  }
  v2 = (void *)os_log_cn_once_object_1_0;

  return v2;
}

uint64_t __38__CNComposeRecipientShortNamer_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "composerecipient");
  uint64_t v1 = os_log_cn_once_object_1_0;
  os_log_cn_once_object_1_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (__CFString)shortNameForComposeRecipient:(uint64_t)a1
{
  id v2 = a2;
  v3 = self;
  if (v2)
  {
    if ([v2 isGroup]) {
      [v3 nameForGroup:v2];
    }
    else {
    v5 = [v3 nameForPerson:v2];
    }
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientShortNamer shortNameForComposeRecipient:](v4);
    }

    v5 = &stru_1F0EC0C28;
  }

  return v5;
}

+ (id)nameForGroup:(id)a3
{
  id v4 = a3;
  v5 = [a1 shortNameFromDisplayStringForGroup:v4];
  uint64_t v6 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v5))
  {

    v5 = [a1 buildAdHocNameForGroup:v4];
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
    {

      v5 = [v4 placeholderName];
    }
  }

  return v5;
}

+ (id)nameForPerson:(id)a3
{
  id v4 = a3;
  v5 = [a1 shortNameFromNameComponentsForComposeRecipient:v4];
  uint64_t v6 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v5))
  {

    v5 = [a1 shortNameFromDisplayStringForPerson:v4];
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
    {

      v5 = [a1 shortNameFromCompositeNameForComposeRecipient:v4];
      if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
      {

        v5 = [a1 shortNameFromAddressForComposeRecipient:v4];
        if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
        {

          v5 = [v4 placeholderName];
        }
      }
    }
  }

  return v5;
}

+ (id)buildAdHocNameForGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 children];
  v5 = objc_opt_new();
  uint64_t v6 = objc_alloc_init(CNNameListBuilderBlockDelegate);
  v7 = [v3 children];
  -[CNNameListBuilderBlockDelegate setCountOfNames:](v6, "setCountOfNames:", [v7 count]);

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke;
  v20[3] = &unk_1E6128638;
  id v8 = v5;
  id v21 = v8;
  id v9 = v4;
  id v22 = v9;
  [(CNNameListBuilderBlockDelegate *)v6 setNameProviderBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke_2;
  v18[3] = &unk_1E6128660;
  id v10 = v8;
  id v19 = v10;
  [(CNNameListBuilderBlockDelegate *)v6 setLengthValidationBlock:v18];
  v11 = [[CNNameListBuilder alloc] initWithDelegate:v6];
  [(CNNameListBuilder *)v11 setShouldStripEllipses:1];
  v12 = [(CNNameListBuilder *)v11 build];
  v13 = v12;
  if (v12 && [v12 length])
  {
    v14 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientShortNamer buildAdHocNameForGroup:]();
    }

    v15 = v13;
  }
  else
  {
    v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientShortNamer buildAdHocNameForGroup:]();
    }

    v15 = &stru_1F0EC0C28;
  }

  return v15;
}

id __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addIndex:a2];
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v5 = [v4 shortName];

  return v5;
}

BOOL __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke_2(uint64_t a1)
{
  return (unint64_t)[*(id *)(a1 + 32) count] < 2;
}

+ (id)shortNameFromNameComponentsForComposeRecipient:(id)a3
{
  id v4 = [a3 nameComponents];
  if (v4)
  {
    v5 = [a1 shortNameFromNameComponents:v4];
    uint64_t v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientShortNamer shortNameFromNameComponentsForComposeRecipient:]();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)shortNameFromDisplayStringForGroup:(id)a3
{
  return (id)[a3 displayString];
}

+ (id)shortNameFromDisplayStringForPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 displayString];
  uint64_t v6 = [a1 nameComponentsFromDisplayName:v5];

  if (v6)
  {
    v7 = [a1 shortNameFromNameComponents:v6];
    id v8 = v7;
    if (v7 && [v7 length])
    {
      id v9 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[CNComposeRecipientShortNamer shortNameFromDisplayStringForPerson:]();
      }
      goto LABEL_13;
    }
  }
  id v10 = [v4 displayString];
  id v9 = v10;
  if (v10 && [v10 length])
  {
    v11 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[CNComposeRecipientShortNamer shortNameFromDisplayStringForPerson:]();
    }

    id v9 = v9;
    id v8 = v9;
  }
  else
  {
    id v8 = 0;
  }
LABEL_13:

  return v8;
}

+ (id)shortNameFromNameComponents:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_11;
  }
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v5 = [v4 composeRecipientNameOptions];

  uint64_t v6 = [v5 shortNameFormat];
  if (v6 == 2)
  {
    uint64_t v8 = [v3 familyName];
  }
  else
  {
    if (v6 != 1)
    {
      if (!v6)
      {
        v7 = objc_opt_new();
        [v7 setStyle:1];
        id v4 = [v7 stringFromPersonNameComponents:v3];
      }
      goto LABEL_10;
    }
    uint64_t v8 = [v3 givenName];
  }
  id v4 = (void *)v8;
LABEL_10:

LABEL_11:

  return v4;
}

+ (id)nameComponentsFromDisplayName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = objc_opt_new();
    uint64_t v6 = [v5 personNameComponentsFromString:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)shortNameFromCompositeNameForComposeRecipient:(id)a3
{
  id v3 = +[CNComposeRecipientNamer nameForComposeRecipient:]((uint64_t)CNComposeRecipientNamer, a3);
  id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CNComposeRecipientShortNamer shortNameFromCompositeNameForComposeRecipient:]();
  }

  return v3;
}

+ (id)shortNameFromAddressForComposeRecipient:(id)a3
{
  id v3 = [a3 address];
  id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CNComposeRecipientShortNamer shortNameFromAddressForComposeRecipient:]();
  }

  return v3;
}

+ (void)shortNameForComposeRecipient:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B5AF5000, log, OS_LOG_TYPE_DEBUG, "recipient is nil, so name is ''", v1, 2u);
}

+ (void)buildAdHocNameForGroup:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "Unable to build name for group %{private}@.", v2, v3, v4, v5, v6);
}

+ (void)buildAdHocNameForGroup:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1B5AF5000, v1, OS_LOG_TYPE_DEBUG, "Using built name '%{private}@' for group %{private}@.", v2, 0x16u);
}

+ (void)shortNameFromNameComponentsForComposeRecipient:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "Short name from components: %{private}@", v2, v3, v4, v5, v6);
}

+ (void)shortNameFromDisplayStringForPerson:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "Short name from display string: '%{private}@'", v2, v3, v4, v5, v6);
}

+ (void)shortNameFromDisplayStringForPerson:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "Short name from parsed display string: '%{private}@'", v2, v3, v4, v5, v6);
}

+ (void)shortNameFromCompositeNameForComposeRecipient:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "Short name from composite name: '%{private}@'", v2, v3, v4, v5, v6);
}

+ (void)shortNameFromAddressForComposeRecipient:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "Short name from full address: '%{private}@'", v2, v3, v4, v5, v6);
}

@end