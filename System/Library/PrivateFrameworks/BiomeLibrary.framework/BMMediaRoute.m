@interface BMMediaRoute
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMediaRoute)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMediaRoute)initWithRouteType:(int)a3 groupLeaderOutputDeviceID:(id)a4 isRemoteControl:(id)a5 outputDevices:(id)a6;
- (BOOL)hasIsRemoteControl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoteControl;
- (NSArray)outputDevices;
- (NSString)description;
- (NSString)groupLeaderOutputDeviceID;
- (id)_outputDevicesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)routeType;
- (unsigned)dataVersion;
- (void)setHasIsRemoteControl:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_groupLeaderOutputDeviceID, 0);
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setHasIsRemoteControl:(BOOL)a3
{
  self->_hasIsRemoteControl = a3;
}

- (BOOL)hasIsRemoteControl
{
  return self->_hasIsRemoteControl;
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (NSString)groupLeaderOutputDeviceID
{
  return self->_groupLeaderOutputDeviceID;
}

- (int)routeType
{
  return self->_routeType;
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
    int v6 = [(BMMediaRoute *)self routeType];
    if (v6 == [v5 routeType])
    {
      v7 = [(BMMediaRoute *)self groupLeaderOutputDeviceID];
      uint64_t v8 = [v5 groupLeaderOutputDeviceID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMediaRoute *)self groupLeaderOutputDeviceID];
        v11 = [v5 groupLeaderOutputDeviceID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_13;
        }
      }
      if (![(BMMediaRoute *)self hasIsRemoteControl]
        && ![v5 hasIsRemoteControl]
        || [(BMMediaRoute *)self hasIsRemoteControl]
        && [v5 hasIsRemoteControl]
        && (int v14 = [(BMMediaRoute *)self isRemoteControl],
            v14 == [v5 isRemoteControl]))
      {
        v16 = [(BMMediaRoute *)self outputDevices];
        v17 = [v5 outputDevices];
        if (v16 == v17)
        {
          char v13 = 1;
        }
        else
        {
          v18 = [(BMMediaRoute *)self outputDevices];
          v19 = [v5 outputDevices];
          char v13 = [v18 isEqual:v19];
        }
        goto LABEL_14;
      }
    }
LABEL_13:
    char v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  char v13 = 0;
LABEL_15:

  return v13;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaRoute routeType](self, "routeType"));
  id v4 = [(BMMediaRoute *)self groupLeaderOutputDeviceID];
  if ([(BMMediaRoute *)self hasIsRemoteControl])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaRoute isRemoteControl](self, "isRemoteControl"));
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [(BMMediaRoute *)self _outputDevicesJSONArray];
  v13[0] = @"routeType";
  v7 = v3;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"groupLeaderOutputDeviceID";
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"isRemoteControl";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"outputDevices";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v11;
}

- (id)_outputDevicesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMediaRoute *)self outputDevices];
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

- (BMMediaRoute)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"routeType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"groupLeaderOutputDeviceID"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v27 = 0;
          goto LABEL_52;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v62 = a4;
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        v30 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"groupLeaderOutputDeviceID"];
        v85 = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        v32 = v28;
        long long v13 = (void *)v31;
        uint64_t v33 = v29;
        a4 = v30;
        v27 = 0;
        id v11 = 0;
        id *v62 = (id)[v32 initWithDomain:v33 code:2 userInfo:v31];
        goto LABEL_51;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"isRemoteControl"];
    v68 = v10;
    v69 = v7;
    v67 = (void *)v12;
    if (v12 && (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v34 = v11;
          v35 = a4;
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = *MEMORY[0x1E4F502C8];
          uint64_t v82 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isRemoteControl"];
          id v83 = v14;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id v38 = (id)[v36 initWithDomain:v37 code:2 userInfo:v17];
          v27 = 0;
          a4 = 0;
          id *v35 = v38;
          id v11 = v34;
          goto LABEL_49;
        }
        v27 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v66 = v13;
    }
    else
    {
      v66 = 0;
    }
    id v14 = [v6 objectForKeyedSubscript:@"outputDevices"];
    v15 = [MEMORY[0x1E4F1CA98] null];
    int v16 = [v14 isEqual:v15];

    if (v16)
    {
      id v64 = v11;
      v65 = self;
      v61 = a4;
      id v63 = v6;

      id v14 = 0;
LABEL_20:
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v14 = v14;
      uint64_t v18 = [v14 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (!v18) {
        goto LABEL_30;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v72;
      v60 = v8;
LABEL_22:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v72 != v20) {
          objc_enumerationMutation(v14);
        }
        v22 = *(void **)(*((void *)&v71 + 1) + 8 * v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v39 = v61;
          id v6 = v63;
          uint64_t v8 = v60;
          a4 = v66;
          if (!v61) {
            goto LABEL_48;
          }
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"outputDevices"];
          id v76 = v23;
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          v43 = &v76;
          v44 = &v75;
          goto LABEL_43;
        }
        id v23 = v22;
        v24 = [BMMediaRouteOutputDevice alloc];
        id v70 = 0;
        v25 = [(BMMediaRouteOutputDevice *)v24 initWithJSONDictionary:v23 error:&v70];
        id v26 = v70;
        if (v26)
        {
          v45 = v26;
          if (v61) {
            id *v61 = v26;
          }

          id v6 = v63;
          uint64_t v8 = v60;
          a4 = v66;
LABEL_47:

LABEL_48:
          v27 = 0;
          id v11 = v64;
          self = v65;
          goto LABEL_49;
        }
        [v17 addObject:v25];

        if (v19 == ++v21)
        {
          uint64_t v19 = [v14 countByEnumeratingWithState:&v71 objects:v79 count:16];
          uint64_t v8 = v60;
          if (v19) {
            goto LABEL_22;
          }
LABEL_30:

          id v11 = v64;
          a4 = v66;
          self = -[BMMediaRoute initWithRouteType:groupLeaderOutputDeviceID:isRemoteControl:outputDevices:](v65, "initWithRouteType:groupLeaderOutputDeviceID:isRemoteControl:outputDevices:", [v8 intValue], v64, v66, v17);
          v27 = self;
          id v6 = v63;
LABEL_49:

          goto LABEL_50;
        }
      }
      v39 = v61;
      id v6 = v63;
      uint64_t v8 = v60;
      a4 = v66;
      if (!v61) {
        goto LABEL_48;
      }
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"outputDevices"];
      id v78 = v23;
      v42 = (void *)MEMORY[0x1E4F1C9E8];
      v43 = &v78;
      v44 = &v77;
LABEL_43:
      v45 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
      v46 = v40;
      a4 = v66;
      id *v39 = (id)[v46 initWithDomain:v41 code:2 userInfo:v45];
      goto LABEL_47;
    }
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v64 = v11;
      v65 = self;
      v61 = a4;
      id v63 = v6;
      goto LABEL_20;
    }
    if (a4)
    {
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v49 = v11;
      v50 = a4;
      uint64_t v51 = *MEMORY[0x1E4F502C8];
      uint64_t v80 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"outputDevices"];
      v81 = v17;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      id *v50 = (id)[v48 initWithDomain:v51 code:2 userInfo:v52];
      id v11 = v49;

      v27 = 0;
      a4 = v66;
      goto LABEL_49;
    }
    v27 = 0;
    a4 = v66;
LABEL_50:

    v10 = v68;
    uint64_t v7 = v69;
    long long v13 = v67;
    goto LABEL_51;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMMediaRouteRouteTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    v27 = 0;
    goto LABEL_53;
  }
  id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
  v54 = a4;
  uint64_t v55 = *MEMORY[0x1E4F502C8];
  uint64_t v86 = *MEMORY[0x1E4F28568];
  v56 = self;
  id v57 = [NSString alloc];
  uint64_t v59 = objc_opt_class();
  v58 = v57;
  self = v56;
  id v11 = (id)[v58 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v59, @"routeType"];
  v87[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
  uint64_t v8 = 0;
  v27 = 0;
  id *v54 = (id)[v53 initWithDomain:v55 code:2 userInfo:v10];
LABEL_52:

LABEL_53:
  return v27;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMediaRoute *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_groupLeaderOutputDeviceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsRemoteControl) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_outputDevices;
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
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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
  v41.receiver = self;
  v41.super_class = (Class)BMMediaRoute;
  uint64_t v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_53;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (1)
          {
            uint64_t v23 = *v7;
            unint64_t v24 = *(void *)&v4[v23];
            if (v24 == -1 || v24 >= *(void *)&v4[*v8]) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)&v4[*v10] + v24);
            *(void *)&v4[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0) {
              goto LABEL_41;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_43;
            }
          }
          v4[*v9] = 1;
LABEL_41:
          if (v4[*v9]) {
            LODWORD(v22) = 0;
          }
LABEL_43:
          if (v22 >= 3) {
            LODWORD(v22) = 0;
          }
          v5->_routeType = v22;
          continue;
        case 2u:
          uint64_t v26 = PBReaderReadString();
          groupLeaderOutputDeviceID = v5->_groupLeaderOutputDeviceID;
          v5->_groupLeaderOutputDeviceID = (NSString *)v26;

          continue;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasIsRemoteControl = 1;
          break;
        case 4u:
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_55;
          }
          id v34 = [[BMMediaRouteOutputDevice alloc] initByReadFrom:v4];
          if (!v34) {
            goto LABEL_55;
          }
          v35 = v34;
          [v6 addObject:v34];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_55:

          goto LABEL_52;
      }
      while (1)
      {
        uint64_t v31 = *v7;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 == -1 || v32 >= *(void *)&v4[*v8]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v10] + v32);
        *(void *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0) {
          goto LABEL_47;
        }
        v28 += 7;
        BOOL v17 = v29++ >= 9;
        if (v17)
        {
          uint64_t v30 = 0;
          goto LABEL_49;
        }
      }
      v4[*v9] = 1;
LABEL_47:
      if (v4[*v9]) {
        uint64_t v30 = 0;
      }
LABEL_49:
      v5->_isRemoteControl = v30 != 0;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v36 = [v6 copy];
  outputDevices = v5->_outputDevices;
  v5->_outputDevices = (NSArray *)v36;

  int v38 = v4[*v9];
  if (v38) {
LABEL_52:
  }
    v39 = 0;
  else {
LABEL_53:
  }
    v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMediaRouteRouteTypeAsString([(BMMediaRoute *)self routeType]);
  uint64_t v5 = [(BMMediaRoute *)self groupLeaderOutputDeviceID];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaRoute isRemoteControl](self, "isRemoteControl"));
  uint64_t v7 = [(BMMediaRoute *)self outputDevices];
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMMediaRoute with routeType: %@, groupLeaderOutputDeviceID: %@, isRemoteControl: %@, outputDevices: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMMediaRoute)initWithRouteType:(int)a3 groupLeaderOutputDeviceID:(id)a4 isRemoteControl:(id)a5 outputDevices:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMMediaRoute;
  uint64_t v14 = [(BMEventBase *)&v16 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v14->_routeType = a3;
    objc_storeStrong((id *)&v14->_groupLeaderOutputDeviceID, a4);
    if (v12)
    {
      v14->_hasIsRemoteControl = 1;
      v14->_isRemoteControl = [v12 BOOLValue];
    }
    else
    {
      v14->_hasIsRemoteControl = 0;
      v14->_isRemoteControl = 0;
    }
    objc_storeStrong((id *)&v14->_outputDevices, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"routeType" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupLeaderOutputDeviceID" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRemoteControl" number:3 type:12 subMessageClass:0];
  v8[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"outputDevices" number:4 type:14 subMessageClass:objc_opt_class()];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4AA0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"routeType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupLeaderOutputDeviceID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRemoteControl" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"outputDevices_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_294];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __23__BMMediaRoute_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _outputDevicesJSONArray];
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

    uint64_t v8 = [[BMMediaRoute alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end