@interface ASDAccountStatusResponse
+ (BOOL)supportsSecureCoding;
- (ASDAccountStatusResponse)initWithAccountID:(id)a3;
- (ASDAccountStatusResponse)initWithCoder:(id)a3;
- (BOOL)hasCachedFamilyInfo;
- (BOOL)hasErrorStatus;
- (BOOL)hasResponseFlag:(int64_t)a3;
- (NSNumber)accountID;
- (int64_t)accountStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setHasCachedFamilyInfo:(BOOL)a3;
@end

@implementation ASDAccountStatusResponse

- (ASDAccountStatusResponse)initWithAccountID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDAccountStatusResponse;
  v5 = [(ASDAccountStatusResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;
  }
  return v5;
}

- (BOOL)hasErrorStatus
{
  return [(ASDAccountStatusResponse *)self accountStatus] != 0;
}

- (BOOL)hasResponseFlag:(int64_t)a3
{
  return ([(ASDAccountStatusResponse *)self accountStatus] & a3) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAccountStatusResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDAccountStatusResponse *)self initWithAccountID:0];
  if (v5)
  {
    objc_opt_class();
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    v5->_accountStatus = [v4 decodeIntegerForKey:@"_accountStatus"];
    v5->_hasCachedFamilyInfo = [v4 decodeBoolForKey:@"_hasCachedFamilyInfo"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountID = self->_accountID;
  id v5 = a3;
  [v5 encodeObject:accountID forKey:@"_accountID"];
  [v5 encodeInteger:self->_accountStatus forKey:@"_accountStatus"];
  [v5 encodeBool:self->_hasCachedFamilyInfo forKey:@"_hasCachedFamilyInfo"];
}

- (NSNumber)accountID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountID:(id)a3
{
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (BOOL)hasCachedFamilyInfo
{
  return self->_hasCachedFamilyInfo;
}

- (void)setHasCachedFamilyInfo:(BOOL)a3
{
  self->_hasCachedFamilyInfo = a3;
}

- (void).cxx_destruct
{
}

@end