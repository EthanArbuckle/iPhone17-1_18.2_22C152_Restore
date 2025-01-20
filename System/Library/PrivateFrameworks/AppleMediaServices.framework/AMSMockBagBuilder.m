@interface AMSMockBagBuilder
- (AMSMockBagBuilder)init;
- (AMSMockBagBuilder)initWithData:(id)a3;
- (NSDate)expirationDate;
- (NSMutableDictionary)data;
- (NSString)profile;
- (NSString)profileVersion;
- (id)createMockBag;
- (void)addBagKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5;
- (void)setData:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation AMSMockBagBuilder

- (AMSMockBagBuilder)init
{
  return [(AMSMockBagBuilder *)self initWithData:MEMORY[0x1E4F1CC08]];
}

- (AMSMockBagBuilder)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMockBagBuilder;
  v5 = [(AMSMockBagBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)addBagKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5
{
  id v9 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(AMSMockBagBuilder *)self data];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

- (id)createMockBag
{
  v3 = objc_alloc_init(AMSBagFrozenDataSourceBuilder);
  id v4 = [(AMSMockBagBuilder *)self data];
  [(AMSBagFrozenDataSourceBuilder *)v3 setData:v4];

  v5 = [(AMSMockBagBuilder *)self expirationDate];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  [(AMSBagFrozenDataSourceBuilder *)v3 setExpirationDate:v6];
  if (!v5) {

  }
  uint64_t v7 = [(AMSMockBagBuilder *)self profile];
  v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = @"AMSMockBag";
  }
  [(AMSBagFrozenDataSourceBuilder *)v3 setProfile:v9];

  uint64_t v10 = [(AMSMockBagBuilder *)self profileVersion];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"1";
  }
  [(AMSBagFrozenDataSourceBuilder *)v3 setProfileVersion:v12];

  v13 = [AMSBag alloc];
  v14 = [(AMSBagFrozenDataSourceBuilder *)v3 createFrozenDataSource];
  v15 = [(AMSBag *)v13 initWithDataSource:v14];

  return v15;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end