@interface BMHomeKitClientMediaAccessoryControl
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHomeKitBase)base;
- (BMHomeKitClientMediaAccessoryControl)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryState:(id)a5 accessoryMediaRouteIdentifier:(id)a6 zoneUniqueIdentifiers:(id)a7 roomUniqueIdentifier:(id)a8 accessoryName:(id)a9 roomName:(id)a10 zoneNames:(id)a11 homeName:(id)a12;
- (BMHomeKitClientMediaAccessoryControl)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)accessoryState;
- (NSArray)zoneNames;
- (NSArray)zoneUniqueIdentifiers;
- (NSString)accessoryMediaRouteIdentifier;
- (NSString)accessoryName;
- (NSString)accessoryUniqueIdentifier;
- (NSString)description;
- (NSString)homeName;
- (NSString)roomName;
- (NSString)roomUniqueIdentifier;
- (id)_accessoryStateJSONArray;
- (id)_zoneNamesJSONArray;
- (id)_zoneUniqueIdentifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMHomeKitClientMediaAccessoryControl

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"base_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_31916];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessoryUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"accessoryState_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_70];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessoryMediaRouteIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"zoneUniqueIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_72_31918];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"roomUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessoryName" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"roomName" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"zoneNames_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_74];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeName" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v13;
  v14[6] = v7;
  v14[7] = v8;
  v14[8] = v9;
  v14[9] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessoryMediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryState, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_base, 0);
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (NSArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (NSString)accessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier;
}

- (NSArray)accessoryState
{
  return self->_accessoryState;
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (BMHomeKitBase)base
{
  return self->_base;
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
    v6 = [(BMHomeKitClientMediaAccessoryControl *)self base];
    uint64_t v7 = [v5 base];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMHomeKitClientMediaAccessoryControl *)self base];
      v10 = [v5 base];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_37;
      }
    }
    v13 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryUniqueIdentifier];
    uint64_t v14 = [v5 accessoryUniqueIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryUniqueIdentifier];
      v17 = [v5 accessoryUniqueIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_37;
      }
    }
    v19 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryState];
    uint64_t v20 = [v5 accessoryState];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryState];
      v23 = [v5 accessoryState];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_37;
      }
    }
    v25 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryMediaRouteIdentifier];
    uint64_t v26 = [v5 accessoryMediaRouteIdentifier];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryMediaRouteIdentifier];
      v29 = [v5 accessoryMediaRouteIdentifier];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_37;
      }
    }
    v31 = [(BMHomeKitClientMediaAccessoryControl *)self zoneUniqueIdentifiers];
    uint64_t v32 = [v5 zoneUniqueIdentifiers];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMHomeKitClientMediaAccessoryControl *)self zoneUniqueIdentifiers];
      v35 = [v5 zoneUniqueIdentifiers];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_37;
      }
    }
    v37 = [(BMHomeKitClientMediaAccessoryControl *)self roomUniqueIdentifier];
    uint64_t v38 = [v5 roomUniqueIdentifier];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMHomeKitClientMediaAccessoryControl *)self roomUniqueIdentifier];
      v41 = [v5 roomUniqueIdentifier];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_37;
      }
    }
    v43 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryName];
    uint64_t v44 = [v5 accessoryName];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryName];
      v47 = [v5 accessoryName];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_37;
      }
    }
    v49 = [(BMHomeKitClientMediaAccessoryControl *)self roomName];
    uint64_t v50 = [v5 roomName];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMHomeKitClientMediaAccessoryControl *)self roomName];
      v53 = [v5 roomName];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_37;
      }
    }
    v55 = [(BMHomeKitClientMediaAccessoryControl *)self zoneNames];
    uint64_t v56 = [v5 zoneNames];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMHomeKitClientMediaAccessoryControl *)self zoneNames];
      v59 = [v5 zoneNames];
      int v60 = [v58 isEqual:v59];

      if (!v60)
      {
LABEL_37:
        char v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    v62 = [(BMHomeKitClientMediaAccessoryControl *)self homeName];
    v63 = [v5 homeName];
    if (v62 == v63)
    {
      char v12 = 1;
    }
    else
    {
      v64 = [(BMHomeKitClientMediaAccessoryControl *)self homeName];
      v65 = [v5 homeName];
      char v12 = [v64 isEqual:v65];
    }
    goto LABEL_38;
  }
  char v12 = 0;
LABEL_39:

  return v12;
}

- (id)jsonDictionary
{
  v38[10] = *MEMORY[0x1E4F143B8];
  v3 = [(BMHomeKitClientMediaAccessoryControl *)self base];
  uint64_t v4 = [v3 jsonDictionary];

  uint64_t v5 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryUniqueIdentifier];
  uint64_t v6 = [(BMHomeKitClientMediaAccessoryControl *)self _accessoryStateJSONArray];
  uint64_t v7 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryMediaRouteIdentifier];
  uint64_t v8 = [(BMHomeKitClientMediaAccessoryControl *)self _zoneUniqueIdentifiersJSONArray];
  uint64_t v9 = [(BMHomeKitClientMediaAccessoryControl *)self roomUniqueIdentifier];
  v10 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryName];
  int v36 = [(BMHomeKitClientMediaAccessoryControl *)self roomName];
  int v11 = [(BMHomeKitClientMediaAccessoryControl *)self _zoneNamesJSONArray];
  char v12 = [(BMHomeKitClientMediaAccessoryControl *)self homeName];
  v37[0] = @"base";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v13;
  v38[0] = v13;
  v37[1] = @"accessoryUniqueIdentifier";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v14;
  v38[1] = v14;
  v37[2] = @"accessoryState";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v4;
  v28 = (void *)v15;
  v38[2] = v15;
  v37[3] = @"accessoryMediaRouteIdentifier";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v5;
  v27 = (void *)v16;
  v38[3] = v16;
  v37[4] = @"zoneUniqueIdentifiers";
  uint64_t v17 = v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v6;
  uint64_t v26 = (void *)v17;
  v38[4] = v17;
  v37[5] = @"roomUniqueIdentifier";
  int v18 = (void *)v9;
  if (!v9)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v7;
  v38[5] = v18;
  v37[6] = @"accessoryName";
  v19 = v10;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v8;
  v38[6] = v19;
  v37[7] = @"roomName";
  v21 = v36;
  if (!v36)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v9;
  v38[7] = v21;
  v37[8] = @"zoneNames";
  v23 = v11;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v23;
  v37[9] = @"homeName";
  int v24 = v12;
  if (!v12)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[9] = v24;
  id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:10];
  if (v12)
  {
    if (v11) {
      goto LABEL_23;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_23;
    }
  }

LABEL_23:
  if (!v36) {

  }
  if (!v10) {
  if (!v22)
  }

  if (!v20) {
  if (!v32)
  }

  if (v33)
  {
    if (v34) {
      goto LABEL_35;
    }
LABEL_42:

    if (v35) {
      goto LABEL_36;
    }
    goto LABEL_43;
  }

  if (!v34) {
    goto LABEL_42;
  }
LABEL_35:
  if (v35) {
    goto LABEL_36;
  }
LABEL_43:

LABEL_36:

  return v31;
}

- (id)_zoneNamesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMHomeKitClientMediaAccessoryControl *)self zoneNames];
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

- (id)_zoneUniqueIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMHomeKitClientMediaAccessoryControl *)self zoneUniqueIdentifiers];
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

- (id)_accessoryStateJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryState];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMHomeKitClientMediaAccessoryControl)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v195[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"base"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    id v160 = 0;
    uint64_t v7 = [[BMHomeKitBase alloc] initWithJSONDictionary:v10 error:&v160];
    id v27 = v160;
    if (v27)
    {
      v28 = v27;
      if (a4) {
        *a4 = v27;
      }

      v29 = 0;
      goto LABEL_149;
    }

LABEL_4:
    uint64_t v8 = [v5 objectForKeyedSubscript:@"accessoryUniqueIdentifier"];
    v139 = v6;
    v140 = (void *)v8;
    if (v8 && (uint64_t v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v34 = v7;
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v192 = *MEMORY[0x1E4F28568];
          id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accessoryUniqueIdentifier"];
          id v193 = v11;
          uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
          uint64_t v38 = v35;
          uint64_t v7 = v34;
          v146 = (void *)v37;
          id v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v36, 2);
          id v10 = 0;
          v29 = 0;
          *a4 = v39;

          goto LABEL_147;
        }
        id v10 = 0;
        v29 = 0;
LABEL_148:

        goto LABEL_149;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    id v11 = [v5 objectForKeyedSubscript:@"accessoryState"];
    long long v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      v134 = self;
      id v137 = v10;
      v130 = v5;

      id v11 = 0;
      goto LABEL_12;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v134 = self;
      id v137 = v10;
      v130 = v5;
LABEL_12:
      v145 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v11 = v11;
      uint64_t v14 = [v11 countByEnumeratingWithState:&v156 objects:v189 count:16];
      v138 = v7;
      if (!v14) {
        goto LABEL_22;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v157;
LABEL_14:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v157 != v16) {
          objc_enumerationMutation(v11);
        }
        int v18 = *(void **)(*((void *)&v156 + 1) + 8 * v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 = a4;
          if (a4)
          {
            id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v42 = *MEMORY[0x1E4F502C8];
            uint64_t v185 = *MEMORY[0x1E4F28568];
            id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"accessoryState"];
            id v186 = v19;
            v43 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v44 = &v186;
            v45 = &v185;
            goto LABEL_42;
          }
          goto LABEL_63;
        }
        id v19 = v18;
        uint64_t v20 = [BMHomeKitAccessoryState alloc];
        id v155 = 0;
        v21 = [(BMHomeKitAccessoryState *)v20 initWithJSONDictionary:v19 error:&v155];
        id v22 = v155;
        if (v22)
        {
          id v24 = v22;
          if (a4) {
            *a4 = v22;
          }

          v29 = 0;
          goto LABEL_46;
        }
        [v145 addObject:v21];

        if (v15 == ++v17)
        {
          uint64_t v15 = [v11 countByEnumeratingWithState:&v156 objects:v189 count:16];
          uint64_t v7 = v138;
          if (!v15)
          {
LABEL_22:

            id v5 = v130;
            id v19 = [v130 objectForKeyedSubscript:@"accessoryMediaRouteIdentifier"];
            if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  v67 = v7;
                  id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v69 = *MEMORY[0x1E4F502C8];
                  uint64_t v183 = *MEMORY[0x1E4F28568];
                  id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accessoryMediaRouteIdentifier"];
                  id v184 = v24;
                  uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
                  v71 = v68;
                  uint64_t v7 = v67;
                  v142 = (void *)v70;
                  id v72 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v69, 2);
                  id v23 = 0;
                  v29 = 0;
                  *a4 = v72;
                  self = v134;
                  id v10 = v137;

                  goto LABEL_143;
                }
                id v23 = 0;
                v29 = 0;
                self = v134;
                id v10 = v137;
                goto LABEL_144;
              }
              id v23 = v19;
            }
            else
            {
              id v23 = 0;
            }
            id v24 = [v130 objectForKeyedSubscript:@"zoneUniqueIdentifiers"];
            v25 = [MEMORY[0x1E4F1CA98] null];
            int v26 = [v24 isEqual:v25];

            if (v26)
            {

              id v24 = 0;
            }
            else
            {
              id v10 = v137;
              if (v24)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a4)
                  {
                    id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v74 = *MEMORY[0x1E4F502C8];
                    uint64_t v181 = *MEMORY[0x1E4F28568];
                    v141 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"zoneUniqueIdentifiers"];
                    v182 = v141;
                    v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
                    id v75 = (id)[v73 initWithDomain:v74 code:2 userInfo:v66];
                    v29 = 0;
                    *a4 = v75;
                    self = v134;
                    uint64_t v7 = v138;
                    goto LABEL_141;
                  }
                  v29 = 0;
                  self = v134;
                  uint64_t v7 = v138;
                  goto LABEL_143;
                }
              }
            }
            v141 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
            long long v151 = 0u;
            long long v152 = 0u;
            long long v153 = 0u;
            long long v154 = 0u;
            id v24 = v24;
            uint64_t v50 = [v24 countByEnumeratingWithState:&v151 objects:v180 count:16];
            id v129 = v23;
            if (!v50) {
              goto LABEL_60;
            }
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v152;
            while (1)
            {
              id v53 = v5;
              for (uint64_t i = 0; i != v51; ++i)
              {
                if (*(void *)v152 != v52) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v55 = *(void *)(*((void *)&v151 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v58 = a4;
                  if (a4)
                  {
                    id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v60 = *MEMORY[0x1E4F502C8];
                    uint64_t v178 = *MEMORY[0x1E4F28568];
                    v127 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"zoneUniqueIdentifiers"];
                    v179 = v127;
                    uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
                    v62 = v59;
                    uint64_t v63 = v60;
LABEL_73:
                    v125 = (void *)v61;
                    id v5 = v53;
                    self = v134;
                    v29 = 0;
                    id *v58 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2);
                    v66 = v24;
                    id v10 = v137;
                    uint64_t v7 = v138;
                    id v23 = v129;

                    goto LABEL_140;
                  }
LABEL_75:
                  v29 = 0;
                  v66 = v24;
                  id v5 = v53;
                  self = v134;
                  id v10 = v137;
                  uint64_t v7 = v138;
                  id v23 = v129;
                  goto LABEL_141;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v58 = a4;
                  if (a4)
                  {
                    id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v65 = *MEMORY[0x1E4F502C8];
                    uint64_t v176 = *MEMORY[0x1E4F28568];
                    v127 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"zoneUniqueIdentifiers"];
                    v177 = v127;
                    uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
                    v62 = v64;
                    uint64_t v63 = v65;
                    goto LABEL_73;
                  }
                  goto LABEL_75;
                }
                [v141 addObject:v55];
              }
              uint64_t v51 = [v24 countByEnumeratingWithState:&v151 objects:v180 count:16];
              id v5 = v53;
              id v23 = v129;
              if (!v51)
              {
LABEL_60:

                uint64_t v56 = [v5 objectForKeyedSubscript:@"roomUniqueIdentifier"];
                v127 = (void *)v56;
                if (!v56)
                {
                  id v121 = 0;
                  self = v134;
                  goto LABEL_83;
                }
                v57 = (void *)v56;
                objc_opt_class();
                self = v134;
                if (objc_opt_isKindOfClass())
                {
                  id v121 = 0;
LABEL_83:
                  uint64_t v76 = [v5 objectForKeyedSubscript:@"accessoryName"];
                  v123 = (void *)v76;
                  if (v76 && (v77 = (void *)v76, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v126 = v77;
                      goto LABEL_86;
                    }
                    if (!a4)
                    {
                      id v126 = 0;
                      v29 = 0;
                      id v10 = v137;
                      uint64_t v7 = v138;
                      v66 = v121;
                      goto LABEL_138;
                    }
                    id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v101 = *MEMORY[0x1E4F502C8];
                    uint64_t v172 = *MEMORY[0x1E4F28568];
                    id v122 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accessoryName"];
                    id v173 = v122;
                    uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
                    uint64_t v103 = v101;
                    id v23 = v129;
                    v120 = (void *)v102;
                    id v126 = 0;
                    v29 = 0;
                    *a4 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v103, 2);
                  }
                  else
                  {
                    id v126 = 0;
LABEL_86:
                    uint64_t v78 = [v5 objectForKeyedSubscript:@"roomName"];
                    v120 = (void *)v78;
                    if (!v78 || (v79 = (void *)v78, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v122 = 0;
                      goto LABEL_89;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v122 = v79;
LABEL_89:
                      v80 = [v5 objectForKeyedSubscript:@"zoneNames"];
                      v81 = [MEMORY[0x1E4F1CA98] null];
                      int v82 = [v80 isEqual:v81];

                      if (v82)
                      {
                        v135 = self;

                        v80 = 0;
LABEL_94:
                        v131 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v80, "count"));
                        long long v147 = 0u;
                        long long v148 = 0u;
                        long long v149 = 0u;
                        long long v150 = 0u;
                        id obj = v80;
                        uint64_t v83 = [obj countByEnumeratingWithState:&v147 objects:v167 count:16];
                        if (!v83) {
                          goto LABEL_103;
                        }
                        uint64_t v84 = v83;
                        uint64_t v85 = *(void *)v148;
LABEL_96:
                        id v86 = v5;
                        uint64_t v87 = 0;
                        while (1)
                        {
                          if (*(void *)v148 != v85) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v88 = *(void *)(*((void *)&v147 + 1) + 8 * v87);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            break;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v91 = a4;
                            if (a4)
                            {
                              id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v93 = *MEMORY[0x1E4F502C8];
                              uint64_t v163 = *MEMORY[0x1E4F28568];
                              v119 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"zoneNames"];
                              v164 = v119;
                              v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
                              v95 = v99;
                              goto LABEL_118;
                            }
                            goto LABEL_122;
                          }
                          [v131 addObject:v88];
                          if (v84 == ++v87)
                          {
                            uint64_t v84 = [obj countByEnumeratingWithState:&v147 objects:v167 count:16];
                            id v5 = v86;
                            if (v84) {
                              goto LABEL_96;
                            }
LABEL_103:

                            id v89 = [v5 objectForKeyedSubscript:@"homeName"];
                            v119 = v89;
                            if (!v89)
                            {
                              self = v135;
                              id v10 = v137;
                              uint64_t v7 = v138;
                              id v23 = v129;
                              goto LABEL_132;
                            }
                            v90 = v89;
                            objc_opt_class();
                            self = v135;
                            uint64_t v7 = v138;
                            id v23 = v129;
                            if (objc_opt_isKindOfClass())
                            {
                              id v89 = 0;
                              goto LABEL_131;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v89 = v90;
LABEL_131:
                              id v10 = v137;
LABEL_132:
                              id v144 = v89;
                              v66 = v121;
                              self = [(BMHomeKitClientMediaAccessoryControl *)self initWithBase:v7 accessoryUniqueIdentifier:v10 accessoryState:v145 accessoryMediaRouteIdentifier:v23 zoneUniqueIdentifiers:v141 roomUniqueIdentifier:v121 accessoryName:v126 roomName:v122 zoneNames:v131 homeName:v89];
                              v29 = self;
                            }
                            else
                            {
                              if (a4)
                              {
                                id v118 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v114 = *MEMORY[0x1E4F502C8];
                                uint64_t v161 = *MEMORY[0x1E4F28568];
                                v115 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"homeName"];
                                v162 = v115;
                                v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
                                uint64_t v117 = v114;
                                id v23 = v129;
                                *a4 = (id)[v118 initWithDomain:v117 code:2 userInfo:v116];

                                uint64_t v7 = v138;
                              }
                              id v144 = 0;
                              v29 = 0;
                              id v10 = v137;
LABEL_119:
                              v66 = v121;
                            }

                            v104 = v144;
LABEL_134:

LABEL_136:
LABEL_137:

LABEL_138:
LABEL_139:

                            goto LABEL_140;
                          }
                        }
                        v91 = a4;
                        if (a4)
                        {
                          id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v93 = *MEMORY[0x1E4F502C8];
                          uint64_t v165 = *MEMORY[0x1E4F28568];
                          v119 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"zoneNames"];
                          v166 = v119;
                          v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
                          v95 = v92;
LABEL_118:
                          id v5 = v86;
                          id *v91 = (id)[v95 initWithDomain:v93 code:2 userInfo:v94];

                          v29 = 0;
                          id v23 = v129;
                          id v144 = obj;
                          self = v135;
                          id v10 = v137;
                          uint64_t v7 = v138;
                          goto LABEL_119;
                        }
LABEL_122:
                        v29 = 0;
                        id v5 = v86;
                        self = v135;
                        id v10 = v137;
                        uint64_t v7 = v138;
                        v104 = obj;
                        id v23 = v129;
                      }
                      else
                      {
                        if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v135 = self;
                          goto LABEL_94;
                        }
                        id obj = v80;
                        id v10 = v137;
                        if (!a4)
                        {
                          v29 = 0;
                          uint64_t v7 = v138;
                          v66 = v121;
                          goto LABEL_136;
                        }
                        id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v110 = *MEMORY[0x1E4F502C8];
                        uint64_t v168 = *MEMORY[0x1E4F28568];
                        v131 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"zoneNames"];
                        v169 = v131;
                        uint64_t v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
                        id v112 = (id)[v136 initWithDomain:v110 code:2 userInfo:v111];
                        v29 = 0;
                        *a4 = v112;
                        v104 = (void *)v111;
                        uint64_t v7 = v138;
                      }
                      v66 = v121;
                      goto LABEL_134;
                    }
                    if (a4)
                    {
                      id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v106 = *MEMORY[0x1E4F502C8];
                      uint64_t v170 = *MEMORY[0x1E4F28568];
                      id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"roomName"];
                      id v171 = obj;
                      uint64_t v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
                      uint64_t v108 = v106;
                      id v23 = v129;
                      v133 = (void *)v107;
                      id v109 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v108, 2);
                      id v122 = 0;
                      v29 = 0;
                      *a4 = v109;
                      id v10 = v137;
                      uint64_t v7 = v138;
                      v66 = v121;

                      goto LABEL_136;
                    }
                    id v122 = 0;
                    v29 = 0;
                  }
                  id v10 = v137;
                  uint64_t v7 = v138;
                  v66 = v121;
                  goto LABEL_137;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v121 = v57;
                  goto LABEL_83;
                }
                v66 = a4;
                if (a4)
                {
                  id v132 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v96 = *MEMORY[0x1E4F502C8];
                  uint64_t v174 = *MEMORY[0x1E4F28568];
                  id v126 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"roomUniqueIdentifier"];
                  id v175 = v126;
                  uint64_t v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
                  uint64_t v98 = v96;
                  id v23 = v129;
                  v124 = (void *)v97;
                  v29 = 0;
                  *a4 = (id)objc_msgSend(v132, "initWithDomain:code:userInfo:", v98, 2);
                  v66 = 0;
                  id v10 = v137;
                  uint64_t v7 = v138;

                  goto LABEL_139;
                }
                v29 = 0;
                id v10 = v137;
                uint64_t v7 = v138;
LABEL_140:

LABEL_141:
LABEL_143:

LABEL_144:
LABEL_145:

                goto LABEL_147;
              }
            }
          }
          goto LABEL_14;
        }
      }
      v40 = a4;
      if (a4)
      {
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v187 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"accessoryState"];
        id v188 = v19;
        v43 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v44 = &v188;
        v45 = &v187;
LABEL_42:
        id v24 = [v43 dictionaryWithObjects:v44 forKeys:v45 count:1];
        id v46 = (id)[v41 initWithDomain:v42 code:2 userInfo:v24];
        v29 = 0;
        id *v40 = v46;
LABEL_46:
        id v23 = v11;
        id v5 = v130;
        self = v134;
        id v10 = v137;
        uint64_t v7 = v138;
        goto LABEL_143;
      }
LABEL_63:
      v29 = 0;
      id v23 = v11;
      id v5 = v130;
      self = v134;
      id v10 = v137;
      uint64_t v7 = v138;
      goto LABEL_145;
    }
    if (a4)
    {
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v48 = *MEMORY[0x1E4F502C8];
      uint64_t v190 = *MEMORY[0x1E4F28568];
      v145 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"accessoryState"];
      v191 = v145;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
      id v49 = (id)[v47 initWithDomain:v48 code:2 userInfo:v23];
      v29 = 0;
      *a4 = v49;
      goto LABEL_145;
    }
    v29 = 0;
LABEL_147:

    uint64_t v6 = v139;
    goto LABEL_148;
  }
  if (a4)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v194 = *MEMORY[0x1E4F28568];
    uint64_t v32 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"base"];
    v195[0] = v32;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v195 forKeys:&v194 count:1];
    v33 = v30;
    uint64_t v7 = (BMHomeKitBase *)v32;
    v29 = 0;
    *a4 = (id)[v33 initWithDomain:v31 code:2 userInfo:v10];
LABEL_149:

    goto LABEL_150;
  }
  v29 = 0;
LABEL_150:

  return v29;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMHomeKitClientMediaAccessoryControl *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base)
  {
    uint64_t v33 = 0;
    PBDataWriterPlaceMark();
    [(BMHomeKitBase *)self->_base writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_accessoryUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = self->_accessoryState;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        uint64_t v33 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v7);
  }

  if (self->_accessoryMediaRouteIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = self->_zoneUniqueIdentifiers;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v13);
  }

  if (self->_roomUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_roomName) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = self->_zoneNames;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v34 count:16];
    }
    while (v18);
  }

  if (self->_homeName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMHomeKitClientMediaAccessoryControl;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5)
  {
LABEL_44:
    id v39 = v5;
    goto LABEL_45;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  id v10 = (int *)MEMORY[0x1E4F940E0];
  id v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_42:
    uint64_t v32 = [v6 copy];
    accessoryState = v5->_accessoryState;
    v5->_accessoryState = (NSArray *)v32;

    uint64_t v34 = [v7 copy];
    zoneUniqueIdentifiers = v5->_zoneUniqueIdentifiers;
    v5->_zoneUniqueIdentifiers = (NSArray *)v34;

    uint64_t v36 = [v8 copy];
    zoneNames = v5->_zoneNames;
    v5->_zoneNames = (NSArray *)v36;

    int v38 = v4[*v11];
    if (v38) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v11]) {
      goto LABEL_42;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v9;
      unint64_t v17 = *(void *)&v4[v16];
      if (v17 == -1 || v17 >= *(void *)&v4[*v10]) {
        break;
      }
      char v18 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
      *(void *)&v4[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0) {
        goto LABEL_13;
      }
      v13 += 7;
      if (v14++ >= 9)
      {
        unint64_t v15 = 0;
        int v20 = v4[*v11];
        goto LABEL_15;
      }
    }
    v4[*v11] = 1;
LABEL_13:
    int v20 = v4[*v11];
    if (v4[*v11]) {
      unint64_t v15 = 0;
    }
LABEL_15:
    if (v20 || (v15 & 7) == 4) {
      goto LABEL_42;
    }
    switch((v15 >> 3))
    {
      case 1u:
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_46;
        }
        long long v22 = [[BMHomeKitBase alloc] initByReadFrom:v4];
        if (!v22) {
          goto LABEL_46;
        }
        base = v5->_base;
        v5->_base = v22;

        PBReaderRecallMark();
        goto LABEL_41;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 32;
        goto LABEL_40;
      case 3u:
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_46;
        }
        id v26 = [[BMHomeKitAccessoryState alloc] initByReadFrom:v4];
        if (!v26) {
          goto LABEL_46;
        }
        long long v27 = v26;
        [v6 addObject:v26];
        PBReaderRecallMark();
        goto LABEL_38;
      case 4u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 48;
        goto LABEL_40;
      case 5u:
        uint64_t v28 = PBReaderReadString();
        if (!v28) {
          goto LABEL_46;
        }
        long long v27 = (void *)v28;
        long long v29 = v7;
        goto LABEL_37;
      case 6u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 64;
        goto LABEL_40;
      case 7u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 72;
        goto LABEL_40;
      case 8u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 80;
        goto LABEL_40;
      case 9u:
        uint64_t v30 = PBReaderReadString();
        if (!v30) {
          goto LABEL_46;
        }
        long long v27 = (void *)v30;
        long long v29 = v8;
LABEL_37:
        [v29 addObject:v27];
LABEL_38:

        goto LABEL_41;
      case 0xAu:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 96;
LABEL_40:
        long long v31 = *(Class *)((char *)&v5->super.super.isa + v25);
        *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

        goto LABEL_41;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_41:
          if (*(void *)&v4[*v9] >= *(void *)&v4[*v10]) {
            goto LABEL_42;
          }
          continue;
        }
LABEL_46:

LABEL_43:
        id v39 = 0;
LABEL_45:

        return v39;
    }
  }
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unsigned int v14 = [(BMHomeKitClientMediaAccessoryControl *)self base];
  v3 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryUniqueIdentifier];
  id v4 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryState];
  id v5 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryMediaRouteIdentifier];
  uint64_t v6 = [(BMHomeKitClientMediaAccessoryControl *)self zoneUniqueIdentifiers];
  uint64_t v7 = [(BMHomeKitClientMediaAccessoryControl *)self roomUniqueIdentifier];
  uint64_t v8 = [(BMHomeKitClientMediaAccessoryControl *)self accessoryName];
  uint64_t v9 = [(BMHomeKitClientMediaAccessoryControl *)self roomName];
  id v10 = [(BMHomeKitClientMediaAccessoryControl *)self zoneNames];
  id v11 = [(BMHomeKitClientMediaAccessoryControl *)self homeName];
  uint64_t v12 = (void *)[v15 initWithFormat:@"BMHomeKitClientMediaAccessoryControl with base: %@, accessoryUniqueIdentifier: %@, accessoryState: %@, accessoryMediaRouteIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, roomName: %@, zoneNames: %@, homeName: %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMHomeKitClientMediaAccessoryControl)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryState:(id)a5 accessoryMediaRouteIdentifier:(id)a6 zoneUniqueIdentifiers:(id)a7 roomUniqueIdentifier:(id)a8 accessoryName:(id)a9 roomName:(id)a10 zoneNames:(id)a11 homeName:(id)a12
{
  id v33 = a3;
  id v32 = a4;
  id v25 = a5;
  id v31 = a5;
  id v26 = a6;
  id v30 = a6;
  id v29 = a7;
  id v27 = a8;
  id v28 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)BMHomeKitClientMediaAccessoryControl;
  long long v22 = [(BMEventBase *)&v34 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v22->_base, a3);
    objc_storeStrong((id *)&v22->_accessoryUniqueIdentifier, a4);
    objc_storeStrong((id *)&v22->_accessoryState, v25);
    objc_storeStrong((id *)&v22->_accessoryMediaRouteIdentifier, v26);
    objc_storeStrong((id *)&v22->_zoneUniqueIdentifiers, a7);
    objc_storeStrong((id *)&v22->_roomUniqueIdentifier, v27);
    objc_storeStrong((id *)&v22->_accessoryName, a9);
    objc_storeStrong((id *)&v22->_roomName, a10);
    objc_storeStrong((id *)&v22->_zoneNames, a11);
    objc_storeStrong((id *)&v22->_homeName, a12);
  }

  return v22;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"base" number:1 type:14 subMessageClass:objc_opt_class()];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryUniqueIdentifier" number:2 type:13 subMessageClass:0];
  v14[1] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryState" number:3 type:14 subMessageClass:objc_opt_class()];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryMediaRouteIdentifier" number:4 type:13 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"zoneUniqueIdentifiers" number:5 type:13 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"roomUniqueIdentifier" number:6 type:13 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryName" number:7 type:13 subMessageClass:0];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"roomName" number:8 type:13 subMessageClass:0];
  v14[7] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"zoneNames" number:9 type:13 subMessageClass:0];
  v14[8] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeName" number:10 type:13 subMessageClass:0];
  v14[9] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4938;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _zoneNamesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _zoneUniqueIdentifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _accessoryStateJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __47__BMHomeKitClientMediaAccessoryControl_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 base];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMHomeKitClientMediaAccessoryControl;
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMHomeKitClientMediaAccessoryControl_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  uint64_t v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 16) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end