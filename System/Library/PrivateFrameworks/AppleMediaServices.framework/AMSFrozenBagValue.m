@interface AMSFrozenBagValue
- (AMSBagDataSourceProtocol)dataSource;
- (AMSFrozenBagValue)initWithKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5;
- (void)setDataSource:(id)a3;
@end

@implementation AMSFrozenBagValue

- (AMSBagDataSourceProtocol)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

- (AMSFrozenBagValue)initWithKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v8)
  {
    v10 = [v7 componentsSeparatedByString:@"/"];
    id v11 = v9;
    for (unint64_t i = 0; i < [v10 count]; ++i)
    {
      v13 = [v10 objectAtIndexedSubscript:i];
      if (i == [v10 count] - 1)
      {
        [v11 setObject:v8 forKeyedSubscript:v13];
      }
      else
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v11 setObject:v14 forKeyedSubscript:v13];

        id v11 = v14;
      }
    }
  }
  v15 = objc_alloc_init(AMSBagFrozenDataSourceBuilder);
  v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [(AMSBagFrozenDataSourceBuilder *)v15 setExpirationDate:v16];

  [(AMSBagFrozenDataSourceBuilder *)v15 setData:MEMORY[0x1E4F1CC08]];
  [(AMSBagFrozenDataSourceBuilder *)v15 setProfile:@"AMSFrozenBagValue"];
  [(AMSBagFrozenDataSourceBuilder *)v15 setProfileVersion:@"1"];
  if (v8) {
    [(AMSBagFrozenDataSourceBuilder *)v15 setData:v9];
  }
  v17 = [(AMSBagFrozenDataSourceBuilder *)v15 createFrozenDataSource];
  v18 = [(AMSBagValue *)self initWithDataSource:v17 key:v7 valueType:a5];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_dataSource, v17);
  }

  return v19;
}

- (void)setDataSource:(id)a3
{
}

@end