@interface HKSignedClinicalDataGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataGroup)init;
- (HKSignedClinicalDataGroup)initWithCoder:(id)a3;
- (HKSignedClinicalDataGroup)initWithOptions:(unint64_t)a3 mainRecord:(id)a4 medicalRecords:(id)a5 clinicalRecords:(id)a6 QRRepresentation:(id)a7;
- (HKSignedClinicalDataQRRepresentation)QRRepresentation;
- (HKSignedClinicalDataRecord)mainRecord;
- (NSArray)clinicalRecords;
- (NSArray)medicalRecords;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataGroup

- (HKSignedClinicalDataGroup)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataGroup)initWithOptions:(unint64_t)a3 mainRecord:(id)a4 medicalRecords:(id)a5 clinicalRecords:(id)a6 QRRepresentation:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HKSignedClinicalDataGroup;
  v16 = [(HKSignedClinicalDataGroup *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_options = a3;
    uint64_t v18 = [v12 copy];
    mainRecord = v17->_mainRecord;
    v17->_mainRecord = (HKSignedClinicalDataRecord *)v18;

    uint64_t v20 = [v13 copy];
    medicalRecords = v17->_medicalRecords;
    v17->_medicalRecords = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    clinicalRecords = v17->_clinicalRecords;
    v17->_clinicalRecords = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    QRRepresentation = v17->_QRRepresentation;
    v17->_QRRepresentation = (HKSignedClinicalDataQRRepresentation *)v24;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKSignedClinicalDataGroup *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (unint64_t options = self->_options, options != [(HKSignedClinicalDataGroup *)v7 options]))
    {
      LOBYTE(v14) = 0;
LABEL_39:

      goto LABEL_40;
    }
    mainRecord = self->_mainRecord;
    v10 = [(HKSignedClinicalDataGroup *)v7 mainRecord];
    if (mainRecord != v10)
    {
      uint64_t v11 = [(HKSignedClinicalDataGroup *)v7 mainRecord];
      if (!v11)
      {
        LOBYTE(v14) = 0;
        goto LABEL_38;
      }
      v3 = (void *)v11;
      id v12 = self->_mainRecord;
      id v13 = [(HKSignedClinicalDataGroup *)v7 mainRecord];
      if (![(HKSignedClinicalDataRecord *)v12 isEqual:v13])
      {
        LOBYTE(v14) = 0;
LABEL_37:

        goto LABEL_38;
      }
      v40 = v13;
    }
    medicalRecords = self->_medicalRecords;
    v16 = [(HKSignedClinicalDataGroup *)v7 medicalRecords];
    if (medicalRecords == v16)
    {
      v39 = medicalRecords;
    }
    else
    {
      id v14 = [(HKSignedClinicalDataGroup *)v7 medicalRecords];
      if (!v14) {
        goto LABEL_35;
      }
      v39 = medicalRecords;
      v17 = self->_medicalRecords;
      uint64_t v18 = [(HKSignedClinicalDataGroup *)v7 medicalRecords];
      if (![(NSArray *)v17 isEqualToArray:v18])
      {

        LOBYTE(v14) = 0;
        goto LABEL_36;
      }
      v35 = v18;
      v36 = v14;
    }
    clinicalRecords = self->_clinicalRecords;
    uint64_t v20 = [(HKSignedClinicalDataGroup *)v7 clinicalRecords];
    if (clinicalRecords == v20)
    {
      v37 = v3;
      v38 = clinicalRecords;
    }
    else
    {
      id v14 = [(HKSignedClinicalDataGroup *)v7 clinicalRecords];
      if (!v14)
      {
LABEL_32:

LABEL_33:
        if (v39 != v16)
        {
LABEL_34:
        }
LABEL_35:

LABEL_36:
        id v13 = v40;
        if (mainRecord != v10) {
          goto LABEL_37;
        }
LABEL_38:

        goto LABEL_39;
      }
      v38 = clinicalRecords;
      v21 = self->_clinicalRecords;
      uint64_t v22 = [(HKSignedClinicalDataGroup *)v7 clinicalRecords];
      v23 = v21;
      uint64_t v24 = (void *)v22;
      if (![(NSArray *)v23 isEqualToArray:v22])
      {

        LOBYTE(v14) = 0;
        goto LABEL_33;
      }
      v32 = v24;
      v34 = v14;
      v37 = v3;
    }
    QRRepresentation = self->_QRRepresentation;
    uint64_t v26 = [(HKSignedClinicalDataGroup *)v7 QRRepresentation];
    LOBYTE(v14) = QRRepresentation == (HKSignedClinicalDataQRRepresentation *)v26;
    if (QRRepresentation == (HKSignedClinicalDataQRRepresentation *)v26)
    {
    }
    else
    {
      objc_super v27 = (void *)v26;
      uint64_t v28 = [(HKSignedClinicalDataGroup *)v7 QRRepresentation];
      if (v28)
      {
        v29 = (void *)v28;
        id v14 = self->_QRRepresentation;
        v30 = [(HKSignedClinicalDataGroup *)v7 QRRepresentation];
        LOBYTE(v14) = [v14 isEqual:v30];

        if (v38 == v20)
        {

LABEL_43:
          v3 = v37;
          if (v39 == v16) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }

LABEL_41:
        goto LABEL_43;
      }
    }
    if (v38 == v20) {
      goto LABEL_41;
    }

    v3 = v37;
    goto LABEL_32;
  }
  LOBYTE(v14) = 1;
LABEL_40:

  return (char)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t options = self->_options;
  id v5 = a3;
  [v5 encodeInteger:options forKey:@"options"];
  [v5 encodeObject:self->_mainRecord forKey:@"mainRecord"];
  [v5 encodeObject:self->_medicalRecords forKey:@"medicalRecords"];
  [v5 encodeObject:self->_clinicalRecords forKey:@"clinicalRecords"];
  [v5 encodeObject:self->_QRRepresentation forKey:@"QRRepresentation"];
}

- (HKSignedClinicalDataGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"options"])
  {
    uint64_t v5 = [v4 decodeIntegerForKey:@"options"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mainRecord"];
    v7 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    v8 = [v4 decodeObjectOfClasses:v7 forKey:@"medicalRecords"];
    v9 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"clinicalRecords"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QRRepresentation"];
    self = [(HKSignedClinicalDataGroup *)self initWithOptions:v5 mainRecord:v6 medicalRecords:v8 clinicalRecords:v10 QRRepresentation:v11];

    id v12 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v12 = 0;
  }

  return v12;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKSignedClinicalDataRecord)mainRecord
{
  return self->_mainRecord;
}

- (NSArray)medicalRecords
{
  return self->_medicalRecords;
}

- (NSArray)clinicalRecords
{
  return self->_clinicalRecords;
}

- (HKSignedClinicalDataQRRepresentation)QRRepresentation
{
  return self->_QRRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QRRepresentation, 0);
  objc_storeStrong((id *)&self->_clinicalRecords, 0);
  objc_storeStrong((id *)&self->_medicalRecords, 0);

  objc_storeStrong((id *)&self->_mainRecord, 0);
}

@end