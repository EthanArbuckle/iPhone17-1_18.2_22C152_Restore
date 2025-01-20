@interface CTSweetgumDataPlanMetricsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumDataPlanMetricsItem)init;
- (CTSweetgumDataPlanMetricsItem)initWithCoder:(id)a3;
- (NSNumber)capacityBytes;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacityBytes:(id)a3;
@end

@implementation CTSweetgumDataPlanMetricsItem

- (CTSweetgumDataPlanMetricsItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumDataPlanMetricsItem;
  v2 = [(CTSweetgumDataPlanMetricsItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    capacityBytes = v2->_capacityBytes;
    v2->_capacityBytes = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumDataPlanMetricsItem *)self capacityBytes];
  [v3 appendFormat:@", capacityBytes=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTSweetgumDataPlanMetricsItem *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTSweetgumDataPlanMetricsItem *)self capacityBytes];
      objc_super v6 = [(CTSweetgumDataPlanMetricsItem *)v4 capacityBytes];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTSweetgumDataPlanMetricsItem *)self capacityBytes];
        v8 = [(CTSweetgumDataPlanMetricsItem *)v4 capacityBytes];
        char v9 = [v7 isEqualToNumber:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTSweetgumDataPlanMetricsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSweetgumDataPlanMetricsItem;
  v5 = [(CTSweetgumDataPlanMetricsItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capacityBytes"];
    capacityBytes = v5->_capacityBytes;
    v5->_capacityBytes = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)capacityBytes
{
  return self->_capacityBytes;
}

- (void)setCapacityBytes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end