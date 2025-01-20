@interface CTSweetgumPlanGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumPlanGroup)init;
- (CTSweetgumPlanGroup)initWithCoder:(id)a3;
- (NSArray)plans;
- (id)description;
- (int64_t)planCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setPlanCategory:(int64_t)a3;
- (void)setPlans:(id)a3;
@end

@implementation CTSweetgumPlanGroup

- (CTSweetgumPlanGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumPlanGroup;
  v2 = [(CTSweetgumPlanGroup *)&v6 init];
  v3 = v2;
  if (v2)
  {
    plans = v2->_plans;
    v2->_planCategory = 0;
    v2->_plans = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", planCategory=%s", CTSweetgumPlanCategoryAsString(-[CTSweetgumPlanGroup planCategory](self, "planCategory"))];
  v4 = [(CTSweetgumPlanGroup *)self plans];
  [v3 appendFormat:@", plans=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTSweetgumPlanGroup *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(CTSweetgumPlanGroup *)self planCategory],
          v5 == [(CTSweetgumPlanGroup *)v4 planCategory]))
    {
      objc_super v6 = [(CTSweetgumPlanGroup *)self plans];
      v7 = [(CTSweetgumPlanGroup *)v4 plans];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(CTSweetgumPlanGroup *)self plans];
        v9 = [(CTSweetgumPlanGroup *)v4 plans];
        char v10 = [v8 isEqualToArray:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t planCategory = self->_planCategory;
  id v5 = a3;
  [v5 encodeInteger:planCategory forKey:@"planCategory"];
  [v5 encodeObject:self->_plans forKey:@"plans"];
}

- (CTSweetgumPlanGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSweetgumPlanGroup;
  id v5 = [(CTSweetgumPlanGroup *)&v12 init];
  if (v5)
  {
    v5->_int64_t planCategory = [v4 decodeIntegerForKey:@"planCategory"];
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"plans"];
    plans = v5->_plans;
    v5->_plans = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)planCategory
{
  return self->_planCategory;
}

- (void)setPlanCategory:(int64_t)a3
{
  self->_int64_t planCategory = a3;
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
}

- (void).cxx_destruct
{
}

@end