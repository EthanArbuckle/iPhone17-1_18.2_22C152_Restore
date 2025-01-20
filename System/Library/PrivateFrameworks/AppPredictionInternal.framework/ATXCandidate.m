@interface ATXCandidate
+ (BOOL)supportsSecureCoding;
- (ATXCandidate)initWithBiomeStoreData:(id)a3;
- (ATXCandidate)initWithCoder:(id)a3;
- (BMStoreData)biomeStoreData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCandidate:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXCandidate

- (ATXCandidate)initWithBiomeStoreData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidate;
  v6 = [(ATXCandidate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_biomeStoreData, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXCandidate *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCandidate *)self isEqualToATXCandidate:v5];

  return v6;
}

- (BOOL)isEqualToATXCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXCandidate *)self identifier];
  BOOL v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(ATXCandidate *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  biomeStoreData = self->_biomeStoreData;
  id v5 = a3;
  BOOL v6 = [(BMStoreData *)biomeStoreData serialize];
  [v5 encodeObject:v6 forKey:@"biomeStoreData"];

  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 encodeObject:v8 forKey:@"biomeStoreDataClassName"];

  objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMStoreData dataVersion](self->_biomeStoreData, "dataVersion"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v9 forKey:@"biomeStoreDataDataVersion"];
}

- (ATXCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_relevance_model();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"biomeStoreData" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXCandidate" errorCode:-1 logHandle:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    v11 = __atxlog_handle_relevance_model();
    v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"biomeStoreDataClassName" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXCandidate" errorCode:-1 logHandle:v11];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v14 = objc_opt_class();
      v15 = __atxlog_handle_relevance_model();
      v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"biomeStoreDataDataVersion" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXCandidate" errorCode:-1 logHandle:v15];

      if (v16)
      {
        v17 = (ATXCandidate *)NSClassFromString(v12);
        if (v17)
        {
          v18 = -[ATXCandidate eventWithData:dataVersion:](v17, "eventWithData:dataVersion:", v8, [v16 unsignedIntValue]);
          if (v18)
          {
            self = [(ATXCandidate *)self initWithBiomeStoreData:v18];
            v17 = self;
          }
          else
          {
            v17 = 0;
          }
        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BMStoreData)biomeStoreData
{
  return self->_biomeStoreData;
}

- (void).cxx_destruct
{
}

@end