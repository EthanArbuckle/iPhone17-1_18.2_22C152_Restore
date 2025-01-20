@interface BMDeviceBatteryLevel
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceBatteryLevel)initWithBatteryPercentage:(id)a3 fullyCharged:(id)a4;
- (BMDeviceBatteryLevel)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)fullyCharged;
- (BOOL)hasBatteryPercentage;
- (BOOL)hasFullyCharged;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)batteryPercentage;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasBatteryPercentage:(BOOL)a3;
- (void)setHasFullyCharged:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceBatteryLevel

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batteryPercentage" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fullyCharged" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasBatteryPercentage)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasFullyCharged)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceBatteryLevel *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (BMDeviceBatteryLevel)initWithBatteryPercentage:(id)a3 fullyCharged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMDeviceBatteryLevel;
  v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasBatteryPercentage = 1;
      [v6 doubleValue];
    }
    else
    {
      v8->_hasBatteryPercentage = 0;
      double v9 = -1.0;
    }
    v8->_batteryPercentage = v9;
    if (v7)
    {
      v8->_hasFullyCharged = 1;
      v8->_fullyCharged = [v7 BOOLValue];
    }
    else
    {
      v8->_hasFullyCharged = 0;
      v8->_fullyCharged = 0;
    }
  }

  return v8;
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMDeviceBatteryLevel;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_42;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
        v5->_hasFullyCharged = 1;
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
        v5->_fullyCharged = v25 != 0;
      }
      else if ((v12 >> 3) == 1)
      {
        v5->_hasBatteryPercentage = 1;
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
        v5->_batteryPercentage = v22;
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

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (unsigned)latestDataVersion
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

    v8 = [[BMDeviceBatteryLevel alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

- (void)setHasFullyCharged:(BOOL)a3
{
  self->_hasFullyCharged = a3;
}

- (BOOL)hasFullyCharged
{
  return self->_hasFullyCharged;
}

- (BOOL)fullyCharged
{
  return self->_fullyCharged;
}

- (void)setHasBatteryPercentage:(BOOL)a3
{
  self->_hasBatteryPercentage = a3;
}

- (BOOL)hasBatteryPercentage
{
  return self->_hasBatteryPercentage;
}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMDeviceBatteryLevel *)self hasBatteryPercentage]
      || [v5 hasBatteryPercentage])
    {
      if (![(BMDeviceBatteryLevel *)self hasBatteryPercentage]) {
        goto LABEL_13;
      }
      if (![v5 hasBatteryPercentage]) {
        goto LABEL_13;
      }
      [(BMDeviceBatteryLevel *)self batteryPercentage];
      double v7 = v6;
      [v5 batteryPercentage];
      if (v7 != v8) {
        goto LABEL_13;
      }
    }
    if (![(BMDeviceBatteryLevel *)self hasFullyCharged]
      && ![v5 hasFullyCharged])
    {
      LOBYTE(v10) = 1;
      goto LABEL_14;
    }
    if ([(BMDeviceBatteryLevel *)self hasFullyCharged]
      && [v5 hasFullyCharged])
    {
      BOOL v9 = [(BMDeviceBatteryLevel *)self fullyCharged];
      int v10 = v9 ^ [v5 fullyCharged] ^ 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v10) = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v10) = 0;
LABEL_15:

  return v10;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (![(BMDeviceBatteryLevel *)self hasBatteryPercentage]
    || ([(BMDeviceBatteryLevel *)self batteryPercentage], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMDeviceBatteryLevel *)self batteryPercentage];
    id v4 = NSNumber;
    [(BMDeviceBatteryLevel *)self batteryPercentage];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  if ([(BMDeviceBatteryLevel *)self hasFullyCharged])
  {
    double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBatteryLevel fullyCharged](self, "fullyCharged"));
  }
  else
  {
    double v6 = 0;
  }
  v11[0] = @"batteryPercentage";
  double v7 = v5;
  if (!v5)
  {
    double v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"fullyCharged";
  v12[0] = v7;
  double v8 = v6;
  if (!v6)
  {
    double v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v6)
  {
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_14;
    }
  }

LABEL_14:

  return v9;
}

- (BMDeviceBatteryLevel)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"batteryPercentage"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        unsigned int v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"batteryPercentage"];
      v23[0] = v10;
      BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      unsigned int v11 = 0;
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
  BOOL v9 = [v6 objectForKeyedSubscript:@"fullyCharged"];
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
        int v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"fullyCharged"];
        unint64_t v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      unsigned int v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMDeviceBatteryLevel *)self initWithBatteryPercentage:v8 fullyCharged:v10];
  unsigned int v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMDeviceBatteryLevel *)self batteryPercentage];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBatteryLevel fullyCharged](self, "fullyCharged"));
  double v7 = (void *)[v3 initWithFormat:@"BMDeviceBatteryLevel with batteryPercentage: %@, fullyCharged: %@", v5, v6];

  return (NSString *)v7;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batteryPercentage" number:1 type:0 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fullyCharged" number:2 type:12 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5328;
}

@end