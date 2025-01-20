@interface CNUserActivitySerialization
+ (BOOL)isContactACompany:(id)a3;
+ (id)allAvailableServerUUIDsForContact:(id)a3;
+ (id)descriptorForRequiredKeys;
+ (id)distinctEmailAddressesForContact:(id)a3;
+ (id)distinctPhoneNumbersForContact:(id)a3;
+ (id)fullNameForContact:(id)a3;
+ (id)userActivityPayloadWithContacts:(id)a3 shouldUnify:(BOOL)a4;
+ (id)userActivityTitleWithContacts:(id)a3;
@end

@implementation CNUserActivitySerialization

+ (id)descriptorForRequiredKeys
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v3 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0, @"identifier", @"externalUUID", @"emailAddresses", @"phoneNumbers", @"contactType", @"givenName", @"familyName", @"organizationName"];
  v8[8] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];

  v5 = [a1 description];
  v6 = +[CNContact descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

+ (id)userActivityPayloadWithContacts:(id)a3 shouldUnify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count] == 1)
  {
    v7 = [v6 firstObject];
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = [a1 allAvailableServerUUIDsForContact:v7];
    objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v9, @"carddav-uuids");

    v10 = [a1 distinctEmailAddressesForContact:v7];
    objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v10, @"email-addresses");

    v11 = [a1 distinctPhoneNumbersForContact:v7];
    objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v11, @"phone-numbers");

    char v12 = [a1 isContactACompany:v7];
    v13 = (void (**)(uint64_t, void *))sNilStringIfEmpty;
    if (v12)
    {
      v14 = [v7 organizationName];
      v15 = v13[2]((uint64_t)v13, v14);
      objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v15, @"organization-name");

      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"is-organization"];
    }
    else
    {
      v17 = [v7 givenName];
      v18 = v13[2]((uint64_t)v13, v17);
      objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v18, @"first-name");

      v19 = (void (**)(uint64_t, void *))sNilStringIfEmpty;
      v20 = [v7 familyName];
      v21 = v19[2]((uint64_t)v19, v20);
      objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v21, @"last-name");
    }
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))())
    {
      id v16 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      [v8 setObject:&unk_1EE089650 forKeyedSubscript:@"version"];
      v22 = [a1 fullNameForContact:v7];
      [v8 setObject:v22 forKeyedSubscript:@"contact-name"];

      if (v4) {
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"unified"];
      }
      id v16 = v8;
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CC08];
  }

  return v16;
}

+ (id)userActivityTitleWithContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    v5 = [v4 firstObject];
    id v6 = [a1 fullNameForContact:v5];
  }
  else
  {
    id v6 = &stru_1EE052B80;
  }

  return v6;
}

+ (BOOL)isContactACompany:(id)a3
{
  return [a3 contactType] == 1;
}

+ (id)allAvailableServerUUIDsForContact:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A258];
  v5 = [v3 linkedContacts];
  if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v5))
  {
    v13[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v6 = [v3 linkedContacts];
  }
  v7 = (void *)v6;

  v8 = objc_msgSend(v7, "_cn_map:", sContactServerUUID);
  v9 = objc_msgSend(v8, "_cn_filter:", *MEMORY[0x1E4F5A280]);

  if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v9)) {
    v10 = 0;
  }
  else {
    v10 = v9;
  }
  id v11 = v10;

  return v11;
}

+ (id)distinctEmailAddressesForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A258];
  v5 = [v3 emailAddresses];
  char v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v8 = [v3 emailAddresses];
    v9 = +[CNLabeledValue Value];
    v10 = objc_msgSend(v8, "_cn_map:", v9);

    id v11 = objc_msgSend(v10, "_cn_distinctObjects");

    char v12 = [MEMORY[0x1E4F5A510] IsNotEmpty];
    v13 = objc_msgSend(v11, "_cn_filter:", v12);

    if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v13)) {
      v14 = 0;
    }
    else {
      v14 = v13;
    }
    id v7 = v14;
  }

  return v7;
}

+ (id)distinctPhoneNumbersForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A258];
  v5 = [v3 phoneNumbers];
  char v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v8 = [v3 phoneNumbers];
    v9 = +[CNLabeledValue Value];
    v10 = objc_msgSend(v8, "_cn_map:", v9);
    id v11 = +[CNPhoneNumber StringValue];
    char v12 = objc_msgSend(v10, "_cn_map:", v11);

    v13 = objc_msgSend(v12, "_cn_distinctObjects");

    v14 = [MEMORY[0x1E4F5A510] IsNotEmpty];
    v15 = objc_msgSend(v13, "_cn_filter:", v14);

    if ((*(unsigned int (**)(uint64_t, void *))(v4 + 16))(v4, v15)) {
      id v16 = 0;
    }
    else {
      id v16 = v15;
    }
    id v7 = v16;
  }

  return v7;
}

+ (id)fullNameForContact:(id)a3
{
  return +[CNContactFormatter stringFromContact:a3 style:0];
}

@end