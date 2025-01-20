@interface ASCMetricsData
+ (BOOL)supportsSecureCoding;
- (ASCMetricsData)initWithCoder:(id)a3;
- (ASCMetricsData)initWithTopic:(id)a3 shouldFlush:(BOOL)a4 fields:(id)a5 includingFields:(id)a6 excludingFields:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFlush;
- (NSDictionary)fields;
- (NSSet)excludingFields;
- (NSSet)includingFields;
- (NSString)topic;
- (id)description;
- (id)metricsDataByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCMetricsData

- (ASCMetricsData)initWithTopic:(id)a3 shouldFlush:(BOOL)a4 fields:(id)a5 includingFields:(id)a6 excludingFields:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  sub_10000F3C4();
  v26.receiver = self;
  v26.super_class = (Class)ASCMetricsData;
  v16 = [(ASCMetricsData *)&v26 init];
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    topic = v16->_topic;
    v16->_topic = v17;

    v16->_shouldFlush = a4;
    v19 = (NSDictionary *)[v13 copy];
    fields = v16->_fields;
    v16->_fields = v19;

    v21 = (NSSet *)[v14 copy];
    includingFields = v16->_includingFields;
    v16->_includingFields = v21;

    v23 = (NSSet *)[v15 copy];
    excludingFields = v16->_excludingFields;
    v16->_excludingFields = v23;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  id v6 = [v4 decodeBoolForKey:@"shouldFlush"];
  v7 = sub_10001B938(v4, @"fields");
  if (v7)
  {
    id v8 = objc_alloc((Class)NSSet);
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"includingFields"];
    if (v11)
    {
      id v12 = [v4 decodeObjectOfClasses:v10 forKey:@"excludingFields"];
      if (v12)
      {
        self = [(ASCMetricsData *)self initWithTopic:v5 shouldFlush:v6 fields:v7 includingFields:v11 excludingFields:v12];
        id v13 = self;
      }
      else
      {
        BOOL v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v30) {
          sub_10013E9A4(v30, v31, v32, v33, v34, v35, v36, v37);
        }
        id v13 = 0;
      }
    }
    else
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22) {
        sub_10013E968(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      id v13 = 0;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_10013E92C(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    id v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCMetricsData *)self topic];
  [v4 encodeObject:v5 forKey:@"topic"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCMetricsData shouldFlush](self, "shouldFlush"), @"shouldFlush");
  id v6 = [(ASCMetricsData *)self fields];
  [v4 encodeObject:v6 forKey:@"fields"];

  v7 = [(ASCMetricsData *)self includingFields];
  [v4 encodeObject:v7 forKey:@"includingFields"];

  id v8 = [(ASCMetricsData *)self excludingFields];
  [v4 encodeObject:v8 forKey:@"excludingFields"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCMetricsData *)self topic];
  [(ASCHasher *)v3 combineObject:v4];

  [(ASCHasher *)v3 combineBool:[(ASCMetricsData *)self shouldFlush]];
  v5 = [(ASCMetricsData *)self fields];
  [(ASCHasher *)v3 combineObject:v5];

  id v6 = [(ASCMetricsData *)self includingFields];
  [(ASCHasher *)v3 combineObject:v6];

  v7 = [(ASCMetricsData *)self excludingFields];
  [(ASCHasher *)v3 combineObject:v7];

  unint64_t v8 = [(ASCHasher *)v3 finalizeHash];
  return v8;
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
    unint64_t v8 = [(ASCMetricsData *)self topic];
    uint64_t v9 = [v7 topic];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      if (![v8 isEqual:v9]) {
        goto LABEL_14;
      }
    }
    else if (v8 != (void *)v9)
    {
LABEL_14:
      unsigned __int8 v11 = 0;
LABEL_32:

      goto LABEL_33;
    }
    unsigned int v12 = [(ASCMetricsData *)self shouldFlush];
    if (v12 != [v7 shouldFlush]) {
      goto LABEL_14;
    }
    id v13 = [(ASCMetricsData *)self fields];
    uint64_t v14 = [v7 fields];
    uint64_t v15 = (void *)v14;
    if (v13 && v14)
    {
      if ([v13 isEqual:v14])
      {
LABEL_18:
        uint64_t v16 = [(ASCMetricsData *)self includingFields];
        uint64_t v17 = [v7 includingFields];
        uint64_t v18 = (void *)v17;
        if (v16 && v17)
        {
          if ([v16 isEqual:v17]) {
            goto LABEL_21;
          }
        }
        else if (v16 == (void *)v17)
        {
LABEL_21:
          uint64_t v19 = [(ASCMetricsData *)self excludingFields];
          uint64_t v20 = [v7 excludingFields];
          uint64_t v21 = (void *)v20;
          uint64_t v23 = v19;
          if (v19 && v20) {
            unsigned __int8 v11 = [v19 isEqual:v20];
          }
          else {
            unsigned __int8 v11 = v19 == (void *)v20;
          }

          goto LABEL_30;
        }
        unsigned __int8 v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    else if (v13 == (void *)v14)
    {
      goto LABEL_18;
    }
    unsigned __int8 v11 = 0;
LABEL_31:

    goto LABEL_32;
  }
  unsigned __int8 v11 = 0;
LABEL_33:

  return v11;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCMetricsData *)self topic];
  [(ASCDescriber *)v3 addObject:v4 withName:@"topic"];

  [(ASCDescriber *)v3 addBool:[(ASCMetricsData *)self shouldFlush] withName:@"shouldFlush"];
  id v5 = [(ASCMetricsData *)self fields];
  [(ASCDescriber *)v3 addSensitiveObject:v5 withName:@"fields"];

  id v6 = [(ASCMetricsData *)self includingFields];
  [(ASCDescriber *)v3 addSensitiveObject:v6 withName:@"includingFields"];

  id v7 = [(ASCMetricsData *)self excludingFields];
  [(ASCDescriber *)v3 addSensitiveObject:v7 withName:@"excludingFields"];

  unint64_t v8 = [(ASCDescriber *)v3 finalizeDescription];

  return v8;
}

- (id)metricsDataByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(ASCMetricsData *)self fields];
  uint64_t v9 = objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6);

  id v10 = [ASCMetricsData alloc];
  unsigned __int8 v11 = [(ASCMetricsData *)self topic];
  BOOL v12 = [(ASCMetricsData *)self shouldFlush];
  id v13 = [(ASCMetricsData *)self includingFields];
  uint64_t v14 = [(ASCMetricsData *)self excludingFields];
  uint64_t v15 = [(ASCMetricsData *)v10 initWithTopic:v11 shouldFlush:v12 fields:v9 includingFields:v13 excludingFields:v14];

  return v15;
}

- (NSString)topic
{
  return self->_topic;
}

- (BOOL)shouldFlush
{
  return self->_shouldFlush;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (NSSet)includingFields
{
  return self->_includingFields;
}

- (NSSet)excludingFields
{
  return self->_excludingFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludingFields, 0);
  objc_storeStrong((id *)&self->_includingFields, 0);
  objc_storeStrong((id *)&self->_fields, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end