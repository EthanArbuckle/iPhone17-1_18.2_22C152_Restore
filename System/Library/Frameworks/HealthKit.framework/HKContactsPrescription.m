@interface HKContactsPrescription
+ (BOOL)_validateBaseCurve:(id)a3 error:(id *)a4;
+ (BOOL)_validateDiameter:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (HKContactsPrescription)prescriptionWithRightEyeSpecification:(HKContactsLensSpecification *)rightEyeSpecification leftEyeSpecification:(HKContactsLensSpecification *)leftEyeSpecification brand:(NSString *)brand dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata;
- (BOOL)_validateContactsFieldsWithError:(id *)a3;
- (HKContactsLensSpecification)leftEye;
- (HKContactsLensSpecification)rightEye;
- (HKContactsPrescription)initWithCoder:(id)a3;
- (NSString)brand;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (id)leftAddPower;
- (id)leftAxis;
- (id)leftCylinder;
- (id)leftSphere;
- (id)rightAddPower;
- (id)rightAxis;
- (id)rightCylinder;
- (id)rightSphere;
- (void)_setBrand:(id)a3;
- (void)_setLeftEyeSpecification:(id)a3;
- (void)_setRightEyeSpecification:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKContactsPrescription

+ (HKContactsPrescription)prescriptionWithRightEyeSpecification:(HKContactsLensSpecification *)rightEyeSpecification leftEyeSpecification:(HKContactsLensSpecification *)leftEyeSpecification brand:(NSString *)brand dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  v14 = rightEyeSpecification;
  v15 = leftEyeSpecification;
  v16 = brand;
  v17 = expirationDate;
  v18 = metadata;
  v19 = device;
  v20 = dateIssued;
  v21 = +[HKObjectType visionPrescriptionType];
  [(NSDate *)v20 timeIntervalSinceReferenceDate];
  double v23 = v22;

  if (v17)
  {
    [(NSDate *)v17 timeIntervalSinceReferenceDate];
  }
  else
  {
    v20 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(NSDate *)v20 timeIntervalSinceReferenceDate];
  }
  double v25 = v24;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __133__HKContactsPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_brand_dateIssued_expirationDate_device_metadata___block_invoke;
  v33[3] = &unk_1E58C47B8;
  v34 = v14;
  v35 = v15;
  v36 = v16;
  v32.receiver = a1;
  v32.super_class = (Class)&OBJC_METACLASS___HKContactsPrescription;
  v26 = v16;
  v27 = v15;
  v28 = v14;
  id v29 = objc_msgSendSuper2(&v32, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v21, v19, v18, v33, v23, v25);

  if (!v17) {

  }
  return (HKContactsPrescription *)v29;
}

void __133__HKContactsPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_brand_dateIssued_expirationDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v10 = a2;
  uint64_t v4 = [v3 copy];
  v5 = (void *)v10[21];
  v10[21] = v4;

  uint64_t v6 = [*(id *)(a1 + 40) copy];
  v7 = (void *)v10[22];
  v10[22] = v6;

  uint64_t v8 = [*(id *)(a1 + 48) copy];
  v9 = (void *)v10[23];
  v10[23] = v8;

  [v10 _setPrescriptionType:2];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p Left=%@, Right=%@, Brand=%@>", v5, self, self->_leftEye, self->_rightEye, self->_brand];

  return v6;
}

- (void)_setRightEyeSpecification:(id)a3
{
  self->_rightEye = (HKContactsLensSpecification *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setLeftEyeSpecification:(id)a3
{
  self->_leftEye = (HKContactsLensSpecification *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setBrand:(id)a3
{
  self->_brand = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)leftSphere
{
  v2 = [(HKContactsPrescription *)self leftEye];
  v3 = [v2 sphere];

  return v3;
}

- (id)rightSphere
{
  v2 = [(HKContactsPrescription *)self rightEye];
  v3 = [v2 sphere];

  return v3;
}

- (id)leftCylinder
{
  v2 = [(HKContactsPrescription *)self leftEye];
  v3 = [v2 cylinder];

  return v3;
}

- (id)rightCylinder
{
  v2 = [(HKContactsPrescription *)self rightEye];
  v3 = [v2 cylinder];

  return v3;
}

- (id)leftAxis
{
  v2 = [(HKContactsPrescription *)self leftEye];
  v3 = [v2 axis];

  return v3;
}

- (id)rightAxis
{
  v2 = [(HKContactsPrescription *)self rightEye];
  v3 = [v2 axis];

  return v3;
}

- (id)leftAddPower
{
  v2 = [(HKContactsPrescription *)self leftEye];
  v3 = [v2 addPower];

  return v3;
}

- (id)rightAddPower
{
  v2 = [(HKContactsPrescription *)self rightEye];
  v3 = [v2 addPower];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKContactsPrescription;
  id v4 = a3;
  [(HKVisionPrescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_leftEye, @"LeftEye", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_rightEye forKey:@"RightEye"];
  [v4 encodeObject:self->_brand forKey:@"Brand"];
}

- (HKContactsPrescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKContactsPrescription;
  objc_super v5 = [(HKVisionPrescription *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftEye"];
    leftEye = v5->_leftEye;
    v5->_leftEye = (HKContactsLensSpecification *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RightEye"];
    rightEye = v5->_rightEye;
    v5->_rightEye = (HKContactsLensSpecification *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Brand"];
    brand = v5->_brand;
    v5->_brand = (NSString *)v10;
  }
  return v5;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKContactsPrescription;
  -[HKVisionPrescription _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    || (id v8 = 0,
        BOOL v5 = [(HKContactsPrescription *)self _validateContactsFieldsWithError:&v8],
        id v4 = v8,
        !v5))
  {
    id v4 = v4;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_validateContactsFieldsWithError:(id *)a3
{
  uint64_t v6 = [(HKContactsPrescription *)self leftSphere];
  if (!v6)
  {
    v7 = [(HKContactsPrescription *)self rightSphere];

    if (v7) {
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Requires atleast one sphere value for left or right eye"");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v17;
    BOOL v16 = v17 == 0;
    if (v17)
    {
      if (a3)
      {
        id v11 = v17;
        BOOL v16 = 0;
        *a3 = v11;
        objc_super v9 = v11;
LABEL_22:

        goto LABEL_23;
      }
      _HKLogDroppedError(v17);
      BOOL v16 = 0;
    }
    objc_super v9 = v11;
    goto LABEL_22;
  }

LABEL_4:
  id v8 = [(HKContactsPrescription *)self leftEye];
  objc_super v9 = [v8 baseCurve];

  if (!v9 || [(id)objc_opt_class() _validateBaseCurve:v9 error:a3])
  {
    uint64_t v10 = [(HKContactsPrescription *)self rightEye];
    id v11 = [v10 baseCurve];

    if (v11 && ![(id)objc_opt_class() _validateBaseCurve:v11 error:a3])
    {
      BOOL v16 = 0;
    }
    else
    {
      v12 = [(HKContactsPrescription *)self leftEye];
      objc_super v13 = [v12 diameter];

      if (v13 && ![(id)objc_opt_class() _validateDiameter:v13 error:a3])
      {
        BOOL v16 = 0;
      }
      else
      {
        v14 = [(HKContactsPrescription *)self rightEye];
        v15 = [v14 diameter];

        BOOL v16 = !v15 || [(id)objc_opt_class() _validateDiameter:v15 error:a3];
      }
    }
    goto LABEL_22;
  }
  BOOL v16 = 0;
LABEL_23:

  return v16;
}

+ (BOOL)_validateBaseCurve:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[HKUnit meterUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"baseCurve", objc_opt_class(), a2, @"Base curve must be a meter quantity");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  BOOL v9 = v10 == 0;
  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    else {
      _HKLogDroppedError(v10);
    }
  }

  return v9;
}

+ (BOOL)_validateDiameter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[HKUnit meterUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"diameter", objc_opt_class(), a2, @"Diameter must be a meter quantity");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  BOOL v9 = v10 == 0;
  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    else {
      _HKLogDroppedError(v10);
    }
  }

  return v9;
}

- (HKContactsLensSpecification)rightEye
{
  return self->_rightEye;
}

- (HKContactsLensSpecification)leftEye
{
  return self->_leftEye;
}

- (NSString)brand
{
  return self->_brand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_leftEye, 0);

  objc_storeStrong((id *)&self->_rightEye, 0);
}

@end