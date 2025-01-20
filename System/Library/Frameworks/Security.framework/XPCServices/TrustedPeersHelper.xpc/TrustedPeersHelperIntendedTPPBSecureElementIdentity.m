@interface TrustedPeersHelperIntendedTPPBSecureElementIdentity
+ (BOOL)supportsSecureCoding;
+ (id)intendedEmptyIdentity;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithCoder:(id)a3;
- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithSecureElementIdentity:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
@end

@implementation TrustedPeersHelperIntendedTPPBSecureElementIdentity

- (void).cxx_destruct
{
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return (TPPBSecureElementIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TrustedPeersHelperIntendedTPPBSecureElementIdentity *)self secureElementIdentity];
  [v4 encodeObject:v5 forKey:@"identity"];
}

- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrustedPeersHelperIntendedTPPBSecureElementIdentity;
  id v5 = [(TrustedPeersHelperIntendedTPPBSecureElementIdentity *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    secureElementIdentity = v5->_secureElementIdentity;
    v5->_secureElementIdentity = (TPPBSecureElementIdentity *)v6;
  }
  return v5;
}

- (id)description
{
  v2 = [(TrustedPeersHelperIntendedTPPBSecureElementIdentity *)self secureElementIdentity];
  v3 = +[NSString stringWithFormat:@"<TrustedPeersHelperIntendedTPPBSecureElementIdentity: %@>", v2];

  return v3;
}

- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithSecureElementIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrustedPeersHelperIntendedTPPBSecureElementIdentity;
  uint64_t v6 = [(TrustedPeersHelperIntendedTPPBSecureElementIdentity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_secureElementIdentity, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intendedEmptyIdentity
{
  v2 = [[TrustedPeersHelperIntendedTPPBSecureElementIdentity alloc] initWithSecureElementIdentity:0];

  return v2;
}

@end