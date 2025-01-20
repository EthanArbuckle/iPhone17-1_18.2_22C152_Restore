@interface BMIntelligenceEngineInteractionTupleInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligenceEngineInteractionTupleInteraction)initWithCandidateIds:(id)a3 userAlignment:(int)a4;
- (BMIntelligenceEngineInteractionTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)candidateIds;
- (NSString)description;
- (id)_candidateIdsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)userAlignment;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligenceEngineInteractionTupleInteraction

- (void).cxx_destruct
{
}

- (int)userAlignment
{
  return self->_userAlignment;
}

- (NSArray)candidateIds
{
  return self->_candidateIds;
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
    v6 = [(BMIntelligenceEngineInteractionTupleInteraction *)self candidateIds];
    uint64_t v7 = [v5 candidateIds];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligenceEngineInteractionTupleInteraction *)self candidateIds];
      v10 = [v5 candidateIds];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        BOOL v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int v13 = [(BMIntelligenceEngineInteractionTupleInteraction *)self userAlignment];
    BOOL v12 = v13 == [v5 userAlignment];
    goto LABEL_8;
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligenceEngineInteractionTupleInteraction *)self _candidateIdsJSONArray];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligenceEngineInteractionTupleInteraction userAlignment](self, "userAlignment"));
  v9[0] = @"candidateIds";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"userAlignment";
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)_candidateIdsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMIntelligenceEngineInteractionTupleInteraction *)self candidateIds];
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

- (BMIntelligenceEngineInteractionTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"candidateIds"];
  v8 = [MEMORY[0x1E4F1CA98] null];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v41 = a4;
    v42 = self;
    v43 = v6;

    id v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          v44 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"candidateIds"];
          v58[0] = v44;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
          id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v19];
          v28 = 0;
          *a4 = v31;
          goto LABEL_39;
        }
        v28 = 0;
        goto LABEL_40;
      }
    }
    v41 = a4;
    v42 = self;
    v43 = v6;
  }
  v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v7;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v47;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v47 != v12) {
        objc_enumerationMutation(v7);
      }
      long long v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = v41;
        if (v41)
        {
          id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"candidateIds"];
          id v55 = v15;
          v23 = (void *)MEMORY[0x1E4F1C9E8];
          v24 = &v55;
          v25 = &v54;
LABEL_23:
          v26 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
          id *v20 = (id)[v21 initWithDomain:v22 code:2 userInfo:v26];

LABEL_27:
          v28 = 0;
          v19 = v7;
          self = v42;
          id v6 = v43;
          goto LABEL_38;
        }
LABEL_30:
        v28 = 0;
        v19 = v7;
        self = v42;
        id v6 = v43;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = v41;
        if (v41)
        {
          id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"candidateIds"];
          id v53 = v15;
          v23 = (void *)MEMORY[0x1E4F1C9E8];
          v24 = &v53;
          v25 = &v52;
          goto LABEL_23;
        }
        goto LABEL_30;
      }
      id v15 = v14;
      uint64_t v16 = [BMIntelligenceEngineInteractionCandidateID alloc];
      id v45 = 0;
      v17 = [(BMIntelligenceEngineInteractionCandidateID *)v16 initWithJSONDictionary:v15 error:&v45];
      id v18 = v45;
      if (v18)
      {
        v27 = v18;
        if (v41) {
          id *v41 = v18;
        }

        goto LABEL_27;
      }
      [v44 addObject:v17];
    }
    uint64_t v11 = [v7 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_16:

  id v6 = v43;
  id v15 = [v43 objectForKeyedSubscript:@"userAlignment"];
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v15;
LABEL_36:
    v19 = v32;
LABEL_37:
    self = -[BMIntelligenceEngineInteractionTupleInteraction initWithCandidateIds:userAlignment:](v42, "initWithCandidateIds:userAlignment:", v44, [v19 intValue]);
    v28 = self;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = NSNumber;
      v34 = BMIntelligenceEngineInteractionUserAlignmentFromString(v15);
      v35 = v33;
      id v6 = v43;
      id v32 = [v35 numberWithInt:v34];
      goto LABEL_36;
    }
    if (v41)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v38 = *MEMORY[0x1E4F502C8];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userAlignment"];
      v51 = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id *v41 = (id)[v37 initWithDomain:v38 code:2 userInfo:v40];
    }
    v19 = 0;
    v28 = 0;
    self = v42;
  }
LABEL_38:

LABEL_39:
LABEL_40:

  return v28;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligenceEngineInteractionTupleInteraction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_candidateIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMIntelligenceEngineInteractionTupleInteraction;
  uint64_t v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_42;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  int v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v13 >> 3) == 1)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v28 = [[BMIntelligenceEngineInteractionCandidateID alloc] initByReadFrom:v4]) == 0)
        {
LABEL_44:

          goto LABEL_41;
        }
        id v29 = v28;
        [v6 addObject:v28];
        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 2)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = *v7;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v8]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v10] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_34;
          }
          v21 += 7;
          BOOL v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_36;
          }
        }
        v4[*v9] = 1;
LABEL_34:
        if (v4[*v9]) {
          LODWORD(v23) = 0;
        }
LABEL_36:
        if (v23 >= 8) {
          LODWORD(v23) = 0;
        }
        v5->_userAlignment = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_44;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v30 = [v6 copy];
  candidateIds = v5->_candidateIds;
  v5->_candidateIds = (NSArray *)v30;

  int v32 = v4[*v9];
  if (v32) {
LABEL_41:
  }
    v33 = 0;
  else {
LABEL_42:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligenceEngineInteractionTupleInteraction *)self candidateIds];
  uint64_t v5 = BMIntelligenceEngineInteractionUserAlignmentAsString([(BMIntelligenceEngineInteractionTupleInteraction *)self userAlignment]);
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMIntelligenceEngineInteractionTupleInteraction with candidateIds: %@, userAlignment: %@", v4, v5];

  return (NSString *)v6;
}

- (BMIntelligenceEngineInteractionTupleInteraction)initWithCandidateIds:(id)a3 userAlignment:(int)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMIntelligenceEngineInteractionTupleInteraction;
  uint64_t v8 = [(BMEventBase *)&v10 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v8->_candidateIds, a3);
    v8->_userAlignment = a4;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"candidateIds" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAlignment" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF47A0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"candidateIds_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_227];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAlignment" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __58__BMIntelligenceEngineInteractionTupleInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _candidateIdsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMIntelligenceEngineInteractionTupleInteraction alloc] initByReadFrom:v7];
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