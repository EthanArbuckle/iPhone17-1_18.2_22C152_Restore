@interface BMLighthouseLedgerLighthousePluginEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseLedgerLighthousePluginEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseLedgerLighthousePluginEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 performTaskStatus:(id)a6 performTrialTaskStatus:(id)a7 stop:(id)a8;
- (BMLighthouseLedgerLighthousePluginEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 usePrivateUpload:(id)a6 performTaskStatus:(id)a7 performTrialTaskStatus:(id)a8 stop:(id)a9;
- (BMLighthouseLedgerLighthousePluginEventEventStatus)performTaskStatus;
- (BMLighthouseLedgerLighthousePluginEventEventStatus)performTrialTaskStatus;
- (BMLighthouseLedgerLighthousePluginEventEventStatus)stop;
- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (BOOL)hasUsePrivateUpload;
- (BOOL)isEqual:(id)a3;
- (BOOL)usePrivateUpload;
- (NSDate)timestamp;
- (NSString)contextID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasUsePrivateUpload:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseLedgerLighthousePluginEvent

- (BMLighthouseLedgerLighthousePluginEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 performTaskStatus:(id)a6 performTrialTaskStatus:(id)a7 stop:(id)a8
{
  return [(BMLighthouseLedgerLighthousePluginEvent *)self initWithTrialIdentifiers:a3 contextID:a4 timestamp:a5 usePrivateUpload:0 performTaskStatus:a6 performTrialTaskStatus:a7 stop:a8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stop, 0);
  objc_storeStrong((id *)&self->_performTrialTaskStatus, 0);
  objc_storeStrong((id *)&self->_performTaskStatus, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)stop
{
  return self->_stop;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)performTrialTaskStatus
{
  return self->_performTrialTaskStatus;
}

- (BMLighthouseLedgerLighthousePluginEventEventStatus)performTaskStatus
{
  return self->_performTaskStatus;
}

- (void)setHasUsePrivateUpload:(BOOL)a3
{
  self->_hasUsePrivateUpload = a3;
}

- (BOOL)hasUsePrivateUpload
{
  return self->_hasUsePrivateUpload;
}

- (BOOL)usePrivateUpload
{
  return self->_usePrivateUpload;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
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
    v6 = [(BMLighthouseLedgerLighthousePluginEvent *)self trialIdentifiers];
    uint64_t v7 = [v5 trialIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLighthouseLedgerLighthousePluginEvent *)self trialIdentifiers];
      v10 = [v5 trialIdentifiers];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_26;
      }
    }
    v13 = [(BMLighthouseLedgerLighthousePluginEvent *)self contextID];
    uint64_t v14 = [v5 contextID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLighthouseLedgerLighthousePluginEvent *)self contextID];
      v17 = [v5 contextID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_26;
      }
    }
    v19 = [(BMLighthouseLedgerLighthousePluginEvent *)self timestamp];
    uint64_t v20 = [v5 timestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMLighthouseLedgerLighthousePluginEvent *)self timestamp];
      v23 = [v5 timestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_26;
      }
    }
    if ([(BMLighthouseLedgerLighthousePluginEvent *)self hasUsePrivateUpload]
      || [v5 hasUsePrivateUpload])
    {
      if (![(BMLighthouseLedgerLighthousePluginEvent *)self hasUsePrivateUpload]) {
        goto LABEL_26;
      }
      if (![v5 hasUsePrivateUpload]) {
        goto LABEL_26;
      }
      int v25 = [(BMLighthouseLedgerLighthousePluginEvent *)self usePrivateUpload];
      if (v25 != [v5 usePrivateUpload]) {
        goto LABEL_26;
      }
    }
    v26 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTaskStatus];
    uint64_t v27 = [v5 performTaskStatus];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTaskStatus];
      v30 = [v5 performTaskStatus];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_26;
      }
    }
    v32 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTrialTaskStatus];
    uint64_t v33 = [v5 performTrialTaskStatus];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTrialTaskStatus];
      v36 = [v5 performTrialTaskStatus];
      int v37 = [v35 isEqual:v36];

      if (!v37)
      {
LABEL_26:
        char v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v39 = [(BMLighthouseLedgerLighthousePluginEvent *)self stop];
    v40 = [v5 stop];
    if (v39 == v40)
    {
      char v12 = 1;
    }
    else
    {
      v41 = [(BMLighthouseLedgerLighthousePluginEvent *)self stop];
      v42 = [v5 stop];
      char v12 = [v41 isEqual:v42];
    }
    goto LABEL_27;
  }
  char v12 = 0;
LABEL_28:

  return v12;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
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
  v31[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLighthouseLedgerLighthousePluginEvent *)self trialIdentifiers];
  uint64_t v4 = [v3 jsonDictionary];

  uint64_t v5 = [(BMLighthouseLedgerLighthousePluginEvent *)self contextID];
  v6 = [(BMLighthouseLedgerLighthousePluginEvent *)self timestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMLighthouseLedgerLighthousePluginEvent *)self timestamp];
    [v8 timeIntervalSince1970];
    v29 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v29 = 0;
  }

  if ([(BMLighthouseLedgerLighthousePluginEvent *)self hasUsePrivateUpload])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLighthouseLedgerLighthousePluginEvent usePrivateUpload](self, "usePrivateUpload"));
  }
  else
  {
    v9 = 0;
  }
  v10 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTaskStatus];
  int v11 = [v10 jsonDictionary];

  char v12 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTrialTaskStatus];
  v13 = [v12 jsonDictionary];

  uint64_t v14 = [(BMLighthouseLedgerLighthousePluginEvent *)self stop];
  v15 = [v14 jsonDictionary];

  v30[0] = @"trialIdentifiers";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v16;
  v31[0] = v16;
  v30[1] = @"contextID";
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v17;
  v31[1] = v17;
  v30[2] = @"timestamp";
  int v18 = v29;
  if (!v29)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v4;
  v31[2] = v18;
  v30[3] = @"usePrivateUpload";
  v19 = v9;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v5;
  v31[3] = v19;
  v30[4] = @"performTaskStatus";
  uint64_t v20 = v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[4] = v20;
  v30[5] = @"performTrialTaskStatus";
  v21 = v13;
  if (!v13)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[5] = v21;
  v30[6] = @"stop";
  v22 = v15;
  if (!v15)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:7];
  if (v15)
  {
    if (v13) {
      goto LABEL_23;
    }
LABEL_33:

    if (v11) {
      goto LABEL_24;
    }
    goto LABEL_34;
  }

  if (!v13) {
    goto LABEL_33;
  }
LABEL_23:
  if (v11) {
    goto LABEL_24;
  }
LABEL_34:

LABEL_24:
  if (!v9) {

  }
  if (v29)
  {
    if (v27) {
      goto LABEL_28;
    }
LABEL_36:

    if (v28) {
      goto LABEL_29;
    }
    goto LABEL_37;
  }

  if (!v27) {
    goto LABEL_36;
  }
LABEL_28:
  if (v28) {
    goto LABEL_29;
  }
LABEL_37:

LABEL_29:

  return v23;
}

- (BMLighthouseLedgerLighthousePluginEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"trialIdentifiers"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v73 = 0;
    v8 = [[BMLighthouseLedgerTrialIdentifiers alloc] initWithJSONDictionary:v10 error:&v73];
    id v19 = v73;
    if (v19)
    {
      uint64_t v20 = v19;
      if (a4) {
        *a4 = v19;
      }

      int v18 = 0;
      goto LABEL_76;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"contextID"];
    v59 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          int v18 = 0;
          goto LABEL_75;
        }
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        id v68 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contextID"];
        id v85 = v68;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        int v11 = v34 = a4;
        id v10 = 0;
        int v18 = 0;
        id *v34 = (id)[v65 initWithDomain:v33 code:2 userInfo:v11];
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"timestamp"];
    v61 = v9;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v22 = v11;
        id v23 = [v21 alloc];
        [v22 doubleValue];
        double v25 = v24;

        id v68 = (id)[v23 initWithTimeIntervalSince1970:v25];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v68 = [v35 dateFromString:v11];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v59)
            {
              id v68 = 0;
              int v18 = 0;
              goto LABEL_74;
            }
            id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v63 = *MEMORY[0x1E4F502C8];
            uint64_t v82 = *MEMORY[0x1E4F28568];
            id v64 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
            id v83 = v64;
            char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
            id v49 = (id)[v69 initWithDomain:v63 code:2 userInfo:v12];
            id v68 = 0;
            int v18 = 0;
            id *v59 = v49;
            goto LABEL_73;
          }
          id v68 = v11;
        }
      }
    }
    else
    {
      id v68 = 0;
    }
    char v12 = [v6 objectForKeyedSubscript:@"usePrivateUpload"];
    v67 = self;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v59)
        {
          id v64 = 0;
          int v18 = 0;
          goto LABEL_73;
        }
        id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v36 = v10;
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"usePrivateUpload"];
        id v81 = v26;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        uint64_t v39 = v37;
        id v10 = v36;
        v62 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)v38;
        id v40 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v39, 2);
        int v18 = 0;
        id v64 = 0;
        id *v59 = v40;
        goto LABEL_71;
      }
      id v64 = v12;
    }
    else
    {
      id v64 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"performTaskStatus"];
    v60 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v59)
        {
          int v18 = 0;
          goto LABEL_72;
        }
        id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v78 = *MEMORY[0x1E4F28568];
        id v43 = v10;
        id v44 = [NSString alloc];
        uint64_t v50 = objc_opt_class();
        v45 = v44;
        id v10 = v43;
        v62 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)[v45 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v50, @"performTaskStatus"];
        v79 = v62;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        id *v59 = (id)[v55 initWithDomain:v51 code:2 userInfo:v46];

        int v18 = 0;
        id v26 = v13;
LABEL_71:

        v13 = v26;
LABEL_72:

        self = v67;
LABEL_73:

        v9 = v61;
        goto LABEL_74;
      }
      id v26 = v13;
      id v72 = 0;
      v62 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initWithJSONDictionary:v26 error:&v72];
      id v27 = v72;
      if (v27)
      {
        v28 = v27;
        if (v59) {
          id *v59 = v27;
        }

        int v18 = 0;
        goto LABEL_71;
      }
    }
    else
    {
      v62 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"performTrialTaskStatus"];
    id v58 = v10;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v59)
        {
          int v18 = 0;
          goto LABEL_70;
        }
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v52 = *MEMORY[0x1E4F502C8];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        v15 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"performTrialTaskStatus"];
        v77 = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        int v18 = 0;
        id *v59 = (id)[v56 initWithDomain:v52 code:2 userInfo:v16];
LABEL_69:

        v8 = v60;
        id v10 = v58;
LABEL_70:

        id v26 = v13;
        goto LABEL_71;
      }
      id v16 = v14;
      id v71 = 0;
      v15 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initWithJSONDictionary:v16 error:&v71];
      id v31 = v71;
      if (v31)
      {
        v32 = v31;
        if (v59) {
          id *v59 = v31;
        }

        goto LABEL_78;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = [v6 objectForKeyedSubscript:@"stop"];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v17 = 0;
LABEL_22:
      int v18 = [(BMLighthouseLedgerLighthousePluginEvent *)v67 initWithTrialIdentifiers:v60 contextID:v58 timestamp:v68 usePrivateUpload:v64 performTaskStatus:v62 performTrialTaskStatus:v15 stop:v17];
      v67 = v18;
LABEL_68:

      goto LABEL_69;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v70 = 0;
      id v54 = v16;
      uint64_t v17 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initWithJSONDictionary:v54 error:&v70];
      id v41 = v70;
      if (!v41)
      {

        goto LABEL_22;
      }
      v42 = v41;
      if (v59) {
        id *v59 = v41;
      }

LABEL_67:
      int v18 = 0;
      goto LABEL_68;
    }
    if (v59)
    {
      id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F502C8];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      uint64_t v17 = (BMLighthouseLedgerLighthousePluginEventEventStatus *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"stop"];
      v75 = v17;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id *v59 = (id)[v57 initWithDomain:v53 code:2 userInfo:v47];

      goto LABEL_67;
    }
LABEL_78:
    int v18 = 0;
    goto LABEL_69;
  }
  if (a4)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v30 = *MEMORY[0x1E4F502C8];
    uint64_t v86 = *MEMORY[0x1E4F28568];
    v87[0] = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trialIdentifiers"];
    v8 = (BMLighthouseLedgerTrialIdentifiers *)v87[0];
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
    int v18 = 0;
    *a4 = (id)[v29 initWithDomain:v30 code:2 userInfo:v10];
LABEL_76:

    goto LABEL_77;
  }
  int v18 = 0;
LABEL_77:

  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseLedgerLighthousePluginEvent *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_trialIdentifiers)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerTrialIdentifiers *)self->_trialIdentifiers writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_contextID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasUsePrivateUpload) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_performTaskStatus)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self->_performTaskStatus writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_performTrialTaskStatus)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self->_performTrialTaskStatus writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_stop)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerLighthousePluginEventEventStatus *)self->_stop writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMLighthouseLedgerLighthousePluginEvent;
  uint64_t v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_59;
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
      unint64_t v20 = v12 >> 3;
      if ((int)(v12 >> 3) > 100)
      {
        switch(v20)
        {
          case 'e':
            uint64_t v39 = 0;
            uint64_t v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0) {
              goto LABEL_58;
            }
            v21 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initByReadFrom:v4];
            if (!v21) {
              goto LABEL_58;
            }
            uint64_t v22 = 56;
            break;
          case 'f':
            uint64_t v39 = 0;
            uint64_t v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0) {
              goto LABEL_58;
            }
            v21 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initByReadFrom:v4];
            if (!v21) {
              goto LABEL_58;
            }
            uint64_t v22 = 64;
            break;
          case 'g':
            uint64_t v39 = 0;
            uint64_t v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0) {
              goto LABEL_58;
            }
            v21 = [[BMLighthouseLedgerLighthousePluginEventEventStatus alloc] initByReadFrom:v4];
            if (!v21) {
              goto LABEL_58;
            }
            uint64_t v22 = 72;
            break;
          default:
LABEL_48:
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_58;
            }
            continue;
        }
LABEL_47:
        id v35 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = v21;

        PBReaderRecallMark();
      }
      else
      {
        switch((int)v20)
        {
          case 1:
            uint64_t v39 = 0;
            uint64_t v40 = 0;
            if ((PBReaderPlaceMark() & 1) == 0) {
              goto LABEL_58;
            }
            v21 = [[BMLighthouseLedgerTrialIdentifiers alloc] initByReadFrom:v4];
            if (!v21) {
              goto LABEL_58;
            }
            uint64_t v22 = 40;
            goto LABEL_47;
          case 2:
            uint64_t v23 = PBReaderReadString();
            contextID = v5->_contextID;
            v5->_contextID = (NSString *)v23;

            continue;
          case 3:
            v5->_hasRaw_timestamp = 1;
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v7])
            {
              double v27 = *(double *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 8;
            }
            else
            {
              v4[*v8] = 1;
              double v27 = 0.0;
            }
            v5->_raw_timestamp = v27;
            continue;
          case 4:
            char v28 = 0;
            unsigned int v29 = 0;
            uint64_t v30 = 0;
            v5->_hasUsePrivateUpload = 1;
            break;
          default:
            goto LABEL_48;
        }
        while (1)
        {
          uint64_t v31 = *v6;
          uint64_t v32 = *(void *)&v4[v31];
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)&v4[*v7]) {
            break;
          }
          char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
          *(void *)&v4[v31] = v33;
          v30 |= (unint64_t)(v34 & 0x7F) << v28;
          if ((v34 & 0x80) == 0) {
            goto LABEL_51;
          }
          v28 += 7;
          BOOL v17 = v29++ >= 9;
          if (v17)
          {
            uint64_t v30 = 0;
            goto LABEL_53;
          }
        }
        v4[*v8] = 1;
LABEL_51:
        if (v4[*v8]) {
          uint64_t v30 = 0;
        }
LABEL_53:
        v5->_usePrivateUpload = v30 != 0;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_58:
  }
    id v36 = 0;
  else {
LABEL_59:
  }
    id v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseLedgerLighthousePluginEvent *)self trialIdentifiers];
  uint64_t v5 = [(BMLighthouseLedgerLighthousePluginEvent *)self contextID];
  id v6 = [(BMLighthouseLedgerLighthousePluginEvent *)self timestamp];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLighthouseLedgerLighthousePluginEvent usePrivateUpload](self, "usePrivateUpload"));
  v8 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTaskStatus];
  v9 = [(BMLighthouseLedgerLighthousePluginEvent *)self performTrialTaskStatus];
  char v10 = [(BMLighthouseLedgerLighthousePluginEvent *)self stop];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMLighthouseLedgerLighthousePluginEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, usePrivateUpload: %@, performTaskStatus: %@, performTrialTaskStatus: %@, stop: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMLighthouseLedgerLighthousePluginEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 usePrivateUpload:(id)a6 performTaskStatus:(id)a7 performTrialTaskStatus:(id)a8 stop:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a5;
  id v17 = a6;
  id v23 = a7;
  id v18 = a8;
  id v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMLighthouseLedgerLighthousePluginEvent;
  unint64_t v20 = [(BMEventBase *)&v26 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v20->_contextID, a4);
    if (v16)
    {
      v20->_hasRaw_timestamp = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_timestamp = 0;
      double v21 = -1.0;
    }
    v20->_raw_timestamp = v21;
    if (v17)
    {
      v20->_hasUsePrivateUpload = 1;
      v20->_usePrivateUpload = [v17 BOOLValue];
    }
    else
    {
      v20->_hasUsePrivateUpload = 0;
      v20->_usePrivateUpload = 0;
    }
    objc_storeStrong((id *)&v20->_performTaskStatus, a7);
    objc_storeStrong((id *)&v20->_performTrialTaskStatus, a8);
    objc_storeStrong((id *)&v20->_stop, a9);
  }

  return v20;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialIdentifiers" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"contextID", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v11[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usePrivateUpload" number:4 type:12 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"performTaskStatus" number:101 type:14 subMessageClass:objc_opt_class()];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"performTrialTaskStatus" number:102 type:14 subMessageClass:objc_opt_class()];
  v11[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stop" number:103 type:14 subMessageClass:objc_opt_class()];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3F00;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_16125];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usePrivateUpload" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"performTaskStatus_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_179];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"performTrialTaskStatus_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_181];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"stop_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_183];
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

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 stop];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 performTrialTaskStatus];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 performTaskStatus];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __50__BMLighthouseLedgerLighthousePluginEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trialIdentifiers];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMLighthouseLedgerLighthousePluginEvent alloc] initByReadFrom:v7];
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