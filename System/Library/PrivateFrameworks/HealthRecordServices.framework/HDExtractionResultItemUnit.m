@interface HDExtractionResultItemUnit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDExtractionResultItemUnit)initWithCoder:(id)a3;
- (HDExtractionResultItemUnit)initWithMedicalRecord:(id)a3 clinicalRecord:(id)a4 downloadableAttachments:(id)a5;
- (HKClinicalRecord)clinicalRecord;
- (HKMedicalRecord)medicalRecord;
- (NSArray)downloadableAttachments;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDExtractionResultItemUnit

- (HDExtractionResultItemUnit)initWithMedicalRecord:(id)a3 clinicalRecord:(id)a4 downloadableAttachments:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDExtractionResultItemUnit.m", 23, @"Invalid parameter not satisfying: %@", @"medicalRecord" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)HDExtractionResultItemUnit;
  v12 = [(HDExtractionResultItemUnit *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    medicalRecord = v12->_medicalRecord;
    v12->_medicalRecord = (HKMedicalRecord *)v13;

    uint64_t v15 = [v10 copy];
    clinicalRecord = v12->_clinicalRecord;
    v12->_clinicalRecord = (HKClinicalRecord *)v15;

    uint64_t v17 = [v11 copy];
    downloadableAttachments = v12->_downloadableAttachments;
    v12->_downloadableAttachments = (NSArray *)v17;
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDExtractionResultItemUnit *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      medicalRecord = self->_medicalRecord;
      v7 = [(HDExtractionResultItemUnit *)v5 medicalRecord];
      if (medicalRecord != v7)
      {
        uint64_t v8 = [(HDExtractionResultItemUnit *)v5 medicalRecord];
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        id v9 = (void *)v8;
        id v10 = self->_medicalRecord;
        id v11 = [(HDExtractionResultItemUnit *)v5 medicalRecord];
        if (![(HKMedicalRecord *)v10 isEqual:v11])
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      clinicalRecord = self->_clinicalRecord;
      v14 = [(HDExtractionResultItemUnit *)v5 clinicalRecord];
      if (clinicalRecord != v14)
      {
        v12 = [(HDExtractionResultItemUnit *)v5 clinicalRecord];
        if (!v12) {
          goto LABEL_24;
        }
        uint64_t v15 = self->_clinicalRecord;
        v16 = [(HDExtractionResultItemUnit *)v5 clinicalRecord];
        if (([(HKClinicalRecord *)v15 isEqual:v16] & 1) == 0)
        {

          LOBYTE(v12) = 0;
LABEL_27:
          BOOL v23 = medicalRecord == v7;
          id v9 = v28;
LABEL_28:
          id v11 = v29;
          if (!v23) {
            goto LABEL_29;
          }
LABEL_30:

          goto LABEL_31;
        }
        v25 = v16;
        v27 = v12;
      }
      downloadableAttachments = self->_downloadableAttachments;
      uint64_t v18 = [(HDExtractionResultItemUnit *)v5 downloadableAttachments];
      LOBYTE(v12) = downloadableAttachments == (NSArray *)v18;
      if (downloadableAttachments == (NSArray *)v18)
      {
      }
      else
      {
        v19 = (void *)v18;
        uint64_t v20 = [(HDExtractionResultItemUnit *)v5 downloadableAttachments];
        if (v20)
        {
          objc_super v21 = (void *)v20;
          v12 = self->_downloadableAttachments;
          v22 = [(HDExtractionResultItemUnit *)v5 downloadableAttachments];
          LOBYTE(v12) = [v12 isEqualToArray:v22];

          if (clinicalRecord == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }
      }
      if (clinicalRecord == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      id v9 = v28;

      BOOL v23 = medicalRecord == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKMedicalRecord *)self->_medicalRecord hash];
  uint64_t v4 = [(HKClinicalRecord *)self->_clinicalRecord hash] ^ v3;
  return v4 ^ [(NSArray *)self->_downloadableAttachments hash];
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = HKStringFromBool();
  v7 = HKStringFromBool();
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p, medical record: %@, clinical record: %@, downloadable attachments: %lu>", v5, self, v6, v7, -[NSArray count](self->_downloadableAttachments, "count")];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExtractionResultItemUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"medicalRecord"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clinicalRecord"];
    v7 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"downloadableAttachments"];
    self = [(HDExtractionResultItemUnit *)self initWithMedicalRecord:v5 clinicalRecord:v6 downloadableAttachments:v8];

    id v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  medicalRecord = self->_medicalRecord;
  id v5 = a3;
  [v5 encodeObject:medicalRecord forKey:@"medicalRecord"];
  [v5 encodeObject:self->_clinicalRecord forKey:@"clinicalRecord"];
  [v5 encodeObject:self->_downloadableAttachments forKey:@"downloadableAttachments"];
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (HKClinicalRecord)clinicalRecord
{
  return self->_clinicalRecord;
}

- (NSArray)downloadableAttachments
{
  return self->_downloadableAttachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadableAttachments, 0);
  objc_storeStrong((id *)&self->_clinicalRecord, 0);

  objc_storeStrong((id *)&self->_medicalRecord, 0);
}

@end