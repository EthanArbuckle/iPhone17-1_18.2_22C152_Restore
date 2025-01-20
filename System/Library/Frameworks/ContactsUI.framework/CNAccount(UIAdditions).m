@interface CNAccount(UIAdditions)
+ (id)_cnui_displayNameForACAccount:()UIAdditions;
+ (id)_cnui_displayNameForLocal;
+ (uint64_t)_cnui_accountStore;
+ (uint64_t)_cnui_isFacebookACAccount:()UIAdditions;
+ (uint64_t)_cnui_requestRefreshWithUserAction:()UIAdditions;
+ (void)_cnui_canRequestRefreshWithCompletion:()UIAdditions;
- (id)_cnui_displayName;
@end

@implementation CNAccount(UIAdditions)

+ (void)_cnui_canRequestRefreshWithCompletion:()UIAdditions
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  v6 = dispatch_get_global_queue(9, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CNAccount_UIAdditions___cnui_canRequestRefreshWithCompletion___block_invoke;
  v8[3] = &unk_1E549A3D0;
  id v9 = v4;
  uint64_t v10 = a1;
  id v7 = v4;
  dispatch_after(v5, v6, v8);
}

+ (uint64_t)_cnui_requestRefreshWithUserAction:()UIAdditions
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CNAccount_UIAdditions___cnui_requestRefreshWithUserAction___block_invoke;
  aBlock[3] = &unk_1E549A3F8;
  aBlock[4] = &v12;
  aBlock[5] = a1;
  char v11 = a3;
  id v4 = _Block_copy(aBlock);
  dispatch_time_t v5 = v4;
  if (a3)
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    id v7 = dispatch_get_global_queue(9, 0);
    dispatch_after(v6, v7, v5);
  }
  uint64_t v8 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v8;
}

+ (uint64_t)_cnui_accountStore
{
  return [MEMORY[0x1E4F179C8] defaultStore];
}

- (id)_cnui_displayName
{
  v1 = [a1 externalIdentifierString];
  v2 = objc_opt_class();
  if (v1)
  {
    v3 = objc_msgSend(v2, "_cnui_accountStore");
    id v4 = [v3 accountWithIdentifier:v1];
    dispatch_time_t v5 = [v4 displayAccount];

    dispatch_time_t v6 = objc_msgSend((id)objc_opt_class(), "_cnui_displayNameForACAccount:", v5);
  }
  else
  {
    dispatch_time_t v6 = objc_msgSend(v2, "_cnui_displayNameForLocal");
  }

  return v6;
}

+ (uint64_t)_cnui_isFacebookACAccount:()UIAdditions
{
  v3 = [a3 accountType];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F177A0]];

  return v5;
}

+ (id)_cnui_displayNameForACAccount:()UIAdditions
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    dispatch_time_t v6 = [v4 accountDescription];
    if (!v6)
    {
      id v7 = [v5 accountType];
      dispatch_time_t v6 = [v7 accountTypeDescription];

      if (!v6)
      {
        uint64_t v8 = CNContactsUIBundle();
        dispatch_time_t v6 = [v8 localizedStringForKey:@"UNKNOWN_SOURCE_STRING" value:&stru_1ED8AC728 table:@"Localized"];
      }
    }
  }
  else
  {
    dispatch_time_t v6 = objc_msgSend(a1, "_cnui_displayNameForLocal");
  }

  return v6;
}

+ (id)_cnui_displayNameForLocal
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  v1 = [v0 model];

  return v1;
}

@end