@interface BMAmbientMusicDetection
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAmbientMusicDetection)initWithAbsoluteTimestamp:(id)a3 detected:(id)a4;
- (BMAmbientMusicDetection)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)detected;
- (BOOL)hasDetected;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasDetected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAmbientMusicDetection

- (void)setHasDetected:(BOOL)a3
{
  self->_hasDetected = a3;
}

- (BOOL)hasDetected
{
  return self->_hasDetected;
}

- (BOOL)detected
{
  return self->_detected;
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
    v6 = [(BMAmbientMusicDetection *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAmbientMusicDetection *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (!-[BMAmbientMusicDetection hasDetected](self, "hasDetected") && ![v5 hasDetected])
    {
      LOBYTE(v12) = 1;
      goto LABEL_13;
    }
    if (-[BMAmbientMusicDetection hasDetected](self, "hasDetected") && [v5 hasDetected])
    {
      BOOL v13 = [(BMAmbientMusicDetection *)self detected];
      int v12 = v13 ^ [v5 detected] ^ 1;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  LOBYTE(v12) = 0;
LABEL_14:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAmbientMusicDetection *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMAmbientMusicDetection *)self absoluteTimestamp];
    [v5 timeIntervalSince1970];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  if ([(BMAmbientMusicDetection *)self hasDetected])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAmbientMusicDetection detected](self, "detected"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v12[0] = @"absoluteTimestamp";
  v8 = v6;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = @"detected";
  v13[0] = v8;
  v9 = v7;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  if (v7)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6) {
      goto LABEL_13;
    }
  }

LABEL_13:

  return v10;
}

- (BMAmbientMusicDetection)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v10 = v7;
    id v11 = [v9 alloc];
    [v10 doubleValue];
    double v13 = v12;

    id v14 = (id)[v11 initWithTimeIntervalSince1970:v13];
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v8 = 0;
        v18 = 0;
        goto LABEL_14;
      }
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v25 = *MEMORY[0x1E4F502C8];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v30[0] = v17;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      id v26 = (id)[v24 initWithDomain:v25 code:2 userInfo:v16];
      v8 = 0;
      v18 = 0;
      *a4 = v26;
      goto LABEL_13;
    }
    id v14 = v7;
    goto LABEL_6;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v8 = [v15 dateFromString:v7];

LABEL_9:
  v16 = [v6 objectForKeyedSubscript:@"detected"];
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"detected"];
        v28 = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v23];
      }
      id v17 = 0;
      v18 = 0;
      goto LABEL_13;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }
  self = [(BMAmbientMusicDetection *)self initWithAbsoluteTimestamp:v8 detected:v17];
  v18 = self;
LABEL_13:

LABEL_14:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAmbientMusicDetection *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMAmbientMusicDetection;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_42;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        v5->_hasDetected = 1;
        while (1)
        {
          uint64_t v26 = *v6;
          uint64_t v27 = *(void *)&v4[v26];
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)&v4[*v7]) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
          *(void *)&v4[v26] = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0) {
            goto LABEL_34;
          }
          v23 += 7;
          BOOL v17 = v24++ >= 9;
          if (v17)
          {
            uint64_t v25 = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8]) {
          uint64_t v25 = 0;
        }
LABEL_36:
        v5->_detected = v25 != 0;
      }
      else if ((v12 >> 3) == 1)
      {
        v5->_hasRaw_absoluteTimestamp = 1;
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
        v5->_raw_absoluteTimestamp = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_41;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_41:
  }
    v30 = 0;
  else {
LABEL_42:
  }
    v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAmbientMusicDetection *)self absoluteTimestamp];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAmbientMusicDetection detected](self, "detected"));
  id v6 = (void *)[v3 initWithFormat:@"BMAmbientMusicDetection with absoluteTimestamp: %@, detected: %@", v4, v5];

  return (NSString *)v6;
}

- (BMAmbientMusicDetection)initWithAbsoluteTimestamp:(id)a3 detected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMAmbientMusicDetection;
  v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasRaw_absoluteTimestamp = 1;
      [v6 timeIntervalSince1970];
    }
    else
    {
      v8->_hasRaw_absoluteTimestamp = 0;
      double v9 = -1.0;
    }
    v8->_raw_absoluteTimestamp = v9;
    if (v7)
    {
      v8->_hasDetected = 1;
      v8->_detected = [v7 BOOLValue];
    }
    else
    {
      v8->_hasDetected = 0;
      v8->_detected = 0;
    }
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"detected" number:2 type:12 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5E20;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"detected" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
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

    v8 = [[BMAmbientMusicDetection alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end