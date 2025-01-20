@interface BMIntelligencePlatformMessageTermsTermCount
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformMessageTermsTermCount)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligencePlatformMessageTermsTermCount)initWithTerm:(id)a3 termCount:(id)a4;
- (BMIntelligencePlatformMessageTermsTermCountTerm)term;
- (BOOL)hasTermCount;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)termCount;
- (unsigned)dataVersion;
- (void)setHasTermCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformMessageTermsTermCount

- (void).cxx_destruct
{
}

- (void)setHasTermCount:(BOOL)a3
{
  self->_hasTermCount = a3;
}

- (BOOL)hasTermCount
{
  return self->_hasTermCount;
}

- (int)termCount
{
  return self->_termCount;
}

- (BMIntelligencePlatformMessageTermsTermCountTerm)term
{
  return self->_term;
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
    v6 = [(BMIntelligencePlatformMessageTermsTermCount *)self term];
    uint64_t v7 = [v5 term];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligencePlatformMessageTermsTermCount *)self term];
      v10 = [v5 term];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMIntelligencePlatformMessageTermsTermCount *)self hasTermCount]
      && ![v5 hasTermCount])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    if ([(BMIntelligencePlatformMessageTermsTermCount *)self hasTermCount]
      && [v5 hasTermCount])
    {
      int v13 = [(BMIntelligencePlatformMessageTermsTermCount *)self termCount];
      BOOL v12 = v13 == [v5 termCount];
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligencePlatformMessageTermsTermCount *)self term];
  id v4 = [v3 jsonDictionary];

  if ([(BMIntelligencePlatformMessageTermsTermCount *)self hasTermCount])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformMessageTermsTermCount termCount](self, "termCount"));
  }
  else
  {
    id v5 = 0;
  }
  v10[0] = @"term";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"termCount";
  v11[0] = v6;
  uint64_t v7 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v5)
  {
    if (v4) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v8;
}

- (BMIntelligencePlatformMessageTermsTermCount)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"term"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v22 = 0;
    v8 = [[BMIntelligencePlatformMessageTermsTermCountTerm alloc] initWithJSONDictionary:v10 error:&v22];
    id v13 = v22;
    if (v13)
    {
      v14 = v13;
      if (a4) {
        *a4 = v13;
      }

      int v11 = 0;
      goto LABEL_9;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"termCount"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v19 = *MEMORY[0x1E4F502C8];
          uint64_t v23 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"termCount"];
          v24 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v21];
        }
        int v11 = 0;
        id v10 = 0;
        goto LABEL_8;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    self = [(BMIntelligencePlatformMessageTermsTermCount *)self initWithTerm:v8 termCount:v10];
    int v11 = self;
LABEL_8:

    goto LABEL_9;
  }
  if (!a4)
  {
    int v11 = 0;
    goto LABEL_10;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v8 = (BMIntelligencePlatformMessageTermsTermCountTerm *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"term"];
  v26[0] = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
  int v11 = 0;
  *a4 = v17;
LABEL_9:

LABEL_10:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformMessageTermsTermCount *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_term)
  {
    PBDataWriterPlaceMark();
    [(BMIntelligencePlatformMessageTermsTermCountTerm *)self->_term writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasTermCount) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligencePlatformMessageTermsTermCount;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_40;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 2)
      {
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        v5->_hasTermCount = 1;
        while (1)
        {
          uint64_t v25 = *v6;
          uint64_t v26 = *(void *)&v4[v25];
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
          *(void *)&v4[v25] = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0) {
            goto LABEL_34;
          }
          v22 += 7;
          BOOL v17 = v23++ >= 9;
          if (v17)
          {
            LODWORD(v24) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8]) {
          LODWORD(v24) = 0;
        }
LABEL_36:
        v5->_termCount = v24;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_39;
        }
        v20 = [[BMIntelligencePlatformMessageTermsTermCountTerm alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_39;
        }
        term = v5->_term;
        v5->_term = v20;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_39;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_39:
  }
    v29 = 0;
  else {
LABEL_40:
  }
    v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligencePlatformMessageTermsTermCount *)self term];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformMessageTermsTermCount termCount](self, "termCount"));
  id v6 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformMessageTermsTermCount with term: %@, termCount: %@", v4, v5];

  return (NSString *)v6;
}

- (BMIntelligencePlatformMessageTermsTermCount)initWithTerm:(id)a3 termCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMIntelligencePlatformMessageTermsTermCount;
  v9 = [(BMEventBase *)&v12 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_term, a3);
    if (v8)
    {
      v9->_hasTermCount = 1;
      int v10 = [v8 intValue];
    }
    else
    {
      v9->_hasTermCount = 0;
      int v10 = -1;
    }
    v9->_termCount = v10;
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"term" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"termCount" number:2 type:2 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4848;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"term_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_173];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"termCount" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __54__BMIntelligencePlatformMessageTermsTermCount_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 term];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMIntelligencePlatformMessageTermsTermCount alloc] initByReadFrom:v7];
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