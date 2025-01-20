@interface MEMessageCategorizationResultMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MEMessageCategorizationResultMetadata)initWithCoder:(id)a3;
- (MEMessageCategorizationResultMetadata)initWithScore:(double)a3 senderScore:(double)a4 tsScore:(double)a5 reasonCodes:(id)a6 modelVersion:(id)a7 senderModelVersion:(id)a8 tsModelVersion:(id)a9 finalRuleVersion:(id)a10 experimentID:(id)a11 experimentDeploymentID:(id)a12 experimentTreatmentID:(id)a13 rolloutID:(id)a14 rolloutDeploymentID:(id)a15 rolloutFactorPackID:(id)a16;
- (NSArray)reasonCodes;
- (NSString)experimentDeploymentID;
- (NSString)experimentID;
- (NSString)experimentTreatmentID;
- (NSString)finalRuleVersion;
- (NSString)modelVersion;
- (NSString)rolloutDeploymentID;
- (NSString)rolloutFactorPackID;
- (NSString)rolloutID;
- (NSString)senderModelVersion;
- (NSString)tsModelVersion;
- (double)score;
- (double)senderScore;
- (double)tsScore;
- (id)_dictionaryRepresentation;
- (id)stringRepresentationWithError:(id *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageCategorizationResultMetadata

- (MEMessageCategorizationResultMetadata)initWithScore:(double)a3 senderScore:(double)a4 tsScore:(double)a5 reasonCodes:(id)a6 modelVersion:(id)a7 senderModelVersion:(id)a8 tsModelVersion:(id)a9 finalRuleVersion:(id)a10 experimentID:(id)a11 experimentDeploymentID:(id)a12 experimentTreatmentID:(id)a13 rolloutID:(id)a14 rolloutDeploymentID:(id)a15 rolloutFactorPackID:(id)a16
{
  id v40 = a6;
  id v31 = a7;
  id v39 = a7;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v35 = a11;
  id v34 = a12;
  id v33 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  v41.receiver = self;
  v41.super_class = (Class)MEMessageCategorizationResultMetadata;
  v27 = [(MEMessageCategorizationResultMetadata *)&v41 init];
  v28 = v27;
  if (v27)
  {
    v27->_score = a3;
    v27->_senderScore = a4;
    v27->_tsScore = a5;
    objc_storeStrong((id *)&v27->_reasonCodes, a6);
    objc_storeStrong((id *)&v28->_modelVersion, v31);
    objc_storeStrong((id *)&v28->_senderModelVersion, a8);
    objc_storeStrong((id *)&v28->_tsModelVersion, a9);
    objc_storeStrong((id *)&v28->_finalRuleVersion, a10);
    objc_storeStrong((id *)&v28->_experimentID, a11);
    objc_storeStrong((id *)&v28->_experimentDeploymentID, a12);
    objc_storeStrong((id *)&v28->_experimentTreatmentID, a13);
    objc_storeStrong((id *)&v28->_rolloutID, a14);
    objc_storeStrong((id *)&v28->_rolloutDeploymentID, a15);
    objc_storeStrong((id *)&v28->_rolloutFactorPackID, a16);
  }

  return v28;
}

- (id)_dictionaryRepresentation
{
  v62[14] = *MEMORY[0x263EF8340];
  v61[0] = @"score";
  v3 = NSNumber;
  [(MEMessageCategorizationResultMetadata *)self score];
  uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
  }
  v47 = (void *)v4;
  v62[0] = v4;
  v61[1] = @"senderScore";
  v6 = NSNumber;
  [(MEMessageCategorizationResultMetadata *)self senderScore];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  v51 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  v46 = (void *)v7;
  v62[1] = v7;
  v61[2] = @"tsScore";
  v8 = NSNumber;
  [(MEMessageCategorizationResultMetadata *)self tsScore];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  v49 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  v45 = (void *)v9;
  v62[2] = v9;
  v61[3] = @"reasonCodes";
  uint64_t v10 = [(MEMessageCategorizationResultMetadata *)self reasonCodes];
  v50 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  }
  v44 = (void *)v10;
  v62[3] = v10;
  v61[4] = @"modelVersion";
  uint64_t v11 = [(MEMessageCategorizationResultMetadata *)self modelVersion];
  v52 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  }
  v43 = (void *)v11;
  v62[4] = v11;
  v61[5] = @"senderModelVersion";
  uint64_t v12 = [(MEMessageCategorizationResultMetadata *)self senderModelVersion];
  v53 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  v42 = (void *)v12;
  v62[5] = v12;
  v61[6] = @"tsModelVersion";
  uint64_t v13 = [(MEMessageCategorizationResultMetadata *)self tsModelVersion];
  v54 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];
  }
  objc_super v41 = (void *)v13;
  v62[6] = v13;
  v61[7] = @"finalRuleVersion";
  uint64_t v14 = [(MEMessageCategorizationResultMetadata *)self finalRuleVersion];
  v55 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  }
  id v40 = (void *)v14;
  v62[7] = v14;
  v61[8] = @"experimentID";
  v15 = [(MEMessageCategorizationResultMetadata *)self experimentID];
  uint64_t v16 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
  }
  id v39 = (void *)v16;
  v62[8] = v16;
  v61[9] = @"experimentDeploymentID";
  v17 = [(MEMessageCategorizationResultMetadata *)self experimentDeploymentID];
  uint64_t v18 = (uint64_t)v17;
  if (!v17)
  {
    uint64_t v18 = [MEMORY[0x263EFF9D0] null];
  }
  id v38 = (void *)v18;
  v62[9] = v18;
  v61[10] = @"experimentTreatmentID";
  v19 = [(MEMessageCategorizationResultMetadata *)self experimentTreatmentID];
  uint64_t v20 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
  }
  id v37 = (void *)v20;
  v62[10] = v20;
  v61[11] = @"rolloutID";
  v21 = [(MEMessageCategorizationResultMetadata *)self rolloutID];
  v22 = v21;
  if (!v21)
  {
    v22 = [MEMORY[0x263EFF9D0] null];
  }
  v62[11] = v22;
  v61[12] = @"rolloutDeploymentID";
  v23 = [(MEMessageCategorizationResultMetadata *)self rolloutDeploymentID];
  id v24 = v23;
  if (!v23)
  {
    id v24 = [MEMORY[0x263EFF9D0] null];
  }
  v62[12] = v24;
  v61[13] = @"rolloutFactorPackID";
  id v25 = [(MEMessageCategorizationResultMetadata *)self rolloutFactorPackID];
  id v26 = v25;
  if (!v25)
  {
    id v26 = [MEMORY[0x263EFF9D0] null];
  }
  v62[13] = v26;
  v48 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:14];
  if (!v25) {

  }
  if (!v23) {
  if (!v21)
  }

  if (!v19) {
  if (!v17)
  }

  if (!v15) {
  if (!v55)
  }

  if (!v54) {
  if (!v53)
  }

  if (!v52) {
  if (!v50)
  }

  if (!v49) {
  if (!v51)
  }

  if (!v5) {
  v27 = [MEMORY[0x263EFF9A0] dictionary];
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v28 = v48;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v57 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v32 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v33 = [v28 objectForKey:v32];
        id v34 = [MEMORY[0x263EFF9D0] null];
        BOOL v35 = v33 == v34;

        if (!v35) {
          [v27 setObject:v33 forKey:v32];
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v29);
  }

  return v27;
}

- (id)stringRepresentationWithError:(id *)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08900];
  v5 = [(MEMessageCategorizationResultMetadata *)self _dictionaryRepresentation];
  v6 = [v4 dataWithJSONObject:v5 options:0 error:a3];

  if ([v6 length]) {
    uint64_t v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(MEMessageCategorizationResultMetadata *)self score];
  double v4 = v3;
  [(MEMessageCategorizationResultMetadata *)self senderScore];
  double v6 = v5;
  [(MEMessageCategorizationResultMetadata *)self tsScore];
  double v8 = v7;
  uint64_t v9 = [(MEMessageCategorizationResultMetadata *)self reasonCodes];
  uint64_t v10 = [v9 hash];

  uint64_t v11 = [(MEMessageCategorizationResultMetadata *)self modelVersion];
  uint64_t v12 = [v11 hash];

  uint64_t v13 = [(MEMessageCategorizationResultMetadata *)self senderModelVersion];
  uint64_t v14 = [v13 hash];

  v15 = [(MEMessageCategorizationResultMetadata *)self tsModelVersion];
  uint64_t v16 = [v15 hash];

  v17 = [(MEMessageCategorizationResultMetadata *)self finalRuleVersion];
  uint64_t v18 = [v17 hash];

  v19 = [(MEMessageCategorizationResultMetadata *)self experimentID];
  uint64_t v39 = [v19 hash];
  uint64_t v40 = v18;

  uint64_t v20 = [(MEMessageCategorizationResultMetadata *)self experimentDeploymentID];
  uint64_t v21 = [v20 hash];
  uint64_t v22 = v14;

  v23 = [(MEMessageCategorizationResultMetadata *)self experimentTreatmentID];
  uint64_t v24 = [v23 hash];
  uint64_t v25 = v12;

  id v26 = [(MEMessageCategorizationResultMetadata *)self rolloutID];
  uint64_t v27 = [v26 hash];

  id v28 = [(MEMessageCategorizationResultMetadata *)self rolloutDeploymentID];
  uint64_t v29 = [v28 hash];

  uint64_t v30 = [(MEMessageCategorizationResultMetadata *)self rolloutFactorPackID];
  uint64_t v31 = [v30 hash];
  double v32 = round(v4);
  if (v32 < 0.0) {
    double v32 = -v32;
  }
  unint64_t v33 = 33 * (unint64_t)v32;
  double v34 = round(v6);
  if (v34 < 0.0) {
    double v34 = -v34;
  }
  unint64_t v35 = 33 * (v33 + (unint64_t)v34);
  double v36 = round(v8);
  if (v36 < 0.0) {
    double v36 = -v36;
  }
  unint64_t v37 = 33
      * (33
       * (33
        * (33
         * (33
          * (33 * (33 * (33 * (33 * (33 * (33 * (v35 + (unint64_t)v36) + v10) + v25) + v22) + v16) + v40) + v39)
          + v21)
         + v24)
        + v27)
       + v29)
      + v31
      + 0x76AA693EA3476DC1;

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (MEMessageCategorizationResultMetadata *)a3;
  if (v4 == self)
  {
    char v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(MEMessageCategorizationResultMetadata *)self score];
      double v7 = v6;
      [(MEMessageCategorizationResultMetadata *)v5 score];
      double v9 = v7 - v8;
      if (v9 < 0.0) {
        double v9 = -v9;
      }
      if (v9 >= 2.22044605e-16) {
        goto LABEL_25;
      }
      [(MEMessageCategorizationResultMetadata *)self senderScore];
      double v11 = v10;
      [(MEMessageCategorizationResultMetadata *)v5 senderScore];
      double v13 = v11 - v12;
      if (v13 < 0.0) {
        double v13 = -v13;
      }
      if (v13 >= 2.22044605e-16) {
        goto LABEL_25;
      }
      [(MEMessageCategorizationResultMetadata *)self tsScore];
      double v15 = v14;
      [(MEMessageCategorizationResultMetadata *)v5 tsScore];
      double v17 = v15 - v16;
      if (v17 < 0.0) {
        double v17 = -v17;
      }
      if (v17 >= 2.22044605e-16)
      {
LABEL_25:
        char v25 = 0;
      }
      else
      {
        uint64_t v18 = [(MEMessageCategorizationResultMetadata *)self reasonCodes];
        v19 = [(MEMessageCategorizationResultMetadata *)v5 reasonCodes];
        if ([v18 isEqualToArray:v19])
        {
          uint64_t v20 = [(MEMessageCategorizationResultMetadata *)self modelVersion];
          uint64_t v21 = [(MEMessageCategorizationResultMetadata *)v5 modelVersion];
          if ([v20 isEqualToString:v21])
          {
            uint64_t v22 = [(MEMessageCategorizationResultMetadata *)self senderModelVersion];
            v23 = [(MEMessageCategorizationResultMetadata *)v5 senderModelVersion];
            if ([v22 isEqualToString:v23])
            {
              objc_super v41 = [(MEMessageCategorizationResultMetadata *)self tsModelVersion];
              uint64_t v24 = [(MEMessageCategorizationResultMetadata *)v5 tsModelVersion];
              if ([v41 isEqualToString:v24])
              {
                uint64_t v40 = [(MEMessageCategorizationResultMetadata *)self finalRuleVersion];
                uint64_t v39 = [(MEMessageCategorizationResultMetadata *)v5 finalRuleVersion];
                if (objc_msgSend(v40, "isEqualToString:"))
                {
                  id v38 = [(MEMessageCategorizationResultMetadata *)self experimentID];
                  unint64_t v37 = [(MEMessageCategorizationResultMetadata *)v5 experimentID];
                  if (objc_msgSend(v38, "isEqualToString:"))
                  {
                    double v36 = [(MEMessageCategorizationResultMetadata *)self experimentDeploymentID];
                    unint64_t v35 = [(MEMessageCategorizationResultMetadata *)v5 experimentDeploymentID];
                    if (objc_msgSend(v36, "isEqualToString:"))
                    {
                      double v34 = [(MEMessageCategorizationResultMetadata *)self experimentTreatmentID];
                      unint64_t v33 = [(MEMessageCategorizationResultMetadata *)v5 experimentTreatmentID];
                      if (objc_msgSend(v34, "isEqualToString:"))
                      {
                        double v32 = [(MEMessageCategorizationResultMetadata *)self rolloutID];
                        uint64_t v31 = [(MEMessageCategorizationResultMetadata *)v5 rolloutID];
                        if ([v32 isEqualToString:v31])
                        {
                          uint64_t v30 = [(MEMessageCategorizationResultMetadata *)self rolloutDeploymentID];
                          uint64_t v29 = [(MEMessageCategorizationResultMetadata *)v5 rolloutDeploymentID];
                          if ([v30 isEqualToString:v29])
                          {
                            id v28 = [(MEMessageCategorizationResultMetadata *)self rolloutFactorPackID];
                            uint64_t v27 = [(MEMessageCategorizationResultMetadata *)v5 rolloutFactorPackID];
                            char v25 = [v28 isEqualToString:v27];
                          }
                          else
                          {
                            char v25 = 0;
                          }
                        }
                        else
                        {
                          char v25 = 0;
                        }
                      }
                      else
                      {
                        char v25 = 0;
                      }
                    }
                    else
                    {
                      char v25 = 0;
                    }
                  }
                  else
                  {
                    char v25 = 0;
                  }
                }
                else
                {
                  char v25 = 0;
                }
              }
              else
              {
                char v25 = 0;
              }
            }
            else
            {
              char v25 = 0;
            }
          }
          else
          {
            char v25 = 0;
          }
        }
        else
        {
          char v25 = 0;
        }
      }
    }
    else
    {
      char v25 = 0;
    }
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  [(MEMessageCategorizationResultMetadata *)self score];
  objc_msgSend(v15, "encodeDouble:forKey:", @"EFPropertyKey_score");
  [(MEMessageCategorizationResultMetadata *)self senderScore];
  objc_msgSend(v15, "encodeDouble:forKey:", @"EFPropertyKey_senderScore");
  [(MEMessageCategorizationResultMetadata *)self tsScore];
  objc_msgSend(v15, "encodeDouble:forKey:", @"EFPropertyKey_tsScore");
  double v4 = [(MEMessageCategorizationResultMetadata *)self reasonCodes];
  [v15 encodeObject:v4 forKey:@"EFPropertyKey_reasonCodes"];

  double v5 = [(MEMessageCategorizationResultMetadata *)self modelVersion];
  [v15 encodeObject:v5 forKey:@"EFPropertyKey_modelVersion"];

  double v6 = [(MEMessageCategorizationResultMetadata *)self senderModelVersion];
  [v15 encodeObject:v6 forKey:@"EFPropertyKey_senderModelVersion"];

  double v7 = [(MEMessageCategorizationResultMetadata *)self tsModelVersion];
  [v15 encodeObject:v7 forKey:@"EFPropertyKey_tsModelVersion"];

  double v8 = [(MEMessageCategorizationResultMetadata *)self finalRuleVersion];
  [v15 encodeObject:v8 forKey:@"EFPropertyKey_finalRuleVersion"];

  double v9 = [(MEMessageCategorizationResultMetadata *)self experimentID];
  [v15 encodeObject:v9 forKey:@"EFPropertyKey_experimentID"];

  double v10 = [(MEMessageCategorizationResultMetadata *)self experimentDeploymentID];
  [v15 encodeObject:v10 forKey:@"EFPropertyKey_experimentDeploymentID"];

  double v11 = [(MEMessageCategorizationResultMetadata *)self experimentTreatmentID];
  [v15 encodeObject:v11 forKey:@"EFPropertyKey_experimentTreatmentID"];

  double v12 = [(MEMessageCategorizationResultMetadata *)self rolloutID];
  [v15 encodeObject:v12 forKey:@"EFPropertyKey_rolloutID"];

  double v13 = [(MEMessageCategorizationResultMetadata *)self rolloutDeploymentID];
  [v15 encodeObject:v13 forKey:@"EFPropertyKey_rolloutDeploymentID"];

  double v14 = [(MEMessageCategorizationResultMetadata *)self rolloutFactorPackID];
  [v15 encodeObject:v14 forKey:@"EFPropertyKey_rolloutFactorPackID"];
}

- (MEMessageCategorizationResultMetadata)initWithCoder:(id)a3
{
  id v47 = a3;
  [v47 decodeDoubleForKey:@"EFPropertyKey_score"];
  double v5 = v4;
  [v47 decodeDoubleForKey:@"EFPropertyKey_senderScore"];
  double v7 = v6;
  [v47 decodeDoubleForKey:@"EFPropertyKey_tsScore"];
  double v9 = v8;
  double v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  double v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  double v13 = [v47 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_reasonCodes"];
  reasonCodes = self->_reasonCodes;
  self->_reasonCodes = v13;

  v46 = v13;
  id v15 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_modelVersion"];
  modelVersion = self->_modelVersion;
  self->_modelVersion = v15;

  v45 = v15;
  double v17 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_senderModelVersion"];
  senderModelVersion = self->_senderModelVersion;
  self->_senderModelVersion = v17;

  v44 = v17;
  v19 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_tsModelVersion"];
  tsModelVersion = self->_tsModelVersion;
  self->_tsModelVersion = v19;

  v43 = v19;
  uint64_t v21 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_finalRuleVersion"];
  finalRuleVersion = self->_finalRuleVersion;
  self->_finalRuleVersion = v21;

  v42 = v21;
  v23 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_experimentID"];
  experimentID = self->_experimentID;
  self->_experimentID = v23;

  objc_super v41 = v23;
  char v25 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_experimentDeploymentID"];
  experimentDeploymentID = self->_experimentDeploymentID;
  self->_experimentDeploymentID = v25;

  uint64_t v27 = v25;
  id v28 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_experimentTreatmentID"];
  experimentTreatmentID = self->_experimentTreatmentID;
  self->_experimentTreatmentID = v28;

  uint64_t v40 = v28;
  uint64_t v30 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rolloutID"];
  rolloutID = self->_rolloutID;
  self->_rolloutID = v30;

  double v32 = v30;
  unint64_t v33 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rolloutDeploymentID"];
  rolloutDeploymentID = self->_rolloutDeploymentID;
  self->_rolloutDeploymentID = v33;

  unint64_t v35 = v33;
  double v36 = [v47 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rolloutFactorPackID"];
  rolloutFactorPackID = self->_rolloutFactorPackID;
  self->_rolloutFactorPackID = v36;

  uint64_t v39 = [(MEMessageCategorizationResultMetadata *)self initWithScore:v46 senderScore:v45 tsScore:v44 reasonCodes:v43 modelVersion:v42 senderModelVersion:v41 tsModelVersion:v5 finalRuleVersion:v7 experimentID:v9 experimentDeploymentID:v27 experimentTreatmentID:v40 rolloutID:v32 rolloutDeploymentID:v35 rolloutFactorPackID:v36];
  return v39;
}

- (double)score
{
  return self->_score;
}

- (double)senderScore
{
  return self->_senderScore;
}

- (double)tsScore
{
  return self->_tsScore;
}

- (NSArray)reasonCodes
{
  return self->_reasonCodes;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)senderModelVersion
{
  return self->_senderModelVersion;
}

- (NSString)tsModelVersion
{
  return self->_tsModelVersion;
}

- (NSString)finalRuleVersion
{
  return self->_finalRuleVersion;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)experimentDeploymentID
{
  return self->_experimentDeploymentID;
}

- (NSString)experimentTreatmentID
{
  return self->_experimentTreatmentID;
}

- (NSString)rolloutID
{
  return self->_rolloutID;
}

- (NSString)rolloutDeploymentID
{
  return self->_rolloutDeploymentID;
}

- (NSString)rolloutFactorPackID
{
  return self->_rolloutFactorPackID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutFactorPackID, 0);
  objc_storeStrong((id *)&self->_rolloutDeploymentID, 0);
  objc_storeStrong((id *)&self->_rolloutID, 0);
  objc_storeStrong((id *)&self->_experimentTreatmentID, 0);
  objc_storeStrong((id *)&self->_experimentDeploymentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_finalRuleVersion, 0);
  objc_storeStrong((id *)&self->_tsModelVersion, 0);
  objc_storeStrong((id *)&self->_senderModelVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_reasonCodes, 0);
}

@end