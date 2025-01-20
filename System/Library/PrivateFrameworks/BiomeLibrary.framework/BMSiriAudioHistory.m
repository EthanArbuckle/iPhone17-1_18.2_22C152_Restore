@interface BMSiriAudioHistory
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAudioHistory)initWithInteraction:(id)a3 entities:(id)a4;
- (BMSiriAudioHistory)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriRemembersInteraction)interaction;
- (BOOL)isEqual:(id)a3;
- (NSArray)entities;
- (NSString)description;
- (id)_entitiesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAudioHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);

  objc_storeStrong((id *)&self->_interaction, 0);
}

- (NSArray)entities
{
  return self->_entities;
}

- (BMSiriRemembersInteraction)interaction
{
  return self->_interaction;
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
    v6 = [(BMSiriAudioHistory *)self interaction];
    uint64_t v7 = [v5 interaction];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriAudioHistory *)self interaction];
      v10 = [v5 interaction];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMSiriAudioHistory *)self entities];
    v14 = [v5 entities];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMSiriAudioHistory *)self entities];
      v16 = [v5 entities];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriAudioHistory *)self interaction];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMSiriAudioHistory *)self _entitiesJSONArray];
  v10[0] = @"interaction";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"entities";
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

- (id)_entitiesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriAudioHistory *)self entities];
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

- (BMSiriAudioHistory)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"interaction"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v55 = *MEMORY[0x1E4F28568];
        v56[0] = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"interaction"];
        v8 = (BMSiriRemembersInteraction *)v56[0];
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v9];
        v22 = 0;
        *a4 = v27;
        goto LABEL_37;
      }
      v22 = 0;
      goto LABEL_38;
    }
    id v9 = v7;
    id v47 = 0;
    v8 = [[BMSiriRemembersInteraction alloc] initWithJSONDictionary:v9 error:&v47];
    id v23 = v47;
    if (v23)
    {
      v24 = v23;
      if (a4) {
        *a4 = v23;
      }

      goto LABEL_41;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"entities"];
  v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  v38 = a4;
  if (!v11)
  {
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v40 = v6;
      v41 = v8;
      v39 = v7;
      goto LABEL_9;
    }
    if (a4)
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      long long v12 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"entities"];
      v54 = v12;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      *a4 = (id)[v34 initWithDomain:v35 code:2 userInfo:v36];

      v22 = 0;
      goto LABEL_36;
    }
LABEL_41:
    v22 = 0;
    goto LABEL_37;
  }
  id v40 = v6;
  v41 = v8;
  v39 = v7;

  id v9 = 0;
LABEL_9:
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v9;
  uint64_t v13 = [v9 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v44;
  v37 = self;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v44 != v15) {
        objc_enumerationMutation(v9);
      }
      v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = v37;
        uint64_t v7 = v39;
        id v6 = v40;
        if (v38)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"entities"];
          id v51 = v18;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          id *v38 = (id)[v28 initWithDomain:v29 code:2 userInfo:v30];
LABEL_34:
        }
LABEL_35:

        v22 = 0;
        v8 = v41;
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v37;
        uint64_t v7 = v39;
        id v6 = v40;
        if (v38)
        {
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v32 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"entities"];
          id v49 = v18;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          id *v38 = (id)[v31 initWithDomain:v32 code:2 userInfo:v30];
          goto LABEL_34;
        }
        goto LABEL_35;
      }
      id v18 = v17;
      v19 = [BMSiriRemembersEntities alloc];
      id v42 = 0;
      v20 = [(BMSiriRemembersEntities *)v19 initWithJSONDictionary:v18 error:&v42];
      id v21 = v42;
      if (v21)
      {
        v30 = v21;
        if (v38) {
          id *v38 = v21;
        }

        self = v37;
        uint64_t v7 = v39;
        id v6 = v40;
        goto LABEL_34;
      }
      [v12 addObject:v20];
    }
    uint64_t v14 = [v9 countByEnumeratingWithState:&v43 objects:v52 count:16];
    self = v37;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_19:

  v8 = v41;
  self = [(BMSiriAudioHistory *)self initWithInteraction:v41 entities:v12];
  v22 = self;
  uint64_t v7 = v39;
  id v6 = v40;
LABEL_36:

LABEL_37:
LABEL_38:

  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriAudioHistory *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_interaction)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriRemembersInteraction *)self->_interaction writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_entities;
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
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
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
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriAudioHistory;
  uint64_t v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      if ((v13 >> 3) == 2)
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v22 = [[BMSiriRemembersEntities alloc] initByReadFrom:v4]) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        id v23 = v22;
        [v6 addObject:v22];
        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_31;
        }
        v20 = [[BMSiriRemembersInteraction alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_31;
        }
        interaction = v5->_interaction;
        v5->_interaction = v20;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v24 = [v6 copy];
  entities = v5->_entities;
  v5->_entities = (NSArray *)v24;

  int v26 = v4[*v9];
  if (v26) {
LABEL_32:
  }
    id v27 = 0;
  else {
LABEL_30:
  }
    id v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriAudioHistory *)self interaction];
  uint64_t v5 = [(BMSiriAudioHistory *)self entities];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMSiriAudioHistory with interaction: %@, entities: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriAudioHistory)initWithInteraction:(id)a3 entities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSiriAudioHistory;
  uint64_t v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_interaction, a3);
    objc_storeStrong((id *)&v9->_entities, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interaction" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entities" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6288;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"interaction_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_63033];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"entities_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_35_63034];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __29__BMSiriAudioHistory_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _entitiesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __29__BMSiriAudioHistory_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 interaction];
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriAudioHistory alloc] initByReadFrom:v7];
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