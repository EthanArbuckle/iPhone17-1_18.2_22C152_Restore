@interface IXPromisedAppReferenceSeed
+ (BOOL)supportsSecureCoding;
- (IXApplicationIdentity)identity;
- (IXPromisedAppReferenceSeed)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)installationDomain;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setInstallationDomain:(unint64_t)a3;
@end

@implementation IXPromisedAppReferenceSeed

- (IXPromisedAppReferenceSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXPromisedAppReferenceSeed;
  v5 = [(IXOwnedDataPromiseSeed *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationDomain"];
    v5->_installationDomain = (unint64_t)[v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (IXApplicationIdentity *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IXPromisedAppReferenceSeed;
  id v4 = a3;
  [(IXOwnedDataPromiseSeed *)&v7 encodeWithCoder:v4];
  v5 = +[NSNumber numberWithUnsignedInteger:[(IXPromisedAppReferenceSeed *)self installationDomain]];
  [v4 encodeObject:v5 forKey:@"installationDomain"];

  v6 = [(IXPromisedAppReferenceSeed *)self identity];
  [v4 encodeObject:v6 forKey:@"identity"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IXPromisedAppReferenceSeed;
  id v4 = [(IXOwnedDataPromiseSeed *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setInstallationDomain:", -[IXPromisedAppReferenceSeed installationDomain](self, "installationDomain"));
  v5 = [(IXPromisedAppReferenceSeed *)self identity];
  id v6 = [v5 copy];
  [v4 setIdentity:v6];

  return v4;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (void)setInstallationDomain:(unint64_t)a3
{
  self->_installationDomain = a3;
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end