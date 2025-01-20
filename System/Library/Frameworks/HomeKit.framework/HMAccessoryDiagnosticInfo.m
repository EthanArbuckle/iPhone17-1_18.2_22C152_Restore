@interface HMAccessoryDiagnosticInfo
- (BOOL)cdpStatusGood;
- (BOOL)cloudkitAccountStatusGood;
- (BOOL)firstCloudImportDone;
- (BOOL)idsStatusGood;
- (BOOL)isEventRouterServerConnected;
- (BOOL)isPrimaryResident;
- (BOOL)isRunningHH2;
- (HMAccessoryDiagnosticInfo)initWithProtoData:(id)a3;
- (HMFSoftwareVersion)softwareVersion;
- (HMFWiFiNetworkInfo)wifiInfo;
- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptor;
- (HMSoftwareUpdateProgress)softwareUpdateProgress;
- (HMSoftwareUpdateV2)softwareUpdate;
- (NSDate)serverLastConnected;
- (NSString)connectedClientsDescription;
- (NSString)currentAccessoryMediaRouteId;
- (NSString)idsIdentifier;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)serialNumber;
- (NSUUID)currentAccessoryUUID;
- (id)description;
- (unint64_t)numHomes;
- (unint64_t)version;
@end

@implementation HMAccessoryDiagnosticInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedClientsDescription, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProgress, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDescriptor, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_serverLastConnected, 0);
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_currentAccessoryMediaRouteId, 0);

  objc_storeStrong((id *)&self->_currentAccessoryUUID, 0);
}

- (NSString)connectedClientsDescription
{
  return self->_connectedClientsDescription;
}

- (unint64_t)version
{
  return self->_version;
}

- (HMSoftwareUpdateProgress)softwareUpdateProgress
{
  return self->_softwareUpdateProgress;
}

- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptor
{
  return self->_softwareUpdateDescriptor;
}

- (HMFSoftwareVersion)softwareVersion
{
  return self->_softwareVersion;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (BOOL)isPrimaryResident
{
  return self->_isPrimaryResident;
}

- (NSDate)serverLastConnected
{
  return self->_serverLastConnected;
}

- (BOOL)isEventRouterServerConnected
{
  return self->_isEventRouterServerConnected;
}

- (HMFWiFiNetworkInfo)wifiInfo
{
  return self->_wifiInfo;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (BOOL)idsStatusGood
{
  return self->_idsStatusGood;
}

- (NSString)currentAccessoryMediaRouteId
{
  return self->_currentAccessoryMediaRouteId;
}

- (NSUUID)currentAccessoryUUID
{
  return self->_currentAccessoryUUID;
}

- (unint64_t)numHomes
{
  return self->_numHomes;
}

- (BOOL)isRunningHH2
{
  return self->_isRunningHH2;
}

- (BOOL)firstCloudImportDone
{
  return self->_firstCloudImportDone;
}

- (BOOL)cdpStatusGood
{
  return self->_cdpStatusGood;
}

- (BOOL)cloudkitAccountStatusGood
{
  return self->_cloudkitAccountStatusGood;
}

- (id)description
{
  v26 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v3);
  BOOL v24 = [(HMAccessoryDiagnosticInfo *)self cloudkitAccountStatusGood];
  BOOL v23 = [(HMAccessoryDiagnosticInfo *)self cdpStatusGood];
  BOOL v22 = [(HMAccessoryDiagnosticInfo *)self firstCloudImportDone];
  BOOL v21 = [(HMAccessoryDiagnosticInfo *)self idsStatusGood];
  v20 = [(HMAccessoryDiagnosticInfo *)self idsIdentifier];
  v19 = [(HMAccessoryDiagnosticInfo *)self manufacturer];
  v18 = [(HMAccessoryDiagnosticInfo *)self model];
  v16 = [(HMAccessoryDiagnosticInfo *)self serialNumber];
  v17 = [(HMAccessoryDiagnosticInfo *)self softwareVersion];
  v14 = [(HMAccessoryDiagnosticInfo *)self softwareUpdateDescriptor];
  v4 = [(HMAccessoryDiagnosticInfo *)self softwareUpdateProgress];
  BOOL v15 = [(HMAccessoryDiagnosticInfo *)self isRunningHH2];
  unint64_t v13 = [(HMAccessoryDiagnosticInfo *)self numHomes];
  v12 = [(HMAccessoryDiagnosticInfo *)self currentAccessoryUUID];
  v5 = [(HMAccessoryDiagnosticInfo *)self currentAccessoryMediaRouteId];
  BOOL v6 = [(HMAccessoryDiagnosticInfo *)self isPrimaryResident];
  v7 = [(HMAccessoryDiagnosticInfo *)self wifiInfo];
  BOOL v8 = [(HMAccessoryDiagnosticInfo *)self isEventRouterServerConnected];
  v9 = [(HMAccessoryDiagnosticInfo *)self serverLastConnected];
  v10 = [(HMAccessoryDiagnosticInfo *)self connectedClientsDescription];
  objc_msgSend(v26, "stringWithFormat:", @"<%@ [cloudkit=> accountStatus: %d, cdp: %d, firstImport: %d>] [ids=> status: %d identifier: %@ ] [device=> %@ - %@ - %@, s/w: %@, upd: (%@, %@)] hh2: %d, numHomes: %lu, uuid: %@, mediaRouteID: %@, isPrimary: %d, wifi: %@, [eventrouter=> connected: %d date: %@, clients: %@] >", v25, v24, v23, v22, v21, v20, v19, v18, v16, v17, v14, v4, v15, v13, v12, v5,
    v6,
    v7,
    v8,
    v9,
  v27 = v10);

  return v27;
}

- (HMSoftwareUpdateV2)softwareUpdate
{
  v2 = [(HMAccessoryDiagnosticInfo *)self softwareUpdateDescriptor];
  if (v2)
  {
    v3 = +[HMSoftwareUpdateV2 softwareUpdateFromDescriptor:v2];
  }
  else
  {
    v3 = 0;
  }

  return (HMSoftwareUpdateV2 *)v3;
}

- (HMAccessoryDiagnosticInfo)initWithProtoData:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)HMAccessoryDiagnosticInfo;
  v5 = [(HMAccessoryDiagnosticInfo *)&v77 init];
  if (v5)
  {
    BOOL v6 = [[HMAccessoryDiagnosticInfoProtoDiagnosticInfo alloc] initWithData:v4];
    v7 = v6;
    if (v6)
    {
      v5->_version = [(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)v6 version];
      if ([(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)v7 hasAppleMediaAccessoryDiagnosticInfo])
      {
        BOOL v8 = [(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)v7 appleMediaAccessoryDiagnosticInfo];
        v9 = [v8 cloudInfo];
        v5->_cloudkitAccountStatusGood = [v9 cloudState] == 1;

        v10 = [v8 cloudInfo];
        v5->_cdpStatusGood = [v10 octagonState] == 1;

        v11 = [v8 cloudInfo];
        v5->_firstCloudImportDone = [v11 firstCloudImportComplete];

        uint64_t v12 = [v8 mediaRouteIdString];
        currentAccessoryMediaRouteId = v5->_currentAccessoryMediaRouteId;
        v5->_currentAccessoryMediaRouteId = (NSString *)v12;

        v14 = [v8 currentAccessoryInfo];

        if (v14)
        {
          BOOL v15 = [v8 currentAccessoryInfo];
          v16 = [v15 uuidString];

          if (v16)
          {
            id v17 = objc_alloc(MEMORY[0x1E4F29128]);
            v18 = [v8 currentAccessoryInfo];
            v19 = [v18 uuidString];
            uint64_t v20 = [v17 initWithUUIDString:v19];
            currentAccessoryUUID = v5->_currentAccessoryUUID;
            v5->_currentAccessoryUUID = (NSUUID *)v20;
          }
        }
        BOOL v22 = [v8 idsInfo];

        if (v22)
        {
          BOOL v23 = [v8 idsInfo];
          uint64_t v24 = [v23 idsIdentifierString];
          idsIdentifier = v5->_idsIdentifier;
          v5->_idsIdentifier = (NSString *)v24;

          v26 = [v8 idsInfo];
          v5->_idsStatusGood = [v26 idsState] == 1;
        }
        v27 = [v8 eventRouterServerInfo];

        if (v27)
        {
          v28 = [v8 eventRouterServerInfo];
          v5->_isEventRouterServerConnected = [v28 connectionState] == 1;

          v29 = [v8 eventRouterServerInfo];
          int v30 = [v29 hasLastConnected];

          if (v30)
          {
            v31 = (void *)MEMORY[0x1E4F1C9C8];
            v32 = [v8 eventRouterServerInfo];
            [v32 lastConnected];
            uint64_t v33 = objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
            serverLastConnected = v5->_serverLastConnected;
            v5->_serverLastConnected = (NSDate *)v33;
          }
          v35 = [v8 eventRouterServerInfo];
          v36 = [v35 connectedClients];
          uint64_t v37 = [v36 count];

          if (v37)
          {
            v71 = v7;
            id v72 = v4;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            v38 = [v8 eventRouterServerInfo];
            v39 = [v38 connectedClients];

            uint64_t v40 = [v39 countByEnumeratingWithState:&v73 objects:v78 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v74;
              v43 = &stru_1EEE9DD88;
              do
              {
                uint64_t v44 = 0;
                v45 = v43;
                do
                {
                  if (*(void *)v74 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v46 = [*(id *)(*((void *)&v73 + 1) + 8 * v44) connectedClientIdentifierString];
                  v43 = [(__CFString *)v45 stringByAppendingFormat:@" %@", v46];

                  ++v44;
                  v45 = v43;
                }
                while (v41 != v44);
                uint64_t v41 = [v39 countByEnumeratingWithState:&v73 objects:v78 count:16];
              }
              while (v41);
            }
            else
            {
              v43 = &stru_1EEE9DD88;
            }

            connectedClientsDescription = v5->_connectedClientsDescription;
            v5->_connectedClientsDescription = &v43->isa;

            v7 = v71;
            id v4 = v72;
          }
        }
        if ([v8 hasWifiInfo])
        {
          v48 = (void *)MEMORY[0x1E4F655A0];
          v49 = [v8 wifiInfo];
          uint64_t v50 = [v48 wifiNetworkInfoFromProto:v49];
          wifiInfo = v5->_wifiInfo;
          v5->_wifiInfo = (HMFWiFiNetworkInfo *)v50;
        }
        uint64_t v52 = [v8 modelIdentifier];
        model = v5->_model;
        v5->_model = (NSString *)v52;

        uint64_t v54 = [v8 manufacturer];
        manufacturer = v5->_manufacturer;
        v5->_manufacturer = (NSString *)v54;

        uint64_t v56 = [v8 serialNumber];
        serialNumber = v5->_serialNumber;
        v5->_serialNumber = (NSString *)v56;

        if ([v8 hasSoftwareVersion])
        {
          id v58 = objc_alloc(MEMORY[0x1E4F65558]);
          v59 = [v8 softwareVersion];
          uint64_t v60 = [v58 initWithVersionString:v59];
          softwareVersion = v5->_softwareVersion;
          v5->_softwareVersion = (HMFSoftwareVersion *)v60;
        }
        if ([v8 hasSoftwareUpdateDescriptor])
        {
          v62 = [HMSoftwareUpdateDescriptor alloc];
          v63 = [v8 softwareUpdateDescriptor];
          uint64_t v64 = [(HMSoftwareUpdateDescriptor *)v62 initWithProtoPayload:v63];
          softwareUpdateDescriptor = v5->_softwareUpdateDescriptor;
          v5->_softwareUpdateDescriptor = (HMSoftwareUpdateDescriptor *)v64;
        }
        if ([v8 hasSoftwareUpdateProgress])
        {
          v66 = [HMSoftwareUpdateProgress alloc];
          v67 = [v8 softwareUpdateProgress];
          uint64_t v68 = [(HMSoftwareUpdateProgress *)v66 initWithProtoPayload:v67];
          softwareUpdateProgress = v5->_softwareUpdateProgress;
          v5->_softwareUpdateProgress = (HMSoftwareUpdateProgress *)v68;
        }
      }
      if ([(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)v7 hasPrimaryResidentDiagnosticInfo])
      {
        v5->_isPrimaryResident = 1;
      }
      v5->_numHomes = [(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)v7 numHomes];
      v5->_isRunningHH2 = [(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)v7 homeHubVersion] == 2;
    }
  }
  return v5;
}

@end