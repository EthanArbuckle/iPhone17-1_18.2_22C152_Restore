@interface HKVisionPrescription
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)_validateAddPower:(id)a3 error:(id *)a4;
+ (BOOL)_validateAxis:(id)a3 error:(id *)a4;
+ (BOOL)_validateCylinder:(id)a3 error:(id *)a4;
+ (BOOL)_validateSphere:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (HKVisionPrescription)prescriptionWithType:(HKVisionPrescriptionType)type dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata;
- (BOOL)_validateCommonFieldsWithError:(id *)a3;
- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6;
- (HKQuantity)leftAddPower;
- (HKQuantity)leftAxis;
- (HKQuantity)leftCylinder;
- (HKQuantity)leftSphere;
- (HKQuantity)rightAddPower;
- (HKQuantity)rightAxis;
- (HKQuantity)rightCylinder;
- (HKQuantity)rightSphere;
- (HKVisionPrescription)initWithCoder:(id)a3;
- (HKVisionPrescriptionType)prescriptionType;
- (NSDate)expirationDate;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_setPrescriptionType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKVisionPrescription

+ (HKVisionPrescription)prescriptionWithType:(HKVisionPrescriptionType)type dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  v12 = expirationDate;
  v13 = metadata;
  v14 = device;
  v15 = dateIssued;
  v16 = +[HKObjectType visionPrescriptionType];
  [(NSDate *)v15 timeIntervalSinceReferenceDate];
  double v18 = v17;

  if (v12)
  {
    [(NSDate *)v12 timeIntervalSinceReferenceDate];
  }
  else
  {
    v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(NSDate *)v15 timeIntervalSinceReferenceDate];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__HKVisionPrescription_prescriptionWithType_dateIssued_expirationDate_device_metadata___block_invoke;
  v22[3] = &__block_descriptor_40_e30_v16__0__HKVisionPrescription_8l;
  v22[4] = type;
  v20 = (void *)[a1 _newSampleWithType:v16 startDate:v14 endDate:v13 device:v22 metadata:v18 config:v19];

  if (!v12) {

  }
  return (HKVisionPrescription *)v20;
}

uint64_t __87__HKVisionPrescription_prescriptionWithType_dateIssued_expirationDate_device_metadata___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 96) = *(void *)(result + 32);
  return result;
}

- (NSDate)expirationDate
{
  v3 = [(HKSample *)self endDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  if (v5 >= v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = [(HKSample *)self endDate];
  }

  return (NSDate *)v9;
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  unint64_t prescriptionType = self->_prescriptionType;
  double v7 = [(HKVisionPrescription *)self dateIssued];
  double v8 = [(HKVisionPrescription *)self expirationDate];
  v9 = [v3 stringWithFormat:@"<%@:%p PrescriptionType=%lu, dateIssued=%@, expirationDate=%@>", v5, self, prescriptionType, v7, v8];

  return v9;
}

- (void)_setPrescriptionType:(unint64_t)a3
{
  self->_unint64_t prescriptionType = a3;
}

- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)HKVisionPrescription;
  BOOL v8 = -[HKObject _validateForSavingWithClientEntitlements:applicationSDKVersionToken:isAppleWatch:error:](&v11, sel__validateForSavingWithClientEntitlements_applicationSDKVersionToken_isAppleWatch_error_, a3, a4);
  if (v8 && v7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a6, 2, @"Unable to save vision samples on this device");
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKVisionPrescription;
  id result = [(HKObject *)&v5 copyWithZone:a3];
  *((void *)result + 12) = self->_prescriptionType;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKVisionPrescription;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_prescriptionType, @"PrescriptionType", v5.receiver, v5.super_class);
}

- (HKVisionPrescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKVisionPrescription;
  objc_super v5 = [(HKSample *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_unint64_t prescriptionType = [v4 decodeIntegerForKey:@"PrescriptionType"];
  }

  return v5;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKVisionPrescription;
  -[HKSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    || (id v8 = 0,
        BOOL v5 = [(HKVisionPrescription *)self _validateCommonFieldsWithError:&v8],
        id v4 = v8,
        !v5))
  {
    id v4 = v4;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_validateCommonFieldsWithError:(id *)a3
{
  BOOL v5 = [(HKVisionPrescription *)self leftSphere];
  if (v5 && ![(id)objc_opt_class() _validateSphere:v5 error:a3])
  {
    BOOL v13 = 0;
  }
  else
  {
    v6 = [(HKVisionPrescription *)self rightSphere];
    if (v6 && ![(id)objc_opt_class() _validateSphere:v6 error:a3])
    {
      BOOL v13 = 0;
    }
    else
    {
      objc_super v7 = [(HKVisionPrescription *)self leftCylinder];
      if (v7 && ![(id)objc_opt_class() _validateCylinder:v7 error:a3])
      {
        BOOL v13 = 0;
      }
      else
      {
        id v8 = [(HKVisionPrescription *)self rightCylinder];
        if (v8 && ![(id)objc_opt_class() _validateCylinder:v8 error:a3])
        {
          BOOL v13 = 0;
        }
        else
        {
          objc_super v9 = [(HKVisionPrescription *)self leftAxis];
          if (v9 && ![(id)objc_opt_class() _validateAxis:v9 error:a3])
          {
            BOOL v13 = 0;
          }
          else
          {
            v10 = [(HKVisionPrescription *)self rightAxis];
            if (v10 && ![(id)objc_opt_class() _validateAxis:v10 error:a3])
            {
              BOOL v13 = 0;
            }
            else
            {
              objc_super v11 = [(HKVisionPrescription *)self leftAddPower];
              if (v11 && ![(id)objc_opt_class() _validateAddPower:v11 error:a3])
              {
                BOOL v13 = 0;
              }
              else
              {
                v12 = [(HKVisionPrescription *)self rightAddPower];
                BOOL v13 = !v12 || [(id)objc_opt_class() _validateAddPower:v12 error:a3];
              }
            }
          }
        }
      }
    }
  }
  return v13;
}

+ (BOOL)_validateSphere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = +[HKUnit diopterUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"sphere", objc_opt_class(), a2, @"Sphere must be a Diopter quantity");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v11 = v10;
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

+ (BOOL)_validateCylinder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = +[HKUnit diopterUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"cylinder", objc_opt_class(), a2, @"Cylinder must be an Diopter quantity");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v11 = v10;
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

+ (BOOL)_validateAxis:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = +[HKUnit degreeAngleUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"axis", objc_opt_class(), a2, @"Axis must be an Angle quantity");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v11 = v10;
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

+ (BOOL)_validateAddPower:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = +[HKUnit diopterUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"addPower", objc_opt_class(), a2, @"Add power must be a Diopter quantity");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v11 = v10;
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

- (HKVisionPrescriptionType)prescriptionType
{
  return self->_prescriptionType;
}

- (HKQuantity)leftSphere
{
  return self->_leftSphere;
}

- (HKQuantity)rightSphere
{
  return self->_rightSphere;
}

- (HKQuantity)leftCylinder
{
  return self->_leftCylinder;
}

- (HKQuantity)rightCylinder
{
  return self->_rightCylinder;
}

- (HKQuantity)leftAxis
{
  return self->_leftAxis;
}

- (HKQuantity)rightAxis
{
  return self->_rightAxis;
}

- (HKQuantity)leftAddPower
{
  return self->_leftAddPower;
}

- (HKQuantity)rightAddPower
{
  return self->_rightAddPower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightAddPower, 0);
  objc_storeStrong((id *)&self->_leftAddPower, 0);
  objc_storeStrong((id *)&self->_rightAxis, 0);
  objc_storeStrong((id *)&self->_leftAxis, 0);
  objc_storeStrong((id *)&self->_rightCylinder, 0);
  objc_storeStrong((id *)&self->_leftCylinder, 0);
  objc_storeStrong((id *)&self->_rightSphere, 0);

  objc_storeStrong((id *)&self->_leftSphere, 0);
}

@end