@interface ASFApplication
- (ASFApplication)initWithBundleId:(id)a3 localizedName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSString)localizedName;
- (id)description;
- (int64_t)compareByName:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation ASFApplication

- (ASFApplication)initWithBundleId:(id)a3 localizedName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASFApplication;
  v9 = [(ASFApplication *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_localizedName, a4);
  }

  return v10;
}

- (int64_t)compareByName:(id)a3
{
  id v4 = a3;
  v5 = [(ASFApplication *)self localizedName];
  v6 = [v4 localizedName];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ASFApplication(bundleId:%@, localizedName:%@)", self->_bundleId, self->_localizedName];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASFApplication *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ASFApplication *)v5 bundleId];
      bundleId = self->_bundleId;
      if (bundleId == v6 || [(NSString *)bundleId isEqual:v6])
      {
        id v8 = [(ASFApplication *)v5 localizedName];
        localizedName = self->_localizedName;
        BOOL v10 = localizedName == v8 || [(NSString *)localizedName isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end