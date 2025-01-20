@interface HKSignedClinicalDataParsingResultItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDHRSOriginalSignedClinicalDataRecord)originalRecord;
- (HKSignedClinicalDataParsingResultItem)init;
- (HKSignedClinicalDataParsingResultItem)initWithCoder:(id)a3;
- (HKSignedClinicalDataParsingResultItem)initWithOriginalRecord:(id)a3 mainRecord:(id)a4;
- (HKSignedClinicalDataRecord)mainRecord;
- (NSData)uniquenessChecksum;
- (id)copyWithOriginalRecord:(id)a3 mainRecord:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataParsingResultItem

- (HKSignedClinicalDataParsingResultItem)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataParsingResultItem)initWithOriginalRecord:(id)a3 mainRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSignedClinicalDataParsingResultItem;
  v8 = [(HKSignedClinicalDataParsingResultItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    originalRecord = v8->_originalRecord;
    v8->_originalRecord = (HDHRSOriginalSignedClinicalDataRecord *)v9;

    uint64_t v11 = [v7 copy];
    mainRecord = v8->_mainRecord;
    v8->_mainRecord = (HKSignedClinicalDataRecord *)v11;
  }
  return v8;
}

- (id)copyWithOriginalRecord:(id)a3 mainRecord:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOriginalRecord:v6 mainRecord:v5];

  return v7;
}

- (NSData)uniquenessChecksum
{
  v2 = [(HDHRSOriginalSignedClinicalDataRecord *)self->_originalRecord rawContent];
  v3 = objc_msgSend(v2, "hk_MD5");

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  originalRecord = self->_originalRecord;
  id v5 = a3;
  [v5 encodeObject:originalRecord forKey:@"OriginalRecord"];
  [v5 encodeObject:self->_mainRecord forKey:@"MainRecord"];
}

- (HKSignedClinicalDataParsingResultItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginalRecord"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MainRecord"];
    if (v6)
    {
      self = [(HKSignedClinicalDataParsingResultItem *)self initWithOriginalRecord:v5 mainRecord:v6];
      id v7 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      id v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKSignedClinicalDataParsingResultItem *)a3;
  id v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    if (![(HKSignedClinicalDataParsingResultItem *)v8 isMemberOfClass:objc_opt_class()])
    {
      char v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    originalRecord = self->_originalRecord;
    v10 = [(HKSignedClinicalDataParsingResultItem *)v8 originalRecord];
    if (originalRecord == v10) {
      goto LABEL_9;
    }
    uint64_t v11 = [(HKSignedClinicalDataParsingResultItem *)v8 originalRecord];
    if (!v11)
    {
      char v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_originalRecord;
    id v4 = [(HKSignedClinicalDataParsingResultItem *)v8 originalRecord];
    if ([(HDHRSOriginalSignedClinicalDataRecord *)v12 isEqual:v4])
    {
LABEL_9:
      mainRecord = self->_mainRecord;
      uint64_t v15 = [(HKSignedClinicalDataParsingResultItem *)v8 mainRecord];
      if (mainRecord == (HKSignedClinicalDataRecord *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HKSignedClinicalDataParsingResultItem *)v8 mainRecord];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_mainRecord;
          v20 = [(HKSignedClinicalDataParsingResultItem *)v8 mainRecord];
          char v13 = [(HKSignedClinicalDataRecord *)v19 isEqual:v20];
        }
        else
        {

          char v13 = 0;
        }
      }
      if (originalRecord == v10) {
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
  uint64_t v3 = [(HDHRSOriginalSignedClinicalDataRecord *)self->_originalRecord hash];
  return [(HKSignedClinicalDataRecord *)self->_mainRecord hash] ^ v3;
}

- (HDHRSOriginalSignedClinicalDataRecord)originalRecord
{
  return self->_originalRecord;
}

- (HKSignedClinicalDataRecord)mainRecord
{
  return self->_mainRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainRecord, 0);

  objc_storeStrong((id *)&self->_originalRecord, 0);
}

@end