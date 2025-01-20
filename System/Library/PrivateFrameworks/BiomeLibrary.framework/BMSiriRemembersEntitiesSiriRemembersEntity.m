@interface BMSiriRemembersEntitiesSiriRemembersEntity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 entityFields:(id)a5;
- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 entityFields:(id)a5 fields:(id)a6 fieldsTokens:(id)a7;
- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 fields:(id)a5 fieldsTokens:(id)a6;
- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)entityFields;
- (NSString)description;
- (NSString)fields;
- (NSString)fieldsTokens;
- (NSString)identifier;
- (NSString)type;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRemembersEntitiesSiriRemembersEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityFields, 0);
  objc_storeStrong((id *)&self->_fieldsTokens, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)entityFields
{
  return self->_entityFields;
}

- (NSString)fieldsTokens
{
  return self->_fieldsTokens;
}

- (NSString)fields
{
  return self->_fields;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self type];
    uint64_t v14 = [v5 type];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self type];
      v17 = [v5 type];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fields];
    uint64_t v20 = [v5 fields];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fields];
      v23 = [v5 fields];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fieldsTokens];
    v26 = [v5 fieldsTokens];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fieldsTokens];
      v28 = [v5 fieldsTokens];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self identifier];
  id v4 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self type];
  id v5 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fields];
  v6 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fieldsTokens];
  v13[0] = @"identifier";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"type";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"fields";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"fieldsTokens";
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
      goto LABEL_11;
    }
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4) {
        goto LABEL_12;
      }
LABEL_18:

      if (v3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"type"];
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_16;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"type"];
        id v37 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v15 = 0;
        *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"fields"];
    int v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fields"];
        id v35 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
        id v12 = 0;
        a4 = v30;
        id *v28 = v24;
        goto LABEL_14;
      }
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"fieldsTokens"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fieldsTokens"];
          v33 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v29 initWithDomain:v27 code:2 userInfo:v26];
        }
        id v14 = 0;
        v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    a4 = v30;
    v15 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)v11 initWithIdentifier:v8 type:v30 fields:v12 fieldsTokens:v14];
    int v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    uint64_t v7 = v31;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v19 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v39[0] = v19;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v15 = 0;
  id v8 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriRemembersEntitiesSiriRemembersEntity *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fields)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fieldsTokens)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriRemembersEntitiesSiriRemembersEntity;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_30;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 24;
          goto LABEL_26;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_26;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_26;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
LABEL_26:
          uint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_29;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_29:
  }
    id v22 = 0;
  else {
LABEL_30:
  }
    id v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self identifier];
  id v5 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self type];
  id v6 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fields];
  uint64_t v7 = [(BMSiriRemembersEntitiesSiriRemembersEntity *)self fieldsTokens];
  id v8 = (void *)[v3 initWithFormat:@"BMSiriRemembersEntitiesSiriRemembersEntity with identifier: %@, type: %@, fields: %@, fieldsTokens: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 fields:(id)a5 fieldsTokens:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriRemembersEntitiesSiriRemembersEntity;
  char v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v15->_type, a4);
    objc_storeStrong((id *)&v15->_fields, a5);
    objc_storeStrong((id *)&v15->_fieldsTokens, a6);
  }

  return v15;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"type", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entityFields" number:3 type:14 subMessageClass:objc_opt_class()];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fields" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fieldsTokens" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4338;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"entityFields_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_23351];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fields" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fieldsTokens" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

uint64_t __53__BMSiriRemembersEntitiesSiriRemembersEntity_columns__block_invoke()
{
  return 0;
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

    id v8 = [[BMSiriRemembersEntitiesSiriRemembersEntity alloc] initByReadFrom:v7];
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

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 entityFields:(id)a5 fields:(id)a6 fieldsTokens:(id)a7
{
  return [(BMSiriRemembersEntitiesSiriRemembersEntity *)self initWithIdentifier:a3 type:a4 fields:a6 fieldsTokens:a7];
}

- (BMSiriRemembersEntitiesSiriRemembersEntity)initWithIdentifier:(id)a3 type:(id)a4 entityFields:(id)a5
{
  return [(BMSiriRemembersEntitiesSiriRemembersEntity *)self initWithIdentifier:a3 type:a4 entityFields:a5 fields:0 fieldsTokens:0];
}

@end