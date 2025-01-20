@interface ASOneTimeCodeCredentialIdentity
+ (BOOL)supportsSecureCoding;
- (ASCredentialServiceIdentifier)serviceIdentifier;
- (ASOneTimeCodeCredentialIdentity)initWithCoder:(id)a3;
- (ASOneTimeCodeCredentialIdentity)initWithServiceIdentifier:(id)a3 label:(id)a4 recordIdentifier:(id)a5;
- (NSString)label;
- (NSString)recordIdentifier;
- (NSString)user;
- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier;
- (id)_initWithFoundationCredentialIdentity:(id)a3;
- (id)_initWithServiceIdentifier:(id)a3 label:(id)a4 recordIdentifier:(id)a5 rank:(int64_t)a6 credentialIdentityStoreIdentifier:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)rank;
- (void)encodeWithCoder:(id)a3;
- (void)setRank:(int64_t)a3;
@end

@implementation ASOneTimeCodeCredentialIdentity

- (id)_initWithServiceIdentifier:(id)a3 label:(id)a4 recordIdentifier:(id)a5 rank:(int64_t)a6 credentialIdentityStoreIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ASOneTimeCodeCredentialIdentity;
  v16 = [(ASOneTimeCodeCredentialIdentity *)&v25 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    serviceIdentifier = v16->_serviceIdentifier;
    v16->_serviceIdentifier = (ASCredentialServiceIdentifier *)v17;

    uint64_t v19 = [v14 copy];
    recordIdentifier = v16->_recordIdentifier;
    v16->_recordIdentifier = (NSString *)v19;

    v16->_rank = a6;
    uint64_t v21 = [v13 copy];
    label = v16->_label;
    v16->_label = (NSString *)v21;

    objc_storeStrong((id *)&v16->_credentialIdentityStoreIdentifier, a7);
    v23 = v16;
  }

  return v16;
}

- (id)_initWithFoundationCredentialIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 serviceIdentifierType] == 1;
  v6 = [ASCredentialServiceIdentifier alloc];
  v7 = [v4 serviceIdentifier];
  v8 = [(ASCredentialServiceIdentifier *)v6 initWithIdentifier:v7 type:v5];

  v9 = [v4 user];
  v10 = [v4 externalRecordIdentifier];
  uint64_t v11 = [v4 rank];
  id v12 = [v4 owningExtensionState];

  id v13 = [v12 credentialIdentityStoreIdentifier];
  id v14 = [(ASOneTimeCodeCredentialIdentity *)self _initWithServiceIdentifier:v8 label:v9 recordIdentifier:v10 rank:v11 credentialIdentityStoreIdentifier:v13];

  return v14;
}

- (ASOneTimeCodeCredentialIdentity)initWithServiceIdentifier:(id)a3 label:(id)a4 recordIdentifier:(id)a5
{
  return (ASOneTimeCodeCredentialIdentity *)[(ASOneTimeCodeCredentialIdentity *)self _initWithServiceIdentifier:a3 label:a4 recordIdentifier:a5 rank:0 credentialIdentityStoreIdentifier:0];
}

- (NSString)user
{
  return self->_label;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  credentialIdentityStoreIdentifier = self->_credentialIdentityStoreIdentifier;
  label = self->_label;
  serviceIdentifier = self->_serviceIdentifier;
  recordIdentifier = self->_recordIdentifier;
  int64_t rank = self->_rank;

  return (id)[v4 _initWithServiceIdentifier:serviceIdentifier label:label recordIdentifier:recordIdentifier rank:rank credentialIdentityStoreIdentifier:credentialIdentityStoreIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASOneTimeCodeCredentialIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordIdentifier"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"rank"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentityStoreIdentifier"];

  v10 = [(ASOneTimeCodeCredentialIdentity *)self _initWithServiceIdentifier:v5 label:v6 recordIdentifier:v7 rank:v8 credentialIdentityStoreIdentifier:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  serviceIdentifier = self->_serviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:serviceIdentifier forKey:@"serviceIdentifier"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_recordIdentifier forKey:@"recordIdentifier"];
  [v5 encodeInteger:self->_rank forKey:@"rank"];
  [v5 encodeObject:self->_credentialIdentityStoreIdentifier forKey:@"credentialIdentityStoreIdentifier"];
}

- (ASCredentialServiceIdentifier)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_int64_t rank = a3;
}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end