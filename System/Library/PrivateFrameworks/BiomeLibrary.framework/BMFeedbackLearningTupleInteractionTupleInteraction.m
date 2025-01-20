@interface BMFeedbackLearningTupleInteractionTupleInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFeedbackLearningTupleInteractionTupleInteraction)initWithCandidates:(id)a3 userAlignment:(id)a4;
- (BMFeedbackLearningTupleInteractionTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligenceFlowUserAlignment)userAlignment;
- (BOOL)isEqual:(id)a3;
- (NSArray)candidates;
- (NSString)description;
- (id)_candidatesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMFeedbackLearningTupleInteractionTupleInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAlignment, 0);

  objc_storeStrong((id *)&self->_candidates, 0);
}

- (BMIntelligenceFlowUserAlignment)userAlignment
{
  return self->_userAlignment;
}

- (NSArray)candidates
{
  return self->_candidates;
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
    v6 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self candidates];
    uint64_t v7 = [v5 candidates];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self candidates];
      v10 = [v5 candidates];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self userAlignment];
    v14 = [v5 userAlignment];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self userAlignment];
      v16 = [v5 userAlignment];
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
  v3 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self _candidatesJSONArray];
  id v4 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self userAlignment];
  id v5 = [v4 jsonDictionary];

  v10[0] = @"candidates";
  v6 = v3;
  if (!v3)
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

  return v8;
}

- (id)_candidatesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self candidates];
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

- (BMFeedbackLearningTupleInteractionTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"candidates"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v38 = self;
    v39 = v5;

    id v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          v41 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"candidates"];
          v56[0] = v41;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
          id v30 = (id)[v28 initWithDomain:v29 code:2 userInfo:v18];
          v26 = 0;
          *a4 = v30;
          goto LABEL_33;
        }
        v26 = 0;
        goto LABEL_34;
      }
    }
    v38 = self;
    v39 = v5;
  }
  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v6;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v45;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v45 != v11) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = a4;
        if (a4)
        {
          id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v21 = *MEMORY[0x1E4F502C8];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          long long v14 = (BMIntelligenceFlowUserAlignment *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"candidates"];
          v53 = v14;
          v22 = (void *)MEMORY[0x1E4F1C9E8];
          v23 = &v53;
          v24 = &v52;
LABEL_23:
          v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
          id *v19 = (id)[v20 initWithDomain:v21 code:2 userInfo:v25];

          v26 = 0;
          v18 = v6;
          self = v38;
          id v5 = v39;
          goto LABEL_32;
        }
LABEL_29:
        v26 = 0;
        v18 = v6;
        self = v38;
        id v5 = v39;
        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = a4;
        if (a4)
        {
          id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v21 = *MEMORY[0x1E4F502C8];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          long long v14 = (BMIntelligenceFlowUserAlignment *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"candidates"];
          v51 = v14;
          v22 = (void *)MEMORY[0x1E4F1C9E8];
          v23 = &v51;
          v24 = &v50;
          goto LABEL_23;
        }
        goto LABEL_29;
      }
      long long v14 = v13;
      v15 = [BMFeedbackLearningTupleInteractionCandidateIdentifier alloc];
      id v43 = 0;
      uint64_t v16 = [(BMFeedbackLearningTupleInteractionCandidateIdentifier *)v15 initWithJSONDictionary:v14 error:&v43];
      id v17 = v43;
      if (v17)
      {
        v27 = v17;
        id v5 = v39;
        if (a4) {
          *a4 = v17;
        }

        v26 = 0;
        v18 = v6;
        self = v38;
LABEL_32:

        goto LABEL_33;
      }
      [v41 addObject:v16];
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  id v5 = v39;
  v18 = [v39 objectForKeyedSubscript:@"userAlignment"];
  if (!v18)
  {
    long long v14 = 0;
    self = v38;
    goto LABEL_31;
  }
  objc_opt_class();
  self = v38;
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v18;
    id v42 = 0;
    long long v14 = [[BMIntelligenceFlowUserAlignment alloc] initWithJSONDictionary:v32 error:&v42];
    id v33 = v42;
    if (v33)
    {
      v34 = v33;
      if (a4) {
        *a4 = v33;
      }

      v26 = 0;
      v18 = v32;
      goto LABEL_32;
    }

LABEL_31:
    self = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self initWithCandidates:v41 userAlignment:v14];
    v26 = self;
    goto LABEL_32;
  }
  if (a4)
  {
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v36 = *MEMORY[0x1E4F502C8];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    long long v14 = (BMIntelligenceFlowUserAlignment *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"userAlignment"];
    v49 = v14;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    *a4 = (id)[v35 initWithDomain:v36 code:2 userInfo:v37];

    v26 = 0;
    goto LABEL_32;
  }
  v26 = 0;
LABEL_33:

LABEL_34:
  return v26;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFeedbackLearningTupleInteractionTupleInteraction *)self writeTo:v3];
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
  id v5 = self->_candidates;
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

  if (self->_userAlignment)
  {
    PBDataWriterPlaceMark();
    [(BMIntelligenceFlowUserAlignment *)self->_userAlignment writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMFeedbackLearningTupleInteractionTupleInteraction;
  id v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
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
        if (v12++ >= 9)
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
      if ((v13 >> 3) == 2)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v23 = [[BMIntelligenceFlowUserAlignment alloc] initByReadFrom:v4]) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        userAlignment = v5->_userAlignment;
        v5->_userAlignment = v23;

        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_31;
        }
        id v21 = [[BMFeedbackLearningTupleInteractionCandidateIdentifier alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_31;
        }
        v22 = v21;
        [v6 addObject:v21];
        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v25 = [v6 copy];
  candidates = v5->_candidates;
  v5->_candidates = (NSArray *)v25;

  int v27 = v4[*v9];
  if (v27) {
LABEL_32:
  }
    id v28 = 0;
  else {
LABEL_30:
  }
    id v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self candidates];
  id v5 = [(BMFeedbackLearningTupleInteractionTupleInteraction *)self userAlignment];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMFeedbackLearningTupleInteractionTupleInteraction with candidates: %@, userAlignment: %@", v4, v5];

  return (NSString *)v6;
}

- (BMFeedbackLearningTupleInteractionTupleInteraction)initWithCandidates:(id)a3 userAlignment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMFeedbackLearningTupleInteractionTupleInteraction;
  uint64_t v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_candidates, a3);
    objc_storeStrong((id *)&v9->_userAlignment, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"candidates" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAlignment" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6540;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"candidates_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_160];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"userAlignment_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_162];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __61__BMFeedbackLearningTupleInteractionTupleInteraction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 userAlignment];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __61__BMFeedbackLearningTupleInteractionTupleInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _candidatesJSONArray];
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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMFeedbackLearningTupleInteractionTupleInteraction alloc] initByReadFrom:v7];
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