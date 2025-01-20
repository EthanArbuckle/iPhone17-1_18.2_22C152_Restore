@interface BMIntelligencePlatformMessageTermsTermCountTerm
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformMessageTermsTermCountTerm)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligencePlatformMessageTermsTermCountTerm)initWithTermType:(int)a3 termString:(id)a4 termID:(id)a5;
- (BOOL)hasTermID;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)termString;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)termType;
- (int64_t)termID;
- (unsigned)dataVersion;
- (void)setHasTermID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformMessageTermsTermCountTerm

- (void).cxx_destruct
{
}

- (void)setHasTermID:(BOOL)a3
{
  self->_hasTermID = a3;
}

- (BOOL)hasTermID
{
  return self->_hasTermID;
}

- (int64_t)termID
{
  return self->_termID;
}

- (NSString)termString
{
  return self->_termString;
}

- (int)termType
{
  return self->_termType;
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
    int v6 = [(BMIntelligencePlatformMessageTermsTermCountTerm *)self termType];
    if (v6 == [v5 termType])
    {
      v7 = [(BMIntelligencePlatformMessageTermsTermCountTerm *)self termString];
      uint64_t v8 = [v5 termString];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMIntelligencePlatformMessageTermsTermCountTerm *)self termString];
        v11 = [v5 termString];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_13;
        }
      }
      if (![(BMIntelligencePlatformMessageTermsTermCountTerm *)self hasTermID]
        && ![v5 hasTermID])
      {
        BOOL v13 = 1;
        goto LABEL_14;
      }
      if ([(BMIntelligencePlatformMessageTermsTermCountTerm *)self hasTermID]
        && [v5 hasTermID])
      {
        int64_t v14 = [(BMIntelligencePlatformMessageTermsTermCountTerm *)self termID];
        BOOL v13 = v14 == [v5 termID];
LABEL_14:

        goto LABEL_15;
      }
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformMessageTermsTermCountTerm termType](self, "termType"));
  id v4 = [(BMIntelligencePlatformMessageTermsTermCountTerm *)self termString];
  if ([(BMIntelligencePlatformMessageTermsTermCountTerm *)self hasTermID])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMIntelligencePlatformMessageTermsTermCountTerm termID](self, "termID"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"termType";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"termString";
  v7 = v4;
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"termID";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (BMIntelligencePlatformMessageTermsTermCountTerm)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"termType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"termString"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          int64_t v14 = 0;
          goto LABEL_17;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"termString"];
        id v28 = v13;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v17 = (id)[v23 initWithDomain:v16 code:2 userInfo:v12];
        int64_t v14 = 0;
        id v11 = 0;
        *a4 = v17;
        goto LABEL_16;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"termID"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"termID"];
          v26 = v18;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v19];
        }
        id v13 = 0;
        int64_t v14 = 0;
        goto LABEL_16;
      }
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
    self = -[BMIntelligencePlatformMessageTermsTermCountTerm initWithTermType:termString:termID:](self, "initWithTermType:termString:termID:", [v8 intValue], v11, v13);
    int64_t v14 = self;
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMIntelligencePlatformMessageTermsTermCountTermTermTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    int64_t v14 = 0;
    goto LABEL_18;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"termType"];
  v30[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v8 = 0;
  int64_t v14 = 0;
  *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
LABEL_17:

LABEL_18:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformMessageTermsTermCountTerm *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_termString) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasTermID) {
    PBDataWriterWriteInt64Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMIntelligencePlatformMessageTermsTermCountTerm;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_52;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        int64_t v30 = 0;
        v5->_hasTermID = 1;
        while (1)
        {
          uint64_t v31 = *v6;
          uint64_t v32 = *(void *)&v4[v31];
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)&v4[*v7]) {
            break;
          }
          char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
          *(void *)&v4[v31] = v33;
          v30 |= (unint64_t)(v34 & 0x7F) << v28;
          if ((v34 & 0x80) == 0) {
            goto LABEL_46;
          }
          v28 += 7;
          BOOL v17 = v29++ >= 9;
          if (v17)
          {
            int64_t v30 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8]) {
          int64_t v30 = 0;
        }
LABEL_48:
        v5->_termID = v30;
      }
      else if (v20 == 2)
      {
        uint64_t v35 = PBReaderReadString();
        termString = v5->_termString;
        v5->_termString = (NSString *)v35;
      }
      else if (v20 == 1)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_40;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_42:
        if (v23 >= 7) {
          LODWORD(v23) = 0;
        }
        v5->_termType = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    v37 = 0;
  else {
LABEL_52:
  }
    v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMIntelligencePlatformMessageTermsTermCountTermTermTypeAsString([(BMIntelligencePlatformMessageTermsTermCountTerm *)self termType]);
  id v5 = [(BMIntelligencePlatformMessageTermsTermCountTerm *)self termString];
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMIntelligencePlatformMessageTermsTermCountTerm termID](self, "termID"));
  v7 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformMessageTermsTermCountTerm with termType: %@, termString: %@, termID: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMIntelligencePlatformMessageTermsTermCountTerm)initWithTermType:(int)a3 termString:(id)a4 termID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMIntelligencePlatformMessageTermsTermCountTerm;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_termType = a3;
    objc_storeStrong((id *)&v11->_termString, a4);
    if (v10)
    {
      v11->_hasTermID = 1;
      uint64_t v12 = [v10 longLongValue];
    }
    else
    {
      v11->_hasTermID = 0;
      uint64_t v12 = -1;
    }
    v11->_termID = v12;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"termType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"termString", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"termID" number:3 type:3 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4830;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"termType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"termString" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"termID" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:3 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMIntelligencePlatformMessageTermsTermCountTerm alloc] initByReadFrom:v7];
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