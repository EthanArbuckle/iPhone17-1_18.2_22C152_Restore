@interface HKClinicalDocumentIndexingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalDocumentIndexingRequest)init;
- (HKClinicalDocumentIndexingRequest)initWithCoder:(id)a3;
- (HKClinicalDocumentIndexingRequest)initWithMedicalRecord:(id)a3 attachmentIdentifiers:(id)a4;
- (HKMedicalRecord)medicalRecord;
- (NSArray)attachmentIdentifiers;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalDocumentIndexingRequest

- (HKClinicalDocumentIndexingRequest)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalDocumentIndexingRequest)initWithMedicalRecord:(id)a3 attachmentIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalDocumentIndexingRequest;
  v8 = [(HKClinicalDocumentIndexingRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    medicalRecord = v8->_medicalRecord;
    v8->_medicalRecord = (HKMedicalRecord *)v9;

    uint64_t v11 = [v7 copy];
    attachmentIdentifiers = v8->_attachmentIdentifiers;
    v8->_attachmentIdentifiers = (NSArray *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKClinicalDocumentIndexingRequest *)a3;
  id v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    medicalRecord = self->_medicalRecord;
    v10 = [(HKClinicalDocumentIndexingRequest *)v8 medicalRecord];
    if (medicalRecord == v10) {
      goto LABEL_9;
    }
    uint64_t v11 = [(HKClinicalDocumentIndexingRequest *)v8 medicalRecord];
    if (!v11)
    {
      char v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_medicalRecord;
    uint64_t v4 = [(HKClinicalDocumentIndexingRequest *)v8 medicalRecord];
    if ([(HKMedicalRecord *)v12 isEqual:v4])
    {
LABEL_9:
      attachmentIdentifiers = self->_attachmentIdentifiers;
      uint64_t v15 = [(HKClinicalDocumentIndexingRequest *)v8 attachmentIdentifiers];
      if (attachmentIdentifiers == (NSArray *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HKClinicalDocumentIndexingRequest *)v8 attachmentIdentifiers];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_attachmentIdentifiers;
          v20 = [(HKClinicalDocumentIndexingRequest *)v8 attachmentIdentifiers];
          char v13 = [(NSArray *)v19 isEqualToArray:v20];
        }
        else
        {

          char v13 = 0;
        }
      }
      if (medicalRecord == v10) {
        goto LABEL_17;
      }
    }
    else
    {
      char v13 = 0;
    }

    goto LABEL_17;
  }
  char v13 = 1;
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKMedicalRecord *)self->_medicalRecord hash];
  return [(NSArray *)self->_attachmentIdentifiers hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  medicalRecord = self->_medicalRecord;
  id v5 = a3;
  [v5 encodeObject:medicalRecord forKey:@"MedicalRecord"];
  [v5 encodeObject:self->_attachmentIdentifiers forKey:@"AttachmentIdentifiers"];
}

- (HKClinicalDocumentIndexingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicalRecord"];
  uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AttachmentIdentifiers"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v9 = 0;
  }
  else
  {
    self = [(HKClinicalDocumentIndexingRequest *)self initWithMedicalRecord:v5 attachmentIdentifiers:v6];
    uint64_t v9 = self;
  }

  return v9;
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (NSArray)attachmentIdentifiers
{
  return self->_attachmentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifiers, 0);

  objc_storeStrong((id *)&self->_medicalRecord, 0);
}

@end