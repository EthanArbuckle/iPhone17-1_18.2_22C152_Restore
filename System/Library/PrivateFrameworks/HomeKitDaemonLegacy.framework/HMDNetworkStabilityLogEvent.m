@interface HMDNetworkStabilityLogEvent
- (HMDNetworkStabilityLogEvent)initWithDictionary:(id)a3;
- (HMDNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numWifiAssociations:(unint64_t)a4 wifiDisassociations:(unint64_t)a5 apChanges:(unint64_t)a6 gatewayChanges:(unint64_t)a7 numReadWrites:(unint64_t)a8 numReadErrors:(unint64_t)a9 numWriteErrors:(unint64_t)a10 topReadWriteError:(id)a11 topSessionError:(id)a12 numSessionErrors:(unint64_t)a13 apOUI:(id)a14 ssid:(id)a15 gatewayMACAddress:(id)a16 localHourOfDay:(int64_t)a17 collectionDurationMinutes:(unint64_t)a18;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)apOUI;
- (NSString)coreAnalyticsEventName;
- (NSString)gatewayMACAddress;
- (NSString)ssid;
- (NSString)topReadWriteError;
- (NSString)topSessionError;
- (id)serializedLogEvent;
- (int64_t)localHourOfDay;
- (unint64_t)collectionDurationMinutes;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)numAPChanges;
- (unint64_t)numGatewayChanges;
- (unint64_t)numReadErrors;
- (unint64_t)numReadWrites;
- (unint64_t)numSessionErrors;
- (unint64_t)numWifiAssociations;
- (unint64_t)numWifiDisassociations;
- (unint64_t)numWriteErrors;
@end

@implementation HMDNetworkStabilityLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayMACAddress, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_apOUI, 0);
  objc_storeStrong((id *)&self->_topSessionError, 0);
  objc_storeStrong((id *)&self->_topReadWriteError, 0);
}

- (NSString)gatewayMACAddress
{
  return self->_gatewayMACAddress;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (unint64_t)collectionDurationMinutes
{
  return self->_collectionDurationMinutes;
}

- (int64_t)localHourOfDay
{
  return self->_localHourOfDay;
}

- (NSString)apOUI
{
  return self->_apOUI;
}

- (NSString)topSessionError
{
  return self->_topSessionError;
}

- (NSString)topReadWriteError
{
  return self->_topReadWriteError;
}

- (unint64_t)numSessionErrors
{
  return self->_numSessionErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)numGatewayChanges
{
  return self->_numGatewayChanges;
}

- (unint64_t)numAPChanges
{
  return self->_numAPChanges;
}

- (unint64_t)numWifiDisassociations
{
  return self->_numWifiDisassociations;
}

- (unint64_t)numWifiAssociations
{
  return self->_numWifiAssociations;
}

- (id)serializedLogEvent
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMMHomeLogEvent *)self homeUUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"homeUUID"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiAssociations](self, "numWifiAssociations"));
  [v3 setObject:v5 forKeyedSubscript:@"numWifiAssociations"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiDisassociations](self, "numWifiDisassociations"));
  [v3 setObject:v6 forKeyedSubscript:@"numWifiDisassociations"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numAPChanges](self, "numAPChanges"));
  [v3 setObject:v7 forKeyedSubscript:@"numWifiAPChanges"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numGatewayChanges](self, "numGatewayChanges"));
  [v3 setObject:v8 forKeyedSubscript:@"numGatewayChanges"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  [v3 setObject:v9 forKeyedSubscript:@"numReadWrites"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  [v3 setObject:v10 forKeyedSubscript:@"numReadErrors"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  [v3 setObject:v11 forKeyedSubscript:@"numWriteErrors"];

  v12 = [(HMDNetworkStabilityLogEvent *)self topReadWriteError];
  [v3 setObject:v12 forKeyedSubscript:@"topReadWriteError"];

  v13 = [(HMDNetworkStabilityLogEvent *)self topSessionError];
  [v3 setObject:v13 forKeyedSubscript:@"topSessionError"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  [v3 setObject:v14 forKeyedSubscript:@"numSessionErrors"];

  v15 = [(HMDNetworkStabilityLogEvent *)self apOUI];
  [v3 setObject:v15 forKeyedSubscript:@"APOUI"];

  v16 = [(HMDNetworkStabilityLogEvent *)self ssid];
  [v3 setObject:v16 forKeyedSubscript:@"ssid"];

  v17 = [(HMDNetworkStabilityLogEvent *)self gatewayMACAddress];
  [v3 setObject:v17 forKeyedSubscript:@"gatewayMACAddress"];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNetworkStabilityLogEvent localHourOfDay](self, "localHourOfDay"));
  [v3 setObject:v18 forKeyedSubscript:@"localHourOfDay"];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent collectionDurationMinutes](self, "collectionDurationMinutes"));
  [v3 setObject:v19 forKeyedSubscript:@"collectionDurationMinutes"];

  v20 = (void *)[v3 copy];
  return v20;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v19[13] = *MEMORY[0x1E4F143B8];
  v18[0] = @"numWifiAssociations";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiAssociations](self, "numWifiAssociations"));
  v19[0] = v17;
  v18[1] = @"numWifiDisassociations";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiDisassociations](self, "numWifiDisassociations"));
  v19[1] = v16;
  v18[2] = @"numWifiAPChanges";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numAPChanges](self, "numAPChanges"));
  v19[2] = v15;
  v18[3] = @"numGatewayChanges";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numGatewayChanges](self, "numGatewayChanges"));
  v19[3] = v14;
  v18[4] = @"numReadWrites";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v19[4] = v3;
  v18[5] = @"numReadErrors";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v19[5] = v4;
  v18[6] = @"numWriteErrors";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v19[6] = v5;
  v18[7] = @"topReadWriteError";
  v6 = [(HMDNetworkStabilityLogEvent *)self topReadWriteError];
  v19[7] = v6;
  v18[8] = @"topSessionError";
  v7 = [(HMDNetworkStabilityLogEvent *)self topSessionError];
  v19[8] = v7;
  v18[9] = @"numSessionErrors";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v19[9] = v8;
  v18[10] = @"APOUI";
  v9 = [(HMDNetworkStabilityLogEvent *)self apOUI];
  v19[10] = v9;
  v18[11] = @"localHourOfDay";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNetworkStabilityLogEvent localHourOfDay](self, "localHourOfDay"));
  v19[11] = v10;
  v18[12] = @"collectionDurationMinutes";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent collectionDurationMinutes](self, "collectionDurationMinutes"));
  v19[12] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:13];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.network.stability";
}

- (HMDNetworkStabilityLogEvent)initWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"homeUUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v55 = v6;
  if (v6) {
    v63 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }
  else {
    v63 = 0;
  }
  v7 = [v3 objectForKeyedSubscript:@"numWifiAssociations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v54 = v8;

  v9 = [v3 objectForKeyedSubscript:@"numWifiDisassociations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v53 = v10;

  v11 = [v3 objectForKeyedSubscript:@"numWifiAPChanges"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v52 = v12;

  v13 = [v3 objectForKeyedSubscript:@"numGatewayChanges"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v58 = v14;

  v15 = [v3 objectForKeyedSubscript:@"numReadWrites"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v59 = v16;

  v17 = [v3 objectForKeyedSubscript:@"numReadErrors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v62 = v18;

  v19 = [v3 objectForKeyedSubscript:@"numWriteErrors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v51 = v20;

  v21 = [v3 objectForKeyedSubscript:@"topReadWriteError"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v57 = v22;

  v23 = [v3 objectForKeyedSubscript:@"topSessionError"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v56 = v24;

  v25 = [v3 objectForKeyedSubscript:@"numSessionErrors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v26 = v25;
  }
  else {
    v26 = 0;
  }
  id v61 = v26;

  v27 = [v3 objectForKeyedSubscript:@"APOUI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  id v50 = v28;

  v29 = [v3 objectForKeyedSubscript:@"ssid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v30 = v29;
  }
  else {
    v30 = 0;
  }
  id v31 = v30;

  v32 = [v3 objectForKeyedSubscript:@"gatewayMACAddress"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }
  id v34 = v33;

  v35 = [v3 objectForKeyedSubscript:@"localHourOfDay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v36 = v35;
  }
  else {
    v36 = 0;
  }
  id v37 = v36;

  v38 = [v3 objectForKeyedSubscript:@"collectionDurationMinutes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v39 = v38;
  }
  else {
    v39 = 0;
  }
  id v40 = v39;

  v41 = 0;
  if (!v63)
  {
    v43 = v53;
    v42 = v54;
    v44 = v52;
    v46 = v56;
    v45 = v57;
    v47 = v50;
    goto LABEL_70;
  }
  v42 = v54;
  if (!v54)
  {
    v44 = v52;
    v43 = v53;
LABEL_67:
    v45 = v57;
    goto LABEL_68;
  }
  v44 = v52;
  v43 = v53;
  if (!v53 || !v52 || !v58 || !v59 || !v62) {
    goto LABEL_67;
  }
  v45 = v57;
  if (!v57)
  {
LABEL_68:
    v46 = v56;
LABEL_69:
    v47 = v50;
    goto LABEL_70;
  }
  v46 = v56;
  if (!v56 || !v61) {
    goto LABEL_69;
  }
  if (v50)
  {
    v47 = v50;
    v46 = v56;
    v45 = v57;
    v43 = v53;
    v42 = v54;
    v44 = v52;
    v41 = objc_retain(-[HMDNetworkStabilityLogEvent initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:](self, "initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:", v63, [v54 unsignedIntegerValue], objc_msgSend(v53, "unsignedIntegerValue"), objc_msgSend(v52, "unsignedIntegerValue"), objc_msgSend(v58, "unsignedIntegerValue"), objc_msgSend(v59, "unsignedIntegerValue"), objc_msgSend(v62, "unsignedIntegerValue"), objc_msgSend(v51, "unsignedIntegerValue"), v57, v56, objc_msgSend(v61, "unsignedIntegerValue"), v50, v31, v34,
              [v37 integerValue],
              [v40 unsignedIntegerValue]));
    self = v41;
  }
  else
  {
    v47 = 0;
    v46 = v56;
    v45 = v57;
  }
LABEL_70:
  v49 = v41;

  return v49;
}

- (HMDNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numWifiAssociations:(unint64_t)a4 wifiDisassociations:(unint64_t)a5 apChanges:(unint64_t)a6 gatewayChanges:(unint64_t)a7 numReadWrites:(unint64_t)a8 numReadErrors:(unint64_t)a9 numWriteErrors:(unint64_t)a10 topReadWriteError:(id)a11 topSessionError:(id)a12 numSessionErrors:(unint64_t)a13 apOUI:(id)a14 ssid:(id)a15 gatewayMACAddress:(id)a16 localHourOfDay:(int64_t)a17 collectionDurationMinutes:(unint64_t)a18
{
  id v23 = a11;
  id v24 = a12;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  v40.receiver = self;
  v40.super_class = (Class)HMDNetworkStabilityLogEvent;
  v28 = [(HMMHomeLogEvent *)&v40 initWithHomeUUID:a3];
  v29 = v28;
  if (v28)
  {
    v28->_numWifiAssociations = a4;
    v28->_numWifiDisassociations = a5;
    v28->_numAPChanges = a6;
    v28->_numGatewayChanges = a7;
    v28->_numReadWrites = a8;
    v28->_numReadErrors = a9;
    v28->_numWriteErrors = a10;
    if (v23) {
      v30 = (__CFString *)[v23 copy];
    }
    else {
      v30 = @"<NO ERROR>";
    }
    objc_storeStrong((id *)&v29->_topReadWriteError, v30);
    if (v23) {

    }
    if (v24) {
      id v31 = (__CFString *)[v24 copy];
    }
    else {
      id v31 = @"<NO ERROR>";
    }
    objc_storeStrong((id *)&v29->_topSessionError, v31);
    if (v24) {

    }
    v29->_numSessionErrors = a13;
    if (v25) {
      v32 = (__CFString *)[v25 copy];
    }
    else {
      v32 = @"<NO AP>";
    }
    objc_storeStrong((id *)&v29->_apOUI, v32);
    if (v25) {

    }
    uint64_t v33 = objc_msgSend(v26, "copy", a7, a8);
    ssid = v29->_ssid;
    v29->_ssid = (NSString *)v33;

    uint64_t v35 = [v27 copy];
    gatewayMACAddress = v29->_gatewayMACAddress;
    v29->_gatewayMACAddress = (NSString *)v35;

    v29->_localHourOfDay = a17;
    v29->_collectionDurationMinutes = a18;
  }

  return v29;
}

@end