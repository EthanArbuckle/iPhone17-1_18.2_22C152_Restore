@interface BMProactiveHarvestingContentAttachment
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingContentAttachment)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingContentAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)filename;
- (NSString)path;
- (NSString)type;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingContentAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (NSString)path
{
  return self->_path;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)type
{
  return self->_type;
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
    v6 = [(BMProactiveHarvestingContentAttachment *)self type];
    uint64_t v7 = [v5 type];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingContentAttachment *)self type];
      v10 = [v5 type];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMProactiveHarvestingContentAttachment *)self filename];
    uint64_t v14 = [v5 filename];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingContentAttachment *)self filename];
      v17 = [v5 filename];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMProactiveHarvestingContentAttachment *)self path];
    v20 = [v5 path];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMProactiveHarvestingContentAttachment *)self path];
      v22 = [v5 path];
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
  v3 = [(BMProactiveHarvestingContentAttachment *)self type];
  id v4 = [(BMProactiveHarvestingContentAttachment *)self filename];
  id v5 = [(BMProactiveHarvestingContentAttachment *)self path];
  v11[0] = @"type";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"filename";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"path";
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

- (BMProactiveHarvestingContentAttachment)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"filename"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"filename"];
        id v28 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"path"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"path"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMProactiveHarvestingContentAttachment *)self initWithType:v8 filename:v10 path:v12];
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"type"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingContentAttachment *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_filename)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMProactiveHarvestingContentAttachment;
  id v5 = [(BMEventBase *)&v25 init];
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 40;
      }
      else if (v19 == 2)
      {
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 32;
      }
      else
      {
        if (v19 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_29;
          }
          continue;
        }
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 24;
      }
      uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
      *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;
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
  id v4 = [(BMProactiveHarvestingContentAttachment *)self type];
  id v5 = [(BMProactiveHarvestingContentAttachment *)self filename];
  id v6 = [(BMProactiveHarvestingContentAttachment *)self path];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingContentAttachment with type: %@, filename: %@, path: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMProactiveHarvestingContentAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMProactiveHarvestingContentAttachment;
  unint64_t v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v12->_filename, a4);
    objc_storeStrong((id *)&v12->_path, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"filename", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"path" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5C40;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"filename" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"path" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingContentAttachment alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      void v7[4] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end