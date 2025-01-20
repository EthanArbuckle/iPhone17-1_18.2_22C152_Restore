@interface BMSiriSelfTriggerSuppression
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriSelfTriggerSuppression)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriSelfTriggerSuppression)initWithNumSelfTriggersDetectedDuringEvent:(id)a3 durationOfSelfTriggerEventInSec:(id)a4 audioSource:(int)a5 isBluetoothSpeakerActive:(id)a6 isBuiltInSpeakerActive:(id)a7;
- (BOOL)hasDurationOfSelfTriggerEventInSec;
- (BOOL)hasIsBluetoothSpeakerActive;
- (BOOL)hasIsBuiltInSpeakerActive;
- (BOOL)hasNumSelfTriggersDetectedDuringEvent;
- (BOOL)isBluetoothSpeakerActive;
- (BOOL)isBuiltInSpeakerActive;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)durationOfSelfTriggerEventInSec;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)audioSource;
- (unsigned)dataVersion;
- (unsigned)numSelfTriggersDetectedDuringEvent;
- (void)setHasDurationOfSelfTriggerEventInSec:(BOOL)a3;
- (void)setHasIsBluetoothSpeakerActive:(BOOL)a3;
- (void)setHasIsBuiltInSpeakerActive:(BOOL)a3;
- (void)setHasNumSelfTriggersDetectedDuringEvent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriSelfTriggerSuppression

- (void)setHasIsBuiltInSpeakerActive:(BOOL)a3
{
  self->_hasIsBuiltInSpeakerActive = a3;
}

- (BOOL)hasIsBuiltInSpeakerActive
{
  return self->_hasIsBuiltInSpeakerActive;
}

- (BOOL)isBuiltInSpeakerActive
{
  return self->_isBuiltInSpeakerActive;
}

- (void)setHasIsBluetoothSpeakerActive:(BOOL)a3
{
  self->_hasIsBluetoothSpeakerActive = a3;
}

- (BOOL)hasIsBluetoothSpeakerActive
{
  return self->_hasIsBluetoothSpeakerActive;
}

- (BOOL)isBluetoothSpeakerActive
{
  return self->_isBluetoothSpeakerActive;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (void)setHasDurationOfSelfTriggerEventInSec:(BOOL)a3
{
  self->_hasDurationOfSelfTriggerEventInSec = a3;
}

- (BOOL)hasDurationOfSelfTriggerEventInSec
{
  return self->_hasDurationOfSelfTriggerEventInSec;
}

- (double)durationOfSelfTriggerEventInSec
{
  return self->_durationOfSelfTriggerEventInSec;
}

- (void)setHasNumSelfTriggersDetectedDuringEvent:(BOOL)a3
{
  self->_hasNumSelfTriggersDetectedDuringEvent = a3;
}

- (BOOL)hasNumSelfTriggersDetectedDuringEvent
{
  return self->_hasNumSelfTriggersDetectedDuringEvent;
}

- (unsigned)numSelfTriggersDetectedDuringEvent
{
  return self->_numSelfTriggersDetectedDuringEvent;
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
    if (-[BMSiriSelfTriggerSuppression hasNumSelfTriggersDetectedDuringEvent](self, "hasNumSelfTriggersDetectedDuringEvent")|| [v5 hasNumSelfTriggersDetectedDuringEvent])
    {
      if (![(BMSiriSelfTriggerSuppression *)self hasNumSelfTriggersDetectedDuringEvent])goto LABEL_24; {
      if (![v5 hasNumSelfTriggersDetectedDuringEvent])
      }
        goto LABEL_24;
      unsigned int v6 = [(BMSiriSelfTriggerSuppression *)self numSelfTriggersDetectedDuringEvent];
      if (v6 != [v5 numSelfTriggersDetectedDuringEvent]) {
        goto LABEL_24;
      }
    }
    if ([(BMSiriSelfTriggerSuppression *)self hasDurationOfSelfTriggerEventInSec]
      || [v5 hasDurationOfSelfTriggerEventInSec])
    {
      if (![(BMSiriSelfTriggerSuppression *)self hasDurationOfSelfTriggerEventInSec])goto LABEL_24; {
      if (![v5 hasDurationOfSelfTriggerEventInSec])
      }
        goto LABEL_24;
      [(BMSiriSelfTriggerSuppression *)self durationOfSelfTriggerEventInSec];
      double v8 = v7;
      [v5 durationOfSelfTriggerEventInSec];
      if (v8 != v9) {
        goto LABEL_24;
      }
    }
    int v10 = [(BMSiriSelfTriggerSuppression *)self audioSource];
    if (v10 != [v5 audioSource]) {
      goto LABEL_24;
    }
    if ([(BMSiriSelfTriggerSuppression *)self hasIsBluetoothSpeakerActive]
      || [v5 hasIsBluetoothSpeakerActive])
    {
      if (![(BMSiriSelfTriggerSuppression *)self hasIsBluetoothSpeakerActive]) {
        goto LABEL_24;
      }
      if (![v5 hasIsBluetoothSpeakerActive]) {
        goto LABEL_24;
      }
      int v11 = [(BMSiriSelfTriggerSuppression *)self isBluetoothSpeakerActive];
      if (v11 != [v5 isBluetoothSpeakerActive]) {
        goto LABEL_24;
      }
    }
    if (![(BMSiriSelfTriggerSuppression *)self hasIsBuiltInSpeakerActive]
      && ![v5 hasIsBuiltInSpeakerActive])
    {
      LOBYTE(v13) = 1;
      goto LABEL_25;
    }
    if ([(BMSiriSelfTriggerSuppression *)self hasIsBuiltInSpeakerActive]
      && [v5 hasIsBuiltInSpeakerActive])
    {
      BOOL v12 = [(BMSiriSelfTriggerSuppression *)self isBuiltInSpeakerActive];
      int v13 = v12 ^ [v5 isBuiltInSpeakerActive] ^ 1;
    }
    else
    {
LABEL_24:
      LOBYTE(v13) = 0;
    }
LABEL_25:

    goto LABEL_26;
  }
  LOBYTE(v13) = 0;
LABEL_26:

  return v13;
}

- (id)jsonDictionary
{
  v20[5] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriSelfTriggerSuppression *)self hasNumSelfTriggersDetectedDuringEvent])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriSelfTriggerSuppression numSelfTriggersDetectedDuringEvent](self, "numSelfTriggersDetectedDuringEvent"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (![(BMSiriSelfTriggerSuppression *)self hasDurationOfSelfTriggerEventInSec]
    || ([(BMSiriSelfTriggerSuppression *)self durationOfSelfTriggerEventInSec],
        fabs(v4) == INFINITY))
  {
    unsigned int v6 = 0;
  }
  else
  {
    [(BMSiriSelfTriggerSuppression *)self durationOfSelfTriggerEventInSec];
    id v5 = NSNumber;
    [(BMSiriSelfTriggerSuppression *)self durationOfSelfTriggerEventInSec];
    unsigned int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  double v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSelfTriggerSuppression audioSource](self, "audioSource"));
  if ([(BMSiriSelfTriggerSuppression *)self hasIsBluetoothSpeakerActive])
  {
    double v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriSelfTriggerSuppression isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive"));
  }
  else
  {
    double v8 = 0;
  }
  if ([(BMSiriSelfTriggerSuppression *)self hasIsBuiltInSpeakerActive])
  {
    double v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriSelfTriggerSuppression isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive"));
  }
  else
  {
    double v9 = 0;
  }
  uint64_t v17 = v3;
  v19[0] = @"numSelfTriggersDetectedDuringEvent";
  int v10 = (void *)v3;
  if (!v3)
  {
    int v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[0] = v10;
  v19[1] = @"durationOfSelfTriggerEventInSec";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[1] = v11;
  v19[2] = @"audioSource";
  BOOL v12 = v7;
  if (!v7)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[2] = v12;
  v19[3] = @"isBluetoothSpeakerActive";
  int v13 = v8;
  if (!v8)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[3] = v13;
  v19[4] = @"isBuiltInSpeakerActive";
  v14 = v9;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[4] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 5, v17);
  if (v9)
  {
    if (v8) {
      goto LABEL_26;
    }
  }
  else
  {

    if (v8)
    {
LABEL_26:
      if (v7) {
        goto LABEL_27;
      }
LABEL_35:

      if (v6) {
        goto LABEL_28;
      }
      goto LABEL_36;
    }
  }

  if (!v7) {
    goto LABEL_35;
  }
LABEL_27:
  if (v6) {
    goto LABEL_28;
  }
LABEL_36:

LABEL_28:
  if (!v18) {

  }
  return v15;
}

- (BMSiriSelfTriggerSuppression)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"numSelfTriggersDetectedDuringEvent"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"durationOfSelfTriggerEventInSec"];
    v32 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v36 = 0;
          v14 = 0;
          goto LABEL_33;
        }
        id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"durationOfSelfTriggerEventInSec"];
        v44 = v34;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        int v10 = v17 = a4;
        id v36 = 0;
        v14 = 0;
        *uint64_t v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
        goto LABEL_32;
      }
      id v36 = v9;
    }
    else
    {
      id v36 = 0;
    }
    int v10 = [v6 objectForKeyedSubscript:@"audioSource"];
    id v33 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v32)
          {
            v34 = 0;
            v14 = 0;
            goto LABEL_32;
          }
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v41 = *MEMORY[0x1E4F28568];
          id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"audioSource"];
          id v42 = v19;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          id v28 = (id)[v35 initWithDomain:v27 code:2 userInfo:v18];
          v34 = 0;
          v14 = 0;
          id *v32 = v28;
LABEL_31:

          id v8 = v33;
LABEL_32:

          goto LABEL_33;
        }
        id v11 = [NSNumber numberWithInt:BMSiriSelfTriggerSuppressionAudioSourceFromString(v10)];
      }
      v34 = v11;
    }
    else
    {
      v34 = 0;
    }
    v18 = [v6 objectForKeyedSubscript:@"isBluetoothSpeakerActive"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v32)
        {
          id v19 = 0;
          v14 = 0;
          goto LABEL_31;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBluetoothSpeakerActive"];
        id v40 = v21;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v24 = (id)[v30 initWithDomain:v23 code:2 userInfo:v20];
        v14 = 0;
        id v19 = 0;
        id *v32 = v24;
        goto LABEL_30;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"isBuiltInSpeakerActive"];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v32)
        {
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v37 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBuiltInSpeakerActive"];
          v38 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          id *v32 = (id)[v31 initWithDomain:v29 code:2 userInfo:v26];
        }
        id v21 = 0;
        v14 = 0;
        goto LABEL_30;
      }
      id v21 = v20;
    }
    else
    {
      id v21 = 0;
    }
    v14 = -[BMSiriSelfTriggerSuppression initWithNumSelfTriggersDetectedDuringEvent:durationOfSelfTriggerEventInSec:audioSource:isBluetoothSpeakerActive:isBuiltInSpeakerActive:](self, "initWithNumSelfTriggersDetectedDuringEvent:durationOfSelfTriggerEventInSec:audioSource:isBluetoothSpeakerActive:isBuiltInSpeakerActive:", v33, v36, [v34 intValue], v19, v21);
    self = v14;
LABEL_30:

    goto LABEL_31;
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
    v14 = 0;
    goto LABEL_34;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v45 = *MEMORY[0x1E4F28568];
  id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numSelfTriggersDetectedDuringEvent"];
  v46[0] = v36;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v8 = 0;
  v14 = 0;
  *a4 = (id)[v12 initWithDomain:v13 code:2 userInfo:v9];
LABEL_33:

LABEL_34:
  return v14;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriSelfTriggerSuppression *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasNumSelfTriggersDetectedDuringEvent) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDurationOfSelfTriggerEventInSec) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIsBluetoothSpeakerActive) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBuiltInSpeakerActive) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMSiriSelfTriggerSuppression;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_77;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasNumSelfTriggersDetectedDuringEvent = 1;
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
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_56:
          v5->_numSelfTriggersDetectedDuringEvent = v22;
          continue;
        case 2u:
          v5->_hasDurationOfSelfTriggerEventInSec = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(double *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0.0;
          }
          v5->_durationOfSelfTriggerEventInSec = v29;
          continue;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_60:
          if (v32 >= 3) {
            LODWORD(v32) = 0;
          }
          v5->_audioSource = v32;
          continue;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasIsBluetoothSpeakerActive = 1;
          while (1)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7]) {
              break;
            }
            char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v42;
            v39 |= (unint64_t)(v43 & 0x7F) << v37;
            if ((v43 & 0x80) == 0) {
              goto LABEL_64;
            }
            v37 += 7;
            BOOL v17 = v38++ >= 9;
            if (v17)
            {
              uint64_t v39 = 0;
              goto LABEL_66;
            }
          }
          v4[*v8] = 1;
LABEL_64:
          if (v4[*v8]) {
            uint64_t v39 = 0;
          }
LABEL_66:
          BOOL v51 = v39 != 0;
          uint64_t v52 = 18;
          goto LABEL_71;
        case 5u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          v5->_hasIsBuiltInSpeakerActive = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_76;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v6;
        uint64_t v48 = *(void *)&v4[v47];
        unint64_t v49 = v48 + 1;
        if (v48 == -1 || v49 > *(void *)&v4[*v7]) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
        *(void *)&v4[v47] = v49;
        v46 |= (unint64_t)(v50 & 0x7F) << v44;
        if ((v50 & 0x80) == 0) {
          goto LABEL_68;
        }
        v44 += 7;
        BOOL v17 = v45++ >= 9;
        if (v17)
        {
          uint64_t v46 = 0;
          goto LABEL_70;
        }
      }
      v4[*v8] = 1;
LABEL_68:
      if (v4[*v8]) {
        uint64_t v46 = 0;
      }
LABEL_70:
      BOOL v51 = v46 != 0;
      uint64_t v52 = 20;
LABEL_71:
      *((unsigned char *)&v5->super.super.isa + v52) = v51;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_76:
  }
    v53 = 0;
  else {
LABEL_77:
  }
    v53 = v5;

  return v53;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriSelfTriggerSuppression numSelfTriggersDetectedDuringEvent](self, "numSelfTriggersDetectedDuringEvent"));
  id v5 = NSNumber;
  [(BMSiriSelfTriggerSuppression *)self durationOfSelfTriggerEventInSec];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = BMSiriSelfTriggerSuppressionAudioSourceAsString([(BMSiriSelfTriggerSuppression *)self audioSource]);
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriSelfTriggerSuppression isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive"));
  double v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriSelfTriggerSuppression isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive"));
  char v10 = (void *)[v3 initWithFormat:@"BMSiriSelfTriggerSuppression with numSelfTriggersDetectedDuringEvent: %@, durationOfSelfTriggerEventInSec: %@, audioSource: %@, isBluetoothSpeakerActive: %@, isBuiltInSpeakerActive: %@", v4, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriSelfTriggerSuppression)initWithNumSelfTriggersDetectedDuringEvent:(id)a3 durationOfSelfTriggerEventInSec:(id)a4 audioSource:(int)a5 isBluetoothSpeakerActive:(id)a6 isBuiltInSpeakerActive:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriSelfTriggerSuppression;
  char v16 = [(BMEventBase *)&v20 init];
  if (v16)
  {
    v16->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v16->_hasNumSelfTriggersDetectedDuringEvent = 1;
      unsigned int v17 = [v12 unsignedIntValue];
    }
    else
    {
      unsigned int v17 = 0;
      v16->_hasNumSelfTriggersDetectedDuringEvent = 0;
    }
    v16->_numSelfTriggersDetectedDuringEvent = v17;
    if (v13)
    {
      v16->_hasDurationOfSelfTriggerEventInSec = 1;
      [v13 doubleValue];
    }
    else
    {
      v16->_hasDurationOfSelfTriggerEventInSec = 0;
      double v18 = -1.0;
    }
    v16->_durationOfSelfTriggerEventInSec = v18;
    v16->_audioSource = a5;
    if (v14)
    {
      v16->_hasIsBluetoothSpeakerActive = 1;
      v16->_isBluetoothSpeakerActive = [v14 BOOLValue];
    }
    else
    {
      v16->_hasIsBluetoothSpeakerActive = 0;
      v16->_isBluetoothSpeakerActive = 0;
    }
    if (v15)
    {
      v16->_hasIsBuiltInSpeakerActive = 1;
      v16->_isBuiltInSpeakerActive = [v15 BOOLValue];
    }
    else
    {
      v16->_hasIsBuiltInSpeakerActive = 0;
      v16->_isBuiltInSpeakerActive = 0;
    }
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numSelfTriggersDetectedDuringEvent" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"durationOfSelfTriggerEventInSec", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioSource" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBluetoothSpeakerActive" number:4 type:12 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBuiltInSpeakerActive" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6EB8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numSelfTriggersDetectedDuringEvent" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"durationOfSelfTriggerEventInSec" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioSource" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBluetoothSpeakerActive" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBuiltInSpeakerActive" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
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

    id v8 = [[BMSiriSelfTriggerSuppression alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end