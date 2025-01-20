@interface CRXFLitePrescriptionRecord
+ (BOOL)supportsSecureCoding;
- (CRXFLitePrescriptionRecord)initWithACCPayload:(id)a3 enrollmentName:(id)a4 enrollmentDate:(id)a5 leftEyeRX:(id)a6 rightEyeRX:(id)a7;
- (CRXFLitePrescriptionRecord)initWithCoder:(id)a3;
- (CRXFLiteRXValues)leftEyeRX;
- (CRXFLiteRXValues)rightEyeRX;
- (NSData)accPayload;
- (NSDate)enrollmentDate;
- (NSString)enrollmentName;
- (NSString)leftCalibrationData;
- (NSString)rightCalibrationData;
- (void)addLeftCalibrationData:(id)a3 rightCalibrationData:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRXFLitePrescriptionRecord

- (CRXFLitePrescriptionRecord)initWithACCPayload:(id)a3 enrollmentName:(id)a4 enrollmentDate:(id)a5 leftEyeRX:(id)a6 rightEyeRX:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CRXFLitePrescriptionRecord;
  v18 = [(CRXFLitePrescriptionRecord *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accPayload, a3);
    objc_storeStrong((id *)&v19->_enrollmentName, a4);
    if (v15)
    {
      v20 = (NSDate *)v15;
    }
    else
    {
      v20 = [MEMORY[0x263EFF910] date];
    }
    enrollmentDate = v19->_enrollmentDate;
    v19->_enrollmentDate = v20;

    objc_storeStrong((id *)&v19->_leftEyeRX, a6);
    objc_storeStrong((id *)&v19->_rightEyeRX, a7);
  }

  return v19;
}

- (void)addLeftCalibrationData:(id)a3 rightCalibrationData:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  leftCalibrationData = self->_leftCalibrationData;
  self->_leftCalibrationData = v6;
  v10 = v6;

  rightCalibrationData = self->_rightCalibrationData;
  self->_rightCalibrationData = v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRXFLitePrescriptionRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acc"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ek"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ed"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lc"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rc"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lrx"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rrx"];

  if (v5)
  {
    self = [(CRXFLitePrescriptionRecord *)self initWithACCPayload:v5 enrollmentName:v6 enrollmentDate:v7 leftEyeRX:v10 rightEyeRX:v11];
    [(CRXFLitePrescriptionRecord *)self addLeftCalibrationData:v8 rightCalibrationData:v9];
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRXFLitePrescriptionRecord *)self accPayload];
  [v4 encodeObject:v5 forKey:@"acc"];

  v6 = [(CRXFLitePrescriptionRecord *)self enrollmentName];
  [v4 encodeObject:v6 forKey:@"ek"];

  v7 = [(CRXFLitePrescriptionRecord *)self enrollmentDate];
  [v4 encodeObject:v7 forKey:@"ed"];

  v8 = [(CRXFLitePrescriptionRecord *)self leftCalibrationData];
  [v4 encodeObject:v8 forKey:@"lc"];

  v9 = [(CRXFLitePrescriptionRecord *)self rightCalibrationData];
  [v4 encodeObject:v9 forKey:@"rc"];

  v10 = [(CRXFLitePrescriptionRecord *)self leftEyeRX];
  [v4 encodeObject:v10 forKey:@"lrx"];

  id v11 = [(CRXFLitePrescriptionRecord *)self rightEyeRX];
  [v4 encodeObject:v11 forKey:@"rrx"];
}

- (NSData)accPayload
{
  return self->_accPayload;
}

- (NSString)enrollmentName
{
  return self->_enrollmentName;
}

- (NSDate)enrollmentDate
{
  return self->_enrollmentDate;
}

- (NSString)leftCalibrationData
{
  return self->_leftCalibrationData;
}

- (NSString)rightCalibrationData
{
  return self->_rightCalibrationData;
}

- (CRXFLiteRXValues)leftEyeRX
{
  return self->_leftEyeRX;
}

- (CRXFLiteRXValues)rightEyeRX
{
  return self->_rightEyeRX;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeRX, 0);
  objc_storeStrong((id *)&self->_leftEyeRX, 0);
  objc_storeStrong((id *)&self->_rightCalibrationData, 0);
  objc_storeStrong((id *)&self->_leftCalibrationData, 0);
  objc_storeStrong((id *)&self->_enrollmentDate, 0);
  objc_storeStrong((id *)&self->_enrollmentName, 0);
  objc_storeStrong((id *)&self->_accPayload, 0);
}

@end