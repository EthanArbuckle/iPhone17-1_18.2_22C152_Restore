@interface BMPersonalizedSensingMomentsContextMomentsContextString
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithTextString:(id)a3 stringIdentifier:(id)a4 dimensions:(id)a5;
- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithTextString:(id)a3 stringIdentifier:(id)a4 dimensions:(id)a5 contentType:(id)a6;
- (BOOL)hasContentType;
- (BOOL)isEqual:(id)a3;
- (NSArray)dimensions;
- (NSString)description;
- (NSString)textString;
- (NSUUID)stringIdentifier;
- (id)_dimensionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)contentType;
- (unsigned)dataVersion;
- (void)setHasContentType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextMomentsContextString

- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithTextString:(id)a3 stringIdentifier:(id)a4 dimensions:(id)a5
{
  return [(BMPersonalizedSensingMomentsContextMomentsContextString *)self initWithTextString:a3 stringIdentifier:a4 dimensions:a5 contentType:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_textString, 0);

  objc_storeStrong((id *)&self->_raw_stringIdentifier, 0);
}

- (void)setHasContentType:(BOOL)a3
{
  self->_hasContentType = a3;
}

- (BOOL)hasContentType
{
  return self->_hasContentType;
}

- (unsigned)contentType
{
  return self->_contentType;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (NSString)textString
{
  return self->_textString;
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
    v6 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self textString];
    uint64_t v7 = [v5 textString];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self textString];
      v10 = [v5 textString];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_20;
      }
    }
    v13 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self stringIdentifier];
    uint64_t v14 = [v5 stringIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self stringIdentifier];
      v17 = [v5 stringIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_20;
      }
    }
    v19 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self dimensions];
    uint64_t v20 = [v5 dimensions];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self dimensions];
      v23 = [v5 dimensions];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_20;
      }
    }
    if (![(BMPersonalizedSensingMomentsContextMomentsContextString *)self hasContentType]
      && ![v5 hasContentType])
    {
      BOOL v12 = 1;
      goto LABEL_21;
    }
    if ([(BMPersonalizedSensingMomentsContextMomentsContextString *)self hasContentType]
      && [v5 hasContentType])
    {
      unsigned int v25 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self contentType];
      BOOL v12 = v25 == [v5 contentType];
LABEL_21:

      goto LABEL_22;
    }
LABEL_20:
    BOOL v12 = 0;
    goto LABEL_21;
  }
  BOOL v12 = 0;
LABEL_22:

  return v12;
}

- (NSUUID)stringIdentifier
{
  raw_stringIdentifier = self->_raw_stringIdentifier;
  if (raw_stringIdentifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_stringIdentifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self textString];
  id v4 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self stringIdentifier];
  id v5 = [v4 UUIDString];

  v6 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self _dimensionsJSONArray];
  if ([(BMPersonalizedSensingMomentsContextMomentsContextString *)self hasContentType])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextString contentType](self, "contentType"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v14[0] = @"textString";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"stringIdentifier";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"dimensions";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"contentType";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v6) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v6)
    {
LABEL_14:
      if (v5) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v5) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v12;
}

- (id)_dimensionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self dimensions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"textString"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        v8 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"textString"];
        v81[0] = v8;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];
        id v28 = (id)[v26 initWithDomain:v27 code:2 userInfo:v9];
        v29 = 0;
        id v7 = 0;
        *a4 = v28;
        goto LABEL_53;
      }
      v29 = 0;
      id v7 = 0;
      goto LABEL_55;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"stringIdentifier"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stringIdentifier"];
        v77 = v9;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v32];

        v29 = 0;
        goto LABEL_53;
      }
      v29 = 0;
      goto LABEL_54;
    }
    id v23 = v8;
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v23];
    if (!v24)
    {
      v8 = v23;
      if (a4)
      {
        id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v45 = v7;
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v78 = *MEMORY[0x1E4F28568];
        v47 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"stringIdentifier"];
        v79 = v47;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        uint64_t v49 = v46;
        id v7 = v45;
        *a4 = (id)[v44 initWithDomain:v49 code:2 userInfo:v48];
      }
      v29 = 0;
      v9 = v8;
      goto LABEL_53;
    }
    unsigned int v25 = (void *)v24;
    v59 = v8;

    v9 = v25;
  }
  else
  {
    v59 = v8;
    v9 = 0;
  }
  id v10 = [v5 objectForKeyedSubscript:@"dimensions"];
  long long v11 = [MEMORY[0x1E4F1CA98] null];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    v55 = v9;
    id v56 = v7;
    v57 = self;
    v58 = v6;

    id v10 = 0;
  }
  else
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v74 = *MEMORY[0x1E4F28568];
          v61 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"dimensions"];
          v75 = v61;
          id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          id v42 = (id)[v40 initWithDomain:v41 code:2 userInfo:v22];
          v29 = 0;
          *a4 = v42;
          goto LABEL_51;
        }
        v29 = 0;
        goto LABEL_52;
      }
    }
    v55 = v9;
    id v56 = v7;
    v57 = self;
    v58 = v6;
  }
  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v10 = v10;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (!v13) {
    goto LABEL_22;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v64;
  id v54 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v64 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = a4;
        if (a4)
        {
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v71 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"dimensions"];
          id v72 = v18;
          v36 = (void *)MEMORY[0x1E4F1C9E8];
          v37 = &v72;
          v38 = &v71;
LABEL_38:
          v39 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:1];
          id *v33 = (id)[v34 initWithDomain:v35 code:2 userInfo:v39];
LABEL_42:

          v29 = 0;
          id v22 = v10;
          id v5 = v54;
          v9 = v55;
          id v7 = v56;
          self = v57;
          goto LABEL_50;
        }
LABEL_45:
        v29 = 0;
        id v22 = v10;
        id v5 = v54;
        v9 = v55;
        self = v57;
        uint64_t v6 = v58;
        id v7 = v56;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = a4;
        if (a4)
        {
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v69 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"dimensions"];
          id v70 = v18;
          v36 = (void *)MEMORY[0x1E4F1C9E8];
          v37 = &v70;
          v38 = &v69;
          goto LABEL_38;
        }
        goto LABEL_45;
      }
      id v18 = v17;
      v19 = [BMPersonalizedSensingMomentsContextDimension alloc];
      id v62 = 0;
      uint64_t v20 = [(BMPersonalizedSensingMomentsContextDimension *)v19 initWithJSONDictionary:v18 error:&v62];
      id v21 = v62;
      if (v21)
      {
        v39 = v21;
        if (a4) {
          *a4 = v21;
        }

        goto LABEL_42;
      }
      [v61 addObject:v20];
    }
    uint64_t v14 = [v10 countByEnumeratingWithState:&v63 objects:v73 count:16];
    id v5 = v54;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_22:

  id v18 = [v5 objectForKeyedSubscript:@"contentType"];
  if (!v18)
  {
    id v22 = 0;
    id v7 = v56;
    self = v57;
    v9 = v55;
    goto LABEL_49;
  }
  objc_opt_class();
  id v7 = v56;
  self = v57;
  v9 = v55;
  if (objc_opt_isKindOfClass())
  {
    id v22 = 0;
    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v18;
LABEL_49:
    self = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self initWithTextString:v7 stringIdentifier:v9 dimensions:v61 contentType:v22];
    v29 = self;
  }
  else
  {
    if (a4)
    {
      id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v50 = *MEMORY[0x1E4F502C8];
      uint64_t v67 = *MEMORY[0x1E4F28568];
      v51 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contentType"];
      v68 = v51;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      *a4 = (id)[v53 initWithDomain:v50 code:2 userInfo:v52];
    }
    id v22 = 0;
    v29 = 0;
  }
LABEL_50:

  uint64_t v6 = v58;
LABEL_51:

LABEL_52:
  v8 = v59;
LABEL_53:

LABEL_54:
LABEL_55:

  return v29;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPersonalizedSensingMomentsContextMomentsContextString *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_textString) {
    PBDataWriterWriteStringField();
  }
  if (self->_raw_stringIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_dimensions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_hasContentType) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextString;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_42;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 40;
          goto LABEL_24;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 16;
LABEL_24:
          id v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_44;
          }
          id v24 = [[BMPersonalizedSensingMomentsContextDimension alloc] initByReadFrom:v4];
          if (!v24) {
            goto LABEL_44;
          }
          unsigned int v25 = v24;
          [v6 addObject:v24];
          PBReaderRecallMark();

          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasContentType = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_44:

          goto LABEL_41;
      }
      while (1)
      {
        uint64_t v29 = *v7;
        uint64_t v30 = *(void *)&v4[v29];
        unint64_t v31 = v30 + 1;
        if (v30 == -1 || v31 > *(void *)&v4[*v8]) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
        *(void *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0) {
          goto LABEL_36;
        }
        v26 += 7;
        BOOL v18 = v27++ >= 9;
        if (v18)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v9] = 1;
LABEL_36:
      if (v4[*v9]) {
        LODWORD(v28) = 0;
      }
LABEL_38:
      v5->_contentType = v28;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v33 = [v6 copy];
  dimensions = v5->_dimensions;
  v5->_dimensions = (NSArray *)v33;

  int v35 = v4[*v9];
  if (v35) {
LABEL_41:
  }
    v36 = 0;
  else {
LABEL_42:
  }
    v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self textString];
  id v5 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self stringIdentifier];
  uint64_t v6 = [(BMPersonalizedSensingMomentsContextMomentsContextString *)self dimensions];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextString contentType](self, "contentType"));
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMPersonalizedSensingMomentsContextMomentsContextString with textString: %@, stringIdentifier: %@, dimensions: %@, contentType: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithTextString:(id)a3 stringIdentifier:(id)a4 dimensions:(id)a5 contentType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextString;
  uint64_t v15 = [(BMEventBase *)&v20 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_textString, a3);
    if (v12)
    {
      uint64_t v16 = [v12 UUIDString];
      raw_stringIdentifier = v15->_raw_stringIdentifier;
      v15->_raw_stringIdentifier = (NSString *)v16;
    }
    else
    {
      raw_stringIdentifier = v15->_raw_stringIdentifier;
      v15->_raw_stringIdentifier = 0;
    }

    objc_storeStrong((id *)&v15->_dimensions, a5);
    if (v14)
    {
      v15->_hasContentType = 1;
      unsigned int v18 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v18 = 0;
      v15->_hasContentType = 0;
    }
    v15->_contentType = v18;
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"textString" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stringIdentifier" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dimensions" number:3 type:14 subMessageClass:objc_opt_class()];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentType" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6D98;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"textString" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stringIdentifier" dataType:6 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"dimensions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_522];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __66__BMPersonalizedSensingMomentsContextMomentsContextString_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _dimensionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
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

    uint64_t v8 = [[BMPersonalizedSensingMomentsContextMomentsContextString alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end