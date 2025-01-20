@interface BMMonotonicTimestampValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMonotonicTimestampValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMonotonicTimestampValue)initWithSuspendingNanosecondsSinceBoot:(id)a3 continuousNanosecondsSinceBoot:(id)a4;
- (BOOL)hasContinuousNanosecondsSinceBoot;
- (BOOL)hasSuspendingNanosecondsSinceBoot;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)continuousNanosecondsSinceBoot;
- (unint64_t)suspendingNanosecondsSinceBoot;
- (unsigned)dataVersion;
- (void)setHasContinuousNanosecondsSinceBoot:(BOOL)a3;
- (void)setHasSuspendingNanosecondsSinceBoot:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMonotonicTimestampValue

- (void)setHasContinuousNanosecondsSinceBoot:(BOOL)a3
{
  self->_hasContinuousNanosecondsSinceBoot = a3;
}

- (BOOL)hasContinuousNanosecondsSinceBoot
{
  return self->_hasContinuousNanosecondsSinceBoot;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  return self->_continuousNanosecondsSinceBoot;
}

- (void)setHasSuspendingNanosecondsSinceBoot:(BOOL)a3
{
  self->_hasSuspendingNanosecondsSinceBoot = a3;
}

- (BOOL)hasSuspendingNanosecondsSinceBoot
{
  return self->_hasSuspendingNanosecondsSinceBoot;
}

- (unint64_t)suspendingNanosecondsSinceBoot
{
  return self->_suspendingNanosecondsSinceBoot;
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
    if ([(BMMonotonicTimestampValue *)self hasSuspendingNanosecondsSinceBoot]
      || [v5 hasSuspendingNanosecondsSinceBoot])
    {
      if (![(BMMonotonicTimestampValue *)self hasSuspendingNanosecondsSinceBoot]) {
        goto LABEL_13;
      }
      if (![v5 hasSuspendingNanosecondsSinceBoot]) {
        goto LABEL_13;
      }
      unint64_t v6 = [(BMMonotonicTimestampValue *)self suspendingNanosecondsSinceBoot];
      if (v6 != [v5 suspendingNanosecondsSinceBoot]) {
        goto LABEL_13;
      }
    }
    if (![(BMMonotonicTimestampValue *)self hasContinuousNanosecondsSinceBoot]
      && ![v5 hasContinuousNanosecondsSinceBoot])
    {
      BOOL v8 = 1;
      goto LABEL_14;
    }
    if ([(BMMonotonicTimestampValue *)self hasContinuousNanosecondsSinceBoot]
      && [v5 hasContinuousNanosecondsSinceBoot])
    {
      unint64_t v7 = [(BMMonotonicTimestampValue *)self continuousNanosecondsSinceBoot];
      BOOL v8 = v7 == [v5 continuousNanosecondsSinceBoot];
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
  if ([(BMMonotonicTimestampValue *)self hasSuspendingNanosecondsSinceBoot])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue suspendingNanosecondsSinceBoot](self, "suspendingNanosecondsSinceBoot"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMMonotonicTimestampValue *)self hasContinuousNanosecondsSinceBoot])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue continuousNanosecondsSinceBoot](self, "continuousNanosecondsSinceBoot"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"suspendingNanosecondsSinceBoot";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"continuousNanosecondsSinceBoot";
  v10[0] = v5;
  unint64_t v6 = v4;
  if (!v4)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
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

- (BMMonotonicTimestampValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"suspendingNanosecondsSinceBoot"];
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
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"suspendingNanosecondsSinceBoot"];
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
  v9 = [v6 objectForKeyedSubscript:@"continuousNanosecondsSinceBoot"];
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
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"continuousNanosecondsSinceBoot"];
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
  self = [(BMMonotonicTimestampValue *)self initWithSuspendingNanosecondsSinceBoot:v8 continuousNanosecondsSinceBoot:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMonotonicTimestampValue *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSuspendingNanosecondsSinceBoot)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_hasContinuousNanosecondsSinceBoot)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMMonotonicTimestampValue;
  id v5 = [(BMEventBase *)&v34 init];
  if (!v5) {
    goto LABEL_48;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v12 >> 3) == 2)
      {
        char v27 = 0;
        unsigned int v28 = 0;
        unint64_t v21 = 0;
        v5->_hasContinuousNanosecondsSinceBoot = 1;
        while (1)
        {
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 == -1 || v30 >= *(void *)&v4[*v7]) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
          *(void *)&v4[v29] = v30 + 1;
          v21 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0)
          {
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__continuousNanosecondsSinceBoot;
            goto LABEL_42;
          }
          v27 += 7;
          BOOL v25 = v28++ > 8;
          if (v25)
          {
            unint64_t v21 = 0;
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__continuousNanosecondsSinceBoot;
            goto LABEL_44;
          }
        }
        v26 = &OBJC_IVAR___BMMonotonicTimestampValue__continuousNanosecondsSinceBoot;
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
        char v19 = 0;
        unsigned int v20 = 0;
        unint64_t v21 = 0;
        v5->_hasSuspendingNanosecondsSinceBoot = 1;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7])
          {
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__suspendingNanosecondsSinceBoot;
            goto LABEL_39;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            break;
          }
          v19 += 7;
          BOOL v25 = v20++ > 8;
          if (v25)
          {
            unint64_t v21 = 0;
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__suspendingNanosecondsSinceBoot;
            goto LABEL_44;
          }
        }
        v26 = &OBJC_IVAR___BMMonotonicTimestampValue__suspendingNanosecondsSinceBoot;
      }
LABEL_42:
      if (v4[*v8]) {
        unint64_t v21 = 0;
      }
LABEL_44:
      *(Class *)((char *)&v5->super.super.isa + *v26) = (Class)v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v32 = 0;
  else {
LABEL_48:
  }
    v32 = v5;

  return v32;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue suspendingNanosecondsSinceBoot](self, "suspendingNanosecondsSinceBoot"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue continuousNanosecondsSinceBoot](self, "continuousNanosecondsSinceBoot"));
  id v6 = (void *)[v3 initWithFormat:@"BMMonotonicTimestampValue with suspendingNanosecondsSinceBoot: %@, continuousNanosecondsSinceBoot: %@", v4, v5];

  return (NSString *)v6;
}

- (BMMonotonicTimestampValue)initWithSuspendingNanosecondsSinceBoot:(id)a3 continuousNanosecondsSinceBoot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMMonotonicTimestampValue;
  id v8 = [(BMEventBase *)&v12 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasSuspendingNanosecondsSinceBoot = 1;
      uint64_t v9 = [v6 unsignedLongLongValue];
    }
    else
    {
      uint64_t v9 = 0;
      v8->_hasSuspendingNanosecondsSinceBoot = 0;
    }
    v8->_suspendingNanosecondsSinceBoot = v9;
    if (v7)
    {
      v8->_hasContinuousNanosecondsSinceBoot = 1;
      uint64_t v10 = [v7 unsignedLongLongValue];
    }
    else
    {
      uint64_t v10 = 0;
      v8->_hasContinuousNanosecondsSinceBoot = 0;
    }
    v8->_continuousNanosecondsSinceBoot = v10;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suspendingNanosecondsSinceBoot" number:1 type:5 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"continuousNanosecondsSinceBoot" number:2 type:5 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3CC0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suspendingNanosecondsSinceBoot" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:5 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"continuousNanosecondsSinceBoot" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:5 convertedType:0];
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

    id v8 = [[BMMonotonicTimestampValue alloc] initByReadFrom:v7];
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