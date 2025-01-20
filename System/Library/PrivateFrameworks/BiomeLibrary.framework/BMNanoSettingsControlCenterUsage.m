@interface BMNanoSettingsControlCenterUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMNanoSettingsControlCenterUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMNanoSettingsControlCenterUsage)initWithTransition:(int)a3 statusDetailTransition:(int)a4 buttonID:(id)a5 buttonPress:(int)a6;
- (BOOL)hasButtonID;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)buttonID;
- (int)buttonPress;
- (int)statusDetailTransition;
- (int)transition;
- (unsigned)dataVersion;
- (void)setHasButtonID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMNanoSettingsControlCenterUsage

- (int)buttonPress
{
  return self->_buttonPress;
}

- (void)setHasButtonID:(BOOL)a3
{
  self->_hasButtonID = a3;
}

- (BOOL)hasButtonID
{
  return self->_hasButtonID;
}

- (int)buttonID
{
  return self->_buttonID;
}

- (int)statusDetailTransition
{
  return self->_statusDetailTransition;
}

- (int)transition
{
  return self->_transition;
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
    int v6 = [(BMNanoSettingsControlCenterUsage *)self transition];
    if (v6 == [v5 transition]
      && (int v7 = [(BMNanoSettingsControlCenterUsage *)self statusDetailTransition],
          v7 == [v5 statusDetailTransition])
      && (![(BMNanoSettingsControlCenterUsage *)self hasButtonID]
       && ![v5 hasButtonID]
       || [(BMNanoSettingsControlCenterUsage *)self hasButtonID]
       && [v5 hasButtonID]
       && (int v8 = [(BMNanoSettingsControlCenterUsage *)self buttonID],
           v8 == [v5 buttonID])))
    {
      int v9 = [(BMNanoSettingsControlCenterUsage *)self buttonPress];
      BOOL v10 = v9 == [v5 buttonPress];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMNanoSettingsControlCenterUsage transition](self, "transition"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMNanoSettingsControlCenterUsage statusDetailTransition](self, "statusDetailTransition"));
  if ([(BMNanoSettingsControlCenterUsage *)self hasButtonID])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMNanoSettingsControlCenterUsage buttonID](self, "buttonID"));
  }
  else
  {
    id v5 = 0;
  }
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMNanoSettingsControlCenterUsage buttonPress](self, "buttonPress"));
  v13[0] = @"transition";
  int v7 = v3;
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"statusDetailTransition";
  int v8 = v4;
  if (!v4)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"buttonID";
  int v9 = v5;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"buttonPress";
  BOOL v10 = v6;
  if (!v6)
  {
    BOOL v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v11;
}

- (BMNanoSettingsControlCenterUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"transition"];
  v31 = self;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v33 = 0;
LABEL_4:
    int v8 = [v6 objectForKeyedSubscript:@"statusDetailTransition"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v9 = 0;
            v19 = 0;
            goto LABEL_34;
          }
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v24 = *MEMORY[0x1E4F502C8];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"statusDetailTransition"];
          id v39 = v13;
          v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v11];
          int v9 = 0;
          v19 = 0;
          *a4 = v25;
          goto LABEL_33;
        }
        id v10 = [NSNumber numberWithInt:BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeFromString(v8)];
      }
      int v9 = v10;
    }
    else
    {
      int v9 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"buttonID"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          v19 = 0;
          goto LABEL_33;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"buttonID"];
        v37 = v15;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v14 = v29 = a4;
        id v18 = (id)[v32 initWithDomain:v17 code:2 userInfo:v14];
        id v13 = 0;
        v19 = 0;
        id *v29 = v18;
        goto LABEL_32;
      }
      v12 = a4;
      id v13 = v11;
    }
    else
    {
      v12 = a4;
      id v13 = 0;
    }
    v14 = [v6 objectForKeyedSubscript:@"buttonPress"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v12)
          {
            id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v28 = *MEMORY[0x1E4F502C8];
            uint64_t v34 = *MEMORY[0x1E4F28568];
            v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"buttonPress"];
            v35 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            id *v12 = (id)[v30 initWithDomain:v28 code:2 userInfo:v27];
          }
          v15 = 0;
          v19 = 0;
          self = v31;
          goto LABEL_32;
        }
        id v16 = [NSNumber numberWithInt:BMNanoSettingsControlCenterUsageButtonPressTypeFromString(v14)];
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    self = -[BMNanoSettingsControlCenterUsage initWithTransition:statusDetailTransition:buttonID:buttonPress:](v31, "initWithTransition:statusDetailTransition:buttonID:buttonPress:", [v33 intValue], objc_msgSend(v9, "intValue"), v13, objc_msgSend(v15, "intValue"));
    v19 = self;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [NSNumber numberWithInt:BMNanoSettingsControlCenterUsageTransitionTypeFromString(v7)];
    goto LABEL_4;
  }
  if (!a4)
  {
    id v33 = 0;
    v19 = 0;
    goto LABEL_35;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v40 = *MEMORY[0x1E4F28568];
  int v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"transition"];
  v41[0] = v9;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  id v33 = 0;
  v19 = 0;
  *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v8];
LABEL_34:

LABEL_35:
  return v19;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMNanoSettingsControlCenterUsage *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasButtonID) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMNanoSettingsControlCenterUsage;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_76;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
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
              goto LABEL_51;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_53:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          uint64_t v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__transition;
          goto LABEL_72;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v27 = *v6;
            unint64_t v28 = *(void *)&v4[v27];
            if (v28 == -1 || v28 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
              *(void *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_59:
          if (v21 >= 3) {
            LODWORD(v21) = 0;
          }
          uint64_t v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__statusDetailTransition;
          goto LABEL_72;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          v5->_hasButtonID = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            unint64_t v33 = *(void *)&v4[v32];
            if (v33 == -1 || v33 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v33 + 1;
              v21 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v16 = v31++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_65:
          uint64_t v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__buttonID;
          goto LABEL_72;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v21 = 0;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_75;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        unint64_t v38 = *(void *)&v4[v37];
        if (v38 == -1 || v38 >= *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v38 + 1;
        v21 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0) {
          goto LABEL_67;
        }
        v35 += 7;
        BOOL v16 = v36++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_69;
        }
      }
      v4[*v8] = 1;
LABEL_67:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_69:
      if (v21 >= 3) {
        LODWORD(v21) = 0;
      }
      uint64_t v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__buttonPress;
LABEL_72:
      *(_DWORD *)((char *)&v5->super.super.isa + *v40) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_75:
  }
    v41 = 0;
  else {
LABEL_76:
  }
    v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMNanoSettingsControlCenterUsageTransitionTypeAsString([(BMNanoSettingsControlCenterUsage *)self transition]);
  id v5 = BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeAsString([(BMNanoSettingsControlCenterUsage *)self statusDetailTransition]);
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMNanoSettingsControlCenterUsage buttonID](self, "buttonID"));
  int v7 = BMNanoSettingsControlCenterUsageButtonPressTypeAsString([(BMNanoSettingsControlCenterUsage *)self buttonPress]);
  int v8 = (void *)[v3 initWithFormat:@"BMNanoSettingsControlCenterUsage with transition: %@, statusDetailTransition: %@, buttonID: %@, buttonPress: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMNanoSettingsControlCenterUsage)initWithTransition:(int)a3 statusDetailTransition:(int)a4 buttonID:(id)a5 buttonPress:(int)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMNanoSettingsControlCenterUsage;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_transition = a3;
    v11->_statusDetailTransition = a4;
    if (v10)
    {
      v11->_hasButtonID = 1;
      int v12 = [v10 intValue];
    }
    else
    {
      v11->_hasButtonID = 0;
      int v12 = -1;
    }
    v11->_buttonID = v12;
    v11->_buttonPress = a6;
  }

  return v11;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transition" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"statusDetailTransition" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"buttonID" number:3 type:2 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"buttonPress" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7590;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transition" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"statusDetailTransition" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"buttonID" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"buttonPress" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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

    int v8 = [[BMNanoSettingsControlCenterUsage alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end