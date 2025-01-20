@interface HMDAppleMediaAccessoryDiagnosticInfoController
+ (id)diagnosticInfoDescriptionWithData:(id)a3;
- (BOOL)isHH2Mode;
- (HMDAppleMediaAccessoryDiagnosticInfoController)initWithDataSource:(id)a3 isHH2Mode:(BOOL)a4;
- (HMDAppleMediaAccessoryDiagnosticInfoControllerDataSource)dataSource;
- (id)_diagnosticInfoWithAdditionalKeys:(id)a3;
- (id)diagnosticInfoDataWithAdditionalKeys:(id)a3;
@end

@implementation HMDAppleMediaAccessoryDiagnosticInfoController

- (void).cxx_destruct
{
}

- (HMDAppleMediaAccessoryDiagnosticInfoControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryDiagnosticInfoControllerDataSource *)WeakRetained;
}

- (BOOL)isHH2Mode
{
  return self->_isHH2Mode;
}

- (id)diagnosticInfoDataWithAdditionalKeys:(id)a3
{
  v3 = [(HMDAppleMediaAccessoryDiagnosticInfoController *)self _diagnosticInfoWithAdditionalKeys:a3];
  v4 = [v3 data];

  return v4;
}

- (id)_diagnosticInfoWithAdditionalKeys:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAppleMediaAccessoryDiagnosticInfoController *)self dataSource];
  id v6 = objc_alloc_init(MEMORY[0x263F0DF70]);
  [v6 setVersion:11];
  if ([(HMDAppleMediaAccessoryDiagnosticInfoController *)self isHH2Mode]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 setHomeHubVersion:v7];
  v8 = [MEMORY[0x263EFF910] now];
  [v8 timeIntervalSince1970];
  objc_msgSend(v6, "setGenerationTime:");
  if (v5)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F0DF58]);
    [v6 setAppleMediaAccessoryDiagnosticInfo:v9];

    id v10 = objc_alloc_init(MEMORY[0x263F0DF60]);
    [v10 setCloudState:0];
    if ([v5 isSignedIntoiCloud]) {
      [v10 setCloudState:1];
    }
    [v10 setOctagonState:0];
    if ([v5 hasManatee]) {
      [v10 setOctagonState:1];
    }
    objc_msgSend(v10, "setFirstCloudImportComplete:", objc_msgSend(v5, "isFirstCloudImportComplete"));
    v11 = [v6 appleMediaAccessoryDiagnosticInfo];
    v126 = v10;
    [v11 setCloudInfo:v10];

    v12 = [v5 networkInfo];
    if (v12)
    {
      v13 = [v6 appleMediaAccessoryDiagnosticInfo];
      [v13 setWifiInfo:v12];
    }
    v129 = v8;
    objc_msgSend(v6, "setNumHomes:", objc_msgSend(v5, "numHomes"));
    v14 = [v5 currentDeviceMediaRouteIdentifier];
    v15 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v15 setMediaRouteIdString:v14];

    v16 = [MEMORY[0x263F42648] systemInfo];
    v17 = [v16 serialNumber];
    v18 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v18 setSerialNumber:v17];

    v19 = [v16 modelIdentifier];
    v20 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v20 setModelIdentifier:v19];

    v21 = [v16 softwareVersion];
    v22 = [v21 versionString];
    v23 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v23 setSoftwareVersion:v22];

    v122 = v16;
    v24 = [v16 regionInfo];
    v25 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v25 setRegionInfo:v24];

    if ([v4 containsObject:*MEMORY[0x263F0CA10]])
    {
      v26 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v27 = +[HMDCurrentAccessorySetupMetricDispatcher readLastAccessorySetupInfo:v26];

      if (v27)
      {
        [v6 setLastSetupInfo:v27];
        v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
        +[HMDCurrentAccessorySetupMetricDispatcher removeLastAccessorySetupInfoFromUserDefaults:v28];
      }
    }
    id v127 = v4;
    v29 = [v5 obtainNetworkInfoProto];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"NetworkInfo"];
    v31 = (void *)v30;
    v32 = (void *)MEMORY[0x263EFFA68];
    if (v30) {
      v33 = (void *)v30;
    }
    else {
      v33 = (void *)MEMORY[0x263EFFA68];
    }
    id v130 = v33;

    v123 = v29;
    uint64_t v34 = [v29 objectForKeyedSubscript:@"NetworkServiceInfo"];
    v35 = (void *)v34;
    if (v34) {
      v36 = (void *)v34;
    }
    else {
      v36 = v32;
    }
    id v37 = v36;

    uint64_t v38 = [v5 networkVisibleDevices];
    v39 = (void *)v38;
    if (v38) {
      v40 = (void *)v38;
    }
    else {
      v40 = v32;
    }
    id v41 = v40;

    uint64_t v42 = [v5 nearbyVisibleDevices];
    v43 = (void *)v42;
    if (v42) {
      v44 = (void *)v42;
    }
    else {
      v44 = v32;
    }
    id v45 = v44;

    v46 = [v5 currentAccessory];
    v131 = [v46 home];
    v121 = v46;
    if (v46)
    {
      v124 = v12;
      v47 = [v46 manufacturer];
      v48 = [v6 appleMediaAccessoryDiagnosticInfo];
      [v48 setManufacturer:v47];

      id v49 = objc_alloc_init(MEMORY[0x263F0DF68]);
      v50 = [v46 uuid];
      v51 = [v50 UUIDString];
      [v49 setUuidString:v51];

      v52 = [v46 pairingIdentity];
      v53 = [v52 publicPairingIdentity];
      [v53 protoPayload];
      v55 = v54 = v46;
      [v49 setPublicPairingIdentity:v55];

      v56 = [v6 appleMediaAccessoryDiagnosticInfo];
      v119 = v49;
      [v56 setCurrentAccessoryInfo:v49];

      uint64_t v57 = [v5 eventRouterServerDiagnosticInfo];
      v58 = [v6 appleMediaAccessoryDiagnosticInfo];
      v128 = (void *)v57;
      [v58 setEventRouterServerInfo:v57];

      v8 = v129;
      [v129 timeIntervalSince1970];
      double v60 = v59;
      v61 = [v6 appleMediaAccessoryDiagnosticInfo];
      [v61 setGenerationTime:v60];

      v62 = [v54 lastSentSoftwareUpdateDescriptor];
      v63 = [v62 protoPayload];
      v64 = [v6 appleMediaAccessoryDiagnosticInfo];
      [v64 setSoftwareUpdateDescriptor:v63];

      v65 = [v54 lastSentSoftwareUpdateProgress];
      v66 = [v65 protoPayload];
      v67 = [v6 appleMediaAccessoryDiagnosticInfo];
      [v67 setSoftwareUpdateProgress:v66];

      v68 = [v54 manufacturer];
      v69 = [v6 appleMediaAccessoryDiagnosticInfo];
      [v69 setManufacturer:v68];

      if (v131)
      {
        v70 = [v131 appleMediaAccessories];
        uint64_t v71 = [v70 count];
        v72 = [v6 appleMediaAccessoryDiagnosticInfo];
        [v72 setNumAppleMediaAccessories:v71];

        v73 = [v131 residentDeviceManager];
        v74 = [v73 residentDevices];
        uint64_t v75 = [v74 count];
        [v6 appleMediaAccessoryDiagnosticInfo];
        id v76 = v45;
        id v77 = v41;
        v79 = id v78 = v37;
        [v79 setNumResidents:v75];

        v80 = [v131 residentDeviceManager];
        v81 = [v80 confirmedPrimaryResidentDevice];

        if (v81) {
          uint64_t v82 = 2;
        }
        else {
          uint64_t v82 = 1;
        }
        v83 = [v6 appleMediaAccessoryDiagnosticInfo];
        [v83 setPrimaryResidentStatus:v82];

        id v37 = v78;
        id v41 = v77;
        id v45 = v76;
      }

      v12 = v124;
    }
    else
    {
      v128 = 0;
      v8 = v129;
    }
    uint64_t v84 = [v5 currentDeviceRawProblemFlags];
    v85 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v85 setSfProblemFlags:v84];

    v86 = (void *)[v130 mutableCopy];
    v87 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v87 setNetworkInfos:v86];

    v125 = v37;
    v88 = (void *)[v37 mutableCopy];
    v89 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v89 setNetworkServiceInfos:v88];

    v90 = [v5 currentDeviceIDSIdentifier];
    id v91 = objc_alloc_init(MEMORY[0x263F0DF78]);
    [v91 setIdsState:0];
    if (v90)
    {
      v92 = [v90 UUIDString];
      [v91 setIdsIdentifierString:v92];

      [v91 setIdsState:1];
    }
    v93 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v93 setIdsInfo:v91];

    v94 = (void *)[v41 mutableCopy];
    v95 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v95 setNetworkVisibleDeviceInfos:v94];

    v96 = (void *)[v45 mutableCopy];
    v97 = [v6 appleMediaAccessoryDiagnosticInfo];
    [v97 setNearbyVisibleDeviceInfos:v96];

    if ([v5 isCurrentDevicePrimaryResident])
    {
      id v98 = objc_alloc_init(MEMORY[0x263F0DF80]);
      [v6 setPrimaryResidentDiagnosticInfo:v98];

      v99 = [v6 primaryResidentDiagnosticInfo];
      [v99 setWifiInfo:v12];

      v100 = [v6 primaryResidentDiagnosticInfo];
      [v100 setEventRouterServerInfo:v128];

      v101 = (void *)[v130 mutableCopy];
      v102 = [v6 primaryResidentDiagnosticInfo];
      [v102 setNetworkInfos:v101];

      v103 = (void *)[v41 mutableCopy];
      v104 = [v6 primaryResidentDiagnosticInfo];
      [v104 setNetworkVisibleDeviceInfos:v103];

      v105 = (void *)[v41 mutableCopy];
      v106 = [v6 primaryResidentDiagnosticInfo];
      [v106 setNetworkVisibleDeviceInfos:v105];

      v107 = [v131 appleMediaAccessories];
      uint64_t v108 = [v107 count];
      [v6 primaryResidentDiagnosticInfo];
      v120 = v5;
      v109 = v90;
      id v110 = v45;
      v112 = v111 = v12;
      [v112 setNumAppleMediaAccessories:v108];

      v113 = [v131 residentDeviceManager];
      v114 = [v113 residentDevices];
      uint64_t v115 = [v114 count];
      v116 = [v6 primaryResidentDiagnosticInfo];
      uint64_t v117 = v115;
      v12 = v111;
      id v45 = v110;
      v90 = v109;
      v5 = v120;
      [v116 setNumResidents:v117];

      v8 = v129;
    }

    id v4 = v127;
  }

  return v6;
}

- (HMDAppleMediaAccessoryDiagnosticInfoController)initWithDataSource:(id)a3 isHH2Mode:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAppleMediaAccessoryDiagnosticInfoController;
  uint64_t v7 = [(HMDAppleMediaAccessoryDiagnosticInfoController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_isHH2Mode = a4;
    objc_storeWeak((id *)&v7->_dataSource, v6);
  }

  return v8;
}

+ (id)diagnosticInfoDescriptionWithData:(id)a3
{
  uint64_t v231 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F0DF70]) initWithData:v3];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "version"));
    [v5 setObject:v6 forKeyedSubscript:@"version"];

    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "homeHubVersion"));
    v205 = v5;
    [v5 setObject:v7 forKeyedSubscript:@"homehubversion"];

    if ([v4 hasNumHomes])
    {
      v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "numHomes"));
      [v5 setObject:v8 forKeyedSubscript:@"homes.num"];
    }
    if ([v4 hasAppleMediaAccessoryDiagnosticInfo])
    {
      v197 = v4;
      id v198 = v3;
      id v9 = [v4 appleMediaAccessoryDiagnosticInfo];
      if ([v9 hasCloudInfo])
      {
        objc_super v10 = NSNumber;
        v11 = [v9 cloudInfo];
        v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "cloudState"));
        [v5 setObject:v12 forKeyedSubscript:@"cloud.state"];

        v13 = NSNumber;
        v14 = [v9 cloudInfo];
        v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "octagonState"));
        [v5 setObject:v15 forKeyedSubscript:@"cloud.octagonstate"];

        v16 = [v9 cloudInfo];
        if ([v16 firstCloudImportComplete]) {
          v17 = @"true";
        }
        else {
          v17 = @"false";
        }
        [v5 setObject:v17 forKeyedSubscript:@"cloud.firstImportComplete"];
      }
      if ([v9 hasWifiInfo])
      {
        v18 = [v9 wifiInfo];
        v19 = [v18 networkSSID];
        [v5 setObject:v19 forKeyedSubscript:@"wifi.netssid"];

        v20 = [v9 wifiInfo];
        v21 = [v20 networkBSSID];
        [v5 setObject:v21 forKeyedSubscript:@"wifi.netbssid"];

        v22 = [v9 wifiInfo];
        v23 = [v22 networkGatewayIPAddress];
        [v5 setObject:v23 forKeyedSubscript:@"wifi.netgateway"];

        v24 = [v9 wifiInfo];
        v25 = [v24 macAddress];
        [v5 setObject:v25 forKeyedSubscript:@"wifi.macAddress"];

        v26 = [v9 wifiInfo];
        v27 = [v26 networkGatewayMacAddress];
        [v5 setObject:v27 forKeyedSubscript:@"wifi.gatewayMacAddress"];

        v28 = NSNumber;
        v29 = [v9 wifiInfo];
        uint64_t v30 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v29, "networkRSSI"));
        [v5 setObject:v30 forKeyedSubscript:@"wifi.netrssi"];
      }
      v31 = [v9 currentAccessoryInfo];

      if (v31)
      {
        v32 = [v9 currentAccessoryInfo];
        v33 = [v32 uuidString];
        [v5 setObject:v33 forKeyedSubscript:@"accessory.uuid"];

        uint64_t v34 = [v9 currentAccessoryInfo];
        v35 = [v34 publicPairingIdentity];
        v36 = [v35 identifier];
        [v5 setObject:v36 forKeyedSubscript:@"accessory.pairingIdentity"];
      }
      id v37 = [v9 mediaRouteIdString];
      [v5 setObject:v37 forKeyedSubscript:@"accessory.mediaRouteID"];

      uint64_t v38 = [v9 idsInfo];

      if (v38)
      {
        v39 = [v9 idsInfo];
        v40 = [v39 idsIdentifierString];
        [v5 setObject:v40 forKeyedSubscript:@"ids.identifier"];

        id v41 = NSNumber;
        uint64_t v42 = [v9 idsInfo];
        v43 = objc_msgSend(v41, "numberWithInt:", objc_msgSend(v42, "idsState"));
        [v5 setObject:v43 forKeyedSubscript:@"ids.state"];
      }
      if ([v9 hasManufacturer])
      {
        v44 = [v9 manufacturer];
        [v5 setObject:v44 forKeyedSubscript:@"dev.manufacturer"];
      }
      if ([v9 hasSerialNumber])
      {
        id v45 = [v9 serialNumber];
        [v5 setObject:v45 forKeyedSubscript:@"dev.serialNumber"];
      }
      if ([v9 hasModelIdentifier])
      {
        v46 = [v9 modelIdentifier];
        [v5 setObject:v46 forKeyedSubscript:@"dev.model"];
      }
      if ([v9 hasRegionInfo])
      {
        v47 = [v9 regionInfo];
        [v5 setObject:v47 forKeyedSubscript:@"dev.region"];
      }
      if ([v9 hasSoftwareVersion])
      {
        v48 = [v9 softwareVersion];
        [v5 setObject:v48 forKeyedSubscript:@"dev.software.version"];
      }
      if ([v9 hasSoftwareUpdateDescriptor])
      {
        id v49 = NSNumber;
        v50 = [v9 softwareUpdateDescriptor];
        v51 = objc_msgSend(v49, "numberWithLongLong:", objc_msgSend(v50, "status"));
        [v5 setObject:v51 forKeyedSubscript:@"dev.softwareUpdate.descriptor.status"];
      }
      if ([v9 hasSoftwareUpdateProgress])
      {
        v52 = NSNumber;
        v53 = [v9 softwareUpdateProgress];
        [v53 percentageComplete];
        v54 = objc_msgSend(v52, "numberWithFloat:");
        [v5 setObject:v54 forKeyedSubscript:@"dev.softwareUpdate.progress.percentageComplete"];
      }
      if ([v9 hasSfProblemFlags])
      {
        v55 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "sfProblemFlags"));
        [v5 setObject:v55 forKeyedSubscript:@"dev.sfProblemFlags"];
      }
      long long v224 = 0u;
      long long v225 = 0u;
      long long v222 = 0u;
      long long v223 = 0u;
      obuint64_t j = [v9 networkVisibleDeviceInfos];
      uint64_t v56 = [obj countByEnumeratingWithState:&v222 objects:v230 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = 0;
        uint64_t v59 = *(void *)v223;
        do
        {
          for (uint64_t i = 0; i != v57; ++i)
          {
            if (*(void *)v223 != v59) {
              objc_enumerationMutation(obj);
            }
            v61 = *(void **)(*((void *)&v222 + 1) + 8 * i);
            v62 = [v61 idsIdentifierString];

            if (v62)
            {
              v63 = NSString;
              v64 = [NSNumber numberWithUnsignedInteger:v58 + i];
              v65 = [v63 stringWithFormat:@"dev.networkVisibleDevice.%@.%@", v64, @"ids"];

              v66 = [v61 idsIdentifierString];
              [v205 setObject:v66 forKeyedSubscript:v65];
            }
            v67 = [v61 mediaRouteIdString];

            if (v67)
            {
              v68 = NSString;
              v69 = [NSNumber numberWithUnsignedInteger:v58 + i];
              v70 = [v68 stringWithFormat:@"dev.networkVisibleDevice.%@.%@", v69, @"mediaRouteID"];

              uint64_t v71 = [v61 mediaRouteIdString];
              [v205 setObject:v71 forKeyedSubscript:v70];
            }
          }
          v58 += i;
          uint64_t v57 = [obj countByEnumeratingWithState:&v222 objects:v230 count:16];
        }
        while (v57);
      }

      long long v220 = 0u;
      long long v221 = 0u;
      long long v218 = 0u;
      long long v219 = 0u;
      id obja = [v9 networkVisibleDeviceInfos];
      uint64_t v72 = [obja countByEnumeratingWithState:&v218 objects:v229 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        uint64_t v74 = 0;
        uint64_t v75 = *(void *)v219;
        do
        {
          for (uint64_t j = 0; j != v73; ++j)
          {
            if (*(void *)v219 != v75) {
              objc_enumerationMutation(obja);
            }
            id v77 = *(void **)(*((void *)&v218 + 1) + 8 * j);
            id v78 = [v77 idsIdentifierString];

            if (v78)
            {
              v79 = NSString;
              v80 = [NSNumber numberWithUnsignedInteger:v74 + j];
              v81 = [v79 stringWithFormat:@"dev.nearbyVisibleDevice.%@.%@", v80, @"ids"];

              uint64_t v82 = [v77 idsIdentifierString];
              [v205 setObject:v82 forKeyedSubscript:v81];
            }
            v83 = [v77 mediaRouteIdString];

            if (v83)
            {
              uint64_t v84 = NSString;
              v85 = [NSNumber numberWithUnsignedInteger:v74 + j];
              v86 = [v84 stringWithFormat:@"dev.nearbyVisibleDevice.%@.%@", v85, @"mediaRouteID"];

              v87 = [v77 mediaRouteIdString];
              [v205 setObject:v87 forKeyedSubscript:v86];
            }
          }
          v74 += j;
          uint64_t v73 = [obja countByEnumeratingWithState:&v218 objects:v229 count:16];
        }
        while (v73);
      }

      long long v216 = 0u;
      long long v217 = 0u;
      long long v214 = 0u;
      long long v215 = 0u;
      id objb = [v9 networkInfos];
      uint64_t v88 = [objb countByEnumeratingWithState:&v214 objects:v228 count:16];
      if (v88)
      {
        uint64_t v89 = v88;
        uint64_t v90 = *(void *)v215;
        do
        {
          uint64_t v91 = 0;
          id v199 = (id)v89;
          do
          {
            if (*(void *)v215 != v90) {
              objc_enumerationMutation(objb);
            }
            v92 = *(void **)(*((void *)&v214 + 1) + 8 * v91);
            v93 = [v92 ifaceName];

            if (v93)
            {
              v94 = [v92 ifaceName];
              v95 = [NSString stringWithFormat:@"dev.networkInfo.%@.%@", v94, @"name"];
              [v205 setObject:v94 forKeyedSubscript:v95];
              v96 = [v92 macAddress];

              if (v96)
              {
                uint64_t v97 = [NSString stringWithFormat:@"dev.networkInfo.%@.%@", v94, @"mac"];

                id v98 = [v92 macAddress];
                [v205 setObject:v98 forKeyedSubscript:v97];

                v95 = (void *)v97;
              }
              v99 = [v92 ipv4Addresses];
              uint64_t v100 = [v99 count];

              if (v100)
              {
                uint64_t v101 = [NSString stringWithFormat:@"dev.networkInfo.%@.%@", v94, @"ipv4"];

                v102 = [v92 ipv4Addresses];
                [v205 setObject:v102 forKeyedSubscript:v101];

                v95 = (void *)v101;
              }
              v103 = [v92 ipv6Addresses];
              uint64_t v104 = [v103 count];

              if (v104)
              {
                uint64_t v105 = [NSString stringWithFormat:@"dev.networkInfo.%@.%@", v94, @"ipv6"];

                v106 = [v92 ipv6Addresses];
                [v205 setObject:v106 forKeyedSubscript:v105];

                v95 = (void *)v105;
              }
              if ([v92 hasWifiInfo])
              {
                v107 = [NSString stringWithFormat:@"dev.networkInfo.%@.%@", v94, @"wifi.SSID"];

                uint64_t v108 = [v92 wifiInfo];
                v109 = [v108 ssid];
                [v205 setObject:v109 forKeyedSubscript:v107];

                v95 = [NSString stringWithFormat:@"dev.networkInfo.%@.%@", v94, @"wifi.BSSID"];

                id v110 = [v92 wifiInfo];
                v111 = [v110 bssid];
                uint64_t v89 = (uint64_t)v199;
                [v205 setObject:v111 forKeyedSubscript:v95];
              }
            }
            ++v91;
          }
          while (v89 != v91);
          uint64_t v89 = [objb countByEnumeratingWithState:&v214 objects:v228 count:16];
        }
        while (v89);
      }

      long long v212 = 0u;
      long long v213 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      id v200 = [v9 networkServiceInfos];
      uint64_t v112 = [v200 countByEnumeratingWithState:&v210 objects:v227 count:16];
      if (v112)
      {
        uint64_t v113 = v112;
        id objc = *(id *)v211;
        do
        {
          for (uint64_t k = 0; k != v113; ++k)
          {
            if (*(id *)v211 != objc) {
              objc_enumerationMutation(v200);
            }
            uint64_t v115 = *(void **)(*((void *)&v210 + 1) + 8 * k);
            v116 = [v115 ifaceName];

            if (v116)
            {
              uint64_t v117 = [v115 ifaceName];
              v118 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"name"];
              [v205 setObject:v117 forKeyedSubscript:v118];
              v119 = [v115 networkSignatureV4];

              if (v119)
              {
                uint64_t v120 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"NetSigV4"];

                v121 = [v115 networkSignatureV4];
                [v205 setObject:v121 forKeyedSubscript:v120];

                v118 = (void *)v120;
              }
              v122 = [v115 networkSignatureV6];

              if (v122)
              {
                uint64_t v123 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"netSigV6"];

                v124 = [v115 networkSignatureV6];
                [v205 setObject:v124 forKeyedSubscript:v123];

                v118 = (void *)v123;
              }
              v125 = [v115 routerIPv4];

              if (v125)
              {
                uint64_t v126 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"routerV4"];

                id v127 = [v115 routerIPv4];
                [v205 setObject:v127 forKeyedSubscript:v126];

                v118 = (void *)v126;
              }
              v128 = [v115 routerIPv6];

              if (v128)
              {
                uint64_t v129 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"routerV6"];

                id v130 = [v115 routerIPv6];
                [v205 setObject:v130 forKeyedSubscript:v129];

                v118 = (void *)v129;
              }
              v131 = [v115 ipv4Addresses];
              uint64_t v132 = [v131 count];

              if (v132)
              {
                uint64_t v133 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"ipv4"];

                v134 = [v115 ipv4Addresses];
                [v205 setObject:v134 forKeyedSubscript:v133];

                v118 = (void *)v133;
              }
              v135 = [v115 ipv6Addresses];
              uint64_t v136 = [v135 count];

              if (v136)
              {
                uint64_t v137 = [NSString stringWithFormat:@"dev.networkService.%@.%@", v117, @"ipv6"];

                v138 = [v115 ipv6Addresses];
                [v205 setObject:v138 forKeyedSubscript:v137];

                v118 = (void *)v137;
              }
            }
          }
          uint64_t v113 = [v200 countByEnumeratingWithState:&v210 objects:v227 count:16];
        }
        while (v113);
      }

      v139 = v9;
      v140 = [v9 eventRouterServerInfo];

      if (v140)
      {
        v141 = NSNumber;
        v142 = [v9 eventRouterServerInfo];
        v143 = objc_msgSend(v141, "numberWithInt:", objc_msgSend(v142, "mode"));
        [v205 setObject:v143 forKeyedSubscript:@"evtrouter.server.mode"];

        v144 = NSNumber;
        v145 = [v9 eventRouterServerInfo];
        v146 = objc_msgSend(v144, "numberWithInt:", objc_msgSend(v145, "connectionState"));
        [v205 setObject:v146 forKeyedSubscript:@"evtrouter.server.connectionState"];

        v147 = [v9 eventRouterServerInfo];
        LODWORD(v145) = [v147 hasLastConnected];

        if (v145)
        {
          v148 = (void *)MEMORY[0x263EFF910];
          v149 = [v9 eventRouterServerInfo];
          [v149 lastConnected];
          v150 = objc_msgSend(v148, "dateWithTimeIntervalSinceReferenceDate:");
          v151 = [v150 description];
          [v205 setObject:v151 forKeyedSubscript:@"evtrouter.server.lastConnected"];
        }
        v152 = [v9 eventRouterServerInfo];
        v153 = [v152 connectedClients];
        uint64_t v154 = [v153 count];

        if (v154)
        {
          long long v208 = 0u;
          long long v209 = 0u;
          long long v206 = 0u;
          long long v207 = 0u;
          v155 = [v9 eventRouterServerInfo];
          v156 = [v155 connectedClients];

          uint64_t v157 = [v156 countByEnumeratingWithState:&v206 objects:v226 count:16];
          if (v157)
          {
            uint64_t v158 = v157;
            uint64_t v159 = *(void *)v207;
            v160 = &stru_26E2EB898;
            do
            {
              uint64_t v161 = 0;
              v162 = v160;
              do
              {
                if (*(void *)v207 != v159) {
                  objc_enumerationMutation(v156);
                }
                v163 = [*(id *)(*((void *)&v206 + 1) + 8 * v161) connectedClientIdentifierString];
                v160 = [(__CFString *)v162 stringByAppendingFormat:@" %@", v163];

                ++v161;
                v162 = v160;
              }
              while (v158 != v161);
              uint64_t v158 = [v156 countByEnumeratingWithState:&v206 objects:v226 count:16];
            }
            while (v158);
          }
          else
          {
            v160 = &stru_26E2EB898;
          }

          [v205 setObject:v160 forKeyedSubscript:@"evtrouter.server.connectedClients"];
          v139 = v9;
        }
      }

      id v4 = v197;
      id v3 = v198;
    }
    if ([v4 hasLastSetupInfo])
    {
      v165 = [v4 lastSetupInfo];
      v166 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v165, "version"));
      [v205 setObject:v166 forKeyedSubscript:@"lastSetup.version"];

      v167 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "sessionSetupOpenMSHH1"));
      [v205 setObject:v167 forKeyedSubscript:@"lastSetup.sessionSetupOpenMSHH1"];

      v168 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "controllerKeyExchangeMSHH1"));
      [v205 setObject:v168 forKeyedSubscript:@"lastSetup.controllerKeyExchangeMSHH1"];

      v169 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "newAccessoryTransferMSHH1"));
      [v205 setObject:v169 forKeyedSubscript:@"lastSetup.newAccessoryTransferMSHH1"];

      v170 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "sessionSetupCloseMSHH1"));
      [v205 setObject:v170 forKeyedSubscript:@"lastSetup.sessionSetupCloseMSHH1"];

      v171 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "totalDurationMSHH1"));
      [v205 setObject:v171 forKeyedSubscript:@"lastSetup.totalDurationMSHH1"];

      v172 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "sentinelZoneFetchMSHH1"));
      [v205 setObject:v172 forKeyedSubscript:@"lastSetup.sentinelZoneFetchMSHH1"];

      v173 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "accountSettleWaitMSHH2"));
      [v205 setObject:v173 forKeyedSubscript:@"lastSetup.accountSettleWaitMSHH2"];

      v174 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "currentDeviceIDSWaitMSHH2"));
      [v205 setObject:v174 forKeyedSubscript:@"lastSetup.currentDeviceIDSWaitMSHH2"];

      v175 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "homeManagerReadyMSHH2"));
      [v205 setObject:v175 forKeyedSubscript:@"lastSetup.homeManagerReadyMSHH2"];

      v176 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "firstCoreDataImportMSHH2"));
      [v205 setObject:v176 forKeyedSubscript:@"lastSetup.firstCoreDataImportMSHH2"];

      v177 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "accessoryAddMSHH2"));
      [v205 setObject:v177 forKeyedSubscript:@"lastSetup.accessoryAddMSHH2"];

      v178 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "settingsCreationMSHH2"));
      [v205 setObject:v178 forKeyedSubscript:@"lastSetup.settingsCreationMSHH2"];

      v179 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "pairingIdentityCreationMSHH2"));
      [v205 setObject:v179 forKeyedSubscript:@"lastSetup.pairingIdentityCreationMSHH2"];

      v180 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "siriReadyMSHH2"));
      [v205 setObject:v180 forKeyedSubscript:@"lastSetup.siriReadyMSHH2"];

      v181 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "eventRouterServerConnectionMSHH2"));
      [v205 setObject:v181 forKeyedSubscript:@"lastSetup.eventRouterServerConnectionMSHH2"];

      v182 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "primaryResidentElectionMSHH2"));
      [v205 setObject:v182 forKeyedSubscript:@"lastSetup.primaryResidentElectionMSHH2"];

      v183 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "eventRouterFirstEventPushMSHH2"));
      [v205 setObject:v183 forKeyedSubscript:@"lastSetup.eventRouterFirstEventPushMSHH2"];

      v184 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "totalDurationMSHH2"));
      [v205 setObject:v184 forKeyedSubscript:@"lastSetup.totalDurationMSHH2"];

      v185 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v165, "iCloudAvailableINT"));
      [v205 setObject:v185 forKeyedSubscript:@"lastSetup.iCloudAvailableINT"];

      v186 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v165, "iDSAvailableINT"));
      [v205 setObject:v186 forKeyedSubscript:@"lastSetup.iDSAvailableINT"];

      v187 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v165, "manateeAvailableINT"));
      [v205 setObject:v187 forKeyedSubscript:@"lastSetup.manateeAvailableINT"];

      v188 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v165, "networkAvailableINT"));
      [v205 setObject:v188 forKeyedSubscript:@"lastSetup.networkAvailableINT"];

      v189 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "lastKnownStageErrorCode"));
      [v205 setObject:v189 forKeyedSubscript:@"lastSetup.lastKnownStageErrorCode"];

      v190 = [v165 lastKnownStageErrorDomain];
      [v205 setObject:v190 forKeyedSubscript:@"lastSetup.lastKnownStageErrorDomain"];

      v191 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v165, "lastKnownStageUnderlyingErrorCode"));
      [v205 setObject:v191 forKeyedSubscript:@"lastSetup.lastKnownStageUnderlyingErrorCode"];

      v192 = [v165 lastKnownStageUnderlyingErrorDomain];
      [v205 setObject:v192 forKeyedSubscript:@"lastSetup.lastKnownStageUnderlyingErrorDomain"];

      v193 = [v165 lastKnownStageErrorString];
      [v205 setObject:v193 forKeyedSubscript:@"lastSetup.lastKnownStageErrorString"];

      v194 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v165, "savedEventState"));
      [v205 setObject:v194 forKeyedSubscript:@"lastSetup.savedEventState"];
    }
    v164 = v205;
    [v205 setObject:@"false" forKeyedSubscript:@"isPrimaryResident"];
    if ([v4 hasPrimaryResidentDiagnosticInfo]) {
      [v205 setObject:@"true" forKeyedSubscript:@"isPrimaryResident"];
    }
  }
  else
  {
    v164 = 0;
  }
  v195 = (void *)[v164 copy];

  return v195;
}

@end