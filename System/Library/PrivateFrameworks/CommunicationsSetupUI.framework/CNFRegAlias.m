@interface CNFRegAlias
- (BOOL)isDeviceAlias;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalPhoneNumberAlias;
- (BOOL)isPhoneNumberAliasOnPhoneNumberAccount;
- (BOOL)isSelectedDeviceAlias;
- (BOOL)isTemporary;
- (BOOL)isTemporaryPhoneNumberAlias;
- (BOOL)validate;
- (CNFRegAlias)initWithAccount:(id)a3 alias:(id)a4;
- (CNFRegAlias)initWithAlias:(id)a3 type:(int64_t)a4 selected:(BOOL)a5 deviceAliasIdentifier:(id)a6;
- (IMAccount)account;
- (NSDate)_expirationDate;
- (NSDate)expirationDate;
- (NSString)alias;
- (NSString)deviceAliasIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (id)description;
- (int64_t)givenAliasType;
- (int64_t)localizedCaseInsensitiveCompare:(id)a3;
- (int64_t)type;
- (int64_t)validationErrorReason;
- (int64_t)validationStatus;
- (unint64_t)hash;
- (void)setAccount:(id)a3;
- (void)setAlias:(id)a3;
- (void)setDeviceAliasIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGivenAliasType:(int64_t)a3;
- (void)setIsTemporary:(BOOL)a3;
- (void)setSelectedDeviceAlias:(BOOL)a3;
- (void)set_expirationDate:(id)a3;
@end

@implementation CNFRegAlias

- (CNFRegAlias)initWithAlias:(id)a3 type:(int64_t)a4 selected:(BOOL)a5 deviceAliasIdentifier:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CNFRegAlias;
  v12 = [(CNFRegAlias *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(CNFRegAlias *)v12 setAlias:v10];
    [(CNFRegAlias *)v13 setGivenAliasType:a4];
    [(CNFRegAlias *)v13 setSelectedDeviceAlias:v7];
    [(CNFRegAlias *)v13 setDeviceAliasIdentifier:v11];
  }

  return v13;
}

- (CNFRegAlias)initWithAccount:(id)a3 alias:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNFRegAlias;
  v8 = [(CNFRegAlias *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CNFRegAlias *)v8 setAlias:v7];
    [(CNFRegAlias *)v9 setAccount:v6];
  }

  return v9;
}

- (NSString)identifier
{
  v3 = NSString;
  v4 = [(IMAccount *)self->_account uniqueID];
  v5 = [v3 stringWithFormat:@"%@:%@", v4, self->_alias];

  return (NSString *)v5;
}

- (int64_t)type
{
  v3 = [(CNFRegAlias *)self account];
  if (v3)
  {
    v4 = [(CNFRegAlias *)self account];
    v5 = [(CNFRegAlias *)self alias];
    int64_t v6 = [v4 typeForAlias:v5];
  }
  else
  {
    int64_t v6 = [(CNFRegAlias *)self givenAliasType];
  }

  return v6;
}

- (BOOL)isPhoneNumberAliasOnPhoneNumberAccount
{
  v3 = [(CNFRegAlias *)self account];
  BOOL v4 = [v3 accountType] == 2 && -[CNFRegAlias type](self, "type") == 2;

  return v4;
}

- (BOOL)isTemporaryPhoneNumberAlias
{
  if (self->_isTemporary) {
    return 1;
  }
  BOOL v4 = [(CNFRegAlias *)self account];
  v5 = [v4 objectForKey:*MEMORY[0x263F4A278]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }
  id v7 = [(CNFRegAlias *)self account];
  if ([v7 accountType] == 2) {
    BOOL v2 = v6;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (NSDate)expirationDate
{
  if ([(CNFRegAlias *)self isTemporaryPhoneNumberAlias])
  {
    expirationDate = self->__expirationDate;
    if (expirationDate)
    {
      BOOL v4 = expirationDate;
    }
    else
    {
      v5 = [(CNFRegAlias *)self account];
      char v6 = [v5 objectForKey:*MEMORY[0x263F4A270]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      BOOL v4 = v7;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (BOOL)isDeviceAlias
{
  BOOL v2 = [(CNFRegAlias *)self account];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)validate
{
  BOOL v3 = [(CNFRegAlias *)self account];
  BOOL v4 = [(CNFRegAlias *)self alias];
  char v5 = [v3 validateAlias:v4];

  return v5;
}

- (int64_t)validationStatus
{
  BOOL v3 = [(CNFRegAlias *)self account];
  BOOL v4 = [(CNFRegAlias *)self alias];
  if ([v3 hasAlias:v4]) {
    int64_t v5 = [v3 validationStatusForAlias:v4];
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (int64_t)validationErrorReason
{
  BOOL v3 = [(CNFRegAlias *)self account];
  BOOL v4 = [(CNFRegAlias *)self alias];
  if ([v3 hasAlias:v4] && objc_msgSend(v3, "validationStatusForAlias:", v4) == -1) {
    int64_t v5 = [v3 validationErrorReasonForAlias:v4];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    BOOL v4 = [(CNFRegAlias *)self alias];
    int64_t v5 = CNFRegFormattedPhoneNumberForString(v4);
    char v6 = (NSString *)[v5 copy];
    id v7 = self->_displayName;
    self->_displayName = v6;

    displayName = self->_displayName;
  }
  return displayName;
}

- (void)setDisplayName:(id)a3
{
  if (self->_displayName != a3)
  {
    CNFRegFormattedPhoneNumberForString(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v4 = (NSString *)[v6 copy];
    displayName = self->_displayName;
    self->_displayName = v4;
  }
}

- (id)description
{
  BOOL v3 = [(CNFRegAlias *)self isDeviceAlias];
  BOOL v4 = NSString;
  int64_t v5 = [(CNFRegAlias *)self type];
  uint64_t v6 = [(CNFRegAlias *)self alias];
  id v7 = (void *)v6;
  if (v3)
  {
    if ([(CNFRegAlias *)self isSelectedDeviceAlias]) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    v9 = [(CNFRegAlias *)self deviceAliasIdentifier];
    id v10 = [v4 stringWithFormat:@"<CNFRegAlias:%p> {Type:%ld, Alias:%@, Selected: %@, DeviceId: %@}", self, v5, v7, v8, v9];
  }
  else
  {
    id v10 = [v4 stringWithFormat:@"<CNFRegAlias:%p> {Type:%ld, Alias:%@}", self, v5, v6];
  }

  return v10;
}

- (int64_t)localizedCaseInsensitiveCompare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNFRegAlias *)self alias];
  int v6 = [v5 _appearsToBePhoneNumber];

  id v7 = [v4 alias];
  int v8 = [v7 _appearsToBePhoneNumber];

  if (v6 == v8)
  {
    id v10 = [(CNFRegAlias *)self alias];
    objc_super v11 = [v4 alias];
    int64_t v9 = [v10 localizedCaseInsensitiveCompare:v11];
  }
  else if (v6)
  {
    int64_t v9 = -1;
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (BOOL)isLocalPhoneNumberAlias
{
  BOOL v2 = [(CNFRegAlias *)self alias];
  BOOL v3 = CNFRegLocalPhoneNumberDisplayString();
  char v4 = [v2 isEqualToIgnoringCase:v3];

  if (v4) {
    goto LABEL_4;
  }
  int64_t v5 = CNFRegFormattedPhoneNumberForString(v2);
  int v6 = CNFRegLocalPhoneNumberDisplayString();
  char v7 = [v5 isEqualToIgnoringCase:v6];

  if (v7) {
    goto LABEL_4;
  }
  int v8 = CommunicationsSetupUIBundle();
  int64_t v9 = CNFRegStringTableName();
  id v10 = [v8 localizedStringForKey:@"YOUR_NUMBER_STRING" value:&stru_26D05D4F8 table:v9];
  char v11 = [v2 isEqualToIgnoringCase:v10];

  if (v11) {
LABEL_4:
  }
    char v12 = 1;
  else {
    char v12 = [v2 isEqualToIgnoringCase:*MEMORY[0x263F4A8D8]];
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNFRegAlias;
  if ([(CNFRegAlias *)&v21 isEqual:v4])
  {
    BOOL v5 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v5 = 0;
    goto LABEL_20;
  }
  id v6 = v4;
  char v7 = [(CNFRegAlias *)self alias];
  if (v7)
  {

LABEL_8:
    int64_t v9 = [(CNFRegAlias *)self alias];
    id v10 = [v6 alias];
    int v11 = [v9 isEqual:v10];

    goto LABEL_9;
  }
  int v8 = [v6 alias];

  if (v8) {
    goto LABEL_8;
  }
  int v11 = 1;
LABEL_9:
  char v12 = [(CNFRegAlias *)self account];
  if (v12)
  {

    goto LABEL_12;
  }
  v13 = [v6 account];

  if (v13)
  {
LABEL_12:
    v14 = [(CNFRegAlias *)self account];
    objc_super v15 = [v6 account];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      int v11 = 0;
    }
  }
  int64_t v17 = [(CNFRegAlias *)self type];
  uint64_t v18 = [v6 type];

  BOOL v5 = v17 == v18 && v11 != 0;
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  int64_t v3 = [(CNFRegAlias *)self type];
  id v4 = [(CNFRegAlias *)self alias];
  uint64_t v5 = [v4 hash] + 961 * v3;

  id v6 = [(CNFRegAlias *)self account];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (int64_t)givenAliasType
{
  return self->_givenAliasType;
}

- (void)setGivenAliasType:(int64_t)a3
{
  self->_givenAliasType = a3;
}

- (BOOL)isSelectedDeviceAlias
{
  return self->_selectedDeviceAlias;
}

- (void)setSelectedDeviceAlias:(BOOL)a3
{
  self->_selectedDeviceAlias = a3;
}

- (NSString)deviceAliasIdentifier
{
  return self->_deviceAliasIdentifier;
}

- (void)setDeviceAliasIdentifier:(id)a3
{
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (void)setIsTemporary:(BOOL)a3
{
  self->_isTemporary = a3;
}

- (NSDate)_expirationDate
{
  return self->__expirationDate;
}

- (void)set_expirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expirationDate, 0);
  objc_storeStrong((id *)&self->_deviceAliasIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end