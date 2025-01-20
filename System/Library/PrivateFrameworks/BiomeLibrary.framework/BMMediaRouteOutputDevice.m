@interface BMMediaRouteOutputDevice
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMediaRouteOutputDevice)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMMediaRouteOutputDevice)initWithOutputDeviceID:(id)a3 type:(int)a4 subType:(int)a5 clusterType:(int)a6 flattenedClusterLeafMembers:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)flattenedClusterLeafMembers;
- (NSString)description;
- (NSString)outputDeviceID;
- (id)_flattenedClusterLeafMembersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)clusterType;
- (int)subType;
- (int)type;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaRouteOutputDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flattenedClusterLeafMembers, 0);

  objc_storeStrong((id *)&self->_outputDeviceID, 0);
}

- (NSArray)flattenedClusterLeafMembers
{
  return self->_flattenedClusterLeafMembers;
}

- (int)clusterType
{
  return self->_clusterType;
}

- (int)subType
{
  return self->_subType;
}

- (int)type
{
  return self->_type;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
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
    v6 = [(BMMediaRouteOutputDevice *)self outputDeviceID];
    uint64_t v7 = [v5 outputDeviceID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMediaRouteOutputDevice *)self outputDeviceID];
      v10 = [v5 outputDeviceID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    int v13 = [(BMMediaRouteOutputDevice *)self type];
    if (v13 == [v5 type])
    {
      int v14 = [(BMMediaRouteOutputDevice *)self subType];
      if (v14 == [v5 subType])
      {
        int v15 = [(BMMediaRouteOutputDevice *)self clusterType];
        if (v15 == [v5 clusterType])
        {
          v16 = [(BMMediaRouteOutputDevice *)self flattenedClusterLeafMembers];
          v17 = [v5 flattenedClusterLeafMembers];
          if (v16 == v17)
          {
            char v12 = 1;
          }
          else
          {
            v18 = [(BMMediaRouteOutputDevice *)self flattenedClusterLeafMembers];
            v19 = [v5 flattenedClusterLeafMembers];
            char v12 = [v18 isEqual:v19];
          }
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    char v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v12 = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMediaRouteOutputDevice *)self outputDeviceID];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaRouteOutputDevice type](self, "type"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaRouteOutputDevice subType](self, "subType"));
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaRouteOutputDevice clusterType](self, "clusterType"));
  uint64_t v7 = [(BMMediaRouteOutputDevice *)self _flattenedClusterLeafMembersJSONArray];
  v17 = @"outputDeviceID";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"type";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"subType";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"clusterType";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"flattenedClusterLeafMembers";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  int v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4) {
      goto LABEL_15;
    }
LABEL_22:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v4) {
    goto LABEL_22;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)_flattenedClusterLeafMembersJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMediaRouteOutputDevice *)self flattenedClusterLeafMembers];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMediaRouteOutputDevice)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"outputDeviceID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"type"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v74 = v9;
      }
      else
      {
        id v35 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!p_isa)
          {
            v30 = 0;
            goto LABEL_62;
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          v50 = v9;
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v92 = *MEMORY[0x1E4F28568];
          v52 = p_isa;
          id v75 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          id v93 = v75;
          uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          uint64_t v54 = v51;
          v9 = v50;
          v73 = (void *)v53;
          v30 = 0;
          p_isa = 0;
          id *v52 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v54, 2);
          id v8 = v35;
          goto LABEL_61;
        }
        id v74 = [NSNumber numberWithInt:BMMediaRouteOutputDeviceTypeFromString(v9)];
      }
    }
    else
    {
      id v74 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"subType"];
    v73 = (void *)v10;
    if (v10 && (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v75 = v11;
      }
      else
      {
        id v68 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!p_isa)
          {
            id v75 = 0;
            goto LABEL_60;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          v56 = v9;
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v90 = *MEMORY[0x1E4F28568];
          v58 = p_isa;
          uint64_t v59 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"subType"];
          uint64_t v91 = v59;
          v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
          uint64_t v60 = v57;
          v9 = v56;
          v27 = (void *)v59;
          id v75 = 0;
          p_isa = 0;
          id *v58 = (id)[v55 initWithDomain:v60 code:2 userInfo:v43];
          id v8 = v68;
LABEL_59:

LABEL_60:
          v30 = v74;
LABEL_61:

          goto LABEL_62;
        }
        id v75 = [NSNumber numberWithInt:BMMediaRouteOutputDeviceSubTypeFromString(v11)];
      }
    }
    else
    {
      id v75 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"clusterType"];
    v70 = v7;
    v71 = v9;
    v72 = (void *)v12;
    if (v12 && (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v69 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (p_isa)
          {
            id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v88 = *MEMORY[0x1E4F28568];
            v63 = p_isa;
            id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"clusterType"];
            id v89 = v14;
            v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            p_isa = 0;
            id *v63 = (id)[v61 initWithDomain:v62 code:2 userInfo:v17];
            v27 = 0;
            goto LABEL_56;
          }
          v27 = 0;
LABEL_58:
          v43 = v72;
          goto LABEL_59;
        }
        id v69 = [NSNumber numberWithInt:BMMediaRouteOutputDeviceClusterTypeFromString(v13)];
      }
    }
    else
    {
      id v69 = 0;
    }
    id v14 = [v6 objectForKeyedSubscript:@"flattenedClusterLeafMembers"];
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    int v16 = [v14 isEqual:v15];

    if (v16)
    {
      v64 = p_isa;
      id v65 = v6;
      v66 = self;

      id v14 = 0;
LABEL_18:
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v14 = v14;
      uint64_t v18 = [v14 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (!v18) {
        goto LABEL_28;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v78;
      id v67 = v8;
LABEL_20:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v78 != v20) {
          objc_enumerationMutation(v14);
        }
        v22 = *(void **)(*((void *)&v77 + 1) + 8 * v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = v64;
          id v6 = v65;
          id v8 = v67;
          if (!v64) {
            goto LABEL_54;
          }
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v81 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"flattenedClusterLeafMembers"];
          id v82 = v23;
          v39 = (void *)MEMORY[0x1E4F1C9E8];
          v40 = &v82;
          v41 = &v81;
          goto LABEL_47;
        }
        id v23 = v22;
        v24 = [BMMediaRouteOutputDeviceClusterMember alloc];
        id v76 = 0;
        v25 = [(BMMediaRouteOutputDeviceClusterMember *)v24 initWithJSONDictionary:v23 error:&v76];
        id v26 = v76;
        if (v26)
        {
          v42 = v26;
          if (v64) {
            id *v64 = v26;
          }

          id v6 = v65;
          id v8 = v67;
LABEL_53:

LABEL_54:
          p_isa = 0;
          self = v66;
          goto LABEL_55;
        }
        [v17 addObject:v25];

        if (v19 == ++v21)
        {
          uint64_t v19 = [v14 countByEnumeratingWithState:&v77 objects:v85 count:16];
          id v8 = v67;
          if (v19) {
            goto LABEL_20;
          }
LABEL_28:

          v27 = v69;
          self = -[BMMediaRouteOutputDevice initWithOutputDeviceID:type:subType:clusterType:flattenedClusterLeafMembers:](v66, "initWithOutputDeviceID:type:subType:clusterType:flattenedClusterLeafMembers:", v8, [v74 intValue], objc_msgSend(v75, "intValue"), objc_msgSend(v69, "intValue"), v17);
          p_isa = (id *)&self->super.super.isa;
          id v6 = v65;
LABEL_56:

          uint64_t v7 = v70;
          v9 = v71;
          goto LABEL_57;
        }
      }
      v36 = v64;
      id v6 = v65;
      id v8 = v67;
      if (!v64) {
        goto LABEL_54;
      }
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v38 = *MEMORY[0x1E4F502C8];
      uint64_t v83 = *MEMORY[0x1E4F28568];
      id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"flattenedClusterLeafMembers"];
      id v84 = v23;
      v39 = (void *)MEMORY[0x1E4F1C9E8];
      v40 = &v84;
      v41 = &v83;
LABEL_47:
      v42 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:1];
      id *v36 = (id)[v37 initWithDomain:v38 code:2 userInfo:v42];
      goto LABEL_53;
    }
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v64 = p_isa;
      id v65 = v6;
      v66 = self;
      goto LABEL_18;
    }
    if (p_isa)
    {
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"flattenedClusterLeafMembers"];
      v87 = v17;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      v48 = v47 = p_isa;
      id *v47 = (id)[v45 initWithDomain:v46 code:2 userInfo:v48];

      p_isa = 0;
LABEL_55:
      v27 = v69;
      goto LABEL_56;
    }
    v9 = v71;
    v27 = v69;
LABEL_57:

    goto LABEL_58;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!p_isa)
  {
    id v8 = 0;
    goto LABEL_63;
  }
  id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v29 = *MEMORY[0x1E4F502C8];
  uint64_t v94 = *MEMORY[0x1E4F28568];
  v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"outputDeviceID"];
  v95[0] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
  uint64_t v32 = v29;
  v9 = (void *)v31;
  id v33 = (id)[v28 initWithDomain:v32 code:2 userInfo:v31];
  id v8 = 0;
  v34 = p_isa;
  p_isa = 0;
  id *v34 = v33;
LABEL_62:

LABEL_63:
  return (BMMediaRouteOutputDevice *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMediaRouteOutputDevice *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_outputDeviceID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_flattenedClusterLeafMembers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMMediaRouteOutputDevice;
  uint64_t v5 = [(BMEventBase *)&v46 init];
  if (!v5) {
    goto LABEL_69;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v17 = v12++ >= 9;
        if (v17)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          outputDeviceID = v5->_outputDeviceID;
          v5->_outputDeviceID = (NSString *)v20;

          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v25 = *v7;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v10] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v24) = 0;
          }
LABEL_50:
          if (v24 >= 6) {
            LODWORD(v24) = 0;
          }
          uint64_t v40 = 20;
          goto LABEL_65;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v30 = *v7;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v31);
              *(void *)&v4[v30] = v31 + 1;
              v24 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v17 = v29++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v24) = 0;
          }
LABEL_56:
          if (v24 >= 0x16) {
            LODWORD(v24) = 0;
          }
          uint64_t v40 = 24;
          goto LABEL_65;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v24 = 0;
          break;
        case 5u:
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          id v38 = [[BMMediaRouteOutputDeviceClusterMember alloc] initByReadFrom:v4];
          if (!v38) {
            goto LABEL_71;
          }
          v39 = v38;
          [v6 addObject:v38];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_71:

          goto LABEL_68;
      }
      while (1)
      {
        uint64_t v35 = *v7;
        unint64_t v36 = *(void *)&v4[v35];
        if (v36 == -1 || v36 >= *(void *)&v4[*v8]) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)&v4[*v10] + v36);
        *(void *)&v4[v35] = v36 + 1;
        v24 |= (unint64_t)(v37 & 0x7F) << v33;
        if ((v37 & 0x80) == 0) {
          goto LABEL_60;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_62;
        }
      }
      v4[*v9] = 1;
LABEL_60:
      if (v4[*v9]) {
        LODWORD(v24) = 0;
      }
LABEL_62:
      if (v24 >= 4) {
        LODWORD(v24) = 0;
      }
      uint64_t v40 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v40) = v24;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v41 = [v6 copy];
  flattenedClusterLeafMembers = v5->_flattenedClusterLeafMembers;
  v5->_flattenedClusterLeafMembers = (NSArray *)v41;

  int v43 = v4[*v9];
  if (v43) {
LABEL_68:
  }
    v44 = 0;
  else {
LABEL_69:
  }
    v44 = v5;

  return v44;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMediaRouteOutputDevice *)self outputDeviceID];
  uint64_t v5 = BMMediaRouteOutputDeviceTypeAsString([(BMMediaRouteOutputDevice *)self type]);
  uint64_t v6 = BMMediaRouteOutputDeviceSubTypeAsString([(BMMediaRouteOutputDevice *)self subType]);
  uint64_t v7 = BMMediaRouteOutputDeviceClusterTypeAsString([(BMMediaRouteOutputDevice *)self clusterType]);
  uint64_t v8 = [(BMMediaRouteOutputDevice *)self flattenedClusterLeafMembers];
  v9 = (void *)[v3 initWithFormat:@"BMMediaRouteOutputDevice with outputDeviceID: %@, type: %@, subType: %@, clusterType: %@, flattenedClusterLeafMembers: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMMediaRouteOutputDevice)initWithOutputDeviceID:(id)a3 type:(int)a4 subType:(int)a5 clusterType:(int)a6 flattenedClusterLeafMembers:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMMediaRouteOutputDevice;
  unint64_t v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_outputDeviceID, a3);
    v15->_type = a4;
    v15->_subType = a5;
    v15->_clusterType = a6;
    objc_storeStrong((id *)&v15->_flattenedClusterLeafMembers, a7);
  }

  return v15;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"outputDeviceID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"type", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subType" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clusterType" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flattenedClusterLeafMembers" number:5 type:14 subMessageClass:objc_opt_class()];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4A88;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"outputDeviceID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clusterType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"flattenedClusterLeafMembers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_249];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __35__BMMediaRouteOutputDevice_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _flattenedClusterLeafMembersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
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

    uint64_t v8 = [[BMMediaRouteOutputDevice alloc] initByReadFrom:v7];
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