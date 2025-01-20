@interface HKQuantityWrapper
- (HKQuantity)quantity;
- (HKQuantityWrapper)initWithQuantity:(id)a3 dateInterval:(id)a4;
- (NSDateInterval)dateInterval;
- (void)setDateInterval:(id)a3;
- (void)setQuantity:(id)a3;
@end

@implementation HKQuantityWrapper

- (HKQuantityWrapper)initWithQuantity:(id)a3 dateInterval:(id)a4
{
  v6 = (HKQuantity *)a3;
  v7 = (NSDateInterval *)a4;
  v13.receiver = self;
  v13.super_class = (Class)HKQuantityWrapper;
  v8 = [(HKQuantityWrapper *)&v13 init];
  quantity = v8->_quantity;
  v8->_quantity = v6;
  v10 = v6;

  dateInterval = v8->_dateInterval;
  v8->_dateInterval = v7;

  return v8;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end