@interface BMLighthouseLedgerLighthousePluginEventEventStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseLedgerLighthousePluginEventEventStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseLedgerLighthousePluginEventEventStatus)initWithSucceeded:(id)a3 errorDomain:(id)a4 errorCode:(id)a5;
- (BOOL)hasErrorCode;
- (BOOL)hasSucceeded;
- (BOOL)isEqual:(id)a3;
- (BOOL)succeeded;
- (NSString)description;
- (NSString)errorDomain;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)errorCode;
- (unsigned)dataVersion;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSucceeded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseLedgerLighthousePluginEventEventStatus

- (void).cxx_destruct
{
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (BOOL)hasErrorCode
{
  return self->_hasErrorCode;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setHasSucceeded:(BOOL)a3
{
  self->_hasSucceeded = a3;
}

- (BOOL)hasSucceeded
{
  return self->_hasSucceeded;
}

- (BOOL)succeeded
{
  return self->_succeeded;
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
    if ([(BMLighthouseLedgerLighthousePluginEventEventStatus *)self hasSucceeded]
      || [v5 hasSucceeded])
    {
      if (![(BMLighthouseLedgerLighthousePluginEventEventStatus *)self hasSucceeded]) {
        goto LABEL_17;
      }
      if (![v5 hasSucceeded]) {
        goto LABEL_17;
      }
      int v6 = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self succeeded];
      if (v6 != [v5 succeeded]) {
        goto LABEL_17;
      }
    }
    v7 = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self errorDomain];
    uint64_t v8 = [v5 errorDomain];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self errorDomain];
      v11 = [v5 errorDomain];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_17;
      }
    }
    if (![(BMLighthouseLedgerLighthousePluginEventEventStatus *)self hasErrorCode]
      && ![v5 hasErrorCode])
    {
      BOOL v13 = 1;
      goto LABEL_18;
    }
    if ([(BMLighthouseLedgerLighthousePluginEventEventStatus *)self hasErrorCode]
      && [v5 hasErrorCode])
    {
      int v14 = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self errorCode];
      BOOL v13 = v14 == [v5 errorCode];
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    BOOL v13 = 0;
    goto LABEL_18;
  }
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMLighthouseLedgerLighthousePluginEventEventStatus *)self hasSucceeded])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLighthouseLedgerLighthousePluginEventEventStatus succeeded](self, "succeeded"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self errorDomain];
  if ([(BMLighthouseLedgerLighthousePluginEventEventStatus *)self hasErrorCode])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerLighthousePluginEventEventStatus errorCode](self, "errorCode"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"succeeded";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"errorDomain";
  v7 = v4;
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"errorCode";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_15;
    }
LABEL_20:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }

  if (!v4) {
    goto LABEL_20;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_21:

LABEL_16:

  return v9;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"succeeded"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"errorDomain"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          BOOL v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"errorDomain"];
        id v28 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        BOOL v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"errorCode"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"errorCode"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        BOOL v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self initWithSucceeded:v8 errorDomain:v10 errorCode:v12];
    BOOL v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    BOOL v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"succeeded"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  BOOL v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSucceeded)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasErrorCode)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMLighthouseLedgerLighthousePluginEventEventStatus;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_50;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        v5->_hasErrorCode = 1;
        while (1)
        {
          uint64_t v31 = *v6;
          uint64_t v32 = *(void *)&v4[v31];
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)&v4[*v7]) {
            break;
          }
          char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
          *(void *)&v4[v31] = v33;
          v30 |= (unint64_t)(v34 & 0x7F) << v28;
          if ((v34 & 0x80) == 0) {
            goto LABEL_44;
          }
          v28 += 7;
          BOOL v17 = v29++ >= 9;
          if (v17)
          {
            LODWORD(v30) = 0;
            goto LABEL_46;
          }
        }
        v4[*v8] = 1;
LABEL_44:
        if (v4[*v8]) {
          LODWORD(v30) = 0;
        }
LABEL_46:
        v5->_errorCode = v30;
      }
      else if (v20 == 2)
      {
        uint64_t v35 = PBReaderReadString();
        errorDomain = v5->_errorDomain;
        v5->_errorDomain = (NSString *)v35;
      }
      else if (v20 == 1)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasSucceeded = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_40;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            uint64_t v23 = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8]) {
          uint64_t v23 = 0;
        }
LABEL_42:
        v5->_succeeded = v23 != 0;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_49;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_49:
  }
    v37 = 0;
  else {
LABEL_50:
  }
    v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLighthouseLedgerLighthousePluginEventEventStatus succeeded](self, "succeeded"));
  id v5 = [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self errorDomain];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerLighthousePluginEventEventStatus errorCode](self, "errorCode"));
  v7 = (void *)[v3 initWithFormat:@"BMLighthouseLedgerLighthousePluginEventEventStatus with succeeded: %@, errorDomain: %@, errorCode: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)initWithSucceeded:(id)a3 errorDomain:(id)a4 errorCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMLighthouseLedgerLighthousePluginEventEventStatus;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasSucceeded = 1;
      v11->_succeeded = [v8 BOOLValue];
    }
    else
    {
      v11->_hasSucceeded = 0;
      v11->_succeeded = 0;
    }
    objc_storeStrong((id *)&v11->_errorDomain, a4);
    if (v10)
    {
      v11->_hasErrorCode = 1;
      int v12 = [v10 intValue];
    }
    else
    {
      v11->_hasErrorCode = 0;
      int v12 = -1;
    }
    v11->_errorCode = v12;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"succeeded" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"errorDomain", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"errorCode" number:3 type:2 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3EE8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"succeeded" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"errorDomain" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"errorCode" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initByReadFrom:v7];
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