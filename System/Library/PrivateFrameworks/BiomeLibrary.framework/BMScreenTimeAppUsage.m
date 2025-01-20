@interface BMScreenTimeAppUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMScreenTimeAppUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMScreenTimeAppUsage)initWithStarting:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 parentBundleID:(id)a6 isUsageTrusted:(id)a7;
- (BOOL)hasIsUsageTrusted;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsageTrusted;
- (BOOL)starting;
- (NSDate)absoluteTimestamp;
- (NSString)bundleID;
- (NSString)description;
- (NSString)parentBundleID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsUsageTrusted:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMScreenTimeAppUsage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (BMScreenTimeAppUsage)initWithStarting:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 parentBundleID:(id)a6 isUsageTrusted:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMScreenTimeAppUsage;
  v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v17->_hasStarting = 1;
      v17->_starting = [v12 BOOLValue];
    }
    else
    {
      v17->_hasStarting = 0;
      v17->_starting = 0;
    }
    if (v13)
    {
      v17->_hasRaw_absoluteTimestamp = 1;
      [v13 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_absoluteTimestamp = 0;
      double v18 = -1.0;
    }
    v17->_raw_absoluteTimestamp = v18;
    objc_storeStrong((id *)&v17->_bundleID, a5);
    objc_storeStrong((id *)&v17->_parentBundleID, a6);
    if (v16)
    {
      v17->_hasIsUsageTrusted = 1;
      v17->_isUsageTrusted = [v16 BOOLValue];
    }
    else
    {
      v17->_hasIsUsageTrusted = 0;
      v17->_isUsageTrusted = 0;
    }
  }

  return v17;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMScreenTimeAppUsage *)self writeTo:v3];
  v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_parentBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsUsageTrusted)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)setHasIsUsageTrusted:(BOOL)a3
{
  self->_hasIsUsageTrusted = a3;
}

- (BOOL)hasIsUsageTrusted
{
  return self->_hasIsUsageTrusted;
}

- (BOOL)isUsageTrusted
{
  return self->_isUsageTrusted;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (NSString)bundleID
{
  return self->_bundleID;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[BMScreenTimeAppUsage hasStarting](self, "hasStarting") || [v5 hasStarting])
    {
      if (![(BMScreenTimeAppUsage *)self hasStarting]) {
        goto LABEL_25;
      }
      if (![v5 hasStarting]) {
        goto LABEL_25;
      }
      int v6 = [(BMScreenTimeAppUsage *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_25;
      }
    }
    v7 = [(BMScreenTimeAppUsage *)self absoluteTimestamp];
    uint64_t v8 = [v5 absoluteTimestamp];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMScreenTimeAppUsage *)self absoluteTimestamp];
      v11 = [v5 absoluteTimestamp];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_25;
      }
    }
    id v14 = [(BMScreenTimeAppUsage *)self bundleID];
    uint64_t v15 = [v5 bundleID];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      id v16 = (void *)v15;
      v17 = [(BMScreenTimeAppUsage *)self bundleID];
      double v18 = [v5 bundleID];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_25;
      }
    }
    objc_super v20 = [(BMScreenTimeAppUsage *)self parentBundleID];
    uint64_t v21 = [v5 parentBundleID];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMScreenTimeAppUsage *)self parentBundleID];
      v24 = [v5 parentBundleID];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_25;
      }
    }
    if (![(BMScreenTimeAppUsage *)self hasIsUsageTrusted]
      && ![v5 hasIsUsageTrusted])
    {
      LOBYTE(v13) = 1;
      goto LABEL_26;
    }
    if ([(BMScreenTimeAppUsage *)self hasIsUsageTrusted]
      && [v5 hasIsUsageTrusted])
    {
      BOOL v26 = [(BMScreenTimeAppUsage *)self isUsageTrusted];
      int v13 = v26 ^ [v5 isUsageTrusted] ^ 1;
LABEL_26:

      goto LABEL_27;
    }
LABEL_25:
    LOBYTE(v13) = 0;
    goto LABEL_26;
  }
  LOBYTE(v13) = 0;
LABEL_27:

  return v13;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  if ([(BMScreenTimeAppUsage *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenTimeAppUsage starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMScreenTimeAppUsage *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMScreenTimeAppUsage *)self absoluteTimestamp];
    [v6 timeIntervalSince1970];
    v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    v7 = 0;
  }

  uint64_t v8 = [(BMScreenTimeAppUsage *)self bundleID];
  v9 = [(BMScreenTimeAppUsage *)self parentBundleID];
  if ([(BMScreenTimeAppUsage *)self hasIsUsageTrusted])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenTimeAppUsage isUsageTrusted](self, "isUsageTrusted"));
  }
  else
  {
    v10 = 0;
  }
  objc_super v20 = @"starting";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  uint64_t v21 = @"absoluteTimestamp";
  int v12 = v7;
  if (!v7)
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  v22 = @"bundleID";
  int v13 = v8;
  if (!v8)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"parentBundleID";
  id v14 = v9;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  v24 = @"isUsageTrusted";
  uint64_t v15 = v10;
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v15;
  id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  if (v10)
  {
    if (v9) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v9)
    {
LABEL_22:
      if (v8) {
        goto LABEL_23;
      }
      goto LABEL_30;
    }
  }

  if (v8)
  {
LABEL_23:
    if (v7) {
      goto LABEL_24;
    }
LABEL_31:

    if (v3) {
      goto LABEL_25;
    }
    goto LABEL_32;
  }
LABEL_30:

  if (!v7) {
    goto LABEL_31;
  }
LABEL_24:
  if (v3) {
    goto LABEL_25;
  }
LABEL_32:

LABEL_25:

  return v16;
}

- (BMScreenTimeAppUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v41 = 0;
LABEL_4:
    uint64_t v8 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
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

        id v14 = (id *)[v11 initWithTimeIntervalSince1970:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v39 = [v19 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v18 = 0;
            goto LABEL_43;
          }
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          id v49 = v40;
          objc_super v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          uint64_t v18 = 0;
          *a4 = (id)[v33 initWithDomain:v34 code:2 userInfo:v20];
          a4 = 0;
          goto LABEL_42;
        }
        id v14 = v8;
      }
      v39 = v14;
    }
    else
    {
      v39 = 0;
    }
LABEL_16:
    objc_super v20 = [v6 objectForKeyedSubscript:@"bundleID"];
    v38 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v40 = 0;
          uint64_t v18 = 0;
          a4 = v39;
          goto LABEL_42;
        }
        uint64_t v21 = self;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        id v47 = v23;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        uint64_t v18 = 0;
        id v40 = 0;
        *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v22];
        goto LABEL_50;
      }
      uint64_t v21 = self;
      id v40 = v20;
    }
    else
    {
      uint64_t v21 = self;
      id v40 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"parentBundleID"];
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v23 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
LABEL_22:
      v24 = [v6 objectForKeyedSubscript:@"isUsageTrusted"];
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v25 = 0;
LABEL_25:
        a4 = v39;
        uint64_t v18 = [(BMScreenTimeAppUsage *)v21 initWithStarting:v41 absoluteTimestamp:v39 bundleID:v40 parentBundleID:v23 isUsageTrusted:v25];
        uint64_t v21 = v18;
LABEL_40:

LABEL_41:
        self = v21;
        v7 = v38;
LABEL_42:

        goto LABEL_43;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;
        goto LABEL_25;
      }
      if (a4)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUsageTrusted"];
        v43 = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *a4 = (id)[v37 initWithDomain:v35 code:2 userInfo:v31];
      }
      id v25 = 0;
      uint64_t v18 = 0;
LABEL_39:
      a4 = v39;
      goto LABEL_40;
    }
    if (a4)
    {
      id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"parentBundleID"];
      id v45 = v25;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v29 = (id)[v36 initWithDomain:v28 code:2 userInfo:v24];
      uint64_t v18 = 0;
      id v23 = 0;
      *a4 = v29;
      goto LABEL_39;
    }
    id v23 = 0;
    uint64_t v18 = 0;
LABEL_50:
    a4 = v39;
    goto LABEL_41;
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
    goto LABEL_44;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  v17 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
  v51[0] = v17;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  id v41 = 0;
  uint64_t v18 = 0;
  *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v8];
  a4 = v17;
LABEL_43:

LABEL_44:
  return v18;
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMScreenTimeAppUsage;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_56;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasStarting = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_43;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_45;
            }
          }
          v4[*v8] = 1;
LABEL_43:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_45:
          BOOL v40 = v22 != 0;
          uint64_t v41 = 32;
          goto LABEL_50;
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
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 40;
          goto LABEL_34;
        case 4u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 48;
LABEL_34:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsUsageTrusted = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_55;
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
          goto LABEL_47;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          uint64_t v35 = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8]) {
        uint64_t v35 = 0;
      }
LABEL_49:
      BOOL v40 = v35 != 0;
      uint64_t v41 = 34;
LABEL_50:
      *((unsigned char *)&v5->super.super.isa + v41) = v40;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_55:
  }
    uint64_t v42 = 0;
  else {
LABEL_56:
  }
    uint64_t v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenTimeAppUsage starting](self, "starting"));
  id v5 = [(BMScreenTimeAppUsage *)self absoluteTimestamp];
  id v6 = [(BMScreenTimeAppUsage *)self bundleID];
  v7 = [(BMScreenTimeAppUsage *)self parentBundleID];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenTimeAppUsage isUsageTrusted](self, "isUsageTrusted"));
  v9 = (void *)[v3 initWithFormat:@"BMScreenTimeAppUsage with starting: %@, absoluteTimestamp: %@, bundleID: %@, parentBundleID: %@, isUsageTrusted: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"absoluteTimestamp", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parentBundleID" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUsageTrusted" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5D48;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"parentBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUsageTrusted" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMScreenTimeAppUsage alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

@end