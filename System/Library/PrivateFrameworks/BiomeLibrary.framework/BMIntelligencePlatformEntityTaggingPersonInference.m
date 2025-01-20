@interface BMIntelligencePlatformEntityTaggingPersonInference
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformEntityTaggingPersonInference)initWithEntityIdentifier:(id)a3 entityTagID:(int)a4 score:(id)a5 feedbackEventID:(id)a6;
- (BMIntelligencePlatformEntityTaggingPersonInference)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasEntityIdentifier;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)feedbackEventID;
- (double)score;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)entityTagID;
- (unint64_t)entityIdentifier;
- (unsigned)dataVersion;
- (void)setHasEntityIdentifier:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformEntityTaggingPersonInference

- (void).cxx_destruct
{
}

- (NSString)feedbackEventID
{
  return self->_feedbackEventID;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (double)score
{
  return self->_score;
}

- (int)entityTagID
{
  return self->_entityTagID;
}

- (void)setHasEntityIdentifier:(BOOL)a3
{
  self->_hasEntityIdentifier = a3;
}

- (BOOL)hasEntityIdentifier
{
  return self->_hasEntityIdentifier;
}

- (unint64_t)entityIdentifier
{
  return self->_entityIdentifier;
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
    if ((![(BMIntelligencePlatformEntityTaggingPersonInference *)self hasEntityIdentifier]
       && ![v5 hasEntityIdentifier]
       || [(BMIntelligencePlatformEntityTaggingPersonInference *)self hasEntityIdentifier]
       && [v5 hasEntityIdentifier]
       && (unint64_t v6 = [(BMIntelligencePlatformEntityTaggingPersonInference *)self entityIdentifier],
           v6 == [v5 entityIdentifier]))
      && (int v7 = [(BMIntelligencePlatformEntityTaggingPersonInference *)self entityTagID],
          v7 == [v5 entityTagID])
      && (![(BMIntelligencePlatformEntityTaggingPersonInference *)self hasScore]
       && ![v5 hasScore]
       || [(BMIntelligencePlatformEntityTaggingPersonInference *)self hasScore]
       && [v5 hasScore]
       && ([(BMIntelligencePlatformEntityTaggingPersonInference *)self score],
           double v9 = v8,
           [v5 score],
           v9 == v10)))
    {
      v11 = [(BMIntelligencePlatformEntityTaggingPersonInference *)self feedbackEventID];
      v12 = [v5 feedbackEventID];
      if (v11 == v12)
      {
        char v15 = 1;
      }
      else
      {
        v13 = [(BMIntelligencePlatformEntityTaggingPersonInference *)self feedbackEventID];
        v14 = [v5 feedbackEventID];
        char v15 = [v13 isEqual:v14];
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if ([(BMIntelligencePlatformEntityTaggingPersonInference *)self hasEntityIdentifier])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMIntelligencePlatformEntityTaggingPersonInference entityIdentifier](self, "entityIdentifier"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformEntityTaggingPersonInference entityTagID](self, "entityTagID"));
  if (![(BMIntelligencePlatformEntityTaggingPersonInference *)self hasScore]
    || ([(BMIntelligencePlatformEntityTaggingPersonInference *)self score], fabs(v5) == INFINITY))
  {
    int v7 = 0;
  }
  else
  {
    [(BMIntelligencePlatformEntityTaggingPersonInference *)self score];
    unint64_t v6 = NSNumber;
    [(BMIntelligencePlatformEntityTaggingPersonInference *)self score];
    int v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  double v8 = [(BMIntelligencePlatformEntityTaggingPersonInference *)self feedbackEventID];
  v15[0] = @"entityIdentifier";
  double v9 = v3;
  if (!v3)
  {
    double v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"entityTagID";
  double v10 = v4;
  if (!v4)
  {
    double v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"score";
  v11 = v7;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"feedbackEventID";
  v12 = v8;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
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

- (BMIntelligencePlatformEntityTaggingPersonInference)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"entityIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v31 = 0;
LABEL_4:
    double v8 = [v6 objectForKeyedSubscript:@"entityTagID"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v30 = 0;
            v12 = 0;
            goto LABEL_35;
          }
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v36 = *MEMORY[0x1E4F28568];
          id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"entityTagID"];
          id v37 = v16;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          v30 = 0;
          v12 = 0;
          *a4 = (id)[v25 initWithDomain:v26 code:2 userInfo:v13];
          goto LABEL_34;
        }
        id v9 = [NSNumber numberWithInt:BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString(v8)];
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"score"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v16 = 0;
          v12 = 0;
          goto LABEL_34;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
        id v35 = v18;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v14 = self;
        v17 = v20 = a4;
        id v21 = (id)[v28 initWithDomain:v19 code:2 userInfo:v17];
        v12 = 0;
        id v16 = 0;
        id *v20 = v21;
        goto LABEL_32;
      }
      v14 = self;
      char v15 = a4;
      id v16 = v13;
    }
    else
    {
      v14 = self;
      char v15 = a4;
      id v16 = 0;
    }
    v17 = [v6 objectForKeyedSubscript:@"feedbackEventID"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v18 = 0;
LABEL_22:
      self = -[BMIntelligencePlatformEntityTaggingPersonInference initWithEntityIdentifier:entityTagID:score:feedbackEventID:](v14, "initWithEntityIdentifier:entityTagID:score:feedbackEventID:", v31, [v30 intValue], v16, v18);
      v12 = self;
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      goto LABEL_22;
    }
    if (v15)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"feedbackEventID"];
      v33 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *char v15 = (id)[v29 initWithDomain:v27 code:2 userInfo:v23];
    }
    id v18 = 0;
    v12 = 0;
LABEL_32:
    self = v14;
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v31 = 0;
    v12 = 0;
    goto LABEL_36;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"entityIdentifier"];
  v39[0] = v30;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  id v31 = 0;
  v12 = 0;
  *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v8];
LABEL_35:

LABEL_36:
  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformEntityTaggingPersonInference *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasEntityIdentifier) {
    PBDataWriterWriteUint64Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_feedbackEventID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMIntelligencePlatformEntityTaggingPersonInference;
  double v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_55;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  double v8 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          unint64_t v22 = 0;
          v5->_hasEntityIdentifier = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_41;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              unint64_t v22 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8]) {
            unint64_t v22 = 0;
          }
LABEL_43:
          v5->_entityIdentifier = v22;
          break;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_45;
            }
            v27 += 7;
            BOOL v17 = v28++ >= 9;
            if (v17)
            {
              LODWORD(v29) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8]) {
            LODWORD(v29) = 0;
          }
LABEL_47:
          if (v29 >= 0x19) {
            LODWORD(v29) = 0;
          }
          v5->_entityTagID = v29;
          break;
        case 3u:
          v5->_hasScore = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            double v36 = *(double *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v36 = 0.0;
          }
          v5->_score = v36;
          break;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          feedbackEventID = v5->_feedbackEventID;
          v5->_feedbackEventID = (NSString *)v37;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_54;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_54:
  }
    v39 = 0;
  else {
LABEL_55:
  }
    v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMIntelligencePlatformEntityTaggingPersonInference entityIdentifier](self, "entityIdentifier"));
  double v5 = BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDAsString([(BMIntelligencePlatformEntityTaggingPersonInference *)self entityTagID]);
  id v6 = NSNumber;
  [(BMIntelligencePlatformEntityTaggingPersonInference *)self score];
  int v7 = objc_msgSend(v6, "numberWithDouble:");
  double v8 = [(BMIntelligencePlatformEntityTaggingPersonInference *)self feedbackEventID];
  id v9 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformEntityTaggingPersonInference with entityIdentifier: %@, entityTagID: %@, score: %@, feedbackEventID: %@", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (BMIntelligencePlatformEntityTaggingPersonInference)initWithEntityIdentifier:(id)a3 entityTagID:(int)a4 score:(id)a5 feedbackEventID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMIntelligencePlatformEntityTaggingPersonInference;
  uint64_t v13 = [(BMEventBase *)&v17 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v13->_hasEntityIdentifier = 1;
      uint64_t v14 = [v10 unsignedLongLongValue];
    }
    else
    {
      uint64_t v14 = 0;
      v13->_hasEntityIdentifier = 0;
    }
    v13->_entityIdentifier = v14;
    v13->_entityTagID = a4;
    if (v11)
    {
      v13->_hasScore = 1;
      [v11 doubleValue];
    }
    else
    {
      v13->_hasScore = 0;
      double v15 = -1.0;
    }
    v13->_score = v15;
    objc_storeStrong((id *)&v13->_feedbackEventID, a6);
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entityIdentifier" number:1 type:5 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entityTagID" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:3 type:0 subMessageClass:0];
  v8[2] = v4;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"feedbackEventID" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5148;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entityIdentifier" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:5 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entityTagID" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"feedbackEventID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
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
    double v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    double v8 = [[BMIntelligencePlatformEntityTaggingPersonInference alloc] initByReadFrom:v7];
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