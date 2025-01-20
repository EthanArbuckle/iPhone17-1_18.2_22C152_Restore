@interface BMTextUnderstandingPoemBufferExtraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextUnderstandingPoemBufferExtraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextUnderstandingPoemBufferExtraction)initWithType:(int)a3 text:(id)a4 identifier:(id)a5 confidenceScore:(id)a6 contactIdentifier:(id)a7 role:(int)a8 isCoref:(id)a9;
- (BOOL)hasConfidenceScore;
- (BOOL)hasIsCoref;
- (BOOL)isCoref;
- (BOOL)isEqual:(id)a3;
- (NSString)contactIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)text;
- (double)confidenceScore;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)role;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasIsCoref:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMTextUnderstandingPoemBufferExtraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setHasIsCoref:(BOOL)a3
{
  self->_hasIsCoref = a3;
}

- (BOOL)hasIsCoref
{
  return self->_hasIsCoref;
}

- (BOOL)isCoref
{
  return self->_isCoref;
}

- (int)role
{
  return self->_role;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  self->_hasConfidenceScore = a3;
}

- (BOOL)hasConfidenceScore
{
  return self->_hasConfidenceScore;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)text
{
  return self->_text;
}

- (int)type
{
  return self->_type;
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
    int v6 = [(BMTextUnderstandingPoemBufferExtraction *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMTextUnderstandingPoemBufferExtraction *)self text];
      uint64_t v8 = [v5 text];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMTextUnderstandingPoemBufferExtraction *)self text];
        v11 = [v5 text];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_27;
        }
      }
      v14 = [(BMTextUnderstandingPoemBufferExtraction *)self identifier];
      uint64_t v15 = [v5 identifier];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMTextUnderstandingPoemBufferExtraction *)self identifier];
        v18 = [v5 identifier];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_27;
        }
      }
      if ([(BMTextUnderstandingPoemBufferExtraction *)self hasConfidenceScore]
        || [v5 hasConfidenceScore])
      {
        if (![(BMTextUnderstandingPoemBufferExtraction *)self hasConfidenceScore]) {
          goto LABEL_27;
        }
        if (![v5 hasConfidenceScore]) {
          goto LABEL_27;
        }
        [(BMTextUnderstandingPoemBufferExtraction *)self confidenceScore];
        double v21 = v20;
        [v5 confidenceScore];
        if (v21 != v22) {
          goto LABEL_27;
        }
      }
      v23 = [(BMTextUnderstandingPoemBufferExtraction *)self contactIdentifier];
      uint64_t v24 = [v5 contactIdentifier];
      if (v23 == (void *)v24)
      {
      }
      else
      {
        v25 = (void *)v24;
        v26 = [(BMTextUnderstandingPoemBufferExtraction *)self contactIdentifier];
        v27 = [v5 contactIdentifier];
        int v28 = [v26 isEqual:v27];

        if (!v28) {
          goto LABEL_27;
        }
      }
      int v29 = [(BMTextUnderstandingPoemBufferExtraction *)self role];
      if (v29 == [v5 role])
      {
        if (![(BMTextUnderstandingPoemBufferExtraction *)self hasIsCoref]
          && ![v5 hasIsCoref])
        {
          LOBYTE(v13) = 1;
          goto LABEL_28;
        }
        if ([(BMTextUnderstandingPoemBufferExtraction *)self hasIsCoref]
          && [v5 hasIsCoref])
        {
          BOOL v30 = [(BMTextUnderstandingPoemBufferExtraction *)self isCoref];
          int v13 = v30 ^ [v5 isCoref] ^ 1;
LABEL_28:

          goto LABEL_29;
        }
      }
    }
LABEL_27:
    LOBYTE(v13) = 0;
    goto LABEL_28;
  }
  LOBYTE(v13) = 0;
LABEL_29:

  return v13;
}

- (id)jsonDictionary
{
  v25[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMTextUnderstandingPoemBufferExtraction type](self, "type"));
  id v4 = [(BMTextUnderstandingPoemBufferExtraction *)self text];
  double v22 = [(BMTextUnderstandingPoemBufferExtraction *)self identifier];
  if (![(BMTextUnderstandingPoemBufferExtraction *)self hasConfidenceScore]
    || ([(BMTextUnderstandingPoemBufferExtraction *)self confidenceScore], fabs(v5) == INFINITY))
  {
    v23 = 0;
  }
  else
  {
    [(BMTextUnderstandingPoemBufferExtraction *)self confidenceScore];
    int v6 = NSNumber;
    [(BMTextUnderstandingPoemBufferExtraction *)self confidenceScore];
    v23 = objc_msgSend(v6, "numberWithDouble:");
  }
  v7 = [(BMTextUnderstandingPoemBufferExtraction *)self contactIdentifier];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMTextUnderstandingPoemBufferExtraction role](self, "role"));
  if ([(BMTextUnderstandingPoemBufferExtraction *)self hasIsCoref])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemBufferExtraction isCoref](self, "isCoref"));
  }
  else
  {
    v9 = 0;
  }
  v24[0] = @"type";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  double v20 = (void *)v10;
  v25[0] = v10;
  v24[1] = @"text";
  uint64_t v11 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  int v19 = (void *)v11;
  v25[1] = v11;
  v24[2] = @"identifier";
  int v12 = v22;
  if (!v22)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v12;
  v24[3] = @"confidenceScore";
  int v13 = v23;
  if (!v23)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  double v21 = (void *)v3;
  v25[3] = v13;
  v24[4] = @"contactIdentifier";
  v14 = v7;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v14;
  v24[5] = @"role";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v15;
  v24[6] = @"isCoref";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (v9)
  {
    if (v8) {
      goto LABEL_24;
    }
LABEL_34:

    if (v7) {
      goto LABEL_25;
    }
    goto LABEL_35;
  }

  if (!v8) {
    goto LABEL_34;
  }
LABEL_24:
  if (v7) {
    goto LABEL_25;
  }
LABEL_35:

LABEL_25:
  if (!v23) {

  }
  if (v22)
  {
    if (v4) {
      goto LABEL_29;
    }
LABEL_37:

    if (v21) {
      goto LABEL_30;
    }
    goto LABEL_38;
  }

  if (!v4) {
    goto LABEL_37;
  }
LABEL_29:
  if (v21) {
    goto LABEL_30;
  }
LABEL_38:

LABEL_30:

  return v17;
}

- (BMTextUnderstandingPoemBufferExtraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    uint64_t v10 = [v6 objectForKeyedSubscript:@"text"];
    v53 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          double v22 = 0;
          goto LABEL_56;
        }
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        id v58 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"text"];
        id v70 = v58;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        int v12 = v20 = a4;
        id v21 = (id)[v57 initWithDomain:v19 code:2 userInfo:v12];
        id v11 = 0;
        double v22 = 0;
        *double v20 = v21;
        goto LABEL_55;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"identifier"];
    v51 = v10;
    v52 = v7;
    id v56 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          id v58 = 0;
          double v22 = 0;
          goto LABEL_55;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v55 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        id v68 = v55;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        v25 = v23;
        uint64_t v10 = v51;
        uint64_t v26 = v24;
        id v11 = v56;
        id v58 = 0;
        double v22 = 0;
        id *v53 = (id)[v25 initWithDomain:v26 code:2 userInfo:v13];
LABEL_54:

        v7 = v52;
LABEL_55:

        goto LABEL_56;
      }
      id v58 = v12;
    }
    else
    {
      id v58 = 0;
    }
    int v13 = [v6 objectForKeyedSubscript:@"confidenceScore"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          id v55 = 0;
          double v22 = 0;
          goto LABEL_54;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidenceScore"];
        id v66 = v54;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        int v29 = v27;
        uint64_t v10 = v51;
        id v30 = (id)[v29 initWithDomain:v28 code:2 userInfo:v14];
        id v55 = 0;
        double v22 = 0;
        id *v53 = v30;
        goto LABEL_53;
      }
      id v55 = v13;
    }
    else
    {
      id v55 = 0;
    }
    v14 = [v6 objectForKeyedSubscript:@"contactIdentifier"];
    v50 = v8;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          id v54 = 0;
          double v22 = 0;
          goto LABEL_53;
        }
        v16 = self;
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactIdentifier"];
        v64 = v17;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        id v33 = (id)[v31 initWithDomain:v32 code:2 userInfo:v15];
        id v54 = 0;
        double v22 = 0;
        id *v53 = v33;
LABEL_52:

        self = v16;
        uint64_t v8 = v50;
        uint64_t v10 = v51;
LABEL_53:

        id v11 = v56;
        goto LABEL_54;
      }
      id v54 = v14;
    }
    else
    {
      id v54 = 0;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"role"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v16 = self;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v17 = 0;
            double v22 = 0;
            goto LABEL_52;
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v45 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          id v41 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"role"];
          id v62 = v41;
          v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v46 = (id)[v49 initWithDomain:v45 code:2 userInfo:v40];
          v17 = 0;
          double v22 = 0;
          id *v53 = v46;
          goto LABEL_51;
        }
        id v18 = [NSNumber numberWithInt:BMTextUnderstandingPoemBufferExtractionRoleTypeFromString(v15)];
      }
      v17 = v18;
    }
    else
    {
      v16 = self;
      v17 = 0;
    }
    v40 = [v6 objectForKeyedSubscript:@"isCoref"];
    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v53)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v59 = *MEMORY[0x1E4F28568];
          v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isCoref"];
          v60 = v43;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          id *v53 = (id)[v48 initWithDomain:v47 code:2 userInfo:v44];
        }
        id v41 = 0;
        double v22 = 0;
        goto LABEL_51;
      }
      id v41 = v40;
    }
    else
    {
      id v41 = 0;
    }
    double v22 = -[BMTextUnderstandingPoemBufferExtraction initWithType:text:identifier:confidenceScore:contactIdentifier:role:isCoref:](v16, "initWithType:text:identifier:confidenceScore:contactIdentifier:role:isCoref:", [v50 intValue], v56, v58, v55, v54, objc_msgSend(v17, "intValue"), v41);
    v16 = v22;
LABEL_51:

    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMTextUnderstandingPoemBufferExtractionExtractionTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    double v22 = 0;
    goto LABEL_57;
  }
  id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v35 = *MEMORY[0x1E4F502C8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  uint64_t v36 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
  v72[0] = v36;
  uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
  v38 = v34;
  uint64_t v10 = (void *)v37;
  uint64_t v39 = v35;
  id v11 = (id)v36;
  uint64_t v8 = 0;
  double v22 = 0;
  *a4 = (id)[v38 initWithDomain:v39 code:2 userInfo:v37];
LABEL_56:

LABEL_57:
  return v22;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMTextUnderstandingPoemBufferExtraction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_text) {
    PBDataWriterWriteStringField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasConfidenceScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_contactIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIsCoref) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMTextUnderstandingPoemBufferExtraction;
  double v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_72;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
              goto LABEL_51;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_53:
          if (v22 >= 5) {
            LODWORD(v22) = 0;
          }
          uint64_t v46 = 24;
          goto LABEL_62;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 32;
          goto LABEL_35;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 40;
          goto LABEL_35;
        case 4u:
          v5->_hasConfidenceScore = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(double *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0.0;
          }
          v5->_confidenceScore = v31;
          continue;
        case 5u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
LABEL_35:
          uint64_t v32 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_59:
          if (v22 >= 4) {
            LODWORD(v22) = 0;
          }
          uint64_t v46 = 28;
LABEL_62:
          *(_DWORD *)((char *)&v5->super.super.isa + v46) = v22;
          continue;
        case 7u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          v5->_hasIsCoref = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_71;
          }
          continue;
      }
      while (1)
      {
        uint64_t v42 = *v6;
        uint64_t v43 = *(void *)&v4[v42];
        unint64_t v44 = v43 + 1;
        if (v43 == -1 || v44 > *(void *)&v4[*v7]) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
        *(void *)&v4[v42] = v44;
        v41 |= (unint64_t)(v45 & 0x7F) << v39;
        if ((v45 & 0x80) == 0) {
          goto LABEL_64;
        }
        v39 += 7;
        BOOL v17 = v40++ >= 9;
        if (v17)
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
      v5->_isCoref = v41 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_71:
  }
    uint64_t v47 = 0;
  else {
LABEL_72:
  }
    uint64_t v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMTextUnderstandingPoemBufferExtractionExtractionTypeAsString([(BMTextUnderstandingPoemBufferExtraction *)self type]);
  double v5 = [(BMTextUnderstandingPoemBufferExtraction *)self text];
  id v6 = [(BMTextUnderstandingPoemBufferExtraction *)self identifier];
  v7 = NSNumber;
  [(BMTextUnderstandingPoemBufferExtraction *)self confidenceScore];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  id v9 = [(BMTextUnderstandingPoemBufferExtraction *)self contactIdentifier];
  char v10 = BMTextUnderstandingPoemBufferExtractionRoleTypeAsString([(BMTextUnderstandingPoemBufferExtraction *)self role]);
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemBufferExtraction isCoref](self, "isCoref"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMTextUnderstandingPoemBufferExtraction with type: %@, text: %@, identifier: %@, confidenceScore: %@, contactIdentifier: %@, role: %@, isCoref: %@", v4, v5, v6, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMTextUnderstandingPoemBufferExtraction)initWithType:(int)a3 text:(id)a4 identifier:(id)a5 confidenceScore:(id)a6 contactIdentifier:(id)a7 role:(int)a8 isCoref:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)BMTextUnderstandingPoemBufferExtraction;
  char v20 = [(BMEventBase *)&v24 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v20->_type = a3;
    objc_storeStrong((id *)&v20->_text, a4);
    objc_storeStrong((id *)&v20->_identifier, a5);
    if (v17)
    {
      v20->_hasConfidenceScore = 1;
      [v17 doubleValue];
    }
    else
    {
      v20->_hasConfidenceScore = 0;
      double v21 = -1.0;
    }
    v20->_confidenceScore = v21;
    objc_storeStrong((id *)&v20->_contactIdentifier, a7);
    v20->_role = a8;
    if (v19)
    {
      v20->_hasIsCoref = 1;
      v20->_isCoref = [v19 BOOLValue];
    }
    else
    {
      v20->_hasIsCoref = 0;
      v20->_isCoref = 0;
    }
  }

  return v20;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"text", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidenceScore" number:4 type:0 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactIdentifier" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"role" number:6 type:4 subMessageClass:0];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCoref" number:7 type:12 subMessageClass:0];
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4698;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"text" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidenceScore" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactIdentifier" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"role" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCoref" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    double v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMTextUnderstandingPoemBufferExtraction alloc] initByReadFrom:v7];
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