@interface BMMLSELabeledDataStoreFeature
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSELabeledDataStoreFeature)initWithFeatureName:(int)a3 featureValue:(id)a4 featureItselfVersion:(id)a5 featureFreshnessInHours:(id)a6 eventVolumeToComputeFeature:(id)a7 timeSpentToComputeFeature:(id)a8;
- (BMMLSELabeledDataStoreFeature)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSELabeledDataStoreFeatureFeatureValue)featureValue;
- (BOOL)hasEventVolumeToComputeFeature;
- (BOOL)hasFeatureFreshnessInHours;
- (BOOL)hasFeatureItselfVersion;
- (BOOL)hasTimeSpentToComputeFeature;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)featureName;
- (unsigned)dataVersion;
- (unsigned)eventVolumeToComputeFeature;
- (unsigned)featureFreshnessInHours;
- (unsigned)featureItselfVersion;
- (unsigned)timeSpentToComputeFeature;
- (void)setHasEventVolumeToComputeFeature:(BOOL)a3;
- (void)setHasFeatureFreshnessInHours:(BOOL)a3;
- (void)setHasFeatureItselfVersion:(BOOL)a3;
- (void)setHasTimeSpentToComputeFeature:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSELabeledDataStoreFeature

- (void).cxx_destruct
{
}

- (void)setHasTimeSpentToComputeFeature:(BOOL)a3
{
  self->_hasTimeSpentToComputeFeature = a3;
}

- (BOOL)hasTimeSpentToComputeFeature
{
  return self->_hasTimeSpentToComputeFeature;
}

- (unsigned)timeSpentToComputeFeature
{
  return self->_timeSpentToComputeFeature;
}

- (void)setHasEventVolumeToComputeFeature:(BOOL)a3
{
  self->_hasEventVolumeToComputeFeature = a3;
}

- (BOOL)hasEventVolumeToComputeFeature
{
  return self->_hasEventVolumeToComputeFeature;
}

- (unsigned)eventVolumeToComputeFeature
{
  return self->_eventVolumeToComputeFeature;
}

- (void)setHasFeatureFreshnessInHours:(BOOL)a3
{
  self->_hasFeatureFreshnessInHours = a3;
}

- (BOOL)hasFeatureFreshnessInHours
{
  return self->_hasFeatureFreshnessInHours;
}

- (unsigned)featureFreshnessInHours
{
  return self->_featureFreshnessInHours;
}

- (void)setHasFeatureItselfVersion:(BOOL)a3
{
  self->_hasFeatureItselfVersion = a3;
}

- (BOOL)hasFeatureItselfVersion
{
  return self->_hasFeatureItselfVersion;
}

- (unsigned)featureItselfVersion
{
  return self->_featureItselfVersion;
}

- (BMMLSELabeledDataStoreFeatureFeatureValue)featureValue
{
  return self->_featureValue;
}

- (int)featureName
{
  return self->_featureName;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(BMMLSELabeledDataStoreFeature *)self featureName];
    if (v6 == [v5 featureName])
    {
      v7 = [(BMMLSELabeledDataStoreFeature *)self featureValue];
      uint64_t v8 = [v5 featureValue];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMLSELabeledDataStoreFeature *)self featureValue];
        v11 = [v5 featureValue];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_28;
        }
      }
      if (![(BMMLSELabeledDataStoreFeature *)self hasFeatureItselfVersion]
        && ![v5 hasFeatureItselfVersion]
        || [(BMMLSELabeledDataStoreFeature *)self hasFeatureItselfVersion]
        && [v5 hasFeatureItselfVersion]
        && (unsigned int v14 = [(BMMLSELabeledDataStoreFeature *)self featureItselfVersion],
            v14 == [v5 featureItselfVersion]))
      {
        if (![(BMMLSELabeledDataStoreFeature *)self hasFeatureFreshnessInHours]
          && ![v5 hasFeatureFreshnessInHours]
          || [(BMMLSELabeledDataStoreFeature *)self hasFeatureFreshnessInHours]
          && [v5 hasFeatureFreshnessInHours]
          && (unsigned int v15 = [(BMMLSELabeledDataStoreFeature *)self featureFreshnessInHours],
              v15 == [v5 featureFreshnessInHours]))
        {
          if (![(BMMLSELabeledDataStoreFeature *)self hasEventVolumeToComputeFeature]
            && ![v5 hasEventVolumeToComputeFeature]
            || [(BMMLSELabeledDataStoreFeature *)self hasEventVolumeToComputeFeature]
            && [v5 hasEventVolumeToComputeFeature]
            && (unsigned int v16 = [(BMMLSELabeledDataStoreFeature *)self eventVolumeToComputeFeature],
                v16 == [v5 eventVolumeToComputeFeature]))
          {
            if (![(BMMLSELabeledDataStoreFeature *)self hasTimeSpentToComputeFeature]
              && ![v5 hasTimeSpentToComputeFeature])
            {
              BOOL v13 = 1;
              goto LABEL_29;
            }
            if ([(BMMLSELabeledDataStoreFeature *)self hasTimeSpentToComputeFeature]
              && [v5 hasTimeSpentToComputeFeature])
            {
              unsigned int v17 = [(BMMLSELabeledDataStoreFeature *)self timeSpentToComputeFeature];
              BOOL v13 = v17 == [v5 timeSpentToComputeFeature];
LABEL_29:

              goto LABEL_30;
            }
          }
        }
      }
    }
LABEL_28:
    BOOL v13 = 0;
    goto LABEL_29;
  }
  BOOL v13 = 0;
LABEL_30:

  return v13;
}

- (id)jsonDictionary
{
  v23[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSELabeledDataStoreFeature featureName](self, "featureName"));
  id v4 = [(BMMLSELabeledDataStoreFeature *)self featureValue];
  uint64_t v5 = [v4 jsonDictionary];

  if ([(BMMLSELabeledDataStoreFeature *)self hasFeatureItselfVersion])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature featureItselfVersion](self, "featureItselfVersion"));
  }
  else
  {
    int v6 = 0;
  }
  if ([(BMMLSELabeledDataStoreFeature *)self hasFeatureFreshnessInHours])
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature featureFreshnessInHours](self, "featureFreshnessInHours"));
  }
  else
  {
    v7 = 0;
  }
  if ([(BMMLSELabeledDataStoreFeature *)self hasEventVolumeToComputeFeature])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature eventVolumeToComputeFeature](self, "eventVolumeToComputeFeature"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(BMMLSELabeledDataStoreFeature *)self hasTimeSpentToComputeFeature])
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature timeSpentToComputeFeature](self, "timeSpentToComputeFeature"));
  }
  else
  {
    v9 = 0;
  }
  v22[0] = @"featureName";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v10;
  v20 = (void *)v5;
  v23[0] = v10;
  v22[1] = @"featureValue";
  v11 = (void *)v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10);
  }
  v23[1] = v11;
  v22[2] = @"featureItselfVersion";
  int v12 = v6;
  if (!v6)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v3;
  v23[2] = v12;
  v22[3] = @"featureFreshnessInHours";
  BOOL v13 = v7;
  if (!v7)
  {
    BOOL v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v13;
  v22[4] = @"eventVolumeToComputeFeature";
  unsigned int v14 = v8;
  if (!v8)
  {
    unsigned int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v14;
  v22[5] = @"timeSpentToComputeFeature";
  unsigned int v15 = v9;
  if (!v9)
  {
    unsigned int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[5] = v15;
  unsigned int v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  if (v9)
  {
    if (v8) {
      goto LABEL_27;
    }
LABEL_36:

    if (v7) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }

  if (!v8) {
    goto LABEL_36;
  }
LABEL_27:
  if (v7) {
    goto LABEL_28;
  }
LABEL_37:

LABEL_28:
  if (!v6) {

  }
  if (v20)
  {
    if (v21) {
      goto LABEL_32;
    }
  }
  else
  {

    if (v21) {
      goto LABEL_32;
    }
  }

LABEL_32:

  return v16;
}

- (BMMLSELabeledDataStoreFeature)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"featureName"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      v23 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v8 = 0;
          v19 = 0;
          goto LABEL_58;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v77 = *MEMORY[0x1E4F28568];
        id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"featureName"];
        v78[0] = v20;
        uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
        id v8 = 0;
        v19 = 0;
        id *v23 = (id)[v45 initWithDomain:v46 code:2 userInfo:v47];
        uint64_t v10 = (BMMLSELabeledDataStoreFeatureFeatureValue *)v47;
        goto LABEL_56;
      }
      id v8 = [NSNumber numberWithInt:BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString(v7)];
    }
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"featureValue"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v19 = 0;
        goto LABEL_57;
      }
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      v63 = a4;
      uint64_t v25 = *MEMORY[0x1E4F502C8];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v26 = v7;
      id v27 = v8;
      id v28 = [NSString alloc];
      uint64_t v53 = objc_opt_class();
      v29 = v28;
      id v8 = v27;
      v7 = v26;
      uint64_t v76 = [v29 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v53, @"featureValue"];
      uint64_t v10 = (BMMLSELabeledDataStoreFeatureFeatureValue *)v76;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      id *v63 = (id)[v24 initWithDomain:v25 code:2 userInfo:v30];

      v19 = 0;
      goto LABEL_55;
    }
    id v20 = v9;
    id v66 = 0;
    uint64_t v10 = [[BMMLSELabeledDataStoreFeatureFeatureValue alloc] initWithJSONDictionary:v20 error:&v66];
    id v21 = v66;
    if (v21)
    {
      v22 = v21;
      if (a4) {
        *a4 = v21;
      }

      v19 = 0;
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = [v6 objectForKeyedSubscript:@"featureItselfVersion"];
  v65 = self;
  v60 = v10;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v62 = 0;
LABEL_10:
    int v12 = [v6 objectForKeyedSubscript:@"featureFreshnessInHours"];
    v59 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v61 = 0;
          v19 = 0;
          goto LABEL_53;
        }
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        v39 = v7;
        id v40 = v8;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v71 = *MEMORY[0x1E4F28568];
        v42 = a4;
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"featureFreshnessInHours"];
        id v72 = v16;
        unsigned int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        v43 = v38;
        v11 = v59;
        uint64_t v44 = v41;
        id v8 = v40;
        v7 = v39;
        v19 = 0;
        id v61 = 0;
        id *v42 = (id)[v43 initWithDomain:v44 code:2 userInfo:v14];
        goto LABEL_65;
      }
      BOOL v13 = a4;
      id v61 = v12;
    }
    else
    {
      BOOL v13 = a4;
      id v61 = 0;
    }
    unsigned int v14 = [v6 objectForKeyedSubscript:@"eventVolumeToComputeFeature"];
    v58 = v7;
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned int v15 = v8;
      id v16 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v15 = v8;
      id v16 = v14;
LABEL_16:
      unsigned int v17 = [v6 objectForKeyedSubscript:@"timeSpentToComputeFeature"];
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v18 = 0;
LABEL_19:
        uint64_t v10 = v60;
        v19 = -[BMMLSELabeledDataStoreFeature initWithFeatureName:featureValue:featureItselfVersion:featureFreshnessInHours:eventVolumeToComputeFeature:timeSpentToComputeFeature:](v65, "initWithFeatureName:featureValue:featureItselfVersion:featureFreshnessInHours:eventVolumeToComputeFeature:timeSpentToComputeFeature:", [v15 intValue], v60, v62, v61, v16, v18);
        v65 = v19;
LABEL_51:

        id v8 = v15;
        v7 = v58;
        v11 = v59;
LABEL_52:

        goto LABEL_53;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        goto LABEL_19;
      }
      if (v13)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v50 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeSpentToComputeFeature"];
        v68 = v50;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        *BOOL v13 = (id)[v57 initWithDomain:v55 code:2 userInfo:v51];
      }
      id v18 = 0;
      v19 = 0;
LABEL_50:
      uint64_t v10 = v60;
      goto LABEL_51;
    }
    if (v13)
    {
      unsigned int v15 = v8;
      id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v48 = *MEMORY[0x1E4F502C8];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"eventVolumeToComputeFeature"];
      id v70 = v18;
      unsigned int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      id v49 = (id)[v56 initWithDomain:v48 code:2 userInfo:v17];
      v19 = 0;
      id v16 = 0;
      *BOOL v13 = v49;
      goto LABEL_50;
    }
    id v16 = 0;
    v19 = 0;
LABEL_65:
    uint64_t v10 = v60;
    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v62 = v11;
    goto LABEL_10;
  }
  if (!a4)
  {
    v19 = 0;
    id v62 = 0;
    goto LABEL_54;
  }
  id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
  v31 = a4;
  uint64_t v32 = *MEMORY[0x1E4F502C8];
  uint64_t v73 = *MEMORY[0x1E4F28568];
  v33 = v7;
  id v34 = v8;
  id v35 = [NSString alloc];
  uint64_t v54 = objc_opt_class();
  v36 = v35;
  id v8 = v34;
  v7 = v33;
  id v61 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v54, @"featureItselfVersion"];
  id v74 = v61;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
  id v37 = (id)[v64 initWithDomain:v32 code:2 userInfo:v12];
  v19 = 0;
  id v62 = 0;
  id *v31 = v37;
  uint64_t v10 = v60;
LABEL_53:

  self = v65;
LABEL_54:

LABEL_55:
  id v20 = v9;
LABEL_56:

  v9 = v20;
LABEL_57:

LABEL_58:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSELabeledDataStoreFeature *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_featureValue)
  {
    PBDataWriterPlaceMark();
    [(BMMLSELabeledDataStoreFeatureFeatureValue *)self->_featureValue writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasFeatureItselfVersion) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFeatureFreshnessInHours) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasEventVolumeToComputeFeature) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasTimeSpentToComputeFeature) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMMLSELabeledDataStoreFeature;
  uint64_t v5 = [(BMEventBase *)&v57 init];
  if (!v5) {
    goto LABEL_86;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_63:
          if (v22 >= 0x2C6) {
            LODWORD(v22) = 0;
          }
          v5->_featureName = v22;
          continue;
        case 2u:
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_85;
          }
          id v27 = [[BMMLSELabeledDataStoreFeatureFeatureValue alloc] initByReadFrom:v4];
          if (!v27) {
            goto LABEL_85;
          }
          featureValue = v5->_featureValue;
          v5->_featureValue = v27;

          PBReaderRecallMark();
          continue;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasFeatureItselfVersion = 1;
          while (1)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7]) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0) {
              goto LABEL_67;
            }
            v29 += 7;
            BOOL v17 = v30++ >= 9;
            if (v17)
            {
              LODWORD(v31) = 0;
              goto LABEL_69;
            }
          }
          v4[*v8] = 1;
LABEL_67:
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_69:
          uint64_t v54 = 28;
          goto LABEL_82;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v31 = 0;
          v5->_hasFeatureFreshnessInHours = 1;
          while (2)
          {
            uint64_t v38 = *v6;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
              *(void *)&v4[v38] = v40;
              v31 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_73:
          uint64_t v54 = 32;
          goto LABEL_82;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v31 = 0;
          v5->_hasEventVolumeToComputeFeature = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v46;
              v31 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v17 = v43++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_77:
          uint64_t v54 = 36;
          goto LABEL_82;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v31 = 0;
          v5->_hasTimeSpentToComputeFeature = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_85;
          }
          continue;
      }
      while (1)
      {
        uint64_t v50 = *v6;
        uint64_t v51 = *(void *)&v4[v50];
        unint64_t v52 = v51 + 1;
        if (v51 == -1 || v52 > *(void *)&v4[*v7]) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
        *(void *)&v4[v50] = v52;
        v31 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0) {
          goto LABEL_79;
        }
        v48 += 7;
        BOOL v17 = v49++ >= 9;
        if (v17)
        {
          LODWORD(v31) = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8]) {
        LODWORD(v31) = 0;
      }
LABEL_81:
      uint64_t v54 = 40;
LABEL_82:
      *(_DWORD *)((char *)&v5->super.super.isa + v54) = v31;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_85:
  }
    uint64_t v55 = 0;
  else {
LABEL_86:
  }
    uint64_t v55 = v5;

  return v55;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString([(BMMLSELabeledDataStoreFeature *)self featureName]);
  uint64_t v5 = [(BMMLSELabeledDataStoreFeature *)self featureValue];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature featureItselfVersion](self, "featureItselfVersion"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature featureFreshnessInHours](self, "featureFreshnessInHours"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature eventVolumeToComputeFeature](self, "eventVolumeToComputeFeature"));
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeature timeSpentToComputeFeature](self, "timeSpentToComputeFeature"));
  char v10 = (void *)[v3 initWithFormat:@"BMMLSELabeledDataStoreFeature with featureName: %@, featureValue: %@, featureItselfVersion: %@, featureFreshnessInHours: %@, eventVolumeToComputeFeature: %@, timeSpentToComputeFeature: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMMLSELabeledDataStoreFeature)initWithFeatureName:(int)a3 featureValue:(id)a4 featureItselfVersion:(id)a5 featureFreshnessInHours:(id)a6 eventVolumeToComputeFeature:(id)a7 timeSpentToComputeFeature:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)BMMLSELabeledDataStoreFeature;
  char v20 = [(BMEventBase *)&v26 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v20->_featureName = a3;
    objc_storeStrong((id *)&v20->_featureValue, a4);
    if (v16)
    {
      v20->_hasFeatureItselfVersion = 1;
      unsigned int v21 = [v16 unsignedIntValue];
    }
    else
    {
      unsigned int v21 = 0;
      v20->_hasFeatureItselfVersion = 0;
    }
    v20->_featureItselfVersion = v21;
    if (v17)
    {
      v20->_hasFeatureFreshnessInHours = 1;
      unsigned int v22 = [v17 unsignedIntValue];
    }
    else
    {
      unsigned int v22 = 0;
      v20->_hasFeatureFreshnessInHours = 0;
    }
    v20->_featureFreshnessInHours = v22;
    if (v18)
    {
      v20->_hasEventVolumeToComputeFeature = 1;
      unsigned int v23 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v23 = 0;
      v20->_hasEventVolumeToComputeFeature = 0;
    }
    v20->_eventVolumeToComputeFeature = v23;
    if (v19)
    {
      v20->_hasTimeSpentToComputeFeature = 1;
      unsigned int v24 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v20->_hasTimeSpentToComputeFeature = 0;
    }
    v20->_timeSpentToComputeFeature = v24;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureName" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureValue" number:2 type:14 subMessageClass:objc_opt_class()];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureItselfVersion" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureFreshnessInHours" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventVolumeToComputeFeature" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeSpentToComputeFeature" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3810;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureName" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"featureValue_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_248];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureItselfVersion" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureFreshnessInHours" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventVolumeToComputeFeature" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeSpentToComputeFeature" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __40__BMMLSELabeledDataStoreFeature_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 featureValue];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMLSELabeledDataStoreFeature alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end