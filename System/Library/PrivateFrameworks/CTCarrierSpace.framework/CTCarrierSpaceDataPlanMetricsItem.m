@interface CTCarrierSpaceDataPlanMetricsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)capacityValid;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpaceDataPlanMetricsItem)init;
- (CTCarrierSpaceDataPlanMetricsItem)initWithCoder:(id)a3;
- (NSNumber)capacityBytes;
- (id)description;
- (int64_t)units;
- (unint64_t)capacity;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setCapacityBytes:(id)a3;
- (void)setCapacityValid:(BOOL)a3;
- (void)setUnits:(int64_t)a3;
@end

@implementation CTCarrierSpaceDataPlanMetricsItem

- (CTCarrierSpaceDataPlanMetricsItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTCarrierSpaceDataPlanMetricsItem;
  v2 = [(CTCarrierSpaceDataPlanMetricsItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    capacityBytes = v2->_capacityBytes;
    v2->_capacityBytes = 0;

    v3->_capacityValid = 0;
    v3->_units = 0;
    v3->_capacity = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceDataPlanMetricsItem *)self capacityBytes];
  [v3 appendFormat:@", capacityBytes=%@", v4];

  [v3 appendFormat:@", capacityValid=%d", -[CTCarrierSpaceDataPlanMetricsItem capacityValid](self, "capacityValid")];
  [v3 appendFormat:@", capacity=%lu %s", -[CTCarrierSpaceDataPlanMetricsItem capacity](self, "capacity"), CTCarrierSpaceDataUnitsAsString(-[CTCarrierSpaceDataPlanMetricsItem units](self, "units"))];
  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCarrierSpaceDataPlanMetricsItem *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTCarrierSpaceDataPlanMetricsItem *)self capacityBytes];
      objc_super v6 = [(CTCarrierSpaceDataPlanMetricsItem *)v4 capacityBytes];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTCarrierSpaceDataPlanMetricsItem *)self capacityBytes];
        v8 = [(CTCarrierSpaceDataPlanMetricsItem *)v4 capacityBytes];
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

- (BOOL)capacityValid
{
  return self->_capacityBytes != 0;
}

- (int64_t)units
{
  return 2;
}

- (unint64_t)capacity
{
  unint64_t result = (unint64_t)self->_capacityBytes;
  if (result) {
    return (unint64_t)CTCarrierSpaceConvertDataUnits(1, 2, (double)(unint64_t)[(id)result unsignedIntegerValue]);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTCarrierSpaceDataPlanMetricsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTCarrierSpaceDataPlanMetricsItem;
  v5 = [(CTCarrierSpaceDataPlanMetricsItem *)&v9 init];
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

- (void)setCapacityValid:(BOOL)a3
{
  self->_capacityValid = a3;
}

- (void)setUnits:(int64_t)a3
{
  self->_units = a3;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void).cxx_destruct
{
}

@end