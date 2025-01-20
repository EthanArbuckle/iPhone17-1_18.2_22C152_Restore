@interface AAUITrustedContactPickerViewController
+ (id)addressKindAndHandleForSingleAddressContact:(id)a3;
- (AAUITrustedContactPickerViewController)init;
@end

@implementation AAUITrustedContactPickerViewController

- (AAUITrustedContactPickerViewController)init
{
  v23[1] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AAUITrustedContactPickerViewController;
  v2 = [(AAUITrustedContactPickerViewController *)&v18 init];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263EFDFE0];
    v23[0] = *MEMORY[0x263EFDFE0];
    unint64_t v4 = 0x263EFF000uLL;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v6 = objc_alloc_init(MEMORY[0x263EFEA58]);
    v7 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:0];
    v8 = [v7 identifier];
    if (v8)
    {
      v9 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"((emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)) AND (NOT %K IN $IDENTIFIERS)", v3);
      v20 = v8;
      v21 = @"IDENTIFIERS";
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      v22 = v10;
      v11 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v12 = [v9 predicateWithSubstitutionVariables:v11];
      [(CNContactPickerViewController *)v2 setPredicateForEnablingContact:v12];

      unint64_t v4 = 0x263EFF000;
    }
    else
    {
      v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
      [(CNContactPickerViewController *)v2 setPredicateForEnablingContact:v9];
    }

    v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
    [(CNContactPickerViewController *)v2 setPredicateForSelectionOfContact:v13];

    v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"(property == 'emailAddresses') OR (property == 'phoneNumbers')"];
    [(CNContactPickerViewController *)v2 setPredicateForSelectionOfProperty:v14];

    uint64_t v15 = *MEMORY[0x263EFE070];
    v19[0] = *MEMORY[0x263EFDF80];
    v19[1] = v15;
    v16 = [*(id *)(v4 + 2240) arrayWithObjects:v19 count:2];
    [(CNContactPickerViewController *)v2 setDisplayedPropertyKeys:v16];
  }
  return v2;
}

+ (id)addressKindAndHandleForSingleAddressContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactPickerViewController extracting handle and type for contact: %@", (uint8_t *)&v21, 0xCu);
  }

  v5 = [v3 phoneNumbers];
  if ([v5 count] == 1)
  {
    id v6 = [v3 emailAddresses];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  v8 = [v3 phoneNumbers];
  if ([v8 count])
  {

    if (!v7) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  v9 = [v3 emailAddresses];
  uint64_t v10 = [v9 count];

  if (v7)
  {
LABEL_10:
    v11 = [v3 phoneNumbers];
    v12 = [v11 firstObject];
    v13 = [v12 value];
    v14 = [v13 stringValue];

    uint64_t v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactPickerViewController extracted phone number: %@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v16 = 1;
LABEL_13:

    goto LABEL_19;
  }
  if (v10 == 1)
  {
    v17 = [v3 emailAddresses];
    objc_super v18 = [v17 firstObject];
    v14 = [v18 value];

    uint64_t v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactPickerViewController extracted email: %@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v16 = 0;
    goto LABEL_13;
  }
LABEL_18:
  v14 = 0;
  uint64_t v16 = 5;
LABEL_19:
  v19 = [[AAUIHandleWithKind alloc] initWithHandle:v14 kind:v16];

  return v19;
}

@end