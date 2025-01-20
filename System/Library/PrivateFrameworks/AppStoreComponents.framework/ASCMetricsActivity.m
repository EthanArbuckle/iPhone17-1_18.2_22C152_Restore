@interface ASCMetricsActivity
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)defaultFields;
- (ASCMetricsActivity)init;
- (ASCMetricsActivity)initWithCoder:(id)a3;
- (ASCMetricsActivity)initWithFields:(id)a3;
- (ASCMetricsActivity)metricsActivityWithValue:(id)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)fields;
- (id)description;
- (id)metricsActivityByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4;
- (id)metricsActivityByRemovingValueForKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCMetricsActivity

+ (NSDictionary)defaultFields
{
  if (defaultFields_onceToken != -1) {
    dispatch_once(&defaultFields_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)defaultFields_defaultFields;

  return (NSDictionary *)v2;
}

void __35__ASCMetricsActivity_defaultFields__block_invoke()
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v0 = objc_msgSend(MEMORY[0x1E4F28B50], "asc_realMainBundle");
  id v1 = objc_alloc(MEMORY[0x1E4F4DDC8]);
  v2 = [v0 bundleIdentifier];
  v3 = (void *)[v1 initWithBundleIdentifier:v2];

  v4 = [v3 bundleIdentifier];
  if (v4)
  {
    [v7 setObject:v4 forKeyedSubscript:@"hostApp"];
    [v7 setObject:v4 forKeyedSubscript:@"pageContext"];
  }
  uint64_t v5 = [v7 copy];
  v6 = (void *)defaultFields_defaultFields;
  defaultFields_defaultFields = v5;
}

- (ASCMetricsActivity)initWithFields:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCMetricsActivity;
  uint64_t v5 = [(ASCMetricsActivity *)&v10 init];
  if (v5)
  {
    v6 = +[ASCMetricsActivity defaultFields];
    uint64_t v7 = objc_msgSend(v6, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v4, &__block_literal_global_22);
    fields = v5->_fields;
    v5->_fields = (NSDictionary *)v7;
  }
  return v5;
}

id __37__ASCMetricsActivity_initWithFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;

  return v4;
}

- (ASCMetricsActivity)init
{
  return [(ASCMetricsActivity *)self initWithFields:MEMORY[0x1E4F1CC08]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsActivity)initWithCoder:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"fields"];

  if (v9)
  {
    self = [(ASCMetricsActivity *)self initWithFields:v9];
    objc_super v10 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ASCMetricsActivity initWithCoder:]();
    }
    objc_super v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsActivity *)self fields];
  [v4 encodeObject:v5 forKey:@"fields"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCMetricsActivity *)self fields];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCMetricsActivity *)self fields];
    uint64_t v9 = [v7 fields];
    objc_super v10 = (void *)v9;
    if (v8 && v9) {
      char v11 = [v8 isEqual:v9];
    }
    else {
      char v11 = v8 == (void *)v9;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCMetricsActivity *)self fields];
  [(ASCDescriber *)v3 addSensitiveObject:v4 withName:@"fields"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (ASCMetricsActivity)metricsActivityWithValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASCMetricsActivity *)self fields];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  objc_super v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFields:v9];

  return (ASCMetricsActivity *)v10;
}

- (id)metricsActivityByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASCMetricsActivity *)self fields];
  uint64_t v9 = objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6);

  objc_super v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFields:v9];

  return v10;
}

- (id)metricsActivityByRemovingValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsActivity *)self fields];
  id v6 = (void *)[v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFields:v6];

  return v7;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not decode ASCMetricsActivity because fields was missing", v0, 2u);
}

@end