@interface AACustodianSetupRequestContext
+ (BOOL)supportsSecureCoding;
- (AACustodianSetupRequestContext)initWithCoder:(id)a3;
- (AACustodianSetupRequestContext)initWithHandle:(id)a3 authResults:(id)a4;
- (NSString)contactID;
- (NSString)custodianSetupToken;
- (NSString)handle;
- (void)_parseAuthResults:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContactID:(id)a3;
@end

@implementation AACustodianSetupRequestContext

- (AACustodianSetupRequestContext)initWithHandle:(id)a3 authResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AACustodianSetupRequestContext;
  v9 = [(AACustodianSetupRequestContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a3);
    [(AACustodianSetupRequestContext *)v10 _parseAuthResults:v8];
  }

  return v10;
}

- (AACustodianSetupRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AACustodianSetupRequestContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianSetupToken"];
    custodianSetupToken = v5->_custodianSetupToken;
    v5->_custodianSetupToken = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactID"];
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"_handle"];
  [v5 encodeObject:self->_custodianSetupToken forKey:@"_custodianSetupToken"];
  [v5 encodeObject:self->_contactID forKey:@"_contactID"];
}

- (void)_parseAuthResults:(id)a3
{
  id v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC0]];
  id v4 = [v6 objectForKeyedSubscript:@"com.apple.gs.idms.custodian.add"];
  custodianSetupToken = self->_custodianSetupToken;
  self->_custodianSetupToken = v4;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)custodianSetupToken
{
  return self->_custodianSetupToken;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_custodianSetupToken, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end