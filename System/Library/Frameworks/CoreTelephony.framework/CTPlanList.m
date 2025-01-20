@interface CTPlanList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlanList)initWithCoder:(id)a3;
- (CTPlanList)initWithPlans:(id)a3;
- (NSArray)plans;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTPlanList

- (CTPlanList)initWithPlans:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTPlanList;
  v6 = [(CTPlanList *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plans, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", plans=%@", self->_plans];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPlanList *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CTPlanList *)self plans];
      v6 = [(CTPlanList *)v4 plans];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTPlanList *)self plans];
        v8 = [(CTPlanList *)v4 plans];
        char v9 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTPlanList;
  id v5 = [(CTPlanList *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"plans"];
    plans = v5->_plans;
    v5->_plans = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)plans
{
  return self->_plans;
}

- (void).cxx_destruct
{
}

@end