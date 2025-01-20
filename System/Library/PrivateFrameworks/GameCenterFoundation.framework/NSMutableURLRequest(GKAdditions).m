@interface NSMutableURLRequest(GKAdditions)
+ (uint64_t)hashForPlayerID:()GKAdditions;
- (uint64_t)setLocale:()GKAdditions;
- (void)setDeviceUniqueID;
- (void)setGameDescriptor:()GKAdditions;
- (void)setInternal:()GKAdditions;
- (void)setLocale:()GKAdditions isOverridingUsersPreferredLanguage:;
- (void)setPlayerID:()GKAdditions hash:authToken:;
- (void)setPushToken:()GKAdditions;
- (void)setRestrictions:()GKAdditions;
- (void)setSAPSignature:()GKAdditions;
- (void)setSAPversion:()GKAdditions;
- (void)setStoreMode:()GKAdditions;
@end

@implementation NSMutableURLRequest(GKAdditions)

+ (uint64_t)hashForPlayerID:()GKAdditions
{
  uint64_t v3 = [a3 hash];
  if (v3 >= 0) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = -v3;
  }
  return (v4 % 0xF4240) + 1000000;
}

- (void)setPlayerID:()GKAdditions hash:authToken:
{
  id v11 = a3;
  id v7 = a5;
  v8 = [a1 URL];
  int v9 = [v8 _gkIsSecure];

  if (v9 && v11 && v7)
  {
    [a1 setValue:v11 forHTTPHeaderField:@"x-gk-player-id"];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend((id)objc_opt_class(), "hashForPlayerID:", v11));
    [a1 setValue:v10 forHTTPHeaderField:@"x-gk-player-id-hash"];

    [a1 setValue:v7 forHTTPHeaderField:@"x-gk-auth-token"];
  }
}

- (void)setGameDescriptor:()GKAdditions
{
  id v17 = a3;
  unint64_t v4 = [a1 URL];
  int v5 = [v4 _gkIsSecure];

  if (v17 && v5)
  {
    v6 = [v17 objectForKey:@"adam-id"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [v6 stringValue];

      v6 = (void *)v7;
    }
    if (v6) {
      [a1 setValue:v6 forHTTPHeaderField:@"x-gk-adam-id"];
    }
    v8 = [v17 objectForKey:@"external-version"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = [v8 stringValue];

      v8 = (void *)v9;
    }
    if (v8) {
      [a1 setValue:v8 forHTTPHeaderField:@"x-gk-external-version"];
    }
    v10 = [v17 objectForKey:@"parent-bundle-id"];
    if (v10
      || ([v17 objectForKey:@"bundle-id"],
          (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [a1 setValue:v10 forHTTPHeaderField:@"x-gk-bundle-id"];
    }
    id v11 = [v17 objectForKey:@"bundle-version"];
    if (v11) {
      [a1 setValue:v11 forHTTPHeaderField:@"x-gk-bundle-version"];
    }
    v12 = [v17 objectForKey:@"platform"];
    if (v12) {
      [a1 setValue:v12 forHTTPHeaderField:@"x-gk-platform"];
    }
    v13 = [v17 objectForKey:@"short-bundle-version"];
    if (v13)
    {
      [a1 setValue:v13 forHTTPHeaderField:@"x-gk-short-bundle-version"];
    }
    else
    {
      v14 = +[GKApplicationWorkspace defaultWorkspace];
      v15 = [v14 applicationProxyForBundleID:v10];
      if ([v15 isInstalled] && (objc_msgSend(v15, "isRestricted") & 1) == 0)
      {
        v16 = [v15 bundleShortVersion];
        if (v16) {
          [a1 setValue:v16 forHTTPHeaderField:@"x-gk-short-bundle-version"];
        }
      }
    }
  }
}

- (void)setStoreMode:()GKAdditions
{
  id v8 = a3;
  unint64_t v4 = [a1 URL];
  int v5 = [v4 _gkIsSecure];

  if (v5)
  {
    if (v8)
    {
      if (![v8 isStoreDemoModeEnabled]) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    v6 = +[GKPreferences shared];
    char v7 = [v6 isStoreDemoModeEnabled];

    if (v7) {
LABEL_4:
    }
      [a1 setValue:@"true" forHTTPHeaderField:@"x-gk-store-mode"];
  }
LABEL_5:
}

- (void)setRestrictions:()GKAdditions
{
  id v10 = a3;
  unint64_t v4 = [a1 URL];
  int v5 = [v4 _gkIsSecure];

  if (v5)
  {
    if (v10)
    {
      if ([v10 isMultiplayerGamingRestricted]) {
        [a1 setValue:@"true" forHTTPHeaderField:@"x-gk-restrict-multiplayer"];
      }
      if ([v10 isAddingFriendsRestricted]) {
LABEL_6:
      }
        [a1 setValue:@"true" forHTTPHeaderField:@"x-gk-restrict-friend-add"];
    }
    else
    {
      v6 = +[GKPreferences shared];
      int v7 = [v6 isMultiplayerGamingRestricted];

      if (v7) {
        [a1 setValue:@"true" forHTTPHeaderField:@"x-gk-restrict-multiplayer"];
      }
      id v8 = +[GKPreferences shared];
      int v9 = [v8 isAddingFriendsRestricted];

      if (v9) {
        goto LABEL_6;
      }
    }
  }
}

- (void)setDeviceUniqueID
{
  v2 = [a1 URL];
  int v3 = [v2 _gkIsSecure];

  if (v3)
  {
    id v5 = +[GKDevice currentDevice];
    unint64_t v4 = [v5 udid];
    [a1 setValue:v4 forHTTPHeaderField:@"x-gk-udid"];
  }
}

- (void)setPushToken:()GKAdditions
{
  id v8 = a3;
  unint64_t v4 = [a1 URL];
  int v5 = [v4 _gkIsSecure];

  v6 = v8;
  if (v8 && v5)
  {
    int v7 = [v8 _gkAsHexString];
    [a1 setValue:v7 forHTTPHeaderField:@"x-gk-push-token"];

    v6 = v8;
  }
}

- (void)setInternal:()GKAdditions
{
  int v5 = [a1 URL];
  int v6 = [v5 _gkIsSecure];

  if (v6 && a3)
  {
    id v8 = [NSNumber numberWithBool:1];
    int v7 = [v8 stringValue];
    [a1 setValue:v7 forHTTPHeaderField:@"x-gk-internal"];
  }
}

- (uint64_t)setLocale:()GKAdditions
{
  return [a1 setLocale:a3 isOverridingUsersPreferredLanguage:0];
}

- (void)setLocale:()GKAdditions isOverridingUsersPreferredLanguage:
{
  if (a3 && (a4 & 1) != 0)
  {
    uint64_t v6 = [a3 localeIdentifier];
  }
  else
  {
    int v7 = (void *)MEMORY[0x1E4F28B50];
    id v8 = a3;
    uint64_t v6 = [v7 _gkPreferredUserLanguage];
  }
  id v10 = (id)v6;
  [a1 setValue:v6 forHTTPHeaderField:@"accept-language"];
  int v9 = [a3 localeIdentifier];

  [a1 setValue:v9 forHTTPHeaderField:@"x-gk-region-format"];
}

- (void)setSAPSignature:()GKAdditions
{
  id v8 = a3;
  unint64_t v4 = [a1 URL];
  int v5 = [v4 _gkIsSecure];

  uint64_t v6 = v8;
  if (v8 && v5)
  {
    int v7 = [v8 base64EncodedStringWithOptions:0];
    [a1 setValue:v7 forHTTPHeaderField:@"x-gk-sap-signature"];

    uint64_t v6 = v8;
  }
}

- (void)setSAPversion:()GKAdditions
{
  id v7 = a3;
  unint64_t v4 = [a1 URL];
  int v5 = [v4 _gkIsSecure];

  uint64_t v6 = v7;
  if (v7 && v5)
  {
    [a1 setValue:v7 forHTTPHeaderField:@"x-gk-sap-version"];
    uint64_t v6 = v7;
  }
}

@end