@interface HDPassiveQuantityDataAggregator
- (Class)sensorDatumClass;
- (HKQuantityType)quantityType;
- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4;
- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4;
- (id)objectType;
@end

@implementation HDPassiveQuantityDataAggregator

- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDPassiveQuantityDataAggregator.m", 27, @"Invalid parameter not satisfying: %@", @"[quantityType isKindOfClass:[HKQuantityType class]]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HDPassiveQuantityDataAggregator;
  v10 = [(HDDataAggregator *)&v14 initWithDataCollectionManager:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_quantityType, a3);
  }

  return v11;
}

- (id)objectType
{
  return self->_quantityType;
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F2B388];
  quantityType = self->_quantityType;
  id v6 = a3;
  v7 = [v6 quantity];
  id v8 = [v6 dateInterval];
  id v9 = [v8 startDate];
  v10 = [v6 dateInterval];
  v11 = [v10 endDate];
  v12 = [v6 metadata];

  v13 = [v4 quantitySampleWithType:quantityType quantity:v7 startDate:v9 endDate:v11 metadata:v12];

  v16[0] = v13;
  objc_super v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  return v14;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
}

@end