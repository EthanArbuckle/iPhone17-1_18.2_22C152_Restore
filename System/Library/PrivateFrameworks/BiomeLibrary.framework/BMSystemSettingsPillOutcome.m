@interface BMSystemSettingsPillOutcome
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSystemSettingsPillOutcome)initWithChildAccount:(id)a3 firstUpdate:(id)a4 fromPill:(id)a5 gesture:(id)a6 gestureOn:(id)a7;
- (BMSystemSettingsPillOutcome)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)childAccount;
- (BOOL)firstUpdate;
- (BOOL)fromPill;
- (BOOL)gestureOn;
- (BOOL)hasChildAccount;
- (BOOL)hasFirstUpdate;
- (BOOL)hasFromPill;
- (BOOL)hasGestureOn;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)gesture;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasChildAccount:(BOOL)a3;
- (void)setHasFirstUpdate:(BOOL)a3;
- (void)setHasFromPill:(BOOL)a3;
- (void)setHasGestureOn:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSystemSettingsPillOutcome

- (void).cxx_destruct
{
}

- (void)setHasGestureOn:(BOOL)a3
{
  self->_hasGestureOn = a3;
}

- (BOOL)hasGestureOn
{
  return self->_hasGestureOn;
}

- (BOOL)gestureOn
{
  return self->_gestureOn;
}

- (NSString)gesture
{
  return self->_gesture;
}

- (void)setHasFromPill:(BOOL)a3
{
  self->_hasFromPill = a3;
}

- (BOOL)hasFromPill
{
  return self->_hasFromPill;
}

- (BOOL)fromPill
{
  return self->_fromPill;
}

- (void)setHasFirstUpdate:(BOOL)a3
{
  self->_hasFirstUpdate = a3;
}

- (BOOL)hasFirstUpdate
{
  return self->_hasFirstUpdate;
}

- (BOOL)firstUpdate
{
  return self->_firstUpdate;
}

- (void)setHasChildAccount:(BOOL)a3
{
  self->_hasChildAccount = a3;
}

- (BOOL)hasChildAccount
{
  return self->_hasChildAccount;
}

- (BOOL)childAccount
{
  return self->_childAccount;
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
    if ([(BMSystemSettingsPillOutcome *)self hasChildAccount]
      || [v5 hasChildAccount])
    {
      if (![(BMSystemSettingsPillOutcome *)self hasChildAccount]) {
        goto LABEL_27;
      }
      if (![v5 hasChildAccount]) {
        goto LABEL_27;
      }
      int v6 = [(BMSystemSettingsPillOutcome *)self childAccount];
      if (v6 != [v5 childAccount]) {
        goto LABEL_27;
      }
    }
    if ([(BMSystemSettingsPillOutcome *)self hasFirstUpdate]
      || [v5 hasFirstUpdate])
    {
      if (![(BMSystemSettingsPillOutcome *)self hasFirstUpdate]) {
        goto LABEL_27;
      }
      if (![v5 hasFirstUpdate]) {
        goto LABEL_27;
      }
      int v7 = [(BMSystemSettingsPillOutcome *)self firstUpdate];
      if (v7 != [v5 firstUpdate]) {
        goto LABEL_27;
      }
    }
    if ([(BMSystemSettingsPillOutcome *)self hasFromPill]
      || [v5 hasFromPill])
    {
      if (![(BMSystemSettingsPillOutcome *)self hasFromPill]) {
        goto LABEL_27;
      }
      if (![v5 hasFromPill]) {
        goto LABEL_27;
      }
      int v8 = [(BMSystemSettingsPillOutcome *)self fromPill];
      if (v8 != [v5 fromPill]) {
        goto LABEL_27;
      }
    }
    v9 = [(BMSystemSettingsPillOutcome *)self gesture];
    uint64_t v10 = [v5 gesture];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMSystemSettingsPillOutcome *)self gesture];
      v13 = [v5 gesture];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_27;
      }
    }
    if (![(BMSystemSettingsPillOutcome *)self hasGestureOn]
      && ![v5 hasGestureOn])
    {
      LOBYTE(v15) = 1;
      goto LABEL_28;
    }
    if ([(BMSystemSettingsPillOutcome *)self hasGestureOn]
      && [v5 hasGestureOn])
    {
      BOOL v16 = [(BMSystemSettingsPillOutcome *)self gestureOn];
      int v15 = v16 ^ [v5 gestureOn] ^ 1;
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:
    LOBYTE(v15) = 0;
    goto LABEL_28;
  }
  LOBYTE(v15) = 0;
LABEL_29:

  return v15;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if ([(BMSystemSettingsPillOutcome *)self hasChildAccount])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome childAccount](self, "childAccount"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSystemSettingsPillOutcome *)self hasFirstUpdate])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome firstUpdate](self, "firstUpdate"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSystemSettingsPillOutcome *)self hasFromPill])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome fromPill](self, "fromPill"));
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [(BMSystemSettingsPillOutcome *)self gesture];
  if ([(BMSystemSettingsPillOutcome *)self hasGestureOn])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome gestureOn](self, "gestureOn"));
  }
  else
  {
    int v7 = 0;
  }
  v17 = @"childAccount";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"firstUpdate";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"fromPill";
  uint64_t v10 = v5;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"gesture";
  v11 = v6;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"gestureOn";
  v12 = v7;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v6)
    {
LABEL_25:
      if (v5) {
        goto LABEL_26;
      }
      goto LABEL_33;
    }
  }

  if (v5)
  {
LABEL_26:
    if (v4) {
      goto LABEL_27;
    }
LABEL_34:

    if (v3) {
      goto LABEL_28;
    }
    goto LABEL_35;
  }
LABEL_33:

  if (!v4) {
    goto LABEL_34;
  }
LABEL_27:
  if (v3) {
    goto LABEL_28;
  }
LABEL_35:

LABEL_28:

  return v13;
}

- (BMSystemSettingsPillOutcome)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"childAccount"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"firstUpdate"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v15 = 0;
          goto LABEL_20;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v35 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"firstUpdate"];
        id v49 = v40;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v10];
        uint64_t v15 = 0;
        a4 = 0;
        id *v35 = v24;
        goto LABEL_19;
      }
      v38 = v9;
    }
    else
    {
      v38 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"fromPill"];
    id v39 = v8;
    v41 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v40 = 0;
          uint64_t v15 = 0;
          a4 = v38;
          goto LABEL_19;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"fromPill"];
        id v47 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v11];
        uint64_t v15 = 0;
        id v40 = 0;
        v28 = a4;
        a4 = v38;
        id *v28 = v27;
LABEL_18:

        self = v41;
        id v8 = v39;
LABEL_19:

        goto LABEL_20;
      }
      id v40 = v10;
    }
    else
    {
      id v40 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"gesture"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          uint64_t v15 = 0;
          a4 = v38;
          goto LABEL_18;
        }
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        v36 = a4;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"gesture"];
        id v45 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v13];
        uint64_t v15 = 0;
        id v12 = 0;
        a4 = v38;
        id *v36 = v31;
        goto LABEL_17;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"gestureOn"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v42 = *MEMORY[0x1E4F28568];
          v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"gestureOn"];
          v43 = v32;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          *a4 = (id)[v37 initWithDomain:v34 code:2 userInfo:v33];
        }
        id v14 = 0;
        uint64_t v15 = 0;
        a4 = v38;
        goto LABEL_17;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    a4 = v38;
    uint64_t v15 = [(BMSystemSettingsPillOutcome *)v41 initWithChildAccount:v39 firstUpdate:v38 fromPill:v40 gesture:v12 gestureOn:v14];
    v41 = v15;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v15 = 0;
    id v8 = 0;
    goto LABEL_21;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  v20 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"childAccount"];
  v51[0] = v20;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  uint64_t v21 = v19;
  a4 = v20;
  uint64_t v15 = 0;
  id v8 = 0;
  id *v18 = (id)[v17 initWithDomain:v21 code:2 userInfo:v9];
LABEL_20:

LABEL_21:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSystemSettingsPillOutcome *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasChildAccount)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasFirstUpdate)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasFromPill)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_gesture)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasGestureOn)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMSystemSettingsPillOutcome;
  id v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_71;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
          v5->_hasChildAccount = 1;
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
          BOOL v45 = v21 != 0;
          uint64_t v46 = 16;
          goto LABEL_67;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasFirstUpdate = 1;
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
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_58:
          BOOL v45 = v27 != 0;
          uint64_t v46 = 18;
          goto LABEL_67;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasFromPill = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v16 = v32++ >= 9;
                if (v16)
                {
                  uint64_t v33 = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v33 = 0;
          }
LABEL_62:
          BOOL v45 = v33 != 0;
          uint64_t v46 = 20;
          goto LABEL_67;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          gesture = v5->_gesture;
          v5->_gesture = (NSString *)v37;

          continue;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          v5->_hasGestureOn = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_70;
          }
          continue;
      }
      while (1)
      {
        uint64_t v42 = *v6;
        unint64_t v43 = *(void *)&v4[v42];
        if (v43 == -1 || v43 >= *(void *)&v4[*v7]) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
        *(void *)&v4[v42] = v43 + 1;
        v41 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0) {
          goto LABEL_64;
        }
        v39 += 7;
        BOOL v16 = v40++ >= 9;
        if (v16)
        {
          uint64_t v41 = 0;
          goto LABEL_66;
        }
      }
      v4[*v8] = 1;
LABEL_64:
      if (v4[*v8]) {
        uint64_t v41 = 0;
      }
LABEL_66:
      BOOL v45 = v41 != 0;
      uint64_t v46 = 22;
LABEL_67:
      *((unsigned char *)&v5->super.super.isa + v46) = v45;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_70:
  }
    id v47 = 0;
  else {
LABEL_71:
  }
    id v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome childAccount](self, "childAccount"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome firstUpdate](self, "firstUpdate"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome fromPill](self, "fromPill"));
  int v7 = [(BMSystemSettingsPillOutcome *)self gesture];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsPillOutcome gestureOn](self, "gestureOn"));
  v9 = (void *)[v3 initWithFormat:@"BMSystemSettingsPillOutcome with childAccount: %@, firstUpdate: %@, fromPill: %@, gesture: %@, gestureOn: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSystemSettingsPillOutcome)initWithChildAccount:(id)a3 firstUpdate:(id)a4 fromPill:(id)a5 gesture:(id)a6 gestureOn:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSystemSettingsPillOutcome;
  int v17 = [(BMEventBase *)&v19 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v17->_hasChildAccount = 1;
      v17->_childAccount = [v12 BOOLValue];
    }
    else
    {
      v17->_hasChildAccount = 0;
      v17->_childAccount = 0;
    }
    if (v13)
    {
      v17->_hasFirstUpdate = 1;
      v17->_firstUpdate = [v13 BOOLValue];
    }
    else
    {
      v17->_hasFirstUpdate = 0;
      v17->_firstUpdate = 0;
    }
    if (v14)
    {
      v17->_hasFromPill = 1;
      v17->_fromPill = [v14 BOOLValue];
    }
    else
    {
      v17->_hasFromPill = 0;
      v17->_fromPill = 0;
    }
    objc_storeStrong((id *)&v17->_gesture, a6);
    if (v16)
    {
      v17->_hasGestureOn = 1;
      v17->_gestureOn = [v16 BOOLValue];
    }
    else
    {
      v17->_hasGestureOn = 0;
      v17->_gestureOn = 0;
    }
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childAccount" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"firstUpdate", 2, 12, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fromPill" number:3 type:12 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gesture" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gestureOn" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6978;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childAccount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstUpdate" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fromPill" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"gesture" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"gestureOn" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
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
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSystemSettingsPillOutcome alloc] initByReadFrom:v7];
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