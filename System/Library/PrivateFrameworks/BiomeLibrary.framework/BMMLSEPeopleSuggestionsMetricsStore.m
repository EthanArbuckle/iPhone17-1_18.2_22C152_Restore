@interface BMMLSEPeopleSuggestionsMetricsStore
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEPeopleSuggestionsMetricsStore)initWithEventIdentifier:(id)a3 model:(id)a4 reciprocalRank:(id)a5 reciprocalRankDefinitionVersion:(id)a6;
- (BMMLSEPeopleSuggestionsMetricsStore)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasReciprocalRank;
- (BOOL)hasReciprocalRankDefinitionVersion;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)eventIdentifier;
- (NSString)model;
- (double)reciprocalRank;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)reciprocalRankDefinitionVersion;
- (void)setHasReciprocalRank:(BOOL)a3;
- (void)setHasReciprocalRankDefinitionVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEPeopleSuggestionsMetricsStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (void)setHasReciprocalRankDefinitionVersion:(BOOL)a3
{
  self->_hasReciprocalRankDefinitionVersion = a3;
}

- (BOOL)hasReciprocalRankDefinitionVersion
{
  return self->_hasReciprocalRankDefinitionVersion;
}

- (unsigned)reciprocalRankDefinitionVersion
{
  return self->_reciprocalRankDefinitionVersion;
}

- (void)setHasReciprocalRank:(BOOL)a3
{
  self->_hasReciprocalRank = a3;
}

- (BOOL)hasReciprocalRank
{
  return self->_hasReciprocalRank;
}

- (double)reciprocalRank
{
  return self->_reciprocalRank;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
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
    v6 = [(BMMLSEPeopleSuggestionsMetricsStore *)self eventIdentifier];
    uint64_t v7 = [v5 eventIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEPeopleSuggestionsMetricsStore *)self eventIdentifier];
      v10 = [v5 eventIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMMLSEPeopleSuggestionsMetricsStore *)self model];
    uint64_t v14 = [v5 model];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMLSEPeopleSuggestionsMetricsStore *)self model];
      v17 = [v5 model];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    if (![(BMMLSEPeopleSuggestionsMetricsStore *)self hasReciprocalRank]
      && ![v5 hasReciprocalRank]
      || [(BMMLSEPeopleSuggestionsMetricsStore *)self hasReciprocalRank]
      && [v5 hasReciprocalRank]
      && ([(BMMLSEPeopleSuggestionsMetricsStore *)self reciprocalRank],
          double v20 = v19,
          [v5 reciprocalRank],
          v20 == v21))
    {
      if (!-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRankDefinitionVersion](self, "hasReciprocalRankDefinitionVersion")&& ![v5 hasReciprocalRankDefinitionVersion])
      {
        BOOL v12 = 1;
        goto LABEL_22;
      }
      if (-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRankDefinitionVersion](self, "hasReciprocalRankDefinitionVersion")&& [v5 hasReciprocalRankDefinitionVersion])
      {
        unsigned int v22 = [(BMMLSEPeopleSuggestionsMetricsStore *)self reciprocalRankDefinitionVersion];
        BOOL v12 = v22 == [v5 reciprocalRankDefinitionVersion];
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  BOOL v12 = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMLSEPeopleSuggestionsMetricsStore *)self eventIdentifier];
  id v4 = [(BMMLSEPeopleSuggestionsMetricsStore *)self model];
  if (![(BMMLSEPeopleSuggestionsMetricsStore *)self hasReciprocalRank]
    || ([(BMMLSEPeopleSuggestionsMetricsStore *)self reciprocalRank], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMMLSEPeopleSuggestionsMetricsStore *)self reciprocalRank];
    v6 = NSNumber;
    [(BMMLSEPeopleSuggestionsMetricsStore *)self reciprocalRank];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  if ([(BMMLSEPeopleSuggestionsMetricsStore *)self hasReciprocalRankDefinitionVersion])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRankDefinitionVersion](self, "reciprocalRankDefinitionVersion"));
  }
  else
  {
    v8 = 0;
  }
  v15[0] = @"eventIdentifier";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"model";
  v10 = v4;
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"reciprocalRank";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"reciprocalRankDefinitionVersion";
  BOOL v12 = v8;
  if (!v8)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (v8)
  {
    if (v7) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v4) {
        goto LABEL_19;
      }
LABEL_25:

      if (v3) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
  }

  if (!v4) {
    goto LABEL_25;
  }
LABEL_19:
  if (v3) {
    goto LABEL_20;
  }
LABEL_26:

LABEL_20:

  return v13;
}

- (BMMLSEPeopleSuggestionsMetricsStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"eventIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"model"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        double v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"model"];
        id v38 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        v15 = 0;
        a4 = 0;
        *double v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"reciprocalRank"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        int v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"reciprocalRank"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
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
    v13 = [v6 objectForKeyedSubscript:@"reciprocalRankDefinitionVersion"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = [(BMMLSEPeopleSuggestionsMetricsStore *)v11 initWithEventIdentifier:v8 model:v31 reciprocalRank:v12 reciprocalRankDefinitionVersion:v14];
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
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"reciprocalRankDefinitionVersion"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    v15 = 0;
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
    v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  int v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventIdentifier"];
  v40[0] = v18;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v15 = 0;
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
  [(BMMLSEPeopleSuggestionsMetricsStore *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasReciprocalRank)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasReciprocalRankDefinitionVersion)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMLSEPeopleSuggestionsMetricsStore;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_44;
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
          uint64_t v21 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
LABEL_24:
          id v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v5->_hasReciprocalRank = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            double v25 = *(double *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v25 = 0.0;
          }
          v5->_reciprocalRank = v25;
          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasReciprocalRankDefinitionVersion = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_43;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v6;
        uint64_t v30 = *(void *)&v4[v29];
        unint64_t v31 = v30 + 1;
        if (v30 == -1 || v31 > *(void *)&v4[*v7]) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
        *(void *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0) {
          goto LABEL_36;
        }
        v26 += 7;
        BOOL v17 = v27++ >= 9;
        if (v17)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v8] = 1;
LABEL_36:
      if (v4[*v8]) {
        LODWORD(v28) = 0;
      }
LABEL_38:
      v5->_reciprocalRankDefinitionVersion = v28;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    uint64_t v33 = 0;
  else {
LABEL_44:
  }
    uint64_t v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEPeopleSuggestionsMetricsStore *)self eventIdentifier];
  id v5 = [(BMMLSEPeopleSuggestionsMetricsStore *)self model];
  id v6 = NSNumber;
  [(BMMLSEPeopleSuggestionsMetricsStore *)self reciprocalRank];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRankDefinitionVersion](self, "reciprocalRankDefinitionVersion"));
  v9 = (void *)[v3 initWithFormat:@"BMMLSEPeopleSuggestionsMetricsStore with eventIdentifier: %@, model: %@, reciprocalRank: %@, reciprocalRankDefinitionVersion: %@", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (BMMLSEPeopleSuggestionsMetricsStore)initWithEventIdentifier:(id)a3 model:(id)a4 reciprocalRank:(id)a5 reciprocalRankDefinitionVersion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMMLSEPeopleSuggestionsMetricsStore;
  unint64_t v15 = [(BMEventBase *)&v19 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_eventIdentifier, a3);
    objc_storeStrong((id *)&v15->_model, a4);
    if (v13)
    {
      v15->_hasReciprocalRank = 1;
      [v13 doubleValue];
    }
    else
    {
      v15->_hasReciprocalRank = 0;
      double v16 = -1.0;
    }
    v15->_reciprocalRank = v16;
    if (v14)
    {
      v15->_hasReciprocalRankDefinitionVersion = 1;
      unsigned int v17 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v17 = 0;
      v15->_hasReciprocalRankDefinitionVersion = 0;
    }
    v15->_reciprocalRankDefinitionVersion = v17;
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventIdentifier" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"model" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reciprocalRank" number:3 type:0 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reciprocalRankDefinitionVersion" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF51F0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"model" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reciprocalRank" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reciprocalRankDefinitionVersion" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
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

    id v8 = [[BMMLSEPeopleSuggestionsMetricsStore alloc] initByReadFrom:v7];
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