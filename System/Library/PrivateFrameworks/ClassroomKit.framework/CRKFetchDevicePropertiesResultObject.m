@interface CRKFetchDevicePropertiesResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchDevicePropertiesResultObject)initWithCoder:(id)a3;
- (NSDictionary)errorsByPropertyKey;
- (NSDictionary)valuesByPropertyKey;
- (id)description;
- (id)valueForPropertyKey:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorsByPropertyKey:(id)a3;
- (void)setValuesByPropertyKey:(id)a3;
@end

@implementation CRKFetchDevicePropertiesResultObject

- (id)valueForPropertyKey:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    v7 = [(CRKFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
    v8 = [v7 valueForKey:v6];

    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      v10 = [(CRKFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
      v11 = [v10 objectForKeyedSubscript:v6];
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        v16 = @"kCRKPropertyNameErrorKey";
        v17[0] = v6;
        v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
        CRKErrorWithCodeAndUserInfo(37, v14);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a4) {
        *a4 = v13;
      }
    }
  }
  else if (a4)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_26D819F10);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchDevicePropertiesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CRKFetchDevicePropertiesResultObject;
  v5 = [(CATTaskResultObject *)&v35 initWithCoder:v4];
  if (v5)
  {
    v33 = (void *)MEMORY[0x263EFFA08];
    uint64_t v31 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v33, "setWithObjects:", v31, v29, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"valuesByPropertyKey"];
    valuesByPropertyKey = v5->_valuesByPropertyKey;
    v5->_valuesByPropertyKey = (NSDictionary *)v15;

    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v34, "setWithObjects:", v32, v30, v17, v18, v19, v20, v21, v22, v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"errorsByPropertyKey"];
    errorsByPropertyKey = v5->_errorsByPropertyKey;
    v5->_errorsByPropertyKey = (NSDictionary *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchDevicePropertiesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
  [v4 encodeObject:v5 forKey:@"valuesByPropertyKey"];

  uint64_t v6 = [(CRKFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
  [v4 encodeObject:v6 forKey:@"errorsByPropertyKey"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(CRKFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(CRKFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
  [v5 addEntriesFromDictionary:v6];

  objc_super v7 = [NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, v5];

  return v7;
}

- (NSDictionary)valuesByPropertyKey
{
  return self->_valuesByPropertyKey;
}

- (void)setValuesByPropertyKey:(id)a3
{
}

- (NSDictionary)errorsByPropertyKey
{
  return self->_errorsByPropertyKey;
}

- (void)setErrorsByPropertyKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByPropertyKey, 0);

  objc_storeStrong((id *)&self->_valuesByPropertyKey, 0);
}

@end