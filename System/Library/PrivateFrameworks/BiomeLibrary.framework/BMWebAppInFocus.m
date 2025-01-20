@interface BMWebAppInFocus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMWebAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMWebAppInFocus)initWithStarting:(id)a3 absoluteTimestamp:(id)a4 type:(int)a5 identifier:(id)a6 name:(id)a7 manifestId:(id)a8;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)identifier;
- (NSString)manifestId;
- (NSString)name;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMWebAppInFocus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestId, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)manifestId
{
  return self->_manifestId;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)type
{
  return self->_type;
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
    if (-[BMWebAppInFocus hasStarting](self, "hasStarting") || [v5 hasStarting])
    {
      if (![(BMWebAppInFocus *)self hasStarting]) {
        goto LABEL_19;
      }
      if (![v5 hasStarting]) {
        goto LABEL_19;
      }
      int v6 = [(BMWebAppInFocus *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_19;
      }
    }
    v7 = [(BMWebAppInFocus *)self absoluteTimestamp];
    uint64_t v8 = [v5 absoluteTimestamp];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMWebAppInFocus *)self absoluteTimestamp];
      v11 = [v5 absoluteTimestamp];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_19;
      }
    }
    int v14 = [(BMWebAppInFocus *)self type];
    if (v14 == [v5 type])
    {
      v15 = [(BMWebAppInFocus *)self identifier];
      uint64_t v16 = [v5 identifier];
      if (v15 == (void *)v16)
      {
      }
      else
      {
        v17 = (void *)v16;
        v18 = [(BMWebAppInFocus *)self identifier];
        v19 = [v5 identifier];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_19;
        }
      }
      v21 = [(BMWebAppInFocus *)self name];
      uint64_t v22 = [v5 name];
      if (v21 == (void *)v22)
      {
      }
      else
      {
        v23 = (void *)v22;
        v24 = [(BMWebAppInFocus *)self name];
        v25 = [v5 name];
        int v26 = [v24 isEqual:v25];

        if (!v26) {
          goto LABEL_19;
        }
      }
      v28 = [(BMWebAppInFocus *)self manifestId];
      v29 = [v5 manifestId];
      if (v28 == v29)
      {
        char v13 = 1;
      }
      else
      {
        v30 = [(BMWebAppInFocus *)self manifestId];
        v31 = [v5 manifestId];
        char v13 = [v30 isEqual:v31];
      }
      goto LABEL_20;
    }
LABEL_19:
    char v13 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v13 = 0;
LABEL_21:

  return v13;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v25[6] = *MEMORY[0x1E4F143B8];
  if ([(BMWebAppInFocus *)self hasStarting])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMWebAppInFocus starting](self, "starting"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMWebAppInFocus *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMWebAppInFocus *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    v7 = 0;
  }

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWebAppInFocus type](self, "type"));
  v9 = [(BMWebAppInFocus *)self identifier];
  v10 = [(BMWebAppInFocus *)self name];
  v11 = [(BMWebAppInFocus *)self manifestId];
  v24[0] = @"starting";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = (void *)v12;
  v23 = (void *)v3;
  v25[0] = v12;
  v24[1] = @"absoluteTimestamp";
  uint64_t v13 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v13;
  v25[1] = v13;
  v24[2] = @"type";
  int v14 = v8;
  if (!v8)
  {
    int v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v13, v22);
  }
  v25[2] = v14;
  v24[3] = @"identifier";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v15;
  v24[4] = @"name";
  uint64_t v16 = v10;
  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"manifestId";
  v17 = v11;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v10) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v10)
    {
LABEL_21:
      if (v9) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }

  if (v9)
  {
LABEL_22:
    if (v8) {
      goto LABEL_23;
    }
LABEL_32:

    if (v7) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
LABEL_31:

  if (!v8) {
    goto LABEL_32;
  }
LABEL_23:
  if (v7) {
    goto LABEL_24;
  }
LABEL_33:

LABEL_24:
  if (!v23) {

  }
  return v18;
}

- (BMWebAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
    v54 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v12 = v10;
        id v13 = [v11 alloc];
        [v12 doubleValue];
        double v15 = v14;

        id v16 = (id)[v13 initWithTimeIntervalSinceReferenceDate:v15];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v57 = [v21 dateFromString:v10];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v57 = 0;
            uint64_t v20 = 0;
            goto LABEL_43;
          }
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          v51 = a4;
          uint64_t v46 = *MEMORY[0x1E4F502C8];
          uint64_t v66 = *MEMORY[0x1E4F28568];
          v56 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          v67 = v56;
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          v57 = 0;
          uint64_t v20 = 0;
          id *v51 = (id)[v45 initWithDomain:v46 code:2 userInfo:v22];
          goto LABEL_42;
        }
        id v16 = v10;
      }
      v57 = v16;
    }
    else
    {
      v57 = 0;
    }
LABEL_16:
    uint64_t v22 = [v6 objectForKeyedSubscript:@"type"];
    v53 = v7;
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v56 = 0;
            uint64_t v20 = 0;
            goto LABEL_41;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          v50 = a4;
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v64 = *MEMORY[0x1E4F28568];
          v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v65 = v31;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          v56 = 0;
          uint64_t v20 = 0;
          id *v50 = (id)[v43 initWithDomain:v44 code:2 userInfo:v24];
LABEL_40:

LABEL_41:
          v7 = v53;
LABEL_42:

          v10 = v54;
          goto LABEL_43;
        }
        id v23 = [NSNumber numberWithInt:BMWebAppInFocusWebAppTypeFromString(v22)];
      }
      v56 = v23;
    }
    else
    {
      v56 = 0;
    }
    v24 = [v6 objectForKeyedSubscript:@"identifier"];
    id v55 = v8;
    if (v24)
    {
      uint64_t v20 = (BMWebAppInFocus *)a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v31 = 0;
            goto LABEL_40;
          }
          v33 = a4;
          v27 = self;
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
          id v63 = v28;
          int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
          id v36 = (id)[v34 initWithDomain:v35 code:2 userInfo:v26];
          uint64_t v20 = 0;
          v31 = 0;
          id *v33 = v36;
          goto LABEL_39;
        }
        v52 = v22;
        id v25 = v24;
LABEL_29:
        int v26 = [v6 objectForKeyedSubscript:@"name"];
        if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v27 = self;
          id v28 = 0;
        }
        else
        {
          objc_opt_class();
          v27 = self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v20)
            {
              id v28 = 0;
              v31 = v25;
              uint64_t v22 = v52;
              goto LABEL_39;
            }
            v37 = v20;
            id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v39 = *MEMORY[0x1E4F502C8];
            uint64_t v60 = *MEMORY[0x1E4F28568];
            id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
            id v61 = v30;
            v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
            v40 = (objc_class *)(id)[v38 initWithDomain:v39 code:2 userInfo:v29];
            uint64_t v20 = 0;
            id v28 = 0;
            v37->super.super.isa = v40;
            v31 = v25;
            uint64_t v22 = v52;
            goto LABEL_38;
          }
          id v28 = v26;
        }
        v29 = [v6 objectForKeyedSubscript:@"manifestId"];
        if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          v31 = v25;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v22 = v52;
            if (v20)
            {
              id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v47 = *MEMORY[0x1E4F502C8];
              uint64_t v58 = *MEMORY[0x1E4F28568];
              v49 = v20;
              v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"manifestId"];
              v59 = v41;
              v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
              v49->super.super.isa = (Class)(id)[v48 initWithDomain:v47 code:2 userInfo:v42];

              id v30 = 0;
              uint64_t v20 = 0;
            }
            else
            {
              id v30 = 0;
            }
            goto LABEL_38;
          }
          id v30 = v29;
        }
        else
        {
          id v30 = 0;
          v31 = v25;
        }
        uint64_t v22 = v52;
        uint64_t v20 = -[BMWebAppInFocus initWithStarting:absoluteTimestamp:type:identifier:name:manifestId:](v27, "initWithStarting:absoluteTimestamp:type:identifier:name:manifestId:", v55, v57, [v56 intValue], v31, v28, v30);
        v27 = v20;
LABEL_38:

LABEL_39:
        self = v27;
        id v8 = v55;
        goto LABEL_40;
      }
      v52 = v22;
    }
    else
    {
      v52 = v22;
      uint64_t v20 = (BMWebAppInFocus *)a4;
    }
    id v25 = 0;
    goto LABEL_29;
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
    uint64_t v20 = 0;
    goto LABEL_44;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v68 = *MEMORY[0x1E4F28568];
  v57 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
  v69[0] = v57;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
  id v8 = 0;
  uint64_t v20 = 0;
  id *v18 = (id)[v17 initWithDomain:v19 code:2 userInfo:v10];
LABEL_43:

LABEL_44:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMWebAppInFocus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_manifestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMWebAppInFocus;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_58;
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
          v5->_hasStarting = 1;
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
                  uint64_t v22 = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_46:
          v5->_starting = v22 != 0;
          continue;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v29;
          continue;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          break;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 48;
          goto LABEL_42;
        case 5u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 56;
          goto LABEL_42;
        case 6u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 64;
LABEL_42:
          uint64_t v39 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_57;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v6;
        uint64_t v34 = *(void *)&v4[v33];
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)&v4[*v7]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
        *(void *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0) {
          goto LABEL_48;
        }
        v30 += 7;
        BOOL v17 = v31++ >= 9;
        if (v17)
        {
          LODWORD(v32) = 0;
          goto LABEL_50;
        }
      }
      v4[*v8] = 1;
LABEL_48:
      if (v4[*v8]) {
        LODWORD(v32) = 0;
      }
LABEL_50:
      if (v32 >= 3) {
        LODWORD(v32) = 0;
      }
      v5->_type = v32;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_57:
  }
    v40 = 0;
  else {
LABEL_58:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMWebAppInFocus starting](self, "starting"));
  id v5 = [(BMWebAppInFocus *)self absoluteTimestamp];
  id v6 = BMWebAppInFocusWebAppTypeAsString([(BMWebAppInFocus *)self type]);
  v7 = [(BMWebAppInFocus *)self identifier];
  id v8 = [(BMWebAppInFocus *)self name];
  uint64_t v9 = [(BMWebAppInFocus *)self manifestId];
  char v10 = (void *)[v3 initWithFormat:@"BMWebAppInFocus with starting: %@, absoluteTimestamp: %@, type: %@, identifier: %@, name: %@, manifestId: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMWebAppInFocus)initWithStarting:(id)a3 absoluteTimestamp:(id)a4 type:(int)a5 identifier:(id)a6 name:(id)a7 manifestId:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMWebAppInFocus;
  uint64_t v19 = [(BMEventBase *)&v22 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v19->_hasStarting = 1;
      v19->_starting = [v14 BOOLValue];
    }
    else
    {
      v19->_hasStarting = 0;
      v19->_starting = 0;
    }
    if (v15)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      [v15 timeIntervalSinceReferenceDate];
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
    v19->_type = a5;
    objc_storeStrong((id *)&v19->_identifier, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_manifestId, a8);
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:2 type:0 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"manifestId" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4110;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"manifestId" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
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

    id v8 = [[BMWebAppInFocus alloc] initByReadFrom:v7];
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