@interface CWFScanResult
+ (BOOL)supportsSecureCoding;
+ (id)supportedOSSpecificKeys;
- (BOOL)hasNon6GHzRNRChannel;
- (BOOL)hasTKIPCipher;
- (BOOL)hasWEP104Cipher;
- (BOOL)hasWEP40Cipher;
- (BOOL)isAdditionalStepRequiredForAccess;
- (BOOL)isAllowedInLockdownMode;
- (BOOL)isAmbiguousNetworkName;
- (BOOL)isAppleSWAP;
- (BOOL)isAssociationDisallowed;
- (BOOL)isBackgroundScanResult;
- (BOOL)isEAP;
- (BOOL)isESS;
- (BOOL)isEmergencyServicesReachable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScanResult:(id)a3;
- (BOOL)isFILSDiscoveryFrame;
- (BOOL)isHotspot;
- (BOOL)isIBSS;
- (BOOL)isInternetAccessible;
- (BOOL)isMFPCapable;
- (BOOL)isMFPRequired;
- (BOOL)isMetered;
- (BOOL)isOWE;
- (BOOL)isOpen;
- (BOOL)isPSK;
- (BOOL)isPasspoint;
- (BOOL)isPersonalHotspot;
- (BOOL)isUnauthenticatedEmergencyServiceAccessible;
- (BOOL)isUnconfiguredAirPortBaseStation;
- (BOOL)isUnconfiguredDevice;
- (BOOL)isWAPI;
- (BOOL)isWEP;
- (BOOL)isWPA;
- (BOOL)isWPA2;
- (BOOL)isWPA3;
- (BOOL)isWiFi6E;
- (BOOL)providesInternetAccess;
- (BOOL)supports2GHzNetworks;
- (BOOL)supports5GHzNetworks;
- (BOOL)supportsAirPlay;
- (BOOL)supportsAirPlay2;
- (BOOL)supportsAirPrint;
- (BOOL)supportsCarPlay;
- (BOOL)supportsHomeKit;
- (BOOL)supportsHomeKit2;
- (BOOL)supportsMFi;
- (BOOL)supportsMFiHardwareAuth;
- (BOOL)supportsMFiSoftwareCertAuth;
- (BOOL)supportsMFiSoftwareTokenAuth;
- (BOOL)supportsSecureWAC;
- (BOOL)supportsWPS;
- (BOOL)supportsWoW;
- (BOOL)supportsiAPOverWiFi;
- (BOOL)wasConnectedDuringSleep;
- (CWFChannel)channel;
- (CWFNetworkProfile)matchingKnownNetworkProfile;
- (CWFScanResult)initWithCoder:(id)a3;
- (CWFScanResult)initWithScanRecord:(id)a3 includeProperties:(id)a4;
- (CWFScanResult)initWithScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5;
- (CWFScanResult)scanResultWithMatchingKnownNetworkProfile:(id)a3;
- (NSArray)NAIRealmNameList;
- (NSArray)RNRBSSList;
- (NSArray)RNRChannelList;
- (NSArray)RSNAuthSelectors;
- (NSArray)RSNUnicastCiphers;
- (NSArray)WPAAuthSelectors;
- (NSArray)WPAUnicastCiphers;
- (NSArray)cellularNetworkInfo;
- (NSArray)domainNameList;
- (NSArray)networkFlags;
- (NSArray)operatorFriendlyNameList;
- (NSArray)roamingConsortiumList;
- (NSData)SSID;
- (NSData)informationElementData;
- (NSDictionary)ANQPResponse;
- (NSDictionary)OSSpecificAttributes;
- (NSDictionary)scanRecord;
- (NSMutableDictionary)internal;
- (NSSet)properties;
- (NSString)BSSID;
- (NSString)HESSID;
- (NSString)bluetoothMAC;
- (NSString)countryCode;
- (NSString)description;
- (NSString)deviceID;
- (NSString)displayName;
- (NSString)friendlyName;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)networkName;
- (NSString)primaryMAC;
- (NSString)privateMACAddress;
- (id)JSONCompatibleKeyValueMap;
- (id)OSSpecificValueForKey:(id)a3;
- (id)__defaultProperties;
- (id)__descriptionForAirPortBaseStationModel:(int64_t)a3;
- (id)__descriptionForRSNAuthSel:(int)a3;
- (id)__descriptionForRSNCipher:(int)a3;
- (id)__descriptionForRSNIE;
- (id)__descriptionForWPAAuthSel:(int)a3;
- (id)__descriptionForWPACipher:(int)a3;
- (id)__descriptionForWPAIE;
- (id)__internalDictionaryFromScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5;
- (id)__requiredProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteredScanResultWithProperties:(id)a3;
- (id)networkProfile;
- (int)APMode;
- (int)RSNCapabilities;
- (int)accessNetworkType;
- (int)fastestSupportedPHYMode;
- (int)slowestSupportedPHYMode;
- (int)supportedPHYModes;
- (int64_t)RSSI;
- (int64_t)WAPISubtype;
- (int64_t)airPortBaseStationModel;
- (int64_t)beaconInterval;
- (int64_t)compareLowDataModes:(id)a3;
- (int64_t)compareSupportedPHYModes:(id)a3;
- (int64_t)compareSupportedSecurityTypes:(id)a3;
- (int64_t)noise;
- (int64_t)venueGroup;
- (int64_t)venueType;
- (unint64_t)RSNBroadcastCipher;
- (unint64_t)RSNMulticastCipher;
- (unint64_t)WPAMulticastCipher;
- (unint64_t)age;
- (unint64_t)hash;
- (unint64_t)shortSSID;
- (unint64_t)strongestSupportedSecurityType;
- (unint64_t)supportedSecurityTypes;
- (unint64_t)timestamp;
- (unint64_t)weakestSupportedSecurityType;
- (void)encodeWithCoder:(id)a3;
- (void)setInternal:(id)a3;
- (void)setMatchingKnownNetworkProfile:(id)a3;
- (void)setOSSpecificAttributes:(id)a3;
- (void)setOSSpecificValue:(id)a3 forKey:(id)a4;
@end

@implementation CWFScanResult

- (CWFScanResult)scanResultWithMatchingKnownNetworkProfile:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CWFScanResult);
  v10 = objc_msgSend_mutableCopy(self->_internal, v6, v7, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v4, (uint64_t)&unk_1F0DC8340, v12);

  objc_msgSend_setInternal_(v5, v13, (uint64_t)v10, v14, v15);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFScanResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToScanResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToScanResult = objc_msgSend_isEqualToScanResult_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToScanResult = 0;
  }

  return isEqualToScanResult;
}

- (CWFScanResult)initWithScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CWFScanResult;
  v11 = [(CWFScanResult *)&v17 init];
  v13 = v11;
  if (!v8
    || !v11
    || (objc_msgSend___internalDictionaryFromScanRecord_knownNetworkProfile_includeProperties_(v11, v12, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10), uint64_t v14 = objc_claimAutoreleasedReturnValue(), internal = v13->_internal, v13->_internal = (NSMutableDictionary *)v14, internal, !v13->_internal))
  {

    v13 = 0;
  }

  return v13;
}

- (CWFNetworkProfile)matchingKnownNetworkProfile
{
  return (CWFNetworkProfile *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8340, v2, v3);
}

- (BOOL)isEqualToScanResult:(id)a3
{
  id v4 = a3;
  v13 = objc_msgSend_SSID(self, v5, v6, v7, v8);
  if (v13)
  {
    v18 = objc_msgSend_SSID(v4, v9, v10, v11, v12);
    if (v18)
    {
      v19 = objc_msgSend_SSID(self, v14, v15, v16, v17);
      v24 = objc_msgSend_SSID(v4, v20, v21, v22, v23);
      if (objc_msgSend_isEqual_(v19, v25, (uint64_t)v24, v26, v27))
      {
        v36 = objc_msgSend_BSSID(self, v28, v29, v30, v31);
        if (v36)
        {
          v41 = objc_msgSend_BSSID(v4, v32, v33, v34, v35);
          if (v41)
          {
            v42 = objc_msgSend_BSSID(self, v37, v38, v39, v40);
            v47 = objc_msgSend_BSSID(v4, v43, v44, v45, v46);
            if (objc_msgSend_isEqual_(v42, v48, (uint64_t)v47, v49, v50)
              && (int isFILSDiscoveryFrame = objc_msgSend_isFILSDiscoveryFrame(self, v51, v52, v53, v54),
                  isFILSDiscoveryFrame == objc_msgSend_isFILSDiscoveryFrame(v4, v55, v56, v57, v58)))
            {
              uint64_t v64 = objc_msgSend_supportedSecurityTypes(self, v59, v60, v61, v62);
              BOOL v63 = v64 == objc_msgSend_supportedSecurityTypes(v4, v65, v66, v67, v68);
            }
            else
            {
              BOOL v63 = 0;
            }
          }
          else
          {
            BOOL v63 = 0;
          }
        }
        else
        {
          BOOL v63 = 0;
        }
      }
      else
      {
        BOOL v63 = 0;
      }
    }
    else
    {
      BOOL v63 = 0;
    }
  }
  else
  {
    BOOL v63 = 0;
  }

  return v63;
}

- (NSData)SSID
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7CF8, v2, v3);
}

- (NSString)BSSID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7CC8, v2, v3);
}

- (unint64_t)supportedSecurityTypes
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7DA0, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isFILSDiscoveryFrame
{
  v5 = objc_msgSend_networkFlags(self, a2, v2, v3, v4);
  char v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_1F0DC7E18, v7, v8);

  return v9;
}

- (NSArray)networkFlags
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8370, v2, v3);
}

- (id)__internalDictionaryFromScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5
{
  uint64_t v439 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12, v13, v14);
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v21 = objc_msgSend___requiredProperties(self, v17, v18, v19, v20);
  v25 = objc_msgSend_setWithSet_(v16, v22, (uint64_t)v21, v23, v24);

  v433 = v10;
  if (v10)
  {
    objc_msgSend_unionSet_(v25, v26, (uint64_t)v10, v28, v29);
  }
  else
  {
    uint64_t v30 = objc_msgSend___defaultProperties(self, v26, v27, v28, v29);
    objc_msgSend_unionSet_(v25, v31, (uint64_t)v30, v32, v33);
  }
  long long v436 = 0u;
  long long v437 = 0u;
  long long v434 = 0u;
  long long v435 = 0u;
  id v34 = v25;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v434, (uint64_t)v438, 16);
  if (v36)
  {
    uint64_t v41 = v36;
    uint64_t v42 = *(void *)v435;
    while (1)
    {
      uint64_t v43 = 0;
      while (2)
      {
        if (*(void *)v435 != v42) {
          objc_enumerationMutation(v34);
        }
        switch(objc_msgSend_integerValue(*(void **)(*((void *)&v434 + 1) + 8 * v43), v37, v38, v39, v40))
        {
          case 1:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v37, (uint64_t)v8, (uint64_t)&unk_1F0DC7CE0, v40);
            goto LABEL_222;
          case 2:
            uint64_t v44 = NSNumber;
            uint64_t v45 = objc_msgSend_timestamp(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithUnsignedLongLong_(v44, v46, v45, v47, v48);
            uint64_t v52 = &unk_1F0DC8358;
            goto LABEL_207;
          case 3:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40)) {
              objc_msgSend_FILSSSID(v8, v53, v54, v55, v56);
            }
            else {
            v51 = objc_msgSend_SSID(v8, v53, v54, v55, v56);
            }
            uint64_t v52 = &unk_1F0DC7CF8;
            goto LABEL_207;
          case 4:
            v51 = objc_msgSend_BSSID(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC7CC8;
            goto LABEL_207;
          case 5:
            v248 = objc_msgSend_channelInfo(v8, v37, v38, v39, v40);
            objc_msgSend_setObject_forKeyedSubscript_(v15, v249, (uint64_t)v248, (uint64_t)&unk_1F0DC7D10, v250);

            if (!objc_msgSend_hasFILSDiscoveryInformation(v8, v251, v252, v253, v254)) {
              goto LABEL_222;
            }
            v51 = objc_msgSend_FILSPrimaryChannelInfo(v8, v37, v38, v39, v40);
            if (!v51) {
              goto LABEL_208;
            }
            uint64_t v52 = &unk_1F0DC7D10;
            goto LABEL_207;
          case 6:
            v51 = objc_msgSend_countryCode(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC7D28;
            goto LABEL_207;
          case 7:
            uint64_t v57 = NSNumber;
            uint64_t v58 = objc_msgSend_RSSI(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithInteger_(v57, v59, v58, v60, v61);
            uint64_t v52 = &unk_1F0DC7D40;
            goto LABEL_207;
          case 8:
            uint64_t v62 = NSNumber;
            uint64_t v63 = objc_msgSend_wasConnectedDuringSleep(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithBool_(v62, v64, v63, v65, v66);
            uint64_t v52 = &unk_1F0DC7D58;
            goto LABEL_207;
          case 9:
            v255 = NSNumber;
            uint64_t v256 = objc_msgSend_noise(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithInteger_(v255, v257, v256, v258, v259);
            uint64_t v52 = &unk_1F0DC7D70;
            goto LABEL_207;
          case 10:
            int hasFILSDiscoveryInformation = objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40);
            v265 = NSNumber;
            if (hasFILSDiscoveryInformation) {
              uint64_t v266 = objc_msgSend_FILSBeaconInterval(v8, v261, v262, v263, v264);
            }
            else {
              uint64_t v266 = objc_msgSend_beaconInterval(v8, v261, v262, v263, v264);
            }
            v51 = objc_msgSend_numberWithInteger_(v265, v267, v266, v268, v269);
            uint64_t v52 = &unk_1F0DC7D88;
            goto LABEL_207;
          case 11:
            uint64_t v67 = NSNumber;
            uint64_t isPasspoint = objc_msgSend_isPasspoint(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithBool_(v67, v69, isPasspoint, v70, v71);
            uint64_t v52 = &unk_1F0DC7DD0;
            goto LABEL_207;
          case 12:
            v72 = NSNumber;
            uint64_t isPersonalHotspot = objc_msgSend_isPersonalHotspot(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithBool_(v72, v74, isPersonalHotspot, v75, v76);
            uint64_t v52 = &unk_1F0DC7DE8;
            goto LABEL_207;
          case 13:
            v77 = NSNumber;
            uint64_t isAppleSWAP = objc_msgSend_isAppleSWAP(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithBool_(v77, v79, isAppleSWAP, v80, v81);
            uint64_t v52 = &unk_1F0DC7E00;
            goto LABEL_207;
          case 14:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSCaps(v8, v82, v83, v84, v85))
              {
                if (objc_msgSend_FILSIsESS(v8, v86, v87, v88, v89)) {
                  v90 = &unk_1F0DC7E18;
                }
                else {
                  v90 = &unk_1F0DC7E30;
                }
              }
              else
              {
                v90 = 0;
              }
              v247 = &unk_1F0DC7E48;
LABEL_219:
              objc_msgSend_setObject_forKeyedSubscript_(v15, v86, (uint64_t)v90, (uint64_t)v247, v89);
              goto LABEL_222;
            }
            uint64_t v419 = objc_msgSend_APMode(v8, v82, v83, v84, v85);
            if (!v419) {
              goto LABEL_222;
            }
            v51 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v37, v419, v39, v40);
            uint64_t v52 = &unk_1F0DC7E48;
            goto LABEL_207;
          case 15:
            v270 = NSNumber;
            uint64_t isUnconfiguredAirPortBaseStation = objc_msgSend_isUnconfiguredAirPortBaseStation(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithBool_(v270, v272, isUnconfiguredAirPortBaseStation, v273, v274);
            uint64_t v52 = &unk_1F0DC7E90;
            goto LABEL_207;
          case 16:
            v275 = NSNumber;
            uint64_t v276 = objc_msgSend_airPortBaseStationModel(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithInteger_(v275, v277, v276, v278, v279);
            uint64_t v52 = &unk_1F0DC7EA8;
            goto LABEL_207;
          case 17:
            v51 = objc_msgSend_informationElementData(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC7E60;
            goto LABEL_207;
          case 18:
            if (!objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              v286 = NSNumber;
              uint64_t v287 = objc_msgSend_supportedPHYModes(v8, v280, v281, v282, v283);
              goto LABEL_181;
            }
            if (objc_msgSend_hasFILSCaps(v8, v280, v281, v282, v283))
            {
              v286 = NSNumber;
              uint64_t v287 = objc_msgSend_FILSSupportedPHYModes(v8, v101, v284, v285, v104);
LABEL_181:
              v51 = objc_msgSend_numberWithUnsignedInt_(v286, v288, v287, v289, v290);
              uint64_t v52 = &unk_1F0DC7DB8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7DB8;
LABEL_221:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v101, 0, (uint64_t)v420, v104);
LABEL_222:
            if (v41 != ++v43) {
              continue;
            }
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v434, (uint64_t)v438, 16);
            if (!v41) {
              goto LABEL_224;
            }
            break;
          case 19:
            v91 = NSNumber;
            uint64_t v92 = objc_msgSend_supportedSecurityTypes(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithUnsignedInteger_(v91, v93, v92, v94, v95);
            uint64_t v52 = &unk_1F0DC7DA0;
            goto LABEL_207;
          case 20:
            v96 = NSNumber;
            uint64_t v97 = objc_msgSend_WAPISubtype(v8, v37, v38, v39, v40);
            v51 = objc_msgSend_numberWithInteger_(v96, v98, v97, v99, v100);
            uint64_t v52 = &unk_1F0DC7E78;
            goto LABEL_207;
          case 21:
            v51 = objc_msgSend_WPAUnicastCiphers(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC8268;
            goto LABEL_207;
          case 22:
            if (objc_msgSend_hasWPAIE(v8, v37, v38, v39, v40))
            {
              v105 = NSNumber;
              uint64_t v106 = objc_msgSend_WPAMulticastCipher(v8, v101, v102, v103, v104);
              v51 = objc_msgSend_numberWithUnsignedLongLong_(v105, v107, v106, v108, v109);
              uint64_t v52 = &unk_1F0DC8280;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8280;
            goto LABEL_221;
          case 23:
            v51 = objc_msgSend_WPAAuthSelectors(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC8298;
            goto LABEL_207;
          case 24:
            v51 = objc_msgSend_RSNUnicastCiphers(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC82B0;
            goto LABEL_207;
          case 25:
            if (objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40))
            {
              v112 = NSNumber;
              uint64_t v113 = objc_msgSend_RSNMulticastCipher(v8, v101, v110, v111, v104);
              v51 = objc_msgSend_numberWithUnsignedLongLong_(v112, v114, v113, v115, v116);
              uint64_t v52 = &unk_1F0DC82C8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC82C8;
            goto LABEL_221;
          case 26:
            if (objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40))
            {
              v119 = NSNumber;
              uint64_t v120 = objc_msgSend_RSNBroadcastCipher(v8, v101, v117, v118, v104);
              v51 = objc_msgSend_numberWithUnsignedLongLong_(v119, v121, v120, v122, v123);
              uint64_t v52 = &unk_1F0DC82E0;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC82E0;
            goto LABEL_221;
          case 27:
            v51 = objc_msgSend_RSNAuthSelectors(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC82F8;
            goto LABEL_207;
          case 28:
            if (objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40))
            {
              v293 = NSNumber;
              uint64_t v294 = objc_msgSend_RSNCapabilities(v8, v101, v291, v292, v104);
              v51 = objc_msgSend_numberWithUnsignedInt_(v293, v295, v294, v296, v297);
              uint64_t v52 = &unk_1F0DC8310;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8310;
            goto LABEL_221;
          case 31:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v124, v125, v126, v127))
              {
                v130 = NSNumber;
                uint64_t v131 = objc_msgSend_FILSAccessNetworkType(v8, v101, v128, v129, v104);
LABEL_156:
                v51 = objc_msgSend_numberWithUnsignedInt_(v130, v132, v131, v133, v134);
                uint64_t v52 = &unk_1F0DC7EC0;
                goto LABEL_207;
              }
            }
            else if (objc_msgSend_hasInterworkingIE(v8, v124, v125, v126, v127))
            {
              v130 = NSNumber;
              uint64_t v131 = objc_msgSend_accessNetworkType(v8, v101, v421, v422, v104);
              goto LABEL_156;
            }
            v420 = &unk_1F0DC7EC0;
            goto LABEL_221;
          case 32:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v135, v136, v137, v138))
              {
                v141 = NSNumber;
                uint64_t isInternetAccessible = objc_msgSend_FILSIsInternetAccessible(v8, v101, v139, v140, v104);
LABEL_159:
                v51 = objc_msgSend_numberWithBool_(v141, v143, isInternetAccessible, v144, v145);
                uint64_t v52 = &unk_1F0DC7ED8;
                goto LABEL_207;
              }
            }
            else if (objc_msgSend_hasInterworkingIE(v8, v135, v136, v137, v138))
            {
              v141 = NSNumber;
              uint64_t isInternetAccessible = objc_msgSend_isInternetAccessible(v8, v101, v423, v424, v104);
              goto LABEL_159;
            }
            v420 = &unk_1F0DC7ED8;
            goto LABEL_221;
          case 33:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v298, v299, v300, v301))
              {
                v304 = NSNumber;
                uint64_t isAdditionalStepRequiredForAccess = objc_msgSend_FILSIsAdditionalStepRequiredForAccess(v8, v101, v302, v303, v104);
LABEL_185:
                v51 = objc_msgSend_numberWithBool_(v304, v306, isAdditionalStepRequiredForAccess, v307, v308);
                uint64_t v52 = &unk_1F0DC7EF0;
                goto LABEL_207;
              }
            }
            else if (objc_msgSend_hasInterworkingIE(v8, v298, v299, v300, v301))
            {
              v304 = NSNumber;
              uint64_t isAdditionalStepRequiredForAccess = objc_msgSend_isAdditionalStepRequiredForAccess(v8, v101, v427, v428, v104);
              goto LABEL_185;
            }
            v420 = &unk_1F0DC7EF0;
            goto LABEL_221;
          case 34:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v146, v147, v148, v149))
              {
                v152 = NSNumber;
                uint64_t isEmergencyServicesReachable = objc_msgSend_FILSIsEmergencyServicesReachable(v8, v101, v150, v151, v104);
LABEL_162:
                v51 = objc_msgSend_numberWithBool_(v152, v154, isEmergencyServicesReachable, v155, v156);
                uint64_t v52 = &unk_1F0DC7F08;
                goto LABEL_207;
              }
            }
            else if (objc_msgSend_hasInterworkingIE(v8, v146, v147, v148, v149))
            {
              v152 = NSNumber;
              uint64_t isEmergencyServicesReachable = objc_msgSend_isEmergencyServicesReachable(v8, v101, v425, v426, v104);
              goto LABEL_162;
            }
            v420 = &unk_1F0DC7F08;
            goto LABEL_221;
          case 35:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v309, v310, v311, v312))
              {
                v315 = NSNumber;
                uint64_t isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_FILSIsUnauthenticatedEmergencyServiceAccessible(v8, v101, v313, v314, v104);
LABEL_188:
                v51 = objc_msgSend_numberWithBool_(v315, v317, isUnauthenticatedEmergencyServiceAccessible, v318, v319);
                uint64_t v52 = &unk_1F0DC7F20;
                goto LABEL_207;
              }
            }
            else if (objc_msgSend_hasInterworkingIE(v8, v309, v310, v311, v312))
            {
              v315 = NSNumber;
              uint64_t isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_isUnauthenticatedEmergencyServiceAccessible(v8, v101, v429, v430, v104);
              goto LABEL_188;
            }
            v420 = &unk_1F0DC7F20;
            goto LABEL_221;
          case 36:
            if (objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40))
            {
              v159 = NSNumber;
              uint64_t v160 = objc_msgSend_venueGroup(v8, v101, v157, v158, v104);
              v51 = objc_msgSend_numberWithInteger_(v159, v161, v160, v162, v163);
              uint64_t v52 = &unk_1F0DC7F38;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7F38;
            goto LABEL_221;
          case 37:
            if (objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40))
            {
              v322 = NSNumber;
              uint64_t v323 = objc_msgSend_venueType(v8, v101, v320, v321, v104);
              v51 = objc_msgSend_numberWithInteger_(v322, v324, v323, v325, v326);
              uint64_t v52 = &unk_1F0DC7F50;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7F50;
            goto LABEL_221;
          case 38:
            if (objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_HESSID(v8, v101, v327, v328, v104);
              uint64_t v52 = &unk_1F0DC7F68;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7F68;
            goto LABEL_221;
          case 39:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v166 = NSNumber;
              uint64_t isUnconfiguredDevice = objc_msgSend_isUnconfiguredDevice(v8, v101, v164, v165, v104);
              v51 = objc_msgSend_numberWithBool_(v166, v168, isUnconfiguredDevice, v169, v170);
              uint64_t v52 = &unk_1F0DC7F80;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7F80;
            goto LABEL_221;
          case 40:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v331 = NSNumber;
              uint64_t v332 = objc_msgSend_providesInternetAccess(v8, v101, v329, v330, v104);
              v51 = objc_msgSend_numberWithBool_(v331, v333, v332, v334, v335);
              uint64_t v52 = &unk_1F0DC7F98;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7F98;
            goto LABEL_221;
          case 41:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v173 = NSNumber;
              uint64_t v174 = objc_msgSend_supportsWPS(v8, v101, v171, v172, v104);
              v51 = objc_msgSend_numberWithBool_(v173, v175, v174, v176, v177);
              uint64_t v52 = &unk_1F0DC7FB0;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7FB0;
            goto LABEL_221;
          case 42:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v180 = NSNumber;
              uint64_t v181 = objc_msgSend_supportsiAPOverWiFi(v8, v101, v178, v179, v104);
              v51 = objc_msgSend_numberWithBool_(v180, v182, v181, v183, v184);
              uint64_t v52 = &unk_1F0DC7FC8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7FC8;
            goto LABEL_221;
          case 43:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v187 = NSNumber;
              uint64_t v188 = objc_msgSend_supports2GHzNetworks(v8, v101, v185, v186, v104);
              v51 = objc_msgSend_numberWithBool_(v187, v189, v188, v190, v191);
              uint64_t v52 = &unk_1F0DC7FE0;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7FE0;
            goto LABEL_221;
          case 44:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v194 = NSNumber;
              uint64_t v195 = objc_msgSend_supports5GHzNetworks(v8, v101, v192, v193, v104);
              v51 = objc_msgSend_numberWithBool_(v194, v196, v195, v197, v198);
              uint64_t v52 = &unk_1F0DC7FF8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC7FF8;
            goto LABEL_221;
          case 45:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v338 = NSNumber;
              uint64_t v339 = objc_msgSend_supportsCarPlay(v8, v101, v336, v337, v104);
              v51 = objc_msgSend_numberWithBool_(v338, v340, v339, v341, v342);
              uint64_t v52 = &unk_1F0DC8010;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8010;
            goto LABEL_221;
          case 46:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v201 = NSNumber;
              uint64_t v202 = objc_msgSend_supportsHomeKit(v8, v101, v199, v200, v104);
              v51 = objc_msgSend_numberWithBool_(v201, v203, v202, v204, v205);
              uint64_t v52 = &unk_1F0DC8028;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8028;
            goto LABEL_221;
          case 47:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v208 = NSNumber;
              uint64_t v209 = objc_msgSend_supportsHomeKit2(v8, v101, v206, v207, v104);
              v51 = objc_msgSend_numberWithBool_(v208, v210, v209, v211, v212);
              uint64_t v52 = &unk_1F0DC8040;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8040;
            goto LABEL_221;
          case 48:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v345 = NSNumber;
              uint64_t v346 = objc_msgSend_supportsAirPlay(v8, v101, v343, v344, v104);
              v51 = objc_msgSend_numberWithBool_(v345, v347, v346, v348, v349);
              uint64_t v52 = &unk_1F0DC8058;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8058;
            goto LABEL_221;
          case 49:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v352 = NSNumber;
              uint64_t v353 = objc_msgSend_supportsAirPlay2(v8, v101, v350, v351, v104);
              v51 = objc_msgSend_numberWithBool_(v352, v354, v353, v355, v356);
              uint64_t v52 = &unk_1F0DC8070;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8070;
            goto LABEL_221;
          case 50:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v359 = NSNumber;
              uint64_t v360 = objc_msgSend_supportsAirPrint(v8, v101, v357, v358, v104);
              v51 = objc_msgSend_numberWithBool_(v359, v361, v360, v362, v363);
              uint64_t v52 = &unk_1F0DC8088;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8088;
            goto LABEL_221;
          case 51:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v366 = NSNumber;
              uint64_t v367 = objc_msgSend_supportsMFi(v8, v101, v364, v365, v104);
              v51 = objc_msgSend_numberWithBool_(v366, v368, v367, v369, v370);
              uint64_t v52 = &unk_1F0DC80A0;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC80A0;
            goto LABEL_221;
          case 52:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v215 = NSNumber;
              uint64_t v216 = objc_msgSend_supportsMFiHardwareAuth(v8, v101, v213, v214, v104);
              v51 = objc_msgSend_numberWithBool_(v215, v217, v216, v218, v219);
              uint64_t v52 = &unk_1F0DC80B8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC80B8;
            goto LABEL_221;
          case 53:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v222 = NSNumber;
              uint64_t v223 = objc_msgSend_supportsSoftwareTokenAuth(v8, v101, v220, v221, v104);
              v51 = objc_msgSend_numberWithBool_(v222, v224, v223, v225, v226);
              uint64_t v52 = &unk_1F0DC80D0;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC80D0;
            goto LABEL_221;
          case 54:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v373 = NSNumber;
              uint64_t v374 = objc_msgSend_supportsSoftwareCertAuth(v8, v101, v371, v372, v104);
              v51 = objc_msgSend_numberWithBool_(v373, v375, v374, v376, v377);
              uint64_t v52 = &unk_1F0DC80E8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC80E8;
            goto LABEL_221;
          case 55:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v380 = NSNumber;
              uint64_t v381 = objc_msgSend_supportsSecureWAC(v8, v101, v378, v379, v104);
              v51 = objc_msgSend_numberWithBool_(v380, v382, v381, v383, v384);
              uint64_t v52 = &unk_1F0DC8100;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8100;
            goto LABEL_221;
          case 56:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v229 = NSNumber;
              uint64_t v230 = objc_msgSend_supportsWoW(v8, v101, v227, v228, v104);
              v51 = objc_msgSend_numberWithBool_(v229, v231, v230, v232, v233);
              uint64_t v52 = &unk_1F0DC8118;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8118;
            goto LABEL_221;
          case 57:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_friendlyName(v8, v101, v385, v386, v104);
              uint64_t v52 = &unk_1F0DC8130;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8130;
            goto LABEL_221;
          case 58:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_manufacturerName(v8, v101, v387, v388, v104);
              uint64_t v52 = &unk_1F0DC8148;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8148;
            goto LABEL_221;
          case 59:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_modelName(v8, v101, v234, v235, v104);
              uint64_t v52 = &unk_1F0DC8160;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8160;
            goto LABEL_221;
          case 60:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_displayName(v8, v101, v389, v390, v104);
              uint64_t v52 = &unk_1F0DC8178;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8178;
            goto LABEL_221;
          case 61:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_primaryMAC(v8, v101, v391, v392, v104);
              uint64_t v52 = &unk_1F0DC8190;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC8190;
            goto LABEL_221;
          case 62:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v51 = objc_msgSend_bluetoothMAC(v8, v101, v393, v394, v104);
              uint64_t v52 = &unk_1F0DC81A8;
              goto LABEL_207;
            }
            v420 = &unk_1F0DC81A8;
            goto LABEL_221;
          case 63:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) == 0)
            {
              v420 = &unk_1F0DC81C0;
              goto LABEL_221;
            }
            v51 = objc_msgSend_deviceID(v8, v101, v395, v396, v104);
            uint64_t v52 = &unk_1F0DC81C0;
LABEL_207:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v49, (uint64_t)v51, (uint64_t)v52, v50);
            goto LABEL_208;
          case 64:
            v51 = objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC81D8;
            goto LABEL_207;
          case 65:
            v51 = objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            if (v51)
            {
              v240 = objc_msgSend_cellularNetworkInfo(v8, v236, v397, v398, v239);
              objc_msgSend_setObject_forKeyedSubscript_(v15, v399, (uint64_t)v240, (uint64_t)&unk_1F0DC81F0, v400);
              goto LABEL_140;
            }
            v431 = &unk_1F0DC81F0;
            goto LABEL_216;
          case 66:
            v51 = objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            if (v51)
            {
              v240 = objc_msgSend_NAIRealmNameList(v8, v236, v401, v402, v239);
              objc_msgSend_setObject_forKeyedSubscript_(v15, v403, (uint64_t)v240, (uint64_t)&unk_1F0DC8208, v404);
              goto LABEL_140;
            }
            v431 = &unk_1F0DC8208;
            goto LABEL_216;
          case 67:
            v51 = objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            if (v51)
            {
              v240 = objc_msgSend_roamingConsortiumList(v8, v236, v237, v238, v239);
              objc_msgSend_setObject_forKeyedSubscript_(v15, v241, (uint64_t)v240, (uint64_t)&unk_1F0DC8220, v242);
              goto LABEL_140;
            }
            v431 = &unk_1F0DC8220;
            goto LABEL_216;
          case 68:
            v51 = objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            if (v51)
            {
              v240 = objc_msgSend_operatorFriendlyNameList(v8, v236, v405, v406, v239);
              objc_msgSend_setObject_forKeyedSubscript_(v15, v407, (uint64_t)v240, (uint64_t)&unk_1F0DC8238, v408);
              goto LABEL_140;
            }
            v431 = &unk_1F0DC8238;
            goto LABEL_216;
          case 69:
            v51 = objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            if (v51)
            {
              v240 = objc_msgSend_domainNameList(v8, v236, v243, v244, v239);
              objc_msgSend_setObject_forKeyedSubscript_(v15, v245, (uint64_t)v240, (uint64_t)&unk_1F0DC8250, v246);
LABEL_140:
            }
            else
            {
              v431 = &unk_1F0DC8250;
LABEL_216:
              objc_msgSend_setObject_forKeyedSubscript_(v15, v236, 0, (uint64_t)v431, v239);
            }
LABEL_208:

            goto LABEL_222;
          case 70:
            v51 = objc_msgSend_objectForKeyedSubscript_(v8, v37, @"__OSSpecific__", v39, v40);
            uint64_t v52 = &unk_1F0DC8328;
            goto LABEL_207;
          case 71:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v37, (uint64_t)v9, (uint64_t)&unk_1F0DC8340, v40);
            goto LABEL_222;
          case 72:
            v51 = objc_msgSend_networkFlags(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC8370;
            goto LABEL_207;
          case 73:
            int v409 = objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40);
            v414 = NSNumber;
            if (v409) {
              uint64_t v415 = objc_msgSend_FILSShortSSID(v8, v410, v411, v412, v413);
            }
            else {
              uint64_t v415 = objc_msgSend_shortSSID(v8, v410, v411, v412, v413);
            }
            v51 = objc_msgSend_numberWithUnsignedInteger_(v414, v416, v415, v417, v418);
            uint64_t v52 = &unk_1F0DC8388;
            goto LABEL_207;
          case 74:
            v51 = objc_msgSend_RNRBSSList(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC83A0;
            goto LABEL_207;
          case 75:
            if (objc_msgSend_associationDisallowedReason(v8, v37, v38, v39, v40)) {
              v90 = (void *)MEMORY[0x1E4F1CC38];
            }
            else {
              v90 = (void *)MEMORY[0x1E4F1CC28];
            }
            v247 = &unk_1F0DC83B8;
            goto LABEL_219;
          case 76:
            v51 = objc_msgSend_RNRChannelList(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC83D0;
            goto LABEL_207;
          case 77:
            v51 = objc_msgSend_privateMACAddress(v8, v37, v38, v39, v40);
            uint64_t v52 = &unk_1F0DC83E8;
            goto LABEL_207;
          default:
            goto LABEL_222;
        }
        break;
      }
    }
  }
LABEL_224:

  return v15;
}

- (id)__defaultProperties
{
  id v8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3, v4);
  for (uint64_t i = 0; i != 78; ++i)
  {
    id v10 = objc_msgSend_numberWithInteger_(NSNumber, v5, i, v6, v7);
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);
  }
  uint64_t v15 = objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (void).cxx_destruct
{
}

- (void)setInternal:(id)a3
{
}

- (id)networkProfile
{
  objc_msgSend_matchingKnownNetworkProfile(self, a2, v2, v3, v4);
  uint64_t v6 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    uint64_t v6 = objc_alloc_init(CWFNetworkProfile);
    uint64_t v11 = objc_msgSend_SSID(self, v7, v8, v9, v10);
    objc_msgSend_setSSID_(v6, v12, (uint64_t)v11, v13, v14);

    uint64_t v19 = objc_msgSend_supportedSecurityTypes(self, v15, v16, v17, v18);
    objc_msgSend_setSupportedSecurityTypes_(v6, v20, v19, v21, v22);
    uint64_t v27 = objc_msgSend_WAPISubtype(self, v23, v24, v25, v26);
    objc_msgSend_setWAPISubtype_(v6, v28, v27, v29, v30);
    uint64_t v35 = objc_msgSend_supportsCarPlay(self, v31, v32, v33, v34);
    objc_msgSend_setCarplayNetwork_(v6, v36, v35, v37, v38);
    uint64_t isPersonalHotspot = objc_msgSend_isPersonalHotspot(self, v39, v40, v41, v42);
    objc_msgSend_setPersonalHotspot_(v6, v44, isPersonalHotspot, v45, v46);
  }
  return v6;
}

- (CWFScanResult)initWithScanRecord:(id)a3 includeProperties:(id)a4
{
  return (CWFScanResult *)objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(self, a2, (uint64_t)a3, 0, (uint64_t)a4);
}

- (id)__requiredProperties
{
  return (id)objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)&unk_1F0DC88B0, v2, v3);
}

+ (id)supportedOSSpecificKeys
{
  if (qword_1EB4B2680 != -1) {
    dispatch_once(&qword_1EB4B2680, &unk_1F0DA3FF0);
  }
  uint64_t v2 = (void *)qword_1EB4B2678;
  return v2;
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v779 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = NSNumber;
  uint64_t v9 = objc_msgSend_age(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(v4, v10, v9, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"cache_age", v15);

  uint64_t v20 = objc_msgSend_channel(self, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_JSONCompatibleKeyValueMap(v20, v21, v22, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, @"channel", v27);

  uint64_t v28 = NSNumber;
  uint64_t v33 = objc_msgSend_RSSI(self, v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_numberWithInteger_(v28, v34, v33, v35, v36);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, @"rssi", v39);

  uint64_t v40 = NSNumber;
  uint64_t v45 = objc_msgSend_wasConnectedDuringSleep(self, v41, v42, v43, v44);
  uint64_t v49 = objc_msgSend_numberWithBool_(v40, v46, v45, v47, v48);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, @"wasConnectedDuringSleep", v51);

  uint64_t v52 = NSNumber;
  uint64_t v57 = objc_msgSend_noise(self, v53, v54, v55, v56);
  uint64_t v61 = objc_msgSend_numberWithInteger_(v52, v58, v57, v59, v60);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)v61, @"noise", v63);

  uint64_t v64 = NSNumber;
  uint64_t v69 = objc_msgSend_beaconInterval(self, v65, v66, v67, v68);
  v73 = objc_msgSend_numberWithInteger_(v64, v70, v69, v71, v72);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, @"beacon_interval", v75);

  uint64_t v76 = NSNumber;
  uint64_t isUnconfiguredAirPortBaseStation = objc_msgSend_isUnconfiguredAirPortBaseStation(self, v77, v78, v79, v80);
  uint64_t v85 = objc_msgSend_numberWithBool_(v76, v82, isUnconfiguredAirPortBaseStation, v83, v84);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v86, (uint64_t)v85, @"unconfigured_airport_base_station", v87);

  uint64_t v88 = NSNumber;
  uint64_t isPasspoint = objc_msgSend_isPasspoint(self, v89, v90, v91, v92);
  uint64_t v97 = objc_msgSend_numberWithBool_(v88, v94, isPasspoint, v95, v96);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v98, (uint64_t)v97, @"is_passpoint", v99);

  uint64_t v100 = NSNumber;
  uint64_t isPersonalHotspot = objc_msgSend_isPersonalHotspot(self, v101, v102, v103, v104);
  uint64_t v109 = objc_msgSend_numberWithBool_(v100, v106, isPersonalHotspot, v107, v108);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v110, (uint64_t)v109, @"is_personal_hotspot", v111);

  v112 = NSNumber;
  uint64_t isAppleSWAP = objc_msgSend_isAppleSWAP(self, v113, v114, v115, v116);
  v121 = objc_msgSend_numberWithBool_(v112, v118, isAppleSWAP, v119, v120);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v122, (uint64_t)v121, @"is_apple_swap", v123);

  v124 = NSNumber;
  uint64_t isIBSS = objc_msgSend_isIBSS(self, v125, v126, v127, v128);
  uint64_t v133 = objc_msgSend_numberWithBool_(v124, v130, isIBSS, v131, v132);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v134, (uint64_t)v133, @"is_ibss", v135);

  uint64_t v136 = NSNumber;
  uint64_t isWEP = objc_msgSend_isWEP(self, v137, v138, v139, v140);
  uint64_t v145 = objc_msgSend_numberWithBool_(v136, v142, isWEP, v143, v144);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v146, (uint64_t)v145, @"is_wep", v147);

  uint64_t v148 = NSNumber;
  uint64_t isWAPI = objc_msgSend_isWAPI(self, v149, v150, v151, v152);
  uint64_t v157 = objc_msgSend_numberWithBool_(v148, v154, isWAPI, v155, v156);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v158, (uint64_t)v157, @"is_wapi", v159);

  uint64_t v160 = NSNumber;
  uint64_t isWPA = objc_msgSend_isWPA(self, v161, v162, v163, v164);
  uint64_t v169 = objc_msgSend_numberWithBool_(v160, v166, isWPA, v167, v168);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v170, (uint64_t)v169, @"is_wpa", v171);

  uint64_t v172 = NSNumber;
  uint64_t isWPA2 = objc_msgSend_isWPA2(self, v173, v174, v175, v176);
  uint64_t v181 = objc_msgSend_numberWithBool_(v172, v178, isWPA2, v179, v180);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v182, (uint64_t)v181, @"is_wpa2", v183);

  uint64_t v184 = NSNumber;
  uint64_t isWPA3 = objc_msgSend_isWPA3(self, v185, v186, v187, v188);
  uint64_t v193 = objc_msgSend_numberWithBool_(v184, v190, isWPA3, v191, v192);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v194, (uint64_t)v193, @"is_wpa3", v195);

  v196 = NSNumber;
  uint64_t isEAP = objc_msgSend_isEAP(self, v197, v198, v199, v200);
  uint64_t v205 = objc_msgSend_numberWithBool_(v196, v202, isEAP, v203, v204);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v206, (uint64_t)v205, @"is_eap", v207);

  v208 = NSNumber;
  uint64_t isPSK = objc_msgSend_isPSK(self, v209, v210, v211, v212);
  v217 = objc_msgSend_numberWithBool_(v208, v214, isPSK, v215, v216);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v218, (uint64_t)v217, @"is_psk", v219);

  uint64_t v224 = objc_msgSend_strongestSupportedSecurityType(self, v220, v221, v222, v223);
  uint64_t v229 = objc_msgSend_WAPISubtype(self, v225, v226, v227, v228);
  uint64_t v232 = sub_1B4F3FE58(v224, 0, v229, v230, v231);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v233, (uint64_t)v232, @"strongest_supported_security_type", v234);

  int v239 = objc_msgSend_supportedPHYModes(self, v235, v236, v237, v238);
  uint64_t v244 = sub_1B4F54CEC(v239, v240, v241, v242, v243);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v245, (uint64_t)v244, @"supported_phy_modes", v246);

  int v251 = objc_msgSend_fastestSupportedPHYMode(self, v247, v248, v249, v250);
  uint64_t v256 = sub_1B4F54CEC(v251, v252, v253, v254, v255);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v257, (uint64_t)v256, @"fastest_supported_phy_mode", v258);

  uint64_t v259 = NSNumber;
  uint64_t isInternetAccessible = objc_msgSend_isInternetAccessible(self, v260, v261, v262, v263);
  uint64_t v268 = objc_msgSend_numberWithBool_(v259, v265, isInternetAccessible, v266, v267);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v269, (uint64_t)v268, @"is_internet_accessible", v270);

  v271 = NSNumber;
  uint64_t isAdditionalStepRequiredForAccess = objc_msgSend_isAdditionalStepRequiredForAccess(self, v272, v273, v274, v275);
  v280 = objc_msgSend_numberWithBool_(v271, v277, isAdditionalStepRequiredForAccess, v278, v279);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v281, (uint64_t)v280, @"is_additional_step_required_for_access", v282);

  uint64_t v283 = NSNumber;
  uint64_t isEmergencyServicesReachable = objc_msgSend_isEmergencyServicesReachable(self, v284, v285, v286, v287);
  uint64_t v292 = objc_msgSend_numberWithBool_(v283, v289, isEmergencyServicesReachable, v290, v291);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v293, (uint64_t)v292, @"is_emergency_services_reachable", v294);

  v295 = NSNumber;
  uint64_t isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_isUnauthenticatedEmergencyServiceAccessible(self, v296, v297, v298, v299);
  v304 = objc_msgSend_numberWithBool_(v295, v301, isUnauthenticatedEmergencyServiceAccessible, v302, v303);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v305, (uint64_t)v304, @"is_unauthenticated_emergency_services_accessible", v306);

  uint64_t v307 = NSNumber;
  uint64_t isUnconfiguredDevice = objc_msgSend_isUnconfiguredDevice(self, v308, v309, v310, v311);
  v316 = objc_msgSend_numberWithBool_(v307, v313, isUnconfiguredDevice, v314, v315);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v317, (uint64_t)v316, @"is_unconfigured_device", v318);

  uint64_t v319 = NSNumber;
  uint64_t v324 = objc_msgSend_providesInternetAccess(self, v320, v321, v322, v323);
  uint64_t v328 = objc_msgSend_numberWithBool_(v319, v325, v324, v326, v327);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v329, (uint64_t)v328, @"provides_internet_access", v330);

  v331 = NSNumber;
  uint64_t v336 = objc_msgSend_venueType(self, v332, v333, v334, v335);
  v340 = objc_msgSend_numberWithInteger_(v331, v337, v336, v338, v339);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v341, (uint64_t)v340, @"venue_type", v342);

  uint64_t v343 = NSNumber;
  uint64_t v348 = objc_msgSend_venueGroup(self, v344, v345, v346, v347);
  v352 = objc_msgSend_numberWithInteger_(v343, v349, v348, v350, v351);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v353, (uint64_t)v352, @"venue_group", v354);

  uint64_t v355 = NSNumber;
  uint64_t v360 = objc_msgSend_supportsWPS(self, v356, v357, v358, v359);
  uint64_t v364 = objc_msgSend_numberWithBool_(v355, v361, v360, v362, v363);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v365, (uint64_t)v364, @"supports_wps", v366);

  uint64_t v367 = NSNumber;
  uint64_t v372 = objc_msgSend_supportsiAPOverWiFi(self, v368, v369, v370, v371);
  uint64_t v376 = objc_msgSend_numberWithBool_(v367, v373, v372, v374, v375);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v377, (uint64_t)v376, @"supports_iap_over_wifi", v378);

  uint64_t v379 = NSNumber;
  uint64_t v384 = objc_msgSend_supports2GHzNetworks(self, v380, v381, v382, v383);
  uint64_t v388 = objc_msgSend_numberWithBool_(v379, v385, v384, v386, v387);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v389, (uint64_t)v388, @"supports_2ghz_networks", v390);

  uint64_t v391 = NSNumber;
  uint64_t v396 = objc_msgSend_supports5GHzNetworks(self, v392, v393, v394, v395);
  uint64_t v400 = objc_msgSend_numberWithBool_(v391, v397, v396, v398, v399);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v401, (uint64_t)v400, @"supports_5ghz_networks", v402);

  v403 = NSNumber;
  uint64_t v408 = objc_msgSend_supportsCarPlay(self, v404, v405, v406, v407);
  uint64_t v412 = objc_msgSend_numberWithBool_(v403, v409, v408, v410, v411);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v413, (uint64_t)v412, @"supports_carplay", v414);

  uint64_t v415 = NSNumber;
  uint64_t v420 = objc_msgSend_supportsHomeKit(self, v416, v417, v418, v419);
  uint64_t v424 = objc_msgSend_numberWithBool_(v415, v421, v420, v422, v423);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v425, (uint64_t)v424, @"supports_homekit", v426);

  uint64_t v427 = NSNumber;
  uint64_t v432 = objc_msgSend_supportsHomeKit2(self, v428, v429, v430, v431);
  long long v436 = objc_msgSend_numberWithBool_(v427, v433, v432, v434, v435);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v437, (uint64_t)v436, @"supports_homekit2", v438);

  uint64_t v439 = NSNumber;
  uint64_t v444 = objc_msgSend_supportsAirPlay(self, v440, v441, v442, v443);
  v448 = objc_msgSend_numberWithBool_(v439, v445, v444, v446, v447);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v449, (uint64_t)v448, @"supports_airplay", v450);

  v451 = NSNumber;
  uint64_t v456 = objc_msgSend_supportsAirPlay2(self, v452, v453, v454, v455);
  v460 = objc_msgSend_numberWithBool_(v451, v457, v456, v458, v459);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v461, (uint64_t)v460, @"supports_airplay2", v462);

  v463 = NSNumber;
  uint64_t v468 = objc_msgSend_supportsAirPrint(self, v464, v465, v466, v467);
  v472 = objc_msgSend_numberWithBool_(v463, v469, v468, v470, v471);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v473, (uint64_t)v472, @"supports_airprint", v474);

  v475 = NSNumber;
  uint64_t v480 = objc_msgSend_supportsMFi(self, v476, v477, v478, v479);
  v484 = objc_msgSend_numberWithBool_(v475, v481, v480, v482, v483);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v485, (uint64_t)v484, @"supports_mfi", v486);

  v487 = NSNumber;
  uint64_t v492 = objc_msgSend_supportsMFi(self, v488, v489, v490, v491);
  v496 = objc_msgSend_numberWithBool_(v487, v493, v492, v494, v495);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v497, (uint64_t)v496, @"supports_mfi", v498);

  v499 = NSNumber;
  uint64_t v504 = objc_msgSend_supportsMFiHardwareAuth(self, v500, v501, v502, v503);
  v508 = objc_msgSend_numberWithBool_(v499, v505, v504, v506, v507);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v509, (uint64_t)v508, @"supports_mfi_hardware_auth", v510);

  v511 = NSNumber;
  uint64_t v516 = objc_msgSend_supportsMFiSoftwareTokenAuth(self, v512, v513, v514, v515);
  v520 = objc_msgSend_numberWithBool_(v511, v517, v516, v518, v519);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v521, (uint64_t)v520, @"supports_mfi_software_token_auth", v522);

  v523 = NSNumber;
  uint64_t v528 = objc_msgSend_supportsMFiSoftwareCertAuth(self, v524, v525, v526, v527);
  v532 = objc_msgSend_numberWithBool_(v523, v529, v528, v530, v531);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v533, (uint64_t)v532, @"supports_mfi_software_cert_auth", v534);

  v535 = NSNumber;
  uint64_t v540 = objc_msgSend_supportsSecureWAC(self, v536, v537, v538, v539);
  v544 = objc_msgSend_numberWithBool_(v535, v541, v540, v542, v543);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v545, (uint64_t)v544, @"supports_secure_wac", v546);

  v547 = NSNumber;
  uint64_t v552 = objc_msgSend_supportsWoW(self, v548, v549, v550, v551);
  v556 = objc_msgSend_numberWithBool_(v547, v553, v552, v554, v555);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v557, (uint64_t)v556, @"supports_wow", v558);

  v563 = objc_msgSend_countryCode(self, v559, v560, v561, v562);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v564, (uint64_t)v563, @"country_code", v565);

  v570 = objc_msgSend_networkName(self, v566, v567, v568, v569);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v571, (uint64_t)v570, @"networkName", v572);

  v577 = objc_msgSend_BSSID(self, v573, v574, v575, v576);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v578, (uint64_t)v577, @"bssid", v579);

  v584 = objc_msgSend_HESSID(self, v580, v581, v582, v583);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v585, (uint64_t)v584, @"hessid", v586);

  v591 = objc_msgSend_friendlyName(self, v587, v588, v589, v590);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v592, (uint64_t)v591, @"friendly_name", v593);

  v598 = objc_msgSend_manufacturerName(self, v594, v595, v596, v597);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v599, (uint64_t)v598, @"manufacturer_name", v600);

  v605 = objc_msgSend_modelName(self, v601, v602, v603, v604);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v606, (uint64_t)v605, @"model_name", v607);

  v612 = objc_msgSend_displayName(self, v608, v609, v610, v611);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v613, (uint64_t)v612, @"display_name", v614);

  v619 = objc_msgSend_primaryMAC(self, v615, v616, v617, v618);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v620, (uint64_t)v619, @"primary_mac", v621);

  v626 = objc_msgSend_bluetoothMAC(self, v622, v623, v624, v625);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v627, (uint64_t)v626, @"bluetooth_name", v628);

  v633 = objc_msgSend_deviceID(self, v629, v630, v631, v632);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v634, (uint64_t)v633, @"device_id", v635);

  v640 = objc_msgSend_cellularNetworkInfo(self, v636, v637, v638, v639);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v641, (uint64_t)v640, @"cellular_network_info", v642);

  v647 = objc_msgSend_NAIRealmNameList(self, v643, v644, v645, v646);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v648, (uint64_t)v647, @"nai_realm_name_list", v649);

  v654 = objc_msgSend_roamingConsortiumList(self, v650, v651, v652, v653);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v655, (uint64_t)v654, @"roaming_consortium_list", v656);

  v661 = objc_msgSend_operatorFriendlyNameList(self, v657, v658, v659, v660);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v662, (uint64_t)v661, @"operator_friendly_name_list", v663);

  v668 = objc_msgSend_domainNameList(self, v664, v665, v666, v667);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v669, (uint64_t)v668, @"domain_name_list", v670);

  v671 = NSNumber;
  uint64_t isWiFi6E = objc_msgSend_isWiFi6E(self, v672, v673, v674, v675);
  v680 = objc_msgSend_numberWithBool_(v671, v677, isWiFi6E, v678, v679);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v681, (uint64_t)v680, @"is_6e", v682);

  v683 = NSNumber;
  uint64_t isFILSDiscoveryFrame = objc_msgSend_isFILSDiscoveryFrame(self, v684, v685, v686, v687);
  v692 = objc_msgSend_numberWithBool_(v683, v689, isFILSDiscoveryFrame, v690, v691);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v693, (uint64_t)v692, @"is_filsd", v694);

  v695 = NSNumber;
  uint64_t v700 = objc_msgSend_shortSSID(self, v696, v697, v698, v699);
  v704 = objc_msgSend_numberWithUnsignedInteger_(v695, v701, v700, v702, v703);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v705, (uint64_t)v704, @"short_ssid", v706);

  v707 = NSNumber;
  uint64_t isAssociationDisallowed = objc_msgSend_isAssociationDisallowed(self, v708, v709, v710, v711);
  v716 = objc_msgSend_numberWithBool_(v707, v713, isAssociationDisallowed, v714, v715);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v717, (uint64_t)v716, @"is_assoc_disallowed", v718);

  long long v775 = 0u;
  long long v776 = 0u;
  long long v773 = 0u;
  long long v774 = 0u;
  v723 = objc_msgSend_RNRBSSList(self, v719, v720, v721, v722);
  uint64_t v725 = objc_msgSend_countByEnumeratingWithState_objects_count_(v723, v724, (uint64_t)&v773, (uint64_t)v778, 16);
  if (v725)
  {
    uint64_t v730 = v725;
    v731 = 0;
    uint64_t v732 = *(void *)v774;
    do
    {
      for (uint64_t i = 0; i != v730; ++i)
      {
        if (*(void *)v774 != v732) {
          objc_enumerationMutation(v723);
        }
        v734 = *(void **)(*((void *)&v773 + 1) + 8 * i);
        if (!v731)
        {
          v731 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v726, v727, v728, v729);
        }
        v735 = objc_msgSend_JSONCompatibleKeyValueMap(v734, v726, v727, v728, v729);
        objc_msgSend_addObject_(v731, v736, (uint64_t)v735, v737, v738);
      }
      uint64_t v730 = objc_msgSend_countByEnumeratingWithState_objects_count_(v723, v726, (uint64_t)&v773, (uint64_t)v778, 16);
    }
    while (v730);
  }
  else
  {
    v731 = 0;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v739, (uint64_t)v731, @"rnr_bss_list", v740);
  long long v771 = 0u;
  long long v772 = 0u;
  long long v769 = 0u;
  long long v770 = 0u;
  v745 = objc_msgSend_RNRChannelList(self, v741, v742, v743, v744, 0);
  uint64_t v747 = objc_msgSend_countByEnumeratingWithState_objects_count_(v745, v746, (uint64_t)&v769, (uint64_t)v777, 16);
  if (v747)
  {
    uint64_t v752 = v747;
    v753 = 0;
    uint64_t v754 = *(void *)v770;
    do
    {
      for (uint64_t j = 0; j != v752; ++j)
      {
        if (*(void *)v770 != v754) {
          objc_enumerationMutation(v745);
        }
        v756 = *(void **)(*((void *)&v769 + 1) + 8 * j);
        if (!v753)
        {
          v753 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v748, v749, v750, v751);
        }
        v757 = objc_msgSend_JSONCompatibleKeyValueMap(v756, v748, v749, v750, v751);
        objc_msgSend_addObject_(v753, v758, (uint64_t)v757, v759, v760);
      }
      uint64_t v752 = objc_msgSend_countByEnumeratingWithState_objects_count_(v745, v748, (uint64_t)&v769, (uint64_t)v777, 16);
    }
    while (v752);
  }
  else
  {
    v753 = 0;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v761, (uint64_t)v753, @"rnr_channel_list", v762);
  v766 = sub_1B4F59CC8(v3, 0, 1u);
  if (v766)
  {
    v767 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v763, (uint64_t)v766, v764, v765);
  }
  else
  {
    v767 = 0;
  }

  return v767;
}

- (id)filteredScanResultWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CWFScanResult);
  uint64_t v10 = objc_msgSend_mutableCopy(self->_internal, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_properties(self, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_mutableCopy(v15, v16, v17, v18, v19);

  uint64_t v25 = objc_msgSend___requiredProperties(self, v21, v22, v23, v24);
  objc_msgSend_minusSet_(v20, v26, (uint64_t)v25, v27, v28);

  if (v4)
  {
    objc_msgSend_minusSet_(v20, v29, (uint64_t)v4, v31, v32);
  }
  else
  {
    uint64_t v37 = objc_msgSend___defaultProperties(self, v29, v30, v31, v32);
    objc_msgSend_minusSet_(v20, v38, (uint64_t)v37, v39, v40);
  }
  uint64_t v41 = objc_msgSend_allObjects(v20, v33, v34, v35, v36);
  objc_msgSend_removeObjectsForKeys_(v10, v42, (uint64_t)v41, v43, v44);

  objc_msgSend_setInternal_(v5, v45, (uint64_t)v10, v46, v47);
  return v5;
}

- (int64_t)compareSupportedSecurityTypes:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_weakestSupportedSecurityType(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_weakestSupportedSecurityType(v4, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_strongestSupportedSecurityType(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_strongestSupportedSecurityType(v4, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_WAPISubtype(self, v25, v26, v27, v28);
  uint64_t v34 = objc_msgSend_WAPISubtype(v4, v30, v31, v32, v33);

  if (v9 == v14)
  {
    if (v19 == v24) {
      return 0;
    }
    uint64_t v36 = v19;
    uint64_t v37 = v29;
    uint64_t v38 = v24;
  }
  else
  {
    uint64_t v36 = v9;
    uint64_t v37 = v29;
    uint64_t v38 = v14;
  }
  return CWFCompareSecurityType(v36, 0, v37, v38, 0, v34);
}

- (int64_t)compareSupportedPHYModes:(id)a3
{
  id v4 = a3;
  int v9 = objc_msgSend_fastestSupportedPHYMode(self, v5, v6, v7, v8);
  int v14 = objc_msgSend_slowestSupportedPHYMode(self, v10, v11, v12, v13);
  int v19 = objc_msgSend_fastestSupportedPHYMode(v4, v15, v16, v17, v18);
  int v24 = objc_msgSend_slowestSupportedPHYMode(v4, v20, v21, v22, v23);

  if (v9 == v19)
  {
    if (v14 == v24) {
      return 0;
    }
    int v26 = v14;
    int v27 = v24;
  }
  else
  {
    int v26 = v9;
    int v27 = v19;
  }
  return CWFComparePHYMode(v26, v27);
}

- (int64_t)compareLowDataModes:(id)a3
{
  id v4 = a3;
  int v9 = objc_msgSend_matchingKnownNetworkProfile(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_lowDataMode(v9, v10, v11, v12, v13);

  int v19 = objc_msgSend_matchingKnownNetworkProfile(v4, v15, v16, v17, v18);

  uint64_t v24 = objc_msgSend_lowDataMode(v19, v20, v21, v22, v23);
  int64_t v25 = v24 == 1;
  if (v14 == 1) {
    int64_t v25 = -1;
  }
  if (v14 == v24) {
    return 0;
  }
  else {
    return v25;
  }
}

- (unint64_t)strongestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  return CWFStrongestSecurityType(v6, v11, 0);
}

- (unint64_t)weakestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  return CWFWeakestSecurityType(v6, v11, 0);
}

- (int64_t)WAPISubtype
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7E78, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)supportedPHYModes
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7DB8, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)fastestSupportedPHYMode
{
  __int16 v5 = objc_msgSend_supportedPHYModes(self, a2, v2, v3, v4);
  int v6 = v5 & 4;
  if ((v5 & 8) != 0) {
    int v6 = 8;
  }
  if ((v5 & 2) != 0) {
    int v7 = 2;
  }
  else {
    int v7 = v6;
  }
  if ((v5 & 0x10) != 0) {
    int v8 = 16;
  }
  else {
    int v8 = v7;
  }
  if ((v5 & 0x80) != 0) {
    int v9 = 128;
  }
  else {
    int v9 = v8;
  }
  if ((v5 & 0x100) != 0) {
    return 256;
  }
  else {
    return v9;
  }
}

- (int)slowestSupportedPHYMode
{
  __int16 v5 = objc_msgSend_supportedPHYModes(self, a2, v2, v3, v4);
  int v6 = v5 & 0x100;
  if ((v5 & 0x80) != 0) {
    int v6 = 128;
  }
  if ((v5 & 0x10) != 0) {
    int v7 = 16;
  }
  else {
    int v7 = v6;
  }
  if ((v5 & 2) != 0) {
    int v8 = 2;
  }
  else {
    int v8 = v7;
  }
  if ((v5 & 8) != 0) {
    int v9 = 8;
  }
  else {
    int v9 = v8;
  }
  if ((v5 & 4) != 0) {
    return 4;
  }
  else {
    return v9;
  }
}

- (NSSet)properties
{
  __int16 v5 = (void *)MEMORY[0x1E4F1CAD0];
  int v6 = objc_msgSend_allKeys(self->_internal, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_setWithArray_(v5, v7, (uint64_t)v6, v8, v9);

  return (NSSet *)v10;
}

- (NSDictionary)scanRecord
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7CE0, v2, v3);
}

- (unint64_t)shortSSID
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8388, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)networkName
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7CF8, v2, v3);
  __int16 v5 = CWFHumanReadableStringFromData(v4);

  return (NSString *)v5;
}

- (BOOL)isAmbiguousNetworkName
{
  __int16 v5 = objc_msgSend_networkName(self, a2, v2, v3, v4);
  unsigned __int8 v10 = sub_1B4F54AF0(v5, v6, v7, v8, v9);

  return v10;
}

- (int64_t)RSSI
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7D40, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)wasConnectedDuringSleep
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7D58, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)noise
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7D70, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)APMode
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7E48, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isESS
{
  return objc_msgSend_APMode(self, a2, v2, v3, v4) == 2;
}

- (BOOL)isIBSS
{
  return objc_msgSend_APMode(self, a2, v2, v3, v4) == 1;
}

- (BOOL)isPersonalHotspot
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7DE8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isHotspot
{
  uint64_t v6 = objc_msgSend_matchingKnownNetworkProfile(self, a2, v2, v3, v4);
  if ((objc_msgSend_isHotspot(v6, v7, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isPasspoint(self, v11, v12, v13, v14) & 1) != 0
    || objc_msgSend_accessNetworkType(self, v15, v16, v17, v18) == 2)
  {

    return 1;
  }
  int v24 = objc_msgSend_accessNetworkType(self, v19, v20, v21, v22);

  return v24 == 3;
}

- (NSString)countryCode
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7D28, v2, v3);
}

- (CWFChannel)channel
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7D10, v2, v3);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"CHANNEL", v6, v7);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"CHANNEL_FLAGS", v10, v11);
  uint64_t v13 = (void *)v12;
  if (v8) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = objc_alloc_init(CWFChannel);
    uint64_t v20 = objc_msgSend_unsignedIntegerValue(v8, v16, v17, v18, v19);
    objc_msgSend_setChannel_(v15, v21, v20, v22, v23);
    uint64_t v28 = objc_msgSend_intValue(v13, v24, v25, v26, v27);
    objc_msgSend_setFlags_(v15, v29, v28, v30, v31);
  }

  return v15;
}

- (int64_t)beaconInterval
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7D88, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)airPortBaseStationModel
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7EA8, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isUnconfiguredAirPortBaseStation
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7E90, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isAppleSWAP
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7E00, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSData)informationElementData
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7E60, v2, v3);
}

- (unint64_t)age
{
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  return (v3 - objc_msgSend_timestamp(self, v4, v5, v6, v7)) / 0xF4240;
}

- (unint64_t)timestamp
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8358, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isOpen
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 9) & 1;
}

- (BOOL)isOWE
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 8) & 1;
}

- (BOOL)isWEP
{
  return objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 1;
}

- (BOOL)isWAPI
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 1) & 1;
}

- (BOOL)isWPA
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC) != 0;
}

- (BOOL)isWPA2
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x30) != 0;
}

- (BOOL)isWPA3
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC0) != 0;
}

- (BOOL)isPSK
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x57) != 0;
}

- (BOOL)isEAP
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xA8) != 0;
}

- (BOOL)isPasspoint
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7DD0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setOSSpecificAttributes:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    uint64_t v40 = self;
    char v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6, v7);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    BOOL v14 = objc_msgSend_allKeys(v8, v10, v11, v12, v13);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v41, (uint64_t)v53, 16);
    if (v16)
    {
      uint64_t v21 = v16;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v14);
          }
          uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_supportedOSSpecificKeys(CWFScanResult, v17, v18, v19, v20, v38, v39);
          int v29 = objc_msgSend_containsObject_(v25, v26, v24, v27, v28);

          if (v29)
          {
            uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v8, v30, v24, v31, v32);
            objc_msgSend_setObject_forKeyedSubscript_(v9, v34, (uint64_t)v33, v24, v35);
          }
          else
          {
            uint64_t v36 = CWFGetOSLog();
            if (v36)
            {
              uint64_t v33 = CWFGetOSLog();
            }
            else
            {
              uint64_t v33 = MEMORY[0x1E4F14500];
              id v37 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              int v45 = 136446978;
              uint64_t v46 = "-[CWFScanResult setOSSpecificAttributes:]";
              __int16 v47 = 2082;
              uint64_t v48 = "CWFScanResult.m";
              __int16 v49 = 1024;
              int v50 = 1083;
              __int16 v51 = 2112;
              uint64_t v52 = v24;
              LODWORD(v39) = 38;
              uint64_t v38 = &v45;
              _os_log_send_and_compose_impl();
            }
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v41, (uint64_t)v53, 16);
      }
      while (v21);
    }

    self = v40;
  }
  else
  {
    char v9 = 0;
  }
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v4, (uint64_t)v9, (uint64_t)&unk_1F0DC8328, v7, v38, v39);
}

- (NSDictionary)OSSpecificAttributes
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8328, v2, v3);
  char v9 = objc_msgSend_copy(v4, v5, v6, v7, v8);

  return (NSDictionary *)v9;
}

- (void)setOSSpecificValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (v11
    && (objc_msgSend_supportedOSSpecificKeys(CWFScanResult, v7, v8, v9, v10),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_1F0DC8328, v18, v19);

    if (v6 && !v20)
    {
      uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v21, v22, v23, v24);
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1F0DC8328, v27);
    }
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_1F0DC8328, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v6, (uint64_t)v11, v30);
  }
  else
  {
    uint64_t v31 = CWFGetOSLog();
    if (v31)
    {
      uint64_t v28 = CWFGetOSLog();
    }
    else
    {
      uint64_t v28 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (id)OSSpecificValueForKey:(id)a3
{
  if (a3)
  {
    internal = self->_internal;
    id v4 = a3;
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_1F0DC8328, v6, v7);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (void)setMatchingKnownNetworkProfile:(id)a3
{
  id v8 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC8340, v7);
}

- (BOOL)isMetered
{
  if (objc_msgSend_isPasspoint(self, a2, v2, v3, v4))
  {
    BOOL v14 = objc_msgSend_accessNetworkType(self, v6, v7, v8, v9) == 2;
  }
  else
  {
    uint64_t v15 = objc_msgSend_matchingKnownNetworkProfile(self, v6, v7, v8, v9);
    if (objc_msgSend_isCaptive(v15, v16, v17, v18, v19)) {
      BOOL v14 = objc_msgSend_accessNetworkType(self, v20, v21, v22, v23) == 2;
    }
    else {
      BOOL v14 = 0;
    }
  }
  if ((objc_msgSend_isPersonalHotspot(self, v10, v11, v12, v13) & 1) != 0
    || v14
    || (int v28 = objc_msgSend_supportsCarPlay(self, v24, v25, v26, v27)) != 0)
  {
    LOBYTE(v28) = 1;
  }
  return v28;
}

- (BOOL)isAllowedInLockdownMode
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isOWE(self, v6, v7, v8, v9) & 1) == 0
      && (!objc_msgSend_isWEP(self, v10, v11, v12, v13)
       || (objc_msgSend_isPSK(self, v14, v15, v16, v17) & 1) == 0)
      && (!objc_msgSend_isWPA(self, v14, v15, v16, v17)
       || (objc_msgSend_isPSK(self, v18, v19, v20, v21) & 1) == 0)
      && (objc_msgSend_isWAPI(self, v18, v19, v20, v21) & 1) == 0
      && (objc_msgSend_isPasspoint(self, v22, v23, v24, v25) & 1) == 0
      && (objc_msgSend_hasWEP40Cipher(self, v26, v27, v28, v29) & 1) == 0
      && (objc_msgSend_hasWEP104Cipher(self, v30, v31, v32, v33) & 1) == 0
      && !objc_msgSend_hasTKIPCipher(self, v34, v35, v36, v37);
}

- (NSArray)WPAUnicastCiphers
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8268, v2, v3);
}

- (unint64_t)WPAMulticastCipher
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8280, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSArray)WPAAuthSelectors
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8298, v2, v3);
}

- (NSArray)RSNUnicastCiphers
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC82B0, v2, v3);
}

- (unint64_t)RSNMulticastCipher
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC82C8, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)RSNBroadcastCipher
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC82E0, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSArray)RSNAuthSelectors
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC82F8, v2, v3);
}

- (int)RSNCapabilities
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8310, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isMFPCapable
{
  return (objc_msgSend_RSNCapabilities(self, a2, v2, v3, v4) >> 7) & 1;
}

- (BOOL)isMFPRequired
{
  return (objc_msgSend_RSNCapabilities(self, a2, v2, v3, v4) >> 6) & 1;
}

- (BOOL)hasWEP40Cipher
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 1
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 1)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      uint64_t v22 = v17;
      uint64_t v23 = *(void *)v43;
LABEL_6:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v42 + 1) + 8 * v24), v18, v19, v20, v21) == 1) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      uint64_t v29 = objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v15 = v29;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }
      uint64_t v35 = *(void *)v39;
LABEL_14:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v38 + 1) + 8 * v36), v31, v32, v33, v34, (void)v38) == 1)break; {
        if (v14 == ++v36)
        }
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)hasWEP104Cipher
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 5
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 5)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      uint64_t v22 = v17;
      uint64_t v23 = *(void *)v43;
LABEL_6:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v42 + 1) + 8 * v24), v18, v19, v20, v21) == 5) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      uint64_t v29 = objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v15 = v29;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }
      uint64_t v35 = *(void *)v39;
LABEL_14:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v38 + 1) + 8 * v36), v31, v32, v33, v34, (void)v38) == 5)break; {
        if (v14 == ++v36)
        }
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)hasTKIPCipher
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 2
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 2)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      uint64_t v22 = v17;
      uint64_t v23 = *(void *)v43;
LABEL_6:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v42 + 1) + 8 * v24), v18, v19, v20, v21) == 2) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      uint64_t v29 = objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v15 = v29;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }
      uint64_t v35 = *(void *)v39;
LABEL_14:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v38 + 1) + 8 * v36), v31, v32, v33, v34, (void)v38) == 2)break; {
        if (v14 == ++v36)
        }
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (int)accessNetworkType
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7EC0, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isInternetAccessible
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7ED8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isAdditionalStepRequiredForAccess
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7EF0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEmergencyServicesReachable
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F08, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isUnauthenticatedEmergencyServiceAccessible
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F20, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)venueGroup
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F38, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)venueType
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F50, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)HESSID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F68, v2, v3);
}

- (BOOL)isUnconfiguredDevice
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F80, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)providesInternetAccess
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7F98, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsWPS
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7FB0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsiAPOverWiFi
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7FC8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supports2GHzNetworks
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7FE0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supports5GHzNetworks
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7FF8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFi
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC80A0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiHardwareAuth
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC80B8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiSoftwareTokenAuth
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC80D0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiSoftwareCertAuth
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC80E8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsHomeKit
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8028, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsHomeKit2
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8040, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPrint
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8088, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsWoW
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8118, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsCarPlay
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8010, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsSecureWAC
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8100, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPlay
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8058, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPlay2
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8070, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)friendlyName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8130, v2, v3);
}

- (NSString)manufacturerName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8148, v2, v3);
}

- (NSString)modelName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8160, v2, v3);
}

- (NSString)displayName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8178, v2, v3);
}

- (NSString)primaryMAC
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8190, v2, v3);
}

- (NSString)bluetoothMAC
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC81A8, v2, v3);
}

- (NSString)deviceID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC81C0, v2, v3);
}

- (NSDictionary)ANQPResponse
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC81D8, v2, v3);
}

- (NSArray)cellularNetworkInfo
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC81F0, v2, v3);
}

- (NSArray)NAIRealmNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8208, v2, v3);
}

- (NSArray)roamingConsortiumList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8220, v2, v3);
}

- (NSArray)operatorFriendlyNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8238, v2, v3);
}

- (NSArray)domainNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC8250, v2, v3);
}

- (NSArray)RNRBSSList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC83A0, v2, v3);
}

- (BOOL)isWiFi6E
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_channel(self, a2, v2, v3, v4);
  char v11 = objc_msgSend_is6GHz(v6, v7, v8, v9, v10);

  if (v11)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v17 = objc_msgSend_RNRBSSList(self, v12, v13, v14, v15, 0);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, (uint64_t)v41, 16);
    if (v16)
    {
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v17);
          }
          uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend_channel(v25, v19, v20, v21, v22);
          if (objc_msgSend_is6GHz(v26, v27, v28, v29, v30))
          {
            char isColocatedAP = objc_msgSend_isColocatedAP(v25, v31, v32, v33, v34);

            if (isColocatedAP)
            {
              LOBYTE(v16) = 1;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v37, (uint64_t)v41, 16);
      }
      while (v16);
    }
LABEL_14:
  }
  return v16;
}

- (NSArray)RNRChannelList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC83D0, v2, v3);
}

- (BOOL)hasNon6GHzRNRChannel
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = objc_msgSend_RNRChannelList(self, a2, v2, v3, v4, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_msgSend_is2GHz(v15, v8, v9, v10, v11) & 1) != 0
          || (objc_msgSend_is5GHz(v15, v16, v17, v18, v19) & 1) != 0)
        {
          BOOL v20 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v22, (uint64_t)v26, 16);
      BOOL v20 = 0;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_13:

  return v20;
}

- (BOOL)isAssociationDisallowed
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC83B8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isBackgroundScanResult
{
  uint64_t v5 = objc_msgSend_networkFlags(self, a2, v2, v3, v4);
  char v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_1F0DC8400, v7, v8);

  return v9;
}

- (NSString)privateMACAddress
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC83E8, v2, v3);
}

- (id)__descriptionForWPACipher:(int)a3
{
  if a3 < 6 && ((0x37u >> a3))
  {
    uint64_t v5 = off_1E60BD1B0[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)__descriptionForWPAAuthSel:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BD1E0[a3];
  }
  return v5;
}

- (id)__descriptionForWPAIE
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_scanRecord(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"WPA_IE", v8, v9);

  if (v10
    || (objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v11, (uint64_t)&unk_1F0DC88E0, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_properties(self, v15, v16, v17, v18),
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v14, v20, (uint64_t)v19, v21, v22),
        v19,
        v14,
        isSubsetOfSet))
  {
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"IE_KEY_WPA_MCIPHER", v12, v13);
    if (!v28)
    {
      uint64_t v29 = NSNumber;
      uint64_t v30 = objc_msgSend_WPAMulticastCipher(self, v24, v25, v26, v27);
      uint64_t v28 = objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32, v33);
    }
    long long v38 = objc_msgSend_objectForKeyedSubscript_(v10, v24, @"IE_KEY_WPA_UCIPHERS", v26, v27);
    if (!v38)
    {
      long long v38 = objc_msgSend_WPAUnicastCiphers(self, v34, v35, v36, v37);
    }
    long long v43 = objc_msgSend_objectForKeyedSubscript_(v10, v34, @"IE_KEY_WPA_AUTHSELS", v36, v37);
    if (!v43)
    {
      long long v43 = objc_msgSend_WPAAuthSelectors(self, v39, v40, v41, v42);
    }
    long long v44 = objc_msgSend_string(MEMORY[0x1E4F28E78], v39, v40, v41, v42);
    objc_msgSend_appendString_(v44, v45, @"[", v46, v47);
    uint64_t v114 = v28;
    uint64_t v52 = objc_msgSend_intValue(v28, v48, v49, v50, v51);
    uint64_t v56 = objc_msgSend___descriptionForWPACipher_(self, v53, v52, v54, v55);
    objc_msgSend_appendFormat_(v44, v57, @"mcast=%@, ", v58, v59, v56);

    objc_msgSend_appendString_(v44, v60, @"ucast={ ", v61, v62);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v63 = v38;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v119, (uint64_t)v124, 16);
    if (v65)
    {
      uint64_t v70 = v65;
      uint64_t v71 = *(void *)v120;
      do
      {
        uint64_t v72 = 0;
        do
        {
          if (*(void *)v120 != v71) {
            objc_enumerationMutation(v63);
          }
          uint64_t v73 = objc_msgSend_intValue(*(void **)(*((void *)&v119 + 1) + 8 * v72), v66, v67, v68, v69);
          v77 = objc_msgSend___descriptionForWPACipher_(self, v74, v73, v75, v76);
          objc_msgSend_appendFormat_(v44, v78, @"%@ ", v79, v80, v77);

          ++v72;
        }
        while (v70 != v72);
        uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v119, (uint64_t)v124, 16);
      }
      while (v70);
    }

    objc_msgSend_appendString_(v44, v81, @"}, ", v82, v83);
    objc_msgSend_appendString_(v44, v84, @"auths={ ", v85, v86);
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v87 = v43;
    uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v115, (uint64_t)v123, 16);
    if (v89)
    {
      uint64_t v94 = v89;
      uint64_t v95 = *(void *)v116;
      do
      {
        uint64_t v96 = 0;
        do
        {
          if (*(void *)v116 != v95) {
            objc_enumerationMutation(v87);
          }
          uint64_t v97 = objc_msgSend_intValue(*(void **)(*((void *)&v115 + 1) + 8 * v96), v90, v91, v92, v93);
          v101 = objc_msgSend___descriptionForWPAAuthSel_(self, v98, v97, v99, v100);
          objc_msgSend_appendFormat_(v44, v102, @"%@ ", v103, v104, v101);

          ++v96;
        }
        while (v94 != v96);
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v115, (uint64_t)v123, 16);
      }
      while (v94);
    }

    objc_msgSend_appendString_(v44, v105, @"}", v106, v107);
    objc_msgSend_appendString_(v44, v108, @"]", v109, v110);
    uint64_t v111 = v114;
  }
  else
  {
    id v63 = 0;
    id v87 = 0;
    uint64_t v111 = 0;
    long long v44 = 0;
  }
  id v112 = v44;

  return v112;
}

- (id)__descriptionForRSNCipher:(int)a3
{
  if a3 < 0xE && ((0x3B7Fu >> a3))
  {
    uint64_t v5 = off_1E60BD1F8[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)__descriptionForRSNAuthSel:(int)a3
{
  if a3 < 0x1A && ((0x30033FFu >> a3))
  {
    uint64_t v5 = off_1E60BD268[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)__descriptionForRSNIE
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_scanRecord(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"RSN_IE", v8, v9);

  if (v10
    || (objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v11, (uint64_t)&unk_1F0DC88F8, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_properties(self, v15, v16, v17, v18),
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v14, v20, (uint64_t)v19, v21, v22),
        v19,
        v14,
        isSubsetOfSet))
  {
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"IE_KEY_RSN_MCIPHER", v12, v13);
    if (!v28)
    {
      uint64_t v29 = NSNumber;
      uint64_t v30 = objc_msgSend_RSNMulticastCipher(self, v24, v25, v26, v27);
      uint64_t v28 = objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32, v33);
    }
    long long v38 = objc_msgSend_objectForKeyedSubscript_(v10, v24, @"IE_KEY_RSN_BCIPHER", v26, v27);
    if (!v38)
    {
      long long v39 = NSNumber;
      uint64_t v40 = objc_msgSend_RSNBroadcastCipher(self, v34, v35, v36, v37);
      long long v38 = objc_msgSend_numberWithUnsignedLongLong_(v39, v41, v40, v42, v43);
    }
    uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v10, v34, @"IE_KEY_RSN_UCIPHERS", v36, v37);
    if (!v48)
    {
      uint64_t v48 = objc_msgSend_RSNUnicastCiphers(self, v44, v45, v46, v47);
    }
    uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v10, v44, @"IE_KEY_RSN_AUTHSELS", v46, v47);
    if (!v49)
    {
      uint64_t v49 = objc_msgSend_RSNAuthSelectors(self, v50, v51, v52, v53);
    }
    uint64_t v178 = (void *)v49;
    uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v10, v50, @"IE_KEY_RSN_CAPS", v52, v53);
    uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v54, v55, @"RSN_CAPABILITIES", v56, v57);

    if (!v58)
    {
      id v63 = NSNumber;
      uint64_t v64 = objc_msgSend_RSNCapabilities(self, v59, v60, v61, v62);
      uint64_t v58 = objc_msgSend_numberWithUnsignedInt_(v63, v65, v64, v66, v67);
    }
    uint64_t v68 = objc_msgSend_string(MEMORY[0x1E4F28E78], v59, v60, v61, v62);
    objc_msgSend_appendString_(v68, v69, @"[", v70, v71);
    uint64_t v180 = v28;
    uint64_t v76 = objc_msgSend_intValue(v28, v72, v73, v74, v75);
    uint64_t v80 = objc_msgSend___descriptionForRSNCipher_(self, v77, v76, v78, v79);
    objc_msgSend_appendFormat_(v68, v81, @"mcast=%@, ", v82, v83, v80);

    uint64_t v179 = v38;
    uint64_t v88 = objc_msgSend_intValue(v38, v84, v85, v86, v87);
    uint64_t v92 = objc_msgSend___descriptionForRSNCipher_(self, v89, v88, v90, v91);
    objc_msgSend_appendFormat_(v68, v93, @"bip=%@, ", v94, v95, v92);

    objc_msgSend_appendString_(v68, v96, @"ucast={ ", v97, v98);
    long long v188 = 0u;
    long long v189 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    id v99 = v48;
    uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v186, (uint64_t)v191, 16);
    if (v101)
    {
      uint64_t v106 = v101;
      uint64_t v107 = *(void *)v187;
      do
      {
        uint64_t v108 = 0;
        do
        {
          if (*(void *)v187 != v107) {
            objc_enumerationMutation(v99);
          }
          uint64_t v109 = objc_msgSend_intValue(*(void **)(*((void *)&v186 + 1) + 8 * v108), v102, v103, v104, v105);
          uint64_t v113 = objc_msgSend___descriptionForRSNCipher_(self, v110, v109, v111, v112);
          objc_msgSend_appendFormat_(v68, v114, @"%@ ", v115, v116, v113);

          ++v108;
        }
        while (v106 != v108);
        uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v186, (uint64_t)v191, 16);
      }
      while (v106);
    }
    uint64_t v181 = v10;

    objc_msgSend_appendString_(v68, v117, @"}, ", v118, v119);
    objc_msgSend_appendString_(v68, v120, @"auths={ ", v121, v122);
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    id v123 = v178;
    uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v124, (uint64_t)&v182, (uint64_t)v190, 16);
    if (v125)
    {
      uint64_t v130 = v125;
      uint64_t v131 = *(void *)v183;
      do
      {
        uint64_t v132 = 0;
        do
        {
          if (*(void *)v183 != v131) {
            objc_enumerationMutation(v123);
          }
          uint64_t v133 = objc_msgSend_intValue(*(void **)(*((void *)&v182 + 1) + 8 * v132), v126, v127, v128, v129);
          uint64_t v137 = objc_msgSend___descriptionForRSNAuthSel_(self, v134, v133, v135, v136);
          objc_msgSend_appendFormat_(v68, v138, @"%@ ", v139, v140, v137);

          ++v132;
        }
        while (v130 != v132);
        uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v126, (uint64_t)&v182, (uint64_t)v190, 16);
      }
      while (v130);
    }

    objc_msgSend_appendString_(v68, v141, @"}, ", v142, v143);
    char v148 = objc_msgSend_unsignedIntValue(v58, v144, v145, v146, v147);
    char v153 = objc_msgSend_unsignedIntValue(v58, v149, v150, v151, v152);
    uint64_t v157 = "capable";
    if ((v148 & 0x80) == 0) {
      uint64_t v157 = "no";
    }
    if ((v153 & 0x40) != 0) {
      uint64_t v157 = "required";
    }
    objc_msgSend_appendFormat_(v68, v154, @"mfp=%s, ", v155, v156, v157);
    if (v58)
    {
      uint64_t v162 = NSString;
      int v163 = objc_msgSend_shortValue(v58, v158, v159, v160, v161);
      uint64_t v167 = objc_msgSend_stringWithFormat_(v162, v164, @"0x%X", v165, v166, v163);
      objc_msgSend_appendFormat_(v68, v168, @"caps=%@", v169, v170, v167);
    }
    else
    {
      objc_msgSend_appendFormat_(v68, v158, @"caps=%@", v160, v161, @"n/a");
    }
    uint64_t v174 = v180;
    uint64_t v10 = v181;
    uint64_t v175 = v179;
    objc_msgSend_appendString_(v68, v171, @"]", v172, v173);
  }
  else
  {
    uint64_t v175 = 0;
    id v99 = 0;
    id v123 = 0;
    uint64_t v58 = 0;
    uint64_t v174 = 0;
    uint64_t v68 = 0;
  }
  id v176 = v68;

  return v176;
}

- (id)__descriptionForAirPortBaseStationModel:(int64_t)a3
{
  switch(a3)
  {
    case 'f':
      uint64_t v6 = @"AirPort Express (802.11 b/g)";
      break;
    case 'g':
    case 'n':
    case 'o':
    case 'p':
    case 'v':
      goto LABEL_10;
    case 'h':
      uint64_t v6 = @"AirPort Extreme 802.11n (1st Generation)";
      break;
    case 'i':
      uint64_t v6 = @"AirPort Extreme 802.11n w/ Gigabit Ethernet (2nd Generation)";
      break;
    case 'j':
      uint64_t v6 = @"Time Capsule (1st Generation)";
      break;
    case 'k':
      uint64_t v6 = @"AirPort Express 802.11n (1st Generation)";
      break;
    case 'l':
      uint64_t v6 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (3rd Generation)";
      break;
    case 'm':
      uint64_t v6 = @"Time Capsule w/ Simultaneous Dual-Band (2nd Generation)";
      break;
    case 'q':
      uint64_t v6 = @"Time Capsule w/ Simultaneous Dual-Band (3rd Generation)";
      break;
    case 'r':
      uint64_t v6 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (4th Generation)";
      break;
    case 's':
      uint64_t v6 = @"AirPort Express 802.11n w/ Simultaneous Dual-Band (2nd Generation)";
      break;
    case 't':
      uint64_t v6 = @"Time Capsule w/ Simultaneous Dual-Band (4th Generation)";
      break;
    case 'u':
      uint64_t v6 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (5th Generation)";
      break;
    case 'w':
      uint64_t v6 = @"Time Capsule 802.11ac (5th Generation)";
      break;
    case 'x':
      uint64_t v6 = @"AirPort Extreme 802.11ac (6th Generation)";
      break;
    default:
      if (a3)
      {
        if (a3 == 3)
        {
          uint64_t v6 = @"AirPort Extreme (802.11 b/g)";
        }
        else
        {
LABEL_10:
          objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", v3, v4, a3);
          uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
      break;
  }
  return v6;
}

- (NSString)description
{
  uint64_t v463 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_SSID(self, v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v16 = objc_msgSend_networkName(self, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_redactedForWiFi(v16, v17, v18, v19, v20);

    if ((objc_msgSend_hasPrefix_(v21, v22, @" ", v23, v24) & 1) != 0
      || objc_msgSend_hasSuffix_(v21, v25, @" ", v26, v27))
    {
      uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v25, @"'%@'", v26, v27, v21);

      uint64_t v21 = (void *)v28;
    }
    objc_msgSend_appendFormat_(v6, v25, @"%@ - ", v26, v27, v21);
    uint64_t v33 = objc_msgSend_SSID(self, v29, v30, v31, v32);
    long long v38 = CWFHexadecimalStringFromData(v33, v34, v35, v36, v37);
    uint64_t v43 = objc_msgSend_redactedForWiFi(v38, v39, v40, v41, v42);
    uint64_t v48 = objc_msgSend_shortSSID(self, v44, v45, v46, v47);
    objc_msgSend_appendFormat_(v6, v49, @"ssid=%@ (%lu), ", v50, v51, v43, v48);
  }
  uint64_t v52 = objc_msgSend_BSSID(self, v12, v13, v14, v15);

  if (v52)
  {
    uint64_t v57 = objc_msgSend_BSSID(self, v53, v54, v55, v56);
    uint64_t v62 = objc_msgSend_redactedForWiFi(v57, v58, v59, v60, v61);
    objc_msgSend_appendFormat_(v6, v63, @"bssid=%@, ", v64, v65, v62);
  }
  if (objc_msgSend_supportedSecurityTypes(self, v53, v54, v55, v56))
  {
    uint64_t v70 = objc_msgSend_supportedSecurityTypes(self, v66, v67, v68, v69);
    uint64_t v75 = objc_msgSend_WAPISubtype(self, v71, v72, v73, v74);
    uint64_t v78 = sub_1B4F3FE58(v70, 0, v75, v76, v77);
    objc_msgSend_appendFormat_(v6, v79, @"security=%@, ", v80, v81, v78);
  }
  uint64_t v82 = objc_msgSend___descriptionForRSNIE(self, v66, v67, v68, v69);
  uint64_t v87 = (void *)v82;
  if (v82) {
    objc_msgSend_appendFormat_(v6, v83, @"rsn=%@, ", v85, v86, v82);
  }
  uint64_t v88 = objc_msgSend___descriptionForWPAIE(self, v83, v84, v85, v86);
  uint64_t v93 = (void *)v88;
  if (v88) {
    objc_msgSend_appendFormat_(v6, v89, @"wpa=%@, ", v91, v92, v88);
  }
  uint64_t v94 = objc_msgSend_channel(self, v89, v90, v91, v92);

  if (v94)
  {
    id v99 = objc_msgSend_channel(self, v95, v96, v97, v98);
    objc_msgSend_appendFormat_(v6, v100, @"channel=%@", v101, v102, v99);

    uint64_t v107 = objc_msgSend_RNRChannelList(self, v103, v104, v105, v106);
    if (objc_msgSend_count(v107, v108, v109, v110, v111))
    {
      objc_msgSend_appendString_(v6, v112, @" ("), v113, v114;
      long long v454 = 0u;
      long long v455 = 0u;
      long long v452 = 0u;
      long long v453 = 0u;
      id v115 = v107;
      uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v452, (uint64_t)v462, 16);
      if (v117)
      {
        uint64_t v121 = v117;
        uint64_t v122 = *(void *)v453;
        do
        {
          uint64_t v123 = 0;
          do
          {
            if (*(void *)v453 != v122) {
              objc_enumerationMutation(v115);
            }
            objc_msgSend_appendFormat_(v6, v118, @"%@, ", v119, v120, *(void *)(*((void *)&v452 + 1) + 8 * v123++));
          }
          while (v121 != v123);
          uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v452, (uint64_t)v462, 16);
        }
        while (v121);
      }

      uint64_t v128 = objc_msgSend_length(v6, v124, v125, v126, v127);
      objc_msgSend_deleteCharactersInRange_(v6, v129, v128 - 2, 2, v130);
      objc_msgSend_appendString_(v6, v131, @", "), v132, v133);
    }
    else
    {
      objc_msgSend_appendString_(v6, v112, @", ", v113, v114);
    }
  }
  uint64_t v134 = objc_msgSend_countryCode(self, v95, v96, v97, v98);

  if (v134)
  {
    uint64_t v139 = objc_msgSend_countryCode(self, v135, v136, v137, v138);
    objc_msgSend_appendFormat_(v6, v140, @"cc=%@, ", v141, v142, v139);
  }
  if (objc_msgSend_supportedPHYModes(self, v135, v136, v137, v138))
  {
    int v147 = objc_msgSend_supportedPHYModes(self, v143, v144, v145, v146);
    uint64_t v152 = sub_1B4F54CEC(v147, v148, v149, v150, v151);
    objc_msgSend_appendFormat_(v6, v153, @"phy=%@, ", v154, v155, v152);
  }
  if (objc_msgSend_RSSI(self, v143, v144, v145, v146))
  {
    uint64_t v160 = objc_msgSend_RSSI(self, v156, v157, v158, v159);
    objc_msgSend_appendFormat_(v6, v161, @"rssi=%li, ", v162, v163, v160);
  }
  unsigned int v164 = objc_msgSend_wasConnectedDuringSleep(self, v156, v157, v158, v159);
  objc_msgSend_appendFormat_(v6, v165, @"wasConnectedDuringSleep=%li, ", v166, v167, v164);
  if (objc_msgSend_beaconInterval(self, v168, v169, v170, v171))
  {
    uint64_t v176 = objc_msgSend_beaconInterval(self, v172, v173, v174, v175);
    objc_msgSend_appendFormat_(v6, v177, @"bi=%li, ", v178, v179, v176);
  }
  if (objc_msgSend_isPasspoint(self, v172, v173, v174, v175)) {
    objc_msgSend_appendString_(v6, v180, @"hs20=yes, ", v182, v183);
  }
  if (objc_msgSend_isIBSS(self, v180, v181, v182, v183)) {
    objc_msgSend_appendString_(v6, v184, @"ibss=yes, ", v186, v187);
  }
  if (objc_msgSend_isPersonalHotspot(self, v184, v185, v186, v187)) {
    objc_msgSend_appendString_(v6, v188, @"ph=yes, ", v190, v191);
  }
  if (objc_msgSend_isAppleSWAP(self, v188, v189, v190, v191)) {
    objc_msgSend_appendString_(v6, v192, @"swap=yes, ", v194, v195);
  }
  if (objc_msgSend_supportsCarPlay(self, v192, v193, v194, v195)) {
    objc_msgSend_appendString_(v6, v196, @"carplay=yes, ", v198, v199);
  }
  uint64_t v200 = objc_msgSend_airPortBaseStationModel(self, v196, v197, v198, v199);
  if (v200)
  {
    uint64_t v205 = objc_msgSend___descriptionForAirPortBaseStationModel_(self, v201, v200, v203, v204);
    objc_msgSend_appendFormat_(v6, v206, @"airport=[%@], ", v207, v208, v205);
  }
  if (objc_msgSend_isWiFi6E(self, v201, v202, v203, v204)) {
    objc_msgSend_appendString_(v6, v209, @"6e=yes, ", v211, v212);
  }
  if (objc_msgSend_isFILSDiscoveryFrame(self, v209, v210, v211, v212)) {
    objc_msgSend_appendString_(v6, v213, @"filsd=yes, ", v215, v216);
  }
  v217 = objc_msgSend_RNRBSSList(self, v213, v214, v215, v216);
  if (objc_msgSend_count(v217, v218, v219, v220, v221))
  {
    objc_msgSend_appendString_(v6, v222, @"rnr=[", v224, v225);
    long long v450 = 0u;
    long long v451 = 0u;
    long long v448 = 0u;
    long long v449 = 0u;
    id v226 = v217;
    uint64_t v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v227, (uint64_t)&v448, (uint64_t)v461, 16);
    if (v228)
    {
      uint64_t v232 = v228;
      uint64_t v233 = *(void *)v449;
      do
      {
        uint64_t v234 = 0;
        do
        {
          if (*(void *)v449 != v233) {
            objc_enumerationMutation(v226);
          }
          objc_msgSend_appendFormat_(v6, v229, @"(%@), ", v230, v231, *(void *)(*((void *)&v448 + 1) + 8 * v234++));
        }
        while (v232 != v234);
        uint64_t v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v229, (uint64_t)&v448, (uint64_t)v461, 16);
      }
      while (v232);
    }

    uint64_t v239 = objc_msgSend_length(v6, v235, v236, v237, v238);
    objc_msgSend_deleteCharactersInRange_(v6, v240, v239 - 2, 2, v241);
    objc_msgSend_appendString_(v6, v242, @"], ", v243, v244);
  }
  if (objc_msgSend_isBackgroundScanResult(self, v222, v223, v224, v225)) {
    objc_msgSend_appendString_(v6, v245, @"bgscan=yes, ", v247, v248);
  }
  if (objc_msgSend_isPasspoint(self, v245, v246, v247, v248))
  {
    uint64_t v427 = objc_msgSend_domainNameList(self, v249, v250, v251, v252);
    if (objc_msgSend_count(v427, v253, v254, v255, v256))
    {
      objc_msgSend_appendString_(v6, v257, @"hs20-domains=[", v259, v260);
      long long v446 = 0u;
      long long v447 = 0u;
      long long v444 = 0u;
      long long v445 = 0u;
      id v261 = v427;
      uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v262, (uint64_t)&v444, (uint64_t)v460, 16);
      if (v263)
      {
        uint64_t v267 = v263;
        uint64_t v268 = *(void *)v445;
        do
        {
          uint64_t v269 = 0;
          do
          {
            if (*(void *)v445 != v268) {
              objc_enumerationMutation(v261);
            }
            objc_msgSend_appendFormat_(v6, v264, @"%@, ", v265, v266, *(void *)(*((void *)&v444 + 1) + 8 * v269++));
          }
          while (v267 != v269);
          uint64_t v267 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v264, (uint64_t)&v444, (uint64_t)v460, 16);
        }
        while (v267);
      }

      uint64_t v274 = objc_msgSend_length(v6, v270, v271, v272, v273);
      objc_msgSend_deleteCharactersInRange_(v6, v275, v274 - 2, 2, v276);
      objc_msgSend_appendString_(v6, v277, @"], ", v278, v279);
    }
    v280 = objc_msgSend_NAIRealmNameList(self, v257, v258, v259, v260);
    uint64_t v424 = v93;
    if (objc_msgSend_count(v280, v281, v282, v283, v284))
    {
      objc_msgSend_appendString_(v6, v285, @"hs20-nai=[", v287, v288);
      long long v442 = 0u;
      long long v443 = 0u;
      long long v440 = 0u;
      long long v441 = 0u;
      uint64_t v289 = v280;
      id v290 = v280;
      uint64_t v292 = objc_msgSend_countByEnumeratingWithState_objects_count_(v290, v291, (uint64_t)&v440, (uint64_t)v459, 16);
      if (v292)
      {
        uint64_t v296 = v292;
        uint64_t v297 = *(void *)v441;
        do
        {
          uint64_t v298 = 0;
          do
          {
            if (*(void *)v441 != v297) {
              objc_enumerationMutation(v290);
            }
            objc_msgSend_appendFormat_(v6, v293, @"%@, ", v294, v295, *(void *)(*((void *)&v440 + 1) + 8 * v298++));
          }
          while (v296 != v298);
          uint64_t v296 = objc_msgSend_countByEnumeratingWithState_objects_count_(v290, v293, (uint64_t)&v440, (uint64_t)v459, 16);
        }
        while (v296);
      }

      uint64_t v303 = objc_msgSend_length(v6, v299, v300, v301, v302);
      objc_msgSend_deleteCharactersInRange_(v6, v304, v303 - 2, 2, v305);
      objc_msgSend_appendString_(v6, v306, @"], ", v307, v308);
      v280 = v289;
    }
    uint64_t v425 = v87;
    uint64_t v426 = objc_msgSend_roamingConsortiumList(self, v285, v286, v287, v288);
    if (objc_msgSend_count(v426, v309, v310, v311, v312))
    {
      objc_msgSend_appendString_(v6, v313, @"hs20-rc=[", v315, v316);
      long long v438 = 0u;
      long long v439 = 0u;
      long long v436 = 0u;
      long long v437 = 0u;
      id v317 = v426;
      uint64_t v319 = objc_msgSend_countByEnumeratingWithState_objects_count_(v317, v318, (uint64_t)&v436, (uint64_t)v458, 16);
      if (v319)
      {
        uint64_t v323 = v319;
        uint64_t v324 = *(void *)v437;
        do
        {
          uint64_t v325 = 0;
          do
          {
            if (*(void *)v437 != v324) {
              objc_enumerationMutation(v317);
            }
            objc_msgSend_appendFormat_(v6, v320, @"%@, ", v321, v322, *(void *)(*((void *)&v436 + 1) + 8 * v325++));
          }
          while (v323 != v325);
          uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v317, v320, (uint64_t)&v436, (uint64_t)v458, 16);
        }
        while (v323);
      }

      uint64_t v330 = objc_msgSend_length(v6, v326, v327, v328, v329);
      objc_msgSend_deleteCharactersInRange_(v6, v331, v330 - 2, 2, v332);
      objc_msgSend_appendString_(v6, v333, @"], ", v334, v335);
    }
    uint64_t v336 = objc_msgSend_operatorFriendlyNameList(self, v313, v314, v315, v316);
    if (objc_msgSend_count(v336, v337, v338, v339, v340))
    {
      objc_msgSend_appendString_(v6, v341, @"hs20-friend=[", v343, v344);
      long long v434 = 0u;
      long long v435 = 0u;
      long long v432 = 0u;
      long long v433 = 0u;
      id v345 = v336;
      uint64_t v347 = objc_msgSend_countByEnumeratingWithState_objects_count_(v345, v346, (uint64_t)&v432, (uint64_t)v457, 16);
      if (v347)
      {
        uint64_t v351 = v347;
        uint64_t v352 = *(void *)v433;
        do
        {
          uint64_t v353 = 0;
          do
          {
            if (*(void *)v433 != v352) {
              objc_enumerationMutation(v345);
            }
            objc_msgSend_appendFormat_(v6, v348, @"%@, ", v349, v350, *(void *)(*((void *)&v432 + 1) + 8 * v353++));
          }
          while (v351 != v353);
          uint64_t v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v345, v348, (uint64_t)&v432, (uint64_t)v457, 16);
        }
        while (v351);
      }

      uint64_t v358 = objc_msgSend_length(v6, v354, v355, v356, v357);
      objc_msgSend_deleteCharactersInRange_(v6, v359, v358 - 2, 2, v360);
      objc_msgSend_appendString_(v6, v361, @"], ", v362, v363);
    }
    uint64_t v364 = objc_msgSend_cellularNetworkInfo(self, v341, v342, v343, v344);
    if (objc_msgSend_count(v364, v365, v366, v367, v368))
    {
      uint64_t v423 = v280;
      uint64_t v372 = v217;
      objc_msgSend_appendString_(v6, v369, @"hs20-cell=[", v370, v371);
      long long v430 = 0u;
      long long v431 = 0u;
      long long v428 = 0u;
      long long v429 = 0u;
      id v373 = v364;
      uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v374, (uint64_t)&v428, (uint64_t)v456, 16);
      if (v375)
      {
        uint64_t v379 = v375;
        uint64_t v380 = *(void *)v429;
        do
        {
          uint64_t v381 = 0;
          do
          {
            if (*(void *)v429 != v380) {
              objc_enumerationMutation(v373);
            }
            objc_msgSend_appendFormat_(v6, v376, @"%@, ", v377, v378, *(void *)(*((void *)&v428 + 1) + 8 * v381++));
          }
          while (v379 != v381);
          uint64_t v379 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v376, (uint64_t)&v428, (uint64_t)v456, 16);
        }
        while (v379);
      }

      uint64_t v386 = objc_msgSend_length(v6, v382, v383, v384, v385);
      objc_msgSend_deleteCharactersInRange_(v6, v387, v386 - 2, 2, v388);
      objc_msgSend_appendString_(v6, v389, @"], ", v390, v391);
      v217 = v372;
      v280 = v423;
    }

    uint64_t v93 = v424;
    uint64_t v87 = v425;
  }
  uint64_t v392 = objc_msgSend_age(self, v249, v250, v251, v252);
  uint64_t v397 = objc_msgSend_timestamp(self, v393, v394, v395, v396);
  objc_msgSend_appendFormat_(v6, v398, @"age=%lums (%llu), ", v399, v400, v392, v397);
  uint64_t v405 = objc_msgSend_matchingKnownNetworkProfile(self, v401, v402, v403, v404);

  if (v405)
  {
    uint64_t v410 = objc_msgSend_matchingKnownNetworkProfile(self, v406, v407, v408, v409);
    objc_msgSend_appendFormat_(v6, v411, @"match=[%@], ", v412, v413, v410);
  }
  if (objc_msgSend_hasSuffix_(v6, v406, @", ", v408, v409))
  {
    uint64_t v418 = objc_msgSend_length(v6, v414, v415, v416, v417);
    objc_msgSend_deleteCharactersInRange_(v6, v419, v418 - 2, 2, v420);
  }
  id v421 = v6;

  return (NSString *)v421;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_SSID(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_BSSID(self, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;
  uint64_t v26 = v21 ^ objc_msgSend_isFILSDiscoveryFrame(self, v22, v23, v24, v25);
  unint64_t v31 = v26 ^ objc_msgSend_supportedSecurityTypes(self, v27, v28, v29, v30);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFScanResult, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_mutableCopy(self->_internal, v12, v13, v14, v15);
  objc_msgSend_setInternal_(v11, v17, (uint64_t)v16, v18, v19);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_internal, @"_internal", v3);
}

- (CWFScanResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CWFScanResult;
  uint64_t v5 = [(CWFScanResult *)&v30 init];
  if (v5)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v18 = objc_msgSend_setWithObjects_(v29, v15, v6, v16, v17, v7, v8, v9, v10, v11, v12, v13, v14, 0);
    uint64_t v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, @"_internal", v20);
    uint64_t v26 = objc_msgSend_mutableCopy(v21, v22, v23, v24, v25);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v26;
  }
  return v5;
}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

@end