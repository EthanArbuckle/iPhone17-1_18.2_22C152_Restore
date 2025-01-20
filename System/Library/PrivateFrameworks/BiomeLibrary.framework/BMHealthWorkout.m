@interface BMHealthWorkout
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHealthWorkout)initWithIsFirstPartyDonation:(id)a3 isIndoor:(id)a4 activityType:(id)a5 eventType:(int)a6 activityUUID:(id)a7 isUpdate:(id)a8;
- (BMHealthWorkout)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsFirstPartyDonation;
- (BOOL)hasIsIndoor;
- (BOOL)hasIsUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyDonation;
- (BOOL)isIndoor;
- (BOOL)isUpdate;
- (NSString)activityType;
- (NSString)activityUUID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)eventType;
- (unsigned)dataVersion;
- (void)setHasIsFirstPartyDonation:(BOOL)a3;
- (void)setHasIsIndoor:(BOOL)a3;
- (void)setHasIsUpdate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMHealthWorkout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)setHasIsUpdate:(BOOL)a3
{
  self->_hasIsUpdate = a3;
}

- (BOOL)hasIsUpdate
{
  return self->_hasIsUpdate;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (int)eventType
{
  return self->_eventType;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setHasIsIndoor:(BOOL)a3
{
  self->_hasIsIndoor = a3;
}

- (BOOL)hasIsIndoor
{
  return self->_hasIsIndoor;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (void)setHasIsFirstPartyDonation:(BOOL)a3
{
  self->_hasIsFirstPartyDonation = a3;
}

- (BOOL)hasIsFirstPartyDonation
{
  return self->_hasIsFirstPartyDonation;
}

- (BOOL)isFirstPartyDonation
{
  return self->_isFirstPartyDonation;
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
    if ([(BMHealthWorkout *)self hasIsFirstPartyDonation]
      || [v5 hasIsFirstPartyDonation])
    {
      if (![(BMHealthWorkout *)self hasIsFirstPartyDonation]) {
        goto LABEL_27;
      }
      if (![v5 hasIsFirstPartyDonation]) {
        goto LABEL_27;
      }
      int v6 = [(BMHealthWorkout *)self isFirstPartyDonation];
      if (v6 != [v5 isFirstPartyDonation]) {
        goto LABEL_27;
      }
    }
    if (-[BMHealthWorkout hasIsIndoor](self, "hasIsIndoor") || [v5 hasIsIndoor])
    {
      if (![(BMHealthWorkout *)self hasIsIndoor]) {
        goto LABEL_27;
      }
      if (![v5 hasIsIndoor]) {
        goto LABEL_27;
      }
      int v7 = [(BMHealthWorkout *)self isIndoor];
      if (v7 != [v5 isIndoor]) {
        goto LABEL_27;
      }
    }
    v8 = [(BMHealthWorkout *)self activityType];
    uint64_t v9 = [v5 activityType];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      v11 = [(BMHealthWorkout *)self activityType];
      v12 = [v5 activityType];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_27;
      }
    }
    int v15 = [(BMHealthWorkout *)self eventType];
    if (v15 == [v5 eventType])
    {
      v16 = [(BMHealthWorkout *)self activityUUID];
      uint64_t v17 = [v5 activityUUID];
      if (v16 == (void *)v17)
      {
      }
      else
      {
        v18 = (void *)v17;
        v19 = [(BMHealthWorkout *)self activityUUID];
        v20 = [v5 activityUUID];
        int v21 = [v19 isEqual:v20];

        if (!v21) {
          goto LABEL_27;
        }
      }
      if (!-[BMHealthWorkout hasIsUpdate](self, "hasIsUpdate") && ![v5 hasIsUpdate])
      {
        LOBYTE(v14) = 1;
        goto LABEL_28;
      }
      if (-[BMHealthWorkout hasIsUpdate](self, "hasIsUpdate") && [v5 hasIsUpdate])
      {
        BOOL v22 = [(BMHealthWorkout *)self isUpdate];
        int v14 = v22 ^ [v5 isUpdate] ^ 1;
LABEL_28:

        goto LABEL_29;
      }
    }
LABEL_27:
    LOBYTE(v14) = 0;
    goto LABEL_28;
  }
  LOBYTE(v14) = 0;
LABEL_29:

  return v14;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(BMHealthWorkout *)self hasIsFirstPartyDonation])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMHealthWorkout isFirstPartyDonation](self, "isFirstPartyDonation"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMHealthWorkout *)self hasIsIndoor])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMHealthWorkout isIndoor](self, "isIndoor"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(BMHealthWorkout *)self activityType];
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMHealthWorkout eventType](self, "eventType"));
  int v7 = [(BMHealthWorkout *)self activityUUID];
  if ([(BMHealthWorkout *)self hasIsUpdate])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMHealthWorkout isUpdate](self, "isUpdate"));
  }
  else
  {
    v8 = 0;
  }
  v21[0] = @"isFirstPartyDonation";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = @"isIndoor";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"activityType";
  v11 = v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v22[2] = v11;
  v21[3] = @"eventType";
  v12 = v6;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"activityUUID";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"isUpdate";
  int v14 = v8;
  if (!v8)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  int v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_24;
    }
  }
  else
  {

    if (v7)
    {
LABEL_24:
      if (v6) {
        goto LABEL_25;
      }
      goto LABEL_34;
    }
  }

  if (v6)
  {
LABEL_25:
    if (v5) {
      goto LABEL_26;
    }
LABEL_35:

    if (v4) {
      goto LABEL_27;
    }
    goto LABEL_36;
  }
LABEL_34:

  if (!v5) {
    goto LABEL_35;
  }
LABEL_26:
  if (v4) {
    goto LABEL_27;
  }
LABEL_36:

LABEL_27:
  if (!v20) {

  }
  return v15;
}

- (BMHealthWorkout)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"isFirstPartyDonation"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"isIndoor"];
    v45 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v17 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        id v23 = v8;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        v25 = a4;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        v27 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isIndoor"];
        v60 = v27;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        v28 = v24;
        id v8 = v23;
        uint64_t v29 = v26;
        a4 = v27;
        uint64_t v17 = 0;
        v16 = 0;
        id *v25 = (id)[v28 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_24;
      }
      id v49 = v9;
    }
    else
    {
      id v49 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"activityType"];
    v50 = self;
    id v48 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          uint64_t v17 = v49;
          goto LABEL_24;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activityType"];
        id v58 = v46;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        id v33 = (id)[v30 initWithDomain:v32 code:2 userInfo:v11];
        a4 = 0;
        v16 = 0;
        id *v31 = v33;
        goto LABEL_22;
      }
      v44 = v10;
    }
    else
    {
      v44 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"eventType"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v46 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v46 = 0;
            v16 = 0;
            uint64_t v17 = v49;
            a4 = v44;
            goto LABEL_23;
          }
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"eventType"];
          id v56 = v13;
          v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v40 = (id)[v47 initWithDomain:v39 code:2 userInfo:v12];
          id v46 = 0;
          v16 = 0;
          *a4 = v40;
          goto LABEL_58;
        }
        id v46 = [NSNumber numberWithInt:BMHealthWorkoutEventTypeFromString(v11)];
      }
    }
    else
    {
      id v46 = 0;
    }
    v12 = [v6 objectForKeyedSubscript:@"activityUUID"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
LABEL_16:
      int v14 = [v6 objectForKeyedSubscript:@"isUpdate"];
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v41 = *MEMORY[0x1E4F502C8];
            uint64_t v51 = *MEMORY[0x1E4F28568];
            v37 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUpdate"];
            v52 = v37;
            v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
            *a4 = (id)[v43 initWithDomain:v41 code:2 userInfo:v38];
          }
          id v15 = 0;
          v16 = 0;
          a4 = v44;
          goto LABEL_20;
        }
        id v15 = v14;
      }
      else
      {
        id v15 = 0;
      }
      a4 = v44;
      v16 = -[BMHealthWorkout initWithIsFirstPartyDonation:isIndoor:activityType:eventType:activityUUID:isUpdate:](v50, "initWithIsFirstPartyDonation:isIndoor:activityType:eventType:activityUUID:isUpdate:", v48, v49, v44, [v46 intValue], v13, v15);
      v50 = v16;
LABEL_20:

LABEL_21:
LABEL_22:
      uint64_t v17 = v49;
LABEL_23:

      self = v50;
      id v8 = v48;
LABEL_24:

      int v7 = v45;
      goto LABEL_25;
    }
    if (a4)
    {
      v42 = a4;
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activityUUID"];
      id v54 = v15;
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v36 = (id)[v34 initWithDomain:v35 code:2 userInfo:v14];
      v16 = 0;
      id v13 = 0;
      a4 = v44;
      id *v42 = v36;
      goto LABEL_20;
    }
    id v13 = 0;
    v16 = 0;
LABEL_58:
    a4 = v44;
    goto LABEL_21;
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
    v16 = 0;
    goto LABEL_26;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  v20 = a4;
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v61 = *MEMORY[0x1E4F28568];
  uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFirstPartyDonation"];
  v62[0] = v17;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
  id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v9];
  id v8 = 0;
  v16 = 0;
  id *v20 = v22;
LABEL_25:

LABEL_26:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMHealthWorkout *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasIsFirstPartyDonation) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsIndoor) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_activityType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_activityUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsUpdate) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMHealthWorkout;
  id v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_75;
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
          v5->_hasIsFirstPartyDonation = 1;
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
              goto LABEL_54;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_56:
          BOOL v46 = v21 != 0;
          uint64_t v47 = 16;
          goto LABEL_71;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasIsIndoor = 1;
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
                  uint64_t v27 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_60:
          BOOL v46 = v27 != 0;
          uint64_t v47 = 18;
          goto LABEL_71;
        case 3u:
          uint64_t v31 = PBReaderReadString();
          uint64_t v32 = 32;
          goto LABEL_45;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          while (2)
          {
            uint64_t v36 = *v6;
            unint64_t v37 = *(void *)&v4[v36];
            if (v37 == -1 || v37 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
              *(void *)&v4[v36] = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v35) = 0;
          }
LABEL_64:
          if (v35 >= 5) {
            LODWORD(v35) = 0;
          }
          v5->_eventType = v35;
          continue;
        case 5u:
          uint64_t v31 = PBReaderReadString();
          uint64_t v32 = 40;
LABEL_45:
          uint64_t v39 = *(Class *)((char *)&v5->super.super.isa + v32);
          *(Class *)((char *)&v5->super.super.isa + v32) = (Class)v31;

          continue;
        case 6u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasIsUpdate = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_74;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v6;
        unint64_t v44 = *(void *)&v4[v43];
        if (v44 == -1 || v44 >= *(void *)&v4[*v7]) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v44);
        *(void *)&v4[v43] = v44 + 1;
        v42 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0) {
          goto LABEL_68;
        }
        v40 += 7;
        BOOL v16 = v41++ >= 9;
        if (v16)
        {
          uint64_t v42 = 0;
          goto LABEL_70;
        }
      }
      v4[*v8] = 1;
LABEL_68:
      if (v4[*v8]) {
        uint64_t v42 = 0;
      }
LABEL_70:
      BOOL v46 = v42 != 0;
      uint64_t v47 = 20;
LABEL_71:
      *((unsigned char *)&v5->super.super.isa + v47) = v46;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_74:
  }
    id v48 = 0;
  else {
LABEL_75:
  }
    id v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMHealthWorkout isFirstPartyDonation](self, "isFirstPartyDonation"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMHealthWorkout isIndoor](self, "isIndoor"));
  id v6 = [(BMHealthWorkout *)self activityType];
  int v7 = BMHealthWorkoutEventTypeAsString([(BMHealthWorkout *)self eventType]);
  id v8 = [(BMHealthWorkout *)self activityUUID];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMHealthWorkout isUpdate](self, "isUpdate"));
  char v10 = (void *)[v3 initWithFormat:@"BMHealthWorkout with isFirstPartyDonation: %@, isIndoor: %@, activityType: %@, eventType: %@, activityUUID: %@, isUpdate: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMHealthWorkout)initWithIsFirstPartyDonation:(id)a3 isIndoor:(id)a4 activityType:(id)a5 eventType:(int)a6 activityUUID:(id)a7 isUpdate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMHealthWorkout;
  char v19 = [(BMEventBase *)&v21 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v19->_hasIsFirstPartyDonation = 1;
      v19->_isFirstPartyDonation = [v14 BOOLValue];
    }
    else
    {
      v19->_hasIsFirstPartyDonation = 0;
      v19->_isFirstPartyDonation = 0;
    }
    if (v15)
    {
      v19->_hasIsIndoor = 1;
      v19->_isIndoor = [v15 BOOLValue];
    }
    else
    {
      v19->_hasIsIndoor = 0;
      v19->_isIndoor = 0;
    }
    objc_storeStrong((id *)&v19->_activityType, a5);
    v19->_eventType = a6;
    objc_storeStrong((id *)&v19->_activityUUID, a7);
    if (v18)
    {
      v19->_hasIsUpdate = 1;
      v19->_isUpdate = [v18 BOOLValue];
    }
    else
    {
      v19->_hasIsUpdate = 0;
      v19->_isUpdate = 0;
    }
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFirstPartyDonation" number:1 type:12 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isIndoor" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityType" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventType" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityUUID" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUpdate" number:6 type:12 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF35E8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFirstPartyDonation" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isIndoor" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityUUID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUpdate" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
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
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMHealthWorkout;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMHealthWorkout_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  uint64_t v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 24) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end