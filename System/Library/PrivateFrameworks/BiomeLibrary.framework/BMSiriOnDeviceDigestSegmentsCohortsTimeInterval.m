@interface BMSiriOnDeviceDigestSegmentsCohortsTimeInterval
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)initWithStartTimestampInSecondsSince1970:(id)a3 numberOfSeconds:(id)a4;
- (BOOL)hasNumberOfSeconds;
- (BOOL)hasStartTimestampInSecondsSince1970;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)startTimestampInSecondsSince1970;
- (unsigned)dataVersion;
- (unsigned)numberOfSeconds;
- (void)setHasNumberOfSeconds:(BOOL)a3;
- (void)setHasStartTimestampInSecondsSince1970:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestSegmentsCohortsTimeInterval

- (void)setHasNumberOfSeconds:(BOOL)a3
{
  self->_hasNumberOfSeconds = a3;
}

- (BOOL)hasNumberOfSeconds
{
  return self->_hasNumberOfSeconds;
}

- (unsigned)numberOfSeconds
{
  return self->_numberOfSeconds;
}

- (void)setHasStartTimestampInSecondsSince1970:(BOOL)a3
{
  self->_hasStartTimestampInSecondsSince1970 = a3;
}

- (BOOL)hasStartTimestampInSecondsSince1970
{
  return self->_hasStartTimestampInSecondsSince1970;
}

- (unint64_t)startTimestampInSecondsSince1970
{
  return self->_startTimestampInSecondsSince1970;
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
    if (-[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval hasStartTimestampInSecondsSince1970](self, "hasStartTimestampInSecondsSince1970")|| [v5 hasStartTimestampInSecondsSince1970])
    {
      if (![(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self hasStartTimestampInSecondsSince1970])goto LABEL_13; {
      if (![v5 hasStartTimestampInSecondsSince1970])
      }
        goto LABEL_13;
      unint64_t v6 = [(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self startTimestampInSecondsSince1970];
      if (v6 != [v5 startTimestampInSecondsSince1970]) {
        goto LABEL_13;
      }
    }
    if (![(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self hasNumberOfSeconds]
      && ![v5 hasNumberOfSeconds])
    {
      BOOL v8 = 1;
      goto LABEL_14;
    }
    if ([(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self hasNumberOfSeconds]
      && [v5 hasNumberOfSeconds])
    {
      unsigned int v7 = [(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self numberOfSeconds];
      BOOL v8 = v7 == [v5 numberOfSeconds];
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
  if ([(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self hasStartTimestampInSecondsSince1970])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval startTimestampInSecondsSince1970](self, "startTimestampInSecondsSince1970"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self hasNumberOfSeconds])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval numberOfSeconds](self, "numberOfSeconds"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"startTimestampInSecondsSince1970";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"numberOfSeconds";
  v10[0] = v5;
  unint64_t v6 = v4;
  if (!v4)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA98] null];
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

- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"startTimestampInSecondsSince1970"];
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
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startTimestampInSecondsSince1970"];
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
  v9 = [v6 objectForKeyedSubscript:@"numberOfSeconds"];
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
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfSeconds"];
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
  self = [(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self initWithStartTimestampInSecondsSince1970:v8 numberOfSeconds:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasStartTimestampInSecondsSince1970)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_hasNumberOfSeconds)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsTimeInterval;
  id v5 = [(BMEventBase *)&v33 init];
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
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        v5->_hasNumberOfSeconds = 1;
        while (1)
        {
          uint64_t v28 = *v6;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 == -1 || v29 >= *(void *)&v4[*v7]) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            goto LABEL_42;
          }
          v25 += 7;
          BOOL v16 = v26++ >= 9;
          if (v16)
          {
            LODWORD(v27) = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8]) {
          LODWORD(v27) = 0;
        }
LABEL_44:
        v5->_numberOfSeconds = v27;
      }
      else if ((v12 >> 3) == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        unint64_t v21 = 0;
        v5->_hasStartTimestampInSecondsSince1970 = 1;
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
            goto LABEL_38;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            unint64_t v21 = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8]) {
          unint64_t v21 = 0;
        }
LABEL_40:
        v5->_startTimestampInSecondsSince1970 = v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_47;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v31 = 0;
  else {
LABEL_48:
  }
    v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval startTimestampInSecondsSince1970](self, "startTimestampInSecondsSince1970"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval numberOfSeconds](self, "numberOfSeconds"));
  id v6 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestSegmentsCohortsTimeInterval with startTimestampInSecondsSince1970: %@, numberOfSeconds: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)initWithStartTimestampInSecondsSince1970:(id)a3 numberOfSeconds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsTimeInterval;
  id v8 = [(BMEventBase *)&v12 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasStartTimestampInSecondsSince1970 = 1;
      uint64_t v9 = [v6 unsignedLongLongValue];
    }
    else
    {
      uint64_t v9 = 0;
      v8->_hasStartTimestampInSecondsSince1970 = 0;
    }
    v8->_startTimestampInSecondsSince1970 = v9;
    if (v7)
    {
      v8->_hasNumberOfSeconds = 1;
      unsigned int v10 = [v7 unsignedIntValue];
    }
    else
    {
      unsigned int v10 = 0;
      v8->_hasNumberOfSeconds = 0;
    }
    v8->_numberOfSeconds = v10;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startTimestampInSecondsSince1970" number:1 type:5 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfSeconds" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4BF0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startTimestampInSecondsSince1970" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:5 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfSeconds" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
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

    id v8 = [[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc] initByReadFrom:v7];
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