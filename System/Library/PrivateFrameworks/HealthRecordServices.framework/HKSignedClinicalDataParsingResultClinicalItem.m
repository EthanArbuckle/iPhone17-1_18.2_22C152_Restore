@interface HKSignedClinicalDataParsingResultClinicalItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataParsingResultClinicalItem)initWithCoder:(id)a3;
- (HKSignedClinicalDataParsingResultClinicalItem)initWithOriginalRecord:(id)a3 mainRecord:(id)a4 verifiableClinicalRecord:(id)a5 medicalRecords:(id)a6 clinicalRecords:(id)a7;
- (HKVerifiableClinicalRecord)verifiableClinicalRecord;
- (NSArray)clinicalRecords;
- (NSArray)medicalRecords;
- (id)copyWithOriginalRecord:(id)a3 mainRecord:(id)a4;
- (id)uniquenessChecksum;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataParsingResultClinicalItem

- (HKSignedClinicalDataParsingResultClinicalItem)initWithOriginalRecord:(id)a3 mainRecord:(id)a4 verifiableClinicalRecord:(id)a5 medicalRecords:(id)a6 clinicalRecords:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  v15 = [(HKSignedClinicalDataParsingResultItem *)&v23 initWithOriginalRecord:a3 mainRecord:a4];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    verifiableClinicalRecord = v15->_verifiableClinicalRecord;
    v15->_verifiableClinicalRecord = (HKVerifiableClinicalRecord *)v16;

    uint64_t v18 = [v13 copy];
    medicalRecords = v15->_medicalRecords;
    v15->_medicalRecords = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    clinicalRecords = v15->_clinicalRecords;
    v15->_clinicalRecords = (NSArray *)v20;
  }
  return v15;
}

- (id)copyWithOriginalRecord:(id)a3 mainRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOriginalRecord:v7 mainRecord:v6 verifiableClinicalRecord:self->_verifiableClinicalRecord medicalRecords:self->_medicalRecords clinicalRecords:self->_clinicalRecords];

  return v8;
}

- (id)uniquenessChecksum
{
  v3 = [(HKSignedClinicalDataParsingResultItem *)self originalRecord];
  uint64_t v4 = [v3 sourceType];

  if (v4 == 2)
  {
    v5 = [(HKSignedClinicalDataParsingResultItem *)self originalRecord];
    id v6 = [v5 rawContent];
    id v7 = objc_msgSend(v6, "hk_MD5");
  }
  else
  {
    v5 = [(NSArray *)self->_clinicalRecords hk_map:&__block_literal_global_1];
    id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_280];
    v8 = objc_msgSend(v6, "hk_map:", &__block_literal_global_283);
    v9 = (void *)[v8 mutableCopy];

    v10 = [(HKSignedClinicalDataParsingResultItem *)self mainRecord];
    v11 = [v10 issuerIdentifier];
    id v12 = [v11 dataUsingEncoding:4];

    if (v12) {
      [v9 addObject:v12];
    }
    id v13 = [(HKSignedClinicalDataParsingResultItem *)self mainRecord];
    id v14 = [v13 subject];
    v15 = [v14 dataForUniquenessChecksumCalculation];

    if (v15) {
      [v9 addObject:v15];
    }
    uint64_t v16 = objc_msgSend(v9, "hk_map:", &__block_literal_global_286);
    id v17 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    uint64_t v18 = objc_msgSend(v16, "hk_foldRightFrom:with:", v17, &__block_literal_global_289);

    id v7 = objc_msgSend(v18, "hk_MD5");
  }

  return v7;
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke(uint64_t a1, void *a2)
{
  return [a2 FHIRResource];
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 resourceType];
  id v7 = [v5 resourceType];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    v9 = [v4 identifier];
    v10 = [v5 identifier];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 data];
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_MD5");
}

id __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)[a2 mutableCopy];
  [v5 appendData:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  id v4 = a3;
  [(HKSignedClinicalDataParsingResultItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_verifiableClinicalRecord, @"VerifiableClinicalRecord", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_medicalRecords forKey:@"MedicalRecords"];
  [v4 encodeObject:self->_clinicalRecords forKey:@"ClinicalRecords"];
}

- (HKSignedClinicalDataParsingResultClinicalItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  objc_super v5 = [(HKSignedClinicalDataParsingResultItem *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VerifiableClinicalRecord"];
    if (v6)
    {
      id v7 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
      uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"MedicalRecords"];
      if (v8)
      {
        uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());

        v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ClinicalRecords"];
        if (v10)
        {
          objc_storeStrong((id *)&v5->_verifiableClinicalRecord, v6);
          objc_storeStrong((id *)&v5->_medicalRecords, v8);
          objc_storeStrong((id *)&v5->_clinicalRecords, v10);
          v11 = v5;
        }
        else
        {
          objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
          v11 = 0;
        }

        id v7 = (void *)v9;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v11 = 0;
      }
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSignedClinicalDataParsingResultClinicalItem *)a3;
  objc_super v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (![(HKSignedClinicalDataParsingResultClinicalItem *)v6 isMemberOfClass:objc_opt_class()]|| (v31.receiver = self, v31.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem, ![(HKSignedClinicalDataParsingResultItem *)&v31 isEqual:v6]))
    {
      LOBYTE(v13) = 0;
LABEL_35:

      goto LABEL_36;
    }
    verifiableClinicalRecord = self->_verifiableClinicalRecord;
    uint64_t v8 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 verifiableClinicalRecord];
    if (verifiableClinicalRecord != v8)
    {
      uint64_t v9 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 verifiableClinicalRecord];
      if (!v9)
      {
        LOBYTE(v13) = 0;
        goto LABEL_34;
      }
      v10 = (void *)v9;
      v11 = self->_verifiableClinicalRecord;
      id v12 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 verifiableClinicalRecord];
      if (![(HKVerifiableClinicalRecord *)v11 isEqual:v12])
      {
        LOBYTE(v13) = 0;
LABEL_33:

        goto LABEL_34;
      }
      v29 = v12;
      v30 = v10;
    }
    medicalRecords = self->_medicalRecords;
    v15 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 medicalRecords];
    if (medicalRecords == v15)
    {
      v28 = verifiableClinicalRecord;
    }
    else
    {
      objc_super v13 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 medicalRecords];
      if (!v13)
      {
        id v12 = v29;
        v10 = v30;
        goto LABEL_27;
      }
      uint64_t v16 = self->_medicalRecords;
      id v17 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 medicalRecords];
      if (![(NSArray *)v16 isEqualToArray:v17])
      {

        LOBYTE(v13) = 0;
        BOOL v24 = verifiableClinicalRecord == v8;
        goto LABEL_32;
      }
      v26 = v17;
      v27 = v13;
      v28 = verifiableClinicalRecord;
    }
    clinicalRecords = self->_clinicalRecords;
    uint64_t v19 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 clinicalRecords];
    LOBYTE(v13) = clinicalRecords == (NSArray *)v19;
    if (clinicalRecords == (NSArray *)v19)
    {
    }
    else
    {
      uint64_t v20 = (void *)v19;
      uint64_t v21 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 clinicalRecords];
      if (v21)
      {
        v22 = (void *)v21;
        objc_super v13 = self->_clinicalRecords;
        objc_super v23 = [(HKSignedClinicalDataParsingResultClinicalItem *)v6 clinicalRecords];
        LOBYTE(v13) = [v13 isEqualToArray:v23];

        if (medicalRecords == v15)
        {

          goto LABEL_31;
        }

LABEL_29:
LABEL_31:
        BOOL v24 = v28 == v8;
LABEL_32:
        id v12 = v29;
        v10 = v30;
        if (!v24) {
          goto LABEL_33;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    if (medicalRecords == v15) {
      goto LABEL_29;
    }

    id v12 = v29;
    v10 = v30;
    verifiableClinicalRecord = v28;
LABEL_27:

    if (verifiableClinicalRecord == v8) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  LOBYTE(v13) = 1;
LABEL_36:

  return (char)v13;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  unint64_t v3 = [(HKSignedClinicalDataParsingResultItem *)&v7 hash];
  uint64_t v4 = [(HKVerifiableClinicalRecord *)self->_verifiableClinicalRecord hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_medicalRecords hash];
  return v4 ^ v5 ^ [(NSArray *)self->_clinicalRecords hash];
}

- (HKVerifiableClinicalRecord)verifiableClinicalRecord
{
  return self->_verifiableClinicalRecord;
}

- (NSArray)medicalRecords
{
  return self->_medicalRecords;
}

- (NSArray)clinicalRecords
{
  return self->_clinicalRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalRecords, 0);
  objc_storeStrong((id *)&self->_medicalRecords, 0);

  objc_storeStrong((id *)&self->_verifiableClinicalRecord, 0);
}

@end