@interface BMLighthouseLedgerMlruntimedEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseLedgerMlruntimedEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseLedgerMlruntimedEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 activityScheduleStatus:(id)a6 taskFetched:(id)a7 taskScheduled:(id)a8 taskCompleted:(id)a9;
- (BMLighthouseLedgerMlruntimedEventScheduleStatus)activityScheduleStatus;
- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskCompleted;
- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskFetched;
- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskScheduled;
- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)contextID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseLedgerMlruntimedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskCompleted, 0);
  objc_storeStrong((id *)&self->_taskScheduled, 0);
  objc_storeStrong((id *)&self->_taskFetched, 0);
  objc_storeStrong((id *)&self->_activityScheduleStatus, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
}

- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskCompleted
{
  return self->_taskCompleted;
}

- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskScheduled
{
  return self->_taskScheduled;
}

- (BMLighthouseLedgerMlruntimedEventTaskEvent)taskFetched
{
  return self->_taskFetched;
}

- (BMLighthouseLedgerMlruntimedEventScheduleStatus)activityScheduleStatus
{
  return self->_activityScheduleStatus;
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
    v6 = [(BMLighthouseLedgerMlruntimedEvent *)self trialIdentifiers];
    uint64_t v7 = [v5 trialIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLighthouseLedgerMlruntimedEvent *)self trialIdentifiers];
      v10 = [v5 trialIdentifiers];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v13 = [(BMLighthouseLedgerMlruntimedEvent *)self contextID];
    uint64_t v14 = [v5 contextID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLighthouseLedgerMlruntimedEvent *)self contextID];
      v17 = [v5 contextID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_25;
      }
    }
    v19 = [(BMLighthouseLedgerMlruntimedEvent *)self timestamp];
    uint64_t v20 = [v5 timestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMLighthouseLedgerMlruntimedEvent *)self timestamp];
      v23 = [v5 timestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_25;
      }
    }
    v25 = [(BMLighthouseLedgerMlruntimedEvent *)self activityScheduleStatus];
    uint64_t v26 = [v5 activityScheduleStatus];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMLighthouseLedgerMlruntimedEvent *)self activityScheduleStatus];
      v29 = [v5 activityScheduleStatus];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_25;
      }
    }
    v31 = [(BMLighthouseLedgerMlruntimedEvent *)self taskFetched];
    uint64_t v32 = [v5 taskFetched];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMLighthouseLedgerMlruntimedEvent *)self taskFetched];
      v35 = [v5 taskFetched];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_25;
      }
    }
    v37 = [(BMLighthouseLedgerMlruntimedEvent *)self taskScheduled];
    uint64_t v38 = [v5 taskScheduled];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMLighthouseLedgerMlruntimedEvent *)self taskScheduled];
      v41 = [v5 taskScheduled];
      int v42 = [v40 isEqual:v41];

      if (!v42)
      {
LABEL_25:
        char v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v44 = [(BMLighthouseLedgerMlruntimedEvent *)self taskCompleted];
    v45 = [v5 taskCompleted];
    if (v44 == v45)
    {
      char v12 = 1;
    }
    else
    {
      v46 = [(BMLighthouseLedgerMlruntimedEvent *)self taskCompleted];
      v47 = [v5 taskCompleted];
      char v12 = [v46 isEqual:v47];
    }
    goto LABEL_26;
  }
  char v12 = 0;
LABEL_27:

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
  v33[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLighthouseLedgerMlruntimedEvent *)self trialIdentifiers];
  uint64_t v4 = [v3 jsonDictionary];

  uint64_t v5 = [(BMLighthouseLedgerMlruntimedEvent *)self contextID];
  v6 = [(BMLighthouseLedgerMlruntimedEvent *)self timestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMLighthouseLedgerMlruntimedEvent *)self timestamp];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }

  v10 = [(BMLighthouseLedgerMlruntimedEvent *)self activityScheduleStatus];
  int v11 = [v10 jsonDictionary];

  char v12 = [(BMLighthouseLedgerMlruntimedEvent *)self taskFetched];
  v13 = [v12 jsonDictionary];

  uint64_t v14 = [(BMLighthouseLedgerMlruntimedEvent *)self taskScheduled];
  v15 = [v14 jsonDictionary];

  v16 = [(BMLighthouseLedgerMlruntimedEvent *)self taskCompleted];
  v17 = [v16 jsonDictionary];

  v32[0] = @"trialIdentifiers";
  uint64_t v18 = v4;
  if (!v4)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v18;
  v33[0] = v18;
  v32[1] = @"contextID";
  uint64_t v19 = v5;
  if (!v5)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v19;
  v33[1] = v19;
  v32[2] = @"timestamp";
  uint64_t v20 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v4;
  v27 = (void *)v20;
  v33[2] = v20;
  v32[3] = @"activityScheduleStatus";
  v21 = v11;
  if (!v11)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v5;
  v33[3] = v21;
  v32[4] = @"taskFetched";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[4] = v22;
  v32[5] = @"taskScheduled";
  v23 = v15;
  if (!v15)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[5] = v23;
  v32[6] = @"taskCompleted";
  int v24 = v17;
  if (!v17)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[6] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:7];
  if (v17)
  {
    if (v15) {
      goto LABEL_20;
    }
LABEL_30:

    if (v13) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }

  if (!v15) {
    goto LABEL_30;
  }
LABEL_20:
  if (v13) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v11) {

  }
  if (v9)
  {
    if (v30) {
      goto LABEL_25;
    }
LABEL_33:

    if (v31) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v30) {
    goto LABEL_33;
  }
LABEL_25:
  if (v31) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v25;
}

- (BMLighthouseLedgerMlruntimedEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v108[1] = *MEMORY[0x1E4F143B8];
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
    id v94 = 0;
    v8 = [[BMLighthouseLedgerTrialIdentifiers alloc] initWithJSONDictionary:v10 error:&v94];
    id v12 = v94;
    if (v12)
    {
      v13 = v12;
      if (a4) {
        *a4 = v12;
      }

      uint64_t v14 = 0;
      goto LABEL_83;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"contextID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          uint64_t v14 = 0;
LABEL_82:

          goto LABEL_83;
        }
        v23 = a4;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        v25 = v9;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v105 = *MEMORY[0x1E4F28568];
        id v89 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contextID"];
        id v106 = v89;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        uint64_t v28 = v26;
        v9 = v25;
        id v10 = 0;
        uint64_t v14 = 0;
        id *v23 = (id)[v24 initWithDomain:v28 code:2 userInfo:v27];
        int v11 = (void *)v27;
LABEL_81:

        goto LABEL_82;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"timestamp"];
    v87 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v79 = v7;
      v15 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v17 = v11;
        id v18 = [v16 alloc];
        [v17 doubleValue];
        double v20 = v19;

        id v89 = (id)[v18 initWithTimeIntervalSince1970:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v89 = [v29 dateFromString:v11];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v89 = 0;
              uint64_t v14 = 0;
              uint64_t v7 = v79;
              goto LABEL_81;
            }
            id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
            v66 = v9;
            uint64_t v67 = *MEMORY[0x1E4F502C8];
            uint64_t v103 = *MEMORY[0x1E4F28568];
            id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
            id v104 = v38;
            uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
            uint64_t v69 = v67;
            v9 = v66;
            v86 = (BMLighthouseLedgerMlruntimedEventScheduleStatus *)v68;
            id v89 = 0;
            uint64_t v14 = 0;
            *a4 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v69, 2);
            goto LABEL_91;
          }
          id v89 = v11;
        }
      }
      a4 = v15;
      uint64_t v7 = v79;
    }
    else
    {
      id v89 = 0;
    }
    int v30 = [v6 objectForKeyedSubscript:@"activityScheduleStatus"];
    v88 = self;
    if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v86 = 0;
LABEL_33:
      v31 = [v6 objectForKeyedSubscript:@"taskFetched"];
      id v85 = v10;
      if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v14 = 0;
            goto LABEL_77;
          }
          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v99 = *MEMORY[0x1E4F28568];
          v82 = v7;
          v58 = v11;
          v59 = a4;
          v83 = (BMLighthouseLedgerMlruntimedEventTaskEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"taskFetched"];
          v100 = v83;
          id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          id v60 = (id)[v78 initWithDomain:v57 code:2 userInfo:v32];
          uint64_t v14 = 0;
          id *v59 = v60;
          int v11 = v58;
          uint64_t v7 = v82;
          goto LABEL_75;
        }
        v77 = a4;
        id v32 = v31;
        id v92 = 0;
        v83 = [[BMLighthouseLedgerMlruntimedEventTaskEvent alloc] initWithJSONDictionary:v32 error:&v92];
        id v41 = v92;
        if (v41)
        {
          int v42 = v41;
          if (v77) {
            id *v77 = v41;
          }

          uint64_t v14 = 0;
          goto LABEL_75;
        }
      }
      else
      {
        v77 = a4;
        v83 = 0;
      }
      id v32 = [v6 objectForKeyedSubscript:@"taskScheduled"];
      v75 = v9;
      if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v81 = v7;
          v56 = v11;
          if (!v77)
          {
            uint64_t v14 = 0;
            uint64_t v7 = v81;
            goto LABEL_76;
          }
          id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v97 = *MEMORY[0x1E4F28568];
          v33 = (BMLighthouseLedgerMlruntimedEventTaskEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"taskScheduled"];
          v98 = v33;
          id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          id v62 = (id)[v73 initWithDomain:v61 code:2 userInfo:v34];
          uint64_t v14 = 0;
          id *v77 = v62;
          goto LABEL_96;
        }
        id v34 = v32;
        id v91 = 0;
        v33 = [[BMLighthouseLedgerMlruntimedEventTaskEvent alloc] initWithJSONDictionary:v34 error:&v91];
        id v43 = v91;
        if (v43)
        {
          v44 = v43;
          if (v77) {
            id *v77 = v43;
          }

          uint64_t v14 = 0;
          goto LABEL_74;
        }
      }
      else
      {
        v33 = 0;
      }
      id v34 = [v6 objectForKeyedSubscript:@"taskCompleted"];
      if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v35 = 0;
LABEL_42:
        uint64_t v14 = [(BMLighthouseLedgerMlruntimedEvent *)v88 initWithTrialIdentifiers:v87 contextID:v85 timestamp:v89 activityScheduleStatus:v86 taskFetched:v83 taskScheduled:v33 taskCompleted:v35];
        v88 = v14;
LABEL_73:

LABEL_74:
        v9 = v75;
LABEL_75:
        id v10 = v85;
LABEL_76:

LABEL_77:
LABEL_78:
        id v38 = v30;
        self = v88;
LABEL_79:

        int v30 = v38;
LABEL_80:

        v8 = v87;
        goto LABEL_81;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v90 = 0;
        id v72 = v34;
        v35 = [[BMLighthouseLedgerMlruntimedEventTaskEvent alloc] initWithJSONDictionary:v72 error:&v90];
        id v54 = v90;
        if (!v54)
        {

          goto LABEL_42;
        }
        v55 = v54;
        v81 = v7;
        v56 = v11;
        if (v77) {
          id *v77 = v54;
        }

LABEL_72:
        uint64_t v14 = 0;
        int v11 = v56;
        uint64_t v7 = v81;
        goto LABEL_73;
      }
      v81 = v7;
      v56 = v11;
      if (v77)
      {
        id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v71 = *MEMORY[0x1E4F502C8];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        v35 = (BMLighthouseLedgerMlruntimedEventTaskEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"taskCompleted"];
        v96 = v35;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        id *v77 = (id)[v74 initWithDomain:v71 code:2 userInfo:v63];

        goto LABEL_72;
      }
      uint64_t v14 = 0;
LABEL_96:
      int v11 = v56;
      uint64_t v7 = v81;
      goto LABEL_74;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        uint64_t v14 = 0;
        goto LABEL_80;
      }
      id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
      v45 = v9;
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v101 = *MEMORY[0x1E4F28568];
      v80 = v7;
      v47 = v11;
      v48 = a4;
      id v49 = v10;
      id v50 = [NSString alloc];
      uint64_t v70 = objc_opt_class();
      v51 = v50;
      id v10 = v49;
      v86 = (BMLighthouseLedgerMlruntimedEventScheduleStatus *)[v51 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v70, @"activityScheduleStatus"];
      v102 = v86;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      uint64_t v53 = v46;
      v9 = v45;
      id *v48 = (id)[v84 initWithDomain:v53 code:2 userInfo:v52];
      int v11 = v47;
      uint64_t v7 = v80;

      uint64_t v14 = 0;
      goto LABEL_78;
    }
    v79 = v7;
    int v36 = v11;
    v37 = a4;
    id v38 = v30;
    id v93 = 0;
    v86 = [[BMLighthouseLedgerMlruntimedEventScheduleStatus alloc] initWithJSONDictionary:v38 error:&v93];
    id v39 = v93;
    if (!v39)
    {

      int v11 = v36;
      uint64_t v7 = v79;
      goto LABEL_33;
    }
    v40 = v39;
    if (v37) {
      id *v37 = v39;
    }

    uint64_t v14 = 0;
    int v11 = v36;
LABEL_91:
    uint64_t v7 = v79;
    goto LABEL_79;
  }
  if (a4)
  {
    v76 = a4;
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F502C8];
    uint64_t v107 = *MEMORY[0x1E4F28568];
    v8 = (BMLighthouseLedgerTrialIdentifiers *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trialIdentifiers"];
    v108[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:&v107 count:1];
    uint64_t v14 = 0;
    id *v76 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
LABEL_83:

    goto LABEL_84;
  }
  uint64_t v14 = 0;
LABEL_84:

  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseLedgerMlruntimedEvent *)self writeTo:v3];
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
  if (self->_activityScheduleStatus)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerMlruntimedEventScheduleStatus *)self->_activityScheduleStatus writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_taskFetched)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerMlruntimedEventTaskEvent *)self->_taskFetched writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_taskScheduled)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerMlruntimedEventTaskEvent *)self->_taskScheduled writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_taskCompleted)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerMlruntimedEventTaskEvent *)self->_taskCompleted writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMLighthouseLedgerMlruntimedEvent;
  uint64_t v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_52;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v8]) {
        goto LABEL_50;
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
        goto LABEL_50;
      }
      unint64_t v20 = v12 >> 3;
      if ((int)(v12 >> 3) > 100) {
        break;
      }
      switch(v20)
      {
        case 1:
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_51;
          }
          id v21 = [[BMLighthouseLedgerTrialIdentifiers alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_51;
          }
          uint64_t v22 = 40;
          goto LABEL_42;
        case 2:
          uint64_t v27 = PBReaderReadString();
          contextID = v5->_contextID;
          v5->_contextID = (NSString *)v27;

          break;
        case 3:
          v5->_hasRaw_timestamp = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            double v25 = *(double *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v25 = 0.0;
          }
          v5->_raw_timestamp = v25;
          break;
        default:
LABEL_45:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_51;
          }
          break;
      }
LABEL_43:
      if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
        goto LABEL_50;
      }
    }
    switch((int)v20)
    {
      case 'e':
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_51;
        }
        id v21 = [[BMLighthouseLedgerMlruntimedEventScheduleStatus alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_51;
        }
        uint64_t v22 = 56;
        break;
      case 'f':
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_51;
        }
        id v21 = [[BMLighthouseLedgerMlruntimedEventTaskEvent alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_51;
        }
        uint64_t v22 = 64;
        break;
      case 'g':
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_51;
        }
        id v21 = [[BMLighthouseLedgerMlruntimedEventTaskEvent alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_51;
        }
        uint64_t v22 = 72;
        break;
      case 'h':
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_51;
        }
        id v21 = [[BMLighthouseLedgerMlruntimedEventTaskEvent alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_51;
        }
        uint64_t v22 = 80;
        break;
      default:
        goto LABEL_45;
    }
LABEL_42:
    uint64_t v26 = *(Class *)((char *)&v5->super.super.isa + v22);
    *(Class *)((char *)&v5->super.super.isa + v22) = v21;

    PBReaderRecallMark();
    goto LABEL_43;
  }
LABEL_50:
  if (v4[*v8]) {
LABEL_51:
  }
    id v29 = 0;
  else {
LABEL_52:
  }
    id v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseLedgerMlruntimedEvent *)self trialIdentifiers];
  uint64_t v5 = [(BMLighthouseLedgerMlruntimedEvent *)self contextID];
  id v6 = [(BMLighthouseLedgerMlruntimedEvent *)self timestamp];
  uint64_t v7 = [(BMLighthouseLedgerMlruntimedEvent *)self activityScheduleStatus];
  v8 = [(BMLighthouseLedgerMlruntimedEvent *)self taskFetched];
  v9 = [(BMLighthouseLedgerMlruntimedEvent *)self taskScheduled];
  char v10 = [(BMLighthouseLedgerMlruntimedEvent *)self taskCompleted];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMLighthouseLedgerMlruntimedEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, activityScheduleStatus: %@, taskFetched: %@, taskScheduled: %@, taskCompleted: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMLighthouseLedgerMlruntimedEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 activityScheduleStatus:(id)a6 taskFetched:(id)a7 taskScheduled:(id)a8 taskCompleted:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMLighthouseLedgerMlruntimedEvent;
  double v19 = [(BMEventBase *)&v26 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v22, v23, v24, v25);
    objc_storeStrong((id *)&v19->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v19->_contextID, a4);
    if (v16)
    {
      v19->_hasRaw_timestamp = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v19->_hasRaw_timestamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_timestamp = v20;
    objc_storeStrong((id *)&v19->_activityScheduleStatus, a6);
    objc_storeStrong((id *)&v19->_taskFetched, a7);
    objc_storeStrong((id *)&v19->_taskScheduled, a8);
    objc_storeStrong((id *)&v19->_taskCompleted, a9);
  }

  return v19;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialIdentifiers" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"contextID", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v11[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityScheduleStatus" number:101 type:14 subMessageClass:objc_opt_class()];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskFetched" number:102 type:14 subMessageClass:objc_opt_class()];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskScheduled" number:103 type:14 subMessageClass:objc_opt_class()];
  v11[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskCompleted" number:104 type:14 subMessageClass:objc_opt_class()];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6018;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_59849];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"activityScheduleStatus_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_207_59850];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"taskFetched_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_209_59851];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"taskScheduled_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_211];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"taskCompleted_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_213];
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

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 taskCompleted];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 taskScheduled];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 taskFetched];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 activityScheduleStatus];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMLighthouseLedgerMlruntimedEvent_columns__block_invoke(uint64_t a1, void *a2)
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

    v8 = [[BMLighthouseLedgerMlruntimedEvent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end