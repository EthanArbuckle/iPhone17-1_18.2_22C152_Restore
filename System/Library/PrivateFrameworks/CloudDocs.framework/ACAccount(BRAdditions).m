@interface ACAccount(BRAdditions)
- (BOOL)br_hasPersonaIdentifier;
- (__CFString)br_personaIdentifier;
- (uint64_t)br_isEligibleiCloudAccount;
- (uint64_t)br_isEnabledForCloudDocs;
- (uint64_t)br_isEnabledForUbiquity;
- (uint64_t)br_isEnabledForiCloudDesktop;
- (void)br_setEnabledForiCloudDesktop:()BRAdditions;
@end

@implementation ACAccount(BRAdditions)

- (void)br_setEnabledForiCloudDesktop:()BRAdditions
{
  uint64_t v5 = *MEMORY[0x1E4F17B38];
  v6 = [a1 propertiesForDataclass:*MEMORY[0x1E4F17B38]];
  id v8 = (id)[v6 mutableCopy];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v7 = [NSNumber numberWithBool:a3];
  [v8 setObject:v7 forKeyedSubscript:BRAccountPropertyiCloudDesktopEnabled];

  [a1 setProperties:v8 forDataclass:v5];
}

- (uint64_t)br_isEnabledForiCloudDesktop
{
  return 0;
}

- (uint64_t)br_isEnabledForCloudDocs
{
  uint64_t result = [a1 isEnabledForDataclass:*MEMORY[0x1E4F17B38]];
  if (result)
  {
    return objc_msgSend(a1, "br_isCloudDocsMigrated");
  }
  return result;
}

- (uint64_t)br_isEnabledForUbiquity
{
  uint64_t result = [a1 isEnabledForDataclass:*MEMORY[0x1E4F17B38]];
  if (result) {
    return objc_msgSend(a1, "aa_isUsingCloudDocs") ^ 1;
  }
  return result;
}

- (__CFString)br_personaIdentifier
{
  v1 = [a1 accountPropertyForKey:*MEMORY[0x1E4F176E8]];
  v2 = v1;
  if (!v1) {
    v1 = @"__defaultPersonaID__";
  }
  v3 = v1;

  return v3;
}

- (BOOL)br_hasPersonaIdentifier
{
  v1 = objc_msgSend(a1, "br_personaIdentifier");
  BOOL v2 = [v1 length] != 0;

  return v2;
}

- (uint64_t)br_isEligibleiCloudAccount
{
  BOOL v2 = [a1 accountType];
  v3 = [v2 identifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F17750]])
  {
    if (objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38])) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [a1 isDataSeparatedAccount];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end