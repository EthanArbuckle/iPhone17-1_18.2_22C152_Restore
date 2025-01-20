@interface HDHRSSignedClinicalDataProcessingContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDHRSSignedClinicalDataProcessingContext)init;
- (HDHRSSignedClinicalDataProcessingContext)initWithCoder:(id)a3;
- (HDHRSSignedClinicalDataProcessingContext)initWithRawData:(id)a3 sourceType:(int64_t)a4 sourceURL:(id)a5 issuerIdentifier:(id)a6 signingKeyID:(id)a7 JWKSData:(id)a8 JWKSOutcome:(unint64_t)a9 metadata:(id)a10;
- (NSData)JWKSData;
- (NSData)rawData;
- (NSDictionary)metadata;
- (NSString)issuerIdentifier;
- (NSString)signingKeyID;
- (NSURL)sourceURL;
- (int64_t)sourceType;
- (unint64_t)JWKSOutcome;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHRSSignedClinicalDataProcessingContext

- (HDHRSSignedClinicalDataProcessingContext)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHRSSignedClinicalDataProcessingContext)initWithRawData:(id)a3 sourceType:(int64_t)a4 sourceURL:(id)a5 issuerIdentifier:(id)a6 signingKeyID:(id)a7 JWKSData:(id)a8 JWKSOutcome:(unint64_t)a9 metadata:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)HDHRSSignedClinicalDataProcessingContext;
  v22 = [(HDHRSSignedClinicalDataProcessingContext *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    rawData = v22->_rawData;
    v22->_rawData = (NSData *)v23;

    v22->_sourceType = a4;
    uint64_t v25 = [v17 copy];
    sourceURL = v22->_sourceURL;
    v22->_sourceURL = (NSURL *)v25;

    uint64_t v27 = [v18 copy];
    issuerIdentifier = v22->_issuerIdentifier;
    v22->_issuerIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    signingKeyID = v22->_signingKeyID;
    v22->_signingKeyID = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    JWKSData = v22->_JWKSData;
    v22->_JWKSData = (NSData *)v31;

    v22->_JWKSOutcome = a9;
    uint64_t v33 = [v21 copy];
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v33;
  }
  return v22;
}

- (unint64_t)hash
{
  int64_t v3 = self->_sourceType ^ [(NSData *)self->_rawData hash];
  uint64_t v4 = [(NSURL *)self->_sourceURL hash];
  NSUInteger v5 = v3 ^ v4 ^ [(NSString *)self->_issuerIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_signingKeyID hash];
  uint64_t v7 = v6 ^ [(NSData *)self->_JWKSData hash];
  metadata = self->_metadata;
  unint64_t v9 = v5 ^ v7 ^ self->_JWKSOutcome;
  return v9 ^ [(NSDictionary *)metadata hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v6 = (HDHRSSignedClinicalDataProcessingContext *)a3;
  uint64_t v7 = v6;
  if (v6 != self)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v15 = 0;
LABEL_80:

      goto LABEL_81;
    }
    rawData = self->_rawData;
    v10 = [(HDHRSSignedClinicalDataProcessingContext *)v8 rawData];
    if (rawData == v10)
    {
      int64_t sourceType = self->_sourceType;
      if (sourceType == [(HDHRSSignedClinicalDataProcessingContext *)v8 sourceType]) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = [(HDHRSSignedClinicalDataProcessingContext *)v8 rawData];
      if (v11)
      {
        int64_t v3 = (void *)v11;
        v12 = self->_rawData;
        v13 = [(HDHRSSignedClinicalDataProcessingContext *)v8 rawData];
        if (([(NSData *)v12 isEqual:v13] & 1) == 0
          || (int64_t v14 = self->_sourceType, v14 != [(HDHRSSignedClinicalDataProcessingContext *)v8 sourceType]))
        {
          char v15 = 0;
LABEL_78:

          goto LABEL_79;
        }
        v68 = v13;
LABEL_11:
        sourceURL = self->_sourceURL;
        id v18 = [(HDHRSSignedClinicalDataProcessingContext *)v8 sourceURL];
        if (sourceURL == v18)
        {
          v67 = sourceURL;
        }
        else
        {
          uint64_t v19 = [(HDHRSSignedClinicalDataProcessingContext *)v8 sourceURL];
          if (!v19)
          {
LABEL_30:

LABEL_31:
            char v15 = 0;
            goto LABEL_77;
          }
          uint64_t v4 = (void *)v19;
          v67 = sourceURL;
          id v20 = self->_sourceURL;
          uint64_t v21 = [(HDHRSSignedClinicalDataProcessingContext *)v8 sourceURL];
          v22 = v20;
          sourceURL = (NSURL *)v21;
          if (([(NSURL *)v22 isEqual:v21] & 1) == 0)
          {
LABEL_29:

            goto LABEL_30;
          }
        }
        issuerIdentifier = self->_issuerIdentifier;
        [(HDHRSSignedClinicalDataProcessingContext *)v8 issuerIdentifier];
        v65 = issuerIdentifier;
        v66 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (issuerIdentifier == v66)
        {
          v62 = v18;
          v64 = sourceURL;
        }
        else
        {
          uint64_t v24 = [(HDHRSSignedClinicalDataProcessingContext *)v8 issuerIdentifier];
          if (!v24)
          {

            if (v67 == v18)
            {

              goto LABEL_31;
            }
            goto LABEL_29;
          }
          v61 = (void *)v24;
          v64 = sourceURL;
          uint64_t v25 = self->_issuerIdentifier;
          v26 = [(HDHRSSignedClinicalDataProcessingContext *)v8 issuerIdentifier];
          if (![(NSString *)v25 isEqualToString:v26])
          {

            v13 = v68;
            if (v67 == v18)
            {
            }
            else
            {
            }
            char v15 = 0;
            if (rawData == v10) {
              goto LABEL_79;
            }
            goto LABEL_78;
          }
          v62 = v18;
          id v18 = v26;
        }
        signingKeyID = self->_signingKeyID;
        [(HDHRSSignedClinicalDataProcessingContext *)v8 signingKeyID];
        v60 = signingKeyID;
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (signingKeyID == v28)
        {
          v59 = v4;
        }
        else
        {
          uint64_t v29 = [(HDHRSSignedClinicalDataProcessingContext *)v8 signingKeyID];
          if (!v29)
          {
            char v15 = 0;
            v42 = v18;
            v41 = v62;
LABEL_71:

            if (v65 != v66)
            {
            }
            if (v67 == v41) {
              goto LABEL_76;
            }
            v50 = v64;
LABEL_75:

LABEL_76:
LABEL_77:
            v13 = v68;
            if (rawData != v10) {
              goto LABEL_78;
            }
LABEL_79:

            goto LABEL_80;
          }
          v57 = (void *)v29;
          v59 = v4;
          v30 = self->_signingKeyID;
          uint64_t v31 = [(HDHRSSignedClinicalDataProcessingContext *)v8 signingKeyID];
          v32 = v30;
          uint64_t v4 = (void *)v31;
          if (![(NSString *)v32 isEqualToString:v31])
          {

            if (v65 == v66)
            {
            }
            else
            {
            }
            if (v67 != v62)
            {
            }
            goto LABEL_31;
          }
        }
        v58 = v18;
        JWKSData = self->_JWKSData;
        uint64_t v34 = [(HDHRSSignedClinicalDataProcessingContext *)v8 JWKSData];
        v35 = (NSData *)v34;
        v55 = JWKSData;
        v56 = v4;
        if (JWKSData == (NSData *)v34)
        {
          v39 = (NSData *)v34;
          unint64_t JWKSOutcome = self->_JWKSOutcome;
          v41 = v62;
          if (JWKSOutcome != [(HDHRSSignedClinicalDataProcessingContext *)v8 JWKSOutcome])
          {
            char v15 = 0;
            uint64_t v4 = v59;
            goto LABEL_61;
          }
        }
        else
        {
          uint64_t v36 = [(HDHRSSignedClinicalDataProcessingContext *)v8 JWKSData];
          if (!v36)
          {
            v39 = v35;
            char v15 = 0;
            uint64_t v4 = v59;
            v41 = v62;
            goto LABEL_61;
          }
          v54 = (void *)v36;
          v37 = self->_JWKSData;
          v38 = [(HDHRSSignedClinicalDataProcessingContext *)v8 JWKSData];
          if (([(NSData *)v37 isEqual:v38] & 1) == 0)
          {

            char v15 = 0;
            uint64_t v4 = v59;
            BOOL v49 = v60 == v28;
            v41 = v62;
            goto LABEL_69;
          }
          v53 = v38;
          v39 = v35;
          unint64_t v40 = self->_JWKSOutcome;
          v41 = v62;
          if (v40 != [(HDHRSSignedClinicalDataProcessingContext *)v8 JWKSOutcome])
          {
            char v15 = 0;
            uint64_t v4 = v59;
LABEL_60:

LABEL_61:
            if (v60 != v28)
            {
            }
            if (v65 != v66)
            {
            }
            v50 = v64;
            if (v67 == v41) {
              goto LABEL_76;
            }
            goto LABEL_75;
          }
        }
        metadata = self->_metadata;
        uint64_t v45 = [(HDHRSSignedClinicalDataProcessingContext *)v8 metadata];
        if (metadata == (NSDictionary *)v45)
        {

          char v15 = 1;
        }
        else
        {
          v63 = (void *)v45;
          uint64_t v46 = [(HDHRSSignedClinicalDataProcessingContext *)v8 metadata];
          if (v46)
          {
            v47 = self->_metadata;
            v52 = (void *)v46;
            v48 = [(HDHRSSignedClinicalDataProcessingContext *)v8 metadata];
            char v15 = [(NSDictionary *)v47 isEqual:v48];

            if (v55 == v39)
            {
            }
            else
            {
            }
            uint64_t v4 = v59;
            BOOL v49 = v60 == v28;
LABEL_69:
            v42 = v58;
            if (!v49)
            {
            }
            goto LABEL_71;
          }

          char v15 = 0;
        }
        uint64_t v4 = v59;
        if (v55 == v39) {
          goto LABEL_61;
        }
        goto LABEL_60;
      }
    }
    char v15 = 0;
    goto LABEL_79;
  }
  char v15 = 1;
LABEL_81:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  rawData = self->_rawData;
  id v5 = a3;
  [v5 encodeObject:rawData forKey:@"RawData"];
  [v5 encodeInteger:self->_sourceType forKey:@"SourceType"];
  [v5 encodeObject:self->_sourceURL forKey:@"SourceURL"];
  [v5 encodeObject:self->_issuerIdentifier forKey:@"IssuerIdentifier"];
  [v5 encodeObject:self->_signingKeyID forKey:@"SigningKeyID"];
  [v5 encodeObject:self->_JWKSData forKey:@"JWKSData"];
  [v5 encodeInteger:self->_JWKSOutcome forKey:@"JWKSOutcome"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HDHRSSignedClinicalDataProcessingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RawData"];
  if (v5
    && [v4 containsValueForKey:@"SourceType"]
    && ([v4 containsValueForKey:@"JWKSOutcome"] & 1) != 0)
  {
    uint64_t v15 = [v4 decodeIntegerForKey:@"SourceType"];
    NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssuerIdentifier"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SigningKeyID"];
    unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JWKSData"];
    uint64_t v10 = [v4 decodeIntegerForKey:@"JWKSOutcome"];
    uint64_t v11 = objc_msgSend(NSDictionary, "hk_secureCodingClasses");
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"Metadata"];
    self = [(HDHRSSignedClinicalDataProcessingContext *)self initWithRawData:v5 sourceType:v15 sourceURL:v6 issuerIdentifier:v7 signingKeyID:v8 JWKSData:v9 JWKSOutcome:v10 metadata:v12];

    v13 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v13 = 0;
  }

  return v13;
}

- (NSData)rawData
{
  return self->_rawData;
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

- (NSString)signingKeyID
{
  return self->_signingKeyID;
}

- (NSData)JWKSData
{
  return self->_JWKSData;
}

- (unint64_t)JWKSOutcome
{
  return self->_JWKSOutcome;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_JWKSData, 0);
  objc_storeStrong((id *)&self->_signingKeyID, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);

  objc_storeStrong((id *)&self->_rawData, 0);
}

@end