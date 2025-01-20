@interface BMHomeKitClientAccessoryControlEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 dataAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17;
- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 numberAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17;
- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 stringAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17;
- (BMHomeKitClientAccessoryControlEvent)initWithProto:(id)a3;
- (BMHomeKitClientAccessoryControlEvent)initWithProtoData:(id)a3;
- (BMHomeKitClientBase)base;
- (BOOL)isEqual:(id)a3;
- (NSArray)zoneNames;
- (NSArray)zoneUniqueIdentifiers;
- (NSData)accessoryStateData;
- (NSNumber)accessoryStateNumber;
- (NSString)accessoryName;
- (NSString)accessoryStateString;
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
- (id)encodeAsProto;
- (id)proto;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMHomeKitClientAccessoryControlEvent

- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 stringAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v31 = a6;
  id v41 = a6;
  id v32 = a7;
  id v40 = a7;
  id v33 = a8;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v36 = a11;
  id v35 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v45.receiver = self;
  v45.super_class = (Class)BMHomeKitClientAccessoryControlEvent;
  v27 = [(BMEventBase *)&v45 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v28->_accessoryUniqueIdentifier, a5);
    objc_storeStrong((id *)&v28->_accessoryStateString, a4);
    objc_storeStrong((id *)&v28->_serviceUniqueIdentifier, v31);
    objc_storeStrong((id *)&v28->_serviceType, v32);
    objc_storeStrong((id *)&v28->_characteristicType, v33);
    objc_storeStrong((id *)&v28->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v28->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v28->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v28->_accessoryName, a12);
    objc_storeStrong((id *)&v28->_serviceName, a13);
    objc_storeStrong((id *)&v28->_roomName, a14);
    objc_storeStrong((id *)&v28->_serviceGroupName, a15);
    objc_storeStrong((id *)&v28->_zoneNames, a16);
    objc_storeStrong((id *)&v28->_homeName, a17);
  }

  return v28;
}

- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 numberAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v31 = a6;
  id v41 = a6;
  id v32 = a7;
  id v40 = a7;
  id v33 = a8;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v36 = a11;
  id v35 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v45.receiver = self;
  v45.super_class = (Class)BMHomeKitClientAccessoryControlEvent;
  v27 = [(BMEventBase *)&v45 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v28->_accessoryUniqueIdentifier, a5);
    objc_storeStrong((id *)&v28->_accessoryStateNumber, a4);
    objc_storeStrong((id *)&v28->_serviceUniqueIdentifier, v31);
    objc_storeStrong((id *)&v28->_serviceType, v32);
    objc_storeStrong((id *)&v28->_characteristicType, v33);
    objc_storeStrong((id *)&v28->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v28->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v28->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v28->_accessoryName, a12);
    objc_storeStrong((id *)&v28->_serviceName, a13);
    objc_storeStrong((id *)&v28->_roomName, a14);
    objc_storeStrong((id *)&v28->_serviceGroupName, a15);
    objc_storeStrong((id *)&v28->_zoneNames, a16);
    objc_storeStrong((id *)&v28->_homeName, a17);
  }

  return v28;
}

- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 dataAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v31 = a6;
  id v41 = a6;
  id v32 = a7;
  id v40 = a7;
  id v33 = a8;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v36 = a11;
  id v35 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v45.receiver = self;
  v45.super_class = (Class)BMHomeKitClientAccessoryControlEvent;
  v27 = [(BMEventBase *)&v45 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v28->_accessoryUniqueIdentifier, a5);
    objc_storeStrong((id *)&v28->_accessoryStateData, a4);
    objc_storeStrong((id *)&v28->_serviceUniqueIdentifier, v31);
    objc_storeStrong((id *)&v28->_serviceType, v32);
    objc_storeStrong((id *)&v28->_characteristicType, v33);
    objc_storeStrong((id *)&v28->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v28->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v28->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v28->_accessoryName, a12);
    objc_storeStrong((id *)&v28->_serviceName, a13);
    objc_storeStrong((id *)&v28->_roomName, a14);
    objc_storeStrong((id *)&v28->_serviceGroupName, a15);
    objc_storeStrong((id *)&v28->_zoneNames, a16);
    objc_storeStrong((id *)&v28->_homeName, a17);
  }

  return v28;
}

- (NSString)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"BMHomeKitClientAccessoryControlEvent event with base: %@, accessoryUniqueIdentifier: %@, accessoryStateString: %@, accessoryStateNumber: %@, accessoryStateData: %@, serviceUniqueIdentifier: %@, serviceType: %@, characteristicType: %@, serviceGroupUniqueIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, serviceName: %@, roomName: %@, serviceGroupName: %@, zoneNames: %@, homeName: %@", self->_base, self->_accessoryUniqueIdentifier, self->_accessoryStateString, self->_accessoryStateNumber, self->_accessoryStateData, self->_serviceUniqueIdentifier, self->_serviceType, self->_characteristicType, self->_serviceGroupUniqueIdentifier, self->_zoneUniqueIdentifiers, self->_roomUniqueIdentifier, self->_accessoryName, self->_serviceName, self->_roomName, self->_serviceGroupName, self->_zoneNames,
                 self->_homeName);

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
    v7 = (objc_class *)BMHomeKitClientAccessoryControlEvent_v1;
LABEL_5:
    v8 = (void *)[[v7 alloc] initWithProtoData:v6];
    goto LABEL_9;
  }
  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[BMHomeKitClientAccessoryControlEvent eventWithData:dataVersion:](v9);
  }

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMHomeKitClientAccessoryControlEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMHomeKitClientAccessoryControlEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [v5 accessoryState];
      int v7 = [v6 valueType];
      if (v7)
      {
        if (v7 == 2)
        {
          v27 = [BMHomeKitClientBase alloc];
          v56 = [v5 base];
          v62 = -[BMHomeKitClientBase initWithProto:](v27, "initWithProto:");
          v28 = NSNumber;
          v57 = v6;
          [v6 numValue];
          v61 = objc_msgSend(v28, "numberWithDouble:");
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
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v36, v39, v31, v42, v13, v14, v15);
        }
        else
        {
          if (v7 != 1)
          {
            v21 = 0;
            goto LABEL_15;
          }
          v8 = [BMHomeKitClientBase alloc];
          v56 = [v5 base];
          v62 = -[BMHomeKitClientBase initWithProto:](v8, "initWithProto:");
          v57 = v6;
          v61 = [v6 stringValue];
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
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v34, v37, v11, v40, v13, v14, v15);
        }
      }
      else
      {
        id v22 = [BMHomeKitClientBase alloc];
        v56 = [v5 base];
        v62 = -[BMHomeKitClientBase initWithProto:](v22, "initWithProto:");
        v57 = v6;
        v61 = [v6 dataValue];
        v60 = [v5 accessoryUniqueIdentifier];
        uint64_t v50 = [v5 serviceUniqueIdentifier];
        uint64_t v47 = [v5 serviceType];
        uint64_t v44 = [v5 characteristicType];
        v59 = [v5 serviceGroupUniqueIdentifier];
        v58 = [v5 zoneUniqueIdentifiers];
        uint64_t v23 = [v5 roomUniqueIdentifier];
        uint64_t v24 = [v5 accessoryName];
        uint64_t v25 = [v5 serviceName];
        uint64_t v26 = [v5 roomName];
        v13 = [v5 serviceGroupName];
        v14 = [v5 zoneNames];
        v15 = [v5 homeName];
        uint64_t v41 = v26;
        v52 = (void *)v26;
        v53 = (void *)v25;
        uint64_t v38 = v24;
        v54 = (void *)v24;
        v55 = (void *)v23;
        uint64_t v35 = v23;
        v16 = (void *)v50;
        v17 = (void *)v47;
        v18 = (void *)v44;
        v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v35, v38, v25, v41, v13, v14, v15);
      }
      self = v19;

      v21 = self;
      id v6 = v57;
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

- (BMHomeKitClientAccessoryControlEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBHomeKitClientAccessoryControlEvent alloc] initWithData:v4];

    self = [(BMHomeKitClientAccessoryControlEvent *)self initWithProto:v5];
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
  v3 = objc_opt_new();
  id v4 = [(BMHomeKitClientAccessoryControlEvent *)self base];
  id v5 = [v4 proto];
  [v3 setBase:v5];

  id v6 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryUniqueIdentifier];
  [v3 setAccessoryUniqueIdentifier:v6];

  int v7 = objc_opt_new();
  v8 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateNumber];

  if (v8)
  {
    uint64_t v9 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateNumber];
    [v9 doubleValue];
    objc_msgSend(v7, "setNumValue:");
    uint64_t v10 = 2;
LABEL_7:

    [v7 setValueType:v10];
    [v3 setAccessoryState:v7];
    v13 = [(BMHomeKitClientAccessoryControlEvent *)self serviceUniqueIdentifier];
    [v3 setServiceUniqueIdentifier:v13];

    v14 = [(BMHomeKitClientAccessoryControlEvent *)self serviceType];
    [v3 setServiceType:v14];

    v15 = [(BMHomeKitClientAccessoryControlEvent *)self characteristicType];
    [v3 setCharacteristicType:v15];

    v16 = [(BMHomeKitClientAccessoryControlEvent *)self serviceGroupUniqueIdentifier];
    [v3 setServiceGroupUniqueIdentifier:v16];

    v17 = (void *)MEMORY[0x1E4F1CA48];
    v18 = [(BMHomeKitClientAccessoryControlEvent *)self zoneUniqueIdentifiers];
    v19 = [v17 arrayWithArray:v18];
    [v3 setZoneUniqueIdentifiers:v19];

    v20 = [(BMHomeKitClientAccessoryControlEvent *)self roomUniqueIdentifier];
    [v3 setRoomUniqueIdentifier:v20];

    v21 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryName];
    [v3 setAccessoryName:v21];

    id v22 = [(BMHomeKitClientAccessoryControlEvent *)self serviceName];
    [v3 setServiceName:v22];

    uint64_t v23 = [(BMHomeKitClientAccessoryControlEvent *)self roomName];
    [v3 setRoomName:v23];

    uint64_t v24 = [(BMHomeKitClientAccessoryControlEvent *)self serviceGroupName];
    [v3 setServiceGroupName:v24];

    uint64_t v25 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v26 = [(BMHomeKitClientAccessoryControlEvent *)self zoneNames];
    v27 = [v25 arrayWithArray:v26];
    [v3 setZoneNames:v27];

    v28 = [(BMHomeKitClientAccessoryControlEvent *)self homeName];
    [v3 setHomeName:v28];

    id v29 = v3;
    goto LABEL_8;
  }
  uint64_t v11 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateString];

  if (v11)
  {
    uint64_t v9 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateString];
    [v7 setStringValue:v9];
    uint64_t v10 = 1;
    goto LABEL_7;
  }
  uint64_t v12 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateData];

  if (v12)
  {
    uint64_t v9 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateData];
    [v7 setDataValue:v9];
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  uint64_t v31 = __biome_log_for_category();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    -[BMHomeKitClientAccessoryControlEvent proto](v31);
  }

  id v29 = 0;
LABEL_8:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = [(BMHomeKitClientAccessoryControlEvent *)self base];
    if (v9 || ([v8 base], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [(BMHomeKitClientAccessoryControlEvent *)self base];
      id v5 = [v8 base];
      char v49 = [v4 isEqual:v5];

      if (v9)
      {
LABEL_9:

        uint64_t v11 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryUniqueIdentifier];
        if (v11
          || ([v8 accessoryUniqueIdentifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v4 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryUniqueIdentifier];
          id v5 = [v8 accessoryUniqueIdentifier];
          char v48 = [v4 isEqual:v5];

          if (v11)
          {
LABEL_15:

            uint64_t v12 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateString];
            if (v12
              || ([v8 accessoryStateString], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v4 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateString];
              id v5 = [v8 accessoryStateString];
              char v47 = [v4 isEqual:v5];

              if (v12)
              {
LABEL_21:

                v13 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateNumber];
                if (v13
                  || ([v8 accessoryStateNumber], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  id v4 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateNumber];
                  id v5 = [v8 accessoryStateNumber];
                  char v46 = [v4 isEqual:v5];

                  if (v13)
                  {
LABEL_27:

                    v14 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateData];
                    if (v14
                      || ([v8 accessoryStateData],
                          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      id v4 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryStateData];
                      id v5 = [v8 accessoryStateData];
                      char v45 = [v4 isEqual:v5];

                      if (v14)
                      {
LABEL_33:

                        v15 = [(BMHomeKitClientAccessoryControlEvent *)self serviceUniqueIdentifier];
                        if (v15
                          || ([v8 serviceUniqueIdentifier],
                              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          id v4 = [(BMHomeKitClientAccessoryControlEvent *)self serviceUniqueIdentifier];
                          id v5 = [v8 serviceUniqueIdentifier];
                          char v44 = [v4 isEqual:v5];

                          if (v15)
                          {
LABEL_39:

                            v16 = [(BMHomeKitClientAccessoryControlEvent *)self serviceType];
                            if (v16
                              || ([v8 serviceType],
                                  (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              id v4 = [(BMHomeKitClientAccessoryControlEvent *)self serviceType];
                              id v5 = [v8 serviceType];
                              char v43 = [v4 isEqual:v5];

                              if (v16)
                              {
LABEL_45:

                                v17 = [(BMHomeKitClientAccessoryControlEvent *)self characteristicType];
                                if (v17
                                  || ([v8 characteristicType],
                                      (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  id v4 = [(BMHomeKitClientAccessoryControlEvent *)self characteristicType];
                                  id v5 = [v8 characteristicType];
                                  char v42 = [v4 isEqual:v5];

                                  if (v17)
                                  {
LABEL_51:

                                    v18 = [(BMHomeKitClientAccessoryControlEvent *)self serviceGroupUniqueIdentifier];
                                    if (v18
                                      || ([v8 serviceGroupUniqueIdentifier],
                                          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      id v4 = [(BMHomeKitClientAccessoryControlEvent *)self serviceGroupUniqueIdentifier];
                                      id v5 = [v8 serviceGroupUniqueIdentifier];
                                      char v41 = [v4 isEqual:v5];

                                      if (v18)
                                      {
LABEL_57:

                                        v19 = [(BMHomeKitClientAccessoryControlEvent *)self zoneUniqueIdentifiers];
                                        if (v19
                                          || ([v8 zoneUniqueIdentifiers],
                                              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                        {
                                          id v4 = [(BMHomeKitClientAccessoryControlEvent *)self zoneUniqueIdentifiers];
                                          id v5 = [v8 zoneUniqueIdentifiers];
                                          char v40 = [v4 isEqual:v5];

                                          if (v19)
                                          {
LABEL_63:

                                            v20 = [(BMHomeKitClientAccessoryControlEvent *)self roomUniqueIdentifier];
                                            if (v20
                                              || ([v8 roomUniqueIdentifier],
                                                  (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                            {
                                              id v4 = [(BMHomeKitClientAccessoryControlEvent *)self roomUniqueIdentifier];
                                              id v5 = [v8 roomUniqueIdentifier];
                                              char v39 = [v4 isEqual:v5];

                                              if (v20)
                                              {
LABEL_69:

                                                v21 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryName];
                                                if (v21
                                                  || ([v8 accessoryName],
                                                      (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                                {
                                                  id v4 = [(BMHomeKitClientAccessoryControlEvent *)self accessoryName];
                                                  id v5 = [v8 accessoryName];
                                                  char v38 = [v4 isEqual:v5];

                                                  if (v21)
                                                  {
LABEL_75:

                                                    id v22 = [(BMHomeKitClientAccessoryControlEvent *)self serviceName];
                                                    if (v22
                                                      || ([v8 serviceName],
                                                          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                                    {
                                                      id v4 = [(BMHomeKitClientAccessoryControlEvent *)self serviceName];
                                                      id v5 = [v8 serviceName];
                                                      char v37 = [v4 isEqual:v5];

                                                      if (v22)
                                                      {
LABEL_81:

                                                        uint64_t v23 = [(BMHomeKitClientAccessoryControlEvent *)self roomName];
                                                        if (v23
                                                          || ([v8 roomName],
                                                              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                                                        {
                                                          id v4 = [(BMHomeKitClientAccessoryControlEvent *)self roomName];
                                                          id v5 = [v8 roomName];
                                                          char v24 = [v4 isEqual:v5];

                                                          if (v23)
                                                          {
LABEL_87:

                                                            uint64_t v25 = [(BMHomeKitClientAccessoryControlEvent *)self serviceGroupName];
                                                            if (v25
                                                              || ([v8 serviceGroupName],
                                                                  (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
                                                            {
                                                              id v5 = [(BMHomeKitClientAccessoryControlEvent *)self serviceGroupName];
                                                              uint64_t v26 = [v8 serviceGroupName];
                                                              char v27 = [v5 isEqual:v26];

                                                              if (v25)
                                                              {
LABEL_93:

                                                                v28 = [(BMHomeKitClientAccessoryControlEvent *)self zoneNames];
                                                                if (v28
                                                                  || ([v8 zoneNames],
                                                                      (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
                                                                {
                                                                  id v29 = [(BMHomeKitClientAccessoryControlEvent *)self zoneNames];
                                                                  uint64_t v30 = [v8 zoneNames];
                                                                  char v31 = [v29 isEqual:v30];

                                                                  if (v28)
                                                                  {
LABEL_99:

                                                                    uint64_t v32 = [(BMHomeKitClientAccessoryControlEvent *)self homeName];
                                                                    if (v32
                                                                      || ([v8 homeName],
                                                                          (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
                                                                    {
                                                                      id v33 = [(BMHomeKitClientAccessoryControlEvent *)self homeName];
                                                                      uint64_t v34 = [v8 homeName];
                                                                      char v35 = [v33 isEqual:v34];

                                                                      if (v32)
                                                                      {
LABEL_105:

                                                                        char v10 = v49 & v48 & v47 & v46 & v45 & v44 & v43 & v42 & v41 & v40 & v39 & v38 & v37 & v24 & v27 & v31 & v35;
                                                                        goto LABEL_106;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      char v35 = 1;
                                                                    }

                                                                    goto LABEL_105;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  char v31 = 1;
                                                                }

                                                                goto LABEL_99;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              char v27 = 1;
                                                            }

                                                            goto LABEL_93;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          char v24 = 1;
                                                        }

                                                        goto LABEL_87;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      char v37 = 1;
                                                    }

                                                    goto LABEL_81;
                                                  }
                                                }
                                                else
                                                {
                                                  char v38 = 1;
                                                }

                                                goto LABEL_75;
                                              }
                                            }
                                            else
                                            {
                                              char v39 = 1;
                                            }

                                            goto LABEL_69;
                                          }
                                        }
                                        else
                                        {
                                          char v40 = 1;
                                        }

                                        goto LABEL_63;
                                      }
                                    }
                                    else
                                    {
                                      char v41 = 1;
                                    }

                                    goto LABEL_57;
                                  }
                                }
                                else
                                {
                                  char v42 = 1;
                                }

                                goto LABEL_51;
                              }
                            }
                            else
                            {
                              char v43 = 1;
                            }

                            goto LABEL_45;
                          }
                        }
                        else
                        {
                          char v44 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      char v45 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  char v46 = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              char v47 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          char v48 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v49 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_106:

  return v10;
}

- (BMHomeKitClientBase)base
{
  return self->_base;
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (NSString)accessoryStateString
{
  return self->_accessoryStateString;
}

- (NSNumber)accessoryStateNumber
{
  return self->_accessoryStateNumber;
}

- (NSData)accessoryStateData
{
  return self->_accessoryStateData;
}

- (NSString)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSString)serviceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier;
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

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)serviceGroupName
{
  return self->_serviceGroupName;
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
  objc_storeStrong((id *)&self->_accessoryStateData, 0);
  objc_storeStrong((id *)&self->_accessoryStateNumber, 0);
  objc_storeStrong((id *)&self->_accessoryStateString, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_base, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Mismatched BMHomeKitClientAccessoryControlEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBHomeKitClientAccessoryControlEvent proto", v4, v5, v6, v7, 2u);
}

- (void)proto
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Accessory State value for BMHomeKitClientAccessoryControlEvent is not a supported type, cannot serialize.", v1, 2u);
}

@end