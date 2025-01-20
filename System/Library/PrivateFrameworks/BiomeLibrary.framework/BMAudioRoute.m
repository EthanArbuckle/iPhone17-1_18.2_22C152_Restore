@interface BMAudioRoute
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAudioRoute)initWithExternal:(id)a3 identifier:(id)a4 portType:(id)a5 portName:(id)a6 routeChangeReason:(int)a7 type:(int)a8;
- (BMAudioRoute)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)external;
- (BOOL)hasExternal;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)portName;
- (NSString)portType;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)routeChangeReason;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasExternal:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAudioRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portName, 0);
  objc_storeStrong((id *)&self->_portType, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)type
{
  return self->_type;
}

- (int)routeChangeReason
{
  return self->_routeChangeReason;
}

- (NSString)portName
{
  return self->_portName;
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setHasExternal:(BOOL)a3
{
  self->_hasExternal = a3;
}

- (BOOL)hasExternal
{
  return self->_hasExternal;
}

- (BOOL)external
{
  return self->_external;
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
    if (-[BMAudioRoute hasExternal](self, "hasExternal") || [v5 hasExternal])
    {
      if (![(BMAudioRoute *)self hasExternal]) {
        goto LABEL_22;
      }
      if (![v5 hasExternal]) {
        goto LABEL_22;
      }
      int v6 = [(BMAudioRoute *)self external];
      if (v6 != [v5 external]) {
        goto LABEL_22;
      }
    }
    v7 = [(BMAudioRoute *)self identifier];
    uint64_t v8 = [v5 identifier];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMAudioRoute *)self identifier];
      v11 = [v5 identifier];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_22;
      }
    }
    v14 = [(BMAudioRoute *)self portType];
    uint64_t v15 = [v5 portType];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMAudioRoute *)self portType];
      v18 = [v5 portType];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_22;
      }
    }
    v20 = [(BMAudioRoute *)self portName];
    uint64_t v21 = [v5 portName];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMAudioRoute *)self portName];
      v24 = [v5 portName];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_22;
      }
    }
    int v26 = [(BMAudioRoute *)self routeChangeReason];
    if (v26 == [v5 routeChangeReason])
    {
      int v27 = [(BMAudioRoute *)self type];
      BOOL v13 = v27 == [v5 type];
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  BOOL v13 = 0;
LABEL_24:

  return v13;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(BMAudioRoute *)self hasExternal])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAudioRoute external](self, "external"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMAudioRoute *)self identifier];
  id v5 = [(BMAudioRoute *)self portType];
  int v6 = [(BMAudioRoute *)self portName];
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAudioRoute routeChangeReason](self, "routeChangeReason"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAudioRoute type](self, "type"));
  v21[0] = @"external";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  int v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = @"identifier";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"portType";
  v11 = v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v22[2] = v11;
  v21[3] = @"portName";
  int v12 = v6;
  if (!v6)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"routeChangeReason";
  BOOL v13 = v7;
  if (!v7)
  {
    BOOL v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"type";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
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

- (BMAudioRoute)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"external"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"identifier"];
    v42 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          v20 = 0;
          goto LABEL_50;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v22 = v8;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v47 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        id v58 = v47;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        uint64_t v24 = v23;
        id v8 = v22;
        v18 = 0;
        v20 = 0;
        id *v42 = (id)[v21 initWithDomain:v24 code:2 userInfo:v10];
        goto LABEL_49;
      }
      id v46 = v9;
    }
    else
    {
      id v46 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"portType"];
    v48 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v47 = 0;
          v20 = 0;
          v18 = v46;
          goto LABEL_49;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v26 = v8;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v55 = *MEMORY[0x1E4F28568];
        id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"portType"];
        id v56 = v44;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        uint64_t v28 = v27;
        id v8 = v26;
        id v47 = 0;
        v20 = 0;
        id *v42 = (id)[v25 initWithDomain:v28 code:2 userInfo:v11];
LABEL_48:
        v18 = v46;

        self = v48;
LABEL_49:

        goto LABEL_50;
      }
      id v47 = v10;
    }
    else
    {
      id v47 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"portName"];
    id v43 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v44 = 0;
          v20 = 0;
          goto LABEL_48;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v53 = *MEMORY[0x1E4F28568];
        BOOL v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"portName"];
        v54 = v13;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v30 = (id)[v45 initWithDomain:v29 code:2 userInfo:v12];
        id v44 = 0;
        v20 = 0;
        id *v42 = v30;
        goto LABEL_47;
      }
      id v44 = v11;
    }
    else
    {
      id v44 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"routeChangeReason"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            BOOL v13 = 0;
            v20 = 0;
            goto LABEL_47;
          }
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v51 = *MEMORY[0x1E4F28568];
          v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"routeChangeReason"];
          v52 = v32;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          id v37 = (id)[v35 initWithDomain:v36 code:2 userInfo:v31];
          BOOL v13 = 0;
          v20 = 0;
          id *v42 = v37;
          goto LABEL_46;
        }
        id v14 = [NSNumber numberWithInt:BMAudioRouteChangeReasonFromString(v12)];
      }
      BOOL v13 = v14;
    }
    else
    {
      BOOL v13 = 0;
    }
    v31 = [v6 objectForKeyedSubscript:@"type"];
    if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v31;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v42)
          {
            id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v40 = *MEMORY[0x1E4F502C8];
            uint64_t v49 = *MEMORY[0x1E4F28568];
            v38 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
            v50 = v38;
            v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            id *v42 = (id)[v41 initWithDomain:v40 code:2 userInfo:v39];
          }
          v32 = 0;
          v20 = 0;
          goto LABEL_46;
        }
        id v33 = [NSNumber numberWithInt:BMAudioRouteTypeFromString(v31)];
      }
      v32 = v33;
    }
    else
    {
      v32 = 0;
    }
    v20 = -[BMAudioRoute initWithExternal:identifier:portType:portName:routeChangeReason:type:](v48, "initWithExternal:identifier:portType:portName:routeChangeReason:type:", v43, v46, v47, v44, [v13 intValue], objc_msgSend(v32, "intValue"));
    v48 = v20;
LABEL_46:

LABEL_47:
    id v8 = v43;
    goto LABEL_48;
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
    v20 = 0;
    goto LABEL_51;
  }
  uint64_t v15 = a4;
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"external"];
  v60[0] = v18;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  id v19 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  id v8 = 0;
  v20 = 0;
  *uint64_t v15 = v19;
LABEL_50:

LABEL_51:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAudioRoute *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasExternal) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_portType) {
    PBDataWriterWriteStringField();
  }
  if (self->_portName) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMAudioRoute;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_67;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
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
          v5->_hasExternal = 1;
          while (2)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
              *(void *)&v4[v22] = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                BOOL v16 = v20++ >= 9;
                if (v16)
                {
                  uint64_t v21 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_50:
          v5->_external = v21 != 0;
          continue;
        case 2u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 40;
          goto LABEL_32;
        case 4u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 48;
LABEL_32:
          uint64_t v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            unint64_t v32 = *(void *)&v4[v31];
            if (v32 == -1 || v32 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v30) = 0;
          }
LABEL_54:
          if (v30 >= 8) {
            LODWORD(v30) = 0;
          }
          uint64_t v39 = 24;
          goto LABEL_63;
        case 6u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v30 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_66;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v6;
        unint64_t v37 = *(void *)&v4[v36];
        if (v37 == -1 || v37 >= *(void *)&v4[*v7]) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
        *(void *)&v4[v36] = v37 + 1;
        v30 |= (unint64_t)(v38 & 0x7F) << v34;
        if ((v38 & 0x80) == 0) {
          goto LABEL_58;
        }
        v34 += 7;
        BOOL v16 = v35++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8]) {
        LODWORD(v30) = 0;
      }
LABEL_60:
      if (v30 >= 3) {
        LODWORD(v30) = 0;
      }
      uint64_t v39 = 28;
LABEL_63:
      *(_DWORD *)((char *)&v5->super.super.isa + v39) = v30;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_66:
  }
    uint64_t v40 = 0;
  else {
LABEL_67:
  }
    uint64_t v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAudioRoute external](self, "external"));
  id v5 = [(BMAudioRoute *)self identifier];
  id v6 = [(BMAudioRoute *)self portType];
  v7 = [(BMAudioRoute *)self portName];
  id v8 = BMAudioRouteChangeReasonAsString([(BMAudioRoute *)self routeChangeReason]);
  uint64_t v9 = BMAudioRouteTypeAsString([(BMAudioRoute *)self type]);
  char v10 = (void *)[v3 initWithFormat:@"BMAudioRoute with external: %@, identifier: %@, portType: %@, portName: %@, routeChangeReason: %@, type: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMAudioRoute)initWithExternal:(id)a3 identifier:(id)a4 portType:(id)a5 portName:(id)a6 routeChangeReason:(int)a7 type:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMAudioRoute;
  v18 = [(BMEventBase *)&v20 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v18->_hasExternal = 1;
      v18->_external = [v14 BOOLValue];
    }
    else
    {
      v18->_hasExternal = 0;
      v18->_external = 0;
    }
    objc_storeStrong((id *)&v18->_identifier, a4);
    objc_storeStrong((id *)&v18->_portType, a5);
    objc_storeStrong((id *)&v18->_portName, a6);
    v18->_routeChangeReason = a7;
    v18->_type = a8;
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"external" number:1 type:12 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"portType" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"portName" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"routeChangeReason" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3120;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"external" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"portType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"portName" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"routeChangeReason" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMAudioRoute alloc] initByReadFrom:v7];
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