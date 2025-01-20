@interface BMAppIntentInvocation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocation)initWithBundleID:(id)a3 source:(int)a4 executionUUID:(id)a5 executionDate:(id)a6 action:(id)a7 resolvedAction:(id)a8 actionOutput:(id)a9 predictions:(id)a10;
- (BMAppIntentInvocation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppIntentInvocationAction)action;
- (BMAppIntentInvocationAction)resolvedAction;
- (BMAppIntentInvocationActionOutput)actionOutput;
- (BOOL)isEqual:(id)a3;
- (NSArray)predictions;
- (NSDate)executionDate;
- (NSString)bundleID;
- (NSString)description;
- (NSUUID)executionUUID;
- (id)_predictionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)source;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_actionOutput, 0);
  objc_storeStrong((id *)&self->_resolvedAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_raw_executionUUID, 0);
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (BMAppIntentInvocationActionOutput)actionOutput
{
  return self->_actionOutput;
}

- (BMAppIntentInvocationAction)resolvedAction
{
  return self->_resolvedAction;
}

- (BMAppIntentInvocationAction)action
{
  return self->_action;
}

- (int)source
{
  return self->_source;
}

- (NSString)bundleID
{
  return self->_bundleID;
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
    v6 = [(BMAppIntentInvocation *)self bundleID];
    uint64_t v7 = [v5 bundleID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppIntentInvocation *)self bundleID];
      v10 = [v5 bundleID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_26;
      }
    }
    int v13 = [(BMAppIntentInvocation *)self source];
    if (v13 == [v5 source])
    {
      v14 = [(BMAppIntentInvocation *)self executionUUID];
      uint64_t v15 = [v5 executionUUID];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMAppIntentInvocation *)self executionUUID];
        v18 = [v5 executionUUID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_26;
        }
      }
      v20 = [(BMAppIntentInvocation *)self executionDate];
      uint64_t v21 = [v5 executionDate];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMAppIntentInvocation *)self executionDate];
        v24 = [v5 executionDate];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_26;
        }
      }
      v26 = [(BMAppIntentInvocation *)self action];
      uint64_t v27 = [v5 action];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMAppIntentInvocation *)self action];
        v30 = [v5 action];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_26;
        }
      }
      v32 = [(BMAppIntentInvocation *)self resolvedAction];
      uint64_t v33 = [v5 resolvedAction];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMAppIntentInvocation *)self resolvedAction];
        v36 = [v5 resolvedAction];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_26;
        }
      }
      v38 = [(BMAppIntentInvocation *)self actionOutput];
      uint64_t v39 = [v5 actionOutput];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(BMAppIntentInvocation *)self actionOutput];
        v42 = [v5 actionOutput];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_26;
        }
      }
      v45 = [(BMAppIntentInvocation *)self predictions];
      v46 = [v5 predictions];
      if (v45 == v46)
      {
        char v12 = 1;
      }
      else
      {
        v47 = [(BMAppIntentInvocation *)self predictions];
        v48 = [v5 predictions];
        char v12 = [v47 isEqual:v48];
      }
      goto LABEL_27;
    }
LABEL_26:
    char v12 = 0;
LABEL_27:

    goto LABEL_28;
  }
  char v12 = 0;
LABEL_28:

  return v12;
}

- (NSDate)executionDate
{
  if (self->_hasRaw_executionDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_executionDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSUUID)executionUUID
{
  raw_executionUUID = self->_raw_executionUUID;
  if (raw_executionUUID)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_executionUUID toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v35[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAppIntentInvocation *)self bundleID];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocation source](self, "source"));
  id v5 = [(BMAppIntentInvocation *)self executionUUID];
  uint64_t v6 = [v5 UUIDString];

  uint64_t v7 = [(BMAppIntentInvocation *)self executionDate];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMAppIntentInvocation *)self executionDate];
    [v9 timeIntervalSince1970];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  int v11 = [(BMAppIntentInvocation *)self action];
  uint64_t v33 = [v11 jsonDictionary];

  char v12 = [(BMAppIntentInvocation *)self resolvedAction];
  int v13 = [v12 jsonDictionary];

  v14 = [(BMAppIntentInvocation *)self actionOutput];
  uint64_t v15 = [v14 jsonDictionary];

  v16 = [(BMAppIntentInvocation *)self _predictionsJSONArray];
  v34[0] = @"bundleID";
  uint64_t v17 = v3;
  if (!v3)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v17;
  v35[0] = v17;
  v34[1] = @"source";
  uint64_t v18 = v4;
  if (!v4)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v18;
  v35[1] = v18;
  v34[2] = @"executionUUID";
  uint64_t v19 = v6;
  if (!v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v3;
  uint64_t v27 = (void *)v19;
  v35[2] = v19;
  v34[3] = @"executionDate";
  v20 = v10;
  if (!v10)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v4;
  v35[3] = v20;
  v34[4] = @"action";
  uint64_t v21 = v33;
  if (!v33)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v6;
  v35[4] = v21;
  v34[5] = @"resolvedAction";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[5] = v22;
  v34[6] = @"actionOutput";
  v23 = v15;
  if (!v15)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[6] = v23;
  v34[7] = @"predictions";
  v24 = v16;
  if (!v16)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[7] = v24;
  int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:8];
  if (v16)
  {
    if (v15) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_22;
    }
  }

LABEL_22:
  if (!v13) {

  }
  if (!v33) {
  if (!v10)
  }

  if (v30)
  {
    if (v31) {
      goto LABEL_30;
    }
LABEL_37:

    if (v32) {
      goto LABEL_31;
    }
    goto LABEL_38;
  }

  if (!v31) {
    goto LABEL_37;
  }
LABEL_30:
  if (v32) {
    goto LABEL_31;
  }
LABEL_38:

LABEL_31:

  return v25;
}

- (id)_predictionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMAppIntentInvocation *)self predictions];
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

- (BMAppIntentInvocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v179[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"bundleID"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v12 = *MEMORY[0x1E4F502C8];
        uint64_t v178 = *MEMORY[0x1E4F28568];
        v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        v179[0] = v9;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:&v178 count:1];
        uint64_t v14 = v12;
        v8 = (void *)v13;
        id v15 = (id)[v11 initWithDomain:v14 code:2 userInfo:v13];
        id v7 = 0;
        uint64_t v16 = 0;
        *a4 = v15;
        goto LABEL_107;
      }
      id v7 = 0;
      uint64_t v16 = 0;
      goto LABEL_108;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"source"];
  v147 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v146 = objc_alloc(MEMORY[0x1E4F28C58]);
          v85 = v8;
          uint64_t v86 = *MEMORY[0x1E4F502C8];
          uint64_t v176 = *MEMORY[0x1E4F28568];
          uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"source"];
          v177 = v17;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
          uint64_t v87 = v86;
          v8 = v85;
          uint64_t v16 = 0;
          id *v147 = (id)[v146 initWithDomain:v87 code:2 userInfo:v18];
          v9 = 0;
          goto LABEL_105;
        }
        uint64_t v16 = 0;
        v9 = 0;
        goto LABEL_107;
      }
      id v10 = [NSNumber numberWithInt:BMAppIntentInvocationSourceFromString(v8)];
    }
    v9 = v10;
  }
  else
  {
    v9 = 0;
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:@"executionUUID"];
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v147)
      {
        id v140 = v7;
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v125 = v9;
        int v31 = v8;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v172 = *MEMORY[0x1E4F28568];
        uint64_t v33 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"executionUUID"];
        uint64_t v173 = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
        v35 = v30;
        id v7 = v140;
        uint64_t v36 = v32;
        v8 = v31;
        v9 = v125;
        id *v147 = (id)[v35 initWithDomain:v36 code:2 userInfo:v34];
        id v18 = (id)v33;

        uint64_t v16 = 0;
        goto LABEL_105;
      }
      uint64_t v16 = 0;
      goto LABEL_106;
    }
    id v139 = v7;
    id v18 = v17;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];
    if (!v21)
    {
      if (v147)
      {
        id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = v18;
        v91 = v9;
        v92 = v8;
        uint64_t v93 = *MEMORY[0x1E4F502C8];
        uint64_t v174 = *MEMORY[0x1E4F28568];
        v94 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"executionUUID"];
        v175 = v94;
        v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
        uint64_t v96 = v93;
        v8 = v92;
        v9 = v91;
        id v18 = v17;
        id *v147 = (id)[v90 initWithDomain:v96 code:2 userInfo:v95];

        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = 0;
        uint64_t v17 = v18;
      }
      id v7 = v139;
      goto LABEL_105;
    }
    v22 = (void *)v21;

    id v18 = v22;
    id v7 = v139;
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = [v5 objectForKeyedSubscript:@"executionDate"];
  v145 = (void *)v19;
  if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v24 = v7;
      id v25 = v20;
      id v26 = [v23 alloc];
      [v25 doubleValue];
      double v28 = v27;

      id v7 = v24;
      id v29 = (id)[v26 initWithTimeIntervalSince1970:v28];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v143 = [v37 dateFromString:v20];

        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v147)
        {
          id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
          v127 = v9;
          v110 = v8;
          uint64_t v111 = *MEMORY[0x1E4F502C8];
          uint64_t v170 = *MEMORY[0x1E4F28568];
          v51 = v145;
          id v48 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"executionDate"];
          id v171 = v48;
          uint64_t v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
          uint64_t v113 = v111;
          v8 = v110;
          v9 = v127;
          v138 = (void *)v112;
          id v114 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v113, 2);
          v143 = 0;
          uint64_t v16 = 0;
          id *v147 = v114;

          goto LABEL_103;
        }
        v143 = 0;
        uint64_t v16 = 0;
        v51 = v145;
        goto LABEL_104;
      }
      id v29 = v20;
    }
    v143 = v29;
  }
  else
  {
    v143 = 0;
  }
LABEL_32:
  v38 = [v5 objectForKeyedSubscript:@"action"];
  if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v120 = v8;
      v69 = v38;
      if (v147)
      {
        id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v132 = *MEMORY[0x1E4F502C8];
        uint64_t v168 = *MEMORY[0x1E4F28568];
        id v70 = v7;
        v71 = v17;
        id v72 = v18;
        v73 = v9;
        id v74 = [NSString alloc];
        uint64_t v115 = objc_opt_class();
        v75 = v74;
        v9 = v73;
        id v18 = v72;
        uint64_t v17 = v71;
        id v7 = v70;
        v137 = (void *)[v75 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v115, @"action"];
        v169 = v137;
        v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
        id *v147 = (id)[v134 initWithDomain:v132 code:2 userInfo:v76];

        uint64_t v16 = 0;
        id v48 = v69;
        v51 = v145;
        v8 = v120;
      }
      else
      {
        uint64_t v16 = 0;
        v51 = v145;
        id v48 = v69;
        v8 = v120;
      }
      goto LABEL_103;
    }
    id v142 = v7;
    id v48 = v38;
    id v156 = 0;
    v136 = [[BMAppIntentInvocationAction alloc] initWithJSONDictionary:v48 error:&v156];
    id v49 = v156;
    if (v49)
    {
      v50 = v49;
      if (v147) {
        id *v147 = v49;
      }

      uint64_t v16 = 0;
      id v7 = v142;
      v51 = v145;
      goto LABEL_102;
    }
    v130 = v38;
  }
  else
  {
    v130 = v38;
    v136 = 0;
  }
  uint64_t v39 = [v5 objectForKeyedSubscript:@"resolvedAction"];
  unint64_t v40 = 0x1E4F1C000uLL;
  v133 = (void *)v39;
  id v135 = v18;
  if (v39 && (v41 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v147)
      {
        id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v124 = *MEMORY[0x1E4F502C8];
        uint64_t v166 = *MEMORY[0x1E4F28568];
        id v77 = v7;
        v78 = v17;
        id v79 = v18;
        v80 = v9;
        id v81 = [NSString alloc];
        uint64_t v116 = objc_opt_class();
        v82 = v81;
        v9 = v80;
        id v18 = v79;
        uint64_t v17 = v78;
        id v7 = v77;
        v131 = (BMAppIntentInvocationAction *)[v82 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v116, @"resolvedAction"];
        v167 = v131;
        uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
        v84 = v129;
        v128 = (void *)v83;
        uint64_t v16 = 0;
        v51 = v145;
        id *v147 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v124, 2);
        id v48 = v130;
        goto LABEL_100;
      }
      uint64_t v16 = 0;
      v51 = v145;
      id v48 = v130;
      goto LABEL_101;
    }
    id v52 = v41;
    v53 = [BMAppIntentInvocationAction alloc];
    id v155 = 0;
    v131 = [(BMAppIntentInvocationAction *)v53 initWithJSONDictionary:v52 error:&v155];
    id v54 = v155;
    if (v54)
    {
      v55 = v54;
      v128 = v52;
      if (v147) {
        id *v147 = v54;
      }

      uint64_t v16 = 0;
LABEL_121:
      v51 = v145;
      id v48 = v130;
      id v18 = v135;
      goto LABEL_100;
    }

    unint64_t v40 = 0x1E4F1C000;
  }
  else
  {
    v131 = 0;
  }
  uint64_t v42 = [v5 objectForKeyedSubscript:@"actionOutput"];
  v122 = v6;
  id v141 = v7;
  v128 = (void *)v42;
  if (!v42 || (int v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v44 = v7;
    v123 = 0;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v147)
    {
      id v121 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v88 = *MEMORY[0x1E4F502C8];
      uint64_t v164 = *MEMORY[0x1E4F28568];
      v123 = (BMAppIntentInvocationActionOutput *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"actionOutput"];
      v165 = v123;
      id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
      id v89 = (id)[v121 initWithDomain:v88 code:2 userInfo:v45];
      uint64_t v16 = 0;
      id *v147 = v89;
      v51 = v145;
      id v48 = v130;
      id v18 = v135;
      goto LABEL_99;
    }
    uint64_t v16 = 0;
    goto LABEL_121;
  }
  id v45 = v43;
  v66 = [BMAppIntentInvocationActionOutput alloc];
  id v154 = 0;
  v123 = [(BMAppIntentInvocationActionOutput *)v66 initWithJSONDictionary:v45 error:&v154];
  id v67 = v154;
  if (v67)
  {
    v68 = v67;
    id v18 = v135;
    if (v147) {
      id *v147 = v67;
    }

    goto LABEL_111;
  }
  id v44 = v7;

LABEL_41:
  id v18 = v135;
  id v45 = [v5 objectForKeyedSubscript:@"predictions"];
  v46 = [*(id *)(v40 + 2712) null];
  int v47 = [v45 isEqual:v46];

  v126 = v9;
  if (!v47)
  {
    if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v118 = v17;
      v119 = v8;
      id v117 = v5;
      goto LABEL_56;
    }
    id v7 = v44;
    if (v147)
    {
      id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v107 = *MEMORY[0x1E4F502C8];
      uint64_t v162 = *MEMORY[0x1E4F28568];
      v56 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"predictions"];
      v163 = v56;
      v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
      uint64_t v109 = v107;
      id v7 = v141;
      id *v147 = (id)[v106 initWithDomain:v109 code:2 userInfo:v108];

      uint64_t v16 = 0;
LABEL_96:
      v51 = v145;
      goto LABEL_97;
    }
LABEL_111:
    uint64_t v16 = 0;
    v51 = v145;
    goto LABEL_98;
  }
  v118 = v17;
  v119 = v8;
  id v117 = v5;

  id v45 = 0;
LABEL_56:
  v51 = v145;
  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v45, "count"));
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v45 = v45;
  uint64_t v57 = [v45 countByEnumeratingWithState:&v150 objects:v161 count:16];
  if (!v57) {
    goto LABEL_66;
  }
  uint64_t v58 = v57;
  uint64_t v59 = *(void *)v151;
  while (2)
  {
    for (uint64_t i = 0; i != v58; ++i)
    {
      if (*(void *)v151 != v59) {
        objc_enumerationMutation(v45);
      }
      v61 = *(void **)(*((void *)&v150 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v117;
        v8 = v119;
        v97 = v147;
        id v18 = v135;
        if (v147)
        {
          id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v99 = *MEMORY[0x1E4F502C8];
          uint64_t v159 = *MEMORY[0x1E4F28568];
          id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"predictions"];
          id v160 = v62;
          v100 = (void *)MEMORY[0x1E4F1C9E8];
          v101 = &v160;
          v102 = &v159;
LABEL_90:
          v103 = [v100 dictionaryWithObjects:v101 forKeys:v102 count:1];
          uint64_t v104 = v99;
          id v18 = v135;
          id *v97 = (id)[v98 initWithDomain:v104 code:2 userInfo:v103];
LABEL_94:
        }
LABEL_95:

        uint64_t v16 = 0;
        id v7 = v141;
        uint64_t v17 = v118;
        goto LABEL_96;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = v117;
        v8 = v119;
        v97 = v147;
        id v18 = v135;
        if (v147)
        {
          id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v99 = *MEMORY[0x1E4F502C8];
          uint64_t v157 = *MEMORY[0x1E4F28568];
          id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"predictions"];
          id v158 = v62;
          v100 = (void *)MEMORY[0x1E4F1C9E8];
          v101 = &v158;
          v102 = &v157;
          goto LABEL_90;
        }
        goto LABEL_95;
      }
      id v62 = v61;
      v63 = [BMAppIntentInvocationActionPrediction alloc];
      id v149 = 0;
      v64 = [(BMAppIntentInvocationActionPrediction *)v63 initWithJSONDictionary:v62 error:&v149];
      id v65 = v149;
      if (v65)
      {
        v103 = v65;
        if (v147) {
          id *v147 = v65;
        }

        id v5 = v117;
        v8 = v119;
        id v18 = v135;
        goto LABEL_94;
      }
      [v56 addObject:v64];
    }
    uint64_t v58 = [v45 countByEnumeratingWithState:&v150 objects:v161 count:16];
    v51 = v145;
    if (v58) {
      continue;
    }
    break;
  }
LABEL_66:

  id v7 = v141;
  id v18 = v135;
  uint64_t v16 = -[BMAppIntentInvocation initWithBundleID:source:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:](self, "initWithBundleID:source:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:", v141, [v126 intValue], v135, v143, v136, v131, v123, v56);
  self = v16;
  id v5 = v117;
  uint64_t v17 = v118;
  v8 = v119;
LABEL_97:

  v9 = v126;
LABEL_98:
  id v48 = v130;
LABEL_99:

  uint64_t v6 = v122;
LABEL_100:

LABEL_101:
LABEL_102:

LABEL_103:
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
LABEL_108:

  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppIntentInvocation *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_raw_executionUUID) {
    PBDataWriterWriteDataField();
  }
  if (self->_hasRaw_executionDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_action)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationAction *)self->_action writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_resolvedAction)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationAction *)self->_resolvedAction writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_actionOutput)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationActionOutput *)self->_actionOutput writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_predictions;
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
  v44.super_class = (Class)BMAppIntentInvocation;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5)
  {
LABEL_60:
    uint64_t v42 = v5;
    goto LABEL_61;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_58:
    uint64_t v39 = [v6 copy];
    predictions = v5->_predictions;
    v5->_predictions = (NSArray *)v39;

    int v41 = v4[*v9];
    if (v41) {
      goto LABEL_59;
    }
    goto LABEL_60;
  }
  id v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_58;
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
      goto LABEL_58;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        bundleID = (NSData *)v5->_bundleID;
        v5->_bundleID = (NSString *)v21;
        goto LABEL_32;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v26 = *v7;
          uint64_t v27 = *(void *)&v4[v26];
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v18 = v24++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_52:
        if (v25 >= 9) {
          LODWORD(v25) = 0;
        }
        v5->_source = v25;
        goto LABEL_57;
      case 3u:
        PBReaderReadData();
        id v30 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v30 length] == 16)
        {
          bundleID = v5->_raw_executionUUID;
          v5->_raw_executionUUID = v30;
LABEL_32:

LABEL_57:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_58;
          }
          continue;
        }

LABEL_63:
LABEL_59:
        uint64_t v42 = 0;
LABEL_61:

        return v42;
      case 4u:
        v5->_hasRaw_executionDate = 1;
        uint64_t v31 = *v7;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)&v4[*v8])
        {
          double v33 = *(double *)(*(void *)&v4[*v10] + v32);
          *(void *)&v4[v31] = v32 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v33 = 0.0;
        }
        v5->_raw_executionDate = v33;
        goto LABEL_57;
      case 5u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_63;
        }
        v34 = [[BMAppIntentInvocationAction alloc] initByReadFrom:v4];
        if (!v34) {
          goto LABEL_63;
        }
        uint64_t v35 = 56;
        goto LABEL_45;
      case 6u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_63;
        }
        v34 = [[BMAppIntentInvocationAction alloc] initByReadFrom:v4];
        if (!v34) {
          goto LABEL_63;
        }
        uint64_t v35 = 64;
        goto LABEL_45;
      case 7u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_63;
        }
        v34 = [[BMAppIntentInvocationActionOutput alloc] initByReadFrom:v4];
        if (!v34) {
          goto LABEL_63;
        }
        uint64_t v35 = 72;
LABEL_45:
        uint64_t v36 = *(Class *)((char *)&v5->super.super.isa + v35);
        *(Class *)((char *)&v5->super.super.isa + v35) = v34;

        PBReaderRecallMark();
        goto LABEL_57;
      case 8u:
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_63;
        }
        id v37 = [[BMAppIntentInvocationActionPrediction alloc] initByReadFrom:v4];
        if (!v37) {
          goto LABEL_63;
        }
        v38 = v37;
        [v6 addObject:v37];
        PBReaderRecallMark();

        goto LABEL_57;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_63;
        }
        goto LABEL_57;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppIntentInvocation *)self bundleID];
  id v5 = BMAppIntentInvocationSourceAsString([(BMAppIntentInvocation *)self source]);
  uint64_t v6 = [(BMAppIntentInvocation *)self executionUUID];
  uint64_t v7 = [(BMAppIntentInvocation *)self executionDate];
  uint64_t v8 = [(BMAppIntentInvocation *)self action];
  uint64_t v9 = [(BMAppIntentInvocation *)self resolvedAction];
  id v10 = [(BMAppIntentInvocation *)self actionOutput];
  char v11 = [(BMAppIntentInvocation *)self predictions];
  unsigned int v12 = (void *)[v3 initWithFormat:@"BMAppIntentInvocation with bundleID: %@, source: %@, executionUUID: %@, executionDate: %@, action: %@, resolvedAction: %@, actionOutput: %@, predictions: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMAppIntentInvocation)initWithBundleID:(id)a3 source:(int)a4 executionUUID:(id)a5 executionDate:(id)a6 action:(id)a7 resolvedAction:(id)a8 actionOutput:(id)a9 predictions:(id)a10
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v17 = a5;
  id v18 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)BMAppIntentInvocation;
  v20 = [(BMEventBase *)&v29 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_bundleID, a3);
    v20->_source = a4;
    if (v17)
    {
      v30[0] = 0;
      v30[1] = 0;
      [v17 getUUIDBytes:v30];
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v30 length:16];
      raw_executionUUID = v20->_raw_executionUUID;
      v20->_raw_executionUUID = (NSData *)v21;
    }
    else
    {
      raw_executionUUID = v20->_raw_executionUUID;
      v20->_raw_executionUUID = 0;
    }

    if (v18)
    {
      v20->_hasRaw_executionDate = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_executionDate = 0;
      double v23 = -1.0;
    }
    v20->_raw_executionDate = v23;
    objc_storeStrong((id *)&v20->_action, a7);
    objc_storeStrong((id *)&v20->_resolvedAction, a8);
    objc_storeStrong((id *)&v20->_actionOutput, a9);
    objc_storeStrong((id *)&v20->_predictions, a10);
  }

  return v20;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"source" number:2 type:4 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionUUID" number:3 type:14 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionDate" number:4 type:0 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"action" number:5 type:14 subMessageClass:objc_opt_class()];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resolvedAction" number:6 type:14 subMessageClass:objc_opt_class()];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionOutput" number:7 type:14 subMessageClass:objc_opt_class()];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictions" number:8 type:14 subMessageClass:objc_opt_class()];
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF50E8;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"source" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionUUID" dataType:6 requestOnly:0 fieldNumber:3 protoDataType:14 convertedType:3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionDate" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"action_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1106];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"resolvedAction_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1108];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"actionOutput_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1110];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"predictions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1112];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __32__BMAppIntentInvocation_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _predictionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __32__BMAppIntentInvocation_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 actionOutput];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __32__BMAppIntentInvocation_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 resolvedAction];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __32__BMAppIntentInvocation_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 action];
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

    uint64_t v8 = [[BMAppIntentInvocation alloc] initByReadFrom:v7];
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