@interface AMSBagFrozenDataSource
+ (BOOL)supportsSecureCoding;
- (AMSBagFrozenDataSource)initWithCoder:(id)a3;
- (AMSProcessInfo)processInfo;
- (BOOL)isLoaded;
- (NSDate)expirationDate;
- (NSDictionary)data;
- (NSDictionary)defaultValues;
- (NSString)bagLoadingPartialIdentifier;
- (NSString)description;
- (NSString)profile;
- (NSString)profileVersion;
- (id)_initWithProfile:(id)a3 profileVersion:(id)a4 data:(id)a5 expirationDate:(id)a6 processInfo:(id)a7 defaultValues:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValueForKey:(id)a3;
- (id)valueForURLVariable:(id)a3 account:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)loadWithCompletion:(id)a3;
- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation AMSBagFrozenDataSource

- (void)loadWithCompletion:(id)a3
{
  v8 = (void (**)(id, void *, void))a3;
  v4 = [AMSBagDataSourceLoadResult alloc];
  v5 = [(AMSBagFrozenDataSource *)self data];
  v6 = [(AMSBagFrozenDataSource *)self expirationDate];
  v7 = [(AMSBagDataSourceLoadResult *)v4 initWithData:v5 expirationDate:v6 loadedBagIdentifier:0 loadedBagPartialIdentifier:0];

  v8[2](v8, v7, 0);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)data
{
  return self->_data;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AMSBagFrozenDataSource *)self profile];
  v6 = [(AMSBagFrozenDataSource *)self profileVersion];
  v7 = [v3 stringWithFormat:@"<%@: %p; profile: %@; version: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (id)defaultValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(AMSBagFrozenDataSource *)self defaultValues];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [(AMSBagFrozenDataSource *)self profile];
    v8 = [(AMSBagFrozenDataSource *)self profileVersion];
    v6 = +[AMSBagKeySet defaultValueForKey:v4 profile:v7 profileVersion:v8];
  }
  return v6;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSBagFrozenDataSource)initWithCoder:(id)a3
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AMSBagFrozenDataSource;
  v5 = [(AMSBagFrozenDataSource *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"defaultValues"];
    defaultValues = v5->_defaultValues;
    v5->_defaultValues = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processInfo"];
    processInfo = v5->_processInfo;
    v5->_processInfo = (AMSProcessInfo *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profile"];
    profile = v5->_profile;
    v5->_profile = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileVersion"];
    profileVersion = v5->_profileVersion;
    v5->_profileVersion = (NSString *)v19;
  }
  return v5;
}

- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(AMSBagFrozenDataSource *)self processInfo];
  +[AMSBagNetworkDataSource valueForURLVariable:v11 account:v8 clientInfo:v10 completion:v9];
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (id)_initWithProfile:(id)a3 profileVersion:(id)a4 data:(id)a5 expirationDate:(id)a6 processInfo:(id)a7 defaultValues:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSBagFrozenDataSource;
  v18 = [(AMSBagFrozenDataSource *)&v24 init];
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a5);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 1, a6);
    objc_storeStrong(p_isa + 2, a7);
    objc_storeStrong(p_isa + 3, a3);
    objc_storeStrong(p_isa + 4, a4);
  }

  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (NSString)bagLoadingPartialIdentifier
{
  return 0;
}

- (id)valueForURLVariable:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSBagFrozenDataSource *)self processInfo];
  id v9 = +[AMSBagNetworkDataSource valueForURLVariable:v6 account:v7 clientInfo:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(AMSBagFrozenDataSource);
  uint64_t v6 = [(NSDictionary *)self->_data copyWithZone:a3];
  data = v5->_data;
  v5->_data = (NSDictionary *)v6;

  uint64_t v8 = [(NSDictionary *)self->_defaultValues copyWithZone:a3];
  defaultValues = v5->_defaultValues;
  v5->_defaultValues = (NSDictionary *)v8;

  uint64_t v10 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v10;

  v12 = [(AMSProcessInfo *)self->_processInfo copyWithZone:a3];
  processInfo = v5->_processInfo;
  v5->_processInfo = v12;

  uint64_t v14 = [(NSString *)self->_profile copyWithZone:a3];
  profile = v5->_profile;
  v5->_profile = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_profileVersion copyWithZone:a3];
  profileVersion = v5->_profileVersion;
  v5->_profileVersion = (NSString *)v16;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(AMSBagFrozenDataSource *)self data];
  [v10 encodeObject:v4 forKey:@"data"];

  v5 = [(AMSBagFrozenDataSource *)self defaultValues];
  [v10 encodeObject:v5 forKey:@"defaultValues"];

  uint64_t v6 = [(AMSBagFrozenDataSource *)self expirationDate];
  [v10 encodeObject:v6 forKey:@"expirationDate"];

  id v7 = [(AMSBagFrozenDataSource *)self processInfo];
  [v10 encodeObject:v7 forKey:@"processInfo"];

  uint64_t v8 = [(AMSBagFrozenDataSource *)self profile];
  [v10 encodeObject:v8 forKey:@"profile"];

  id v9 = [(AMSBagFrozenDataSource *)self profileVersion];
  [v10 encodeObject:v9 forKey:@"profileVersion"];
}

@end