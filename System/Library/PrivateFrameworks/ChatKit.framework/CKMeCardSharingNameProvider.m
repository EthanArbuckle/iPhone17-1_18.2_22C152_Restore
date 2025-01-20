@interface CKMeCardSharingNameProvider
+ (id)nameContactForPrimaryAccount;
+ (id)nameProviderForAccount:(id)a3;
+ (id)nameProviderForContact:(id)a3;
+ (id)nameProviderForNickname:(id)a3;
+ (id)nameProviderForPrimaryAccount;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)nickname;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
@end

@implementation CKMeCardSharingNameProvider

+ (id)nameProviderForContact:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKMeCardSharingNameProvider);
    if (v4)
    {
      v5 = [v3 givenName];
      [(CKMeCardSharingNameProvider *)v4 setGivenName:v5];

      v6 = [v3 middleName];
      [(CKMeCardSharingNameProvider *)v4 setMiddleName:v6];

      v7 = [v3 familyName];
      [(CKMeCardSharingNameProvider *)v4 setFamilyName:v7];

      v8 = [v3 nickname];
      [(CKMeCardSharingNameProvider *)v4 setNickname:v8];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "nameProviderForContact: called with nil contact", v11, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

+ (id)nameProviderForNickname:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKMeCardSharingNameProvider);
    if (v4)
    {
      v5 = [v3 firstName];
      [(CKMeCardSharingNameProvider *)v4 setGivenName:v5];

      v6 = [v3 lastName];
      [(CKMeCardSharingNameProvider *)v4 setFamilyName:v6];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "nameProviderForNickname: called with nil contact", v9, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

+ (id)nameProviderForAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKMeCardSharingNameProvider);
    if (v4)
    {
      v5 = objc_msgSend(v3, "aa_firstName");
      [(CKMeCardSharingNameProvider *)v4 setGivenName:v5];

      v6 = objc_msgSend(v3, "aa_middleName");
      [(CKMeCardSharingNameProvider *)v4 setMiddleName:v6];

      v7 = objc_msgSend(v3, "aa_lastName");
      [(CKMeCardSharingNameProvider *)v4 setFamilyName:v7];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "nameProviderForAccount: called with nil account", v10, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

+ (id)nameProviderForPrimaryAccount
{
  id v3 = (objc_class *)MEMORY[0x192FBA860](@"ACAccountStore", @"Accounts");
  if (v3)
  {
    id v4 = objc_alloc_init(v3);
    v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
    v6 = [a1 nameProviderForAccount:v5];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKMeCardSharingNameProvider: Failed linking Accounts", v9, 2u);
      }
    }
    v6 = 0;
  }

  return v6;
}

+ (id)nameContactForPrimaryAccount
{
  v2 = (objc_class *)MEMORY[0x192FBA860](@"ACAccountStore", @"Accounts");
  if (v2)
  {
    id v3 = objc_alloc_init(v2);
    id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
    id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v6 = objc_msgSend(v4, "aa_firstName");
    [v5 setGivenName:v6];

    v7 = objc_msgSend(v4, "aa_lastName");
    [v5 setFamilyName:v7];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKMeCardSharingNameProvider: Failed linking Accounts", v10, 2u);
      }
    }
    id v5 = 0;
  }

  return v5;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);

  objc_storeStrong((id *)&self->_givenName, 0);
}

@end