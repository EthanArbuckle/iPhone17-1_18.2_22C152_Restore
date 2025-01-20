@interface HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo
+ (Class)networkInfoType;
+ (Class)networkServiceInfoType;
+ (Class)networkVisibleDeviceInfosType;
+ (Class)proximityVisibleDeviceInfosType;
+ (Class)visibleAccessoriesInfoType;
+ (Class)visibleIDSDevicesType;
- (BOOL)hasEventRouterServerInfo;
- (BOOL)hasNumAppleMediaAccessories;
- (BOOL)hasNumResidents;
- (BOOL)hasWifiInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMAccessoryInfoProtoWifiNetworkInfoEvent)wifiInfo;
- (HMRemoteEventRouterProtoServerDiagnosticInfo)eventRouterServerInfo;
- (NSMutableArray)networkInfos;
- (NSMutableArray)networkServiceInfos;
- (NSMutableArray)networkVisibleDeviceInfos;
- (NSMutableArray)proximityVisibleDeviceInfos;
- (NSMutableArray)visibleAccessoriesInfos;
- (NSMutableArray)visibleIDSDevices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkInfoAtIndex:(unint64_t)a3;
- (id)networkServiceInfoAtIndex:(unint64_t)a3;
- (id)networkVisibleDeviceInfosAtIndex:(unint64_t)a3;
- (id)proximityVisibleDeviceInfosAtIndex:(unint64_t)a3;
- (id)visibleAccessoriesInfoAtIndex:(unint64_t)a3;
- (id)visibleIDSDevicesAtIndex:(unint64_t)a3;
- (int64_t)numAppleMediaAccessories;
- (int64_t)numResidents;
- (unint64_t)hash;
- (unint64_t)networkInfosCount;
- (unint64_t)networkServiceInfosCount;
- (unint64_t)networkVisibleDeviceInfosCount;
- (unint64_t)proximityVisibleDeviceInfosCount;
- (unint64_t)visibleAccessoriesInfosCount;
- (unint64_t)visibleIDSDevicesCount;
- (void)addNetworkInfo:(id)a3;
- (void)addNetworkServiceInfo:(id)a3;
- (void)addNetworkVisibleDeviceInfos:(id)a3;
- (void)addProximityVisibleDeviceInfos:(id)a3;
- (void)addVisibleAccessoriesInfo:(id)a3;
- (void)addVisibleIDSDevices:(id)a3;
- (void)clearNetworkInfos;
- (void)clearNetworkServiceInfos;
- (void)clearNetworkVisibleDeviceInfos;
- (void)clearProximityVisibleDeviceInfos;
- (void)clearVisibleAccessoriesInfos;
- (void)clearVisibleIDSDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventRouterServerInfo:(id)a3;
- (void)setHasNumAppleMediaAccessories:(BOOL)a3;
- (void)setHasNumResidents:(BOOL)a3;
- (void)setNetworkInfos:(id)a3;
- (void)setNetworkServiceInfos:(id)a3;
- (void)setNetworkVisibleDeviceInfos:(id)a3;
- (void)setNumAppleMediaAccessories:(int64_t)a3;
- (void)setNumResidents:(int64_t)a3;
- (void)setProximityVisibleDeviceInfos:(id)a3;
- (void)setVisibleAccessoriesInfos:(id)a3;
- (void)setVisibleIDSDevices:(id)a3;
- (void)setWifiInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_visibleIDSDevices, 0);
  objc_storeStrong((id *)&self->_visibleAccessoriesInfos, 0);
  objc_storeStrong((id *)&self->_proximityVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_networkVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_networkServiceInfos, 0);
  objc_storeStrong((id *)&self->_networkInfos, 0);

  objc_storeStrong((id *)&self->_eventRouterServerInfo, 0);
}

- (int64_t)numResidents
{
  return self->_numResidents;
}

- (int64_t)numAppleMediaAccessories
{
  return self->_numAppleMediaAccessories;
}

- (void)setProximityVisibleDeviceInfos:(id)a3
{
}

- (NSMutableArray)proximityVisibleDeviceInfos
{
  return self->_proximityVisibleDeviceInfos;
}

- (void)setNetworkVisibleDeviceInfos:(id)a3
{
}

- (NSMutableArray)networkVisibleDeviceInfos
{
  return self->_networkVisibleDeviceInfos;
}

- (void)setVisibleIDSDevices:(id)a3
{
}

- (NSMutableArray)visibleIDSDevices
{
  return self->_visibleIDSDevices;
}

- (void)setVisibleAccessoriesInfos:(id)a3
{
}

- (NSMutableArray)visibleAccessoriesInfos
{
  return self->_visibleAccessoriesInfos;
}

- (void)setEventRouterServerInfo:(id)a3
{
}

- (HMRemoteEventRouterProtoServerDiagnosticInfo)eventRouterServerInfo
{
  return self->_eventRouterServerInfo;
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

- (void)setWifiInfo:(id)a3
{
}

- (HMAccessoryInfoProtoWifiNetworkInfoEvent)wifiInfo
{
  return self->_wifiInfo;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  wifiInfo = self->_wifiInfo;
  uint64_t v6 = *((void *)v4 + 10);
  if (wifiInfo)
  {
    if (v6) {
      -[HMAccessoryInfoProtoWifiNetworkInfoEvent mergeFrom:](wifiInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo setWifiInfo:](self, "setWifiInfo:");
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v61 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self addNetworkInfo:*(void *)(*((void *)&v60 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v9);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v57 != v15) {
          objc_enumerationMutation(v12);
        }
        [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self addNetworkServiceInfo:*(void *)(*((void *)&v56 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v14);
  }

  eventRouterServerInfo = self->_eventRouterServerInfo;
  uint64_t v18 = *((void *)v4 + 3);
  if (eventRouterServerInfo)
  {
    if (v18) {
      -[HMRemoteEventRouterProtoServerDiagnosticInfo mergeFrom:](eventRouterServerInfo, "mergeFrom:");
    }
  }
  else if (v18)
  {
    [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self setEventRouterServerInfo:"setEventRouterServerInfo:"];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v19 = *((id *)v4 + 8);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v67 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(v19);
        }
        [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self addVisibleAccessoriesInfo:*(void *)(*((void *)&v52 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v67 count:16];
    }
    while (v21);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v24 = *((id *)v4 + 9);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v66 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self addVisibleIDSDevices:*(void *)(*((void *)&v48 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v66 count:16];
    }
    while (v26);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = *((id *)v4 + 6);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v65 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self addNetworkVisibleDeviceInfos:*(void *)(*((void *)&v44 + 1) + 8 * n)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v65 count:16];
    }
    while (v31);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v34 = *((id *)v4 + 7);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v64 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v41;
    do
    {
      for (iuint64_t i = 0; ii != v36; ++ii)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(v34);
        }
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addProximityVisibleDeviceInfos:](self, "addProximityVisibleDeviceInfos:", *(void *)(*((void *)&v40 + 1) + 8 * ii), (void)v40);
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v40 objects:v64 count:16];
    }
    while (v36);
  }

  char v39 = *((unsigned char *)v4 + 88);
  if (v39)
  {
    self->_numAppleMediaAccessories = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v39 = *((unsigned char *)v4 + 88);
  }
  if ((v39 & 2) != 0)
  {
    self->_numResidents = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)self->_wifiInfo hash];
  uint64_t v4 = [(NSMutableArray *)self->_networkInfos hash];
  uint64_t v5 = [(NSMutableArray *)self->_networkServiceInfos hash];
  unint64_t v6 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self->_eventRouterServerInfo hash];
  uint64_t v7 = [(NSMutableArray *)self->_visibleAccessoriesInfos hash];
  uint64_t v8 = [(NSMutableArray *)self->_visibleIDSDevices hash];
  uint64_t v9 = [(NSMutableArray *)self->_networkVisibleDeviceInfos hash];
  uint64_t v10 = [(NSMutableArray *)self->_proximityVisibleDeviceInfos hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = 2654435761 * self->_numAppleMediaAccessories;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = 2654435761 * self->_numResidents;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  wifiInfo = self->_wifiInfo;
  if ((unint64_t)wifiInfo | *((void *)v4 + 10))
  {
    if (!-[HMAccessoryInfoProtoWifiNetworkInfoEvent isEqual:](wifiInfo, "isEqual:")) {
      goto LABEL_27;
    }
  }
  networkInfos = self->_networkInfos;
  if ((unint64_t)networkInfos | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](networkInfos, "isEqual:")) {
      goto LABEL_27;
    }
  }
  networkServiceInfos = self->_networkServiceInfos;
  if ((unint64_t)networkServiceInfos | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](networkServiceInfos, "isEqual:")) {
      goto LABEL_27;
    }
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if ((unint64_t)eventRouterServerInfo | *((void *)v4 + 3))
  {
    if (!-[HMRemoteEventRouterProtoServerDiagnosticInfo isEqual:](eventRouterServerInfo, "isEqual:")) {
      goto LABEL_27;
    }
  }
  visibleAccessoriesInfos = self->_visibleAccessoriesInfos;
  if ((unint64_t)visibleAccessoriesInfos | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](visibleAccessoriesInfos, "isEqual:")) {
      goto LABEL_27;
    }
  }
  visibleIDSDevices = self->_visibleIDSDevices;
  if ((unint64_t)visibleIDSDevices | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](visibleIDSDevices, "isEqual:")) {
      goto LABEL_27;
    }
  }
  networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  if ((unint64_t)networkVisibleDeviceInfos | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](networkVisibleDeviceInfos, "isEqual:")) {
      goto LABEL_27;
    }
  }
  proximityVisibleDeviceInfos = self->_proximityVisibleDeviceInfos;
  if ((unint64_t)proximityVisibleDeviceInfos | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](proximityVisibleDeviceInfos, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_numAppleMediaAccessories != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_27:
    BOOL v13 = 0;
    goto LABEL_28;
  }
  BOOL v13 = (*((unsigned char *)v4 + 88) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_numResidents != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
    BOOL v13 = 1;
  }
LABEL_28:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)self->_wifiInfo copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v8 = self->_networkInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = (void *)[*(id *)(*((void *)&v68 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addNetworkInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v68 objects:v77 count:16];
    }
    while (v10);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v14 = self->_networkServiceInfos;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v64 objects:v76 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v65 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = (void *)[*(id *)(*((void *)&v64 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addNetworkServiceInfo:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v64 objects:v76 count:16];
    }
    while (v16);
  }

  id v20 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self->_eventRouterServerInfo copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v22 = self->_visibleAccessoriesInfos;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v60 objects:v75 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addVisibleAccessoriesInfo:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v60 objects:v75 count:16];
    }
    while (v24);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v28 = self->_visibleIDSDevices;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v56 objects:v74 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v57;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v57 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addVisibleIDSDevices:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v56 objects:v74 count:16];
    }
    while (v30);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v34 = self->_networkVisibleDeviceInfos;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v52 objects:v73 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v53;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(v34);
        }
        char v39 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addNetworkVisibleDeviceInfos:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v52 objects:v73 count:16];
    }
    while (v36);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v40 = self->_proximityVisibleDeviceInfos;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v48 objects:v72 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v49;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(v40);
        }
        long long v45 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * ii), "copyWithZone:", a3, (void)v48);
        [(id)v5 addProximityVisibleDeviceInfos:v45];
      }
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v48 objects:v72 count:16];
    }
    while (v42);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_numAppleMediaAccessories;
    *(unsigned char *)(v5 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_numResidents;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v29 = a3;
  if (self->_wifiInfo) {
    objc_msgSend(v29, "setWifiInfo:");
  }
  if ([(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkInfosCount])
  {
    [v29 clearNetworkInfos];
    unint64_t v4 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkInfoAtIndex:i];
        [v29 addNetworkInfo:v7];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkServiceInfosCount])
  {
    [v29 clearNetworkServiceInfos];
    unint64_t v8 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkServiceInfosCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkServiceInfoAtIndex:j];
        [v29 addNetworkServiceInfo:v11];
      }
    }
  }
  if (self->_eventRouterServerInfo) {
    objc_msgSend(v29, "setEventRouterServerInfo:");
  }
  if ([(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self visibleAccessoriesInfosCount])
  {
    [v29 clearVisibleAccessoriesInfos];
    unint64_t v12 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self visibleAccessoriesInfosCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self visibleAccessoriesInfoAtIndex:k];
        [v29 addVisibleAccessoriesInfo:v15];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self visibleIDSDevicesCount])
  {
    [v29 clearVisibleIDSDevices];
    unint64_t v16 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self visibleIDSDevicesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        id v19 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self visibleIDSDevicesAtIndex:m];
        [v29 addVisibleIDSDevices:v19];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkVisibleDeviceInfosCount])
  {
    [v29 clearNetworkVisibleDeviceInfos];
    unint64_t v20 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkVisibleDeviceInfosCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self networkVisibleDeviceInfosAtIndex:n];
        [v29 addNetworkVisibleDeviceInfos:v23];
      }
    }
  }
  if ([(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self proximityVisibleDeviceInfosCount])
  {
    [v29 clearProximityVisibleDeviceInfos];
    unint64_t v24 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self proximityVisibleDeviceInfosCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self proximityVisibleDeviceInfosAtIndex:ii];
        [v29 addProximityVisibleDeviceInfos:v27];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v29 + 1) = self->_numAppleMediaAccessories;
    *((unsigned char *)v29 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v29 + 2) = self->_numResidents;
    *((unsigned char *)v29 + 88) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_wifiInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  unint64_t v5 = self->_networkInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v7);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v10 = self->_networkServiceInfos;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v12);
  }

  if (self->_eventRouterServerInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v15 = self->_visibleAccessoriesInfos;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v17);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v20 = self->_visibleIDSDevices;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v62 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v62 count:16];
    }
    while (v22);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v25 = self->_networkVisibleDeviceInfos;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v40 objects:v61 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v40 objects:v61 count:16];
    }
    while (v27);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v30 = self->_proximityVisibleDeviceInfos;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v36 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v36 objects:v60 count:16];
    }
    while (v32);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  wifiInfo = self->_wifiInfo;
  if (wifiInfo)
  {
    unint64_t v5 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)wifiInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"wifiInfo"];
  }
  if ([(NSMutableArray *)self->_networkInfos count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkInfos, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v7 = self->_networkInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v65 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v64 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"networkInfo"];
  }
  if ([(NSMutableArray *)self->_networkServiceInfos count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkServiceInfos, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v14 = self->_networkServiceInfos;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v61 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v60 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"networkServiceInfo"];
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if (eventRouterServerInfo)
  {
    uint64_t v21 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)eventRouterServerInfo dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"eventRouterServerInfo"];
  }
  if ([(NSMutableArray *)self->_visibleAccessoriesInfos count])
  {
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_visibleAccessoriesInfos, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v23 = self->_visibleAccessoriesInfos;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v57 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v56 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"visibleAccessoriesInfo"];
  }
  visibleIDSDevices = self->_visibleIDSDevices;
  if (visibleIDSDevices) {
    [v3 setObject:visibleIDSDevices forKey:@"visibleIDSDevices"];
  }
  if ([(NSMutableArray *)self->_networkVisibleDeviceInfos count])
  {
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkVisibleDeviceInfos, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v31 = self->_networkVisibleDeviceInfos;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v52 objects:v69 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v53;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v53 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = [*(id *)(*((void *)&v52 + 1) + 8 * m) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v52 objects:v69 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKey:@"networkVisibleDeviceInfos"];
  }
  if ([(NSMutableArray *)self->_proximityVisibleDeviceInfos count])
  {
    long long v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_proximityVisibleDeviceInfos, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v38 = self->_proximityVisibleDeviceInfos;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v48 objects:v68 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v49;
      do
      {
        for (uint64_t n = 0; n != v40; ++n)
        {
          if (*(void *)v49 != v41) {
            objc_enumerationMutation(v38);
          }
          long long v43 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * n), "dictionaryRepresentation", (void)v48);
          [v37 addObject:v43];
        }
        uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v48 objects:v68 count:16];
      }
      while (v40);
    }

    [v3 setObject:v37 forKey:@"proximityVisibleDeviceInfos"];
  }
  char has = (char)self->_has;
  if (has)
  {
    long long v45 = [NSNumber numberWithLongLong:self->_numAppleMediaAccessories];
    [v3 setObject:v45 forKey:@"numAppleMediaAccessories"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    long long v46 = [NSNumber numberWithLongLong:self->_numResidents];
    [v3 setObject:v46 forKey:@"numResidents"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)&v8 description];
  unint64_t v5 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNumResidents
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumResidents:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNumResidents:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numResidents = a3;
}

- (BOOL)hasNumAppleMediaAccessories
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNumAppleMediaAccessories:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setNumAppleMediaAccessories:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numAppleMediaAccessories = a3;
}

- (id)proximityVisibleDeviceInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_proximityVisibleDeviceInfos objectAtIndex:a3];
}

- (unint64_t)proximityVisibleDeviceInfosCount
{
  return [(NSMutableArray *)self->_proximityVisibleDeviceInfos count];
}

- (void)addProximityVisibleDeviceInfos:(id)a3
{
  id v4 = a3;
  proximityVisibleDeviceInfos = self->_proximityVisibleDeviceInfos;
  id v8 = v4;
  if (!proximityVisibleDeviceInfos)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_proximityVisibleDeviceInfos;
    self->_proximityVisibleDeviceInfos = v6;

    id v4 = v8;
    proximityVisibleDeviceInfos = self->_proximityVisibleDeviceInfos;
  }
  [(NSMutableArray *)proximityVisibleDeviceInfos addObject:v4];
}

- (void)clearProximityVisibleDeviceInfos
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

- (id)visibleIDSDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visibleIDSDevices objectAtIndex:a3];
}

- (unint64_t)visibleIDSDevicesCount
{
  return [(NSMutableArray *)self->_visibleIDSDevices count];
}

- (void)addVisibleIDSDevices:(id)a3
{
  id v4 = a3;
  visibleIDSDevices = self->_visibleIDSDevices;
  id v8 = v4;
  if (!visibleIDSDevices)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_visibleIDSDevices;
    self->_visibleIDSDevices = v6;

    id v4 = v8;
    visibleIDSDevices = self->_visibleIDSDevices;
  }
  [(NSMutableArray *)visibleIDSDevices addObject:v4];
}

- (void)clearVisibleIDSDevices
{
}

- (id)visibleAccessoriesInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visibleAccessoriesInfos objectAtIndex:a3];
}

- (unint64_t)visibleAccessoriesInfosCount
{
  return [(NSMutableArray *)self->_visibleAccessoriesInfos count];
}

- (void)addVisibleAccessoriesInfo:(id)a3
{
  id v4 = a3;
  visibleAccessoriesInfos = self->_visibleAccessoriesInfos;
  id v8 = v4;
  if (!visibleAccessoriesInfos)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_visibleAccessoriesInfos;
    self->_visibleAccessoriesInfos = v6;

    id v4 = v8;
    visibleAccessoriesInfos = self->_visibleAccessoriesInfos;
  }
  [(NSMutableArray *)visibleAccessoriesInfos addObject:v4];
}

- (void)clearVisibleAccessoriesInfos
{
}

- (BOOL)hasEventRouterServerInfo
{
  return self->_eventRouterServerInfo != 0;
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

- (BOOL)hasWifiInfo
{
  return self->_wifiInfo != 0;
}

+ (Class)proximityVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

+ (Class)networkVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

+ (Class)visibleIDSDevicesType
{
  return (Class)objc_opt_class();
}

+ (Class)visibleAccessoriesInfoType
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