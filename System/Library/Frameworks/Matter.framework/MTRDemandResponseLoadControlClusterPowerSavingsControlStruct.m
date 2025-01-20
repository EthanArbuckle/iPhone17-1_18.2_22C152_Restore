@interface MTRDemandResponseLoadControlClusterPowerSavingsControlStruct
- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)init;
- (NSNumber)powerSavings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPowerSavings:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterPowerSavingsControlStruct

- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDemandResponseLoadControlClusterPowerSavingsControlStruct;
  v2 = [(MTRDemandResponseLoadControlClusterPowerSavingsControlStruct *)&v6 init];
  v3 = v2;
  if (v2)
  {
    powerSavings = v2->_powerSavings;
    v2->_powerSavings = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterPowerSavingsControlStruct);
  v7 = objc_msgSend_powerSavings(self, v5, v6);
  objc_msgSend_setPowerSavings_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: powerSavings:%@ >", v5, self->_powerSavings);;

  return v7;
}

- (NSNumber)powerSavings
{
  return self->_powerSavings;
}

- (void)setPowerSavings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end