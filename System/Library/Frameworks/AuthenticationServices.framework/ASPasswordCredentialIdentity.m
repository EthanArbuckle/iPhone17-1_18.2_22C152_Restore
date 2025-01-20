@interface ASPasswordCredentialIdentity
+ (ASPasswordCredentialIdentity)identityWithServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier user:(NSString *)user recordIdentifier:(NSString *)recordIdentifier;
+ (BOOL)supportsSecureCoding;
- (ASCredentialServiceIdentifier)serviceIdentifier;
- (ASPasswordCredentialIdentity)initWithCoder:(id)a3;
- (ASPasswordCredentialIdentity)initWithFoundationCredentialIdentity:(id)a3;
- (ASPasswordCredentialIdentity)initWithServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier user:(NSString *)user recordIdentifier:(NSString *)recordIdentifier;
- (NSInteger)rank;
- (NSString)description;
- (NSString)recordIdentifier;
- (NSString)user;
- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRank:(NSInteger)rank;
@end

@implementation ASPasswordCredentialIdentity

+ (ASPasswordCredentialIdentity)identityWithServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier user:(NSString *)user recordIdentifier:(NSString *)recordIdentifier
{
  v8 = recordIdentifier;
  v9 = user;
  v10 = serviceIdentifier;
  v11 = (void *)[objc_alloc((Class)a1) initWithServiceIdentifier:v10 user:v9 recordIdentifier:v8];

  return (ASPasswordCredentialIdentity *)v11;
}

- (ASPasswordCredentialIdentity)initWithServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier user:(NSString *)user recordIdentifier:(NSString *)recordIdentifier
{
  v9 = serviceIdentifier;
  v10 = user;
  v11 = recordIdentifier;
  v20.receiver = self;
  v20.super_class = (Class)ASPasswordCredentialIdentity;
  v12 = [(ASPasswordCredentialIdentity *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceIdentifier, serviceIdentifier);
    uint64_t v14 = [(NSString *)v10 copy];
    v15 = v13->_user;
    v13->_user = (NSString *)v14;

    uint64_t v16 = [(NSString *)v11 copy];
    v17 = v13->_recordIdentifier;
    v13->_recordIdentifier = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (ASPasswordCredentialIdentity)initWithFoundationCredentialIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 serviceIdentifierType] == 1;
  v6 = [ASCredentialServiceIdentifier alloc];
  v7 = [v4 serviceIdentifier];
  v8 = [(ASCredentialServiceIdentifier *)v6 initWithIdentifier:v7 type:v5];

  v9 = [v4 user];
  v10 = [v4 externalRecordIdentifier];
  v11 = [(ASPasswordCredentialIdentity *)self initWithServiceIdentifier:v8 user:v9 recordIdentifier:v10];

  if (v11)
  {
    v12 = [v4 owningExtensionState];
    uint64_t v13 = [v12 credentialIdentityStoreIdentifier];
    credentialIdentityStoreIdentifier = v11->_credentialIdentityStoreIdentifier;
    v11->_credentialIdentityStoreIdentifier = (SFExternalCredentialIdentityStoreIdentifier *)v13;

    v11->_rank = [v4 rank];
    v15 = v11;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithServiceIdentifier:user:recordIdentifier:", self->_serviceIdentifier, self->_user, self->_recordIdentifier);
  [v4 setRank:self->_rank];
  if (v4) {
    objc_storeStrong(v4 + 1, self->_credentialIdentityStoreIdentifier);
  }
  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; user=%@; serviceIdentifier=%@>",
                       objc_opt_class(),
                       self,
                       self->_user,
                       self->_serviceIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasswordCredentialIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordIdentifier"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"rank"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentityStoreIdentifier"];

  v10 = [(ASPasswordCredentialIdentity *)self initWithServiceIdentifier:v5 user:v6 recordIdentifier:v7];
  v11 = v10;
  if (v10)
  {
    v10->_rank = v8;
    objc_storeStrong((id *)&v10->_credentialIdentityStoreIdentifier, v9);
    v12 = v11;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  serviceIdentifier = self->_serviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:serviceIdentifier forKey:@"serviceIdentifier"];
  [v5 encodeObject:self->_user forKey:@"user"];
  [v5 encodeObject:self->_recordIdentifier forKey:@"recordIdentifier"];
  [v5 encodeInteger:self->_rank forKey:@"rank"];
  [v5 encodeObject:self->_credentialIdentityStoreIdentifier forKey:@"credentialIdentityStoreIdentifier"];
}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (ASCredentialServiceIdentifier)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (NSInteger)rank
{
  return self->_rank;
}

- (void)setRank:(NSInteger)rank
{
  self->_rank = rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
}

@end