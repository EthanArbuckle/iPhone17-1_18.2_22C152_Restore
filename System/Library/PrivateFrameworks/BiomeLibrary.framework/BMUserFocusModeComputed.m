@interface BMUserFocusModeComputed
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMUserFocusModeComputed)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMUserFocusModeComputed)initWithMode:(id)a3 starting:(id)a4 updateReason:(int)a5 semanticType:(int)a6 updateSource:(int)a7 semanticModeIdentifier:(id)a8;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)description;
- (NSString)mode;
- (NSString)semanticModeIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)semanticType;
- (int)updateReason;
- (int)updateSource;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMUserFocusModeComputed

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mode" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"updateReason" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"semanticType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"updateSource" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"semanticModeIdentifier" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticModeIdentifier, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

- (NSString)semanticModeIdentifier
{
  return self->_semanticModeIdentifier;
}

- (int)updateSource
{
  return self->_updateSource;
}

- (int)semanticType
{
  return self->_semanticType;
}

- (int)updateReason
{
  return self->_updateReason;
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

- (NSString)mode
{
  return self->_mode;
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
    v6 = [(BMUserFocusModeComputed *)self mode];
    uint64_t v7 = [v5 mode];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMUserFocusModeComputed *)self mode];
      v10 = [v5 mode];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    if (!-[BMUserFocusModeComputed hasStarting](self, "hasStarting") && ![v5 hasStarting]
      || [(BMUserFocusModeComputed *)self hasStarting]
      && [v5 hasStarting]
      && (int v13 = -[BMUserFocusModeComputed starting](self, "starting"), v13 == [v5 starting]))
    {
      int v14 = [(BMUserFocusModeComputed *)self updateReason];
      if (v14 == [v5 updateReason])
      {
        int v15 = [(BMUserFocusModeComputed *)self semanticType];
        if (v15 == [v5 semanticType])
        {
          int v16 = [(BMUserFocusModeComputed *)self updateSource];
          if (v16 == [v5 updateSource])
          {
            v17 = [(BMUserFocusModeComputed *)self semanticModeIdentifier];
            v18 = [v5 semanticModeIdentifier];
            if (v17 == v18)
            {
              char v12 = 1;
            }
            else
            {
              v19 = [(BMUserFocusModeComputed *)self semanticModeIdentifier];
              v20 = [v5 semanticModeIdentifier];
              char v12 = [v19 isEqual:v20];
            }
            goto LABEL_18;
          }
        }
      }
    }
LABEL_17:
    char v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v12 = 0;
LABEL_19:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMUserFocusModeComputed *)self mode];
  if ([(BMUserFocusModeComputed *)self hasStarting])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusModeComputed starting](self, "starting"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusModeComputed updateReason](self, "updateReason"));
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusModeComputed semanticType](self, "semanticType"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusModeComputed updateSource](self, "updateSource"));
  v8 = [(BMUserFocusModeComputed *)self semanticModeIdentifier];
  v21[0] = @"mode";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = @"starting";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"updateReason";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v22[2] = v11;
  v21[3] = @"semanticType";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"updateSource";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"semanticModeIdentifier";
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
      goto LABEL_18;
    }
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v6) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
  }

  if (v6)
  {
LABEL_19:
    if (v5) {
      goto LABEL_20;
    }
LABEL_29:

    if (v4) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
LABEL_28:

  if (!v5) {
    goto LABEL_29;
  }
LABEL_20:
  if (v4) {
    goto LABEL_21;
  }
LABEL_30:

LABEL_21:
  if (!v20) {

  }
  return v15;
}

- (BMUserFocusModeComputed)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"mode"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        id v49 = 0;
        v25 = self;
        goto LABEL_48;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = *MEMORY[0x1E4F502C8];
      uint64_t v60 = *MEMORY[0x1E4F28568];
      id v48 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mode"];
      v61[0] = v48;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
      id v12 = (id)[v10 initWithDomain:v11 code:2 userInfo:v7];
      id v49 = 0;
      int v13 = p_isa;
      p_isa = 0;
      *int v13 = v12;
      goto LABEL_59;
    }
    id v49 = v6;
  }
  else
  {
    id v49 = 0;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"starting"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v7;
        goto LABEL_7;
      }
      if (p_isa)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
        v59 = v47;
        v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        id v16 = (id)[v14 initWithDomain:v15 code:2 userInfo:v8];
        id v48 = 0;
        uint64_t v17 = p_isa;
        p_isa = 0;
        id *v17 = v16;
        goto LABEL_65;
      }
      id v48 = 0;
LABEL_59:
      v25 = self;
      goto LABEL_47;
    }
  }
  id v48 = 0;
LABEL_7:
  v8 = [v5 objectForKeyedSubscript:@"updateReason"];
  v44 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
LABEL_22:
        v47 = v9;
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [NSNumber numberWithInt:BMUserFocusModeComputedUpdateReasonFromString(v8)];
        goto LABEL_22;
      }
      if (p_isa)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"updateReason"];
        v57 = v45;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        id v32 = (id)[v30 initWithDomain:v31 code:2 userInfo:v18];
        v47 = 0;
        v33 = p_isa;
        p_isa = 0;
        id *v33 = v32;
        goto LABEL_67;
      }
      v47 = 0;
LABEL_65:
      v25 = self;
      goto LABEL_46;
    }
  }
  v47 = 0;
LABEL_23:
  v18 = [v5 objectForKeyedSubscript:@"semanticType"];
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
LABEL_30:
        v45 = v19;
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [NSNumber numberWithInt:BMUserFocusModeComputedSemanticTypeFromString(v18)];
        goto LABEL_30;
      }
      if (p_isa)
      {
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        v35 = p_isa;
        uint64_t v36 = *MEMORY[0x1E4F502C8];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"semanticType"];
        v55 = v21;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id v37 = (id)[v34 initWithDomain:v36 code:2 userInfo:v20];
        v45 = 0;
        p_isa = 0;
        id *v35 = v37;
        goto LABEL_69;
      }
      v45 = 0;
LABEL_67:
      v25 = self;
      goto LABEL_45;
    }
  }
  v45 = 0;
LABEL_31:
  v20 = [v5 objectForKeyedSubscript:@"updateSource"];
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v20;
LABEL_38:
        v21 = v22;
        goto LABEL_39;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = [NSNumber numberWithInt:BMUserFocusModeComputedUpdateSourceFromString(v20)];
        goto LABEL_38;
      }
      if (p_isa)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        v39 = p_isa;
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"updateSource"];
        id v53 = v24;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        id v41 = (id)[v38 initWithDomain:v40 code:2 userInfo:v23];
        v21 = 0;
        p_isa = 0;
        id *v39 = v41;
        goto LABEL_63;
      }
      v21 = 0;
LABEL_69:
      v25 = self;
      goto LABEL_44;
    }
  }
  v21 = 0;
LABEL_39:
  v23 = [v5 objectForKeyedSubscript:@"semanticModeIdentifier"];
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v23;
        goto LABEL_42;
      }
      if (p_isa)
      {
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v27 = p_isa;
        v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"semanticModeIdentifier"];
        v51 = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id *v27 = (id)[v43 initWithDomain:v42 code:2 userInfo:v29];

        id v24 = 0;
        p_isa = 0;
      }
      else
      {
        id v24 = 0;
      }
LABEL_63:
      v25 = self;
      goto LABEL_43;
    }
  }
  id v24 = 0;
LABEL_42:
  v25 = -[BMUserFocusModeComputed initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:](self, "initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:", v49, v48, [v47 intValue], objc_msgSend(v45, "intValue"), objc_msgSend(v21, "intValue"), v24);
  p_isa = (id *)&v25->super.super.isa;
LABEL_43:

LABEL_44:
LABEL_45:

  v6 = v44;
LABEL_46:

LABEL_47:
LABEL_48:

  return (BMUserFocusModeComputed *)p_isa;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMUserFocusModeComputed *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_mode) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_semanticModeIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMUserFocusModeComputed;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_79;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_52;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  uint64_t v23 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v23 = 0;
          }
LABEL_56:
          v5->_starting = v23 != 0;
          continue;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (2)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v29) = 0;
          }
LABEL_60:
          if (v29 >= 4) {
            LODWORD(v29) = 0;
          }
          uint64_t v44 = 24;
          goto LABEL_75;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v29 = 0;
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
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v29) = 0;
          }
LABEL_66:
          if (v29 >= 0xC) {
            LODWORD(v29) = 0;
          }
          uint64_t v44 = 28;
          goto LABEL_75;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v29 = 0;
          break;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
LABEL_52:
          id v43 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_78;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v6;
        unint64_t v41 = *(void *)&v4[v40];
        if (v41 == -1 || v41 >= *(void *)&v4[*v7]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
        *(void *)&v4[v40] = v41 + 1;
        v29 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0) {
          goto LABEL_70;
        }
        v38 += 7;
        BOOL v16 = v39++ >= 9;
        if (v16)
        {
          LODWORD(v29) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8]) {
        LODWORD(v29) = 0;
      }
LABEL_72:
      if (v29 >= 4) {
        LODWORD(v29) = 0;
      }
      uint64_t v44 = 32;
LABEL_75:
      *(_DWORD *)((char *)&v5->super.super.isa + v44) = v29;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_78:
  }
    v45 = 0;
  else {
LABEL_79:
  }
    v45 = v5;

  return v45;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMUserFocusModeComputed *)self mode];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusModeComputed starting](self, "starting"));
  v6 = BMUserFocusModeComputedUpdateReasonAsString([(BMUserFocusModeComputed *)self updateReason]);
  uint64_t v7 = BMUserFocusModeComputedSemanticTypeAsString([(BMUserFocusModeComputed *)self semanticType]);
  v8 = BMUserFocusModeComputedUpdateSourceAsString([(BMUserFocusModeComputed *)self updateSource]);
  id v9 = [(BMUserFocusModeComputed *)self semanticModeIdentifier];
  char v10 = (void *)[v3 initWithFormat:@"BMUserFocusModeComputed with mode: %@, starting: %@, updateReason: %@, semanticType: %@, updateSource: %@, semanticModeIdentifier: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMUserFocusModeComputed)initWithMode:(id)a3 starting:(id)a4 updateReason:(int)a5 semanticType:(int)a6 updateSource:(int)a7 semanticModeIdentifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMUserFocusModeComputed;
  v18 = [(BMEventBase *)&v20 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_mode, a3);
    if (v16)
    {
      v18->_hasStarting = 1;
      v18->_starting = [v16 BOOLValue];
    }
    else
    {
      v18->_hasStarting = 0;
      v18->_starting = 0;
    }
    v18->_updateReason = a5;
    v18->_semanticType = a6;
    v18->_updateSource = a7;
    objc_storeStrong((id *)&v18->_semanticModeIdentifier, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mode" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"updateReason" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"semanticType" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"updateSource" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"semanticModeIdentifier" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF33C0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMUserFocusModeComputed_v1;
  }
  else
  {
    if (a4 != 2)
    {
      id v9 = 0;
      goto LABEL_9;
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMUserFocusModeComputed;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  id v9 = (void *)v8;
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