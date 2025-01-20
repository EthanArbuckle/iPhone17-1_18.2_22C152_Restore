@interface _HKBloodPressureCoordinate
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKMinMaxCoordinate)diastolicCoordinate;
- (HKMinMaxCoordinate)systolicCoordinate;
- (NSString)description;
- (_HKBloodPressureCoordinate)initWithSystolicCoordinate:(id)a3 diastolicCoordinate:(id)a4 userInfo:(id)a5;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation _HKBloodPressureCoordinate

- (_HKBloodPressureCoordinate)initWithSystolicCoordinate:(id)a3 diastolicCoordinate:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKBloodPressureCoordinate;
  v12 = [(_HKBloodPressureCoordinate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_systolicCoordinate, a3);
    objc_storeStrong((id *)&v13->_diastolicCoordinate, a4);
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  BOOL v4 = a4;
  systolicCoordinate = self->_systolicCoordinate;
  long long v8 = *(_OWORD *)&a3->c;
  long long v15 = *(_OWORD *)&a3->a;
  long long v16 = v8;
  long long v17 = *(_OWORD *)&a3->tx;
  id v9 = -[HKMinMaxCoordinate copyWithTransform:roundToViewScale:](systolicCoordinate, "copyWithTransform:roundToViewScale:", &v15);
  diastolicCoordinate = self->_diastolicCoordinate;
  long long v11 = *(_OWORD *)&a3->c;
  long long v15 = *(_OWORD *)&a3->a;
  long long v16 = v11;
  long long v17 = *(_OWORD *)&a3->tx;
  id v12 = [(HKMinMaxCoordinate *)diastolicCoordinate copyWithTransform:&v15 roundToViewScale:v4];
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSystolicCoordinate:v9 diastolicCoordinate:v12 userInfo:self->_userInfo];

  return v13;
}

- (double)startXValue
{
  systolicCoordinate = self->_systolicCoordinate;
  if (!systolicCoordinate) {
    systolicCoordinate = self->_diastolicCoordinate;
  }
  [(HKMinMaxCoordinate *)systolicCoordinate startXValue];
  return result;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_HKBloodPressureCoordinate;
  BOOL v4 = [(_HKBloodPressureCoordinate *)&v7 description];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"%@ { systolic(%@), diastolic(%@} }"), v4, self->_systolicCoordinate, self->_diastolicCoordinate;

  return (NSString *)v5;
}

- (HKMinMaxCoordinate)systolicCoordinate
{
  return self->_systolicCoordinate;
}

- (HKMinMaxCoordinate)diastolicCoordinate
{
  return self->_diastolicCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicCoordinate, 0);
  objc_storeStrong((id *)&self->_systolicCoordinate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end