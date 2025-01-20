@interface BMIntelligencePlatformFeatureStore
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligencePlatformFeatureStore)initWithLabelName:(id)a3 labelValue:(id)a4 taskName:(id)a5 category:(int)a6 featureVector:(id)a7;
- (BMIntelligencePlatformFeatureStoreFeatureVector)featureVector;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)labelName;
- (NSString)labelValue;
- (NSString)taskName;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)category;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformFeatureStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_labelValue, 0);

  objc_storeStrong((id *)&self->_labelName, 0);
}

- (BMIntelligencePlatformFeatureStoreFeatureVector)featureVector
{
  return self->_featureVector;
}

- (int)category
{
  return self->_category;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (NSString)labelValue
{
  return self->_labelValue;
}

- (NSString)labelName
{
  return self->_labelName;
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
    v6 = [(BMIntelligencePlatformFeatureStore *)self labelName];
    uint64_t v7 = [v5 labelName];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligencePlatformFeatureStore *)self labelName];
      v10 = [v5 labelName];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_18;
      }
    }
    v13 = [(BMIntelligencePlatformFeatureStore *)self labelValue];
    uint64_t v14 = [v5 labelValue];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMIntelligencePlatformFeatureStore *)self labelValue];
      v17 = [v5 labelValue];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_18;
      }
    }
    v19 = [(BMIntelligencePlatformFeatureStore *)self taskName];
    uint64_t v20 = [v5 taskName];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMIntelligencePlatformFeatureStore *)self taskName];
      v23 = [v5 taskName];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_18;
      }
    }
    int v25 = [(BMIntelligencePlatformFeatureStore *)self category];
    if (v25 == [v5 category])
    {
      v26 = [(BMIntelligencePlatformFeatureStore *)self featureVector];
      v27 = [v5 featureVector];
      if (v26 == v27)
      {
        char v12 = 1;
      }
      else
      {
        v28 = [(BMIntelligencePlatformFeatureStore *)self featureVector];
        v29 = [v5 featureVector];
        char v12 = [v28 isEqual:v29];
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
  v23[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligencePlatformFeatureStore *)self labelName];
  id v4 = [(BMIntelligencePlatformFeatureStore *)self labelValue];
  id v5 = [(BMIntelligencePlatformFeatureStore *)self taskName];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformFeatureStore category](self, "category"));
  uint64_t v7 = [(BMIntelligencePlatformFeatureStore *)self featureVector];
  v8 = [v7 jsonDictionary];

  int v18 = @"labelName";
  uint64_t v9 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v16 = v9;
  v23[0] = v9;
  v19 = @"labelValue";
  v10 = v4;
  if (!v4)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9, v18, v19);
  }
  v23[1] = v10;
  uint64_t v20 = @"taskName";
  int v11 = v5;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[2] = v11;
  v21 = @"category";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v12;
  v22 = @"featureVector";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v13;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v18, 5, v16);
  if (v8)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4) {
      goto LABEL_15;
    }
LABEL_22:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v4) {
    goto LABEL_22;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v14;
}

- (BMIntelligencePlatformFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"labelName"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"labelValue"];
    v36 = a4;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v39 = 0;
LABEL_7:
      v10 = [v6 objectForKeyedSubscript:@"taskName"];
      id v37 = v8;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v38 = 0;
            v17 = 0;
            goto LABEL_49;
          }
          id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v21 = *MEMORY[0x1E4F502C8];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          char v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskName"];
          v46 = v12;
          int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          id v38 = 0;
          v17 = 0;
          id *v36 = (id)[v20 initWithDomain:v21 code:2 userInfo:v11];
          goto LABEL_48;
        }
        id v38 = v10;
      }
      else
      {
        id v38 = 0;
      }
      int v11 = [v6 objectForKeyedSubscript:@"category"];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v11;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              char v12 = 0;
              v17 = 0;
              goto LABEL_48;
            }
            id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
            v35 = self;
            uint64_t v28 = *MEMORY[0x1E4F502C8];
            uint64_t v43 = *MEMORY[0x1E4F28568];
            v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"category"];
            v44 = v22;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
            uint64_t v29 = v28;
            self = v35;
            char v12 = 0;
            v17 = 0;
            id *v36 = (id)[v33 initWithDomain:v29 code:2 userInfo:v23];
            goto LABEL_46;
          }
          id v13 = [NSNumber numberWithInt:BMIntelligencePlatformFeatureStoreCategoryTypeFromString(v11)];
        }
        char v12 = v13;
      }
      else
      {
        char v12 = 0;
      }
      v22 = [v6 objectForKeyedSubscript:@"featureVector"];
      if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = 0;
LABEL_33:
        self = -[BMIntelligencePlatformFeatureStore initWithLabelName:labelValue:taskName:category:featureVector:](self, "initWithLabelName:labelValue:taskName:category:featureVector:", v37, v39, v38, [v12 intValue], v23);
        v17 = self;
LABEL_46:

LABEL_47:
LABEL_48:

        id v8 = v37;
        goto LABEL_49;
      }
      v34 = self;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v22;
        id v40 = 0;
        v23 = [[BMIntelligencePlatformFeatureStoreFeatureVector alloc] initWithJSONDictionary:v24 error:&v40];
        id v25 = v40;
        if (!v25)
        {

          self = v34;
          goto LABEL_33;
        }
        v26 = v25;
        if (v36) {
          id *v36 = v25;
        }

        v17 = 0;
        v22 = v24;
      }
      else
      {
        if (!v36)
        {
          v17 = 0;
          goto LABEL_47;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v23 = (BMIntelligencePlatformFeatureStoreFeatureVector *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"featureVector"];
        v42 = v23;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id *v36 = (id)[v32 initWithDomain:v31 code:2 userInfo:v27];

        v17 = 0;
      }
      self = v34;
      goto LABEL_46;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v39 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F502C8];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"labelValue"];
      id v48 = v38;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v39 = 0;
      v17 = 0;
      id *v36 = (id)[v18 initWithDomain:v19 code:2 userInfo:v10];
LABEL_49:

      goto LABEL_50;
    }
    id v39 = 0;
    v17 = 0;
LABEL_50:

    goto LABEL_51;
  }
  if (a4)
  {
    uint64_t v14 = a4;
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F502C8];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"labelName"];
    v50[0] = v39;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v8 = 0;
    v17 = 0;
    *uint64_t v14 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
    goto LABEL_50;
  }
  id v8 = 0;
  v17 = 0;
LABEL_51:

  return v17;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformFeatureStore *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_labelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_labelValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskName) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_featureVector)
  {
    PBDataWriterPlaceMark();
    [(BMIntelligencePlatformFeatureStoreFeatureVector *)self->_featureVector writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMIntelligencePlatformFeatureStore;
  id v5 = [(BMEventBase *)&v34 init];
  if (!v5) {
    goto LABEL_45;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 24;
          goto LABEL_25;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_25;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
LABEL_25:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          break;
        case 5u:
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_44;
          }
          v30 = [[BMIntelligencePlatformFeatureStoreFeatureVector alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_44;
          }
          featureVector = v5->_featureVector;
          v5->_featureVector = v30;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_44;
          }
          continue;
      }
      while (1)
      {
        uint64_t v26 = *v6;
        uint64_t v27 = *(void *)&v4[v26];
        unint64_t v28 = v27 + 1;
        if (v27 == -1 || v28 > *(void *)&v4[*v7]) {
          break;
        }
        char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
        *(void *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0) {
          goto LABEL_37;
        }
        v23 += 7;
        BOOL v17 = v24++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8]) {
        LODWORD(v25) = 0;
      }
LABEL_39:
      if (v25 >= 3) {
        LODWORD(v25) = 0;
      }
      v5->_category = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_44:
  }
    id v32 = 0;
  else {
LABEL_45:
  }
    id v32 = v5;

  return v32;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligencePlatformFeatureStore *)self labelName];
  id v5 = [(BMIntelligencePlatformFeatureStore *)self labelValue];
  id v6 = [(BMIntelligencePlatformFeatureStore *)self taskName];
  uint64_t v7 = BMIntelligencePlatformFeatureStoreCategoryTypeAsString([(BMIntelligencePlatformFeatureStore *)self category]);
  id v8 = [(BMIntelligencePlatformFeatureStore *)self featureVector];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformFeatureStore with labelName: %@, labelValue: %@, taskName: %@, category: %@, featureVector: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMIntelligencePlatformFeatureStore)initWithLabelName:(id)a3 labelValue:(id)a4 taskName:(id)a5 category:(int)a6 featureVector:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMIntelligencePlatformFeatureStore;
  BOOL v17 = [(BMEventBase *)&v19 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_labelName, a3);
    objc_storeStrong((id *)&v17->_labelValue, a4);
    objc_storeStrong((id *)&v17->_taskName, a5);
    v17->_category = a6;
    objc_storeStrong((id *)&v17->_featureVector, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"labelName" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"labelValue", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskName" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureVector" number:5 type:14 subMessageClass:objc_opt_class()];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF39D8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"labelName" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"labelValue" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskName" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"featureVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_387];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __45__BMIntelligencePlatformFeatureStore_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 featureVector];
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

    id v8 = [[BMIntelligencePlatformFeatureStore alloc] initByReadFrom:v7];
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