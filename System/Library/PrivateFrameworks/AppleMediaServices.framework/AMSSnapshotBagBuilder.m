@interface AMSSnapshotBagBuilder
- (AMSProcessInfo)processInfo;
- (NSDate)expirationDate;
- (NSDictionary)data;
- (NSDictionary)defaultValues;
- (NSString)profile;
- (NSString)profileVersion;
- (id)buildWithError:(id *)a3;
- (void)setData:(id)a3;
- (void)setDefaultValues:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation AMSSnapshotBagBuilder

- (void)setProfileVersion:(id)a3
{
}

- (void)setProfile:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (void)setProcessInfo:(id)a3
{
}

- (id)buildWithError:(id *)a3
{
  uint64_t v5 = [(AMSSnapshotBagBuilder *)self data];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = (void *)v5;
  v7 = [(AMSSnapshotBagBuilder *)self expirationDate];
  if (!v7) {
    goto LABEL_7;
  }
  v8 = [(AMSSnapshotBagBuilder *)self profile];
  if (!v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  v9 = [(AMSSnapshotBagBuilder *)self profileVersion];

  if (v9)
  {
    v10 = objc_alloc_init(AMSBagFrozenDataSourceBuilder);
    v11 = [(AMSSnapshotBagBuilder *)self data];
    [(AMSBagFrozenDataSourceBuilder *)v10 setData:v11];

    v12 = [(AMSSnapshotBagBuilder *)self defaultValues];
    [(AMSBagFrozenDataSourceBuilder *)v10 setDefaultValues:v12];

    v13 = [(AMSSnapshotBagBuilder *)self expirationDate];
    [(AMSBagFrozenDataSourceBuilder *)v10 setExpirationDate:v13];

    v14 = [(AMSSnapshotBagBuilder *)self profile];
    [(AMSBagFrozenDataSourceBuilder *)v10 setProfile:v14];

    v15 = [(AMSSnapshotBagBuilder *)self profileVersion];
    [(AMSBagFrozenDataSourceBuilder *)v10 setProfileVersion:v15];

    v16 = [(AMSSnapshotBagBuilder *)self processInfo];
    [(AMSBagFrozenDataSourceBuilder *)v10 setProcessInfo:v16];

    v17 = [AMSSnapshotBag alloc];
    v18 = [(AMSBagFrozenDataSourceBuilder *)v10 createFrozenDataSource];
    id v19 = [(AMSSnapshotBag *)v17 _initWithDataSource:v18];

    goto LABEL_11;
  }
LABEL_8:
  if (a3)
  {
    AMSError(2, @"Missing Required Parameter", @"One or more required parameters are missing.", 0);
    id v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }
LABEL_11:
  return v19;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setDefaultValues:(id)a3
{
}

@end