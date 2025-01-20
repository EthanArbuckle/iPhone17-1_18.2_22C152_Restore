@interface CNUICoreFamilyMemberContactsModelBuilder
+ (BOOL)shouldIncludeContact:(id)a3 givenIncludeWhitelistedContactsOnlySetting:(BOOL)a4;
+ (id)familyMemberContactItemFromContact:(id)a3 contactFormatterStyle:(int64_t)a4 contactTypeAssessor:(id)a5 itemHasBeenPersisted:(BOOL)a6 itemIsProposed:(BOOL)a7;
+ (id)firstDisplayableEmailAddressForContact:(id)a3;
+ (id)firstDisplayablePhoneNumberForContact:(id)a3;
+ (id)formattedNameOfContact:(id)a3 contactFormatterStyle:(int64_t)a4;
+ (id)itemsBySortingItems:(id)a3;
+ (id)placeholderNameForNamelessContact:(id)a3;
+ (id)uniqueFamilyMemberContactItems:(id)a3;
- (BOOL)includeWhitelistedContactsOnly;
- (BOOL)markItemsAsPersisted;
- (BOOL)markItemsAsProposed;
- (BOOL)sortItemsByName;
- (CNUICoreContactTypeAssessor)contactTypeAssessor;
- (CNUICoreFamilyMemberContactsModelBuilder)init;
- (NSArray)contacts;
- (id)build;
- (id)sortedFamilyMemberContactItems:(id)a3;
- (int64_t)contactFormatterStyle;
- (void)setContactFormatterStyle:(int64_t)a3;
- (void)setContactTypeAssessor:(id)a3;
- (void)setContacts:(id)a3;
- (void)setIncludeWhitelistedContactsOnly:(BOOL)a3;
- (void)setMarkItemsAsPersisted:(BOOL)a3;
- (void)setMarkItemsAsProposed:(BOOL)a3;
- (void)setSortItemsByName:(BOOL)a3;
@end

@implementation CNUICoreFamilyMemberContactsModelBuilder

- (CNUICoreFamilyMemberContactsModelBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNUICoreFamilyMemberContactsModelBuilder;
  v2 = [(CNUICoreFamilyMemberContactsModelBuilder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_markItemsAsPersisted = 1;
    v4 = v2;
  }

  return v3;
}

- (id)build
{
  v3 = [(CNUICoreFamilyMemberContactsModelBuilder *)self contacts];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke;
  v11[3] = &unk_2640176E0;
  v11[4] = self;
  v4 = objc_msgSend(v3, "_cn_filter:", v11);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke_2;
  v10[3] = &unk_264017850;
  v10[4] = self;
  v5 = objc_msgSend(v4, "_cn_map:", v10);

  objc_super v6 = [(id)objc_opt_class() uniqueFamilyMemberContactItems:v5];
  v7 = [(CNUICoreFamilyMemberContactsModelBuilder *)self sortedFamilyMemberContactItems:v6];
  v8 = [[CNUICoreFamilyMemberContactsModel alloc] initWithItems:v7];

  return v8;
}

uint64_t __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "shouldIncludeContact:givenIncludeWhitelistedContactsOnlySetting:", v3, objc_msgSend(*(id *)(a1 + 32), "includeWhitelistedContactsOnly"));

  return v4;
}

id __49__CNUICoreFamilyMemberContactsModelBuilder_build__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 32) contactFormatterStyle];
  objc_super v6 = [*(id *)(a1 + 32) contactTypeAssessor];
  v7 = objc_msgSend(v4, "familyMemberContactItemFromContact:contactFormatterStyle:contactTypeAssessor:itemHasBeenPersisted:itemIsProposed:", v3, v5, v6, objc_msgSend(*(id *)(a1 + 32), "markItemsAsPersisted"), objc_msgSend(*(id *)(a1 + 32), "markItemsAsProposed"));

  return v7;
}

+ (BOOL)shouldIncludeContact:(id)a3 givenIncludeWhitelistedContactsOnlySetting:(BOOL)a4
{
  if (a4) {
    return [MEMORY[0x263EFEA88] isWhitelistedContact:a3];
  }
  else {
    return 1;
  }
}

+ (id)familyMemberContactItemFromContact:(id)a3 contactFormatterStyle:(int64_t)a4 contactTypeAssessor:(id)a5 itemHasBeenPersisted:(BOOL)a6 itemIsProposed:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  v14 = [v12 identifier];
  v15 = [a1 formattedNameOfContact:v12 contactFormatterStyle:a4];
  if ([v12 isKeyAvailable:*MEMORY[0x263EFDFF8]])
  {
    v16 = [v12 imageData];
  }
  else
  {
    v16 = 0;
  }
  uint64_t v17 = *MEMORY[0x263F334B0];
  v18 = [v12 phoneNumbers];
  uint64_t v19 = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  if (v13) {
    uint64_t v20 = [v13 estiamtedTypeOfContact:v12];
  }
  else {
    uint64_t v20 = 0;
  }
  LOBYTE(v23) = a6;
  v21 = -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:]([CNUICoreFamilyMemberContactItem alloc], "initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:", v14, v15, v16, v19, v7, v20, [MEMORY[0x263EFEA88] isWhitelistedContact:v12], v23);

  return v21;
}

+ (id)formattedNameOfContact:(id)a3 contactFormatterStyle:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263EFEA20] stringFromContact:v6 style:a4];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))())
  {

    BOOL v7 = [a1 placeholderNameForNamelessContact:v6];
  }

  return v7;
}

+ (id)placeholderNameForNamelessContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keyVector];
  int v6 = [v5 containsKey:*MEMORY[0x263EFDF80]];

  if (v6)
  {
    BOOL v7 = [a1 firstDisplayableEmailAddressForContact:v4];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))()) {
      goto LABEL_8;
    }
  }
  v8 = [v4 keyVector];
  int v9 = [v8 containsKey:*MEMORY[0x263EFE070]];

  if (v9)
  {
    BOOL v7 = [a1 firstDisplayablePhoneNumberForContact:v4];
    if (!(*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))()) {
      goto LABEL_8;
    }
  }
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v10 localizedStringForKey:@"NO_NAME" value:&stru_26BFC7668 table:@"Localized"];

LABEL_8:
  return v7;
}

+ (id)firstDisplayableEmailAddressForContact:(id)a3
{
  id v3 = [a3 emailAddresses];
  id v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_9);
  uint64_t v5 = [v4 value];
  int v6 = objc_msgSend(v5, "_cn_trimmedString");

  return v6;
}

uint64_t __83__CNUICoreFamilyMemberContactsModelBuilder_firstDisplayableEmailAddressForContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x263F334E8];
  id v3 = [a2 value];
  id v4 = objc_msgSend(v3, "_cn_trimmedString");
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  return v5;
}

+ (id)firstDisplayablePhoneNumberForContact:(id)a3
{
  id v3 = [a3 phoneNumbers];
  id v4 = objc_msgSend(v3, "_cn_compactMap:", &__block_literal_global_22_0);
  uint64_t v5 = objc_msgSend(v4, "_cn_firstObjectPassingTest:", &__block_literal_global_25);

  return v5;
}

id __82__CNUICoreFamilyMemberContactsModelBuilder_firstDisplayablePhoneNumberForContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 value];
  id v3 = [v2 formattedInternationalStringValue];
  id v4 = objc_msgSend(v3, "_cn_trimmedString");

  return v4;
}

void *__82__CNUICoreFamilyMemberContactsModelBuilder_firstDisplayablePhoneNumberForContact___block_invoke_2()
{
  return (*(void *(**)(void *__return_ptr))(*MEMORY[0x263F334E8] + 16))(MEMORY[0x263F334E8]);
}

+ (id)uniqueFamilyMemberContactItems:(id)a3
{
  id v3 = objc_msgSend(a3, "_cn_indexBy:", &__block_literal_global_32);
  id v4 = [v3 allValues];

  return v4;
}

- (id)sortedFamilyMemberContactItems:(id)a3
{
  id v4 = a3;
  if ([(CNUICoreFamilyMemberContactsModelBuilder *)self sortItemsByName])
  {
    uint64_t v5 = [(id)objc_opt_class() itemsBySortingItems:v4];
  }
  else
  {
    int v6 = [(CNUICoreFamilyMemberContactsModelBuilder *)self contacts];
    BOOL v7 = objc_msgSend(v6, "_cn_indexBy:", &__block_literal_global_35_0);

    v8 = [(CNUICoreFamilyMemberContactsModelBuilder *)self contacts];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__CNUICoreFamilyMemberContactsModelBuilder_sortedFamilyMemberContactItems___block_invoke;
    v11[3] = &unk_2640177C0;
    id v12 = v7;
    id v9 = v7;
    uint64_t v5 = objc_msgSend(v4, "_cn_sortedArrayUsingAuxiliarySortOrder:transform:", v8, v11);
  }
  return v5;
}

id __75__CNUICoreFamilyMemberContactsModelBuilder_sortedFamilyMemberContactItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 contactIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (id)itemsBySortingItems:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_29];
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (CNUICoreContactTypeAssessor)contactTypeAssessor
{
  return self->_contactTypeAssessor;
}

- (void)setContactTypeAssessor:(id)a3
{
}

- (int64_t)contactFormatterStyle
{
  return self->_contactFormatterStyle;
}

- (void)setContactFormatterStyle:(int64_t)a3
{
  self->_contactFormatterStyle = a3;
}

- (BOOL)includeWhitelistedContactsOnly
{
  return self->_includeWhitelistedContactsOnly;
}

- (void)setIncludeWhitelistedContactsOnly:(BOOL)a3
{
  self->_includeWhitelistedContactsOnly = a3;
}

- (BOOL)sortItemsByName
{
  return self->_sortItemsByName;
}

- (void)setSortItemsByName:(BOOL)a3
{
  self->_sortItemsByName = a3;
}

- (BOOL)markItemsAsPersisted
{
  return self->_markItemsAsPersisted;
}

- (void)setMarkItemsAsPersisted:(BOOL)a3
{
  self->_markItemsAsPersisted = a3;
}

- (BOOL)markItemsAsProposed
{
  return self->_markItemsAsProposed;
}

- (void)setMarkItemsAsProposed:(BOOL)a3
{
  self->_markItemsAsProposed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactTypeAssessor, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end