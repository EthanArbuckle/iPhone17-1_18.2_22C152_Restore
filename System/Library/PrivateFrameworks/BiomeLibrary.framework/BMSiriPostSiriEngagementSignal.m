@interface BMSiriPostSiriEngagementSignal
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriPostSiriEngagementSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(id)a5 pseDelta:(id)a6 pseContents:(id)a7 donatedTimestamp:(id)a8;
- (BMSiriPostSiriEngagementSignal)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriPostSiriEngagementSignalDeltaEvent)pseDelta;
- (BOOL)hasDonatedTimestamp;
- (BOOL)hasIsPostSiriEngagement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPostSiriEngagement;
- (NSArray)pseContents;
- (NSString)action;
- (NSString)description;
- (NSString)domain;
- (double)donatedTimestamp;
- (id)_pseContentsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasDonatedTimestamp:(BOOL)a3;
- (void)setHasIsPostSiriEngagement:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriPostSiriEngagementSignal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseContents, 0);
  objc_storeStrong((id *)&self->_pseDelta, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setHasDonatedTimestamp:(BOOL)a3
{
  self->_hasDonatedTimestamp = a3;
}

- (BOOL)hasDonatedTimestamp
{
  return self->_hasDonatedTimestamp;
}

- (double)donatedTimestamp
{
  return self->_donatedTimestamp;
}

- (NSArray)pseContents
{
  return self->_pseContents;
}

- (BMSiriPostSiriEngagementSignalDeltaEvent)pseDelta
{
  return self->_pseDelta;
}

- (void)setHasIsPostSiriEngagement:(BOOL)a3
{
  self->_hasIsPostSiriEngagement = a3;
}

- (BOOL)hasIsPostSiriEngagement
{
  return self->_hasIsPostSiriEngagement;
}

- (BOOL)isPostSiriEngagement
{
  return self->_isPostSiriEngagement;
}

- (NSString)action
{
  return self->_action;
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
    v6 = [(BMSiriPostSiriEngagementSignal *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriPostSiriEngagementSignal *)self domain];
      v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_29;
      }
    }
    v13 = [(BMSiriPostSiriEngagementSignal *)self action];
    uint64_t v14 = [v5 action];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriPostSiriEngagementSignal *)self action];
      v17 = [v5 action];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_29;
      }
    }
    if ([(BMSiriPostSiriEngagementSignal *)self hasIsPostSiriEngagement]
      || [v5 hasIsPostSiriEngagement])
    {
      if (![(BMSiriPostSiriEngagementSignal *)self hasIsPostSiriEngagement]) {
        goto LABEL_29;
      }
      if (![v5 hasIsPostSiriEngagement]) {
        goto LABEL_29;
      }
      int v19 = [(BMSiriPostSiriEngagementSignal *)self isPostSiriEngagement];
      if (v19 != [v5 isPostSiriEngagement]) {
        goto LABEL_29;
      }
    }
    v20 = [(BMSiriPostSiriEngagementSignal *)self pseDelta];
    uint64_t v21 = [v5 pseDelta];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMSiriPostSiriEngagementSignal *)self pseDelta];
      v24 = [v5 pseDelta];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_29;
      }
    }
    v26 = [(BMSiriPostSiriEngagementSignal *)self pseContents];
    uint64_t v27 = [v5 pseContents];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMSiriPostSiriEngagementSignal *)self pseContents];
      v30 = [v5 pseContents];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_29;
      }
    }
    if (![(BMSiriPostSiriEngagementSignal *)self hasDonatedTimestamp]
      && ![v5 hasDonatedTimestamp])
    {
      BOOL v12 = 1;
      goto LABEL_30;
    }
    if ([(BMSiriPostSiriEngagementSignal *)self hasDonatedTimestamp]
      && [v5 hasDonatedTimestamp])
    {
      [(BMSiriPostSiriEngagementSignal *)self donatedTimestamp];
      double v33 = v32;
      [v5 donatedTimestamp];
      BOOL v12 = v33 == v34;
LABEL_30:

      goto LABEL_31;
    }
LABEL_29:
    BOOL v12 = 0;
    goto LABEL_30;
  }
  BOOL v12 = 0;
LABEL_31:

  return v12;
}

- (id)jsonDictionary
{
  v25[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriPostSiriEngagementSignal *)self domain];
  uint64_t v4 = [(BMSiriPostSiriEngagementSignal *)self action];
  if ([(BMSiriPostSiriEngagementSignal *)self hasIsPostSiriEngagement])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementSignal isPostSiriEngagement](self, "isPostSiriEngagement"));
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(BMSiriPostSiriEngagementSignal *)self pseDelta];
  uint64_t v7 = [v6 jsonDictionary];

  v8 = [(BMSiriPostSiriEngagementSignal *)self _pseContentsJSONArray];
  if (![(BMSiriPostSiriEngagementSignal *)self hasDonatedTimestamp]
    || ([(BMSiriPostSiriEngagementSignal *)self donatedTimestamp], fabs(v9) == INFINITY))
  {
    int v11 = 0;
  }
  else
  {
    [(BMSiriPostSiriEngagementSignal *)self donatedTimestamp];
    v10 = NSNumber;
    [(BMSiriPostSiriEngagementSignal *)self donatedTimestamp];
    int v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  v24[0] = @"domain";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v12;
  v22 = (void *)v4;
  v25[0] = v12;
  v24[1] = @"action";
  v13 = (void *)v4;
  if (!v4)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12);
  }
  v25[1] = v13;
  v24[2] = @"isPostSiriEngagement";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  v25[2] = v14;
  v24[3] = @"pseDelta";
  v15 = v7;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v15;
  v24[4] = @"pseContents";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"donatedTimestamp";
  v17 = v11;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  int v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v8) {
      goto LABEL_22;
    }
LABEL_31:

    if (v7) {
      goto LABEL_23;
    }
    goto LABEL_32;
  }

  if (!v8) {
    goto LABEL_31;
  }
LABEL_22:
  if (v7) {
    goto LABEL_23;
  }
LABEL_32:

LABEL_23:
  if (!v5) {

  }
  if (v22)
  {
    if (v23) {
      goto LABEL_27;
    }
  }
  else
  {

    if (v23) {
      goto LABEL_27;
    }
  }

LABEL_27:

  return v18;
}

- (id)_pseContentsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMSiriPostSiriEngagementSignal *)self pseContents];
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
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriPostSiriEngagementSignal)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"domain"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v92 = *MEMORY[0x1E4F28568];
        id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
        v93[0] = v10;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];
        id v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2);
        v29 = 0;
        id v7 = 0;
        *a4 = v32;
        goto LABEL_73;
      }
      v29 = 0;
      id v7 = 0;
      goto LABEL_74;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"action"];
  v67 = (void *)v8;
  if (v8 && (double v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        id v65 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"action"];
        id v91 = v65;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v36 = (id)[v33 initWithDomain:v34 code:2 userInfo:v35];
        v29 = 0;
        id v10 = 0;
        *a4 = v36;
        goto LABEL_72;
      }
      id v10 = 0;
      v29 = 0;
      goto LABEL_73;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  long long v11 = [v5 objectForKeyedSubscript:@"isPostSiriEngagement"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = v11;
      if (a4)
      {
        id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v88 = *MEMORY[0x1E4F28568];
        id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isPostSiriEngagement"];
        id v89 = v26;
        v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        id v38 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v37, 2);
        v29 = 0;
        id v65 = 0;
        *a4 = v38;

        goto LABEL_71;
      }
      id v65 = 0;
      v29 = 0;
      goto LABEL_72;
    }
    v62 = v11;
    id v65 = v11;
  }
  else
  {
    v62 = v11;
    id v65 = 0;
  }
  long long v12 = [v5 objectForKeyedSubscript:@"pseDelta"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v12;
        id v76 = 0;
        v63 = [[BMSiriPostSiriEngagementSignalDeltaEvent alloc] initWithJSONDictionary:v26 error:&v76];
        id v27 = v76;
        if (!v27)
        {
          v59 = v12;
          v60 = v6;

          goto LABEL_13;
        }
        v28 = v27;
        if (a4) {
          *a4 = v27;
        }

        v29 = 0;
      }
      else
      {
        if (!a4)
        {
          v29 = 0;
          v35 = v62;
          id v26 = v12;
          goto LABEL_71;
        }
        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        v63 = (BMSiriPostSiriEngagementSignalDeltaEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"pseDelta"];
        v87 = v63;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        *a4 = (id)[v70 initWithDomain:v61 code:2 userInfo:v39];

        v29 = 0;
        id v26 = v12;
      }
      v35 = v62;
      goto LABEL_70;
    }
  }
  v59 = v12;
  v60 = v6;
  v63 = 0;
LABEL_13:
  id v13 = [v5 objectForKeyedSubscript:@"pseContents"];
  long long v14 = [MEMORY[0x1E4F1CA98] null];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
    id v56 = v10;
    id v57 = v7;
    v58 = self;

    id v13 = 0;
  }
  else
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v29 = 0;
          v35 = v62;
          goto LABEL_69;
        }
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v48 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        v68 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"pseContents"];
        v85 = v68;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        id v49 = (id)[v47 initWithDomain:v48 code:2 userInfo:v25];
        v29 = 0;
        *a4 = v49;
LABEL_62:
        v35 = v62;
        goto LABEL_68;
      }
    }
    id v56 = v10;
    id v57 = v7;
    v58 = self;
  }
  v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v13 = v13;
  uint64_t v16 = [v13 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (!v16) {
    goto LABEL_32;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v73;
  id v55 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v73 != v18) {
        objc_enumerationMutation(v13);
      }
      uint64_t v20 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v81 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"pseContents"];
          id v82 = v21;
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          *a4 = (id)[v40 initWithDomain:v41 code:2 userInfo:v42];

LABEL_55:
          v29 = 0;
          id v25 = v13;
          id v5 = v55;
          id v10 = v56;
          id v7 = v57;
          self = v58;
          v35 = v62;
          goto LABEL_67;
        }
        goto LABEL_61;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v79 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"pseContents"];
          id v80 = v21;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          *a4 = (id)[v43 initWithDomain:v44 code:2 userInfo:v45];

          goto LABEL_55;
        }
LABEL_61:
        v29 = 0;
        id v25 = v13;
        id v5 = v55;
        id v10 = v56;
        id v7 = v57;
        self = v58;
        goto LABEL_62;
      }
      id v21 = v20;
      v22 = [BMSiriPostSiriEngagementSignalContent alloc];
      id v71 = 0;
      v23 = [(BMSiriPostSiriEngagementSignalContent *)v22 initWithJSONDictionary:v21 error:&v71];
      id v24 = v71;
      if (v24)
      {
        v46 = v24;
        v35 = v62;
        if (a4) {
          *a4 = v24;
        }

        v29 = 0;
        id v25 = v13;
        id v5 = v55;
        id v10 = v56;
        id v7 = v57;
        self = v58;
        goto LABEL_67;
      }
      [v68 addObject:v23];
    }
    uint64_t v17 = [v13 countByEnumeratingWithState:&v72 objects:v83 count:16];
    id v5 = v55;
    if (v17) {
      continue;
    }
    break;
  }
LABEL_32:

  id v21 = [v5 objectForKeyedSubscript:@"donatedTimestamp"];
  if (v21)
  {
    objc_opt_class();
    id v7 = v57;
    self = v58;
    id v10 = v56;
    if (objc_opt_isKindOfClass())
    {
      id v25 = 0;
      goto LABEL_65;
    }
    objc_opt_class();
    v35 = v62;
    if (objc_opt_isKindOfClass())
    {
      id v25 = v21;
      goto LABEL_66;
    }
    if (a4)
    {
      id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F502C8];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      v51 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"donatedTimestamp"];
      v78 = v51;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      *a4 = (id)[v54 initWithDomain:v53 code:2 userInfo:v52];
    }
    id v25 = 0;
    v29 = 0;
  }
  else
  {
    id v25 = 0;
    id v7 = v57;
    self = v58;
    id v10 = v56;
LABEL_65:
    v35 = v62;
LABEL_66:
    self = [(BMSiriPostSiriEngagementSignal *)self initWithDomain:v7 action:v10 isPostSiriEngagement:v65 pseDelta:v63 pseContents:v68 donatedTimestamp:v25];
    v29 = self;
  }
LABEL_67:

LABEL_68:
LABEL_69:

  id v26 = v59;
  uint64_t v6 = v60;
LABEL_70:

LABEL_71:
LABEL_72:

LABEL_73:
LABEL_74:

  return v29;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriPostSiriEngagementSignal *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_action) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsPostSiriEngagement) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_pseDelta)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriPostSiriEngagementSignalDeltaEvent *)self->_pseDelta writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_pseContents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  if (self->_hasDonatedTimestamp) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriPostSiriEngagementSignal;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_50;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v22 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          v5->_hasIsPostSiriEngagement = 1;
          break;
        case 4u:
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          uint64_t v31 = [[BMSiriPostSiriEngagementSignalDeltaEvent alloc] initByReadFrom:v4];
          if (!v31) {
            goto LABEL_52;
          }
          pseDelta = v5->_pseDelta;
          v5->_pseDelta = v31;

          PBReaderRecallMark();
          continue;
        case 5u:
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v33 = [[BMSiriPostSiriEngagementSignalContent alloc] initByReadFrom:v4];
          if (!v33) {
            goto LABEL_52;
          }
          uint64_t v34 = v33;
          [v6 addObject:v33];
          PBReaderRecallMark();

          continue;
        case 6u:
          v5->_hasDonatedTimestamp = 1;
          uint64_t v35 = *v7;
          unint64_t v36 = *(void *)&v4[v35];
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)&v4[*v8])
          {
            double v37 = *(double *)(*(void *)&v4[*v10] + v36);
            *(void *)&v4[v35] = v36 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v37 = 0.0;
          }
          v5->_donatedTimestamp = v37;
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_52:

          goto LABEL_49;
      }
      while (1)
      {
        uint64_t v27 = *v7;
        uint64_t v28 = *(void *)&v4[v27];
        unint64_t v29 = v28 + 1;
        if (v28 == -1 || v29 > *(void *)&v4[*v8]) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)&v4[*v10] + v28);
        *(void *)&v4[v27] = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0) {
          goto LABEL_42;
        }
        v24 += 7;
        BOOL v18 = v25++ >= 9;
        if (v18)
        {
          uint64_t v26 = 0;
          goto LABEL_44;
        }
      }
      v4[*v9] = 1;
LABEL_42:
      if (v4[*v9]) {
        uint64_t v26 = 0;
      }
LABEL_44:
      v5->_isPostSiriEngagement = v26 != 0;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v38 = [v6 copy];
  pseContents = v5->_pseContents;
  v5->_pseContents = (NSArray *)v38;

  int v40 = v4[*v9];
  if (v40) {
LABEL_49:
  }
    uint64_t v41 = 0;
  else {
LABEL_50:
  }
    uint64_t v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriPostSiriEngagementSignal *)self domain];
  id v5 = [(BMSiriPostSiriEngagementSignal *)self action];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementSignal isPostSiriEngagement](self, "isPostSiriEngagement"));
  uint64_t v7 = [(BMSiriPostSiriEngagementSignal *)self pseDelta];
  uint64_t v8 = [(BMSiriPostSiriEngagementSignal *)self pseContents];
  uint64_t v9 = NSNumber;
  [(BMSiriPostSiriEngagementSignal *)self donatedTimestamp];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  char v11 = (void *)[v3 initWithFormat:@"BMSiriPostSiriEngagementSignal with domain: %@, action: %@, isPostSiriEngagement: %@, pseDelta: %@, pseContents: %@, donatedTimestamp: %@", v4, v5, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (BMSiriPostSiriEngagementSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(id)a5 pseDelta:(id)a6 pseContents:(id)a7 donatedTimestamp:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriPostSiriEngagementSignal;
  int v19 = [(BMEventBase *)&v24 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23);
    objc_storeStrong((id *)&v19->_domain, a3);
    objc_storeStrong((id *)&v19->_action, a4);
    if (v15)
    {
      v19->_hasIsPostSiriEngagement = 1;
      v19->_isPostSiriEngagement = [v15 BOOLValue];
    }
    else
    {
      v19->_hasIsPostSiriEngagement = 0;
      v19->_isPostSiriEngagement = 0;
    }
    objc_storeStrong((id *)&v19->_pseDelta, a6);
    objc_storeStrong((id *)&v19->_pseContents, a7);
    if (v18)
    {
      v19->_hasDonatedTimestamp = 1;
      [v18 doubleValue];
    }
    else
    {
      v19->_hasDonatedTimestamp = 0;
      double v20 = -1.0;
    }
    v19->_donatedTimestamp = v20;
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"action" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPostSiriEngagement" number:3 type:12 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pseDelta" number:4 type:14 subMessageClass:objc_opt_class()];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pseContents" number:5 type:14 subMessageClass:objc_opt_class()];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"donatedTimestamp" number:6 type:0 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF69D8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"action" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPostSiriEngagement" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"pseDelta_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_332];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"pseContents_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_334];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"donatedTimestamp" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __41__BMSiriPostSiriEngagementSignal_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _pseContentsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __41__BMSiriPostSiriEngagementSignal_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 pseDelta];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMSiriPostSiriEngagementSignal alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[5] = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end