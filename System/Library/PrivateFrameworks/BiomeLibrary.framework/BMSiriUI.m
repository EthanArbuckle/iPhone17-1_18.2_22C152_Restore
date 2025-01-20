@interface BMSiriUI
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriUI)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriUI)initWithSessionID:(id)a3 uuid:(id)a4 viewMode:(id)a5 dismissalReason:(id)a6 starting:(id)a7 absoluteTimestamp:(id)a8;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)dismissalReason;
- (NSString)sessionID;
- (NSString)uuid;
- (NSString)viewMode;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriUI

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
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

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)sessionID
{
  return self->_sessionID;
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
    v6 = [(BMSiriUI *)self sessionID];
    uint64_t v7 = [v5 sessionID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriUI *)self sessionID];
      v10 = [v5 sessionID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_24;
      }
    }
    v13 = [(BMSiriUI *)self uuid];
    uint64_t v14 = [v5 uuid];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriUI *)self uuid];
      v17 = [v5 uuid];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_24;
      }
    }
    v19 = [(BMSiriUI *)self viewMode];
    uint64_t v20 = [v5 viewMode];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriUI *)self viewMode];
      v23 = [v5 viewMode];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_24;
      }
    }
    v25 = [(BMSiriUI *)self dismissalReason];
    uint64_t v26 = [v5 dismissalReason];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriUI *)self dismissalReason];
      v29 = [v5 dismissalReason];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_24;
      }
    }
    if (!-[BMSiriUI hasStarting](self, "hasStarting") && ![v5 hasStarting]
      || [(BMSiriUI *)self hasStarting]
      && [v5 hasStarting]
      && (int v31 = -[BMSiriUI starting](self, "starting"), v31 == [v5 starting]))
    {
      v33 = [(BMSiriUI *)self absoluteTimestamp];
      v34 = [v5 absoluteTimestamp];
      if (v33 == v34)
      {
        char v12 = 1;
      }
      else
      {
        v35 = [(BMSiriUI *)self absoluteTimestamp];
        v36 = [v5 absoluteTimestamp];
        char v12 = [v35 isEqual:v36];
      }
      goto LABEL_25;
    }
LABEL_24:
    char v12 = 0;
LABEL_25:

    goto LABEL_26;
  }
  char v12 = 0;
LABEL_26:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v25[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriUI *)self sessionID];
  uint64_t v4 = [(BMSiriUI *)self uuid];
  id v5 = [(BMSiriUI *)self viewMode];
  v6 = [(BMSiriUI *)self dismissalReason];
  if ([(BMSiriUI *)self hasStarting])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriUI starting](self, "starting"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [(BMSiriUI *)self absoluteTimestamp];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMSiriUI *)self absoluteTimestamp];
    [v10 timeIntervalSinceReferenceDate];
    int v11 = objc_msgSend(v9, "numberWithDouble:");
  }
  else
  {
    int v11 = 0;
  }

  v23 = (void *)v3;
  v24[0] = @"sessionID";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v12;
  v22 = (void *)v4;
  v25[0] = v12;
  v24[1] = @"uuid";
  v13 = (void *)v4;
  if (!v4)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12);
  }
  v25[1] = v13;
  v24[2] = @"viewMode";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v14;
  v24[3] = @"dismissalReason";
  v15 = v6;
  if (!v6)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v15;
  v24[4] = @"starting";
  v16 = v7;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"absoluteTimestamp";
  v17 = v11;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  int v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6) {
        goto LABEL_22;
      }
LABEL_32:

      if (v5) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }

  if (!v6) {
    goto LABEL_32;
  }
LABEL_22:
  if (v5) {
    goto LABEL_23;
  }
LABEL_33:

LABEL_23:
  if (!v22) {

  }
  if (!v23) {

  }
  return v18;
}

- (BMSiriUI)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"sessionID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"uuid"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v54 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v54 = v9;
LABEL_7:
      v10 = [v6 objectForKeyedSubscript:@"viewMode"];
      v56 = self;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v55 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v55 = v10;
LABEL_10:
        int v11 = [v6 objectForKeyedSubscript:@"dismissalReason"];
        id v51 = v8;
        uint64_t v12 = a4;
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v52 = 0;
LABEL_13:
          v13 = [v6 objectForKeyedSubscript:@"starting"];
          if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v12)
              {
                id v14 = 0;
                v21 = 0;
                goto LABEL_52;
              }
              id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v39 = *MEMORY[0x1E4F502C8];
              uint64_t v59 = *MEMORY[0x1E4F28568];
              v49 = v12;
              uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
              v60 = v12;
              v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
              id v40 = (id)[v38 initWithDomain:v39 code:2 userInfo:v15];
              id v14 = 0;
              v21 = 0;
              void *v49 = v40;
              goto LABEL_51;
            }
            id v14 = v13;
          }
          else
          {
            id v14 = 0;
          }
          v15 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
          if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v12 = 0;
LABEL_50:
            v21 = [(BMSiriUI *)v56 initWithSessionID:v51 uuid:v54 viewMode:v55 dismissalReason:v52 starting:v14 absoluteTimestamp:v12];
            v56 = v21;
LABEL_51:

            goto LABEL_52;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = (objc_class *)MEMORY[0x1E4F1C9C8];
            id v23 = v15;
            id v24 = [v22 alloc];
            [v23 doubleValue];
            double v26 = v25;

            v27 = (void *)[v24 initWithTimeIntervalSinceReferenceDate:v26];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v41 = objc_alloc_init(MEMORY[0x1E4F28D48]);
              uint64_t v12 = [v41 dateFromString:v15];

              goto LABEL_50;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v12)
              {
                id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v45 = *MEMORY[0x1E4F502C8];
                uint64_t v57 = *MEMORY[0x1E4F28568];
                v50 = v12;
                v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
                v58 = v43;
                v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
                void *v50 = (id)[v46 initWithDomain:v45 code:2 userInfo:v44];

                uint64_t v12 = 0;
              }
              v21 = 0;
              goto LABEL_51;
            }
            v27 = v15;
          }
          uint64_t v12 = v27;
          goto LABEL_50;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v52 = v11;
          goto LABEL_13;
        }
        if (a4)
        {
          id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"dismissalReason"];
          id v62 = v14;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v37 = (id)[v53 initWithDomain:v36 code:2 userInfo:v13];
          id v52 = 0;
          v21 = 0;
          *uint64_t v12 = v37;
LABEL_52:

          id v8 = v51;
          goto LABEL_53;
        }
        id v52 = 0;
        v21 = 0;
LABEL_53:
        v19 = v54;

        self = v56;
        goto LABEL_54;
      }
      if (a4)
      {
        v48 = a4;
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v33 = v8;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        id v52 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"viewMode"];
        id v64 = v52;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v35 = v34;
        id v8 = v33;
        id v55 = 0;
        v21 = 0;
        id *v48 = (id)[v32 initWithDomain:v35 code:2 userInfo:v11];
        goto LABEL_53;
      }
      id v55 = 0;
      v21 = 0;
      v19 = v54;
LABEL_54:

      goto LABEL_55;
    }
    if (a4)
    {
      v47 = a4;
      id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v29 = v8;
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      id v55 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uuid"];
      id v66 = v55;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      uint64_t v31 = v30;
      id v8 = v29;
      v19 = 0;
      v21 = 0;
      id *v47 = (id)[v28 initWithDomain:v31 code:2 userInfo:v10];
      goto LABEL_54;
    }
    v19 = 0;
    v21 = 0;
LABEL_55:

    goto LABEL_56;
  }
  if (a4)
  {
    v16 = a4;
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F502C8];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    v19 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sessionID"];
    v68[0] = v19;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
    id v20 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
    id v8 = 0;
    v21 = 0;
    id *v16 = v20;
    goto LABEL_55;
  }
  id v8 = 0;
  v21 = 0;
LABEL_56:

  return v21;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriUI *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_viewMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dismissalReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriUI;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_46;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_26;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_26;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_26;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasStarting = 1;
          break;
        case 6u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
          {
            double v32 = *(double *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v32 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v32;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_45;
          }
          continue;
      }
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
          goto LABEL_38;
        }
        v23 += 7;
        BOOL v17 = v24++ >= 9;
        if (v17)
        {
          uint64_t v25 = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8]) {
        uint64_t v25 = 0;
      }
LABEL_40:
      v5->_starting = v25 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_45:
  }
    id v33 = 0;
  else {
LABEL_46:
  }
    id v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriUI *)self sessionID];
  id v5 = [(BMSiriUI *)self uuid];
  id v6 = [(BMSiriUI *)self viewMode];
  uint64_t v7 = [(BMSiriUI *)self dismissalReason];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriUI starting](self, "starting"));
  v9 = [(BMSiriUI *)self absoluteTimestamp];
  char v10 = (void *)[v3 initWithFormat:@"BMSiriUI with sessionID: %@, uuid: %@, viewMode: %@, dismissalReason: %@, starting: %@, absoluteTimestamp: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriUI)initWithSessionID:(id)a3 uuid:(id)a4 viewMode:(id)a5 dismissalReason:(id)a6 starting:(id)a7 absoluteTimestamp:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriUI;
  v19 = [(BMEventBase *)&v24 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23);
    objc_storeStrong((id *)&v19->_sessionID, a3);
    objc_storeStrong((id *)&v19->_uuid, a4);
    objc_storeStrong((id *)&v19->_viewMode, a5);
    objc_storeStrong((id *)&v19->_dismissalReason, a6);
    if (v17)
    {
      v19->_hasStarting = 1;
      v19->_starting = [v17 BOOLValue];
    }
    else
    {
      v19->_hasStarting = 0;
      v19->_starting = 0;
    }
    if (v18)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSinceReferenceDate];
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionID" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uuid" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewMode" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dismissalReason" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:6 type:0 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5160;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uuid" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewMode" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dismissalReason" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:1];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriUI alloc] initByReadFrom:v7];
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