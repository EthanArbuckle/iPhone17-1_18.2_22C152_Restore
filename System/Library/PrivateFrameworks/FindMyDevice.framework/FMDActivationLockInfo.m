@interface FMDActivationLockInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isActivationLocked;
- (BOOL)isFindMyLPEMEnabled;
- (BOOL)isOfflineFindingEnabled;
- (BOOL)isRestrictedSKU;
- (FMDActivationLockInfo)initWithCoder:(id)a3;
- (NSDictionary)localeStrings;
- (NSString)maskedAppleID;
- (NSString)maskedOrganizationID;
- (NSString)title;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsActivationLocked:(BOOL)a3;
- (void)setIsFindMyLPEMEnabled:(BOOL)a3;
- (void)setIsOfflineFindingEnabled:(BOOL)a3;
- (void)setIsRestrictedSKU:(BOOL)a3;
- (void)setLocaleStrings:(id)a3;
- (void)setMaskedAppleID:(id)a3;
- (void)setMaskedOrganizationID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FMDActivationLockInfo

- (FMDActivationLockInfo)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDActivationLockInfo;
  v5 = [(FMDActivationLockInfo *)&v14 init];
  if (v5)
  {
    -[FMDActivationLockInfo setIsActivationLocked:](v5, "setIsActivationLocked:", [v4 decodeBoolForKey:@"isActivationLocked"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maskedAppleID"];
    [(FMDActivationLockInfo *)v5 setMaskedAppleID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maskedOrganizationID"];
    [(FMDActivationLockInfo *)v5 setMaskedOrganizationID:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(FMDActivationLockInfo *)v5 setTitle:v8];

    -[FMDActivationLockInfo setIsOfflineFindingEnabled:](v5, "setIsOfflineFindingEnabled:", [v4 decodeBoolForKey:@"isOfflineFindingEnabled"]);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v11 = [v9 setWithArray:v10];
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"localeStrings"];
    [(FMDActivationLockInfo *)v5 setLocaleStrings:v12];

    -[FMDActivationLockInfo setIsRestrictedSKU:](v5, "setIsRestrictedSKU:", [v4 decodeBoolForKey:@"isRestrictedSKU"]);
    -[FMDActivationLockInfo setIsFindMyLPEMEnabled:](v5, "setIsFindMyLPEMEnabled:", [v4 decodeBoolForKey:@"isFindMyLPEMEnabled"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isActivationLocked](self, "isActivationLocked"), @"isActivationLocked");
  id v4 = [(FMDActivationLockInfo *)self maskedAppleID];
  [v8 encodeObject:v4 forKey:@"maskedAppleID"];

  v5 = [(FMDActivationLockInfo *)self maskedOrganizationID];
  [v8 encodeObject:v5 forKey:@"maskedOrganizationID"];

  v6 = [(FMDActivationLockInfo *)self title];
  [v8 encodeObject:v6 forKey:@"title"];

  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isOfflineFindingEnabled](self, "isOfflineFindingEnabled"), @"isOfflineFindingEnabled");
  v7 = [(FMDActivationLockInfo *)self localeStrings];
  [v8 encodeObject:v7 forKey:@"localeStrings"];

  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isRestrictedSKU](self, "isRestrictedSKU"), @"isRestrictedSKU");
  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isFindMyLPEMEnabled](self, "isFindMyLPEMEnabled"), @"isFindMyLPEMEnabled");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(FMDActivationLockInfo *)self title];
  v6 = [(FMDActivationLockInfo *)self maskedAppleID];
  v7 = [(FMDActivationLockInfo *)self maskedOrganizationID];
  id v8 = [v3 stringWithFormat:@"%@ - [\n\t%@\n\t%@\n\t%@\n\tAL Status %d\n\tofflineFinding %d,\n\trestrictedSKU %d\n\tofflineFindingInLPM %d]", v4, v5, v6, v7, -[FMDActivationLockInfo isActivationLocked](self, "isActivationLocked"), -[FMDActivationLockInfo isOfflineFindingEnabled](self, "isOfflineFindingEnabled"), -[FMDActivationLockInfo isRestrictedSKU](self, "isRestrictedSKU"), -[FMDActivationLockInfo isFindMyLPEMEnabled](self, "isFindMyLPEMEnabled")];

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isActivationLocked
{
  return self->_isActivationLocked;
}

- (void)setIsActivationLocked:(BOOL)a3
{
  self->_isActivationLocked = a3;
}

- (NSString)maskedAppleID
{
  return self->_maskedAppleID;
}

- (void)setMaskedAppleID:(id)a3
{
}

- (NSString)maskedOrganizationID
{
  return self->_maskedOrganizationID;
}

- (void)setMaskedOrganizationID:(id)a3
{
}

- (BOOL)isOfflineFindingEnabled
{
  return self->_isOfflineFindingEnabled;
}

- (void)setIsOfflineFindingEnabled:(BOOL)a3
{
  self->_isOfflineFindingEnabled = a3;
}

- (NSDictionary)localeStrings
{
  return self->_localeStrings;
}

- (void)setLocaleStrings:(id)a3
{
}

- (BOOL)isRestrictedSKU
{
  return self->_isRestrictedSKU;
}

- (void)setIsRestrictedSKU:(BOOL)a3
{
  self->_isRestrictedSKU = a3;
}

- (BOOL)isFindMyLPEMEnabled
{
  return self->_isFindMyLPEMEnabled;
}

- (void)setIsFindMyLPEMEnabled:(BOOL)a3
{
  self->_isFindMyLPEMEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeStrings, 0);
  objc_storeStrong((id *)&self->_maskedOrganizationID, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end