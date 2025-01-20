@interface BMProactiveHarvestingNotes
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingNotes)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingNotes)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 contentProtection:(id)a8 personaId:(id)a9;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)domainID;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingNotes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
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
    v6 = [(BMProactiveHarvestingNotes *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingNotes *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v13 = [(BMProactiveHarvestingNotes *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingNotes *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_25;
      }
    }
    v19 = [(BMProactiveHarvestingNotes *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingNotes *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_25;
      }
    }
    v25 = [(BMProactiveHarvestingNotes *)self title];
    uint64_t v26 = [v5 title];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingNotes *)self title];
      v29 = [v5 title];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_25;
      }
    }
    v31 = [(BMProactiveHarvestingNotes *)self content];
    uint64_t v32 = [v5 content];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingNotes *)self content];
      v35 = [v5 content];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_25;
      }
    }
    v37 = [(BMProactiveHarvestingNotes *)self contentProtection];
    uint64_t v38 = [v5 contentProtection];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingNotes *)self contentProtection];
      v41 = [v5 contentProtection];
      int v42 = [v40 isEqual:v41];

      if (!v42)
      {
LABEL_25:
        char v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v44 = [(BMProactiveHarvestingNotes *)self personaId];
    v45 = [v5 personaId];
    if (v44 == v45)
    {
      char v12 = 1;
    }
    else
    {
      v46 = [(BMProactiveHarvestingNotes *)self personaId];
      v47 = [v5 personaId];
      char v12 = [v46 isEqual:v47];
    }
    goto LABEL_26;
  }
  char v12 = 0;
LABEL_27:

  return v12;
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
  v28[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingNotes *)self uniqueID];
  uint64_t v4 = [(BMProactiveHarvestingNotes *)self domainID];
  id v5 = [(BMProactiveHarvestingNotes *)self absoluteTimestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMProactiveHarvestingNotes *)self absoluteTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v26 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v26 = 0;
  }

  v8 = [(BMProactiveHarvestingNotes *)self title];
  v9 = [(BMProactiveHarvestingNotes *)self content];
  v10 = [(BMProactiveHarvestingNotes *)self contentProtection];
  int v11 = [(BMProactiveHarvestingNotes *)self personaId];
  v27[0] = @"uniqueID";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v12;
  v28[0] = v12;
  v27[1] = @"domainID";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v13;
  v28[1] = v13;
  v27[2] = @"absoluteTimestamp";
  uint64_t v14 = (uint64_t)v26;
  if (!v26)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[2] = v14;
  v27[3] = @"title";
  v15 = v8;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v14;
  v25 = (void *)v3;
  v28[3] = v15;
  v27[4] = @"content";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v4;
  v28[4] = v16;
  v27[5] = @"contentProtection";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v18;
  v27[6] = @"personaId";
  v19 = v11;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
  if (v11)
  {
    if (v10) {
      goto LABEL_20;
    }
LABEL_30:

    if (v9) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }

  if (!v10) {
    goto LABEL_30;
  }
LABEL_20:
  if (v9) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v8) {

  }
  if (v26)
  {
    if (v17) {
      goto LABEL_25;
    }
LABEL_33:

    if (v25) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v17) {
    goto LABEL_33;
  }
LABEL_25:
  if (v25) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v20;
}

- (BMProactiveHarvestingNotes)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"uniqueID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"domainID"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v68 = 0;
LABEL_7:
      v10 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
      v63 = v9;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = (objc_class *)MEMORY[0x1E4F1C9C8];
          uint64_t v13 = v10;
          id v14 = v10;
          id v15 = [v12 alloc];
          [v14 doubleValue];
          double v17 = v16;

          v10 = v13;
          id v18 = (id)[v15 initWithTimeIntervalSinceReferenceDate:v17];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            int v11 = [v28 dateFromString:v10];

            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              int v11 = 0;
              v21 = v68;
              goto LABEL_68;
            }
            id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
            v59 = a4;
            uint64_t v49 = *MEMORY[0x1E4F502C8];
            uint64_t v77 = *MEMORY[0x1E4F28568];
            id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
            id v78 = v67;
            v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            id v50 = (id)[v65 initWithDomain:v49 code:2 userInfo:v29];
            int v11 = 0;
            a4 = 0;
            id *v59 = v50;
            v21 = v68;
            goto LABEL_67;
          }
          id v18 = v10;
        }
        int v11 = v18;
      }
      else
      {
        int v11 = 0;
      }
LABEL_23:
      v29 = [v6 objectForKeyedSubscript:@"title"];
      id v66 = v8;
      v61 = v10;
      v62 = v11;
      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v67 = 0;
            v21 = v68;
LABEL_67:

            v9 = v63;
            goto LABEL_68;
          }
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          v55 = a4;
          uint64_t v37 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          id v64 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
          id v76 = v64;
          int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          uint64_t v38 = v36;
          v10 = v61;
          id v39 = (id)[v38 initWithDomain:v37 code:2 userInfo:v30];
          a4 = 0;
          id v67 = 0;
          id *v55 = v39;
          goto LABEL_58;
        }
        id v67 = v29;
      }
      else
      {
        id v67 = 0;
      }
      int v30 = [v6 objectForKeyedSubscript:@"content"];
      v60 = v7;
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v64 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = v30;
LABEL_29:
        v31 = [v6 objectForKeyedSubscript:@"contentProtection"];
        if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v32 = self;
          id v33 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        uint64_t v32 = self;
        if (objc_opt_isKindOfClass())
        {
          id v33 = v31;
LABEL_32:
          v34 = [v6 objectForKeyedSubscript:@"personaId"];
          if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v35 = 0;
LABEL_35:
            a4 = [(BMProactiveHarvestingNotes *)v32 initWithUniqueID:v66 domainID:v68 absoluteTimestamp:v11 title:v67 content:v64 contentProtection:v33 personaId:v35];
            uint64_t v32 = (BMProactiveHarvestingNotes *)a4;
LABEL_64:

            goto LABEL_65;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v35 = v34;
            goto LABEL_35;
          }
          if (a4)
          {
            id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v52 = *MEMORY[0x1E4F502C8];
            uint64_t v69 = *MEMORY[0x1E4F28568];
            v46 = a4;
            v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
            v70 = v47;
            v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            id *v46 = (id)[v58 initWithDomain:v52 code:2 userInfo:v48];

            id v35 = 0;
            a4 = 0;
          }
          else
          {
            id v35 = 0;
          }
LABEL_63:
          int v11 = v62;
          goto LABEL_64;
        }
        if (a4)
        {
          id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v43 = *MEMORY[0x1E4F502C8];
          uint64_t v71 = *MEMORY[0x1E4F28568];
          id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
          id v72 = v35;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          id v44 = (id)[v57 initWithDomain:v43 code:2 userInfo:v34];
          v45 = a4;
          a4 = 0;
          id v33 = 0;
          id *v45 = v44;
          goto LABEL_63;
        }
        id v33 = 0;
LABEL_65:

        self = v32;
        uint64_t v7 = v60;
        v10 = v61;
        v21 = v68;
        goto LABEL_66;
      }
      if (a4)
      {
        uint64_t v32 = self;
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        v56 = a4;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"content"];
        id v74 = v33;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        id v42 = (id)[v40 initWithDomain:v41 code:2 userInfo:v31];
        a4 = 0;
        id v64 = 0;
        id *v56 = v42;
        goto LABEL_65;
      }
      id v64 = 0;
LABEL_58:
      v21 = v68;
LABEL_66:

      id v8 = v66;
      goto LABEL_67;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v68 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      v54 = a4;
      uint64_t v24 = *MEMORY[0x1E4F502C8];
      uint64_t v79 = *MEMORY[0x1E4F28568];
      int v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainID"];
      v80 = v11;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      uint64_t v26 = v23;
      v10 = (void *)v25;
      id v27 = (id)[v26 initWithDomain:v24 code:2 userInfo:v25];
      v21 = 0;
      a4 = 0;
      id *v54 = v27;
LABEL_68:

      goto LABEL_69;
    }
    v21 = 0;
LABEL_69:

    goto LABEL_70;
  }
  if (a4)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    v53 = a4;
    uint64_t v20 = *MEMORY[0x1E4F502C8];
    uint64_t v81 = *MEMORY[0x1E4F28568];
    v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
    v82[0] = v21;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
    id v22 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
    id v8 = 0;
    a4 = 0;
    id *v53 = v22;
    goto LABEL_69;
  }
  id v8 = 0;
LABEL_70:

  return (BMProactiveHarvestingNotes *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingNotes *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domainID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_content)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMProactiveHarvestingNotes;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_38;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
        if (v11++ >= 9)
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
          uint64_t v21 = 40;
          goto LABEL_31;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_31;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v24;
          break;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_31;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_31;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_31;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
LABEL_31:
          uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_37;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_37:
  }
    uint64_t v26 = 0;
  else {
LABEL_38:
  }
    uint64_t v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingNotes *)self uniqueID];
  id v5 = [(BMProactiveHarvestingNotes *)self domainID];
  id v6 = [(BMProactiveHarvestingNotes *)self absoluteTimestamp];
  uint64_t v7 = [(BMProactiveHarvestingNotes *)self title];
  id v8 = [(BMProactiveHarvestingNotes *)self content];
  v9 = [(BMProactiveHarvestingNotes *)self contentProtection];
  char v10 = [(BMProactiveHarvestingNotes *)self personaId];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingNotes with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, content: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMProactiveHarvestingNotes)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 contentProtection:(id)a8 personaId:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMProactiveHarvestingNotes;
  id v19 = [(BMEventBase *)&v26 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23, v24, v25);
    objc_storeStrong((id *)&v19->_uniqueID, a3);
    objc_storeStrong((id *)&v19->_domainID, a4);
    if (v16)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      [v16 timeIntervalSinceReferenceDate];
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
    objc_storeStrong((id *)&v19->_title, a6);
    objc_storeStrong((id *)&v19->_content, a7);
    objc_storeStrong((id *)&v19->_contentProtection, a8);
    objc_storeStrong((id *)&v19->_personaId, a9);
  }

  return v19;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"domainID", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:4 type:13 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"content" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:6 type:13 subMessageClass:0];
  v11[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:7 type:13 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6120;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"content" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingNotes alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[8] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end