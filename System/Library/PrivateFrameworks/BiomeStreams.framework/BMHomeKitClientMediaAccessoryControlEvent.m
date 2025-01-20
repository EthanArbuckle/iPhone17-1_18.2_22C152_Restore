@interface BMHomeKitClientMediaAccessoryControlEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMHomeKitClientBase)base;
- (BMHomeKitClientMediaAccessoryControlEvent)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryStateString:(id)a5 accessoryStateNumber:(id)a6 accessoryStateData:(id)a7 accessoryMediaRouteIdentifier:(id)a8 zoneUniqueIdentifiers:(id)a9 roomUniqueIdentifier:(id)a10 accessoryName:(id)a11 roomName:(id)a12 zoneNames:(id)a13 homeName:(id)a14;
- (BMHomeKitClientMediaAccessoryControlEvent)initWithProto:(id)a3;
- (BMHomeKitClientMediaAccessoryControlEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)zoneNames;
- (NSArray)zoneUniqueIdentifiers;
- (NSDictionary)accessoryStateData;
- (NSDictionary)accessoryStateNumber;
- (NSDictionary)accessoryStateString;
- (NSString)accessoryMediaRouteIdentifier;
- (NSString)accessoryName;
- (NSString)accessoryUniqueIdentifier;
- (NSString)description;
- (NSString)homeName;
- (NSString)roomName;
- (NSString)roomUniqueIdentifier;
- (id)encodeAsProto;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation BMHomeKitClientMediaAccessoryControlEvent

- (BMHomeKitClientMediaAccessoryControlEvent)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryStateString:(id)a5 accessoryStateNumber:(id)a6 accessoryStateData:(id)a7 accessoryMediaRouteIdentifier:(id)a8 zoneUniqueIdentifiers:(id)a9 roomUniqueIdentifier:(id)a10 accessoryName:(id)a11 roomName:(id)a12 zoneNames:(id)a13 homeName:(id)a14
{
  id v37 = a3;
  id v27 = a4;
  id v36 = a4;
  id v35 = a5;
  id v28 = a6;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v30 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  v38.receiver = self;
  v38.super_class = (Class)BMHomeKitClientMediaAccessoryControlEvent;
  v23 = [(BMEventBase *)&v38 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_base, a3);
    objc_storeStrong((id *)&v24->_accessoryUniqueIdentifier, v27);
    objc_storeStrong((id *)&v24->_accessoryStateString, a5);
    objc_storeStrong((id *)&v24->_accessoryStateNumber, v28);
    objc_storeStrong((id *)&v24->_accessoryStateData, a7);
    objc_storeStrong((id *)&v24->_accessoryMediaRouteIdentifier, a8);
    objc_storeStrong((id *)&v24->_zoneUniqueIdentifiers, a9);
    objc_storeStrong((id *)&v24->_roomUniqueIdentifier, a10);
    objc_storeStrong((id *)&v24->_accessoryName, a11);
    objc_storeStrong((id *)&v24->_roomName, a12);
    objc_storeStrong((id *)&v24->_zoneNames, a13);
    objc_storeStrong((id *)&v24->_homeName, a14);
  }

  return v24;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"BMHomeKitClientMediaAccessoryControlEvent event with base: %@, accessoryUniqueIdentifier: %@, accessoryStateString: %@, accessoryStateNumber: %@, accessoryStateData: %@, accessoryMediaRouteIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, roomName: %@, zoneNames: %@, homeName: %@", self->_base, self->_accessoryUniqueIdentifier, self->_accessoryStateString, self->_accessoryStateNumber, self->_accessoryStateData, self->_accessoryMediaRouteIdentifier, self->_zoneUniqueIdentifiers, self->_roomUniqueIdentifier, self->_accessoryName, self->_roomName, self->_zoneNames, self->_homeName];

  return (NSString *)v2;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (!a4)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = (objc_class *)BMHomeKitClientMediaAccessoryControlEvent_v1;
LABEL_5:
    v8 = (void *)[[v7 alloc] initWithProtoData:v6];
    goto LABEL_9;
  }
  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[BMHomeKitClientMediaAccessoryControlEvent eventWithData:dataVersion:](v9);
  }

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMHomeKitClientMediaAccessoryControlEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMHomeKitClientMediaAccessoryControlEvent)initWithProto:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = self;
      id v35 = v4;
      v5 = v4;
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v33 = v5;
      v9 = [v5 accessoryStates];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v10) {
        goto LABEL_17;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          int v15 = [v14 valueType];
          if (v15)
          {
            if (v15 == 2)
            {
              id v19 = NSNumber;
              [v14 numValue];
              v16 = objc_msgSend(v19, "numberWithDouble:");
              v17 = [v14 mediaPropertyType];
              v18 = v7;
            }
            else
            {
              if (v15 != 1) {
                goto LABEL_15;
              }
              v16 = [v14 stringValue];
              v17 = [v14 mediaPropertyType];
              v18 = v6;
            }
          }
          else
          {
            v16 = [v14 dataValue];
            v17 = [v14 mediaPropertyType];
            v18 = v8;
          }
          [v18 setObject:v16 forKey:v17];

LABEL_15:
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (!v11)
        {
LABEL_17:

          id v20 = [BMHomeKitClientBase alloc];
          id v21 = v33;
          id v32 = [v33 base];
          id v37 = [(BMHomeKitClientBase *)v20 initWithProto:v32];
          id v36 = [v33 accessoryUniqueIdentifier];
          id v31 = [v33 accessoryMediaRouteIdentifier];
          id v30 = [v33 zoneUniqueIdentifiers];
          v29 = [v33 roomUniqueIdentifier];
          id v22 = [v33 accessoryName];
          v23 = [v33 roomName];
          v24 = [v33 zoneNames];
          v25 = [v33 homeName];
          v26 = v6;
          self = [(BMHomeKitClientMediaAccessoryControlEvent *)v34 initWithBase:v37 accessoryUniqueIdentifier:v36 accessoryStateString:v6 accessoryStateNumber:v7 accessoryStateData:v8 accessoryMediaRouteIdentifier:v31 zoneUniqueIdentifiers:v30 roomUniqueIdentifier:v29 accessoryName:v22 roomName:v23 zoneNames:v24 homeName:v25];

          id v27 = self;
          id v4 = v35;
          goto LABEL_22;
        }
      }
    }
    id v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BMHomeKitClientMediaAccessoryControlEvent initWithProto:]();
    }
    id v27 = 0;
LABEL_22:
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (BMHomeKitClientMediaAccessoryControlEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBHomeKitClientMediaAccessoryControlEvent alloc] initWithData:v4];

    self = [(BMHomeKitClientMediaAccessoryControlEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self base];
  v5 = [v4 proto];
  [v3 setBase:v5];

  id v6 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryUniqueIdentifier];
  v47 = v3;
  [v3 setAccessoryUniqueIdentifier:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v8 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateString];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v14 = objc_opt_new();
        [v14 setMediaPropertyType:v13];
        int v15 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateString];
        v16 = [v15 objectForKey:v13];
        [v14 setStringValue:v16];

        [v14 setValueType:1];
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v10);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v17 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateNumber];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * j);
        v23 = objc_opt_new();
        [v23 setMediaPropertyType:v22];
        v24 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateNumber];
        v25 = [v24 objectForKey:v22];

        [v25 doubleValue];
        objc_msgSend(v23, "setNumValue:");
        [v23 setValueType:2];
        [v7 addObject:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v19);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v26 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateData];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        id v32 = objc_opt_new();
        [v32 setMediaPropertyType:v31];
        id v33 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateData];
        id v34 = [v33 objectForKey:v31];
        [v32 setDataValue:v34];

        [v32 setValueType:0];
        [v7 addObject:v32];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v28);
  }

  [v47 setAccessoryStates:v7];
  id v35 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryMediaRouteIdentifier];
  [v47 setAccessoryMediaRouteIdentifier:v35];

  id v36 = (void *)MEMORY[0x1E4F1CA48];
  id v37 = [(BMHomeKitClientMediaAccessoryControlEvent *)self zoneUniqueIdentifiers];
  long long v38 = [v36 arrayWithArray:v37];
  [v47 setZoneUniqueIdentifiers:v38];

  long long v39 = [(BMHomeKitClientMediaAccessoryControlEvent *)self roomUniqueIdentifier];
  [v47 setRoomUniqueIdentifier:v39];

  long long v40 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryName];
  [v47 setAccessoryName:v40];

  long long v41 = [(BMHomeKitClientMediaAccessoryControlEvent *)self roomName];
  [v47 setRoomName:v41];

  v42 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v43 = [(BMHomeKitClientMediaAccessoryControlEvent *)self zoneNames];
  v44 = [v42 arrayWithArray:v43];
  [v47 setZoneNames:v44];

  v45 = [(BMHomeKitClientMediaAccessoryControlEvent *)self homeName];
  [v47 setHomeName:v45];

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v11 = [(BMHomeKitClientMediaAccessoryControlEvent *)self base];
    if (v11 || ([v10 base], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self base];
      v5 = [v10 base];
      char v40 = [v4 isEqual:v5];

      if (v11)
      {
LABEL_9:

        uint64_t v13 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryUniqueIdentifier];
        if (v13
          || ([v10 accessoryUniqueIdentifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryUniqueIdentifier];
          v5 = [v10 accessoryUniqueIdentifier];
          char v39 = [v4 isEqual:v5];

          if (v13)
          {
LABEL_15:

            id v14 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateString];
            if (v14
              || ([v10 accessoryStateString], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateString];
              v5 = [v10 accessoryStateString];
              char v38 = [v4 isEqual:v5];

              if (v14)
              {
LABEL_21:

                int v15 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateNumber];
                if (v15
                  || ([v10 accessoryStateNumber],
                      (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateNumber];
                  v5 = [v10 accessoryStateNumber];
                  char v37 = [v4 isEqual:v5];

                  if (v15)
                  {
LABEL_27:

                    v16 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateData];
                    if (v16
                      || ([v10 accessoryStateData],
                          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryStateData];
                      v5 = [v10 accessoryStateData];
                      char v36 = [v4 isEqual:v5];

                      if (v16)
                      {
LABEL_33:

                        v17 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryMediaRouteIdentifier];
                        if (v17
                          || ([v10 accessoryMediaRouteIdentifier],
                              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryMediaRouteIdentifier];
                          v5 = [v10 accessoryMediaRouteIdentifier];
                          char v35 = [v4 isEqual:v5];

                          if (v17)
                          {
LABEL_39:

                            uint64_t v18 = [(BMHomeKitClientMediaAccessoryControlEvent *)self zoneUniqueIdentifiers];
                            if (v18
                              || ([v10 zoneUniqueIdentifiers],
                                  (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              id v4 = [(BMHomeKitClientMediaAccessoryControlEvent *)self zoneUniqueIdentifiers];
                              v5 = [v10 zoneUniqueIdentifiers];
                              HIDWORD(v34) = [v4 isEqual:v5];

                              if (v18)
                              {
LABEL_45:

                                uint64_t v19 = [(BMHomeKitClientMediaAccessoryControlEvent *)self roomUniqueIdentifier];
                                if (v19
                                  || ([v10 roomUniqueIdentifier],
                                      (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  v5 = [(BMHomeKitClientMediaAccessoryControlEvent *)self roomUniqueIdentifier];
                                  id v6 = [v10 roomUniqueIdentifier];
                                  LODWORD(v34) = [v5 isEqual:v6];

                                  if (v19)
                                  {
LABEL_51:

                                    uint64_t v20 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryName];
                                    if (v20
                                      || ([v10 accessoryName],
                                          (v5 = objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      id v6 = [(BMHomeKitClientMediaAccessoryControlEvent *)self accessoryName];
                                      id v7 = [v10 accessoryName];
                                      char v21 = [v6 isEqual:v7];

                                      if (v20)
                                      {
LABEL_57:

                                        uint64_t v22 = [(BMHomeKitClientMediaAccessoryControlEvent *)self roomName];
                                        if (v22
                                          || ([v10 roomName],
                                              (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
                                        {
                                          id v7 = [(BMHomeKitClientMediaAccessoryControlEvent *)self roomName];
                                          v23 = [v10 roomName];
                                          char v24 = [v7 isEqual:v23];

                                          if (v22)
                                          {
LABEL_63:

                                            v25 = [(BMHomeKitClientMediaAccessoryControlEvent *)self zoneNames];
                                            if (v25
                                              || ([v10 zoneNames],
                                                  (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
                                            {
                                              v26 = [(BMHomeKitClientMediaAccessoryControlEvent *)self zoneNames];
                                              uint64_t v27 = [v10 zoneNames];
                                              char v28 = [v26 isEqual:v27];

                                              if (v25)
                                              {
LABEL_69:

                                                uint64_t v29 = [(BMHomeKitClientMediaAccessoryControlEvent *)self homeName];
                                                if (v29
                                                  || ([v10 homeName],
                                                      (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
                                                {
                                                  id v30 = [(BMHomeKitClientMediaAccessoryControlEvent *)self homeName];
                                                  uint64_t v31 = [v10 homeName];
                                                  char v32 = [v30 isEqual:v31];

                                                  if (v29)
                                                  {
LABEL_75:

                                                    char v12 = v40 & v39 & v38 & v37 & v36 & v35 & BYTE4(v34) & v34 & v21 & v24 & v28 & v32;
                                                    goto LABEL_76;
                                                  }
                                                }
                                                else
                                                {
                                                  char v32 = 1;
                                                }

                                                goto LABEL_75;
                                              }
                                            }
                                            else
                                            {
                                              char v28 = 1;
                                            }

                                            goto LABEL_69;
                                          }
                                        }
                                        else
                                        {
                                          char v24 = 1;
                                        }

                                        goto LABEL_63;
                                      }
                                    }
                                    else
                                    {
                                      char v21 = 1;
                                    }

                                    goto LABEL_57;
                                  }
                                }
                                else
                                {
                                  LODWORD(v34) = 1;
                                }

                                goto LABEL_51;
                              }
                            }
                            else
                            {
                              HIDWORD(v34) = 1;
                            }

                            goto LABEL_45;
                          }
                        }
                        else
                        {
                          char v35 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      char v36 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  char v37 = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              char v38 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          char v39 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v40 = 1;
    }

    goto LABEL_9;
  }
  char v12 = 0;
LABEL_76:

  return v12;
}

- (BMHomeKitClientBase)base
{
  return self->_base;
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (NSDictionary)accessoryStateString
{
  return self->_accessoryStateString;
}

- (NSDictionary)accessoryStateNumber
{
  return self->_accessoryStateNumber;
}

- (NSDictionary)accessoryStateData
{
  return self->_accessoryStateData;
}

- (NSString)accessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier;
}

- (NSArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSString)homeName
{
  return self->_homeName;
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
  objc_storeStrong((id *)&self->_accessoryStateData, 0);
  objc_storeStrong((id *)&self->_accessoryStateNumber, 0);
  objc_storeStrong((id *)&self->_accessoryStateString, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_base, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Mismatched BMHomeKitClientMediaAccessoryControlEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBHomeKitClientMediaAccessoryControlEvent proto", v4, v5, v6, v7, 2u);
}

@end