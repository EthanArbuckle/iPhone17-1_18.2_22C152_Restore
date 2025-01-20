@interface BMDeviceBluetoothGATTSession
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceBluetoothGATTSession)initWithBundleID:(id)a3 serviceUUID:(id)a4 sessionType:(id)a5 sessionState:(int)a6 supportsBackgrounding:(id)a7 supportsStateRestoration:(id)a8;
- (BMDeviceBluetoothGATTSession)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasSupportsBackgrounding;
- (BOOL)hasSupportsStateRestoration;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsBackgrounding;
- (BOOL)supportsStateRestoration;
- (NSArray)serviceUUID;
- (NSString)bundleID;
- (NSString)description;
- (NSString)sessionType;
- (id)_serviceUUIDJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)sessionState;
- (unsigned)dataVersion;
- (void)setHasSupportsBackgrounding:(BOOL)a3;
- (void)setHasSupportsStateRestoration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceBluetoothGATTSession

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"serviceUUID_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_72_50910];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionState" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"supportsBackgrounding" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"supportsStateRestoration" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionType, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setHasSupportsStateRestoration:(BOOL)a3
{
  self->_hasSupportsStateRestoration = a3;
}

- (BOOL)hasSupportsStateRestoration
{
  return self->_hasSupportsStateRestoration;
}

- (BOOL)supportsStateRestoration
{
  return self->_supportsStateRestoration;
}

- (void)setHasSupportsBackgrounding:(BOOL)a3
{
  self->_hasSupportsBackgrounding = a3;
}

- (BOOL)hasSupportsBackgrounding
{
  return self->_hasSupportsBackgrounding;
}

- (BOOL)supportsBackgrounding
{
  return self->_supportsBackgrounding;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (NSString)sessionType
{
  return self->_sessionType;
}

- (NSArray)serviceUUID
{
  return self->_serviceUUID;
}

- (NSString)bundleID
{
  return self->_bundleID;
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
    v6 = [(BMDeviceBluetoothGATTSession *)self bundleID];
    uint64_t v7 = [v5 bundleID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceBluetoothGATTSession *)self bundleID];
      v10 = [v5 bundleID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_26;
      }
    }
    v13 = [(BMDeviceBluetoothGATTSession *)self serviceUUID];
    uint64_t v14 = [v5 serviceUUID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMDeviceBluetoothGATTSession *)self serviceUUID];
      v17 = [v5 serviceUUID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_26;
      }
    }
    v19 = [(BMDeviceBluetoothGATTSession *)self sessionType];
    uint64_t v20 = [v5 sessionType];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMDeviceBluetoothGATTSession *)self sessionType];
      v23 = [v5 sessionType];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_26;
      }
    }
    int v25 = [(BMDeviceBluetoothGATTSession *)self sessionState];
    if (v25 == [v5 sessionState])
    {
      if (![(BMDeviceBluetoothGATTSession *)self hasSupportsBackgrounding]
        && ![v5 hasSupportsBackgrounding]
        || [(BMDeviceBluetoothGATTSession *)self hasSupportsBackgrounding]
        && [v5 hasSupportsBackgrounding]
        && (int v26 = [(BMDeviceBluetoothGATTSession *)self supportsBackgrounding],
            v26 == [v5 supportsBackgrounding]))
      {
        if (![(BMDeviceBluetoothGATTSession *)self hasSupportsStateRestoration]
          && ![v5 hasSupportsStateRestoration])
        {
          LOBYTE(v12) = 1;
          goto LABEL_27;
        }
        if ([(BMDeviceBluetoothGATTSession *)self hasSupportsStateRestoration]
          && [v5 hasSupportsStateRestoration])
        {
          BOOL v27 = [(BMDeviceBluetoothGATTSession *)self supportsStateRestoration];
          int v12 = v27 ^ [v5 supportsStateRestoration] ^ 1;
LABEL_27:

          goto LABEL_28;
        }
      }
    }
LABEL_26:
    LOBYTE(v12) = 0;
    goto LABEL_27;
  }
  LOBYTE(v12) = 0;
LABEL_28:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMDeviceBluetoothGATTSession *)self bundleID];
  id v4 = [(BMDeviceBluetoothGATTSession *)self _serviceUUIDJSONArray];
  id v5 = [(BMDeviceBluetoothGATTSession *)self sessionType];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetoothGATTSession sessionState](self, "sessionState"));
  if ([(BMDeviceBluetoothGATTSession *)self hasSupportsBackgrounding])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsBackgrounding](self, "supportsBackgrounding"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMDeviceBluetoothGATTSession *)self hasSupportsStateRestoration])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsStateRestoration](self, "supportsStateRestoration"));
  }
  else
  {
    v8 = 0;
  }
  v21[0] = @"bundleID";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  uint64_t v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = @"serviceUUID";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"sessionType";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v22[2] = v11;
  v21[3] = @"sessionState";
  int v12 = v6;
  if (!v6)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"supportsBackgrounding";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"supportsStateRestoration";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }

  if (v6)
  {
LABEL_22:
    if (v5) {
      goto LABEL_23;
    }
LABEL_32:

    if (v4) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
LABEL_31:

  if (!v5) {
    goto LABEL_32;
  }
LABEL_23:
  if (v4) {
    goto LABEL_24;
  }
LABEL_33:

LABEL_24:
  if (!v20) {

  }
  return v15;
}

- (id)_serviceUUIDJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMDeviceBluetoothGATTSession *)self serviceUUID];
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

- (BMDeviceBluetoothGATTSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bundleID"];
  v62 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        v83[0] = v9;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:&v82 count:1];
        long long v12 = v32 = a4;
        id v8 = 0;
        v29 = 0;
        id *v32 = (id)[v30 initWithDomain:v31 code:2 userInfo:v12];
        goto LABEL_60;
      }
      id v8 = 0;
      v29 = 0;
      goto LABEL_62;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"serviceUUID"];
  long long v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  v60 = v7;
  if (v11)
  {
    v61 = self;

    id v9 = 0;
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v62)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v80 = *MEMORY[0x1E4F28568];
          long long v12 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"serviceUUID"];
          v81 = v12;
          id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          v29 = 0;
          id *v62 = (id)[v33 initWithDomain:v34 code:2 userInfo:v21];
          goto LABEL_59;
        }
        v29 = 0;
        goto LABEL_61;
      }
    }
    v61 = self;
  }
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v9 = v9;
  uint64_t v13 = [v9 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (!v13) {
    goto LABEL_18;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v64;
  while (2)
  {
    id v16 = v6;
    id v17 = v8;
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v64 != v15) {
        objc_enumerationMutation(v9);
      }
      uint64_t v19 = *(void *)(*((void *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v62)
        {
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v24 = *MEMORY[0x1E4F502C8];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"serviceUUID"];
          v78 = v20;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          int v25 = v23;
          uint64_t v26 = v24;
LABEL_30:
          id v8 = v17;
          v29 = 0;
          id *v62 = (id)[v25 initWithDomain:v26 code:2 userInfo:v22];
          id v21 = v9;
          id v6 = v16;
          goto LABEL_57;
        }
LABEL_31:
        v29 = 0;
        id v21 = v9;
        self = v61;
        id v8 = v17;
        id v6 = v16;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v62)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"serviceUUID"];
          v76 = v20;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          int v25 = v27;
          uint64_t v26 = v28;
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      [v12 addObject:v19];
    }
    uint64_t v14 = [v9 countByEnumeratingWithState:&v63 objects:v79 count:16];
    id v8 = v17;
    id v6 = v16;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_18:

  uint64_t v20 = [v6 objectForKeyedSubscript:@"sessionType"];
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v21 = 0;
    goto LABEL_21;
  }
  id v35 = v6;
  id v36 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v62)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v39 = *MEMORY[0x1E4F502C8];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sessionType"];
      v74 = v22;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      id v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2);
      id v21 = 0;
      v29 = 0;
      id *v62 = v40;
      goto LABEL_77;
    }
    id v21 = 0;
    v29 = 0;
    id v6 = v35;
    goto LABEL_58;
  }
  id v21 = v20;
  id v6 = v35;
LABEL_21:
  v22 = [v6 objectForKeyedSubscript:@"sessionState"];
  v57 = v22;
  if (!v22)
  {
LABEL_47:
    uint64_t v41 = [v6 objectForKeyedSubscript:@"supportsBackgrounding"];
    v55 = (void *)v41;
    if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v62)
        {
          id v58 = 0;
          v29 = 0;
LABEL_55:

          goto LABEL_56;
        }
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"supportsBackgrounding"];
        id v70 = v44;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        id v47 = (id)[v59 initWithDomain:v46 code:2 userInfo:v43];
        v29 = 0;
        id v58 = 0;
        id *v62 = v47;
        goto LABEL_54;
      }
      id v58 = v42;
    }
    else
    {
      id v58 = 0;
    }
    v43 = [v6 objectForKeyedSubscript:@"supportsStateRestoration"];
    if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v62)
        {
          id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v67 = *MEMORY[0x1E4F28568];
          v48 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"supportsStateRestoration"];
          v68 = v48;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          id *v62 = (id)[v54 initWithDomain:v53 code:2 userInfo:v49];
        }
        id v44 = 0;
        v29 = 0;
        goto LABEL_54;
      }
      id v44 = v43;
    }
    else
    {
      id v44 = 0;
    }
    v29 = -[BMDeviceBluetoothGATTSession initWithBundleID:serviceUUID:sessionType:sessionState:supportsBackgrounding:supportsStateRestoration:](v61, "initWithBundleID:serviceUUID:sessionType:sessionState:supportsBackgrounding:supportsStateRestoration:", v8, v12, v21, [v22 intValue], v58, v44);
    v61 = v29;
LABEL_54:

    v42 = v55;
    goto LABEL_55;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = 0;
    goto LABEL_47;
  }
  id v35 = v6;
  id v36 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = v22;
LABEL_46:
    v22 = v37;
    id v6 = v35;
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = [NSNumber numberWithInt:BMDeviceBluetoothGATTSessionStateFromString(v22)];
    goto LABEL_46;
  }
  if (v62)
  {
    id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v56 = *MEMORY[0x1E4F502C8];
    uint64_t v71 = *MEMORY[0x1E4F28568];
    id v58 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"sessionState"];
    id v72 = v58;
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    id v52 = (id)[v50 initWithDomain:v56 code:2 userInfo:v51];
    v22 = 0;
    v29 = 0;
    id *v62 = v52;
    id v6 = v35;
    v42 = (void *)v51;
    goto LABEL_55;
  }
  v22 = 0;
  v29 = 0;
LABEL_77:
  id v8 = v36;
  id v6 = v35;
LABEL_56:

LABEL_57:
LABEL_58:

  self = v61;
LABEL_59:

  uint64_t v7 = v60;
LABEL_60:

LABEL_61:
LABEL_62:

  return v29;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceBluetoothGATTSession *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_serviceUUID;
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

  if (self->_sessionType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasSupportsBackgrounding) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasSupportsStateRestoration) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMDeviceBluetoothGATTSession;
  uint64_t v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_66;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v21 = 32;
          goto LABEL_22;
        case 2u:
          uint64_t v35 = PBReaderReadString();
          if (!v35) {
            goto LABEL_68;
          }
          id v36 = (void *)v35;
          [v6 addObject:v35];

          continue;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_22:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v26 = *v7;
            unint64_t v27 = *(void *)&v4[v26];
            if (v27 == -1 || v27 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
              *(void *)&v4[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v25) = 0;
          }
LABEL_51:
          if (v25 >= 6) {
            LODWORD(v25) = 0;
          }
          v5->_sessionState = v25;
          continue;
        case 5u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasSupportsBackgrounding = 1;
          while (2)
          {
            uint64_t v32 = *v7;
            unint64_t v33 = *(void *)&v4[v32];
            if (v33 == -1 || v33 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v10] + v33);
              *(void *)&v4[v32] = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  uint64_t v31 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v31 = 0;
          }
LABEL_57:
          BOOL v43 = v31 != 0;
          uint64_t v44 = 16;
          goto LABEL_62;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasSupportsStateRestoration = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_68:

          goto LABEL_65;
      }
      while (1)
      {
        uint64_t v40 = *v7;
        unint64_t v41 = *(void *)&v4[v40];
        if (v41 == -1 || v41 >= *(void *)&v4[*v8]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v10] + v41);
        *(void *)&v4[v40] = v41 + 1;
        v39 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0) {
          goto LABEL_59;
        }
        v37 += 7;
        BOOL v17 = v38++ >= 9;
        if (v17)
        {
          uint64_t v39 = 0;
          goto LABEL_61;
        }
      }
      v4[*v9] = 1;
LABEL_59:
      if (v4[*v9]) {
        uint64_t v39 = 0;
      }
LABEL_61:
      BOOL v43 = v39 != 0;
      uint64_t v44 = 18;
LABEL_62:
      *((unsigned char *)&v5->super.super.isa + v44) = v43;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v45 = [v6 copy];
  serviceUUID = v5->_serviceUUID;
  v5->_serviceUUID = (NSArray *)v45;

  int v47 = v4[*v9];
  if (v47) {
LABEL_65:
  }
    v48 = 0;
  else {
LABEL_66:
  }
    v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDeviceBluetoothGATTSession *)self bundleID];
  uint64_t v5 = [(BMDeviceBluetoothGATTSession *)self serviceUUID];
  uint64_t v6 = [(BMDeviceBluetoothGATTSession *)self sessionType];
  uint64_t v7 = BMDeviceBluetoothGATTSessionStateAsString([(BMDeviceBluetoothGATTSession *)self sessionState]);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsBackgrounding](self, "supportsBackgrounding"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothGATTSession supportsStateRestoration](self, "supportsStateRestoration"));
  long long v10 = (void *)[v3 initWithFormat:@"BMDeviceBluetoothGATTSession with bundleID: %@, serviceUUID: %@, sessionType: %@, sessionState: %@, supportsBackgrounding: %@, supportsStateRestoration: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMDeviceBluetoothGATTSession)initWithBundleID:(id)a3 serviceUUID:(id)a4 sessionType:(id)a5 sessionState:(int)a6 supportsBackgrounding:(id)a7 supportsStateRestoration:(id)a8
{
  id v21 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMDeviceBluetoothGATTSession;
  uint64_t v19 = [(BMEventBase *)&v22 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_bundleID, a3);
    objc_storeStrong((id *)&v19->_serviceUUID, a4);
    objc_storeStrong((id *)&v19->_sessionType, a5);
    v19->_sessionState = a6;
    if (v17)
    {
      v19->_hasSupportsBackgrounding = 1;
      v19->_supportsBackgrounding = [v17 BOOLValue];
    }
    else
    {
      v19->_hasSupportsBackgrounding = 0;
      v19->_supportsBackgrounding = 0;
    }
    if (v18)
    {
      v19->_hasSupportsStateRestoration = 1;
      v19->_supportsStateRestoration = [v18 BOOLValue];
    }
    else
    {
      v19->_hasSupportsStateRestoration = 0;
      v19->_supportsStateRestoration = 0;
    }
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serviceUUID" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionType" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionState" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"supportsBackgrounding" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"supportsStateRestoration" number:6 type:12 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF59B8;
}

id __39__BMDeviceBluetoothGATTSession_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _serviceUUIDJSONArray];
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

    uint64_t v8 = [[BMDeviceBluetoothGATTSession alloc] initByReadFrom:v7];
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