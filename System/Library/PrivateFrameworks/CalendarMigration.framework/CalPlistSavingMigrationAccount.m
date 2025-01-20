@interface CalPlistSavingMigrationAccount
- (BOOL)authenticated;
- (BOOL)dirty;
- (BOOL)enabledForCalendarsDataClass;
- (BOOL)provisionedForCalendarsDataClass;
- (BOOL)visible;
- (CalMigrationReadOnlyAccount)backingAccount;
- (CalPlistSavingMigrationAccount)initWithIdentifier:(id)a3 accountTypeIdentifier:(id)a4 backingAccount:(id)a5 initialProperties:(id)a6;
- (NSMutableDictionary)modifiedProperties;
- (NSMutableDictionary)savedProperties;
- (NSString)accountDescription;
- (NSString)identifier;
- (NSString)parentAccountIdentifier;
- (NSString)username;
- (id)accountPropertyForKey:(id)a3;
- (id)accountTypeIdentifier;
- (void)save;
- (void)setAccountDescription:(id)a3;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setAuthenticated:(BOOL)a3;
- (void)setEnabledForCalendarsDataClass:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParentAccountIdentifier:(id)a3;
- (void)setPassword:(id)a3;
- (void)setProvisionedForCalendarsDataClass:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CalPlistSavingMigrationAccount

- (CalPlistSavingMigrationAccount)initWithIdentifier:(id)a3 accountTypeIdentifier:(id)a4 backingAccount:(id)a5 initialProperties:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CalPlistSavingMigrationAccount;
  v15 = [(CalPlistSavingMigrationAccount *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_accountTypeIdentifier, a4);
    objc_storeStrong((id *)&v16->_backingAccount, a5);
    if (v14)
    {
      uint64_t v17 = [v14 mutableCopy];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    }
    savedProperties = v16->_savedProperties;
    v16->_savedProperties = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    modifiedProperties = v16->_modifiedProperties;
    v16->_modifiedProperties = (NSMutableDictionary *)v19;
  }
  return v16;
}

- (id)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (BOOL)dirty
{
  v2 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [(CalPlistSavingMigrationAccount *)self savedProperties];
    v6 = [v7 objectForKeyedSubscript:v4];

    if (!v6)
    {
      v8 = [(CalPlistSavingMigrationAccount *)self backingAccount];
      v6 = [v8 accountPropertyForKey:v4];
    }
  }
  id v9 = v6;

  return v9;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)save
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self savedProperties];
  id v4 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v3 addEntriesFromDictionary:v4];

  id v5 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v5 removeAllObjects];
}

- (NSString)accountDescription
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  id v4 = [v3 objectForKeyedSubscript:@"_CalPlistSavingMigrationAccount_accountDescription"];

  if (!v4)
  {
    id v5 = [(CalPlistSavingMigrationAccount *)self savedProperties];
    id v4 = [v5 objectForKeyedSubscript:@"_CalPlistSavingMigrationAccount_accountDescription"];

    if (!v4)
    {
      id v6 = [(CalPlistSavingMigrationAccount *)self backingAccount];
      id v4 = [v6 accountDescription];
    }
  }
  return (NSString *)v4;
}

- (void)setAccountDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v5 setObject:v4 forKeyedSubscript:@"_CalPlistSavingMigrationAccount_accountDescription"];
}

- (BOOL)visible
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  id v4 = [v3 objectForKeyedSubscript:@"_CalPlistSavingMigrationAccount_visible"];

  if (v4
    || ([(CalPlistSavingMigrationAccount *)self savedProperties],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"_CalPlistSavingMigrationAccount_visible"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    char v6 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(CalPlistSavingMigrationAccount *)self backingAccount];
    char v6 = [v4 visible];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setVisible:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v4 setObject:v5 forKeyedSubscript:@"_CalPlistSavingMigrationAccount_visible"];
}

- (BOOL)enabledForCalendarsDataClass
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  id v4 = [v3 objectForKeyedSubscript:@"_CalPlistSavingMigrationAccount_enabledForCalendarsDataClass"];

  if (v4
    || ([(CalPlistSavingMigrationAccount *)self savedProperties],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"_CalPlistSavingMigrationAccount_enabledForCalendarsDataClass"], id v4 = objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    char v6 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(CalPlistSavingMigrationAccount *)self backingAccount];
    char v6 = [v4 enabledForCalendarsDataClass];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setEnabledForCalendarsDataClass:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v4 setObject:v5 forKeyedSubscript:@"_CalPlistSavingMigrationAccount_enabledForCalendarsDataClass"];
}

- (BOOL)provisionedForCalendarsDataClass
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"];

  if (v4
    || ([(CalPlistSavingMigrationAccount *)self savedProperties],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"], id v4 = objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    char v6 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(CalPlistSavingMigrationAccount *)self backingAccount];
    char v6 = [v4 provisionedForCalendarsDataClass];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setProvisionedForCalendarsDataClass:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v4 setObject:v5 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_provisionedForCalendarsDataClass"];
}

- (BOOL)authenticated
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_authenticated"];

  if (v4
    || ([(CalPlistSavingMigrationAccount *)self savedProperties],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_authenticated"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    char v6 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(CalPlistSavingMigrationAccount *)self backingAccount];
    char v6 = [v4 authenticated];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setAuthenticated:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v4 setObject:v5 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_authenticated"];
}

- (NSString)username
{
  BOOL v3 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  id v4 = [v3 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_username"];

  if (!v4)
  {
    id v5 = [(CalPlistSavingMigrationAccount *)self savedProperties];
    id v4 = [v5 objectForKeyedSubscript:@"_CalChangeFilterMigrationAccount_username"];

    if (!v4)
    {
      char v6 = [(CalPlistSavingMigrationAccount *)self backingAccount];
      id v4 = [v6 username];
    }
  }
  return (NSString *)v4;
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v5 setObject:v4 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_username"];
}

- (void)setPassword:(id)a3
{
  id v4 = a3;
  id v5 = [(CalPlistSavingMigrationAccount *)self modifiedProperties];
  [v5 setObject:v4 forKeyedSubscript:@"_CalChangeFilterMigrationAccount_password"];
}

- (CalMigrationReadOnlyAccount)backingAccount
{
  return self->_backingAccount;
}

- (NSMutableDictionary)savedProperties
{
  return self->_savedProperties;
}

- (NSMutableDictionary)modifiedProperties
{
  return self->_modifiedProperties;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedProperties, 0);
  objc_storeStrong((id *)&self->_savedProperties, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
}

@end