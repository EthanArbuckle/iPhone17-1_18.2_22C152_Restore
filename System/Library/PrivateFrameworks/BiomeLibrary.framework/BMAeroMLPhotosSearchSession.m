@interface BMAeroMLPhotosSearchSession
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAeroMLPhotosSearchSession)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAeroMLPhotosSearchSession)initWithQueryRaw:(id)a3 queryEmbedding:(id)a4 presentedAssets:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)presentedAssets;
- (NSArray)queryEmbedding;
- (NSString)description;
- (NSString)queryRaw;
- (id)_presentedAssetsJSONArray;
- (id)_queryEmbeddingJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAeroMLPhotosSearchSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedAssets, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);

  objc_storeStrong((id *)&self->_queryRaw, 0);
}

- (NSArray)presentedAssets
{
  return self->_presentedAssets;
}

- (NSArray)queryEmbedding
{
  return self->_queryEmbedding;
}

- (NSString)queryRaw
{
  return self->_queryRaw;
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
    v6 = [(BMAeroMLPhotosSearchSession *)self queryRaw];
    uint64_t v7 = [v5 queryRaw];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAeroMLPhotosSearchSession *)self queryRaw];
      v10 = [v5 queryRaw];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMAeroMLPhotosSearchSession *)self queryEmbedding];
    uint64_t v14 = [v5 queryEmbedding];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAeroMLPhotosSearchSession *)self queryEmbedding];
      v17 = [v5 queryEmbedding];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMAeroMLPhotosSearchSession *)self presentedAssets];
    v20 = [v5 presentedAssets];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMAeroMLPhotosSearchSession *)self presentedAssets];
      v22 = [v5 presentedAssets];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAeroMLPhotosSearchSession *)self queryRaw];
  id v4 = [(BMAeroMLPhotosSearchSession *)self _queryEmbeddingJSONArray];
  id v5 = [(BMAeroMLPhotosSearchSession *)self _presentedAssetsJSONArray];
  v11[0] = @"queryRaw";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"queryEmbedding";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"presentedAssets";
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

- (id)_presentedAssetsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMAeroMLPhotosSearchSession *)self presentedAssets];
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

- (id)_queryEmbeddingJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMAeroMLPhotosSearchSession *)self queryEmbedding];
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
          long long v11 = [MEMORY[0x1E4F1CA98] null];
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

- (BMAeroMLPhotosSearchSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"queryRaw"];
  v60 = v5;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"queryRaw"];
        v86[0] = v8;
        long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
        id v7 = 0;
        v31 = 0;
        *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v13];
        goto LABEL_60;
      }
      id v7 = 0;
      v31 = 0;
      goto LABEL_62;
    }
    v58 = v6;
    id v7 = v6;
  }
  else
  {
    v58 = v6;
    id v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:@"queryEmbedding"];
  v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v57 = v7;
    long long v11 = self;

    id v8 = 0;
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v83 = *MEMORY[0x1E4F28568];
          long long v13 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"queryEmbedding"];
          v84 = v13;
          id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          v31 = 0;
          *a4 = (id)[v43 initWithDomain:v44 code:2 userInfo:v20];
          goto LABEL_59;
        }
        v31 = 0;
        uint64_t v6 = v58;
        goto LABEL_61;
      }
    }
    id v57 = v7;
    long long v11 = self;
  }
  unint64_t v12 = 0x1E4F1C000uLL;
  long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v8 = v8;
  uint64_t v14 = [v8 countByEnumeratingWithState:&v67 objects:v82 count:16];
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v68;
  do
  {
    unint64_t v17 = v12;
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v68 != v16) {
        objc_enumerationMutation(v8);
      }
      uint64_t v19 = *(void *)(*((void *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = a4;
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v80 = *MEMORY[0x1E4F28568];
          v61 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"queryEmbedding"];
          v81 = v61;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          v27 = v24;
          uint64_t v28 = v25;
LABEL_26:
          self = v11;
          id *v23 = (id)[v27 initWithDomain:v28 code:2 userInfo:v26];

          v31 = 0;
          id v20 = v8;
          id v7 = v57;
          goto LABEL_58;
        }
LABEL_27:
        v31 = 0;
        id v20 = v8;
        self = v11;
        id v7 = v57;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = a4;
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v78 = *MEMORY[0x1E4F28568];
          v61 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"queryEmbedding"];
          v79 = v61;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          v27 = v29;
          uint64_t v28 = v30;
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      [v13 addObject:v19];
    }
    uint64_t v15 = [v8 countByEnumeratingWithState:&v67 objects:v82 count:16];
    unint64_t v12 = v17;
  }
  while (v15);
LABEL_18:

  id v20 = [v60 objectForKeyedSubscript:@"presentedAssets"];
  v21 = [MEMORY[0x1E4F1CA98] null];
  int v22 = [v20 isEqual:v21];

  if (v22)
  {

    id v20 = 0;
    self = v11;
LABEL_32:
    v61 = objc_msgSend(objc_alloc(*(Class *)(v12 + 2632)), "initWithCapacity:", objc_msgSend(v20, "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v20 = v20;
    uint64_t v34 = [v20 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (!v34) {
      goto LABEL_42;
    }
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v64;
    v56 = self;
LABEL_34:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v64 != v36) {
        objc_enumerationMutation(v20);
      }
      v38 = *(void **)(*((void *)&v63 + 1) + 8 * v37);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v56;
        id v7 = v57;
        v45 = a4;
        if (!a4) {
          goto LABEL_56;
        }
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v71 = *MEMORY[0x1E4F28568];
        id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"presentedAssets"];
        id v72 = v39;
        v48 = (void *)MEMORY[0x1E4F1C9E8];
        v49 = &v72;
        v50 = &v71;
        goto LABEL_51;
      }
      id v39 = v38;
      v40 = [BMAeroMLPhotosSearchSessionAsset alloc];
      id v62 = 0;
      v41 = [(BMAeroMLPhotosSearchSessionAsset *)v40 initWithJSONDictionary:v39 error:&v62];
      id v42 = v62;
      if (v42)
      {
        v51 = v42;
        if (a4) {
          *a4 = v42;
        }

        self = v56;
        id v7 = v57;
LABEL_55:

LABEL_56:
        goto LABEL_57;
      }
      [v61 addObject:v41];

      if (v35 == ++v37)
      {
        uint64_t v35 = [v20 countByEnumeratingWithState:&v63 objects:v75 count:16];
        self = v56;
        if (v35) {
          goto LABEL_34;
        }
LABEL_42:

        id v7 = v57;
        self = [(BMAeroMLPhotosSearchSession *)self initWithQueryRaw:v57 queryEmbedding:v13 presentedAssets:v61];
        v31 = self;
LABEL_58:

        goto LABEL_59;
      }
    }
    self = v56;
    id v7 = v57;
    v45 = a4;
    if (!a4) {
      goto LABEL_56;
    }
    id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v47 = *MEMORY[0x1E4F502C8];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"presentedAssets"];
    id v74 = v39;
    v48 = (void *)MEMORY[0x1E4F1C9E8];
    v49 = &v74;
    v50 = &v73;
LABEL_51:
    v51 = [v48 dictionaryWithObjects:v49 forKeys:v50 count:1];
    id *v45 = (id)[v46 initWithDomain:v47 code:2 userInfo:v51];
    goto LABEL_55;
  }
  self = v11;
  if (!v20) {
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_32;
  }
  id v7 = v57;
  if (a4)
  {
    id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v54 = *MEMORY[0x1E4F502C8];
    uint64_t v76 = *MEMORY[0x1E4F28568];
    v61 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"presentedAssets"];
    v77 = v61;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    *a4 = (id)[v53 initWithDomain:v54 code:2 userInfo:v55];

LABEL_57:
    v31 = 0;
    goto LABEL_58;
  }
  v31 = 0;
LABEL_59:

  uint64_t v6 = v58;
LABEL_60:

  id v5 = v60;
LABEL_61:

LABEL_62:
  return v31;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAeroMLPhotosSearchSession *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_queryRaw) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_queryEmbedding;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) doubleValue];
        PBDataWriterWriteDoubleField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v10 = self->_presentedAssets;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        PBDataWriterPlaceMark();
        [v15 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMAeroMLPhotosSearchSession;
  id v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  v9 = (int *)MEMORY[0x1E4F940E0];
  int v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v10]) {
        goto LABEL_36;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        if (v13++ >= 9)
        {
          unint64_t v14 = 0;
          uint64_t v20 = *v10;
          int v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      uint64_t v20 = *v10;
      int v21 = v4[v20];
      if (v4[v20]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v21 || (v14 & 7) == 4) {
        goto LABEL_36;
      }
      unint64_t v23 = v14 >> 3;
      if ((v14 >> 3) == 3) {
        break;
      }
      if (v23 == 2)
      {
        uint64_t v28 = NSNumber;
        uint64_t v29 = *v8;
        unint64_t v30 = *(void *)&v4[v29];
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v9])
        {
          double v31 = *(double *)(*(void *)&v4[*v11] + v30);
          *(void *)&v4[v29] = v30 + 8;
        }
        else
        {
          v4[v20] = 1;
          double v31 = 0.0;
        }
        uint64_t v32 = [v28 numberWithDouble:v31];
        if (!v32)
        {
LABEL_40:

          goto LABEL_37;
        }
        v27 = (void *)v32;
        [v6 addObject:v32];
        goto LABEL_34;
      }
      if (v23 == 1)
      {
        uint64_t v24 = PBReaderReadString();
        queryRaw = v5->_queryRaw;
        v5->_queryRaw = (NSString *)v24;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_40;
      }
LABEL_35:
      if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
        goto LABEL_36;
      }
    }
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    if ((PBReaderPlaceMark() & 1) == 0) {
      goto LABEL_40;
    }
    id v26 = [[BMAeroMLPhotosSearchSessionAsset alloc] initByReadFrom:v4];
    if (!v26) {
      goto LABEL_40;
    }
    v27 = v26;
    [v7 addObject:v26];
    PBReaderRecallMark();
LABEL_34:

    goto LABEL_35;
  }
LABEL_36:
  uint64_t v33 = [v6 copy];
  queryEmbedding = v5->_queryEmbedding;
  v5->_queryEmbedding = (NSArray *)v33;

  uint64_t v35 = [v7 copy];
  presentedAssets = v5->_presentedAssets;
  v5->_presentedAssets = (NSArray *)v35;

  int v37 = v4[*v10];
  if (v37) {
LABEL_37:
  }
    v38 = 0;
  else {
LABEL_38:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAeroMLPhotosSearchSession *)self queryRaw];
  id v5 = [(BMAeroMLPhotosSearchSession *)self queryEmbedding];
  uint64_t v6 = [(BMAeroMLPhotosSearchSession *)self presentedAssets];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMAeroMLPhotosSearchSession with queryRaw: %@, queryEmbedding: %@, presentedAssets: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMAeroMLPhotosSearchSession)initWithQueryRaw:(id)a3 queryEmbedding:(id)a4 presentedAssets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMAeroMLPhotosSearchSession;
  char v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_queryRaw, a3);
    objc_storeStrong((id *)&v12->_queryEmbedding, a4);
    objc_storeStrong((id *)&v12->_presentedAssets, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryRaw" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"queryEmbedding", 2, 0, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"presentedAssets" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3558;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryRaw" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"queryEmbedding_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3711];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"presentedAssets_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_161];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __38__BMAeroMLPhotosSearchSession_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _presentedAssetsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __38__BMAeroMLPhotosSearchSession_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _queryEmbeddingJSONArray];
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

    uint64_t v8 = [[BMAeroMLPhotosSearchSession alloc] initByReadFrom:v7];
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