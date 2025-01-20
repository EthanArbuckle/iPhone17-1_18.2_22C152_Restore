@interface _HDWorkoutStatistics
- (HKQuantity)max;
- (HKQuantity)min;
- (HKQuantity)quantity;
- (HKQuantityType)quantityType;
- (_HDWorkoutStatistics)initWithQuantityType:(id)a3 quantity:(id)a4 min:(id)a5 max:(id)a6;
@end

@implementation _HDWorkoutStatistics

- (_HDWorkoutStatistics)initWithQuantityType:(id)a3 quantity:(id)a4 min:(id)a5 max:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_HDWorkoutStatistics;
  v15 = [(_HDWorkoutStatistics *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_quantityType, a3);
    objc_storeStrong((id *)&v16->_quantity, a4);
    objc_storeStrong((id *)&v16->_min, a5);
    objc_storeStrong((id *)&v16->_max, a6);
  }

  return v16;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (HKQuantity)min
{
  return self->_min;
}

- (HKQuantity)max
{
  return self->_max;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
  objc_storeStrong((id *)&self->_quantity, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end