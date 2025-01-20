@interface CNUICoreFamilyMemberSaveRequestFactory
+ (id)distinctCopiesOfContacts:(id)a3;
+ (id)saveRequestToUpdateContactListByAddingContacts:(id)a3;
+ (id)saveRequestToUpdateContactListByAddingContacts:(id)a3 toContainer:(id)a4;
+ (id)saveRequestToUpdateContactListByRemovingContacts:(id)a3;
+ (id)saveRequestToUpdateContactListByUpdatingContacts:(id)a3;
+ (id)saveRequestToUpdateContactWhitelistByRemovingContacts:(id)a3;
+ (id)saveRequestToupdateContactWhitelistByAddingContacts:(id)a3;
@end

@implementation CNUICoreFamilyMemberSaveRequestFactory

+ (id)saveRequestToUpdateContactListByAddingContacts:(id)a3
{
  return (id)[a1 saveRequestToUpdateContactListByAddingContacts:a3 toContainer:0];
}

+ (id)saveRequestToUpdateContactListByAddingContacts:(id)a3 toContainer:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263EFEB48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setIgnoresGuardianRestrictions:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByAddingContacts_toContainer___block_invoke;
  v14[3] = &unk_2640179E0;
  id v9 = v8;
  id v15 = v9;
  id v16 = v5;
  id v10 = v5;
  objc_msgSend(v7, "_cn_each:", v14);

  v11 = v16;
  id v12 = v9;

  return v12;
}

void __101__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByAddingContacts_toContainer___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = (id)[a2 mutableCopy];
  v4 = [*(id *)(a1 + 40) identifier];
  [v3 addContact:v5 toContainerWithIdentifier:v4];
}

+ (id)saveRequestToUpdateContactListByUpdatingContacts:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFEB48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setIgnoresGuardianRestrictions:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByUpdatingContacts___block_invoke;
  v8[3] = &unk_264017A08;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByUpdatingContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 mutableCopy];
  [v2 updateContact:v3];
}

+ (id)saveRequestToUpdateContactListByRemovingContacts:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFEB48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setIgnoresGuardianRestrictions:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByRemovingContacts___block_invoke;
  v8[3] = &unk_264017A08;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 mutableCopy];
  [v2 deleteContact:v3];
}

+ (id)saveRequestToupdateContactWhitelistByAddingContacts:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFEB48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setIgnoresGuardianRestrictions:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __94__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToupdateContactWhitelistByAddingContacts___block_invoke;
  v8[3] = &unk_264017A08;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __94__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToupdateContactWhitelistByAddingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)[a2 mutableCopy];
  [v3 setDowntimeWhitelist:*MEMORY[0x263F33490]];
  [*(id *)(a1 + 32) updateContact:v3];
}

+ (id)saveRequestToUpdateContactWhitelistByRemovingContacts:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFEB48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setIgnoresGuardianRestrictions:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactWhitelistByRemovingContacts___block_invoke;
  v8[3] = &unk_264017A08;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __96__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactWhitelistByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)[a2 mutableCopy];
  [v3 setDowntimeWhitelist:*MEMORY[0x263F33498]];
  [*(id *)(a1 + 32) updateContact:v3];
}

+ (id)distinctCopiesOfContacts:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_map:", &__block_literal_global_13);
}

id __67__CNUICoreFamilyMemberSaveRequestFactory_distinctCopiesOfContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyWithDistinctIdentifier];
  return v2;
}

@end