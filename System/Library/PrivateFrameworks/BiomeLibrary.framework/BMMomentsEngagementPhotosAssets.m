@interface BMMomentsEngagementPhotosAssets
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagementPhotosAssets)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMMomentsEngagementPhotosAssets)initWithSourceName:(id)a3 sourceIdentifier:(id)a4 assetUUIDs:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)assetUUIDs;
- (NSString)description;
- (NSString)sourceIdentifier;
- (NSString)sourceName;
- (id)_assetUUIDsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagementPhotosAssets

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);

  objc_storeStrong((id *)&self->_sourceName, 0);
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceName
{
  return self->_sourceName;
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
    v6 = [(BMMomentsEngagementPhotosAssets *)self sourceName];
    uint64_t v7 = [v5 sourceName];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEngagementPhotosAssets *)self sourceName];
      v10 = [v5 sourceName];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMMomentsEngagementPhotosAssets *)self sourceIdentifier];
    uint64_t v14 = [v5 sourceIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEngagementPhotosAssets *)self sourceIdentifier];
      v17 = [v5 sourceIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMMomentsEngagementPhotosAssets *)self assetUUIDs];
    v20 = [v5 assetUUIDs];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMMomentsEngagementPhotosAssets *)self assetUUIDs];
      v22 = [v5 assetUUIDs];
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
  v3 = [(BMMomentsEngagementPhotosAssets *)self sourceName];
  id v4 = [(BMMomentsEngagementPhotosAssets *)self sourceIdentifier];
  id v5 = [(BMMomentsEngagementPhotosAssets *)self _assetUUIDsJSONArray];
  v11[0] = @"sourceName";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"sourceIdentifier";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"assetUUIDs";
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

- (id)_assetUUIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEngagementPhotosAssets *)self assetUUIDs];
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

- (BMMomentsEngagementPhotosAssets)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"sourceName"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        id v8 = 0;
        goto LABEL_36;
      }
      v30 = v7;
      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceName"];
      v64[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
      v33 = v31;
      uint64_t v7 = v30;
      id v34 = (id)[v33 initWithDomain:v32 code:2 userInfo:v9];
      id v8 = 0;
      v35 = p_isa;
      p_isa = 0;
      id *v35 = v34;
      goto LABEL_35;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"sourceIdentifier"];
  v48 = p_isa;
  v49 = v7;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v47 = v8;
    id v10 = 0;
LABEL_7:
    id v11 = [v6 objectForKeyedSubscript:@"assetUUIDs"];
    long long v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      v44 = v9;
      v45 = self;

      id v11 = 0;
LABEL_12:
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v11 = v11;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v51;
LABEL_14:
      id v18 = v6;
      id v19 = v10;
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v10 = v19;
          id v6 = v18;
          v9 = v44;
          if (v48)
          {
            id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v23 = *MEMORY[0x1E4F502C8];
            uint64_t v54 = *MEMORY[0x1E4F28568];
            v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"assetUUIDs"];
            v55 = v24;
            v25 = (void *)MEMORY[0x1E4F1C9E8];
            v26 = &v55;
            v27 = &v54;
LABEL_30:
            v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
            id *v48 = (id)[v22 initWithDomain:v23 code:2 userInfo:v28];
          }
          goto LABEL_31;
        }
        [v14 addObject:v21];
        if (v16 == ++v20)
        {
          uint64_t v16 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
          id v10 = v19;
          id v6 = v18;
          if (v16) {
            goto LABEL_14;
          }
LABEL_21:

          id v8 = v47;
          self = [(BMMomentsEngagementPhotosAssets *)v45 initWithSourceName:v47 sourceIdentifier:v10 assetUUIDs:v14];
          p_isa = (id *)&self->super.super.isa;
          v9 = v44;
LABEL_33:

          goto LABEL_34;
        }
      }
      id v10 = v19;
      id v6 = v18;
      v9 = v44;
      if (v48)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"assetUUIDs"];
        v57 = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = &v57;
        v27 = &v56;
        goto LABEL_30;
      }
LABEL_31:

      p_isa = 0;
      self = v45;
      goto LABEL_32;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v44 = v9;
      v45 = self;
      goto LABEL_12;
    }
    if (p_isa)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      v41 = p_isa;
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"assetUUIDs"];
      v60 = v14;
      v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id *v41 = (id)[v46 initWithDomain:v42 code:2 userInfo:v43];

      p_isa = 0;
LABEL_32:
      id v8 = v47;
      goto LABEL_33;
    }
    id v8 = v47;
LABEL_34:

    uint64_t v7 = v49;
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = v8;
    id v10 = v9;
    goto LABEL_7;
  }
  if (p_isa)
  {
    id v36 = v8;
    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v38 = *MEMORY[0x1E4F502C8];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceIdentifier"];
    id v62 = v11;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v39 = v37;
    id v8 = v36;
    id v40 = (id)[v39 initWithDomain:v38 code:2 userInfo:v14];
    id v10 = 0;
    p_isa = 0;
    id *v48 = v40;
    goto LABEL_33;
  }
  id v10 = 0;
LABEL_35:

LABEL_36:
  return (BMMomentsEngagementPhotosAssets *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEngagementPhotosAssets *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sourceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_assetUUIDs;
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
  v31.receiver = self;
  v31.super_class = (Class)BMMomentsEngagementPhotosAssets;
  uint64_t v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_32;
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
        goto LABEL_30;
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
        goto LABEL_30;
      }
      unint64_t v21 = v13 >> 3;
      if ((v13 >> 3) == 3) {
        break;
      }
      if (v21 == 2)
      {
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 32;
LABEL_26:
        v25 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;
LABEL_27:

        goto LABEL_29;
      }
      if (v21 == 1)
      {
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 24;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_34:

        goto LABEL_31;
      }
LABEL_29:
      if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
        goto LABEL_30;
      }
    }
    uint64_t v24 = PBReaderReadString();
    if (!v24) {
      goto LABEL_34;
    }
    v25 = (void *)v24;
    [v6 addObject:v24];
    goto LABEL_27;
  }
LABEL_30:
  uint64_t v26 = [v6 copy];
  assetUUIDs = v5->_assetUUIDs;
  v5->_assetUUIDs = (NSArray *)v26;

  int v28 = v4[*v9];
  if (v28) {
LABEL_31:
  }
    v29 = 0;
  else {
LABEL_32:
  }
    v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMomentsEngagementPhotosAssets *)self sourceName];
  uint64_t v5 = [(BMMomentsEngagementPhotosAssets *)self sourceIdentifier];
  uint64_t v6 = [(BMMomentsEngagementPhotosAssets *)self assetUUIDs];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMMomentsEngagementPhotosAssets with sourceName: %@, sourceIdentifier: %@, assetUUIDs: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMomentsEngagementPhotosAssets)initWithSourceName:(id)a3 sourceIdentifier:(id)a4 assetUUIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMMomentsEngagementPhotosAssets;
  unsigned int v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_sourceName, a3);
    objc_storeStrong((id *)&v12->_sourceIdentifier, a4);
    objc_storeStrong((id *)&v12->_assetUUIDs, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceName" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"sourceIdentifier", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assetUUIDs" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5898;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceName" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"assetUUIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_304];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __42__BMMomentsEngagementPhotosAssets_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _assetUUIDsJSONArray];
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

    uint64_t v8 = [[BMMomentsEngagementPhotosAssets alloc] initByReadFrom:v7];
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