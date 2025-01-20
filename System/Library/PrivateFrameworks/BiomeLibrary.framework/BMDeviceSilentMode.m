@interface BMDeviceSilentMode
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceSilentMode)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceSilentMode)initWithStarting:(id)a3 clientType:(int)a4 untilTime:(id)a5 reason:(id)a6;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSDate)untilTime;
- (NSString)description;
- (NSString)reason;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)clientType;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceSilentMode

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"untilTime" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reason" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (void).cxx_destruct
{
}

- (NSString)reason
{
  return self->_reason;
}

- (int)clientType
{
  return self->_clientType;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = 0;
    goto LABEL_13;
  }
  id v5 = v4;
  if (-[BMDeviceSilentMode hasStarting](self, "hasStarting") || [v5 hasStarting])
  {
    if (![(BMDeviceSilentMode *)self hasStarting]) {
      goto LABEL_10;
    }
    if (![v5 hasStarting]) {
      goto LABEL_10;
    }
    int v6 = [(BMDeviceSilentMode *)self starting];
    if (v6 != [v5 starting]) {
      goto LABEL_10;
    }
  }
  int v7 = [(BMDeviceSilentMode *)self clientType];
  if (v7 != [v5 clientType]) {
    goto LABEL_10;
  }
  v8 = [(BMDeviceSilentMode *)self untilTime];
  uint64_t v9 = [v5 untilTime];
  if (v8 == (void *)v9)
  {

    goto LABEL_15;
  }
  v10 = (void *)v9;
  v11 = [(BMDeviceSilentMode *)self untilTime];
  v12 = [v5 untilTime];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
LABEL_15:
    v16 = [(BMDeviceSilentMode *)self reason];
    v17 = [v5 reason];
    if (v16 == v17)
    {
      char v14 = 1;
    }
    else
    {
      v18 = [(BMDeviceSilentMode *)self reason];
      v19 = [v5 reason];
      char v14 = [v18 isEqual:v19];
    }
    goto LABEL_11;
  }
LABEL_10:
  char v14 = 0;
LABEL_11:

LABEL_13:
  return v14;
}

- (NSDate)untilTime
{
  if (self->_hasRaw_untilTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_untilTime];
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
  v17[4] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceSilentMode *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceSilentMode starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceSilentMode clientType](self, "clientType"));
  id v5 = [(BMDeviceSilentMode *)self untilTime];
  if (v5)
  {
    int v6 = NSNumber;
    int v7 = [(BMDeviceSilentMode *)self untilTime];
    [v7 timeIntervalSince1970];
    v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }

  uint64_t v9 = [(BMDeviceSilentMode *)self reason];
  v16[0] = @"starting";
  v10 = v3;
  if (!v3)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v10;
  v16[1] = @"clientType";
  v11 = v4;
  if (!v4)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v11;
  v16[2] = @"untilTime";
  v12 = v8;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v12;
  v16[3] = @"reason";
  int v13 = v9;
  if (!v9)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v13;
  char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (v9)
  {
    if (v8) {
      goto LABEL_17;
    }
  }
  else
  {

    if (v8)
    {
LABEL_17:
      if (v4) {
        goto LABEL_18;
      }
LABEL_24:

      if (v3) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
  }

  if (!v4) {
    goto LABEL_24;
  }
LABEL_18:
  if (v3) {
    goto LABEL_19;
  }
LABEL_25:

LABEL_19:

  return v14;
}

- (BMDeviceSilentMode)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"starting"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v38 = 0;
        v12 = 0;
        v24 = self;
        goto LABEL_31;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = *MEMORY[0x1E4F502C8];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v8 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
      v46[0] = v8;
      int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      id v38 = 0;
      v12 = 0;
      *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v7];
      goto LABEL_45;
    }
    id v38 = v6;
  }
  else
  {
    id v38 = 0;
  }
  int v7 = [v5 objectForKeyedSubscript:@"clientType"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v7;
LABEL_15:
        v8 = v9;
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [NSNumber numberWithInt:BMDeviceSilentModeClientTypeFromString(v7)];
        goto LABEL_15;
      }
      if (a4)
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        char v14 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"clientType"];
        v44 = v14;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        id v30 = (id)[v28 initWithDomain:v29 code:2 userInfo:v13];
        v8 = 0;
        v12 = 0;
        *a4 = v30;
        goto LABEL_47;
      }
      v8 = 0;
      v12 = 0;
LABEL_45:
      v24 = self;
      goto LABEL_30;
    }
  }
  v8 = 0;
LABEL_16:
  v36 = a4;
  int v13 = [v5 objectForKeyedSubscript:@"untilTime"];
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v14 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v16 = v13;
    id v17 = [v15 alloc];
    [v16 doubleValue];
    double v19 = v18;

    id v20 = (id)[v17 initWithTimeIntervalSince1970:v19];
LABEL_21:
    char v14 = v20;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v13;
      goto LABEL_21;
    }
    if (a4)
    {
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v31 = *MEMORY[0x1E4F502C8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"untilTime"];
      id v42 = v23;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v32 = (id)[v35 initWithDomain:v31 code:2 userInfo:v22];
      char v14 = 0;
      v12 = 0;
      id *v36 = v32;
      v24 = self;
      goto LABEL_28;
    }
    char v14 = 0;
    v12 = 0;
LABEL_47:
    v24 = self;
    goto LABEL_29;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  char v14 = [v21 dateFromString:v13];

LABEL_24:
  v22 = [v5 objectForKeyedSubscript:@"reason"];
  if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    v24 = self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v36)
      {
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"reason"];
        v40 = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id *v36 = (id)[v34 initWithDomain:v33 code:2 userInfo:v27];
      }
      id v23 = 0;
      v12 = 0;
      goto LABEL_28;
    }
    id v23 = v22;
  }
  else
  {
    id v23 = 0;
    v24 = self;
  }
  v24 = -[BMDeviceSilentMode initWithStarting:clientType:untilTime:reason:](v24, "initWithStarting:clientType:untilTime:reason:", v38, [v8 intValue], v14, v23);
  v12 = v24;
LABEL_28:

LABEL_29:
LABEL_30:

LABEL_31:
  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceSilentMode *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_untilTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_reason) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMDeviceSilentMode;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_55;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasStarting = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_41;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_43:
          v5->_starting = v22 != 0;
          break;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_45;
            }
            v27 += 7;
            BOOL v17 = v28++ >= 9;
            if (v17)
            {
              LODWORD(v29) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8]) {
            LODWORD(v29) = 0;
          }
LABEL_47:
          if (v29 >= 0xA) {
            LODWORD(v29) = 0;
          }
          v5->_clientType = v29;
          break;
        case 3u:
          v5->_hasRaw_untilTime = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            double v36 = *(double *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v36 = 0.0;
          }
          v5->_raw_untilTime = v36;
          break;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          reason = v5->_reason;
          v5->_reason = (NSString *)v37;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_54;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_54:
  }
    uint64_t v39 = 0;
  else {
LABEL_55:
  }
    uint64_t v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceSilentMode starting](self, "starting"));
  id v5 = BMDeviceSilentModeClientTypeAsString([(BMDeviceSilentMode *)self clientType]);
  int v6 = [(BMDeviceSilentMode *)self untilTime];
  int v7 = [(BMDeviceSilentMode *)self reason];
  v8 = (void *)[v3 initWithFormat:@"BMDeviceSilentMode with starting: %@, clientType: %@, untilTime: %@, reason: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMDeviceSilentMode)initWithStarting:(id)a3 clientType:(int)a4 untilTime:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMDeviceSilentMode;
  uint64_t v13 = [(BMEventBase *)&v16 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v13->_hasStarting = 1;
      v13->_starting = [v10 BOOLValue];
    }
    else
    {
      v13->_hasStarting = 0;
      v13->_starting = 0;
    }
    v13->_clientType = a4;
    if (v11)
    {
      v13->_hasRaw_untilTime = 1;
      [v11 timeIntervalSince1970];
    }
    else
    {
      v13->_hasRaw_untilTime = 0;
      double v14 = -1.0;
    }
    v13->_raw_untilTime = v14;
    objc_storeStrong((id *)&v13->_reason, a6);
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientType" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"untilTime" number:3 type:0 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reason" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6378;
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMDeviceSilentMode alloc] initByReadFrom:v7];
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