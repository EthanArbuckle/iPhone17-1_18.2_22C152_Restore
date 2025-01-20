@interface HKSignedClinicalDataItem
+ (BOOL)supportsSecureCoding;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
+ (id)itemWithPrimaryConceptCodingCollection:(id)a3 relevantDate:(id)a4 medicalRecordSampleID:(id)a5;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKConcept)primaryConcept;
- (HKMedicalCodingCollection)primaryConceptCodingCollection;
- (HKSignedClinicalDataItem)initWithCoder:(id)a3;
- (HKSignedClinicalDataItem)initWithPrimaryConceptCodingCollection:(id)a3 relevantDate:(id)a4 medicalRecordSampleID:(id)a5;
- (NSDate)relevantDate;
- (NSString)debugDescription;
- (NSUUID)medicalRecordSampleID;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataItem

- (HKSignedClinicalDataItem)initWithPrimaryConceptCodingCollection:(id)a3 relevantDate:(id)a4 medicalRecordSampleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSignedClinicalDataItem;
  v11 = [(HKSignedClinicalDataItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    primaryConceptCodingCollection = v11->_primaryConceptCodingCollection;
    v11->_primaryConceptCodingCollection = (HKMedicalCodingCollection *)v12;

    uint64_t v14 = [v9 copy];
    relevantDate = v11->_relevantDate;
    v11->_relevantDate = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    medicalRecordSampleID = v11->_medicalRecordSampleID;
    v11->_medicalRecordSampleID = (NSUUID *)v16;
  }
  return v11;
}

+ (id)itemWithPrimaryConceptCodingCollection:(id)a3 relevantDate:(id)a4 medicalRecordSampleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithPrimaryConceptCodingCollection:v10 relevantDate:v9 medicalRecordSampleID:v8];

  return v11;
}

- (HKConcept)primaryConcept
{
  primaryConcept = self->_primaryConcept;
  if (!primaryConcept)
  {
    v4 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:self->_primaryConceptCodingCollection];
    v5 = self->_primaryConcept;
    self->_primaryConcept = v4;

    primaryConcept = self->_primaryConcept;
  }

  return primaryConcept;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMedicalCodingCollection *)self->_primaryConceptCodingCollection hash];
  uint64_t v4 = [(NSDate *)self->_relevantDate hash] ^ v3;
  return v4 ^ [(NSUUID *)self->_medicalRecordSampleID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSignedClinicalDataItem *)a3;
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
      primaryConceptCodingCollection = self->_primaryConceptCodingCollection;
      v7 = [(HKSignedClinicalDataItem *)v5 primaryConceptCodingCollection];
      if (primaryConceptCodingCollection != v7)
      {
        uint64_t v8 = [(HKSignedClinicalDataItem *)v5 primaryConceptCodingCollection];
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        id v9 = (void *)v8;
        id v10 = self->_primaryConceptCodingCollection;
        v11 = [(HKSignedClinicalDataItem *)v5 primaryConceptCodingCollection];
        if (![(HKMedicalCodingCollection *)v10 isEqual:v11])
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      relevantDate = self->_relevantDate;
      uint64_t v14 = [(HKSignedClinicalDataItem *)v5 relevantDate];
      if (relevantDate != v14)
      {
        uint64_t v12 = [(HKSignedClinicalDataItem *)v5 relevantDate];
        if (!v12) {
          goto LABEL_24;
        }
        v15 = self->_relevantDate;
        uint64_t v16 = [(HKSignedClinicalDataItem *)v5 relevantDate];
        if (![(NSDate *)v15 isEqualToDate:v16])
        {

          LOBYTE(v12) = 0;
LABEL_27:
          BOOL v23 = primaryConceptCodingCollection == v7;
          id v9 = v28;
LABEL_28:
          v11 = v29;
          if (!v23) {
            goto LABEL_29;
          }
LABEL_30:

          goto LABEL_31;
        }
        v25 = v16;
        v27 = v12;
      }
      medicalRecordSampleID = self->_medicalRecordSampleID;
      uint64_t v18 = [(HKSignedClinicalDataItem *)v5 medicalRecordSampleID];
      LOBYTE(v12) = medicalRecordSampleID == (NSUUID *)v18;
      if (medicalRecordSampleID == (NSUUID *)v18)
      {
      }
      else
      {
        objc_super v19 = (void *)v18;
        uint64_t v20 = [(HKSignedClinicalDataItem *)v5 medicalRecordSampleID];
        if (v20)
        {
          v21 = (void *)v20;
          uint64_t v12 = self->_medicalRecordSampleID;
          v22 = [(HKSignedClinicalDataItem *)v5 medicalRecordSampleID];
          LOBYTE(v12) = [v12 isEqual:v22];

          if (relevantDate == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }
      }
      if (relevantDate == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      id v9 = v28;

      BOOL v23 = primaryConceptCodingCollection == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = [(HKMedicalCodingCollection *)self->_primaryConceptCodingCollection description];
  v5 = [(NSDate *)self->_relevantDate description];
  v6 = [(NSUUID *)self->_medicalRecordSampleID description];
  v7 = [v3 stringWithFormat:@"Primary concept coding collection: %@, relevantDate: %@, sample ID: %@", v4, v5, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSignedClinicalDataItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSignedClinicalDataItem;
  v5 = [(HKSignedClinicalDataItem *)&v16 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryConceptCodingCollection"];
  primaryConceptCodingCollection = v5->_primaryConceptCodingCollection;
  v5->_primaryConceptCodingCollection = (HKMedicalCodingCollection *)v6;

  if (!v5->_primaryConceptCodingCollection) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryConcept"];
  primaryConcept = v5->_primaryConcept;
  v5->_primaryConcept = (HKConcept *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelevantDate"];
  relevantDate = v5->_relevantDate;
  v5->_relevantDate = (NSDate *)v10;

  if (!v5->_relevantDate) {
    goto LABEL_6;
  }
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicalRecordSampleID"];
  medicalRecordSampleID = v5->_medicalRecordSampleID;
  v5->_medicalRecordSampleID = (NSUUID *)v12;

  if (v5->_medicalRecordSampleID) {
LABEL_5:
  }
    uint64_t v14 = v5;
  else {
LABEL_6:
  }
    uint64_t v14 = 0;

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  primaryConceptCodingCollection = self->_primaryConceptCodingCollection;
  id v5 = a3;
  [v5 encodeObject:primaryConceptCodingCollection forKey:@"PrimaryConceptCodingCollection"];
  [v5 encodeObject:self->_primaryConcept forKey:@"PrimaryConcept"];
  [v5 encodeObject:self->_relevantDate forKey:@"RelevantDate"];
  [v5 encodeObject:self->_medicalRecordSampleID forKey:@"MedicalRecordSampleID"];
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v6 = a4;
  +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v6 inClass:objc_opt_class()];

  return 0;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v5 inClass:objc_opt_class()];

  return 0;
}

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (HKMedicalCodingCollection)primaryConceptCodingCollection
{
  return self->_primaryConceptCodingCollection;
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (NSUUID)medicalRecordSampleID
{
  return self->_medicalRecordSampleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalRecordSampleID, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_primaryConceptCodingCollection, 0);

  objc_storeStrong((id *)&self->_primaryConcept, 0);
}

@end