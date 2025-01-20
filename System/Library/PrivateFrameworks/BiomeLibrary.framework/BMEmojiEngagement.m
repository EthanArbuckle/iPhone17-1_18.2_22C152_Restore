@interface BMEmojiEngagement
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMEmojiEngagement)initWithEmoji:(id)a3 wasPositiveEngagement:(id)a4 localeIdentifier:(id)a5 inputMode:(int)a6 replacementContext:(id)a7 resultPosition:(id)a8 numberSearchQueriesRun:(id)a9 finalSearchQuery:(id)a10;
- (BMEmojiEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasNumberSearchQueriesRun;
- (BOOL)hasResultPosition;
- (BOOL)hasWasPositiveEngagement;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasPositiveEngagement;
- (NSString)description;
- (NSString)emoji;
- (NSString)finalSearchQuery;
- (NSString)localeIdentifier;
- (NSString)replacementContext;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)inputMode;
- (int)numberSearchQueriesRun;
- (int)resultPosition;
- (unsigned)dataVersion;
- (void)setHasNumberSearchQueriesRun:(BOOL)a3;
- (void)setHasResultPosition:(BOOL)a3;
- (void)setHasWasPositiveEngagement:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMEmojiEngagement

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"emoji" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wasPositiveEngagement" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"localeIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inputMode" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"replacementContext" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resultPosition" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberSearchQueriesRun" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"finalSearchQuery" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalSearchQuery, 0);
  objc_storeStrong((id *)&self->_replacementContext, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);

  objc_storeStrong((id *)&self->_emoji, 0);
}

- (NSString)finalSearchQuery
{
  return self->_finalSearchQuery;
}

- (void)setHasNumberSearchQueriesRun:(BOOL)a3
{
  self->_hasNumberSearchQueriesRun = a3;
}

- (BOOL)hasNumberSearchQueriesRun
{
  return self->_hasNumberSearchQueriesRun;
}

- (int)numberSearchQueriesRun
{
  return self->_numberSearchQueriesRun;
}

- (void)setHasResultPosition:(BOOL)a3
{
  self->_hasResultPosition = a3;
}

- (BOOL)hasResultPosition
{
  return self->_hasResultPosition;
}

- (int)resultPosition
{
  return self->_resultPosition;
}

- (NSString)replacementContext
{
  return self->_replacementContext;
}

- (int)inputMode
{
  return self->_inputMode;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setHasWasPositiveEngagement:(BOOL)a3
{
  self->_hasWasPositiveEngagement = a3;
}

- (BOOL)hasWasPositiveEngagement
{
  return self->_hasWasPositiveEngagement;
}

- (BOOL)wasPositiveEngagement
{
  return self->_wasPositiveEngagement;
}

- (NSString)emoji
{
  return self->_emoji;
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
    v6 = [(BMEmojiEngagement *)self emoji];
    uint64_t v7 = [v5 emoji];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMEmojiEngagement *)self emoji];
      v10 = [v5 emoji];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    if ([(BMEmojiEngagement *)self hasWasPositiveEngagement]
      || [v5 hasWasPositiveEngagement])
    {
      if (![(BMEmojiEngagement *)self hasWasPositiveEngagement]) {
        goto LABEL_33;
      }
      if (![v5 hasWasPositiveEngagement]) {
        goto LABEL_33;
      }
      int v13 = [(BMEmojiEngagement *)self wasPositiveEngagement];
      if (v13 != [v5 wasPositiveEngagement]) {
        goto LABEL_33;
      }
    }
    v14 = [(BMEmojiEngagement *)self localeIdentifier];
    uint64_t v15 = [v5 localeIdentifier];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMEmojiEngagement *)self localeIdentifier];
      v18 = [v5 localeIdentifier];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_33;
      }
    }
    int v20 = [(BMEmojiEngagement *)self inputMode];
    if (v20 == [v5 inputMode])
    {
      v21 = [(BMEmojiEngagement *)self replacementContext];
      uint64_t v22 = [v5 replacementContext];
      if (v21 == (void *)v22)
      {
      }
      else
      {
        v23 = (void *)v22;
        v24 = [(BMEmojiEngagement *)self replacementContext];
        v25 = [v5 replacementContext];
        int v26 = [v24 isEqual:v25];

        if (!v26) {
          goto LABEL_33;
        }
      }
      if (![(BMEmojiEngagement *)self hasResultPosition]
        && ![v5 hasResultPosition]
        || [(BMEmojiEngagement *)self hasResultPosition]
        && [v5 hasResultPosition]
        && (int v27 = [(BMEmojiEngagement *)self resultPosition],
            v27 == [v5 resultPosition]))
      {
        if (![(BMEmojiEngagement *)self hasNumberSearchQueriesRun]
          && ![v5 hasNumberSearchQueriesRun]
          || [(BMEmojiEngagement *)self hasNumberSearchQueriesRun]
          && [v5 hasNumberSearchQueriesRun]
          && (int v28 = [(BMEmojiEngagement *)self numberSearchQueriesRun],
              v28 == [v5 numberSearchQueriesRun]))
        {
          v29 = [(BMEmojiEngagement *)self finalSearchQuery];
          v30 = [v5 finalSearchQuery];
          if (v29 == v30)
          {
            char v12 = 1;
          }
          else
          {
            v31 = [(BMEmojiEngagement *)self finalSearchQuery];
            v32 = [v5 finalSearchQuery];
            char v12 = [v31 isEqual:v32];
          }
          goto LABEL_34;
        }
      }
    }
LABEL_33:
    char v12 = 0;
LABEL_34:

    goto LABEL_35;
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (id)jsonDictionary
{
  v28[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMEmojiEngagement *)self emoji];
  if ([(BMEmojiEngagement *)self hasWasPositiveEngagement])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMEmojiEngagement wasPositiveEngagement](self, "wasPositiveEngagement"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(BMEmojiEngagement *)self localeIdentifier];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMEmojiEngagement inputMode](self, "inputMode"));
  int v26 = [(BMEmojiEngagement *)self replacementContext];
  if ([(BMEmojiEngagement *)self hasResultPosition])
  {
    v25 = objc_msgSend(NSNumber, "numberWithInt:", -[BMEmojiEngagement resultPosition](self, "resultPosition"));
  }
  else
  {
    v25 = 0;
  }
  if ([(BMEmojiEngagement *)self hasNumberSearchQueriesRun])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMEmojiEngagement numberSearchQueriesRun](self, "numberSearchQueriesRun"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [(BMEmojiEngagement *)self finalSearchQuery];
  v27[0] = @"emoji";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = (void *)v9;
  v28[0] = v9;
  v27[1] = @"wasPositiveEngagement";
  uint64_t v10 = v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v10;
  v28[1] = v10;
  v27[2] = @"localeIdentifier";
  uint64_t v11 = v5;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  int v20 = (void *)v11;
  v28[2] = v11;
  v27[3] = @"inputMode";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v4;
  v28[3] = v12;
  v27[4] = @"replacementContext";
  int v13 = v26;
  if (!v26)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v14 = (void *)v5;
  v28[4] = v13;
  v27[5] = @"resultPosition";
  uint64_t v15 = v25;
  if (!v25)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v15;
  v27[6] = @"numberSearchQueriesRun";
  v16 = v7;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v16;
  v27[7] = @"finalSearchQuery";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (v8)
  {
    if (v7) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v7) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (!v25) {

  }
  if (!v26) {
  if (!v6)
  }

  if (v14)
  {
    if (v23) {
      goto LABEL_36;
    }
LABEL_43:

    if (v24) {
      goto LABEL_37;
    }
    goto LABEL_44;
  }

  if (!v23) {
    goto LABEL_43;
  }
LABEL_36:
  if (v24) {
    goto LABEL_37;
  }
LABEL_44:

LABEL_37:

  return v18;
}

- (BMEmojiEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"emoji"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"wasPositiveEngagement"];
    v65 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          int v19 = 0;
          goto LABEL_51;
        }
        v57 = self;
        int v20 = a4;
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"wasPositiveEngagement"];
        v84 = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        v25 = v21;
        uint64_t v11 = (void *)v24;
        id v26 = (id)[v25 initWithDomain:v22 code:2 userInfo:v24];
        id v10 = 0;
        int v19 = 0;
        *int v20 = v26;
        goto LABEL_75;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"localeIdentifier"];
    v64 = v9;
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v68 = 0;
LABEL_10:
      char v12 = [v6 objectForKeyedSubscript:@"inputMode"];
      v62 = v11;
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v58 = self;
            if (!v65)
            {
              v70 = 0;
              int v19 = 0;
              goto LABEL_48;
            }
            id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v53 = v10;
            uint64_t v54 = *MEMORY[0x1E4F502C8];
            uint64_t v79 = *MEMORY[0x1E4F28568];
            id v66 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"inputMode"];
            id v80 = v66;
            v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            uint64_t v55 = v54;
            id v10 = v53;
            v70 = 0;
            int v19 = 0;
            id *v65 = (id)[v52 initWithDomain:v55 code:2 userInfo:v30];
            uint64_t v11 = v62;
            goto LABEL_77;
          }
          id v13 = [NSNumber numberWithInt:BMEmojiEngagementInputModeFromString(v12)];
        }
        v70 = v13;
      }
      else
      {
        v70 = 0;
      }
      v30 = [v6 objectForKeyedSubscript:@"replacementContext"];
      id v67 = v8;
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v66 = 0;
LABEL_33:
        v31 = [v6 objectForKeyedSubscript:@"resultPosition"];
        v60 = v7;
        id v61 = v10;
        if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v65)
            {
              id v63 = 0;
              int v19 = 0;
              goto LABEL_45;
            }
            v33 = self;
            id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v44 = *MEMORY[0x1E4F502C8];
            uint64_t v75 = *MEMORY[0x1E4F28568];
            id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"resultPosition"];
            id v76 = v34;
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
            v45 = v43;
            uint64_t v7 = v60;
            id v46 = (id)[v45 initWithDomain:v44 code:2 userInfo:v32];
            int v19 = 0;
            id v63 = 0;
            id *v65 = v46;
LABEL_44:

            self = v33;
            id v8 = v67;
            id v10 = v61;
LABEL_45:
            uint64_t v11 = v62;
LABEL_46:

LABEL_47:
LABEL_48:
            v23 = v68;
            goto LABEL_49;
          }
          id v63 = v31;
        }
        else
        {
          id v63 = 0;
        }
        v32 = [v6 objectForKeyedSubscript:@"numberSearchQueriesRun"];
        if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          v33 = self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v65)
            {
              id v34 = 0;
              int v19 = 0;
              goto LABEL_44;
            }
            id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v48 = *MEMORY[0x1E4F502C8];
            uint64_t v73 = *MEMORY[0x1E4F28568];
            id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberSearchQueriesRun"];
            id v74 = v36;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            id v49 = (id)[v47 initWithDomain:v48 code:2 userInfo:v35];
            int v19 = 0;
            id v34 = 0;
            id *v65 = v49;
            goto LABEL_43;
          }
          id v34 = v32;
        }
        else
        {
          v33 = self;
          id v34 = 0;
        }
        v35 = [v6 objectForKeyedSubscript:@"finalSearchQuery"];
        if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v65)
            {
              id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v56 = *MEMORY[0x1E4F502C8];
              uint64_t v71 = *MEMORY[0x1E4F28568];
              v50 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"finalSearchQuery"];
              v72 = v50;
              v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
              id *v65 = (id)[v59 initWithDomain:v56 code:2 userInfo:v51];
            }
            id v36 = 0;
            int v19 = 0;
            goto LABEL_43;
          }
          id v36 = v35;
        }
        else
        {
          id v36 = 0;
        }
        int v19 = -[BMEmojiEngagement initWithEmoji:wasPositiveEngagement:localeIdentifier:inputMode:replacementContext:resultPosition:numberSearchQueriesRun:finalSearchQuery:](v33, "initWithEmoji:wasPositiveEngagement:localeIdentifier:inputMode:replacementContext:resultPosition:numberSearchQueriesRun:finalSearchQuery:", v67, v61, v68, [v70 intValue], v66, v63, v34, v36);
        v33 = v19;
LABEL_43:

        uint64_t v7 = v60;
        goto LABEL_44;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v66 = v30;
        goto LABEL_33;
      }
      v58 = self;
      if (v65)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v39 = v10;
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v77 = *MEMORY[0x1E4F28568];
        id v63 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"replacementContext"];
        id v78 = v63;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        v41 = v38;
        uint64_t v11 = v62;
        uint64_t v42 = v40;
        id v10 = v39;
        int v19 = 0;
        id v66 = 0;
        id *v65 = (id)[v41 initWithDomain:v42 code:2 userInfo:v31];
        goto LABEL_46;
      }
      id v66 = 0;
      int v19 = 0;
LABEL_77:
      self = v58;
      goto LABEL_47;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v68 = v11;
      goto LABEL_10;
    }
    v57 = self;
    if (v65)
    {
      id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v27 = v10;
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      v70 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"localeIdentifier"];
      v82 = v70;
      char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      uint64_t v29 = v28;
      id v10 = v27;
      v23 = 0;
      int v19 = 0;
      id *v65 = (id)[v69 initWithDomain:v29 code:2 userInfo:v12];
LABEL_49:

      uint64_t v9 = v64;
LABEL_50:

      goto LABEL_51;
    }
    v23 = 0;
    int v19 = 0;
LABEL_75:
    self = v57;
    goto LABEL_50;
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
    int v19 = 0;
    goto LABEL_52;
  }
  v14 = a4;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v85 = *MEMORY[0x1E4F28568];
  uint64_t v17 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"emoji"];
  v86[0] = v17;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
  uint64_t v18 = v16;
  id v10 = (id)v17;
  id v8 = 0;
  int v19 = 0;
  id *v14 = (id)[v15 initWithDomain:v18 code:2 userInfo:v9];
LABEL_51:

LABEL_52:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMEmojiEngagement *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_emoji) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasWasPositiveEngagement) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_localeIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_replacementContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasResultPosition) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v4 = v5;
  if (self->_hasNumberSearchQueriesRun)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v4 = v5;
  }
  if (self->_finalSearchQuery)
  {
    PBDataWriterWriteStringField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMEmojiEngagement;
  id v5 = [(BMEventBase *)&v48 init];
  if (!v5) {
    goto LABEL_77;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_54;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasWasPositiveEngagement = 1;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  uint64_t v23 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v23 = 0;
          }
LABEL_58:
          v5->_wasPositiveEngagement = v23 != 0;
          continue;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_54;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (2)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v29) = 0;
          }
LABEL_62:
          if (v29 >= 0xB) {
            LODWORD(v29) = 0;
          }
          v5->_inputMode = v29;
          continue;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_54;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasResultPosition = 1;
          while (2)
          {
            uint64_t v36 = *v6;
            unint64_t v37 = *(void *)&v4[v36];
            if (v37 == -1 || v37 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
              *(void *)&v4[v36] = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v35) = 0;
          }
LABEL_68:
          uint64_t v45 = 28;
          goto LABEL_73;
        case 7u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v35 = 0;
          v5->_hasNumberSearchQueriesRun = 1;
          break;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
LABEL_54:
          uint64_t v44 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_76;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v6;
        unint64_t v42 = *(void *)&v4[v41];
        if (v42 == -1 || v42 >= *(void *)&v4[*v7]) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
        *(void *)&v4[v41] = v42 + 1;
        v35 |= (unint64_t)(v43 & 0x7F) << v39;
        if ((v43 & 0x80) == 0) {
          goto LABEL_70;
        }
        v39 += 7;
        BOOL v16 = v40++ >= 9;
        if (v16)
        {
          LODWORD(v35) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8]) {
        LODWORD(v35) = 0;
      }
LABEL_72:
      uint64_t v45 = 32;
LABEL_73:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v35;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_76:
  }
    id v46 = 0;
  else {
LABEL_77:
  }
    id v46 = v5;

  return v46;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(BMEmojiEngagement *)self emoji];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMEmojiEngagement wasPositiveEngagement](self, "wasPositiveEngagement"));
  id v6 = [(BMEmojiEngagement *)self localeIdentifier];
  uint64_t v7 = BMEmojiEngagementInputModeAsString([(BMEmojiEngagement *)self inputMode]);
  id v8 = [(BMEmojiEngagement *)self replacementContext];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMEmojiEngagement resultPosition](self, "resultPosition"));
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMEmojiEngagement numberSearchQueriesRun](self, "numberSearchQueriesRun"));
  unsigned int v11 = [(BMEmojiEngagement *)self finalSearchQuery];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMEmojiEngagement with emoji: %@, wasPositiveEngagement: %@, localeIdentifier: %@, inputMode: %@, replacementContext: %@, resultPosition: %@, numberSearchQueriesRun: %@, finalSearchQuery: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMEmojiEngagement)initWithEmoji:(id)a3 wasPositiveEngagement:(id)a4 localeIdentifier:(id)a5 inputMode:(int)a6 replacementContext:(id)a7 resultPosition:(id)a8 numberSearchQueriesRun:(id)a9 finalSearchQuery:(id)a10
{
  id v27 = a3;
  id v17 = a4;
  id v26 = a5;
  id v25 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMEmojiEngagement;
  char v21 = [(BMEventBase *)&v28 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_emoji, a3);
    if (v17)
    {
      v21->_hasWasPositiveEngagement = 1;
      v21->_wasPositiveEngagement = [v17 BOOLValue];
    }
    else
    {
      v21->_hasWasPositiveEngagement = 0;
      v21->_wasPositiveEngagement = 0;
    }
    objc_storeStrong((id *)&v21->_localeIdentifier, a5);
    v21->_inputMode = a6;
    objc_storeStrong((id *)&v21->_replacementContext, a7);
    if (v18)
    {
      v21->_hasResultPosition = 1;
      int v22 = [v18 intValue];
    }
    else
    {
      v21->_hasResultPosition = 0;
      int v22 = -1;
    }
    v21->_resultPosition = v22;
    if (v19)
    {
      v21->_hasNumberSearchQueriesRun = 1;
      int v23 = [v19 intValue];
    }
    else
    {
      v21->_hasNumberSearchQueriesRun = 0;
      int v23 = -1;
    }
    v21->_numberSearchQueriesRun = v23;
    objc_storeStrong((id *)&v21->_finalSearchQuery, a10);
  }

  return v21;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"emoji" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"wasPositiveEngagement" number:2 type:12 subMessageClass:0];
  v12[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"localeIdentifier" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inputMode" number:4 type:4 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"replacementContext" number:5 type:13 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resultPosition" number:6 type:2 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberSearchQueriesRun" number:7 type:2 subMessageClass:0];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"finalSearchQuery" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5EB0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMEmojiEngagement alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
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