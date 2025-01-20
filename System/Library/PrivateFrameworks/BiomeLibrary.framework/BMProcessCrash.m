@interface BMProcessCrash
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10;
- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10 coalitionName:(id)a11;
- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10 coalitionName:(id)a11 isFirstParty:(id)a12 isBeta:(id)a13;
- (BMProcessCrash)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProcessCrashException)exception;
- (BMProcessCrashTerminationReason)terminationReason;
- (BOOL)hasIsBeta;
- (BOOL)hasIsFirstParty;
- (BOOL)isBeta;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstParty;
- (NSString)appVersion;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)coalitionName;
- (NSString)description;
- (NSString)incidentID;
- (NSString)processName;
- (NSString)responsibleApp;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsBeta:(BOOL)a3;
- (void)setHasIsFirstParty:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProcessCrash

- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10 coalitionName:(id)a11
{
  return [(BMProcessCrash *)self initWithIncidentID:a3 processName:a4 bundleID:a5 appVersion:a6 bundleVersion:a7 exception:a8 terminationReason:a9 responsibleApp:a10 coalitionName:0 isFirstParty:0 isBeta:0];
}

- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10
{
  return [(BMProcessCrash *)self initWithIncidentID:a3 processName:a4 bundleID:a5 appVersion:a6 bundleVersion:a7 exception:a8 terminationReason:a9 responsibleApp:a10 coalitionName:0 isFirstParty:0 isBeta:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionName, 0);
  objc_storeStrong((id *)&self->_responsibleApp, 0);
  objc_storeStrong((id *)&self->_terminationReason, 0);
  objc_storeStrong((id *)&self->_exception, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_incidentID, 0);
}

- (void)setHasIsBeta:(BOOL)a3
{
  self->_hasIsBeta = a3;
}

- (BOOL)hasIsBeta
{
  return self->_hasIsBeta;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setHasIsFirstParty:(BOOL)a3
{
  self->_hasIsFirstParty = a3;
}

- (BOOL)hasIsFirstParty
{
  return self->_hasIsFirstParty;
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (NSString)coalitionName
{
  return self->_coalitionName;
}

- (NSString)responsibleApp
{
  return self->_responsibleApp;
}

- (BMProcessCrashTerminationReason)terminationReason
{
  return self->_terminationReason;
}

- (BMProcessCrashException)exception
{
  return self->_exception;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)incidentID
{
  return self->_incidentID;
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
    v6 = [(BMProcessCrash *)self incidentID];
    uint64_t v7 = [v5 incidentID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProcessCrash *)self incidentID];
      v10 = [v5 incidentID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_49;
      }
    }
    v13 = [(BMProcessCrash *)self processName];
    uint64_t v14 = [v5 processName];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProcessCrash *)self processName];
      v17 = [v5 processName];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_49;
      }
    }
    v19 = [(BMProcessCrash *)self bundleID];
    uint64_t v20 = [v5 bundleID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProcessCrash *)self bundleID];
      v23 = [v5 bundleID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_49;
      }
    }
    v25 = [(BMProcessCrash *)self appVersion];
    uint64_t v26 = [v5 appVersion];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProcessCrash *)self appVersion];
      v29 = [v5 appVersion];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_49;
      }
    }
    v31 = [(BMProcessCrash *)self bundleVersion];
    uint64_t v32 = [v5 bundleVersion];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProcessCrash *)self bundleVersion];
      v35 = [v5 bundleVersion];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_49;
      }
    }
    v37 = [(BMProcessCrash *)self exception];
    uint64_t v38 = [v5 exception];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProcessCrash *)self exception];
      v41 = [v5 exception];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_49;
      }
    }
    v43 = [(BMProcessCrash *)self terminationReason];
    uint64_t v44 = [v5 terminationReason];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProcessCrash *)self terminationReason];
      v47 = [v5 terminationReason];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_49;
      }
    }
    v49 = [(BMProcessCrash *)self responsibleApp];
    uint64_t v50 = [v5 responsibleApp];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProcessCrash *)self responsibleApp];
      v53 = [v5 responsibleApp];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_49;
      }
    }
    v55 = [(BMProcessCrash *)self coalitionName];
    uint64_t v56 = [v5 coalitionName];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMProcessCrash *)self coalitionName];
      v59 = [v5 coalitionName];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_49;
      }
    }
    if (![(BMProcessCrash *)self hasIsFirstParty]
      && ![v5 hasIsFirstParty]
      || [(BMProcessCrash *)self hasIsFirstParty]
      && [v5 hasIsFirstParty]
      && (int v61 = [(BMProcessCrash *)self isFirstParty],
          v61 == [v5 isFirstParty]))
    {
      if (!-[BMProcessCrash hasIsBeta](self, "hasIsBeta") && ![v5 hasIsBeta])
      {
        LOBYTE(v12) = 1;
        goto LABEL_50;
      }
      if (-[BMProcessCrash hasIsBeta](self, "hasIsBeta") && [v5 hasIsBeta])
      {
        BOOL v62 = [(BMProcessCrash *)self isBeta];
        int v12 = v62 ^ [v5 isBeta] ^ 1;
LABEL_50:

        goto LABEL_51;
      }
    }
LABEL_49:
    LOBYTE(v12) = 0;
    goto LABEL_50;
  }
  LOBYTE(v12) = 0;
LABEL_51:

  return v12;
}

- (id)jsonDictionary
{
  v42[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProcessCrash *)self incidentID];
  uint64_t v4 = [(BMProcessCrash *)self processName];
  uint64_t v5 = [(BMProcessCrash *)self bundleID];
  uint64_t v6 = [(BMProcessCrash *)self appVersion];
  uint64_t v7 = [(BMProcessCrash *)self bundleVersion];
  v8 = [(BMProcessCrash *)self exception];
  uint64_t v9 = [v8 jsonDictionary];

  v10 = [(BMProcessCrash *)self terminationReason];
  uint64_t v11 = [v10 jsonDictionary];

  v40 = [(BMProcessCrash *)self responsibleApp];
  v39 = [(BMProcessCrash *)self coalitionName];
  if ([(BMProcessCrash *)self hasIsFirstParty])
  {
    int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProcessCrash isFirstParty](self, "isFirstParty"));
  }
  else
  {
    int v12 = 0;
  }
  if ([(BMProcessCrash *)self hasIsBeta])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProcessCrash isBeta](self, "isBeta"));
  }
  else
  {
    v13 = 0;
  }
  v41[0] = @"incidentID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v14;
  v42[0] = v14;
  v41[1] = @"processName";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v15;
  v42[1] = v15;
  v41[2] = @"bundleID";
  uint64_t v16 = v5;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v4;
  uint64_t v38 = (void *)v3;
  int v30 = (void *)v16;
  v42[2] = v16;
  v41[3] = @"appVersion";
  uint64_t v17 = v6;
  if (!v6)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v5;
  v29 = (void *)v17;
  v42[3] = v17;
  v41[4] = @"bundleVersion";
  uint64_t v18 = v7;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v6;
  v28 = (void *)v18;
  v42[4] = v18;
  v41[5] = @"exception";
  v19 = (void *)v9;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v7;
  v42[5] = v19;
  v41[6] = @"terminationReason";
  uint64_t v20 = (void *)v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v42[6] = v20;
  v41[7] = @"responsibleApp";
  v22 = v40;
  if (!v40)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v11;
  v42[7] = v22;
  v41[8] = @"coalitionName";
  int v24 = v39;
  if (!v39)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[8] = v24;
  v41[9] = @"isFirstParty";
  v25 = v12;
  if (!v12)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[9] = v25;
  v41[10] = @"isBeta";
  uint64_t v26 = v13;
  if (!v13)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[10] = v26;
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:11];
  if (v13)
  {
    if (v12) {
      goto LABEL_31;
    }
  }
  else
  {

    if (v12) {
      goto LABEL_31;
    }
  }

LABEL_31:
  if (!v39) {

  }
  if (!v40) {
  if (!v23)
  }

  if (!v21) {
  if (!v34)
  }

  if (!v35) {
  if (v36)
  }
  {
    if (v37) {
      goto LABEL_45;
    }
LABEL_52:

    if (v38) {
      goto LABEL_46;
    }
    goto LABEL_53;
  }

  if (!v37) {
    goto LABEL_52;
  }
LABEL_45:
  if (v38) {
    goto LABEL_46;
  }
LABEL_53:

LABEL_46:

  return v33;
}

- (BMProcessCrash)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v133[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"incidentID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"processName"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v27 = 0;
          goto LABEL_90;
        }
        id v39 = v8;
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        v93 = a4;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v130 = *MEMORY[0x1E4F28568];
        v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"processName"];
        v131 = v28;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
        int v42 = v40;
        id v8 = v39;
        id v43 = (id)[v42 initWithDomain:v41 code:2 userInfo:v10];
        a4 = 0;
        v27 = 0;
        id *v93 = v43;
        goto LABEL_89;
      }
      id v108 = v9;
    }
    else
    {
      id v108 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"bundleID"];
    v109 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v28 = 0;
          v27 = v108;
          goto LABEL_89;
        }
        id v44 = v8;
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        v46 = a4;
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v128 = *MEMORY[0x1E4F28568];
        uint64_t v48 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        uint64_t v129 = v48;
        uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
        uint64_t v50 = v45;
        id v8 = v44;
        id v51 = (id)[v50 initWithDomain:v47 code:2 userInfo:v49];
        a4 = 0;
        v28 = 0;
        id *v46 = v51;
        uint64_t v11 = (void *)v49;
        v52 = (void *)v48;
        v27 = v108;
LABEL_88:

        self = v109;
LABEL_89:

        goto LABEL_90;
      }
      id v107 = v10;
    }
    else
    {
      id v107 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"appVersion"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v52 = 0;
          v28 = v107;
          v27 = v108;
          goto LABEL_88;
        }
        id v57 = v8;
        id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
        v94 = a4;
        uint64_t v59 = *MEMORY[0x1E4F502C8];
        uint64_t v126 = *MEMORY[0x1E4F28568];
        id v106 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appVersion"];
        id v127 = v106;
        uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
        int v61 = v58;
        id v8 = v57;
        v105 = (void *)v60;
        id v62 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v59, 2);
        a4 = 0;
        v52 = 0;
        id *v94 = v62;
        v28 = v107;
        v27 = v108;
        goto LABEL_87;
      }
      id v104 = v11;
    }
    else
    {
      id v104 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"bundleVersion"];
    id v103 = v8;
    v105 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v106 = 0;
          v28 = v107;
          v27 = v108;
          v52 = v104;
          goto LABEL_87;
        }
        id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
        v64 = v11;
        v65 = a4;
        uint64_t v66 = *MEMORY[0x1E4F502C8];
        uint64_t v124 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleVersion"];
        id v125 = v36;
        v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
        id v67 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v66, 2);
        a4 = 0;
        id v106 = 0;
        id *v65 = v67;
        uint64_t v11 = v64;
        v28 = v107;
        v27 = v108;
        goto LABEL_85;
      }
      id v106 = v13;
    }
    else
    {
      id v106 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"exception"];
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v95 = v9;
      uint64_t v15 = v14;
      uint64_t v16 = v10;
      v102 = 0;
LABEL_19:
      uint64_t v17 = [v6 objectForKeyedSubscript:@"terminationReason"];
      v99 = (void *)v17;
      if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v100 = 0;
LABEL_22:
        uint64_t v19 = [v6 objectForKeyedSubscript:@"responsibleApp"];
        v10 = v16;
        v83 = v15;
        v84 = (void *)v19;
        if (v19 && (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v68 = a4;
          objc_opt_class();
          uint64_t v9 = v95;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              a4 = 0;
              v29 = 0;
              v28 = v107;
              v27 = v108;
              int v30 = v83;
              goto LABEL_39;
            }
            id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v91 = *MEMORY[0x1E4F502C8];
            uint64_t v118 = *MEMORY[0x1E4F28568];
            id v85 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"responsibleApp"];
            id v119 = v85;
            v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
            a4 = 0;
            v29 = 0;
            id *v68 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v91, 2);
            v28 = v107;
            v27 = v108;
LABEL_38:
            int v30 = v83;

LABEL_39:
LABEL_83:

LABEL_84:
            id v36 = v30;
            goto LABEL_85;
          }
          id v89 = v20;
        }
        else
        {
          id v89 = 0;
          uint64_t v9 = v95;
        }
        uint64_t v21 = [v6 objectForKeyedSubscript:@"coalitionName"];
        v92 = a4;
        v82 = (void *)v21;
        if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v85 = 0;
              a4 = 0;
              goto LABEL_37;
            }
            id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v88 = *MEMORY[0x1E4F502C8];
            uint64_t v116 = *MEMORY[0x1E4F28568];
            id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"coalitionName"];
            id v117 = v24;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
            id v76 = (id)[v96 initWithDomain:v88 code:2 userInfo:v23];
            a4 = 0;
            id v85 = 0;
            id *v92 = v76;
LABEL_36:

LABEL_37:
            v28 = v107;
            v27 = v108;
            v29 = v89;
            goto LABEL_38;
          }
          id v85 = v22;
        }
        else
        {
          id v85 = 0;
        }
        v23 = [v6 objectForKeyedSubscript:@"isFirstParty"];
        if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v24 = 0;
              a4 = 0;
              goto LABEL_36;
            }
            id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v97 = *MEMORY[0x1E4F502C8];
            uint64_t v114 = *MEMORY[0x1E4F28568];
            id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFirstParty"];
            id v115 = v26;
            v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
            id v78 = (id)[v77 initWithDomain:v97 code:2 userInfo:v25];
            a4 = 0;
            id v24 = 0;
            id *v92 = v78;
            goto LABEL_35;
          }
          id v24 = v23;
        }
        else
        {
          id v24 = 0;
        }
        v25 = [v6 objectForKeyedSubscript:@"isBeta"];
        if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v81 = *MEMORY[0x1E4F502C8];
              uint64_t v112 = *MEMORY[0x1E4F28568];
              v79 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBeta"];
              v113 = v79;
              v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
              id *v92 = (id)[v98 initWithDomain:v81 code:2 userInfo:v80];
            }
            id v26 = 0;
            a4 = 0;
            goto LABEL_35;
          }
          id v26 = v25;
        }
        else
        {
          id v26 = 0;
        }
        a4 = [(BMProcessCrash *)v109 initWithIncidentID:v103 processName:v108 bundleID:v107 appVersion:v104 bundleVersion:v106 exception:v102 terminationReason:v100 responsibleApp:v89 coalitionName:v85 isFirstParty:v24 isBeta:v26];
        v109 = (BMProcessCrash *)a4;
LABEL_35:

        goto LABEL_36;
      }
      v87 = v11;
      v53 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v54 = v18;
        id v110 = 0;
        v100 = [[BMProcessCrashTerminationReason alloc] initWithJSONDictionary:v54 error:&v110];
        id v55 = v110;
        if (!v55)
        {

          a4 = v53;
          uint64_t v11 = v87;
          goto LABEL_22;
        }
        uint64_t v56 = v55;
        id v90 = v54;
        v28 = v107;
        v27 = v108;
        if (v53) {
          id *v53 = v55;
        }

        a4 = 0;
        uint64_t v11 = v87;
        v29 = v90;
      }
      else
      {
        if (!a4)
        {
          a4 = 0;
          v28 = v107;
          v27 = v108;
          uint64_t v11 = v87;
          v10 = v16;
          int v30 = v15;
          uint64_t v9 = v95;
          goto LABEL_84;
        }
        v71 = a4;
        id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v73 = *MEMORY[0x1E4F502C8];
        uint64_t v120 = *MEMORY[0x1E4F28568];
        v100 = (BMProcessCrashTerminationReason *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"terminationReason"];
        v121 = v100;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        a4 = 0;
        id *v71 = (id)[v72 initWithDomain:v73 code:2 userInfo:v29];
        v28 = v107;
        v27 = v108;
        uint64_t v11 = v87;
      }
      v10 = v16;
      int v30 = v15;
      uint64_t v9 = v95;
      goto LABEL_83;
    }
    v86 = v11;
    v35 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v14;
      id v111 = 0;
      v102 = [[BMProcessCrashException alloc] initWithJSONDictionary:v36 error:&v111];
      id v37 = v111;
      if (!v37)
      {
        v95 = v9;
        uint64_t v15 = v14;
        uint64_t v16 = v10;

        uint64_t v11 = v86;
        goto LABEL_19;
      }
      uint64_t v38 = v37;
      v28 = v107;
      v27 = v108;
      if (v35) {
        id *v35 = v37;
      }

      a4 = 0;
    }
    else
    {
      if (!a4)
      {
        a4 = 0;
        v28 = v107;
        v27 = v108;
        uint64_t v11 = v86;
        goto LABEL_86;
      }
      id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v101 = *MEMORY[0x1E4F502C8];
      uint64_t v122 = *MEMORY[0x1E4F28568];
      v102 = (BMProcessCrashException *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"exception"];
      v123 = v102;
      v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
      *a4 = (id)[v69 initWithDomain:v101 code:2 userInfo:v70];

      a4 = 0;
      id v36 = v14;
      v28 = v107;
      v27 = v108;
    }
    uint64_t v11 = v86;
LABEL_85:

    uint64_t v14 = v36;
LABEL_86:

    id v8 = v103;
    v52 = v104;
LABEL_87:

    goto LABEL_88;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v32 = a4;
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v132 = *MEMORY[0x1E4F28568];
    v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"incidentID"];
    v133[0] = v27;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:&v132 count:1];
    id v34 = (id)[v31 initWithDomain:v33 code:2 userInfo:v9];
    a4 = 0;
    id v8 = 0;
    *uint64_t v32 = v34;
LABEL_90:

    goto LABEL_91;
  }
  id v8 = 0;
LABEL_91:

  return (BMProcessCrash *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProcessCrash *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_incidentID) {
    PBDataWriterWriteStringField();
  }
  if (self->_processName) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_appVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_exception)
  {
    PBDataWriterPlaceMark();
    [(BMProcessCrashException *)self->_exception writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_terminationReason)
  {
    PBDataWriterPlaceMark();
    [(BMProcessCrashTerminationReason *)self->_terminationReason writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_responsibleApp) {
    PBDataWriterWriteStringField();
  }
  if (self->_coalitionName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsFirstParty) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBeta) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMProcessCrash;
  uint64_t v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_63;
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
          uint64_t v20 = 24;
          goto LABEL_36;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_36;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_36;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_36;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_36;
        case 6u:
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_62;
          }
          uint64_t v21 = [[BMProcessCrashException alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_62;
          }
          uint64_t v22 = 64;
          goto LABEL_33;
        case 7u:
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_62;
          }
          uint64_t v21 = [[BMProcessCrashTerminationReason alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_62;
          }
          uint64_t v22 = 72;
LABEL_33:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = v21;

          PBReaderRecallMark();
          continue;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 80;
          goto LABEL_36;
        case 9u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 88;
LABEL_36:
          id v24 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 0xAu:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasIsFirstParty = 1;
          while (2)
          {
            uint64_t v28 = *v6;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  uint64_t v27 = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_54:
          BOOL v37 = v27 != 0;
          uint64_t v38 = 16;
          goto LABEL_59;
        case 0xBu:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasIsBeta = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_62;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v6;
        unint64_t v35 = *(void *)&v4[v34];
        if (v35 == -1 || v35 >= *(void *)&v4[*v7]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
        *(void *)&v4[v34] = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0) {
          goto LABEL_56;
        }
        v31 += 7;
        BOOL v16 = v32++ >= 9;
        if (v16)
        {
          uint64_t v33 = 0;
          goto LABEL_58;
        }
      }
      v4[*v8] = 1;
LABEL_56:
      if (v4[*v8]) {
        uint64_t v33 = 0;
      }
LABEL_58:
      BOOL v37 = v33 != 0;
      uint64_t v38 = 18;
LABEL_59:
      *((unsigned char *)&v5->super.super.isa + v38) = v37;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_62:
  }
    id v39 = 0;
  else {
LABEL_63:
  }
    id v39 = v5;

  return v39;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unint64_t v14 = [(BMProcessCrash *)self incidentID];
  unint64_t v12 = [(BMProcessCrash *)self processName];
  uint64_t v3 = [(BMProcessCrash *)self bundleID];
  id v4 = [(BMProcessCrash *)self appVersion];
  uint64_t v5 = [(BMProcessCrash *)self bundleVersion];
  uint64_t v13 = [(BMProcessCrash *)self exception];
  id v6 = [(BMProcessCrash *)self terminationReason];
  uint64_t v7 = [(BMProcessCrash *)self responsibleApp];
  id v8 = [(BMProcessCrash *)self coalitionName];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProcessCrash isFirstParty](self, "isFirstParty"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProcessCrash isBeta](self, "isBeta"));
  BOOL v16 = (void *)[v15 initWithFormat:@"BMProcessCrash with incidentID: %@, processName: %@, bundleID: %@, appVersion: %@, bundleVersion: %@, exception: %@, terminationReason: %@, responsibleApp: %@, coalitionName: %@, isFirstParty: %@, isBeta: %@", v14, v12, v3, v4, v5, v13, v6, v7, v8, v9, v10];

  return (NSString *)v16;
}

- (BMProcessCrash)initWithIncidentID:(id)a3 processName:(id)a4 bundleID:(id)a5 appVersion:(id)a6 bundleVersion:(id)a7 exception:(id)a8 terminationReason:(id)a9 responsibleApp:(id)a10 coalitionName:(id)a11 isFirstParty:(id)a12 isBeta:(id)a13
{
  id v33 = a3;
  id v23 = a4;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  id v27 = a9;
  id v26 = a10;
  id v25 = a11;
  id v18 = a12;
  id v19 = a13;
  v34.receiver = self;
  v34.super_class = (Class)BMProcessCrash;
  uint64_t v20 = [(BMEventBase *)&v34 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_incidentID, a3);
    objc_storeStrong((id *)&v20->_processName, v23);
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_appVersion, a6);
    objc_storeStrong((id *)&v20->_bundleVersion, a7);
    objc_storeStrong((id *)&v20->_exception, a8);
    objc_storeStrong((id *)&v20->_terminationReason, a9);
    objc_storeStrong((id *)&v20->_responsibleApp, a10);
    objc_storeStrong((id *)&v20->_coalitionName, a11);
    if (v18)
    {
      v20->_hasIsFirstParty = 1;
      v20->_isFirstParty = [v18 BOOLValue];
    }
    else
    {
      v20->_hasIsFirstParty = 0;
      v20->_isFirstParty = 0;
    }
    if (v19)
    {
      v20->_hasIsBeta = 1;
      v20->_isBeta = [v19 BOOLValue];
    }
    else
    {
      v20->_hasIsBeta = 0;
      v20->_isBeta = 0;
    }
  }

  return v20;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"incidentID" number:1 type:13 subMessageClass:0];
  v15[0] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"processName" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:3 type:13 subMessageClass:0];
  v15[2] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appVersion" number:4 type:13 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleVersion" number:5 type:13 subMessageClass:0];
  v15[4] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"exception" number:6 type:14 subMessageClass:objc_opt_class()];
  v15[5] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"terminationReason" number:7 type:14 subMessageClass:objc_opt_class()];
  v15[6] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"responsibleApp" number:8 type:13 subMessageClass:0];
  v15[7] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"coalitionName" number:9 type:13 subMessageClass:0];
  v15[8] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFirstParty" number:10 type:12 subMessageClass:0];
  v15[9] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBeta" number:11 type:12 subMessageClass:0];
  v15[10] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF53B8;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"incidentID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"processName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appVersion" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleVersion" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"exception_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_44036];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"terminationReason_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_200_44037];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"responsibleApp" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"coalitionName" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFirstParty" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBeta" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
}

id __25__BMProcessCrash_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 terminationReason];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __25__BMProcessCrash_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 exception];
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

    id v8 = [[BMProcessCrash alloc] initByReadFrom:v7];
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