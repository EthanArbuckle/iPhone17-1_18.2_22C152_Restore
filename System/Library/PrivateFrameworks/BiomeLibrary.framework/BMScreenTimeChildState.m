@interface BMScreenTimeChildState
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMScreenTimeChildState)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMScreenTimeChildState)initWithStarting:(id)a3 eventID:(id)a4 signalDate:(id)a5 userDSID:(id)a6 state:(int)a7;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSDate)signalDate;
- (NSString)description;
- (NSString)eventID;
- (NSString)userDSID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)state;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMScreenTimeChildState

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"signalDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userDSID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"state" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDSID, 0);

  objc_storeStrong((id *)&self->_eventID, 0);
}

- (int)state
{
  return self->_state;
}

- (NSString)userDSID
{
  return self->_userDSID;
}

- (NSString)eventID
{
  return self->_eventID;
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
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[BMScreenTimeChildState hasStarting](self, "hasStarting") || [v5 hasStarting])
    {
      if (![(BMScreenTimeChildState *)self hasStarting]) {
        goto LABEL_18;
      }
      if (![v5 hasStarting]) {
        goto LABEL_18;
      }
      int v6 = [(BMScreenTimeChildState *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_18;
      }
    }
    v7 = [(BMScreenTimeChildState *)self eventID];
    uint64_t v8 = [v5 eventID];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMScreenTimeChildState *)self eventID];
      v11 = [v5 eventID];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_18;
      }
    }
    v14 = [(BMScreenTimeChildState *)self signalDate];
    uint64_t v15 = [v5 signalDate];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMScreenTimeChildState *)self signalDate];
      v18 = [v5 signalDate];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_18;
      }
    }
    v20 = [(BMScreenTimeChildState *)self userDSID];
    uint64_t v21 = [v5 userDSID];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMScreenTimeChildState *)self userDSID];
      v24 = [v5 userDSID];
      int v25 = [v23 isEqual:v24];

      if (!v25)
      {
LABEL_18:
        BOOL v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    int v27 = [(BMScreenTimeChildState *)self state];
    BOOL v13 = v27 == [v5 state];
    goto LABEL_19;
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

- (NSDate)signalDate
{
  if (self->_hasRaw_signalDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_signalDate];
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
  v25[5] = *MEMORY[0x1E4F143B8];
  if ([(BMScreenTimeChildState *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenTimeChildState starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMScreenTimeChildState *)self eventID];
  id v5 = [(BMScreenTimeChildState *)self signalDate];
  if (v5)
  {
    int v6 = NSNumber;
    v7 = [(BMScreenTimeChildState *)self signalDate];
    [v7 timeIntervalSince1970];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [(BMScreenTimeChildState *)self userDSID];
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMScreenTimeChildState state](self, "state"));
  v20 = @"starting";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  uint64_t v21 = @"eventID";
  int v12 = v4;
  if (!v4)
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  v22 = @"signalDate";
  BOOL v13 = v8;
  if (!v8)
  {
    BOOL v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"userDSID";
  v14 = v9;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  v24 = @"state";
  uint64_t v15 = v10;
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v8) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v8)
  {
LABEL_20:
    if (v4) {
      goto LABEL_21;
    }
LABEL_28:

    if (v3) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v4) {
    goto LABEL_28;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v16;
}

- (BMScreenTimeChildState)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v43 = 0;
LABEL_4:
    uint64_t v8 = [v6 objectForKeyedSubscript:@"eventID"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v42 = 0;
          uint64_t v18 = 0;
          goto LABEL_42;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        uint64_t v21 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventID"];
        v51 = a4;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id v42 = 0;
        uint64_t v18 = 0;
        *uint64_t v21 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
        goto LABEL_41;
      }
      id v42 = v8;
    }
    else
    {
      id v42 = 0;
    }
    v9 = [v6 objectForKeyedSubscript:@"signalDate"];
    v40 = a4;
    v41 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v11 = v9;
        id v12 = [v10 alloc];
        [v11 doubleValue];
        double v14 = v13;

        uint64_t v15 = (id *)[v12 initWithTimeIntervalSince1970:v14];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          a4 = [v22 dateFromString:v9];

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v18 = 0;
            goto LABEL_41;
          }
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"signalDate"];
          id v49 = v24;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          id v35 = (id)[v33 initWithDomain:v34 code:2 userInfo:v23];
          v36 = a4;
          a4 = 0;
          uint64_t v18 = 0;
          id *v36 = v35;
LABEL_40:

          v7 = v41;
LABEL_41:

          goto LABEL_42;
        }
        uint64_t v15 = v9;
      }
      a4 = v15;
    }
    else
    {
      a4 = 0;
    }
LABEL_23:
    v23 = [v6 objectForKeyedSubscript:@"userDSID"];
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v40)
        {
          id v24 = 0;
          uint64_t v18 = 0;
          goto LABEL_40;
        }
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userDSID"];
        v47 = v26;
        int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v29 = (id)[v38 initWithDomain:v28 code:2 userInfo:v25];
        id v24 = 0;
        uint64_t v18 = 0;
        id *v40 = v29;
        goto LABEL_39;
      }
      id v24 = v23;
    }
    else
    {
      id v24 = 0;
    }
    int v25 = [v6 objectForKeyedSubscript:@"state"];
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v25;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v40)
          {
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v37 = *MEMORY[0x1E4F502C8];
            uint64_t v44 = *MEMORY[0x1E4F28568];
            v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"state"];
            v45 = v31;
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            id *v40 = (id)[v39 initWithDomain:v37 code:2 userInfo:v32];
          }
          v26 = 0;
          uint64_t v18 = 0;
          goto LABEL_39;
        }
        id v27 = [NSNumber numberWithInt:BMScreenTimeChildStateScreenTimeChildStateKindFromString(v25)];
      }
      v26 = v27;
    }
    else
    {
      v26 = 0;
    }
    uint64_t v18 = -[BMScreenTimeChildState initWithStarting:eventID:signalDate:userDSID:state:](self, "initWithStarting:eventID:signalDate:userDSID:state:", v43, v42, a4, v24, [v26 intValue]);
    self = v18;
LABEL_39:

    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v43 = 0;
    uint64_t v18 = 0;
    goto LABEL_43;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v52 = *MEMORY[0x1E4F28568];
  id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
  v53[0] = v42;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
  id v43 = 0;
  uint64_t v18 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v8];
LABEL_42:

LABEL_43:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMScreenTimeChildState *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_eventID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_signalDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_userDSID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMScreenTimeChildState;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_57;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v17 = v21++ >= 9;
                if (v17)
                {
                  uint64_t v22 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_45:
          v5->_starting = v22 != 0;
          continue;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
          goto LABEL_34;
        case 3u:
          v5->_hasRaw_signalDate = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(double *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0.0;
          }
          v5->_raw_signalDate = v31;
          continue;
        case 4u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
LABEL_34:
          v32 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_56;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v6;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_47;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v35) = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8]) {
        LODWORD(v35) = 0;
      }
LABEL_49:
      if (v35 >= 3) {
        LODWORD(v35) = 0;
      }
      v5->_state = v35;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_56:
  }
    v40 = 0;
  else {
LABEL_57:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenTimeChildState starting](self, "starting"));
  id v5 = [(BMScreenTimeChildState *)self eventID];
  id v6 = [(BMScreenTimeChildState *)self signalDate];
  v7 = [(BMScreenTimeChildState *)self userDSID];
  uint64_t v8 = BMScreenTimeChildStateScreenTimeChildStateKindAsString([(BMScreenTimeChildState *)self state]);
  v9 = (void *)[v3 initWithFormat:@"BMScreenTimeChildState with starting: %@, eventID: %@, signalDate: %@, userDSID: %@, state: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMScreenTimeChildState)initWithStarting:(id)a3 eventID:(id)a4 signalDate:(id)a5 userDSID:(id)a6 state:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMScreenTimeChildState;
  char v16 = [(BMEventBase *)&v19 init];
  if (v16)
  {
    v16->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v16->_hasStarting = 1;
      v16->_starting = [v12 BOOLValue];
    }
    else
    {
      v16->_hasStarting = 0;
      v16->_starting = 0;
    }
    objc_storeStrong((id *)&v16->_eventID, a4);
    if (v14)
    {
      v16->_hasRaw_signalDate = 1;
      [v14 timeIntervalSince1970];
    }
    else
    {
      v16->_hasRaw_signalDate = 0;
      double v17 = -1.0;
    }
    v16->_raw_signalDate = v17;
    objc_storeStrong((id *)&v16->_userDSID, a6);
    v16->_state = a7;
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"eventID", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"signalDate" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userDSID" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"state" number:5 type:4 subMessageClass:0];
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4DD0;
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

    uint64_t v8 = [[BMScreenTimeChildState alloc] initByReadFrom:v7];
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