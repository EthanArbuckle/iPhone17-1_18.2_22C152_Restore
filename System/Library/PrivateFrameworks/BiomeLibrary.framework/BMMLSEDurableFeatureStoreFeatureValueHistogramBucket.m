@interface BMMLSEDurableFeatureStoreFeatureValueHistogramBucket
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucket)initWithBucketName:(id)a3 hasEver:(id)a4 counts:(id)a5;
- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucket)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasEver;
- (BOOL)hasHasEver;
- (BOOL)isEqual:(id)a3;
- (NSArray)counts;
- (NSString)bucketName;
- (NSString)description;
- (id)_countsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasHasEver:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEDurableFeatureStoreFeatureValueHistogramBucket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counts, 0);

  objc_storeStrong((id *)&self->_bucketName, 0);
}

- (NSArray)counts
{
  return self->_counts;
}

- (void)setHasHasEver:(BOOL)a3
{
  self->_hasHasEver = a3;
}

- (BOOL)hasHasEver
{
  return self->_hasHasEver;
}

- (BOOL)hasEver
{
  return self->_hasEver;
}

- (NSString)bucketName
{
  return self->_bucketName;
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
    v6 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self bucketName];
    uint64_t v7 = [v5 bucketName];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self bucketName];
      v10 = [v5 bucketName];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self hasHasEver]
      && ![v5 hasHasEver]
      || [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self hasHasEver]
      && [v5 hasHasEver]
      && (int v13 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self hasEver],
          v13 == [v5 hasEver]))
    {
      v14 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self counts];
      v15 = [v5 counts];
      if (v14 == v15)
      {
        char v12 = 1;
      }
      else
      {
        v16 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self counts];
        v17 = [v5 counts];
        char v12 = [v16 isEqual:v17];
      }
      goto LABEL_17;
    }
LABEL_12:
    char v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v12 = 0;
LABEL_18:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self bucketName];
  if ([(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self hasHasEver])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasEver](self, "hasEver"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self _countsJSONArray];
  v11[0] = @"bucketName";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"hasEver";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"counts";
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
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (id)_countsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self counts];
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

- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucket)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bucketName"];
  unint64_t v8 = 0x1E4F1C000uLL;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v26 = 0;
        id v9 = 0;
        goto LABEL_45;
      }
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v71 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bucketName"];
      v72[0] = v25;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
      id v29 = (id)[v27 initWithDomain:v28 code:2 userInfo:v10];
      v26 = 0;
      id v9 = 0;
      *a4 = v29;
      goto LABEL_44;
    }
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }
  v10 = [v6 objectForKeyedSubscript:@"hasEver"];
  v56 = v7;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v51 = a4;
    id v55 = 0;
LABEL_7:
    id v11 = [v6 objectForKeyedSubscript:@"counts"];
    long long v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      v52 = v10;
      id v53 = v9;
      id v54 = v6;

      id v11 = 0;
LABEL_12:
      long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v11 = v11;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (!v15) {
        goto LABEL_22;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v59;
      v50 = self;
LABEL_14:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v58 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self = v50;
          v38 = v51;
          v10 = v52;
          id v9 = v53;
          if (!v51) {
            goto LABEL_40;
          }
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"counts"];
          id v63 = v21;
          v41 = (void *)MEMORY[0x1E4F1C9E8];
          v42 = &v63;
          v43 = &v62;
          goto LABEL_35;
        }
        unint64_t v20 = v8;
        id v21 = v19;
        v22 = [BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount alloc];
        id v57 = 0;
        v23 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *)v22 initWithJSONDictionary:v21 error:&v57];
        id v24 = v57;
        if (v24)
        {
          v44 = v24;
          if (v51) {
            id *v51 = v24;
          }

          self = v50;
          v10 = v52;
          id v9 = v53;
LABEL_39:

LABEL_40:
          v26 = 0;
          id v6 = v54;
          goto LABEL_41;
        }
        [v14 addObject:v23];

        ++v18;
        unint64_t v8 = v20;
        if (v16 == v18)
        {
          uint64_t v16 = [v11 countByEnumeratingWithState:&v58 objects:v66 count:16];
          self = v50;
          if (v16) {
            goto LABEL_14;
          }
LABEL_22:

          id v9 = v53;
          v25 = v55;
          self = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self initWithBucketName:v53 hasEver:v55 counts:v14];
          v26 = self;
          id v6 = v54;
          v10 = v52;
LABEL_42:

          uint64_t v7 = v56;
          goto LABEL_43;
        }
      }
      self = v50;
      v38 = v51;
      v10 = v52;
      id v9 = v53;
      if (!v51) {
        goto LABEL_40;
      }
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"counts"];
      id v65 = v21;
      v41 = (void *)MEMORY[0x1E4F1C9E8];
      v42 = &v65;
      v43 = &v64;
LABEL_35:
      v44 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:1];
      id *v38 = (id)[v39 initWithDomain:v40 code:2 userInfo:v44];
      goto LABEL_39;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v52 = v10;
      id v53 = v9;
      id v54 = v6;
      goto LABEL_12;
    }
    if (v51)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v47 = *MEMORY[0x1E4F502C8];
      uint64_t v67 = *MEMORY[0x1E4F28568];
      long long v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"counts"];
      v68 = v14;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      id *v51 = (id)[v46 initWithDomain:v47 code:2 userInfo:v48];

      v26 = 0;
LABEL_41:
      v25 = v55;
      goto LABEL_42;
    }
    v26 = 0;
    v25 = v55;
LABEL_43:

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = a4;
    id v55 = v10;
    goto LABEL_7;
  }
  if (a4)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v69 = *MEMORY[0x1E4F28568];
    v32 = a4;
    v33 = v10;
    v34 = self;
    id v35 = [NSString alloc];
    uint64_t v49 = objc_opt_class();
    v36 = v35;
    self = v34;
    v10 = v33;
    id v11 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v49, @"hasEver"];
    id v70 = v11;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    id v37 = (id)[v30 initWithDomain:v31 code:2 userInfo:v14];
    v26 = 0;
    v25 = 0;
    id *v32 = v37;
    goto LABEL_42;
  }
  v25 = 0;
  v26 = 0;
LABEL_44:

LABEL_45:
  return v26;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bucketName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasHasEver) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_counts;
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
  v38.receiver = self;
  v38.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogramBucket;
  uint64_t v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_42;
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
        break;
      }
      unint64_t v21 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v24 = [[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount alloc] initByReadFrom:v4]) == 0)
        {
LABEL_44:

          goto LABEL_41;
        }
        v25 = v24;
        [v6 addObject:v24];
        PBReaderRecallMark();
      }
      else if (v21 == 2)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        v5->_hasHasEver = 1;
        while (1)
        {
          uint64_t v29 = *v7;
          uint64_t v30 = *(void *)&v4[v29];
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)&v4[*v8]) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
          *(void *)&v4[v29] = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0) {
            goto LABEL_36;
          }
          v26 += 7;
          BOOL v18 = v27++ >= 9;
          if (v18)
          {
            uint64_t v28 = 0;
            goto LABEL_38;
          }
        }
        v4[*v9] = 1;
LABEL_36:
        if (v4[*v9]) {
          uint64_t v28 = 0;
        }
LABEL_38:
        v5->_hasEver = v28 != 0;
      }
      else if (v21 == 1)
      {
        uint64_t v22 = PBReaderReadString();
        bucketName = v5->_bucketName;
        v5->_bucketName = (NSString *)v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_44;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v33 = [v6 copy];
  counts = v5->_counts;
  v5->_counts = (NSArray *)v33;

  int v35 = v4[*v9];
  if (v35) {
LABEL_41:
  }
    v36 = 0;
  else {
LABEL_42:
  }
    v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self bucketName];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasEver](self, "hasEver"));
  uint64_t v6 = [(BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *)self counts];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMMLSEDurableFeatureStoreFeatureValueHistogramBucket with bucketName: %@, hasEver: %@, counts: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucket)initWithBucketName:(id)a3 hasEver:(id)a4 counts:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogramBucket;
  unsigned int v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_bucketName, a3);
    if (v10)
    {
      v12->_hasHasEver = 1;
      v12->_hasEver = [v10 BOOLValue];
    }
    else
    {
      v12->_hasHasEver = 0;
      v12->_hasEver = 0;
    }
    objc_storeStrong((id *)&v12->_counts, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bucketName" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"hasEver", 2, 12, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"counts" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4CB0;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bucketName" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEver" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"counts_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1712];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __63__BMMLSEDurableFeatureStoreFeatureValueHistogramBucket_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _countsJSONArray];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end