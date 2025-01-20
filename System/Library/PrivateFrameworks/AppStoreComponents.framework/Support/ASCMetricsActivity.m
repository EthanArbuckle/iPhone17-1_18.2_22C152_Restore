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
  if (qword_1001A6040 != -1) {
    dispatch_once(&qword_1001A6040, &stru_100184198);
  }
  v2 = (void *)qword_1001A6048;

  return (NSDictionary *)v2;
}

- (ASCMetricsActivity)initWithFields:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCMetricsActivity;
  v5 = [(ASCMetricsActivity *)&v10 init];
  if (v5)
  {
    v6 = +[ASCMetricsActivity defaultFields];
    uint64_t v7 = objc_msgSend(v6, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v4, &stru_1001841D8);
    fields = v5->_fields;
    v5->_fields = (NSDictionary *)v7;
  }
  return v5;
}

- (ASCMetricsActivity)init
{
  return [(ASCMetricsActivity *)self initWithFields:&__NSDictionary0__struct];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"fields"];

  if (v8)
  {
    self = [(ASCMetricsActivity *)self initWithFields:v8];
    v9 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013E8E4();
    }
    v9 = 0;
  }

  return v9;
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
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCMetricsActivity *)self fields];
    uint64_t v9 = [v7 fields];
    objc_super v10 = (void *)v9;
    if (v8 && v9) {
      unsigned __int8 v11 = [v8 isEqual:v9];
    }
    else {
      unsigned __int8 v11 = v8 == (void *)v9;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
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
  id v9 = [v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithFields:v9];

  return (ASCMetricsActivity *)v10;
}

- (id)metricsActivityByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASCMetricsActivity *)self fields];
  id v9 = objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6);

  id v10 = [objc_alloc((Class)objc_opt_class()) initWithFields:v9];

  return v10;
}

- (id)metricsActivityByRemovingValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsActivity *)self fields];
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithFields:v6];

  return v7;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
}

@end