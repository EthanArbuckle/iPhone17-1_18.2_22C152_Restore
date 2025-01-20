@interface BMSiriCompanionContextAppMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriCompanionContextAppMetadata)initWithAppBundleId:(id)a3 mediaCategories:(id)a4 subscriptionStatus:(id)a5 localizedAppName:(id)a6;
- (BMSiriCompanionContextAppMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasSubscriptionStatus;
- (BOOL)isEqual:(id)a3;
- (NSArray)mediaCategories;
- (NSString)appBundleId;
- (NSString)description;
- (NSString)localizedAppName;
- (id)_mediaCategoriesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)subscriptionStatus;
- (unsigned)dataVersion;
- (void)setHasSubscriptionStatus:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriCompanionContextAppMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_mediaCategories, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setHasSubscriptionStatus:(BOOL)a3
{
  self->_hasSubscriptionStatus = a3;
}

- (BOOL)hasSubscriptionStatus
{
  return self->_hasSubscriptionStatus;
}

- (int)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (NSArray)mediaCategories
{
  return self->_mediaCategories;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
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
    v6 = [(BMSiriCompanionContextAppMetadata *)self appBundleId];
    uint64_t v7 = [v5 appBundleId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriCompanionContextAppMetadata *)self appBundleId];
      v10 = [v5 appBundleId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_18;
      }
    }
    v13 = [(BMSiriCompanionContextAppMetadata *)self mediaCategories];
    uint64_t v14 = [v5 mediaCategories];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriCompanionContextAppMetadata *)self mediaCategories];
      v17 = [v5 mediaCategories];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_18;
      }
    }
    if (![(BMSiriCompanionContextAppMetadata *)self hasSubscriptionStatus]
      && ![v5 hasSubscriptionStatus]
      || [(BMSiriCompanionContextAppMetadata *)self hasSubscriptionStatus]
      && [v5 hasSubscriptionStatus]
      && (int v19 = [(BMSiriCompanionContextAppMetadata *)self subscriptionStatus],
          v19 == [v5 subscriptionStatus]))
    {
      v20 = [(BMSiriCompanionContextAppMetadata *)self localizedAppName];
      v21 = [v5 localizedAppName];
      if (v20 == v21)
      {
        char v12 = 1;
      }
      else
      {
        v22 = [(BMSiriCompanionContextAppMetadata *)self localizedAppName];
        v23 = [v5 localizedAppName];
        char v12 = [v22 isEqual:v23];
      }
      goto LABEL_19;
    }
LABEL_18:
    char v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriCompanionContextAppMetadata *)self appBundleId];
  id v4 = [(BMSiriCompanionContextAppMetadata *)self _mediaCategoriesJSONArray];
  if ([(BMSiriCompanionContextAppMetadata *)self hasSubscriptionStatus])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriCompanionContextAppMetadata subscriptionStatus](self, "subscriptionStatus"));
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(BMSiriCompanionContextAppMetadata *)self localizedAppName];
  v13[0] = @"appBundleId";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"mediaCategories";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"subscriptionStatus";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"localizedAppName";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v11;
}

- (id)_mediaCategoriesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMSiriCompanionContextAppMetadata *)self mediaCategories];
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

- (BMSiriCompanionContextAppMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"appBundleId"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appBundleId"];
        v63[0] = v8;
        long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
        v25 = 0;
        v27 = 0;
        *a4 = (id)[v28 initWithDomain:v29 code:2 userInfo:v11];
        goto LABEL_44;
      }
      v25 = 0;
      v27 = 0;
      goto LABEL_46;
    }
    id v45 = v7;
  }
  else
  {
    id v45 = 0;
  }
  id v8 = [v6 objectForKeyedSubscript:@"mediaCategories"];
  v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  v44 = a4;
  if (v10)
  {
    v42 = v7;
    v46 = self;

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
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v60 = *MEMORY[0x1E4F28568];
          long long v11 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"mediaCategories"];
          v61 = v11;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          v32 = a4;
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          id v33 = (id)[v30 initWithDomain:v31 code:2 userInfo:v18];
          v27 = 0;
          id *v32 = v33;
          v25 = v45;
          goto LABEL_43;
        }
        v27 = 0;
        v25 = v45;
        goto LABEL_45;
      }
    }
    v42 = v7;
    v46 = self;
  }
  long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v8 = v8;
  uint64_t v12 = [v8 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v48;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v48 != v14) {
        objc_enumerationMutation(v8);
      }
      uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v44)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v20 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"mediaCategories"];
          v58 = v17;
          v21 = (void *)MEMORY[0x1E4F1C9E8];
          v22 = &v58;
          v23 = &v57;
LABEL_27:
          id v24 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
          v25 = v45;
          id v26 = (id)[v19 initWithDomain:v20 code:2 userInfo:v24];
          v27 = 0;
          uint64_t v7 = v42;
          id *v44 = v26;
          id v18 = v8;
          goto LABEL_41;
        }
LABEL_28:
        v27 = 0;
        id v18 = v8;
        v25 = v45;
        self = v46;
        uint64_t v7 = v42;
        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v44)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v20 = *MEMORY[0x1E4F502C8];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mediaCategories"];
          v56 = v17;
          v21 = (void *)MEMORY[0x1E4F1C9E8];
          v22 = &v56;
          v23 = &v55;
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      [v11 addObject:v16];
    }
    uint64_t v13 = [v8 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_18:

  v17 = [v6 objectForKeyedSubscript:@"subscriptionStatus"];
  if (!v17)
  {
    id v18 = 0;
    uint64_t v7 = v42;
    goto LABEL_36;
  }
  objc_opt_class();
  uint64_t v7 = v42;
  if (objc_opt_isKindOfClass())
  {
    id v18 = 0;
LABEL_36:
    v34 = [v6 objectForKeyedSubscript:@"localizedAppName"];
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v24 = 0;
      v25 = v45;
      goto LABEL_39;
    }
    objc_opt_class();
    v25 = v45;
    if (objc_opt_isKindOfClass())
    {
      id v24 = v34;
LABEL_39:
      v27 = [(BMSiriCompanionContextAppMetadata *)v46 initWithAppBundleId:v25 mediaCategories:v11 subscriptionStatus:v18 localizedAppName:v24];
      v46 = v27;
    }
    else
    {
      if (v44)
      {
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        v38 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"localizedAppName"];
        v52 = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        id *v44 = (id)[v43 initWithDomain:v41 code:2 userInfo:v39];
      }
      id v24 = 0;
      v27 = 0;
    }
LABEL_40:

LABEL_41:
    self = v46;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      goto LABEL_36;
    }
    if (v44)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v36 = *MEMORY[0x1E4F502C8];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"subscriptionStatus"];
      id v54 = v24;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v37 = (id)[v40 initWithDomain:v36 code:2 userInfo:v34];
      v27 = 0;
      id v18 = 0;
      id *v44 = v37;
      v25 = v45;
      goto LABEL_40;
    }
    id v18 = 0;
    v27 = 0;
    v25 = v45;
    self = v46;
  }

LABEL_43:
LABEL_44:

LABEL_45:
LABEL_46:

  return v27;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriCompanionContextAppMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_mediaCategories;
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

  if (self->_hasSubscriptionStatus) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_localizedAppName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriCompanionContextAppMetadata;
  uint64_t v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_41;
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
        BOOL v17 = v12++ >= 9;
        if (v17)
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
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_31;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          if (!v22) {
            goto LABEL_43;
          }
          v23 = (void *)v22;
          [v6 addObject:v22];

          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          v5->_hasSubscriptionStatus = 1;
          break;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_31:
          id v30 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_43:

          goto LABEL_40;
      }
      while (1)
      {
        uint64_t v27 = *v7;
        unint64_t v28 = *(void *)&v4[v27];
        if (v28 == -1 || v28 >= *(void *)&v4[*v8]) {
          break;
        }
        char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v28);
        *(void *)&v4[v27] = v28 + 1;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if ((v29 & 0x80) == 0) {
          goto LABEL_35;
        }
        v24 += 7;
        BOOL v17 = v25++ >= 9;
        if (v17)
        {
          LODWORD(v26) = 0;
          goto LABEL_37;
        }
      }
      v4[*v9] = 1;
LABEL_35:
      if (v4[*v9]) {
        LODWORD(v26) = 0;
      }
LABEL_37:
      v5->_subscriptionStatus = v26;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v31 = [v6 copy];
  mediaCategories = v5->_mediaCategories;
  v5->_mediaCategories = (NSArray *)v31;

  int v33 = v4[*v9];
  if (v33) {
LABEL_40:
  }
    v34 = 0;
  else {
LABEL_41:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriCompanionContextAppMetadata *)self appBundleId];
  uint64_t v5 = [(BMSiriCompanionContextAppMetadata *)self mediaCategories];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriCompanionContextAppMetadata subscriptionStatus](self, "subscriptionStatus"));
  uint64_t v7 = [(BMSiriCompanionContextAppMetadata *)self localizedAppName];
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMSiriCompanionContextAppMetadata with appBundleId: %@, mediaCategories: %@, subscriptionStatus: %@, localizedAppName: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSiriCompanionContextAppMetadata)initWithAppBundleId:(id)a3 mediaCategories:(id)a4 subscriptionStatus:(id)a5 localizedAppName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSiriCompanionContextAppMetadata;
  unint64_t v15 = [(BMEventBase *)&v18 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_appBundleId, a3);
    objc_storeStrong((id *)&v15->_mediaCategories, a4);
    if (v13)
    {
      v15->_hasSubscriptionStatus = 1;
      int v16 = [v13 intValue];
    }
    else
    {
      v15->_hasSubscriptionStatus = 0;
      int v16 = -1;
    }
    v15->_subscriptionStatus = v16;
    objc_storeStrong((id *)&v15->_localizedAppName, a6);
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appBundleId" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaCategories" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subscriptionStatus" number:3 type:2 subMessageClass:0];
  v8[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"localizedAppName" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5808;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appBundleId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"mediaCategories_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_49048];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subscriptionStatus" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"localizedAppName" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __44__BMSiriCompanionContextAppMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _mediaCategoriesJSONArray];
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

    uint64_t v8 = [[BMSiriCompanionContextAppMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end