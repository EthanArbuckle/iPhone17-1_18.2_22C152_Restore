@interface AMDStorageBasedProvider
- (AMDStorageBasedProvider)initWithDomain:(id)a3;
- (NSString)domain;
- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5;
- (void)setDomain:(id)a3;
- (void)storeFeatureData:(id)a3 error:(id *)a4;
@end

@implementation AMDStorageBasedProvider

- (AMDStorageBasedProvider)initWithDomain:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDStorageBasedProvider;
  v8 = [(AMDStorageBasedProvider *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  [(AMDStorageBasedProvider *)v8 setDomain:location[0]];
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v7 = location[0];
  v8 = [(AMDStorageBasedProvider *)v12 domain];
  id v9 = +[AMDTasteProfile getFeatureWithName:inDomain:withColumnName:error:](AMDTasteProfile, "getFeatureWithName:inDomain:withColumnName:error:", v7);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (void)storeFeatureData:(id)a3 error:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *a4 = +[AMDError allocError:29 withMessage:@"Store operation in AMDStorageBasedProvider not supported"];
  objc_storeStrong(location, 0);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end