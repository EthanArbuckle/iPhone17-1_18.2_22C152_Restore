@interface BMTextUnderstandingPoemEntityPerson
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextUnderstandingPoemEntityPerson)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextUnderstandingPoemEntityPerson)initWithName:(id)a3 contactHandle:(id)a4 visualIdentifier:(id)a5 mdIdentifier:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)contactHandle;
- (NSString)description;
- (NSString)mdIdentifier;
- (NSString)name;
- (NSString)visualIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMTextUnderstandingPoemEntityPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdIdentifier, 0);
  objc_storeStrong((id *)&self->_visualIdentifier, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)mdIdentifier
{
  return self->_mdIdentifier;
}

- (NSString)visualIdentifier
{
  return self->_visualIdentifier;
}

- (NSString)contactHandle
{
  return self->_contactHandle;
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
    v6 = [(BMTextUnderstandingPoemEntityPerson *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTextUnderstandingPoemEntityPerson *)self name];
      v10 = [v5 name];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMTextUnderstandingPoemEntityPerson *)self contactHandle];
    uint64_t v14 = [v5 contactHandle];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMTextUnderstandingPoemEntityPerson *)self contactHandle];
      v17 = [v5 contactHandle];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMTextUnderstandingPoemEntityPerson *)self visualIdentifier];
    uint64_t v20 = [v5 visualIdentifier];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMTextUnderstandingPoemEntityPerson *)self visualIdentifier];
      v23 = [v5 visualIdentifier];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMTextUnderstandingPoemEntityPerson *)self mdIdentifier];
    v26 = [v5 mdIdentifier];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMTextUnderstandingPoemEntityPerson *)self mdIdentifier];
      v28 = [v5 mdIdentifier];
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
  v3 = [(BMTextUnderstandingPoemEntityPerson *)self name];
  id v4 = [(BMTextUnderstandingPoemEntityPerson *)self contactHandle];
  id v5 = [(BMTextUnderstandingPoemEntityPerson *)self visualIdentifier];
  v6 = [(BMTextUnderstandingPoemEntityPerson *)self mdIdentifier];
  v13[0] = @"name";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"contactHandle";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"visualIdentifier";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"mdIdentifier";
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

- (BMTextUnderstandingPoemEntityPerson)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"contactHandle"];
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
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactHandle"];
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
    v10 = [v6 objectForKeyedSubscript:@"visualIdentifier"];
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
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"visualIdentifier"];
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
    v13 = [v6 objectForKeyedSubscript:@"mdIdentifier"];
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
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mdIdentifier"];
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
    v15 = [(BMTextUnderstandingPoemEntityPerson *)v11 initWithName:v8 contactHandle:v30 visualIdentifier:v12 mdIdentifier:v14];
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
  v19 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
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
  [(BMTextUnderstandingPoemEntityPerson *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contactHandle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_visualIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_mdIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMTextUnderstandingPoemEntityPerson;
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
          uint64_t v21 = 24;
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
          id v22 = *(Class *)((char *)&v5->super.super.isa + v21);
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
    uint64_t v23 = 0;
  else {
LABEL_30:
  }
    uint64_t v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMTextUnderstandingPoemEntityPerson *)self name];
  id v5 = [(BMTextUnderstandingPoemEntityPerson *)self contactHandle];
  id v6 = [(BMTextUnderstandingPoemEntityPerson *)self visualIdentifier];
  uint64_t v7 = [(BMTextUnderstandingPoemEntityPerson *)self mdIdentifier];
  id v8 = (void *)[v3 initWithFormat:@"BMTextUnderstandingPoemEntityPerson with name: %@, contactHandle: %@, visualIdentifier: %@, mdIdentifier: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMTextUnderstandingPoemEntityPerson)initWithName:(id)a3 contactHandle:(id)a4 visualIdentifier:(id)a5 mdIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMTextUnderstandingPoemEntityPerson;
  unint64_t v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v15->_contactHandle, a4);
    objc_storeStrong((id *)&v15->_visualIdentifier, a5);
    objc_storeStrong((id *)&v15->_mdIdentifier, a6);
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactHandle" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualIdentifier" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mdIdentifier" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF42C0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactHandle" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visualIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mdIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMTextUnderstandingPoemEntityPerson alloc] initByReadFrom:v7];
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