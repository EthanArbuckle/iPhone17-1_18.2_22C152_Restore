@interface HKUnknownRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newUnknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 displayName:(id)a15 config:(id)a16;
+ (id)defaultDisplayString;
+ (id)unknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 displayName:(id)a14;
+ (id)unknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 displayName:(id)a15;
- (BOOL)isEquivalent:(id)a3;
- (HKUnknownRecord)init;
- (HKUnknownRecord)initWithCoder:(id)a3;
- (NSString)displayName;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (id)fallbackDisplayString;
- (int64_t)recordCategoryType;
- (void)_setDisplayName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUnknownRecord

- (id)fallbackDisplayString
{
  v2 = [(HKUnknownRecord *)self displayName];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() defaultDisplayString];
  }
  v5 = v4;

  return v5;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_UNKNOWN_RECORD" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

- (int64_t)recordCategoryType
{
  return 8;
}

+ (id)unknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 displayName:(id)a15
{
  v15 = (void *)[a1 _newUnknownRecordWithType:a3 note:a4 enteredInError:a5 modifiedDate:a6 originIdentifier:a7 locale:a8 extractionVersion:a9 device:a10 metadata:a11 sortDate:a12 country:a13 state:a14 displayName:a15 config:0];

  return v15;
}

+ (id)_newUnknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 displayName:(id)a15 config:(id)a16
{
  BOOL v35 = a5;
  id v20 = a15;
  id v21 = a16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __178__HKUnknownRecord__newUnknownRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_displayName_config___block_invoke;
  aBlock[3] = &unk_1E58BED90;
  id v41 = v20;
  id v42 = v21;
  id v38 = v21;
  id v37 = v20;
  id v22 = a13;
  id v23 = a12;
  id v24 = a11;
  id v25 = a10;
  id v26 = a8;
  id v27 = a7;
  id v28 = a6;
  id v29 = a4;
  id v30 = a3;
  v31 = _Block_copy(aBlock);
  v39.receiver = a1;
  v39.super_class = (Class)&OBJC_METACLASS___HKUnknownRecord;
  id v36 = objc_msgSendSuper2(&v39, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v30, v29, v35, v28, v27, v26, a9, v25, v24, v23, v22, a14, v31);

  return v36;
}

void __178__HKUnknownRecord__newUnknownRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_displayName_config___block_invoke(uint64_t a1, void *a2)
{
  v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)v6[22];
  v6[22] = v3;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (HKUnknownRecord)init
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
  v9.super_class = (Class)HKUnknownRecord;
  v6 = [(HKSample *)&v9 description];
  v7 = [v3 stringWithFormat:@"<%@:%p super=%@displayName = %@>", v5, self, v6, self->_displayName];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUnknownRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, @"DisplayName", v5.receiver, v5.super_class);
}

- (HKUnknownRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUnknownRecord;
  objc_super v5 = [(HKMedicalRecord *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;
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
    v16.receiver = self;
    v16.super_class = (Class)HKUnknownRecord;
    if ([(HKMedicalRecord *)&v16 isEquivalent:v5])
    {
      uint64_t v6 = [(HKUnknownRecord *)self displayName];
      uint64_t v7 = [v5 displayName];
      if (v6 == (void *)v7)
      {

        goto LABEL_9;
      }
      v8 = (void *)v7;
      uint64_t v9 = [v5 displayName];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [(HKUnknownRecord *)self displayName];
        v12 = [v5 displayName];
        char v13 = [v11 isEqualToString:v12];

        if ((v13 & 1) == 0) {
          goto LABEL_11;
        }
LABEL_9:
        BOOL v14 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)_setDisplayName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  displayName = self->_displayName;
  self->_displayName = v4;

  MEMORY[0x1F41817F8](v4, displayName);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKUnknownRecord;
  uint64_t v3 = -[HKMedicalRecord _validateWithConfiguration:](&v7, sel__validateWithConfiguration_, a3.var0, a3.var1);
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
}

+ (id)unknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 displayName:(id)a14
{
  BOOL v31 = a5;
  id v18 = a6;
  id v19 = a14;
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a8;
  id v24 = a7;
  id v25 = a4;
  id v26 = a3;
  id v30 = v18;
  id v27 = +[HKSemanticDate semanticDateWithKeyPath:@"modifiedDate" date:v18];
  id v28 = +[HKUnknownRecord unknownRecordWithType:v26 note:v25 enteredInError:v31 modifiedDate:v18 originIdentifier:v24 locale:v23 extractionVersion:a9 device:v22 metadata:v21 sortDate:v27 country:v20 state:a13 displayName:v19];

  return v28;
}

@end