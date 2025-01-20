@interface BMPhotosPicker
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPhotosPicker)initWithIdentifier:(id)a3 subset:(id)a4 type:(int)a5;
- (BMPhotosPicker)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)subset;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPhotosPicker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subset, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)type
{
  return self->_type;
}

- (NSString)subset
{
  return self->_subset;
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
    v6 = [(BMPhotosPicker *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPhotosPicker *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMPhotosPicker *)self subset];
    uint64_t v14 = [v5 subset];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPhotosPicker *)self subset];
      v17 = [v5 subset];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        BOOL v12 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    int v19 = [(BMPhotosPicker *)self type];
    BOOL v12 = v19 == [v5 type];
    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMPhotosPicker *)self identifier];
  id v4 = [(BMPhotosPicker *)self subset];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosPicker type](self, "type"));
  v11[0] = @"identifier";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"subset";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"type";
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

- (BMPhotosPicker)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"subset"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        BOOL v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subset"];
        v28 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v18 = (id)[v23 initWithDomain:v17 code:2 userInfo:v11];
        id v10 = 0;
        v16 = 0;
        *a4 = v18;
        goto LABEL_24;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"type"];
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
          if (a4)
          {
            id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v22 = *MEMORY[0x1E4F502C8];
            uint64_t v25 = *MEMORY[0x1E4F28568];
            v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
            v26 = v20;
            v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
          }
          BOOL v12 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        objc_msgSend(NSNumber, "numberWithInt:", bsearch_b(v11, BMPhotosPickerTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_18140) != 0);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v12 = v13;
    }
    else
    {
      BOOL v12 = 0;
    }
    self = -[BMPhotosPicker initWithIdentifier:subset:type:](self, "initWithIdentifier:subset:type:", v8, v10, [v12 intValue]);
    v16 = self;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    v16 = 0;
    goto LABEL_26;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v15 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v8 = 0;
  v16 = 0;
  *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v9];
LABEL_25:

LABEL_26:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPhotosPicker *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_subset) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMPhotosPicker;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_43;
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
        BOOL v16 = v11++ >= 9;
        if (v16)
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 24;
      }
      else
      {
        if (v19 != 2)
        {
          if (v19 == 3)
          {
            char v20 = 0;
            unsigned int v21 = 0;
            uint64_t v22 = 0;
            while (1)
            {
              uint64_t v23 = *v6;
              unint64_t v24 = *(void *)&v4[v23];
              if (v24 == -1 || v24 >= *(void *)&v4[*v7]) {
                break;
              }
              char v25 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if ((v25 & 0x80) == 0) {
                goto LABEL_35;
              }
              v20 += 7;
              BOOL v16 = v21++ >= 9;
              if (v16)
              {
                LODWORD(v22) = 0;
                goto LABEL_37;
              }
            }
            v4[*v8] = 1;
LABEL_35:
            if (v4[*v8]) {
              LODWORD(v22) = 0;
            }
LABEL_37:
            if (v22 >= 2) {
              LODWORD(v22) = 0;
            }
            v5->_type = v22;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_42;
          }
          continue;
        }
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 32;
      }
      v28 = *(Class *)((char *)&v5->super.super.isa + v27);
      *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_42:
  }
    uint64_t v29 = 0;
  else {
LABEL_43:
  }
    uint64_t v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPhotosPicker *)self identifier];
  id v5 = [(BMPhotosPicker *)self subset];
  id v6 = BMPhotosPickerTypeAsString([(BMPhotosPicker *)self type]);
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMPhotosPicker with identifier: %@, subset: %@, type: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMPhotosPicker)initWithIdentifier:(id)a3 subset:(id)a4 type:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMPhotosPicker;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v11->_subset, a4);
    v11->_type = a5;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"subset", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4038;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subset" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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

    id v8 = [[BMPhotosPicker alloc] initByReadFrom:v7];
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