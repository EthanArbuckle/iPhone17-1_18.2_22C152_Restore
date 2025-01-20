@interface BMMLSEVirtualFeatureStore
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEVirtualFeatureStore)initWithItemIdentifier:(id)a3 featureVersion:(id)a4 featureVector:(id)a5 deviceIdentifier:(id)a6 shareSessionIdentifier:(id)a7;
- (BMMLSEVirtualFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasFeatureVersion;
- (BOOL)isEqual:(id)a3;
- (NSArray)featureVector;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)itemIdentifier;
- (NSString)shareSessionIdentifier;
- (id)_featureVectorJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)featureVersion;
- (void)setHasFeatureVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEVirtualFeatureStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_featureVector, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (NSString)shareSessionIdentifier
{
  return self->_shareSessionIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSArray)featureVector
{
  return self->_featureVector;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  self->_hasFeatureVersion = a3;
}

- (BOOL)hasFeatureVersion
{
  return self->_hasFeatureVersion;
}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
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
    v6 = [(BMMLSEVirtualFeatureStore *)self itemIdentifier];
    uint64_t v7 = [v5 itemIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEVirtualFeatureStore *)self itemIdentifier];
      v10 = [v5 itemIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_18;
      }
    }
    if ([(BMMLSEVirtualFeatureStore *)self hasFeatureVersion]
      || [v5 hasFeatureVersion])
    {
      if (![(BMMLSEVirtualFeatureStore *)self hasFeatureVersion]) {
        goto LABEL_18;
      }
      if (![v5 hasFeatureVersion]) {
        goto LABEL_18;
      }
      unsigned int v13 = [(BMMLSEVirtualFeatureStore *)self featureVersion];
      if (v13 != [v5 featureVersion]) {
        goto LABEL_18;
      }
    }
    v14 = [(BMMLSEVirtualFeatureStore *)self featureVector];
    uint64_t v15 = [v5 featureVector];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMMLSEVirtualFeatureStore *)self featureVector];
      v18 = [v5 featureVector];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_18;
      }
    }
    v20 = [(BMMLSEVirtualFeatureStore *)self deviceIdentifier];
    uint64_t v21 = [v5 deviceIdentifier];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMMLSEVirtualFeatureStore *)self deviceIdentifier];
      v24 = [v5 deviceIdentifier];
      int v25 = [v23 isEqual:v24];

      if (!v25)
      {
LABEL_18:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v27 = [(BMMLSEVirtualFeatureStore *)self shareSessionIdentifier];
    v28 = [v5 shareSessionIdentifier];
    if (v27 == v28)
    {
      char v12 = 1;
    }
    else
    {
      v29 = [(BMMLSEVirtualFeatureStore *)self shareSessionIdentifier];
      v30 = [v5 shareSessionIdentifier];
      char v12 = [v29 isEqual:v30];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMLSEVirtualFeatureStore *)self itemIdentifier];
  if ([(BMMLSEVirtualFeatureStore *)self hasFeatureVersion])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStore featureVersion](self, "featureVersion"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(BMMLSEVirtualFeatureStore *)self _featureVectorJSONArray];
  v6 = [(BMMLSEVirtualFeatureStore *)self deviceIdentifier];
  uint64_t v7 = [(BMMLSEVirtualFeatureStore *)self shareSessionIdentifier];
  v17 = @"itemIdentifier";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"featureVersion";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  int v19 = @"featureVector";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"deviceIdentifier";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  uint64_t v21 = @"shareSessionIdentifier";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  unsigned int v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }

  if (v5)
  {
LABEL_17:
    if (v4) {
      goto LABEL_18;
    }
LABEL_25:

    if (v3) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
LABEL_24:

  if (!v4) {
    goto LABEL_25;
  }
LABEL_18:
  if (v3) {
    goto LABEL_19;
  }
LABEL_26:

LABEL_19:

  return v13;
}

- (id)_featureVectorJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMLSEVirtualFeatureStore *)self featureVector];
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

- (BMMLSEVirtualFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"itemIdentifier"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v24 = a4;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        v27 = self;
        id v28 = [NSString alloc];
        uint64_t v53 = objc_opt_class();
        v29 = v28;
        self = v27;
        v30 = (void *)[v29 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v53, @"itemIdentifier"];
        v85[0] = v30;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
        v31 = 0;
        id v8 = 0;
        id *v24 = (id)[v25 initWithDomain:v26 code:2 userInfo:v10];
        goto LABEL_70;
      }
      v31 = 0;
      id v8 = 0;
      goto LABEL_71;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"featureVersion"];
  v62 = (void *)v9;
  v63 = v7;
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = a4;
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"featureVersion"];
        id v83 = v11;
        v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        v31 = 0;
        v30 = 0;
        id *v32 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2);

        goto LABEL_69;
      }
      v30 = 0;
      v31 = 0;
      goto LABEL_70;
    }
    id v61 = v10;
  }
  else
  {
    id v61 = 0;
  }
  id v11 = [v6 objectForKeyedSubscript:@"featureVector"];
  long long v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
    v56 = a4;
    id v57 = v8;
    v59 = self;

    id v11 = 0;
  }
  else
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v31 = 0;
          v30 = v61;
          goto LABEL_69;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        v64 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"featureVector"];
        v81 = v64;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        v45 = a4;
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v46 = (id)[v43 initWithDomain:v44 code:2 userInfo:v23];
        v31 = 0;
        id *v45 = v46;
LABEL_45:
        v30 = v61;
        goto LABEL_67;
      }
    }
    v56 = a4;
    id v57 = v8;
    v59 = self;
  }
  v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v11 = v11;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v68;
  id v55 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v68 != v16) {
        objc_enumerationMutation(v11);
      }
      v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = v56;
        if (v56)
        {
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = *MEMORY[0x1E4F502C8];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"featureVector"];
          id v78 = v19;
          id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          v39 = v36;
          uint64_t v40 = v37;
LABEL_37:
          v31 = 0;
          id *v35 = (id)[v39 initWithDomain:v40 code:2 userInfo:v38];
LABEL_41:
          id v23 = v11;
          id v6 = v55;
          id v8 = v57;
          self = v59;
          v30 = v61;
          goto LABEL_65;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = v56;
        if (v56)
        {
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v42 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"featureVector"];
          id v76 = v19;
          id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          v39 = v41;
          uint64_t v40 = v42;
          goto LABEL_37;
        }
LABEL_44:
        v31 = 0;
        id v23 = v11;
        id v6 = v55;
        id v8 = v57;
        self = v59;
        goto LABEL_45;
      }
      id v19 = v18;
      v20 = [BMMLSEVirtualFeatureStoreFeature alloc];
      id v66 = 0;
      uint64_t v21 = [(BMMLSEVirtualFeatureStoreFeature *)v20 initWithJSONDictionary:v19 error:&v66];
      id v22 = v66;
      if (v22)
      {
        id v38 = v22;
        if (v56) {
          id *v56 = v22;
        }

        v31 = 0;
        goto LABEL_41;
      }
      [v64 addObject:v21];
    }
    uint64_t v15 = [v11 countByEnumeratingWithState:&v67 objects:v79 count:16];
    id v6 = v55;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_22:

  id v19 = [v6 objectForKeyedSubscript:@"deviceIdentifier"];
  if (!v19)
  {
    id v23 = 0;
    self = v59;
    goto LABEL_49;
  }
  objc_opt_class();
  self = v59;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v19;
      goto LABEL_49;
    }
    if (!v56)
    {
      id v23 = 0;
      v31 = 0;
      id v8 = v57;
      v30 = v61;
      goto LABEL_66;
    }
    id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v48 = *MEMORY[0x1E4F502C8];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceIdentifier"];
    id v74 = v38;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    id v49 = (id)[v54 initWithDomain:v48 code:2 userInfo:v47];
    v31 = 0;
    id v23 = 0;
    id *v56 = v49;
    id v8 = v57;
LABEL_63:
    v30 = v61;
    goto LABEL_64;
  }
  id v23 = 0;
LABEL_49:
  id v8 = v57;
  v47 = [v6 objectForKeyedSubscript:@"shareSessionIdentifier"];
  if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v38 = 0;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v56)
    {
      id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v58 = *MEMORY[0x1E4F502C8];
      uint64_t v71 = *MEMORY[0x1E4F28568];
      v50 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"shareSessionIdentifier"];
      v72 = v50;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      id *v56 = (id)[v60 initWithDomain:v58 code:2 userInfo:v51];
    }
    id v38 = 0;
    v31 = 0;
    goto LABEL_63;
  }
  id v38 = v47;
LABEL_52:
  v30 = v61;
  self = [(BMMLSEVirtualFeatureStore *)self initWithItemIdentifier:v57 featureVersion:v61 featureVector:v64 deviceIdentifier:v23 shareSessionIdentifier:v38];
  v31 = self;
LABEL_64:

LABEL_65:
LABEL_66:

LABEL_67:
LABEL_69:

  v10 = v62;
  uint64_t v7 = v63;
LABEL_70:

LABEL_71:
  return v31;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEVirtualFeatureStore *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_itemIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasFeatureVersion) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_featureVector;
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

  if (self->_deviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_shareSessionIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMMLSEVirtualFeatureStore;
  uint64_t v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_43;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
          goto LABEL_35;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasFeatureVersion = 1;
          break;
        case 3u:
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_45;
          }
          id v30 = [[BMMLSEVirtualFeatureStoreFeature alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_45;
          }
          v31 = v30;
          [v6 addObject:v30];
          PBReaderRecallMark();

          continue;
        case 4u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 48;
          goto LABEL_35;
        case 5u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 56;
LABEL_35:
          v32 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_45:

          goto LABEL_42;
      }
      while (1)
      {
        uint64_t v26 = *v7;
        uint64_t v27 = *(void *)&v4[v26];
        unint64_t v28 = v27 + 1;
        if (v27 == -1 || v28 > *(void *)&v4[*v8]) {
          break;
        }
        char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
        *(void *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0) {
          goto LABEL_37;
        }
        v23 += 7;
        BOOL v18 = v24++ >= 9;
        if (v18)
        {
          LODWORD(v25) = 0;
          goto LABEL_39;
        }
      }
      v4[*v9] = 1;
LABEL_37:
      if (v4[*v9]) {
        LODWORD(v25) = 0;
      }
LABEL_39:
      v5->_featureVersion = v25;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v33 = [v6 copy];
  featureVector = v5->_featureVector;
  v5->_featureVector = (NSArray *)v33;

  int v35 = v4[*v9];
  if (v35) {
LABEL_42:
  }
    id v36 = 0;
  else {
LABEL_43:
  }
    id v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEVirtualFeatureStore *)self itemIdentifier];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStore featureVersion](self, "featureVersion"));
  uint64_t v6 = [(BMMLSEVirtualFeatureStore *)self featureVector];
  uint64_t v7 = [(BMMLSEVirtualFeatureStore *)self deviceIdentifier];
  uint64_t v8 = [(BMMLSEVirtualFeatureStore *)self shareSessionIdentifier];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMMLSEVirtualFeatureStore with itemIdentifier: %@, featureVersion: %@, featureVector: %@, deviceIdentifier: %@, shareSessionIdentifier: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMMLSEVirtualFeatureStore)initWithItemIdentifier:(id)a3 featureVersion:(id)a4 featureVector:(id)a5 deviceIdentifier:(id)a6 shareSessionIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMMLSEVirtualFeatureStore;
  BOOL v18 = [(BMEventBase *)&v21 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_itemIdentifier, a3);
    if (v14)
    {
      v18->_hasFeatureVersion = 1;
      unsigned int v19 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v19 = 0;
      v18->_hasFeatureVersion = 0;
    }
    v18->_featureVersion = v19;
    objc_storeStrong((id *)&v18->_featureVector, a5);
    objc_storeStrong((id *)&v18->_deviceIdentifier, a6);
    objc_storeStrong((id *)&v18->_shareSessionIdentifier, a7);
  }

  return v18;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemIdentifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"featureVersion", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureVector" number:3 type:14 subMessageClass:objc_opt_class()];
  v9[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceIdentifier" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareSessionIdentifier" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3D98;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureVersion" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"featureVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_2485];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareSessionIdentifier" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __36__BMMLSEVirtualFeatureStore_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _featureVectorJSONArray];
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

    uint64_t v8 = [[BMMLSEVirtualFeatureStore alloc] initByReadFrom:v7];
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