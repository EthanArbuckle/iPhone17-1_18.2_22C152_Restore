@interface BMContextSyncDeviceActivityLevel
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextSyncDeviceActivityLevel)initWithID:(id)a3 deviceUUID:(id)a4 deviceActivityState:(id)a5;
- (BMContextSyncDeviceActivityLevel)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)deviceActivityState;
- (NSString)ID;
- (NSString)description;
- (NSString)deviceUUID;
- (id)_deviceActivityStateJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMContextSyncDeviceActivityLevel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceActivityState, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

- (NSArray)deviceActivityState
{
  return self->_deviceActivityState;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (NSString)ID
{
  return self->_ID;
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
    v6 = [(BMContextSyncDeviceActivityLevel *)self ID];
    uint64_t v7 = [v5 ID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextSyncDeviceActivityLevel *)self ID];
      v10 = [v5 ID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMContextSyncDeviceActivityLevel *)self deviceUUID];
    uint64_t v14 = [v5 deviceUUID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextSyncDeviceActivityLevel *)self deviceUUID];
      v17 = [v5 deviceUUID];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMContextSyncDeviceActivityLevel *)self deviceActivityState];
    v20 = [v5 deviceActivityState];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMContextSyncDeviceActivityLevel *)self deviceActivityState];
      v22 = [v5 deviceActivityState];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMContextSyncDeviceActivityLevel *)self ID];
  id v4 = [(BMContextSyncDeviceActivityLevel *)self deviceUUID];
  id v5 = [(BMContextSyncDeviceActivityLevel *)self _deviceActivityStateJSONArray];
  v11[0] = @"ID";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"deviceUUID";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"deviceActivityState";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)_deviceActivityStateJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMContextSyncDeviceActivityLevel *)self deviceActivityState];
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

- (BMContextSyncDeviceActivityLevel)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ID"];
  unint64_t v8 = 0x1E4F1C000uLL;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v26 = 0;
        goto LABEL_45;
      }
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v70 = *MEMORY[0x1E4F28568];
      v29 = a4;
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ID"];
      v71[0] = v25;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
      id v30 = (id)[v27 initWithDomain:v28 code:2 userInfo:v10];
      v26 = 0;
      a4 = 0;
      id *v29 = v30;
      goto LABEL_44;
    }
    v53 = a4;
    a4 = v7;
  }
  else
  {
    v53 = a4;
    a4 = 0;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"deviceUUID"];
  v54 = v7;
  v55 = (void *)v9;
  if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v52 = 0;
LABEL_7:
    id v11 = [v6 objectForKeyedSubscript:@"deviceActivityState"];
    long long v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      v50 = a4;
      id v51 = v6;

      id v11 = 0;
LABEL_12:
      long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v11 = v11;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (!v15) {
        goto LABEL_22;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v58;
      v49 = self;
LABEL_14:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v57 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self = v49;
          a4 = v50;
          v37 = v53;
          if (!v53) {
            goto LABEL_40;
          }
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"deviceActivityState"];
          id v62 = v21;
          v40 = (void *)MEMORY[0x1E4F1C9E8];
          v41 = &v62;
          v42 = &v61;
          goto LABEL_35;
        }
        unint64_t v20 = v8;
        id v21 = v19;
        v22 = [BMContextSyncDeviceActivityLevelDeviceActivityState alloc];
        id v56 = 0;
        v23 = [(BMContextSyncDeviceActivityLevelDeviceActivityState *)v22 initWithJSONDictionary:v21 error:&v56];
        id v24 = v56;
        if (v24)
        {
          v43 = v24;
          if (v53) {
            id *v53 = v24;
          }

          self = v49;
          a4 = v50;
LABEL_39:

LABEL_40:
          v26 = 0;
          id v6 = v51;
          goto LABEL_41;
        }
        [v14 addObject:v23];

        ++v18;
        unint64_t v8 = v20;
        if (v16 == v18)
        {
          uint64_t v16 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
          self = v49;
          if (v16) {
            goto LABEL_14;
          }
LABEL_22:

          a4 = v50;
          v25 = v52;
          self = [(BMContextSyncDeviceActivityLevel *)self initWithID:v50 deviceUUID:v52 deviceActivityState:v14];
          v26 = self;
          id v6 = v51;
LABEL_42:

          uint64_t v7 = v54;
          goto LABEL_43;
        }
      }
      self = v49;
      a4 = v50;
      v37 = v53;
      if (!v53) {
        goto LABEL_40;
      }
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v39 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"deviceActivityState"];
      id v64 = v21;
      v40 = (void *)MEMORY[0x1E4F1C9E8];
      v41 = &v64;
      v42 = &v63;
LABEL_35:
      v43 = [v40 dictionaryWithObjects:v41 forKeys:v42 count:1];
      id *v37 = (id)[v38 initWithDomain:v39 code:2 userInfo:v43];
      goto LABEL_39;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v50 = a4;
      id v51 = v6;
      goto LABEL_12;
    }
    if (v53)
    {
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      long long v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"deviceActivityState"];
      v67 = v14;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      id *v53 = (id)[v45 initWithDomain:v46 code:2 userInfo:v47];

      v26 = 0;
LABEL_41:
      v25 = v52;
      goto LABEL_42;
    }
    v26 = 0;
    v25 = v52;
LABEL_43:

    v10 = v55;
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v52 = v10;
    goto LABEL_7;
  }
  if (v53)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v32 = *MEMORY[0x1E4F502C8];
    uint64_t v68 = *MEMORY[0x1E4F28568];
    v33 = self;
    id v34 = [NSString alloc];
    uint64_t v48 = objc_opt_class();
    v35 = v34;
    self = v33;
    id v11 = (id)[v35 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v48, @"deviceUUID"];
    id v69 = v11;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    id v36 = (id)[v31 initWithDomain:v32 code:2 userInfo:v14];
    v26 = 0;
    v25 = 0;
    id *v53 = v36;
    goto LABEL_42;
  }
  v25 = 0;
  v26 = 0;
LABEL_44:

LABEL_45:
  return v26;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextSyncDeviceActivityLevel *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_ID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceUUID) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_deviceActivityState;
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
  v31.receiver = self;
  v31.super_class = (Class)BMContextSyncDeviceActivityLevel;
  uint64_t v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_32;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
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
        if (v12++ >= 9)
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
      unint64_t v20 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v23 = [[BMContextSyncDeviceActivityLevelDeviceActivityState alloc] initByReadFrom:v4]) == 0)
        {
LABEL_34:

          goto LABEL_31;
        }
        id v24 = v23;
        [v6 addObject:v23];
        PBReaderRecallMark();
      }
      else
      {
        if (v20 == 2)
        {
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
          goto LABEL_27;
        }
        if (v20 == 1)
        {
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 24;
LABEL_27:
          v25 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        }
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_34;
        }
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v26 = [v6 copy];
  deviceActivityState = v5->_deviceActivityState;
  v5->_deviceActivityState = (NSArray *)v26;

  int v28 = v4[*v9];
  if (v28) {
LABEL_31:
  }
    v29 = 0;
  else {
LABEL_32:
  }
    v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextSyncDeviceActivityLevel *)self ID];
  uint64_t v5 = [(BMContextSyncDeviceActivityLevel *)self deviceUUID];
  uint64_t v6 = [(BMContextSyncDeviceActivityLevel *)self deviceActivityState];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMContextSyncDeviceActivityLevel with ID: %@, deviceUUID: %@, deviceActivityState: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMContextSyncDeviceActivityLevel)initWithID:(id)a3 deviceUUID:(id)a4 deviceActivityState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMContextSyncDeviceActivityLevel;
  unsigned int v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_ID, a3);
    objc_storeStrong((id *)&v12->_deviceUUID, a4);
    objc_storeStrong((id *)&v12->_deviceActivityState, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"deviceUUID", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceActivityState" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF45A8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceUUID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceActivityState_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_153_26340];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __43__BMContextSyncDeviceActivityLevel_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _deviceActivityStateJSONArray];
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

    uint64_t v8 = [[BMContextSyncDeviceActivityLevel alloc] initByReadFrom:v7];
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