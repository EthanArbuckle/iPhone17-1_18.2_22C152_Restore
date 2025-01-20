@interface AKCredentialRequest
+ (BOOL)supportsSecureCoding;
- (AKCredentialRequest)init;
- (AKCredentialRequest)initWithCoder:(id)a3;
- (NSString)altDSID;
- (NSString)description;
- (NSString)userIdentifier;
- (NSUUID)requestIdentifier;
- (NSUUID)transactionID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation AKCredentialRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKCredentialRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)AKCredentialRequest;
  v2 = [(AKCredentialRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    requestIdentifier = v2->_requestIdentifier;
    v2->_requestIdentifier = (NSUUID *)v3;

    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    transactionID = v2->_transactionID;
    v2->_transactionID = (NSUUID *)v5;
  }
  return v2;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_userIdentifier forKey:@"AKUserIdentifier"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"_requestIdentifier"];
  [v5 encodeObject:self->_transactionID forKey:@"_transactionID"];
}

- (AKCredentialRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKCredentialRequest;
  id v5 = [(AKCredentialRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKUserIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transactionID"];
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSUUID *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_requestIdentifier copy];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSString *)self->_userIdentifier copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_altDSID copy];
  uint64_t v10 = (void *)v4[1];
  v4[1] = v9;

  uint64_t v11 = [(NSUUID *)self->_transactionID copy];
  uint64_t v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> requestIdentifier: %@,\naltDSID: %@,\nuserID: %@ \ntransactionID:%@", v5, self, self->_requestIdentifier, self->_altDSID, self->_userIdentifier, self->_transactionID];

  return (NSString *)v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSUUID)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end