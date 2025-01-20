@interface BMMLSEShareSheetMetricsSystemResourceUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEShareSheetMetricsSystemResourceUsage)initWithDuration:(id)a3 userType:(int)a4 timeoutOccured:(id)a5 identifier:(id)a6 subidentifier:(id)a7;
- (BMMLSEShareSheetMetricsSystemResourceUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasDuration;
- (BOOL)hasTimeoutOccured;
- (BOOL)isEqual:(id)a3;
- (BOOL)timeoutOccured;
- (NSString)description;
- (NSString)identifier;
- (NSString)subidentifier;
- (double)duration;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)userType;
- (unsigned)dataVersion;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimeoutOccured:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEShareSheetMetricsSystemResourceUsage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subidentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setHasTimeoutOccured:(BOOL)a3
{
  self->_hasTimeoutOccured = a3;
}

- (BOOL)hasTimeoutOccured
{
  return self->_hasTimeoutOccured;
}

- (BOOL)timeoutOccured
{
  return self->_timeoutOccured;
}

- (int)userType
{
  return self->_userType;
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
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v17 = 0;
    goto LABEL_18;
  }
  id v5 = v4;
  if ([(BMMLSEShareSheetMetricsSystemResourceUsage *)self hasDuration]
    || [v5 hasDuration])
  {
    if (![(BMMLSEShareSheetMetricsSystemResourceUsage *)self hasDuration]) {
      goto LABEL_15;
    }
    if (![v5 hasDuration]) {
      goto LABEL_15;
    }
    [(BMMLSEShareSheetMetricsSystemResourceUsage *)self duration];
    double v7 = v6;
    [v5 duration];
    if (v7 != v8) {
      goto LABEL_15;
    }
  }
  int v9 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self userType];
  if (v9 != [v5 userType]) {
    goto LABEL_15;
  }
  if ([(BMMLSEShareSheetMetricsSystemResourceUsage *)self hasTimeoutOccured]
    || [v5 hasTimeoutOccured])
  {
    if (![(BMMLSEShareSheetMetricsSystemResourceUsage *)self hasTimeoutOccured]) {
      goto LABEL_15;
    }
    if (![v5 hasTimeoutOccured]) {
      goto LABEL_15;
    }
    int v10 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self timeoutOccured];
    if (v10 != [v5 timeoutOccured]) {
      goto LABEL_15;
    }
  }
  v11 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self identifier];
  uint64_t v12 = [v5 identifier];
  if (v11 == (void *)v12)
  {

    goto LABEL_20;
  }
  v13 = (void *)v12;
  v14 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self identifier];
  v15 = [v5 identifier];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
LABEL_20:
    v19 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self subidentifier];
    v20 = [v5 subidentifier];
    if (v19 == v20)
    {
      char v17 = 1;
    }
    else
    {
      v21 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self subidentifier];
      v22 = [v5 subidentifier];
      char v17 = [v21 isEqual:v22];
    }
    goto LABEL_16;
  }
LABEL_15:
  char v17 = 0;
LABEL_16:

LABEL_18:
  return v17;
}

- (id)jsonDictionary
{
  v24[5] = *MEMORY[0x1E4F143B8];
  if (![(BMMLSEShareSheetMetricsSystemResourceUsage *)self hasDuration]
    || ([(BMMLSEShareSheetMetricsSystemResourceUsage *)self duration], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMMLSEShareSheetMetricsSystemResourceUsage *)self duration];
    id v4 = NSNumber;
    [(BMMLSEShareSheetMetricsSystemResourceUsage *)self duration];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  double v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEShareSheetMetricsSystemResourceUsage userType](self, "userType"));
  if ([(BMMLSEShareSheetMetricsSystemResourceUsage *)self hasTimeoutOccured])
  {
    double v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEShareSheetMetricsSystemResourceUsage timeoutOccured](self, "timeoutOccured"));
  }
  else
  {
    double v7 = 0;
  }
  double v8 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self identifier];
  int v9 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self subidentifier];
  v19 = @"duration";
  uint64_t v10 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v24[0] = v10;
  v20 = @"userType";
  v11 = v6;
  if (!v6)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19, v20);
  }
  v24[1] = v11;
  v21 = @"timeoutOccured";
  uint64_t v12 = v7;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[2] = v12;
  v22 = @"identifier";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v13;
  v23 = @"subidentifier";
  v14 = v9;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v19, 5, v17);
  if (v9)
  {
    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v8)
    {
LABEL_20:
      if (v7) {
        goto LABEL_21;
      }
      goto LABEL_28;
    }
  }

  if (v7)
  {
LABEL_21:
    if (v6) {
      goto LABEL_22;
    }
LABEL_29:

    if (v5) {
      goto LABEL_23;
    }
    goto LABEL_30;
  }
LABEL_28:

  if (!v6) {
    goto LABEL_29;
  }
LABEL_22:
  if (v5) {
    goto LABEL_23;
  }
LABEL_30:

LABEL_23:

  return v15;
}

- (BMMLSEShareSheetMetricsSystemResourceUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"duration"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    int v9 = [v6 objectForKeyedSubscript:@"userType"];
    v40 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v16 = 0;
            goto LABEL_29;
          }
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          v33 = a4;
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userType"];
          id v50 = v42;
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          id v35 = (id)[v32 initWithDomain:v34 code:2 userInfo:v17];
          a4 = 0;
          int v16 = 0;
          id *v33 = v35;
LABEL_28:

LABEL_29:
          double v7 = v40;
          goto LABEL_30;
        }
        uint64_t v10 = [NSNumber numberWithInt:BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString(v9)];
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    uint64_t v17 = [v6 objectForKeyedSubscript:@"timeoutOccured"];
    id v41 = v8;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v42 = 0;
          int v16 = 0;
          a4 = v39;
          goto LABEL_28;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v47 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeoutOccured"];
        id v48 = v19;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v18];
        int v16 = 0;
        id v42 = 0;
        v26 = a4;
        a4 = v39;
        id *v26 = v25;
        goto LABEL_27;
      }
      id v42 = v17;
    }
    else
    {
      id v42 = 0;
    }
    v18 = [v6 objectForKeyedSubscript:@"identifier"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v19 = 0;
          int v16 = 0;
          a4 = v39;
          goto LABEL_27;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        v37 = a4;
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v45 = *MEMORY[0x1E4F28568];
        id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        id v46 = v21;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v29 = (id)[v27 initWithDomain:v28 code:2 userInfo:v20];
        int v16 = 0;
        id v19 = 0;
        a4 = v39;
        id *v37 = v29;
        goto LABEL_26;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"subidentifier"];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subidentifier"];
          v44 = v30;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          *a4 = (id)[v38 initWithDomain:v36 code:2 userInfo:v31];
        }
        id v21 = 0;
        int v16 = 0;
        a4 = v39;
        goto LABEL_26;
      }
      id v21 = v20;
    }
    else
    {
      id v21 = 0;
    }
    a4 = v39;
    int v16 = -[BMMLSEShareSheetMetricsSystemResourceUsage initWithDuration:userType:timeoutOccured:identifier:subidentifier:](self, "initWithDuration:userType:timeoutOccured:identifier:subidentifier:", v41, [v39 intValue], v42, v19, v21);
    self = v16;
LABEL_26:

LABEL_27:
    id v8 = v41;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    int v16 = 0;
    goto LABEL_31;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = a4;
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v14 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"duration"];
  v52[0] = v14;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  uint64_t v15 = v13;
  a4 = v14;
  id v8 = 0;
  int v16 = 0;
  *uint64_t v12 = (id)[v11 initWithDomain:v15 code:2 userInfo:v9];
LABEL_30:

LABEL_31:
  return v16;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMMLSEShareSheetMetricsSystemResourceUsage *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_hasDuration) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasTimeoutOccured) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_subidentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMMLSEShareSheetMetricsSystemResourceUsage;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_57;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int v9 = (int *)MEMORY[0x1E4F940B8];
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
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          v5->_duration = v22;
          continue;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_45:
          if (v25 >= 7) {
            LODWORD(v25) = 0;
          }
          v5->_userType = v25;
          continue;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasTimeoutOccured = 1;
          break;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 40;
          goto LABEL_41;
        case 5u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 48;
LABEL_41:
          v39 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_56;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v6;
        uint64_t v34 = *(void *)&v4[v33];
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)&v4[*v7]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
        *(void *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0) {
          goto LABEL_49;
        }
        v30 += 7;
        BOOL v17 = v31++ >= 9;
        if (v17)
        {
          uint64_t v32 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8]) {
        uint64_t v32 = 0;
      }
LABEL_51:
      v5->_timeoutOccured = v32 != 0;
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
  id v4 = NSNumber;
  [(BMMLSEShareSheetMetricsSystemResourceUsage *)self duration];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = BMMLSEShareSheetMetricsSystemResourceUsageUserTypeAsString([(BMMLSEShareSheetMetricsSystemResourceUsage *)self userType]);
  double v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEShareSheetMetricsSystemResourceUsage timeoutOccured](self, "timeoutOccured"));
  id v8 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self identifier];
  int v9 = [(BMMLSEShareSheetMetricsSystemResourceUsage *)self subidentifier];
  char v10 = (void *)[v3 initWithFormat:@"BMMLSEShareSheetMetricsSystemResourceUsage with duration: %@, userType: %@, timeoutOccured: %@, identifier: %@, subidentifier: %@", v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMMLSEShareSheetMetricsSystemResourceUsage)initWithDuration:(id)a3 userType:(int)a4 timeoutOccured:(id)a5 identifier:(id)a6 subidentifier:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMMLSEShareSheetMetricsSystemResourceUsage;
  char v16 = [(BMEventBase *)&v19 init];
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
    v16->_userType = a4;
    if (v13)
    {
      v16->_hasTimeoutOccured = 1;
      v16->_timeoutOccured = [v13 BOOLValue];
    }
    else
    {
      v16->_hasTimeoutOccured = 0;
      v16->_timeoutOccured = 0;
    }
    objc_storeStrong((id *)&v16->_identifier, a6);
    objc_storeStrong((id *)&v16->_subidentifier, a7);
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"duration" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"userType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeoutOccured" number:3 type:12 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subidentifier" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6E40;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"duration" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeoutOccured" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subidentifier" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMLSEShareSheetMetricsSystemResourceUsage alloc] initByReadFrom:v7];
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