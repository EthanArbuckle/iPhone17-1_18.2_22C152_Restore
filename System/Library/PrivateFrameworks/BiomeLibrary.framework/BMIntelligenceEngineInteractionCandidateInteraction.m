@interface BMIntelligenceEngineInteractionCandidateInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligenceEngineInteractionCandidateID)candidateId;
- (BMIntelligenceEngineInteractionCandidateInteraction)initWithCandidateId:(id)a3 userAlignment:(int)a4;
- (BMIntelligenceEngineInteractionCandidateInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)userAlignment;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligenceEngineInteractionCandidateInteraction

- (void).cxx_destruct
{
}

- (int)userAlignment
{
  return self->_userAlignment;
}

- (BMIntelligenceEngineInteractionCandidateID)candidateId
{
  return self->_candidateId;
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
    v6 = [(BMIntelligenceEngineInteractionCandidateInteraction *)self candidateId];
    uint64_t v7 = [v5 candidateId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligenceEngineInteractionCandidateInteraction *)self candidateId];
      v10 = [v5 candidateId];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        BOOL v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int v13 = [(BMIntelligenceEngineInteractionCandidateInteraction *)self userAlignment];
    BOOL v12 = v13 == [v5 userAlignment];
    goto LABEL_8;
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligenceEngineInteractionCandidateInteraction *)self candidateId];
  id v4 = [v3 jsonDictionary];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligenceEngineInteractionCandidateInteraction userAlignment](self, "userAlignment"));
  v10[0] = @"candidateId";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"userAlignment";
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
      goto LABEL_7;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (BMIntelligenceEngineInteractionCandidateInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"candidateId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v23 = 0;
    v8 = [[BMIntelligenceEngineInteractionCandidateID alloc] initWithJSONDictionary:v10 error:&v23];
    id v11 = v23;
    if (v11)
    {
      BOOL v12 = v11;
      if (a4) {
        *a4 = v11;
      }

      int v13 = 0;
      goto LABEL_21;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"userAlignment"];
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
          if (a4)
          {
            id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v20 = *MEMORY[0x1E4F502C8];
            uint64_t v24 = *MEMORY[0x1E4F28568];
            v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userAlignment"];
            v25 = v21;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v22];
          }
          id v10 = 0;
          int v13 = 0;
          goto LABEL_20;
        }
        id v14 = [NSNumber numberWithInt:BMIntelligenceEngineInteractionUserAlignmentFromString(v9)];
      }
      id v10 = v14;
    }
    else
    {
      id v10 = 0;
    }
    self = -[BMIntelligenceEngineInteractionCandidateInteraction initWithCandidateId:userAlignment:](self, "initWithCandidateId:userAlignment:", v8, [v10 intValue]);
    int v13 = self;
LABEL_20:

    goto LABEL_21;
  }
  if (!a4)
  {
    int v13 = 0;
    goto LABEL_22;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v26 = *MEMORY[0x1E4F28568];
  v8 = (BMIntelligenceEngineInteractionCandidateID *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"candidateId"];
  v27[0] = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
  int v13 = 0;
  *a4 = v17;
LABEL_21:

LABEL_22:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligenceEngineInteractionCandidateInteraction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_candidateId)
  {
    PBDataWriterPlaceMark();
    [(BMIntelligenceEngineInteractionCandidateID *)self->_candidateId writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligenceEngineInteractionCandidateInteraction;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_42;
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
      if ((v12 >> 3) == 1)
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_41;
        }
        v27 = [[BMIntelligenceEngineInteractionCandidateID alloc] initByReadFrom:v4];
        if (!v27) {
          goto LABEL_41;
        }
        candidateId = v5->_candidateId;
        v5->_candidateId = v27;

        PBReaderRecallMark();
      }
      else if ((v12 >> 3) == 2)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
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
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8]) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        if (v22 >= 8) {
          LODWORD(v22) = 0;
        }
        v5->_userAlignment = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_41;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_41:
  }
    v29 = 0;
  else {
LABEL_42:
  }
    v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligenceEngineInteractionCandidateInteraction *)self candidateId];
  id v5 = BMIntelligenceEngineInteractionUserAlignmentAsString([(BMIntelligenceEngineInteractionCandidateInteraction *)self userAlignment]);
  id v6 = (void *)[v3 initWithFormat:@"BMIntelligenceEngineInteractionCandidateInteraction with candidateId: %@, userAlignment: %@", v4, v5];

  return (NSString *)v6;
}

- (BMIntelligenceEngineInteractionCandidateInteraction)initWithCandidateId:(id)a3 userAlignment:(int)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMIntelligenceEngineInteractionCandidateInteraction;
  v8 = [(BMEventBase *)&v10 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v8->_candidateId, a3);
    v8->_userAlignment = a4;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"candidateId" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAlignment" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4788;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"candidateId_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_186];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAlignment" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __62__BMIntelligenceEngineInteractionCandidateInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 candidateId];
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

    v8 = [[BMIntelligenceEngineInteractionCandidateInteraction alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end