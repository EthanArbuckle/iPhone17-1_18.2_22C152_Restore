@interface BMFeedbackLearningTupleInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFeedbackLearningTupleInteraction)initWithEventId:(id)a3 sessionId:(id)a4 absoluteTimestamp:(id)a5 tupleInteraction:(id)a6 candidateInteractions:(id)a7;
- (BMFeedbackLearningTupleInteraction)initWithEventId:(id)a3 sessionId:(id)a4 absoluteTimestamp:(id)a5 tupleInteraction:(id)a6 candidateInteractions:(id)a7 statementId:(id)a8;
- (BMFeedbackLearningTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMFeedbackLearningTupleInteractionTupleInteraction)tupleInteraction;
- (BOOL)hasStatementId;
- (BOOL)isEqual:(id)a3;
- (NSArray)candidateInteractions;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSUUID)eventId;
- (NSUUID)sessionId;
- (id)_candidateInteractionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)statementId;
- (void)setHasStatementId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMFeedbackLearningTupleInteraction

- (BMFeedbackLearningTupleInteraction)initWithEventId:(id)a3 sessionId:(id)a4 absoluteTimestamp:(id)a5 tupleInteraction:(id)a6 candidateInteractions:(id)a7
{
  return [(BMFeedbackLearningTupleInteraction *)self initWithEventId:a3 sessionId:a4 absoluteTimestamp:a5 tupleInteraction:a6 candidateInteractions:a7 statementId:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateInteractions, 0);
  objc_storeStrong((id *)&self->_tupleInteraction, 0);
  objc_storeStrong((id *)&self->_raw_sessionId, 0);

  objc_storeStrong((id *)&self->_raw_eventId, 0);
}

- (void)setHasStatementId:(BOOL)a3
{
  self->_hasStatementId = a3;
}

- (BOOL)hasStatementId
{
  return self->_hasStatementId;
}

- (unsigned)statementId
{
  return self->_statementId;
}

- (NSArray)candidateInteractions
{
  return self->_candidateInteractions;
}

- (BMFeedbackLearningTupleInteractionTupleInteraction)tupleInteraction
{
  return self->_tupleInteraction;
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
    v6 = [(BMFeedbackLearningTupleInteraction *)self eventId];
    uint64_t v7 = [v5 eventId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFeedbackLearningTupleInteraction *)self eventId];
      v10 = [v5 eventId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_28;
      }
    }
    v13 = [(BMFeedbackLearningTupleInteraction *)self sessionId];
    uint64_t v14 = [v5 sessionId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMFeedbackLearningTupleInteraction *)self sessionId];
      v17 = [v5 sessionId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_28;
      }
    }
    v19 = [(BMFeedbackLearningTupleInteraction *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMFeedbackLearningTupleInteraction *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_28;
      }
    }
    v25 = [(BMFeedbackLearningTupleInteraction *)self tupleInteraction];
    uint64_t v26 = [v5 tupleInteraction];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMFeedbackLearningTupleInteraction *)self tupleInteraction];
      v29 = [v5 tupleInteraction];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_28;
      }
    }
    v31 = [(BMFeedbackLearningTupleInteraction *)self candidateInteractions];
    uint64_t v32 = [v5 candidateInteractions];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMFeedbackLearningTupleInteraction *)self candidateInteractions];
      v35 = [v5 candidateInteractions];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_28;
      }
    }
    if (![(BMFeedbackLearningTupleInteraction *)self hasStatementId]
      && ![v5 hasStatementId])
    {
      BOOL v12 = 1;
      goto LABEL_29;
    }
    if ([(BMFeedbackLearningTupleInteraction *)self hasStatementId]
      && [v5 hasStatementId])
    {
      unsigned int v37 = [(BMFeedbackLearningTupleInteraction *)self statementId];
      BOOL v12 = v37 == [v5 statementId];
LABEL_29:

      goto LABEL_30;
    }
LABEL_28:
    BOOL v12 = 0;
    goto LABEL_29;
  }
  BOOL v12 = 0;
LABEL_30:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSUUID)sessionId
{
  raw_sessionId = self->_raw_sessionId;
  if (raw_sessionId)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_sessionId toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (NSUUID)eventId
{
  raw_eventId = self->_raw_eventId;
  if (raw_eventId)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_eventId toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v28[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMFeedbackLearningTupleInteraction *)self eventId];
  uint64_t v4 = [v3 UUIDString];

  id v5 = [(BMFeedbackLearningTupleInteraction *)self sessionId];
  uint64_t v6 = [v5 UUIDString];

  uint64_t v7 = [(BMFeedbackLearningTupleInteraction *)self absoluteTimestamp];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMFeedbackLearningTupleInteraction *)self absoluteTimestamp];
    [v9 timeIntervalSinceReferenceDate];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  int v11 = [(BMFeedbackLearningTupleInteraction *)self tupleInteraction];
  BOOL v12 = [v11 jsonDictionary];

  v13 = [(BMFeedbackLearningTupleInteraction *)self _candidateInteractionsJSONArray];
  if ([(BMFeedbackLearningTupleInteraction *)self hasStatementId])
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMFeedbackLearningTupleInteraction statementId](self, "statementId"));
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v26 = (void *)v4;
  v27[0] = @"eventId";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v23 = v15;
  v25 = (void *)v6;
  v28[0] = v15;
  v27[1] = @"sessionId";
  v16 = (void *)v6;
  if (!v6)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v15);
  }
  v28[1] = v16;
  v27[2] = @"absoluteTimestamp";
  v17 = v10;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[2] = v17;
  v27[3] = @"tupleInteraction";
  int v18 = v12;
  if (!v12)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[3] = v18;
  v27[4] = @"candidateInteractions";
  v19 = v13;
  if (!v13)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v19;
  v27[5] = @"statementId";
  uint64_t v20 = v14;
  if (!v14)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v20;
  v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 6, v23);
  if (v14)
  {
    if (v13) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v13)
    {
LABEL_21:
      if (v12) {
        goto LABEL_22;
      }
LABEL_32:

      if (v10) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }

  if (!v12) {
    goto LABEL_32;
  }
LABEL_22:
  if (v10) {
    goto LABEL_23;
  }
LABEL_33:

LABEL_23:
  if (!v25) {

  }
  if (!v26) {

  }
  return v21;
}

- (id)_candidateInteractionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMFeedbackLearningTupleInteraction *)self candidateInteractions];
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

- (BMFeedbackLearningTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v146[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"eventId"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        v42 = a4;
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v143 = *MEMORY[0x1E4F28568];
        v44 = v7;
        id v45 = [NSString alloc];
        uint64_t v95 = objc_opt_class();
        v46 = v45;
        uint64_t v7 = v44;
        id v8 = (id)[v46 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v95, @"eventId"];
        id v144 = v8;
        uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
        uint64_t v48 = v43;
        v9 = (void *)v47;
        v40 = 0;
        id *v42 = (id)[v41 initWithDomain:v48 code:2 userInfo:v47];
        goto LABEL_83;
      }
      v40 = 0;
      goto LABEL_85;
    }
    id v8 = v7;
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (!v17)
    {
      if (!a4)
      {
        v40 = 0;
        goto LABEL_84;
      }
      id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
      v76 = a4;
      uint64_t v77 = *MEMORY[0x1E4F502C8];
      uint64_t v145 = *MEMORY[0x1E4F28568];
      uint64_t v78 = [[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"eventId"];
      v146[0] = v78;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:&v145 count:1];
      uint64_t v80 = v77;
      v9 = (void *)v78;
      id *v76 = (id)[v75 initWithDomain:v80 code:2 userInfo:v79];

      goto LABEL_66;
    }
    int v18 = (void *)v17;
    v113 = a4;

    id v8 = v18;
  }
  else
  {
    v113 = a4;
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"sessionId"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v9;
        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v19];
        if (!v20)
        {
          id v81 = v19;
          if (v113)
          {
            id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
            v82 = v9;
            uint64_t v83 = *MEMORY[0x1E4F502C8];
            uint64_t v141 = *MEMORY[0x1E4F28568];
            v116 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"sessionId"];
            v142 = v116;
            v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
            uint64_t v85 = v83;
            v9 = v82;
            id *v113 = (id)[v119 initWithDomain:v85 code:2 userInfo:v84];

            v40 = 0;
            v10 = v81;
          }
          else
          {
            v40 = 0;
            v10 = v19;
          }
          goto LABEL_82;
        }
        v21 = (void *)v20;

        v10 = v21;
        goto LABEL_7;
      }
      if (v113)
      {
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        v50 = v9;
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v139 = *MEMORY[0x1E4F28568];
        id v52 = v8;
        id v53 = [NSString alloc];
        uint64_t v96 = objc_opt_class();
        v54 = v53;
        id v8 = v52;
        v10 = (void *)[v54 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v96, @"sessionId"];
        v140 = v10;
        uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
        uint64_t v56 = v51;
        v9 = v50;
        v115 = (void *)v55;
        v40 = 0;
        id *v113 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v56, 2);

        goto LABEL_82;
      }
LABEL_66:
      v40 = 0;
      goto LABEL_83;
    }
  }
  v10 = 0;
LABEL_7:
  uint64_t v11 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  v109 = (void *)v11;
  if (v11 && (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v32 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v33 = v12;
      id v34 = [v32 alloc];
      [v33 doubleValue];
      double v36 = v35;

      id v114 = (id)[v34 initWithTimeIntervalSinceReferenceDate:v36];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v57 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v114 = [v57 dateFromString:v12];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v113)
          {
            v105 = v9;
            id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v107 = v8;
            uint64_t v88 = *MEMORY[0x1E4F502C8];
            uint64_t v137 = *MEMORY[0x1E4F28568];
            id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
            id v138 = v37;
            uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
            v90 = v87;
            uint64_t v91 = v88;
            v9 = v105;
            id v8 = v107;
            v112 = (void *)v89;
            id v114 = 0;
            v40 = 0;
            id *v113 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v91, 2);

            goto LABEL_80;
          }
          id v114 = 0;
          v40 = 0;
          goto LABEL_81;
        }
        id v114 = v12;
      }
    }
  }
  else
  {
    id v114 = 0;
  }
  long long v13 = [v6 objectForKeyedSubscript:@"tupleInteraction"];
  v108 = v10;
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v58 = v13;
      if (v113)
      {
        id v118 = objc_alloc(MEMORY[0x1E4F28C58]);
        v104 = v9;
        uint64_t v59 = *MEMORY[0x1E4F502C8];
        uint64_t v135 = *MEMORY[0x1E4F28568];
        id v60 = v8;
        id v61 = [NSString alloc];
        uint64_t v97 = objc_opt_class();
        v62 = v61;
        id v8 = v60;
        v111 = (void *)[v62 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v97, @"tupleInteraction"];
        v136 = v111;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
        uint64_t v64 = v59;
        v9 = v104;
        id *v113 = (id)[v118 initWithDomain:v64 code:2 userInfo:v63];

        v40 = 0;
        id v37 = v58;
      }
      else
      {
        v40 = 0;
        id v37 = v13;
      }
      goto LABEL_80;
    }
    id v37 = v13;
    id v125 = 0;
    v110 = [[BMFeedbackLearningTupleInteractionTupleInteraction alloc] initWithJSONDictionary:v37 error:&v125];
    id v38 = v125;
    if (v38)
    {
      v39 = v38;
      if (v113) {
        id *v113 = v38;
      }

      v40 = 0;
      goto LABEL_79;
    }
    v102 = v13;
    id v106 = v8;
  }
  else
  {
    v102 = v13;
    id v106 = v8;
    v110 = 0;
  }
  id v14 = [v6 objectForKeyedSubscript:@"candidateInteractions"];
  uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  int v16 = [v14 isEqual:v15];

  v103 = v9;
  if (v16)
  {
    v100 = self;
    v101 = v6;

    id v14 = 0;
  }
  else
  {
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v113)
        {
          id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v73 = *MEMORY[0x1E4F502C8];
          uint64_t v133 = *MEMORY[0x1E4F28568];
          v117 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"candidateInteractions"];
          v134 = v117;
          id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
          id v74 = (id)[v72 initWithDomain:v73 code:2 userInfo:v31];
          v40 = 0;
          id *v113 = v74;
          goto LABEL_77;
        }
        v40 = 0;
        goto LABEL_78;
      }
    }
    v100 = self;
    v101 = v6;
  }
  v117 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v14 = v14;
  uint64_t v22 = [v14 countByEnumeratingWithState:&v121 objects:v132 count:16];
  if (!v22) {
    goto LABEL_34;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v122;
  v99 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v122 != v24) {
        objc_enumerationMutation(v14);
      }
      uint64_t v26 = *(void **)(*((void *)&v121 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v113)
        {
          id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v66 = *MEMORY[0x1E4F502C8];
          uint64_t v130 = *MEMORY[0x1E4F28568];
          id v27 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"candidateInteractions"];
          id v131 = v27;
          v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          id *v113 = (id)[v65 initWithDomain:v66 code:2 userInfo:v67];

LABEL_56:
          v40 = 0;
          id v31 = v14;
          self = v100;
          id v6 = v101;
          uint64_t v7 = v99;
LABEL_60:
          v10 = v108;
          goto LABEL_76;
        }
LABEL_63:
        v40 = 0;
        id v31 = v14;
        self = v100;
        id v6 = v101;
        uint64_t v7 = v99;
        v10 = v108;
        goto LABEL_77;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v113)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v128 = *MEMORY[0x1E4F28568];
          id v27 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"candidateInteractions"];
          id v129 = v27;
          v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
          id *v113 = (id)[v68 initWithDomain:v69 code:2 userInfo:v70];

          goto LABEL_56;
        }
        goto LABEL_63;
      }
      id v27 = v26;
      v28 = [BMFeedbackLearningTupleInteractionCandidateInteraction alloc];
      id v120 = 0;
      v29 = [(BMFeedbackLearningTupleInteractionCandidateInteraction *)v28 initWithJSONDictionary:v27 error:&v120];
      id v30 = v120;
      if (v30)
      {
        v71 = v30;
        uint64_t v7 = v99;
        if (v113) {
          id *v113 = v30;
        }

        v40 = 0;
        id v31 = v14;
        self = v100;
        id v6 = v101;
        goto LABEL_60;
      }
      [v117 addObject:v29];
    }
    uint64_t v23 = [v14 countByEnumeratingWithState:&v121 objects:v132 count:16];
    uint64_t v7 = v99;
    if (v23) {
      continue;
    }
    break;
  }
LABEL_34:

  id v6 = v101;
  id v27 = [v101 objectForKeyedSubscript:@"statementId"];
  if (!v27)
  {
    id v31 = 0;
    self = v100;
    v10 = v108;
    goto LABEL_75;
  }
  objc_opt_class();
  self = v100;
  v10 = v108;
  if (objc_opt_isKindOfClass())
  {
    id v31 = 0;
    goto LABEL_75;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v27;
LABEL_75:
    self = [(BMFeedbackLearningTupleInteraction *)self initWithEventId:v106 sessionId:v10 absoluteTimestamp:v114 tupleInteraction:v110 candidateInteractions:v117 statementId:v31];
    v40 = self;
  }
  else
  {
    id v31 = v113;
    if (v113)
    {
      id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v92 = *MEMORY[0x1E4F502C8];
      uint64_t v126 = *MEMORY[0x1E4F28568];
      v93 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"statementId"];
      v127 = v93;
      v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      id *v113 = (id)[v98 initWithDomain:v92 code:2 userInfo:v94];

      id v31 = 0;
    }
    v40 = 0;
  }
LABEL_76:

LABEL_77:
  v9 = v103;
LABEL_78:

  id v37 = v102;
  id v8 = v106;
LABEL_79:

LABEL_80:
  long long v12 = v109;
LABEL_81:

LABEL_82:
LABEL_83:

LABEL_84:
LABEL_85:

  return v40;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFeedbackLearningTupleInteraction *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_raw_eventId) {
    PBDataWriterWriteDataField();
  }
  if (self->_raw_sessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_tupleInteraction)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMFeedbackLearningTupleInteractionTupleInteraction *)self->_tupleInteraction writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_candidateInteractions;
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

  if (self->_hasStatementId) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMFeedbackLearningTupleInteraction;
  uint64_t v5 = [(BMEventBase *)&v43 init];
  if (!v5)
  {
LABEL_52:
    id v41 = v5;
    goto LABEL_53;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_50:
    uint64_t v38 = [v6 copy];
    candidateInteractions = v5->_candidateInteractions;
    v5->_candidateInteractions = (NSArray *)v38;

    int v40 = v4[*v9];
    if (v40) {
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_50;
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
      goto LABEL_50;
    }
    switch((v13 >> 3))
    {
      case 1u:
        v21 = PBReaderReadData();
        if ([v21 length] != 16) {
          goto LABEL_54;
        }
        uint64_t v22 = 16;
        goto LABEL_24;
      case 2u:
        v21 = PBReaderReadData();
        if ([v21 length] == 16)
        {
          uint64_t v22 = 24;
LABEL_24:
          uint64_t v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

LABEL_49:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_50;
          }
          continue;
        }
LABEL_54:

LABEL_55:
LABEL_51:
        id v41 = 0;
LABEL_53:

        return v41;
      case 3u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v24 = *v7;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v8])
        {
          double v26 = *(double *)(*(void *)&v4[*v10] + v25);
          *(void *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v26 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v26;
        goto LABEL_49;
      case 4u:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_55;
        }
        id v27 = [[BMFeedbackLearningTupleInteractionTupleInteraction alloc] initByReadFrom:v4];
        if (!v27) {
          goto LABEL_55;
        }
        tupleInteraction = v5->_tupleInteraction;
        v5->_tupleInteraction = v27;

        PBReaderRecallMark();
        goto LABEL_49;
      case 5u:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_55;
        }
        id v29 = [[BMFeedbackLearningTupleInteractionCandidateInteraction alloc] initByReadFrom:v4];
        if (!v29) {
          goto LABEL_55;
        }
        id v30 = v29;
        [v6 addObject:v29];
        PBReaderRecallMark();

        goto LABEL_49;
      case 6u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        v5->_hasStatementId = 1;
        while (2)
        {
          uint64_t v34 = *v7;
          uint64_t v35 = *(void *)&v4[v34];
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)&v4[*v10] + v35);
            *(void *)&v4[v34] = v36;
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if (v37 < 0)
            {
              v31 += 7;
              BOOL v18 = v32++ >= 9;
              if (v18)
              {
                LODWORD(v33) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v33) = 0;
        }
LABEL_46:
        v5->_statementId = v33;
        goto LABEL_49;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_49;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMFeedbackLearningTupleInteraction *)self eventId];
  uint64_t v5 = [(BMFeedbackLearningTupleInteraction *)self sessionId];
  uint64_t v6 = [(BMFeedbackLearningTupleInteraction *)self absoluteTimestamp];
  uint64_t v7 = [(BMFeedbackLearningTupleInteraction *)self tupleInteraction];
  uint64_t v8 = [(BMFeedbackLearningTupleInteraction *)self candidateInteractions];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMFeedbackLearningTupleInteraction statementId](self, "statementId"));
  v10 = (void *)[v3 initWithFormat:@"BMFeedbackLearningTupleInteraction with eventId: %@, sessionId: %@, absoluteTimestamp: %@, tupleInteraction: %@, candidateInteractions: %@, statementId: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMFeedbackLearningTupleInteraction)initWithEventId:(id)a3 sessionId:(id)a4 absoluteTimestamp:(id)a5 tupleInteraction:(id)a6 candidateInteractions:(id)a7 statementId:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)BMFeedbackLearningTupleInteraction;
  uint64_t v20 = [(BMEventBase *)&v28 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      [v14 getUUIDBytes:&v29];
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v29 length:16];
      raw_eventId = v20->_raw_eventId;
      v20->_raw_eventId = (NSData *)v21;
    }
    else
    {
      raw_eventId = v20->_raw_eventId;
      v20->_raw_eventId = 0;
    }

    if (v15)
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      [v15 getUUIDBytes:&v29];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v29 length:16];
      raw_sessionId = v20->_raw_sessionId;
      v20->_raw_sessionId = (NSData *)v23;
    }
    else
    {
      raw_sessionId = v20->_raw_sessionId;
      v20->_raw_sessionId = 0;
    }

    if (v16)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      [v16 timeIntervalSinceReferenceDate];
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      double v25 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v25;
    objc_storeStrong((id *)&v20->_tupleInteraction, a6);
    objc_storeStrong((id *)&v20->_candidateInteractions, a7);
    if (v19)
    {
      v20->_hasStatementId = 1;
      unsigned int v26 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v26 = 0;
      v20->_hasStatementId = 0;
    }
    v20->_statementId = v26;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventId" number:1 type:14 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionId" number:2 type:14 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v10[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tupleInteraction" number:4 type:14 subMessageClass:objc_opt_class()];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"candidateInteractions" number:5 type:14 subMessageClass:objc_opt_class()];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"statementId" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6558;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventId" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionId" dataType:6 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"tupleInteraction_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_223];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"candidateInteractions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_225];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"statementId" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __45__BMFeedbackLearningTupleInteraction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _candidateInteractionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __45__BMFeedbackLearningTupleInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 tupleInteraction];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMFeedbackLearningTupleInteraction alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end