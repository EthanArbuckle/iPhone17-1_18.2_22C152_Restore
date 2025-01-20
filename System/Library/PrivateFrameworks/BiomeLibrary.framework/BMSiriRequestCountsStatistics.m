@interface BMSiriRequestCountsStatistics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestCountsStatistics)initWithAllRequestCount:(id)a3 userRequestCount:(id)a4;
- (BMSiriRequestCountsStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAllRequestCount;
- (BOOL)hasUserRequestCount;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)allRequestCount;
- (unsigned)dataVersion;
- (unsigned)userRequestCount;
- (void)setHasAllRequestCount:(BOOL)a3;
- (void)setHasUserRequestCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestCountsStatistics

- (void)setHasUserRequestCount:(BOOL)a3
{
  self->_hasUserRequestCount = a3;
}

- (BOOL)hasUserRequestCount
{
  return self->_hasUserRequestCount;
}

- (unsigned)userRequestCount
{
  return self->_userRequestCount;
}

- (void)setHasAllRequestCount:(BOOL)a3
{
  self->_hasAllRequestCount = a3;
}

- (BOOL)hasAllRequestCount
{
  return self->_hasAllRequestCount;
}

- (unsigned)allRequestCount
{
  return self->_allRequestCount;
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
    if ([(BMSiriRequestCountsStatistics *)self hasAllRequestCount]
      || [v5 hasAllRequestCount])
    {
      if (![(BMSiriRequestCountsStatistics *)self hasAllRequestCount]) {
        goto LABEL_13;
      }
      if (![v5 hasAllRequestCount]) {
        goto LABEL_13;
      }
      unsigned int v6 = [(BMSiriRequestCountsStatistics *)self allRequestCount];
      if (v6 != [v5 allRequestCount]) {
        goto LABEL_13;
      }
    }
    if (![(BMSiriRequestCountsStatistics *)self hasUserRequestCount]
      && ![v5 hasUserRequestCount])
    {
      BOOL v8 = 1;
      goto LABEL_14;
    }
    if ([(BMSiriRequestCountsStatistics *)self hasUserRequestCount]
      && [v5 hasUserRequestCount])
    {
      unsigned int v7 = [(BMSiriRequestCountsStatistics *)self userRequestCount];
      BOOL v8 = v7 == [v5 userRequestCount];
    }
    else
    {
LABEL_13:
      BOOL v8 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriRequestCountsStatistics *)self hasAllRequestCount])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics allRequestCount](self, "allRequestCount"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriRequestCountsStatistics *)self hasUserRequestCount])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics userRequestCount](self, "userRequestCount"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"allRequestCount";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"userRequestCount";
  v10[0] = v5;
  unsigned int v6 = v4;
  if (!v4)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  unsigned int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_13;
    }
  }

LABEL_13:

  return v7;
}

- (BMSiriRequestCountsStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"allRequestCount"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"allRequestCount"];
      v23[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      v11 = 0;
      id v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"userRequestCount"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"userRequestCount"];
        v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMSiriRequestCountsStatistics *)self initWithAllRequestCount:v8 userRequestCount:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriRequestCountsStatistics *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasAllRequestCount)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasUserRequestCount)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMSiriRequestCountsStatistics;
  id v5 = [(BMEventBase *)&v37 init];
  if (!v5) {
    goto LABEL_48;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v7 = (int *)MEMORY[0x1E4F940E0];
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
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v22 = 0;
        v5->_hasUserRequestCount = 1;
        while (1)
        {
          uint64_t v31 = *v6;
          uint64_t v32 = *(void *)&v4[v31];
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)&v4[*v7]) {
            break;
          }
          char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
          *(void *)&v4[v31] = v33;
          v22 |= (unint64_t)(v34 & 0x7F) << v29;
          if ((v34 & 0x80) == 0)
          {
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__userRequestCount;
            goto LABEL_42;
          }
          v29 += 7;
          BOOL v27 = v30++ > 8;
          if (v27)
          {
            LODWORD(v22) = 0;
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__userRequestCount;
            goto LABEL_44;
          }
        }
        v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__userRequestCount;
LABEL_39:
        v4[*v8] = 1;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_47;
          }
          continue;
        }
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        v5->_hasAllRequestCount = 1;
        while (1)
        {
          uint64_t v23 = *v6;
          uint64_t v24 = *(void *)&v4[v23];
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)&v4[*v7])
          {
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__allRequestCount;
            goto LABEL_39;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
          *(void *)&v4[v23] = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0) {
            break;
          }
          v20 += 7;
          BOOL v27 = v21++ > 8;
          if (v27)
          {
            LODWORD(v22) = 0;
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__allRequestCount;
            goto LABEL_44;
          }
        }
        v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__allRequestCount;
      }
LABEL_42:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_44:
      *(_DWORD *)((char *)&v5->super.super.isa + *v28) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v35 = 0;
  else {
LABEL_48:
  }
    v35 = v5;

  return v35;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics allRequestCount](self, "allRequestCount"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics userRequestCount](self, "userRequestCount"));
  id v6 = (void *)[v3 initWithFormat:@"BMSiriRequestCountsStatistics with allRequestCount: %@, userRequestCount: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriRequestCountsStatistics)initWithAllRequestCount:(id)a3 userRequestCount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSiriRequestCountsStatistics;
  id v8 = [(BMEventBase *)&v12 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasAllRequestCount = 1;
      unsigned int v9 = [v6 unsignedIntValue];
    }
    else
    {
      unsigned int v9 = 0;
      v8->_hasAllRequestCount = 0;
    }
    v8->_allRequestCount = v9;
    if (v7)
    {
      v8->_hasUserRequestCount = 1;
      unsigned int v10 = [v7 unsignedIntValue];
    }
    else
    {
      unsigned int v10 = 0;
      v8->_hasUserRequestCount = 0;
    }
    v8->_userRequestCount = v10;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"allRequestCount" number:1 type:4 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userRequestCount" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF48A8;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"allRequestCount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userRequestCount" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
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

    id v8 = [[BMSiriRequestCountsStatistics alloc] initByReadFrom:v7];
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