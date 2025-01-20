@interface _HKElectrocardiogramVoltageMeasurementEnumerator
- (HKElectrocardiogramVoltageMeasurement)_createMeasurement;
- (_HKElectrocardiogramVoltageMeasurementEnumerator)initWithElectrocardiogram:(id)a3 leadIMicroVoltsBegin:(__wrap_iter<const float *>)a4 end:(__wrap_iter<const float *>)a5;
- (id).cxx_construct;
- (id)nextObject;
@end

@implementation _HKElectrocardiogramVoltageMeasurementEnumerator

- (_HKElectrocardiogramVoltageMeasurementEnumerator)initWithElectrocardiogram:(id)a3 leadIMicroVoltsBegin:(__wrap_iter<const float *>)a4 end:(__wrap_iter<const float *>)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKElectrocardiogramVoltageMeasurementEnumerator;
  v10 = [(_HKElectrocardiogramVoltageMeasurementEnumerator *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_electrocardiogram, a3);
    v12 = [v9 samplingFrequency];
    v13 = +[HKUnit hertzUnit];
    [v12 doubleValueForUnit:v13];
    v11->_samplingHertz = v14;

    uint64_t v15 = +[HKUnit voltUnitWithMetricPrefix:3];
    microvoltsUnit = v11->_microvoltsUnit;
    v11->_microvoltsUnit = (HKUnit *)v15;

    v11->_current = a4;
    v11->_end = a5;
  }

  return v11;
}

- (id)nextObject
{
  if (self->_current.__i_ == self->_end.__i_)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[_HKElectrocardiogramVoltageMeasurementEnumerator _createMeasurement]((uint64_t)self);
    ++self->_index;
    ++self->_current.__i_;
  }

  return v3;
}

- (HKElectrocardiogramVoltageMeasurement)_createMeasurement
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    double v2 = *(double *)(a1 + 16);
    v3 = +[HKQuantity quantityWithUnit:*(void *)(a1 + 24) doubleValue:**(float **)(a1 + 40)];
    v4 = [[HKElectrocardiogramVoltageMeasurement alloc] initWithLeadIVoltage:v3 timeSinceSampleStart:(double)v1 / v2];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microvoltsUnit, 0);

  objc_storeStrong((id *)&self->_electrocardiogram, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end