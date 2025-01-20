@interface BMSiriRequestContextContentRestriction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestContextContentRestriction)initWithAppRestriction:(id)a3 countryCode:(id)a4 movieRestriction:(id)a5 tvRestriction:(id)a6;
- (BMSiriRequestContextContentRestriction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAppRestriction;
- (BOOL)hasMovieRestriction;
- (BOOL)hasTvRestriction;
- (BOOL)isEqual:(id)a3;
- (NSString)countryCode;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)appRestriction;
- (int)movieRestriction;
- (int)tvRestriction;
- (unsigned)dataVersion;
- (void)setHasAppRestriction:(BOOL)a3;
- (void)setHasMovieRestriction:(BOOL)a3;
- (void)setHasTvRestriction:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestContextContentRestriction

- (void).cxx_destruct
{
}

- (void)setHasTvRestriction:(BOOL)a3
{
  self->_hasTvRestriction = a3;
}

- (BOOL)hasTvRestriction
{
  return self->_hasTvRestriction;
}

- (int)tvRestriction
{
  return self->_tvRestriction;
}

- (void)setHasMovieRestriction:(BOOL)a3
{
  self->_hasMovieRestriction = a3;
}

- (BOOL)hasMovieRestriction
{
  return self->_hasMovieRestriction;
}

- (int)movieRestriction
{
  return self->_movieRestriction;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setHasAppRestriction:(BOOL)a3
{
  self->_hasAppRestriction = a3;
}

- (BOOL)hasAppRestriction
{
  return self->_hasAppRestriction;
}

- (int)appRestriction
{
  return self->_appRestriction;
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
    if ([(BMSiriRequestContextContentRestriction *)self hasAppRestriction]
      || [v5 hasAppRestriction])
    {
      if (![(BMSiriRequestContextContentRestriction *)self hasAppRestriction]) {
        goto LABEL_22;
      }
      if (![v5 hasAppRestriction]) {
        goto LABEL_22;
      }
      int v6 = [(BMSiriRequestContextContentRestriction *)self appRestriction];
      if (v6 != [v5 appRestriction]) {
        goto LABEL_22;
      }
    }
    v7 = [(BMSiriRequestContextContentRestriction *)self countryCode];
    uint64_t v8 = [v5 countryCode];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMSiriRequestContextContentRestriction *)self countryCode];
      v11 = [v5 countryCode];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_22;
      }
    }
    if (![(BMSiriRequestContextContentRestriction *)self hasMovieRestriction]
      && ![v5 hasMovieRestriction]
      || [(BMSiriRequestContextContentRestriction *)self hasMovieRestriction]
      && [v5 hasMovieRestriction]
      && (int v14 = [(BMSiriRequestContextContentRestriction *)self movieRestriction],
          v14 == [v5 movieRestriction]))
    {
      if (![(BMSiriRequestContextContentRestriction *)self hasTvRestriction]
        && ![v5 hasTvRestriction])
      {
        BOOL v13 = 1;
        goto LABEL_23;
      }
      if ([(BMSiriRequestContextContentRestriction *)self hasTvRestriction]
        && [v5 hasTvRestriction])
      {
        int v15 = [(BMSiriRequestContextContentRestriction *)self tvRestriction];
        BOOL v13 = v15 == [v5 tvRestriction];
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  BOOL v13 = 0;
LABEL_24:

  return v13;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriRequestContextContentRestriction *)self hasAppRestriction])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextContentRestriction appRestriction](self, "appRestriction"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMSiriRequestContextContentRestriction *)self countryCode];
  if ([(BMSiriRequestContextContentRestriction *)self hasMovieRestriction])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextContentRestriction movieRestriction](self, "movieRestriction"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriRequestContextContentRestriction *)self hasTvRestriction])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextContentRestriction tvRestriction](self, "tvRestriction"));
  }
  else
  {
    int v6 = 0;
  }
  v13[0] = @"appRestriction";
  v7 = v3;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"countryCode";
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"movieRestriction";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"tvRestriction";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v5)
    {
LABEL_20:
      if (v4) {
        goto LABEL_21;
      }
LABEL_27:

      if (v3) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }

  if (!v4) {
    goto LABEL_27;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_28:

LABEL_22:

  return v11;
}

- (BMSiriRequestContextContentRestriction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"appRestriction"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"countryCode"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          int v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
        id v38 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        int v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"movieRestriction"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          int v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"movieRestriction"];
        id v36 = v14;
        BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        int v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      id v12 = v10;
    }
    else
    {
      v11 = self;
      id v12 = 0;
    }
    BOOL v13 = [v6 objectForKeyedSubscript:@"tvRestriction"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      int v15 = [(BMSiriRequestContextContentRestriction *)v11 initWithAppRestriction:v8 countryCode:v31 movieRestriction:v12 tvRestriction:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tvRestriction"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    int v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    int v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"appRestriction"];
  v40[0] = v18;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  int v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriRequestContextContentRestriction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasAppRestriction)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasMovieRestriction)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasTvRestriction)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMSiriRequestContextContentRestriction;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_60;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasAppRestriction = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_45;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_47:
          uint64_t v41 = 24;
          goto LABEL_56;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          countryCode = v5->_countryCode;
          v5->_countryCode = (NSString *)v27;

          continue;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v22 = 0;
          v5->_hasMovieRestriction = 1;
          while (2)
          {
            uint64_t v31 = *v6;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v33;
              v22 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_51:
          uint64_t v41 = 28;
          goto LABEL_56;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v22 = 0;
          v5->_hasTvRestriction = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_59;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        uint64_t v38 = *(void *)&v4[v37];
        unint64_t v39 = v38 + 1;
        if (v38 == -1 || v39 > *(void *)&v4[*v7]) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v39;
        v22 |= (unint64_t)(v40 & 0x7F) << v35;
        if ((v40 & 0x80) == 0) {
          goto LABEL_53;
        }
        v35 += 7;
        BOOL v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_55;
        }
      }
      v4[*v8] = 1;
LABEL_53:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_55:
      uint64_t v41 = 32;
LABEL_56:
      *(_DWORD *)((char *)&v5->super.super.isa + v41) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_59:
  }
    v42 = 0;
  else {
LABEL_60:
  }
    v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextContentRestriction appRestriction](self, "appRestriction"));
  id v5 = [(BMSiriRequestContextContentRestriction *)self countryCode];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextContentRestriction movieRestriction](self, "movieRestriction"));
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextContentRestriction tvRestriction](self, "tvRestriction"));
  id v8 = (void *)[v3 initWithFormat:@"BMSiriRequestContextContentRestriction with appRestriction: %@, countryCode: %@, movieRestriction: %@, tvRestriction: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSiriRequestContextContentRestriction)initWithAppRestriction:(id)a3 countryCode:(id)a4 movieRestriction:(id)a5 tvRestriction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMSiriRequestContextContentRestriction;
  uint64_t v14 = [(BMEventBase *)&v19 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasAppRestriction = 1;
      int v15 = [v10 intValue];
    }
    else
    {
      v14->_hasAppRestriction = 0;
      int v15 = -1;
    }
    v14->_appRestriction = v15;
    objc_storeStrong((id *)&v14->_countryCode, a4);
    if (v12)
    {
      v14->_hasMovieRestriction = 1;
      int v16 = [v12 intValue];
    }
    else
    {
      v14->_hasMovieRestriction = 0;
      int v16 = -1;
    }
    v14->_movieRestriction = v16;
    if (v13)
    {
      v14->_hasTvRestriction = 1;
      int v17 = [v13 intValue];
    }
    else
    {
      v14->_hasTvRestriction = 0;
      int v17 = -1;
    }
    v14->_tvRestriction = v17;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appRestriction" number:1 type:2 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"movieRestriction" number:3 type:2 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tvRestriction" number:4 type:2 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5178;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appRestriction" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"movieRestriction" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tvRestriction" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriRequestContextContentRestriction alloc] initByReadFrom:v7];
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