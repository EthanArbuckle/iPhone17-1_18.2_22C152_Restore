@interface MLArrayDictionaryFeatureProvider
+ (BOOL)supportsSecureCoding;
- (MLArrayDictionaryFeatureProvider)initWithCoder:(id)a3;
- (MLArrayDictionaryFeatureProvider)initWithDictionaryFeatureProviderArray:(id)a3;
- (NSArray)array;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLArrayDictionaryFeatureProvider

- (void).cxx_destruct
{
}

- (NSArray)array
{
  return self->_array;
}

- (MLArrayDictionaryFeatureProvider)initWithCoder:(id)a3
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v12[7] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];
  [v6 addObjectsFromArray:v7];

  v8 = [v5 allowedClasses];
  [v6 unionSet:v8];

  v9 = [v5 decodeObjectOfClasses:v6 forKey:@"array"];

  v10 = [(MLArrayDictionaryFeatureProvider *)self initWithDictionaryFeatureProviderArray:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLArrayDictionaryFeatureProvider *)self array];
  [v4 encodeObject:v5 forKey:@"array"];
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 < 0)
  {
    id v5 = [(MLArrayDictionaryFeatureProvider *)self array];
    v3 += [v5 count];
  }
  id v6 = [(MLArrayDictionaryFeatureProvider *)self array];
  v7 = [v6 objectAtIndexedSubscript:v3];

  return v7;
}

- (int64_t)count
{
  v2 = [(MLArrayDictionaryFeatureProvider *)self array];
  int64_t v3 = [v2 count];

  return v3;
}

- (MLArrayDictionaryFeatureProvider)initWithDictionaryFeatureProviderArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLArrayDictionaryFeatureProvider;
  id v6 = [(MLArrayDictionaryFeatureProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_array, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end