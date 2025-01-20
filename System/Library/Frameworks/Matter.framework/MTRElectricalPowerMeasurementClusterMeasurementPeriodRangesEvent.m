@interface MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent
- (MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent)init;
- (NSArray)ranges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setRanges:(id)a3;
@end

@implementation MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent

- (MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent;
  v4 = [(MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    ranges = v4->_ranges;
    v4->_ranges = (NSArray *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent);
  v7 = objc_msgSend_ranges(self, v5, v6);
  objc_msgSend_setRanges_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: ranges:%@ >", v5, self->_ranges);;

  return v7;
}

- (NSArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
}

- (void).cxx_destruct
{
}

@end