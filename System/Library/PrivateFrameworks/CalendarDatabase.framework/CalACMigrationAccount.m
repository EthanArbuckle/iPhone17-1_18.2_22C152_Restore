@interface CalACMigrationAccount
- (ACAccount)account;
- (BOOL)authenticated;
- (BOOL)dirty;
- (BOOL)enabledForCalendarsDataClass;
- (BOOL)provisionedForCalendarsDataClass;
- (BOOL)visible;
- (CalACMigrationAccount)initWithACAccount:(id)a3;
- (NSString)accountDescription;
- (NSString)username;
- (id)accountPropertyForKey:(id)a3;
- (id)accountTypeIdentifier;
- (id)identifier;
- (id)parentAccountIdentifier;
- (void)setAccountDescription:(id)a3;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticationTypeNone;
- (void)setAuthenticationTypeParent;
- (void)setEnabledForCalendarsDataClass:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setProvisionedForCalendarsDataClass:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CalACMigrationAccount

- (CalACMigrationAccount)initWithACAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalACMigrationAccount;
  v6 = [(CalACMigrationAccount *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)identifier
{
  v2 = [(CalACMigrationAccount *)self account];
  v3 = [v2 identifier];

  return v3;
}

- (id)parentAccountIdentifier
{
  v2 = [(CalACMigrationAccount *)self account];
  v3 = [v2 parentAccountIdentifier];

  return v3;
}

- (id)accountTypeIdentifier
{
  v2 = [(CalACMigrationAccount *)self account];
  v3 = [v2 accountType];
  v4 = [v3 identifier];

  return v4;
}

- (BOOL)dirty
{
  v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 isDirty];

  return v3;
}

- (NSString)accountDescription
{
  v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 accountDescription];

  return (NSString *)v3;
}

- (void)setAccountDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(CalACMigrationAccount *)self account];
  [v5 setAccountDescription:v4];
}

- (BOOL)visible
{
  v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 isVisible];

  return v3;
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CalACMigrationAccount *)self account];
  [v4 setVisible:v3];
}

- (BOOL)enabledForCalendarsDataClass
{
  v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 isEnabledForDataclass:*MEMORY[0x1E4F17568]];

  return v3;
}

- (void)setEnabledForCalendarsDataClass:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CalACMigrationAccount *)self account];
  [v4 setEnabled:v3 forDataclass:*MEMORY[0x1E4F17568]];
}

- (BOOL)provisionedForCalendarsDataClass
{
  v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 isProvisionedForDataclass:*MEMORY[0x1E4F17568]];

  return v3;
}

- (void)setProvisionedForCalendarsDataClass:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CalACMigrationAccount *)self account];
  [v4 setProvisioned:v3 forDataclass:*MEMORY[0x1E4F17568]];
}

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CalACMigrationAccount *)self account];
  v6 = [v5 accountPropertyForKey:v4];

  return v6;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CalACMigrationAccount *)self account];
  [v8 setAccountProperty:v7 forKey:v6];
}

- (void)setAuthenticationTypeParent
{
  uint64_t v2 = *MEMORY[0x1E4F17A58];
  id v3 = [(CalACMigrationAccount *)self account];
  [v3 setAuthenticationType:v2];
}

- (void)setAuthenticationTypeNone
{
  uint64_t v2 = *MEMORY[0x1E4F17A50];
  id v3 = [(CalACMigrationAccount *)self account];
  [v3 setAuthenticationType:v2];
}

- (void)setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CalACMigrationAccount *)self account];
  [v5 setAuthenticated:v3];

  id v6 = [(CalACMigrationAccount *)self account];
  [v6 setSupportsAuthentication:1];
}

- (BOOL)authenticated
{
  uint64_t v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (NSString)username
{
  uint64_t v2 = [(CalACMigrationAccount *)self account];
  char v3 = [v2 username];

  return (NSString *)v3;
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(CalACMigrationAccount *)self account];
  [v5 setUsername:v4];
}

- (void)setPassword:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F179C0];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithPassword:v5];

  id v6 = [(CalACMigrationAccount *)self account];
  [v6 setCredential:v7];
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end