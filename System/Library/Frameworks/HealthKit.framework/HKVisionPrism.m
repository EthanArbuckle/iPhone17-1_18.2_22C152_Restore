@interface HKVisionPrism
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKPrismBase)horizontalBase;
- (HKPrismBase)verticalBase;
- (HKQuantity)amount;
- (HKQuantity)angle;
- (HKQuantity)horizontalAmount;
- (HKQuantity)verticalAmount;
- (HKVisionEye)eye;
- (HKVisionPrism)initWithAmount:(HKQuantity *)amount angle:(HKQuantity *)angle eye:(HKVisionEye)eye;
- (HKVisionPrism)initWithCoder:(id)a3;
- (HKVisionPrism)initWithVerticalAmount:(HKQuantity *)verticalAmount verticalBase:(HKPrismBase)verticalBase horizontalAmount:(HKQuantity *)horizontalAmount horizontalBase:(HKPrismBase)horizontalBase eye:(HKVisionEye)eye;
- (id)description;
- (void)_setPolarValues;
- (void)_setRectangularValues;
- (void)_validatePolar;
- (void)_validateRectangular;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKVisionPrism

- (HKVisionPrism)initWithAmount:(HKQuantity *)amount angle:(HKQuantity *)angle eye:(HKVisionEye)eye
{
  v8 = amount;
  v9 = angle;
  v16.receiver = self;
  v16.super_class = (Class)HKVisionPrism;
  v10 = [(HKVisionPrism *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [(HKQuantity *)v8 copy];
    v12 = v10->_amount;
    v10->_amount = (HKQuantity *)v11;

    uint64_t v13 = [(HKQuantity *)v9 copy];
    v14 = v10->_angle;
    v10->_angle = (HKQuantity *)v13;

    v10->_eye = eye;
    [(HKVisionPrism *)v10 _validatePolar];
    [(HKVisionPrism *)v10 _setRectangularValues];
  }

  return v10;
}

- (HKVisionPrism)initWithVerticalAmount:(HKQuantity *)verticalAmount verticalBase:(HKPrismBase)verticalBase horizontalAmount:(HKQuantity *)horizontalAmount horizontalBase:(HKPrismBase)horizontalBase eye:(HKVisionEye)eye
{
  v12 = verticalAmount;
  uint64_t v13 = horizontalAmount;
  v20.receiver = self;
  v20.super_class = (Class)HKVisionPrism;
  v14 = [(HKVisionPrism *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [(HKQuantity *)v12 copy];
    objc_super v16 = v14->_verticalAmount;
    v14->_verticalAmount = (HKQuantity *)v15;

    v14->_verticalBase = verticalBase;
    uint64_t v17 = [(HKQuantity *)v13 copy];
    v18 = v14->_horizontalAmount;
    v14->_horizontalAmount = (HKQuantity *)v17;

    v14->_horizontalBase = horizontalBase;
    v14->_eye = eye;
    [(HKVisionPrism *)v14 _validateRectangular];
    [(HKVisionPrism *)v14 _setPolarValues];
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p Amount=%@, Angle=%@>", v5, self, self->_amount, self->_angle];

  return v6;
}

- (void)_validatePolar
{
  amount = self->_amount;
  v4 = +[HKUnit prismDiopterUnit];
  LOBYTE(amount) = [(HKQuantity *)amount isCompatibleWithUnit:v4];

  v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if ((amount & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Prism amount must be an prism diopter quantity"];
  }
  angle = self->_angle;
  v7 = +[HKUnit radianAngleUnit];
  LOBYTE(angle) = [(HKQuantity *)angle isCompatibleWithUnit:v7];

  if ((angle & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *v5;
    [v8 raise:v9 format:@"Prism angle must be an Angle quantity"];
  }
}

- (void)_validateRectangular
{
  verticalAmount = self->_verticalAmount;
  v4 = +[HKUnit prismDiopterUnit];
  LOBYTE(verticalAmount) = [(HKQuantity *)verticalAmount isCompatibleWithUnit:v4];

  v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if ((verticalAmount & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Vertical amount must be an prism diopter quantity"];
  }
  horizontalAmount = self->_horizontalAmount;
  v7 = +[HKUnit prismDiopterUnit];
  LOBYTE(horizontalAmount) = [(HKQuantity *)horizontalAmount isCompatibleWithUnit:v7];

  if ((horizontalAmount & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *v5;
    [v8 raise:v9 format:@"Horizontal amount must be an prism diopter quantity"];
  }
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKVisionPrism *)a3;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      amount = self->_amount;
      uint64_t v9 = [(HKVisionPrism *)v7 amount];
      if (amount == v9) {
        goto LABEL_9;
      }
      uint64_t v10 = [(HKVisionPrism *)v7 amount];
      if (!v10)
      {
        char v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_amount;
      v4 = [(HKVisionPrism *)v7 amount];
      if ([(HKQuantity *)v11 isEqual:v4])
      {
LABEL_9:
        angle = self->_angle;
        uint64_t v14 = [(HKVisionPrism *)v7 angle];
        if (angle == (HKQuantity *)v14)
        {

          char v12 = 1;
        }
        else
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = [(HKVisionPrism *)v7 angle];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            v18 = self->_angle;
            v19 = [(HKVisionPrism *)v7 angle];
            char v12 = [(HKQuantity *)v18 isEqual:v19];
          }
          else
          {

            char v12 = 0;
          }
        }
        if (amount == v9) {
          goto LABEL_17;
        }
      }
      else
      {
        char v12 = 0;
      }

      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"Amount"];
  [v5 encodeObject:self->_angle forKey:@"Base"];
  [v5 encodeInteger:self->_eye forKey:@"Eye"];
}

- (HKVisionPrism)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Amount"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Base"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"Eye"];

  v8 = [(HKVisionPrism *)self initWithAmount:v5 angle:v6 eye:v7];
  return v8;
}

- (void)_setRectangularValues
{
  amount = self->_amount;
  id v4 = +[HKUnit prismDiopterUnit];
  [(HKQuantity *)amount doubleValueForUnit:v4];
  double v6 = v5;

  angle = self->_angle;
  v8 = +[HKUnit radianAngleUnit];
  [(HKQuantity *)angle doubleValueForUnit:v8];
  double v10 = v9;

  __double2 v11 = __sincos_stret(v10);
  double v12 = v6 * v11.__cosval;
  int64_t v13 = 3;
  if (self->_eye == 2) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 3;
  }
  if (self->_eye != 2) {
    int64_t v13 = 4;
  }
  if (v12 <= 0.0) {
    int64_t v13 = v14;
  }
  double v15 = v6 * v11.__sinval;
  int64_t v16 = 2;
  if (v15 > 0.0) {
    int64_t v16 = 1;
  }
  self->_verticalBase = v16;
  self->_horizontalBase = v13;
  uint64_t v17 = +[HKUnit prismDiopterUnit];
  v18 = +[HKQuantity quantityWithUnit:v17 doubleValue:fabs(v12)];
  horizontalAmount = self->_horizontalAmount;
  self->_horizontalAmount = v18;

  id v22 = +[HKUnit prismDiopterUnit];
  objc_super v20 = +[HKQuantity quantityWithUnit:v22 doubleValue:fabs(v15)];
  verticalAmount = self->_verticalAmount;
  self->_verticalAmount = v20;
}

- (void)_setPolarValues
{
  verticalAmount = self->_verticalAmount;
  id v4 = +[HKUnit prismDiopterUnit];
  [(HKQuantity *)verticalAmount doubleValueForUnit:v4];
  double v6 = v5;

  horizontalAmount = self->_horizontalAmount;
  v8 = +[HKUnit prismDiopterUnit];
  [(HKQuantity *)horizontalAmount doubleValueForUnit:v8];
  double v10 = v9;

  int64_t eye = self->_eye;
  if (eye == 1)
  {
    if (self->_horizontalBase != 3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (eye == 2 && self->_horizontalBase == 4) {
LABEL_6:
  }
    double v10 = -v10;
LABEL_7:
  if (self->_verticalBase == 2) {
    double v6 = -v6;
  }
  double v12 = +[HKUnit prismDiopterUnit];
  int64_t v13 = +[HKQuantity quantityWithUnit:v12 doubleValue:sqrt(v6 * v6 + v10 * v10)];
  amount = self->_amount;
  self->_amount = v13;

  double v15 = round(atan2(v6, v10) * 57.2957795);
  if (v15 >= 0.0) {
    double v16 = v15;
  }
  else {
    double v16 = v15 + 360.0;
  }
  id v19 = +[HKUnit degreeAngleUnit];
  uint64_t v17 = +[HKQuantity quantityWithUnit:v19 doubleValue:v16];
  angle = self->_angle;
  self->_angle = v17;
}

- (HKQuantity)amount
{
  return self->_amount;
}

- (HKQuantity)angle
{
  return self->_angle;
}

- (HKQuantity)verticalAmount
{
  return self->_verticalAmount;
}

- (HKQuantity)horizontalAmount
{
  return self->_horizontalAmount;
}

- (HKPrismBase)verticalBase
{
  return self->_verticalBase;
}

- (HKPrismBase)horizontalBase
{
  return self->_horizontalBase;
}

- (HKVisionEye)eye
{
  return self->_eye;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalAmount, 0);
  objc_storeStrong((id *)&self->_verticalAmount, 0);
  objc_storeStrong((id *)&self->_angle, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

@end