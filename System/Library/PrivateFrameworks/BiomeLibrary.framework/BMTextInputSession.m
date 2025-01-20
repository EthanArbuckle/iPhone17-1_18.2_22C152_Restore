@interface BMTextInputSession
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextInputSession)initWithDuration:(id)a3 timestamp:(id)a4 bundleID:(id)a5 sessionInput:(int)a6;
- (BMTextInputSession)initWithDuration:(id)a3 timestamp:(id)a4 bundleID:(id)a5 sessionInput:(int)a6 sessionID:(id)a7;
- (BMTextInputSession)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasDuration;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)bundleID;
- (NSString)description;
- (NSString)sessionID;
- (double)duration;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)sessionInput;
- (unsigned)dataVersion;
- (void)setHasDuration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMTextInputSession

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"duration" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionInput" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (BMTextInputSession)initWithDuration:(id)a3 timestamp:(id)a4 bundleID:(id)a5 sessionInput:(int)a6
{
  return [(BMTextInputSession *)self initWithDuration:a3 timestamp:a4 bundleID:a5 sessionInput:*(void *)&a6 sessionID:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (int)sessionInput
{
  return self->_sessionInput;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (double)duration
{
  return self->_duration;
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
    if (-[BMTextInputSession hasDuration](self, "hasDuration") || [v5 hasDuration])
    {
      if (![(BMTextInputSession *)self hasDuration]) {
        goto LABEL_19;
      }
      if (![v5 hasDuration]) {
        goto LABEL_19;
      }
      [(BMTextInputSession *)self duration];
      double v7 = v6;
      [v5 duration];
      if (v7 != v8) {
        goto LABEL_19;
      }
    }
    v9 = [(BMTextInputSession *)self timestamp];
    uint64_t v10 = [v5 timestamp];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMTextInputSession *)self timestamp];
      v13 = [v5 timestamp];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_19;
      }
    }
    v16 = [(BMTextInputSession *)self bundleID];
    uint64_t v17 = [v5 bundleID];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMTextInputSession *)self bundleID];
      v20 = [v5 bundleID];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_19;
      }
    }
    int v22 = [(BMTextInputSession *)self sessionInput];
    if (v22 == [v5 sessionInput])
    {
      v23 = [(BMTextInputSession *)self sessionID];
      v24 = [v5 sessionID];
      if (v23 == v24)
      {
        char v15 = 1;
      }
      else
      {
        v25 = [(BMTextInputSession *)self sessionID];
        v26 = [v5 sessionID];
        char v15 = [v25 isEqual:v26];
      }
      goto LABEL_20;
    }
LABEL_19:
    char v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v15 = 0;
LABEL_21:

  return v15;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
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
  v27[5] = *MEMORY[0x1E4F143B8];
  if (![(BMTextInputSession *)self hasDuration]
    || ([(BMTextInputSession *)self duration], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMTextInputSession *)self duration];
    id v4 = NSNumber;
    [(BMTextInputSession *)self duration];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  double v6 = [(BMTextInputSession *)self timestamp];
  if (v6)
  {
    double v7 = NSNumber;
    double v8 = [(BMTextInputSession *)self timestamp];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }

  uint64_t v10 = [(BMTextInputSession *)self bundleID];
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMTextInputSession sessionInput](self, "sessionInput"));
  v12 = [(BMTextInputSession *)self sessionID];
  int v22 = @"duration";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v13;
  v27[0] = v13;
  v23 = @"timestamp";
  int v14 = v9;
  if (!v9)
  {
    int v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v13, v22, v23);
  }
  v27[1] = v14;
  v24 = @"bundleID";
  char v15 = v10;
  if (!v10)
  {
    char v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[2] = v15;
  v25 = @"sessionInput";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[3] = v16;
  v26 = @"sessionID";
  uint64_t v17 = v12;
  if (!v12)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v17;
  v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v22, 5, v20);
  if (v12)
  {
    if (v11) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v11)
    {
LABEL_20:
      if (v10) {
        goto LABEL_21;
      }
      goto LABEL_28;
    }
  }

  if (v10)
  {
LABEL_21:
    if (v9) {
      goto LABEL_22;
    }
LABEL_29:

    if (v5) {
      goto LABEL_23;
    }
    goto LABEL_30;
  }
LABEL_28:

  if (!v9) {
    goto LABEL_29;
  }
LABEL_22:
  if (v5) {
    goto LABEL_23;
  }
LABEL_30:

LABEL_23:

  return v18;
}

- (BMTextInputSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"duration"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v41 = 0;
LABEL_4:
    double v8 = [v6 objectForKeyedSubscript:@"timestamp"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v10 = v8;
        id v11 = [v9 alloc];
        [v10 doubleValue];
        double v13 = v12;

        int v14 = (id *)[v11 initWithTimeIntervalSince1970:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v39 = [v19 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            goto LABEL_38;
          }
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
          id v49 = v40;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          v18 = 0;
          *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v20];
          a4 = 0;
          goto LABEL_37;
        }
        int v14 = v8;
      }
      v39 = v14;
    }
    else
    {
      v39 = 0;
    }
LABEL_16:
    uint64_t v20 = [v6 objectForKeyedSubscript:@"bundleID"];
    v38 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v40 = 0;
          v18 = 0;
          a4 = v39;
          goto LABEL_37;
        }
        int v21 = self;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        v47 = v23;
        int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v40 = 0;
        v18 = 0;
        *a4 = (id)[v25 initWithDomain:v26 code:2 userInfo:v22];
        goto LABEL_55;
      }
      int v21 = self;
      id v40 = v20;
    }
    else
    {
      int v21 = self;
      id v40 = 0;
    }
    int v22 = [v6 objectForKeyedSubscript:@"sessionInput"];
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v22;
LABEL_30:
      v23 = v24;
LABEL_31:
      v27 = [v6 objectForKeyedSubscript:@"sessionID"];
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v28 = 0;
LABEL_34:
        a4 = v39;
        v18 = -[BMTextInputSession initWithDuration:timestamp:bundleID:sessionInput:sessionID:](v21, "initWithDuration:timestamp:bundleID:sessionInput:sessionID:", v41, v39, v40, [v23 intValue], v28);
        int v21 = v18;
LABEL_35:

LABEL_36:
        self = v21;
        double v7 = v38;
LABEL_37:

        goto LABEL_38;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v27;
        goto LABEL_34;
      }
      if (a4)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sessionID"];
        v43 = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *a4 = (id)[v36 initWithDomain:v34 code:2 userInfo:v31];
      }
      id v28 = 0;
      v18 = 0;
LABEL_50:
      a4 = v39;
      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [NSNumber numberWithInt:BMTextInputSessionInputFromString(v22)];
      goto LABEL_30;
    }
    if (a4)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"sessionInput"];
      id v45 = v28;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v23 = 0;
      v18 = 0;
      *a4 = (id)[v37 initWithDomain:v35 code:2 userInfo:v27];
      goto LABEL_50;
    }
    v23 = 0;
    v18 = 0;
LABEL_55:
    a4 = v39;
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v41 = 0;
    v18 = 0;
    goto LABEL_39;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  uint64_t v17 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"duration"];
  v51[0] = v17;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  id v41 = 0;
  v18 = 0;
  *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v8];
  a4 = v17;
LABEL_38:

LABEL_39:
  return v18;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMTextInputSession *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasDuration) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_sessionID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMTextInputSession;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_52;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  double v8 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasDuration = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            int v22 = *(objc_class **)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v35 = 48;
          goto LABEL_48;
        case 2u:
          v5->_hasRaw_timestamp = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            int v22 = *(objc_class **)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v35 = 24;
LABEL_48:
          *(Class *)((char *)&v5->super.super.isa + v35) = v22;
          continue;
        case 3u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 56;
          goto LABEL_37;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          break;
        case 5u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 64;
LABEL_37:
          uint64_t v34 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_51;
          }
          continue;
      }
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
          goto LABEL_39;
        }
        v27 += 7;
        BOOL v17 = v28++ >= 9;
        if (v17)
        {
          LODWORD(v29) = 0;
          goto LABEL_41;
        }
      }
      v4[*v8] = 1;
LABEL_39:
      if (v4[*v8]) {
        LODWORD(v29) = 0;
      }
LABEL_41:
      if (v29 >= 5) {
        LODWORD(v29) = 0;
      }
      v5->_sessionInput = v29;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    id v36 = 0;
  else {
LABEL_52:
  }
    id v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMTextInputSession *)self duration];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = [(BMTextInputSession *)self timestamp];
  double v7 = [(BMTextInputSession *)self bundleID];
  double v8 = BMTextInputSessionInputAsString([(BMTextInputSession *)self sessionInput]);
  v9 = [(BMTextInputSession *)self sessionID];
  char v10 = (void *)[v3 initWithFormat:@"BMTextInputSession with duration: %@, timestamp: %@, bundleID: %@, sessionInput: %@, sessionID: %@", v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMTextInputSession)initWithDuration:(id)a3 timestamp:(id)a4 bundleID:(id)a5 sessionInput:(int)a6 sessionID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMTextInputSession;
  char v16 = [(BMEventBase *)&v20 init];
  if (v16)
  {
    v16->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v16->_hasDuration = 1;
      [v12 doubleValue];
    }
    else
    {
      v16->_hasDuration = 0;
      double v17 = -1.0;
    }
    v16->_duration = v17;
    if (v13)
    {
      v16->_hasRaw_timestamp = 1;
      [v13 timeIntervalSince1970];
    }
    else
    {
      v16->_hasRaw_timestamp = 0;
      double v18 = -1.0;
    }
    v16->_raw_timestamp = v18;
    objc_storeStrong((id *)&v16->_bundleID, a5);
    v16->_sessionInput = a6;
    objc_storeStrong((id *)&v16->_sessionID, a7);
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"duration" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"timestamp", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionInput" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionID" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6CC0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    double v7 = BMTextInputSession;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    double v7 = BMTextInputSession_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 36) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end