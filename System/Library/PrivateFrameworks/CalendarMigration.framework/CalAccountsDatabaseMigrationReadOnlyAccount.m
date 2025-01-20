@interface CalAccountsDatabaseMigrationReadOnlyAccount
- (BOOL)authenticated;
- (BOOL)enabledForCalendarsDataClass;
- (BOOL)provisionedForCalendarsDataClass;
- (BOOL)visible;
- (CalAccountsDatabaseMigrationReadOnlyAccount)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 accountTypeIdentifier:(id)a5 description:(id)a6 enabledForCalendarDataClass:(BOOL)a7 provisionedForCalendarDataClass:(BOOL)a8 visible:(BOOL)a9 authenticated:(BOOL)a10 username:(id)a11 properties:(id)a12;
- (NSString)accountDescription;
- (NSString)username;
- (id)accountPropertyForKey:(id)a3;
- (id)accountTypeIdentifier;
- (id)identifier;
- (id)parentAccountIdentifier;
@end

@implementation CalAccountsDatabaseMigrationReadOnlyAccount

- (CalAccountsDatabaseMigrationReadOnlyAccount)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 accountTypeIdentifier:(id)a5 description:(id)a6 enabledForCalendarDataClass:(BOOL)a7 provisionedForCalendarDataClass:(BOOL)a8 visible:(BOOL)a9 authenticated:(BOOL)a10 username:(id)a11 properties:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v29 = a6;
  id v28 = a11;
  id v20 = a12;
  v30.receiver = self;
  v30.super_class = (Class)CalAccountsDatabaseMigrationReadOnlyAccount;
  v21 = [(CalAccountsDatabaseMigrationReadOnlyAccount *)&v30 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_parentAccountIdentifier, a4);
    objc_storeStrong((id *)&v22->_accountTypeIdentifier, a5);
    objc_storeStrong((id *)&v22->_accountDescription, a6);
    v22->_enabledForCalendarsDataClass = a7;
    v22->_provisionedForCalendarsDataClass = a8;
    v22->_visible = a9;
    v22->_authenticated = a10;
    objc_storeStrong((id *)&v22->_username, a11);
    uint64_t v23 = [v20 mutableCopy];
    accountProperties = v22->_accountProperties;
    v22->_accountProperties = (NSMutableDictionary *)v23;
  }
  return v22;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)parentAccountIdentifier
{
  return self->_parentAccountIdentifier;
}

- (id)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (id)accountPropertyForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_accountProperties objectForKeyedSubscript:a3];
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (BOOL)enabledForCalendarsDataClass
{
  return self->_enabledForCalendarsDataClass;
}

- (BOOL)provisionedForCalendarsDataClass
{
  return self->_provisionedForCalendarsDataClass;
}

- (BOOL)visible
{
  return self->_visible;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (NSString)username
{
  return self->_username;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountProperties, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_parentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end