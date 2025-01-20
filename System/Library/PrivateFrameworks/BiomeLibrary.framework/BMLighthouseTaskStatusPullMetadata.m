@interface BMLighthouseTaskStatusPullMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseTaskStatusPullMetadata)initWithCreationDate:(id)a3;
- (BMLighthouseTaskStatusPullMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseTaskStatusPullMetadata

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
    v6 = [(BMLighthouseTaskStatusPullMetadata *)self creationDate];
    v7 = [v5 creationDate];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMLighthouseTaskStatusPullMetadata *)self creationDate];
      v9 = [v5 creationDate];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSDate)creationDate
{
  if (self->_hasRaw_creationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_creationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMLighthouseTaskStatusPullMetadata *)self creationDate];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = NSNumber;
    v6 = [(BMLighthouseTaskStatusPullMetadata *)self creationDate];
    [v6 timeIntervalSince1970];
    v7 = objc_msgSend(v5, "numberWithDouble:");

    v12 = @"creationDate";
    if (v7)
    {
      int v8 = 0;
      v9 = v7;
      goto LABEL_6;
    }
  }
  else
  {
    v12 = @"creationDate";
  }
  v9 = [MEMORY[0x1E4F1CA98] null];
  v7 = 0;
  int v8 = 1;
LABEL_6:
  v13[0] = v9;
  char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  if (v8) {

  }
  return v10;
}

- (BMLighthouseTaskStatusPullMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:@"creationDate"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_9:
    self = [(BMLighthouseTaskStatusPullMetadata *)self initWithCreationDate:a4];
    v14 = self;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v8 = v6;
    id v9 = [v7 alloc];
    [v8 doubleValue];
    double v11 = v10;

    v12 = (id *)[v9 initWithTimeIntervalSince1970:v11];
LABEL_6:
    a4 = v12;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    a4 = [v13 dateFromString:v6];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = v6;
    goto LABEL_6;
  }
  if (a4)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F502C8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"creationDate"];
    v21[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];

    a4 = 0;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMLighthouseTaskStatusPullMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_hasRaw_creationDate) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMLighthouseTaskStatusPullMetadata;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_30;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 1)
      {
        v5->_hasRaw_creationDate = 1;
        uint64_t v20 = *v6;
        unint64_t v21 = *(void *)&v4[v20];
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
        {
          double v22 = *(double *)(*(void *)&v4[*v9] + v21);
          *(void *)&v4[v20] = v21 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v22 = 0.0;
        }
        v5->_raw_creationDate = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_29;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_29:
  }
    v23 = 0;
  else {
LABEL_30:
  }
    v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseTaskStatusPullMetadata *)self creationDate];
  id v5 = (void *)[v3 initWithFormat:@"BMLighthouseTaskStatusPullMetadata with creationDate: %@", v4];

  return (NSString *)v5;
}

- (BMLighthouseTaskStatusPullMetadata)initWithCreationDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMLighthouseTaskStatusPullMetadata;
  id v5 = [(BMEventBase *)&v8 init];
  if (v5)
  {
    v5->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v4)
    {
      v5->_hasRaw_creationDate = 1;
      [v4 timeIntervalSince1970];
    }
    else
    {
      v5->_hasRaw_creationDate = 0;
      double v6 = -1.0;
    }
    v5->_raw_creationDate = v6;
  }

  return v5;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"creationDate" number:1 type:0 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF60D8;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"creationDate" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
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

    objc_super v8 = [[BMLighthouseTaskStatusPullMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end