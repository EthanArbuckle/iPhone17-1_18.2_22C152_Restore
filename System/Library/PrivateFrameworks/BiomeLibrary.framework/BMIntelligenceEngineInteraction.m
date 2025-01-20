@interface BMIntelligenceEngineInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligenceEngineInteraction)initWithAbsoluteTimestamp:(id)a3 transcriptStatementId:(id)a4 appIntentInvocationUUID:(id)a5 sirikitIntentItemId:(id)a6 trigger:(int)a7 tupleInteraction:(id)a8 candidateInteractions:(id)a9;
- (BMIntelligenceEngineInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligenceEngineInteractionTranscriptStatementID)transcriptStatementId;
- (BMIntelligenceEngineInteractionTupleInteraction)tupleInteraction;
- (BOOL)isEqual:(id)a3;
- (NSArray)candidateInteractions;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)sirikitIntentItemId;
- (NSUUID)appIntentInvocationUUID;
- (id)_candidateInteractionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)trigger;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligenceEngineInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateInteractions, 0);
  objc_storeStrong((id *)&self->_tupleInteraction, 0);
  objc_storeStrong((id *)&self->_sirikitIntentItemId, 0);
  objc_storeStrong((id *)&self->_transcriptStatementId, 0);

  objc_storeStrong((id *)&self->_raw_appIntentInvocationUUID, 0);
}

- (NSArray)candidateInteractions
{
  return self->_candidateInteractions;
}

- (BMIntelligenceEngineInteractionTupleInteraction)tupleInteraction
{
  return self->_tupleInteraction;
}

- (int)trigger
{
  return self->_trigger;
}

- (NSString)sirikitIntentItemId
{
  return self->_sirikitIntentItemId;
}

- (BMIntelligenceEngineInteractionTranscriptStatementID)transcriptStatementId
{
  return self->_transcriptStatementId;
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
    v6 = [(BMIntelligenceEngineInteraction *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligenceEngineInteraction *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_22;
      }
    }
    v13 = [(BMIntelligenceEngineInteraction *)self transcriptStatementId];
    uint64_t v14 = [v5 transcriptStatementId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMIntelligenceEngineInteraction *)self transcriptStatementId];
      v17 = [v5 transcriptStatementId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_22;
      }
    }
    v19 = [(BMIntelligenceEngineInteraction *)self appIntentInvocationUUID];
    uint64_t v20 = [v5 appIntentInvocationUUID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMIntelligenceEngineInteraction *)self appIntentInvocationUUID];
      v23 = [v5 appIntentInvocationUUID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_22;
      }
    }
    v25 = [(BMIntelligenceEngineInteraction *)self sirikitIntentItemId];
    uint64_t v26 = [v5 sirikitIntentItemId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMIntelligenceEngineInteraction *)self sirikitIntentItemId];
      v29 = [v5 sirikitIntentItemId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_22;
      }
    }
    int v31 = [(BMIntelligenceEngineInteraction *)self trigger];
    if (v31 == [v5 trigger])
    {
      v32 = [(BMIntelligenceEngineInteraction *)self tupleInteraction];
      uint64_t v33 = [v5 tupleInteraction];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMIntelligenceEngineInteraction *)self tupleInteraction];
        v36 = [v5 tupleInteraction];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_22;
        }
      }
      v39 = [(BMIntelligenceEngineInteraction *)self candidateInteractions];
      v40 = [v5 candidateInteractions];
      if (v39 == v40)
      {
        char v12 = 1;
      }
      else
      {
        v41 = [(BMIntelligenceEngineInteraction *)self candidateInteractions];
        v42 = [v5 candidateInteractions];
        char v12 = [v41 isEqual:v42];
      }
      goto LABEL_23;
    }
LABEL_22:
    char v12 = 0;
LABEL_23:

    goto LABEL_24;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (NSUUID)appIntentInvocationUUID
{
  raw_appIntentInvocationUUID = self->_raw_appIntentInvocationUUID;
  if (raw_appIntentInvocationUUID)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_appIntentInvocationUUID toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
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

- (id)jsonDictionary
{
  v31[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligenceEngineInteraction *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMIntelligenceEngineInteraction *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMIntelligenceEngineInteraction *)self transcriptStatementId];
  uint64_t v8 = [v7 jsonDictionary];

  v9 = [(BMIntelligenceEngineInteraction *)self appIntentInvocationUUID];
  v29 = [v9 UUIDString];

  v10 = [(BMIntelligenceEngineInteraction *)self sirikitIntentItemId];
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligenceEngineInteraction trigger](self, "trigger"));
  char v12 = [(BMIntelligenceEngineInteraction *)self tupleInteraction];
  v13 = [v12 jsonDictionary];

  uint64_t v14 = [(BMIntelligenceEngineInteraction *)self _candidateInteractionsJSONArray];
  v30[0] = @"absoluteTimestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v15;
  v31[0] = v15;
  v30[1] = @"transcriptStatementId";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v16;
  v31[1] = v16;
  v30[2] = @"appIntentInvocationUUID";
  uint64_t v17 = (uint64_t)v29;
  if (!v29)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[2] = v17;
  v30[3] = @"sirikitIntentItemId";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v17;
  v28 = (void *)v6;
  v31[3] = v18;
  v30[4] = @"trigger";
  v19 = v11;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v8;
  v31[4] = v19;
  v30[5] = @"tupleInteraction";
  v21 = v13;
  if (!v13)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[5] = v21;
  v30[6] = @"candidateInteractions";
  v22 = v14;
  if (!v14)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:7];
  if (v14)
  {
    if (v13) {
      goto LABEL_20;
    }
LABEL_30:

    if (v11) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }

  if (!v13) {
    goto LABEL_30;
  }
LABEL_20:
  if (v11) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v10) {

  }
  if (v29)
  {
    if (v20) {
      goto LABEL_25;
    }
LABEL_33:

    if (v28) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v20) {
    goto LABEL_33;
  }
LABEL_25:
  if (v28) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v23;
}

- (id)_candidateInteractionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMIntelligenceEngineInteraction *)self candidateInteractions];
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

- (BMIntelligenceEngineInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v150[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v9 = v6;
      id v10 = [v8 alloc];
      [v9 doubleValue];
      double v12 = v11;

      id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v7 = [v14 dateFromString:v6];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v7 = 0;
          v27 = 0;
          goto LABEL_94;
        }
        id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v92 = v5;
        uint64_t v93 = *MEMORY[0x1E4F502C8];
        uint64_t v149 = *MEMORY[0x1E4F28568];
        id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
        v150[0] = v24;
        uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:&v149 count:1];
        uint64_t v95 = v93;
        id v5 = v92;
        v121 = (BMIntelligenceEngineInteractionTranscriptStatementID *)v94;
        uint64_t v7 = 0;
        v27 = 0;
        *a4 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v95, 2);
        goto LABEL_92;
      }
      id v13 = v6;
    }
    uint64_t v7 = v13;
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_9:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"transcriptStatementId"];
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v121 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v15;
    id v129 = 0;
    v121 = [[BMIntelligenceEngineInteractionTranscriptStatementID alloc] initWithJSONDictionary:v24 error:&v129];
    id v25 = v129;
    if (v25)
    {
      uint64_t v26 = v25;
      if (a4) {
        *a4 = v25;
      }

      v27 = 0;
      goto LABEL_92;
    }

LABEL_12:
    uint64_t v16 = [v5 objectForKeyedSubscript:@"appIntentInvocationUUID"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v27 = 0;
          goto LABEL_91;
        }
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        v40 = a4;
        v41 = v7;
        v42 = v15;
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v143 = *MEMORY[0x1E4F28568];
        v44 = v40;
        v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appIntentInvocationUUID"];
        v144 = v45;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
        uint64_t v47 = v43;
        uint64_t v15 = v42;
        uint64_t v7 = v41;
        v48 = (void *)v46;
        v27 = 0;
        id *v44 = (id)[v39 initWithDomain:v47 code:2 userInfo:v46];
        goto LABEL_89;
      }
      v117 = v7;
      id v28 = v16;
      uint64_t v29 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v28];
      if (!v29)
      {
        if (!a4)
        {
          v27 = 0;
          v45 = v28;
          uint64_t v7 = v117;
          goto LABEL_90;
        }
        id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
        v102 = a4;
        v87 = v15;
        uint64_t v88 = *MEMORY[0x1E4F502C8];
        uint64_t v145 = *MEMORY[0x1E4F28568];
        v48 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"appIntentInvocationUUID"];
        v146 = v48;
        v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
        uint64_t v90 = v88;
        uint64_t v15 = v87;
        id *v102 = (id)[v86 initWithDomain:v90 code:2 userInfo:v89];

        v27 = 0;
        v45 = v28;
        uint64_t v7 = v117;
LABEL_89:

LABEL_90:
LABEL_91:

        id v24 = v15;
        goto LABEL_92;
      }
      uint64_t v30 = v29;
      v111 = v6;
      uint64_t v17 = a4;

      v115 = (void *)v30;
      uint64_t v7 = v117;
    }
    else
    {
      v111 = v6;
      uint64_t v17 = a4;
      v115 = 0;
    }
    int v18 = [v5 objectForKeyedSubscript:@"sirikitIntentItemId"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v17)
        {
          id v114 = 0;
          v27 = 0;
          v45 = v115;
          uint64_t v6 = v111;
          goto LABEL_88;
        }
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        v119 = v7;
        v50 = v15;
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v141 = *MEMORY[0x1E4F28568];
        id v112 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sirikitIntentItemId"];
        id v142 = v112;
        uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
        uint64_t v53 = v51;
        uint64_t v15 = v50;
        uint64_t v7 = v119;
        id v114 = 0;
        v27 = 0;
        id *v17 = (id)[v49 initWithDomain:v53 code:2 userInfo:v52];
        v19 = (void *)v52;
        goto LABEL_111;
      }
      id v114 = v18;
    }
    else
    {
      id v114 = 0;
    }
    v19 = [v5 objectForKeyedSubscript:@"trigger"];
    v110 = v16;
    if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v112 = 0;
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v112 = v19;
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v112 = [NSNumber numberWithInt:BMIntelligenceEngineInteractionDonationTriggerFromString(v19)];
LABEL_21:
      uint64_t v20 = [v5 objectForKeyedSubscript:@"tupleInteraction"];
      v109 = v19;
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v104 = v20;
        v105 = v15;
        v107 = 0;
LABEL_24:
        id v21 = [v5 objectForKeyedSubscript:@"candidateInteractions"];
        v22 = [MEMORY[0x1E4F1CA98] null];
        int v23 = [v21 isEqual:v22];

        v116 = v7;
        if (v23)
        {
          v101 = v17;
          v103 = v18;

          id v21 = 0;
LABEL_59:
          v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id v21 = v21;
          uint64_t v62 = [v21 countByEnumeratingWithState:&v124 objects:v134 count:16];
          if (!v62) {
            goto LABEL_69;
          }
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v125;
          id v100 = v5;
LABEL_61:
          uint64_t v65 = 0;
          while (1)
          {
            if (*(void *)v125 != v64) {
              objc_enumerationMutation(v21);
            }
            v66 = *(void **)(*((void *)&v124 + 1) + 8 * v65);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v5 = v100;
              v71 = v101;
              uint64_t v6 = v111;
              int v18 = v103;
              if (!v101) {
                goto LABEL_81;
              }
              id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
              v72 = v111;
              uint64_t v73 = *MEMORY[0x1E4F502C8];
              uint64_t v130 = *MEMORY[0x1E4F28568];
              id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"candidateInteractions"];
              id v131 = v67;
              v74 = (void *)MEMORY[0x1E4F1C9E8];
              v75 = &v131;
              v76 = &v130;
              goto LABEL_74;
            }
            id v67 = v66;
            v68 = [BMIntelligenceEngineInteractionCandidateInteraction alloc];
            id v123 = 0;
            v69 = [(BMIntelligenceEngineInteractionCandidateInteraction *)v68 initWithJSONDictionary:v67 error:&v123];
            id v70 = v123;
            if (v70)
            {
              v77 = v70;
              if (v101) {
                id *v101 = v70;
              }

              id v5 = v100;
              uint64_t v6 = v111;
              v79 = v116;
              int v18 = v103;
LABEL_80:

              uint64_t v7 = v79;
LABEL_81:

              v27 = 0;
              goto LABEL_82;
            }
            [v61 addObject:v69];

            if (v63 == ++v65)
            {
              uint64_t v63 = [v21 countByEnumeratingWithState:&v124 objects:v134 count:16];
              id v5 = v100;
              if (v63) {
                goto LABEL_61;
              }
LABEL_69:

              v38 = v107;
              v27 = -[BMIntelligenceEngineInteraction initWithAbsoluteTimestamp:transcriptStatementId:appIntentInvocationUUID:sirikitIntentItemId:trigger:tupleInteraction:candidateInteractions:](self, "initWithAbsoluteTimestamp:transcriptStatementId:appIntentInvocationUUID:sirikitIntentItemId:trigger:tupleInteraction:candidateInteractions:", v7, v121, v115, v114, [v112 intValue], v107, v61);
              self = v27;
              uint64_t v6 = v111;
              int v18 = v103;
LABEL_83:

              v19 = v109;
              id v35 = v104;
              goto LABEL_84;
            }
          }
          id v5 = v100;
          v71 = v101;
          uint64_t v6 = v111;
          int v18 = v103;
          if (!v101) {
            goto LABEL_81;
          }
          id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
          v72 = v111;
          uint64_t v73 = *MEMORY[0x1E4F502C8];
          uint64_t v132 = *MEMORY[0x1E4F28568];
          id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"candidateInteractions"];
          id v133 = v67;
          v74 = (void *)MEMORY[0x1E4F1C9E8];
          v75 = &v133;
          v76 = &v132;
LABEL_74:
          v77 = [v74 dictionaryWithObjects:v75 forKeys:v76 count:1];
          uint64_t v78 = v73;
          uint64_t v6 = v72;
          uint64_t v16 = v110;
          v79 = v116;
          id *v71 = (id)[v99 initWithDomain:v78 code:2 userInfo:v77];
          goto LABEL_80;
        }
        if (!v21)
        {
          v101 = v17;
          v103 = v18;
          goto LABEL_59;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v101 = v17;
          v103 = v18;
          goto LABEL_59;
        }
        if (v17)
        {
          id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v82 = *MEMORY[0x1E4F502C8];
          uint64_t v135 = *MEMORY[0x1E4F28568];
          v61 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"candidateInteractions"];
          v136 = v61;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
          v83 = v18;
          v85 = v84 = v7;
          id *v17 = (id)[v81 initWithDomain:v82 code:2 userInfo:v85];

          uint64_t v7 = v84;
          int v18 = v83;
          v27 = 0;
          uint64_t v6 = v111;
LABEL_82:
          v38 = v107;
          goto LABEL_83;
        }
        v27 = 0;
        id v35 = v104;
        uint64_t v6 = v111;
        v38 = v107;
LABEL_84:

        uint64_t v15 = v105;
        goto LABEL_85;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v20;
        id v128 = 0;
        v107 = [[BMIntelligenceEngineInteractionTupleInteraction alloc] initWithJSONDictionary:v35 error:&v128];
        id v36 = v128;
        if (!v36)
        {
          v104 = v20;
          v105 = v15;

          goto LABEL_24;
        }
        int v37 = v36;
        if (v17) {
          id *v17 = v36;
        }

        v27 = 0;
        uint64_t v6 = v111;
        v38 = v107;
      }
      else
      {
        if (!v17)
        {
          v27 = 0;
          uint64_t v6 = v111;
          goto LABEL_86;
        }
        id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
        v120 = v7;
        v54 = v15;
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v137 = *MEMORY[0x1E4F28568];
        v56 = v18;
        v57 = v17;
        uint64_t v58 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"tupleInteraction"];
        uint64_t v138 = v58;
        v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
        uint64_t v60 = v55;
        uint64_t v15 = v54;
        uint64_t v7 = v120;
        id *v57 = (id)[v108 initWithDomain:v60 code:2 userInfo:v59];
        int v18 = v56;
        uint64_t v16 = v110;

        v27 = 0;
        id v35 = v20;
        v38 = (void *)v58;
        uint64_t v6 = v111;
      }
LABEL_85:

      uint64_t v20 = v35;
LABEL_86:

      v45 = v115;
LABEL_87:

LABEL_88:
      v48 = v114;
      goto LABEL_89;
    }
    if (v17)
    {
      id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
      v106 = v15;
      uint64_t v96 = *MEMORY[0x1E4F502C8];
      uint64_t v139 = *MEMORY[0x1E4F28568];
      id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"trigger"];
      id v140 = v35;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
      uint64_t v97 = v96;
      uint64_t v15 = v106;
      id v98 = (id)[v113 initWithDomain:v97 code:2 userInfo:v38];
      id v112 = 0;
      v27 = 0;
      id *v17 = v98;
      uint64_t v6 = v111;
      goto LABEL_85;
    }
    id v112 = 0;
    v27 = 0;
LABEL_111:
    v45 = v115;
    uint64_t v6 = v111;
    goto LABEL_87;
  }
  if (a4)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    v118 = v7;
    v32 = v15;
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v147 = *MEMORY[0x1E4F28568];
    v121 = (BMIntelligenceEngineInteractionTranscriptStatementID *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"transcriptStatementId"];
    v148 = v121;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    *a4 = (id)[v31 initWithDomain:v33 code:2 userInfo:v34];

    v27 = 0;
    id v24 = v32;
    uint64_t v7 = v118;
LABEL_92:

    uint64_t v15 = v24;
    goto LABEL_93;
  }
  v27 = 0;
LABEL_93:

LABEL_94:
  return v27;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligenceEngineInteraction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_transcriptStatementId)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMIntelligenceEngineInteractionTranscriptStatementID *)self->_transcriptStatementId writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_raw_appIntentInvocationUUID) {
    PBDataWriterWriteDataField();
  }
  if (self->_sirikitIntentItemId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_tupleInteraction)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMIntelligenceEngineInteractionTupleInteraction *)self->_tupleInteraction writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_candidateInteractions;
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
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
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
  v44.receiver = self;
  v44.super_class = (Class)BMIntelligenceEngineInteraction;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5)
  {
LABEL_57:
    v42 = v5;
    goto LABEL_58;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_55:
    uint64_t v39 = [v6 copy];
    candidateInteractions = v5->_candidateInteractions;
    v5->_candidateInteractions = (NSArray *)v39;

    int v41 = v4[*v9];
    if (v41) {
      goto LABEL_56;
    }
    goto LABEL_57;
  }
  id v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_55;
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
      goto LABEL_55;
    }
    switch((v13 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v21 = *v7;
        unint64_t v22 = *(void *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
        {
          double v23 = *(double *)(*(void *)&v4[*v10] + v22);
          *(void *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v23 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v23;
        goto LABEL_54;
      case 2u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_60;
        }
        id v24 = [[BMIntelligenceEngineInteractionTranscriptStatementID alloc] initByReadFrom:v4];
        if (!v24) {
          goto LABEL_60;
        }
        uint64_t v25 = 48;
        goto LABEL_42;
      case 3u:
        PBReaderReadData();
        uint64_t v26 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v26 length] == 16)
        {
          raw_appIntentInvocationUUID = v5->_raw_appIntentInvocationUUID;
          v5->_raw_appIntentInvocationUUID = v26;
LABEL_31:

LABEL_54:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_55;
          }
          continue;
        }

LABEL_60:
LABEL_56:
        v42 = 0;
LABEL_58:

        return v42;
      case 4u:
        uint64_t v28 = PBReaderReadString();
        raw_appIntentInvocationUUID = (NSData *)v5->_sirikitIntentItemId;
        v5->_sirikitIntentItemId = (NSString *)v28;
        goto LABEL_31;
      case 5u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        while (2)
        {
          uint64_t v32 = *v7;
          uint64_t v33 = *(void *)&v4[v32];
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)&v4[*v10] + v33);
            *(void *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if (v35 < 0)
            {
              v29 += 7;
              BOOL v18 = v30++ >= 9;
              if (v18)
              {
                LODWORD(v31) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v31) = 0;
        }
LABEL_49:
        if (v31 >= 5) {
          LODWORD(v31) = 0;
        }
        v5->_trigger = v31;
        goto LABEL_54;
      case 6u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_60;
        }
        id v24 = [[BMIntelligenceEngineInteractionTupleInteraction alloc] initByReadFrom:v4];
        if (!v24) {
          goto LABEL_60;
        }
        uint64_t v25 = 64;
LABEL_42:
        id v36 = *(Class *)((char *)&v5->super.super.isa + v25);
        *(Class *)((char *)&v5->super.super.isa + v25) = v24;

        PBReaderRecallMark();
        goto LABEL_54;
      case 7u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_60;
        }
        id v37 = [[BMIntelligenceEngineInteractionCandidateInteraction alloc] initByReadFrom:v4];
        if (!v37) {
          goto LABEL_60;
        }
        v38 = v37;
        [v6 addObject:v37];
        PBReaderRecallMark();

        goto LABEL_54;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_54;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligenceEngineInteraction *)self absoluteTimestamp];
  id v5 = [(BMIntelligenceEngineInteraction *)self transcriptStatementId];
  uint64_t v6 = [(BMIntelligenceEngineInteraction *)self appIntentInvocationUUID];
  uint64_t v7 = [(BMIntelligenceEngineInteraction *)self sirikitIntentItemId];
  uint64_t v8 = BMIntelligenceEngineInteractionDonationTriggerAsString([(BMIntelligenceEngineInteraction *)self trigger]);
  uint64_t v9 = [(BMIntelligenceEngineInteraction *)self tupleInteraction];
  id v10 = [(BMIntelligenceEngineInteraction *)self candidateInteractions];
  char v11 = (void *)[v3 initWithFormat:@"BMIntelligenceEngineInteraction with absoluteTimestamp: %@, transcriptStatementId: %@, appIntentInvocationUUID: %@, sirikitIntentItemId: %@, trigger: %@, tupleInteraction: %@, candidateInteractions: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMIntelligenceEngineInteraction)initWithAbsoluteTimestamp:(id)a3 transcriptStatementId:(id)a4 appIntentInvocationUUID:(id)a5 sirikitIntentItemId:(id)a6 trigger:(int)a7 tupleInteraction:(id)a8 candidateInteractions:(id)a9
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v25 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMIntelligenceEngineInteraction;
  int v19 = [(BMEventBase *)&v26 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      [v14 timeIntervalSinceReferenceDate];
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
    objc_storeStrong((id *)&v19->_transcriptStatementId, a4);
    if (v15)
    {
      v27[0] = 0;
      v27[1] = 0;
      [v15 getUUIDBytes:v27];
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v27 length:16];
      raw_appIntentInvocationUUID = v19->_raw_appIntentInvocationUUID;
      v19->_raw_appIntentInvocationUUID = (NSData *)v21;
    }
    else
    {
      raw_appIntentInvocationUUID = v19->_raw_appIntentInvocationUUID;
      v19->_raw_appIntentInvocationUUID = 0;
    }

    objc_storeStrong((id *)&v19->_sirikitIntentItemId, a6);
    v19->_trigger = a7;
    objc_storeStrong((id *)&v19->_tupleInteraction, a8);
    objc_storeStrong((id *)&v19->_candidateInteractions, a9);
  }

  return v19;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"transcriptStatementId", 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appIntentInvocationUUID" number:3 type:14 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sirikitIntentItemId" number:4 type:13 subMessageClass:0];
  v11[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trigger" number:5 type:4 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tupleInteraction" number:6 type:14 subMessageClass:objc_opt_class()];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"candidateInteractions" number:7 type:14 subMessageClass:objc_opt_class()];
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF47D0;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"transcriptStatementId_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_312];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appIntentInvocationUUID" dataType:6 requestOnly:0 fieldNumber:3 protoDataType:14 convertedType:3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sirikitIntentItemId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trigger" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"tupleInteraction_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_314];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"candidateInteractions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_316];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

id __42__BMIntelligenceEngineInteraction_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _candidateInteractionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __42__BMIntelligenceEngineInteraction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 tupleInteraction];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __42__BMIntelligenceEngineInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 transcriptStatementId];
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

    uint64_t v8 = [[BMIntelligenceEngineInteraction alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end