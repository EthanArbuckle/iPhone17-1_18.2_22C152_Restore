@interface BMFrontBoardDisplayElementDisplay
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFrontBoardDisplayElementDisplay)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMFrontBoardDisplayElementDisplay)initWithType:(int)a3 name:(id)a4 deviceName:(id)a5 hardwareIdentifier:(id)a6 interfaceOrientation:(int)a7 backlightStatus:(int)a8 transitionReasons:(id)a9;
- (BOOL)isEqual:(id)a3;
- (NSArray)transitionReasons;
- (NSString)description;
- (NSString)deviceName;
- (NSString)hardwareIdentifier;
- (NSString)name;
- (id)_transitionReasonsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)backlightStatus;
- (int)interfaceOrientation;
- (int)type;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMFrontBoardDisplayElementDisplay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionReasons, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BMFrontBoardDisplayElementDisplay)initWithType:(int)a3 name:(id)a4 deviceName:(id)a5 hardwareIdentifier:(id)a6 interfaceOrientation:(int)a7 backlightStatus:(int)a8 transitionReasons:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)BMFrontBoardDisplayElementDisplay;
  v18 = [(BMEventBase *)&v22 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_name, a4);
    objc_storeStrong((id *)&v18->_deviceName, a5);
    objc_storeStrong((id *)&v18->_hardwareIdentifier, a6);
    v18->_interfaceOrientation = a7;
    v18->_backlightStatus = a8;
    objc_storeStrong((id *)&v18->_transitionReasons, a9);
  }

  return v18;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(BMFrontBoardDisplayElementDisplay *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMFrontBoardDisplayElementDisplay *)self name];
      uint64_t v8 = [v5 name];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMFrontBoardDisplayElementDisplay *)self name];
        v11 = [v5 name];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_20;
        }
      }
      id v14 = [(BMFrontBoardDisplayElementDisplay *)self deviceName];
      uint64_t v15 = [v5 deviceName];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        id v16 = (void *)v15;
        id v17 = [(BMFrontBoardDisplayElementDisplay *)self deviceName];
        v18 = [v5 deviceName];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_20;
        }
      }
      v20 = [(BMFrontBoardDisplayElementDisplay *)self hardwareIdentifier];
      uint64_t v21 = [v5 hardwareIdentifier];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        objc_super v22 = (void *)v21;
        v23 = [(BMFrontBoardDisplayElementDisplay *)self hardwareIdentifier];
        v24 = [v5 hardwareIdentifier];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_20;
        }
      }
      int v26 = [(BMFrontBoardDisplayElementDisplay *)self interfaceOrientation];
      if (v26 == [v5 interfaceOrientation])
      {
        int v27 = [(BMFrontBoardDisplayElementDisplay *)self backlightStatus];
        if (v27 == [v5 backlightStatus])
        {
          v28 = [(BMFrontBoardDisplayElementDisplay *)self transitionReasons];
          v29 = [v5 transitionReasons];
          if (v28 == v29)
          {
            char v13 = 1;
          }
          else
          {
            v30 = [(BMFrontBoardDisplayElementDisplay *)self transitionReasons];
            v31 = [v5 transitionReasons];
            char v13 = [v30 isEqual:v31];
          }
          goto LABEL_21;
        }
      }
    }
LABEL_20:
    char v13 = 0;
LABEL_21:

    goto LABEL_22;
  }
  char v13 = 0;
LABEL_22:

  return v13;
}

- (NSArray)transitionReasons
{
  return self->_transitionReasons;
}

- (int)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (int)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int)backlightStatus
{
  return self->_backlightStatus;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardwareIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_transitionReasons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (id)jsonDictionary
{
  v25[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFrontBoardDisplayElementDisplay type](self, "type"));
  uint64_t v4 = [(BMFrontBoardDisplayElementDisplay *)self name];
  id v5 = [(BMFrontBoardDisplayElementDisplay *)self deviceName];
  uint64_t v6 = [(BMFrontBoardDisplayElementDisplay *)self hardwareIdentifier];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFrontBoardDisplayElementDisplay interfaceOrientation](self, "interfaceOrientation"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFrontBoardDisplayElementDisplay backlightStatus](self, "backlightStatus"));
  uint64_t v9 = [(BMFrontBoardDisplayElementDisplay *)self _transitionReasonsJSONArray];
  v24[0] = @"type";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = (void *)v10;
  v25[0] = v10;
  v24[1] = @"name";
  uint64_t v11 = v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v11;
  v25[1] = v11;
  v24[2] = @"deviceName";
  uint64_t v12 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  int v19 = (void *)v12;
  v25[2] = v12;
  v24[3] = @"hardwareIdentifier";
  long long v13 = v6;
  if (!v6)
  {
    long long v13 = [MEMORY[0x1E4F1CA98] null];
  }
  objc_super v22 = (void *)v4;
  v25[3] = v13;
  v24[4] = @"interfaceOrientation";
  id v14 = v7;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v14;
  v24[5] = @"backlightStatus";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v15;
  v24[6] = @"transitionReasons";
  id v16 = v9;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (v9)
  {
    if (v8) {
      goto LABEL_17;
    }
LABEL_27:

    if (v7) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }

  if (!v8) {
    goto LABEL_27;
  }
LABEL_17:
  if (v7) {
    goto LABEL_18;
  }
LABEL_28:

LABEL_18:
  if (!v6) {

  }
  if (v5)
  {
    if (v22) {
      goto LABEL_22;
    }
LABEL_30:

    if (v23) {
      goto LABEL_23;
    }
    goto LABEL_31;
  }

  if (!v22) {
    goto LABEL_30;
  }
LABEL_22:
  if (v23) {
    goto LABEL_23;
  }
LABEL_31:

LABEL_23:

  return v17;
}

- (id)_transitionReasonsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMFrontBoardDisplayElementDisplay *)self transitionReasons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMFrontBoardDisplayElementDisplay)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v120[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (p_isa)
        {
          id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v64 = *MEMORY[0x1E4F502C8];
          uint64_t v119 = *MEMORY[0x1E4F28568];
          v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v120[0] = v28;
          long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:&v119 count:1];
          id v65 = (id)[v63 initWithDomain:v64 code:2 userInfo:v10];
          uint64_t v8 = 0;
          v66 = p_isa;
          p_isa = 0;
          id *v66 = v65;
          goto LABEL_84;
        }
        uint64_t v8 = 0;
        goto LABEL_85;
      }
      objc_msgSend(NSNumber, "numberWithInt:", bsearch_b(v7, BMFrontBoardDisplayElementDisplayTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_58087) != 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v10 = [v6 objectForKeyedSubscript:@"name"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v17 = v8;
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v117 = *MEMORY[0x1E4F28568];
        int v19 = v10;
        id v20 = [NSString alloc];
        uint64_t v80 = objc_opt_class();
        uint64_t v21 = v20;
        long long v10 = v19;
        uint64_t v22 = [v21 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v80, @"name"];
        uint64_t v118 = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
        v24 = v16;
        long long v11 = (void *)v23;
        uint64_t v25 = v18;
        uint64_t v8 = v17;
        int v26 = (void *)v22;
        id v27 = (id)[v24 initWithDomain:v25 code:2 userInfo:v23];
        v28 = 0;
        v29 = p_isa;
        p_isa = 0;
        id *v29 = v27;
        goto LABEL_83;
      }
      v28 = 0;
      goto LABEL_84;
    }
    id v96 = v10;
  }
  else
  {
    id v96 = 0;
  }
  long long v11 = [v6 objectForKeyedSubscript:@"deviceName"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
        v30 = v8;
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v115 = *MEMORY[0x1E4F28568];
        v32 = v10;
        id v33 = [NSString alloc];
        uint64_t v81 = objc_opt_class();
        v34 = v33;
        long long v10 = v32;
        id v97 = (id)[v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v81, @"deviceName"];
        id v116 = v97;
        long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
        uint64_t v35 = v31;
        uint64_t v8 = v30;
        id v36 = (id)[v94 initWithDomain:v35 code:2 userInfo:v12];
        int v26 = 0;
        v37 = p_isa;
        p_isa = 0;
        id *v37 = v36;
        v28 = v96;
        goto LABEL_82;
      }
      int v26 = 0;
      v28 = v96;
      goto LABEL_83;
    }
    id v92 = v11;
  }
  else
  {
    id v92 = 0;
  }
  long long v12 = [v6 objectForKeyedSubscript:@"hardwareIdentifier"];
  v95 = v8;
  v91 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v113 = *MEMORY[0x1E4F28568];
        v40 = v10;
        id v41 = [NSString alloc];
        uint64_t v82 = objc_opt_class();
        v42 = v41;
        long long v10 = v40;
        v93 = (void *)[v42 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v82, @"hardwareIdentifier"];
        v114 = v93;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        uint64_t v44 = v39;
        uint64_t v8 = v95;
        v90 = (void *)v43;
        id v45 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v44, 2);
        id v97 = 0;
        v46 = p_isa;
        p_isa = 0;
        id *v46 = v45;
        v28 = v96;
        int v26 = v92;
        goto LABEL_81;
      }
      id v97 = 0;
      v28 = v96;
      int v26 = v92;
      goto LABEL_82;
    }
    id v97 = v12;
  }
  else
  {
    id v97 = 0;
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:@"interfaceOrientation"];
  v87 = v12;
  v90 = (void *)v13;
  if (v13 && (id v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          v93 = 0;
          v28 = v96;
          int v26 = v92;
          goto LABEL_81;
        }
        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        v71 = v10;
        uint64_t v72 = *MEMORY[0x1E4F502C8];
        uint64_t v111 = *MEMORY[0x1E4F28568];
        v73 = p_isa;
        v89 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interfaceOrientation"];
        v112 = v89;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        uint64_t v74 = v72;
        long long v10 = v71;
        v93 = 0;
        p_isa = 0;
        id *v73 = (id)[v70 initWithDomain:v74 code:2 userInfo:v47];
        v28 = v96;
        goto LABEL_91;
      }
      id v15 = [NSNumber numberWithInt:BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString(v14)];
    }
    v93 = v15;
  }
  else
  {
    v93 = 0;
  }
  v47 = [v6 objectForKeyedSubscript:@"backlightStatus"];
  v88 = p_isa;
  v85 = v7;
  v86 = v10;
  if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v89 = 0;
    goto LABEL_46;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v48 = [NSNumber numberWithInt:BMFrontBoardDisplayElementDisplayBacklightStatusFromString(v47)];
      goto LABEL_45;
    }
    if (p_isa)
    {
      v75 = p_isa;
      id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v77 = *MEMORY[0x1E4F502C8];
      uint64_t v109 = *MEMORY[0x1E4F28568];
      id v49 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"backlightStatus"];
      id v110 = v49;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      id v78 = (id)[v76 initWithDomain:v77 code:2 userInfo:v52];
      v89 = 0;
      p_isa = 0;
      id *v75 = v78;
      v28 = v96;
      goto LABEL_76;
    }
    v89 = 0;
    v28 = v96;
LABEL_91:
    int v26 = v92;
    goto LABEL_80;
  }
  id v48 = v47;
LABEL_45:
  v89 = v48;
LABEL_46:
  id v49 = [v6 objectForKeyedSubscript:@"transitionReasons"];
  v50 = [MEMORY[0x1E4F1CA98] null];
  int v51 = [v49 isEqual:v50];

  if (!v51)
  {
    if (!v49) {
      goto LABEL_50;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_50;
    }
    v28 = v96;
    if (!v88)
    {
      p_isa = 0;
      int v26 = v92;
      goto LABEL_79;
    }
    id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v68 = *MEMORY[0x1E4F502C8];
    uint64_t v107 = *MEMORY[0x1E4F28568];
    v52 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"transitionReasons"];
    v108 = v52;
    v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    id *v88 = (id)[v67 initWithDomain:v68 code:2 userInfo:v69];

    p_isa = 0;
LABEL_76:
    int v26 = v92;
    goto LABEL_77;
  }

  id v49 = 0;
LABEL_50:
  v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v49, "count"));
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v49 = v49;
  uint64_t v53 = [v49 countByEnumeratingWithState:&v98 objects:v106 count:16];
  if (!v53) {
    goto LABEL_59;
  }
  uint64_t v54 = v53;
  uint64_t v55 = *(void *)v99;
  while (2)
  {
    for (uint64_t i = 0; i != v54; ++i)
    {
      if (*(void *)v99 != v55) {
        objc_enumerationMutation(v49);
      }
      uint64_t v57 = *(void *)(*((void *)&v98 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = v96;
        long long v12 = v87;
        int v26 = v92;
        if (v88)
        {
          id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v83 = *MEMORY[0x1E4F502C8];
          uint64_t v104 = *MEMORY[0x1E4F28568];
          v58 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"transitionReasons"];
          v105 = v58;
          v59 = (void *)MEMORY[0x1E4F1C9E8];
          v60 = &v105;
          v61 = &v104;
LABEL_64:
          v62 = [v59 dictionaryWithObjects:v60 forKeys:v61 count:1];
          id *v88 = (id)[v84 initWithDomain:v83 code:2 userInfo:v62];
        }
LABEL_65:

        p_isa = 0;
        goto LABEL_78;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = v96;
        long long v12 = v87;
        int v26 = v92;
        if (v88)
        {
          id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v83 = *MEMORY[0x1E4F502C8];
          uint64_t v102 = *MEMORY[0x1E4F28568];
          v58 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"transitionReasons"];
          v103 = v58;
          v59 = (void *)MEMORY[0x1E4F1C9E8];
          v60 = &v103;
          v61 = &v102;
          goto LABEL_64;
        }
        goto LABEL_65;
      }
      [v52 addObject:v57];
    }
    uint64_t v54 = [v49 countByEnumeratingWithState:&v98 objects:v106 count:16];
    if (v54) {
      continue;
    }
    break;
  }
LABEL_59:

  v28 = v96;
  int v26 = v92;
  self = -[BMFrontBoardDisplayElementDisplay initWithType:name:deviceName:hardwareIdentifier:interfaceOrientation:backlightStatus:transitionReasons:](self, "initWithType:name:deviceName:hardwareIdentifier:interfaceOrientation:backlightStatus:transitionReasons:", [v95 intValue], v96, v92, v97, objc_msgSend(v93, "intValue"), objc_msgSend(v89, "intValue"), v52);
  p_isa = (id *)&self->super.super.isa;
LABEL_77:
  long long v12 = v87;
LABEL_78:

  uint64_t v7 = v85;
LABEL_79:

  long long v10 = v86;
LABEL_80:

  uint64_t v8 = v95;
LABEL_81:

  long long v11 = v91;
LABEL_82:

LABEL_83:
LABEL_84:

LABEL_85:
  return (BMFrontBoardDisplayElementDisplay *)p_isa;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMFrontBoardDisplayElementDisplay *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMFrontBoardDisplayElementDisplay;
  uint64_t v5 = [(BMEventBase *)&v51 init];
  if (!v5) {
    goto LABEL_71;
  }
  id v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
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
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (1)
          {
            uint64_t v24 = *v7;
            uint64_t v25 = *(void *)&v4[v24];
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)&v4[*v8]) {
              break;
            }
            char v27 = *(unsigned char *)(*(void *)&v4[*v10] + v25);
            *(void *)&v4[v24] = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if ((v27 & 0x80) == 0) {
              goto LABEL_50;
            }
            v21 += 7;
            BOOL v18 = v22++ >= 9;
            if (v18)
            {
              LODWORD(v23) = 0;
              goto LABEL_52;
            }
          }
          v4[*v9] = 1;
LABEL_50:
          if (v4[*v9]) {
            LODWORD(v23) = 0;
          }
LABEL_52:
          if (v23 >= 2) {
            LODWORD(v23) = 0;
          }
          uint64_t v45 = 20;
          goto LABEL_67;
        case 2u:
          uint64_t v28 = PBReaderReadString();
          uint64_t v29 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v28 = PBReaderReadString();
          uint64_t v29 = 40;
          goto LABEL_32;
        case 4u:
          uint64_t v28 = PBReaderReadString();
          uint64_t v29 = 48;
LABEL_32:
          v30 = *(Class *)((char *)&v5->super.super.isa + v29);
          *(Class *)((char *)&v5->super.super.isa + v29) = (Class)v28;

          continue;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v33 = *v7;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v10] + v34);
              *(void *)&v4[v33] = v35;
              v23 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v18 = v32++ >= 9;
                if (v18)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v23) = 0;
          }
LABEL_58:
          if (v23 >= 5) {
            LODWORD(v23) = 0;
          }
          uint64_t v45 = 24;
          goto LABEL_67;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v23 = 0;
          break;
        case 7u:
          uint64_t v43 = PBReaderReadString();
          if (!v43) {
            goto LABEL_73;
          }
          uint64_t v44 = (void *)v43;
          [v6 addObject:v43];

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_73:

          goto LABEL_70;
      }
      while (1)
      {
        uint64_t v39 = *v7;
        uint64_t v40 = *(void *)&v4[v39];
        unint64_t v41 = v40 + 1;
        if (v40 == -1 || v41 > *(void *)&v4[*v8]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v10] + v40);
        *(void *)&v4[v39] = v41;
        v23 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0) {
          goto LABEL_62;
        }
        v37 += 7;
        BOOL v18 = v38++ >= 9;
        if (v18)
        {
          LODWORD(v23) = 0;
          goto LABEL_64;
        }
      }
      v4[*v9] = 1;
LABEL_62:
      if (v4[*v9]) {
        LODWORD(v23) = 0;
      }
LABEL_64:
      if (v23 >= 3) {
        LODWORD(v23) = 0;
      }
      uint64_t v45 = 28;
LABEL_67:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v23;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v46 = [v6 copy];
  transitionReasons = v5->_transitionReasons;
  v5->_transitionReasons = (NSArray *)v46;

  int v48 = v4[*v9];
  if (v48) {
LABEL_70:
  }
    id v49 = 0;
  else {
LABEL_71:
  }
    id v49 = v5;

  return v49;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = BMFrontBoardDisplayElementDisplayTypeAsString([(BMFrontBoardDisplayElementDisplay *)self type]);
  uint64_t v5 = [(BMFrontBoardDisplayElementDisplay *)self name];
  id v6 = [(BMFrontBoardDisplayElementDisplay *)self deviceName];
  uint64_t v7 = [(BMFrontBoardDisplayElementDisplay *)self hardwareIdentifier];
  uint64_t v8 = BMFrontBoardDisplayElementDisplayInterfaceOrientationAsString([(BMFrontBoardDisplayElementDisplay *)self interfaceOrientation]);
  id v9 = BMFrontBoardDisplayElementDisplayBacklightStatusAsString([(BMFrontBoardDisplayElementDisplay *)self backlightStatus]);
  long long v10 = [(BMFrontBoardDisplayElementDisplay *)self transitionReasons];
  char v11 = (void *)[v3 initWithFormat:@"BMFrontBoardDisplayElementDisplay with type: %@, name: %@, deviceName: %@, hardwareIdentifier: %@, interfaceOrientation: %@, backlightStatus: %@, transitionReasons: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"name", 2, 13, 0, v2);
  v11[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceName" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hardwareIdentifier" number:4 type:13 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interfaceOrientation" number:5 type:4 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"backlightStatus" number:6 type:4 subMessageClass:0];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transitionReasons" number:7 type:13 subMessageClass:0];
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5EF8;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceName" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hardwareIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interfaceOrientation" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"backlightStatus" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"transitionReasons_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_107_58157];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

id __44__BMFrontBoardDisplayElementDisplay_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _transitionReasonsJSONArray];
  uint64_t v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMFrontBoardDisplayElementDisplay alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

@end