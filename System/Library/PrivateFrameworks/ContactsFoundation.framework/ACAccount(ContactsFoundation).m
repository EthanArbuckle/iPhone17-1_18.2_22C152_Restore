@interface ACAccount(ContactsFoundation)
- (uint64_t)_cn_altDSID;
- (uint64_t)_cn_appleAccountAppleID;
- (uint64_t)_cn_appleAccountAppleIDAliases;
- (uint64_t)_cn_appleID;
- (uint64_t)_cn_dsid;
- (uint64_t)_cn_firstName;
- (uint64_t)_cn_isAppleDisplayAccount;
- (uint64_t)_cn_isCardDAV;
- (uint64_t)_cn_isChildDelegateAccount;
- (uint64_t)_cn_isLDAP;
- (uint64_t)_cn_isManaged;
- (uint64_t)_cn_isPrimaryAccount;
- (uint64_t)_cn_isPrimaryiCloudAccount;
- (uint64_t)_cn_lastName;
- (uint64_t)_cn_principalPath;
- (uint64_t)set_cn_altDSID:()ContactsFoundation;
- (uint64_t)set_cn_appleID:()ContactsFoundation;
- (uint64_t)set_cn_dsid:()ContactsFoundation;
- (uint64_t)set_cn_firstName:()ContactsFoundation;
- (uint64_t)set_cn_lastName:()ContactsFoundation;
- (uint64_t)set_cn_principalPath:()ContactsFoundation;
- (void)setPropertiesFromDelegateInfo:()ContactsFoundation;
@end

@implementation ACAccount(ContactsFoundation)

- (uint64_t)_cn_dsid
{
  return [a1 accountPropertyForKey:@"DACardDAVAccountDSID"];
}

- (uint64_t)set_cn_dsid:()ContactsFoundation
{
  return [a1 setAccountProperty:a3 forKey:@"DACardDAVAccountDSID"];
}

- (uint64_t)_cn_altDSID
{
  return [a1 accountPropertyForKey:@"DACardDAVAccountAltDSID"];
}

- (uint64_t)set_cn_altDSID:()ContactsFoundation
{
  return [a1 setAccountProperty:a3 forKey:@"DACardDAVAccountAltDSID"];
}

- (uint64_t)_cn_principalPath
{
  return [a1 accountPropertyForKey:@"DAAccountPrincipalPath"];
}

- (uint64_t)set_cn_principalPath:()ContactsFoundation
{
  return [a1 setAccountProperty:a3 forKey:@"DAAccountPrincipalPath"];
}

- (uint64_t)_cn_appleID
{
  return [a1 accountPropertyForKey:@"DACardDAVAccountAppleID"];
}

- (uint64_t)set_cn_appleID:()ContactsFoundation
{
  return [a1 setAccountProperty:a3 forKey:@"DACardDAVAccountAppleID"];
}

- (uint64_t)_cn_firstName
{
  return [a1 accountPropertyForKey:*MEMORY[0x1E4F17690]];
}

- (uint64_t)set_cn_firstName:()ContactsFoundation
{
  return [a1 setAccountProperty:a3 forKey:*MEMORY[0x1E4F17690]];
}

- (uint64_t)_cn_lastName
{
  return [a1 accountPropertyForKey:*MEMORY[0x1E4F176D0]];
}

- (uint64_t)set_cn_lastName:()ContactsFoundation
{
  return [a1 setAccountProperty:a3 forKey:*MEMORY[0x1E4F176D0]];
}

- (uint64_t)_cn_isPrimaryAccount
{
  v1 = [a1 accountPropertyForKey:@"primaryAccount"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)_cn_isLDAP
{
  v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17818]];

  return v3;
}

- (uint64_t)_cn_isCardDAV
{
  v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17778]];

  return v3;
}

- (uint64_t)_cn_isAppleDisplayAccount
{
  v1 = [a1 displayAccount];
  uint64_t v2 = [v1 accountType];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F17750]];

  return v4;
}

- (uint64_t)_cn_isPrimaryiCloudAccount
{
  uint64_t result = objc_msgSend(a1, "_cn_isPrimaryAccount");
  if (result)
  {
    return objc_msgSend(a1, "_cn_isAppleDisplayAccount");
  }
  return result;
}

- (uint64_t)_cn_isChildDelegateAccount
{
  int v2 = objc_msgSend(a1, "_cn_isCardDAV");
  uint64_t v3 = [a1 parentAccount];
  int v4 = objc_msgSend(v3, "_cn_isCardDAV");

  return v2 & objc_msgSend(a1, "_cn_isAppleDisplayAccount") & v4;
}

- (uint64_t)_cn_isManaged
{
  if (LoadManagedConfiguration_loadPredicate != -1) {
    dispatch_once(&LoadManagedConfiguration_loadPredicate, &__block_literal_global_3);
  }

  return [a1 MCIsManaged];
}

- (uint64_t)_cn_appleAccountAppleID
{
  return [a1 accountPropertyForKey:@"appleId"];
}

- (uint64_t)_cn_appleAccountAppleIDAliases
{
  return [a1 accountPropertyForKey:@"appleIDAliases"];
}

- (void)setPropertiesFromDelegateInfo:()ContactsFoundation
{
  id v4 = a3;
  v5 = [v4 dsid];
  objc_msgSend(a1, "set_cn_dsid:", v5);

  v6 = [v4 altDSID];
  objc_msgSend(a1, "set_cn_altDSID:", v6);

  v7 = [v4 principalPath];
  objc_msgSend(a1, "set_cn_principalPath:", v7);

  v8 = [v4 appleID];
  objc_msgSend(a1, "set_cn_appleID:", v8);

  v9 = [v4 nameComponents];
  v10 = [v9 givenName];
  objc_msgSend(a1, "set_cn_firstName:", v10);

  id v12 = [v4 nameComponents];

  v11 = [v12 familyName];
  objc_msgSend(a1, "set_cn_lastName:", v11);
}

@end