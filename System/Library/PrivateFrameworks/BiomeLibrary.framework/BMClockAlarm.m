@interface BMClockAlarm
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMClockAlarm)initWithIsSleepAlarm:(id)a3 eventType:(int)a4 alarmID:(id)a5 lastEventType:(int)a6;
- (BMClockAlarm)initWithIsSleepAlarm:(id)a3 eventType:(int)a4 alarmID:(id)a5 lastEventType:(int)a6 enabled:(id)a7;
- (BMClockAlarm)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)enabled;
- (BOOL)hasEnabled;
- (BOOL)hasIsSleepAlarm;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSleepAlarm;
- (NSString)alarmID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)eventType;
- (int)lastEventType;
- (unsigned)dataVersion;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasIsSleepAlarm:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMClockAlarm

- (BMClockAlarm)initWithIsSleepAlarm:(id)a3 eventType:(int)a4 alarmID:(id)a5 lastEventType:(int)a6
{
  return [(BMClockAlarm *)self initWithIsSleepAlarm:a3 eventType:*(void *)&a4 alarmID:a5 lastEventType:*(void *)&a6 enabled:0];
}

- (void).cxx_destruct
{
}

- (void)setHasEnabled:(BOOL)a3
{
  self->_hasEnabled = a3;
}

- (BOOL)hasEnabled
{
  return self->_hasEnabled;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int)lastEventType
{
  return self->_lastEventType;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setHasIsSleepAlarm:(BOOL)a3
{
  self->_hasIsSleepAlarm = a3;
}

- (BOOL)hasIsSleepAlarm
{
  return self->_hasIsSleepAlarm;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
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
    if (-[BMClockAlarm hasIsSleepAlarm](self, "hasIsSleepAlarm") || [v5 hasIsSleepAlarm])
    {
      if (![(BMClockAlarm *)self hasIsSleepAlarm]) {
        goto LABEL_19;
      }
      if (![v5 hasIsSleepAlarm]) {
        goto LABEL_19;
      }
      int v6 = [(BMClockAlarm *)self isSleepAlarm];
      if (v6 != [v5 isSleepAlarm]) {
        goto LABEL_19;
      }
    }
    int v7 = [(BMClockAlarm *)self eventType];
    if (v7 != [v5 eventType]) {
      goto LABEL_19;
    }
    v8 = [(BMClockAlarm *)self alarmID];
    uint64_t v9 = [v5 alarmID];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      v11 = [(BMClockAlarm *)self alarmID];
      v12 = [v5 alarmID];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_19;
      }
    }
    int v15 = [(BMClockAlarm *)self lastEventType];
    if (v15 == [v5 lastEventType])
    {
      if (!-[BMClockAlarm hasEnabled](self, "hasEnabled") && ![v5 hasEnabled])
      {
        LOBYTE(v14) = 1;
        goto LABEL_20;
      }
      if (-[BMClockAlarm hasEnabled](self, "hasEnabled") && [v5 hasEnabled])
      {
        BOOL v16 = [(BMClockAlarm *)self enabled];
        int v14 = v16 ^ [v5 enabled] ^ 1;
LABEL_20:

        goto LABEL_21;
      }
    }
LABEL_19:
    LOBYTE(v14) = 0;
    goto LABEL_20;
  }
  LOBYTE(v14) = 0;
LABEL_21:

  return v14;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if ([(BMClockAlarm *)self hasIsSleepAlarm])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMClockAlarm isSleepAlarm](self, "isSleepAlarm"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMClockAlarm eventType](self, "eventType"));
  id v5 = [(BMClockAlarm *)self alarmID];
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMClockAlarm lastEventType](self, "lastEventType"));
  if ([(BMClockAlarm *)self hasEnabled])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMClockAlarm enabled](self, "enabled"));
  }
  else
  {
    int v7 = 0;
  }
  v17 = @"isSleepAlarm";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"eventType";
  uint64_t v9 = v4;
  if (!v4)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"alarmID";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"lastEventType";
  v11 = v6;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"enabled";
  v12 = v7;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  int v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v6)
    {
LABEL_19:
      if (v5) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v5)
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

  return v13;
}

- (BMClockAlarm)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"isSleepAlarm"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"eventType"];
    v31 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v35 = 0;
            int v13 = 0;
            goto LABEL_38;
          }
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"eventType"];
          id v44 = v33;
          int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id v26 = (id)[v36 initWithDomain:v25 code:2 userInfo:v14];
          v35 = 0;
          int v13 = 0;
          id *v31 = v26;
          goto LABEL_37;
        }
        id v10 = [NSNumber numberWithInt:BMClockAlarmEventTypeFromString(v9)];
      }
      v35 = v10;
    }
    else
    {
      v35 = 0;
    }
    int v14 = [v6 objectForKeyedSubscript:@"alarmID"];
    id v32 = v8;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v31)
        {
          id v33 = 0;
          int v13 = 0;
          goto LABEL_37;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        BOOL v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"alarmID"];
        v42 = v16;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v19 = (id)[v34 initWithDomain:v18 code:2 userInfo:v15];
        id v33 = 0;
        int v13 = 0;
        id *v31 = v19;
LABEL_36:

        id v8 = v32;
LABEL_37:

        goto LABEL_38;
      }
      id v33 = v14;
    }
    else
    {
      id v33 = 0;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"lastEventType"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v31)
          {
            BOOL v16 = 0;
            int v13 = 0;
            goto LABEL_36;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v39 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"lastEventType"];
          id v40 = v21;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          BOOL v16 = 0;
          int v13 = 0;
          id *v31 = (id)[v30 initWithDomain:v28 code:2 userInfo:v20];
          goto LABEL_35;
        }
        id v17 = [NSNumber numberWithInt:BMClockAlarmLastEventTypeFromString(v15)];
      }
      BOOL v16 = v17;
    }
    else
    {
      BOOL v16 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"enabled"];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v31)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v37 = *MEMORY[0x1E4F28568];
          v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"enabled"];
          v38 = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          id *v31 = (id)[v29 initWithDomain:v27 code:2 userInfo:v24];
        }
        id v21 = 0;
        int v13 = 0;
        goto LABEL_35;
      }
      id v21 = v20;
    }
    else
    {
      id v21 = 0;
    }
    int v13 = -[BMClockAlarm initWithIsSleepAlarm:eventType:alarmID:lastEventType:enabled:](self, "initWithIsSleepAlarm:eventType:alarmID:lastEventType:enabled:", v32, [v35 intValue], v33, objc_msgSend(v16, "intValue"), v21);
    self = v13;
LABEL_35:

    goto LABEL_36;
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
    int v13 = 0;
    goto LABEL_39;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F502C8];
  uint64_t v45 = *MEMORY[0x1E4F28568];
  v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSleepAlarm"];
  v46[0] = v35;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v8 = 0;
  int v13 = 0;
  *a4 = (id)[v11 initWithDomain:v12 code:2 userInfo:v9];
LABEL_38:

LABEL_39:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMClockAlarm *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasIsSleepAlarm) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_alarmID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasEnabled) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMClockAlarm;
  id v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_76;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v12 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasIsSleepAlarm = 1;
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
              goto LABEL_52;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_54;
            }
          }
          v4[*v8] = 1;
LABEL_52:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_54:
          BOOL v44 = v21 != 0;
          uint64_t v45 = 16;
          goto LABEL_72;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v6;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_58:
          if (v27 >= 7) {
            LODWORD(v27) = 0;
          }
          uint64_t v46 = 24;
          goto LABEL_67;
        case 3u:
          uint64_t v31 = PBReaderReadString();
          alarmID = v5->_alarmID;
          v5->_alarmID = (NSString *)v31;

          continue;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v35 = *v6;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v36 + 1;
              v27 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_64:
          if (v27 >= 0xC) {
            LODWORD(v27) = 0;
          }
          uint64_t v46 = 28;
LABEL_67:
          *(_DWORD *)((char *)&v5->super.super.isa + v46) = v27;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_75;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v6;
        unint64_t v42 = *(void *)&v4[v41];
        if (v42 == -1 || v42 >= *(void *)&v4[*v7]) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
        *(void *)&v4[v41] = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_69;
        }
        v38 += 7;
        BOOL v16 = v39++ >= 9;
        if (v16)
        {
          uint64_t v40 = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8]) {
        uint64_t v40 = 0;
      }
LABEL_71:
      BOOL v44 = v40 != 0;
      uint64_t v45 = 18;
LABEL_72:
      *((unsigned char *)&v5->super.super.isa + v45) = v44;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_75:
  }
    v47 = 0;
  else {
LABEL_76:
  }
    v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMClockAlarm isSleepAlarm](self, "isSleepAlarm"));
  id v5 = BMClockAlarmEventTypeAsString([(BMClockAlarm *)self eventType]);
  id v6 = [(BMClockAlarm *)self alarmID];
  int v7 = BMClockAlarmLastEventTypeAsString([(BMClockAlarm *)self lastEventType]);
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMClockAlarm enabled](self, "enabled"));
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMClockAlarm with isSleepAlarm: %@, eventType: %@, alarmID: %@, lastEventType: %@, enabled: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMClockAlarm)initWithIsSleepAlarm:(id)a3 eventType:(int)a4 alarmID:(id)a5 lastEventType:(int)a6 enabled:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMClockAlarm;
  char v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v15->_hasIsSleepAlarm = 1;
      v15->_isSleepAlarm = [v12 BOOLValue];
    }
    else
    {
      v15->_hasIsSleepAlarm = 0;
      v15->_isSleepAlarm = 0;
    }
    v15->_eventType = a4;
    objc_storeStrong((id *)&v15->_alarmID, a5);
    v15->_lastEventType = a6;
    if (v14)
    {
      v15->_hasEnabled = 1;
      v15->_enabled = [v14 BOOLValue];
    }
    else
    {
      v15->_hasEnabled = 0;
      v15->_enabled = 0;
    }
  }

  return v15;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSleepAlarm" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"eventType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"alarmID" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastEventType" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enabled" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4818;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSleepAlarm" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"alarmID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastEventType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"enabled" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMClockAlarm_v1;
  }
  else
  {
    if (a4 != 2)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMClockAlarm;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  uint64_t v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 20) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end