@interface HKAccountOwner
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newAccountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 name:(id)a15 birthDate:(id)a16 config:(id)a17;
+ (id)accountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 name:(id)a14 birthDate:(id)a15;
+ (id)accountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 name:(id)a15 birthDate:(id)a16;
- (BOOL)isEquivalent:(id)a3;
- (HKAccountOwner)init;
- (HKAccountOwner)initWithCoder:(id)a3;
- (HKMedicalDate)birthDate;
- (NSString)name;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (void)_setBirthDate:(id)a3;
- (void)_setName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAccountOwner

+ (id)accountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 name:(id)a15 birthDate:(id)a16
{
  v16 = (void *)[a1 _newAccountOwnerWithType:a3 note:a4 enteredInError:a5 modifiedDate:a6 originIdentifier:a7 locale:a8 extractionVersion:a9 device:a10 metadata:a11 sortDate:a12 country:a13 state:a14 name:a15 birthDate:a16 config:0];

  return v16;
}

+ (id)_newAccountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 name:(id)a15 birthDate:(id)a16 config:(id)a17
{
  BOOL v37 = a5;
  id v20 = a15;
  id v21 = a16;
  id v22 = a17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __179__HKAccountOwner__newAccountOwnerWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_name_birthDate_config___block_invoke;
  aBlock[3] = &unk_1E58BE4F0;
  id v44 = v20;
  id v45 = v21;
  id v46 = v22;
  id v41 = v22;
  id v40 = v21;
  id v39 = v20;
  id v23 = a13;
  id v24 = a12;
  id v25 = a11;
  id v26 = a10;
  id v27 = a8;
  id v28 = a7;
  id v29 = a6;
  id v30 = a4;
  id v31 = a3;
  v32 = _Block_copy(aBlock);
  v42.receiver = a1;
  v42.super_class = (Class)&OBJC_METACLASS___HKAccountOwner;
  id v38 = objc_msgSendSuper2(&v42, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v31, v30, v37, v29, v28, v27, a9, v26, v25, v24, v23, a14, v32);

  return v38;
}

void __179__HKAccountOwner__newAccountOwnerWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_name_birthDate_config___block_invoke(uint64_t a1, void *a2)
{
  v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v8[22];
  v8[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v8[23];
  v8[23] = v5;

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (HKAccountOwner)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v9.receiver = self;
  v9.super_class = (Class)HKAccountOwner;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@name = %@birthDate = %@>", v5, self, v6, self->_name, self->_birthDate];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKAccountOwner;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"Name", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_birthDate forKey:@"BirthDate"];
}

- (HKAccountOwner)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKAccountOwner;
  objc_super v5 = [(HKMedicalRecord *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BirthDate"];
    birthDate = v5->_birthDate;
    v5->_birthDate = (HKMedicalDate *)v8;
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
    v22.super_class = (Class)HKAccountOwner;
    if (![(HKMedicalRecord *)&v22 isEquivalent:v5]) {
      goto LABEL_14;
    }
    uint64_t v6 = [(HKAccountOwner *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 name];
      if (!v9) {
        goto LABEL_13;
      }
      v10 = (void *)v9;
      objc_super v11 = [(HKAccountOwner *)self name];
      v12 = [v5 name];
      int v13 = [v11 isEqualToString:v12];

      if (!v13) {
        goto LABEL_14;
      }
    }
    uint64_t v6 = [(HKAccountOwner *)self birthDate];
    uint64_t v15 = [v5 birthDate];
    if (v6 == (void *)v15)
    {

LABEL_18:
      BOOL v14 = 1;
      goto LABEL_15;
    }
    uint64_t v8 = (void *)v15;
    uint64_t v16 = [v5 birthDate];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(HKAccountOwner *)self birthDate];
      v19 = [v5 birthDate];
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

- (NSString)name
{
  return self->_name;
}

- (void)_setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)birthDate
{
  return self->_birthDate;
}

- (void)_setBirthDate:(id)a3
{
  self->_birthDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKAccountOwner;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  if (!self->_name)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: name must not be nil"", self);
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
  objc_storeStrong((id *)&self->_birthDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)accountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 name:(id)a14 birthDate:(id)a15
{
  BOOL v31 = a5;
  id v27 = a6;
  id v26 = a15;
  id v25 = a14;
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v24 = a8;
  id v20 = a7;
  id v29 = a4;
  id v21 = a3;
  objc_super v22 = +[HKSemanticDate semanticDateWithKeyPath:@"modifiedDate" date:v27];
  v32 = +[HKAccountOwner accountOwnerWithType:v21 note:v29 enteredInError:v31 modifiedDate:v27 originIdentifier:v20 locale:v24 extractionVersion:a9 device:v19 metadata:v18 sortDate:v22 country:v17 state:a13 name:v25 birthDate:v26];

  return v32;
}

@end