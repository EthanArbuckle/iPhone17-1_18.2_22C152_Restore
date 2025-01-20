@interface BMMediaRenderedMediaAttributes
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMediaRenderedMediaAttributes)initWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)UUID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaRenderedMediaAttributes

- (BMMediaRenderedMediaAttributes)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMMediaRenderedMediaAttributes;
  v6 = [(BMEventBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v7;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(BMMediaRenderedMediaAttributes *)self UUID];
  id v5 = (void *)[v3 initWithFormat:@"BMMediaRenderedMediaAttributes with UUID: %@", v4];

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMMediaRenderedMediaAttributes;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_25;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    objc_super v9 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v20 = PBReaderReadString();
        UUID = v5->_UUID;
        v5->_UUID = (NSString *)v20;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_24;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_24:
  }
    v22 = 0;
  else {
LABEL_25:
  }
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  if (self->_UUID) {
    PBDataWriterWriteStringField();
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v4 = [[BMMediaRenderedMediaAttributes alloc] initByReadFrom:v7];
  }

  return v4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMMediaRenderedMediaAttributes *)self writeTo:v3];
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
    id v6 = [(BMMediaRenderedMediaAttributes *)self UUID];
    v7 = [v5 UUID];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMMediaRenderedMediaAttributes *)self UUID];
      objc_super v9 = [v5 UUID];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
}

@end