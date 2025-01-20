@interface CNContactsUserDefaultsX
- (BOOL)isShortNameFormatEnabled;
- (BOOL)shortNameFormatPrefersNicknames;
- (CNContactsUserDefaultsX)init;
- (CNContactsUserDefaultsX)initWithFoundationUserDefaults:(id)a3;
- (CNFoundationUserDefaults)foundationUserDefaults;
- (id)countryCode;
- (id)filteredGroupAndContainerIDs;
- (int64_t)displayNameOrder;
- (int64_t)newContactDisplayNameOrder;
- (int64_t)shortNameFormat;
- (int64_t)sortOrder;
- (void)setDisplayNameOrder:(int64_t)a3;
- (void)setFilteredGroupAndContainerIDs:(id)a3;
- (void)setFoundationUserDefaults:(id)a3;
- (void)setShortNameFormat:(int64_t)a3;
- (void)setShortNameFormatEnabled:(BOOL)a3;
- (void)setShortNameFormatPrefersNicknames:(BOOL)a3;
@end

@implementation CNContactsUserDefaultsX

- (CNContactsUserDefaultsX)init
{
  v3 = [MEMORY[0x1E4F5A400] sharedDefaults];
  v4 = [(CNContactsUserDefaultsX *)self initWithFoundationUserDefaults:v3];

  return v4;
}

- (CNContactsUserDefaultsX)initWithFoundationUserDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactsUserDefaultsX;
  v6 = [(CNContactsUserDefaults *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_foundationUserDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)displayNameOrder
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  uint64_t v3 = [v2 nameOrder];

  if (v3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)setDisplayNameOrder:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
    id v5 = v3;
    uint64_t v4 = 1;
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v3 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
    id v5 = v3;
    uint64_t v4 = 0;
  }
  [v3 setNameOrder:v4];
}

- (int64_t)newContactDisplayNameOrder
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  uint64_t v3 = [v2 newContactNameOrder];

  if (v3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)sortOrder
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  uint64_t v3 = [v2 sortOrder];

  if (v3) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)countryCode
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  uint64_t v3 = [v2 countryCode];

  return v3;
}

- (int64_t)shortNameFormat
{
  uint64_t v3 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  uint64_t v4 = [v3 shortNameFormat];

  BOOL v5 = [(CNContactsUserDefaultsX *)self isShortNameFormatEnabled];
  int64_t v6 = v4 - 1;
  if ((unint64_t)(v4 - 1) >= 4) {
    int64_t v6 = 4;
  }
  if (v5) {
    return v6;
  }
  else {
    return 4;
  }
}

- (void)setShortNameFormat:(int64_t)a3
{
  uint64_t v4 = 1;
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      uint64_t v4 = 2;
      goto LABEL_5;
    case 2:
      uint64_t v4 = 3;
      goto LABEL_5;
    case 3:
      uint64_t v4 = 4;
LABEL_5:
      [(CNContactsUserDefaultsX *)self setShortNameFormatEnabled:1];
      id v5 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
      [v5 setShortNameFormat:v4];

      break;
    case 4:
      [(CNContactsUserDefaultsX *)self setShortNameFormatEnabled:0];
      break;
    default:
      return;
  }
}

- (BOOL)isShortNameFormatEnabled
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  char v3 = [v2 isShortNameFormatEnabled];

  return v3;
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  [v4 setShortNameFormatEnabled:v3];
}

- (BOOL)shortNameFormatPrefersNicknames
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  char v3 = [v2 preferNickname];

  return v3;
}

- (void)setShortNameFormatPrefersNicknames:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  [v4 setPreferNickname:v3];
}

- (id)filteredGroupAndContainerIDs
{
  v2 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  BOOL v3 = [v2 filteredAccountsAndContainers];

  return v3;
}

- (void)setFilteredGroupAndContainerIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactsUserDefaultsX *)self foundationUserDefaults];
  [v5 setFilteredAccountsAndContainers:v4];
}

- (CNFoundationUserDefaults)foundationUserDefaults
{
  return (CNFoundationUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFoundationUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end