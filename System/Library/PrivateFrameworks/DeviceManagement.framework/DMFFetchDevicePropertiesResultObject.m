@interface DMFFetchDevicePropertiesResultObject
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (DMFDevice)device;
- (DMFFetchDevicePropertiesResultObject)initWithCoder:(id)a3;
- (DMFFetchDevicePropertiesResultObject)initWithValuesByPropertyKey:(id)a3 errorsByPropertyKey:(id)a4;
- (NSDictionary)errorsByPropertyKey;
- (NSDictionary)valuesByPropertyKey;
- (id)description;
- (id)valueForPropertyKey:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchDevicePropertiesResultObject

- (DMFFetchDevicePropertiesResultObject)initWithValuesByPropertyKey:(id)a3 errorsByPropertyKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMFFetchDevicePropertiesResultObject;
  v8 = [(CATTaskResultObject *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    valuesByPropertyKey = v8->_valuesByPropertyKey;
    v8->_valuesByPropertyKey = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    errorsByPropertyKey = v8->_errorsByPropertyKey;
    v8->_errorsByPropertyKey = (NSDictionary *)v11;
  }
  return v8;
}

- (id)valueForPropertyKey:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    id v7 = [(DMFFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
    v8 = [v7 objectForKeyedSubscript:v6];
    if (v8)
    {
    }
    else
    {
      uint64_t v9 = [(DMFFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
      v10 = [v9 objectForKeyedSubscript:v6];

      if (!v10)
      {
        v16 = @"propertyKey";
        v17[0] = v6;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        v12 = DMFErrorWithCodeAndUserInfo(111, (uint64_t)v11);
        goto LABEL_6;
      }
    }
    uint64_t v11 = [(DMFFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
    v12 = [v11 valueForKey:v6];
LABEL_6:
    *a4 = v12;
  }
  v13 = [(DMFFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
  objc_super v14 = [v13 valueForKey:v6];

  return v14;
}

- (DMFDevice)device
{
  id v3 = [[DMFDevice alloc] initPrivate];
  v4 = [(DMFFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
  [v3 setValuesForKeysWithDictionary:v4];

  v5 = [(DMFFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
  [v3 setErrorsForKeys:v5];

  return (DMFDevice *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (DMFFetchDevicePropertiesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DMFFetchDevicePropertiesResultObject;
  v5 = [(CATTaskResultObject *)&v35 initWithCoder:v4];
  if (v5)
  {
    v33 = (void *)MEMORY[0x1E4F1CAD0];
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
    objc_super v14 = objc_msgSend(v33, "setWithObjects:", v31, v29, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"valuesByPropertyKey"];
    valuesByPropertyKey = v5->_valuesByPropertyKey;
    v5->_valuesByPropertyKey = (NSDictionary *)v15;

    v34 = (void *)MEMORY[0x1E4F1CAD0];
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
  v7.super_class = (Class)DMFFetchDevicePropertiesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(DMFFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
  [v4 encodeObject:v5 forKey:@"valuesByPropertyKey"];

  uint64_t v6 = [(DMFFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
  [v4 encodeObject:v6 forKey:@"errorsByPropertyKey"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(DMFFetchDevicePropertiesResultObject *)self errorsByPropertyKey];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(DMFFetchDevicePropertiesResultObject *)self valuesByPropertyKey];
  [v5 addEntriesFromDictionary:v6];

  objc_super v7 = [NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, v5];

  return v7;
}

- (NSDictionary)valuesByPropertyKey
{
  return self->_valuesByPropertyKey;
}

- (NSDictionary)errorsByPropertyKey
{
  return self->_errorsByPropertyKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByPropertyKey, 0);
  objc_storeStrong((id *)&self->_valuesByPropertyKey, 0);
}

@end