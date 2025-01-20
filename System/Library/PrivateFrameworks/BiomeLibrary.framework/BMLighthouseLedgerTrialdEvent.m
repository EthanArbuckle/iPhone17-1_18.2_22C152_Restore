@interface BMLighthouseLedgerTrialdEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (BMLighthouseLedgerTrialdEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseLedgerTrialdEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventType:(int)a6 eventSucceeded:(id)a7;
- (BOOL)eventSucceeded;
- (BOOL)hasEventSucceeded;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)contextID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)eventType;
- (unsigned)dataVersion;
- (void)setHasEventSucceeded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseLedgerTrialdEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
}

- (void)setHasEventSucceeded:(BOOL)a3
{
  self->_hasEventSucceeded = a3;
}

- (BOOL)hasEventSucceeded
{
  return self->_hasEventSucceeded;
}

- (BOOL)eventSucceeded
{
  return self->_eventSucceeded;
}

- (int)eventType
{
  return self->_eventType;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
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
    v6 = [(BMLighthouseLedgerTrialdEvent *)self trialIdentifiers];
    uint64_t v7 = [v5 trialIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLighthouseLedgerTrialdEvent *)self trialIdentifiers];
      v10 = [v5 trialIdentifiers];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMLighthouseLedgerTrialdEvent *)self contextID];
    uint64_t v14 = [v5 contextID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLighthouseLedgerTrialdEvent *)self contextID];
      v17 = [v5 contextID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMLighthouseLedgerTrialdEvent *)self timestamp];
    uint64_t v20 = [v5 timestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMLighthouseLedgerTrialdEvent *)self timestamp];
      v23 = [v5 timestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    int v25 = [(BMLighthouseLedgerTrialdEvent *)self eventType];
    if (v25 == [v5 eventType])
    {
      if (![(BMLighthouseLedgerTrialdEvent *)self hasEventSucceeded]
        && ![v5 hasEventSucceeded])
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if ([(BMLighthouseLedgerTrialdEvent *)self hasEventSucceeded]
        && [v5 hasEventSucceeded])
      {
        BOOL v26 = [(BMLighthouseLedgerTrialdEvent *)self eventSucceeded];
        int v12 = v26 ^ [v5 eventSucceeded] ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
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
  v26[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLighthouseLedgerTrialdEvent *)self trialIdentifiers];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMLighthouseLedgerTrialdEvent *)self contextID];
  v6 = [(BMLighthouseLedgerTrialdEvent *)self timestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMLighthouseLedgerTrialdEvent *)self timestamp];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }

  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerTrialdEvent eventType](self, "eventType"));
  if ([(BMLighthouseLedgerTrialdEvent *)self hasEventSucceeded])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLighthouseLedgerTrialdEvent eventSucceeded](self, "eventSucceeded"));
  }
  else
  {
    int v11 = 0;
  }
  v21 = @"trialIdentifiers";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v26[0] = v12;
  v22 = @"contextID";
  v13 = v5;
  if (!v5)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21, v22);
  }
  v26[1] = v13;
  v23 = @"timestamp";
  uint64_t v14 = v9;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[2] = v14;
  int v24 = @"eventType";
  v15 = v10;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[3] = v15;
  int v25 = @"eventSucceeded";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v21, 5, v19);
  if (v11)
  {
    if (v10) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v10)
    {
LABEL_19:
      if (v9) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v9)
  {
LABEL_20:
    if (v5) {
      goto LABEL_21;
    }
LABEL_28:

    if (v4) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v5) {
    goto LABEL_28;
  }
LABEL_21:
  if (v4) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v17;
}

- (BMLighthouseLedgerTrialdEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"trialIdentifiers"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
    id v50 = 0;
    v8 = [[BMLighthouseLedgerTrialIdentifiers alloc] initWithJSONDictionary:v11 error:&v50];
    id v12 = v50;
    if (v12)
    {
      v13 = v12;
      if (a4) {
        *a4 = v12;
      }

      uint64_t v14 = 0;
      goto LABEL_42;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"contextID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          uint64_t v14 = 0;
          goto LABEL_41;
        }
        v42 = a4;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        v48 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contextID"];
        v58 = v48;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        id v49 = 0;
        uint64_t v14 = 0;
        id *v42 = (id)[v25 initWithDomain:v26 code:2 userInfo:v10];
LABEL_40:

        id v11 = v49;
LABEL_41:

        goto LABEL_42;
      }
      id v49 = v9;
    }
    else
    {
      id v49 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"timestamp"];
    v46 = v9;
    v47 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (objc_class *)MEMORY[0x1E4F1C9C8];
        v16 = a4;
        id v17 = v10;
        id v18 = [v15 alloc];
        [v17 doubleValue];
        double v20 = v19;

        a4 = v16;
        id v21 = (id)[v18 initWithTimeIntervalSince1970:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v48 = [v27 dateFromString:v10];

          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v48 = 0;
            uint64_t v14 = 0;
            goto LABEL_40;
          }
          v45 = a4;
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
          v56 = v30;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          v48 = 0;
          uint64_t v14 = 0;
          id *v45 = (id)[v38 initWithDomain:v39 code:2 userInfo:v28];
          goto LABEL_39;
        }
        id v21 = v10;
      }
      v48 = v21;
    }
    else
    {
      v48 = 0;
    }
LABEL_26:
    v28 = [v6 objectForKeyedSubscript:@"eventType"];
    v29 = a4;
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v28;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v30 = 0;
            uint64_t v14 = 0;
            goto LABEL_39;
          }
          id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v53 = *MEMORY[0x1E4F28568];
          v37 = a4;
          v29 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"eventType"];
          v54 = v29;
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v30 = 0;
          uint64_t v14 = 0;
          id *v37 = (id)[v44 initWithDomain:v41 code:2 userInfo:v32];
          goto LABEL_38;
        }
        id v31 = [NSNumber numberWithInt:BMLighthouseLedgerTrialdEventEventTypeFromString(v28)];
      }
      v30 = v31;
    }
    else
    {
      v30 = 0;
    }
    v32 = [v6 objectForKeyedSubscript:@"eventSucceeded"];
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v29)
        {
          v34 = v29;
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v51 = *MEMORY[0x1E4F28568];
          v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"eventSucceeded"];
          v52 = v35;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          id *v34 = (id)[v43 initWithDomain:v40 code:2 userInfo:v36];

          v29 = 0;
        }
        uint64_t v14 = 0;
        goto LABEL_38;
      }
      v29 = v32;
    }
    else
    {
      v29 = 0;
    }
    uint64_t v14 = -[BMLighthouseLedgerTrialdEvent initWithTrialIdentifiers:contextID:timestamp:eventType:eventSucceeded:](self, "initWithTrialIdentifiers:contextID:timestamp:eventType:eventSucceeded:", v47, v49, v48, [v30 intValue], v29);
    self = v14;
LABEL_38:

LABEL_39:
    v9 = v46;
    v8 = v47;
    goto LABEL_40;
  }
  if (!a4)
  {
    uint64_t v14 = 0;
    goto LABEL_43;
  }
  v22 = a4;
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  v8 = (BMLighthouseLedgerTrialIdentifiers *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trialIdentifiers"];
  v60[0] = v8;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  uint64_t v14 = 0;
  id *v22 = (id)[v23 initWithDomain:v24 code:2 userInfo:v11];
LABEL_42:

LABEL_43:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseLedgerTrialdEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_trialIdentifiers)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerTrialIdentifiers *)self->_trialIdentifiers writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_contextID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasEventSucceeded) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMLighthouseLedgerTrialdEvent;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_58;
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_57;
          }
          double v20 = [[BMLighthouseLedgerTrialIdentifiers alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_57;
          }
          trialIdentifiers = v5->_trialIdentifiers;
          v5->_trialIdentifiers = v20;

          PBReaderRecallMark();
          break;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          contextID = v5->_contextID;
          v5->_contextID = (NSString *)v22;

          break;
        case 3u:
          v5->_hasRaw_timestamp = 1;
          uint64_t v24 = *v6;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v7])
          {
            double v26 = *(double *)(*(void *)&v4[*v9] + v25);
            *(void *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v26 = 0.0;
          }
          v5->_raw_timestamp = v26;
          break;
        case 4u:
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
              goto LABEL_44;
            }
            v27 += 7;
            BOOL v17 = v28++ >= 9;
            if (v17)
            {
              LODWORD(v29) = 0;
              goto LABEL_46;
            }
          }
          v4[*v8] = 1;
LABEL_44:
          if (v4[*v8]) {
            LODWORD(v29) = 0;
          }
LABEL_46:
          if (v29 >= 4) {
            LODWORD(v29) = 0;
          }
          v5->_eventType = v29;
          break;
        case 5u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasEventSucceeded = 1;
          while (1)
          {
            uint64_t v37 = *v6;
            uint64_t v38 = *(void *)&v4[v37];
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)&v4[*v7]) {
              break;
            }
            char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
            *(void *)&v4[v37] = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if ((v40 & 0x80) == 0) {
              goto LABEL_50;
            }
            v34 += 7;
            BOOL v17 = v35++ >= 9;
            if (v17)
            {
              uint64_t v36 = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8]) {
            uint64_t v36 = 0;
          }
LABEL_52:
          v5->_eventSucceeded = v36 != 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_57;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_57:
  }
    uint64_t v41 = 0;
  else {
LABEL_58:
  }
    uint64_t v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseLedgerTrialdEvent *)self trialIdentifiers];
  id v5 = [(BMLighthouseLedgerTrialdEvent *)self contextID];
  id v6 = [(BMLighthouseLedgerTrialdEvent *)self timestamp];
  uint64_t v7 = BMLighthouseLedgerTrialdEventEventTypeAsString([(BMLighthouseLedgerTrialdEvent *)self eventType]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLighthouseLedgerTrialdEvent eventSucceeded](self, "eventSucceeded"));
  v9 = (void *)[v3 initWithFormat:@"BMLighthouseLedgerTrialdEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, eventType: %@, eventSucceeded: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMLighthouseLedgerTrialdEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventType:(int)a6 eventSucceeded:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMLighthouseLedgerTrialdEvent;
  BOOL v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v17->_contextID, a4);
    if (v15)
    {
      v17->_hasRaw_timestamp = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_timestamp = 0;
      double v18 = -1.0;
    }
    v17->_raw_timestamp = v18;
    v17->_eventType = a6;
    if (v16)
    {
      v17->_hasEventSucceeded = 1;
      v17->_eventSucceeded = [v16 BOOLValue];
    }
    else
    {
      v17->_hasEventSucceeded = 0;
      v17->_eventSucceeded = 0;
    }
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialIdentifiers" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"contextID", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventType" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventSucceeded" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF67C8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_64];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventSucceeded" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __40__BMLighthouseLedgerTrialdEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trialIdentifiers];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
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

    v8 = [[BMLighthouseLedgerTrialdEvent alloc] initByReadFrom:v7];
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