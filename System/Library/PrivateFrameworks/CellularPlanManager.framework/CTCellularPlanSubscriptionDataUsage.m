@interface CTCellularPlanSubscriptionDataUsage
+ (BOOL)supportsSecureCoding;
- (CTCellularPlanSubscriptionDataUsage)initWithCategory:(id)a3 andDataUsed:(double)a4 andDataCapacity:(double)a5;
- (CTCellularPlanSubscriptionDataUsage)initWithCoder:(id)a3;
- (NSString)dataCategory;
- (double)dataCapacity;
- (double)dataUsed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCellularPlanSubscriptionDataUsage

- (CTCellularPlanSubscriptionDataUsage)initWithCategory:(id)a3 andDataUsed:(double)a4 andDataCapacity:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlanSubscriptionDataUsage;
  v10 = [(CTCellularPlanSubscriptionDataUsage *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataCategory, a3);
    v11->_dataUsed = a4;
    v11->_dataCapacity = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(NSString *)self->_dataCategory copy];
  v6 = (void *)[v4 initWithCategory:v5 andDataUsed:(double)(uint64_t)self->_dataUsed andDataCapacity:(double)(uint64_t)self->_dataCapacity];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanSubscriptionDataUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlanSubscriptionDataUsage;
  v5 = [(CTCellularPlanSubscriptionDataUsage *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataUsed"];
    [v6 doubleValue];
    v5->_dataUsed = v7;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataCapacity"];
    [v8 doubleValue];
    v5->_dataCapacity = v9;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataCategory"];
    dataCategory = v5->_dataCategory;
    v5->_dataCategory = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  double dataUsed = self->_dataUsed;
  id v8 = a3;
  v6 = [v4 numberWithDouble:dataUsed];
  [v8 encodeObject:v6 forKey:@"dataUsed"];

  double v7 = [NSNumber numberWithDouble:self->_dataCapacity];
  [v8 encodeObject:v7 forKey:@"dataCapacity"];

  [v8 encodeObject:self->_dataCategory forKey:@"dataCategory"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>\ncategory:%@, (%f bytes / %f bytes) >\n", v5, self, self->_dataCategory, *(void *)&self->_dataUsed, *(void *)&self->_dataCapacity];

  return v6;
}

- (double)dataUsed
{
  return self->_dataUsed;
}

- (double)dataCapacity
{
  return self->_dataCapacity;
}

- (NSString)dataCategory
{
  return self->_dataCategory;
}

- (void).cxx_destruct
{
}

@end