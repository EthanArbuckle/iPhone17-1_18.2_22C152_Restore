@interface BMDisplayAlwaysOn
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDisplayAlwaysOn)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDisplayAlwaysOn)initWithUserSetState:(int)a3 resolvedState:(int)a4 blockingPolicies:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)blockingPolicies;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)resolvedState;
- (int)userSetState;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMDisplayAlwaysOn

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSetState" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resolvedState" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"blockingPolicies_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_155_30813];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)blockingPolicies
{
  return self->_blockingPolicies;
}

- (int)resolvedState
{
  return self->_resolvedState;
}

- (int)userSetState
{
  return self->_userSetState;
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
    int v6 = [(BMDisplayAlwaysOn *)self userSetState];
    if (v6 == [v5 userSetState]
      && (int v7 = [(BMDisplayAlwaysOn *)self resolvedState],
          v7 == [v5 resolvedState]))
    {
      v8 = [(BMDisplayAlwaysOn *)self blockingPolicies];
      v9 = [v5 blockingPolicies];
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        v10 = [(BMDisplayAlwaysOn *)self blockingPolicies];
        v11 = [v5 blockingPolicies];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDisplayAlwaysOn userSetState](self, "userSetState"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDisplayAlwaysOn resolvedState](self, "resolvedState"));
  id v5 = [(BMDisplayAlwaysOn *)self _blockingPoliciesJSONArray];
  v11[0] = @"userSetState";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"resolvedState";
  int v7 = v4;
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"blockingPolicies";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (BMDisplayAlwaysOn)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"userSetState"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v72 = *MEMORY[0x1E4F28568];
          v39 = v7;
          id v40 = [NSString alloc];
          uint64_t v48 = objc_opt_class();
          v41 = v40;
          int v7 = v39;
          id v57 = (id)[v41 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v48, @"userSetState"];
          v73[0] = v57;
          v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
          v8 = 0;
          v25 = 0;
          *a4 = (id)[v37 initWithDomain:v38 code:2 userInfo:v11];
          goto LABEL_44;
        }
        v8 = 0;
        v25 = 0;
        goto LABEL_45;
      }
      id v9 = [NSNumber numberWithInt:BMDisplayAlwaysOnStateFromString(v7)];
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"resolvedState"];
  v56 = (void *)v10;
  if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v57 = v11;
    }
    else
    {
      v31 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v43 = *MEMORY[0x1E4F502C8];
          uint64_t v70 = *MEMORY[0x1E4F28568];
          v44 = self;
          id v45 = [NSString alloc];
          uint64_t v49 = objc_opt_class();
          v46 = v45;
          self = v44;
          id v12 = (id)[v46 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v49, @"resolvedState"];
          id v71 = v12;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          v15 = v47 = a4;
          id v57 = 0;
          v25 = 0;
          id *v47 = (id)[v42 initWithDomain:v43 code:2 userInfo:v15];
          v8 = v31;
          goto LABEL_42;
        }
        id v57 = 0;
        v25 = 0;
        goto LABEL_44;
      }
      id v57 = [NSNumber numberWithInt:BMDisplayAlwaysOnStateFromString(v11)];
    }
  }
  else
  {
    id v57 = 0;
  }
  id v12 = [v6 objectForKeyedSubscript:@"blockingPolicies"];
  v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v52 = a4;
    v53 = v8;
    v54 = v7;
    id v55 = v6;

    id v12 = 0;
  }
  else
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v68 = *MEMORY[0x1E4F28568];
          v35 = a4;
          v15 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"blockingPolicies"];
          v69 = v15;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          id *v35 = (id)[v33 initWithDomain:v34 code:2 userInfo:v36];

          v25 = 0;
          goto LABEL_42;
        }
        v25 = 0;
        goto LABEL_43;
      }
    }
    v52 = a4;
    v53 = v8;
    v54 = v7;
    id v55 = v6;
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v12 = v12;
  uint64_t v16 = [v12 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (!v16) {
    goto LABEL_27;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v60;
  v51 = self;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v60 != v18) {
        objc_enumerationMutation(v12);
      }
      v20 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = v51;
        v26 = v52;
        v8 = v53;
        int v7 = v54;
        if (v52)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v65 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"blockingPolicies"];
          id v66 = v21;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          v30 = v27;
LABEL_34:
          id *v26 = (id)[v30 initWithDomain:v28 code:2 userInfo:v29];
LABEL_40:
        }
LABEL_41:

        v25 = 0;
        id v6 = v55;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v51;
        v26 = v52;
        v8 = v53;
        int v7 = v54;
        if (v52)
        {
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v63 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"blockingPolicies"];
          id v64 = v21;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          v30 = v50;
          goto LABEL_34;
        }
        goto LABEL_41;
      }
      id v21 = v20;
      v22 = [BMDisplayAlwaysOnBlockingPolicy alloc];
      id v58 = 0;
      v23 = [(BMDisplayAlwaysOnBlockingPolicy *)v22 initWithJSONDictionary:v21 error:&v58];
      id v24 = v58;
      if (v24)
      {
        v29 = v24;
        if (v52) {
          id *v52 = v24;
        }

        self = v51;
        v8 = v53;
        int v7 = v54;
        goto LABEL_40;
      }
      [v15 addObject:v23];
    }
    uint64_t v17 = [v12 countByEnumeratingWithState:&v59 objects:v67 count:16];
    self = v51;
    if (v17) {
      continue;
    }
    break;
  }
LABEL_27:

  v8 = v53;
  self = -[BMDisplayAlwaysOn initWithUserSetState:resolvedState:blockingPolicies:](self, "initWithUserSetState:resolvedState:blockingPolicies:", [v53 intValue], objc_msgSend(v57, "intValue"), v15);
  v25 = self;
  int v7 = v54;
  id v6 = v55;
LABEL_42:

LABEL_43:
  v11 = v56;
LABEL_44:

LABEL_45:
  return v25;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDisplayAlwaysOn *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_blockingPolicies;
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
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMDisplayAlwaysOn;
  id v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_57;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    while (1)
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
        BOOL v17 = v12++ >= 9;
        if (v17)
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
        goto LABEL_55;
      }
      unint64_t v20 = v13 >> 3;
      if ((v13 >> 3) == 1) {
        break;
      }
      if (v20 == 3)
      {
        uint64_t v41 = 0;
        uint64_t v42 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v32 = [[BMDisplayAlwaysOnBlockingPolicy alloc] initByReadFrom:v4]) == 0)
        {
LABEL_59:

          goto LABEL_56;
        }
        id v33 = v32;
        [v6 addObject:v32];
        PBReaderRecallMark();
      }
      else
      {
        if (v20 == 2)
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (1)
          {
            uint64_t v24 = *v7;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v8]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v10] + v25);
            *(void *)&v4[v24] = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_42;
            }
            v21 += 7;
            BOOL v17 = v22++ >= 9;
            if (v17)
            {
              LODWORD(v23) = 0;
              goto LABEL_44;
            }
          }
          v4[*v9] = 1;
LABEL_42:
          if (v4[*v9]) {
            LODWORD(v23) = 0;
          }
LABEL_44:
          if (v23 >= 3) {
            LODWORD(v23) = 0;
          }
          uint64_t v34 = 24;
LABEL_53:
          *(_DWORD *)((char *)&v5->super.super.isa + v34) = v23;
          goto LABEL_54;
        }
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_59;
        }
      }
LABEL_54:
      if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
        goto LABEL_55;
      }
    }
    char v27 = 0;
    unsigned int v28 = 0;
    uint64_t v23 = 0;
    while (1)
    {
      uint64_t v29 = *v7;
      unint64_t v30 = *(void *)&v4[v29];
      if (v30 == -1 || v30 >= *(void *)&v4[*v8]) {
        break;
      }
      char v31 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
      *(void *)&v4[v29] = v30 + 1;
      v23 |= (unint64_t)(v31 & 0x7F) << v27;
      if ((v31 & 0x80) == 0) {
        goto LABEL_48;
      }
      v27 += 7;
      BOOL v17 = v28++ >= 9;
      if (v17)
      {
        LODWORD(v23) = 0;
        goto LABEL_50;
      }
    }
    v4[*v9] = 1;
LABEL_48:
    if (v4[*v9]) {
      LODWORD(v23) = 0;
    }
LABEL_50:
    if (v23 >= 3) {
      LODWORD(v23) = 0;
    }
    uint64_t v34 = 20;
    goto LABEL_53;
  }
LABEL_55:
  uint64_t v35 = [v6 copy];
  blockingPolicies = v5->_blockingPolicies;
  v5->_blockingPolicies = (NSArray *)v35;

  int v37 = v4[*v9];
  if (v37) {
LABEL_56:
  }
    uint64_t v38 = 0;
  else {
LABEL_57:
  }
    uint64_t v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMDisplayAlwaysOnStateAsString([(BMDisplayAlwaysOn *)self userSetState]);
  id v5 = BMDisplayAlwaysOnStateAsString([(BMDisplayAlwaysOn *)self resolvedState]);
  uint64_t v6 = [(BMDisplayAlwaysOn *)self blockingPolicies];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMDisplayAlwaysOn with userSetState: %@, resolvedState: %@, blockingPolicies: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMDisplayAlwaysOn)initWithUserSetState:(int)a3 resolvedState:(int)a4 blockingPolicies:(id)a5
{
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMDisplayAlwaysOn;
  uint64_t v10 = [(BMEventBase *)&v12 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v10->_userSetState = a3;
    v10->_resolvedState = a4;
    objc_storeStrong((id *)&v10->_blockingPolicies, a5);
  }

  return v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSetState" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"resolvedState", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"blockingPolicies" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4908;
}

id __28__BMDisplayAlwaysOn_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _blockingPoliciesJSONArray];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMDisplayAlwaysOn alloc] initByReadFrom:v7];
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