@interface BMFamilyScreenTimeRequest
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFamilyScreenTimeRequest)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMFamilyScreenTimeRequest)initWithRequestID:(id)a3 eventTime:(id)a4 requesterDSID:(id)a5 responderDSID:(id)a6 requestKind:(int)a7 status:(int)a8 approvalTime:(int)a9 websitePath:(id)a10 bundleID:(id)a11 isActionUserDevice:(id)a12;
- (BOOL)hasIsActionUserDevice;
- (BOOL)isActionUserDevice;
- (BOOL)isEqual:(id)a3;
- (NSDate)eventTime;
- (NSString)bundleID;
- (NSString)description;
- (NSString)requestID;
- (NSString)requesterDSID;
- (NSString)responderDSID;
- (NSString)websitePath;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)approvalTime;
- (int)requestKind;
- (int)status;
- (unsigned)dataVersion;
- (void)setHasIsActionUserDevice:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMFamilyScreenTimeRequest

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventTime" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requesterDSID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"responderDSID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestKind" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"status" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"approvalTime" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"websitePath" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActionUserDevice" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_websitePath, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  self->_hasIsActionUserDevice = a3;
}

- (BOOL)hasIsActionUserDevice
{
  return self->_hasIsActionUserDevice;
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)websitePath
{
  return self->_websitePath;
}

- (int)approvalTime
{
  return self->_approvalTime;
}

- (int)status
{
  return self->_status;
}

- (int)requestKind
{
  return self->_requestKind;
}

- (NSString)responderDSID
{
  return self->_responderDSID;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (NSString)requestID
{
  return self->_requestID;
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
    v6 = [(BMFamilyScreenTimeRequest *)self requestID];
    uint64_t v7 = [v5 requestID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFamilyScreenTimeRequest *)self requestID];
      v10 = [v5 requestID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_35;
      }
    }
    id v13 = [(BMFamilyScreenTimeRequest *)self eventTime];
    uint64_t v14 = [v5 eventTime];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMFamilyScreenTimeRequest *)self eventTime];
      v17 = [v5 eventTime];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_35;
      }
    }
    v19 = [(BMFamilyScreenTimeRequest *)self requesterDSID];
    uint64_t v20 = [v5 requesterDSID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMFamilyScreenTimeRequest *)self requesterDSID];
      v23 = [v5 requesterDSID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_35;
      }
    }
    v25 = [(BMFamilyScreenTimeRequest *)self responderDSID];
    uint64_t v26 = [v5 responderDSID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMFamilyScreenTimeRequest *)self responderDSID];
      v29 = [v5 responderDSID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_35;
      }
    }
    int v31 = [(BMFamilyScreenTimeRequest *)self requestKind];
    if (v31 != [v5 requestKind]) {
      goto LABEL_35;
    }
    int v32 = [(BMFamilyScreenTimeRequest *)self status];
    if (v32 != [v5 status]) {
      goto LABEL_35;
    }
    int v33 = [(BMFamilyScreenTimeRequest *)self approvalTime];
    if (v33 != [v5 approvalTime]) {
      goto LABEL_35;
    }
    v34 = [(BMFamilyScreenTimeRequest *)self websitePath];
    uint64_t v35 = [v5 websitePath];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMFamilyScreenTimeRequest *)self websitePath];
      v38 = [v5 websitePath];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_35;
      }
    }
    v40 = [(BMFamilyScreenTimeRequest *)self bundleID];
    uint64_t v41 = [v5 bundleID];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMFamilyScreenTimeRequest *)self bundleID];
      v44 = [v5 bundleID];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_35;
      }
    }
    if (![(BMFamilyScreenTimeRequest *)self hasIsActionUserDevice]
      && ![v5 hasIsActionUserDevice])
    {
      LOBYTE(v12) = 1;
      goto LABEL_36;
    }
    if ([(BMFamilyScreenTimeRequest *)self hasIsActionUserDevice]
      && [v5 hasIsActionUserDevice])
    {
      BOOL v46 = [(BMFamilyScreenTimeRequest *)self isActionUserDevice];
      int v12 = v46 ^ [v5 isActionUserDevice] ^ 1;
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:
    LOBYTE(v12) = 0;
    goto LABEL_36;
  }
  LOBYTE(v12) = 0;
LABEL_37:

  return v12;
}

- (NSDate)eventTime
{
  if (self->_hasRaw_eventTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_eventTime];
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
  v38[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMFamilyScreenTimeRequest *)self requestID];
  id v4 = [(BMFamilyScreenTimeRequest *)self eventTime];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMFamilyScreenTimeRequest *)self eventTime];
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = [(BMFamilyScreenTimeRequest *)self requesterDSID];
  uint64_t v9 = [(BMFamilyScreenTimeRequest *)self responderDSID];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFamilyScreenTimeRequest requestKind](self, "requestKind"));
  v36 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFamilyScreenTimeRequest status](self, "status"));
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFamilyScreenTimeRequest approvalTime](self, "approvalTime"));
  uint64_t v35 = [(BMFamilyScreenTimeRequest *)self websitePath];
  v34 = [(BMFamilyScreenTimeRequest *)self bundleID];
  if ([(BMFamilyScreenTimeRequest *)self hasIsActionUserDevice])
  {
    int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFamilyScreenTimeRequest isActionUserDevice](self, "isActionUserDevice"));
  }
  else
  {
    int v12 = 0;
  }
  v37[0] = @"requestID";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v13;
  v38[0] = v13;
  v37[1] = @"eventTime";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v14;
  v38[1] = v14;
  v37[2] = @"requesterDSID";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v15;
  v38[2] = v15;
  v37[3] = @"responderDSID";
  uint64_t v16 = v9;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v33 = (void *)v3;
  uint64_t v26 = (void *)v16;
  v38[3] = v16;
  v37[4] = @"requestKind";
  v17 = (void *)v10;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v32 = (void *)v7;
  v38[4] = v17;
  v37[5] = @"status";
  int v18 = v36;
  if (!v36)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v8;
  v38[5] = v18;
  v37[6] = @"approvalTime";
  v19 = v11;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v9;
  v38[6] = v19;
  v37[7] = @"websitePath";
  v21 = v35;
  if (!v35)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v10;
  v38[7] = v21;
  v37[8] = @"bundleID";
  v23 = v34;
  if (!v34)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v23;
  v37[9] = @"isActionUserDevice";
  int v24 = v12;
  if (!v12)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[9] = v24;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:10];
  if (!v12) {

  }
  if (!v34) {
  if (v35)
  }
  {
    if (v11) {
      goto LABEL_33;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_33;
    }
  }

LABEL_33:
  if (!v36) {

  }
  if (!v22) {
  if (v20)
  }
  {
    if (v31) {
      goto LABEL_39;
    }
  }
  else
  {

    if (v31)
    {
LABEL_39:
      if (v32) {
        goto LABEL_40;
      }
LABEL_48:

      if (v33) {
        goto LABEL_41;
      }
      goto LABEL_49;
    }
  }

  if (!v32) {
    goto LABEL_48;
  }
LABEL_40:
  if (v33) {
    goto LABEL_41;
  }
LABEL_49:

LABEL_41:

  return v30;
}

- (BMFamilyScreenTimeRequest)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v119[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"requestID"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    uint64_t v8 = [v5 objectForKeyedSubscript:@"eventTime"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v10 = v8;
        id v11 = [v9 alloc];
        [v10 doubleValue];
        double v13 = v12;

        id v14 = (id)[v11 initWithTimeIntervalSinceReferenceDate:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v99 = [v20 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v99 = 0;
            v19 = 0;
            goto LABEL_51;
          }
          id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
          v76 = v8;
          uint64_t v77 = *MEMORY[0x1E4F502C8];
          uint64_t v116 = *MEMORY[0x1E4F28568];
          uint64_t v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"eventTime"];
          v117 = v41;
          uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
          uint64_t v79 = v77;
          uint64_t v8 = v76;
          v96 = (void *)v78;
          v99 = 0;
          v19 = 0;
          *a4 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v79, 2);
          goto LABEL_50;
        }
        id v14 = v8;
      }
      v99 = v14;
    }
    else
    {
      v99 = 0;
    }
LABEL_16:
    uint64_t v21 = [v5 objectForKeyedSubscript:@"requesterDSID"];
    v96 = (void *)v21;
    if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v41 = 0;
          v19 = 0;
          goto LABEL_50;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        v44 = v8;
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        id v98 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requesterDSID"];
        id v115 = v98;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        v47 = v43;
        int v24 = (void *)v46;
        uint64_t v48 = v45;
        uint64_t v8 = v44;
        uint64_t v41 = 0;
        v19 = 0;
        *a4 = (id)[v47 initWithDomain:v48 code:2 userInfo:v46];
LABEL_49:

LABEL_50:
        goto LABEL_51;
      }
      id v95 = v22;
    }
    else
    {
      id v95 = 0;
    }
    uint64_t v23 = [v5 objectForKeyedSubscript:@"responderDSID"];
    v91 = (void *)v23;
    if (v23 && (int v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v98 = 0;
          v19 = 0;
          uint64_t v41 = v95;
          goto LABEL_49;
        }
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        v50 = v8;
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v112 = *MEMORY[0x1E4F28568];
        id v93 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"responderDSID"];
        id v113 = v93;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        v52 = v49;
        int v24 = v91;
        uint64_t v53 = v51;
        uint64_t v8 = v50;
        id v98 = 0;
        v19 = 0;
        *a4 = (id)[v52 initWithDomain:v53 code:2 userInfo:v25];
        uint64_t v41 = v95;
        goto LABEL_48;
      }
      id v98 = v24;
    }
    else
    {
      id v98 = 0;
    }
    v25 = [v5 objectForKeyedSubscript:@"requestKind"];
    v92 = v6;
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v7;
        v27 = self;
        id v93 = v25;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v93 = 0;
            v19 = 0;
            uint64_t v41 = v95;
            int v24 = v91;
            goto LABEL_48;
          }
          id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
          v64 = v8;
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v110 = *MEMORY[0x1E4F28568];
          id v90 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"requestKind"];
          id v111 = v90;
          uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          uint64_t v67 = v65;
          uint64_t v8 = v64;
          v87 = (void *)v66;
          id v68 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v67, 2);
          id v93 = 0;
          v19 = 0;
          *a4 = v68;
          uint64_t v41 = v95;
          int v24 = v91;
LABEL_47:

LABEL_48:
          goto LABEL_49;
        }
        id v26 = v7;
        id v93 = [NSNumber numberWithInt:BMFamilyScreenTimeRequestKindFromString(v25)];
        v27 = self;
      }
    }
    else
    {
      id v26 = v7;
      v27 = self;
      id v93 = 0;
    }
    uint64_t v28 = [v5 objectForKeyedSubscript:@"status"];
    v86 = v25;
    v87 = (void *)v28;
    if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v90 = v29;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v90 = 0;
            v19 = 0;
            uint64_t v41 = v95;
            self = v27;
            id v7 = v26;
            int v24 = v91;
            v6 = v92;
            goto LABEL_47;
          }
          id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v70 = *MEMORY[0x1E4F502C8];
          uint64_t v108 = *MEMORY[0x1E4F28568];
          id v89 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"status"];
          id v109 = v89;
          v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
          id v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
          id v90 = 0;
          v19 = 0;
          *a4 = v71;
          self = v27;
          id v7 = v26;
          int v24 = v91;
          v6 = v92;
          goto LABEL_46;
        }
        id v90 = [NSNumber numberWithInt:BMFamilyScreenTimeRequestStatusFromString(v29)];
      }
    }
    else
    {
      id v90 = 0;
    }
    uint64_t v30 = [v5 objectForKeyedSubscript:@"approvalTime"];
    v85 = (void *)v30;
    if (v30 && (int v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      self = v27;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v89 = 0;
            v19 = 0;
            id v7 = v26;
            int v24 = v91;
            v6 = v92;
            goto LABEL_45;
          }
          id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v73 = *MEMORY[0x1E4F502C8];
          uint64_t v106 = *MEMORY[0x1E4F28568];
          id v88 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"approvalTime"];
          id v107 = v88;
          int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
          id v74 = (id)[v72 initWithDomain:v73 code:2 userInfo:v32];
          id v89 = 0;
          v19 = 0;
          *a4 = v74;
          id v7 = v26;
          v6 = v92;
LABEL_44:

          int v24 = v91;
LABEL_45:
          v25 = v86;
LABEL_46:

          uint64_t v41 = v95;
          goto LABEL_47;
        }
        id v89 = [NSNumber numberWithInt:BMFamilyScreenTimeRequestApprovedTimeFromString(v31)];
        id v7 = v26;
LABEL_32:
        int v32 = [v5 objectForKeyedSubscript:@"websitePath"];
        v6 = v92;
        if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = (BMFamilyScreenTimeRequest *)a4;
            if (!a4)
            {
              id v88 = 0;
              goto LABEL_44;
            }
            v54 = v8;
            id v55 = v7;
            id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v57 = *MEMORY[0x1E4F502C8];
            uint64_t v104 = *MEMORY[0x1E4F28568];
            id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"websitePath"];
            id v105 = v36;
            int v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
            v58 = v56;
            id v7 = v55;
            uint64_t v8 = v54;
            id v59 = (id)[v58 initWithDomain:v57 code:2 userInfo:v33];
            v19 = 0;
            id v88 = 0;
            *a4 = v59;
            goto LABEL_43;
          }
          id v88 = v32;
        }
        else
        {
          id v88 = 0;
        }
        int v33 = [v5 objectForKeyedSubscript:@"bundleID"];
        v84 = v8;
        if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v36 = 0;
              v19 = 0;
              v6 = v92;
              goto LABEL_43;
            }
            id v34 = v7;
            uint64_t v35 = self;
            id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v60 = *MEMORY[0x1E4F502C8];
            uint64_t v102 = *MEMORY[0x1E4F28568];
            id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
            id v103 = v38;
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
            id v61 = (id)[v82 initWithDomain:v60 code:2 userInfo:v37];
            v19 = 0;
            id v36 = 0;
            *a4 = v61;
            goto LABEL_42;
          }
          id v34 = v7;
          uint64_t v35 = self;
          id v36 = v33;
        }
        else
        {
          id v34 = v7;
          uint64_t v35 = self;
          id v36 = 0;
        }
        v37 = [v5 objectForKeyedSubscript:@"isActionUserDevice"];
        if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v81 = *MEMORY[0x1E4F502C8];
              uint64_t v100 = *MEMORY[0x1E4F28568];
              v62 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isActionUserDevice"];
              v101 = v62;
              v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
              *a4 = (id)[v83 initWithDomain:v81 code:2 userInfo:v63];
            }
            id v38 = 0;
            v19 = 0;
            goto LABEL_42;
          }
          id v38 = v37;
        }
        else
        {
          id v38 = 0;
        }
        uint64_t v39 = [v93 intValue];
        uint64_t v40 = [v90 intValue];
        LODWORD(v80) = [v89 intValue];
        v19 = [(BMFamilyScreenTimeRequest *)v35 initWithRequestID:v34 eventTime:v99 requesterDSID:v95 responderDSID:v98 requestKind:v39 status:v40 approvalTime:v80 websitePath:v88 bundleID:v36 isActionUserDevice:v38];
        uint64_t v35 = v19;
LABEL_42:

        self = v35;
        v6 = v92;
        id v7 = v34;
        uint64_t v8 = v84;
LABEL_43:

        goto LABEL_44;
      }
      id v89 = v31;
    }
    else
    {
      id v89 = 0;
      self = v27;
    }
    id v7 = v26;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v7 = 0;
    v19 = 0;
    goto LABEL_52;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v118 = *MEMORY[0x1E4F28568];
  v99 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestID"];
  v119[0] = v99;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:&v118 count:1];
  uint64_t v18 = v16;
  uint64_t v8 = (void *)v17;
  id v7 = 0;
  v19 = 0;
  *a4 = (id)[v15 initWithDomain:v18 code:2 userInfo:v17];
LABEL_51:

LABEL_52:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMFamilyScreenTimeRequest *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_eventTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_requesterDSID) {
    PBDataWriterWriteStringField();
  }
  if (self->_responderDSID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_websitePath) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_hasIsActionUserDevice)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMFamilyScreenTimeRequest;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_87;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_51;
        case 2u:
          v5->_hasRaw_eventTime = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          v5->_raw_eventTime = v24;
          continue;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_51;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_51;
        case 5u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v6;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_62:
          if (v27 >= 3) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 40;
          goto LABEL_77;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v34 = *v6;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_68:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 44;
          goto LABEL_77;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v42;
              v27 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v17 = v39++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_74:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 48;
LABEL_77:
          *(_DWORD *)((char *)&v5->super.super.isa + v52) = v27;
          continue;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_51;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
LABEL_51:
          v44 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0xAu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          v5->_hasIsActionUserDevice = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_86;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v6;
        uint64_t v49 = *(void *)&v4[v48];
        unint64_t v50 = v49 + 1;
        if (v49 == -1 || v50 > *(void *)&v4[*v7]) {
          break;
        }
        char v51 = *(unsigned char *)(*(void *)&v4[*v9] + v49);
        *(void *)&v4[v48] = v50;
        v47 |= (unint64_t)(v51 & 0x7F) << v45;
        if ((v51 & 0x80) == 0) {
          goto LABEL_79;
        }
        v45 += 7;
        BOOL v17 = v46++ >= 9;
        if (v17)
        {
          uint64_t v47 = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8]) {
        uint64_t v47 = 0;
      }
LABEL_81:
      v5->_isActionUserDevice = v47 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_86:
  }
    uint64_t v53 = 0;
  else {
LABEL_87:
  }
    uint64_t v53 = v5;

  return v53;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v13 = [(BMFamilyScreenTimeRequest *)self requestID];
  uint64_t v3 = [(BMFamilyScreenTimeRequest *)self eventTime];
  id v4 = [(BMFamilyScreenTimeRequest *)self requesterDSID];
  id v5 = [(BMFamilyScreenTimeRequest *)self responderDSID];
  v6 = BMFamilyScreenTimeRequestKindAsString([(BMFamilyScreenTimeRequest *)self requestKind]);
  id v7 = BMFamilyScreenTimeRequestStatusAsString([(BMFamilyScreenTimeRequest *)self status]);
  uint64_t v8 = BMFamilyScreenTimeRequestApprovedTimeAsString([(BMFamilyScreenTimeRequest *)self approvalTime]);
  uint64_t v9 = [(BMFamilyScreenTimeRequest *)self websitePath];
  char v10 = [(BMFamilyScreenTimeRequest *)self bundleID];
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMFamilyScreenTimeRequest isActionUserDevice](self, "isActionUserDevice"));
  id v15 = (id)[v14 initWithFormat:@"BMFamilyScreenTimeRequest with requestID: %@, eventTime: %@, requesterDSID: %@, responderDSID: %@, requestKind: %@, status: %@, approvalTime: %@, websitePath: %@, bundleID: %@, isActionUserDevice: %@", v13, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMFamilyScreenTimeRequest)initWithRequestID:(id)a3 eventTime:(id)a4 requesterDSID:(id)a5 responderDSID:(id)a6 requestKind:(int)a7 status:(int)a8 approvalTime:(int)a9 websitePath:(id)a10 bundleID:(id)a11 isActionUserDevice:(id)a12
{
  id v28 = a3;
  id v17 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a10;
  id v18 = a11;
  id v19 = a12;
  v29.receiver = self;
  v29.super_class = (Class)BMFamilyScreenTimeRequest;
  uint64_t v20 = [(BMEventBase *)&v29 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_requestID, a3);
    if (v17)
    {
      v20->_hasRaw_eventTime = 1;
      [v17 timeIntervalSinceReferenceDate];
    }
    else
    {
      v20->_hasRaw_eventTime = 0;
      double v21 = -1.0;
    }
    v20->_raw_eventTime = v21;
    objc_storeStrong((id *)&v20->_requesterDSID, a5);
    objc_storeStrong((id *)&v20->_responderDSID, a6);
    v20->_requestKind = a7;
    v20->_status = a8;
    v20->_approvalTime = a9;
    objc_storeStrong((id *)&v20->_websitePath, a10);
    objc_storeStrong((id *)&v20->_bundleID, a11);
    if (v19)
    {
      v20->_hasIsActionUserDevice = 1;
      v20->_isActionUserDevice = [v19 BOOLValue];
    }
    else
    {
      v20->_hasIsActionUserDevice = 0;
      v20->_isActionUserDevice = 0;
    }
  }

  return v20;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestID" number:1 type:13 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventTime" number:2 type:0 subMessageClass:0];
  v14[1] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requesterDSID" number:3 type:13 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"responderDSID" number:4 type:13 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestKind" number:5 type:4 subMessageClass:0];
  v14[4] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"status" number:6 type:4 subMessageClass:0];
  v14[5] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"approvalTime" number:7 type:4 subMessageClass:0];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"websitePath" number:8 type:13 subMessageClass:0];
  v14[7] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:9 type:13 subMessageClass:0];
  v14[8] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActionUserDevice" number:10 type:12 subMessageClass:0];
  v14[9] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6E88;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMFamilyScreenTimeRequest alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[9] = 1;
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