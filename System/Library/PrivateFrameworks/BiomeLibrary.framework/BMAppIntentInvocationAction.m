@interface BMAppIntentInvocationAction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocationAction)initWithIdentifier:(id)a3 parameters:(id)a4;
- (BMAppIntentInvocationAction)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSArray)parameters;
- (NSString)description;
- (NSString)identifier;
- (id)_parametersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMAppIntentInvocationAction *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppIntentInvocationAction *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMAppIntentInvocationAction *)self parameters];
    v14 = [v5 parameters];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMAppIntentInvocationAction *)self parameters];
      v16 = [v5 parameters];
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
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAppIntentInvocationAction *)self identifier];
  id v4 = [(BMAppIntentInvocationAction *)self _parametersJSONArray];
  v9[0] = @"identifier";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"parameters";
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

- (id)_parametersJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMAppIntentInvocationAction *)self parameters];
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

- (BMAppIntentInvocationAction)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v23 = p_isa;
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        v57[0] = v9;
        long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
        id v25 = (id)[v22 initWithDomain:v24 code:2 userInfo:v12];
        p_isa = 0;
        id v8 = 0;
        id *v23 = v25;
        goto LABEL_34;
      }
      id v8 = 0;
      goto LABEL_36;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"parameters"];
  v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  v43 = v7;
  if (v11)
  {
    v39 = p_isa;
    id v40 = v6;
    v41 = self;
    id v42 = v8;

    id v9 = 0;
LABEL_9:
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v9 = v9;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v46 != v15) {
        objc_enumerationMutation(v9);
      }
      v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = v40;
        self = v41;
        uint64_t v7 = v43;
        v26 = v39;
        if (!v39) {
          goto LABEL_33;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v49 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"parameters"];
        id v50 = v18;
        v29 = (void *)MEMORY[0x1E4F1C9E8];
        v30 = &v50;
        v31 = &v49;
        goto LABEL_28;
      }
      id v18 = v17;
      v19 = [BMAppIntentInvocationProperty alloc];
      id v44 = 0;
      v20 = [(BMAppIntentInvocationProperty *)v19 initWithJSONDictionary:v18 error:&v44];
      id v21 = v44;
      if (v21)
      {
        v32 = v21;
        if (v39) {
          id *v39 = v21;
        }

        id v6 = v40;
        self = v41;
        uint64_t v7 = v43;
LABEL_32:

LABEL_33:
        p_isa = 0;
        id v8 = v42;
        goto LABEL_34;
      }
      [v12 addObject:v20];

      if (v14 == ++v16)
      {
        uint64_t v14 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v14) {
          goto LABEL_11;
        }
LABEL_19:

        id v8 = v42;
        self = [(BMAppIntentInvocationAction *)v41 initWithIdentifier:v42 parameters:v12];
        p_isa = (id *)&self->super.super.isa;
        id v6 = v40;
        uint64_t v7 = v43;
LABEL_34:

        goto LABEL_35;
      }
    }
    id v6 = v40;
    self = v41;
    uint64_t v7 = v43;
    v26 = v39;
    if (!v39) {
      goto LABEL_33;
    }
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v28 = *MEMORY[0x1E4F502C8];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"parameters"];
    id v52 = v18;
    v29 = (void *)MEMORY[0x1E4F1C9E8];
    v30 = &v52;
    v31 = &v51;
LABEL_28:
    v32 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
    uint64_t v33 = v28;
    uint64_t v7 = v43;
    id *v26 = (id)[v27 initWithDomain:v33 code:2 userInfo:v32];
    goto LABEL_32;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = p_isa;
    id v40 = v6;
    v41 = self;
    id v42 = v8;
    goto LABEL_9;
  }
  if (p_isa)
  {
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    v36 = p_isa;
    uint64_t v37 = *MEMORY[0x1E4F502C8];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    long long v12 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"parameters"];
    v55 = v12;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    id *v36 = (id)[v35 initWithDomain:v37 code:2 userInfo:v38];

    p_isa = 0;
    goto LABEL_34;
  }
LABEL_35:

LABEL_36:
  return (BMAppIntentInvocationAction *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppIntentInvocationAction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_parameters;
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
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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
  v30.receiver = self;
  v30.super_class = (Class)BMAppIntentInvocationAction;
  uint64_t v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v13 >> 3) == 7)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v23 = [[BMAppIntentInvocationProperty alloc] initByReadFrom:v4]) == 0)
        {
LABEL_31:

          goto LABEL_28;
        }
        uint64_t v24 = v23;
        [v6 addObject:v23];
        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        uint64_t v21 = PBReaderReadString();
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v25 = [v6 copy];
  parameters = v5->_parameters;
  v5->_parameters = (NSArray *)v25;

  int v27 = v4[*v9];
  if (v27) {
LABEL_28:
  }
    uint64_t v28 = 0;
  else {
LABEL_29:
  }
    uint64_t v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppIntentInvocationAction *)self identifier];
  uint64_t v5 = [(BMAppIntentInvocationAction *)self parameters];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMAppIntentInvocationAction with identifier: %@, parameters: %@", v4, v5];

  return (NSString *)v6;
}

- (BMAppIntentInvocationAction)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMAppIntentInvocationAction;
  id v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_parameters, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parameters" number:7 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5070;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"parameters_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_784];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __38__BMAppIntentInvocationAction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _parametersJSONArray];
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

    id v8 = [[BMAppIntentInvocationAction alloc] initByReadFrom:v7];
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