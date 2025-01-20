@interface BMHumanUnderstandingPersonalInference
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHumanUnderstandingPersonalInference)initWithConfidence:(id)a3 fact:(id)a4 qualifiers:(id)a5 modelVersion:(id)a6;
- (BMHumanUnderstandingPersonalInference)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMHumanUnderstandingPersonalInferenceFact)fact;
- (BOOL)hasConfidence;
- (BOOL)hasModelVersion;
- (BOOL)isEqual:(id)a3;
- (NSArray)qualifiers;
- (NSString)description;
- (double)confidence;
- (id)_qualifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)modelVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMHumanUnderstandingPersonalInference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiers, 0);

  objc_storeStrong((id *)&self->_fact, 0);
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (BOOL)hasModelVersion
{
  return self->_hasModelVersion;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (NSArray)qualifiers
{
  return self->_qualifiers;
}

- (BMHumanUnderstandingPersonalInferenceFact)fact
{
  return self->_fact;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
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
    if ([(BMHumanUnderstandingPersonalInference *)self hasConfidence]
      || [v5 hasConfidence])
    {
      if (![(BMHumanUnderstandingPersonalInference *)self hasConfidence]) {
        goto LABEL_21;
      }
      if (![v5 hasConfidence]) {
        goto LABEL_21;
      }
      [(BMHumanUnderstandingPersonalInference *)self confidence];
      double v7 = v6;
      [v5 confidence];
      if (v7 != v8) {
        goto LABEL_21;
      }
    }
    v9 = [(BMHumanUnderstandingPersonalInference *)self fact];
    uint64_t v10 = [v5 fact];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMHumanUnderstandingPersonalInference *)self fact];
      v13 = [v5 fact];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_21;
      }
    }
    v16 = [(BMHumanUnderstandingPersonalInference *)self qualifiers];
    uint64_t v17 = [v5 qualifiers];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMHumanUnderstandingPersonalInference *)self qualifiers];
      v20 = [v5 qualifiers];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_21;
      }
    }
    if (![(BMHumanUnderstandingPersonalInference *)self hasModelVersion]
      && ![v5 hasModelVersion])
    {
      BOOL v15 = 1;
      goto LABEL_22;
    }
    if ([(BMHumanUnderstandingPersonalInference *)self hasModelVersion]
      && [v5 hasModelVersion])
    {
      unsigned int v22 = [(BMHumanUnderstandingPersonalInference *)self modelVersion];
      BOOL v15 = v22 == [v5 modelVersion];
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_23:

  return v15;
}

- (id)jsonDictionary
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if (![(BMHumanUnderstandingPersonalInference *)self hasConfidence]
    || ([(BMHumanUnderstandingPersonalInference *)self confidence], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMHumanUnderstandingPersonalInference *)self confidence];
    id v4 = NSNumber;
    [(BMHumanUnderstandingPersonalInference *)self confidence];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  double v6 = [(BMHumanUnderstandingPersonalInference *)self fact];
  double v7 = [v6 jsonDictionary];

  double v8 = [(BMHumanUnderstandingPersonalInference *)self _qualifiersJSONArray];
  if ([(BMHumanUnderstandingPersonalInference *)self hasModelVersion])
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMHumanUnderstandingPersonalInference modelVersion](self, "modelVersion"));
  }
  else
  {
    v9 = 0;
  }
  v16[0] = @"confidence";
  uint64_t v10 = v5;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v10;
  v16[1] = @"fact";
  v11 = v7;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v11;
  v16[2] = @"qualifiers";
  v12 = v8;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v12;
  v16[3] = @"modelVersion";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v13;
  int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (v9)
  {
    if (v8) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v8)
    {
LABEL_18:
      if (v7) {
        goto LABEL_19;
      }
LABEL_25:

      if (v5) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
  }

  if (!v7) {
    goto LABEL_25;
  }
LABEL_19:
  if (v5) {
    goto LABEL_20;
  }
LABEL_26:

LABEL_20:

  return v14;
}

- (id)_qualifiersJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMHumanUnderstandingPersonalInference *)self qualifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMHumanUnderstandingPersonalInference)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"confidence"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v27 = p_isa;
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = v7;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v77 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
        v78[0] = v9;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
        uint64_t v31 = v30;
        uint64_t v7 = v29;
        id v32 = (id)[v28 initWithDomain:v31 code:2 userInfo:v26];
        p_isa = 0;
        id v8 = 0;
        id *v27 = v32;
        goto LABEL_55;
      }
      id v8 = 0;
      goto LABEL_57;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"fact"];
  v57 = p_isa;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v75 = *MEMORY[0x1E4F28568];
        v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"fact"];
        v76 = v26;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        id *v57 = (id)[v59 initWithDomain:v33 code:2 userInfo:v34];

        p_isa = 0;
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    id v23 = v9;
    id v9 = v9;
    id v65 = 0;
    v56 = [[BMHumanUnderstandingPersonalInferenceFact alloc] initWithJSONDictionary:v9 error:&v65];
    id v24 = v65;
    if (v24)
    {
      v25 = v24;
      if (v57) {
        id *v57 = v24;
      }

      p_isa = 0;
      v26 = v56;
      goto LABEL_55;
    }

    id v9 = v23;
  }
  else
  {
    v56 = 0;
  }
  id v10 = [v6 objectForKeyedSubscript:@"qualifiers"];
  long long v11 = [MEMORY[0x1E4F1CA98] null];
  int v12 = [v10 isEqual:v11];

  id v55 = v9;
  if (v12)
  {
    id v52 = v8;
    v53 = v7;
    v54 = self;

    id v10 = 0;
  }
  else
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        p_isa = v57;
        if (!v57)
        {
          v26 = v56;
          goto LABEL_54;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v58 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"qualifiers"];
        v74 = v58;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v22];
        p_isa = 0;
        id *v57 = v45;
LABEL_48:
        v26 = v56;
        goto LABEL_53;
      }
    }
    id v52 = v8;
    v53 = v7;
    v54 = self;
  }
  v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v10 = v10;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (!v13) {
    goto LABEL_22;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v62;
  id v51 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v62 != v15) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = v57;
        if (v57)
        {
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = *MEMORY[0x1E4F502C8];
          uint64_t v70 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"qualifiers"];
          id v71 = v18;
          v38 = (void *)MEMORY[0x1E4F1C9E8];
          v39 = &v71;
          v40 = &v70;
LABEL_40:
          v41 = [v38 dictionaryWithObjects:v39 forKeys:v40 count:1];
          id *v35 = (id)[v36 initWithDomain:v37 code:2 userInfo:v41];

          p_isa = 0;
          id v22 = v10;
          id v6 = v51;
          uint64_t v7 = v53;
          self = v54;
LABEL_44:
          id v8 = v52;
          v26 = v56;
          goto LABEL_52;
        }
        goto LABEL_47;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = v57;
        if (v57)
        {
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = *MEMORY[0x1E4F502C8];
          uint64_t v68 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"qualifiers"];
          id v69 = v18;
          v38 = (void *)MEMORY[0x1E4F1C9E8];
          v39 = &v69;
          v40 = &v68;
          goto LABEL_40;
        }
LABEL_47:
        p_isa = 0;
        id v22 = v10;
        id v6 = v51;
        id v8 = v52;
        uint64_t v7 = v53;
        self = v54;
        goto LABEL_48;
      }
      id v18 = v17;
      v19 = [BMHumanUnderstandingPersonalInferenceFact alloc];
      id v60 = 0;
      v20 = [(BMHumanUnderstandingPersonalInferenceFact *)v19 initWithJSONDictionary:v18 error:&v60];
      id v21 = v60;
      if (v21)
      {
        v42 = v21;
        uint64_t v7 = v53;
        if (v57) {
          id *v57 = v21;
        }

        p_isa = 0;
        id v22 = v10;
        id v6 = v51;
        self = v54;
        goto LABEL_44;
      }
      [v58 addObject:v20];
    }
    uint64_t v14 = [v10 countByEnumeratingWithState:&v61 objects:v72 count:16];
    id v6 = v51;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_22:

  id v18 = [v6 objectForKeyedSubscript:@"modelVersion"];
  if (v18)
  {
    objc_opt_class();
    self = v54;
    id v8 = v52;
    if (objc_opt_isKindOfClass())
    {
      id v22 = 0;
      uint64_t v7 = v53;
      goto LABEL_50;
    }
    objc_opt_class();
    v26 = v56;
    if (objc_opt_isKindOfClass())
    {
      id v22 = v18;
      uint64_t v7 = v53;
      goto LABEL_51;
    }
    uint64_t v7 = v53;
    id v22 = v57;
    if (v57)
    {
      id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v49 = *MEMORY[0x1E4F502C8];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"modelVersion"];
      v67 = v47;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      id *v57 = (id)[v50 initWithDomain:v49 code:2 userInfo:v48];

      id v22 = 0;
    }
    p_isa = 0;
  }
  else
  {
    id v22 = 0;
    uint64_t v7 = v53;
    self = v54;
    id v8 = v52;
LABEL_50:
    v26 = v56;
LABEL_51:
    self = [(BMHumanUnderstandingPersonalInference *)self initWithConfidence:v8 fact:v26 qualifiers:v58 modelVersion:v22];
    p_isa = (id *)&self->super.super.isa;
  }
LABEL_52:

LABEL_53:
  id v9 = v55;
LABEL_54:

LABEL_55:
LABEL_56:

LABEL_57:
  return (BMHumanUnderstandingPersonalInference *)p_isa;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMHumanUnderstandingPersonalInference *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasConfidence) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_fact)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMHumanUnderstandingPersonalInferenceFact *)self->_fact writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_qualifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  if (self->_hasModelVersion) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMHumanUnderstandingPersonalInference;
  uint64_t v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_47;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasConfidence = 1;
          uint64_t v21 = *v7;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
          {
            double v23 = *(double *)(*(void *)&v4[*v10] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v23 = 0.0;
          }
          v5->_confidence = v23;
          continue;
        case 2u:
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v24 = [[BMHumanUnderstandingPersonalInferenceFact alloc] initByReadFrom:v4];
          if (!v24) {
            goto LABEL_49;
          }
          fact = v5->_fact;
          v5->_fact = v24;

          PBReaderRecallMark();
          continue;
        case 3u:
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v26 = [[BMHumanUnderstandingPersonalInferenceFact alloc] initByReadFrom:v4];
          if (!v26) {
            goto LABEL_49;
          }
          v27 = v26;
          [v6 addObject:v26];
          PBReaderRecallMark();

          continue;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasModelVersion = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_49:

          goto LABEL_46;
      }
      while (1)
      {
        uint64_t v31 = *v7;
        uint64_t v32 = *(void *)&v4[v31];
        unint64_t v33 = v32 + 1;
        if (v32 == -1 || v33 > *(void *)&v4[*v8]) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)&v4[*v10] + v32);
        *(void *)&v4[v31] = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0) {
          goto LABEL_39;
        }
        v28 += 7;
        BOOL v18 = v29++ >= 9;
        if (v18)
        {
          LODWORD(v30) = 0;
          goto LABEL_41;
        }
      }
      v4[*v9] = 1;
LABEL_39:
      if (v4[*v9]) {
        LODWORD(v30) = 0;
      }
LABEL_41:
      v5->_modelVersion = v30;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v35 = [v6 copy];
  qualifiers = v5->_qualifiers;
  v5->_qualifiers = (NSArray *)v35;

  int v37 = v4[*v9];
  if (v37) {
LABEL_46:
  }
    v38 = 0;
  else {
LABEL_47:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMHumanUnderstandingPersonalInference *)self confidence];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v6 = [(BMHumanUnderstandingPersonalInference *)self fact];
  uint64_t v7 = [(BMHumanUnderstandingPersonalInference *)self qualifiers];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMHumanUnderstandingPersonalInference modelVersion](self, "modelVersion"));
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMHumanUnderstandingPersonalInference with confidence: %@, fact: %@, qualifiers: %@, modelVersion: %@", v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMHumanUnderstandingPersonalInference)initWithConfidence:(id)a3 fact:(id)a4 qualifiers:(id)a5 modelVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMHumanUnderstandingPersonalInference;
  uint64_t v14 = [(BMEventBase *)&v18 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasConfidence = 1;
      [v10 doubleValue];
    }
    else
    {
      v14->_hasConfidence = 0;
      double v15 = -1.0;
    }
    v14->_confidence = v15;
    objc_storeStrong((id *)&v14->_fact, a4);
    objc_storeStrong((id *)&v14->_qualifiers, a5);
    if (v13)
    {
      v14->_hasModelVersion = 1;
      unsigned int v16 = [v13 unsignedIntValue];
    }
    else
    {
      unsigned int v16 = 0;
      v14->_hasModelVersion = 0;
    }
    v14->_modelVersion = v16;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:1 type:0 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fact" number:2 type:14 subMessageClass:objc_opt_class()];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qualifiers" number:3 type:14 subMessageClass:objc_opt_class()];
  v8[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelVersion" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7248;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"fact_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_176];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"qualifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_178];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelVersion" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __48__BMHumanUnderstandingPersonalInference_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _qualifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __48__BMHumanUnderstandingPersonalInference_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 fact];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMHumanUnderstandingPersonalInference alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[5] = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end