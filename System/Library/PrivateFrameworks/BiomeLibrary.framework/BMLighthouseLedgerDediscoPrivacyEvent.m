@interface BMLighthouseLedgerDediscoPrivacyEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseLedgerDediscoPrivacyEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseLedgerDediscoPrivacyEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventIdentifier:(id)a6 event:(id)a7;
- (BMLighthouseLedgerDediscoPrivacyEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventIdentifier:(id)a6 event:(id)a7 aggregateFunction:(int)a8 errorCode:(id)a9 count:(id)a10;
- (BMLighthouseLedgerDediscoPrivacyEventEventState)event;
- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (BOOL)hasCount;
- (BOOL)hasErrorCode;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)contextID;
- (NSString)description;
- (NSString)eventIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)aggregateFunction;
- (int)count;
- (int)errorCode;
- (unsigned)dataVersion;
- (void)setHasCount:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseLedgerDediscoPrivacyEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
}

- (void)setHasCount:(BOOL)a3
{
  self->_hasCount = a3;
}

- (BOOL)hasCount
{
  return self->_hasCount;
}

- (int)count
{
  return self->_count;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (BOOL)hasErrorCode
{
  return self->_hasErrorCode;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)aggregateFunction
{
  return self->_aggregateFunction;
}

- (BMLighthouseLedgerDediscoPrivacyEventEventState)event
{
  return self->_event;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
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
    v6 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self trialIdentifiers];
    uint64_t v7 = [v5 trialIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self trialIdentifiers];
      v10 = [v5 trialIdentifiers];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_34;
      }
    }
    v13 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self contextID];
    uint64_t v14 = [v5 contextID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self contextID];
      v17 = [v5 contextID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_34;
      }
    }
    v19 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self timestamp];
    uint64_t v20 = [v5 timestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self timestamp];
      v23 = [v5 timestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_34;
      }
    }
    v25 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self eventIdentifier];
    uint64_t v26 = [v5 eventIdentifier];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self eventIdentifier];
      v29 = [v5 eventIdentifier];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_34;
      }
    }
    v31 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self event];
    uint64_t v32 = [v5 event];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self event];
      v35 = [v5 event];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_34;
      }
    }
    int v37 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self aggregateFunction];
    if (v37 == [v5 aggregateFunction])
    {
      if (![(BMLighthouseLedgerDediscoPrivacyEvent *)self hasErrorCode]
        && ![v5 hasErrorCode]
        || [(BMLighthouseLedgerDediscoPrivacyEvent *)self hasErrorCode]
        && [v5 hasErrorCode]
        && (int v38 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self errorCode],
            v38 == [v5 errorCode]))
      {
        if (![(BMLighthouseLedgerDediscoPrivacyEvent *)self hasCount]
          && ![v5 hasCount])
        {
          BOOL v12 = 1;
          goto LABEL_35;
        }
        if ([(BMLighthouseLedgerDediscoPrivacyEvent *)self hasCount]
          && [v5 hasCount])
        {
          int v39 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self count];
          BOOL v12 = v39 == [v5 count];
LABEL_35:

          goto LABEL_36;
        }
      }
    }
LABEL_34:
    BOOL v12 = 0;
    goto LABEL_35;
  }
  BOOL v12 = 0;
LABEL_36:

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
  v32[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self trialIdentifiers];
  uint64_t v4 = [v3 jsonDictionary];

  uint64_t v5 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self contextID];
  v6 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self timestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self timestamp];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }

  int v30 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self eventIdentifier];
  v10 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self event];
  v29 = [v10 jsonDictionary];

  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent aggregateFunction](self, "aggregateFunction"));
  if ([(BMLighthouseLedgerDediscoPrivacyEvent *)self hasErrorCode])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent errorCode](self, "errorCode"));
  }
  else
  {
    int v11 = 0;
  }
  if ([(BMLighthouseLedgerDediscoPrivacyEvent *)self hasCount])
  {
    BOOL v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent count](self, "count"));
  }
  else
  {
    BOOL v12 = 0;
  }
  v31[0] = @"trialIdentifiers";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v13;
  v32[0] = v13;
  v31[1] = @"contextID";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v14;
  v32[1] = v14;
  v31[2] = @"timestamp";
  uint64_t v15 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v15;
  v32[2] = v15;
  v31[3] = @"eventIdentifier";
  v16 = v30;
  if (!v30)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v4;
  v32[3] = v16;
  v31[4] = @"event";
  v17 = v29;
  if (!v29)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v18 = (void *)v5;
  v32[4] = v17;
  v31[5] = @"aggregateFunction";
  v19 = v28;
  if (!v28)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[5] = v19;
  v31[6] = @"errorCode";
  uint64_t v20 = v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[6] = v20;
  v31[7] = @"count";
  v21 = v12;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[7] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:8];
  if (v12)
  {
    if (v11) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (!v28) {

  }
  if (!v29) {
  if (v30)
  }
  {
    if (v9) {
      goto LABEL_34;
    }
  }
  else
  {

    if (v9)
    {
LABEL_34:
      if (v18) {
        goto LABEL_35;
      }
LABEL_43:

      if (v27) {
        goto LABEL_36;
      }
      goto LABEL_44;
    }
  }

  if (!v18) {
    goto LABEL_43;
  }
LABEL_35:
  if (v27) {
    goto LABEL_36;
  }
LABEL_44:

LABEL_36:

  return v22;
}

- (BMLighthouseLedgerDediscoPrivacyEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"trialIdentifiers"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    id v83 = 0;
    uint64_t v7 = [[BMLighthouseLedgerTrialIdentifiers alloc] initWithJSONDictionary:v9 error:&v83];
    id v12 = v83;
    if (v12)
    {
      uint64_t v13 = v12;
      if (a4) {
        *a4 = v12;
      }

      uint64_t v14 = 0;
      goto LABEL_66;
    }

LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"contextID"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v9 = 0;
          uint64_t v14 = 0;
          goto LABEL_65;
        }
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v96 = *MEMORY[0x1E4F28568];
        v79 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contextID"];
        v97 = v79;
        v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        id v28 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2);
        id v9 = 0;
        uint64_t v14 = 0;
        *a4 = v28;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"timestamp"];
    v77 = (void *)v10;
    id v78 = v9;
    if (v10 && (int v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v16 = v11;
        id v17 = [v15 alloc];
        [v16 doubleValue];
        double v19 = v18;

        id v9 = v78;
        id v20 = (id)[v17 initWithTimeIntervalSince1970:v19];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v79 = [v29 dateFromString:v11];

          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v79 = 0;
            uint64_t v14 = 0;
            goto LABEL_64;
          }
          id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v63 = *MEMORY[0x1E4F502C8];
          uint64_t v94 = *MEMORY[0x1E4F28568];
          id v32 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
          id v95 = v32;
          uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          v65 = v62;
          id v9 = v78;
          v75 = (void *)v64;
          id v66 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v63, 2);
          v79 = 0;
          uint64_t v14 = 0;
          *a4 = v66;
          goto LABEL_63;
        }
        id v20 = v11;
      }
      v79 = v20;
    }
    else
    {
      v79 = 0;
    }
LABEL_26:
    uint64_t v30 = [v5 objectForKeyedSubscript:@"eventIdentifier"];
    v80 = self;
    v75 = (void *)v30;
    if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v32 = 0;
          uint64_t v14 = 0;
          goto LABEL_63;
        }
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v92 = *MEMORY[0x1E4F28568];
        id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventIdentifier"];
        id v93 = v35;
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        v42 = v39;
        id v9 = v78;
        v76 = (BMLighthouseLedgerDediscoPrivacyEventEventState *)v41;
        id v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v40, 2);
        id v32 = 0;
        uint64_t v14 = 0;
        *a4 = v43;
        goto LABEL_61;
      }
      id v32 = v31;
    }
    else
    {
      id v32 = 0;
    }
    v33 = [v5 objectForKeyedSubscript:@"event"];
    v71 = v8;
    if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v14 = 0;
          goto LABEL_62;
        }
        id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        id v45 = v32;
        id v46 = [NSString alloc];
        uint64_t v67 = objc_opt_class();
        v47 = v46;
        id v32 = v45;
        v76 = (BMLighthouseLedgerDediscoPrivacyEventEventState *)[v47 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v67, @"event"];
        v91 = v76;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v9 = v78;
        *a4 = (id)[v73 initWithDomain:v44 code:2 userInfo:v48];

        uint64_t v14 = 0;
        id v35 = v33;
LABEL_61:

        v33 = v35;
LABEL_62:

        self = v80;
LABEL_63:

        goto LABEL_64;
      }
      id v35 = v33;
      id v82 = 0;
      v76 = [[BMLighthouseLedgerDediscoPrivacyEventEventState alloc] initWithJSONDictionary:v35 error:&v82];
      id v36 = v82;
      if (v36)
      {
        int v37 = v36;
        if (a4) {
          *a4 = v36;
        }

        uint64_t v14 = 0;
        id v9 = v78;
        goto LABEL_61;
      }
    }
    else
    {
      v76 = 0;
    }
    v34 = [v5 objectForKeyedSubscript:@"aggregateFunction"];
    id v74 = v32;
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = v34;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v72 = 0;
            uint64_t v14 = 0;
            goto LABEL_60;
          }
          id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v60 = *MEMORY[0x1E4F502C8];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          id v51 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"aggregateFunction"];
          id v89 = v51;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
          id v61 = (id)[v59 initWithDomain:v60 code:2 userInfo:v49];
          v72 = 0;
          uint64_t v14 = 0;
          *a4 = v61;
LABEL_59:

LABEL_60:
          id v35 = v33;
          id v9 = v78;
          id v32 = v74;
          goto LABEL_61;
        }
        id v38 = [NSNumber numberWithInt:BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionFromString(v34)];
      }
      v72 = v38;
    }
    else
    {
      v72 = 0;
    }
    v49 = [v5 objectForKeyedSubscript:@"errorCode"];
    if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v51 = 0;
          uint64_t v14 = 0;
          goto LABEL_59;
        }
        v50 = v7;
        id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        v53 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"errorCode"];
        v87 = v53;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        id v56 = (id)[v69 initWithDomain:v55 code:2 userInfo:v52];
        uint64_t v14 = 0;
        id v51 = 0;
        *a4 = v56;
        goto LABEL_58;
      }
      v50 = v7;
      id v51 = v49;
    }
    else
    {
      v50 = v7;
      id v51 = 0;
    }
    v52 = [v5 objectForKeyedSubscript:@"count"];
    if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v53 = a4;
        if (a4)
        {
          id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v84 = *MEMORY[0x1E4F28568];
          v57 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"count"];
          v85 = v57;
          v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          *a4 = (id)[v70 initWithDomain:v68 code:2 userInfo:v58];

          v53 = 0;
        }
        uint64_t v14 = 0;
        goto LABEL_58;
      }
      v53 = v52;
    }
    else
    {
      v53 = 0;
    }
    uint64_t v14 = -[BMLighthouseLedgerDediscoPrivacyEvent initWithTrialIdentifiers:contextID:timestamp:eventIdentifier:event:aggregateFunction:errorCode:count:](v80, "initWithTrialIdentifiers:contextID:timestamp:eventIdentifier:event:aggregateFunction:errorCode:count:", v50, v78, v79, v74, v76, [v72 intValue], v51, v53);
    v80 = v14;
LABEL_58:

    uint64_t v7 = v50;
    v8 = v71;
    goto LABEL_59;
  }
  if (!a4)
  {
    uint64_t v14 = 0;
    goto LABEL_67;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v98 = *MEMORY[0x1E4F28568];
  v99[0] = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trialIdentifiers"];
  uint64_t v7 = (BMLighthouseLedgerTrialIdentifiers *)v99[0];
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
  int v24 = v21;
  id v9 = (id)v23;
  id v25 = (id)[v24 initWithDomain:v22 code:2 userInfo:v23];
  uint64_t v14 = 0;
  *a4 = v25;
LABEL_66:

LABEL_67:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseLedgerDediscoPrivacyEvent *)self writeTo:v3];
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
  if (self->_eventIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_event)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerDediscoPrivacyEventEventState *)self->_event writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasErrorCode) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasCount) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)BMLighthouseLedgerDediscoPrivacyEvent;
  id v5 = [(BMEventBase *)&v52 init];
  if (!v5) {
    goto LABEL_76;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_75;
          }
          id v20 = [[BMLighthouseLedgerTrialIdentifiers alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_75;
          }
          uint64_t v21 = 56;
          goto LABEL_34;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
          goto LABEL_30;
        case 3u:
          v5->_hasRaw_timestamp = 1;
          uint64_t v24 = *v6;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v7])
          {
            double v26 = *(double *)(*(void *)&v4[*v9] + v25);
            *(void *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v26 = 0.0;
          }
          v5->_raw_timestamp = v26;
          continue;
        case 4u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 72;
LABEL_30:
          uint64_t v27 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 5u:
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_75;
          }
          id v20 = [[BMLighthouseLedgerDediscoPrivacyEventEventState alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_75;
          }
          uint64_t v21 = 80;
LABEL_34:
          id v28 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_59:
          if (v31 >= 4) {
            LODWORD(v31) = 0;
          }
          v5->_aggregateFunction = v31;
          continue;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasErrorCode = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v38) = 0;
          }
LABEL_65:
          uint64_t v49 = 44;
          goto LABEL_70;
        case 8u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v38 = 0;
          v5->_hasCount = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_75;
          }
          continue;
      }
      while (1)
      {
        uint64_t v45 = *v6;
        uint64_t v46 = *(void *)&v4[v45];
        unint64_t v47 = v46 + 1;
        if (v46 == -1 || v47 > *(void *)&v4[*v7]) {
          break;
        }
        char v48 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
        *(void *)&v4[v45] = v47;
        v38 |= (unint64_t)(v48 & 0x7F) << v43;
        if ((v48 & 0x80) == 0) {
          goto LABEL_67;
        }
        v43 += 7;
        BOOL v17 = v44++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_69;
        }
      }
      v4[*v8] = 1;
LABEL_67:
      if (v4[*v8]) {
        LODWORD(v38) = 0;
      }
LABEL_69:
      uint64_t v49 = 48;
LABEL_70:
      *(_DWORD *)((char *)&v5->super.super.isa + v49) = v38;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_75:
  }
    v50 = 0;
  else {
LABEL_76:
  }
    v50 = v5;

  return v50;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self trialIdentifiers];
  id v5 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self contextID];
  v6 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self timestamp];
  uint64_t v7 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self eventIdentifier];
  v8 = [(BMLighthouseLedgerDediscoPrivacyEvent *)self event];
  id v9 = BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionAsString([(BMLighthouseLedgerDediscoPrivacyEvent *)self aggregateFunction]);
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent errorCode](self, "errorCode"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEvent count](self, "count"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMLighthouseLedgerDediscoPrivacyEvent with trialIdentifiers: %@, contextID: %@, timestamp: %@, eventIdentifier: %@, event: %@, aggregateFunction: %@, errorCode: %@, count: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMLighthouseLedgerDediscoPrivacyEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventIdentifier:(id)a6 event:(id)a7 aggregateFunction:(int)a8 errorCode:(id)a9 count:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  v29.receiver = self;
  v29.super_class = (Class)BMLighthouseLedgerDediscoPrivacyEvent;
  uint64_t v21 = [(BMEventBase *)&v29 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_trialIdentifiers, a3);
    objc_storeStrong((id *)&v21->_contextID, a4);
    if (v16)
    {
      v21->_hasRaw_timestamp = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v21->_hasRaw_timestamp = 0;
      double v22 = -1.0;
    }
    v21->_raw_timestamp = v22;
    objc_storeStrong((id *)&v21->_eventIdentifier, a6);
    objc_storeStrong((id *)&v21->_event, a7);
    v21->_aggregateFunction = a8;
    if (v19)
    {
      v21->_hasErrorCode = 1;
      int v23 = [v19 intValue];
    }
    else
    {
      v21->_hasErrorCode = 0;
      int v23 = -1;
    }
    v21->_errorCode = v23;
    if (v20)
    {
      v21->_hasCount = 1;
      int v24 = [v20 intValue];
    }
    else
    {
      v21->_hasCount = 0;
      int v24 = -1;
    }
    v21->_count = v24;
  }

  return v21;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialIdentifiers" number:1 type:14 subMessageClass:objc_opt_class()];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventIdentifier" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"event" number:5 type:14 subMessageClass:objc_opt_class()];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aggregateFunction" number:6 type:4 subMessageClass:0];
  v12[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"errorCode" number:7 type:2 subMessageClass:0];
  v12[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"count" number:8 type:2 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5FA0;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_207_59228];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"event_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_209_59229];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aggregateFunction" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"errorCode" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"count" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
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

id __48__BMLighthouseLedgerDediscoPrivacyEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 event];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMLighthouseLedgerDediscoPrivacyEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trialIdentifiers];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMLighthouseLedgerDediscoPrivacyEvent alloc] initByReadFrom:v7];
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

- (BMLighthouseLedgerDediscoPrivacyEvent)initWithTrialIdentifiers:(id)a3 contextID:(id)a4 timestamp:(id)a5 eventIdentifier:(id)a6 event:(id)a7
{
  return [(BMLighthouseLedgerDediscoPrivacyEvent *)self initWithTrialIdentifiers:a3 contextID:a4 timestamp:a5 eventIdentifier:a6 event:a7 aggregateFunction:0 errorCode:&unk_1F0BF7D58 count:&unk_1F0BF7D58];
}

@end