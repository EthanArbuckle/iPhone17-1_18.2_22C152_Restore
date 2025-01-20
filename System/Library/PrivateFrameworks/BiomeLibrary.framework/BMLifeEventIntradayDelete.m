@interface BMLifeEventIntradayDelete
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLifeEventIntradayDelete)initWithIdentifiers:(id)a3;
- (BMLifeEventIntradayDelete)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSArray)identifiers;
- (NSString)description;
- (id)_identifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMLifeEventIntradayDelete

- (void).cxx_destruct
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
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
    v6 = [(BMLifeEventIntradayDelete *)self identifiers];
    v7 = [v5 identifiers];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMLifeEventIntradayDelete *)self identifiers];
      v9 = [v5 identifiers];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMLifeEventIntradayDelete *)self _identifiersJSONArray];
  v6 = @"identifiers";
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (id)_identifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMLifeEventIntradayDelete *)self identifiers];
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

- (BMLifeEventIntradayDelete)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = [a3 objectForKeyedSubscript:@"identifiers"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {

    id v6 = 0;
LABEL_5:
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v6;
    uint64_t v10 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(v6);
      }
      uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (p_isa)
        {
          id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          id v23 = [NSString alloc];
          v17 = (void *)[v23 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifiers", (void)v28];
          v33 = v17;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          v19 = v21;
          uint64_t v20 = v22;
LABEL_19:
          *p_isa = (id)[v19 initWithDomain:v20 code:2 userInfo:v18];
        }
        goto LABEL_20;
      }
      [v9 addObject:v14];
      if (v11 == ++v13)
      {
        uint64_t v11 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11) {
          goto LABEL_7;
        }
LABEL_14:

        self = [(BMLifeEventIntradayDelete *)self initWithIdentifiers:v9];
        p_isa = (id *)&self->super.super.isa;
LABEL_22:

        goto LABEL_23;
      }
    }
    if (p_isa)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v16 = *MEMORY[0x1E4F502C8];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"identifiers"];
      v35 = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v19 = v15;
      uint64_t v20 = v16;
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v6) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  if (p_isa)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v26 = *MEMORY[0x1E4F502C8];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v9 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"identifiers"];
    v38[0] = v9;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    *p_isa = (id)[v25 initWithDomain:v26 code:2 userInfo:v27];

LABEL_21:
    p_isa = 0;
    goto LABEL_22;
  }
LABEL_23:

  return (BMLifeEventIntradayDelete *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLifeEventIntradayDelete *)self writeTo:v3];
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
  uint64_t v5 = self->_identifiers;
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
  v27.receiver = self;
  v27.super_class = (Class)BMLifeEventIntradayDelete;
  uint64_t v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_26;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v13 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        if (!v20) {
          goto LABEL_28;
        }
        id v21 = (void *)v20;
        [v6 addObject:v20];
      }
      else if (!PBReaderSkipValueWithTag())
      {
LABEL_28:

        goto LABEL_25;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v22 = [v6 copy];
  identifiers = v5->_identifiers;
  v5->_identifiers = (NSArray *)v22;

  int v24 = v4[*v9];
  if (v24) {
LABEL_25:
  }
    id v25 = 0;
  else {
LABEL_26:
  }
    id v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLifeEventIntradayDelete *)self identifiers];
  uint64_t v5 = (void *)[v3 initWithFormat:@"BMLifeEventIntradayDelete with identifiers: %@", v4];

  return (NSString *)v5;
}

- (BMLifeEventIntradayDelete)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMLifeEventIntradayDelete;
  uint64_t v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_identifiers, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifiers" number:1 type:13 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6AE0;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"identifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_72802];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

id __36__BMLifeEventIntradayDelete_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _identifiersJSONArray];
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

    objc_super v8 = [[BMLifeEventIntradayDelete alloc] initByReadFrom:v7];
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