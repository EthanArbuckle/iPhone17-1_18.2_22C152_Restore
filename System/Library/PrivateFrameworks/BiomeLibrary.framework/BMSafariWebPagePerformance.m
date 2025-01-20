@interface BMSafariWebPagePerformance
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariWebPagePerformance)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 performanceEvent:(int)a6;
- (BMSafariWebPagePerformance)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 performanceEvent:(int)a6 privacyProxy:(id)a7;
- (BMSafariWebPagePerformance)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasPrivacyProxy;
- (BOOL)isEqual:(id)a3;
- (BOOL)privacyProxy;
- (NSDate)visited;
- (NSString)description;
- (NSString)domain;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)performanceEvent;
- (int)platform;
- (unsigned)dataVersion;
- (void)setHasPrivacyProxy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariWebPagePerformance

- (BMSafariWebPagePerformance)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 performanceEvent:(int)a6
{
  return [(BMSafariWebPagePerformance *)self initWithDomain:a3 visited:a4 platform:*(void *)&a5 performanceEvent:*(void *)&a6 privacyProxy:&unk_1F0BF7D28];
}

- (void).cxx_destruct
{
}

- (void)setHasPrivacyProxy:(BOOL)a3
{
  self->_hasPrivacyProxy = a3;
}

- (BOOL)hasPrivacyProxy
{
  return self->_hasPrivacyProxy;
}

- (BOOL)privacyProxy
{
  return self->_privacyProxy;
}

- (int)performanceEvent
{
  return self->_performanceEvent;
}

- (int)platform
{
  return self->_platform;
}

- (NSString)domain
{
  return self->_domain;
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
    v6 = [(BMSafariWebPagePerformance *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariWebPagePerformance *)self domain];
      v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_18;
      }
    }
    v13 = [(BMSafariWebPagePerformance *)self visited];
    uint64_t v14 = [v5 visited];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariWebPagePerformance *)self visited];
      v17 = [v5 visited];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_18;
      }
    }
    int v19 = [(BMSafariWebPagePerformance *)self platform];
    if (v19 == [v5 platform])
    {
      int v20 = [(BMSafariWebPagePerformance *)self performanceEvent];
      if (v20 == [v5 performanceEvent])
      {
        if (![(BMSafariWebPagePerformance *)self hasPrivacyProxy]
          && ![v5 hasPrivacyProxy])
        {
          LOBYTE(v12) = 1;
          goto LABEL_19;
        }
        if ([(BMSafariWebPagePerformance *)self hasPrivacyProxy]
          && [v5 hasPrivacyProxy])
        {
          BOOL v21 = [(BMSafariWebPagePerformance *)self privacyProxy];
          int v12 = v21 ^ [v5 privacyProxy] ^ 1;
LABEL_19:

          goto LABEL_20;
        }
      }
    }
LABEL_18:
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }
  LOBYTE(v12) = 0;
LABEL_20:

  return v12;
}

- (NSDate)visited
{
  if (self->_hasRaw_visited)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_visited];
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
  v25[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariWebPagePerformance *)self domain];
  id v4 = [(BMSafariWebPagePerformance *)self visited];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMSafariWebPagePerformance *)self visited];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariWebPagePerformance platform](self, "platform"));
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariWebPagePerformance performanceEvent](self, "performanceEvent"));
  if ([(BMSafariWebPagePerformance *)self hasPrivacyProxy])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariWebPagePerformance privacyProxy](self, "privacyProxy"));
  }
  else
  {
    v10 = 0;
  }
  int v20 = @"domain";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  BOOL v21 = @"visited";
  int v12 = v7;
  if (!v7)
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  v22 = @"platform";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"performanceEvent";
  uint64_t v14 = v9;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  v24 = @"privacyProxy";
  v15 = v10;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v8) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v8)
  {
LABEL_20:
    if (v7) {
      goto LABEL_21;
    }
LABEL_28:

    if (v3) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v7) {
    goto LABEL_28;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v16;
}

- (BMSafariWebPagePerformance)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"domain"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v41 = 0;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"visited"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v10 = v8;
        id v11 = [v9 alloc];
        [v10 doubleValue];
        double v13 = v12;

        uint64_t v14 = (id *)[v11 initWithTimeIntervalSince1970:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v38 = [v19 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v18 = 0;
            goto LABEL_39;
          }
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"visited"];
          v49 = v40;
          int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          uint64_t v18 = 0;
          *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v20];
          a4 = 0;
          goto LABEL_38;
        }
        uint64_t v14 = v8;
      }
      v38 = v14;
    }
    else
    {
      v38 = 0;
    }
LABEL_16:
    int v20 = [v6 objectForKeyedSubscript:@"platform"];
    v39 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v40 = 0;
            uint64_t v18 = 0;
            a4 = v38;
            goto LABEL_38;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v46 = *MEMORY[0x1E4F28568];
          v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"platform"];
          v47 = v23;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          v40 = 0;
          uint64_t v18 = 0;
          *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v22];
          goto LABEL_58;
        }
        id v21 = [NSNumber numberWithInt:BMSafariWebPagePerformancePlatformFromString(v20)];
      }
      v40 = v21;
    }
    else
    {
      v40 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"performanceEvent"];
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
      goto LABEL_32;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v22;
LABEL_31:
      v23 = v24;
LABEL_32:
      v25 = [v6 objectForKeyedSubscript:@"privacyProxy"];
      if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v26 = 0;
LABEL_35:
        a4 = v38;
        uint64_t v18 = -[BMSafariWebPagePerformance initWithDomain:visited:platform:performanceEvent:privacyProxy:](self, "initWithDomain:visited:platform:performanceEvent:privacyProxy:", v41, v38, [v40 intValue], objc_msgSend(v23, "intValue"), v26);
        self = v18;
LABEL_36:

LABEL_37:
        uint64_t v7 = v39;
LABEL_38:

        goto LABEL_39;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v25;
        goto LABEL_35;
      }
      if (a4)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"privacyProxy"];
        v43 = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *a4 = (id)[v36 initWithDomain:v34 code:2 userInfo:v29];
      }
      id v26 = 0;
      uint64_t v18 = 0;
LABEL_53:
      a4 = v38;
      goto LABEL_36;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [NSNumber numberWithInt:BMSafariWebPagePerformanceWebPerformanceEventFromString(v22)];
      goto LABEL_31;
    }
    if (a4)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"performanceEvent"];
      id v45 = v26;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v23 = 0;
      uint64_t v18 = 0;
      *a4 = (id)[v37 initWithDomain:v35 code:2 userInfo:v25];
      goto LABEL_53;
    }
    v23 = 0;
    uint64_t v18 = 0;
LABEL_58:
    a4 = v38;
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v41 = 0;
    uint64_t v18 = 0;
    goto LABEL_40;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  v17 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
  v51[0] = v17;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  id v41 = 0;
  uint64_t v18 = 0;
  *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v8];
  a4 = v17;
LABEL_39:

LABEL_40:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariWebPagePerformance *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_visited) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasPrivacyProxy) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMSafariWebPagePerformance;
  id v5 = [(BMEventBase *)&v48 init];
  if (!v5) {
    goto LABEL_69;
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
          uint64_t v20 = PBReaderReadString();
          domain = v5->_domain;
          v5->_domain = (NSString *)v20;

          continue;
        case 2u:
          v5->_hasRaw_visited = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          v5->_raw_visited = v24;
          continue;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            uint64_t v28 = *v6;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v7]) {
              break;
            }
            char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
            *(void *)&v4[v28] = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if ((v31 & 0x80) == 0) {
              goto LABEL_48;
            }
            v25 += 7;
            BOOL v17 = v26++ >= 9;
            if (v17)
            {
              LODWORD(v27) = 0;
              goto LABEL_50;
            }
          }
          v4[*v8] = 1;
LABEL_48:
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_50:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v45 = 40;
          goto LABEL_59;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v34 = *v6;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_56:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v45 = 44;
LABEL_59:
          *(_DWORD *)((char *)&v5->super.super.isa + v45) = v27;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasPrivacyProxy = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_68;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v6;
        uint64_t v42 = *(void *)&v4[v41];
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)&v4[*v7]) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
        *(void *)&v4[v41] = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0) {
          goto LABEL_61;
        }
        v38 += 7;
        BOOL v17 = v39++ >= 9;
        if (v17)
        {
          uint64_t v40 = 0;
          goto LABEL_63;
        }
      }
      v4[*v8] = 1;
LABEL_61:
      if (v4[*v8]) {
        uint64_t v40 = 0;
      }
LABEL_63:
      v5->_privacyProxy = v40 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_68:
  }
    uint64_t v46 = 0;
  else {
LABEL_69:
  }
    uint64_t v46 = v5;

  return v46;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariWebPagePerformance *)self domain];
  id v5 = [(BMSafariWebPagePerformance *)self visited];
  id v6 = BMSafariWebPagePerformancePlatformAsString([(BMSafariWebPagePerformance *)self platform]);
  uint64_t v7 = BMSafariWebPagePerformanceWebPerformanceEventAsString([(BMSafariWebPagePerformance *)self performanceEvent]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariWebPagePerformance privacyProxy](self, "privacyProxy"));
  v9 = (void *)[v3 initWithFormat:@"BMSafariWebPagePerformance with domain: %@, visited: %@, platform: %@, performanceEvent: %@, privacyProxy: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSafariWebPagePerformance)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 performanceEvent:(int)a6 privacyProxy:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSafariWebPagePerformance;
  char v16 = [(BMEventBase *)&v19 init];
  if (v16)
  {
    v16->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v16->_domain, a3);
    if (v14)
    {
      v16->_hasRaw_visited = 1;
      [v14 timeIntervalSince1970];
    }
    else
    {
      v16->_hasRaw_visited = 0;
      double v17 = -1.0;
    }
    v16->_raw_visited = v17;
    v16->_platform = a5;
    v16->_performanceEvent = a6;
    if (v15)
    {
      v16->_hasPrivacyProxy = 1;
      v16->_privacyProxy = [v15 BOOLValue];
    }
    else
    {
      v16->_hasPrivacyProxy = 0;
      v16->_privacyProxy = 0;
    }
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"visited", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"platform" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"performanceEvent" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"privacyProxy" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF68A0;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visited" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"platform" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"performanceEvent" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"privacyProxy" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSafariWebPagePerformance alloc] initByReadFrom:v7];
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