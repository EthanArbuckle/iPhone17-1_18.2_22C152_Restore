@interface AMSBagFrozenDataSourceBuilder
- (AMSBagFrozenDataSourceBuilder)initWithFrozenDataSource:(id)a3;
- (AMSProcessInfo)processInfo;
- (NSDate)expirationDate;
- (NSDictionary)data;
- (NSDictionary)defaultValues;
- (NSString)profile;
- (NSString)profileVersion;
- (id)createFrozenBag;
- (id)createFrozenDataSource;
- (void)setData:(id)a3;
- (void)setDefaultValues:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation AMSBagFrozenDataSourceBuilder

- (AMSBagFrozenDataSourceBuilder)initWithFrozenDataSource:(id)a3
{
  id v4 = a3;
  v5 = [(AMSBagFrozenDataSourceBuilder *)self init];
  if (v5)
  {
    v6 = [v4 data];
    uint64_t v7 = [v6 copy];
    data = v5->_data;
    v5->_data = (NSDictionary *)v7;

    v9 = [v4 defaultValues];
    uint64_t v10 = [v9 copy];
    defaultValues = v5->_defaultValues;
    v5->_defaultValues = (NSDictionary *)v10;

    v12 = [v4 expirationDate];
    uint64_t v13 = [v12 copy];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v13;

    v15 = [v4 profile];
    uint64_t v16 = [v15 copy];
    profile = v5->_profile;
    v5->_profile = (NSString *)v16;

    v18 = [v4 profileVersion];
    uint64_t v19 = [v18 copy];
    profileVersion = v5->_profileVersion;
    v5->_profileVersion = (NSString *)v19;

    v21 = [v4 processInfo];
    uint64_t v22 = [v21 copy];
    processInfo = v5->_processInfo;
    v5->_processInfo = (AMSProcessInfo *)v22;
  }
  return v5;
}

- (void)setData:(id)a3
{
}

- (id)createFrozenDataSource
{
  uint64_t v3 = [(AMSBagFrozenDataSourceBuilder *)self data];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = (void *)v3;
  v5 = [(AMSBagFrozenDataSourceBuilder *)self expirationDate];
  if (v5)
  {
    v6 = [(AMSBagFrozenDataSourceBuilder *)self profile];
    if (!v6)
    {
      id v13 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [(AMSBagFrozenDataSourceBuilder *)self profileVersion];

    if (v7)
    {
      v8 = [AMSBagFrozenDataSource alloc];
      id v4 = [(AMSBagFrozenDataSourceBuilder *)self profile];
      v5 = [(AMSBagFrozenDataSourceBuilder *)self profileVersion];
      v9 = [(AMSBagFrozenDataSourceBuilder *)self data];
      uint64_t v10 = [(AMSBagFrozenDataSourceBuilder *)self expirationDate];
      v11 = [(AMSBagFrozenDataSourceBuilder *)self processInfo];
      v12 = [(AMSBagFrozenDataSourceBuilder *)self defaultValues];
      id v13 = [(AMSBagFrozenDataSource *)v8 _initWithProfile:v4 profileVersion:v5 data:v9 expirationDate:v10 processInfo:v11 defaultValues:v12];

LABEL_9:
      goto LABEL_10;
    }
LABEL_6:
    id v13 = 0;
    goto LABEL_11;
  }
  id v13 = 0;
LABEL_10:

LABEL_11:
  return v13;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)data
{
  return self->_data;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)setProfileVersion:(id)a3
{
}

- (void)setProfile:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setProcessInfo:(id)a3
{
}

- (void)setDefaultValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)createFrozenBag
{
  uint64_t v3 = [(AMSBagFrozenDataSourceBuilder *)self data];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = (void *)v3;
  v5 = [(AMSBagFrozenDataSourceBuilder *)self expirationDate];
  if (!v5)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v6 = [(AMSBagFrozenDataSourceBuilder *)self profile];
  if (!v6)
  {

    goto LABEL_8;
  }
  uint64_t v7 = [(AMSBagFrozenDataSourceBuilder *)self profileVersion];

  if (!v7)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_10;
  }
  v8 = [AMSBag alloc];
  id v4 = [(AMSBagFrozenDataSourceBuilder *)self createFrozenDataSource];
  v9 = [(AMSBag *)v8 initWithDataSource:v4];
LABEL_9:

LABEL_10:
  return v9;
}

@end