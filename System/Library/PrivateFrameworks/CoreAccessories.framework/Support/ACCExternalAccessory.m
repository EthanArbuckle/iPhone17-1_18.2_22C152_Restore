@interface ACCExternalAccessory
+ (id)accessoryDictionaryForLogging:(id)a3;
+ (unsigned)_generateLegacyIAPConnectionID;
- (ACCExternalAccessory)initWithEndpointUUIDs:(id)a3 primaryEndpointUUID:(id)a4;
- (BOOL)supportsMultipleSessionsPerProtocol;
- (NSArray)EAProtocolsAppMatching;
- (NSArray)endpointUUIDs;
- (NSData)EACertData;
- (NSData)EACertSerial;
- (NSDictionary)EAAccessoryDictionary;
- (NSDictionary)EAProtocols;
- (NSDictionary)vehicleInfoDictionary;
- (NSDictionary)vehicleStatus;
- (NSNumber)EAConnectionID;
- (NSNumber)EAProductID;
- (NSNumber)EATransportType;
- (NSNumber)EAVendorID;
- (NSString)EADockType;
- (NSString)EAFirmwareRevisionActive;
- (NSString)EAFirmwareRevisionPending;
- (NSString)EAHardwareRevision;
- (NSString)EAMACAddress;
- (NSString)EAManufacturer;
- (NSString)EAModelNumber;
- (NSString)EAName;
- (NSString)EAPPID;
- (NSString)EAPreferredApp;
- (NSString)EARegionCode;
- (NSString)EASerialNumber;
- (NSString)primaryEndpointUUID;
- (id)_nativeUSBEndpointUUIDForProtocolIdentifier:(id)a3 iAP2Endpoint:(id *)a4;
- (id)copyExternalAccessoryProtocols;
- (id)description;
- (id)externalAccessoryProtocolInformationForProtocolName:(id)a3;
- (unint64_t)destinationSharingOptions;
- (void)_addAccessoryInfo:(ACCEndpoint_s *)a3;
- (void)_addEAProtocolPrimaryEndpointInfo:(ACCEndpoint_s *)a3;
- (void)_addEAProtocolsForEAEndpoints:(id)a3;
- (void)_addiAP2AuthInfo:(id *)a3;
- (void)_addiAP2EAProtocols:(id *)a3;
- (void)_addiAP2IdentificationInfo:(id *)a3;
- (void)_addiAP2VehicleInfo:(id *)a3;
- (void)_constructEADictionary:(id)a3;
- (void)copyExternalAccessoryProtocols;
- (void)setDestinationSharingOptions:(unint64_t)a3;
- (void)setVehicleStatus:(id)a3;
- (void)updateAccessoryInfo;
@end

@implementation ACCExternalAccessory

- (ACCExternalAccessory)initWithEndpointUUIDs:(id)a3 primaryEndpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)ACCExternalAccessory;
  id v8 = [(ACCExternalAccessory *)&v33 init];
  if (v8)
  {
    id v9 = [v6 count];
    if (v7 || v9)
    {
      id v10 = [v6 copy];
      v11 = (void *)*((void *)v8 + 4);
      *((void *)v8 + 4) = v10;

      if (v7)
      {
        id v12 = v7;
      }
      else
      {
        id v12 = [v6 objectAtIndex:0];
      }
      v13 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v12;

      *((void *)v8 + 1) = 0;
      v14 = (void *)*((void *)v8 + 15);
      *((void *)v8 + 15) = 0;

      v15 = (void *)*((void *)v8 + 28);
      *((void *)v8 + 28) = 0;

      v16 = (void *)*((void *)v8 + 20);
      *((void *)v8 + 20) = 0;

      v17 = (void *)*((void *)v8 + 21);
      *((void *)v8 + 21) = 0;

      v18 = (void *)*((void *)v8 + 22);
      *((void *)v8 + 22) = 0;

      v19 = (void *)*((void *)v8 + 23);
      *((void *)v8 + 23) = 0;

      v20 = (void *)*((void *)v8 + 27);
      *((void *)v8 + 27) = 0;

      v21 = (void *)*((void *)v8 + 25);
      *((void *)v8 + 25) = 0;

      *((void *)v8 + 26) = 0;
      EndpointWithUUID = acc_manager_getEndpointWithUUID(*((const void **)v8 + 3));
      uint64_t ParentConnection = acc_endpoint_getParentConnection((uint64_t)EndpointWithUUID);
      if (EndpointWithUUID)
      {
        uint64_t v24 = ParentConnection;
        if (ParentConnection)
        {
          *((unsigned char *)v8 + 16) = 0;
          id v25 = [objc_alloc((Class)NSNumber) initWithInt:acc_endpoint_getTransportType((uint64_t)EndpointWithUUID)];
          v26 = (void *)*((void *)v8 + 17);
          *((void *)v8 + 17) = v25;

          if (*(_DWORD *)(v24 + 8) == 2)
          {
            if (*(void *)(v24 + 16))
            {
              id v27 = [objc_alloc((Class)NSString) initWithString:*(void *)(v24 + 16)];
              v28 = (void *)*((void *)v8 + 15);
              *((void *)v8 + 15) = v27;

              if (acc_policies_shouldOverrideNameOnAccessoryWithModelNumber(*((void *)v8 + 7)))
              {
                v29 = (void *)platform_bluetooth_copyNameForMacAddress(*(void *)(v24 + 16));
                v30 = v29;
                if (v29 && [v29 length]) {
                  objc_storeStrong((id *)v8 + 5, v30);
                }
              }
            }
          }
          switch(*((_DWORD *)EndpointWithUUID + 7))
          {
            case 1:
              [v8 _addAccessoryInfo:EndpointWithUUID];
              break;
            case 4:
              uint64_t v31 = EndpointWithUUID[7];
              if (v31)
              {
                [v8 _addAccessoryInfo:EndpointWithUUID];
                [v8 _addiAP2IdentificationInfo:v31];
                [v8 _addiAP2AuthInfo:v31];
                [v8 _addiAP2EAProtocols:v31];
              }
              break;
            case 5:
            case 7:
              [v8 _addEAProtocolPrimaryEndpointInfo:EndpointWithUUID];
              [v8 _addEAProtocolsForEAEndpoints:*((void *)v8 + 4)];
              break;
            default:
              break;
          }
          [v8 _constructEADictionary:*((void *)v8 + 3)];
        }
      }
    }
  }

  return (ACCExternalAccessory *)v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"ACCExternalAccessory<%@(%@) %@(%@) endpoints=%@>", self->_primaryEndpointUUID, self->_EAConnectionID, self->_EAName, self->_EAModelNumber, self->_endpointUUIDs];
}

- (void)updateAccessoryInfo
{
  v1 = [a1 EAAccessoryDictionary];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "Updating EADictionary... (old: %@)", v4, v5, v6, v7, v8);
}

- (id)externalAccessoryProtocolInformationForProtocolName:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(ACCExternalAccessory *)self EAProtocols];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (![v10 caseInsensitiveCompare:v4])
        {
          id v12 = [(ACCExternalAccessory *)self EAProtocols];
          v11 = [v12 objectForKey:v10];

          if (gLogObjects && gNumLogObjects >= 10)
          {
            v13 = *(id *)(gLogObjects + 72);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            v13 = &_os_log_default;
            id v14 = &_os_log_default;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[ACCExternalAccessory externalAccessoryProtocolInformationForProtocolName:]();
          }

          goto LABEL_19;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (id)copyExternalAccessoryProtocols
{
  uint64_t v3 = [(ACCExternalAccessory *)self EAProtocols];
  id v4 = [v3 allKeys];
  id v5 = [v4 copy];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 10;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    uint64_t v8 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(ACCExternalAccessory *)self copyExternalAccessoryProtocols];
  }

  return v5;
}

- (void)_addiAP2AuthInfo:(id *)a3
{
  if (iap2_feature_getFeature((uint64_t)a3, 0))
  {
    id v5 = (NSData *)iap2_accAuthentication_copyCertificate((uint64_t)a3);
    BOOL v6 = (NSData *)iap2_accAuthentication_copyCertificateSerial((uint64_t)a3);
    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v5 = 0;
    id v7 = 0;
  }
  EACertData = self->_EACertData;
  self->_EACertData = v5;
  id v10 = v5;

  EACertSerial = self->_EACertSerial;
  self->_EACertSerial = v7;
}

- (void)_addAccessoryInfo:(ACCEndpoint_s *)a3
{
  if (a3)
  {
    AccessoryInfo = (id *)acc_endpoint_getAccessoryInfo((uint64_t)a3);
    BOOL v6 = AccessoryInfo;
    if (AccessoryInfo && *AccessoryInfo)
    {
      id v61 = *AccessoryInfo;
    }
    else
    {
      acc_strings_placeholder_Unknown();
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6) {
        goto LABEL_8;
      }
    }
    id v7 = v6[1];
    if (v7)
    {
      id v60 = v7;
LABEL_9:
      id v8 = v6[2];
      if (v8)
      {
        id v59 = v8;
LABEL_12:
        id v9 = v6[3];
        if (v9)
        {
          id v58 = v9;
LABEL_15:
          id v10 = v6[4];
          if (v10)
          {
            id v11 = v10;
LABEL_18:
            id v12 = v6[5];
            if (v12)
            {
              id v13 = v12;
              goto LABEL_21;
            }
LABEL_20:
            acc_strings_placeholder_Unknown();
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            if (!v6)
            {
              id v15 = 0;
              id v14 = 0;
              id v16 = 0;
LABEL_22:
              id v17 = v16;
              long long v18 = acc_endpoint_copyProperties((pthread_mutex_t *)a3);
              if (v18)
              {
                long long v19 = v18;
                Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v18, kCFACCProperties_Endpoint_DockType);
                CFRelease(v19);
              }
              else
              {
                Value = 0;
              }
              v21 = &stru_10021CEF8;
              if (Value) {
                v21 = Value;
              }
              v22 = v21;
              if (!v6) {
                goto LABEL_58;
              }
              v23 = (NSString *)[v61 copy];
              EAName = self->_EAName;
              self->_EAName = v23;

              id v25 = (NSString *)[v60 copy];
              EAManufacturer = self->_EAManufacturer;
              self->_EAManufacturer = v25;

              id v27 = (NSString *)[v59 copy];
              EAModelNumber = self->_EAModelNumber;
              self->_EAModelNumber = v27;

              v29 = (NSString *)[v58 copy];
              EASerialNumber = self->_EASerialNumber;
              self->_EASerialNumber = v29;

              uint64_t v31 = (NSString *)[v11 copy];
              EAHardwareRevision = self->_EAHardwareRevision;
              self->_EAHardwareRevision = v31;

              objc_super v33 = (NSString *)[v13 copy];
              EAFirmwareRevisionActive = self->_EAFirmwareRevisionActive;
              self->_EAFirmwareRevisionActive = v33;

              if (v14)
              {
                v35 = (NSString *)[v14 copy];
                EAFirmwareRevisionPending = self->_EAFirmwareRevisionPending;
                self->_EAFirmwareRevisionPending = v35;
              }
              else
              {
                EAFirmwareRevisionPending = self->_EAFirmwareRevisionPending;
                self->_EAFirmwareRevisionPending = 0;
              }

              if (v15)
              {
                v37 = (NSString *)[v15 copy];
                EAPPID = self->_EAPPID;
                self->_EAPPID = v37;
              }
              else
              {
                EAPPID = self->_EAPPID;
                self->_EAPPID = 0;
              }

              if (v17)
              {
                v39 = (NSString *)[v17 copy];
                EARegionCode = self->_EARegionCode;
                self->_EARegionCode = v39;
              }
              else
              {
                EARegionCode = self->_EARegionCode;
                self->_EARegionCode = 0;
              }

              v41 = (NSString *)[(__CFString *)v22 copy];
              EADockType = self->_EADockType;
              self->_EADockType = v41;

              if (a3->var0) {
                v43 = acc_connection_copyProperty((char *)a3->var0, kCFACCProperties_Connection_HideFromUI);
              }
              else {
                v43 = 0;
              }
              unsigned int v44 = acc_policies_shouldHideAccessoryWithModelNumber((uint64_t)self->_EAModelNumber);
              if (v43) {
                int v45 = 1;
              }
              else {
                int v45 = v44;
              }
              if (v43)
              {
                CFRelease(v43);
              }
              else if (!v45)
              {
                goto LABEL_47;
              }
              self->_eaAccessoryCapabilities |= 0x100uLL;
LABEL_47:
              if (gLogObjects && gNumLogObjects >= 10)
              {
                v46 = *(id *)(gLogObjects + 72);
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  platform_connectionInfo_configStreamCategoryListReady_cold_1();
                }
                v46 = &_os_log_default;
                id v47 = &_os_log_default;
              }
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                v48 = self->_EAName;
                v49 = self->_EAManufacturer;
                v50 = self->_EAModelNumber;
                v51 = self->_EASerialNumber;
                v52 = self->_EAFirmwareRevisionActive;
                v53 = self->_EAFirmwareRevisionPending;
                v54 = self->_EAHardwareRevision;
                v55 = self->_EAPPID;
                v56 = self->_EARegionCode;
                v57 = "NO";
                if (v45) {
                  v57 = "YES";
                }
                *(_DWORD *)buf = 138414594;
                v63 = v48;
                __int16 v64 = 2112;
                v65 = v50;
                __int16 v66 = 2112;
                v67 = v49;
                __int16 v68 = 2112;
                v69 = v51;
                __int16 v70 = 2112;
                v71 = v52;
                __int16 v72 = 2112;
                v73 = v53;
                __int16 v74 = 2112;
                v75 = v54;
                __int16 v76 = 2112;
                v77 = v55;
                __int16 v78 = 2112;
                v79 = v56;
                __int16 v80 = 2080;
                v81 = v57;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Adding accessory info: name %@, model %@, manufacturer %@, serial %@, firmware revision (active) %@, firmware revision (pending) %@, hardware revision %@, ppid %@, regionCode %@, hideFromUI: %s", buf, 0x66u);
              }

LABEL_58:
              return;
            }
LABEL_21:
            id v14 = v6[6];
            id v15 = v6[7];
            id v16 = v6[9];
            goto LABEL_22;
          }
LABEL_17:
          acc_strings_placeholder_Unknown();
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          if (!v6) {
            goto LABEL_20;
          }
          goto LABEL_18;
        }
LABEL_14:
        acc_strings_placeholder_Unknown();
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        if (!v6) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
LABEL_11:
      acc_strings_placeholder_Unknown();
      id v59 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
LABEL_8:
    acc_strings_placeholder_Unknown();
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
}

- (void)_addiAP2IdentificationInfo:(id *)a3
{
  if (!a3) {
    return;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding iAP2 identification info...", v14, 2u);
  }

  if ((iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0x15u) & 1) != 0
    || iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 3u))
  {
    self->_eaAccessoryCapabilities |= 2uLL;
  }
  if (iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0x17u)) {
    self->_eaAccessoryCapabilities |= 0x20000uLL;
  }
  if (iap2_identification_isIdentifiedForCarPlay((uint64_t)a3)) {
    self->_eaAccessoryCapabilities |= 0x400uLL;
  }
  if (iap2_identification_isIdentifiedForWirelessCarPlay((uint64_t)a3)) {
    self->_eaAccessoryCapabilities |= 0x1000uLL;
  }
  if (iap2_identification_isIdentifiedForUSBCarPlay((uint64_t)a3)) {
    self->_eaAccessoryCapabilities |= 0x4000uLL;
  }
  int isIdentifiedForIncomingMessageID = iap2_identification_isIdentifiedForIncomingMessageID((uint64_t)a3, 59907);
  unint64_t eaAccessoryCapabilities = self->_eaAccessoryCapabilities;
  if (isIdentifiedForIncomingMessageID)
  {
    self->_unint64_t eaAccessoryCapabilities = eaAccessoryCapabilities | 0x10000;
LABEL_26:
    self->_supportsMultipleSessionsPerProtocol = 1;
    goto LABEL_27;
  }
  if ((eaAccessoryCapabilities & 0x10000) != 0) {
    goto LABEL_26;
  }
LABEL_27:
  int isIdentifiedForThemeAssets = iap2_identification_isIdentifiedForThemeAssets((uint64_t)a3);
  unint64_t v11 = self->_eaAccessoryCapabilities;
  if (isIdentifiedForThemeAssets)
  {
    v11 |= 0x200000uLL;
    self->_unint64_t eaAccessoryCapabilities = v11;
  }
  if ((v11 & 0x400) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.carplay-attached", 0, 0, 1u);
  }
  if (iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0xCu)) {
    self->_eaAccessoryCapabilities |= 8uLL;
  }
  if (iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0xFu)) {
    self->_eaAccessoryCapabilities |= 0x2000uLL;
  }
  if (iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0x18u))
  {
    unint64_t v13 = self->_eaAccessoryCapabilities;
    if ((v13 & 0x400) != 0) {
      self->_unint64_t eaAccessoryCapabilities = v13 | 0x40000;
    }
  }
  if (iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0x19u)) {
    self->_eaAccessoryCapabilities |= 0x80000uLL;
  }
  if (iap2_identification_isIdentifiedForFeature((const __CFSet *)a3, 0x1Au)) {
    self->_eaAccessoryCapabilities |= 0x100000uLL;
  }
  [(ACCExternalAccessory *)self _addiAP2VehicleInfo:a3];
}

- (void)_addiAP2EAProtocols:(id *)a3
{
  uint64_t v3 = a3;
  Feature = (void *)iap2_feature_getFeature((uint64_t)a3, 0xAu);
  if (!Feature) {
    return;
  }
  id v6 = Feature;
  id v7 = &ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate_ptr;
  if (*Feature)
  {
    id v8 = (NSString *)[objc_alloc((Class)NSString) initWithString:*Feature];
    EAPreferredApp = self->_EAPreferredApp;
    self->_EAPreferredApp = v8;
  }
  if (!v6[1]) {
    return;
  }
  id obj = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = +[NSMutableArray array];
  CFIndex Count = CFArrayGetCount((CFArrayRef)v6[1]);
  if (Count < 1) {
    goto LABEL_51;
  }
  v42 = v10;
  v43 = self;
  CFIndex v11 = 0;
  char v44 = 0;
  uint64_t v47 = kACCExternalAccessoryMatchActionKey;
  uint64_t v48 = kACCExternalAccessoryProtocolIndexKey;
  uint64_t v54 = kACCExternalAccessoryProtocolTypeKey;
  uint64_t v46 = kACCExternalAccessorySessionUsesSocketInterfaceKey;
  uint64_t v45 = kACCExternalAccessoryProtocolEndpointUUIDKey;
  v52 = v3;
  v49 = v6;
  do
  {
    id v12 = +[NSMutableDictionary dictionary];
    ValueAtIndex = (unsigned __int16 *)CFArrayGetValueAtIndex((CFArrayRef)v6[1], v11);
    id v14 = +[NSNumber numberWithUnsignedInteger:*ValueAtIndex];
    [v12 setObject:v14 forKey:v48];
    id v15 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)ValueAtIndex + 4)];
    [v12 setObject:v15 forKey:v47];
    id v16 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)ValueAtIndex + 6)];
    [v12 setObject:v16 forKey:v54];
    id v17 = [v7[492] stringWithString:*((void *)ValueAtIndex + 1)];
    [obj setObject:v12 forKey:v17];
    if (v3->var0->var3 != 8)
    {
      var1 = v3->var1;
LABEL_32:
      id v23 = [(__CFString *)var1 copy];
      goto LABEL_33;
    }
    uint64_t v18 = [(ACCExternalAccessory *)v43 _nativeUSBEndpointUUIDForProtocolIdentifier:v17 iAP2Endpoint:v3];
    uint64_t v19 = gLogObjects;
    int v20 = gNumLogObjects;
    if (gLogObjects) {
      BOOL v21 = gNumLogObjects <= 9;
    }
    else {
      BOOL v21 = 1;
    }
    int v22 = !v21;
    if (!v18)
    {
      if (v22)
      {
        v26 = *(id *)(gLogObjects + 72);
      }
      else
      {
        v26 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v58 = v19;
          __int16 v59 = 1024;
          LODWORD(v60) = v20;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v31 = &_os_log_default;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        [(ACCExternalAccessory *)&v55 _addiAP2EAProtocols:v26];
      }

      var1 = v52->var1;
      goto LABEL_32;
    }
    id v23 = (id)v18;
    if (v22)
    {
      uint64_t v24 = *(id *)(gLogObjects + 72);
    }
    else
    {
      CFIndex v53 = v11;
      id v27 = ValueAtIndex;
      v28 = (void *)v18;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v58 = v19;
        __int16 v59 = 1024;
        LODWORD(v60) = v20;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      id v29 = &_os_log_default;
      uint64_t v24 = &_os_log_default;
      id v23 = v28;
      ValueAtIndex = v27;
      CFIndex v11 = v53;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v58 = (uint64_t)v23;
      __int16 v59 = 2112;
      id v60 = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Found native EA USB endpoint %@ protocol for string %@", buf, 0x16u);
    }

    v30 = +[NSNumber numberWithUnsignedInt:2];
    [v12 setObject:v30 forKey:v54];

LABEL_33:
    uint64_t v32 = gLogObjects;
    int v33 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v34 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v58 = v32;
        __int16 v59 = 1024;
        LODWORD(v60) = v33;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      id v35 = &_os_log_default;
      v34 = &_os_log_default;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "iAP2 EA uses the socket interface by default", buf, 2u);
    }

    v36 = +[NSNumber numberWithBool:1];
    [v12 setObject:v36 forKey:v46];

    [v12 setObject:v23 forKey:v45];
    int v37 = *((_DWORD *)ValueAtIndex + 4);
    if (v37 == 3) {
      goto LABEL_44;
    }
    if (v37 != 2)
    {
      if (v37 != 1) {
        goto LABEL_46;
      }
LABEL_44:
      [v42 addObject:v17];
    }
    char v44 = 1;
LABEL_46:

    ++v11;
    id v6 = v49;
    uint64_t v3 = v52;
    id v7 = &ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate_ptr;
  }
  while (Count != v11);
  id v10 = v42;
  self = v43;
  if (v44)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v38 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v38 = &_os_log_default;
      id v41 = &_os_log_default;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "accessory supports public iAP", buf, 2u);
    }

    v43->_eaAccessoryCapabilities |= 1uLL;
    goto LABEL_66;
  }
LABEL_51:
  if (gLogObjects && gNumLogObjects >= 10)
  {
    v39 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v39 = &_os_log_default;
    id v40 = &_os_log_default;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "accessory doesn't support public iAP", buf, 2u);
  }

LABEL_66:
  objc_storeStrong((id *)&self->_EAProtocols, obj);
  if ([v10 count]) {
    objc_storeStrong((id *)&self->_EAProtocolsAppMatching, v10);
  }
}

- (void)_addiAP2VehicleInfo:(id *)a3
{
  uint64_t Feature = iap2_feature_getFeature((uint64_t)a3, 0x14u);
  if (Feature)
  {
    uint64_t v5 = Feature;
    id v6 = +[NSMutableDictionary dictionary];
    id v7 = *(void **)(v5 + 24);
    if (v7)
    {
      id v8 = [v7 copy];
      [v6 setObject:v8 forKey:kACCVehicleInfoDisplayNameKey];
    }
    id v9 = *(void **)(v5 + 32);
    if (v9)
    {
      id v10 = [v9 copy];
      [v6 setObject:v10 forKey:kACCVehicleInfoMapsDisplayNameKey];
    }
    CFIndex v11 = *(void **)(v5 + 16);
    if (v11)
    {
      id v12 = v11;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v13)
      {
        id v14 = v13;
        LODWORD(v15) = 0;
        uint64_t v16 = *(void *)v48;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v48 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v15 = (1 << (char)[*(id *)(*((void *)&v47 + 1) + 8 * i) unsignedIntValue]) | v15;
          }
          id v14 = [v12 countByEnumeratingWithState:&v47 objects:v54 count:16];
        }
        while (v14);
      }
      else
      {
        uint64_t v15 = 0;
      }
      uint64_t v18 = +[NSNumber numberWithUnsignedInt:v15];
      [v6 setObject:v18 forKey:kACCVehicleInfoEngineTypeBitmaskKey];
    }
    uint64_t v19 = *(void **)(v5 + 40);
    if (v19)
    {
      id v20 = [v19 copy];
      [v6 setObject:v20 forKey:kACCVehicleInfoVehicleColorHexCodeKey];
    }
    BOOL v21 = *(void **)(v5 + 48);
    if (v21)
    {
      id v22 = v21;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = [v22 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = 0;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v22);
            }
            v25 |= 1 << (char)[*(id *)(*((void *)&v43 + 1) + 8 * (void)j) unsignedLongLongValue];
          }
          id v24 = [v22 countByEnumeratingWithState:&v43 objects:v53 count:16];
        }
        while (v24);
      }
      else
      {
        uint64_t v25 = 0;
      }
      v28 = +[NSNumber numberWithUnsignedLongLong:v25];
      [v6 setObject:v28 forKey:kACCVehicleInfoSupportedChargingConnectorsBitMaskKey];
    }
    if (*(_DWORD *)(v5 + 56))
    {
      id v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v29 forKey:kACCVehicleInfoPowerForConnectorTypeCCS1Key];
    }
    if (*(_DWORD *)(v5 + 60))
    {
      v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v30 forKey:kACCVehicleInfoPowerForConnectorTypeCCS2Key];
    }
    if (*(_DWORD *)(v5 + 64))
    {
      id v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v31 forKey:kACCVehicleInfoPowerForConnectorTypeJ1772Key];
    }
    if (*(_DWORD *)(v5 + 68))
    {
      uint64_t v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v32 forKey:kACCVehicleInfoPowerForConnectorTypeCHAdeMOKey];
    }
    if (*(_DWORD *)(v5 + 72))
    {
      int v33 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v33 forKey:kACCVehicleInfoPowerForConnectorTypeMennekesKey];
    }
    if (*(_DWORD *)(v5 + 76))
    {
      v34 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v34 forKey:kACCVehicleInfoPowerForConnectorTypeGBT_DCKey];
    }
    if (*(_DWORD *)(v5 + 80))
    {
      id v35 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v35 forKey:kACCVehicleInfoPowerForConnectorTypeGBT_ACKey];
    }
    if (*(_DWORD *)(v5 + 84))
    {
      v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v36 forKey:kACCVehicleInfoPowerForConnectorTypeTeslaKey];

      int v37 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v5 + 88)];
      [v6 setObject:v37 forKey:kACCVehicleInfoPowerForConnectorTypeNACS_DCKey];
    }
    if (*(_DWORD *)(v5 + 92))
    {
      v38 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v6 setObject:v38 forKey:kACCVehicleInfoPowerForConnectorTypeNACS_ACKey];
    }
    p_vehicleInfoDictionary = &self->_vehicleInfoDictionary;
    objc_storeStrong((id *)p_vehicleInfoDictionary, v6);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v40 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v40 = &_os_log_default;
      id v41 = &_os_log_default;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *p_vehicleInfoDictionary;
      *(_DWORD *)buf = 138412290;
      v52 = v42;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "iAP2 vehicle info is %@", buf, 0xCu);
    }
  }
}

- (id)_nativeUSBEndpointUUIDForProtocolIdentifier:(id)a3 iAP2Endpoint:(id *)a4
{
  id v5 = a3;
  id v6 = acc_manager_copyConnectionUUIDForEndpointUUID(a4->var1);
  ConnectionWithUUID = acc_manager_getConnectionWithUUID(v6);
  CFDictionaryRef CreationTimestampMS = (const __CFDictionary *)acc_endpoint_getCreationTimestampMS((uint64_t)ConnectionWithUUID);
  CFIndex Count = CFDictionaryGetCount(CreationTimestampMS);
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 9;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (Count >= 1)
  {
    uint64_t v12 = Count;
    if (v11)
    {
      id v13 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v13 = &_os_log_default;
      id v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Have %ld endpoints to parse", buf, 0xCu);
    }

    v28[1] = v28;
    __chkstk_darwin(v16);
    uint64_t v18 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v18, 170, v17);
    CFDictionaryGetKeysAndValues(CreationTimestampMS, (const void **)v18, 0);
    uint64_t v19 = 0;
    id v20 = 0;
    unsigned int v21 = 1;
    while (1)
    {
      id v22 = *(id *)&v18[8 * v19];
      EndpointWithUUID = acc_manager_getEndpointWithUUID(v22);
      if (EndpointWithUUID[7] == 6) {
        break;
      }
LABEL_23:

      uint64_t v19 = v21;
      BOOL v10 = v12 <= v21++;
      if (v10) {
        goto LABEL_34;
      }
    }
    id v24 = (id)acc_endpoint_copyIdentifier((uint64_t)EndpointWithUUID);
    NSLog(@"found EANative endpointUUID %@, identifier %@", v22, v24);
    if ([v24 caseInsensitiveCompare:v5])
    {
      if (!v24)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      id v25 = [v22 copy];

      id v20 = v25;
      if (!v24) {
        goto LABEL_22;
      }
    }
    CFRelease(v24);
    goto LABEL_22;
  }
  if (v11)
  {
    id v14 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v14 = &_os_log_default;
    id v26 = &_os_log_default;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No native USB endpoints found!", buf, 2u);
  }

  id v20 = 0;
LABEL_34:

  return v20;
}

- (void)_addEAProtocolPrimaryEndpointInfo:(ACCEndpoint_s *)a3
{
  AccessoryInfo = (id *)acc_endpoint_getAccessoryInfo((uint64_t)a3);
  id v6 = AccessoryInfo;
  if (AccessoryInfo && *AccessoryInfo)
  {
    id v41 = *AccessoryInfo;
  }
  else
  {
    acc_strings_placeholder_Unknown();
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      goto LABEL_7;
    }
  }
  id v7 = v6[1];
  if (v7)
  {
    id v8 = v7;
    goto LABEL_8;
  }
LABEL_7:
  acc_strings_placeholder_Unknown();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_10;
  }
LABEL_8:
  id v9 = v6[2];
  if (!v9)
  {
LABEL_10:
    acc_strings_placeholder_Unknown();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v10 = v9;
LABEL_11:
  id v11 = v6[3];
  if (v11)
  {
    id v12 = v11;
    goto LABEL_14;
  }
LABEL_13:
  acc_strings_placeholder_Unknown();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_16;
  }
LABEL_14:
  id v13 = v6[4];
  if (!v13)
  {
LABEL_16:
    acc_strings_placeholder_Unknown();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v14 = v13;
LABEL_17:
  id v15 = v6[5];
  if (v15)
  {
    id v16 = v15;
LABEL_20:
    id v17 = v6[6];
    id v18 = v6[7];
    id v19 = v6[9];
    goto LABEL_21;
  }
LABEL_19:
  acc_strings_placeholder_Unknown();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_20;
  }
  id v18 = 0;
  id v17 = 0;
  id v19 = 0;
LABEL_21:
  id v20 = v19;
  unsigned int v21 = (NSString *)[v41 copy];
  EAName = self->_EAName;
  self->_EAName = v21;

  id v23 = (NSString *)[v8 copy];
  EAManufacturer = self->_EAManufacturer;
  self->_EAManufacturer = v23;

  id v25 = (NSString *)[v10 copy];
  EAModelNumber = self->_EAModelNumber;
  self->_EAModelNumber = v25;

  id v27 = (NSString *)[v12 copy];
  EASerialNumber = self->_EASerialNumber;
  self->_EASerialNumber = v27;

  id v29 = (NSString *)[v14 copy];
  EAHardwareRevision = self->_EAHardwareRevision;
  self->_EAHardwareRevision = v29;

  id v31 = (NSString *)[v16 copy];
  EAFirmwareRevisionActive = self->_EAFirmwareRevisionActive;
  self->_EAFirmwareRevisionActive = v31;

  if (v17)
  {
    int v33 = (NSString *)[v17 copy];
    EAFirmwareRevisionPending = self->_EAFirmwareRevisionPending;
    self->_EAFirmwareRevisionPending = v33;
  }
  else
  {
    EAFirmwareRevisionPending = self->_EAFirmwareRevisionPending;
    self->_EAFirmwareRevisionPending = 0;
  }

  if (v18)
  {
    id v35 = (NSString *)[v18 copy];
    EAPPID = self->_EAPPID;
    self->_EAPPID = v35;
  }
  else
  {
    EAPPID = self->_EAPPID;
    self->_EAPPID = 0;
  }

  if (v20)
  {
    int v37 = (NSString *)[v20 copy];
    EARegionCode = self->_EARegionCode;
    self->_EARegionCode = v37;
  }
  else
  {
    EARegionCode = self->_EARegionCode;
    self->_EARegionCode = 0;
  }

  EADockType = self->_EADockType;
  self->_EADockType = (NSString *)&stru_10021CEF8;

  self->_eaAccessoryCapabilities |= 1uLL;
  if (a3->var0) {
    id v40 = acc_connection_copyProperty((char *)a3->var0, kCFACCProperties_Connection_HideFromUI);
  }
  else {
    id v40 = 0;
  }
  if ((acc_policies_shouldHideAccessoryWithModelNumber((uint64_t)self->_EAModelNumber) & 1) != 0 || v40)
  {
    self->_eaAccessoryCapabilities |= 0x100uLL;
    if (v40) {
      CFRelease(v40);
    }
  }
}

- (void)_addEAProtocolsForEAEndpoints:(id)a3
{
  id v3 = a3;
  id v29 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    unsigned int v6 = 0;
    uint64_t v30 = *(void *)v32;
    uint64_t v28 = kACCExternalAccessoryProtocolIndexKey;
    uint64_t v27 = kACCExternalAccessoryProtocolTypeKey;
    uint64_t v24 = kACCExternalAccessoryProtocolFirmwareVersionActiveKey;
    uint64_t v23 = kACCExternalAccessoryProtocolFirmwareVersionPendingKey;
    uint64_t v26 = kACCExternalAccessoryProtocolEndpointUUIDKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        EndpointWithUUID = acc_manager_getEndpointWithUUID(v8);
        CFTypeRef v10 = acc_endpoint_copyIdentifier((uint64_t)EndpointWithUUID);
        if (v10)
        {
          id v11 = v10;
          id v12 = +[NSMutableDictionary dictionary];
          id v13 = +[NSNumber numberWithUnsignedInteger:v6];
          [v12 setObject:v13 forKey:v28];
          id v14 = +[NSNumber numberWithUnsignedInt:1];
          [v12 setObject:v14 forKey:v27];
          if (EndpointWithUUID)
          {
            uint64_t AccessoryInfo = acc_endpoint_getAccessoryInfo((uint64_t)EndpointWithUUID);
            if (AccessoryInfo)
            {
              uint64_t v16 = AccessoryInfo;
              id v17 = (void *)acc_accInfo_retainedProperty(AccessoryInfo, 5, 0);
              if (v17) {
                [v12 setObject:v17 forKey:v24];
              }
              id v18 = (void *)acc_accInfo_retainedProperty(v16, 6, 0);
              if (v18) {
                [v12 setObject:v18 forKey:v23];
              }
            }
          }
          ++v6;
          id v19 = +[NSString stringWithString:v11];
          CFRelease(v11);
          id v20 = [v8 copy];
          [v12 setObject:v20 forKey:v26];

          [(NSDictionary *)v29 setObject:v12 forKey:v19];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }

  EAProtocols = self->_EAProtocols;
  self->_EAProtocols = v29;
}

- (void)_constructEADictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v6 = [(ACCExternalAccessory *)self EAName];
  if (v6)
  {
    [v5 setObject:v6 forKey:kACCExternalAccessoryNameKey];
  }
  else
  {
    id v7 = +[NSNull null];
    [v5 setObject:v7 forKey:kACCExternalAccessoryNameKey];
  }
  id v8 = [(ACCExternalAccessory *)self EAManufacturer];
  if (v8)
  {
    [v5 setObject:v8 forKey:kACCExternalAccessoryManufacturerKey];
  }
  else
  {
    id v9 = +[NSNull null];
    [v5 setObject:v9 forKey:kACCExternalAccessoryManufacturerKey];
  }
  CFTypeRef v10 = [(ACCExternalAccessory *)self EAModelNumber];
  if (v10)
  {
    [v5 setObject:v10 forKey:kACCExternalAccessoryModelNumberKey];
  }
  else
  {
    id v11 = +[NSNull null];
    [v5 setObject:v11 forKey:kACCExternalAccessoryModelNumberKey];
  }
  id v12 = [(ACCExternalAccessory *)self EASerialNumber];
  if (v12)
  {
    [v5 setObject:v12 forKey:kACCExternalAccessorySerialNumberKey];
  }
  else
  {
    id v13 = +[NSNull null];
    [v5 setObject:v13 forKey:kACCExternalAccessorySerialNumberKey];
  }
  id v14 = [(ACCExternalAccessory *)self EAFirmwareRevisionActive];
  if (v14)
  {
    [v5 setObject:v14 forKey:kACCExternalAccessoryFirmwareRevisionActiveKey];
  }
  else
  {
    id v15 = +[NSNull null];
    [v5 setObject:v15 forKey:kACCExternalAccessoryFirmwareRevisionActiveKey];
  }
  uint64_t v16 = [(ACCExternalAccessory *)self EAFirmwareRevisionPending];
  if (v16)
  {
    [v5 setObject:v16 forKey:kACCExternalAccessoryFirmwareRevisionPendingKey];
  }
  else
  {
    id v17 = +[NSNull null];
    [v5 setObject:v17 forKey:kACCExternalAccessoryFirmwareRevisionPendingKey];
  }
  id v18 = [(ACCExternalAccessory *)self EAHardwareRevision];
  if (v18)
  {
    [v5 setObject:v18 forKey:kACCExternalAccessoryHardwareRevisionKey];
  }
  else
  {
    id v19 = +[NSNull null];
    [v5 setObject:v19 forKey:kACCExternalAccessoryHardwareRevisionKey];
  }
  id v20 = [(ACCExternalAccessory *)self EAPPID];
  if (v20)
  {
    [v5 setObject:v20 forKey:kACCExternalAccessoryPPIDKey];
  }
  else
  {
    unsigned int v21 = +[NSNull null];
    [v5 setObject:v21 forKey:kACCExternalAccessoryPPIDKey];
  }
  id v22 = [(ACCExternalAccessory *)self EARegionCode];
  if (v22)
  {
    [v5 setObject:v22 forKey:kACCExternalAccessoryRegionCodeKey];
  }
  else
  {
    uint64_t v23 = +[NSNull null];
    [v5 setObject:v23 forKey:kACCExternalAccessoryRegionCodeKey];
  }
  uint64_t v24 = [(ACCExternalAccessory *)self EAVendorID];
  if (v24)
  {
    [v5 setObject:v24 forKey:kACCExternalAccessoryVendorIDKey];
  }
  else
  {
    id v25 = +[NSNull null];
    [v5 setObject:v25 forKey:kACCExternalAccessoryVendorIDKey];
  }
  uint64_t v26 = [(ACCExternalAccessory *)self EAProductID];
  if (v26)
  {
    [v5 setObject:v26 forKey:kACCExternalAccessoryProductIDKey];
  }
  else
  {
    uint64_t v27 = +[NSNull null];
    [v5 setObject:v27 forKey:kACCExternalAccessoryProductIDKey];
  }
  uint64_t v28 = [(ACCExternalAccessory *)self EADockType];
  if (v28)
  {
    [v5 setObject:v28 forKey:kACCExternalAccessoryDockTypeKey];
  }
  else
  {
    id v29 = +[NSNull null];
    [v5 setObject:v29 forKey:kACCExternalAccessoryDockTypeKey];
  }
  uint64_t v30 = [(ACCExternalAccessory *)self EATransportType];
  if (v30)
  {
    [v5 setObject:v30 forKey:kACCExternalAccessoryTransportType];
  }
  else
  {
    long long v31 = +[NSNull null];
    [v5 setObject:v31 forKey:kACCExternalAccessoryTransportType];
  }
  long long v32 = [(ACCExternalAccessory *)self primaryEndpointUUID];
  if (v32)
  {
    [v5 setObject:v32 forKey:kACCExternalAccessoryPrimaryUUID];
  }
  else
  {
    long long v33 = +[NSNull null];
    [v5 setObject:v33 forKey:kACCExternalAccessoryPrimaryUUID];
  }
  long long v34 = +[NSNumber numberWithUnsignedLongLong:self->_eaAccessoryCapabilities];
  [v5 setObject:v34 forKey:kACCExternalAccessoryCapabilitiesKey];

  id v35 = [(ACCExternalAccessory *)self EACertSerial];

  if (v35)
  {
    v36 = [(ACCExternalAccessory *)self EACertSerial];
    [v5 setObject:v36 forKey:kACCExternalAccessoryCertSerialNumberKey];
  }
  int v37 = [(ACCExternalAccessory *)self EACertData];

  if (v37)
  {
    v38 = [(ACCExternalAccessory *)self EACertData];
    [v5 setObject:v38 forKey:kACCExternalAccessoryCertDataKey];
  }
  if (self->_EAMACAddress)
  {
    v39 = [(ACCExternalAccessory *)self EAMACAddress];
    [v5 setObject:v39 forKey:kACCExternalAccessoryMacAddressKey];
  }
  unint64_t eaAccessoryCapabilities = self->_eaAccessoryCapabilities;
  if ((eaAccessoryCapabilities & 8) != 0)
  {
    id v41 = +[NSNumber numberWithUnsignedInt:platform_location_getSupportedNMEASentences()];
    [v5 setObject:v41 forKey:kACCExternalAccessoryLocationSentenceTypesKey];

    unint64_t eaAccessoryCapabilities = self->_eaAccessoryCapabilities;
  }
  if ((eaAccessoryCapabilities & 0x20000) != 0)
  {
    v42 = +[NSNumber numberWithBool:1];
    [v5 setObject:v42 forKey:kACCExternalAccessoryDestinationSharingKey];

    long long v43 = +[NSNumber numberWithUnsignedLongLong:self->_destinationSharingOptions];
    [v5 setObject:v43 forKey:kACCDestinationSharingOptionsKey];
  }
  if (self->_EAProtocols)
  {
    v73 = +[NSMutableDictionary dictionary];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      long long v44 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      long long v44 = &_os_log_default;
      id v45 = &_os_log_default;
    }
    id v71 = v5;
    id v72 = v4;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessory _constructEADictionary:].cold.7(self);
    }

    long long v46 = +[NSMutableDictionary dictionary];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v47 = [(ACCExternalAccessory *)self EAProtocols];
    id v48 = [v47 countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v75;
      uint64_t v51 = kACCExternalAccessoryProtocolIndexKey;
      do
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v75 != v50) {
            objc_enumerationMutation(v47);
          }
          id v53 = *(id *)(*((void *)&v74 + 1) + 8 * i);
          [(ACCExternalAccessory *)self EAProtocols];
          v55 = uint64_t v54 = self;
          v56 = [v55 objectForKey:v53];

          v57 = [v56 objectForKey:v51];
          [v73 setObject:v57 forKey:v53];

          self = v54;
          [v46 setObject:v56 forKey:v53];
        }
        id v49 = [v47 countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v49);
    }

    if (gLogObjects && gNumLogObjects >= 10)
    {
      uint64_t v58 = *(id *)(gLogObjects + 72);
      id v5 = v71;
      id v4 = v72;
    }
    else
    {
      id v5 = v71;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v58 = &_os_log_default;
      id v59 = &_os_log_default;
      id v4 = v72;
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessory _constructEADictionary:].cold.5();
    }

    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v60 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v60 = &_os_log_default;
      id v61 = &_os_log_default;
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessory _constructEADictionary:]();
    }

    [v5 setObject:v73 forKey:kACCExternalAccessoryProtocolsKey];
    [v5 setObject:v46 forKey:kACCExternalAccessoryProtocolDetailsKey];
  }
  if (self->_EAPreferredApp)
  {
    v62 = [(ACCExternalAccessory *)self EAPreferredApp];
    id v63 = [v62 copy];
    [v5 setObject:v63 forKey:kACCExternalAccessoryPreferredAppKey];
  }
  vehicleInfoDictionary = self->_vehicleInfoDictionary;
  if (vehicleInfoDictionary) {
    [v5 setObject:vehicleInfoDictionary forKey:kACCVehicleInfoLegacyInitialDataKey];
  }
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[ACCExternalAccessory _generateLegacyIAPConnectionID]);
  v65 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  EAConnectionID = self->_EAConnectionID;
  self->_EAConnectionID = v65;

  v67 = [(ACCExternalAccessory *)self EAConnectionID];
  id v68 = [v67 copy];
  [v5 setObject:v68 forKey:kACCExternalAccessoryLegacyConnectionIDKey];

  objc_storeStrong((id *)&self->_EAAccessoryDictionary, v5);
  if (gLogObjects && gNumLogObjects >= 10)
  {
    v69 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v69 = &_os_log_default;
    id v70 = &_os_log_default;
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessory _constructEADictionary:](self);
  }
}

+ (unsigned)_generateLegacyIAPConnectionID
{
  if (_generateLegacyIAPConnectionID_onceToken != -1) {
    dispatch_once(&_generateLegacyIAPConnectionID_onceToken, &__block_literal_global_24);
  }
  if (((_generateLegacyIAPConnectionID_connectionID + 1) & 0xFFFFFF) != 0) {
    int v2 = _generateLegacyIAPConnectionID_connectionID + 1;
  }
  else {
    int v2 = _generateLegacyIAPConnectionID_connectionID + 2;
  }
  unsigned int result = v2 & 0xFFFFFF | 0x2000000;
  _generateLegacyIAPConnectionID_connectionID = result;
  return result;
}

void __54__ACCExternalAccessory__generateLegacyIAPConnectionID__block_invoke(id a1)
{
  _generateLegacyIAPConnectionID_connectionID = arc4random();
}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  id v3 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  uint64_t v4 = kACCExternalAccessoryCertDataKey;
  id v5 = [v3 objectForKey:kACCExternalAccessoryCertDataKey];

  if (v5)
  {
    unsigned int v6 = [v3 objectForKey:v4];
    id v7 = [v6 length];

    id v8 = +[NSString stringWithFormat:@"%lu bytes", v7];
    [v3 setObject:v8 forKey:v4];
  }
  uint64_t v9 = kACCExternalAccessoryCertSerialNumberKey;
  CFTypeRef v10 = [v3 objectForKey:kACCExternalAccessoryCertSerialNumberKey];

  if (v10)
  {
    id v11 = [v3 objectForKey:v9];
    id v12 = [v11 length];

    id v13 = +[NSString stringWithFormat:@"%lu bytes", v12];
    [v3 setObject:v13 forKey:v9];
  }

  return v3;
}

- (NSString)primaryEndpointUUID
{
  return self->_primaryEndpointUUID;
}

- (NSArray)endpointUUIDs
{
  return self->_endpointUUIDs;
}

- (NSString)EAName
{
  return self->_EAName;
}

- (NSString)EAManufacturer
{
  return self->_EAManufacturer;
}

- (NSString)EAModelNumber
{
  return self->_EAModelNumber;
}

- (NSString)EASerialNumber
{
  return self->_EASerialNumber;
}

- (NSString)EAFirmwareRevisionActive
{
  return self->_EAFirmwareRevisionActive;
}

- (NSString)EAFirmwareRevisionPending
{
  return self->_EAFirmwareRevisionPending;
}

- (NSString)EAHardwareRevision
{
  return self->_EAHardwareRevision;
}

- (NSString)EAPPID
{
  return self->_EAPPID;
}

- (NSString)EARegionCode
{
  return self->_EARegionCode;
}

- (NSString)EADockType
{
  return self->_EADockType;
}

- (NSString)EAMACAddress
{
  return self->_EAMACAddress;
}

- (NSNumber)EAConnectionID
{
  return self->_EAConnectionID;
}

- (NSNumber)EATransportType
{
  return self->_EATransportType;
}

- (NSNumber)EAVendorID
{
  return self->_EAVendorID;
}

- (NSNumber)EAProductID
{
  return self->_EAProductID;
}

- (NSArray)EAProtocolsAppMatching
{
  return self->_EAProtocolsAppMatching;
}

- (NSString)EAPreferredApp
{
  return self->_EAPreferredApp;
}

- (NSData)EACertData
{
  return self->_EACertData;
}

- (NSData)EACertSerial
{
  return self->_EACertSerial;
}

- (NSDictionary)EAAccessoryDictionary
{
  return self->_EAAccessoryDictionary;
}

- (BOOL)supportsMultipleSessionsPerProtocol
{
  return self->_supportsMultipleSessionsPerProtocol;
}

- (NSDictionary)vehicleStatus
{
  return self->_vehicleStatus;
}

- (void)setVehicleStatus:(id)a3
{
}

- (unint64_t)destinationSharingOptions
{
  return self->_destinationSharingOptions;
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  self->_destinationSharingOptions = a3;
}

- (NSDictionary)vehicleInfoDictionary
{
  return self->_vehicleInfoDictionary;
}

- (NSDictionary)EAProtocols
{
  return self->_EAProtocols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EAProtocols, 0);
  objc_storeStrong((id *)&self->_vehicleInfoDictionary, 0);
  objc_storeStrong((id *)&self->_vehicleStatus, 0);
  objc_storeStrong((id *)&self->_EAAccessoryDictionary, 0);
  objc_storeStrong((id *)&self->_EACertSerial, 0);
  objc_storeStrong((id *)&self->_EACertData, 0);
  objc_storeStrong((id *)&self->_EAPreferredApp, 0);
  objc_storeStrong((id *)&self->_EAProtocolsAppMatching, 0);
  objc_storeStrong((id *)&self->_EAProductID, 0);
  objc_storeStrong((id *)&self->_EAVendorID, 0);
  objc_storeStrong((id *)&self->_EATransportType, 0);
  objc_storeStrong((id *)&self->_EAConnectionID, 0);
  objc_storeStrong((id *)&self->_EAMACAddress, 0);
  objc_storeStrong((id *)&self->_EADockType, 0);
  objc_storeStrong((id *)&self->_EARegionCode, 0);
  objc_storeStrong((id *)&self->_EAPPID, 0);
  objc_storeStrong((id *)&self->_EAHardwareRevision, 0);
  objc_storeStrong((id *)&self->_EAFirmwareRevisionPending, 0);
  objc_storeStrong((id *)&self->_EAFirmwareRevisionActive, 0);
  objc_storeStrong((id *)&self->_EASerialNumber, 0);
  objc_storeStrong((id *)&self->_EAModelNumber, 0);
  objc_storeStrong((id *)&self->_EAManufacturer, 0);
  objc_storeStrong((id *)&self->_EAName, 0);
  objc_storeStrong((id *)&self->_endpointUUIDs, 0);

  objc_storeStrong((id *)&self->_primaryEndpointUUID, 0);
}

- (void)externalAccessoryProtocolInformationForProtocolName:.cold.1()
{
  OUTLINED_FUNCTION_4_13();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Found externalAccessoryProtocolInformation protocolName %@ for protocol %@", v2, 0x16u);
}

- (void)copyExternalAccessoryProtocols
{
  id v5 = [a1 EAName];
  OUTLINED_FUNCTION_4_13();
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "all protocols for accessory %@: %@", v6, 0x16u);
}

- (void)_addiAP2EAProtocols:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Didn't find native EA endpoint UUID, using iAP2 Endpoint UUID", buf, 2u);
}

- (void)_constructEADictionary:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 EAAccessoryDictionary];
  int v2 = +[ACCExternalAccessory accessoryDictionaryForLogging:v1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v3, v4, "created eaDict %@", v5, v6, v7, v8, v9);
}

- (void)_constructEADictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "eaFullProtocolDict %@", v1, 0xCu);
}

- (void)_constructEADictionary:.cold.5()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "eaDictForExternalAccessoryFramework %@", v1, 0xCu);
}

- (void)_constructEADictionary:(void *)a1 .cold.7(void *a1)
{
  os_log_t v1 = [a1 EAProtocols];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "EAProtocols %@", v4, v5, v6, v7, v8);
}

@end