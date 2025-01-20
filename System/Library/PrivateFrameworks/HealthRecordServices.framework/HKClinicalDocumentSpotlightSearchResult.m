@interface HKClinicalDocumentSpotlightSearchResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalDocumentSpotlightSearchResult)init;
- (HKClinicalDocumentSpotlightSearchResult)initWithCoder:(id)a3;
- (HKClinicalDocumentSpotlightSearchResult)initWithTitle:(id)a3 medicalRecord:(id)a4 attachmentUUID:(id)a5 previewString:(id)a6 previewStringMatchRanges:(id)a7;
- (HKMedicalRecord)medicalRecord;
- (NSArray)previewStringMatchRanges;
- (NSString)previewString;
- (NSString)title;
- (NSUUID)attachmentUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalDocumentSpotlightSearchResult

- (HKClinicalDocumentSpotlightSearchResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalDocumentSpotlightSearchResult)initWithTitle:(id)a3 medicalRecord:(id)a4 attachmentUUID:(id)a5 previewString:(id)a6 previewStringMatchRanges:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKClinicalDocumentSpotlightSearchResult;
  v17 = [(HKClinicalDocumentSpotlightSearchResult *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    medicalRecord = v17->_medicalRecord;
    v17->_medicalRecord = (HKMedicalRecord *)v20;

    uint64_t v22 = [v14 copy];
    attachmentUUID = v17->_attachmentUUID;
    v17->_attachmentUUID = (NSUUID *)v22;

    uint64_t v24 = [v15 copy];
    previewString = v17->_previewString;
    v17->_previewString = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    previewStringMatchRanges = v17->_previewStringMatchRanges;
    v17->_previewStringMatchRanges = (NSArray *)v26;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKClinicalDocumentSpotlightSearchResult *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      title = self->_title;
      v8 = [(HKClinicalDocumentSpotlightSearchResult *)v6 title];
      if (title != v8)
      {
        uint64_t v9 = [(HKClinicalDocumentSpotlightSearchResult *)v6 title];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_52;
        }
        v10 = (void *)v9;
        v11 = self->_title;
        id v12 = [(HKClinicalDocumentSpotlightSearchResult *)v6 title];
        if (![(NSString *)v11 isEqualToString:v12])
        {
          char v13 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v57 = v10;
        v56 = v12;
      }
      medicalRecord = self->_medicalRecord;
      id v15 = [(HKClinicalDocumentSpotlightSearchResult *)v6 medicalRecord];
      if (medicalRecord != v15)
      {
        uint64_t v16 = [(HKClinicalDocumentSpotlightSearchResult *)v6 medicalRecord];
        if (!v16)
        {
LABEL_32:

LABEL_33:
          char v13 = 0;
          goto LABEL_50;
        }
        v55 = (void *)v16;
        v17 = self->_medicalRecord;
        v3 = [(HKClinicalDocumentSpotlightSearchResult *)v6 medicalRecord];
        if (([(HKMedicalRecord *)v17 isEqual:v3] & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
      }
      attachmentUUID = self->_attachmentUUID;
      v19 = [(HKClinicalDocumentSpotlightSearchResult *)v6 attachmentUUID];
      v54 = attachmentUUID;
      if (attachmentUUID == v19)
      {
        v53 = medicalRecord;
        uint64_t v26 = v15;
      }
      else
      {
        uint64_t v20 = [(HKClinicalDocumentSpotlightSearchResult *)v6 attachmentUUID];
        if (!v20)
        {
          v52 = v3;
          char v13 = 0;
          goto LABEL_47;
        }
        v51 = (void *)v20;
        v53 = medicalRecord;
        v21 = v19;
        uint64_t v22 = self->_attachmentUUID;
        uint64_t v23 = [(HKClinicalDocumentSpotlightSearchResult *)v6 attachmentUUID];
        uint64_t v24 = v22;
        v25 = (void *)v23;
        if (([(NSUUID *)v24 isEqual:v23] & 1) == 0)
        {

          if (medicalRecord == v15)
          {

            goto LABEL_33;
          }
          goto LABEL_31;
        }
        uint64_t v26 = v15;
        v47 = v25;
        v19 = v21;
      }
      previewString = self->_previewString;
      uint64_t v28 = [(HKClinicalDocumentSpotlightSearchResult *)v6 previewString];
      objc_super v29 = (void *)v28;
      v50 = previewString;
      v52 = v3;
      if (previewString == (NSString *)v28)
      {
        v48 = (NSString *)v28;
        v49 = v19;
        id v15 = v26;
      }
      else
      {
        uint64_t v30 = [(HKClinicalDocumentSpotlightSearchResult *)v6 previewString];
        if (!v30)
        {
          char v13 = 0;
          id v15 = v26;
          medicalRecord = v53;
          v42 = v54;
          goto LABEL_37;
        }
        v46 = (void *)v30;
        v49 = v19;
        v31 = self->_previewString;
        uint64_t v32 = [(HKClinicalDocumentSpotlightSearchResult *)v6 previewString];
        v33 = v31;
        v34 = (void *)v32;
        id v15 = v26;
        if (![(NSString *)v33 isEqualToString:v32])
        {

          char v13 = 0;
          v19 = v49;
          medicalRecord = v53;
          v43 = v54;
          goto LABEL_45;
        }
        v45 = v34;
        v48 = (NSString *)v29;
      }
      previewStringMatchRanges = self->_previewStringMatchRanges;
      uint64_t v36 = [(HKClinicalDocumentSpotlightSearchResult *)v6 previewStringMatchRanges];
      char v13 = previewStringMatchRanges == (NSArray *)v36;
      if (previewStringMatchRanges == (NSArray *)v36)
      {

        objc_super v29 = v48;
        medicalRecord = v53;
        if (v50 == v48) {
          goto LABEL_41;
        }
      }
      else
      {
        v37 = (void *)v36;
        uint64_t v38 = [(HKClinicalDocumentSpotlightSearchResult *)v6 previewStringMatchRanges];
        medicalRecord = v53;
        if (v38)
        {
          v39 = (void *)v38;
          v40 = self->_previewStringMatchRanges;
          v41 = [(HKClinicalDocumentSpotlightSearchResult *)v6 previewStringMatchRanges];
          char v13 = [(NSArray *)v40 isEqual:v41];

          if (v50 == v48)
          {
          }
          else
          {
          }
          goto LABEL_44;
        }

        objc_super v29 = v48;
        if (v50 == v48)
        {
LABEL_41:

LABEL_44:
          v19 = v49;
          v43 = v54;
LABEL_45:
          if (v43 != v19)
          {
LABEL_46:
          }
LABEL_47:

          if (medicalRecord != v15)
          {
          }
LABEL_50:
          id v12 = v56;
          v10 = v57;
          if (title != v8) {
            goto LABEL_51;
          }
LABEL_52:

          goto LABEL_53;
        }
      }

      v19 = v49;
      v42 = v54;
LABEL_37:

      if (v42 == v19) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    char v13 = 0;
  }
LABEL_53:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  uint64_t v4 = [(HKMedicalRecord *)self->_medicalRecord hash] ^ v3;
  uint64_t v5 = [(NSUUID *)self->_attachmentUUID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_previewString hash];
  return v6 ^ [(NSArray *)self->_previewStringMatchRanges hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalDocumentSpotlightSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
  NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicalRecord"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AttachmentUUID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreviewString"];
  uint64_t v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PreviewStringMatchRanges"];
  if (v5 && v6 && v7)
  {
    self = [(HKClinicalDocumentSpotlightSearchResult *)self initWithTitle:v5 medicalRecord:v6 attachmentUUID:v7 previewString:v8 previewStringMatchRanges:v9];
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"Title"];
  [v5 encodeObject:self->_previewString forKey:@"PreviewString"];
  [v5 encodeObject:self->_attachmentUUID forKey:@"AttachmentUUID"];
  [v5 encodeObject:self->_medicalRecord forKey:@"MedicalRecord"];
  [v5 encodeObject:self->_previewStringMatchRanges forKey:@"PreviewStringMatchRanges"];
}

- (NSString)title
{
  return self->_title;
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (NSUUID)attachmentUUID
{
  return self->_attachmentUUID;
}

- (NSString)previewString
{
  return self->_previewString;
}

- (NSArray)previewStringMatchRanges
{
  return self->_previewStringMatchRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewStringMatchRanges, 0);
  objc_storeStrong((id *)&self->_previewString, 0);
  objc_storeStrong((id *)&self->_attachmentUUID, 0);
  objc_storeStrong((id *)&self->_medicalRecord, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end