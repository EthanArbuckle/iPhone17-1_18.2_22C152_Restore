@interface AACustodianPasswordResetInformation
+ (BOOL)supportsSecureCoding;
- (AACustodianPasswordResetInformation)initWithCoder:(id)a3;
- (AACustodianPasswordResetInformation)initWithRecoveryToken:(id)a3 ownerAppleID:(id)a4;
- (NSString)custodianRecoveryToken;
- (NSString)ownerAppleID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCustodianRecoveryToken:(id)a3;
- (void)setOwnerAppleID:(id)a3;
@end

@implementation AACustodianPasswordResetInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianPasswordResetInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AACustodianPasswordResetInformation;
  v5 = [(AACustodianPasswordResetInformation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianRecoveryToken"];
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerAppleID"];
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  custodianRecoveryToken = self->_custodianRecoveryToken;
  id v5 = a3;
  [v5 encodeObject:custodianRecoveryToken forKey:@"_custodianRecoveryToken"];
  [v5 encodeObject:self->_ownerAppleID forKey:@"_ownerAppleID"];
}

- (AACustodianPasswordResetInformation)initWithRecoveryToken:(id)a3 ownerAppleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AACustodianPasswordResetInformation;
  v9 = [(AACustodianPasswordResetInformation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_custodianRecoveryToken, a3);
    objc_storeStrong((id *)&v10->_ownerAppleID, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AACustodianPasswordResetInformation allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_custodianRecoveryToken copy];
  custodianRecoveryToken = v4->_custodianRecoveryToken;
  v4->_custodianRecoveryToken = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_ownerAppleID copy];
  ownerAppleID = v4->_ownerAppleID;
  v4->_ownerAppleID = (NSString *)v7;

  return v4;
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerAppleID, 0);

  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
}

@end