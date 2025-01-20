@interface VSUserAccount
+ (BOOL)supportsSecureCoding;
+ (VSUserAccount)new;
+ (int64_t)deviceCategoryFromDeviceType:(unint64_t)a3;
- (BOOL)isDeveloperCreated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromCurrentDevice;
- (BOOL)isSignedOut;
- (BOOL)requiresSystemTrust;
- (NSArray)tierIdentifiers;
- (NSDate)created;
- (NSDate)modified;
- (NSDate)subscriptionBillingCycleEndDate;
- (NSString)accountProviderIdentifier;
- (NSString)api;
- (NSString)authenticationData;
- (NSString)billingIdentifier;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)identifier;
- (NSString)modifierIdentifier;
- (NSString)modifierType;
- (NSString)sourceIdentifier;
- (NSURL)updateURL;
- (VSAppleSubscription)appleSubscription;
- (VSOriginatingDeviceCategory)deviceCategory;
- (VSUserAccount)init;
- (VSUserAccount)initWithAccountType:(VSUserAccountType)accountType updateURL:(NSURL *)url;
- (VSUserAccount)initWithAccountType:(int64_t)a3 updateURL:(id)a4 sourceType:(int64_t)a5 sourceIdentifier:(id)a6;
- (VSUserAccount)initWithCoder:(id)a3;
- (VSUserAccountType)accountType;
- (id)componentsForPrinting:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)prettyPrint;
- (int64_t)sourceType;
- (unint64_t)hash;
- (unint64_t)keychainItemHash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountProviderIdentifier:(NSString *)accountProviderIdentifier;
- (void)setAccountType:(VSUserAccountType)accountType;
- (void)setApi:(id)a3;
- (void)setAppleSubscription:(id)a3;
- (void)setAuthenticationData:(NSString *)authenticationData;
- (void)setBillingIdentifier:(NSString *)billingIdentifier;
- (void)setCreated:(id)a3;
- (void)setDeviceCategory:(int64_t)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setFromCurrentDevice:(BOOL)a3;
- (void)setIdentifier:(NSString *)identifier;
- (void)setIsDeveloperCreated:(BOOL)a3;
- (void)setKeychainItemHash:(unint64_t)a3;
- (void)setModified:(id)a3;
- (void)setModifierIdentifier:(id)a3;
- (void)setModifierType:(id)a3;
- (void)setRequiresSystemTrust:(BOOL)requiresSystemTrust;
- (void)setSignedOut:(BOOL)signedOut;
- (void)setSourceIdentifier:(id)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setSubscriptionBillingCycleEndDate:(NSDate *)subscriptionBillingCycleEndDate;
- (void)setTierIdentifiers:(NSArray *)tierIdentifiers;
- (void)setUpdateURL:(NSURL *)updateURL;
@end

@implementation VSUserAccount

- (VSUserAccount)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

+ (VSUserAccount)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The %@ initializer is not available.", v4 format];

  return 0;
}

- (VSUserAccount)initWithAccountType:(VSUserAccountType)accountType updateURL:(NSURL *)url
{
  v6 = url;
  v13.receiver = self;
  v13.super_class = (Class)VSUserAccount;
  v7 = [(VSUserAccount *)&v13 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = [v8 bundleIdentifier];

    if (!v9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"VSUserAccount initialized without a bundle."];
    }
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 bundleIdentifier];

    commonInit_0(v7, accountType, v6, 0, v11);
  }

  return v7;
}

- (VSUserAccount)initWithAccountType:(int64_t)a3 updateURL:(id)a4 sourceType:(int64_t)a5 sourceIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)VSUserAccount;
  v12 = [(VSUserAccount *)&v15 init];
  objc_super v13 = v12;
  if (v12) {
    commonInit_0(v12, a3, v10, (void *)a5, v11);
  }

  return v13;
}

- (void)setTierIdentifiers:(NSArray *)tierIdentifiers
{
  self->_tierIdentifiers = (NSArray *)[(NSArray *)tierIdentifiers copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDeviceIdentifier:(id)a3
{
  id v6 = a3;
  v5 = [(VSUserAccount *)self deviceIdentifier];

  if (!v5) {
    objc_storeStrong((id *)&self->_deviceIdentifier, a3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSUserAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = [(VSUserAccount *)self initWithAccountType:0 updateURL:0 sourceType:0 sourceIdentifier:&stru_1F34B2EC8];
  if (!v5)
  {
LABEL_6:
    v25 = v5;
    goto LABEL_10;
  }
  -[VSUserAccount setSourceType:](v5, "setSourceType:", (int)[v4 decodeIntForKey:@"sourceType"]);
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];
  if (v6)
  {
    v7 = (void *)v6;
    [(VSUserAccount *)v5 setSourceIdentifier:v6];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    uint64_t v9 = [v4 decodeBoolForKey:@"fromCurrentDevice"];
    if (v8) {
      [(VSUserAccount *)v5 setDeviceIdentifier:v8];
    }
    -[VSUserAccount setDeviceCategory:](v5, "setDeviceCategory:", (int)[v4 decodeIntForKey:@"deviceCategory"]);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keychainItemHash"];
    -[VSUserAccount setKeychainItemHash:](v5, "setKeychainItemHash:", [v10 unsignedIntegerValue]);
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateURL"];
    [(VSUserAccount *)v5 setUpdateURL:v11];

    -[VSUserAccount setRequiresSystemTrust:](v5, "setRequiresSystemTrust:", [v4 decodeBoolForKey:@"requiresSystemTrust"]);
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountProviderIdentifier"];
    [(VSUserAccount *)v5 setAccountProviderIdentifier:v12];

    objc_super v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(VSUserAccount *)v5 setIdentifier:v13];

    -[VSUserAccount setAccountType:](v5, "setAccountType:", [v4 decodeIntegerForKey:@"accountType"]);
    -[VSUserAccount setSignedOut:](v5, "setSignedOut:", [v4 decodeBoolForKey:@"signedOut"]);
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionBillingCycleEndDate"];
    [(VSUserAccount *)v5 setSubscriptionBillingCycleEndDate:v14];

    objc_super v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"tierIdentifiers"];
    [(VSUserAccount *)v5 setTierIdentifiers:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingIdentifier"];
    [(VSUserAccount *)v5 setBillingIdentifier:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationData"];
    [(VSUserAccount *)v5 setAuthenticationData:v17];

    [(VSUserAccount *)v5 setFromCurrentDevice:v9];
    -[VSUserAccount setIsDeveloperCreated:](v5, "setIsDeveloperCreated:", [v4 decodeBoolForKey:@"developerCreated"]);
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"created"];
    [(VSUserAccount *)v5 setCreated:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modified"];
    [(VSUserAccount *)v5 setModified:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    [(VSUserAccount *)v5 setDeviceName:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifierIdentifier"];
    [(VSUserAccount *)v5 setModifierIdentifier:v21];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifierType"];
    [(VSUserAccount *)v5 setModifierType:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"api"];
    [(VSUserAccount *)v5 setApi:v23];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleSubscription"];
    [(VSUserAccount *)v5 setAppleSubscription:v24];

    goto LABEL_6;
  }
  v26 = VSErrorLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
    -[VSUserAccount initWithCoder:](v26);
  }

  v25 = 0;
LABEL_10:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[VSUserAccount sourceType](self, "sourceType"));
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v5, "intValue"), @"sourceType");

  uint64_t v6 = [(VSUserAccount *)self sourceIdentifier];
  [v4 encodeObject:v6 forKey:@"sourceIdentifier"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[VSUserAccount deviceCategory](self, "deviceCategory"));
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v7, "intValue"), @"deviceCategory");

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VSUserAccount keychainItemHash](self, "keychainItemHash"));
  [v4 encodeObject:v8 forKey:@"keychainItemHash"];

  uint64_t v9 = [(VSUserAccount *)self updateURL];
  [v4 encodeObject:v9 forKey:@"updateURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount requiresSystemTrust](self, "requiresSystemTrust"), @"requiresSystemTrust");
  id v10 = [(VSUserAccount *)self accountProviderIdentifier];
  [v4 encodeObject:v10 forKey:@"accountProviderIdentifier"];

  id v11 = [(VSUserAccount *)self identifier];
  [v4 encodeObject:v11 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[VSUserAccount accountType](self, "accountType"), @"accountType");
  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount isSignedOut](self, "isSignedOut"), @"signedOut");
  v12 = [(VSUserAccount *)self subscriptionBillingCycleEndDate];
  [v4 encodeObject:v12 forKey:@"subscriptionBillingCycleEndDate"];

  objc_super v13 = [(VSUserAccount *)self tierIdentifiers];
  [v4 encodeObject:v13 forKey:@"tierIdentifiers"];

  v14 = [(VSUserAccount *)self billingIdentifier];
  [v4 encodeObject:v14 forKey:@"billingIdentifier"];

  objc_super v15 = [(VSUserAccount *)self authenticationData];
  [v4 encodeObject:v15 forKey:@"authenticationData"];

  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount isFromCurrentDevice](self, "isFromCurrentDevice"), @"fromCurrentDevice");
  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount isDeveloperCreated](self, "isDeveloperCreated"), @"developerCreated");
  v16 = [(VSUserAccount *)self created];
  [v4 encodeObject:v16 forKey:@"created"];

  v17 = [(VSUserAccount *)self modified];
  [v4 encodeObject:v17 forKey:@"modified"];

  v18 = [(VSUserAccount *)self deviceIdentifier];
  [v4 encodeObject:v18 forKey:@"deviceIdentifier"];

  v19 = [(VSUserAccount *)self deviceName];
  [v4 encodeObject:v19 forKey:@"deviceName"];

  v20 = [(VSUserAccount *)self modifierIdentifier];
  [v4 encodeObject:v20 forKey:@"modifierIdentifier"];

  v21 = [(VSUserAccount *)self modifierType];
  [v4 encodeObject:v21 forKey:@"modifierType"];

  v22 = [(VSUserAccount *)self api];
  [v4 encodeObject:v22 forKey:@"api"];

  id v23 = [(VSUserAccount *)self appleSubscription];
  [v4 encodeObject:v23 forKey:@"appleSubscription"];
}

- (id)description
{
  uint64_t v3 = [(VSUserAccount *)self componentsForPrinting:@" = "];
  id v4 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VSUserAccount;
  v5 = [(VSUserAccount *)&v9 description];
  uint64_t v6 = [v3 componentsJoinedByString:@", "];
  v7 = [v4 stringWithFormat:@"<%@ %@>", v5, v6];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VSUserAccount *)self sourceIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[VSUserAccount sourceType](self, "sourceType"));
  uint64_t v6 = [v5 hash];
  v7 = [(VSUserAccount *)self deviceIdentifier];
  unint64_t v8 = v6 ^ v4 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VSUserAccount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else if (v4)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        objc_super v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSUserAccount.", v10 format];
      }
      id v11 = v6;
      v12 = [(VSUserAccount *)self sourceIdentifier];
      objc_super v13 = [(VSUserAccount *)v11 sourceIdentifier];
      if ([v12 isEqualToString:v13]
        && (int64_t v14 = [(VSUserAccount *)self sourceType], v14 == [(VSUserAccount *)v11 sourceType]))
      {
        objc_super v15 = [(VSUserAccount *)self deviceIdentifier];
        v16 = [(VSUserAccount *)v11 deviceIdentifier];
        char v17 = [v15 isEqual:v16];
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [VSUserAccount alloc];
  VSUserAccountType v5 = [(VSUserAccount *)self accountType];
  uint64_t v6 = [(VSUserAccount *)self updateURL];
  int64_t v7 = [(VSUserAccount *)self sourceType];
  uint64_t v8 = [(VSUserAccount *)self sourceIdentifier];
  objc_super v9 = [(VSUserAccount *)v4 initWithAccountType:v5 updateURL:v6 sourceType:v7 sourceIdentifier:v8];

  [(VSUserAccount *)v9 setDeviceCategory:[(VSUserAccount *)self deviceCategory]];
  [(VSUserAccount *)v9 setKeychainItemHash:[(VSUserAccount *)self keychainItemHash]];
  [(VSUserAccount *)v9 setRequiresSystemTrust:[(VSUserAccount *)self requiresSystemTrust]];
  id v10 = [(VSUserAccount *)self accountProviderIdentifier];
  [(VSUserAccount *)v9 setAccountProviderIdentifier:v10];

  id v11 = [(VSUserAccount *)self identifier];
  [(VSUserAccount *)v9 setIdentifier:v11];

  [(VSUserAccount *)v9 setSignedOut:[(VSUserAccount *)self isSignedOut]];
  v12 = [(VSUserAccount *)self subscriptionBillingCycleEndDate];
  [(VSUserAccount *)v9 setSubscriptionBillingCycleEndDate:v12];

  objc_super v13 = [(VSUserAccount *)self tierIdentifiers];
  [(VSUserAccount *)v9 setTierIdentifiers:v13];

  int64_t v14 = [(VSUserAccount *)self billingIdentifier];
  [(VSUserAccount *)v9 setBillingIdentifier:v14];

  objc_super v15 = [(VSUserAccount *)self authenticationData];
  [(VSUserAccount *)v9 setAuthenticationData:v15];

  [(VSUserAccount *)v9 setIsDeveloperCreated:[(VSUserAccount *)self isDeveloperCreated]];
  v16 = [(VSUserAccount *)self created];
  [(VSUserAccount *)v9 setCreated:v16];

  char v17 = [(VSUserAccount *)self modified];
  [(VSUserAccount *)v9 setModified:v17];

  v18 = [(VSUserAccount *)self deviceIdentifier];
  [(VSUserAccount *)v9 setDeviceIdentifier:v18];

  v19 = [(VSUserAccount *)self deviceName];
  [(VSUserAccount *)v9 setDeviceName:v19];

  v20 = [(VSUserAccount *)self modifierIdentifier];
  [(VSUserAccount *)v9 setModifierIdentifier:v20];

  v21 = [(VSUserAccount *)self modifierType];
  [(VSUserAccount *)v9 setModifierType:v21];

  v22 = [(VSUserAccount *)self api];
  [(VSUserAccount *)v9 setApi:v22];

  id v23 = [(VSUserAccount *)self appleSubscription];
  [(VSUserAccount *)v9 setAppleSubscription:v23];

  return v9;
}

- (void)setCreated:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    VSUserAccountType v5 = (NSDate *)v4;
  }
  else
  {
    VSUserAccountType v5 = [MEMORY[0x1E4F1C9C8] now];
  }
  created = self->_created;
  self->_created = v5;
}

- (void)setModified:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    VSUserAccountType v5 = (NSDate *)v4;
  }
  else
  {
    VSUserAccountType v5 = [MEMORY[0x1E4F1C9C8] now];
  }
  modified = self->_modified;
  self->_modified = v5;
}

- (id)componentsForPrinting:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = NSString;
  uint64_t v8 = [(VSUserAccount *)self sourceIdentifier];
  objc_super v9 = [v7 stringWithFormat:@"%@%@%@", @"sourceIdentifier", v5, v8];
  [v6 addObject:v9];

  id v10 = [NSString stringWithFormat:@"%@%@%ld", @"sourceType", v5, -[VSUserAccount sourceType](self, "sourceType")];
  [v6 addObject:v10];

  id v11 = [NSString stringWithFormat:@"%@%@%ld", @"deviceCategory", v5, -[VSUserAccount deviceCategory](self, "deviceCategory")];
  [v6 addObject:v11];

  v12 = [NSString stringWithFormat:@"%@%@%ld", @"keychainItemHash", v5, -[VSUserAccount keychainItemHash](self, "keychainItemHash")];
  [v6 addObject:v12];

  objc_super v13 = NSString;
  int64_t v14 = [(VSUserAccount *)self updateURL];
  objc_super v15 = [v13 stringWithFormat:@"%@%@%@", @"updateURL", v5, v14];
  [v6 addObject:v15];

  v16 = [NSString stringWithFormat:@"%@%@%d", @"requiresSystemTrust", v5, -[VSUserAccount requiresSystemTrust](self, "requiresSystemTrust")];
  [v6 addObject:v16];

  char v17 = NSString;
  v18 = [(VSUserAccount *)self accountProviderIdentifier];
  v19 = [v17 stringWithFormat:@"%@%@%@", @"accountProviderIdentifier", v5, v18];
  [v6 addObject:v19];

  v20 = NSString;
  v21 = [(VSUserAccount *)self identifier];
  v22 = [v20 stringWithFormat:@"%@%@%@", @"identifier", v5, v21];
  [v6 addObject:v22];

  id v23 = [NSString stringWithFormat:@"%@%@%ld", @"accountType", v5, -[VSUserAccount accountType](self, "accountType")];
  [v6 addObject:v23];

  v24 = [NSString stringWithFormat:@"%@%@%d", @"signedOut", v5, -[VSUserAccount isSignedOut](self, "isSignedOut")];
  [v6 addObject:v24];

  v25 = NSString;
  v26 = [(VSUserAccount *)self subscriptionBillingCycleEndDate];
  v27 = [v25 stringWithFormat:@"%@%@%@", @"subscriptionBillingCycleEndDate", v5, v26];
  [v6 addObject:v27];

  v28 = NSString;
  v29 = [(VSUserAccount *)self tierIdentifiers];
  v30 = [v28 stringWithFormat:@"%@%@%@", @"tierIdentifiers", v5, v29];
  [v6 addObject:v30];

  v31 = NSString;
  v32 = [(VSUserAccount *)self billingIdentifier];
  v33 = [v31 stringWithFormat:@"%@%@%@", @"billingIdentifier", v5, v32];
  [v6 addObject:v33];

  v34 = NSString;
  v35 = [(VSUserAccount *)self authenticationData];
  v36 = [v34 stringWithFormat:@"%@%@%@", @"authenticationData", v5, v35];
  [v6 addObject:v36];

  v37 = [NSString stringWithFormat:@"%@%@%d", @"isFromCurrentDevice", v5, -[VSUserAccount isFromCurrentDevice](self, "isFromCurrentDevice")];
  [v6 addObject:v37];

  v38 = NSString;
  v39 = [(VSUserAccount *)self created];
  v40 = [v38 stringWithFormat:@"%@%@%@", @"created", v5, v39];
  [v6 addObject:v40];

  v41 = NSString;
  v42 = [(VSUserAccount *)self modified];
  v43 = [v41 stringWithFormat:@"%@%@%@", @"modified", v5, v42];
  [v6 addObject:v43];

  v44 = [NSString stringWithFormat:@"%@%@%d", @"isDeveloperCreated", v5, -[VSUserAccount isDeveloperCreated](self, "isDeveloperCreated")];
  [v6 addObject:v44];

  v45 = NSString;
  v46 = [(VSUserAccount *)self appleSubscription];
  v47 = [v45 stringWithFormat:@"%@%@%@", @"appleSubscription", v5, v46];

  [v6 addObject:v47];

  return v6;
}

+ (int64_t)deviceCategoryFromDeviceType:(unint64_t)a3
{
  return a3 - 4 < 0xFFFFFFFFFFFFFFFDLL;
}

- (id)prettyPrint
{
  v2 = [(VSUserAccount *)self componentsForPrinting:@": "];
  uint64_t v3 = [v2 componentsJoinedByString:@"\n"];

  return v3;
}

- (NSURL)updateURL
{
  return self->_updateURL;
}

- (void)setUpdateURL:(NSURL *)updateURL
{
}

- (BOOL)requiresSystemTrust
{
  return self->_requiresSystemTrust;
}

- (void)setRequiresSystemTrust:(BOOL)requiresSystemTrust
{
  self->_requiresSystemTrust = requiresSystemTrust;
}

- (NSString)accountProviderIdentifier
{
  return self->_accountProviderIdentifier;
}

- (void)setAccountProviderIdentifier:(NSString *)accountProviderIdentifier
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (VSUserAccountType)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(VSUserAccountType)accountType
{
  self->_accountType = accountType;
}

- (BOOL)isSignedOut
{
  return self->_signedOut;
}

- (void)setSignedOut:(BOOL)signedOut
{
  self->_signedOut = signedOut;
}

- (NSDate)subscriptionBillingCycleEndDate
{
  return self->_subscriptionBillingCycleEndDate;
}

- (void)setSubscriptionBillingCycleEndDate:(NSDate *)subscriptionBillingCycleEndDate
{
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(NSString *)billingIdentifier
{
}

- (NSString)authenticationData
{
  return self->_authenticationData;
}

- (void)setAuthenticationData:(NSString *)authenticationData
{
}

- (BOOL)isFromCurrentDevice
{
  return self->_fromCurrentDevice;
}

- (void)setFromCurrentDevice:(BOOL)a3
{
  self->_fromCurrentDevice = a3;
}

- (VSOriginatingDeviceCategory)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(int64_t)a3
{
  self->_deviceCategory = a3;
}

- (VSAppleSubscription)appleSubscription
{
  return self->_appleSubscription;
}

- (void)setAppleSubscription:(id)a3
{
}

- (NSDate)created
{
  return self->_created;
}

- (NSDate)modified
{
  return self->_modified;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (unint64_t)keychainItemHash
{
  return self->_keychainItemHash;
}

- (void)setKeychainItemHash:(unint64_t)a3
{
  self->_keychainItemHash = a3;
}

- (BOOL)isDeveloperCreated
{
  return self->_isDeveloperCreated;
}

- (void)setIsDeveloperCreated:(BOOL)a3
{
  self->_isDeveloperCreated = a3;
}

- (NSString)modifierIdentifier
{
  return self->_modifierIdentifier;
}

- (void)setModifierIdentifier:(id)a3
{
}

- (NSString)modifierType
{
  return self->_modifierType;
}

- (void)setModifierType:(id)a3
{
}

- (NSString)api
{
  return self->_api;
}

- (void)setApi:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_api, 0);
  objc_storeStrong((id *)&self->_modifierType, 0);
  objc_storeStrong((id *)&self->_modifierIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_appleSubscription, 0);
  objc_storeStrong((id *)&self->_authenticationData, 0);
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionBillingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accountProviderIdentifier, 0);

  objc_storeStrong((id *)&self->_updateURL, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DA674000, log, OS_LOG_TYPE_FAULT, "Every VSUserAccount should have a sourceIdentifier", v1, 2u);
}

@end