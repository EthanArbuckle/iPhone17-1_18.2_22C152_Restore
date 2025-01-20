@interface CTCarrierSpaceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpaceAppsInfo)appsInfo;
- (CTCarrierSpaceInfo)init;
- (CTCarrierSpaceInfo)initWithCoder:(id)a3;
- (CTCarrierSpacePlansInfo)plansInfo;
- (CTCarrierSpaceUsageInfo)usageInfo;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppsInfo:(id)a3;
- (void)setPlansInfo:(id)a3;
- (void)setUsageInfo:(id)a3;
@end

@implementation CTCarrierSpaceInfo

- (CTCarrierSpaceInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)CTCarrierSpaceInfo;
  v2 = [(CTCarrierSpaceInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    usageInfo = v2->_usageInfo;
    v2->_usageInfo = 0;

    plansInfo = v3->_plansInfo;
    v3->_plansInfo = 0;

    appsInfo = v3->_appsInfo;
    v3->_appsInfo = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceInfo *)self usageInfo];
  [v3 appendFormat:@" usageInfo=%@", v4];

  v5 = [(CTCarrierSpaceInfo *)self plansInfo];
  [v3 appendFormat:@" plansInfo=%@", v5];

  v6 = [(CTCarrierSpaceInfo *)self appsInfo];
  [v3 appendFormat:@" appsInfo=%@", v6];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCarrierSpaceInfo *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTCarrierSpaceInfo *)self usageInfo];
      v6 = [(CTCarrierSpaceInfo *)v4 usageInfo];
      if ([v5 isEqual:v6])
      {
        v7 = [(CTCarrierSpaceInfo *)self plansInfo];
        objc_super v8 = [(CTCarrierSpaceInfo *)v4 plansInfo];
        if ([v7 isEqual:v8])
        {
          v9 = [(CTCarrierSpaceInfo *)self appsInfo];
          v10 = [(CTCarrierSpaceInfo *)v4 appsInfo];
          char v11 = [v9 isEqual:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  usageInfo = self->_usageInfo;
  id v5 = a3;
  [v5 encodeObject:usageInfo forKey:@"usageInfo"];
  [v5 encodeObject:self->_plansInfo forKey:@"plansInfo"];
  [v5 encodeObject:self->_appsInfo forKey:@"appsInfo"];
}

- (CTCarrierSpaceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCarrierSpaceInfo;
  id v5 = [(CTCarrierSpaceInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usageInfo"];
    usageInfo = v5->_usageInfo;
    v5->_usageInfo = (CTCarrierSpaceUsageInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plansInfo"];
    plansInfo = v5->_plansInfo;
    v5->_plansInfo = (CTCarrierSpacePlansInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appsInfo"];
    appsInfo = v5->_appsInfo;
    v5->_appsInfo = (CTCarrierSpaceAppsInfo *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCarrierSpaceUsageInfo)usageInfo
{
  return self->_usageInfo;
}

- (void)setUsageInfo:(id)a3
{
}

- (CTCarrierSpacePlansInfo)plansInfo
{
  return self->_plansInfo;
}

- (void)setPlansInfo:(id)a3
{
}

- (CTCarrierSpaceAppsInfo)appsInfo
{
  return self->_appsInfo;
}

- (void)setAppsInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsInfo, 0);
  objc_storeStrong((id *)&self->_plansInfo, 0);
  objc_storeStrong((id *)&self->_usageInfo, 0);
}

@end