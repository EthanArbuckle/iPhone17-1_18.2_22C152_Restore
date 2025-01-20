@interface HMHome(MediaSetup)
- (BOOL)hasAccessoryTypeHomePod;
- (BOOL)userIdentifierBelongsInHome:()MediaSetup;
- (id)userWithIdentifier:()MediaSetup;
- (uint64_t)allUsers;
- (uint64_t)allUsersExcludingHomeOwner;
- (uint64_t)allUsersIdentifiers;
- (uint64_t)allUsersIdentifiersExcludingOwner;
- (uint64_t)isCurrentUserHomeOwner;
- (uint64_t)isCurrentUserRestrictedGuest;
- (uint64_t)isUpdatedForBolt;
- (uint64_t)userIdentifierBelongsToCurrentUser:()MediaSetup;
@end

@implementation HMHome(MediaSetup)

- (BOOL)hasAccessoryTypeHomePod
{
  v2 = [a1 accessories];

  if (!v2) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = [a1 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__HMHome_MediaSetup__hasAccessoryTypeHomePod__block_invoke;
  v6[3] = &unk_264775240;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)isCurrentUserHomeOwner
{
  v2 = [a1 currentUser];
  v3 = [v2 uniqueIdentifier];
  BOOL v4 = [a1 owner];
  v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

- (uint64_t)isCurrentUserRestrictedGuest
{
  v2 = [a1 currentUser];
  v3 = [a1 homeAccessControlForUser:v2];
  uint64_t v4 = [v3 isRestrictedGuest];

  return v4;
}

- (uint64_t)isUpdatedForBolt
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(a1, "accessories", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v6 isHomePod] && !objc_msgSend(v6, "supportsThirdPartyMusic"))
        {
          uint64_t v7 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_12:

  return v7;
}

- (uint64_t)userIdentifierBelongsToCurrentUser:()MediaSetup
{
  id v4 = a3;
  v5 = [a1 currentUser];
  uint64_t v6 = [v5 uniqueIdentifier];
  uint64_t v7 = [v6 isEqual:v4];

  return v7;
}

- (BOOL)userIdentifierBelongsInHome:()MediaSetup
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 allUsers];
    uint64_t v6 = objc_msgSend(v5, "hmf_firstObjectWithUniqueIdentifier:", v4);

    BOOL v7 = v6 != 0;
  }
  else
  {
    v8 = _MSLogingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HMHome(MediaSetup) userIdentifierBelongsInHome:](v8);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)allUsers
{
  return 0;
}

- (id)userWithIdentifier:()MediaSetup
{
  id v4 = a3;
  v5 = [a1 allUsers];
  uint64_t v6 = objc_msgSend(v5, "hmf_firstObjectWithUniqueIdentifier:", v4);

  return v6;
}

- (uint64_t)allUsersIdentifiers
{
  return 0;
}

- (uint64_t)allUsersExcludingHomeOwner
{
  return 0;
}

- (uint64_t)allUsersIdentifiersExcludingOwner
{
  return 0;
}

- (void)userIdentifierBelongsInHome:()MediaSetup .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[HMHome(MediaSetup) userIdentifierBelongsInHome:]";
  _os_log_error_impl(&dword_225D52000, log, OS_LOG_TYPE_ERROR, "%s NIL userIdentifier passed", (uint8_t *)&v1, 0xCu);
}

@end