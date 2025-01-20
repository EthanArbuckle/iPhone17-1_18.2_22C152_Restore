@interface CNUIUserActionCacheKeyGenerator
+ (id)descriptionOfActionType:(id)a3;
+ (id)fingerprintOfEmailAddresses:(id)a3;
+ (id)fingerprintOfInstantMessageAddresses:(id)a3;
+ (id)fingerprintOfPhoneNumbers:(id)a3;
+ (id)fingerprintOfPostalAddresses:(id)a3;
+ (id)fingerprintOfSocialProfiles:(id)a3;
+ (id)handlesForActionType:(id)a3 contact:(id)a4;
+ (id)keyForContact:(id)a3 actionType:(id)a4;
+ (id)os_log;
+ (unint64_t)propertiesForActionType:(id)a3;
@end

@implementation CNUIUserActionCacheKeyGenerator

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_5);
  }
  v2 = (void *)os_log_cn_once_object_1;
  return v2;
}

uint64_t __41__CNUIUserActionCacheKeyGenerator_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.ui", "user-actions-cache-key-generator");
  return MEMORY[0x270F9A758]();
}

+ (id)keyForContact:(id)a3 actionType:(id)a4
{
  id v6 = a4;
  v7 = [a1 handlesForActionType:v6 contact:a3];
  v8 = [MEMORY[0x263F33680] Trim];
  v9 = objc_msgSend(v7, "_cn_map:", v8);

  if ([v9 count])
  {
    v10 = [v9 componentsJoinedByString:@","];
    v11 = [MEMORY[0x263F089D8] string];
    v12 = [a1 descriptionOfActionType:v6];
    [(__CFString *)v11 appendString:v12];

    [(__CFString *)v11 appendString:@"["];
    [(__CFString *)v11 appendString:v10];
    [(__CFString *)v11 appendString:@"]"];
  }
  else
  {
    v11 = &stru_26BFC7668;
  }

  return v11;
}

+ (id)descriptionOfActionType:(id)a3
{
  id v3 = a3;
  if ([(id)*MEMORY[0x263EFDF10] isEqualToString:v3])
  {
    v4 = @"Mail";
  }
  else if ([(id)*MEMORY[0x263EFDF18] isEqualToString:v3])
  {
    v4 = @"Message";
  }
  else if ([(id)*MEMORY[0x263EFDEF8] isEqualToString:v3])
  {
    v4 = @"AudioCall";
  }
  else if ([(id)*MEMORY[0x263EFDF38] isEqualToString:v3])
  {
    v4 = @"VideoCall";
  }
  else if ([(id)*MEMORY[0x263EFDF28] isEqualToString:v3])
  {
    v4 = @"TTY";
  }
  else if ([(id)*MEMORY[0x263EFDF30] isEqualToString:v3])
  {
    v4 = @"TTYRelay";
  }
  else if ([(id)*MEMORY[0x263EFDF20] isEqualToString:v3])
  {
    v4 = @"Pay";
  }
  else if ([(id)*MEMORY[0x263EFDF00] isEqualToString:v3])
  {
    v4 = @"Directions";
  }
  else if ([(id)*MEMORY[0x263EFDF08] isEqualToString:v3])
  {
    v4 = @"Expanse";
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[CNUIUserActionCacheKeyGenerator descriptionOfActionType:]((uint64_t)v3, v5);
    }

    v4 = [NSString stringWithFormat:@"UnknownActionType(%@)", v3];
  }

  return v4;
}

+ (id)handlesForActionType:(id)a3 contact:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263EFF980];
  id v8 = a3;
  v9 = [v7 array];
  char v10 = [a1 propertiesForActionType:v8];

  if (v10)
  {
    v14 = [v6 phoneNumbers];
    v15 = [a1 fingerprintOfPhoneNumbers:v14];

    [v9 addObjectsFromArray:v15];
    if ((v10 & 2) == 0)
    {
LABEL_3:
      if ((v10 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_3;
  }
  v16 = [v6 emailAddresses];
  v17 = [a1 fingerprintOfEmailAddresses:v16];

  [v9 addObjectsFromArray:v17];
  if ((v10 & 4) == 0)
  {
LABEL_4:
    if ((v10 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v18 = [v6 postalAddresses];
  v19 = [a1 fingerprintOfPostalAddresses:v18];

  [v9 addObjectsFromArray:v19];
  if ((v10 & 8) == 0)
  {
LABEL_5:
    if ((v10 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v20 = [v6 socialProfiles];
  v21 = [a1 fingerprintOfSocialProfiles:v20];

  [v9 addObjectsFromArray:v21];
  if ((v10 & 0x10) != 0)
  {
LABEL_6:
    v11 = [v6 instantMessageAddresses];
    v12 = [a1 fingerprintOfInstantMessageAddresses:v11];

    [v9 addObjectsFromArray:v12];
  }
LABEL_7:

  return v9;
}

+ (unint64_t)propertiesForActionType:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([(id)*MEMORY[0x263EFDF10] isEqualToString:v3])
  {
    unint64_t v4 = 2;
  }
  else
  {
    if (([(id)*MEMORY[0x263EFDF18] isEqualToString:v3] & 1) == 0
      && ([(id)*MEMORY[0x263EFDEF8] isEqualToString:v3] & 1) == 0
      && ([(id)*MEMORY[0x263EFDF38] isEqualToString:v3] & 1) == 0)
    {
      if (([(id)*MEMORY[0x263EFDF28] isEqualToString:v3] & 1) != 0
        || ([(id)*MEMORY[0x263EFDF30] isEqualToString:v3] & 1) != 0)
      {
        unint64_t v4 = 1;
        goto LABEL_7;
      }
      if ([(id)*MEMORY[0x263EFDF20] isEqualToString:v3])
      {
        unint64_t v4 = 3;
        goto LABEL_7;
      }
      if ([(id)*MEMORY[0x263EFDF00] isEqualToString:v3])
      {
        unint64_t v4 = 4;
        goto LABEL_7;
      }
      if (([(id)*MEMORY[0x263EFDF08] isEqualToString:v3] & 1) == 0)
      {
        id v6 = (void *)MEMORY[0x263EFF940];
        uint64_t v7 = *MEMORY[0x263EFF498];
        char v10 = @"action-type";
        v11[0] = v3;
        id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
        id v9 = [v6 exceptionWithName:v7 reason:@"CNActionType not handled" userInfo:v8];

        objc_exception_throw(v9);
      }
    }
    unint64_t v4 = 27;
  }
LABEL_7:

  return v4;
}

+ (id)fingerprintOfPhoneNumbers:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFEAD0];
  id v4 = a3;
  v5 = [v3 Value];
  id v6 = objc_msgSend(v4, "_cn_map:", v5);

  uint64_t v7 = [MEMORY[0x263EFEB28] StringValue];
  id v8 = objc_msgSend(v6, "_cn_map:", v7);

  id v9 = [v8 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  char v10 = objc_msgSend(v9, "_cn_distinctObjects");

  v11 = [MEMORY[0x263F33680] IsNotEmpty];
  v12 = objc_msgSend(v10, "_cn_filter:", v11);

  return v12;
}

+ (id)fingerprintOfEmailAddresses:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFEAD0];
  id v4 = a3;
  v5 = [v3 Value];
  id v6 = objc_msgSend(v4, "_cn_map:", v5);

  uint64_t v7 = [v6 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  id v8 = objc_msgSend(v7, "_cn_distinctObjects");

  id v9 = [MEMORY[0x263F33680] IsNotEmpty];
  char v10 = objc_msgSend(v8, "_cn_filter:", v9);

  return v10;
}

+ (id)fingerprintOfPostalAddresses:(id)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFE918];
  v21[0] = *MEMORY[0x263EFE950];
  v21[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFE938];
  v21[2] = *MEMORY[0x263EFE948];
  v21[3] = v4;
  v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  uint64_t v7 = [v5 arrayWithObjects:v21 count:4];
  id v8 = [MEMORY[0x263EFEAD0] Value];
  id v9 = objc_msgSend(v6, "_cn_map:", v8);

  char v10 = objc_msgSend(v9, "_cn_distinctObjects");

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke;
  v19 = &unk_264017620;
  id v20 = v7;
  id v11 = v7;
  v12 = objc_msgSend(v10, "_cn_flatMap:", &v16);
  v13 = objc_msgSend(MEMORY[0x263F33680], "IsNotEmpty", v16, v17, v18, v19);
  v14 = objc_msgSend(v12, "_cn_filter:", v13);

  return v14;
}

id __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dictionaryRepresentation];
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke_2;
  v8[3] = &unk_2640175F8;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "_cn_compactMap:", v8);

  return v6;
}

uint64_t __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

+ (id)fingerprintOfSocialProfiles:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFEAD0];
  id v4 = a3;
  id v5 = [v3 Value];
  id v6 = objc_msgSend(v4, "_cn_map:", v5);

  uint64_t v7 = [MEMORY[0x263EFEB50] Username];
  id v8 = objc_msgSend(v6, "_cn_compactMap:", v7);

  id v9 = [v8 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  char v10 = objc_msgSend(v9, "_cn_distinctObjects");

  id v11 = [MEMORY[0x263F33680] IsNotEmpty];
  v12 = objc_msgSend(v10, "_cn_filter:", v11);

  return v12;
}

+ (id)fingerprintOfInstantMessageAddresses:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFEAD0];
  id v4 = a3;
  id v5 = [v3 Value];
  id v6 = objc_msgSend(v4, "_cn_map:", v5);

  uint64_t v7 = [MEMORY[0x263EFEAC8] Username];
  id v8 = objc_msgSend(v6, "_cn_compactMap:", v7);

  id v9 = [v8 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  char v10 = objc_msgSend(v9, "_cn_distinctObjects");

  id v11 = [MEMORY[0x263F33680] IsNotEmpty];
  v12 = objc_msgSend(v10, "_cn_filter:", v11);

  return v12;
}

+ (void)descriptionOfActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_20B704000, a2, OS_LOG_TYPE_FAULT, "Generating cache key for unknown action type: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end