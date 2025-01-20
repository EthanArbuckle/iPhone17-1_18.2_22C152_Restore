@interface HKClinicalRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (HKClinicalRecord)clinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 displayName:(id)a8 FHIRResource:(id)a9;
+ (id)_newClinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 displayName:(id)a8 FHIRResource:(id)a9 config:(id)a10;
- (BOOL)isEquivalent:(id)a3;
- (HKClinicalRecord)init;
- (HKClinicalRecord)initWithCoder:(id)a3;
- (HKFHIRResource)FHIRResource;
- (NSString)displayName;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)attachmentObjectIdentifier;
- (id)attachmentSchemaIdentifier;
- (id)description;
- (void)_setDisplayName:(id)a3;
- (void)_setFHIRResource:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalRecord

+ (HKClinicalRecord)clinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 displayName:(id)a8 FHIRResource:(id)a9
{
  v9 = (void *)[a1 _newClinicalRecordWithType:a3 startDate:a4 endDate:a5 device:a6 metadata:a7 displayName:a8 FHIRResource:a9 config:0];

  return (HKClinicalRecord *)v9;
}

+ (id)_newClinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 displayName:(id)a8 FHIRResource:(id)a9 config:(id)a10
{
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKClinicalRecord__newClinicalRecordWithType_startDate_endDate_device_metadata_displayName_FHIRResource_config___block_invoke;
  aBlock[3] = &unk_1E58BE4F0;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = _Block_copy(aBlock);
  v30.receiver = a1;
  v30.super_class = (Class)&OBJC_METACLASS___HKClinicalRecord;
  id v28 = objc_msgSendSuper2(&v30, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v26, v25, v24, v23, v22, v27);

  return v28;
}

void __113__HKClinicalRecord__newClinicalRecordWithType_startDate_endDate_device_metadata_displayName_FHIRResource_config___block_invoke(uint64_t a1, void *a2)
{
  v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v8[12];
  v8[12] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v8[13];
  v8[13] = v5;

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (HKClinicalRecord)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)attachmentObjectIdentifier
{
  return +[HKAttachmentObjectIdentifierUtilities attachmentObjectIdentifierForClinicalRecord:self];
}

- (id)attachmentSchemaIdentifier
{
  return @"HKClinicalRecord";
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalRecord;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@, displayName = %@, FHIRResource = %@>", v5, self, v6, self->_displayName, self->_FHIRResource, 0];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKClinicalRecord;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, @"DisplayName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_FHIRResource forKey:@"FHIRResource"];
}

- (HKClinicalRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKClinicalRecord;
  objc_super v5 = [(HKSample *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRResource"];
    FHIRResource = v5->_FHIRResource;
    v5->_FHIRResource = (HKFHIRResource *)v8;
  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v22.receiver = self;
    v22.super_class = (Class)HKClinicalRecord;
    if (![(HKSample *)&v22 isEquivalent:v5]) {
      goto LABEL_14;
    }
    uint64_t v6 = [(HKClinicalRecord *)self displayName];
    uint64_t v7 = [v5 displayName];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 displayName];
      if (!v9) {
        goto LABEL_13;
      }
      v10 = (void *)v9;
      objc_super v11 = [(HKClinicalRecord *)self displayName];
      v12 = [v5 displayName];
      int v13 = [v11 isEqualToString:v12];

      if (!v13) {
        goto LABEL_14;
      }
    }
    uint64_t v6 = [(HKClinicalRecord *)self FHIRResource];
    uint64_t v15 = [v5 FHIRResource];
    if (v6 == (void *)v15)
    {

LABEL_18:
      BOOL v14 = 1;
      goto LABEL_15;
    }
    uint64_t v8 = (void *)v15;
    uint64_t v16 = [v5 FHIRResource];
    if (v16)
    {
      id v17 = (void *)v16;
      id v18 = [(HKClinicalRecord *)self FHIRResource];
      id v19 = [v5 FHIRResource];
      char v20 = [v18 isEqual:v19];

      if (v20) {
        goto LABEL_18;
      }
LABEL_14:
      BOOL v14 = 0;
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:

    goto LABEL_14;
  }
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)_setDisplayName:(id)a3
{
  self->_displayName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKFHIRResource)FHIRResource
{
  return self->_FHIRResource;
}

- (void)_setFHIRResource:(id)a3
{
  self->_FHIRResource = (HKFHIRResource *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKClinicalRecord;
  id v5 = -[HKSample _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  if (!self->_displayName)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: displayName must not be nil"", self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRResource, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end