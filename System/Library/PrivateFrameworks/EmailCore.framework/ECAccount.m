@interface ECAccount
+ (OS_os_log)log;
+ (id)standardPorts;
+ (id)standardSSLPorts;
- (ACAccount)systemAccount;
- (ACAccountCredential)credential;
- (ACAccountStore)accountStore;
- (BOOL)_cachedEnabled;
- (BOOL)allowInsecureAuthentication;
- (BOOL)configureDynamically;
- (BOOL)deleteMessagesInPlace;
- (BOOL)hasPasswordCredential;
- (BOOL)isAOLAccount;
- (BOOL)isAppleAccount;
- (BOOL)isAppleEmployeeAccount;
- (BOOL)isAuthenticated;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isExchangeAccount;
- (BOOL)isGmailAccount;
- (BOOL)isOutlookAccount;
- (BOOL)isPersonaAccount;
- (BOOL)isYahooAccount;
- (BOOL)setSslIsDirectIsSet;
- (BOOL)sslIsDirect;
- (BOOL)sslIsDirectIsSet;
- (BOOL)usesSSL;
- (ECAccount)initWithSystemAccount:(id)a3;
- (ECAccount)initWithSystemAccount:(id)a3 accountStore:(id)a4;
- (EFLazyCache)cache;
- (NSArray)standardPorts;
- (NSArray)standardSSLPorts;
- (NSDictionary)dataclassProperties;
- (NSDictionary)properties;
- (NSString)accountDescription;
- (NSString)accountDirectoryTildeAbbreviatedPath;
- (NSString)accountTypeIdentifier;
- (NSString)archiveMailboxName;
- (NSString)authenticationScheme;
- (NSString)debugDescription;
- (NSString)draftsMailboxName;
- (NSString)ef_publicDescription;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)junkMailboxName;
- (NSString)notesMailboxName;
- (NSString)oauthToken;
- (NSString)outboxMailboxName;
- (NSString)password;
- (NSString)personaIdentifier;
- (NSString)sentMessagesMailboxName;
- (NSString)toDosMailboxName;
- (NSString)trashMailboxName;
- (NSString)username;
- (id)_cachedParentAccount;
- (id)_hostnameFromParentAccount:(id)a3;
- (id)dataClassPropertyForKey:(id)a3;
- (id)enabledDataclasses;
- (id)portNumberObject;
- (id)usesSSLObject;
- (int64_t)defaultPortNumber;
- (int64_t)defaultSecurePortNumber;
- (int64_t)numberOfDaysToKeepJunk;
- (int64_t)numberOfDaysToKeepTrash;
- (int64_t)portNumber;
- (void)clearCache;
- (void)clearSSLIsDirect;
- (void)clearUsesSSL;
- (void)refresh;
- (void)renewCredentialsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setAccountDirectoryTildeAbbreviatedPath:(id)a3;
- (void)setAllowInsecureAuthentication:(BOOL)a3;
- (void)setArchiveMailboxName:(id)a3;
- (void)setAuthenticationScheme:(id)a3;
- (void)setConfigureDynamically:(BOOL)a3;
- (void)setDataClassProperty:(id)a3 forKey:(id)a4;
- (void)setDeleteMessagesInPlace:(BOOL)a3;
- (void)setDraftsMailboxName:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setJunkMailboxName:(id)a3;
- (void)setNotesMailboxName:(id)a3;
- (void)setNumberOfDaysToKeepJunk:(int64_t)a3;
- (void)setNumberOfDaysToKeepTrash:(int64_t)a3;
- (void)setOAuth2Token:(id)a3 refreshToken:(id)a4;
- (void)setOutboxMailboxName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPortNumber:(int64_t)a3;
- (void)setSentMessagesMailboxName:(id)a3;
- (void)setSslIsDirect:(BOOL)a3;
- (void)setSystemAccount:(id)a3;
- (void)setToDosMailboxName:(id)a3;
- (void)setTrashMailboxName:(id)a3;
- (void)setUsesSSL:(BOOL)a3;
@end

@implementation ECAccount

id __33__ECAccount__cachedParentAccount__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) systemAccount];
  v2 = [v1 parentAccount];

  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v4 = v3;

  return v4;
}

- (BOOL)isAppleEmployeeAccount
{
  v2 = [(ECAccount *)self hostname];
  BOOL v3 = ![v2 caseInsensitiveCompare:@"mail.apple.com"]
    || ![v2 caseInsensitiveCompare:@"mailpex.apple.com"]
    || [v2 caseInsensitiveCompare:@"mailex16.apple.com"] == 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_systemAccount, 0);
  objc_storeStrong((id *)&self->_accountDirectoryTildeAbbreviatedPath, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (ECAccount)initWithSystemAccount:(id)a3 accountStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ECAccount;
  v9 = [(ECAccount *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemAccount, a3);
    if (v8)
    {
      v11 = (ACAccountStore *)v8;
    }
    else
    {
      v11 = [MEMORY[0x1E4F179C8] defaultStore];
    }
    accountStore = v10->_accountStore;
    v10->_accountStore = v11;

    v13 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    cache = v10->_cache;
    v10->_cache = v13;
  }
  return v10;
}

- (ECAccount)initWithSystemAccount:(id)a3
{
  return [(ECAccount *)self initWithSystemAccount:a3 accountStore:0];
}

- (NSString)personaIdentifier
{
  BOOL v3 = [(ECAccount *)self systemAccount];
  uint64_t v4 = *MEMORY[0x1E4F176E8];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F176E8]];

  if (!v5)
  {
    v6 = [(ECAccount *)self _cachedParentAccount];
    id v7 = v6;
    if (v6)
    {
      v5 = [v6 objectForKeyedSubscript:v4];
    }
    else
    {
      v5 = 0;
    }
  }
  return (NSString *)v5;
}

- (NSString)hostname
{
  BOOL v3 = [(ECAccount *)self systemAccount];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F176A8]];

  if (!v4)
  {
    v5 = [(ECAccount *)self _cachedParentAccount];
    if (v5)
    {
      uint64_t v4 = [(ECAccount *)self _hostnameFromParentAccount:v5];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4 = a3;
  v5 = [(ECAccount *)self systemAccount];
  char v6 = [v5 isEnabledForDataclass:v4];

  return v6;
}

- (ACAccount)systemAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 40, 1);
}

- (id)_cachedParentAccount
{
  BOOL v3 = [(ECAccount *)self cache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__ECAccount__cachedParentAccount__block_invoke;
  v8[3] = &unk_1E63EE150;
  v8[4] = self;
  id v4 = [v3 objectForKey:@"ECAccountCacheKeyParentAccount" generator:v8];

  v5 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v5) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }

  return v6;
}

- (void)clearCache
{
  id v2 = [(ECAccount *)self cache];
  [v2 removeAllObjects];
}

- (EFLazyCache)cache
{
  return self->_cache;
}

- (void)setSystemAccount:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __16__ECAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  id v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __16__ECAccount_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (void)renewCredentialsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(ECAccount *)self accountStore];
  id v8 = [(ECAccount *)self systemAccount];
  [v7 renewCredentialsForAccount:v8 options:v9 completion:v6];
}

- (NSString)accountTypeIdentifier
{
  id v2 = [(ECAccount *)self systemAccount];
  id v3 = [v2 accountType];
  id v4 = [v3 identifier];

  return (NSString *)v4;
}

- (NSString)identifier
{
  id v2 = [(ECAccount *)self systemAccount];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (ACAccountCredential)credential
{
  id v2 = [(ECAccount *)self systemAccount];
  id v3 = [v2 credential];

  return (ACAccountCredential *)v3;
}

- (void)setHostname:(id)a3
{
  id v10 = a3;
  if ([v10 length])
  {
    uint64_t v5 = objc_msgSend(v10, "ef_stringWithNoExtraSpaces");

    id v10 = (id)v5;
  }
  id v6 = [(ECAccount *)self hostname];
  if (v10 != v6 && ([v10 isEqual:v6] & 1) == 0)
  {
    if (![v10 length])
    {

      id v10 = 0;
    }
    id v7 = [(ECAccount *)self systemAccount];
    id v8 = [(ECAccount *)self _cachedParentAccount];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"ECAccount.m" lineNumber:97 description:@"Unexpected override of the hostname from the parent"];
    }
    [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F176A8]];
  }
}

- (id)_hostnameFromParentAccount:(id)a3
{
  return 0;
}

- (NSString)username
{
  id v2 = [(ECAccount *)self systemAccount];
  id v3 = [v2 username];

  return (NSString *)v3;
}

- (NSString)password
{
  id v2 = [(ECAccount *)self systemAccount];
  id v3 = [v2 credential];
  id v4 = [v3 password];

  return (NSString *)v4;
}

- (void)setPassword:(id)a3
{
  id v8 = a3;
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 credential];
  id v6 = [v5 password];
  if (v6 != v8 && ([v6 isEqualToString:v8] & 1) == 0)
  {
    if (v5)
    {
      [v5 setPassword:v8];
      [v5 setCredentialType:*MEMORY[0x1E4F178C0]];
    }
    else
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v8];
      [v4 setCredential:v7];
    }
  }
}

- (NSString)oauthToken
{
  id v2 = [(ECAccount *)self systemAccount];
  id v3 = [v2 credential];
  id v4 = [v3 oauthToken];

  return (NSString *)v4;
}

- (void)setOAuth2Token:(id)a3 refreshToken:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(ECAccount *)self credential];
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F179C0]);
  }
  [v7 setOauthToken:v9];
  [v7 setOauthRefreshToken:v6];
  id v8 = [(ECAccount *)self systemAccount];
  [v8 setCredential:v7];
}

- (void)setIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ECAccount *)self systemAccount];
  uint64_t v6 = *MEMORY[0x1E4F17AD8];
  id v11 = v5;
  if ([v5 isEnabledForDataclass:*MEMORY[0x1E4F17AD8]] != v3)
  {
    id v7 = [(ECAccount *)self _cachedParentAccount];
    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = v11;
    }
    id v9 = v8;
    [v9 setEnabled:v3 forDataclass:v6];
    id v10 = [(ECAccount *)self cache];
    [v10 removeObjectForKey:@"ECAccountCacheKeyEnabled"];
  }
}

- (id)enabledDataclasses
{
  id v2 = [(ECAccount *)self systemAccount];
  BOOL v3 = [v2 enabledDataclasses];
  id v4 = [v3 allObjects];

  return v4;
}

- (BOOL)isAppleAccount
{
  BOOL v3 = [(ECAccount *)self _cachedParentAccount];
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 accountType];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *MEMORY[0x1E4F17750];
  if ([v6 isEqualToString:*MEMORY[0x1E4F17750]])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v3 accountType];
    id v10 = [v9 identifier];
    char v8 = [v10 isEqualToString:v7];
  }
  return v8;
}

- (BOOL)isYahooAccount
{
  BOOL v3 = [(ECAccount *)self _cachedParentAccount];
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 accountType];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *MEMORY[0x1E4F17878];
  if ([v6 isEqualToString:*MEMORY[0x1E4F17878]])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v3 accountType];
    id v10 = [v9 identifier];
    char v8 = [v10 isEqualToString:v7];
  }
  return v8;
}

- (BOOL)isGmailAccount
{
  BOOL v3 = [(ECAccount *)self _cachedParentAccount];
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 accountType];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *MEMORY[0x1E4F177C0];
  if ([v6 isEqualToString:*MEMORY[0x1E4F177C0]])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v3 accountType];
    id v10 = [v9 identifier];
    char v8 = [v10 isEqualToString:v7];
  }
  return v8;
}

- (BOOL)isExchangeAccount
{
  BOOL v3 = [(ECAccount *)self _cachedParentAccount];
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 accountType];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *MEMORY[0x1E4F17798];
  if ([v6 isEqualToString:*MEMORY[0x1E4F17798]])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v3 accountType];
    id v10 = [v9 identifier];
    char v8 = [v10 isEqualToString:v7];
  }
  return v8;
}

- (BOOL)isOutlookAccount
{
  BOOL v3 = [(ECAccount *)self _cachedParentAccount];
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 accountType];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *MEMORY[0x1E4F177D0];
  if ([v6 isEqualToString:*MEMORY[0x1E4F177D0]])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v3 accountType];
    id v10 = [v9 identifier];
    char v8 = [v10 isEqualToString:v7];
  }
  return v8;
}

- (BOOL)isAOLAccount
{
  BOOL v3 = [(ECAccount *)self _cachedParentAccount];
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = [v4 accountType];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *MEMORY[0x1E4F17740];
  if ([v6 isEqualToString:*MEMORY[0x1E4F17740]])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v3 accountType];
    id v10 = [v9 identifier];
    char v8 = [v10 isEqualToString:v7];
  }
  return v8;
}

- (BOOL)isPersonaAccount
{
  id v2 = [(ECAccount *)self personaIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)authenticationScheme
{
  id v2 = [(ECAccount *)self systemAccount];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17658]];

  return (NSString *)v3;
}

- (void)setAuthenticationScheme:(id)a3
{
  id v7 = a3;
  id v4 = [(ECAccount *)self systemAccount];
  uint64_t v5 = *MEMORY[0x1E4F17658];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F17658]];
  if (v6 != v7 && ([v7 isEqualToString:v6] & 1) == 0) {
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
}

- (BOOL)allowInsecureAuthentication
{
  id v2 = [(ECAccount *)self systemAccount];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17650]];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)setAllowInsecureAuthentication:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(ECAccount *)self systemAccount];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F17650]];
}

- (BOOL)configureDynamically
{
  BOOL v3 = [(ECAccount *)self oauthToken];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [(ECAccount *)self systemAccount];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F17670]];

    int v4 = [v6 BOOLValue] ^ 1;
  }
  return v4;
}

- (void)setConfigureDynamically:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ECAccount *)self oauthToken];

  if (!v5)
  {
    id v7 = [NSNumber numberWithBool:!v3];
    id v6 = [(ECAccount *)self systemAccount];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F17670]];
  }
}

- (BOOL)hasPasswordCredential
{
  id v2 = [(ECAccount *)self systemAccount];
  BOOL v3 = [v2 credential];
  int v4 = [v3 credentialType];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F178C0]];

  return v5;
}

- (BOOL)isAuthenticated
{
  id v2 = [(ECAccount *)self systemAccount];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (void)refresh
{
  id v2 = [(ECAccount *)self systemAccount];
  [v2 refresh];
}

- (NSString)debugDescription
{
  char v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ECAccount;
  int v4 = [(ECAccount *)&v9 description];
  char v5 = [(ECAccount *)self identifier];
  id v6 = [(ECAccount *)self properties];
  id v7 = [v3 stringWithFormat:@"<%@> identifier=%@ properties=%@", v4, v5, v6];

  return (NSString *)v7;
}

- (int64_t)numberOfDaysToKeepTrash
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"NumberOfDaysToKeepTrash"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)setNumberOfDaysToKeepTrash:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (int64_t)numberOfDaysToKeepJunk
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"NumberOfDaysToKeepJunk"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)setNumberOfDaysToKeepJunk:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)deleteMessagesInPlace
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"DeleteMessagesInPlace"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setDeleteMessagesInPlace:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (NSString)draftsMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"DraftsMailboxName"];

  return (NSString *)v3;
}

- (void)setDraftsMailboxName:(id)a3
{
}

- (NSString)outboxMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"OutboxMailboxName"];

  return (NSString *)v3;
}

- (void)setOutboxMailboxName:(id)a3
{
}

- (NSString)sentMessagesMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"SentMessagesMailboxName"];

  return (NSString *)v3;
}

- (void)setSentMessagesMailboxName:(id)a3
{
}

- (NSString)trashMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"TrashMailboxName"];

  return (NSString *)v3;
}

- (void)setTrashMailboxName:(id)a3
{
}

- (NSString)junkMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"JunkMailboxName"];

  return (NSString *)v3;
}

- (void)setJunkMailboxName:(id)a3
{
}

- (NSString)notesMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"NotesMailboxName"];

  return (NSString *)v3;
}

- (void)setNotesMailboxName:(id)a3
{
}

- (NSString)toDosMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"ToDosMailboxName"];

  return (NSString *)v3;
}

- (void)setToDosMailboxName:(id)a3
{
}

- (NSString)archiveMailboxName
{
  id v2 = [(ECAccount *)self dataclassProperties];
  char v3 = [v2 objectForKeyedSubscript:@"ArchiveMailboxName"];

  return (NSString *)v3;
}

- (void)setArchiveMailboxName:(id)a3
{
}

- (NSDictionary)dataclassProperties
{
  id v2 = [(ECAccount *)self systemAccount];
  char v3 = [v2 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];

  return (NSDictionary *)v3;
}

- (id)dataClassPropertyForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(ECAccount *)self dataclassProperties];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setDataClassProperty:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  char v8 = [(ECAccount *)self dataclassProperties];
  objc_super v9 = (void *)[v7 initWithDictionary:v8];

  [v9 setObject:v11 forKeyedSubscript:v6];
  id v10 = [(ECAccount *)self systemAccount];
  [v10 setProperties:v9 forDataclass:*MEMORY[0x1E4F17AD8]];
}

- (id)portNumberObject
{
  id v2 = [(ECAccount *)self systemAccount];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F176F0]];

  return v3;
}

- (int64_t)portNumber
{
  id v2 = [(ECAccount *)self portNumberObject];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setPortNumber:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(ECAccount *)self systemAccount];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F176F0]];
}

+ (id)standardPorts
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)standardSSLPorts
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSArray)standardPorts
{
  id v2 = objc_opt_class();
  return (NSArray *)[v2 standardPorts];
}

- (NSArray)standardSSLPorts
{
  id v2 = objc_opt_class();
  return (NSArray *)[v2 standardSSLPorts];
}

- (int64_t)defaultPortNumber
{
  return 0;
}

- (int64_t)defaultSecurePortNumber
{
  return 0;
}

- (id)usesSSLObject
{
  id v2 = [(ECAccount *)self systemAccount];
  int64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17718]];

  return v3;
}

- (BOOL)usesSSL
{
  id v2 = [(ECAccount *)self usesSSLObject];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUsesSSL:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(ECAccount *)self systemAccount];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F17718]];
}

- (void)clearUsesSSL
{
  id v2 = [(ECAccount *)self systemAccount];
  [v2 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F17718]];
}

- (BOOL)sslIsDirect
{
  id v2 = [(ECAccount *)self systemAccount];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17720]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSslIsDirect:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  char v4 = [(ECAccount *)self systemAccount];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F17720]];
}

- (BOOL)setSslIsDirectIsSet
{
  id v2 = [(ECAccount *)self systemAccount];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17720]];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)clearSSLIsDirect
{
  id v2 = [(ECAccount *)self systemAccount];
  [v2 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F17720]];
}

- (BOOL)_cachedEnabled
{
  char v3 = [(ECAccount *)self cache];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__ECAccount__cachedEnabled__block_invoke;
  v6[3] = &unk_1E63EE150;
  v6[4] = self;
  BOOL v4 = [v3 objectForKey:@"ECAccountCacheKeyEnabled" generator:v6];

  LOBYTE(v3) = [v4 BOOLValue];
  return (char)v3;
}

uint64_t __27__ECAccount__cachedEnabled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) systemAccount];
  uint64_t v3 = *MEMORY[0x1E4F17AD8];
  if ([v2 isEnabledForDataclass:*MEMORY[0x1E4F17AD8]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) systemAccount];
    id v6 = [v5 parentAccount];
    uint64_t v4 = [v6 isEnabledForDataclass:v3];
  }
  id v7 = NSNumber;
  return [v7 numberWithBool:v4];
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  if (v4)
  {
    id v7 = [(ECAccount *)self accountTypeIdentifier];
    char v8 = [(ECAccount *)self identifier];
    objc_super v9 = [v5 stringWithFormat:@"<%@ %p> accountTypeIdentifier=%@ identifier=%@", v6, self, v7, v8];
  }
  else
  {
    id v7 = [(ECAccount *)self identifier];
    objc_super v9 = [v5 stringWithFormat:@"<%@ %p> identifier=%@", v6, self, v7];
  }

  return (NSString *)v9;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (BOOL)sslIsDirectIsSet
{
  return self->_sslIsDirectIsSet;
}

- (NSString)accountDirectoryTildeAbbreviatedPath
{
  return self->_accountDirectoryTildeAbbreviatedPath;
}

- (void)setAccountDirectoryTildeAbbreviatedPath:(id)a3
{
}

@end