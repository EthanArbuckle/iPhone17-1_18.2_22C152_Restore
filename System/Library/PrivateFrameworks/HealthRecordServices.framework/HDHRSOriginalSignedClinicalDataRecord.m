@interface HDHRSOriginalSignedClinicalDataRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDHRSOriginalSignedClinicalDataRecord)initWithCoder:(id)a3;
- (HDHRSOriginalSignedClinicalDataRecord)initWithRawContent:(id)a3 sourceType:(int64_t)a4 sourceURL:(id)a5 issuerIdentifier:(id)a6 credentialTypes:(id)a7 syncIdentifier:(id)a8 metadata:(id)a9 receivedDate:(id)a10 receivedDateTimeZone:(id)a11 signatureStatus:(int64_t)a12;
- (NSArray)credentialTypes;
- (NSData)rawContent;
- (NSDate)receivedDate;
- (NSDictionary)metadata;
- (NSString)issuerIdentifier;
- (NSTimeZone)receivedDateTimeZone;
- (NSURL)sourceURL;
- (NSUUID)syncIdentifier;
- (int64_t)signatureStatus;
- (int64_t)sourceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHRSOriginalSignedClinicalDataRecord

- (HDHRSOriginalSignedClinicalDataRecord)initWithRawContent:(id)a3 sourceType:(int64_t)a4 sourceURL:(id)a5 issuerIdentifier:(id)a6 credentialTypes:(id)a7 syncIdentifier:(id)a8 metadata:(id)a9 receivedDate:(id)a10 receivedDateTimeZone:(id)a11 signatureStatus:(int64_t)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v44.receiver = self;
  v44.super_class = (Class)HDHRSOriginalSignedClinicalDataRecord;
  v26 = [(HDHRSOriginalSignedClinicalDataRecord *)&v44 init];
  if (v26)
  {
    uint64_t v27 = [v18 copy];
    rawContent = v26->_rawContent;
    v26->_rawContent = (NSData *)v27;

    v26->_sourceType = a4;
    uint64_t v29 = [v19 copy];
    sourceURL = v26->_sourceURL;
    v26->_sourceURL = (NSURL *)v29;

    uint64_t v31 = [v20 copy];
    issuerIdentifier = v26->_issuerIdentifier;
    v26->_issuerIdentifier = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    credentialTypes = v26->_credentialTypes;
    v26->_credentialTypes = (NSArray *)v33;

    uint64_t v35 = [v22 copy];
    syncIdentifier = v26->_syncIdentifier;
    v26->_syncIdentifier = (NSUUID *)v35;

    uint64_t v37 = [v23 copy];
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v37;

    uint64_t v39 = [v24 copy];
    receivedDate = v26->_receivedDate;
    v26->_receivedDate = (NSDate *)v39;

    uint64_t v41 = [v25 copy];
    receivedDateTimeZone = v26->_receivedDateTimeZone;
    v26->_receivedDateTimeZone = (NSTimeZone *)v41;

    v26->_signatureStatus = a12;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HDHRSOriginalSignedClinicalDataRecord *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v14 = 0;
LABEL_80:

      goto LABEL_81;
    }
    rawContent = self->_rawContent;
    v9 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 rawContent];
    if (rawContent == v9)
    {
      int64_t sourceType = self->_sourceType;
      if (sourceType == [(HDHRSOriginalSignedClinicalDataRecord *)v7 sourceType]) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v10 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 rawContent];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = self->_rawContent;
        v3 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 rawContent];
        if (([(NSData *)v12 isEqual:v3] & 1) == 0
          || (int64_t v13 = self->_sourceType, v13 != [(HDHRSOriginalSignedClinicalDataRecord *)v7 sourceType]))
        {
          BOOL v14 = 0;
LABEL_78:

          goto LABEL_79;
        }
        v96 = v11;
LABEL_11:
        sourceURL = self->_sourceURL;
        v17 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 sourceURL];
        if (sourceURL != v17)
        {
          uint64_t v18 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 sourceURL];
          if (!v18) {
            goto LABEL_75;
          }
          v95 = (void *)v18;
          id v19 = self->_sourceURL;
          uint64_t v20 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 sourceURL];
          id v21 = v19;
          id v22 = (void *)v20;
          if (([(NSURL *)v21 isEqual:v20] & 1) == 0)
          {

LABEL_74:
            goto LABEL_75;
          }
          v92 = v22;
        }
        issuerIdentifier = self->_issuerIdentifier;
        id v24 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 issuerIdentifier];
        v94 = issuerIdentifier;
        if (issuerIdentifier != v24)
        {
          uint64_t v25 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 issuerIdentifier];
          if (!v25)
          {

            if (sourceURL == v17)
            {

LABEL_76:
              BOOL v14 = 0;
              goto LABEL_77;
            }
            goto LABEL_73;
          }
          v87 = v3;
          v86 = (void *)v25;
          v26 = v17;
          uint64_t v27 = v24;
          v28 = sourceURL;
          uint64_t v29 = self->_issuerIdentifier;
          v30 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 issuerIdentifier];
          if (![(NSString *)v29 isEqualToString:v30])
          {

            if (v28 == v26)
            {
            }
            else
            {
            }
            BOOL v14 = 0;
            v11 = v96;
            v3 = v87;
            if (rawContent == v9) {
              goto LABEL_79;
            }
            goto LABEL_78;
          }
          sourceURL = v28;
          id v24 = v27;
          v17 = v26;
          v83 = v30;
          v3 = v87;
        }
        credentialTypes = self->_credentialTypes;
        v93 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 credentialTypes];
        v85 = credentialTypes;
        if (credentialTypes != v93)
        {
          uint64_t v32 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 credentialTypes];
          if (!v32)
          {

            if (v94 == v24)
            {

              goto LABEL_72;
            }
LABEL_70:

LABEL_71:
LABEL_72:
            if (sourceURL != v17)
            {
LABEL_73:

              goto LABEL_74;
            }
LABEL_75:

            goto LABEL_76;
          }
          v82 = (void *)v32;
          v88 = sourceURL;
          uint64_t v33 = v3;
          v34 = self->_credentialTypes;
          uint64_t v35 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 credentialTypes];
          v36 = v34;
          uint64_t v37 = (void *)v35;
          if (![(NSArray *)v36 isEqualToArray:v35])
          {

            v3 = v33;
            if (v94 == v24)
            {
            }
            else
            {
            }
            v11 = v96;
            if (v88 == v17) {
              goto LABEL_58;
            }
            goto LABEL_57;
          }
          v79 = v37;
          v3 = v33;
          sourceURL = v88;
        }
        syncIdentifier = self->_syncIdentifier;
        [(HDHRSOriginalSignedClinicalDataRecord *)v7 syncIdentifier];
        v81 = syncIdentifier;
        v84 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        if (syncIdentifier == v84) {
          goto LABEL_36;
        }
        uint64_t v39 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 syncIdentifier];
        if (v39)
        {
          v78 = (void *)v39;
          v89 = sourceURL;
          v40 = v3;
          uint64_t v41 = self->_syncIdentifier;
          uint64_t v42 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 syncIdentifier];
          v43 = v41;
          objc_super v44 = (void *)v42;
          if ([(NSUUID *)v43 isEqual:v42])
          {
            v75 = v44;
            v3 = v40;
            sourceURL = v89;
LABEL_36:
            metadata = self->_metadata;
            v80 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 metadata];
            v77 = metadata;
            if (metadata != v80)
            {
              uint64_t v46 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 metadata];
              if (!v46)
              {
                BOOL v14 = 0;
                goto LABEL_91;
              }
              v74 = (void *)v46;
              v47 = v83;
              v90 = v17;
              v48 = v24;
              v49 = sourceURL;
              v50 = v3;
              v51 = self->_metadata;
              v73 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 metadata];
              if (!-[NSDictionary isEqual:](v51, "isEqual:"))
              {
                BOOL v14 = 0;
                v3 = v50;
                sourceURL = v49;
                id v24 = v48;
                v17 = v90;
                goto LABEL_67;
              }
              v3 = v50;
              sourceURL = v49;
              id v24 = v48;
              v17 = v90;
            }
            receivedDate = self->_receivedDate;
            v76 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 receivedDate];
            if (receivedDate == v76)
            {
              v72 = receivedDate;
              v91 = v3;
            }
            else
            {
              uint64_t v53 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 receivedDate];
              if (!v53)
              {
LABEL_100:

                BOOL v14 = 0;
LABEL_103:
                if (v77 != v80)
                {
                }
                if (v81 != v84)
                {
                }
                if (v85 != v93)
                {
                }
                goto LABEL_109;
              }
              v71 = (void *)v53;
              v72 = receivedDate;
              v91 = v3;
              v54 = self->_receivedDate;
              receivedDate = [(HDHRSOriginalSignedClinicalDataRecord *)v7 receivedDate];
              if (![(NSDate *)v54 isEqualToDate:receivedDate])
              {
                v69 = receivedDate;
                BOOL v14 = 0;
                v3 = v91;
                v55 = v76;

LABEL_89:
                v66 = v77;
                if (v77 == v80)
                {
LABEL_92:

                  if (v81 != v84)
                  {
                  }
                  if (v85 != v93)
                  {
                  }
LABEL_109:

                  if (v94 != v24)
                  {
                  }
                  if (sourceURL != v17)
                  {
                  }
LABEL_77:
                  v11 = v96;
                  if (rawContent != v9) {
                    goto LABEL_78;
                  }
LABEL_79:

                  goto LABEL_80;
                }

LABEL_91:
                v66 = v80;
                goto LABEL_92;
              }
            }
            receivedDateTimeZone = self->_receivedDateTimeZone;
            uint64_t v57 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 receivedDateTimeZone];
            if (receivedDateTimeZone == (NSTimeZone *)v57)
            {
              v70 = receivedDate;
              int64_t signatureStatus = self->_signatureStatus;
              BOOL v14 = signatureStatus == [(HDHRSOriginalSignedClinicalDataRecord *)v7 signatureStatus];

              v55 = v76;
              v3 = v91;
              if (v72 != v76) {
                goto LABEL_88;
              }
            }
            else
            {
              v68 = (void *)v57;
              uint64_t v58 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 receivedDateTimeZone];
              if (v58)
              {
                v67 = (void *)v58;
                v59 = self->_receivedDateTimeZone;
                uint64_t v60 = [(HDHRSOriginalSignedClinicalDataRecord *)v7 receivedDateTimeZone];
                v61 = v59;
                v62 = (void *)v60;
                if (-[NSTimeZone isEqual:](v61, "isEqual:"))
                {
                  v70 = receivedDate;
                  int64_t v63 = self->_signatureStatus;
                  BOOL v14 = v63 == [(HDHRSOriginalSignedClinicalDataRecord *)v7 signatureStatus];

                  v55 = v76;
                  if (v72 != v76)
                  {
                    v3 = v91;
LABEL_88:

                    goto LABEL_89;
                  }

                  v66 = v77;
                  v3 = v91;
                  if (v77 == v80) {
                    goto LABEL_92;
                  }
                  v47 = v83;
LABEL_67:
                  v83 = v47;

                  goto LABEL_91;
                }
              }
              if (v72 != v76)
              {

                v3 = v91;
                goto LABEL_100;
              }
              BOOL v14 = 0;
              v3 = v91;
              v55 = v76;
            }

            goto LABEL_103;
          }

          v3 = v40;
          if (v85 == v93)
          {
          }
          else
          {
          }
          v11 = v96;
          if (v94 != v24)
          {
          }
          if (v89 == v17)
          {
LABEL_58:

            BOOL v14 = 0;
            if (rawContent == v9) {
              goto LABEL_79;
            }
            goto LABEL_78;
          }
LABEL_57:

          goto LABEL_58;
        }

        if (v85 == v93)
        {
        }
        else
        {
        }
        if (v94 == v24) {
          goto LABEL_71;
        }
        goto LABEL_70;
      }
    }
    BOOL v14 = 0;
    goto LABEL_79;
  }
  BOOL v14 = 1;
LABEL_81:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  rawContent = self->_rawContent;
  id v5 = a3;
  [v5 encodeObject:rawContent forKey:@"RawContent"];
  [v5 encodeInteger:self->_sourceType forKey:@"SourceType"];
  [v5 encodeObject:self->_sourceURL forKey:@"SourceURL"];
  [v5 encodeObject:self->_issuerIdentifier forKey:@"IssuerIdentifier"];
  [v5 encodeObject:self->_credentialTypes forKey:@"CredentialTypes"];
  [v5 encodeObject:self->_syncIdentifier forKey:@"SyncIdentifier"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
  [v5 encodeObject:self->_receivedDate forKey:@"ReceivedDate"];
  [v5 encodeObject:self->_receivedDateTimeZone forKey:@"ReceivedDateTimeZone"];
  [v5 encodeInteger:self->_signatureStatus forKey:@"SignatureStatus"];
}

- (HDHRSOriginalSignedClinicalDataRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"SourceURL"]
    && ([v4 containsValueForKey:@"SignatureStatus"] & 1) != 0)
  {
    uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RawContent"];
    uint64_t v6 = [v4 decodeIntegerForKey:@"SourceType"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssuerIdentifier"];
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyncIdentifier"];
    id v23 = (void *)v8;
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:@"CredentialTypes"];
    v11 = objc_msgSend(NSDictionary, "hk_secureCodingClasses");
    uint64_t v22 = [v4 decodeObjectOfClasses:v11 forKey:@"Metadata"];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReceivedDate"];
    int64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReceivedDateTimeZone"];
    uint64_t v14 = [v4 decodeIntegerForKey:@"SignatureStatus"];
    id v21 = (void *)v5;
    if (v5 && v7 && v10 && v9 && v12 && v13)
    {
      v15 = (void *)v22;
      uint64_t v16 = v6;
      v17 = (void *)v24;
      self = -[HDHRSOriginalSignedClinicalDataRecord initWithRawContent:sourceType:sourceURL:issuerIdentifier:credentialTypes:syncIdentifier:metadata:receivedDate:receivedDateTimeZone:signatureStatus:](self, "initWithRawContent:sourceType:sourceURL:issuerIdentifier:credentialTypes:syncIdentifier:metadata:receivedDate:receivedDateTimeZone:signatureStatus:", v5, v16, v24, v7, v10, v9, v22, v12, v13, v14, v5);
      uint64_t v18 = (void *)v12;
      id v19 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      uint64_t v18 = (void *)v12;
      id v19 = 0;
      v17 = (void *)v24;
      v15 = (void *)v22;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v19 = 0;
  }

  return v19;
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (NSArray)credentialTypes
{
  return self->_credentialTypes;
}

- (NSUUID)syncIdentifier
{
  return self->_syncIdentifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSTimeZone)receivedDateTimeZone
{
  return self->_receivedDateTimeZone;
}

- (int64_t)signatureStatus
{
  return self->_signatureStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedDateTimeZone, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialTypes, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);

  objc_storeStrong((id *)&self->_rawContent, 0);
}

@end