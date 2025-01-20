@interface BMSiriSELFProcessedEventLogicalTimestamp
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriSELFProcessedEventLogicalTimestamp)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMSiriSELFProcessedEventLogicalTimestamp)initWithTimestampInNanoseconds:(id)a3 clockIdentifier:(id)a4;
- (BOOL)hasTimestampInNanoseconds;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)clockIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int64_t)timestampInNanoseconds;
- (unsigned)dataVersion;
- (void)setHasTimestampInNanoseconds:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriSELFProcessedEventLogicalTimestamp

- (void).cxx_destruct
{
}

- (void)setHasTimestampInNanoseconds:(BOOL)a3
{
  self->_hasTimestampInNanoseconds = a3;
}

- (BOOL)hasTimestampInNanoseconds
{
  return self->_hasTimestampInNanoseconds;
}

- (int64_t)timestampInNanoseconds
{
  return self->_timestampInNanoseconds;
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
    if (![(BMSiriSELFProcessedEventLogicalTimestamp *)self hasTimestampInNanoseconds]
      && ![v5 hasTimestampInNanoseconds]
      || [(BMSiriSELFProcessedEventLogicalTimestamp *)self hasTimestampInNanoseconds]
      && [v5 hasTimestampInNanoseconds]
      && (int64_t v6 = [(BMSiriSELFProcessedEventLogicalTimestamp *)self timestampInNanoseconds],
          v6 == [v5 timestampInNanoseconds]))
    {
      v7 = [(BMSiriSELFProcessedEventLogicalTimestamp *)self clockIdentifier];
      v8 = [v5 clockIdentifier];
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else
      {
        v9 = [(BMSiriSELFProcessedEventLogicalTimestamp *)self clockIdentifier];
        v10 = [v5 clockIdentifier];
        char v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSUUID)clockIdentifier
{
  raw_clockIdentifier = self->_raw_clockIdentifier;
  if (raw_clockIdentifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_clockIdentifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriSELFProcessedEventLogicalTimestamp *)self hasTimestampInNanoseconds])
  {
    v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriSELFProcessedEventLogicalTimestamp timestampInNanoseconds](self, "timestampInNanoseconds"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMSiriSELFProcessedEventLogicalTimestamp *)self clockIdentifier];
  id v5 = [v4 UUIDString];

  v10[0] = @"timestampInNanoseconds";
  int64_t v6 = v3;
  if (!v3)
  {
    int64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"clockIdentifier";
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v5)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v8;
}

- (BMSiriSELFProcessedEventLogicalTimestamp)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"timestampInNanoseconds"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        id v8 = 0;
        goto LABEL_9;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4F502C8];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timestampInNanoseconds"];
      v30[0] = v9;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      *p_isa = (id)[v14 initWithDomain:v15 code:2 userInfo:v16];

      p_isa = 0;
      id v8 = 0;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"clockIdentifier"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        v19 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clockIdentifier"];
        v26 = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        *p_isa = (id)[v17 initWithDomain:v18 code:2 userInfo:v20];

        p_isa = 0;
      }
      goto LABEL_8;
    }
    id v12 = v9;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
    if (!v13)
    {
      if (p_isa)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v23 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"clockIdentifier"];
        v28 = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        *p_isa = (id)[v21 initWithDomain:v22 code:2 userInfo:v24];
      }
      p_isa = 0;
      v9 = v12;
      goto LABEL_8;
    }
    v10 = (void *)v13;
  }
  else
  {
    v10 = 0;
  }
  self = [(BMSiriSELFProcessedEventLogicalTimestamp *)self initWithTimestampInNanoseconds:v8 clockIdentifier:v10];

  p_isa = (id *)&self->super.super.isa;
LABEL_8:

LABEL_9:
  return (BMSiriSELFProcessedEventLogicalTimestamp *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriSELFProcessedEventLogicalTimestamp *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasTimestampInNanoseconds)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_raw_clockIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriSELFProcessedEventLogicalTimestamp;
  id v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_39;
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
      if ((v12 >> 3) == 2)
      {
        PBReaderReadData();
        uint64_t v25 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v25 length] != 16)
        {

          goto LABEL_38;
        }
        raw_clockIdentifier = v5->_raw_clockIdentifier;
        v5->_raw_clockIdentifier = v25;
      }
      else if ((v12 >> 3) == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        int64_t v21 = 0;
        v5->_hasTimestampInNanoseconds = 1;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_33;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            int64_t v21 = 0;
            goto LABEL_35;
          }
        }
        v4[*v8] = 1;
LABEL_33:
        if (v4[*v8]) {
          int64_t v21 = 0;
        }
LABEL_35:
        v5->_timestampInNanoseconds = v21;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_38;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_38:
  }
    uint64_t v27 = 0;
  else {
LABEL_39:
  }
    uint64_t v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriSELFProcessedEventLogicalTimestamp timestampInNanoseconds](self, "timestampInNanoseconds"));
  id v5 = [(BMSiriSELFProcessedEventLogicalTimestamp *)self clockIdentifier];
  id v6 = (void *)[v3 initWithFormat:@"BMSiriSELFProcessedEventLogicalTimestamp with timestampInNanoseconds: %@, clockIdentifier: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriSELFProcessedEventLogicalTimestamp)initWithTimestampInNanoseconds:(id)a3 clockIdentifier:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriSELFProcessedEventLogicalTimestamp;
  id v8 = [(BMEventBase *)&v13 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasTimestampInNanoseconds = 1;
      uint64_t v9 = [v6 longLongValue];
    }
    else
    {
      v8->_hasTimestampInNanoseconds = 0;
      uint64_t v9 = -1;
    }
    v8->_timestampInNanoseconds = v9;
    if (v7)
    {
      v14[0] = 0;
      v14[1] = 0;
      [v7 getUUIDBytes:v14];
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v14 length:16];
      raw_clockIdentifier = v8->_raw_clockIdentifier;
      v8->_raw_clockIdentifier = (NSData *)v10;
    }
    else
    {
      raw_clockIdentifier = v8->_raw_clockIdentifier;
      v8->_raw_clockIdentifier = 0;
    }
  }
  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestampInNanoseconds" number:1 type:3 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clockIdentifier" number:2 type:14 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4380;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestampInNanoseconds" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:3 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clockIdentifier" dataType:6 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:3];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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

    id v8 = [[BMSiriSELFProcessedEventLogicalTimestamp alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end