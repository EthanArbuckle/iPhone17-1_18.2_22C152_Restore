@interface BMOasisAnalyticsUUID128
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsUUID128)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMOasisAnalyticsUUID128)initWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)value;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsUUID128

- (void).cxx_destruct
{
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
    v6 = [(BMOasisAnalyticsUUID128 *)self value];
    v7 = [v5 value];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMOasisAnalyticsUUID128 *)self value];
      v9 = [v5 value];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSUUID)value
{
  raw_value = self->_raw_value;
  if (raw_value)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_value toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMOasisAnalyticsUUID128 *)self value];
  v3 = [v2 UUIDString];

  v7 = @"value";
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (!v3) {

  }
  return v5;
}

- (BMOasisAnalyticsUUID128)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:@"value"];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v6;
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
        if (v10)
        {
          v7 = (void *)v10;

          goto LABEL_4;
        }
        if (p_isa)
        {
          id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v16 = *MEMORY[0x1E4F502C8];
          uint64_t v21 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"value"];
          v22[0] = v17;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
          *p_isa = (id)[v15 initWithDomain:v16 code:2 userInfo:v18];
        }
      }
      else
      {
        if (!p_isa) {
          goto LABEL_5;
        }
        id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v12 = *MEMORY[0x1E4F502C8];
        uint64_t v19 = *MEMORY[0x1E4F28568];
        v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"value"];
        v20 = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        *p_isa = (id)[v11 initWithDomain:v12 code:2 userInfo:v14];
      }
      p_isa = 0;
      goto LABEL_5;
    }
  }
  v7 = 0;
LABEL_4:
  self = [(BMOasisAnalyticsUUID128 *)self initWithValue:v7];

  p_isa = (id *)&self->super.super.isa;
LABEL_5:

  return (BMOasisAnalyticsUUID128 *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsUUID128 *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_raw_value) {
    PBDataWriterWriteDataField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMOasisAnalyticsUUID128;
  id v5 = [(BMEventBase *)&v23 init];
  if (!v5) {
    goto LABEL_26;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v19 length] != 16)
        {

          goto LABEL_25;
        }
        raw_value = v5->_raw_value;
        v5->_raw_value = v19;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_25;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_25:
  }
    uint64_t v21 = 0;
  else {
LABEL_26:
  }
    uint64_t v21 = v5;

  return v21;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMOasisAnalyticsUUID128 *)self value];
  id v5 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsUUID128 with value: %@", v4];

  return (NSString *)v5;
}

- (BMOasisAnalyticsUUID128)initWithValue:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMOasisAnalyticsUUID128;
  id v5 = [(BMEventBase *)&v9 init];
  if (v5)
  {
    v5->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v4)
    {
      v10[0] = 0;
      v10[1] = 0;
      [v4 getUUIDBytes:v10];
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v10 length:16];
      raw_value = v5->_raw_value;
      v5->_raw_value = (NSData *)v6;
    }
    else
    {
      raw_value = v5->_raw_value;
      v5->_raw_value = 0;
    }
  }
  return v5;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value" number:1 type:14 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7758;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"value" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
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

    v8 = [[BMOasisAnalyticsUUID128 alloc] initByReadFrom:v7];
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