@interface BMPlaceInferenceMapItem
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPlaceInferenceMapItem)initWithIdentifier:(id)a3 name:(id)a4 address:(id)a5 category:(id)a6;
- (BMPlaceInferenceMapItem)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)address;
- (NSString)category;
- (NSString)description;
- (NSString)name;
- (NSUUID)identifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPlaceInferenceMapItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_raw_identifier, 0);
}

- (NSString)category
{
  return self->_category;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)name
{
  return self->_name;
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
    v6 = [(BMPlaceInferenceMapItem *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPlaceInferenceMapItem *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMPlaceInferenceMapItem *)self name];
    uint64_t v14 = [v5 name];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPlaceInferenceMapItem *)self name];
      v17 = [v5 name];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMPlaceInferenceMapItem *)self address];
    uint64_t v20 = [v5 address];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMPlaceInferenceMapItem *)self address];
      v23 = [v5 address];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMPlaceInferenceMapItem *)self category];
    v26 = [v5 category];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMPlaceInferenceMapItem *)self category];
      v28 = [v5 category];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (NSUUID)identifier
{
  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_identifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMPlaceInferenceMapItem *)self identifier];
  id v4 = [v3 UUIDString];

  id v5 = [(BMPlaceInferenceMapItem *)self name];
  v6 = [(BMPlaceInferenceMapItem *)self address];
  uint64_t v7 = [(BMPlaceInferenceMapItem *)self category];
  v14[0] = @"identifier";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"name";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"address";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"category";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v6) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5) {
        goto LABEL_12;
      }
LABEL_18:

      if (v4) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v5) {
    goto LABEL_18;
  }
LABEL_12:
  if (v4) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (BMPlaceInferenceMapItem)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"name"];
    v37 = v6;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          uint64_t v14 = self;
          goto LABEL_35;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
        id v44 = v11;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        v15 = 0;
        *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
        a4 = 0;
        uint64_t v14 = self;
LABEL_34:

        v6 = v37;
LABEL_35:

        goto LABEL_36;
      }
      v36 = v8;
    }
    else
    {
      v36 = 0;
    }
    v9 = [v5 objectForKeyedSubscript:@"address"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v15 = 0;
          uint64_t v14 = self;
          a4 = v36;
          goto LABEL_34;
        }
        id v10 = v7;
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v24 = a4;
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"address"];
        id v42 = v13;
        char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v26 = (id)[v23 initWithDomain:v25 code:2 userInfo:v12];
        v15 = 0;
        id v11 = 0;
        *int v24 = v26;
        uint64_t v14 = self;
        goto LABEL_32;
      }
      id v10 = v7;
      id v11 = v9;
    }
    else
    {
      id v10 = v7;
      id v11 = 0;
    }
    char v12 = [v5 objectForKeyedSubscript:@"category"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = 0;
      uint64_t v14 = self;
LABEL_13:
      a4 = v36;
      uint64_t v14 = [(BMPlaceInferenceMapItem *)v14 initWithIdentifier:v10 name:v36 address:v11 category:v13];
      v15 = v14;
LABEL_33:

      id v7 = v10;
      goto LABEL_34;
    }
    objc_opt_class();
    uint64_t v14 = self;
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      goto LABEL_13;
    }
    if (a4)
    {
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"category"];
      v40 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      *a4 = (id)[v35 initWithDomain:v34 code:2 userInfo:v28];
    }
    id v13 = 0;
    v15 = 0;
LABEL_32:
    a4 = v36;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v15 = 0;
      uint64_t v14 = self;
      goto LABEL_38;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v7 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    id v46 = v7;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v15 = 0;
    *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v20];
    a4 = v20;
    uint64_t v14 = self;
    goto LABEL_36;
  }
  id v7 = v6;
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
  if (v16)
  {
    v17 = (void *)v16;

    id v7 = v17;
    goto LABEL_4;
  }
  uint64_t v14 = self;
  if (!a4)
  {
    v15 = 0;
    goto LABEL_37;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v31 = *MEMORY[0x1E4F502C8];
  uint64_t v47 = *MEMORY[0x1E4F28568];
  v32 = (id *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"identifier"];
  v48[0] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v33];
  a4 = v32;

  v15 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPlaceInferenceMapItem *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_raw_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_address)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMPlaceInferenceMapItem;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_30;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
          uint64_t v21 = 16;
          goto LABEL_26;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_26;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_26;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_26:
          uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

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
    id v23 = 0;
  else {
LABEL_30:
  }
    id v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPlaceInferenceMapItem *)self identifier];
  id v5 = [(BMPlaceInferenceMapItem *)self name];
  v6 = [(BMPlaceInferenceMapItem *)self address];
  id v7 = [(BMPlaceInferenceMapItem *)self category];
  v8 = (void *)[v3 initWithFormat:@"BMPlaceInferenceMapItem with identifier: %@, name: %@, address: %@, category: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMPlaceInferenceMapItem)initWithIdentifier:(id)a3 name:(id)a4 address:(id)a5 category:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMPlaceInferenceMapItem;
  uint64_t v14 = [(BMEventBase *)&v18 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      uint64_t v15 = [v10 UUIDString];
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = (NSString *)v15;
    }
    else
    {
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = 0;
    }

    objc_storeStrong((id *)&v14->_name, a4);
    objc_storeStrong((id *)&v14->_address, a5);
    objc_storeStrong((id *)&v14->_category, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"address" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF63F0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"address" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMPlaceInferenceMapItem alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end