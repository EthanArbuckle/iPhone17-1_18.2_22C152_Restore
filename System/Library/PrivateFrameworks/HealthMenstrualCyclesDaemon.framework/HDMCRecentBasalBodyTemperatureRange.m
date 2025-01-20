@interface HDMCRecentBasalBodyTemperatureRange
- (BOOL)isEqual:(id)a3;
- (HKQuantity)lowerQuantile;
- (HKQuantity)median;
- (HKQuantity)upperQuantile;
- (id)_initWithUpperQuantileValue:(double)a3 medianValue:(double)a4 lowerQuantileValue:(double)a5 unit:(id)a6;
- (id)description;
- (id)recentBasalBodyTemperatureWithMostRecentQuantity:(id)a3;
- (unint64_t)hash;
- (void)initWithUpperQuantileQuantity:(void *)a3 medianQuantity:(void *)a4 lowerQuantileQuantity:;
@end

@implementation HDMCRecentBasalBodyTemperatureRange

- (id)_initWithUpperQuantileValue:(double)a3 medianValue:(double)a4 lowerQuantileValue:(double)a5 unit:(id)a6
{
  id v10 = a6;
  v11 = [MEMORY[0x263F0A630] quantityWithUnit:v10 doubleValue:a3];
  v12 = [MEMORY[0x263F0A630] quantityWithUnit:v10 doubleValue:a4];
  v13 = [MEMORY[0x263F0A630] quantityWithUnit:v10 doubleValue:a5];
  v14 = -[HDMCRecentBasalBodyTemperatureRange initWithUpperQuantileQuantity:medianQuantity:lowerQuantileQuantity:](self, v11, v12, v13);

  return v14;
}

- (void)initWithUpperQuantileQuantity:(void *)a3 medianQuantity:(void *)a4 lowerQuantileQuantity:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HDMCRecentBasalBodyTemperatureRange;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v10 = [v7 copy];
      v11 = (void *)a1[1];
      a1[1] = v10;

      uint64_t v12 = [v8 copy];
      v13 = (void *)a1[2];
      a1[2] = v12;

      uint64_t v14 = [v9 copy];
      v15 = (void *)a1[3];
      a1[3] = v14;
    }
  }

  return a1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %@,%@,%@>", objc_opt_class(), self->_lowerQuantile, self->_median, self->_upperQuantile];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDMCRecentBasalBodyTemperatureRange;
  if (![(HDMCRecentBasalBodyTemperatureRange *)&v14 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = 0;
      goto LABEL_16;
    }
    v6 = v4;
    upperQuantile = self->_upperQuantile;
    id v8 = (HKQuantity *)v6[1];
    if (upperQuantile != v8 && (!v8 || !-[HKQuantity isEqual:](upperQuantile, "isEqual:"))) {
      goto LABEL_14;
    }
    median = self->_median;
    uint64_t v10 = (HKQuantity *)v6[2];
    if (median != v10 && (!v10 || !-[HKQuantity isEqual:](median, "isEqual:"))) {
      goto LABEL_14;
    }
    lowerQuantile = self->_lowerQuantile;
    uint64_t v12 = (HKQuantity *)v6[3];
    if (lowerQuantile == v12)
    {
      char v5 = 1;
      goto LABEL_15;
    }
    if (v12) {
      char v5 = -[HKQuantity isEqual:](lowerQuantile, "isEqual:");
    }
    else {
LABEL_14:
    }
      char v5 = 0;
LABEL_15:

    goto LABEL_16;
  }
  char v5 = 1;
LABEL_16:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKQuantity *)self->_upperQuantile hash];
  uint64_t v4 = [(HKQuantity *)self->_median hash] ^ v3;
  return v4 ^ [(HKQuantity *)self->_lowerQuantile hash];
}

- (id)recentBasalBodyTemperatureWithMostRecentQuantity:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc(MEMORY[0x263F451C8]) initWithMostRecent:v4 upperQuantile:self->_upperQuantile median:self->_median lowerQuantile:self->_lowerQuantile];

  return v5;
}

- (HKQuantity)upperQuantile
{
  return self->_upperQuantile;
}

- (HKQuantity)median
{
  return self->_median;
}

- (HKQuantity)lowerQuantile
{
  return self->_lowerQuantile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerQuantile, 0);
  objc_storeStrong((id *)&self->_median, 0);
  objc_storeStrong((id *)&self->_upperQuantile, 0);
}

@end