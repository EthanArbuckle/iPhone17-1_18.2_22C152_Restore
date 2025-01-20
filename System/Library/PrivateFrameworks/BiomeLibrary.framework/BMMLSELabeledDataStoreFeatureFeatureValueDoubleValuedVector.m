@interface BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)initWithVectorWithDoubles:(id)a3;
- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)vectorWithDoubles;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_vectorWithDoublesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector

- (void).cxx_destruct
{
}

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)vectorWithDoubles
{
  return (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self->_vectorWithDoubles;
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
    v6 = [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self vectorWithDoubles];
    v7 = [v5 vectorWithDoubles];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self vectorWithDoubles];
      v9 = [v5 vectorWithDoubles];
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
  v2 = [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self _vectorWithDoublesJSONArray];
  v6 = @"vectorWithDoubles";
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

- (id)_vectorWithDoublesJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self vectorWithDoubles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = [a3 objectForKeyedSubscript:@"vectorWithDoubles"];
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
          v17 = (void *)[v23 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"vectorWithDoubles", (void)v28];
          v33 = v17;
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
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

        self = [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self initWithVectorWithDoubles:v9];
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
      v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"vectorWithDoubles"];
      v35 = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
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
    v9 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"vectorWithDoubles"];
    v38[0] = v9;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    *p_isa = (id)[v25 initWithDomain:v26 code:2 userInfo:v27];

LABEL_21:
    p_isa = 0;
    goto LABEL_22;
  }
LABEL_23:

  return (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self writeTo:v3];
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
  uint64_t v5 = self->_vectorWithDoubles;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "doubleValue", (void)v10);
        PBDataWriterWriteDoubleField();
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
  v33.receiver = self;
  v33.super_class = (Class)BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector;
  uint64_t v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_31;
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
          uint64_t v19 = *v9;
          int v20 = v4[v19];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      uint64_t v19 = *v9;
      int v20 = v4[v19];
      if (v4[v19]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v20 || (v13 & 7) == 4) {
        break;
      }
      if ((v13 >> 3) == 1)
      {
        uint64_t v22 = NSNumber;
        uint64_t v23 = *v7;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v8])
        {
          double v25 = *(double *)(*(void *)&v4[*v10] + v24);
          *(void *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[v19] = 1;
          double v25 = 0.0;
        }
        uint64_t v26 = [v22 numberWithDouble:v25];
        if (!v26)
        {
LABEL_33:

          goto LABEL_30;
        }
        v27 = (void *)v26;
        [v6 addObject:v26];
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_33;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v28 = [v6 copy];
  vectorWithDoubles = v5->_vectorWithDoubles;
  v5->_vectorWithDoubles = (NSArray *)v28;

  int v30 = v4[*v9];
  if (v30) {
LABEL_30:
  }
    long long v31 = 0;
  else {
LABEL_31:
  }
    long long v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self vectorWithDoubles];
  uint64_t v5 = (void *)[v3 initWithFormat:@"BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector with vectorWithDoubles: %@", v4];

  return (NSString *)v5;
}

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)initWithVectorWithDoubles:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector;
  uint64_t v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_vectorWithDoubles, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"vectorWithDoubles" number:1 type:0 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF37E0;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"vectorWithDoubles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_44];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

id __70__BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _vectorWithDoublesJSONArray];
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

    objc_super v8 = [[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector alloc] initByReadFrom:v7];
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