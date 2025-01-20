@interface BMTextUnderstandingPoem
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextUnderstandingPoem)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextUnderstandingPoem)initWithSubject:(id)a3 predicate:(int)a4 object:(id)a5 conversationId:(id)a6 confidence:(id)a7;
- (BMTextUnderstandingPoemEntity)object;
- (BMTextUnderstandingPoemEntity)subject;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (NSString)conversationId;
- (NSString)description;
- (double)confidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)predicate;
- (unsigned)dataVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMTextUnderstandingPoem

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"subject_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_233];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predicate" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"object_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_235_22931];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_object, 0);

  objc_storeStrong((id *)&self->_subject, 0);
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

- (NSString)conversationId
{
  return self->_conversationId;
}

- (BMTextUnderstandingPoemEntity)object
{
  return self->_object;
}

- (int)predicate
{
  return self->_predicate;
}

- (BMTextUnderstandingPoemEntity)subject
{
  return self->_subject;
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
    v6 = [(BMTextUnderstandingPoem *)self subject];
    uint64_t v7 = [v5 subject];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTextUnderstandingPoem *)self subject];
      v10 = [v5 subject];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    int v13 = [(BMTextUnderstandingPoem *)self predicate];
    if (v13 == [v5 predicate])
    {
      v14 = [(BMTextUnderstandingPoem *)self object];
      uint64_t v15 = [v5 object];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMTextUnderstandingPoem *)self object];
        v18 = [v5 object];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_21;
        }
      }
      v20 = [(BMTextUnderstandingPoem *)self conversationId];
      uint64_t v21 = [v5 conversationId];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMTextUnderstandingPoem *)self conversationId];
        v24 = [v5 conversationId];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_21;
        }
      }
      if (![(BMTextUnderstandingPoem *)self hasConfidence]
        && ![v5 hasConfidence])
      {
        BOOL v12 = 1;
        goto LABEL_22;
      }
      if ([(BMTextUnderstandingPoem *)self hasConfidence]
        && [v5 hasConfidence])
      {
        [(BMTextUnderstandingPoem *)self confidence];
        double v27 = v26;
        [v5 confidence];
        BOOL v12 = v27 == v28;
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
  v26[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMTextUnderstandingPoem *)self subject];
  id v4 = [v3 jsonDictionary];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMTextUnderstandingPoem predicate](self, "predicate"));
  v6 = [(BMTextUnderstandingPoem *)self object];
  uint64_t v7 = [v6 jsonDictionary];

  v8 = [(BMTextUnderstandingPoem *)self conversationId];
  if (![(BMTextUnderstandingPoem *)self hasConfidence]
    || ([(BMTextUnderstandingPoem *)self confidence], fabs(v9) == INFINITY))
  {
    int v11 = 0;
  }
  else
  {
    [(BMTextUnderstandingPoem *)self confidence];
    v10 = NSNumber;
    [(BMTextUnderstandingPoem *)self confidence];
    int v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  uint64_t v21 = @"subject";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v26[0] = v12;
  v22 = @"predicate";
  int v13 = v5;
  if (!v5)
  {
    int v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21, v22);
  }
  v26[1] = v13;
  v23 = @"object";
  v14 = v7;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[2] = v14;
  v24 = @"conversationId";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[3] = v15;
  int v25 = @"confidence";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v21, 5, v19);
  if (v11)
  {
    if (v8) {
      goto LABEL_17;
    }
  }
  else
  {

    if (v8)
    {
LABEL_17:
      if (v7) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
  }

  if (v7)
  {
LABEL_18:
    if (v5) {
      goto LABEL_19;
    }
LABEL_26:

    if (v4) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!v5) {
    goto LABEL_26;
  }
LABEL_19:
  if (v4) {
    goto LABEL_20;
  }
LABEL_27:

LABEL_20:

  return v17;
}

- (BMTextUnderstandingPoem)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"subject"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v50 = 0;
    v8 = [[BMTextUnderstandingPoemEntity alloc] initWithJSONDictionary:v10 error:&v50];
    id v11 = v50;
    if (v11)
    {
      uint64_t v12 = v11;
      if (a4) {
        *a4 = v11;
      }

      int v13 = 0;
      goto LABEL_55;
    }

LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"predicate"];
    v48 = self;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v10 = 0;
            int v13 = 0;
            goto LABEL_54;
          }
          v36 = v8;
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"predicate"];
          id v58 = v24;
          uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v40 = v37;
          v8 = v36;
          v46 = (BMTextUnderstandingPoemEntity *)v39;
          v47 = 0;
          int v13 = 0;
          *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v38, 2);
          goto LABEL_52;
        }
        id v14 = [NSNumber numberWithInt:BMTextUnderstandingPoemPredicateTypeFromString(v9)];
      }
      v47 = v14;
    }
    else
    {
      v47 = 0;
    }
    v45 = v9;
    v17 = [v6 objectForKeyedSubscript:@"object"];
    v18 = a4;
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v46 = 0;
LABEL_22:
      uint64_t v19 = [v6 objectForKeyedSubscript:@"conversationId"];
      v20 = v8;
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v18)
          {
            int v13 = 0;
            id v21 = 0;
            double v9 = v45;
            goto LABEL_30;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v32 = *MEMORY[0x1E4F502C8];
          uint64_t v53 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationId"];
          id v54 = v23;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id v33 = (id)[v43 initWithDomain:v32 code:2 userInfo:v22];
          int v13 = 0;
          id v21 = 0;
          id *v18 = v33;
          goto LABEL_29;
        }
        id v21 = v19;
      }
      else
      {
        id v21 = 0;
      }
      v22 = [v6 objectForKeyedSubscript:@"confidence"];
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v18)
          {
            id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v42 = *MEMORY[0x1E4F502C8];
            uint64_t v51 = *MEMORY[0x1E4F28568];
            v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
            v52 = v34;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
            id *v18 = (id)[v44 initWithDomain:v42 code:2 userInfo:v35];
          }
          id v23 = 0;
          int v13 = 0;
          goto LABEL_29;
        }
        id v23 = v22;
      }
      else
      {
        id v23 = 0;
      }
      int v13 = -[BMTextUnderstandingPoem initWithSubject:predicate:object:conversationId:confidence:](v48, "initWithSubject:predicate:object:conversationId:confidence:", v20, [v47 intValue], v46, v21, v23);
      v48 = v13;
LABEL_29:
      double v9 = v45;

LABEL_30:
      id v24 = v17;
      v8 = v20;
LABEL_52:

      v17 = v24;
      self = v48;
LABEL_53:

      id v10 = v47;
LABEL_54:

      goto LABEL_55;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v17;
      id v49 = 0;
      v46 = [[BMTextUnderstandingPoemEntity alloc] initWithJSONDictionary:v24 error:&v49];
      id v25 = v49;
      if (!v25)
      {

        goto LABEL_22;
      }
      double v26 = v25;
      if (a4) {
        *a4 = v25;
      }

      int v13 = 0;
    }
    else
    {
      if (!a4)
      {
        int v13 = 0;
        double v9 = v45;
        goto LABEL_53;
      }
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      double v28 = v8;
      uint64_t v29 = *MEMORY[0x1E4F502C8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v46 = (BMTextUnderstandingPoemEntity *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"object"];
      v56 = v46;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      uint64_t v31 = v29;
      v8 = v28;
      *a4 = (id)[v27 initWithDomain:v31 code:2 userInfo:v30];

      int v13 = 0;
      id v24 = v17;
    }
    double v9 = v45;
    goto LABEL_52;
  }
  if (a4)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F502C8];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    v8 = (BMTextUnderstandingPoemEntity *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"subject"];
    v60[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
    int v13 = 0;
    *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
LABEL_55:

    goto LABEL_56;
  }
  int v13 = 0;
LABEL_56:

  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMTextUnderstandingPoem *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_subject)
  {
    PBDataWriterPlaceMark();
    [(BMTextUnderstandingPoemEntity *)self->_subject writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_object)
  {
    PBDataWriterPlaceMark();
    [(BMTextUnderstandingPoemEntity *)self->_object writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasConfidence) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMTextUnderstandingPoem;
  id v5 = [(BMEventBase *)&v37 init];
  if (!v5) {
    goto LABEL_51;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_50;
          }
          v20 = [[BMTextUnderstandingPoemEntity alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_50;
          }
          uint64_t v21 = 32;
          goto LABEL_35;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          break;
        case 3u:
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_50;
          }
          v20 = [[BMTextUnderstandingPoemEntity alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_50;
          }
          uint64_t v21 = 40;
LABEL_35:
          uint64_t v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 4u:
          uint64_t v30 = PBReaderReadString();
          conversationId = v5->_conversationId;
          v5->_conversationId = (NSString *)v30;

          continue;
        case 5u:
          v5->_hasConfidence = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            double v34 = *(double *)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v34 = 0.0;
          }
          v5->_confidence = v34;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_50;
          }
          continue;
      }
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
          goto LABEL_41;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_43;
        }
      }
      v4[*v8] = 1;
LABEL_41:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_43:
      if (v24 >= 3) {
        LODWORD(v24) = 0;
      }
      v5->_predicate = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_50:
  }
    v35 = 0;
  else {
LABEL_51:
  }
    v35 = v5;

  return v35;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMTextUnderstandingPoem *)self subject];
  id v5 = BMTextUnderstandingPoemPredicateTypeAsString([(BMTextUnderstandingPoem *)self predicate]);
  id v6 = [(BMTextUnderstandingPoem *)self object];
  uint64_t v7 = [(BMTextUnderstandingPoem *)self conversationId];
  v8 = NSNumber;
  [(BMTextUnderstandingPoem *)self confidence];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = (void *)[v3 initWithFormat:@"BMTextUnderstandingPoem with subject: %@, predicate: %@, object: %@, conversationId: %@, confidence: %@", v4, v5, v6, v7, v9];

  return (NSString *)v10;
}

- (BMTextUnderstandingPoem)initWithSubject:(id)a3 predicate:(int)a4 object:(id)a5 conversationId:(id)a6 confidence:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMTextUnderstandingPoem;
  BOOL v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_subject, a3);
    v17->_predicate = a4;
    objc_storeStrong((id *)&v17->_object, a5);
    objc_storeStrong((id *)&v17->_conversationId, a6);
    if (v16)
    {
      v17->_hasConfidence = 1;
      [v16 doubleValue];
    }
    else
    {
      v17->_hasConfidence = 0;
      double v18 = -1.0;
    }
    v17->_confidence = v18;
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subject" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"predicate", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"object" number:3 type:14 subMessageClass:objc_opt_class()];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationId" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:5 type:0 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4308;
}

id __34__BMTextUnderstandingPoem_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 object];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __34__BMTextUnderstandingPoem_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 subject];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMTextUnderstandingPoem alloc] initByReadFrom:v7];
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