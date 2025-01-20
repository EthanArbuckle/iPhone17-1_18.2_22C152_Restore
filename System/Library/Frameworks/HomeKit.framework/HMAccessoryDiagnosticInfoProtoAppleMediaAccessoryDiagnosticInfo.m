@interface HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo
+ (Class)nearbyVisibleDeviceInfosType;
+ (Class)networkInfoType;
+ (Class)networkServiceInfoType;
+ (Class)networkVisibleDeviceInfosType;
- (BOOL)hasCloudInfo;
- (BOOL)hasCurrentAccessoryInfo;
- (BOOL)hasEventRouterServerInfo;
- (BOOL)hasGenerationTime;
- (BOOL)hasIdsInfo;
- (BOOL)hasManufacturer;
- (BOOL)hasMediaRouteIdString;
- (BOOL)hasModelIdentifier;
- (BOOL)hasNumAppleMediaAccessories;
- (BOOL)hasNumResidents;
- (BOOL)hasPrimaryResidentStatus;
- (BOOL)hasRegionInfo;
- (BOOL)hasSerialNumber;
- (BOOL)hasSfProblemFlags;
- (BOOL)hasSoftwareUpdateDescriptor;
- (BOOL)hasSoftwareUpdateProgress;
- (BOOL)hasSoftwareVersion;
- (BOOL)hasWifiInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMAccessoryDiagnosticInfoProtoCloudInfo)cloudInfo;
- (HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo)currentAccessoryInfo;
- (HMAccessoryDiagnosticInfoProtoIdsInfo)idsInfo;
- (HMAccessoryInfoProtoWifiNetworkInfoEvent)wifiInfo;
- (HMRemoteEventRouterProtoServerDiagnosticInfo)eventRouterServerInfo;
- (HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor)softwareUpdateDescriptor;
- (HMSoftwareUpdateEventProtoSoftwareUpdateProgress)softwareUpdateProgress;
- (NSMutableArray)nearbyVisibleDeviceInfos;
- (NSMutableArray)networkInfos;
- (NSMutableArray)networkServiceInfos;
- (NSMutableArray)networkVisibleDeviceInfos;
- (NSString)manufacturer;
- (NSString)mediaRouteIdString;
- (NSString)modelIdentifier;
- (NSString)regionInfo;
- (NSString)serialNumber;
- (NSString)softwareVersion;
- (double)generationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nearbyVisibleDeviceInfosAtIndex:(unint64_t)a3;
- (id)networkInfoAtIndex:(unint64_t)a3;
- (id)networkServiceInfoAtIndex:(unint64_t)a3;
- (id)networkVisibleDeviceInfosAtIndex:(unint64_t)a3;
- (id)primaryResidentStatusAsString:(int)a3;
- (int)StringAsPrimaryResidentStatus:(id)a3;
- (int)primaryResidentStatus;
- (int64_t)numAppleMediaAccessories;
- (int64_t)numResidents;
- (unint64_t)hash;
- (unint64_t)nearbyVisibleDeviceInfosCount;
- (unint64_t)networkInfosCount;
- (unint64_t)networkServiceInfosCount;
- (unint64_t)networkVisibleDeviceInfosCount;
- (unint64_t)sfProblemFlags;
- (void)addNearbyVisibleDeviceInfos:(id)a3;
- (void)addNetworkInfo:(id)a3;
- (void)addNetworkServiceInfo:(id)a3;
- (void)addNetworkVisibleDeviceInfos:(id)a3;
- (void)clearNearbyVisibleDeviceInfos;
- (void)clearNetworkInfos;
- (void)clearNetworkServiceInfos;
- (void)clearNetworkVisibleDeviceInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCloudInfo:(id)a3;
- (void)setCurrentAccessoryInfo:(id)a3;
- (void)setEventRouterServerInfo:(id)a3;
- (void)setGenerationTime:(double)a3;
- (void)setHasGenerationTime:(BOOL)a3;
- (void)setHasNumAppleMediaAccessories:(BOOL)a3;
- (void)setHasNumResidents:(BOOL)a3;
- (void)setHasPrimaryResidentStatus:(BOOL)a3;
- (void)setHasSfProblemFlags:(BOOL)a3;
- (void)setIdsInfo:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setMediaRouteIdString:(id)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setNearbyVisibleDeviceInfos:(id)a3;
- (void)setNetworkInfos:(id)a3;
- (void)setNetworkServiceInfos:(id)a3;
- (void)setNetworkVisibleDeviceInfos:(id)a3;
- (void)setNumAppleMediaAccessories:(int64_t)a3;
- (void)setNumResidents:(int64_t)a3;
- (void)setPrimaryResidentStatus:(int)a3;
- (void)setRegionInfo:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSfProblemFlags:(unint64_t)a3;
- (void)setSoftwareUpdateDescriptor:(id)a3;
- (void)setSoftwareUpdateProgress:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setWifiInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProgress, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDescriptor, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_networkVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_networkServiceInfos, 0);
  objc_storeStrong((id *)&self->_networkInfos, 0);
  objc_storeStrong((id *)&self->_nearbyVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdString, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_idsInfo, 0);
  objc_storeStrong((id *)&self->_eventRouterServerInfo, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfo, 0);

  objc_storeStrong((id *)&self->_cloudInfo, 0);
}

- (int64_t)numResidents
{
  return self->_numResidents;
}

- (int64_t)numAppleMediaAccessories
{
  return self->_numAppleMediaAccessories;
}

- (void)setNearbyVisibleDeviceInfos:(id)a3
{
}

- (NSMutableArray)nearbyVisibleDeviceInfos
{
  return self->_nearbyVisibleDeviceInfos;
}

- (void)setNetworkVisibleDeviceInfos:(id)a3
{
}

- (NSMutableArray)networkVisibleDeviceInfos
{
  return self->_networkVisibleDeviceInfos;
}

- (void)setNetworkServiceInfos:(id)a3
{
}

- (NSMutableArray)networkServiceInfos
{
  return self->_networkServiceInfos;
}

- (void)setNetworkInfos:(id)a3
{
}

- (NSMutableArray)networkInfos
{
  return self->_networkInfos;
}

- (unint64_t)sfProblemFlags
{
  return self->_sfProblemFlags;
}

- (void)setSoftwareUpdateProgress:(id)a3
{
}

- (HMSoftwareUpdateEventProtoSoftwareUpdateProgress)softwareUpdateProgress
{
  return self->_softwareUpdateProgress;
}

- (void)setSoftwareUpdateDescriptor:(id)a3
{
}

- (HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor)softwareUpdateDescriptor
{
  return self->_softwareUpdateDescriptor;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setRegionInfo:(id)a3
{
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setModelIdentifier:(id)a3
{
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (double)generationTime
{
  return self->_generationTime;
}

- (void)setEventRouterServerInfo:(id)a3
{
}

- (HMRemoteEventRouterProtoServerDiagnosticInfo)eventRouterServerInfo
{
  return self->_eventRouterServerInfo;
}

- (void)setIdsInfo:(id)a3
{
}

- (HMAccessoryDiagnosticInfoProtoIdsInfo)idsInfo
{
  return self->_idsInfo;
}

- (void)setCloudInfo:(id)a3
{
}

- (HMAccessoryDiagnosticInfoProtoCloudInfo)cloudInfo
{
  return self->_cloudInfo;
}

- (void)setCurrentAccessoryInfo:(id)a3
{
}

- (HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo)currentAccessoryInfo
{
  return self->_currentAccessoryInfo;
}

- (void)setWifiInfo:(id)a3
{
}

- (HMAccessoryInfoProtoWifiNetworkInfoEvent)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setMediaRouteIdString:(id)a3
{
}

- (NSString)mediaRouteIdString
{
  return self->_mediaRouteIdString;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self setMediaRouteIdString:"setMediaRouteIdString:"];
  }
  wifiInfo = self->_wifiInfo;
  uint64_t v6 = *((void *)v4 + 22);
  if (wifiInfo)
  {
    if (v6) {
      -[HMAccessoryInfoProtoWifiNetworkInfoEvent mergeFrom:](wifiInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setWifiInfo:](self, "setWifiInfo:");
  }
  currentAccessoryInfo = self->_currentAccessoryInfo;
  uint64_t v8 = *((void *)v4 + 6);
  if (currentAccessoryInfo)
  {
    if (v8) {
      -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo mergeFrom:](currentAccessoryInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setCurrentAccessoryInfo:](self, "setCurrentAccessoryInfo:");
  }
  cloudInfo = self->_cloudInfo;
  uint64_t v10 = *((void *)v4 + 5);
  if (cloudInfo)
  {
    if (v10) {
      -[HMAccessoryDiagnosticInfoProtoCloudInfo mergeFrom:](cloudInfo, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setCloudInfo:](self, "setCloudInfo:");
  }
  idsInfo = self->_idsInfo;
  uint64_t v12 = *((void *)v4 + 8);
  if (idsInfo)
  {
    if (v12) {
      -[HMAccessoryDiagnosticInfoProtoIdsInfo mergeFrom:](idsInfo, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setIdsInfo:](self, "setIdsInfo:");
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  uint64_t v14 = *((void *)v4 + 7);
  if (eventRouterServerInfo)
  {
    if (v14) {
      -[HMRemoteEventRouterProtoServerDiagnosticInfo mergeFrom:](eventRouterServerInfo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self setEventRouterServerInfo:"setEventRouterServerInfo:"];
  }
  if (*((unsigned char *)v4 + 184))
  {
    self->_generationTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 18)) {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSerialNumber:](self, "setSerialNumber:");
  }
  if (*((void *)v4 + 11)) {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setModelIdentifier:](self, "setModelIdentifier:");
  }
  if (*((void *)v4 + 21)) {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSoftwareVersion:](self, "setSoftwareVersion:");
  }
  if (*((void *)v4 + 17)) {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setRegionInfo:](self, "setRegionInfo:");
  }
  if (*((void *)v4 + 9)) {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setManufacturer:](self, "setManufacturer:");
  }
  softwareUpdateDescriptor = self->_softwareUpdateDescriptor;
  uint64_t v16 = *((void *)v4 + 19);
  if (softwareUpdateDescriptor)
  {
    if (v16) {
      -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor mergeFrom:](softwareUpdateDescriptor, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSoftwareUpdateDescriptor:](self, "setSoftwareUpdateDescriptor:");
  }
  softwareUpdateProgress = self->_softwareUpdateProgress;
  uint64_t v18 = *((void *)v4 + 20);
  if (softwareUpdateProgress)
  {
    if (v18) {
      -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress mergeFrom:](softwareUpdateProgress, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSoftwareUpdateProgress:](self, "setSoftwareUpdateProgress:");
  }
  if ((*((unsigned char *)v4 + 184) & 8) != 0)
  {
    self->_sfProblemFlags = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v19 = *((id *)v4 + 13);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(v19);
        }
        [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self addNetworkInfo:*(void *)(*((void *)&v52 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v21);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v24 = *((id *)v4 + 14);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self addNetworkServiceInfo:*(void *)(*((void *)&v48 + 1) + 8 * j)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v26);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = *((id *)v4 + 15);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self addNetworkVisibleDeviceInfos:*(void *)(*((void *)&v44 + 1) + 8 * k)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v31);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v34 = *((id *)v4 + 12);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(v34);
        }
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo addNearbyVisibleDeviceInfos:](self, "addNearbyVisibleDeviceInfos:", *(void *)(*((void *)&v40 + 1) + 8 * m), (void)v40);
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v36);
  }

  char v39 = *((unsigned char *)v4 + 184);
  if ((v39 & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 184) & 4) == 0) {
      goto LABEL_82;
    }
LABEL_86:
    self->_numResidents = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    if ((*((unsigned char *)v4 + 184) & 0x10) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  self->_numAppleMediaAccessories = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v39 = *((unsigned char *)v4 + 184);
  if ((v39 & 4) != 0) {
    goto LABEL_86;
  }
LABEL_82:
  if ((v39 & 0x10) != 0)
  {
LABEL_83:
    self->_primaryResidentStatus = *((_DWORD *)v4 + 32);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_84:
}

- (unint64_t)hash
{
  NSUInteger v33 = [(NSString *)self->_mediaRouteIdString hash];
  unint64_t v32 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)self->_wifiInfo hash];
  unint64_t v31 = [(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *)self->_currentAccessoryInfo hash];
  unint64_t v30 = [(HMAccessoryDiagnosticInfoProtoCloudInfo *)self->_cloudInfo hash];
  unint64_t v29 = [(HMAccessoryDiagnosticInfoProtoIdsInfo *)self->_idsInfo hash];
  unint64_t v28 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self->_eventRouterServerInfo hash];
  if (*(unsigned char *)&self->_has)
  {
    double generationTime = self->_generationTime;
    double v4 = -generationTime;
    if (generationTime >= 0.0) {
      double v4 = self->_generationTime;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v27 = v10;
  }
  else
  {
    unint64_t v27 = 0;
  }
  NSUInteger v26 = [(NSString *)self->_serialNumber hash];
  NSUInteger v25 = [(NSString *)self->_modelIdentifier hash];
  NSUInteger v24 = [(NSString *)self->_softwareVersion hash];
  NSUInteger v23 = [(NSString *)self->_regionInfo hash];
  NSUInteger v11 = [(NSString *)self->_manufacturer hash];
  unint64_t v12 = [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)self->_softwareUpdateDescriptor hash];
  unint64_t v13 = [(HMSoftwareUpdateEventProtoSoftwareUpdateProgress *)self->_softwareUpdateProgress hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v14 = 2654435761u * self->_sfProblemFlags;
  }
  else {
    unint64_t v14 = 0;
  }
  uint64_t v15 = [(NSMutableArray *)self->_networkInfos hash];
  uint64_t v16 = [(NSMutableArray *)self->_networkServiceInfos hash];
  uint64_t v17 = [(NSMutableArray *)self->_networkVisibleDeviceInfos hash];
  uint64_t v18 = [(NSMutableArray *)self->_nearbyVisibleDeviceInfos hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v20 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v21 = 0;
    return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v19 = 2654435761 * self->_numAppleMediaAccessories;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v20 = 2654435761 * self->_numResidents;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v21 = 2654435761 * self->_primaryResidentStatus;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  mediaRouteIdString = self->_mediaRouteIdString;
  if ((unint64_t)mediaRouteIdString | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](mediaRouteIdString, "isEqual:")) {
      goto LABEL_61;
    }
  }
  wifiInfo = self->_wifiInfo;
  if ((unint64_t)wifiInfo | *((void *)v4 + 22))
  {
    if (!-[HMAccessoryInfoProtoWifiNetworkInfoEvent isEqual:](wifiInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if ((unint64_t)currentAccessoryInfo | *((void *)v4 + 6))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo isEqual:](currentAccessoryInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  cloudInfo = self->_cloudInfo;
  if ((unint64_t)cloudInfo | *((void *)v4 + 5))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoCloudInfo isEqual:](cloudInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  idsInfo = self->_idsInfo;
  if ((unint64_t)idsInfo | *((void *)v4 + 8))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoIdsInfo isEqual:](idsInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if ((unint64_t)eventRouterServerInfo | *((void *)v4 + 7))
  {
    if (!-[HMRemoteEventRouterProtoServerDiagnosticInfo isEqual:](eventRouterServerInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 184) & 1) == 0 || self->_generationTime != *((double *)v4 + 1)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 184))
  {
LABEL_61:
    BOOL v22 = 0;
    goto LABEL_62;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 18)
    && !-[NSString isEqual:](serialNumber, "isEqual:"))
  {
    goto LABEL_61;
  }
  modelIdentifier = self->_modelIdentifier;
  if ((unint64_t)modelIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](modelIdentifier, "isEqual:")) {
      goto LABEL_61;
    }
  }
  softwareVersion = self->_softwareVersion;
  if ((unint64_t)softwareVersion | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](softwareVersion, "isEqual:")) {
      goto LABEL_61;
    }
  }
  regionInfo = self->_regionInfo;
  if ((unint64_t)regionInfo | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](regionInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  manufacturer = self->_manufacturer;
  if ((unint64_t)manufacturer | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](manufacturer, "isEqual:")) {
      goto LABEL_61;
    }
  }
  softwareUpdateDescriptor = self->_softwareUpdateDescriptor;
  if ((unint64_t)softwareUpdateDescriptor | *((void *)v4 + 19))
  {
    if (!-[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor isEqual:](softwareUpdateDescriptor, "isEqual:")) {
      goto LABEL_61;
    }
  }
  softwareUpdateProgress = self->_softwareUpdateProgress;
  if ((unint64_t)softwareUpdateProgress | *((void *)v4 + 20))
  {
    if (!-[HMSoftwareUpdateEventProtoSoftwareUpdateProgress isEqual:](softwareUpdateProgress, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 184) & 8) == 0 || self->_sfProblemFlags != *((void *)v4 + 4)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 184) & 8) != 0)
  {
    goto LABEL_61;
  }
  networkInfos = self->_networkInfos;
  if ((unint64_t)networkInfos | *((void *)v4 + 13)
    && !-[NSMutableArray isEqual:](networkInfos, "isEqual:"))
  {
    goto LABEL_61;
  }
  networkServiceInfos = self->_networkServiceInfos;
  if ((unint64_t)networkServiceInfos | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](networkServiceInfos, "isEqual:")) {
      goto LABEL_61;
    }
  }
  networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  if ((unint64_t)networkVisibleDeviceInfos | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](networkVisibleDeviceInfos, "isEqual:")) {
      goto LABEL_61;
    }
  }
  nearbyVisibleDeviceInfos = self->_nearbyVisibleDeviceInfos;
  if ((unint64_t)nearbyVisibleDeviceInfos | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](nearbyVisibleDeviceInfos, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 184) & 2) == 0 || self->_numAppleMediaAccessories != *((void *)v4 + 2)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 184) & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 184) & 4) == 0 || self->_numResidents != *((void *)v4 + 3)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 184) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 184) & 0x10) == 0 || self->_primaryResidentStatus != *((_DWORD *)v4 + 32)) {
      goto LABEL_61;
    }
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = (*((unsigned char *)v4 + 184) & 0x10) == 0;
  }
LABEL_62:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mediaRouteIdString copyWithZone:a3];
  double v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  id v8 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)self->_wifiInfo copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v8;

  id v10 = [(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *)self->_currentAccessoryInfo copyWithZone:a3];
  NSUInteger v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  id v12 = [(HMAccessoryDiagnosticInfoProtoCloudInfo *)self->_cloudInfo copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(HMAccessoryDiagnosticInfoProtoIdsInfo *)self->_idsInfo copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  id v16 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self->_eventRouterServerInfo copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_generationTime;
    *(unsigned char *)(v5 + 184) |= 1u;
  }
  uint64_t v18 = [(NSString *)self->_serialNumber copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v18;

  uint64_t v20 = [(NSString *)self->_modelIdentifier copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  uint64_t v22 = [(NSString *)self->_softwareVersion copyWithZone:a3];
  NSUInteger v23 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v22;

  uint64_t v24 = [(NSString *)self->_regionInfo copyWithZone:a3];
  NSUInteger v25 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v24;

  uint64_t v26 = [(NSString *)self->_manufacturer copyWithZone:a3];
  unint64_t v27 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v26;

  id v28 = [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)self->_softwareUpdateDescriptor copyWithZone:a3];
  unint64_t v29 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v28;

  id v30 = [(HMSoftwareUpdateEventProtoSoftwareUpdateProgress *)self->_softwareUpdateProgress copyWithZone:a3];
  unint64_t v31 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v30;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_sfProblemFlags;
    *(unsigned char *)(v5 + 184) |= 8u;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  unint64_t v32 = self->_networkInfos;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v71 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addNetworkInfo:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v34);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v38 = self->_networkServiceInfos;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v67 != v41) {
          objc_enumerationMutation(v38);
        }
        long long v43 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addNetworkServiceInfo:v43];
      }
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v40);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v44 = self->_networkVisibleDeviceInfos;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v63;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v63 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addNetworkVisibleDeviceInfos:v49];
      }
      uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v46);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v50 = self->_nearbyVisibleDeviceInfos;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v59;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v59 != v53) {
          objc_enumerationMutation(v50);
        }
        long long v55 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * m), "copyWithZone:", a3, (void)v58);
        [(id)v5 addNearbyVisibleDeviceInfos:v55];
      }
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v52);
  }

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_35;
    }
LABEL_39:
    *(void *)(v5 + 24) = self->_numResidents;
    *(unsigned char *)(v5 + 184) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v5;
    }
    goto LABEL_36;
  }
  *(void *)(v5 + 16) = self->_numAppleMediaAccessories;
  *(unsigned char *)(v5 + 184) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_39;
  }
LABEL_35:
  if ((has & 0x10) != 0)
  {
LABEL_36:
    *(_DWORD *)(v5 + 128) = self->_primaryResidentStatus;
    *(unsigned char *)(v5 + 184) |= 0x10u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v22 = v4;
  if (self->_mediaRouteIdString)
  {
    objc_msgSend(v4, "setMediaRouteIdString:");
    id v4 = v22;
  }
  if (self->_wifiInfo)
  {
    objc_msgSend(v22, "setWifiInfo:");
    id v4 = v22;
  }
  if (self->_currentAccessoryInfo)
  {
    objc_msgSend(v22, "setCurrentAccessoryInfo:");
    id v4 = v22;
  }
  if (self->_cloudInfo)
  {
    objc_msgSend(v22, "setCloudInfo:");
    id v4 = v22;
  }
  if (self->_idsInfo)
  {
    objc_msgSend(v22, "setIdsInfo:");
    id v4 = v22;
  }
  if (self->_eventRouterServerInfo)
  {
    objc_msgSend(v22, "setEventRouterServerInfo:");
    id v4 = v22;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_generationTime;
    *((unsigned char *)v4 + 184) |= 1u;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v22, "setSerialNumber:");
    id v4 = v22;
  }
  if (self->_modelIdentifier)
  {
    objc_msgSend(v22, "setModelIdentifier:");
    id v4 = v22;
  }
  if (self->_softwareVersion)
  {
    objc_msgSend(v22, "setSoftwareVersion:");
    id v4 = v22;
  }
  if (self->_regionInfo)
  {
    objc_msgSend(v22, "setRegionInfo:");
    id v4 = v22;
  }
  if (self->_manufacturer)
  {
    objc_msgSend(v22, "setManufacturer:");
    id v4 = v22;
  }
  if (self->_softwareUpdateDescriptor)
  {
    objc_msgSend(v22, "setSoftwareUpdateDescriptor:");
    id v4 = v22;
  }
  if (self->_softwareUpdateProgress)
  {
    objc_msgSend(v22, "setSoftwareUpdateProgress:");
    id v4 = v22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_sfProblemFlags;
    *((unsigned char *)v4 + 184) |= 8u;
  }
  if ([(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkInfosCount])
  {
    [v22 clearNetworkInfos];
    unint64_t v5 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkInfoAtIndex:i];
        [v22 addNetworkInfo:v8];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkServiceInfosCount])
  {
    [v22 clearNetworkServiceInfos];
    unint64_t v9 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkServiceInfosCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkServiceInfoAtIndex:j];
        [v22 addNetworkServiceInfo:v12];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkVisibleDeviceInfosCount])
  {
    [v22 clearNetworkVisibleDeviceInfos];
    unint64_t v13 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkVisibleDeviceInfosCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        id v16 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self networkVisibleDeviceInfosAtIndex:k];
        [v22 addNetworkVisibleDeviceInfos:v16];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self nearbyVisibleDeviceInfosCount])
  {
    [v22 clearNearbyVisibleDeviceInfos];
    unint64_t v17 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self nearbyVisibleDeviceInfosCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self nearbyVisibleDeviceInfosAtIndex:m];
        [v22 addNearbyVisibleDeviceInfos:v20];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v22 + 2) = self->_numAppleMediaAccessories;
    *((unsigned char *)v22 + 184) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_49:
      if ((has & 0x10) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_49;
  }
  *((void *)v22 + 3) = self->_numResidents;
  *((unsigned char *)v22 + 184) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_50:
    *((_DWORD *)v22 + 32) = self->_primaryResidentStatus;
    *((unsigned char *)v22 + 184) |= 0x10u;
  }
LABEL_51:
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_mediaRouteIdString) {
    PBDataWriterWriteStringField();
  }
  if (self->_wifiInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_currentAccessoryInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cloudInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_idsInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_eventRouterServerInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_serialNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_softwareVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_regionInfo) {
    PBDataWriterWriteStringField();
  }
  if (self->_manufacturer) {
    PBDataWriterWriteStringField();
  }
  if (self->_softwareUpdateDescriptor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_softwareUpdateProgress) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v5 = self->_networkInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v10 = self->_networkServiceInfos;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = self->_networkVisibleDeviceInfos;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = self->_nearbyVisibleDeviceInfos;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_61;
    }
LABEL_65:
    PBDataWriterWriteInt64Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_65;
  }
LABEL_61:
  if ((has & 0x10) != 0) {
LABEL_62:
  }
    PBDataWriterWriteInt32Field();
LABEL_63:
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  mediaRouteIdString = self->_mediaRouteIdString;
  if (mediaRouteIdString) {
    [v3 setObject:mediaRouteIdString forKey:@"mediaRouteIdString"];
  }
  wifiInfo = self->_wifiInfo;
  if (wifiInfo)
  {
    uint64_t v7 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)wifiInfo dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"wifiInfo"];
  }
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if (currentAccessoryInfo)
  {
    unint64_t v9 = [(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *)currentAccessoryInfo dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"currentAccessoryInfo"];
  }
  cloudInfo = self->_cloudInfo;
  if (cloudInfo)
  {
    uint64_t v11 = [(HMAccessoryDiagnosticInfoProtoCloudInfo *)cloudInfo dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"cloudInfo"];
  }
  idsInfo = self->_idsInfo;
  if (idsInfo)
  {
    uint64_t v13 = [(HMAccessoryDiagnosticInfoProtoIdsInfo *)idsInfo dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"idsInfo"];
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if (eventRouterServerInfo)
  {
    uint64_t v15 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)eventRouterServerInfo dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"eventRouterServerInfo"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v16 = [NSNumber numberWithDouble:self->_generationTime];
    [v4 setObject:v16 forKey:@"generationTime"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v4 setObject:serialNumber forKey:@"serialNumber"];
  }
  modelIdentifier = self->_modelIdentifier;
  if (modelIdentifier) {
    [v4 setObject:modelIdentifier forKey:@"modelIdentifier"];
  }
  softwareVersion = self->_softwareVersion;
  if (softwareVersion) {
    [v4 setObject:softwareVersion forKey:@"softwareVersion"];
  }
  regionInfo = self->_regionInfo;
  if (regionInfo) {
    [v4 setObject:regionInfo forKey:@"regionInfo"];
  }
  manufacturer = self->_manufacturer;
  if (manufacturer) {
    [v4 setObject:manufacturer forKey:@"manufacturer"];
  }
  softwareUpdateDescriptor = self->_softwareUpdateDescriptor;
  if (softwareUpdateDescriptor)
  {
    uint64_t v23 = [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)softwareUpdateDescriptor dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"softwareUpdateDescriptor"];
  }
  softwareUpdateProgress = self->_softwareUpdateProgress;
  if (softwareUpdateProgress)
  {
    NSUInteger v25 = [(HMSoftwareUpdateEventProtoSoftwareUpdateProgress *)softwareUpdateProgress dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"softwareUpdateProgress"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    long long v26 = [NSNumber numberWithUnsignedLongLong:self->_sfProblemFlags];
    [v4 setObject:v26 forKey:@"sfProblemFlags"];
  }
  if ([(NSMutableArray *)self->_networkInfos count])
  {
    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkInfos, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v28 = self->_networkInfos;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v74 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = [*(id *)(*((void *)&v73 + 1) + 8 * i) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"networkInfo"];
  }
  if ([(NSMutableArray *)self->_networkServiceInfos count])
  {
    long long v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkServiceInfos, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v35 = self->_networkServiceInfos;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v70 != v38) {
            objc_enumerationMutation(v35);
          }
          long long v40 = [*(id *)(*((void *)&v69 + 1) + 8 * j) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v69 objects:v79 count:16];
      }
      while (v37);
    }

    [v4 setObject:v34 forKey:@"networkServiceInfo"];
  }
  if ([(NSMutableArray *)self->_networkVisibleDeviceInfos count])
  {
    long long v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkVisibleDeviceInfos, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v42 = self->_networkVisibleDeviceInfos;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v66 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = [*(id *)(*((void *)&v65 + 1) + 8 * k) dictionaryRepresentation];
          [v41 addObject:v47];
        }
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v65 objects:v78 count:16];
      }
      while (v44);
    }

    [v4 setObject:v41 forKey:@"networkVisibleDeviceInfos"];
  }
  if ([(NSMutableArray *)self->_nearbyVisibleDeviceInfos count])
  {
    long long v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nearbyVisibleDeviceInfos, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v49 = self->_nearbyVisibleDeviceInfos;
    uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v61 objects:v77 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v62;
      do
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v62 != v52) {
            objc_enumerationMutation(v49);
          }
          long long v54 = [*(id *)(*((void *)&v61 + 1) + 8 * m) dictionaryRepresentation];
          [v48 addObject:v54];
        }
        uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v61 objects:v77 count:16];
      }
      while (v51);
    }

    [v4 setObject:v48 forKey:@"nearbyVisibleDeviceInfos"];
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_69;
    }
LABEL_72:
    v57 = [NSNumber numberWithLongLong:self->_numResidents];
    [v4 setObject:v57 forKey:@"numResidents"];

    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_77;
    }
LABEL_73:
    uint64_t primaryResidentStatus = self->_primaryResidentStatus;
    if (primaryResidentStatus >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_primaryResidentStatus);
      long long v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v59 = off_1E5942220[primaryResidentStatus];
    }
    [v4 setObject:v59 forKey:@"primaryResidentStatus"];

    goto LABEL_77;
  }
  v56 = [NSNumber numberWithLongLong:self->_numAppleMediaAccessories];
  [v4 setObject:v56 forKey:@"numAppleMediaAccessories"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_72;
  }
LABEL_69:
  if ((has & 0x10) != 0) {
    goto LABEL_73;
  }
LABEL_77:

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)&v8 description];
  unint64_t v5 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsPrimaryResidentStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NoKnownPrimary"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KnownPrimary"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)primaryResidentStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5942220[a3];
  }

  return v3;
}

- (BOOL)hasPrimaryResidentStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasPrimaryResidentStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setPrimaryResidentStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_uint64_t primaryResidentStatus = a3;
}

- (int)primaryResidentStatus
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_primaryResidentStatus;
  }
  else {
    return 0;
  }
}

- (BOOL)hasNumResidents
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumResidents:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNumResidents:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numResidents = a3;
}

- (BOOL)hasNumAppleMediaAccessories
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumAppleMediaAccessories:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNumAppleMediaAccessories:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numAppleMediaAccessories = a3;
}

- (id)nearbyVisibleDeviceInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nearbyVisibleDeviceInfos objectAtIndex:a3];
}

- (unint64_t)nearbyVisibleDeviceInfosCount
{
  return [(NSMutableArray *)self->_nearbyVisibleDeviceInfos count];
}

- (void)addNearbyVisibleDeviceInfos:(id)a3
{
  id v4 = a3;
  nearbyVisibleDeviceInfos = self->_nearbyVisibleDeviceInfos;
  id v8 = v4;
  if (!nearbyVisibleDeviceInfos)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_nearbyVisibleDeviceInfos;
    self->_nearbyVisibleDeviceInfos = v6;

    id v4 = v8;
    nearbyVisibleDeviceInfos = self->_nearbyVisibleDeviceInfos;
  }
  [(NSMutableArray *)nearbyVisibleDeviceInfos addObject:v4];
}

- (void)clearNearbyVisibleDeviceInfos
{
}

- (id)networkVisibleDeviceInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkVisibleDeviceInfos objectAtIndex:a3];
}

- (unint64_t)networkVisibleDeviceInfosCount
{
  return [(NSMutableArray *)self->_networkVisibleDeviceInfos count];
}

- (void)addNetworkVisibleDeviceInfos:(id)a3
{
  id v4 = a3;
  networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  id v8 = v4;
  if (!networkVisibleDeviceInfos)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_networkVisibleDeviceInfos;
    self->_networkVisibleDeviceInfos = v6;

    id v4 = v8;
    networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  }
  [(NSMutableArray *)networkVisibleDeviceInfos addObject:v4];
}

- (void)clearNetworkVisibleDeviceInfos
{
}

- (id)networkServiceInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkServiceInfos objectAtIndex:a3];
}

- (unint64_t)networkServiceInfosCount
{
  return [(NSMutableArray *)self->_networkServiceInfos count];
}

- (void)addNetworkServiceInfo:(id)a3
{
  id v4 = a3;
  networkServiceInfos = self->_networkServiceInfos;
  id v8 = v4;
  if (!networkServiceInfos)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_networkServiceInfos;
    self->_networkServiceInfos = v6;

    id v4 = v8;
    networkServiceInfos = self->_networkServiceInfos;
  }
  [(NSMutableArray *)networkServiceInfos addObject:v4];
}

- (void)clearNetworkServiceInfos
{
}

- (id)networkInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkInfos objectAtIndex:a3];
}

- (unint64_t)networkInfosCount
{
  return [(NSMutableArray *)self->_networkInfos count];
}

- (void)addNetworkInfo:(id)a3
{
  id v4 = a3;
  networkInfos = self->_networkInfos;
  id v8 = v4;
  if (!networkInfos)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_networkInfos;
    self->_networkInfos = v6;

    id v4 = v8;
    networkInfos = self->_networkInfos;
  }
  [(NSMutableArray *)networkInfos addObject:v4];
}

- (void)clearNetworkInfos
{
}

- (BOOL)hasSfProblemFlags
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSfProblemFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSfProblemFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sfProblemFlags = a3;
}

- (BOOL)hasSoftwareUpdateProgress
{
  return self->_softwareUpdateProgress != 0;
}

- (BOOL)hasSoftwareUpdateDescriptor
{
  return self->_softwareUpdateDescriptor != 0;
}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (BOOL)hasRegionInfo
{
  return self->_regionInfo != 0;
}

- (BOOL)hasSoftwareVersion
{
  return self->_softwareVersion != 0;
}

- (BOOL)hasModelIdentifier
{
  return self->_modelIdentifier != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasGenerationTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasGenerationTime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setGenerationTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double generationTime = a3;
}

- (BOOL)hasEventRouterServerInfo
{
  return self->_eventRouterServerInfo != 0;
}

- (BOOL)hasIdsInfo
{
  return self->_idsInfo != 0;
}

- (BOOL)hasCloudInfo
{
  return self->_cloudInfo != 0;
}

- (BOOL)hasCurrentAccessoryInfo
{
  return self->_currentAccessoryInfo != 0;
}

- (BOOL)hasWifiInfo
{
  return self->_wifiInfo != 0;
}

- (BOOL)hasMediaRouteIdString
{
  return self->_mediaRouteIdString != 0;
}

+ (Class)nearbyVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

+ (Class)networkVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

+ (Class)networkServiceInfoType
{
  return (Class)objc_opt_class();
}

+ (Class)networkInfoType
{
  return (Class)objc_opt_class();
}

@end