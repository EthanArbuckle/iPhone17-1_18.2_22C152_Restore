@interface CNLocalizationServicesTestDouble
+ (id)storageKeyForKey:(id)a3 table:(id)a4 inBundleForClass:(Class)a5;
- (CNLocalizationServicesTestDouble)init;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 bundleForClass:(Class)a6 comment:(id)a7;
- (void)givenLocalizedString:(id)a3 forKey:(id)a4 table:(id)a5 bundleForClass:(Class)a6;
@end

@implementation CNLocalizationServicesTestDouble

- (CNLocalizationServicesTestDouble)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNLocalizationServicesTestDouble;
  v2 = [(CNLocalizationServicesTestDouble *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)givenLocalizedString:(id)a3 forKey:(id)a4 table:(id)a5 bundleForClass:(Class)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() storageKeyForKey:v11 table:v10 inBundleForClass:a6];

  [(NSMutableDictionary *)self->_values setObject:v12 forKeyedSubscript:v13];
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 bundleForClass:(Class)a6 comment:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = [(id)objc_opt_class() storageKeyForKey:v13 table:v12 inBundleForClass:a6];

  id v15 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v14];
  if (!v15) {
    id v15 = v11;
  }

  return v15;
}

+ (id)storageKeyForKey:(id)a3 table:(id)a4 inBundleForClass:(Class)a5
{
  objc_super v7 = (__CFString *)a4;
  id v8 = a3;
  v9 = objc_opt_new();
  id v10 = NSStringFromClass(a5);
  [v9 appendString:v10];

  [v9 appendString:@"."];
  id v11 = @"*";
  if (v7 && [(__CFString *)v7 length]) {
    id v11 = v7;
  }
  [v9 appendString:v11];
  [v9 appendString:@"."];
  [v9 appendString:v8];

  return v9;
}

- (void).cxx_destruct
{
}

@end