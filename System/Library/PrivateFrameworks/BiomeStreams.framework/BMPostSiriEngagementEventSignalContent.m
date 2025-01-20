@interface BMPostSiriEngagementEventSignalContent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPostSiriEngagementEventSignalContent)initWithKey:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)key;
- (NSString)value;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPostSiriEngagementEventSignalContent

- (BMPostSiriEngagementEventSignalContent)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMPostSiriEngagementEventSignalContent;
  v9 = [(BMEventBase *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(BMPostSiriEngagementEventSignalContent *)self key];
  v5 = [(BMPostSiriEngagementEventSignalContent *)self value];
  v6 = (void *)[v3 initWithFormat:@"BMPostSiriEngagementEventSignalContent with key: %@, value: %@", v4, v5];

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMPostSiriEngagementEventSignalContent;
  v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_28;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v12 >> 3) == 2)
      {
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 24;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_27;
          }
          continue;
        }
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 16;
      }
      v22 = *(Class *)((char *)&v5->super.super.isa + v21);
      *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_27:
  }
    v23 = 0;
  else {
LABEL_28:
  }
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (unsigned)dataVersion
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v4 = [[BMPostSiriEngagementEventSignalContent alloc] initByReadFrom:v7];
  }

  return v4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMPostSiriEngagementEventSignalContent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMPostSiriEngagementEventSignalContent *)self key];
    id v7 = [v5 key];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      id v8 = [(BMPostSiriEngagementEventSignalContent *)self key];
      v9 = [v5 key];
      char v10 = [v8 isEqual:v9];
    }
    unint64_t v12 = [(BMPostSiriEngagementEventSignalContent *)self value];
    uint64_t v13 = [v5 value];
    if (v12 == v13)
    {
      char v16 = 1;
    }
    else
    {
      uint64_t v14 = [(BMPostSiriEngagementEventSignalContent *)self value];
      unint64_t v15 = [v5 value];
      char v16 = [v14 isEqual:v15];
    }
    char v11 = v10 & v16;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end