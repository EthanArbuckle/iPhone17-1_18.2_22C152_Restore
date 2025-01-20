@interface BMMotionActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMotionActivity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMotionActivity)initWithStationary:(id)a3 walking:(id)a4 running:(id)a5 automotive:(id)a6 cycling:(id)a7 unknown:(id)a8 startDate:(id)a9 confidence:(int)a10;
- (BOOL)automotive;
- (BOOL)cycling;
- (BOOL)hasAutomotive;
- (BOOL)hasCycling;
- (BOOL)hasRunning;
- (BOOL)hasStationary;
- (BOOL)hasUnknown;
- (BOOL)hasWalking;
- (BOOL)isEqual:(id)a3;
- (BOOL)running;
- (BOOL)stationary;
- (BOOL)unknown;
- (BOOL)walking;
- (NSDate)startDate;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)confidence;
- (unsigned)dataVersion;
- (void)setHasAutomotive:(BOOL)a3;
- (void)setHasCycling:(BOOL)a3;
- (void)setHasRunning:(BOOL)a3;
- (void)setHasStationary:(BOOL)a3;
- (void)setHasUnknown:(BOOL)a3;
- (void)setHasWalking:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMotionActivity

- (int)confidence
{
  return self->_confidence;
}

- (void)setHasUnknown:(BOOL)a3
{
  self->_hasUnknown = a3;
}

- (BOOL)hasUnknown
{
  return self->_hasUnknown;
}

- (BOOL)unknown
{
  return self->_unknown;
}

- (void)setHasCycling:(BOOL)a3
{
  self->_hasCycling = a3;
}

- (BOOL)hasCycling
{
  return self->_hasCycling;
}

- (BOOL)cycling
{
  return self->_cycling;
}

- (void)setHasAutomotive:(BOOL)a3
{
  self->_hasAutomotive = a3;
}

- (BOOL)hasAutomotive
{
  return self->_hasAutomotive;
}

- (BOOL)automotive
{
  return self->_automotive;
}

- (void)setHasRunning:(BOOL)a3
{
  self->_hasRunning = a3;
}

- (BOOL)hasRunning
{
  return self->_hasRunning;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setHasWalking:(BOOL)a3
{
  self->_hasWalking = a3;
}

- (BOOL)hasWalking
{
  return self->_hasWalking;
}

- (BOOL)walking
{
  return self->_walking;
}

- (void)setHasStationary:(BOOL)a3
{
  self->_hasStationary = a3;
}

- (BOOL)hasStationary
{
  return self->_hasStationary;
}

- (BOOL)stationary
{
  return self->_stationary;
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
    BOOL v18 = 0;
    goto LABEL_37;
  }
  id v5 = v4;
  if (-[BMMotionActivity hasStationary](self, "hasStationary") || [v5 hasStationary])
  {
    if (![(BMMotionActivity *)self hasStationary]) {
      goto LABEL_34;
    }
    if (![v5 hasStationary]) {
      goto LABEL_34;
    }
    int v6 = [(BMMotionActivity *)self stationary];
    if (v6 != [v5 stationary]) {
      goto LABEL_34;
    }
  }
  if (-[BMMotionActivity hasWalking](self, "hasWalking") || [v5 hasWalking])
  {
    if (![(BMMotionActivity *)self hasWalking]) {
      goto LABEL_34;
    }
    if (![v5 hasWalking]) {
      goto LABEL_34;
    }
    int v7 = [(BMMotionActivity *)self walking];
    if (v7 != [v5 walking]) {
      goto LABEL_34;
    }
  }
  if (-[BMMotionActivity hasRunning](self, "hasRunning") || [v5 hasRunning])
  {
    if (![(BMMotionActivity *)self hasRunning]) {
      goto LABEL_34;
    }
    if (![v5 hasRunning]) {
      goto LABEL_34;
    }
    int v8 = [(BMMotionActivity *)self running];
    if (v8 != [v5 running]) {
      goto LABEL_34;
    }
  }
  if (-[BMMotionActivity hasAutomotive](self, "hasAutomotive") || [v5 hasAutomotive])
  {
    if (![(BMMotionActivity *)self hasAutomotive]) {
      goto LABEL_34;
    }
    if (![v5 hasAutomotive]) {
      goto LABEL_34;
    }
    int v9 = [(BMMotionActivity *)self automotive];
    if (v9 != [v5 automotive]) {
      goto LABEL_34;
    }
  }
  if (-[BMMotionActivity hasCycling](self, "hasCycling") || [v5 hasCycling])
  {
    if (![(BMMotionActivity *)self hasCycling]) {
      goto LABEL_34;
    }
    if (![v5 hasCycling]) {
      goto LABEL_34;
    }
    int v10 = [(BMMotionActivity *)self cycling];
    if (v10 != [v5 cycling]) {
      goto LABEL_34;
    }
  }
  if (-[BMMotionActivity hasUnknown](self, "hasUnknown") || [v5 hasUnknown])
  {
    if (![(BMMotionActivity *)self hasUnknown]) {
      goto LABEL_34;
    }
    if (![v5 hasUnknown]) {
      goto LABEL_34;
    }
    int v11 = [(BMMotionActivity *)self unknown];
    if (v11 != [v5 unknown]) {
      goto LABEL_34;
    }
  }
  v12 = [(BMMotionActivity *)self startDate];
  uint64_t v13 = [v5 startDate];
  if (v12 == (void *)v13)
  {

    goto LABEL_39;
  }
  v14 = (void *)v13;
  v15 = [(BMMotionActivity *)self startDate];
  v16 = [v5 startDate];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
LABEL_39:
    int v20 = [(BMMotionActivity *)self confidence];
    BOOL v18 = v20 == [v5 confidence];
    goto LABEL_35;
  }
LABEL_34:
  BOOL v18 = 0;
LABEL_35:

LABEL_37:
  return v18;
}

- (NSDate)startDate
{
  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startDate];
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
  v31[8] = *MEMORY[0x1E4F143B8];
  if ([(BMMotionActivity *)self hasStationary])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity stationary](self, "stationary"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMMotionActivity *)self hasWalking])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity walking](self, "walking"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMMotionActivity *)self hasRunning])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity running](self, "running"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(BMMotionActivity *)self hasAutomotive])
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity automotive](self, "automotive"));
  }
  else
  {
    v29 = 0;
  }
  if ([(BMMotionActivity *)self hasCycling])
  {
    v28 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity cycling](self, "cycling"));
  }
  else
  {
    v28 = 0;
  }
  if ([(BMMotionActivity *)self hasUnknown])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity unknown](self, "unknown"));
  }
  else
  {
    int v6 = 0;
  }
  int v7 = [(BMMotionActivity *)self startDate];
  if (v7)
  {
    int v8 = NSNumber;
    int v9 = [(BMMotionActivity *)self startDate];
    [v9 timeIntervalSince1970];
    int v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    int v10 = 0;
  }

  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMotionActivity confidence](self, "confidence"));
  v30[0] = @"stationary";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v12;
  v31[0] = v12;
  v30[1] = @"walking";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v13;
  v31[1] = v13;
  v30[2] = @"running";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v3;
  v23 = (void *)v14;
  v31[2] = v14;
  v30[3] = @"automotive";
  v15 = v29;
  if (!v29)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v4;
  v31[3] = v15;
  v30[4] = @"cycling";
  v16 = v28;
  if (!v28)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v17 = (void *)v5;
  v31[4] = v16;
  v30[5] = @"unknown";
  BOOL v18 = v6;
  if (!v6)
  {
    BOOL v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[5] = v18;
  v30[6] = @"startDate";
  v19 = v10;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v19;
  v30[7] = @"confidence";
  int v20 = v11;
  if (!v11)
  {
    int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[7] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];
  if (v11)
  {
    if (v10) {
      goto LABEL_40;
    }
LABEL_52:

    if (v6) {
      goto LABEL_41;
    }
    goto LABEL_53;
  }

  if (!v10) {
    goto LABEL_52;
  }
LABEL_40:
  if (v6) {
    goto LABEL_41;
  }
LABEL_53:

LABEL_41:
  if (!v28) {

  }
  if (!v29) {
  if (v17)
  }
  {
    if (v26) {
      goto LABEL_47;
    }
LABEL_55:

    if (v27) {
      goto LABEL_48;
    }
    goto LABEL_56;
  }

  if (!v26) {
    goto LABEL_55;
  }
LABEL_47:
  if (v27) {
    goto LABEL_48;
  }
LABEL_56:

LABEL_48:

  return v21;
}

- (BMMotionActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v114[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"stationary"];
  v98 = v6;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    int v9 = [v6 objectForKeyedSubscript:@"walking"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v31 = 0;
          goto LABEL_70;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        v33 = a4;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v111 = *MEMORY[0x1E4F28568];
        v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"walking"];
        v112 = v35;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        id v36 = (id)[v32 initWithDomain:v34 code:2 userInfo:v11];
        id v10 = 0;
        v31 = 0;
        id *v33 = v36;
        goto LABEL_69;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"running"];
    v97 = self;
    id v94 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v31 = 0;
          goto LABEL_69;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        v44 = a4;
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v109 = *MEMORY[0x1E4F28568];
        id v46 = v8;
        id v47 = [NSString alloc];
        uint64_t v82 = objc_opt_class();
        v48 = v47;
        id v8 = v46;
        id v95 = (id)[v48 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v82, @"running"];
        id v110 = v95;
        uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
        v50 = v43;
        id v10 = v94;
        uint64_t v51 = v45;
        v52 = (void *)v49;
        v35 = 0;
        v31 = 0;
        id *v44 = (id)[v50 initWithDomain:v51 code:2 userInfo:v49];
LABEL_68:

LABEL_69:
        goto LABEL_70;
      }
      v25 = v7;
      uint64_t v13 = v9;
      uint64_t v14 = v25;
      v15 = v11;
      id v93 = v11;
    }
    else
    {
      uint64_t v12 = v7;
      uint64_t v13 = v9;
      uint64_t v14 = v12;
      v15 = v11;
      id v93 = 0;
    }
    uint64_t v16 = [v6 objectForKeyedSubscript:@"automotive"];
    v92 = (void *)v16;
    v90 = v14;
    if (v16 && (int v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v95 = 0;
          v31 = 0;
          v52 = v92;
          v35 = v93;
          int v11 = v15;
          v76 = v14;
          int v9 = v13;
          int v7 = v76;
          self = v97;
          goto LABEL_68;
        }
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        v54 = a4;
        uint64_t v96 = *MEMORY[0x1E4F502C8];
        uint64_t v107 = *MEMORY[0x1E4F28568];
        id v55 = v8;
        uint64_t v56 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"automotive"];
        uint64_t v108 = v56;
        uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        v58 = v53;
        id v10 = v94;
        v91 = (void *)v57;
        id v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v96, 2);
        id v95 = 0;
        v31 = 0;
        id *v54 = v59;
        v35 = v93;
        int v11 = v15;
        int v9 = v13;
        self = v97;
        v60 = (void *)v56;
        id v8 = v55;
        goto LABEL_67;
      }
      id v95 = v17;
    }
    else
    {
      id v95 = 0;
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"cycling"];
    int v11 = v15;
    v91 = (void *)v18;
    if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      int v9 = v13;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v97;
        if (!a4)
        {
          v60 = 0;
          v31 = 0;
          goto LABEL_66;
        }
        id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v62 = v8;
        uint64_t v63 = *MEMORY[0x1E4F502C8];
        uint64_t v105 = *MEMORY[0x1E4F28568];
        v64 = a4;
        v65 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cycling"];
        v106 = v65;
        uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        v67 = v61;
        id v10 = v94;
        uint64_t v68 = v63;
        id v8 = v62;
        v88 = (void *)v66;
        v60 = 0;
        v31 = 0;
        id *v64 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2);
LABEL_65:

LABEL_66:
        v35 = v93;
LABEL_67:

        v52 = v92;
        int v7 = v90;
        goto LABEL_68;
      }
      v86 = a4;
      id v87 = v19;
    }
    else
    {
      v86 = a4;
      id v87 = 0;
      int v9 = v13;
    }
    self = v97;
    uint64_t v20 = [v98 objectForKeyedSubscript:@"unknown"];
    v88 = (void *)v20;
    id v89 = v8;
    if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          v65 = 0;
          v31 = 0;
          v60 = v87;
          goto LABEL_65;
        }
        id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v70 = *MEMORY[0x1E4F502C8];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"unknown"];
        v104 = v24;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        v65 = 0;
        v31 = 0;
        id *v86 = (id)[v69 initWithDomain:v70 code:2 userInfo:v23];
        goto LABEL_49;
      }
      id v22 = v21;
    }
    else
    {
      id v22 = 0;
    }
    v23 = [v98 objectForKeyedSubscript:@"startDate"];
    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v24 = 0;
LABEL_53:
      v72 = [v98 objectForKeyedSubscript:@"confidence"];
      if (v72)
      {
        objc_opt_class();
        v60 = v87;
        if (objc_opt_isKindOfClass())
        {
          v73 = 0;
        }
        else
        {
          v65 = v22;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v74 = v72;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v86)
              {
                id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v84 = *MEMORY[0x1E4F502C8];
                uint64_t v99 = *MEMORY[0x1E4F28568];
                v77 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"confidence"];
                v100 = v77;
                v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                id *v86 = (id)[v85 initWithDomain:v84 code:2 userInfo:v78];
              }
              v73 = 0;
              v31 = 0;
              goto LABEL_63;
            }
            id v74 = [NSNumber numberWithInt:BMMotionActivityConfidenceFromString(v72)];
          }
          v73 = v74;
        }
      }
      else
      {
        v73 = 0;
        v60 = v87;
      }
      LODWORD(v83) = [v73 intValue];
      v65 = v22;
      v31 = [(BMMotionActivity *)v97 initWithStationary:v89 walking:v94 running:v93 automotive:v95 cycling:v60 unknown:v22 startDate:v24 confidence:v83];
      v97 = v31;
LABEL_63:

      goto LABEL_64;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v38 = v23;
      id v39 = [v37 alloc];
      [v38 doubleValue];
      double v41 = v40;

      id v42 = (id)[v39 initWithTimeIntervalSince1970:v41];
LABEL_40:
      v24 = v42;
      goto LABEL_53;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v71 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      v24 = [v71 dateFromString:v23];

      goto LABEL_53;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = v23;
      goto LABEL_40;
    }
    v65 = v22;
    if (v86)
    {
      id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v80 = *MEMORY[0x1E4F502C8];
      uint64_t v101 = *MEMORY[0x1E4F28568];
      v73 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
      v102 = v73;
      v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      id v81 = (id)[v79 initWithDomain:v80 code:2 userInfo:v72];
      v24 = 0;
      v31 = 0;
      id *v86 = v81;
      v60 = v87;
      goto LABEL_63;
    }
    v24 = 0;
    v31 = 0;
LABEL_49:
    v60 = v87;
LABEL_64:

    self = v97;
    id v8 = v89;
    id v10 = v94;
    goto LABEL_65;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    v27 = a4;
    uint64_t v28 = *MEMORY[0x1E4F502C8];
    uint64_t v113 = *MEMORY[0x1E4F28568];
    uint64_t v29 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stationary"];
    v114[0] = v29;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:&v113 count:1];
    v30 = v26;
    id v10 = (id)v29;
    id v8 = 0;
    v31 = 0;
    id *v27 = (id)[v30 initWithDomain:v28 code:2 userInfo:v9];
LABEL_70:

    goto LABEL_71;
  }
  id v8 = 0;
  v31 = 0;
LABEL_71:

  return v31;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMotionActivity *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasStationary) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasWalking) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRunning) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAutomotive) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCycling) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasUnknown) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BMMotionActivity;
  uint64_t v5 = [(BMEventBase *)&v76 init];
  if (!v5) {
    goto LABEL_111;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasStationary = 1;
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
              goto LABEL_75;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_77;
            }
          }
          v4[*v8] = 1;
LABEL_75:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_77:
          BOOL v72 = v22 != 0;
          uint64_t v73 = 32;
          goto LABEL_98;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasWalking = 1;
          while (2)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  uint64_t v29 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v29 = 0;
          }
LABEL_81:
          BOOL v72 = v29 != 0;
          uint64_t v73 = 34;
          goto LABEL_98;
        case 3u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasRunning = 1;
          while (2)
          {
            uint64_t v37 = *v6;
            uint64_t v38 = *(void *)&v4[v37];
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
              *(void *)&v4[v37] = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if (v40 < 0)
              {
                v34 += 7;
                BOOL v17 = v35++ >= 9;
                if (v17)
                {
                  uint64_t v36 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v36 = 0;
          }
LABEL_85:
          BOOL v72 = v36 != 0;
          uint64_t v73 = 36;
          goto LABEL_98;
        case 4u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          v5->_hasAutomotive = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                BOOL v17 = v42++ >= 9;
                if (v17)
                {
                  uint64_t v43 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v43 = 0;
          }
LABEL_89:
          BOOL v72 = v43 != 0;
          uint64_t v73 = 38;
          goto LABEL_98;
        case 5u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasCycling = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  uint64_t v50 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v50 = 0;
          }
LABEL_93:
          BOOL v72 = v50 != 0;
          uint64_t v73 = 40;
          goto LABEL_98;
        case 6u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          v5->_hasUnknown = 1;
          while (2)
          {
            uint64_t v58 = *v6;
            uint64_t v59 = *(void *)&v4[v58];
            unint64_t v60 = v59 + 1;
            if (v59 == -1 || v60 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
              *(void *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                BOOL v17 = v56++ >= 9;
                if (v17)
                {
                  uint64_t v57 = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_97:
          BOOL v72 = v57 != 0;
          uint64_t v73 = 42;
LABEL_98:
          *((unsigned char *)&v5->super.super.isa + v73) = v72;
          continue;
        case 7u:
          v5->_hasRaw_startDate = 1;
          uint64_t v62 = *v6;
          unint64_t v63 = *(void *)&v4[v62];
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(void *)&v4[*v7])
          {
            double v64 = *(double *)(*(void *)&v4[*v9] + v63);
            *(void *)&v4[v62] = v63 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v64 = 0.0;
          }
          v5->_raw_startDate = v64;
          continue;
        case 8u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_110;
          }
          continue;
      }
      while (1)
      {
        uint64_t v68 = *v6;
        uint64_t v69 = *(void *)&v4[v68];
        unint64_t v70 = v69 + 1;
        if (v69 == -1 || v70 > *(void *)&v4[*v7]) {
          break;
        }
        char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v69);
        *(void *)&v4[v68] = v70;
        v67 |= (unint64_t)(v71 & 0x7F) << v65;
        if ((v71 & 0x80) == 0) {
          goto LABEL_102;
        }
        v65 += 7;
        BOOL v17 = v66++ >= 9;
        if (v17)
        {
          LODWORD(v67) = 0;
          goto LABEL_104;
        }
      }
      v4[*v8] = 1;
LABEL_102:
      if (v4[*v8]) {
        LODWORD(v67) = 0;
      }
LABEL_104:
      if (v67 >= 4) {
        LODWORD(v67) = 0;
      }
      v5->_confidence = v67;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_110:
  }
    id v74 = 0;
  else {
LABEL_111:
  }
    id v74 = v5;

  return v74;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity stationary](self, "stationary"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity walking](self, "walking"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity running](self, "running"));
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity automotive](self, "automotive"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity cycling](self, "cycling"));
  int v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMotionActivity unknown](self, "unknown"));
  char v10 = [(BMMotionActivity *)self startDate];
  unsigned int v11 = BMMotionActivityConfidenceAsString([(BMMotionActivity *)self confidence]);
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMMotionActivity with stationary: %@, walking: %@, running: %@, automotive: %@, cycling: %@, unknown: %@, startDate: %@, confidence: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMMotionActivity)initWithStationary:(id)a3 walking:(id)a4 running:(id)a5 automotive:(id)a6 cycling:(id)a7 unknown:(id)a8 startDate:(id)a9 confidence:(int)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMMotionActivity;
  uint64_t v23 = [(BMEventBase *)&v26 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v23->_hasStationary = 1;
      v23->_stationary = [v16 BOOLValue];
    }
    else
    {
      v23->_hasStationary = 0;
      v23->_stationary = 0;
    }
    if (v17)
    {
      v23->_hasWalking = 1;
      v23->_walking = [v17 BOOLValue];
    }
    else
    {
      v23->_hasWalking = 0;
      v23->_walking = 0;
    }
    if (v18)
    {
      v23->_hasRunning = 1;
      v23->_running = [v18 BOOLValue];
    }
    else
    {
      v23->_hasRunning = 0;
      v23->_running = 0;
    }
    if (v19)
    {
      v23->_hasAutomotive = 1;
      v23->_automotive = [v19 BOOLValue];
    }
    else
    {
      v23->_hasAutomotive = 0;
      v23->_automotive = 0;
    }
    if (v20)
    {
      v23->_hasCycling = 1;
      v23->_cycling = [v20 BOOLValue];
    }
    else
    {
      v23->_hasCycling = 0;
      v23->_cycling = 0;
    }
    if (v21)
    {
      v23->_hasUnknown = 1;
      v23->_unknown = [v21 BOOLValue];
    }
    else
    {
      v23->_hasUnknown = 0;
      v23->_unknown = 0;
    }
    if (v22)
    {
      v23->_hasRaw_startDate = 1;
      [v22 timeIntervalSince1970];
    }
    else
    {
      v23->_hasRaw_startDate = 0;
      double v24 = -1.0;
    }
    v23->_raw_startDate = v24;
    v23->_confidence = a10;
  }

  return v23;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stationary" number:1 type:12 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"walking" number:2 type:12 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"running" number:3 type:12 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"automotive" number:4 type:12 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cycling" number:5 type:12 subMessageClass:0];
  v12[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"unknown" number:6 type:12 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:7 type:0 subMessageClass:0];
  v12[6] = v8;
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:8 type:4 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6798;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stationary" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"walking" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"running" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"automotive" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cycling" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"unknown" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:7 protoDataType:0 convertedType:2];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMotionActivity alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[11] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end