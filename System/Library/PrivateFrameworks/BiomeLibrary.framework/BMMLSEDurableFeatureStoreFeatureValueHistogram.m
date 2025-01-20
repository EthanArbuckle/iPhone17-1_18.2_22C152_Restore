@interface BMMLSEDurableFeatureStoreFeatureValueHistogram
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEDurableFeatureStoreFeatureValueHistogram)initWithBucketList:(id)a3;
- (BMMLSEDurableFeatureStoreFeatureValueHistogram)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSArray)bucketList;
- (NSString)description;
- (id)_bucketListJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEDurableFeatureStoreFeatureValueHistogram

- (void).cxx_destruct
{
}

- (NSArray)bucketList
{
  return self->_bucketList;
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
    v6 = [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self bucketList];
    v7 = [v5 bucketList];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self bucketList];
      v9 = [v5 bucketList];
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
  v2 = [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self _bucketListJSONArray];
  v6 = @"bucketList";
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

- (id)_bucketListJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self bucketList];
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

- (BMMLSEDurableFeatureStoreFeatureValueHistogram)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = [a3 objectForKeyedSubscript:@"bucketList"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v32 = p_isa;

    id v6 = 0;
LABEL_6:
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = v6;
    uint64_t v10 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    v31 = self;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v6);
      }
      long long v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v31;
        v19 = v32;
        if (!v32) {
          goto LABEL_26;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v38 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bucketList"];
        id v39 = v15;
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        v23 = &v39;
        v24 = &v38;
        goto LABEL_21;
      }
      id v15 = v14;
      uint64_t v16 = [BMMLSEDurableFeatureStoreFeatureValueHistogramBucket alloc];
      id v33 = 0;
      v17 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)v16 initWithJSONDictionary:v15 error:&v33];
      id v18 = v33;
      if (v18)
      {
        v25 = v18;
        if (v32) {
          id *v32 = v18;
        }

        self = v31;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      [v9 addObject:v17];

      if (v11 == ++v13)
      {
        uint64_t v11 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
        self = v31;
        if (v11) {
          goto LABEL_8;
        }
LABEL_16:

        self = [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self initWithBucketList:v9];
        p_isa = (id *)&self->super.super.isa;
LABEL_28:

        goto LABEL_29;
      }
    }
    self = v31;
    v19 = v32;
    if (!v32) {
      goto LABEL_26;
    }
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F502C8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"bucketList"];
    id v41 = v15;
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = &v41;
    v24 = &v40;
LABEL_21:
    v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    id *v19 = (id)[v20 initWithDomain:v21 code:2 userInfo:v25];
    goto LABEL_25;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v32 = p_isa;
    goto LABEL_6;
  }
  if (p_isa)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v28 = *MEMORY[0x1E4F502C8];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v9 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"bucketList"];
    v44[0] = v9;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v30 = v29 = self;
    *p_isa = (id)[v27 initWithDomain:v28 code:2 userInfo:v30];

    self = v29;
LABEL_27:
    p_isa = 0;
    goto LABEL_28;
  }
LABEL_29:

  return (BMMLSEDurableFeatureStoreFeatureValueHistogram *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self writeTo:v3];
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
  uint64_t v5 = self->_bucketList;
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
  v28.receiver = self;
  v28.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogram;
  uint64_t v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_26;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v21 = [[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket alloc] initByReadFrom:v4]) == 0)
        {
LABEL_27:

          goto LABEL_28;
        }
        v22 = v21;
        [v6 addObject:v21];
        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_27;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v23 = [v6 copy];
  bucketList = v5->_bucketList;
  v5->_bucketList = (NSArray *)v23;

  int v25 = v4[*v9];
  if (v25) {
LABEL_28:
  }
    v26 = 0;
  else {
LABEL_26:
  }
    v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self bucketList];
  uint64_t v5 = (void *)[v3 initWithFormat:@"BMMLSEDurableFeatureStoreFeatureValueHistogram with bucketList: %@", v4];

  return (NSString *)v5;
}

- (BMMLSEDurableFeatureStoreFeatureValueHistogram)initWithBucketList:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogram;
  uint64_t v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_bucketList, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bucketList" number:2 type:14 subMessageClass:objc_opt_class()];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4CC8;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bucketList_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1757];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

id __57__BMMLSEDurableFeatureStoreFeatureValueHistogram_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _bucketListJSONArray];
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

    objc_super v8 = [[BMMLSEDurableFeatureStoreFeatureValueHistogram alloc] initByReadFrom:v7];
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