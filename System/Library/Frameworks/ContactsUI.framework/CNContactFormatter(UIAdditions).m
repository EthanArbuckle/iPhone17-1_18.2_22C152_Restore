@interface CNContactFormatter(UIAdditions)
+ (id)sharedFullNameFormatter;
+ (id)sharedFullNameFormatterWithFallBacks;
- (id)stringFromGroupIdentity:()UIAdditions;
@end

@implementation CNContactFormatter(UIAdditions)

+ (id)sharedFullNameFormatter
{
  if (sharedFullNameFormatter_cn_once_token_2 != -1) {
    dispatch_once(&sharedFullNameFormatter_cn_once_token_2, &__block_literal_global_2);
  }
  v0 = (void *)sharedFullNameFormatter_cn_once_object_2;

  return v0;
}

+ (id)sharedFullNameFormatterWithFallBacks
{
  if (sharedFullNameFormatterWithFallBacks_cn_once_token_1 != -1) {
    dispatch_once(&sharedFullNameFormatterWithFallBacks_cn_once_token_1, &__block_literal_global_32077);
  }
  v0 = (void *)sharedFullNameFormatterWithFallBacks_cn_once_object_1;

  return v0;
}

- (id)stringFromGroupIdentity:()UIAdditions
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  v6 = [v4 groupName];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if (v5)
  {
    v7 = [v4 contacts];
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      v8 = 0;
    }
    else
    {
      v9 = [v7 firstObject];
      if ([v4 numberOfContacts] <= 1)
      {
        v18 = [MEMORY[0x1E4F1B910] stringFromContact:v9 style:0];
        if (v18)
        {
          id v10 = v18;
          v8 = v10;
        }
        else
        {
          v8 = [a1 stringFromContact:v9];
          id v10 = 0;
        }
      }
      else
      {
        id v10 = [a1 stringFromContact:v9];
        uint64_t v11 = [v4 numberOfContacts];
        uint64_t v12 = *MEMORY[0x1E4F5A2A0];
        if (v11 == 2 && (*(unsigned int (**)(void, id))(v12 + 16))(*MEMORY[0x1E4F5A2A0], v10))
        {
          v13 = [v7 lastObject];
          v14 = [a1 stringFromContact:v13];

          v15 = NSString;
          v16 = CNContactsUIBundle();
          v17 = [v16 localizedStringForKey:@"GROUP_IDENTITY_HEADER_TWO_CONTACTS_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
          v8 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v10, v14);
        }
        else
        {
          int v19 = (*(uint64_t (**)(uint64_t, id))(v12 + 16))(v12, v10);
          v20 = NSString;
          v21 = CNContactsUIBundle();
          v14 = v21;
          if (v19)
          {
            v16 = [v21 localizedStringForKey:@"GROUP_HEADER_CONTACT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
            objc_msgSend(v20, "localizedStringWithFormat:", v16, v10, objc_msgSend(v4, "numberOfContacts") - 1);
          }
          else
          {
            v16 = [v21 localizedStringForKey:@"GROUP_HEADER_CONTACT_NO_NAME_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
            objc_msgSend(v20, "localizedStringWithFormat:", v16, objc_msgSend(v4, "numberOfContacts"), v23);
          v8 = };
        }
      }
    }
  }
  else
  {
    v8 = [v4 groupName];
  }

  return v8;
}

@end