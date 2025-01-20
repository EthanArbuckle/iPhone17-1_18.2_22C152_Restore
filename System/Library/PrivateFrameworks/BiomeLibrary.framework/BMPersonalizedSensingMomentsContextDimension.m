@interface BMPersonalizedSensingMomentsContextDimension
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPersonalizedSensingMomentsContextDimension)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMPersonalizedSensingMomentsContextDimension)initWithName:(id)a3 queries:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)queries;
- (NSString)description;
- (NSString)name;
- (id)_queriesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextDimension

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)queries
{
  return self->_queries;
}

- (NSString)name
{
  return self->_name;
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
    v6 = [(BMPersonalizedSensingMomentsContextDimension *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPersonalizedSensingMomentsContextDimension *)self name];
      v10 = [v5 name];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMPersonalizedSensingMomentsContextDimension *)self queries];
    v14 = [v5 queries];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMPersonalizedSensingMomentsContextDimension *)self queries];
      v16 = [v5 queries];
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
  v3 = [(BMPersonalizedSensingMomentsContextDimension *)self name];
  id v4 = [(BMPersonalizedSensingMomentsContextDimension *)self _queriesJSONArray];
  v9[0] = @"name";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"queries";
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

- (id)_queriesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMPersonalizedSensingMomentsContextDimension *)self queries];
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

- (BMPersonalizedSensingMomentsContextDimension)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  id v40 = v6;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
        v53[0] = v9;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v14];
        id v8 = 0;
        v20 = 0;
        *a4 = v31;
        goto LABEL_27;
      }
      id v8 = 0;
      v20 = 0;
      goto LABEL_29;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"queries"];
  long long v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    long long v12 = v7;
    id v13 = v8;
    v39 = a4;

    id v9 = 0;
LABEL_9:
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v9 = v9;
    uint64_t v15 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    v38 = self;
LABEL_11:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(v9);
      }
      uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * v18);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = v39;
        id v8 = v13;
        uint64_t v7 = v12;
        if (v39)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = *MEMORY[0x1E4F502C8];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"queries"];
          v46 = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          v26 = v27;
LABEL_25:
          id *v21 = (id)[v26 initWithDomain:v23 code:2 userInfo:v25];
        }
        goto LABEL_26;
      }
      [v14 addObject:v19];
      if (v16 == ++v18)
      {
        uint64_t v16 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
        self = v38;
        if (v16) {
          goto LABEL_11;
        }
LABEL_18:

        id v8 = v13;
        self = [(BMPersonalizedSensingMomentsContextDimension *)self initWithName:v13 queries:v14];
        v20 = self;
        uint64_t v7 = v12;
LABEL_27:

        goto LABEL_28;
      }
    }
    v21 = v39;
    id v8 = v13;
    uint64_t v7 = v12;
    if (v39)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v23 = *MEMORY[0x1E4F502C8];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"queries"];
      v48 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v26 = v22;
      goto LABEL_25;
    }
LABEL_26:

    v20 = 0;
    self = v38;
    goto LABEL_27;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v12 = v7;
    id v13 = v8;
    v39 = a4;
    goto LABEL_9;
  }
  if (a4)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    v33 = a4;
    v34 = self;
    uint64_t v35 = *MEMORY[0x1E4F502C8];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"queries"];
    v51 = v14;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v37 = v35;
    self = v34;
    id *v33 = (id)[v32 initWithDomain:v37 code:2 userInfo:v36];

    v20 = 0;
    goto LABEL_27;
  }
  v20 = 0;
LABEL_28:

  id v6 = v40;
LABEL_29:

  return v20;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPersonalizedSensingMomentsContextDimension *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_queries;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMPersonalizedSensingMomentsContextDimension;
  uint64_t v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v9]) {
        goto LABEL_27;
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
        goto LABEL_27;
      }
      if ((v13 >> 3) == 2) {
        break;
      }
      if ((v13 >> 3) == 1)
      {
        uint64_t v21 = PBReaderReadString();
        name = v5->_name;
        v5->_name = (NSString *)v21;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_31:

        goto LABEL_28;
      }
LABEL_26:
      if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
        goto LABEL_27;
      }
    }
    uint64_t v23 = PBReaderReadString();
    if (!v23) {
      goto LABEL_31;
    }
    name = (void *)v23;
    [v6 addObject:v23];
    goto LABEL_24;
  }
LABEL_27:
  uint64_t v24 = [v6 copy];
  queries = v5->_queries;
  v5->_queries = (NSArray *)v24;

  int v26 = v4[*v9];
  if (v26) {
LABEL_28:
  }
    id v27 = 0;
  else {
LABEL_29:
  }
    id v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPersonalizedSensingMomentsContextDimension *)self name];
  uint64_t v5 = [(BMPersonalizedSensingMomentsContextDimension *)self queries];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMPersonalizedSensingMomentsContextDimension with name: %@, queries: %@", v4, v5];

  return (NSString *)v6;
}

- (BMPersonalizedSensingMomentsContextDimension)initWithName:(id)a3 queries:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMPersonalizedSensingMomentsContextDimension;
  uint64_t v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_queries, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queries" number:2 type:13 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6DB0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"queries_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_565];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __55__BMPersonalizedSensingMomentsContextDimension_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _queriesJSONArray];
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

    id v8 = [[BMPersonalizedSensingMomentsContextDimension alloc] initByReadFrom:v7];
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