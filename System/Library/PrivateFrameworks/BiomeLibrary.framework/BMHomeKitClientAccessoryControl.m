@interface BMHomeKitClientAccessoryControl
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHomeKitAccessoryState)accessoryState;
- (BMHomeKitBase)base;
- (BMHomeKitClientAccessoryControl)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryState:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17;
- (BMHomeKitClientAccessoryControl)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)zoneNames;
- (NSArray)zoneUniqueIdentifiers;
- (NSString)accessoryName;
- (NSString)accessoryUniqueIdentifier;
- (NSString)characteristicType;
- (NSString)description;
- (NSString)homeName;
- (NSString)roomName;
- (NSString)roomUniqueIdentifier;
- (NSString)serviceGroupName;
- (NSString)serviceGroupUniqueIdentifier;
- (NSString)serviceName;
- (NSString)serviceType;
- (NSString)serviceUniqueIdentifier;
- (id)_zoneNamesJSONArray;
- (id)_zoneUniqueIdentifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMHomeKitClientAccessoryControl

+ (id)columns
{
  v19[15] = *MEMORY[0x1E4F143B8];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"base_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_68096];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessoryUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"accessoryState_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_85];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serviceUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serviceType" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"characteristicType" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serviceGroupUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"zoneUniqueIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_87_68098];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"roomUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessoryName" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serviceName" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"roomName" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serviceGroupName" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"zoneNames_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_89_68099];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeName" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v16;
  v19[3] = v15;
  v19[4] = v2;
  v19[5] = v13;
  v19[6] = v3;
  v19[7] = v4;
  v19[8] = v5;
  v19[9] = v6;
  v19[10] = v7;
  v19[11] = v14;
  v19[12] = v12;
  v19[13] = v8;
  v19[14] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_serviceGroupName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
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

- (NSString)serviceGroupName
{
  return self->_serviceGroupName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)serviceName
{
  return self->_serviceName;
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

- (NSString)serviceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (BMHomeKitAccessoryState)accessoryState
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
    v6 = [(BMHomeKitClientAccessoryControl *)self base];
    uint64_t v7 = [v5 base];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMHomeKitClientAccessoryControl *)self base];
      v10 = [v5 base];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_57;
      }
    }
    v13 = [(BMHomeKitClientAccessoryControl *)self accessoryUniqueIdentifier];
    uint64_t v14 = [v5 accessoryUniqueIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMHomeKitClientAccessoryControl *)self accessoryUniqueIdentifier];
      v17 = [v5 accessoryUniqueIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_57;
      }
    }
    v19 = [(BMHomeKitClientAccessoryControl *)self accessoryState];
    uint64_t v20 = [v5 accessoryState];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMHomeKitClientAccessoryControl *)self accessoryState];
      v23 = [v5 accessoryState];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_57;
      }
    }
    v25 = [(BMHomeKitClientAccessoryControl *)self serviceUniqueIdentifier];
    uint64_t v26 = [v5 serviceUniqueIdentifier];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMHomeKitClientAccessoryControl *)self serviceUniqueIdentifier];
      v29 = [v5 serviceUniqueIdentifier];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_57;
      }
    }
    v31 = [(BMHomeKitClientAccessoryControl *)self serviceType];
    uint64_t v32 = [v5 serviceType];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMHomeKitClientAccessoryControl *)self serviceType];
      v35 = [v5 serviceType];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_57;
      }
    }
    v37 = [(BMHomeKitClientAccessoryControl *)self characteristicType];
    uint64_t v38 = [v5 characteristicType];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMHomeKitClientAccessoryControl *)self characteristicType];
      v41 = [v5 characteristicType];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_57;
      }
    }
    v43 = [(BMHomeKitClientAccessoryControl *)self serviceGroupUniqueIdentifier];
    uint64_t v44 = [v5 serviceGroupUniqueIdentifier];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMHomeKitClientAccessoryControl *)self serviceGroupUniqueIdentifier];
      v47 = [v5 serviceGroupUniqueIdentifier];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_57;
      }
    }
    v49 = [(BMHomeKitClientAccessoryControl *)self zoneUniqueIdentifiers];
    uint64_t v50 = [v5 zoneUniqueIdentifiers];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMHomeKitClientAccessoryControl *)self zoneUniqueIdentifiers];
      v53 = [v5 zoneUniqueIdentifiers];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_57;
      }
    }
    v55 = [(BMHomeKitClientAccessoryControl *)self roomUniqueIdentifier];
    uint64_t v56 = [v5 roomUniqueIdentifier];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMHomeKitClientAccessoryControl *)self roomUniqueIdentifier];
      v59 = [v5 roomUniqueIdentifier];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_57;
      }
    }
    v61 = [(BMHomeKitClientAccessoryControl *)self accessoryName];
    uint64_t v62 = [v5 accessoryName];
    if (v61 == (void *)v62)
    {
    }
    else
    {
      v63 = (void *)v62;
      v64 = [(BMHomeKitClientAccessoryControl *)self accessoryName];
      v65 = [v5 accessoryName];
      int v66 = [v64 isEqual:v65];

      if (!v66) {
        goto LABEL_57;
      }
    }
    v67 = [(BMHomeKitClientAccessoryControl *)self serviceName];
    uint64_t v68 = [v5 serviceName];
    if (v67 == (void *)v68)
    {
    }
    else
    {
      v69 = (void *)v68;
      v70 = [(BMHomeKitClientAccessoryControl *)self serviceName];
      v71 = [v5 serviceName];
      int v72 = [v70 isEqual:v71];

      if (!v72) {
        goto LABEL_57;
      }
    }
    v73 = [(BMHomeKitClientAccessoryControl *)self roomName];
    uint64_t v74 = [v5 roomName];
    if (v73 == (void *)v74)
    {
    }
    else
    {
      v75 = (void *)v74;
      v76 = [(BMHomeKitClientAccessoryControl *)self roomName];
      v77 = [v5 roomName];
      int v78 = [v76 isEqual:v77];

      if (!v78) {
        goto LABEL_57;
      }
    }
    v79 = [(BMHomeKitClientAccessoryControl *)self serviceGroupName];
    uint64_t v80 = [v5 serviceGroupName];
    if (v79 == (void *)v80)
    {
    }
    else
    {
      v81 = (void *)v80;
      v82 = [(BMHomeKitClientAccessoryControl *)self serviceGroupName];
      v83 = [v5 serviceGroupName];
      int v84 = [v82 isEqual:v83];

      if (!v84) {
        goto LABEL_57;
      }
    }
    v85 = [(BMHomeKitClientAccessoryControl *)self zoneNames];
    uint64_t v86 = [v5 zoneNames];
    if (v85 == (void *)v86)
    {
    }
    else
    {
      v87 = (void *)v86;
      v88 = [(BMHomeKitClientAccessoryControl *)self zoneNames];
      v89 = [v5 zoneNames];
      int v90 = [v88 isEqual:v89];

      if (!v90)
      {
LABEL_57:
        char v12 = 0;
LABEL_58:

        goto LABEL_59;
      }
    }
    v92 = [(BMHomeKitClientAccessoryControl *)self homeName];
    v93 = [v5 homeName];
    if (v92 == v93)
    {
      char v12 = 1;
    }
    else
    {
      v94 = [(BMHomeKitClientAccessoryControl *)self homeName];
      v95 = [v5 homeName];
      char v12 = [v94 isEqual:v95];
    }
    goto LABEL_58;
  }
  char v12 = 0;
LABEL_59:

  return v12;
}

- (id)jsonDictionary
{
  v55[15] = *MEMORY[0x1E4F143B8];
  v3 = [(BMHomeKitClientAccessoryControl *)self base];
  uint64_t v4 = [v3 jsonDictionary];

  uint64_t v5 = [(BMHomeKitClientAccessoryControl *)self accessoryUniqueIdentifier];
  v6 = [(BMHomeKitClientAccessoryControl *)self accessoryState];
  uint64_t v7 = [v6 jsonDictionary];

  uint64_t v8 = [(BMHomeKitClientAccessoryControl *)self serviceUniqueIdentifier];
  uint64_t v9 = [(BMHomeKitClientAccessoryControl *)self serviceType];
  uint64_t v10 = [(BMHomeKitClientAccessoryControl *)self characteristicType];
  int v11 = [(BMHomeKitClientAccessoryControl *)self serviceGroupUniqueIdentifier];
  char v12 = [(BMHomeKitClientAccessoryControl *)self _zoneUniqueIdentifiersJSONArray];
  uint64_t v13 = [(BMHomeKitClientAccessoryControl *)self roomUniqueIdentifier];
  v53 = [(BMHomeKitClientAccessoryControl *)self accessoryName];
  v52 = [(BMHomeKitClientAccessoryControl *)self serviceName];
  v51 = [(BMHomeKitClientAccessoryControl *)self roomName];
  uint64_t v50 = [(BMHomeKitClientAccessoryControl *)self serviceGroupName];
  v49 = [(BMHomeKitClientAccessoryControl *)self _zoneNamesJSONArray];
  uint64_t v14 = [(BMHomeKitClientAccessoryControl *)self homeName];
  v54[0] = @"base";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v15;
  v55[0] = v15;
  v54[1] = @"accessoryUniqueIdentifier";
  uint64_t v16 = v5;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v16;
  v55[1] = v16;
  v54[2] = @"accessoryState";
  uint64_t v17 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v17;
  v55[2] = v17;
  v54[3] = @"serviceUniqueIdentifier";
  uint64_t v18 = v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v38 = (void *)v18;
  v55[3] = v18;
  v54[4] = @"serviceType";
  uint64_t v19 = v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v19;
  v55[4] = v19;
  v54[5] = @"characteristicType";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v20;
  v55[5] = v20;
  v54[6] = @"serviceGroupUniqueIdentifier";
  uint64_t v21 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v21;
  v55[6] = v21;
  v54[7] = @"zoneUniqueIdentifiers";
  uint64_t v22 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v44 = (void *)v13;
  v34 = (void *)v22;
  v55[7] = v22;
  v54[8] = @"roomUniqueIdentifier";
  uint64_t v23 = v13;
  if (!v13)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v48 = (void *)v14;
  uint64_t v32 = v23;
  v55[8] = v23;
  v54[9] = @"accessoryName";
  int v24 = v53;
  if (!v53)
  {
    int v24 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v23, v34, v35, v36, v37, v38, v39, v40, v41);
  }
  v46 = (void *)v9;
  v47 = (void *)v8;
  v55[9] = v24;
  v54[10] = @"serviceName";
  v25 = v52;
  if (!v52)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v10;
  v43 = (void *)v4;
  v55[10] = v25;
  v54[11] = @"roomName";
  uint64_t v26 = v51;
  if (!v51)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v5;
  v55[11] = v26;
  v54[12] = @"serviceGroupName";
  v28 = v50;
  if (!v50)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[12] = v28;
  v54[13] = @"zoneNames";
  v29 = v49;
  if (!v49)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[13] = v29;
  v54[14] = @"homeName";
  int v30 = v48;
  if (!v48)
  {
    int v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[14] = v30;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v55, v54, 15, v32);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!v48) {

  }
  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (!v44)
  }

  if (v12)
  {
    if (v11) {
      goto LABEL_47;
    }
  }
  else
  {

    if (v11)
    {
LABEL_47:
      if (v45) {
        goto LABEL_48;
      }
      goto LABEL_58;
    }
  }

  if (v45)
  {
LABEL_48:
    if (v46) {
      goto LABEL_49;
    }
    goto LABEL_59;
  }
LABEL_58:

  if (v46)
  {
LABEL_49:
    if (v47) {
      goto LABEL_50;
    }
    goto LABEL_60;
  }
LABEL_59:

  if (v47)
  {
LABEL_50:
    if (v7) {
      goto LABEL_51;
    }
    goto LABEL_61;
  }
LABEL_60:

  if (v7)
  {
LABEL_51:
    if (v27) {
      goto LABEL_52;
    }
LABEL_62:

    if (v43) {
      goto LABEL_53;
    }
    goto LABEL_63;
  }
LABEL_61:

  if (!v27) {
    goto LABEL_62;
  }
LABEL_52:
  if (v43) {
    goto LABEL_53;
  }
LABEL_63:

LABEL_53:

  return v42;
}

- (id)_zoneNamesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMHomeKitClientAccessoryControl *)self zoneNames];
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
  uint64_t v4 = [(BMHomeKitClientAccessoryControl *)self zoneUniqueIdentifiers];
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

- (BMHomeKitClientAccessoryControl)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v246[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"base"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v206 = 0;
    id v196 = v7;
    uint64_t v8 = [[BMHomeKitBase alloc] initWithJSONDictionary:v196 error:&v206];
    id v15 = v206;
    if (v15)
    {
      uint64_t v16 = v15;
      if (a4) {
        *a4 = v15;
      }

      a4 = 0;
      goto LABEL_178;
    }

LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"accessoryUniqueIdentifier"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          int v30 = v9;
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v32 = a4;
          v33 = v8;
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v243 = *MEMORY[0x1E4F28568];
          v35 = self;
          id v36 = [NSString alloc];
          uint64_t v163 = objc_opt_class();
          v37 = v36;
          self = v35;
          id v18 = (id)[v37 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v163, @"accessoryUniqueIdentifier"];
          id v244 = v18;
          uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v244 forKeys:&v243 count:1];
          v39 = v31;
          uint64_t v9 = v30;
          uint64_t v40 = v34;
          uint64_t v8 = v33;
          id v196 = 0;
          a4 = 0;
          *uint64_t v32 = (id)[v39 initWithDomain:v40 code:2 userInfo:v38];
          goto LABEL_175;
        }
        id v196 = 0;
LABEL_177:

        goto LABEL_178;
      }
      id v196 = v9;
    }
    else
    {
      id v196 = 0;
    }
    long long v10 = [v6 objectForKeyedSubscript:@"accessoryState"];
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v194 = 0;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = v9;
      id v18 = v10;
      uint64_t v19 = [BMHomeKitAccessoryState alloc];
      id v205 = 0;
      uint64_t v194 = [(BMHomeKitAccessoryState *)v19 initWithJSONDictionary:v18 error:&v205];
      id v20 = v205;
      if (v20)
      {
        uint64_t v21 = v20;
        if (a4) {
          *a4 = v20;
        }

        a4 = 0;
        uint64_t v9 = v17;
        goto LABEL_174;
      }

LABEL_10:
      v195 = [v6 objectForKeyedSubscript:@"serviceUniqueIdentifier"];
      v191 = self;
      v192 = v9;
      if (v195 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
            int v60 = v8;
            uint64_t v61 = *MEMORY[0x1E4F502C8];
            uint64_t v239 = *MEMORY[0x1E4F28568];
            uint64_t v62 = a4;
            uint64_t v63 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"serviceUniqueIdentifier"];
            uint64_t v240 = v63;
            uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v240 forKeys:&v239 count:1];
            v65 = v59;
            uint64_t v9 = v192;
            uint64_t v66 = v61;
            uint64_t v8 = v60;
            v67 = 0;
            a4 = 0;
            *uint64_t v62 = (id)[v65 initWithDomain:v66 code:2 userInfo:v64];
            long long v11 = (void *)v64;
            uint64_t v68 = (void *)v63;
            goto LABEL_172;
          }
          v67 = 0;
          goto LABEL_173;
        }
        id v189 = v195;
      }
      else
      {
        id v189 = 0;
      }
      long long v11 = [v6 objectForKeyedSubscript:@"serviceType"];
      v190 = v11;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
            v75 = v8;
            uint64_t v76 = *MEMORY[0x1E4F502C8];
            uint64_t v237 = *MEMORY[0x1E4F28568];
            v77 = a4;
            id v187 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"serviceType"];
            id v238 = v187;
            uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v238 forKeys:&v237 count:1];
            v79 = v74;
            uint64_t v9 = v192;
            uint64_t v80 = v76;
            uint64_t v8 = v75;
            v188 = (void *)v78;
            uint64_t v68 = 0;
            a4 = 0;
            id *v77 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
            v67 = v189;
            goto LABEL_171;
          }
          uint64_t v68 = 0;
          v67 = v189;
          goto LABEL_172;
        }
        id v184 = v11;
      }
      else
      {
        id v184 = 0;
      }
      uint64_t v12 = [v6 objectForKeyedSubscript:@"characteristicType"];
      v188 = (void *)v12;
      if (v12 && (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v187 = 0;
            v67 = v189;
            uint64_t v68 = v184;
            goto LABEL_171;
          }
          id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
          int v84 = v8;
          uint64_t v85 = *MEMORY[0x1E4F502C8];
          uint64_t v235 = *MEMORY[0x1E4F28568];
          uint64_t v86 = a4;
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"characteristicType"];
          id v236 = v14;
          uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v236 forKeys:&v235 count:1];
          v88 = v83;
          uint64_t v9 = v192;
          uint64_t v89 = v85;
          uint64_t v8 = v84;
          v183 = (void *)v87;
          id v187 = 0;
          a4 = 0;
          *uint64_t v86 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
          goto LABEL_110;
        }
        id v187 = v13;
      }
      else
      {
        id v187 = 0;
      }
      id v14 = [v6 objectForKeyedSubscript:@"serviceGroupUniqueIdentifier"];
      v185 = a4;
      v183 = v14;
      if (!v14)
      {
        v181 = v8;
        goto LABEL_49;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v181 = v8;
        id v14 = 0;
LABEL_49:
        id v48 = [v6 objectForKeyedSubscript:@"zoneUniqueIdentifiers"];
        v49 = [MEMORY[0x1E4F1CA98] null];
        int v50 = [v48 isEqual:v49];

        v180 = v10;
        if (v50)
        {

          id v48 = 0;
        }
        else if (v48)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v97 = *MEMORY[0x1E4F502C8];
              uint64_t v231 = *MEMORY[0x1E4F28568];
              v51 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"zoneUniqueIdentifiers"];
              v232 = v51;
              uint64_t v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
              uint64_t v99 = v97;
              long long v10 = v180;
              id v100 = (id)[v96 initWithDomain:v99 code:2 userInfo:v98];
              v101 = a4;
              a4 = 0;
              id *v101 = v100;
              int v90 = (void *)v98;
              uint64_t v8 = v181;
              v67 = v189;
              goto LABEL_167;
            }
            uint64_t v8 = v181;
            v67 = v189;
            goto LABEL_169;
          }
        }
        v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v48, "count"));
        long long v201 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        id v48 = v48;
        uint64_t v52 = [v48 countByEnumeratingWithState:&v201 objects:v230 count:16];
        if (!v52) {
          goto LABEL_62;
        }
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v202;
        while (1)
        {
          for (uint64_t i = 0; i != v53; ++i)
          {
            if (*(void *)v202 != v54) {
              objc_enumerationMutation(v48);
            }
            uint64_t v56 = *(void *)(*((void *)&v201 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v185)
              {
                id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v70 = *MEMORY[0x1E4F502C8];
                uint64_t v228 = *MEMORY[0x1E4F28568];
                v177 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"zoneUniqueIdentifiers"];
                v229 = v177;
                uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
                int v72 = v69;
                uint64_t v73 = v70;
LABEL_73:
                v175 = (void *)v71;
                v67 = v189;
                long long v11 = v190;
                a4 = 0;
                id *v185 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2);
                id v178 = v48;
                long long v10 = v180;
                uint64_t v8 = v181;

                goto LABEL_166;
              }
LABEL_77:
              a4 = 0;
              int v90 = v48;
              long long v10 = v180;
              uint64_t v8 = v181;
              v67 = v189;
              long long v11 = v190;
              goto LABEL_167;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v185)
              {
                id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v82 = *MEMORY[0x1E4F502C8];
                uint64_t v226 = *MEMORY[0x1E4F28568];
                v177 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"zoneUniqueIdentifiers"];
                v227 = v177;
                uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v227 forKeys:&v226 count:1];
                int v72 = v81;
                uint64_t v73 = v82;
                goto LABEL_73;
              }
              goto LABEL_77;
            }
            [v51 addObject:v56];
          }
          uint64_t v53 = [v48 countByEnumeratingWithState:&v201 objects:v230 count:16];
          if (!v53)
          {
LABEL_62:

            uint64_t v57 = [v6 objectForKeyedSubscript:@"roomUniqueIdentifier"];
            v177 = (void *)v57;
            id v173 = v14;
            if (!v57)
            {
              id v178 = 0;
              long long v10 = v180;
              goto LABEL_88;
            }
            v58 = (void *)v57;
            objc_opt_class();
            long long v10 = v180;
            if (objc_opt_isKindOfClass())
            {
              id v178 = 0;
              goto LABEL_88;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v178 = v58;
LABEL_88:
              uint64_t v102 = [v6 objectForKeyedSubscript:@"accessoryName"];
              v171 = (void *)v102;
              if (v102)
              {
                v103 = (void *)v102;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v176 = 0;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v185)
                    {
                      id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v127 = *MEMORY[0x1E4F502C8];
                      uint64_t v222 = *MEMORY[0x1E4F28568];
                      id v170 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accessoryName"];
                      id v223 = v170;
                      uint64_t v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v223 forKeys:&v222 count:1];
                      uint64_t v129 = v127;
                      long long v10 = v180;
                      v169 = (void *)v128;
                      id v176 = 0;
                      a4 = 0;
                      id *v185 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v129, 2);
                      uint64_t v8 = v181;
                      v67 = v189;
                      long long v11 = v190;
                      id v14 = v173;
                      goto LABEL_163;
                    }
                    id v176 = 0;
                    a4 = 0;
                    uint64_t v8 = v181;
                    v67 = v189;
                    long long v11 = v190;
                    id v14 = v173;
                    goto LABEL_164;
                  }
                  id v176 = v103;
                }
              }
              else
              {
                id v176 = 0;
              }
              uint64_t v104 = [v6 objectForKeyedSubscript:@"serviceName"];
              id v14 = v173;
              v169 = (void *)v104;
              if (v104 && (v105 = (void *)v104, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v185)
                  {
                    id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v137 = *MEMORY[0x1E4F502C8];
                    uint64_t v220 = *MEMORY[0x1E4F28568];
                    id v168 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"serviceName"];
                    id v221 = v168;
                    uint64_t v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v220 count:1];
                    uint64_t v139 = v137;
                    long long v10 = v180;
                    v167 = (void *)v138;
                    id v170 = 0;
                    a4 = 0;
                    id *v185 = (id)objc_msgSend(v136, "initWithDomain:code:userInfo:", v139, 2);
                    uint64_t v8 = v181;
                    v67 = v189;
                    long long v11 = v190;
                    goto LABEL_162;
                  }
                  id v170 = 0;
                  a4 = 0;
                  uint64_t v8 = v181;
                  v67 = v189;
                  long long v11 = v190;
                  goto LABEL_163;
                }
                id v170 = v105;
              }
              else
              {
                id v170 = 0;
              }
              uint64_t v106 = [v6 objectForKeyedSubscript:@"roomName"];
              v167 = (void *)v106;
              if (v106 && (v107 = (void *)v106, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v185)
                  {
                    id v141 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v142 = *MEMORY[0x1E4F502C8];
                    uint64_t v218 = *MEMORY[0x1E4F28568];
                    id v166 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"roomName"];
                    id v219 = v166;
                    uint64_t v143 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
                    uint64_t v144 = v142;
                    long long v10 = v180;
                    v165 = (void *)v143;
                    id v168 = 0;
                    a4 = 0;
                    id *v185 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v144, 2);
                    uint64_t v8 = v181;
                    v67 = v189;
                    long long v11 = v190;
                    id v14 = v173;
                    goto LABEL_161;
                  }
                  id v168 = 0;
                  a4 = 0;
                  uint64_t v8 = v181;
                  v67 = v189;
                  long long v11 = v190;
                  id v14 = v173;
                  goto LABEL_162;
                }
                id v168 = v107;
              }
              else
              {
                id v168 = 0;
              }
              uint64_t v108 = [v6 objectForKeyedSubscript:@"serviceGroupName"];
              id v14 = v173;
              v165 = (void *)v108;
              if (v108 && (v109 = (void *)v108, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v185)
                  {
                    id v146 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v147 = *MEMORY[0x1E4F502C8];
                    uint64_t v216 = *MEMORY[0x1E4F28568];
                    id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"serviceGroupName"];
                    id v217 = obj;
                    uint64_t v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
                    v149 = v146;
                    uint64_t v150 = v147;
                    long long v10 = v180;
                    v113 = (void *)v148;
                    id v166 = 0;
                    a4 = 0;
                    id *v185 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v150, 2);
                    uint64_t v8 = v181;
                    v67 = v189;
                    long long v11 = v190;
                    goto LABEL_159;
                  }
                  id v166 = 0;
                  a4 = 0;
                  uint64_t v8 = v181;
                  v67 = v189;
                  long long v11 = v190;
                  goto LABEL_161;
                }
                id v166 = v109;
              }
              else
              {
                id v166 = 0;
              }
              v110 = [v6 objectForKeyedSubscript:@"zoneNames"];
              v111 = [MEMORY[0x1E4F1CA98] null];
              int v112 = [v110 isEqual:v111];

              if (v112)
              {

                v110 = 0;
LABEL_113:
                v113 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v110, "count"));
                long long v197 = 0u;
                long long v198 = 0u;
                long long v199 = 0u;
                long long v200 = 0u;
                id obj = v110;
                uint64_t v114 = [obj countByEnumeratingWithState:&v197 objects:v213 count:16];
                if (!v114) {
                  goto LABEL_122;
                }
                uint64_t v115 = v114;
                uint64_t v116 = *(void *)v198;
LABEL_115:
                uint64_t v117 = 0;
                while (1)
                {
                  if (*(void *)v198 != v116) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v118 = *(void *)(*((void *)&v197 + 1) + 8 * v117);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    break;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v185)
                    {
                      id v131 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v132 = *MEMORY[0x1E4F502C8];
                      uint64_t v209 = *MEMORY[0x1E4F28568];
                      v130 = v185;
                      v164 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"zoneNames"];
                      v210 = v164;
                      v133 = (void *)MEMORY[0x1E4F1C9E8];
                      v134 = &v210;
                      v135 = &v209;
                      goto LABEL_140;
                    }
                    goto LABEL_144;
                  }
                  [v113 addObject:v118];
                  if (v115 == ++v117)
                  {
                    uint64_t v115 = [obj countByEnumeratingWithState:&v197 objects:v213 count:16];
                    if (v115) {
                      goto LABEL_115;
                    }
LABEL_122:

                    uint64_t v119 = [v6 objectForKeyedSubscript:@"homeName"];
                    v164 = (void *)v119;
                    if (!v119)
                    {
                      id v121 = 0;
                      long long v11 = v190;
                      v155 = v191;
                      long long v10 = v180;
                      uint64_t v8 = v181;
                      v67 = v189;
                      goto LABEL_156;
                    }
                    v120 = (void *)v119;
                    objc_opt_class();
                    long long v10 = v180;
                    uint64_t v8 = v181;
                    if (objc_opt_isKindOfClass())
                    {
                      id v121 = 0;
                      v67 = v189;
                      goto LABEL_155;
                    }
                    objc_opt_class();
                    v67 = v189;
                    if (objc_opt_isKindOfClass())
                    {
                      id v121 = v120;
LABEL_155:
                      long long v11 = v190;
                      v155 = v191;
LABEL_156:
                      id v186 = v121;
                      a4 = objc_retain(-[BMHomeKitClientAccessoryControl initWithBase:accessoryUniqueIdentifier:accessoryState:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](v155, "initWithBase:accessoryUniqueIdentifier:accessoryState:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v8, v196, v194, v67, v184, v187, v173, v51, v178, v176, v170, v168, v166, v113,
                               v121));
                      v191 = (BMHomeKitClientAccessoryControl *)a4;
                    }
                    else
                    {
                      if (v185)
                      {
                        id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v158 = *MEMORY[0x1E4F502C8];
                        uint64_t v207 = *MEMORY[0x1E4F28568];
                        v159 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"homeName"];
                        v208 = v159;
                        v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
                        v161 = v157;
                        uint64_t v162 = v158;
                        long long v10 = v180;
                        uint64_t v8 = v181;
                        id *v185 = (id)[v161 initWithDomain:v162 code:2 userInfo:v160];

                        v67 = v189;
                      }
                      id v186 = 0;
                      a4 = 0;
LABEL_141:
                      long long v11 = v190;
                    }

                    v145 = v186;
LABEL_158:

LABEL_159:
                    id v14 = v173;
LABEL_160:

LABEL_161:
LABEL_162:

LABEL_163:
LABEL_164:

LABEL_165:
                    goto LABEL_166;
                  }
                }
                v130 = v185;
                if (v185)
                {
                  id v131 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v132 = *MEMORY[0x1E4F502C8];
                  uint64_t v211 = *MEMORY[0x1E4F28568];
                  v164 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"zoneNames"];
                  v212 = v164;
                  v133 = (void *)MEMORY[0x1E4F1C9E8];
                  v134 = &v212;
                  v135 = &v211;
LABEL_140:
                  v140 = [v133 dictionaryWithObjects:v134 forKeys:v135 count:1];
                  id *v130 = (id)[v131 initWithDomain:v132 code:2 userInfo:v140];

                  a4 = 0;
                  id v186 = obj;
                  long long v10 = v180;
                  uint64_t v8 = v181;
                  v67 = v189;
                  goto LABEL_141;
                }
LABEL_144:
                a4 = 0;
                v145 = obj;
              }
              else
              {
                if (!v110) {
                  goto LABEL_113;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  goto LABEL_113;
                }
                id obj = v110;
                if (!v185)
                {
                  a4 = 0;
                  long long v10 = v180;
                  uint64_t v8 = v181;
                  v67 = v189;
                  long long v11 = v190;
                  goto LABEL_160;
                }
                id v151 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v152 = *MEMORY[0x1E4F502C8];
                uint64_t v214 = *MEMORY[0x1E4F28568];
                v113 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"zoneNames"];
                v215 = v113;
                uint64_t v153 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
                id v154 = (id)[v151 initWithDomain:v152 code:2 userInfo:v153];
                v145 = (void *)v153;
                a4 = 0;
                id *v185 = v154;
              }
              long long v10 = v180;
              uint64_t v8 = v181;
              v67 = v189;
              long long v11 = v190;
              goto LABEL_158;
            }
            if (v185)
            {
              id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v122 = *MEMORY[0x1E4F502C8];
              uint64_t v224 = *MEMORY[0x1E4F28568];
              id v176 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"roomUniqueIdentifier"];
              id v225 = v176;
              uint64_t v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v225 forKeys:&v224 count:1];
              uint64_t v124 = v122;
              long long v10 = v180;
              v172 = (void *)v123;
              id v125 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v124, 2);
              id v178 = 0;
              a4 = 0;
              id *v185 = v125;
              uint64_t v8 = v181;
              v67 = v189;
              long long v11 = v190;

              goto LABEL_165;
            }
            id v178 = 0;
            a4 = 0;
            uint64_t v8 = v181;
            v67 = v189;
            long long v11 = v190;
LABEL_166:

            int v90 = v178;
LABEL_167:

LABEL_168:
LABEL_169:

            uint64_t v9 = v192;
LABEL_170:
            uint64_t v68 = v184;

LABEL_171:
LABEL_172:
            self = v191;

LABEL_173:
            id v18 = v10;
LABEL_174:
            uint64_t v38 = (void *)v194;
LABEL_175:

            long long v10 = v18;
            goto LABEL_176;
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v181 = v8;
        id v14 = v14;
        goto LABEL_49;
      }
      if (a4)
      {
        v91 = v8;
        id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v93 = *MEMORY[0x1E4F502C8];
        uint64_t v233 = *MEMORY[0x1E4F28568];
        id v48 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"serviceGroupUniqueIdentifier"];
        id v234 = v48;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v234 forKeys:&v233 count:1];
        v94 = v92;
        uint64_t v8 = v91;
        id v95 = (id)[v94 initWithDomain:v93 code:2 userInfo:v51];
        id v14 = 0;
        a4 = 0;
        id *v185 = v95;
        v67 = v189;
        goto LABEL_168;
      }
      id v14 = 0;
LABEL_110:
      v67 = v189;
      long long v11 = v190;
      goto LABEL_170;
    }
    if (a4)
    {
      v193 = v9;
      id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
      v182 = v8;
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v241 = *MEMORY[0x1E4F28568];
      v43 = self;
      uint64_t v44 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"accessoryState"];
      uint64_t v242 = v44;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v242 forKeys:&v241 count:1];
      v46 = v41;
      uint64_t v9 = v193;
      uint64_t v47 = v42;
      uint64_t v8 = v182;
      *a4 = (id)[v46 initWithDomain:v47 code:2 userInfo:v45];

      a4 = 0;
      id v18 = v10;
      uint64_t v38 = (void *)v44;
      self = v43;
      goto LABEL_175;
    }
LABEL_176:

    goto LABEL_177;
  }
  if (a4)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = self;
    int v24 = v7;
    uint64_t v25 = *MEMORY[0x1E4F502C8];
    uint64_t v245 = *MEMORY[0x1E4F28568];
    uint64_t v8 = (BMHomeKitBase *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"base"];
    v246[0] = v8;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v246 forKeys:&v245 count:1];
    uint64_t v27 = v25;
    uint64_t v7 = v24;
    self = v23;
    id v196 = (id)v26;
    id v28 = (id)[v22 initWithDomain:v27 code:2 userInfo:v26];
    v29 = a4;
    a4 = 0;
    id *v29 = v28;
LABEL_178:
  }
  return (BMHomeKitClientAccessoryControl *)a4;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMHomeKitClientAccessoryControl *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base)
  {
    uint64_t v23 = 0;
    PBDataWriterPlaceMark();
    [(BMHomeKitBase *)self->_base writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_accessoryUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryState)
  {
    uint64_t v23 = 0;
    PBDataWriterPlaceMark();
    [(BMHomeKitAccessoryState *)self->_accessoryState writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_serviceUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_characteristicType) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceGroupUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_zoneUniqueIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_roomUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_roomName) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceGroupName) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = self->_zoneNames;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v12);
  }

  if (self->_homeName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMHomeKitClientAccessoryControl;
  uint64_t v5 = [(BMEventBase *)&v38 init];
  if (!v5)
  {
LABEL_49:
    id v36 = v5;
    goto LABEL_50;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_47:
    uint64_t v31 = [v6 copy];
    zoneUniqueIdentifiers = v5->_zoneUniqueIdentifiers;
    v5->_zoneUniqueIdentifiers = (NSArray *)v31;

    uint64_t v33 = [v7 copy];
    zoneNames = v5->_zoneNames;
    v5->_zoneNames = (NSArray *)v33;

    int v35 = v4[*v10];
    if (v35) {
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_47;
    }
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *v8;
      unint64_t v16 = *(void *)&v4[v15];
      if (v16 == -1 || v16 >= *(void *)&v4[*v9]) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
      *(void *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0) {
        goto LABEL_13;
      }
      v12 += 7;
      if (v13++ >= 9)
      {
        unint64_t v14 = 0;
        int v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    int v19 = v4[*v10];
    if (v4[*v10]) {
      unint64_t v14 = 0;
    }
LABEL_15:
    if (v19 || (v14 & 7) == 4) {
      goto LABEL_47;
    }
    switch((v14 >> 3))
    {
      case 1u:
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_51;
        }
        long long v21 = [[BMHomeKitBase alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_51;
        }
        uint64_t v22 = 24;
        goto LABEL_29;
      case 2u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 32;
        goto LABEL_45;
      case 3u:
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_51;
        }
        long long v21 = [[BMHomeKitAccessoryState alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_51;
        }
        uint64_t v22 = 40;
LABEL_29:
        uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = v21;

        PBReaderRecallMark();
        goto LABEL_46;
      case 4u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 48;
        goto LABEL_45;
      case 5u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 56;
        goto LABEL_45;
      case 6u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 64;
        goto LABEL_45;
      case 7u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 72;
        goto LABEL_45;
      case 8u:
        uint64_t v26 = PBReaderReadString();
        if (!v26) {
          goto LABEL_51;
        }
        uint64_t v27 = (void *)v26;
        id v28 = v6;
        goto LABEL_43;
      case 9u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 88;
        goto LABEL_45;
      case 0xAu:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 96;
        goto LABEL_45;
      case 0xBu:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 104;
        goto LABEL_45;
      case 0xCu:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 112;
        goto LABEL_45;
      case 0xDu:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 120;
        goto LABEL_45;
      case 0xEu:
        uint64_t v29 = PBReaderReadString();
        if (!v29) {
          goto LABEL_51;
        }
        uint64_t v27 = (void *)v29;
        id v28 = v7;
LABEL_43:
        [v28 addObject:v27];

        goto LABEL_46;
      case 0xFu:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 136;
LABEL_45:
        int v30 = *(Class *)((char *)&v5->super.super.isa + v24);
        *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

        goto LABEL_46;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_46:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_47;
          }
          continue;
        }
LABEL_51:

LABEL_48:
        id v36 = 0;
LABEL_50:

        return v36;
    }
  }
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unint64_t v14 = [(BMHomeKitClientAccessoryControl *)self base];
  unsigned int v13 = [(BMHomeKitClientAccessoryControl *)self accessoryUniqueIdentifier];
  long long v20 = [(BMHomeKitClientAccessoryControl *)self accessoryState];
  int v19 = [(BMHomeKitClientAccessoryControl *)self serviceUniqueIdentifier];
  long long v18 = [(BMHomeKitClientAccessoryControl *)self serviceType];
  char v17 = [(BMHomeKitClientAccessoryControl *)self characteristicType];
  v3 = [(BMHomeKitClientAccessoryControl *)self serviceGroupUniqueIdentifier];
  id v4 = [(BMHomeKitClientAccessoryControl *)self zoneUniqueIdentifiers];
  uint64_t v5 = [(BMHomeKitClientAccessoryControl *)self roomUniqueIdentifier];
  uint64_t v6 = [(BMHomeKitClientAccessoryControl *)self accessoryName];
  char v12 = [(BMHomeKitClientAccessoryControl *)self serviceName];
  uint64_t v7 = [(BMHomeKitClientAccessoryControl *)self roomName];
  uint64_t v8 = [(BMHomeKitClientAccessoryControl *)self serviceGroupName];
  uint64_t v9 = [(BMHomeKitClientAccessoryControl *)self zoneNames];
  long long v10 = [(BMHomeKitClientAccessoryControl *)self homeName];
  unint64_t v16 = (void *)[v15 initWithFormat:@"BMHomeKitClientAccessoryControl with base: %@, accessoryUniqueIdentifier: %@, accessoryState: %@, serviceUniqueIdentifier: %@, serviceType: %@, characteristicType: %@, serviceGroupUniqueIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, serviceName: %@, roomName: %@, serviceGroupName: %@, zoneNames: %@, homeName: %@", v14, v13, v20, v19, v18, v17, v3, v4, v5, v6, v12, v7, v8, v9, v10];

  return (NSString *)v16;
}

- (BMHomeKitClientAccessoryControl)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryState:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v42 = a3;
  id v41 = a4;
  id v40 = a5;
  id v30 = a6;
  id v39 = a6;
  id v31 = a7;
  id v38 = a7;
  id v37 = a8;
  id v36 = a9;
  id v35 = a10;
  id v34 = a11;
  id v33 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v43.receiver = self;
  v43.super_class = (Class)BMHomeKitClientAccessoryControl;
  uint64_t v27 = [(BMEventBase *)&v43 init];
  if (v27)
  {
    v27->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v27->_accessoryUniqueIdentifier, a4);
    objc_storeStrong((id *)&v27->_accessoryState, a5);
    objc_storeStrong((id *)&v27->_serviceUniqueIdentifier, v30);
    objc_storeStrong((id *)&v27->_serviceType, v31);
    objc_storeStrong((id *)&v27->_characteristicType, a8);
    objc_storeStrong((id *)&v27->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v27->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v27->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v27->_accessoryName, a12);
    objc_storeStrong((id *)&v27->_serviceName, a13);
    objc_storeStrong((id *)&v27->_roomName, a14);
    objc_storeStrong((id *)&v27->_serviceGroupName, a15);
    objc_storeStrong((id *)&v27->_zoneNames, a16);
    objc_storeStrong((id *)&v27->_homeName, a17);
  }

  return v27;
}

+ (id)protoFields
{
  v19[15] = *MEMORY[0x1E4F143B8];
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"base" number:1 type:14 subMessageClass:objc_opt_class()];
  v19[0] = v18;
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryUniqueIdentifier" number:2 type:13 subMessageClass:0];
  v19[1] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryState" number:3 type:14 subMessageClass:objc_opt_class()];
  v19[2] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serviceUniqueIdentifier" number:4 type:13 subMessageClass:0];
  v19[3] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serviceType" number:5 type:13 subMessageClass:0];
  v19[4] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"characteristicType" number:6 type:13 subMessageClass:0];
  v19[5] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serviceGroupUniqueIdentifier" number:7 type:13 subMessageClass:0];
  v19[6] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"zoneUniqueIdentifiers" number:8 type:13 subMessageClass:0];
  v19[7] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"roomUniqueIdentifier" number:9 type:13 subMessageClass:0];
  v19[8] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessoryName" number:10 type:13 subMessageClass:0];
  v19[9] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serviceName" number:11 type:13 subMessageClass:0];
  v19[10] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"roomName" number:12 type:13 subMessageClass:0];
  v19[11] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serviceGroupName" number:13 type:13 subMessageClass:0];
  v19[12] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"zoneNames" number:14 type:13 subMessageClass:0];
  v19[13] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeName" number:15 type:13 subMessageClass:0];
  v19[14] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6690;
}

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _zoneNamesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _zoneUniqueIdentifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 accessoryState];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __42__BMHomeKitClientAccessoryControl_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 base];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

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
    uint64_t v7 = BMHomeKitClientAccessoryControl;
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMHomeKitClientAccessoryControl_v0;
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