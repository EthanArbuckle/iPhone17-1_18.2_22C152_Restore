@interface BMContextualUnderstandingSoundAnalysisClassification
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextualUnderstandingSoundAnalysisClassification)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMContextualUnderstandingSoundAnalysisClassification)initWithSoundName:(id)a3 confidence:(id)a4 startOffsetInSecs:(id)a5 durationInSecs:(id)a6;
- (BOOL)hasConfidence;
- (BOOL)hasDurationInSecs;
- (BOOL)hasStartOffsetInSecs;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)soundName;
- (double)confidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)durationInSecs;
- (unsigned)startOffsetInSecs;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasDurationInSecs:(BOOL)a3;
- (void)setHasStartOffsetInSecs:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMContextualUnderstandingSoundAnalysisClassification

- (void).cxx_destruct
{
}

- (void)setHasDurationInSecs:(BOOL)a3
{
  self->_hasDurationInSecs = a3;
}

- (BOOL)hasDurationInSecs
{
  return self->_hasDurationInSecs;
}

- (unsigned)durationInSecs
{
  return self->_durationInSecs;
}

- (void)setHasStartOffsetInSecs:(BOOL)a3
{
  self->_hasStartOffsetInSecs = a3;
}

- (BOOL)hasStartOffsetInSecs
{
  return self->_hasStartOffsetInSecs;
}

- (unsigned)startOffsetInSecs
{
  return self->_startOffsetInSecs;
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

- (NSString)soundName
{
  return self->_soundName;
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
    v6 = [(BMContextualUnderstandingSoundAnalysisClassification *)self soundName];
    uint64_t v7 = [v5 soundName];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextualUnderstandingSoundAnalysisClassification *)self soundName];
      v10 = [v5 soundName];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_22;
      }
    }
    if (![(BMContextualUnderstandingSoundAnalysisClassification *)self hasConfidence]
      && ![v5 hasConfidence]
      || [(BMContextualUnderstandingSoundAnalysisClassification *)self hasConfidence]
      && [v5 hasConfidence]
      && ([(BMContextualUnderstandingSoundAnalysisClassification *)self confidence],
          double v14 = v13,
          [v5 confidence],
          v14 == v15))
    {
      if (![(BMContextualUnderstandingSoundAnalysisClassification *)self hasStartOffsetInSecs]
        && ![v5 hasStartOffsetInSecs]
        || [(BMContextualUnderstandingSoundAnalysisClassification *)self hasStartOffsetInSecs]
        && [v5 hasStartOffsetInSecs]
        && (unsigned int v16 = [(BMContextualUnderstandingSoundAnalysisClassification *)self startOffsetInSecs],
            v16 == [v5 startOffsetInSecs]))
      {
        if (![(BMContextualUnderstandingSoundAnalysisClassification *)self hasDurationInSecs]
          && ![v5 hasDurationInSecs])
        {
          BOOL v12 = 1;
          goto LABEL_23;
        }
        if ([(BMContextualUnderstandingSoundAnalysisClassification *)self hasDurationInSecs]
          && [v5 hasDurationInSecs])
        {
          unsigned int v17 = [(BMContextualUnderstandingSoundAnalysisClassification *)self durationInSecs];
          BOOL v12 = v17 == [v5 durationInSecs];
LABEL_23:

          goto LABEL_24;
        }
      }
    }
LABEL_22:
    BOOL v12 = 0;
    goto LABEL_23;
  }
  BOOL v12 = 0;
LABEL_24:

  return v12;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMContextualUnderstandingSoundAnalysisClassification *)self soundName];
  if (![(BMContextualUnderstandingSoundAnalysisClassification *)self hasConfidence]
    || ([(BMContextualUnderstandingSoundAnalysisClassification *)self confidence], fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    [(BMContextualUnderstandingSoundAnalysisClassification *)self confidence];
    id v5 = NSNumber;
    [(BMContextualUnderstandingSoundAnalysisClassification *)self confidence];
    v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  if ([(BMContextualUnderstandingSoundAnalysisClassification *)self hasStartOffsetInSecs])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification startOffsetInSecs](self, "startOffsetInSecs"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMContextualUnderstandingSoundAnalysisClassification *)self hasDurationInSecs])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification durationInSecs](self, "durationInSecs"));
  }
  else
  {
    v8 = 0;
  }
  v15[0] = @"soundName";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"confidence";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"startOffsetInSecs";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"durationInSecs";
  BOOL v12 = v8;
  if (!v8)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (v8)
  {
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6) {
        goto LABEL_22;
      }
LABEL_28:

      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
  }

  if (!v6) {
    goto LABEL_28;
  }
LABEL_22:
  if (v3) {
    goto LABEL_23;
  }
LABEL_29:

LABEL_23:

  return v13;
}

- (BMContextualUnderstandingSoundAnalysisClassification)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"soundName"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"confidence"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          double v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
        id v38 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        double v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"startOffsetInSecs"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          double v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        int v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startOffsetInSecs"];
        id v36 = v14;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        double v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      int v11 = self;
      id v12 = v10;
    }
    else
    {
      int v11 = self;
      id v12 = 0;
    }
    double v13 = [v6 objectForKeyedSubscript:@"durationInSecs"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      double v15 = [(BMContextualUnderstandingSoundAnalysisClassification *)v11 initWithSoundName:v8 confidence:v31 startOffsetInSecs:v12 durationInSecs:v14];
      int v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      uint64_t v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"durationInSecs"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    double v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    double v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"soundName"];
  v40[0] = v18;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  double v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextualUnderstandingSoundAnalysisClassification *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_soundName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasConfidence)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasStartOffsetInSecs)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasDurationInSecs)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMContextualUnderstandingSoundAnalysisClassification;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_54;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v20 = PBReaderReadString();
          soundName = v5->_soundName;
          v5->_soundName = (NSString *)v20;

          continue;
        case 2u:
          v5->_hasConfidence = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          v5->_confidence = v24;
          continue;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasStartOffsetInSecs = 1;
          while (1)
          {
            uint64_t v28 = *v6;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v7]) {
              break;
            }
            char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
            *(void *)&v4[v28] = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if ((v31 & 0x80) == 0) {
              goto LABEL_41;
            }
            v25 += 7;
            BOOL v17 = v26++ >= 9;
            if (v17)
            {
              LODWORD(v27) = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_43:
          uint64_t v38 = 24;
          goto LABEL_48;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          v5->_hasDurationInSecs = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_53;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v6;
        uint64_t v35 = *(void *)&v4[v34];
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)&v4[*v7]) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
        *(void *)&v4[v34] = v36;
        v27 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_45;
        }
        v32 += 7;
        BOOL v17 = v33++ >= 9;
        if (v17)
        {
          LODWORD(v27) = 0;
          goto LABEL_47;
        }
      }
      v4[*v8] = 1;
LABEL_45:
      if (v4[*v8]) {
        LODWORD(v27) = 0;
      }
LABEL_47:
      uint64_t v38 = 28;
LABEL_48:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v27;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_53:
  }
    uint64_t v39 = 0;
  else {
LABEL_54:
  }
    uint64_t v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextualUnderstandingSoundAnalysisClassification *)self soundName];
  id v5 = NSNumber;
  [(BMContextualUnderstandingSoundAnalysisClassification *)self confidence];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification startOffsetInSecs](self, "startOffsetInSecs"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification durationInSecs](self, "durationInSecs"));
  v9 = (void *)[v3 initWithFormat:@"BMContextualUnderstandingSoundAnalysisClassification with soundName: %@, confidence: %@, startOffsetInSecs: %@, durationInSecs: %@", v4, v6, v7, v8];

  return (NSString *)v9;
}

- (BMContextualUnderstandingSoundAnalysisClassification)initWithSoundName:(id)a3 confidence:(id)a4 startOffsetInSecs:(id)a5 durationInSecs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMContextualUnderstandingSoundAnalysisClassification;
  unint64_t v15 = [(BMEventBase *)&v20 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_soundName, a3);
    if (v12)
    {
      v15->_hasConfidence = 1;
      [v12 doubleValue];
    }
    else
    {
      v15->_hasConfidence = 0;
      double v16 = -1.0;
    }
    v15->_confidence = v16;
    if (v13)
    {
      v15->_hasStartOffsetInSecs = 1;
      unsigned int v17 = [v13 unsignedIntValue];
    }
    else
    {
      unsigned int v17 = 0;
      v15->_hasStartOffsetInSecs = 0;
    }
    v15->_startOffsetInSecs = v17;
    if (v14)
    {
      v15->_hasDurationInSecs = 1;
      unsigned int v18 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v18 = 0;
      v15->_hasDurationInSecs = 0;
    }
    v15->_durationInSecs = v18;
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"soundName" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:2 type:0 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startOffsetInSecs" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"durationInSecs" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3228;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"soundName" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startOffsetInSecs" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"durationInSecs" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMContextualUnderstandingSoundAnalysisClassification alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end