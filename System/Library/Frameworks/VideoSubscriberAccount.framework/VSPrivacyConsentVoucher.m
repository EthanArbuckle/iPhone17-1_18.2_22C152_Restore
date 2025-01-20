@interface VSPrivacyConsentVoucher
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)appAdamID;
- (NSString)providerID;
- (VSPrivacyConsentVoucher)init;
- (VSPrivacyConsentVoucher)initWithAppAdamID:(id)a3 providerID:(id)a4;
- (VSPrivacyConsentVoucher)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VSPrivacyConsentVoucher

- (VSPrivacyConsentVoucher)initWithAppAdamID:(id)a3 providerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The appAdamID parameter must not be nil."];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The providerID parameter must not be nil."];
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)VSPrivacyConsentVoucher;
  v9 = [(VSPrivacyConsentVoucher *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    appAdamID = v9->_appAdamID;
    v9->_appAdamID = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    providerID = v9->_providerID;
    v9->_providerID = (NSString *)v12;
  }
  return v9;
}

- (VSPrivacyConsentVoucher)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v13.receiver = self;
  v13.super_class = (Class)VSPrivacyConsentVoucher;
  v5 = [(VSPrivacyConsentVoucher *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appAdamID"];
    uint64_t v7 = [v6 copy];
    appAdamID = v5->_appAdamID;
    v5->_appAdamID = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerID"];
    uint64_t v10 = [v9 copy];
    providerID = v5->_providerID;
    v5->_providerID = (NSString *)v10;
  }
  return v5;
}

- (VSPrivacyConsentVoucher)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = [(VSPrivacyConsentVoucher *)self appAdamID];
  [v4 encodeObject:v5 forKey:@"appAdamID"];

  id v6 = [(VSPrivacyConsentVoucher *)self providerID];
  [v4 encodeObject:v6 forKey:@"providerID"];
}

- (unint64_t)hash
{
  v3 = [(VSPrivacyConsentVoucher *)self appAdamID];
  uint64_t v4 = [v3 hash];

  v5 = [(VSPrivacyConsentVoucher *)self providerID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v5 = [v4 appAdamID];
  unint64_t v6 = [(VSPrivacyConsentVoucher *)self appAdamID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = [v4 providerID];
    v9 = [(VSPrivacyConsentVoucher *)self providerID];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
LABEL_5:
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  v5 = [(VSPrivacyConsentVoucher *)self appAdamID];
  unint64_t v6 = [v4 stringWithFormat:@"%@=%@", @"appAdamID", v5];
  [v3 addObject:v6];

  int v7 = NSString;
  v8 = [(VSPrivacyConsentVoucher *)self providerID];
  v9 = [v7 stringWithFormat:@"%@=%@", @"providerID", v8];
  [v3 addObject:v9];

  char v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)VSPrivacyConsentVoucher;
  v11 = [(VSPrivacyConsentVoucher *)&v14 description];
  uint64_t v12 = [v10 stringWithFormat:@"<%@ %@>", v11, v3];

  return v12;
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerID, 0);

  objc_storeStrong((id *)&self->_appAdamID, 0);
}

@end