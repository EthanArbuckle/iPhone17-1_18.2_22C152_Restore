@interface HKGlassesPrescription
+ (BOOL)_validatePrism:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (HKGlassesPrescription)prescriptionWithRightEyeSpecification:(HKGlassesLensSpecification *)rightEyeSpecification leftEyeSpecification:(HKGlassesLensSpecification *)leftEyeSpecification dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata;
- (BOOL)_validateGlassesFieldsWithError:(id *)a3;
- (HKGlassesLensSpecification)leftEye;
- (HKGlassesLensSpecification)rightEye;
- (HKGlassesPrescription)initWithCoder:(id)a3;
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
- (void)_setLeftEyeSpecification:(id)a3;
- (void)_setRightEyeSpecification:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKGlassesPrescription

+ (HKGlassesPrescription)prescriptionWithRightEyeSpecification:(HKGlassesLensSpecification *)rightEyeSpecification leftEyeSpecification:(HKGlassesLensSpecification *)leftEyeSpecification dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  v14 = rightEyeSpecification;
  v15 = leftEyeSpecification;
  v16 = expirationDate;
  v17 = metadata;
  v18 = device;
  v19 = dateIssued;
  v20 = +[HKObjectType visionPrescriptionType];
  [(NSDate *)v19 timeIntervalSinceReferenceDate];
  double v22 = v21;

  if (v16)
  {
    [(NSDate *)v16 timeIntervalSinceReferenceDate];
  }
  else
  {
    v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(NSDate *)v19 timeIntervalSinceReferenceDate];
  }
  double v24 = v23;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __126__HKGlassesPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_dateIssued_expirationDate_device_metadata___block_invoke;
  v30[3] = &unk_1E58C6110;
  v31 = v14;
  v32 = v15;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___HKGlassesPrescription;
  v25 = v15;
  v26 = v14;
  id v27 = objc_msgSendSuper2(&v29, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v20, v18, v17, v30, v22, v24);

  if (!v16) {

  }
  return (HKGlassesPrescription *)v27;
}

void __126__HKGlassesPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_dateIssued_expirationDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v8 = a2;
  uint64_t v4 = [v3 copy];
  v5 = (void *)v8[21];
  v8[21] = v4;

  uint64_t v6 = [*(id *)(a1 + 40) copy];
  v7 = (void *)v8[22];
  v8[22] = v6;

  [v8 _setPrescriptionType:1];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p Left=%@, Right=%@>", v5, self, self->_leftEye, self->_rightEye];

  return v6;
}

- (void)_setRightEyeSpecification:(id)a3
{
  uint64_t v4 = (HKGlassesLensSpecification *)[a3 copy];
  rightEye = self->_rightEye;
  self->_rightEye = v4;

  MEMORY[0x1F41817F8](v4, rightEye);
}

- (void)_setLeftEyeSpecification:(id)a3
{
  uint64_t v4 = (HKGlassesLensSpecification *)[a3 copy];
  leftEye = self->_leftEye;
  self->_leftEye = v4;

  MEMORY[0x1F41817F8](v4, leftEye);
}

- (id)leftSphere
{
  v2 = [(HKGlassesPrescription *)self leftEye];
  v3 = [v2 sphere];

  return v3;
}

- (id)rightSphere
{
  v2 = [(HKGlassesPrescription *)self rightEye];
  v3 = [v2 sphere];

  return v3;
}

- (id)leftCylinder
{
  v2 = [(HKGlassesPrescription *)self leftEye];
  v3 = [v2 cylinder];

  return v3;
}

- (id)rightCylinder
{
  v2 = [(HKGlassesPrescription *)self rightEye];
  v3 = [v2 cylinder];

  return v3;
}

- (id)leftAxis
{
  v2 = [(HKGlassesPrescription *)self leftEye];
  v3 = [v2 axis];

  return v3;
}

- (id)rightAxis
{
  v2 = [(HKGlassesPrescription *)self rightEye];
  v3 = [v2 axis];

  return v3;
}

- (id)leftAddPower
{
  v2 = [(HKGlassesPrescription *)self leftEye];
  v3 = [v2 addPower];

  return v3;
}

- (id)rightAddPower
{
  v2 = [(HKGlassesPrescription *)self rightEye];
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
  v5.super_class = (Class)HKGlassesPrescription;
  id v4 = a3;
  [(HKVisionPrescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_leftEye, @"LeftEye", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_rightEye forKey:@"RightEye"];
}

- (HKGlassesPrescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKGlassesPrescription;
  objc_super v5 = [(HKVisionPrescription *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftEye"];
    leftEye = v5->_leftEye;
    v5->_leftEye = (HKGlassesLensSpecification *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RightEye"];
    rightEye = v5->_rightEye;
    v5->_rightEye = (HKGlassesLensSpecification *)v8;
  }
  return v5;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKGlassesPrescription;
  -[HKVisionPrescription _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    || (id v8 = 0,
        BOOL v5 = [(HKGlassesPrescription *)self _validateGlassesFieldsWithError:&v8],
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

- (BOOL)_validateGlassesFieldsWithError:(id *)a3
{
  uint64_t v6 = [(HKGlassesPrescription *)self leftSphere];
  if (v6)
  {
  }
  else
  {
    v7 = [(HKGlassesPrescription *)self rightSphere];

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Requires atleast one sphere value for left or right eye"");
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = v39;
      BOOL v33 = v39 == 0;
      if (v39)
      {
        if (a3)
        {
          id v13 = v39;
          BOOL v33 = 0;
          *a3 = v13;
          objc_super v9 = v13;
          goto LABEL_34;
        }
        _HKLogDroppedError(v39);
        BOOL v33 = 0;
      }
      objc_super v9 = v13;
      goto LABEL_34;
    }
  }
  id v8 = [(HKGlassesPrescription *)self leftEye];
  objc_super v9 = [v8 vertexDistance];

  if (!v9
    || (+[HKUnit meterUnit],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 isCompatibleWithUnit:v10],
        v10,
        (v11 & 1) != 0))
  {
    v12 = [(HKGlassesPrescription *)self rightEye];
    id v13 = [v12 vertexDistance];

    if (v13
      && (+[HKUnit meterUnit],
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v13 isCompatibleWithUnit:v14],
          v14,
          (v15 & 1) == 0))
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = objc_opt_class();
      v37 = @"rightVertexDistance";
      v38 = @"Right vertex distance must be a meter quantity";
    }
    else
    {
      v16 = [(HKGlassesPrescription *)self leftEye];
      v17 = [v16 prism];

      if (!v17)
      {
LABEL_11:
        double v24 = [(HKGlassesPrescription *)self rightEye];
        v25 = [v24 prism];

        if (!v25)
        {
LABEL_14:
          BOOL v33 = 1;
          goto LABEL_34;
        }
        v26 = [(HKGlassesPrescription *)self rightEye];
        id v27 = [v26 prism];
        uint64_t v28 = [v27 eye];

        if (v28 == 2)
        {
          objc_super v29 = objc_opt_class();
          v30 = [(HKGlassesPrescription *)self rightEye];
          v31 = [v30 prism];
          int v32 = [v29 _validatePrism:v31 error:a3];

          if (v32) {
            goto LABEL_14;
          }
LABEL_23:
          BOOL v33 = 0;
          goto LABEL_34;
        }
        v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = objc_opt_class();
        v37 = @"self.rightEye.prism.eye";
        v38 = @"Right prism Eye incorrect";
        goto LABEL_25;
      }
      v18 = [(HKGlassesPrescription *)self leftEye];
      v19 = [v18 prism];
      uint64_t v20 = [v19 eye];

      if (v20 == 1)
      {
        double v21 = objc_opt_class();
        double v22 = [(HKGlassesPrescription *)self leftEye];
        double v23 = [v22 prism];
        LODWORD(v21) = [v21 _validatePrism:v23 error:a3];

        if (!v21) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = objc_opt_class();
      v37 = @"self.leftEye.prism.eye";
      v38 = @"Left prism Eye incorrect";
    }
LABEL_25:
    objc_msgSend(v35, "hk_errorForInvalidArgument:class:selector:format:", v37, v36, a2, v38);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    BOOL v33 = v40 == 0;
    if (v40)
    {
      if (a3) {
        *a3 = v40;
      }
      else {
        _HKLogDroppedError(v40);
      }
    }

    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"leftVertexDistance", objc_opt_class(), a2, @"Left vertex distance must be a meter quantity");
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v34;
  BOOL v33 = v34 == 0;
  if (v34)
  {
    if (a3) {
      *a3 = v34;
    }
    else {
      _HKLogDroppedError(v34);
    }
  }

LABEL_34:
  return v33;
}

+ (BOOL)_validatePrism:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 amount];
  id v8 = +[HKUnit prismDiopterUnit];
  char v9 = [v7 isCompatibleWithUnit:v8];

  if (v9)
  {
    v10 = [v6 angle];
    char v11 = +[HKUnit radianAngleUnit];
    char v12 = [v10 isCompatibleWithUnit:v11];

    if (v12)
    {
      id v13 = [v6 verticalAmount];
      v14 = +[HKUnit prismDiopterUnit];
      char v15 = [v13 isCompatibleWithUnit:v14];

      if (v15)
      {
        v16 = [v6 horizontalAmount];
        v17 = +[HKUnit prismDiopterUnit];
        char v18 = [v16 isCompatibleWithUnit:v17];

        if (v18)
        {
          BOOL v19 = 1;
          goto LABEL_15;
        }
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = objc_opt_class();
        double v22 = @"prism.horizontalAmount";
        double v23 = @"Horizontal amount must be an prism diopter quantity";
      }
      else
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = objc_opt_class();
        double v22 = @"prism.verticalAmount";
        double v23 = @"Vertical amount must be an prism diopter quantity";
      }
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = objc_opt_class();
      double v22 = @"prism.angle";
      double v23 = @"Prism angle must be an Angle quantity";
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = objc_opt_class();
    double v22 = @"prism.amount";
    double v23 = @"Prism amount must be an prism diopter quantity";
  }
  objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", v22, v21, a2, v23);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = v24;
  BOOL v19 = v24 == 0;
  if (v24)
  {
    if (a4)
    {
      id v25 = v24;
      BOOL v19 = 0;
      *a4 = v25;
    }
    else
    {
      _HKLogDroppedError(v24);
      BOOL v19 = 0;
    }
  }

LABEL_15:
  return v19;
}

- (HKGlassesLensSpecification)rightEye
{
  return self->_rightEye;
}

- (HKGlassesLensSpecification)leftEye
{
  return self->_leftEye;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftEye, 0);

  objc_storeStrong((id *)&self->_rightEye, 0);
}

@end