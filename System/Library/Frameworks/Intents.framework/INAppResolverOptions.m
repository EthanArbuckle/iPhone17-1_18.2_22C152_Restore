@interface INAppResolverOptions
+ (BOOL)supportsSecureCoding;
+ (INAppResolverOptions)optionsWithDictionary:(id)a3;
- (BOOL)includeUserActivityTypes;
- (BOOL)skipSupportedIntentsCheck;
- (INAppResolverOptions)initWithCoder:(id)a3;
- (INAppResolverOptions)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAppResolverOptions

- (BOOL)includeUserActivityTypes
{
  v2 = [(INAppResolverOptions *)self dictionary];
  v3 = [v2 objectForKey:@"IncludeUserActivityTypes"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (INAppResolverOptions)initWithDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INAppResolverOptions;
  v6 = [(INAppResolverOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(INAppResolverOptions *)self dictionary];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (INAppResolverOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INAppResolverOptions;
  id v5 = [(INAppResolverOptions *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)skipSupportedIntentsCheck
{
  v2 = [(INAppResolverOptions *)self dictionary];
  v3 = [v2 objectForKey:@"SkipSupportedIntentsCheck"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (INAppResolverOptions)optionsWithDictionary:(id)a3
{
  id v3 = a3;
  char v4 = [[INAppResolverOptions alloc] initWithDictionary:v3];

  return v4;
}

@end