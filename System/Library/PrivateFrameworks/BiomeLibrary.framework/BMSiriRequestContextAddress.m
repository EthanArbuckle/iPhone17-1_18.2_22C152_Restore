@interface BMSiriRequestContextAddress
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestContextAddress)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriRequestContextAddress)initWithLabel:(id)a3 street:(id)a4 city:(id)a5 state:(id)a6 postalCode:(id)a7 countryCode:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)city;
- (NSString)countryCode;
- (NSString)description;
- (NSString)label;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestContextAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)label
{
  return self->_label;
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
    v6 = [(BMSiriRequestContextAddress *)self label];
    uint64_t v7 = [v5 label];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRequestContextAddress *)self label];
      v10 = [v5 label];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMSiriRequestContextAddress *)self street];
    uint64_t v14 = [v5 street];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriRequestContextAddress *)self street];
      v17 = [v5 street];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMSiriRequestContextAddress *)self city];
    uint64_t v20 = [v5 city];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriRequestContextAddress *)self city];
      v23 = [v5 city];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    v25 = [(BMSiriRequestContextAddress *)self state];
    uint64_t v26 = [v5 state];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriRequestContextAddress *)self state];
      v29 = [v5 state];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_21;
      }
    }
    v31 = [(BMSiriRequestContextAddress *)self postalCode];
    uint64_t v32 = [v5 postalCode];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSiriRequestContextAddress *)self postalCode];
      v35 = [v5 postalCode];
      int v36 = [v34 isEqual:v35];

      if (!v36)
      {
LABEL_21:
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v38 = [(BMSiriRequestContextAddress *)self countryCode];
    v39 = [v5 countryCode];
    if (v38 == v39)
    {
      char v12 = 1;
    }
    else
    {
      v40 = [(BMSiriRequestContextAddress *)self countryCode];
      v41 = [v5 countryCode];
      char v12 = [v40 isEqual:v41];
    }
    goto LABEL_22;
  }
  char v12 = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriRequestContextAddress *)self label];
  id v4 = [(BMSiriRequestContextAddress *)self street];
  id v5 = [(BMSiriRequestContextAddress *)self city];
  v6 = [(BMSiriRequestContextAddress *)self state];
  uint64_t v7 = [(BMSiriRequestContextAddress *)self postalCode];
  v8 = [(BMSiriRequestContextAddress *)self countryCode];
  v21[0] = @"label";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"street";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"city";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  uint64_t v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"state";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"postalCode";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"countryCode";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_15;
    }
LABEL_23:

    if (v6) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  if (!v7) {
    goto LABEL_23;
  }
LABEL_15:
  if (v6) {
    goto LABEL_16;
  }
LABEL_24:

LABEL_16:
  if (v5)
  {
    if (v4) {
      goto LABEL_18;
    }
LABEL_26:

    if (v20) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v4) {
    goto LABEL_26;
  }
LABEL_18:
  if (v20) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v15;
}

- (BMSiriRequestContextAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"label"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"street"];
    v49 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v17 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        id v23 = v8;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        v25 = a4;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v27 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"street"];
        v62 = v27;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v28 = v24;
        id v8 = v23;
        uint64_t v29 = v26;
        a4 = v27;
        v16 = 0;
        uint64_t v17 = 0;
        id *v25 = (id)[v28 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_24;
      }
      id v51 = v9;
    }
    else
    {
      id v51 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"city"];
    v52 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          uint64_t v17 = v51;
          goto LABEL_24;
        }
        id v30 = v8;
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = a4;
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        id v50 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"city"];
        id v60 = v50;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        v34 = v31;
        id v8 = v30;
        id v35 = (id)[v34 initWithDomain:v33 code:2 userInfo:v11];
        v16 = 0;
        a4 = 0;
        *uint64_t v32 = v35;
        goto LABEL_22;
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"state"];
    id v48 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v50 = 0;
          v16 = 0;
          uint64_t v17 = v51;
          a4 = v47;
          goto LABEL_23;
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"state"];
        id v58 = v13;
        char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        id v38 = (id)[v36 initWithDomain:v37 code:2 userInfo:v12];
        v16 = 0;
        id v50 = 0;
        *a4 = v38;
        goto LABEL_57;
      }
      id v50 = v11;
    }
    else
    {
      id v50 = 0;
    }
    char v12 = [v6 objectForKeyedSubscript:@"postalCode"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
LABEL_16:
      uint64_t v14 = [v6 objectForKeyedSubscript:@"countryCode"];
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v44 = *MEMORY[0x1E4F502C8];
            uint64_t v53 = *MEMORY[0x1E4F28568];
            v42 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
            v54 = v42;
            v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            *a4 = (id)[v46 initWithDomain:v44 code:2 userInfo:v43];
          }
          id v15 = 0;
          v16 = 0;
          a4 = v47;
          goto LABEL_20;
        }
        id v15 = v14;
      }
      else
      {
        id v15 = 0;
      }
      a4 = v47;
      v16 = [(BMSiriRequestContextAddress *)v52 initWithLabel:v48 street:v51 city:v47 state:v50 postalCode:v13 countryCode:v15];
      v52 = v16;
LABEL_20:

LABEL_21:
      id v8 = v48;
LABEL_22:
      uint64_t v17 = v51;
LABEL_23:

      self = v52;
LABEL_24:

      uint64_t v7 = v49;
      goto LABEL_25;
    }
    if (a4)
    {
      v45 = a4;
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"postalCode"];
      id v56 = v15;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id v41 = (id)[v39 initWithDomain:v40 code:2 userInfo:v14];
      v16 = 0;
      id v13 = 0;
      a4 = v47;
      id *v45 = v41;
      goto LABEL_20;
    }
    id v13 = 0;
    v16 = 0;
LABEL_57:
    a4 = v47;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    id v8 = 0;
    goto LABEL_26;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = a4;
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v63 = *MEMORY[0x1E4F28568];
  uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"label"];
  v64[0] = v17;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
  id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v9];
  v16 = 0;
  id v8 = 0;
  *uint64_t v20 = v22;
LABEL_25:

LABEL_26:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriRequestContextAddress *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_postalCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMSiriRequestContextAddress;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_32;
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
          goto LABEL_28;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_28;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_28;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_28;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_28;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_28:
          id v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_31;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    id v23 = 0;
  else {
LABEL_32:
  }
    id v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriRequestContextAddress *)self label];
  id v5 = [(BMSiriRequestContextAddress *)self street];
  id v6 = [(BMSiriRequestContextAddress *)self city];
  uint64_t v7 = [(BMSiriRequestContextAddress *)self state];
  id v8 = [(BMSiriRequestContextAddress *)self postalCode];
  uint64_t v9 = [(BMSiriRequestContextAddress *)self countryCode];
  char v10 = (void *)[v3 initWithFormat:@"BMSiriRequestContextAddress with label: %@, street: %@, city: %@, state: %@, postalCode: %@, countryCode: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriRequestContextAddress)initWithLabel:(id)a3 street:(id)a4 city:(id)a5 state:(id)a6 postalCode:(id)a7 countryCode:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMSiriRequestContextAddress;
  int v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_label, a3);
    objc_storeStrong((id *)&v18->_street, a4);
    objc_storeStrong((id *)&v18->_city, a5);
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong((id *)&v18->_postalCode, a7);
    objc_storeStrong((id *)&v18->_countryCode, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"label" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"street" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"city" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"state" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"postalCode" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF51C0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"label" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"street" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"city" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"state" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"postalCode" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    id v8 = [[BMSiriRequestContextAddress alloc] initByReadFrom:v7];
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