@interface BMDeviceBatteryGauging
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceBatteryGauging)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceBatteryGauging)initWithUpdateType:(int)a3 qmaxState:(int)a4 daysSinceQMax:(id)a5 ocvState:(int)a6 daysSinceOCV:(id)a7 fullChargeState:(int)a8 daysSinceFullChargeAttempt:(id)a9;
- (BOOL)hasDaysSinceFullChargeAttempt;
- (BOOL)hasDaysSinceOCV;
- (BOOL)hasDaysSinceQMax;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)daysSinceFullChargeAttempt;
- (int)daysSinceOCV;
- (int)daysSinceQMax;
- (int)fullChargeState;
- (int)ocvState;
- (int)qmaxState;
- (int)updateType;
- (unsigned)dataVersion;
- (void)setHasDaysSinceFullChargeAttempt:(BOOL)a3;
- (void)setHasDaysSinceOCV:(BOOL)a3;
- (void)setHasDaysSinceQMax:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceBatteryGauging

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"updateType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"qmaxState" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"daysSinceQMax" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ocvState" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"daysSinceOCV" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fullChargeState" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"daysSinceFullChargeAttempt" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
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

- (void)setHasDaysSinceFullChargeAttempt:(BOOL)a3
{
  self->_hasDaysSinceFullChargeAttempt = a3;
}

- (BOOL)hasDaysSinceFullChargeAttempt
{
  return self->_hasDaysSinceFullChargeAttempt;
}

- (int)daysSinceFullChargeAttempt
{
  return self->_daysSinceFullChargeAttempt;
}

- (int)fullChargeState
{
  return self->_fullChargeState;
}

- (void)setHasDaysSinceOCV:(BOOL)a3
{
  self->_hasDaysSinceOCV = a3;
}

- (BOOL)hasDaysSinceOCV
{
  return self->_hasDaysSinceOCV;
}

- (int)daysSinceOCV
{
  return self->_daysSinceOCV;
}

- (int)ocvState
{
  return self->_ocvState;
}

- (void)setHasDaysSinceQMax:(BOOL)a3
{
  self->_hasDaysSinceQMax = a3;
}

- (BOOL)hasDaysSinceQMax
{
  return self->_hasDaysSinceQMax;
}

- (int)daysSinceQMax
{
  return self->_daysSinceQMax;
}

- (int)qmaxState
{
  return self->_qmaxState;
}

- (int)updateType
{
  return self->_updateType;
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
    int v6 = [(BMDeviceBatteryGauging *)self updateType];
    if (v6 != [v5 updateType]) {
      goto LABEL_22;
    }
    int v7 = [(BMDeviceBatteryGauging *)self qmaxState];
    if (v7 != [v5 qmaxState]) {
      goto LABEL_22;
    }
    if ([(BMDeviceBatteryGauging *)self hasDaysSinceQMax]
      || [v5 hasDaysSinceQMax])
    {
      if (![(BMDeviceBatteryGauging *)self hasDaysSinceQMax]) {
        goto LABEL_22;
      }
      if (![v5 hasDaysSinceQMax]) {
        goto LABEL_22;
      }
      int v8 = [(BMDeviceBatteryGauging *)self daysSinceQMax];
      if (v8 != [v5 daysSinceQMax]) {
        goto LABEL_22;
      }
    }
    int v9 = [(BMDeviceBatteryGauging *)self ocvState];
    if (v9 != [v5 ocvState]) {
      goto LABEL_22;
    }
    if ([(BMDeviceBatteryGauging *)self hasDaysSinceOCV]
      || [v5 hasDaysSinceOCV])
    {
      if (![(BMDeviceBatteryGauging *)self hasDaysSinceOCV]) {
        goto LABEL_22;
      }
      if (![v5 hasDaysSinceOCV]) {
        goto LABEL_22;
      }
      int v10 = [(BMDeviceBatteryGauging *)self daysSinceOCV];
      if (v10 != [v5 daysSinceOCV]) {
        goto LABEL_22;
      }
    }
    int v11 = [(BMDeviceBatteryGauging *)self fullChargeState];
    if (v11 != [v5 fullChargeState]) {
      goto LABEL_22;
    }
    if (![(BMDeviceBatteryGauging *)self hasDaysSinceFullChargeAttempt]
      && ![v5 hasDaysSinceFullChargeAttempt])
    {
      BOOL v13 = 1;
      goto LABEL_23;
    }
    if ([(BMDeviceBatteryGauging *)self hasDaysSinceFullChargeAttempt]
      && [v5 hasDaysSinceFullChargeAttempt])
    {
      int v12 = [(BMDeviceBatteryGauging *)self daysSinceFullChargeAttempt];
      BOOL v13 = v12 == [v5 daysSinceFullChargeAttempt];
    }
    else
    {
LABEL_22:
      BOOL v13 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  BOOL v13 = 0;
LABEL_24:

  return v13;
}

- (id)jsonDictionary
{
  v24[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging updateType](self, "updateType"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging qmaxState](self, "qmaxState"));
  if ([(BMDeviceBatteryGauging *)self hasDaysSinceQMax])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging daysSinceQMax](self, "daysSinceQMax"));
  }
  else
  {
    id v5 = 0;
  }
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging ocvState](self, "ocvState"));
  if ([(BMDeviceBatteryGauging *)self hasDaysSinceOCV])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging daysSinceOCV](self, "daysSinceOCV"));
  }
  else
  {
    int v6 = 0;
  }
  int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging fullChargeState](self, "fullChargeState"));
  if ([(BMDeviceBatteryGauging *)self hasDaysSinceFullChargeAttempt])
  {
    int v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging daysSinceFullChargeAttempt](self, "daysSinceFullChargeAttempt"));
  }
  else
  {
    int v8 = 0;
  }
  v23[0] = @"updateType";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v24[0] = v9;
  v23[1] = @"qmaxState";
  uint64_t v10 = v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v3;
  v18 = (void *)v10;
  v24[1] = v10;
  v23[2] = @"daysSinceQMax";
  int v11 = v5;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v4;
  v24[2] = v11;
  v23[3] = @"ocvState";
  int v12 = v22;
  if (!v22)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v12;
  v23[4] = @"daysSinceOCV";
  BOOL v13 = v6;
  if (!v6)
  {
    BOOL v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v13;
  v23[5] = @"fullChargeState";
  v14 = v7;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v14;
  v23[6] = @"daysSinceFullChargeAttempt";
  v15 = v8;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[6] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
  if (v8)
  {
    if (v7) {
      goto LABEL_26;
    }
LABEL_37:

    if (v6) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }

  if (!v7) {
    goto LABEL_37;
  }
LABEL_26:
  if (v6) {
    goto LABEL_27;
  }
LABEL_38:

LABEL_27:
  if (!v22) {

  }
  if (!v5) {
  if (v20)
  }
  {
    if (v21) {
      goto LABEL_33;
    }
  }
  else
  {

    if (v21) {
      goto LABEL_33;
    }
  }

LABEL_33:

  return v16;
}

- (BMDeviceBatteryGauging)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v81 = [v5 objectForKeyedSubscript:@"updateType"];
  if (!v81 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v6 = 0;
LABEL_9:
    int v8 = [v5 objectForKeyedSubscript:@"qmaxState"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v25 = 0;
            uint64_t v9 = 0;
            goto LABEL_56;
          }
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          v53 = a4;
          uint64_t v54 = *MEMORY[0x1E4F502C8];
          uint64_t v92 = *MEMORY[0x1E4F28568];
          id v79 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"qmaxState"];
          id v93 = v79;
          v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          id v55 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v54, 2);
          v25 = 0;
          id *v53 = v55;
          uint64_t v9 = 0;
          goto LABEL_55;
        }
        id v10 = [NSNumber numberWithInt:BMDeviceBatteryGaugingQMaxStateFromString(v8)];
      }
      uint64_t v9 = v10;
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"daysSinceQMax"];
    v78 = (void *)v11;
    if (v11 && (int v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v79 = 0;
          v25 = 0;
          goto LABEL_55;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        v22 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"daysSinceQMax"];
        id v91 = v16;
        v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v23, 2);
        id v79 = 0;
        v25 = 0;
        id *v22 = v24;
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      id v79 = v12;
    }
    else
    {
      id v79 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"ocvState"];
    v75 = (void *)v13;
    if (v13 && (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = a4;
        id v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v16 = 0;
            v25 = 0;
            goto LABEL_54;
          }
          v56 = a4;
          id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v58 = *MEMORY[0x1E4F502C8];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"ocvState"];
          id v89 = v17;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
          id v59 = (id)[v57 initWithDomain:v58 code:2 userInfo:v31];
          id v16 = 0;
          v25 = 0;
          id *v56 = v59;
          goto LABEL_53;
        }
        id v16 = [NSNumber numberWithInt:BMDeviceBatteryGaugingOCVStateFromString(v14)];
        v15 = a4;
      }
    }
    else
    {
      v15 = a4;
      id v16 = 0;
    }
    id v17 = [v5 objectForKeyedSubscript:@"daysSinceOCV"];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v72 = v17;
        id v17 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v15)
          {
            v25 = 0;
            v31 = v17;
            id v17 = 0;
            goto LABEL_53;
          }
          id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v86 = *MEMORY[0x1E4F28568];
          v26 = v15;
          id v27 = v5;
          v28 = v6;
          id v29 = [NSString alloc];
          uint64_t v65 = objc_opt_class();
          v30 = v29;
          int v6 = v28;
          id v5 = v27;
          v31 = v17;
          v76 = (void *)[v30 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v65, @"daysSinceOCV"];
          v87 = v76;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          id v17 = 0;
          v25 = 0;
          id *v26 = (id)[v73 initWithDomain:v69 code:2 userInfo:v18];
LABEL_52:

LABEL_53:
          goto LABEL_54;
        }
        id v72 = v17;
        id v17 = v17;
      }
    }
    else
    {
      id v72 = 0;
    }
    v18 = [v5 objectForKeyedSubscript:@"fullChargeState"];
    v74 = v9;
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v68 = v17;
      v19 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v18;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v15)
          {
            v76 = 0;
            v25 = 0;
            v31 = v72;
            id v17 = v68;
            goto LABEL_52;
          }
          v60 = v15;
          id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
          v61 = v8;
          uint64_t v62 = *MEMORY[0x1E4F502C8];
          uint64_t v84 = *MEMORY[0x1E4F28568];
          id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"fullChargeState"];
          id v85 = v36;
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          uint64_t v63 = v62;
          int v8 = v61;
          id v64 = (id)[v77 initWithDomain:v63 code:2 userInfo:v32];
          v76 = 0;
          v25 = 0;
          id *v60 = v64;
          int v6 = v19;
          id v17 = v68;
          goto LABEL_51;
        }
        id v20 = [NSNumber numberWithInt:BMDeviceBatteryGaugingPeriodicFullChargeStateFromString(v18)];
      }
      v76 = v20;
      id v17 = v68;
    }
    else
    {
      v76 = 0;
    }
    v32 = [v5 objectForKeyedSubscript:@"daysSinceFullChargeAttempt"];
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v15)
        {
          id v71 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v67 = *MEMORY[0x1E4F502C8];
          uint64_t v82 = *MEMORY[0x1E4F28568];
          v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"daysSinceFullChargeAttempt"];
          v83 = v46;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id *v15 = (id)[v71 initWithDomain:v67 code:2 userInfo:v47];
        }
        id v36 = 0;
        v25 = 0;
        goto LABEL_51;
      }
      v33 = v18;
      v66 = v32;
      v70 = v8;
      id v34 = v5;
      v35 = self;
      id v36 = v32;
    }
    else
    {
      v66 = v32;
      v70 = v8;
      v33 = v18;
      id v34 = v5;
      v35 = self;
      id v36 = 0;
    }
    uint64_t v37 = [v6 intValue];
    v38 = v6;
    uint64_t v39 = [v74 intValue];
    id v40 = v16;
    uint64_t v41 = [v16 intValue];
    uint64_t v42 = [v76 intValue];
    uint64_t v43 = v39;
    int v6 = v38;
    uint64_t v44 = v41;
    id v16 = v40;
    v25 = [(BMDeviceBatteryGauging *)v35 initWithUpdateType:v37 qmaxState:v43 daysSinceQMax:v79 ocvState:v44 daysSinceOCV:v17 fullChargeState:v42 daysSinceFullChargeAttempt:v36];
    self = v25;
    id v5 = v34;
    v32 = v66;
    int v8 = v70;
    v18 = v33;
LABEL_51:

    v31 = v72;
    uint64_t v9 = v74;
    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v81;
LABEL_8:
    int v6 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [NSNumber numberWithInt:BMDeviceBatteryGaugingGaugingUpdateTypeFromString(v81)];
    goto LABEL_8;
  }
  if (!a4)
  {
    int v6 = 0;
    v25 = 0;
    goto LABEL_57;
  }
  id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
  v49 = a4;
  uint64_t v50 = *MEMORY[0x1E4F502C8];
  uint64_t v94 = *MEMORY[0x1E4F28568];
  uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"updateType"];
  v95[0] = v9;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
  id v51 = (id)[v48 initWithDomain:v50 code:2 userInfo:v8];
  int v6 = 0;
  v25 = 0;
  id *v49 = v51;
LABEL_56:

LABEL_57:
  return v25;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceBatteryGauging *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasDaysSinceQMax) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasDaysSinceOCV) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasDaysSinceFullChargeAttempt) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMDeviceBatteryGauging;
  id v5 = [(BMEventBase *)&v58 init];
  if (!v5) {
    goto LABEL_111;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
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
              goto LABEL_72;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_74;
            }
          }
          v4[*v8] = 1;
LABEL_72:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_74:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__updateType;
          goto LABEL_107;
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
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_80:
          if (v21 >= 5) {
            LODWORD(v21) = 0;
          }
          id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__qmaxState;
          goto LABEL_107;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          v5->_hasDaysSinceQMax = 1;
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
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_86:
          id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__daysSinceQMax;
          goto LABEL_107;
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
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_90:
          if (v21 >= 3) {
            LODWORD(v21) = 0;
          }
          id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__ocvState;
          goto LABEL_107;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v21 = 0;
          v5->_hasDaysSinceOCV = 1;
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
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_96:
          id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__daysSinceOCV;
          goto LABEL_107;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v47 = *v6;
            unint64_t v48 = *(void *)&v4[v47];
            if (v48 == -1 || v48 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v48 + 1;
              v21 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v16 = v46++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_100:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__fullChargeState;
          goto LABEL_107;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v21 = 0;
          v5->_hasDaysSinceFullChargeAttempt = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_110;
          }
          continue;
      }
      while (1)
      {
        uint64_t v52 = *v6;
        unint64_t v53 = *(void *)&v4[v52];
        if (v53 == -1 || v53 >= *(void *)&v4[*v7]) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v53);
        *(void *)&v4[v52] = v53 + 1;
        v21 |= (unint64_t)(v54 & 0x7F) << v50;
        if ((v54 & 0x80) == 0) {
          goto LABEL_104;
        }
        v50 += 7;
        BOOL v16 = v51++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_106;
        }
      }
      v4[*v8] = 1;
LABEL_104:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_106:
      id v55 = &OBJC_IVAR___BMDeviceBatteryGauging__daysSinceFullChargeAttempt;
LABEL_107:
      *(_DWORD *)((char *)&v5->super.super.isa + *v55) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_110:
  }
    v56 = 0;
  else {
LABEL_111:
  }
    v56 = v5;

  return v56;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMDeviceBatteryGaugingGaugingUpdateTypeAsString([(BMDeviceBatteryGauging *)self updateType]);
  id v5 = BMDeviceBatteryGaugingQMaxStateAsString([(BMDeviceBatteryGauging *)self qmaxState]);
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging daysSinceQMax](self, "daysSinceQMax"));
  id v7 = BMDeviceBatteryGaugingOCVStateAsString([(BMDeviceBatteryGauging *)self ocvState]);
  int v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging daysSinceOCV](self, "daysSinceOCV"));
  uint64_t v9 = BMDeviceBatteryGaugingPeriodicFullChargeStateAsString([(BMDeviceBatteryGauging *)self fullChargeState]);
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryGauging daysSinceFullChargeAttempt](self, "daysSinceFullChargeAttempt"));
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMDeviceBatteryGauging with updateType: %@, qmaxState: %@, daysSinceQMax: %@, ocvState: %@, daysSinceOCV: %@, fullChargeState: %@, daysSinceFullChargeAttempt: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMDeviceBatteryGauging)initWithUpdateType:(int)a3 qmaxState:(int)a4 daysSinceQMax:(id)a5 ocvState:(int)a6 daysSinceOCV:(id)a7 fullChargeState:(int)a8 daysSinceFullChargeAttempt:(id)a9
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BMDeviceBatteryGauging;
  v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v18->_updateType = a3;
    v18->_qmaxState = a4;
    if (v15)
    {
      v18->_hasDaysSinceQMax = 1;
      int v19 = [v15 intValue];
    }
    else
    {
      v18->_hasDaysSinceQMax = 0;
      int v19 = -1;
    }
    v18->_daysSinceQMax = v19;
    v18->_ocvState = a6;
    if (v16)
    {
      v18->_hasDaysSinceOCV = 1;
      int v20 = [v16 intValue];
    }
    else
    {
      v18->_hasDaysSinceOCV = 0;
      int v20 = -1;
    }
    v18->_daysSinceOCV = v20;
    v18->_fullChargeState = a8;
    if (v17)
    {
      v18->_hasDaysSinceFullChargeAttempt = 1;
      int v21 = [v17 intValue];
    }
    else
    {
      v18->_hasDaysSinceFullChargeAttempt = 0;
      int v21 = -1;
    }
    v18->_daysSinceFullChargeAttempt = v21;
  }

  return v18;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"updateType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"qmaxState", 2, 4, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"daysSinceQMax" number:3 type:2 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ocvState" number:4 type:4 subMessageClass:0];
  v11[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"daysSinceOCV" number:5 type:2 subMessageClass:0];
  v11[4] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fullChargeState" number:6 type:4 subMessageClass:0];
  v11[5] = v7;
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"daysSinceFullChargeAttempt" number:7 type:2 subMessageClass:0];
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7050;
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

    int v8 = [[BMDeviceBatteryGauging alloc] initByReadFrom:v7];
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