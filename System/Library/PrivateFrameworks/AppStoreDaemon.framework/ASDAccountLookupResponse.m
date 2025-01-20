@interface ASDAccountLookupResponse
+ (BOOL)supportsSecureCoding;
- (ASDAccountLookupResponse)initWithAccountID:(id)a3 askToBuyEnabled:(BOOL)a4;
- (ASDAccountLookupResponse)initWithCoder:(id)a3;
- (ASDAccountLookupResponse)initWithError:(id)a3;
- (BOOL)askToBuyEnabled;
- (NSNumber)accountID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDAccountLookupResponse

- (ASDAccountLookupResponse)initWithAccountID:(id)a3 askToBuyEnabled:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDAccountLookupResponse;
  v7 = [(ASDRequestResponse *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    accountID = v7->_accountID;
    v7->_accountID = (NSNumber *)v8;

    v7->_askToBuyEnabled = a4;
  }

  return v7;
}

- (ASDAccountLookupResponse)initWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDAccountLookupResponse;
  v3 = [(ASDRequestResponse *)&v7 initWithError:a3];
  v4 = v3;
  if (v3)
  {
    accountID = v3->_accountID;
    v3->_accountID = 0;

    v4->_askToBuyEnabled = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAccountLookupResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDAccountLookupResponse;
  v5 = [(ASDRequestResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    v5->_askToBuyEnabled = [v4 decodeBoolForKey:@"askToBuyEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASDAccountLookupResponse;
  id v4 = a3;
  [(ASDRequestResponse *)&v6 encodeWithCoder:v4];
  v5 = [(ASDAccountLookupResponse *)self accountID];
  [v4 encodeObject:v5 forKey:@"accountID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAccountLookupResponse askToBuyEnabled](self, "askToBuyEnabled"), @"askToBuyEnabled");
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (BOOL)askToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (void).cxx_destruct
{
}

@end