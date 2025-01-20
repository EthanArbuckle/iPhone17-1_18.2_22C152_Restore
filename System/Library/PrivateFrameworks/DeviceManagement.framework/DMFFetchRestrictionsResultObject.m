@interface DMFFetchRestrictionsResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchRestrictionsResultObject)initWithCoder:(id)a3;
- (DMFFetchRestrictionsResultObject)initWithRestrictions:(id)a3;
- (NSDictionary)globalRestrictions;
- (NSDictionary)profileRestrictions;
- (NSDictionary)restrictions;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchRestrictionsResultObject

- (DMFFetchRestrictionsResultObject)initWithRestrictions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchRestrictionsResultObject;
  v5 = [(CATTaskResultObject *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    globalRestrictions = v5->_globalRestrictions;
    v5->_globalRestrictions = (NSDictionary *)v6;

    uint64_t v8 = [v4 copy];
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSDictionary *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchRestrictionsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DMFFetchRestrictionsResultObject;
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
    v14 = objc_msgSend(v33, "setWithObjects:", v31, v29, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"globalRestrictions"];
    globalRestrictions = v5->_globalRestrictions;
    v5->_globalRestrictions = (NSDictionary *)v15;

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
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"restrictions"];
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSDictionary *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFFetchRestrictionsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(DMFFetchRestrictionsResultObject *)self globalRestrictions];
  [v4 encodeObject:v5 forKey:@"globalRestrictions"];

  uint64_t v6 = [(DMFFetchRestrictionsResultObject *)self restrictions];
  [v4 encodeObject:v6 forKey:@"restrictions"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DMFFetchRestrictionsResultObject *)self restrictions];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (NSDictionary)restrictions
{
  return self->_restrictions;
}

- (NSDictionary)globalRestrictions
{
  return self->_globalRestrictions;
}

- (NSDictionary)profileRestrictions
{
  return self->_profileRestrictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileRestrictions, 0);
  objc_storeStrong((id *)&self->_globalRestrictions, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
}

@end