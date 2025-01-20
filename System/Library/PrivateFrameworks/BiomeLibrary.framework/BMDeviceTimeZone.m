@interface BMDeviceTimeZone
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceTimeZone)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceTimeZone)initWithSecondsFromGMT:(id)a3;
- (BMDeviceTimeZone)initWithSecondsFromGMT:(id)a3 name:(id)a4;
- (BOOL)hasSecondsFromGMT;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (double)secondsFromGMT;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (id)timeZone;
- (unsigned)dataVersion;
- (void)setHasSecondsFromGMT:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceTimeZone

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"secondsFromGMT" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void).cxx_destruct
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setHasSecondsFromGMT:(BOOL)a3
{
  self->_hasSecondsFromGMT = a3;
}

- (BOOL)hasSecondsFromGMT
{
  return self->_hasSecondsFromGMT;
}

- (double)secondsFromGMT
{
  return self->_secondsFromGMT;
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
    if (![(BMDeviceTimeZone *)self hasSecondsFromGMT]
      && ![v5 hasSecondsFromGMT]
      || [(BMDeviceTimeZone *)self hasSecondsFromGMT]
      && [v5 hasSecondsFromGMT]
      && ([(BMDeviceTimeZone *)self secondsFromGMT],
          double v7 = v6,
          [v5 secondsFromGMT],
          v7 == v8))
    {
      v9 = [(BMDeviceTimeZone *)self name];
      v10 = [v5 name];
      if (v9 == v10)
      {
        char v13 = 1;
      }
      else
      {
        v11 = [(BMDeviceTimeZone *)self name];
        v12 = [v5 name];
        char v13 = [v11 isEqual:v12];
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (![(BMDeviceTimeZone *)self hasSecondsFromGMT]
    || ([(BMDeviceTimeZone *)self secondsFromGMT], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMDeviceTimeZone *)self secondsFromGMT];
    id v4 = NSNumber;
    [(BMDeviceTimeZone *)self secondsFromGMT];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  double v6 = [(BMDeviceTimeZone *)self name];
  v11[0] = @"secondsFromGMT";
  double v7 = v5;
  if (!v5)
  {
    double v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"name";
  v12[0] = v7;
  double v8 = v6;
  if (!v6)
  {
    double v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v6)
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_11;
    }
  }

LABEL_11:

  return v9;
}

- (BMDeviceTimeZone)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"secondsFromGMT"];
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
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"secondsFromGMT"];
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
  v9 = [v6 objectForKeyedSubscript:@"name"];
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
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
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
  self = [(BMDeviceTimeZone *)self initWithSecondsFromGMT:v8 name:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMDeviceTimeZone *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSecondsFromGMT)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMDeviceTimeZone;
  id v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_32;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v23 = PBReaderReadString();
        name = v5->_name;
        v5->_name = (NSString *)v23;
      }
      else if ((v12 >> 3) == 1)
      {
        v5->_hasSecondsFromGMT = 1;
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
        v5->_secondsFromGMT = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    v25 = 0;
  else {
LABEL_32:
  }
    v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMDeviceTimeZone *)self secondsFromGMT];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = [(BMDeviceTimeZone *)self name];
  double v7 = (void *)[v3 initWithFormat:@"BMDeviceTimeZone with secondsFromGMT: %@, name: %@", v5, v6];

  return (NSString *)v7;
}

- (BMDeviceTimeZone)initWithSecondsFromGMT:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMDeviceTimeZone;
  id v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasSecondsFromGMT = 1;
      [v6 doubleValue];
    }
    else
    {
      v8->_hasSecondsFromGMT = 0;
      double v9 = -1.0;
    }
    v8->_secondsFromGMT = v9;
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"secondsFromGMT" number:1 type:0 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:2 type:13 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF47E8;
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

    id v8 = [[BMDeviceTimeZone alloc] initByReadFrom:v7];
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

- (id)timeZone
{
  id v3 = [(BMDeviceTimeZone *)self name];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAF0];
    id v5 = [(BMDeviceTimeZone *)self name];
    id v6 = [v4 timeZoneWithName:v5];
  }
  else if ([(BMDeviceTimeZone *)self hasSecondsFromGMT])
  {
    id v7 = (void *)MEMORY[0x1E4F1CAF0];
    [(BMDeviceTimeZone *)self secondsFromGMT];
    id v6 = [v7 timeZoneForSecondsFromGMT:(uint64_t)v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BMDeviceTimeZone)initWithSecondsFromGMT:(id)a3
{
  return [(BMDeviceTimeZone *)self initWithSecondsFromGMT:a3 name:0];
}

@end