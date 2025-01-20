@interface BMMessagesMediaRendered
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMessagesMediaRendered)initWithAbsoluteTimestamp:(id)a3 mediaAttributes:(id)a4 isOnScreen:(id)a5 isFirstView:(id)a6;
- (BMMessagesMediaRendered)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsFirstView;
- (BOOL)hasIsOnScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstView;
- (BOOL)isOnScreen;
- (NSArray)mediaAttributes;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (id)_mediaAttributesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsFirstView:(BOOL)a3;
- (void)setHasIsOnScreen:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMessagesMediaRendered

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"mediaAttributes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_68974];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isOnScreen" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFirstView" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setHasIsFirstView:(BOOL)a3
{
  self->_hasIsFirstView = a3;
}

- (BOOL)hasIsFirstView
{
  return self->_hasIsFirstView;
}

- (BOOL)isFirstView
{
  return self->_isFirstView;
}

- (void)setHasIsOnScreen:(BOOL)a3
{
  self->_hasIsOnScreen = a3;
}

- (BOOL)hasIsOnScreen
{
  return self->_hasIsOnScreen;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (NSArray)mediaAttributes
{
  return self->_mediaAttributes;
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
    v6 = [(BMMessagesMediaRendered *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMessagesMediaRendered *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMMessagesMediaRendered *)self mediaAttributes];
    uint64_t v14 = [v5 mediaAttributes];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMessagesMediaRendered *)self mediaAttributes];
      v17 = [v5 mediaAttributes];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    if (![(BMMessagesMediaRendered *)self hasIsOnScreen]
      && ![v5 hasIsOnScreen]
      || [(BMMessagesMediaRendered *)self hasIsOnScreen]
      && [v5 hasIsOnScreen]
      && (int v19 = [(BMMessagesMediaRendered *)self isOnScreen],
          v19 == [v5 isOnScreen]))
    {
      if (![(BMMessagesMediaRendered *)self hasIsFirstView]
        && ![v5 hasIsFirstView])
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if ([(BMMessagesMediaRendered *)self hasIsFirstView]
        && [v5 hasIsFirstView])
      {
        BOOL v20 = [(BMMessagesMediaRendered *)self isFirstView];
        int v12 = v20 ^ [v5 isFirstView] ^ 1;
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
  v17[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMessagesMediaRendered *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMMessagesMediaRendered *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMMessagesMediaRendered *)self _mediaAttributesJSONArray];
  if ([(BMMessagesMediaRendered *)self hasIsOnScreen])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesMediaRendered isOnScreen](self, "isOnScreen"));
  }
  else
  {
    v8 = 0;
  }
  if ([(BMMessagesMediaRendered *)self hasIsFirstView])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesMediaRendered isFirstView](self, "isFirstView"));
  }
  else
  {
    v9 = 0;
  }
  v16[0] = @"absoluteTimestamp";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v10;
  v16[1] = @"mediaAttributes";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v11;
  v16[2] = @"isOnScreen";
  int v12 = v8;
  if (!v8)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v12;
  v16[3] = @"isFirstView";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (v9)
  {
    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v8)
    {
LABEL_20:
      if (v7) {
        goto LABEL_21;
      }
LABEL_27:

      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }

  if (!v7) {
    goto LABEL_27;
  }
LABEL_21:
  if (v6) {
    goto LABEL_22;
  }
LABEL_28:

LABEL_22:

  return v14;
}

- (id)_mediaAttributesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMessagesMediaRendered *)self mediaAttributes];
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

- (BMMessagesMediaRendered)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v9 = v6;
      id v10 = [v8 alloc];
      [v9 doubleValue];
      double v12 = v11;

      id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v7 = [v14 dateFromString:v6];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v74 = *MEMORY[0x1E4F28568];
          id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          v75[0] = v15;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
          uint64_t v7 = 0;
          v36 = 0;
          *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);

          goto LABEL_51;
        }
        uint64_t v7 = 0;
        v36 = 0;
        goto LABEL_52;
      }
      id v13 = v6;
    }
    uint64_t v7 = v13;
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_9:
  id v15 = [v5 objectForKeyedSubscript:@"mediaAttributes"];
  uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  int v17 = [v15 isEqual:v16];

  v55 = v6;
  if (v17)
  {
    v50 = v7;
    v52 = self;

    id v15 = 0;
LABEL_14:
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v15 = v15;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (!v18) {
      goto LABEL_24;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v60;
    id v49 = v5;
LABEL_16:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v60 != v20) {
        objc_enumerationMutation(v15);
      }
      v22 = *(void **)(*((void *)&v59 + 1) + 8 * v21);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = a4;
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v67 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"mediaAttributes"];
          id v68 = v23;
          v31 = (void *)MEMORY[0x1E4F1C9E8];
          v32 = &v68;
          v33 = &v67;
          goto LABEL_31;
        }
        goto LABEL_38;
      }
      id v23 = v22;
      v24 = [BMMessagesMediaRenderedMediaAttributes alloc];
      id v58 = 0;
      v25 = [(BMMessagesMediaRenderedMediaAttributes *)v24 initWithJSONDictionary:v23 error:&v58];
      id v26 = v58;
      if (v26)
      {
        id v34 = v26;
        if (a4) {
          *a4 = v26;
        }

        v36 = 0;
        goto LABEL_35;
      }
      [v56 addObject:v25];

      if (v19 == ++v21)
      {
        uint64_t v19 = [v15 countByEnumeratingWithState:&v59 objects:v71 count:16];
        id v5 = v49;
        if (v19) {
          goto LABEL_16;
        }
LABEL_24:

        id v23 = [v5 objectForKeyedSubscript:@"isOnScreen"];
        if (!v23)
        {
          id v27 = 0;
          uint64_t v7 = v50;
          self = v52;
          goto LABEL_42;
        }
        objc_opt_class();
        uint64_t v7 = v50;
        self = v52;
        if (objc_opt_isKindOfClass())
        {
          id v27 = 0;
LABEL_42:
          v40 = [v5 objectForKeyedSubscript:@"isFirstView"];
          if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v34 = 0;
            goto LABEL_45;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v34 = v40;
LABEL_45:
            self = [(BMMessagesMediaRendered *)self initWithAbsoluteTimestamp:v7 mediaAttributes:v56 isOnScreen:v27 isFirstView:v34];
            v36 = self;
          }
          else
          {
            if (a4)
            {
              id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v51 = *MEMORY[0x1E4F502C8];
              uint64_t v63 = *MEMORY[0x1E4F28568];
              v44 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFirstView"];
              v64 = v44;
              v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
              *a4 = (id)[v53 initWithDomain:v51 code:2 userInfo:v45];
            }
            id v34 = 0;
            v36 = 0;
          }
LABEL_46:

LABEL_47:
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v27 = v23;
            goto LABEL_42;
          }
          if (a4)
          {
            id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v42 = *MEMORY[0x1E4F502C8];
            uint64_t v65 = *MEMORY[0x1E4F28568];
            id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isOnScreen"];
            id v66 = v34;
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
            id v43 = (id)[v48 initWithDomain:v42 code:2 userInfo:v40];
            v36 = 0;
            id v27 = 0;
            *a4 = v43;
            goto LABEL_46;
          }
          id v27 = 0;
          v36 = 0;
        }

LABEL_49:
        uint64_t v6 = v55;

        goto LABEL_51;
      }
    }
    v28 = a4;
    if (a4)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"mediaAttributes"];
      id v70 = v23;
      v31 = (void *)MEMORY[0x1E4F1C9E8];
      v32 = &v70;
      v33 = &v69;
LABEL_31:
      id v34 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:1];
      id v35 = (id)[v29 initWithDomain:v30 code:2 userInfo:v34];
      v36 = 0;
      id *v28 = v35;
LABEL_35:
      id v27 = v15;
      id v5 = v49;
      uint64_t v7 = v50;
      self = v52;
      goto LABEL_47;
    }
LABEL_38:
    v36 = 0;
    id v27 = v15;
    id v5 = v49;
    uint64_t v7 = v50;
    self = v52;
    goto LABEL_49;
  }
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v50 = v7;
    v52 = self;
    goto LABEL_14;
  }
  if (a4)
  {
    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v38 = *MEMORY[0x1E4F502C8];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v56 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"mediaAttributes"];
    v73 = v56;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v39 = (id)[v37 initWithDomain:v38 code:2 userInfo:v27];
    v36 = 0;
    *a4 = v39;
    goto LABEL_49;
  }
  v36 = 0;
LABEL_51:

LABEL_52:
  return v36;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMessagesMediaRendered *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_mediaAttributes;
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

  if (self->_hasIsOnScreen) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFirstView) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMMessagesMediaRendered;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_56;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
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
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v21 = *v7;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
          {
            double v23 = *(double *)(*(void *)&v4[*v10] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v23 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v23;
          continue;
        case 2u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_58;
          }
          id v24 = [[BMMessagesMediaRenderedMediaAttributes alloc] initByReadFrom:v4];
          if (!v24) {
            goto LABEL_58;
          }
          v25 = v24;
          [v6 addObject:v24];
          PBReaderRecallMark();

          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasIsOnScreen = 1;
          while (2)
          {
            uint64_t v29 = *v7;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v18 = v27++ >= 9;
                if (v18)
                {
                  uint64_t v28 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v28 = 0;
          }
LABEL_45:
          BOOL v40 = v28 != 0;
          uint64_t v41 = 32;
          goto LABEL_50;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsFirstView = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_58:

          goto LABEL_55;
      }
      while (1)
      {
        uint64_t v36 = *v7;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v8]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_47;
        }
        v33 += 7;
        BOOL v18 = v34++ >= 9;
        if (v18)
        {
          uint64_t v35 = 0;
          goto LABEL_49;
        }
      }
      v4[*v9] = 1;
LABEL_47:
      if (v4[*v9]) {
        uint64_t v35 = 0;
      }
LABEL_49:
      BOOL v40 = v35 != 0;
      uint64_t v41 = 34;
LABEL_50:
      *((unsigned char *)&v5->super.super.isa + v41) = v40;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v42 = [v6 copy];
  mediaAttributes = v5->_mediaAttributes;
  v5->_mediaAttributes = (NSArray *)v42;

  int v44 = v4[*v9];
  if (v44) {
LABEL_55:
  }
    v45 = 0;
  else {
LABEL_56:
  }
    v45 = v5;

  return v45;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMessagesMediaRendered *)self absoluteTimestamp];
  id v5 = [(BMMessagesMediaRendered *)self mediaAttributes];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesMediaRendered isOnScreen](self, "isOnScreen"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesMediaRendered isFirstView](self, "isFirstView"));
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMMessagesMediaRendered with absoluteTimestamp: %@, mediaAttributes: %@, isOnScreen: %@, isFirstView: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMMessagesMediaRendered)initWithAbsoluteTimestamp:(id)a3 mediaAttributes:(id)a4 isOnScreen:(id)a5 isFirstView:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMMessagesMediaRendered;
  uint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasRaw_absoluteTimestamp = 1;
      [v10 timeIntervalSinceReferenceDate];
    }
    else
    {
      v14->_hasRaw_absoluteTimestamp = 0;
      double v15 = -1.0;
    }
    v14->_raw_absoluteTimestamp = v15;
    objc_storeStrong((id *)&v14->_mediaAttributes, a4);
    if (v12)
    {
      v14->_hasIsOnScreen = 1;
      v14->_isOnScreen = [v12 BOOLValue];
    }
    else
    {
      v14->_hasIsOnScreen = 0;
      v14->_isOnScreen = 0;
    }
    if (v13)
    {
      v14->_hasIsFirstView = 1;
      v14->_isFirstView = [v13 BOOLValue];
    }
    else
    {
      v14->_hasIsFirstView = 0;
      v14->_isFirstView = 0;
    }
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaAttributes" number:2 type:14 subMessageClass:objc_opt_class()];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isOnScreen" number:3 type:12 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFirstView" number:4 type:12 subMessageClass:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6720;
}

id __34__BMMessagesMediaRendered_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _mediaAttributesJSONArray];
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

    uint64_t v8 = [[BMMessagesMediaRendered alloc] initByReadFrom:v7];
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