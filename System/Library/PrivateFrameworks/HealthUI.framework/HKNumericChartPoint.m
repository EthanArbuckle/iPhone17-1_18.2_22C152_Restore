@interface HKNumericChartPoint
- (HKNumericChartPoint)initWithXValue:(id)a3 yValue:(id)a4 userInfo:(id)a5;
- (id)allYValues;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
@end

@implementation HKNumericChartPoint

- (HKNumericChartPoint)initWithXValue:(id)a3 yValue:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKNumericChartPoint;
  v12 = [(HKNumericChartPoint *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_xValue, a3);
    objc_storeStrong(&v13->_yValue, a4);
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)yValue
{
  return self->_yValue;
}

- (id)allYValues
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_yValue)
  {
    v4[0] = self->_yValue;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong(&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end