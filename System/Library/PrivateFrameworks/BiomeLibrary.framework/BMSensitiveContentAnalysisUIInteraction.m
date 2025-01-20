@interface BMSensitiveContentAnalysisUIInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSensitiveContentAnalysisUIInteraction)initWithInteractionType:(int)a3 ageGroup:(int)a4 eventDirection:(int)a5 screen:(int)a6 action:(int)a7 contentType:(int)a8 clientBundleID:(id)a9 trackingVersion:(id)a10;
- (BMSensitiveContentAnalysisUIInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)trackingVersion;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)action;
- (int)ageGroup;
- (int)contentType;
- (int)eventDirection;
- (int)interactionType;
- (int)screen;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSensitiveContentAnalysisUIInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingVersion, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

- (NSString)trackingVersion
{
  return self->_trackingVersion;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)action
{
  return self->_action;
}

- (int)screen
{
  return self->_screen;
}

- (int)eventDirection
{
  return self->_eventDirection;
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = 0;
    goto LABEL_13;
  }
  id v5 = v4;
  int v6 = [(BMSensitiveContentAnalysisUIInteraction *)self interactionType];
  if (v6 != [v5 interactionType]) {
    goto LABEL_10;
  }
  int v7 = [(BMSensitiveContentAnalysisUIInteraction *)self ageGroup];
  if (v7 != [v5 ageGroup]) {
    goto LABEL_10;
  }
  int v8 = [(BMSensitiveContentAnalysisUIInteraction *)self eventDirection];
  if (v8 != [v5 eventDirection]) {
    goto LABEL_10;
  }
  int v9 = [(BMSensitiveContentAnalysisUIInteraction *)self screen];
  if (v9 != [v5 screen]) {
    goto LABEL_10;
  }
  int v10 = [(BMSensitiveContentAnalysisUIInteraction *)self action];
  if (v10 != [v5 action]) {
    goto LABEL_10;
  }
  int v11 = [(BMSensitiveContentAnalysisUIInteraction *)self contentType];
  if (v11 != [v5 contentType]) {
    goto LABEL_10;
  }
  v12 = [(BMSensitiveContentAnalysisUIInteraction *)self clientBundleID];
  uint64_t v13 = [v5 clientBundleID];
  if (v12 == (void *)v13)
  {

    goto LABEL_15;
  }
  v14 = (void *)v13;
  v15 = [(BMSensitiveContentAnalysisUIInteraction *)self clientBundleID];
  v16 = [v5 clientBundleID];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
LABEL_15:
    v20 = [(BMSensitiveContentAnalysisUIInteraction *)self trackingVersion];
    v21 = [v5 trackingVersion];
    if (v20 == v21)
    {
      char v18 = 1;
    }
    else
    {
      v22 = [(BMSensitiveContentAnalysisUIInteraction *)self trackingVersion];
      v23 = [v5 trackingVersion];
      char v18 = [v22 isEqual:v23];
    }
    goto LABEL_11;
  }
LABEL_10:
  char v18 = 0;
LABEL_11:

LABEL_13:
  return v18;
}

- (id)jsonDictionary
{
  v28[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction interactionType](self, "interactionType"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction ageGroup](self, "ageGroup"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction eventDirection](self, "eventDirection"));
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction screen](self, "screen"));
  int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction action](self, "action"));
  int v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisUIInteraction contentType](self, "contentType"));
  int v9 = [(BMSensitiveContentAnalysisUIInteraction *)self clientBundleID];
  int v10 = [(BMSensitiveContentAnalysisUIInteraction *)self trackingVersion];
  v27[0] = @"interactionType";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v11;
  v28[0] = v11;
  v27[1] = @"ageGroup";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v12;
  v28[1] = v12;
  v27[2] = @"eventDirection";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v3;
  v20 = (void *)v13;
  v28[2] = v13;
  v27[3] = @"screen";
  v14 = v6;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v4;
  v28[3] = v14;
  v27[4] = @"action";
  v15 = v7;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v5;
  v28[4] = v15;
  v27[5] = @"contentType";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v16;
  v27[6] = @"clientBundleID";
  int v17 = v9;
  if (!v9)
  {
    int v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v17;
  v27[7] = @"trackingVersion";
  char v18 = v10;
  if (!v10)
  {
    char v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
LABEL_31:

    if (v8) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }

  if (!v9) {
    goto LABEL_31;
  }
LABEL_19:
  if (v8) {
    goto LABEL_20;
  }
LABEL_32:

LABEL_20:
  if (!v7) {

  }
  if (!v6) {
  if (v24)
  }
  {
    if (v25) {
      goto LABEL_26;
    }
LABEL_34:

    if (v26) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }

  if (!v25) {
    goto LABEL_34;
  }
LABEL_26:
  if (v26) {
    goto LABEL_27;
  }
LABEL_35:

LABEL_27:

  return v23;
}

- (BMSensitiveContentAnalysisUIInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v71 = [v5 objectForKeyedSubscript:@"interactionType"];
  if (!v71 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v6 = 0;
LABEL_9:
    int v8 = [v5 objectForKeyedSubscript:@"ageGroup"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v67 = 0;
            goto LABEL_70;
          }
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v84 = *MEMORY[0x1E4F28568];
          v68 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"ageGroup"];
          v85 = v68;
          int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          id v41 = (id)[v39 initWithDomain:v40 code:2 userInfo:v10];
          v67 = 0;
          v42 = a4;
          a4 = 0;
          id *v42 = v41;
          goto LABEL_69;
        }
        id v9 = [NSNumber numberWithInt:BMSensitiveContentAnalysisUIInteractionAgeGroupFromString(v8)];
      }
      v67 = v9;
    }
    else
    {
      v67 = 0;
    }
    int v10 = [v5 objectForKeyedSubscript:@"eventDirection"];
    v64 = v10;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = v6;
        id v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v68 = 0;
            goto LABEL_69;
          }
          id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v43 = *MEMORY[0x1E4F502C8];
          uint64_t v82 = *MEMORY[0x1E4F28568];
          v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"eventDirection"];
          v83 = v15;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id v44 = (id)[v69 initWithDomain:v43 code:2 userInfo:v33];
          v68 = 0;
          v45 = a4;
          a4 = 0;
          id *v45 = v44;
LABEL_68:

LABEL_69:
          goto LABEL_70;
        }
        uint64_t v11 = v6;
        id v12 = [NSNumber numberWithInt:BMSensitiveContentAnalysisUIInteractionEventDirectionFromString(v10)];
      }
      v68 = v12;
    }
    else
    {
      uint64_t v11 = v6;
      v68 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"screen"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v14 = a4;
      if (objc_opt_isKindOfClass())
      {
        v15 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = a4;
          if (!a4)
          {
            a4 = 0;
            v33 = v13;
            int v6 = v11;
            goto LABEL_68;
          }
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v80 = *MEMORY[0x1E4F28568];
          id v66 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"screen"];
          id v81 = v66;
          v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          a4 = 0;
          void *v15 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);
          v15 = 0;
          v33 = v13;
          int v10 = v64;
          int v6 = v11;
          goto LABEL_67;
        }
        v15 = [NSNumber numberWithInt:BMSensitiveContentAnalysisUIInteractionScreenFromString(v13)];
      }
    }
    else
    {
      v14 = a4;
      v15 = 0;
    }
    uint64_t v16 = [v5 objectForKeyedSubscript:@"action"];
    v60 = v15;
    v61 = v13;
    v62 = (void *)v16;
    if (v16 && (int v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      int v6 = v11;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v14)
          {
            id v66 = 0;
            a4 = 0;
            v33 = v61;
            goto LABEL_67;
          }
          v48 = v14;
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v50 = *MEMORY[0x1E4F502C8];
          uint64_t v78 = *MEMORY[0x1E4F28568];
          id v65 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"action"];
          id v79 = v65;
          char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          id v66 = 0;
          a4 = 0;
          id *v48 = (id)[v49 initWithDomain:v50 code:2 userInfo:v18];
          goto LABEL_92;
        }
        id v66 = [NSNumber numberWithInt:BMSensitiveContentAnalysisUIInteractionActionFromString(v17)];
        a4 = v14;
LABEL_32:
        char v18 = [v5 objectForKeyedSubscript:@"contentType"];
        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v65 = 0;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v65 = v18;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v65 = [NSNumber numberWithInt:BMSensitiveContentAnalysisUIInteractionContentTypeFromString(v18)];
LABEL_35:
          uint64_t v19 = [v5 objectForKeyedSubscript:@"clientBundleID"];
          v58 = (void *)v19;
          v59 = v8;
          if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v21 = a4;
            id v63 = 0;
            goto LABEL_38;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = a4;
            id v63 = v20;
LABEL_38:
            v22 = [v5 objectForKeyedSubscript:@"trackingVersion"];
            if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v56 = v18;
              id v57 = v5;
              id v23 = self;
              id v24 = 0;
LABEL_41:
              v15 = v60;
              a4 = -[BMSensitiveContentAnalysisUIInteraction initWithInteractionType:ageGroup:eventDirection:screen:action:contentType:clientBundleID:trackingVersion:](v23, "initWithInteractionType:ageGroup:eventDirection:screen:action:contentType:clientBundleID:trackingVersion:", [v6 intValue], objc_msgSend(v67, "intValue"), objc_msgSend(v68, "intValue"), objc_msgSend(v60, "intValue"), objc_msgSend(v66, "intValue"), objc_msgSend(v65, "intValue"), v63, v24);
              self = (BMSensitiveContentAnalysisUIInteraction *)a4;
              char v18 = v56;
              id v5 = v57;
LABEL_64:

              v20 = v58;
              int v8 = v59;
              int v10 = v64;
              v33 = v61;
LABEL_65:

LABEL_66:
LABEL_67:

              goto LABEL_68;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v56 = v18;
              id v57 = v5;
              id v23 = self;
              id v24 = v22;
              goto LABEL_41;
            }
            if (v21)
            {
              id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v30 = *MEMORY[0x1E4F502C8];
              uint64_t v72 = *MEMORY[0x1E4F28568];
              v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trackingVersion"];
              v73 = v31;
              v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
              id *v21 = (id)[v29 initWithDomain:v30 code:2 userInfo:v32];
            }
            id v24 = 0;
            a4 = 0;
LABEL_63:
            v15 = v60;
            goto LABEL_64;
          }
          if (a4)
          {
            id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
            v26 = a4;
            uint64_t v27 = *MEMORY[0x1E4F502C8];
            uint64_t v74 = *MEMORY[0x1E4F28568];
            id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientBundleID"];
            id v75 = v24;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
            id v28 = (id)[v25 initWithDomain:v27 code:2 userInfo:v22];
            a4 = 0;
            id v63 = 0;
            id *v26 = v28;
            goto LABEL_63;
          }
          id v63 = 0;
LABEL_85:
          v15 = v60;
          v33 = v61;
          goto LABEL_65;
        }
        if (a4)
        {
          id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
          v52 = a4;
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v76 = *MEMORY[0x1E4F28568];
          id v63 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"contentType"];
          id v77 = v63;
          uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          id v55 = (id)[v51 initWithDomain:v53 code:2 userInfo:v54];
          id v65 = 0;
          a4 = 0;
          id *v52 = v55;
          v20 = (void *)v54;
          goto LABEL_85;
        }
        id v65 = 0;
LABEL_92:
        v15 = v60;
        v33 = v61;
        goto LABEL_66;
      }
      id v66 = v17;
    }
    else
    {
      id v66 = 0;
      int v6 = v11;
    }
    a4 = v14;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v71;
LABEL_8:
    int v6 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [NSNumber numberWithInt:BMSensitiveContentAnalysisUIInteractionInteractionTypeFromString(v71)];
    goto LABEL_8;
  }
  if (!a4)
  {
    int v6 = 0;
    goto LABEL_71;
  }
  id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v36 = *MEMORY[0x1E4F502C8];
  uint64_t v86 = *MEMORY[0x1E4F28568];
  v67 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interactionType"];
  v87[0] = v67;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
  id v37 = (id)[v35 initWithDomain:v36 code:2 userInfo:v8];
  int v6 = 0;
  v38 = a4;
  a4 = 0;
  id *v38 = v37;
LABEL_70:

LABEL_71:
  return (BMSensitiveContentAnalysisUIInteraction *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSensitiveContentAnalysisUIInteraction *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_clientBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_trackingVersion) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)BMSensitiveContentAnalysisUIInteraction;
  id v5 = [(BMEventBase *)&v56 init];
  if (!v5) {
    goto LABEL_107;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
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
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_68;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_70;
            }
          }
          v4[*v8] = 1;
LABEL_68:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_70:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          uint64_t v53 = 20;
          goto LABEL_103;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v27 = *v6;
            unint64_t v28 = *(void *)&v4[v27];
            if (v28 == -1 || v28 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
              *(void *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_76:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          uint64_t v53 = 24;
          goto LABEL_103;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v32 = *v6;
            unint64_t v33 = *(void *)&v4[v32];
            if (v33 == -1 || v33 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v33 + 1;
              v21 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v16 = v31++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_82:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          uint64_t v53 = 28;
          goto LABEL_103;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v37 = *v6;
            unint64_t v38 = *(void *)&v4[v37];
            if (v38 == -1 || v38 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
              *(void *)&v4[v37] = v38 + 1;
              v21 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v16 = v36++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_88:
          if (v21 >= 3) {
            LODWORD(v21) = 0;
          }
          uint64_t v53 = 32;
          goto LABEL_103;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v42 = *v6;
            unint64_t v43 = *(void *)&v4[v42];
            if (v43 == -1 || v43 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
              *(void *)&v4[v42] = v43 + 1;
              v21 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v16 = v41++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_94:
          if (v21 >= 0xA) {
            LODWORD(v21) = 0;
          }
          uint64_t v53 = 36;
          goto LABEL_103;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v21 = 0;
          break;
        case 7u:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 48;
          goto LABEL_66;
        case 8u:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 56;
LABEL_66:
          v52 = *(Class *)((char *)&v5->super.super.isa + v51);
          *(Class *)((char *)&v5->super.super.isa + v51) = (Class)v50;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_106;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v6;
        unint64_t v48 = *(void *)&v4[v47];
        if (v48 == -1 || v48 >= *(void *)&v4[*v7]) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
        *(void *)&v4[v47] = v48 + 1;
        v21 |= (unint64_t)(v49 & 0x7F) << v45;
        if ((v49 & 0x80) == 0) {
          goto LABEL_98;
        }
        v45 += 7;
        BOOL v16 = v46++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_100;
        }
      }
      v4[*v8] = 1;
LABEL_98:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_100:
      if (v21 >= 3) {
        LODWORD(v21) = 0;
      }
      uint64_t v53 = 40;
LABEL_103:
      *(_DWORD *)((char *)&v5->super.super.isa + v53) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_106:
  }
    uint64_t v54 = 0;
  else {
LABEL_107:
  }
    uint64_t v54 = v5;

  return v54;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSensitiveContentAnalysisUIInteractionInteractionTypeAsString([(BMSensitiveContentAnalysisUIInteraction *)self interactionType]);
  id v5 = BMSensitiveContentAnalysisUIInteractionAgeGroupAsString([(BMSensitiveContentAnalysisUIInteraction *)self ageGroup]);
  int v6 = BMSensitiveContentAnalysisUIInteractionEventDirectionAsString([(BMSensitiveContentAnalysisUIInteraction *)self eventDirection]);
  id v7 = BMSensitiveContentAnalysisUIInteractionScreenAsString([(BMSensitiveContentAnalysisUIInteraction *)self screen]);
  int v8 = BMSensitiveContentAnalysisUIInteractionActionAsString([(BMSensitiveContentAnalysisUIInteraction *)self action]);
  id v9 = BMSensitiveContentAnalysisUIInteractionContentTypeAsString([(BMSensitiveContentAnalysisUIInteraction *)self contentType]);
  char v10 = [(BMSensitiveContentAnalysisUIInteraction *)self clientBundleID];
  unsigned int v11 = [(BMSensitiveContentAnalysisUIInteraction *)self trackingVersion];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSensitiveContentAnalysisUIInteraction with interactionType: %@, ageGroup: %@, eventDirection: %@, screen: %@, action: %@, contentType: %@, clientBundleID: %@, trackingVersion: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSensitiveContentAnalysisUIInteraction)initWithInteractionType:(int)a3 ageGroup:(int)a4 eventDirection:(int)a5 screen:(int)a6 action:(int)a7 contentType:(int)a8 clientBundleID:(id)a9 trackingVersion:(id)a10
{
  id v16 = a9;
  id v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)BMSensitiveContentAnalysisUIInteraction;
  char v18 = [(BMEventBase *)&v21 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v18->_interactionType = a3;
    v18->_ageGroup = a4;
    v18->_eventDirection = a5;
    v18->_screen = a6;
    v18->_action = a7;
    v18->_contentType = a8;
    objc_storeStrong((id *)&v18->_clientBundleID, a9);
    objc_storeStrong((id *)&v18->_trackingVersion, a10);
  }

  return v18;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionType" number:1 type:4 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ageGroup" number:2 type:4 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventDirection" number:3 type:4 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"screen" number:4 type:4 subMessageClass:0];
  v12[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"action" number:5 type:4 subMessageClass:0];
  v12[4] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentType" number:6 type:4 subMessageClass:0];
  v12[5] = v7;
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientBundleID" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trackingVersion" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF35B8;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ageGroup" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventDirection" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"screen" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"action" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentType" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientBundleID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trackingVersion" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    int v8 = [[BMSensitiveContentAnalysisUIInteraction alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end