@interface CNGeminiManager(ContactsUI)
+ (CNGeminiBadge)badgeForText:()ContactsUI;
+ (id)badgeForSenderIdentity:()ContactsUI;
+ (id)badgeForSubscription:()ContactsUI;
@end

@implementation CNGeminiManager(ContactsUI)

+ (CNGeminiBadge)badgeForText:()ContactsUI
{
  return +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:");
}

+ (id)badgeForSenderIdentity:()ContactsUI
{
  id v3 = a3;
  v4 = [v3 localizedShortName];
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v4))
  {
    v6 = [v3 localizedName];
    if ((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6))
    {
      v7 = @"?";
    }
    else
    {
      objc_msgSend(v6, "_cn_take:", 1);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    v4 = v7;
  }
  v8 = +[CNGeminiBadge geminiBadgeWithText:v4];

  return v8;
}

+ (id)badgeForSubscription:()ContactsUI
{
  id v3 = (objc_class *)MEMORY[0x1E4F1B9F8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v5 badgeLabelForSubscription:v4 error:0];

  v7 = @"?";
  if (v6) {
    v7 = v6;
  }
  v8 = v7;

  v9 = +[CNGeminiBadge geminiBadgeWithText:v8];

  return v9;
}

@end