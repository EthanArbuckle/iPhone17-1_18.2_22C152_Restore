@interface BMMLSEDurableFeatureStore
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEDurableFeatureStore)initWithFeatureEntryType:(int)a3 itemIdentifier:(id)a4 featureName:(int)a5 featureValue:(id)a6 featureVersion:(id)a7;
- (BMMLSEDurableFeatureStore)initWithItemIdentifier:(id)a3 featureName:(int)a4 featureValue:(id)a5 featureVersion:(id)a6;
- (BMMLSEDurableFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSEDurableFeatureStoreFeatureValue)featureValue;
- (BOOL)hasFeatureVersion;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)itemIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)featureEntryType;
- (int)featureName;
- (unsigned)dataVersion;
- (unsigned)featureVersion;
- (void)setHasFeatureVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEDurableFeatureStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValue, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (int)featureEntryType
{
  return self->_featureEntryType;
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

- (BMMLSEDurableFeatureStoreFeatureValue)featureValue
{
  return self->_featureValue;
}

- (int)featureName
{
  return self->_featureName;
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
    v6 = [(BMMLSEDurableFeatureStore *)self itemIdentifier];
    uint64_t v7 = [v5 itemIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEDurableFeatureStore *)self itemIdentifier];
      v10 = [v5 itemIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    int v13 = [(BMMLSEDurableFeatureStore *)self featureName];
    if (v13 == [v5 featureName])
    {
      v14 = [(BMMLSEDurableFeatureStore *)self featureValue];
      uint64_t v15 = [v5 featureValue];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMMLSEDurableFeatureStore *)self featureValue];
        v18 = [v5 featureValue];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_17;
        }
      }
      if (![(BMMLSEDurableFeatureStore *)self hasFeatureVersion]
        && ![v5 hasFeatureVersion])
      {
        BOOL v12 = 1;
        goto LABEL_18;
      }
      if ([(BMMLSEDurableFeatureStore *)self hasFeatureVersion]
        && [v5 hasFeatureVersion])
      {
        unsigned int v20 = [(BMMLSEDurableFeatureStore *)self featureVersion];
        BOOL v12 = v20 == [v5 featureVersion];
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMLSEDurableFeatureStore *)self itemIdentifier];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEDurableFeatureStore featureName](self, "featureName"));
  id v5 = [(BMMLSEDurableFeatureStore *)self featureValue];
  v6 = [v5 jsonDictionary];

  if ([(BMMLSEDurableFeatureStore *)self hasFeatureVersion])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStore featureVersion](self, "featureVersion"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v14[0] = @"itemIdentifier";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"featureName";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"featureValue";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"featureVersion";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v6) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v6)
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

  return v12;
}

- (BMMLSEDurableFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"itemIdentifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v33 = 0;
        BOOL v12 = 0;
        v17 = self;
        goto LABEL_42;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = *MEMORY[0x1E4F502C8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v8 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemIdentifier"];
      v42[0] = v8;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      id v33 = 0;
      BOOL v12 = 0;
      *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v7];
      goto LABEL_47;
    }
    id v33 = v6;
  }
  else
  {
    id v33 = 0;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"featureName"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v7;
LABEL_15:
        v8 = v9;
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [NSNumber numberWithInt:BMMLSEDurableFeatureStorefeatureNameFromString(v7)];
        goto LABEL_15;
      }
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        int v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"featureName"];
        v40 = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v14];
        v8 = 0;
        BOOL v12 = 0;
        *a4 = v27;
        goto LABEL_38;
      }
      v8 = 0;
      BOOL v12 = 0;
LABEL_47:
      v17 = self;
      goto LABEL_41;
    }
  }
  v8 = 0;
LABEL_16:
  int v13 = [v5 objectForKeyedSubscript:@"featureValue"];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v13;
        id v34 = 0;
        v14 = [[BMMLSEDurableFeatureStoreFeatureValue alloc] initWithJSONDictionary:v18 error:&v34];
        id v19 = v34;
        if (!v19)
        {

          goto LABEL_19;
        }
        unsigned int v20 = v19;
        if (a4) {
          *a4 = v19;
        }

        BOOL v12 = 0;
        int v13 = v18;
      }
      else
      {
        if (!a4)
        {
          BOOL v12 = 0;
          v17 = self;
          goto LABEL_40;
        }
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        v14 = (BMMLSEDurableFeatureStoreFeatureValue *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"featureValue"];
        v38 = v14;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        *a4 = (id)[v29 initWithDomain:v21 code:2 userInfo:v22];

        BOOL v12 = 0;
      }
LABEL_38:
      v17 = self;
      goto LABEL_39;
    }
  }
  v14 = 0;
LABEL_19:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"featureVersion"];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"featureVersion"];
        v36 = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        *a4 = (id)[v31 initWithDomain:v30 code:2 userInfo:v24];
      }
      BOOL v12 = 0;
      id v16 = 0;
      v17 = self;
      goto LABEL_23;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }
  v17 = -[BMMLSEDurableFeatureStore initWithItemIdentifier:featureName:featureValue:featureVersion:](self, "initWithItemIdentifier:featureName:featureValue:featureVersion:", v33, [v8 intValue], v14, v16);
  BOOL v12 = v17;
LABEL_23:

LABEL_39:
LABEL_40:

LABEL_41:
LABEL_42:

  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEDurableFeatureStore *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_itemIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_featureValue)
  {
    PBDataWriterPlaceMark();
    [(BMMLSEDurableFeatureStoreFeatureValue *)self->_featureValue writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasFeatureVersion) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMMLSEDurableFeatureStore;
  id v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_53;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 2u:
          uint64_t v20 = PBReaderReadString();
          itemIdentifier = v5->_itemIdentifier;
          v5->_itemIdentifier = (NSString *)v20;

          break;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
              break;
            }
            char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
            *(void *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0) {
              goto LABEL_41;
            }
            v22 += 7;
            BOOL v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_43:
          if (v24 >= 0x1FE) {
            LODWORD(v24) = 0;
          }
          v5->_featureName = v24;
          break;
        case 4u:
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v29 = [[BMMLSEDurableFeatureStoreFeatureValue alloc] initByReadFrom:v4];
          if (!v29) {
            goto LABEL_52;
          }
          featureValue = v5->_featureValue;
          v5->_featureValue = v29;

          PBReaderRecallMark();
          break;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasFeatureVersion = 1;
          while (1)
          {
            uint64_t v34 = *v6;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v7]) {
              break;
            }
            char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v36;
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if ((v37 & 0x80) == 0) {
              goto LABEL_47;
            }
            v31 += 7;
            BOOL v17 = v32++ >= 9;
            if (v17)
            {
              LODWORD(v33) = 0;
              goto LABEL_49;
            }
          }
          v4[*v8] = 1;
LABEL_47:
          if (v4[*v8]) {
            LODWORD(v33) = 0;
          }
LABEL_49:
          v5->_featureVersion = v33;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_52;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_52:
  }
    v38 = 0;
  else {
LABEL_53:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEDurableFeatureStore *)self itemIdentifier];
  id v5 = BMMLSEDurableFeatureStorefeatureNameAsString([(BMMLSEDurableFeatureStore *)self featureName]);
  v6 = [(BMMLSEDurableFeatureStore *)self featureValue];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStore featureVersion](self, "featureVersion"));
  v8 = (void *)[v3 initWithFormat:@"BMMLSEDurableFeatureStore with itemIdentifier: %@, featureName: %@, featureValue: %@, featureVersion: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMMLSEDurableFeatureStore)initWithItemIdentifier:(id)a3 featureName:(int)a4 featureValue:(id)a5 featureVersion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMMLSEDurableFeatureStore;
  uint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v14->_itemIdentifier, a3);
    v14->_featureName = a4;
    objc_storeStrong((id *)&v14->_featureValue, a5);
    if (v13)
    {
      v14->_hasFeatureVersion = 1;
      unsigned int v15 = [v13 unsignedIntValue];
    }
    else
    {
      unsigned int v15 = 0;
      v14->_hasFeatureVersion = 0;
    }
    v14->_featureVersion = v15;
  }

  return v14;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureEntryType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"itemIdentifier", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureName" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureValue" number:4 type:14 subMessageClass:objc_opt_class()];
  v9[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureVersion" number:5 type:4 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4CF8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureEntryType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureName" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"featureValue_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1876];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureVersion" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __36__BMMLSEDurableFeatureStore_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 featureValue];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
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

    v8 = [[BMMLSEDurableFeatureStore alloc] initByReadFrom:v7];
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

- (BMMLSEDurableFeatureStore)initWithFeatureEntryType:(int)a3 itemIdentifier:(id)a4 featureName:(int)a5 featureValue:(id)a6 featureVersion:(id)a7
{
  return [(BMMLSEDurableFeatureStore *)self initWithItemIdentifier:a4 featureName:*(void *)&a5 featureValue:a6 featureVersion:a7];
}

@end