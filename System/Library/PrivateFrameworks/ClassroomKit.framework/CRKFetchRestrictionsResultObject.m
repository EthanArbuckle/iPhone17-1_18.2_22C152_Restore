@interface CRKFetchRestrictionsResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchRestrictionsResultObject)initWithCoder:(id)a3;
- (NSDictionary)valuesByRestriction;
- (void)encodeWithCoder:(id)a3;
- (void)setValuesByRestriction:(id)a3;
@end

@implementation CRKFetchRestrictionsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchRestrictionsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchRestrictionsResultObject *)self valuesByRestriction];
  [v4 encodeObject:v5 forKey:@"valuesByRestriction"];
}

- (CRKFetchRestrictionsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchRestrictionsResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"valuesByRestriction"];
    valuesByRestriction = v5->_valuesByRestriction;
    v5->_valuesByRestriction = (NSDictionary *)v10;
  }
  return v5;
}

- (NSDictionary)valuesByRestriction
{
  return self->_valuesByRestriction;
}

- (void)setValuesByRestriction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end