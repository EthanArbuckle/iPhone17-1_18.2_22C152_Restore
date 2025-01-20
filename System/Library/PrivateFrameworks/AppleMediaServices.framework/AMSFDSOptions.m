@interface AMSFDSOptions
+ (BOOL)supportsSecureCoding;
- (AMSFDSOptions)initWithCoder:(id)a3;
- (AMSProcessInfo)clientInfo;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(unint64_t)a3;
- (void)setClientInfo:(id)a3;
@end

@implementation AMSFDSOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_action;
  id v6 = [(AMSProcessInfo *)self->_clientInfo copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t action = self->_action;
  id v7 = a3;
  id v6 = [v4 numberWithUnsignedInteger:action];
  [v7 encodeObject:v6 forKey:@"kCodingKeyAction"];

  [v7 encodeObject:self->_clientInfo forKey:@"kCodingKeyClientInfo"];
}

- (AMSFDSOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSFDSOptions;
  v5 = [(AMSFDSOptions *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAction"];
    v5->_unint64_t action = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyClientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  v3 = [(AMSFDSOptions *)self clientInfo];
  id v4 = [v3 proxyAppBundleID];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSFDSOptions *)self clientInfo];
    id v6 = [v7 bundleIdentifier];
  }
  return (NSString *)v6;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_unint64_t action = a3;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end