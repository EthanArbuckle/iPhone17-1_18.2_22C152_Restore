@interface IPInstallableStateData
+ (BOOL)supportsSecureCoding;
- (BOOL)isInstalling;
- (IPInstallableStateData)initWithCoder:(id)a3;
- (IPInstallableStateData)initWithIdentity:(id)a3 isInstalling:(BOOL)a4;
- (LSApplicationIdentity)identity;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPInstallableStateData

- (IPInstallableStateData)initWithIdentity:(id)a3 isInstalling:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPInstallableStateData;
  v8 = [(IPInstallableStateData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identity, a3);
    v9->_installing = a4;
  }

  return v9;
}

- (id)description
{
  if (self->_installing) {
    v2 = "YES";
  }
  else {
    v2 = "NO";
  }
  return (id)[NSString stringWithFormat:@"<%@:%p %@ installing: %s>", self, self, self->_identity, v2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IPInstallableStateData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPInstallableStateData;
  v5 = [(IPInstallableStateData *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    char v7 = [v4 decodeBoolForKey:@"installing"];
    if (v6)
    {
      BOOL v8 = v7;
      objc_storeStrong((id *)&v5->_identity, v6);
      v5->_installing = v8;
    }
    else
    {
      v9 = _IPMakeNSErrorImpl((void *)*MEMORY[0x263F07F70], 4864, (uint64_t)"-[IPInstallableStateData initWithCoder:]", 85, 0);
      [v4 failWithError:v9];

      v5 = 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identity = self->_identity;
  id v5 = a3;
  [v5 encodeObject:identity forKey:@"identity"];
  [v5 encodeBool:self->_installing forKey:@"installing"];
}

- (LSApplicationIdentity)identity
{
  return self->_identity;
}

- (BOOL)isInstalling
{
  return self->_installing;
}

- (void).cxx_destruct
{
}

@end