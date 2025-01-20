@interface MSServiceResolutionInfo
+ (BOOL)supportsSecureCoding;
- (MSServiceAppInfo)serviceAppInfo;
- (MSServiceResolutionInfo)initWithCoder:(id)a3;
- (MSServiceResolutionInfo)initWithServiceAppInfo:(id)a3 userAccountInfo:(id)a4;
- (MSUserAccountInfo)userAccountInfo;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSServiceResolutionInfo

- (MSServiceResolutionInfo)initWithServiceAppInfo:(id)a3 userAccountInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSServiceResolutionInfo;
  v9 = [(MSServiceResolutionInfo *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_serviceAppInfo, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MSServiceResolutionInfo: ThirdPartyAppInfo: %@ UserAccountInfo: %@>", self->_serviceAppInfo, self->_userAccountInfo];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serviceAppInfo = self->_serviceAppInfo;
  id v5 = a3;
  [v5 encodeObject:serviceAppInfo forKey:@"MSSRAppInfoEncodedKey"];
  [v5 encodeObject:self->_userAccountInfo forKey:@"MSSRUserAccountEncodedKey"];
}

- (MSServiceResolutionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSRAppInfoEncodedKey"];
  serviceAppInfo = self->_serviceAppInfo;
  self->_serviceAppInfo = v5;

  if (self->_serviceAppInfo
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSRUserAccountEncodedKey"],
        id v7 = (MSUserAccountInfo *)objc_claimAutoreleasedReturnValue(),
        userAccountInfo = self->_userAccountInfo,
        self->_userAccountInfo = v7,
        userAccountInfo,
        self->_userAccountInfo))
  {
    self = -[MSServiceResolutionInfo initWithServiceAppInfo:userAccountInfo:](self, "initWithServiceAppInfo:userAccountInfo:", self->_serviceAppInfo);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MSServiceAppInfo)serviceAppInfo
{
  return self->_serviceAppInfo;
}

- (MSUserAccountInfo)userAccountInfo
{
  return self->_userAccountInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccountInfo, 0);

  objc_storeStrong((id *)&self->_serviceAppInfo, 0);
}

@end