@interface ATXOnboardingStackWidgetCache
+ (BOOL)supportsSecureCoding;
- (ATXOnboardingStackWidgetCache)initWithAppLaunchDictionary:(id)a3;
- (ATXOnboardingStackWidgetCache)initWithAppLaunchDictionary:(id)a3 cacheUpdateDate:(id)a4 hasiCloudFamily:(id)a5;
- (ATXOnboardingStackWidgetCache)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)cacheUpdateDate;
- (NSDictionary)descriptorToAppLaunchData;
- (NSNumber)hasiCloudFamily;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXOnboardingStackWidgetCache

- (ATXOnboardingStackWidgetCache)initWithAppLaunchDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ATXOnboardingStackWidgetCache *)self initWithAppLaunchDictionary:v4 cacheUpdateDate:v5 hasiCloudFamily:0];

  return v6;
}

- (ATXOnboardingStackWidgetCache)initWithAppLaunchDictionary:(id)a3 cacheUpdateDate:(id)a4 hasiCloudFamily:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXOnboardingStackWidgetCache;
  v11 = [(ATXOnboardingStackWidgetCache *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    descriptorToAppLaunchData = v11->_descriptorToAppLaunchData;
    v11->_descriptorToAppLaunchData = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_cacheUpdateDate, a4);
    objc_storeStrong((id *)&v11->_hasiCloudFamily, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  descriptorToAppLaunchData = self->_descriptorToAppLaunchData;
  id v5 = a3;
  [v5 encodeObject:descriptorToAppLaunchData forKey:@"descriptorToAppLaunchData"];
  [v5 encodeObject:self->_cacheUpdateDate forKey:@"cacheUpdateDate"];
  [v5 encodeObject:self->_hasiCloudFamily forKey:@"hasiCloudFamily"];
}

- (ATXOnboardingStackWidgetCache)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"descriptorToAppLaunchData"];

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheUpdateDate"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasiCloudFamily"];
  v14 = 0;
  if (v11 && v12)
  {
    self = [(ATXOnboardingStackWidgetCache *)self initWithAppLaunchDictionary:v11 cacheUpdateDate:v12 hasiCloudFamily:v13];
    v14 = self;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  descriptorToAppLaunchData = self->_descriptorToAppLaunchData;
  cacheUpdateDate = self->_cacheUpdateDate;
  hasiCloudFamily = self->_hasiCloudFamily;

  return (id)[v4 initWithAppLaunchDictionary:descriptorToAppLaunchData cacheUpdateDate:cacheUpdateDate hasiCloudFamily:hasiCloudFamily];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXOnboardingStackWidgetCache *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(ATXOnboardingStackWidgetCache *)v5 cacheUpdateDate];
      int v7 = [v6 isEqualToDate:self->_cacheUpdateDate];

      if (v7)
      {
        uint64_t v8 = [(ATXOnboardingStackWidgetCache *)v5 descriptorToAppLaunchData];
        char v9 = [v8 isEqual:self->_descriptorToAppLaunchData];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (NSDictionary)descriptorToAppLaunchData
{
  return self->_descriptorToAppLaunchData;
}

- (NSDate)cacheUpdateDate
{
  return self->_cacheUpdateDate;
}

- (NSNumber)hasiCloudFamily
{
  return self->_hasiCloudFamily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasiCloudFamily, 0);
  objc_storeStrong((id *)&self->_cacheUpdateDate, 0);

  objc_storeStrong((id *)&self->_descriptorToAppLaunchData, 0);
}

@end