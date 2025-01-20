@interface BMSafariWindowProxy
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariWindowProxy)initWithDomain:(id)a3 openedDomain:(id)a4 visited:(id)a5 property:(int)a6 accessedPropertyDirectly:(id)a7;
- (BMSafariWindowProxy)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)accessedPropertyDirectly;
- (BOOL)hasAccessedPropertyDirectly;
- (BOOL)isEqual:(id)a3;
- (NSDate)visited;
- (NSString)description;
- (NSString)domain;
- (NSString)openedDomain;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)property;
- (unsigned)dataVersion;
- (void)setHasAccessedPropertyDirectly:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariWindowProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openedDomain, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setHasAccessedPropertyDirectly:(BOOL)a3
{
  self->_hasAccessedPropertyDirectly = a3;
}

- (BOOL)hasAccessedPropertyDirectly
{
  return self->_hasAccessedPropertyDirectly;
}

- (BOOL)accessedPropertyDirectly
{
  return self->_accessedPropertyDirectly;
}

- (int)property
{
  return self->_property;
}

- (NSString)openedDomain
{
  return self->_openedDomain;
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
    v6 = [(BMSafariWindowProxy *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariWindowProxy *)self domain];
      v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMSafariWindowProxy *)self openedDomain];
    uint64_t v14 = [v5 openedDomain];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariWindowProxy *)self openedDomain];
      v17 = [v5 openedDomain];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMSafariWindowProxy *)self visited];
    uint64_t v20 = [v5 visited];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSafariWindowProxy *)self visited];
      v23 = [v5 visited];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    int v25 = [(BMSafariWindowProxy *)self property];
    if (v25 == [v5 property])
    {
      if (![(BMSafariWindowProxy *)self hasAccessedPropertyDirectly]
        && ![v5 hasAccessedPropertyDirectly])
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if ([(BMSafariWindowProxy *)self hasAccessedPropertyDirectly]
        && [v5 hasAccessedPropertyDirectly])
      {
        BOOL v26 = [(BMSafariWindowProxy *)self accessedPropertyDirectly];
        int v12 = v26 ^ [v5 accessedPropertyDirectly] ^ 1;
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
  v3 = [(BMSafariWindowProxy *)self domain];
  id v4 = [(BMSafariWindowProxy *)self openedDomain];
  id v5 = [(BMSafariWindowProxy *)self visited];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMSafariWindowProxy *)self visited];
    [v7 timeIntervalSince1970];
    v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }

  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariWindowProxy property](self, "property"));
  if ([(BMSafariWindowProxy *)self hasAccessedPropertyDirectly])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariWindowProxy accessedPropertyDirectly](self, "accessedPropertyDirectly"));
  }
  else
  {
    v10 = 0;
  }
  uint64_t v20 = @"domain";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  v21 = @"openedDomain";
  int v12 = v4;
  if (!v4)
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  v22 = @"visited";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"property";
  uint64_t v14 = v9;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  int v24 = @"accessedPropertyDirectly";
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

  return v16;
}

- (BMSafariWindowProxy)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"domain"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v42 = 0;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"openedDomain"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v41 = 0;
          uint64_t v18 = 0;
          goto LABEL_38;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v49 = *MEMORY[0x1E4F28568];
        v21 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"openedDomain"];
        v50 = a4;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        id v41 = 0;
        uint64_t v18 = 0;
        id *v21 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
        goto LABEL_37;
      }
      id v41 = v8;
    }
    else
    {
      id v41 = 0;
    }
    v9 = [v6 objectForKeyedSubscript:@"visited"];
    v39 = a4;
    v40 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v11 = v9;
        id v12 = [v10 alloc];
        [v11 doubleValue];
        double v14 = v13;

        v15 = (id *)[v12 initWithTimeIntervalSince1970:v14];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          a4 = [v22 dateFromString:v9];

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v18 = 0;
            goto LABEL_37;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v32 = *MEMORY[0x1E4F502C8];
          uint64_t v47 = *MEMORY[0x1E4F28568];
          int v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"visited"];
          v48 = v24;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          id v33 = (id)[v31 initWithDomain:v32 code:2 userInfo:v23];
          v34 = a4;
          a4 = 0;
          uint64_t v18 = 0;
          id *v34 = v33;
LABEL_36:

          uint64_t v7 = v40;
LABEL_37:

          goto LABEL_38;
        }
        v15 = v9;
      }
      a4 = v15;
    }
    else
    {
      a4 = 0;
    }
LABEL_23:
    v23 = [v6 objectForKeyedSubscript:@"property"];
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v39)
          {
            int v24 = 0;
            uint64_t v18 = 0;
            goto LABEL_36;
          }
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          id v27 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"property"];
          id v46 = v27;
          BOOL v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          int v24 = 0;
          uint64_t v18 = 0;
          id *v39 = (id)[v38 initWithDomain:v36 code:2 userInfo:v26];
          goto LABEL_35;
        }
        id v25 = [NSNumber numberWithInt:BMSafariWindowProxyPropertyFromString(v23)];
      }
      int v24 = v25;
    }
    else
    {
      int v24 = 0;
    }
    BOOL v26 = [v6 objectForKeyedSubscript:@"accessedPropertyDirectly"];
    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v39)
        {
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"accessedPropertyDirectly"];
          v44 = v29;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id *v39 = (id)[v37 initWithDomain:v35 code:2 userInfo:v30];
        }
        id v27 = 0;
        uint64_t v18 = 0;
        goto LABEL_35;
      }
      id v27 = v26;
    }
    else
    {
      id v27 = 0;
    }
    uint64_t v18 = -[BMSafariWindowProxy initWithDomain:openedDomain:visited:property:accessedPropertyDirectly:](self, "initWithDomain:openedDomain:visited:property:accessedPropertyDirectly:", v42, v41, a4, [v24 intValue], v27);
    self = v18;
LABEL_35:

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v42 = 0;
    uint64_t v18 = 0;
    goto LABEL_39;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  id v41 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
  v52[0] = v41;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  id v42 = 0;
  uint64_t v18 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v8];
LABEL_38:

LABEL_39:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariWindowProxy *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_openedDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_visited) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasAccessedPropertyDirectly) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMSafariWindowProxy;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_57;
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
          uint64_t v21 = 48;
          goto LABEL_24;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
LABEL_24:
          id v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v5->_hasRaw_visited = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            double v25 = *(double *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v25 = 0.0;
          }
          v5->_raw_visited = v25;
          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v17 = v27++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v28) = 0;
          }
LABEL_45:
          if (v28 >= 5) {
            LODWORD(v28) = 0;
          }
          v5->_property = v28;
          continue;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasAccessedPropertyDirectly = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_56;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v6;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_49;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          uint64_t v35 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8]) {
        uint64_t v35 = 0;
      }
LABEL_51:
      v5->_accessedPropertyDirectly = v35 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_56:
  }
    v40 = 0;
  else {
LABEL_57:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariWindowProxy *)self domain];
  id v5 = [(BMSafariWindowProxy *)self openedDomain];
  id v6 = [(BMSafariWindowProxy *)self visited];
  uint64_t v7 = BMSafariWindowProxyPropertyAsString([(BMSafariWindowProxy *)self property]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariWindowProxy accessedPropertyDirectly](self, "accessedPropertyDirectly"));
  v9 = (void *)[v3 initWithFormat:@"BMSafariWindowProxy with domain: %@, openedDomain: %@, visited: %@, property: %@, accessedPropertyDirectly: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSafariWindowProxy)initWithDomain:(id)a3 openedDomain:(id)a4 visited:(id)a5 property:(int)a6 accessedPropertyDirectly:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSafariWindowProxy;
  BOOL v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_domain, a3);
    objc_storeStrong((id *)&v17->_openedDomain, a4);
    if (v15)
    {
      v17->_hasRaw_visited = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_visited = 0;
      double v18 = -1.0;
    }
    v17->_raw_visited = v18;
    v17->_property = a6;
    if (v16)
    {
      v17->_hasAccessedPropertyDirectly = 1;
      v17->_accessedPropertyDirectly = [v16 BOOLValue];
    }
    else
    {
      v17->_hasAccessedPropertyDirectly = 0;
      v17->_accessedPropertyDirectly = 0;
    }
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"openedDomain", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visited" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"property" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessedPropertyDirectly" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF40B0;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"openedDomain" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visited" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"property" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessedPropertyDirectly" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
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

    v8 = [[BMSafariWindowProxy alloc] initByReadFrom:v7];
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