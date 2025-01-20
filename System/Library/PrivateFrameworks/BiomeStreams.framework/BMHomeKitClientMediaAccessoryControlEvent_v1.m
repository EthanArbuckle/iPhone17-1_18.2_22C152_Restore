@interface BMHomeKitClientMediaAccessoryControlEvent_v1
- (BMHomeKitClientMediaAccessoryControlEvent_v1)initWithProto:(id)a3;
@end

@implementation BMHomeKitClientMediaAccessoryControlEvent_v1

- (BMHomeKitClientMediaAccessoryControlEvent_v1)initWithProto:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v35 = v4;
      v5 = v4;
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v34 = v5;
      v8 = [v5 accessoryStates];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v9) {
        goto LABEL_17;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          int v14 = [v13 valueType];
          if (v14 == 3) {
            goto LABEL_13;
          }
          if (v14 == 2)
          {
            v18 = [v13 stringValue];
            v19 = [v13 mediaPropertyType];
            [v37 setObject:v18 forKey:v19];

LABEL_13:
            v20 = NSNumber;
            [v13 numValue];
            v15 = objc_msgSend(v20, "numberWithDouble:");
            v16 = [v13 mediaPropertyType];
            v17 = v6;
            goto LABEL_14;
          }
          if (v14 != 1) {
            goto LABEL_15;
          }
          v15 = [v13 dataValue];
          v16 = [v13 mediaPropertyType];
          v17 = v7;
LABEL_14:
          [v17 setObject:v15 forKey:v16];

LABEL_15:
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (!v10)
        {
LABEL_17:

          v21 = [BMHomeKitClientBase alloc];
          v22 = v34;
          v33 = [v34 base];
          v36 = [(BMHomeKitClientBase *)v21 initWithProto:v33];
          v31 = [v34 accessoryUniqueIdentifier];
          v32 = [v34 accessoryMediaRouteIdentifier];
          v23 = [v34 zoneUniqueIdentifiers];
          v24 = [v34 roomUniqueIdentifier];
          v30 = [v34 accessoryName];
          v25 = [v34 roomName];
          v26 = [v34 zoneNames];
          v27 = [v34 homeName];
          self = [(BMHomeKitClientMediaAccessoryControlEvent *)self initWithBase:v36 accessoryUniqueIdentifier:v31 accessoryStateString:v37 accessoryStateNumber:v6 accessoryStateData:v7 accessoryMediaRouteIdentifier:v32 zoneUniqueIdentifiers:v23 roomUniqueIdentifier:v24 accessoryName:v30 roomName:v25 zoneNames:v26 homeName:v27];

          v28 = self;
          id v4 = v35;
          goto LABEL_22;
        }
      }
    }
    v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BMHomeKitClientMediaAccessoryControlEvent initWithProto:]();
    }
    v28 = 0;
LABEL_22:
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end