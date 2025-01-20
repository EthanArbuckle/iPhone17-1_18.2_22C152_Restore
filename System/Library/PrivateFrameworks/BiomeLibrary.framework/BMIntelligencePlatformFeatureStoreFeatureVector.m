@interface BMIntelligencePlatformFeatureStoreFeatureVector
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformFeatureStoreFeatureVector)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligencePlatformFeatureStoreFeatureVector)initWithVersion:(id)a3 feature:(id)a4;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (NSArray)feature;
- (NSString)description;
- (id)_featureJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)version;
- (unsigned)dataVersion;
- (void)setHasVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformFeatureStoreFeatureVector

- (void).cxx_destruct
{
}

- (NSArray)feature
{
  return self->_feature;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (int)version
{
  return self->_version;
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
    if (![(BMIntelligencePlatformFeatureStoreFeatureVector *)self hasVersion]
      && ![v5 hasVersion]
      || [(BMIntelligencePlatformFeatureStoreFeatureVector *)self hasVersion]
      && [v5 hasVersion]
      && (int v6 = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self version],
          v6 == [v5 version]))
    {
      v7 = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self feature];
      v8 = [v5 feature];
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else
      {
        v9 = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self feature];
        v10 = [v5 feature];
        char v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(BMIntelligencePlatformFeatureStoreFeatureVector *)self hasVersion])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformFeatureStoreFeatureVector version](self, "version"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self _featureJSONArray];
  v9[0] = @"version";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"feature";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v7;
}

- (id)_featureJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self feature];
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

- (BMIntelligencePlatformFeatureStoreFeatureVector)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"version"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
        v53[0] = v9;
        long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v12];
        v22 = 0;
        id v8 = 0;
        *a4 = v25;
        goto LABEL_33;
      }
      v22 = 0;
      id v8 = 0;
      goto LABEL_35;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"feature"];
  v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  v36 = a4;
  if (v11)
  {
    id v38 = v6;
    id v39 = v8;
    v37 = v7;

    id v9 = 0;
LABEL_9:
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v9 = v9;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    v35 = self;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v42 != v15) {
        objc_enumerationMutation(v9);
      }
      v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = v35;
        uint64_t v7 = v37;
        id v6 = v38;
        if (v36)
        {
          id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v47 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"feature"];
          id v48 = v18;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          id *v36 = (id)[v26 initWithDomain:v27 code:2 userInfo:v28];
          goto LABEL_31;
        }
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v18 = v17;
      v19 = [BMIntelligencePlatformFeatureStoreFeature alloc];
      id v40 = 0;
      v20 = [(BMIntelligencePlatformFeatureStoreFeature *)v19 initWithJSONDictionary:v18 error:&v40];
      id v21 = v40;
      if (v21)
      {
        v28 = v21;
        if (v36) {
          id *v36 = v21;
        }

        self = v35;
        uint64_t v7 = v37;
        id v6 = v38;
LABEL_31:

        goto LABEL_32;
      }
      [v12 addObject:v20];

      if (v14 == ++v16)
      {
        uint64_t v14 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
        self = v35;
        if (v14) {
          goto LABEL_11;
        }
LABEL_19:

        id v8 = v39;
        self = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self initWithVersion:v39 feature:v12];
        v22 = self;
        uint64_t v7 = v37;
        id v6 = v38;
LABEL_33:

        goto LABEL_34;
      }
    }
    self = v35;
    uint64_t v7 = v37;
    id v6 = v38;
    if (v36)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"feature"];
      id v46 = v18;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      id *v36 = (id)[v29 initWithDomain:v30 code:2 userInfo:v28];
      goto LABEL_31;
    }
LABEL_32:

    v22 = 0;
    id v8 = v39;
    goto LABEL_33;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v38 = v6;
    id v39 = v8;
    v37 = v7;
    goto LABEL_9;
  }
  if (a4)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    long long v12 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"feature"];
    v51 = v12;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v34];

    v22 = 0;
    goto LABEL_33;
  }
  v22 = 0;
LABEL_34:

LABEL_35:
  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformFeatureStoreFeatureVector *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasVersion) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_feature;
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
  v35.receiver = self;
  v35.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureVector;
  uint64_t v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_40;
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
      if ((v13 >> 3) == 2)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v28 = [[BMIntelligencePlatformFeatureStoreFeature alloc] initByReadFrom:v4]) == 0)
        {
LABEL_42:

          goto LABEL_39;
        }
        id v29 = v28;
        [v6 addObject:v28];
        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasVersion = 1;
        while (1)
        {
          uint64_t v24 = *v7;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v8]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v10] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_34;
          }
          v21 += 7;
          BOOL v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_36;
          }
        }
        v4[*v9] = 1;
LABEL_34:
        if (v4[*v9]) {
          LODWORD(v23) = 0;
        }
LABEL_36:
        v5->_version = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_42;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v30 = [v6 copy];
  feature = v5->_feature;
  v5->_feature = (NSArray *)v30;

  int v32 = v4[*v9];
  if (v32) {
LABEL_39:
  }
    uint64_t v33 = 0;
  else {
LABEL_40:
  }
    uint64_t v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformFeatureStoreFeatureVector version](self, "version"));
  uint64_t v5 = [(BMIntelligencePlatformFeatureStoreFeatureVector *)self feature];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformFeatureStoreFeatureVector with version: %@, feature: %@", v4, v5];

  return (NSString *)v6;
}

- (BMIntelligencePlatformFeatureStoreFeatureVector)initWithVersion:(id)a3 feature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureVector;
  uint64_t v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasVersion = 1;
      int v9 = [v6 intValue];
    }
    else
    {
      v8->_hasVersion = 0;
      int v9 = -1;
    }
    v8->_version = v9;
    objc_storeStrong((id *)&v8->_feature, a4);
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:1 type:2 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"feature" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF39C0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"feature_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_337];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __58__BMIntelligencePlatformFeatureStoreFeatureVector_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _featureJSONArray];
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

    uint64_t v8 = [[BMIntelligencePlatformFeatureStoreFeatureVector alloc] initByReadFrom:v7];
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