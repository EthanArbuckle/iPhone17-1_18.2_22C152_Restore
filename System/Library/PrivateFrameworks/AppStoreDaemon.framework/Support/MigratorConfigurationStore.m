@interface MigratorConfigurationStore
- (MigratorConfigurationStore)init;
@end

@implementation MigratorConfigurationStore

- (MigratorConfigurationStore)init
{
  v17.receiver = self;
  v17.super_class = (Class)MigratorConfigurationStore;
  v2 = [(MigratorConfigurationStore *)&v17 init];
  if (v2)
  {
    v3 = sub_1003F4C50();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = v3;
      v5 = (NSMutableDictionary *)objc_opt_new();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          v10 = 0;
          do
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = sub_1002ECF70((id *)[MigratorConfiguration alloc], *(void **)(*((void *)&v18 + 1) + 8 * (void)v10));
            v12 = v11;
            if (v11)
            {
              id v13 = v11[1];
              [(NSMutableDictionary *)v5 setObject:v12 forKey:v13];
            }
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      configuration = v2->_configuration;
      v2->_configuration = v5;
    }
    else
    {
      uint64_t v15 = objc_opt_new();
      configuration = v2->_configuration;
      v2->_configuration = (NSMutableDictionary *)v15;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end