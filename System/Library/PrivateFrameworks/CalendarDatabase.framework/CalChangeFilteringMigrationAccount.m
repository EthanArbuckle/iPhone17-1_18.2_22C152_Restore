@interface CalChangeFilteringMigrationAccount
- (BOOL)authenticated;
- (BOOL)dirty;
- (BOOL)enabledForCalendarsDataClass;
- (BOOL)provisionedForCalendarsDataClass;
- (BOOL)visible;
- (CalChangeFilteringMigrationAccount)initWithAccountIdentifier:(id)a3 accountTypeIdentifier:(id)a4;
- (CalChangeFilteringMigrationAccount)initWithBackingAccount:(id)a3;
- (CalMigrationAccount)backingAccount;
- (NSMutableDictionary)modifiedPropertyValues;
- (NSString)accountDescription;
- (NSString)parentAccountIdentifier;
- (NSString)username;
- (id)accountPropertyForKey:(id)a3;
- (id)accountTypeIdentifier;
- (id)identifier;
- (void)setAccountDescription:(id)a3;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticationTypeNone;
- (void)setAuthenticationTypeParent;
- (void)setEnabledForCalendarsDataClass:(BOOL)a3;
- (void)setParentAccountIdentifier:(id)a3;
- (void)setPassword:(id)a3;
- (void)setProvisionedForCalendarsDataClass:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CalChangeFilteringMigrationAccount

- (CalChangeFilteringMigrationAccount)initWithBackingAccount:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v7 = [v5 accountTypeIdentifier];
  v8 = [(CalChangeFilteringMigrationAccount *)self initWithAccountIdentifier:v6 accountTypeIdentifier:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_backingAccount, a3);
  }

  return v8;
}

- (CalChangeFilteringMigrationAccount)initWithAccountIdentifier:(id)a3 accountTypeIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalChangeFilteringMigrationAccount;
  v9 = [(CalChangeFilteringMigrationAccount *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountIdentifier, a3);
    objc_storeStrong((id *)&v10->_accountTypeIdentifier, a4);
    uint64_t v11 = objc_opt_new();
    modifiedPropertyValues = v10->_modifiedPropertyValues;
    v10->_modifiedPropertyValues = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    id v7 = [v8 accountPropertyForKey:v4];
  }
  return v7;
}

- (id)identifier
{
  return self->_accountIdentifier;
}

- (id)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)setAuthenticationTypeParent
{
  id v2 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v2 setObject:@"Parent" forKeyedSubscript:@"_CalChangeFilterMigrationAccount_setAuthenticationType"];
}

- (void)setAuthenticationTypeNone
{
  id v2 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v2 setObject:@"None" forKeyedSubscript:@"_CalChangeFilterMigrationAccount_setAuthenticationType"];
}

- (NSString)accountDescription
{
  v3 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_accountDescription"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    id v5 = [v6 accountDescription];
  }
  return (NSString *)v5;
}

- (void)setAccountDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v5 setObject:v4 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_accountDescription"];
}

- (BOOL)visible
{
  v3 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_visible"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v6 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    char v5 = [v6 visible];
  }
  return v5;
}

- (void)setVisible:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v4 setObject:v5 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_visible"];
}

- (BOOL)enabledForCalendarsDataClass
{
  v3 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_enabledForCalendarsDataClass"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v6 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    char v5 = [v6 enabledForCalendarsDataClass];
  }
  return v5;
}

- (void)setEnabledForCalendarsDataClass:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v4 setObject:v5 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_enabledForCalendarsDataClass"];
}

- (BOOL)provisionedForCalendarsDataClass
{
  v3 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v6 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    char v5 = [v6 provisionedForCalendarsDataClass];
  }
  return v5;
}

- (void)setProvisionedForCalendarsDataClass:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v4 setObject:v5 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"];
}

- (BOOL)authenticated
{
  v3 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_authenticated"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v6 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    char v5 = [v6 authenticated];
  }
  return v5;
}

- (void)setAuthenticated:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v4 setObject:v5 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_authenticated"];
}

- (NSString)username
{
  v3 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_username"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(CalChangeFilteringMigrationAccount *)self backingAccount];
    id v5 = [v6 username];
  }
  return (NSString *)v5;
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v5 setObject:v4 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_username"];
}

- (void)setPassword:(id)a3
{
  id v4 = a3;
  id v5 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  [v5 setObject:v4 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_password"];
}

- (BOOL)dirty
{
  v3 = [(CalChangeFilteringMigrationAccount *)self backingAccount];

  if (!v3) {
    return 1;
  }
  id v4 = [(CalChangeFilteringMigrationAccount *)self modifiedPropertyValues];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (NSMutableDictionary)modifiedPropertyValues
{
  return self->_modifiedPropertyValues;
}

- (CalMigrationAccount)backingAccount
{
  return self->_backingAccount;
}

- (NSString)parentAccountIdentifier
{
  return self->_parentAccountIdentifier;
}

- (void)setParentAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
  objc_storeStrong((id *)&self->_modifiedPropertyValues, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
}

@end