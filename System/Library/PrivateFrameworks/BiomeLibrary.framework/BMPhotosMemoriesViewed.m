@interface BMPhotosMemoriesViewed
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPhotosMemoriesViewed)initWithIdentifier:(id)a3 viewedDurationBucket:(int)a4 watchedToEnd:(id)a5;
- (BMPhotosMemoriesViewed)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasWatchedToEnd;
- (BOOL)isEqual:(id)a3;
- (BOOL)watchedToEnd;
- (NSString)description;
- (NSString)identifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)viewedDurationBucket;
- (unsigned)dataVersion;
- (void)setHasWatchedToEnd:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPhotosMemoriesViewed

- (void).cxx_destruct
{
}

- (void)setHasWatchedToEnd:(BOOL)a3
{
  self->_hasWatchedToEnd = a3;
}

- (BOOL)hasWatchedToEnd
{
  return self->_hasWatchedToEnd;
}

- (BOOL)watchedToEnd
{
  return self->_watchedToEnd;
}

- (int)viewedDurationBucket
{
  return self->_viewedDurationBucket;
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
    v6 = [(BMPhotosMemoriesViewed *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPhotosMemoriesViewed *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    int v13 = [(BMPhotosMemoriesViewed *)self viewedDurationBucket];
    if (v13 == [v5 viewedDurationBucket])
    {
      if (![(BMPhotosMemoriesViewed *)self hasWatchedToEnd]
        && ![v5 hasWatchedToEnd])
      {
        LOBYTE(v12) = 1;
        goto LABEL_14;
      }
      if ([(BMPhotosMemoriesViewed *)self hasWatchedToEnd]
        && [v5 hasWatchedToEnd])
      {
        BOOL v14 = [(BMPhotosMemoriesViewed *)self watchedToEnd];
        int v12 = v14 ^ [v5 watchedToEnd] ^ 1;
LABEL_14:

        goto LABEL_15;
      }
    }
LABEL_13:
    LOBYTE(v12) = 0;
    goto LABEL_14;
  }
  LOBYTE(v12) = 0;
LABEL_15:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMPhotosMemoriesViewed *)self identifier];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosMemoriesViewed viewedDurationBucket](self, "viewedDurationBucket"));
  if ([(BMPhotosMemoriesViewed *)self hasWatchedToEnd])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoriesViewed watchedToEnd](self, "watchedToEnd"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"identifier";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"viewedDurationBucket";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"watchedToEnd";
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
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (BMPhotosMemoriesViewed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"viewedDurationBucket"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            BOOL v14 = 0;
            goto LABEL_21;
          }
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v20 = *MEMORY[0x1E4F502C8];
          uint64_t v27 = *MEMORY[0x1E4F28568];
          id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"viewedDurationBucket"];
          id v28 = v16;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          id v21 = (id)[v24 initWithDomain:v20 code:2 userInfo:v15];
          v10 = 0;
          BOOL v14 = 0;
          *a4 = v21;
          goto LABEL_20;
        }
        id v11 = [NSNumber numberWithInt:BMPhotosMemoriesViewedDurationFromString(v9)];
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"watchedToEnd"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"watchedToEnd"];
          v26 = v18;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v23 initWithDomain:v22 code:2 userInfo:v19];
        }
        id v16 = 0;
        BOOL v14 = 0;
        goto LABEL_20;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
    self = -[BMPhotosMemoriesViewed initWithIdentifier:viewedDurationBucket:watchedToEnd:](self, "initWithIdentifier:viewedDurationBucket:watchedToEnd:", v8, [v10 intValue], v16);
    BOOL v14 = self;
LABEL_20:

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
    id v8 = 0;
    BOOL v14 = 0;
    goto LABEL_22;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v8 = 0;
  BOOL v14 = 0;
  *a4 = (id)[v12 initWithDomain:v13 code:2 userInfo:v9];
LABEL_21:

LABEL_22:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPhotosMemoriesViewed *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasWatchedToEnd) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMPhotosMemoriesViewed;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_52;
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
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v26;
      }
      else if (v19 == 3)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        v5->_hasWatchedToEnd = 1;
        while (1)
        {
          uint64_t v31 = *v6;
          unint64_t v32 = *(void *)&v4[v31];
          if (v32 == -1 || v32 >= *(void *)&v4[*v7]) {
            break;
          }
          char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
          *(void *)&v4[v31] = v32 + 1;
          v30 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0) {
            goto LABEL_46;
          }
          v28 += 7;
          BOOL v16 = v29++ >= 9;
          if (v16)
          {
            uint64_t v30 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8]) {
          uint64_t v30 = 0;
        }
LABEL_48:
        v5->_watchedToEnd = v30 != 0;
      }
      else if (v19 == 2)
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
            goto LABEL_40;
          }
          v20 += 7;
          BOOL v16 = v21++ >= 9;
          if (v16)
          {
            LODWORD(v22) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8]) {
          LODWORD(v22) = 0;
        }
LABEL_42:
        if (v22 >= 4) {
          LODWORD(v22) = 0;
        }
        v5->_viewedDurationBucket = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    v34 = 0;
  else {
LABEL_52:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPhotosMemoriesViewed *)self identifier];
  id v5 = BMPhotosMemoriesViewedDurationAsString([(BMPhotosMemoriesViewed *)self viewedDurationBucket]);
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosMemoriesViewed watchedToEnd](self, "watchedToEnd"));
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMPhotosMemoriesViewed with identifier: %@, viewedDurationBucket: %@, watchedToEnd: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMPhotosMemoriesViewed)initWithIdentifier:(id)a3 viewedDurationBucket:(int)a4 watchedToEnd:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMPhotosMemoriesViewed;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v11->_identifier, a3);
    v11->_viewedDurationBucket = a4;
    if (v10)
    {
      v11->_hasWatchedToEnd = 1;
      v11->_watchedToEnd = [v10 BOOLValue];
    }
    else
    {
      v11->_hasWatchedToEnd = 0;
      v11->_watchedToEnd = 0;
    }
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"viewedDurationBucket", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"watchedToEnd" number:3 type:12 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF74A0;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewedDurationBucket" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"watchedToEnd" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
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

    id v8 = [[BMPhotosMemoriesViewed alloc] initByReadFrom:v7];
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

@end