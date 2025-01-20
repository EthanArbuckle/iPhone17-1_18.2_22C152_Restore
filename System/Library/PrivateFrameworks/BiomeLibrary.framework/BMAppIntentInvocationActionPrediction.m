@interface BMAppIntentInvocationActionPrediction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocationActionPrediction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppIntentInvocationActionPrediction)initWithParameterIdentifiers:(id)a3 displayRepresentation:(id)a4;
- (BMAppIntentInvocationDisplayRepresentation)displayRepresentation;
- (BOOL)isEqual:(id)a3;
- (NSArray)parameterIdentifiers;
- (NSString)description;
- (id)_parameterIdentifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocationActionPrediction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);

  objc_storeStrong((id *)&self->_parameterIdentifiers, 0);
}

- (BMAppIntentInvocationDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSArray)parameterIdentifiers
{
  return self->_parameterIdentifiers;
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
    v6 = [(BMAppIntentInvocationActionPrediction *)self parameterIdentifiers];
    uint64_t v7 = [v5 parameterIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppIntentInvocationActionPrediction *)self parameterIdentifiers];
      v10 = [v5 parameterIdentifiers];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMAppIntentInvocationActionPrediction *)self displayRepresentation];
    v14 = [v5 displayRepresentation];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMAppIntentInvocationActionPrediction *)self displayRepresentation];
      v16 = [v5 displayRepresentation];
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
  v3 = [(BMAppIntentInvocationActionPrediction *)self _parameterIdentifiersJSONArray];
  id v4 = [(BMAppIntentInvocationActionPrediction *)self displayRepresentation];
  id v5 = [v4 jsonDictionary];

  v10[0] = @"parameterIdentifiers";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"displayRepresentation";
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

- (id)_parameterIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMAppIntentInvocationActionPrediction *)self parameterIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMAppIntentInvocationActionPrediction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"parameterIdentifiers"];
  v8 = [MEMORY[0x1E4F1CA98] null];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v39 = a4;

    id v7 = 0;
LABEL_6:
    long long v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = v7;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (!v11) {
      goto LABEL_15;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    id v38 = v6;
LABEL_8:
    v14 = self;
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(v7);
      }
      uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v39)
        {
          id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v47 = *MEMORY[0x1E4F28568];
          v18 = (BMAppIntentInvocationDisplayRepresentation *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"parameterIdentifiers"];
          v48 = v18;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          v24 = v26;
          uint64_t v25 = v27;
          v20 = v39;
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      [v10 addObject:v16];
      if (v12 == ++v15)
      {
        uint64_t v12 = [v7 countByEnumeratingWithState:&v41 objects:v51 count:16];
        self = v14;
        id v6 = v38;
        if (v12) {
          goto LABEL_8;
        }
LABEL_15:

        v17 = [v6 objectForKeyedSubscript:@"displayRepresentation"];
        if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v18 = 0;
          goto LABEL_18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v32 = v17;
          id v40 = 0;
          v18 = [[BMAppIntentInvocationDisplayRepresentation alloc] initWithJSONDictionary:v32 error:&v40];
          id v33 = v40;
          if (v33)
          {
            v34 = v33;
            if (v39) {
              id *v39 = v33;
            }

            v19 = 0;
            v17 = v32;
          }
          else
          {

LABEL_18:
            self = [(BMAppIntentInvocationActionPrediction *)self initWithParameterIdentifiers:v10 displayRepresentation:v18];
            v19 = self;
          }
LABEL_24:
        }
        else
        {
          if (v39)
          {
            id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v36 = *MEMORY[0x1E4F502C8];
            uint64_t v45 = *MEMORY[0x1E4F28568];
            v18 = (BMAppIntentInvocationDisplayRepresentation *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"displayRepresentation"];
            v46 = v18;
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            id *v39 = (id)[v35 initWithDomain:v36 code:2 userInfo:v37];

            v19 = 0;
            goto LABEL_24;
          }
          v19 = 0;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v20 = v39;
    if (v39)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v22 = *MEMORY[0x1E4F502C8];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v18 = (BMAppIntentInvocationDisplayRepresentation *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"parameterIdentifiers"];
      v50 = v18;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v24 = v21;
      uint64_t v25 = v22;
LABEL_23:
      self = v14;
      id *v20 = (id)[v24 initWithDomain:v25 code:2 userInfo:v23];

      v19 = 0;
      v17 = v7;
      id v6 = v38;
      goto LABEL_24;
    }
LABEL_25:
    v19 = 0;
    v17 = v7;
    self = v14;
    id v6 = v38;
    goto LABEL_28;
  }
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = a4;
    goto LABEL_6;
  }
  if (a4)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F502C8];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    long long v10 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"parameterIdentifiers"];
    v53[0] = v10;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    id v30 = (id)[v28 initWithDomain:v29 code:2 userInfo:v17];
    v19 = 0;
    *a4 = v30;
    goto LABEL_28;
  }
  v19 = 0;
LABEL_29:

  return v19;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppIntentInvocationActionPrediction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_parameterIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_displayRepresentation)
  {
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationDisplayRepresentation *)self->_displayRepresentation writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMAppIntentInvocationActionPrediction;
  uint64_t v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  int v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
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
          || (v23 = [[BMAppIntentInvocationDisplayRepresentation alloc] initByReadFrom:v4]) == 0)
        {
LABEL_30:

          goto LABEL_31;
        }
        displayRepresentation = v5->_displayRepresentation;
        v5->_displayRepresentation = v23;

        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        uint64_t v21 = PBReaderReadString();
        if (!v21) {
          goto LABEL_30;
        }
        uint64_t v22 = (void *)v21;
        [v6 addObject:v21];
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_30;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v25 = [v6 copy];
  parameterIdentifiers = v5->_parameterIdentifiers;
  v5->_parameterIdentifiers = (NSArray *)v25;

  int v27 = v4[*v9];
  if (v27) {
LABEL_31:
  }
    id v28 = 0;
  else {
LABEL_29:
  }
    id v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppIntentInvocationActionPrediction *)self parameterIdentifiers];
  uint64_t v5 = [(BMAppIntentInvocationActionPrediction *)self displayRepresentation];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMAppIntentInvocationActionPrediction with parameterIdentifiers: %@, displayRepresentation: %@", v4, v5];

  return (NSString *)v6;
}

- (BMAppIntentInvocationActionPrediction)initWithParameterIdentifiers:(id)a3 displayRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMAppIntentInvocationActionPrediction;
  int v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_parameterIdentifiers, a3);
    objc_storeStrong((id *)&v9->_displayRepresentation, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parameterIdentifiers" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"displayRepresentation" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF50D0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"parameterIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1042];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"displayRepresentation_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1044];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __48__BMAppIntentInvocationActionPrediction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 displayRepresentation];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMAppIntentInvocationActionPrediction_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _parameterIdentifiersJSONArray];
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

    id v8 = [[BMAppIntentInvocationActionPrediction alloc] initByReadFrom:v7];
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