@interface DMFFetchSecurityInformationResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchSecurityInformationResultObject)initWithCoder:(id)a3;
- (DMFFetchSecurityInformationResultObject)initWithSecurityInformation:(id)a3;
- (DMFFetchSecurityInformationResultObject)initWithValuesByPropertyKey:(id)a3 errorsByPropertyKey:(id)a4;
- (DMFSecurityInformation)securityInformation;
- (NSDictionary)errorsByPropertyKey;
- (NSDictionary)valuesByPropertyKey;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchSecurityInformationResultObject

- (DMFFetchSecurityInformationResultObject)initWithSecurityInformation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchSecurityInformationResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    securityInformation = v5->_securityInformation;
    v5->_securityInformation = (DMFSecurityInformation *)v6;
  }
  return v5;
}

- (DMFFetchSecurityInformationResultObject)initWithValuesByPropertyKey:(id)a3 errorsByPropertyKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMFFetchSecurityInformationResultObject;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchSecurityInformationResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DMFFetchSecurityInformationResultObject;
  v5 = [(CATTaskResultObject *)&v38 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"securityInformation"];
    securityInformation = v5->_securityInformation;
    v5->_securityInformation = (DMFSecurityInformation *)v7;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v36, "setWithObjects:", v34, v32, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"valuesByPropertyKey"];
    valuesByPropertyKey = v5->_valuesByPropertyKey;
    v5->_valuesByPropertyKey = (NSDictionary *)v18;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v37, "setWithObjects:", v35, v33, v20, v21, v22, v23, v24, v25, v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"errorsByPropertyKey"];
    errorsByPropertyKey = v5->_errorsByPropertyKey;
    v5->_errorsByPropertyKey = (NSDictionary *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFFetchSecurityInformationResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v8 encodeWithCoder:v4];
  v5 = [(DMFFetchSecurityInformationResultObject *)self securityInformation];
  [v4 encodeObject:v5 forKey:@"securityInformation"];

  id v6 = [(DMFFetchSecurityInformationResultObject *)self valuesByPropertyKey];
  [v4 encodeObject:v6 forKey:@"valuesByPropertyKey"];

  uint64_t v7 = [(DMFFetchSecurityInformationResultObject *)self errorsByPropertyKey];
  [v4 encodeObject:v7 forKey:@"errorsByPropertyKey"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(DMFFetchSecurityInformationResultObject *)self errorsByPropertyKey];
  v5 = [v3 dictionaryWithDictionary:v4];

  id v6 = [(DMFFetchSecurityInformationResultObject *)self valuesByPropertyKey];
  [v5 addEntriesFromDictionary:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(DMFFetchSecurityInformationResultObject *)self securityInformation];
  uint64_t v10 = [v9 description];
  uint64_t v11 = [v7 stringWithFormat:@"<%@: %p %@ %@>", v8, self, v10, v5];

  return v11;
}

- (DMFSecurityInformation)securityInformation
{
  return self->_securityInformation;
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
  objc_storeStrong((id *)&self->_securityInformation, 0);
}

@end