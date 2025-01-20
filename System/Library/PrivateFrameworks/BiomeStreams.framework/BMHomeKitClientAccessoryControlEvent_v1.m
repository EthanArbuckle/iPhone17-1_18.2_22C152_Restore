@interface BMHomeKitClientAccessoryControlEvent_v1
- (BMHomeKitClientAccessoryControlEvent_v1)initWithProto:(id)a3;
@end

@implementation BMHomeKitClientAccessoryControlEvent_v1

- (BMHomeKitClientAccessoryControlEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 accessoryState];
      int v7 = [v6 valueType];
      switch(v7)
      {
        case 3:
          v22 = [BMHomeKitClientBase alloc];
          v56 = [v5 base];
          v62 = -[BMHomeKitClientBase initWithProto:](v22, "initWithProto:");
          v23 = NSNumber;
          v57 = v6;
          [v6 numValue];
          v61 = objc_msgSend(v23, "numberWithDouble:");
          v60 = [v5 accessoryUniqueIdentifier];
          uint64_t v50 = [v5 serviceUniqueIdentifier];
          uint64_t v47 = [v5 serviceType];
          uint64_t v44 = [v5 characteristicType];
          v59 = [v5 serviceGroupUniqueIdentifier];
          v58 = [v5 zoneUniqueIdentifiers];
          uint64_t v24 = [v5 roomUniqueIdentifier];
          uint64_t v25 = [v5 accessoryName];
          uint64_t v26 = [v5 serviceName];
          uint64_t v27 = [v5 roomName];
          v13 = [v5 serviceGroupName];
          v14 = [v5 zoneNames];
          v15 = [v5 homeName];
          uint64_t v41 = v27;
          v52 = (void *)v27;
          v53 = (void *)v26;
          uint64_t v38 = v25;
          v54 = (void *)v25;
          v55 = (void *)v24;
          uint64_t v35 = v24;
          v16 = (void *)v50;
          v17 = (void *)v47;
          v18 = (void *)v44;
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v35, v38, v26, v41, v13, v14, v15);
          break;
        case 2:
          v28 = [BMHomeKitClientBase alloc];
          v56 = [v5 base];
          v62 = -[BMHomeKitClientBase initWithProto:](v28, "initWithProto:");
          v57 = v6;
          v61 = [v6 stringValue];
          v60 = [v5 accessoryUniqueIdentifier];
          uint64_t v51 = [v5 serviceUniqueIdentifier];
          uint64_t v48 = [v5 serviceType];
          uint64_t v45 = [v5 characteristicType];
          v59 = [v5 serviceGroupUniqueIdentifier];
          v58 = [v5 zoneUniqueIdentifiers];
          uint64_t v29 = [v5 roomUniqueIdentifier];
          uint64_t v30 = [v5 accessoryName];
          uint64_t v31 = [v5 serviceName];
          uint64_t v32 = [v5 roomName];
          v13 = [v5 serviceGroupName];
          v14 = [v5 zoneNames];
          v15 = [v5 homeName];
          uint64_t v42 = v32;
          v52 = (void *)v32;
          v53 = (void *)v31;
          uint64_t v39 = v30;
          v54 = (void *)v30;
          v55 = (void *)v29;
          uint64_t v36 = v29;
          v16 = (void *)v51;
          v17 = (void *)v48;
          v18 = (void *)v45;
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v36, v39, v31, v42, v13, v14, v15);
          break;
        case 1:
          v8 = [BMHomeKitClientBase alloc];
          v56 = [v5 base];
          v62 = -[BMHomeKitClientBase initWithProto:](v8, "initWithProto:");
          v57 = v6;
          v61 = [v6 dataValue];
          v60 = [v5 accessoryUniqueIdentifier];
          uint64_t v49 = [v5 serviceUniqueIdentifier];
          uint64_t v46 = [v5 serviceType];
          uint64_t v43 = [v5 characteristicType];
          v59 = [v5 serviceGroupUniqueIdentifier];
          v58 = [v5 zoneUniqueIdentifiers];
          uint64_t v9 = [v5 roomUniqueIdentifier];
          uint64_t v10 = [v5 accessoryName];
          uint64_t v11 = [v5 serviceName];
          uint64_t v12 = [v5 roomName];
          v13 = [v5 serviceGroupName];
          v14 = [v5 zoneNames];
          v15 = [v5 homeName];
          uint64_t v40 = v12;
          v52 = (void *)v12;
          v53 = (void *)v11;
          uint64_t v37 = v10;
          v54 = (void *)v10;
          v55 = (void *)v9;
          uint64_t v34 = v9;
          v16 = (void *)v49;
          v17 = (void *)v46;
          v18 = (void *)v43;
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v34, v37, v11, v40, v13, v14, v15);
          break;
        default:
          v21 = 0;
          goto LABEL_15;
      }
      self = v19;

      v21 = self;
      v6 = v57;
LABEL_15:

      goto LABEL_16;
    }
    v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BMHomeKitClientAccessoryControlEvent initWithProto:]();
    }
  }
  v21 = 0;
LABEL_16:

  return v21;
}

@end