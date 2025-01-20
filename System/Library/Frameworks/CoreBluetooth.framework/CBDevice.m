@interface CBDevice
+ (BOOL)supportsSecureCoding;
- ($F6EBB11256A2F6C4B9D2EC026D0EABA8)callMgmtMsg;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)changedTypesInternalPtr;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr;
- (BOOL)changedTypesContainCBDiscovery:(id)a3;
- (BOOL)changedTypesContainTypes:(id *)a3;
- (BOOL)changedTypesNeedsIdentify;
- (BOOL)decryptNearbyInfoV2PayloadPtr:(const char *)a3 payloadLength:(unint64_t)a4 key:(const char *)a5 keyLength:(unint64_t)a6 decryptedPtr:(void *)a7;
- (BOOL)discoveryTypesContainCBDiscovery:(id)a3;
- (BOOL)discoveryTypesContainType:(int)a3;
- (BOOL)discoveryTypesContainTypes:(id *)a3;
- (BOOL)enableEPAForLEAdvertisement;
- (BOOL)isEquivalentToCBDevice:(id)a3 compareFlags:(unsigned int)a4;
- (CBControllerInfo)controllerInfo;
- (CBDevice)initWithCoder:(id)a3;
- (CBDevice)initWithDictionary:(id)a3 error:(id *)a4;
- (CBDevice)initWithXPCEventRepresentation:(id)a3 error:(id *)a4;
- (CBDevice)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)spatialInteractionIdentifiers;
- (NSArray)tipiDevices;
- (NSData)airdropTempAuthTagData;
- (NSData)airplaySourceAuthTagData;
- (NSData)airplaySourceUWBConfigData;
- (NSData)bleAddressData;
- (NSData)bleAdvertisementData;
- (NSData)bleAppleManufacturerData;
- (NSData)btAddressData;
- (NSData)dockKitAccessoryPayloadData;
- (NSData)fidoPayloadData;
- (NSData)gfpPayloadData;
- (NSData)homeKitV1DeviceIDData;
- (NSData)homeKitV2AccessoryIDData;
- (NSData)homeKitV2AuthTagData;
- (NSData)irkData;
- (NSData)linkKeyData;
- (NSData)ltkData;
- (NSData)mspAddressData;
- (NSData)nearbyActionAuthTag;
- (NSData)nearbyActionExtraData;
- (NSData)nearbyActionNoWakeAuthTagData;
- (NSData)nearbyActionNoWakeConfigData;
- (NSData)nearbyActionTargetAuthTag;
- (NSData)nearbyActionV2TargetData;
- (NSData)nearbyAuthTag;
- (NSData)nearbyInfoAuthTag;
- (NSData)nearbyInfoV2AuthIntegrityTagData;
- (NSData)nearbyInfoV2AuthTagData;
- (NSData)nearbyInfoV2EncryptedData;
- (NSData)nearbyInfoV2TempAuthTagData;
- (NSData)objectDiscoveryNearOwnerID;
- (NSData)objectDiscoveryPublicKeyData;
- (NSData)proximityServiceClassicAddress;
- (NSData)proximityServiceData;
- (NSData)proximityServiceSetupHash;
- (NSData)safetyAlertsAlertData;
- (NSData)safetyAlertsAlertID;
- (NSData)safetyAlertsSegmentAlertData;
- (NSData)safetyAlertsSegmentServiceData;
- (NSData)safetyAlertsSegmentSignature;
- (NSData)safetyAlertsSignature;
- (NSData)spatialInteractionPresenceConfigData;
- (NSData)spatialInteractionTokenData;
- (NSData)spatialInteractionUWBConfigData;
- (NSData)txAddressData;
- (NSData)watchSetupData;
- (NSDictionary)spatialInteractionUserInfo;
- (NSMutableArray)spatialInteractionDeviceTimestampArrayClientIDs;
- (NSMutableDictionary)deviceInfo;
- (NSMutableDictionary)spatialInteractionDeviceTimestampArrayDictionary;
- (NSString)accountID;
- (NSString)btVersion;
- (NSString)caseVersion;
- (NSString)contactID;
- (NSString)findMyCaseIdentifier;
- (NSString)findMyGroupIdentifier;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (NSString)idsDeviceID;
- (NSString)leAdvName;
- (NSString)model;
- (NSString)modelUser;
- (NSString)mspDisplayName;
- (NSString)name;
- (NSString)objectSetupFontCode;
- (NSString)objectSetupMessage;
- (NSString)productName;
- (NSString)remoteHostID;
- (NSString)serialNumber;
- (NSString)serialNumberLeft;
- (NSString)serialNumberRight;
- (NSString)stableIdentifier;
- (OS_xpc_object)xpcEventRepresentation;
- (char)classicRSSI;
- (char)doubleTapActionLeft;
- (char)doubleTapActionRight;
- (char)doubleTapCapability;
- (char)dsActionMeasuredPower;
- (char)hearingAidSupport;
- (char)hearingTestSupport;
- (char)microphoneMode;
- (char)placementMode;
- (char)proximityServiceMeasuredPower;
- (char)rssi;
- (char)smartRoutingMode;
- (double)accessoryStatusOBCTime;
- (double)bleAdvertisementTimestamp;
- (double)nearbyInfoStatusProgress;
- (float)batteryLevelCase;
- (float)batteryLevelLeft;
- (float)batteryLevelMain;
- (float)batteryLevelRight;
- (id)bleAdvertisementTimestampString;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (id)getSpatialInteractionDeviceTimestampArrayForClientID:(id)a3;
- (int)audioStreamState;
- (int)bleChannel;
- (int)bleRSSI;
- (int)listeningMode;
- (int)primaryPlacement;
- (int)proximityPairingPrimaryPlacement;
- (int)proximityPairingSecondaryPlacement;
- (int)secondaryPlacement;
- (int)spatialAudioMode;
- (unint64_t)bleAdvertisementTimestampMachContinuous;
- (unint64_t)changeFlags;
- (unint64_t)deviceFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)homeKitV2Value;
- (unint64_t)lastSeenTicks;
- (unint64_t)oldDiscoveryFlags;
- (unint64_t)removeInternalFlags:(unsigned int)a3;
- (unint64_t)updateWithCBDevice:(id)a3;
- (unint64_t)updateWithPowerSourceDescription:(id)a3;
- (unsigned)accessoryStatusFlags;
- (unsigned)accessoryStatusLidOpenCount;
- (unsigned)adaptiveVolumeCapability;
- (unsigned)adaptiveVolumeConfig;
- (unsigned)airdropConfigData;
- (unsigned)airdropFlags;
- (unsigned)airdropHash1;
- (unsigned)airdropHash2;
- (unsigned)airdropHash3;
- (unsigned)airdropHash4;
- (unsigned)airdropModel;
- (unsigned)airdropVersion;
- (unsigned)airplaySourceFlags;
- (unsigned)airplayTargetConfigSeed;
- (unsigned)airplayTargetFlags;
- (unsigned)airplayTargetIPv4;
- (unsigned)airplayTargetPort;
- (unsigned)appearanceValue;
- (unsigned)attributeInternalFlags;
- (unsigned)autoAncCapability;
- (unsigned)batteryInfoCase;
- (unsigned)batteryInfoLeft;
- (unsigned)batteryInfoMain;
- (unsigned)batteryInfoRight;
- (unsigned)batteryStateCase;
- (unsigned)batteryStateLeft;
- (unsigned)batteryStateMain;
- (unsigned)batteryStateRight;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)colorCodeBest;
- (unsigned)colorFlags;
- (unsigned)colorInfo;
- (unsigned)connectedServices;
- (unsigned)conversationDetectCapability;
- (unsigned)conversationDetectConfig;
- (unsigned)crownRotationDirection;
- (unsigned)deviceType;
- (unsigned)dsActionFlags;
- (unsigned)dsActionTieBreaker;
- (unsigned)dsInfoVehicleConfidence;
- (unsigned)dsInfoVehicleState;
- (unsigned)endCallCapability;
- (unsigned)endCallConfig;
- (unsigned)frequencyBand;
- (unsigned)gapaFlags;
- (unsigned)gfpModelID;
- (unsigned)heySiriConfidence;
- (unsigned)heySiriDeviceClass;
- (unsigned)heySiriPerceptualHash;
- (unsigned)heySiriProductType;
- (unsigned)heySiriRandom;
- (unsigned)heySiriSNR;
- (unsigned)homeKitV1Category;
- (unsigned)homeKitV1CompatibleVersion;
- (unsigned)homeKitV1ConfigurationNumber;
- (unsigned)homeKitV1Flags;
- (unsigned)homeKitV1SetupHash;
- (unsigned)homeKitV1StateNumber;
- (unsigned)homeKitV2InstanceID;
- (unsigned)homeKitV2StateNumber;
- (unsigned)internalFlags;
- (unsigned)interval;
- (unsigned)leaVersion;
- (unsigned)listeningModeConfigs;
- (unsigned)mspDeviceClass;
- (unsigned)mspSubScenario;
- (unsigned)muteControlCapability;
- (unsigned)muteControlConfig;
- (unsigned)nearbyActionColorCode;
- (unsigned)nearbyActionDeviceClass;
- (unsigned)nearbyActionFlags;
- (unsigned)nearbyActionNWPrecisionFindingStatus;
- (unsigned)nearbyActionNoWakeType;
- (unsigned)nearbyActionType;
- (unsigned)nearbyActionV2Flags;
- (unsigned)nearbyActionV2Type;
- (unsigned)nearbyActivityLevel;
- (unsigned)nearbyInfoFlags;
- (unsigned)nearbyInfoStatusTime;
- (unsigned)nearbyInfoStatusType;
- (unsigned)nearbyInfoV2DecryptedFlags;
- (unsigned)nearbyInfoV2EncryptedFlags;
- (unsigned)nearbyInfoV2Flags;
- (unsigned)nearbyInfoV2InvitationCounter;
- (unsigned)nearbyInfoV2InvitationRouteType;
- (unsigned)nearbyInfoV2InvitationTypes;
- (unsigned)objectDiscoveryBatteryState;
- (unsigned)objectDiscoveryMode;
- (unsigned)objectDiscoveryProductID;
- (unsigned)objectSetupBatteryPerformance;
- (unsigned)objectSetupBatteryState;
- (unsigned)objectSetupColorCode;
- (unsigned)objectSetupFlags;
- (unsigned)peerStatusFlag;
- (unsigned)primaryBudSide;
- (unsigned)productID;
- (unsigned)proximityPairingOtherBudProductID;
- (unsigned)proximityPairingProductID;
- (unsigned)proximityPairingSubType;
- (unsigned)proximityServiceCategory;
- (unsigned)proximityServiceFlags;
- (unsigned)proximityServicePSM;
- (unsigned)proximityServiceProductID;
- (unsigned)proximityServiceSubType;
- (unsigned)proximityServiceVendorID;
- (unsigned)proximityServiceVersion;
- (unsigned)safetyAlertsAlertIndex;
- (unsigned)safetyAlertsSegmentSegmentNumber;
- (unsigned)safetyAlertsSegmentSegmentsTotal;
- (unsigned)safetyAlertsVersion;
- (unsigned)selectiveSpeechListeningCapability;
- (unsigned)selectiveSpeechListeningConfig;
- (unsigned)spatialInteractionConfigFlags;
- (unsigned)spatialInteractionFlags;
- (unsigned)spatialInteractionPeerID;
- (unsigned)spatialInteractionUWBTokenFlags;
- (unsigned)supportedServices;
- (unsigned)tipiConnectionStatus;
- (unsigned)tipiState;
- (unsigned)transmitPowerOne;
- (unsigned)transmitPowerThree;
- (unsigned)transmitPowerTwo;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (void)_clearUnparsedProperties;
- (void)_parseAirDropPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAirPlaySourcePtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAirPlayTargetPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseDSInfoPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseHeySiriPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseHomeKitV1Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseHomeKitV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseManufacturerPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseMicrosoftManufacturerPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseMicrosoftSwiftPairPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyActionNoWakePtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyActionPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyActionV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyInfoPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyInfoV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingAccessoryStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingAirPodsMismatchedPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingFindMyAccessoryStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingObjectSetupPtrV2:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingWxSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingWxStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityServiceData:(id)a3;
- (void)_parseProximityServiceHomeKitSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityServiceWatchSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseSafetyAlertsSegmentServiceData:(id)a3;
- (void)_parseSpatialInteractionPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseStatusOne:(unsigned __int8)a3 deviceFlags:(unint64_t *)a4 primaryPlacement:(int *)a5 secondaryPlacement:(int *)a6;
- (void)_setDeviceInfoKey:(id)a3 value:(id)a4;
- (void)changedTypesRemoveAll;
- (void)decryptApplePayloadWithIdentity:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5;
- (void)decryptNearbyInfoV2PayloadWithIdentity:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)resetNearbyInfoV2SensitiveProperties;
- (void)setAccessoryStatusFlags:(unsigned int)a3;
- (void)setAccessoryStatusLidOpenCount:(unsigned __int8)a3;
- (void)setAccessoryStatusOBCTime:(double)a3;
- (void)setAccountID:(id)a3;
- (void)setAdaptiveVolumeCapability:(unsigned __int8)a3;
- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3;
- (void)setAirdropConfigData:(unsigned __int8)a3;
- (void)setAirdropFlags:(unsigned __int8)a3;
- (void)setAirdropHash1:(unsigned __int16)a3;
- (void)setAirdropHash2:(unsigned __int16)a3;
- (void)setAirdropHash3:(unsigned __int16)a3;
- (void)setAirdropHash4:(unsigned __int16)a3;
- (void)setAirdropModel:(unsigned __int8)a3;
- (void)setAirdropTempAuthTagData:(id)a3;
- (void)setAirdropVersion:(unsigned __int8)a3;
- (void)setAirplaySourceAuthTagData:(id)a3;
- (void)setAirplaySourceFlags:(unsigned __int8)a3;
- (void)setAirplaySourceUWBConfigData:(id)a3;
- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3;
- (void)setAirplayTargetFlags:(unsigned __int8)a3;
- (void)setAirplayTargetIPv4:(unsigned int)a3;
- (void)setAirplayTargetPort:(unsigned __int16)a3;
- (void)setAppearanceValue:(unsigned int)a3;
- (void)setAttributeInternalFlags:(unsigned int)a3;
- (void)setAudioStreamState:(int)a3;
- (void)setAutoAncCapability:(unsigned __int8)a3;
- (void)setBatteryInfoCase:(unsigned __int16)a3;
- (void)setBatteryInfoLeft:(unsigned __int16)a3;
- (void)setBatteryInfoMain:(unsigned __int16)a3;
- (void)setBatteryInfoRight:(unsigned __int16)a3;
- (void)setBleAddressData:(id)a3;
- (void)setBleAdvertisementData:(id)a3;
- (void)setBleAdvertisementTimestamp:(double)a3;
- (void)setBleAdvertisementTimestampMachContinuous:(unint64_t)a3;
- (void)setBleAppleManufacturerData:(id)a3;
- (void)setBleChannel:(int)a3;
- (void)setBleRSSI:(int)a3;
- (void)setBtAddressData:(id)a3;
- (void)setBtVersion:(id)a3;
- (void)setCallMgmtMsg:(id)a3;
- (void)setCaseVersion:(id)a3;
- (void)setChangeFlags:(unint64_t)a3;
- (void)setClassicRSSI:(char)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setColorInfo:(unsigned __int16)a3;
- (void)setConnectedServices:(unsigned int)a3;
- (void)setContactID:(id)a3;
- (void)setControllerInfo:(id)a3;
- (void)setConversationDetectCapability:(unsigned __int8)a3;
- (void)setConversationDetectConfig:(unsigned __int8)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceType:(unsigned __int8)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDockKitAccessoryPayloadData:(id)a3;
- (void)setDoubleTapActionLeft:(char)a3;
- (void)setDoubleTapActionRight:(char)a3;
- (void)setDoubleTapCapability:(char)a3;
- (void)setDsActionFlags:(unsigned __int8)a3;
- (void)setDsActionMeasuredPower:(char)a3;
- (void)setDsActionTieBreaker:(unsigned __int8)a3;
- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3;
- (void)setDsInfoVehicleState:(unsigned __int8)a3;
- (void)setEnableEPAForLEAdvertisement:(BOOL)a3;
- (void)setEndCallCapability:(unsigned __int8)a3;
- (void)setEndCallConfig:(unsigned __int8)a3;
- (void)setFidoPayloadData:(id)a3;
- (void)setFindMyCaseIdentifier:(id)a3;
- (void)setFindMyGroupIdentifier:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFrequencyBand:(unsigned __int8)a3;
- (void)setGapaFlags:(unsigned int)a3;
- (void)setGfpModelID:(unsigned int)a3;
- (void)setGfpPayloadData:(id)a3;
- (void)setHearingAidSupport:(char)a3;
- (void)setHearingTestSupport:(char)a3;
- (void)setHeySiriConfidence:(unsigned __int8)a3;
- (void)setHeySiriDeviceClass:(unsigned __int16)a3;
- (void)setHeySiriPerceptualHash:(unsigned __int16)a3;
- (void)setHeySiriProductType:(unsigned __int8)a3;
- (void)setHeySiriRandom:(unsigned __int8)a3;
- (void)setHeySiriSNR:(unsigned __int8)a3;
- (void)setHomeKitV1Category:(unsigned __int16)a3;
- (void)setHomeKitV1CompatibleVersion:(unsigned __int8)a3;
- (void)setHomeKitV1ConfigurationNumber:(unsigned __int8)a3;
- (void)setHomeKitV1DeviceIDData:(id)a3;
- (void)setHomeKitV1Flags:(unsigned __int8)a3;
- (void)setHomeKitV1SetupHash:(unsigned int)a3;
- (void)setHomeKitV1StateNumber:(unsigned __int16)a3;
- (void)setHomeKitV2AccessoryIDData:(id)a3;
- (void)setHomeKitV2AuthTagData:(id)a3;
- (void)setHomeKitV2InstanceID:(unsigned __int16)a3;
- (void)setHomeKitV2StateNumber:(unsigned __int16)a3;
- (void)setHomeKitV2Value:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsDeviceID:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterval:(unsigned __int16)a3;
- (void)setIrkData:(id)a3;
- (void)setLastSeenTicks:(unint64_t)a3;
- (void)setLeAdvName:(id)a3;
- (void)setLeaVersion:(unsigned __int8 *)a3;
- (void)setLinkKeyData:(id)a3;
- (void)setListeningMode:(int)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setLtkData:(id)a3;
- (void)setMicrophoneMode:(char)a3;
- (void)setModel:(id)a3;
- (void)setModelUser:(id)a3;
- (void)setMspAddressData:(id)a3;
- (void)setMspDeviceClass:(unsigned int)a3;
- (void)setMspDisplayName:(id)a3;
- (void)setMspSubScenario:(unsigned __int8)a3;
- (void)setMuteControlCapability:(unsigned __int8)a3;
- (void)setMuteControlConfig:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setNearbyActionAuthTag:(id)a3;
- (void)setNearbyActionColorCode:(unsigned __int8)a3;
- (void)setNearbyActionDeviceClass:(unsigned __int8)a3;
- (void)setNearbyActionExtraData:(id)a3;
- (void)setNearbyActionFlags:(unsigned int)a3;
- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3;
- (void)setNearbyActionNoWakeAuthTagData:(id)a3;
- (void)setNearbyActionNoWakeConfigData:(id)a3;
- (void)setNearbyActionNoWakeType:(unsigned __int8)a3;
- (void)setNearbyActionTargetAuthTag:(id)a3;
- (void)setNearbyActionType:(unsigned __int8)a3;
- (void)setNearbyActionV2Flags:(unsigned int)a3;
- (void)setNearbyActionV2TargetData:(id)a3;
- (void)setNearbyActionV2Type:(unsigned __int8)a3;
- (void)setNearbyAuthTag:(id)a3;
- (void)setNearbyInfoAuthTag:(id)a3;
- (void)setNearbyInfoFlags:(unsigned int)a3;
- (void)setNearbyInfoStatusProgress:(double)a3;
- (void)setNearbyInfoStatusTime:(unsigned __int8)a3;
- (void)setNearbyInfoStatusType:(unsigned __int8)a3;
- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3;
- (void)setNearbyInfoV2AuthTagData:(id)a3;
- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3;
- (void)setNearbyInfoV2EncryptedData:(id)a3;
- (void)setNearbyInfoV2EncryptedFlags:(unsigned __int8)a3;
- (void)setNearbyInfoV2Flags:(unsigned __int8)a3;
- (void)setObjectDiscoveryBatteryState:(unsigned __int8)a3;
- (void)setObjectDiscoveryMode:(unsigned __int8)a3;
- (void)setObjectDiscoveryNearOwnerID:(id)a3;
- (void)setObjectDiscoveryProductID:(unsigned int)a3;
- (void)setObjectDiscoveryPublicKeyData:(id)a3;
- (void)setOldDiscoveryFlags:(unint64_t)a3;
- (void)setPeerStatusFlag:(unsigned __int8)a3;
- (void)setPlacementMode:(char)a3;
- (void)setPrimaryBudSide:(unsigned __int8)a3;
- (void)setPrimaryPlacement:(int)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductName:(id)a3;
- (void)setProximityPairingOtherBudProductID:(unsigned int)a3;
- (void)setProximityPairingPrimaryPlacement:(int)a3;
- (void)setProximityPairingProductID:(unsigned int)a3;
- (void)setProximityPairingSecondaryPlacement:(int)a3;
- (void)setProximityPairingSubType:(unsigned __int8)a3;
- (void)setProximityServiceCategory:(unsigned __int8)a3;
- (void)setProximityServiceClassicAddress:(id)a3;
- (void)setProximityServiceData:(id)a3;
- (void)setProximityServiceFlags:(unsigned __int8)a3;
- (void)setProximityServiceMeasuredPower:(char)a3;
- (void)setProximityServicePSM:(unsigned __int16)a3;
- (void)setProximityServiceProductID:(unsigned int)a3;
- (void)setProximityServiceSetupHash:(id)a3;
- (void)setProximityServiceSubType:(unsigned __int8)a3;
- (void)setProximityServiceVendorID:(unsigned __int16)a3;
- (void)setProximityServiceVersion:(unsigned __int8)a3;
- (void)setRemoteHostID:(id)a3;
- (void)setSafetyAlertsSegmentAlertData:(id)a3;
- (void)setSafetyAlertsSegmentSegmentNumber:(unsigned __int8)a3;
- (void)setSafetyAlertsSegmentSegmentsTotal:(unsigned __int8)a3;
- (void)setSafetyAlertsSegmentServiceData:(id)a3;
- (void)setSafetyAlertsSegmentSignature:(id)a3;
- (void)setSecondaryPlacement:(int)a3;
- (void)setSelectiveSpeechListeningCapability:(unsigned __int8)a3;
- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSerialNumberLeft:(id)a3;
- (void)setSerialNumberRight:(id)a3;
- (void)setSmartRoutingMode:(char)a3;
- (void)setSpatialAudioMode:(int)a3;
- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionDeviceTimestampArrayClientIDs:(id)a3;
- (void)setSpatialInteractionDeviceTimestampArrayDictionary:(id)a3;
- (void)setSpatialInteractionDeviceTimestampArrayForClientID:(id)a3 clientID:(id)a4;
- (void)setSpatialInteractionFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionIdentifiers:(id)a3;
- (void)setSpatialInteractionPeerID:(unsigned int)a3;
- (void)setSpatialInteractionPresenceConfigData:(id)a3;
- (void)setSpatialInteractionTokenData:(id)a3;
- (void)setSpatialInteractionUWBConfigData:(id)a3;
- (void)setSpatialInteractionUWBTokenFlags:(unsigned int)a3;
- (void)setSpatialInteractionUserInfo:(id)a3;
- (void)setSupportedServices:(unsigned int)a3;
- (void)setTipiConnectionStatus:(unsigned __int8)a3;
- (void)setTipiDevices:(id)a3;
- (void)setTipiState:(unsigned __int8)a3;
- (void)setTransmitPowerOne:(unsigned __int8)a3;
- (void)setTransmitPowerThree:(unsigned __int8)a3;
- (void)setTransmitPowerTwo:(unsigned __int8)a3;
- (void)setTxAddressData:(id)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setVendorIDSource:(unsigned __int8)a3;
- (void)setWatchSetupData:(id)a3;
- (void)updateWithCBDeviceIdentity:(id)a3;
- (void)updateWithRPIdentity:(id)a3;
- (void)updateWithReceivedAuthTag:(id)a3 forType:(unsigned __int8)a4;
- (void)updateWithSafetyAlertsSegments:(id)a3 error:(id *)a4;
@end

@implementation CBDevice

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (id)description
{
  return [(CBDevice *)self descriptionWithLevel:50];
}

- (void)setIdentifier:(id)a3
{
}

- (void)setLastSeenTicks:(unint64_t)a3
{
  self->_lastSeenTicks = a3;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (void)setBtAddressData:(id)a3
{
}

- (void)setBleRSSI:(int)a3
{
  self->_bleRSSI = a3;
}

- (void)setBleChannel:(int)a3
{
  self->_bleChannel = a3;
}

- (void)setBleAppleManufacturerData:(id)a3
{
}

- (void)setBleAdvertisementTimestampMachContinuous:(unint64_t)a3
{
  self->_bleAdvertisementTimestampMachContinuous = a3;
}

- (void)setBleAdvertisementTimestamp:(double)a3
{
  self->_bleAdvertisementTimestamp = a3;
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (NSData)spatialInteractionPresenceConfigData
{
  return self->_spatialInteractionPresenceConfigData;
}

- (unsigned)attributeInternalFlags
{
  return self->_attributeInternalFlags;
}

- (void)changedTypesRemoveAll
{
  self->_changeFlags = 0;
  self->_attributeInternalFlags = 0;
  *(_DWORD *)self->_changedTypesInternal.bitArray = 0;
  self->_changedTypesInternal.bitArray[4] = 0;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  accountID = self->_accountID;
  id v6 = v4;
  v7 = [(NSString *)accountID UTF8String];
  if (v7) {
    xpc_dictionary_set_string(v6, "acID", v7);
  }

  if (self->_adaptiveVolumeCapability) {
    xpc_dictionary_set_uint64(v6, "avCp", self->_adaptiveVolumeCapability);
  }
  int64_t audioStreamState = self->_audioStreamState;
  if (audioStreamState) {
    xpc_dictionary_set_int64(v6, "aStS", audioStreamState);
  }
  if (self->_autoAncCapability) {
    xpc_dictionary_set_uint64(v6, "aaCp", self->_autoAncCapability);
  }
  if (self->_batteryInfoMain) {
    xpc_dictionary_set_uint64(v6, "batM", self->_batteryInfoMain);
  }
  if (self->_batteryInfoLeft) {
    xpc_dictionary_set_uint64(v6, "batL", self->_batteryInfoLeft);
  }
  if (self->_batteryInfoRight) {
    xpc_dictionary_set_uint64(v6, "batR", self->_batteryInfoRight);
  }
  if (self->_batteryInfoCase) {
    xpc_dictionary_set_uint64(v6, "batC", self->_batteryInfoCase);
  }
  bleAddressData = self->_bleAddressData;
  if (bleAddressData)
  {
    v10 = bleAddressData;
    id v11 = v6;
    uint64_t v12 = [(NSData *)v10 bytes];
    if (v12) {
      v13 = (const char *)v12;
    }
    else {
      v13 = "";
    }
    size_t v14 = [(NSData *)v10 length];

    xpc_dictionary_set_data(v11, "blAd", v13, v14);
  }
  double bleAdvertisementTimestamp = self->_bleAdvertisementTimestamp;
  if (bleAdvertisementTimestamp != 0.0) {
    xpc_dictionary_set_double(v6, "blAt", bleAdvertisementTimestamp);
  }
  uint64_t bleAdvertisementTimestampMachContinuous = self->_bleAdvertisementTimestampMachContinuous;
  if (bleAdvertisementTimestampMachContinuous) {
    xpc_dictionary_set_uint64(v6, "blATM", bleAdvertisementTimestampMachContinuous);
  }
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  if (bleAppleManufacturerData)
  {
    v18 = bleAppleManufacturerData;
    id v19 = v6;
    uint64_t v20 = [(NSData *)v18 bytes];
    if (v20) {
      v21 = (const char *)v20;
    }
    else {
      v21 = "";
    }
    size_t v22 = [(NSData *)v18 length];

    xpc_dictionary_set_data(v19, "blAM", v21, v22);
  }
  int64_t bleChannel = self->_bleChannel;
  if (bleChannel) {
    xpc_dictionary_set_int64(v6, "blCh", bleChannel);
  }
  int64_t bleRSSI = self->_bleRSSI;
  if (bleRSSI) {
    xpc_dictionary_set_int64(v6, "blRS", bleRSSI);
  }
  btAddressData = self->_btAddressData;
  if (btAddressData)
  {
    v26 = btAddressData;
    id v27 = v6;
    uint64_t v28 = [(NSData *)v26 bytes];
    if (v28) {
      v29 = (const char *)v28;
    }
    else {
      v29 = "";
    }
    size_t v30 = [(NSData *)v26 length];

    xpc_dictionary_set_data(v27, "btAd", v29, v30);
  }
  caseVersion = self->_caseVersion;
  id v32 = v6;
  v33 = [(NSString *)caseVersion UTF8String];
  if (v33) {
    xpc_dictionary_set_string(v32, "cVer", v33);
  }

  uint64_t changeFlags = self->_changeFlags;
  if (changeFlags) {
    xpc_dictionary_set_uint64(v32, "chFl", changeFlags);
  }
  if (*(_DWORD *)self->_changedTypesInternal.bitArray | self->_changedTypesInternal.bitArray[4]) {
    size_t v35 = 5;
  }
  else {
    size_t v35 = 1;
  }
  xpc_dictionary_set_data(v32, "chTy", &self->_changedTypesInternal, v35);
  if (self->_colorInfo) {
    xpc_dictionary_set_uint64(v32, "clrI", self->_colorInfo);
  }
  if (self->_classicRSSI) {
    xpc_dictionary_set_int64(v32, "clRS", self->_classicRSSI);
  }
  uint64_t connectedServices = self->_connectedServices;
  if (connectedServices) {
    xpc_dictionary_set_uint64(v32, "CnS", connectedServices);
  }
  contactID = self->_contactID;
  id v38 = v32;
  v39 = [(NSString *)contactID UTF8String];
  if (v39) {
    xpc_dictionary_set_string(v38, "cnID", v39);
  }

  CUXPCEncodeObject();
  if (self->_conversationDetectCapability) {
    xpc_dictionary_set_uint64(v38, "cdCp", self->_conversationDetectCapability);
  }
  uint64_t deviceFlags = self->_deviceFlags;
  if (deviceFlags) {
    xpc_dictionary_set_uint64(v38, "dvFl", deviceFlags);
  }
  v41 = self->_deviceInfo;
  if (v41)
  {
    v42 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v42) {
      xpc_dictionary_set_value(v38, "dvIn", v42);
    }
  }
  if (self->_deviceType) {
    xpc_dictionary_set_uint64(v38, "dvTy", self->_deviceType);
  }
  uint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags) {
    xpc_dictionary_set_uint64(v38, "dsFl", discoveryFlags);
  }
  if (*(_DWORD *)self->_discoveryTypesInternal.bitArray | self->_discoveryTypesInternal.bitArray[4]) {
    size_t v44 = 5;
  }
  else {
    size_t v44 = 1;
  }
  xpc_dictionary_set_data(v38, "dsTy", &self->_discoveryTypesInternal, v44);
  if (self->_doubleTapActionLeft) {
    xpc_dictionary_set_int64(v38, "dtAL", self->_doubleTapActionLeft);
  }
  if (self->_doubleTapActionRight) {
    xpc_dictionary_set_int64(v38, "dtAR", self->_doubleTapActionRight);
  }
  if (self->_doubleTapCapability) {
    xpc_dictionary_set_int64(v38, "dtCa", self->_doubleTapCapability);
  }
  if (self->_endCallCapability) {
    xpc_dictionary_set_uint64(v38, "eCCp", self->_endCallCapability);
  }
  firmwareVersion = self->_firmwareVersion;
  id v46 = v38;
  v47 = [(NSString *)firmwareVersion UTF8String];
  if (v47) {
    xpc_dictionary_set_string(v46, "frmV", v47);
  }

  identifier = self->_identifier;
  id v49 = v46;
  v50 = [(NSString *)identifier UTF8String];
  if (v50) {
    xpc_dictionary_set_string(v49, "id", v50);
  }

  if (self->_interval) {
    xpc_dictionary_set_uint64(v49, "inV", self->_interval);
  }
  idsDeviceID = self->_idsDeviceID;
  id v52 = v49;
  v53 = [(NSString *)idsDeviceID UTF8String];
  if (v53) {
    xpc_dictionary_set_string(v52, "idsI", v53);
  }

  leAdvName = self->_leAdvName;
  id v55 = v52;
  v56 = [(NSString *)leAdvName UTF8String];
  if (v56) {
    xpc_dictionary_set_string(v55, "leNm", v56);
  }

  if (self->_microphoneMode) {
    xpc_dictionary_set_int64(v55, "micM", self->_microphoneMode);
  }
  model = self->_model;
  id v58 = v55;
  v59 = [(NSString *)model UTF8String];
  if (v59) {
    xpc_dictionary_set_string(v58, "md", v59);
  }

  if (self->_muteControlCapability) {
    xpc_dictionary_set_uint64(v58, "mCCp", self->_muteControlCapability);
  }
  name = self->_name;
  id v61 = v58;
  v62 = [(NSString *)name UTF8String];
  if (v62) {
    xpc_dictionary_set_string(v61, "nm", v62);
  }

  int64_t primaryPlacement = self->_primaryPlacement;
  if (primaryPlacement) {
    xpc_dictionary_set_int64(v61, "dPrP", primaryPlacement);
  }
  int64_t secondaryPlacement = self->_secondaryPlacement;
  if (secondaryPlacement) {
    xpc_dictionary_set_int64(v61, "dScP", secondaryPlacement);
  }
  if (self->_placementMode) {
    xpc_dictionary_set_int64(v61, "dPlM", self->_placementMode);
  }
  uint64_t productID = self->_productID;
  if (productID) {
    xpc_dictionary_set_uint64(v61, "pid", productID);
  }
  productName = self->_productName;
  id v67 = v61;
  v68 = [(NSString *)productName UTF8String];
  if (v68) {
    xpc_dictionary_set_string(v67, "prN", v68);
  }

  if (self->_selectiveSpeechListeningCapability) {
    xpc_dictionary_set_uint64(v67, "ssCp", self->_selectiveSpeechListeningCapability);
  }
  txAddressData = self->_txAddressData;
  if (txAddressData)
  {
    v70 = txAddressData;
    id v71 = v67;
    uint64_t v72 = [(NSData *)v70 bytes];
    if (v72) {
      v73 = (const char *)v72;
    }
    else {
      v73 = "";
    }
    size_t v74 = [(NSData *)v70 length];

    xpc_dictionary_set_data(v71, "TxAd", v73, v74);
  }
  if (self->_hearingAidSupport) {
    xpc_dictionary_set_int64(v67, "HaSp", self->_hearingAidSupport);
  }
  if (self->_hearingTestSupport) {
    xpc_dictionary_set_int64(v67, "HtSp", self->_hearingTestSupport);
  }
  serialNumber = self->_serialNumber;
  id v76 = v67;
  v77 = [(NSString *)serialNumber UTF8String];
  if (v77) {
    xpc_dictionary_set_string(v76, "sn", v77);
  }

  serialNumberLeft = self->_serialNumberLeft;
  id v79 = v76;
  v80 = [(NSString *)serialNumberLeft UTF8String];
  if (v80) {
    xpc_dictionary_set_string(v79, "snLe", v80);
  }

  serialNumberRight = self->_serialNumberRight;
  xpc_object_t xdict = v79;
  v82 = [(NSString *)serialNumberRight UTF8String];
  if (v82) {
    xpc_dictionary_set_string(xdict, "snRi", v82);
  }

  if (self->_smartRoutingMode) {
    xpc_dictionary_set_int64(xdict, "srMd", self->_smartRoutingMode);
  }
  uint64_t supportedServices = self->_supportedServices;
  if (supportedServices) {
    xpc_dictionary_set_uint64(xdict, "supS", supportedServices);
  }
  if (self->_vendorID) {
    xpc_dictionary_set_uint64(xdict, "vid", self->_vendorID);
  }
  if (self->_vendorIDSource) {
    xpc_dictionary_set_uint64(xdict, "vidS", self->_vendorIDSource);
  }
  if (self->_airdropFlags) {
    xpc_dictionary_set_uint64(xdict, "adFl", self->_airdropFlags);
  }
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  if (airdropTempAuthTagData)
  {
    v85 = airdropTempAuthTagData;
    id v86 = xdict;
    uint64_t v87 = [(NSData *)v85 bytes];
    if (v87) {
      v88 = (const char *)v87;
    }
    else {
      v88 = "";
    }
    size_t v89 = [(NSData *)v85 length];

    xpc_dictionary_set_data(v86, "adTa", v88, v89);
  }
  if (self->_airdropModel) {
    xpc_dictionary_set_uint64(xdict, "adMl", self->_airdropModel);
  }
  if (self->_airdropVersion) {
    xpc_dictionary_set_uint64(xdict, "adVs", self->_airdropVersion);
  }
  if (self->_airdropHash1) {
    xpc_dictionary_set_uint64(xdict, "adH1", self->_airdropHash1);
  }
  if (self->_airdropHash2) {
    xpc_dictionary_set_uint64(xdict, "adH2", self->_airdropHash2);
  }
  if (self->_airdropHash3) {
    xpc_dictionary_set_uint64(xdict, "adH3", self->_airdropHash3);
  }
  if (self->_airdropHash4) {
    xpc_dictionary_set_uint64(xdict, "adH4", self->_airdropHash4);
  }
  if (self->_airdropConfigData) {
    xpc_dictionary_set_uint64(xdict, "adCd", self->_airdropConfigData);
  }
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  if (airplaySourceAuthTagData)
  {
    v91 = airplaySourceAuthTagData;
    id v92 = xdict;
    uint64_t v93 = [(NSData *)v91 bytes];
    if (v93) {
      v94 = (const char *)v93;
    }
    else {
      v94 = "";
    }
    size_t v95 = [(NSData *)v91 length];

    xpc_dictionary_set_data(v92, "apAT", v94, v95);
  }
  if (self->_airplaySourceFlags) {
    xpc_dictionary_set_uint64(xdict, "apSF", self->_airplaySourceFlags);
  }
  if (self->_airplayTargetConfigSeed) {
    xpc_dictionary_set_uint64(xdict, "apTC", self->_airplayTargetConfigSeed);
  }
  if (self->_airplayTargetFlags) {
    xpc_dictionary_set_uint64(xdict, "apTF", self->_airplayTargetFlags);
  }
  airplayTargetIPid v4 = self->_airplayTargetIPv4;
  if (airplayTargetIPv4) {
    xpc_dictionary_set_uint64(xdict, "apTI", airplayTargetIPv4);
  }
  if (self->_homeKitV1Category) {
    xpc_dictionary_set_uint64(xdict, "hkCa", self->_homeKitV1Category);
  }
  if (self->_homeKitV1CompatibleVersion) {
    xpc_dictionary_set_uint64(xdict, "hkCV", self->_homeKitV1CompatibleVersion);
  }
  if (self->_homeKitV1ConfigurationNumber) {
    xpc_dictionary_set_uint64(xdict, "hkCN", self->_homeKitV1ConfigurationNumber);
  }
  homeKitV1DeviceIDData = self->_homeKitV1DeviceIDData;
  if (homeKitV1DeviceIDData)
  {
    v98 = homeKitV1DeviceIDData;
    id v99 = xdict;
    uint64_t v100 = [(NSData *)v98 bytes];
    if (v100) {
      v101 = (const char *)v100;
    }
    else {
      v101 = "";
    }
    size_t v102 = [(NSData *)v98 length];

    xpc_dictionary_set_data(v99, "hkDI", v101, v102);
  }
  if (self->_homeKitV1Flags) {
    xpc_dictionary_set_uint64(xdict, "hkFl", self->_homeKitV1Flags);
  }
  if (self->_homeKitV1StateNumber) {
    xpc_dictionary_set_uint64(xdict, "hkS1", self->_homeKitV1StateNumber);
  }
  uint64_t homeKitV1SetupHash = self->_homeKitV1SetupHash;
  if (homeKitV1SetupHash) {
    xpc_dictionary_set_uint64(xdict, "hkSH", homeKitV1SetupHash);
  }
  homeKitV2AccessoryIDData = self->_homeKitV2AccessoryIDData;
  if (homeKitV2AccessoryIDData)
  {
    v105 = homeKitV2AccessoryIDData;
    id v106 = xdict;
    uint64_t v107 = [(NSData *)v105 bytes];
    if (v107) {
      v108 = (const char *)v107;
    }
    else {
      v108 = "";
    }
    size_t v109 = [(NSData *)v105 length];

    xpc_dictionary_set_data(v106, "hkAI", v108, v109);
  }
  homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
  if (homeKitV2AuthTagData)
  {
    v111 = homeKitV2AuthTagData;
    id v112 = xdict;
    uint64_t v113 = [(NSData *)v111 bytes];
    if (v113) {
      v114 = (const char *)v113;
    }
    else {
      v114 = "";
    }
    size_t v115 = [(NSData *)v111 length];

    xpc_dictionary_set_data(v112, "hkAT", v114, v115);
  }
  if (self->_homeKitV2InstanceID) {
    xpc_dictionary_set_uint64(xdict, "hkII", self->_homeKitV2InstanceID);
  }
  if (self->_homeKitV2StateNumber) {
    xpc_dictionary_set_uint64(xdict, "hkS2", self->_homeKitV2StateNumber);
  }
  uint64_t homeKitV2Value = self->_homeKitV2Value;
  if (homeKitV2Value) {
    xpc_dictionary_set_uint64(xdict, "hkVa", homeKitV2Value);
  }
  uint64_t nearbyActionFlags = self->_nearbyActionFlags;
  if (nearbyActionFlags) {
    xpc_dictionary_set_uint64(xdict, "nbAF", nearbyActionFlags);
  }
  if (self->_nearbyActionType) {
    xpc_dictionary_set_uint64(xdict, "nbAc", self->_nearbyActionType);
  }
  nearbyAuthTag = self->_nearbyAuthTag;
  if (nearbyAuthTag)
  {
    v119 = nearbyAuthTag;
    id v120 = xdict;
    uint64_t v121 = [(NSData *)v119 bytes];
    if (v121) {
      v122 = (const char *)v121;
    }
    else {
      v122 = "";
    }
    size_t v123 = [(NSData *)v119 length];

    xpc_dictionary_set_data(v120, "nbAT", v122, v123);
  }
  uint64_t nearbyInfoFlags = self->_nearbyInfoFlags;
  if (nearbyInfoFlags) {
    xpc_dictionary_set_uint64(xdict, "nbIF", nearbyInfoFlags);
  }
  if (self->_nearbyInfoV2DecryptedFlags) {
    xpc_dictionary_set_uint64(xdict, "nb2Fe", self->_nearbyInfoV2DecryptedFlags);
  }
  if (self->_nearbyInfoV2Flags) {
    xpc_dictionary_set_uint64(xdict, "nb2F", self->_nearbyInfoV2Flags);
  }
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  if (nearbyInfoV2AuthIntegrityTagData)
  {
    v126 = nearbyInfoV2AuthIntegrityTagData;
    id v127 = xdict;
    uint64_t v128 = [(NSData *)v126 bytes];
    if (v128) {
      v129 = (const char *)v128;
    }
    else {
      v129 = "";
    }
    size_t v130 = [(NSData *)v126 length];

    xpc_dictionary_set_data(v127, "nb2Ai", v129, v130);
  }
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  if (nearbyInfoV2AuthTagData)
  {
    v132 = nearbyInfoV2AuthTagData;
    id v133 = xdict;
    uint64_t v134 = [(NSData *)v132 bytes];
    if (v134) {
      v135 = (const char *)v134;
    }
    else {
      v135 = "";
    }
    size_t v136 = [(NSData *)v132 length];

    xpc_dictionary_set_data(v133, "nb2A", v135, v136);
  }
  if (self->_nearbyInfoV2InvitationCounter) {
    xpc_dictionary_set_uint64(xdict, "nb2Ic", self->_nearbyInfoV2InvitationCounter);
  }
  if (self->_nearbyInfoV2InvitationTypes) {
    xpc_dictionary_set_uint64(xdict, "nb2It", self->_nearbyInfoV2InvitationTypes);
  }
  if (self->_nearbyInfoV2InvitationRouteType) {
    xpc_dictionary_set_uint64(xdict, "nb2Ir", self->_nearbyInfoV2InvitationRouteType);
  }
  if (self->_nearbyActionNoWakeType) {
    xpc_dictionary_set_uint64(xdict, "nawT", self->_nearbyActionNoWakeType);
  }
  if (self->_nearbyActionNWPrecisionFindingStatus) {
    xpc_dictionary_set_uint64(xdict, "nawS", self->_nearbyActionNWPrecisionFindingStatus);
  }
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  if (nearbyActionNoWakeAuthTagData)
  {
    v138 = nearbyActionNoWakeAuthTagData;
    id v139 = xdict;
    uint64_t v140 = [(NSData *)v138 bytes];
    if (v140) {
      v141 = (const char *)v140;
    }
    else {
      v141 = "";
    }
    size_t v142 = [(NSData *)v138 length];

    xpc_dictionary_set_data(v139, "nawA", v141, v142);
  }
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  if (nearbyActionNoWakeConfigData)
  {
    v144 = nearbyActionNoWakeConfigData;
    id v145 = xdict;
    uint64_t v146 = [(NSData *)v144 bytes];
    if (v146) {
      v147 = (const char *)v146;
    }
    else {
      v147 = "";
    }
    size_t v148 = [(NSData *)v144 length];

    xpc_dictionary_set_data(v145, "nawC", v147, v148);
  }
  if (self->_objectDiscoveryBatteryState) {
    xpc_dictionary_set_uint64(xdict, "odBS", self->_objectDiscoveryBatteryState);
  }
  if (self->_objectDiscoveryMode) {
    xpc_dictionary_set_uint64(xdict, "odDM", self->_objectDiscoveryMode);
  }
  objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
  if (objectDiscoveryNearOwnerID)
  {
    v150 = objectDiscoveryNearOwnerID;
    id v151 = xdict;
    uint64_t v152 = [(NSData *)v150 bytes];
    if (v152) {
      v153 = (const char *)v152;
    }
    else {
      v153 = "";
    }
    size_t v154 = [(NSData *)v150 length];

    xpc_dictionary_set_data(v151, "odNO", v153, v154);
  }
  uint64_t objectDiscoveryProductID = self->_objectDiscoveryProductID;
  if (objectDiscoveryProductID) {
    xpc_dictionary_set_uint64(xdict, "odPI", objectDiscoveryProductID);
  }
  objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
  if (objectDiscoveryPublicKeyData)
  {
    v157 = objectDiscoveryPublicKeyData;
    id v158 = xdict;
    uint64_t v159 = [(NSData *)v157 bytes];
    if (v159) {
      v160 = (const char *)v159;
    }
    else {
      v160 = "";
    }
    size_t v161 = [(NSData *)v157 length];

    xpc_dictionary_set_data(v158, "odPK", v160, v161);
  }
  uint64_t proximityPairingProductID = self->_proximityPairingProductID;
  if (proximityPairingProductID) {
    xpc_dictionary_set_uint64(xdict, "ppPI", proximityPairingProductID);
  }
  if (self->_proximityPairingSubType) {
    xpc_dictionary_set_uint64(xdict, "ppST", self->_proximityPairingSubType);
  }
  if (self->_peerStatusFlag) {
    xpc_dictionary_set_uint64(xdict, "prSt", self->_peerStatusFlag);
  }
  if (self->_transmitPowerOne) {
    xpc_dictionary_set_uint64(xdict, "txP1", self->_transmitPowerOne);
  }
  if (self->_transmitPowerTwo) {
    xpc_dictionary_set_uint64(xdict, "txP2", self->_transmitPowerTwo);
  }
  if (self->_transmitPowerThree) {
    xpc_dictionary_set_uint64(xdict, "txP3", self->_transmitPowerThree);
  }
  if (self->_proximityServiceCategory) {
    xpc_dictionary_set_uint64(xdict, "psCa", self->_proximityServiceCategory);
  }
  proximityServiceClassicAddress = self->_proximityServiceClassicAddress;
  if (proximityServiceClassicAddress)
  {
    v164 = proximityServiceClassicAddress;
    id v165 = xdict;
    uint64_t v166 = [(NSData *)v164 bytes];
    if (v166) {
      v167 = (const char *)v166;
    }
    else {
      v167 = "";
    }
    size_t v168 = [(NSData *)v164 length];

    xpc_dictionary_set_data(v165, "psCA", v167, v168);
  }
  proximityServiceData = self->_proximityServiceData;
  if (proximityServiceData)
  {
    v170 = proximityServiceData;
    id v171 = xdict;
    uint64_t v172 = [(NSData *)v170 bytes];
    if (v172) {
      v173 = (const char *)v172;
    }
    else {
      v173 = "";
    }
    size_t v174 = [(NSData *)v170 length];

    xpc_dictionary_set_data(v171, "psDa", v173, v174);
  }
  if (self->_proximityServiceFlags) {
    xpc_dictionary_set_uint64(xdict, "psFl", self->_proximityServiceFlags);
  }
  if (self->_proximityServiceMeasuredPower) {
    xpc_dictionary_set_int64(xdict, "psMP", self->_proximityServiceMeasuredPower);
  }
  uint64_t proximityServiceProductID = self->_proximityServiceProductID;
  if (proximityServiceProductID) {
    xpc_dictionary_set_uint64(xdict, "psPI", proximityServiceProductID);
  }
  if (self->_proximityServicePSM) {
    xpc_dictionary_set_uint64(xdict, "psPS", self->_proximityServicePSM);
  }
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  if (proximityServiceSetupHash)
  {
    v177 = proximityServiceSetupHash;
    id v178 = xdict;
    uint64_t v179 = [(NSData *)v177 bytes];
    if (v179) {
      v180 = (const char *)v179;
    }
    else {
      v180 = "";
    }
    size_t v181 = [(NSData *)v177 length];

    xpc_dictionary_set_data(v178, "psSH", v180, v181);
  }
  if (self->_proximityServiceSubType) {
    xpc_dictionary_set_uint64(xdict, "psST", self->_proximityServiceSubType);
  }
  if (self->_proximityServiceVendorID) {
    xpc_dictionary_set_uint64(xdict, "psVI", self->_proximityServiceVendorID);
  }
  if (self->_proximityServiceVersion) {
    xpc_dictionary_set_uint64(xdict, "psVs", self->_proximityServiceVersion);
  }
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  if (safetyAlertsAlertData)
  {
    v183 = safetyAlertsAlertData;
    id v184 = xdict;
    uint64_t v185 = [(NSData *)v183 bytes];
    if (v185) {
      v186 = (const char *)v185;
    }
    else {
      v186 = "";
    }
    size_t v187 = [(NSData *)v183 length];

    xpc_dictionary_set_data(v184, "saAd", v186, v187);
  }
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  if (safetyAlertsAlertID)
  {
    v189 = safetyAlertsAlertID;
    id v190 = xdict;
    uint64_t v191 = [(NSData *)v189 bytes];
    if (v191) {
      v192 = (const char *)v191;
    }
    else {
      v192 = "";
    }
    size_t v193 = [(NSData *)v189 length];

    xpc_dictionary_set_data(v190, "saAi", v192, v193);
  }
  safetyAlertsSignature = self->_safetyAlertsSignature;
  if (safetyAlertsSignature)
  {
    v195 = safetyAlertsSignature;
    id v196 = xdict;
    uint64_t v197 = [(NSData *)v195 bytes];
    if (v197) {
      v198 = (const char *)v197;
    }
    else {
      v198 = "";
    }
    size_t v199 = [(NSData *)v195 length];

    xpc_dictionary_set_data(v196, "saSg", v198, v199);
  }
  if (self->_safetyAlertsVersion) {
    xpc_dictionary_set_uint64(xdict, "saVs", self->_safetyAlertsVersion);
  }
  if (self->_spatialInteractionConfigFlags) {
    xpc_dictionary_set_uint64(xdict, "siCl", self->_spatialInteractionConfigFlags);
  }
  if (self->_spatialInteractionFlags) {
    xpc_dictionary_set_uint64(xdict, "siFl", self->_spatialInteractionFlags);
  }
  CUXPCEncodeNSArrayOfNSData();
  uint64_t spatialInteractionPeerID = self->_spatialInteractionPeerID;
  if (spatialInteractionPeerID) {
    xpc_dictionary_set_uint64(xdict, "siPI", spatialInteractionPeerID);
  }
  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  if (spatialInteractionUWBConfigData)
  {
    v202 = spatialInteractionUWBConfigData;
    id v203 = xdict;
    uint64_t v204 = [(NSData *)v202 bytes];
    if (v204) {
      v205 = (const char *)v204;
    }
    else {
      v205 = "";
    }
    size_t v206 = [(NSData *)v202 length];

    xpc_dictionary_set_data(v203, "siUC", v205, v206);
  }
  spatialInteractionPresenceConfigData = self->_spatialInteractionPresenceConfigData;
  if (spatialInteractionPresenceConfigData)
  {
    v208 = spatialInteractionPresenceConfigData;
    id v209 = xdict;
    uint64_t v210 = [(NSData *)v208 bytes];
    if (v210) {
      v211 = (const char *)v210;
    }
    else {
      v211 = "";
    }
    size_t v212 = [(NSData *)v208 length];

    xpc_dictionary_set_data(v209, "siPC", v211, v212);
  }
  if (self->_tipiConnectionStatus) {
    xpc_dictionary_set_uint64(xdict, "tpCS", self->_tipiConnectionStatus);
  }
  CUXPCEncodeNSArrayOfObjects();
  if (self->_tipiState) {
    xpc_dictionary_set_uint64(xdict, "tpSt", self->_tipiState);
  }
}

- (unint64_t)updateWithCBDevice:(id)a3
{
  id v4 = a3;
  __int16 v5 = [v4 internalFlags];
  unint64_t changeFlags = self->_changeFlags;
  unint64_t discoveryFlags = self->_discoveryFlags;
  uint64_t v8 = [v4 accountID];
  unint64_t v319 = changeFlags;
  v320 = (void *)v8;
  if (v8)
  {
    v9 = (void *)v8;
    v10 = self->_accountID;
    id v11 = v9;
    uint64_t v12 = v11;
    if (v10 == v11)
    {
    }
    else
    {
      if (!v10)
      {

        goto LABEL_10;
      }
      char v13 = [(NSString *)v10 isEqual:v11];

      if ((v13 & 1) == 0)
      {
LABEL_10:
        objc_storeStrong((id *)&self->_accountID, v9);
        uint64_t v14 = 0x80000000000;
        int v15 = [v4 adaptiveVolumeCapability];
        if (!v15) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
    }
  }
  uint64_t v14 = 0;
  int v15 = [v4 adaptiveVolumeCapability];
  if (!v15) {
    goto LABEL_13;
  }
LABEL_11:
  if (v15 != self->_adaptiveVolumeCapability)
  {
    self->_adaptiveVolumeCapability = v15;
    uint64_t v14 = 0x80000000000;
  }
LABEL_13:
  uint64_t v16 = [v4 adaptiveVolumeConfig];
  if (v16)
  {
    uint64_t v17 = v16;
    if (v16 != [(CBDevice *)self adaptiveVolumeConfig])
    {
      [(CBDevice *)self setAdaptiveVolumeConfig:v17];
      uint64_t v14 = 0x80000000000;
    }
  }
  uint64_t v18 = [v4 appearanceValue];
  if (v18)
  {
    uint64_t v19 = v18;
    if (v18 != [(CBDevice *)self appearanceValue])
    {
      [(CBDevice *)self setAppearanceValue:v19];
      uint64_t v14 = 0x80000000000;
    }
  }
  int v20 = [v4 audioStreamState];
  if (v20 && v20 != self->_audioStreamState)
  {
    self->_int64_t audioStreamState = v20;
    v14 |= 0x80000000000uLL;
  }
  int v21 = v5 & 0x84;
  int v22 = [v4 autoAncCapability];
  if (v22 && v22 != self->_autoAncCapability)
  {
    self->_autoAncCapability = v22;
    v14 |= 0x80000000000uLL;
  }
  if ((v5 & 0x84) == 0 && ([v4 discoveryFlags] & 0x80) == 0) {
    goto LABEL_32;
  }
  int v23 = [v4 batteryInfoMain];
  if (v23 == self->_batteryInfoMain)
  {
    int v24 = [v4 batteryInfoLeft];
    if (v24 == self->_batteryInfoLeft) {
      goto LABEL_29;
    }
LABEL_39:
    self->_batteryInfoLeft = v24;
    v14 |= 0x80000000000uLL;
    int v25 = [v4 batteryInfoRight];
    if (v25 == self->_batteryInfoRight)
    {
LABEL_30:
      int v26 = [v4 batteryInfoCase];
      if (v26 == self->_batteryInfoCase) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    goto LABEL_40;
  }
  self->_batteryInfoMain = v23;
  v14 |= 0x80000000000uLL;
  int v24 = [v4 batteryInfoLeft];
  if (v24 != self->_batteryInfoLeft) {
    goto LABEL_39;
  }
LABEL_29:
  int v25 = [v4 batteryInfoRight];
  if (v25 == self->_batteryInfoRight) {
    goto LABEL_30;
  }
LABEL_40:
  self->_batteryInfoRight = v25;
  v14 |= 0x80000000000uLL;
  int v26 = [v4 batteryInfoCase];
  if (v26 != self->_batteryInfoCase)
  {
LABEL_31:
    self->_batteryInfoCase = v26;
    v14 |= 0x80000000000uLL;
  }
LABEL_32:
  id v27 = [v4 bleAddressData];
  id obj = v27;
  if (!v27) {
    goto LABEL_36;
  }
  bleAddressData = self->_bleAddressData;
  v29 = v27;
  size_t v30 = bleAddressData;
  if (v29 == v30)
  {

    v33 = [v4 bleAdvertisementData];
    id v328 = v33;
    if (!v33) {
      goto LABEL_51;
    }
    goto LABEL_46;
  }
  v31 = v30;
  if (v30)
  {
    char v32 = [(NSData *)v29 isEqual:v30];

    if (v32)
    {
LABEL_36:
      v33 = [v4 bleAdvertisementData];
      id v328 = v33;
      if (!v33) {
        goto LABEL_51;
      }
      goto LABEL_46;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_bleAddressData, obj);
  v14 |= 0x80000000000uLL;
  v33 = [v4 bleAdvertisementData];
  id v328 = v33;
  if (!v33) {
    goto LABEL_51;
  }
LABEL_46:
  bleAdvertisementData = self->_bleAdvertisementData;
  size_t v35 = v33;
  v36 = bleAdvertisementData;
  if (v35 != v36)
  {
    v37 = v36;
    if (v36)
    {
      char v38 = [(NSData *)v35 isEqual:v36];

      if (v38) {
        goto LABEL_51;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_bleAdvertisementData, v328);
    v14 |= 0x40000000uLL;
    [v4 bleAdvertisementTimestamp];
    if (v39 == 0.0) {
      goto LABEL_57;
    }
LABEL_55:
    if (v39 != self->_bleAdvertisementTimestamp) {
      self->_double bleAdvertisementTimestamp = v39;
    }
    goto LABEL_57;
  }

LABEL_51:
  [v4 bleAdvertisementTimestamp];
  if (v39 != 0.0) {
    goto LABEL_55;
  }
LABEL_57:
  unint64_t v40 = [v4 bleAdvertisementTimestampMachContinuous];
  if (v40 && v40 != self->_bleAdvertisementTimestampMachContinuous) {
    self->_uint64_t bleAdvertisementTimestampMachContinuous = v40;
  }
  v41 = [v4 bleAppleManufacturerData];
  v335 = v41;
  if (!v41) {
    goto LABEL_66;
  }
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  v43 = v41;
  size_t v44 = bleAppleManufacturerData;
  if (v43 == v44)
  {

    goto LABEL_66;
  }
  v45 = v44;
  if (!v44)
  {

    goto LABEL_69;
  }
  char v46 = [(NSData *)v43 isEqual:v44];

  if (v46)
  {
LABEL_66:
    int v47 = [v4 bleChannel];
    if (!v47) {
      goto LABEL_72;
    }
    goto LABEL_70;
  }
LABEL_69:
  objc_storeStrong((id *)&self->_bleAppleManufacturerData, v335);
  v14 |= 0x40000000uLL;
  int v47 = [v4 bleChannel];
  if (!v47) {
    goto LABEL_72;
  }
LABEL_70:
  if (v47 != self->_bleChannel)
  {
    self->_int64_t bleChannel = v47;
    v14 |= 0x200000000uLL;
  }
LABEL_72:
  int v48 = [v4 bleRSSI];
  if (v48)
  {
    self->_int64_t bleRSSI = v48;
    v14 |= 0x200000000uLL;
  }
  id v49 = [v4 btAddressData];
  id v327 = v49;
  if (!v49)
  {
LABEL_78:
    uint64_t v55 = [v4 btVersion];
    v318 = (void *)v55;
    if (!v55) {
      goto LABEL_89;
    }
    goto LABEL_84;
  }
  btAddressData = self->_btAddressData;
  v51 = v49;
  id v52 = btAddressData;
  if (v51 != v52)
  {
    v53 = v52;
    if (v52)
    {
      char v54 = [(NSData *)v51 isEqual:v52];

      if (v54) {
        goto LABEL_78;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_btAddressData, v327);
    v14 |= 0x80000000000uLL;
    uint64_t v55 = [v4 btVersion];
    v318 = (void *)v55;
    if (!v55) {
      goto LABEL_89;
    }
    goto LABEL_84;
  }

  uint64_t v55 = [v4 btVersion];
  v318 = (void *)v55;
  if (!v55)
  {
LABEL_89:
    v62 = [v4 caseVersion];
    if (![v62 length]) {
      goto LABEL_90;
    }
LABEL_115:
    caseVersion = self->_caseVersion;
    id v79 = v62;
    v80 = v62;
    v81 = caseVersion;
    if (v80 == v81)
    {

      int v63 = [v4 classicRSSI];
      v317 = v79;
      if (!v63) {
        goto LABEL_92;
      }
    }
    else
    {
      v82 = v81;
      if ((v80 == 0) != (v81 != 0))
      {
        char v83 = [(NSString *)v80 isEqual:v81];

        if (v83)
        {
          int v63 = [v4 classicRSSI];
          v317 = v79;
          if (!v63) {
            goto LABEL_92;
          }
          goto LABEL_91;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_caseVersion, v79);
      v14 |= 0x80000000000uLL;
      int v63 = [v4 classicRSSI];
      v317 = v79;
      if (!v63) {
        goto LABEL_92;
      }
    }
LABEL_91:
    self->_classicRSSI = v63;
    v14 |= 0x200000000uLL;
    goto LABEL_92;
  }
LABEL_84:
  v56 = (void *)v55;
  v57 = [(CBDevice *)self btVersion];
  id v58 = v56;
  id v59 = v57;
  if (v58 == v59)
  {

    goto LABEL_89;
  }
  v60 = v59;
  if (v59)
  {
    char v61 = [v58 isEqual:v59];

    if (v61) {
      goto LABEL_89;
    }
  }
  else
  {
  }
  [(CBDevice *)self setBtVersion:v58];
  v14 |= 0x80000000000uLL;
  v62 = [v4 caseVersion];
  if ([v62 length]) {
    goto LABEL_115;
  }
LABEL_90:
  int v63 = [v4 classicRSSI];
  v317 = v62;
  if (v63) {
    goto LABEL_91;
  }
LABEL_92:
  uint64_t v64 = [v4 clickHoldModeLeft];
  if (v64)
  {
    uint64_t v65 = v64;
    if (v64 != [(CBDevice *)self clickHoldModeLeft])
    {
      [(CBDevice *)self setClickHoldModeLeft:v65];
      v14 |= 0x80000000000uLL;
    }
  }
  uint64_t v66 = [v4 clickHoldModeRight];
  if (v66)
  {
    uint64_t v67 = v66;
    if (v66 != [(CBDevice *)self clickHoldModeRight])
    {
      [(CBDevice *)self setClickHoldModeRight:v67];
      v14 |= 0x80000000000uLL;
    }
  }
  int v68 = [v4 colorInfo];
  if (v68 && self->_colorInfo != v68)
  {
    self->_colorInfo = v68;
    v14 |= 0x80000000000uLL;
  }
  if ((v5 & 0x84) != 0)
  {
    unsigned int v69 = [v4 connectedServices];
    if (v69 != self->_connectedServices)
    {
      self->_uint64_t connectedServices = v69;
      v14 |= 0x80000200000uLL;
    }
  }
  uint64_t v70 = [v4 contactID];
  id v326 = (id)v70;
  if (v70)
  {
    id v71 = (void *)v70;
    uint64_t v72 = self->_contactID;
    v73 = v71;
    size_t v74 = v73;
    if (v72 == v73)
    {

      id v76 = [v4 controllerInfo];
      if (v76) {
        goto LABEL_127;
      }
    }
    else
    {
      if (v72)
      {
        char v75 = [(NSString *)v72 isEqual:v73];

        if (v75) {
          goto LABEL_108;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_contactID, v326);
      v14 |= 0x80000000000uLL;
      id v76 = [v4 controllerInfo];
      if (v76) {
        goto LABEL_127;
      }
    }
LABEL_109:
    int v77 = [v4 conversationDetectCapability];
    v316 = v76;
    if (!v77) {
      goto LABEL_138;
    }
    goto LABEL_136;
  }
LABEL_108:
  id v76 = [v4 controllerInfo];
  if (!v76) {
    goto LABEL_109;
  }
LABEL_127:
  v84 = self->_controllerInfo;
  v85 = v76;
  id v86 = v76;
  uint64_t v87 = v86;
  if (v84 != v86)
  {
    if (v84)
    {
      BOOL v88 = [(CBControllerInfo *)v84 isEqual:v86];

      if (v88)
      {
        int v77 = [v4 conversationDetectCapability];
        v316 = v85;
        if (!v77) {
          goto LABEL_138;
        }
        goto LABEL_136;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_controllerInfo, v85);
    v14 |= 0x80000000000uLL;
    int v77 = [v4 conversationDetectCapability];
    v316 = v85;
    if (!v77) {
      goto LABEL_138;
    }
    goto LABEL_136;
  }

  int v77 = [v4 conversationDetectCapability];
  v316 = v85;
  if (!v77) {
    goto LABEL_138;
  }
LABEL_136:
  if (v77 != self->_conversationDetectCapability)
  {
    self->_conversationDetectCapability = v77;
    v14 |= 0x80000000000uLL;
  }
LABEL_138:
  uint64_t v89 = [v4 conversationDetectConfig];
  if (v89)
  {
    uint64_t v90 = v89;
    if (v89 != [(CBDevice *)self conversationDetectConfig])
    {
      [(CBDevice *)self setConversationDetectConfig:v90];
      v14 |= 0x80000000000uLL;
    }
  }
  uint64_t v91 = [v4 crownRotationDirection];
  if (v91)
  {
    uint64_t v92 = v91;
    if (v91 != [(CBDevice *)self crownRotationDirection])
    {
      [(CBDevice *)self setCrownRotationDirection:v92];
      v14 |= 0x80000000000uLL;
    }
  }
  if ((v5 & 0x84) != 0)
  {
    unint64_t deviceFlags = self->_deviceFlags;
    unint64_t v94 = [v4 deviceFlags] & 0x780FFFFF07FLL | deviceFlags & 0xFFFFF87F00000F80;
    if (v94 != deviceFlags)
    {
      self->_unint64_t deviceFlags = v94;
      v14 |= 0x80000000000uLL;
    }
  }
  if ((v5 & 2) == 0) {
    goto LABEL_154;
  }
  if (([v4 deviceFlags] & 0x40000000000) != 0)
  {
    self->_deviceFlags |= 0x40000000000uLL;
    if (([v4 deviceFlags] & 0x80) == 0)
    {
LABEL_153:
      v14 |= 0x80000000000uLL;
      goto LABEL_154;
    }
LABEL_152:
    self->_deviceFlags |= 0x80uLL;
    goto LABEL_153;
  }
  if (([v4 deviceFlags] & 0x80) != 0) {
    goto LABEL_152;
  }
LABEL_154:
  if ((v5 & 0x84) != 0)
  {
    int v95 = [v4 deviceType];
    if (v95 != self->_deviceType)
    {
      self->_deviceType = v95;
      v14 |= 0x80000000000uLL;
    }
  }
  v341 = [v4 dockKitAccessoryPayloadData];
  if ((v5 & 2) == 0) {
    goto LABEL_163;
  }
  v96 = [(CBDevice *)self dockKitAccessoryPayloadData];
  id v97 = v341;
  id v98 = v96;
  if (v97 == v98)
  {

    goto LABEL_163;
  }
  id v99 = v98;
  if ((v97 == 0) == (v98 != 0))
  {

    goto LABEL_167;
  }
  char v100 = [v97 isEqual:v98];

  if (v100)
  {
LABEL_163:
    int v101 = [v4 doubleTapActionLeft];
    if (!v101) {
      goto LABEL_168;
    }
    goto LABEL_164;
  }
LABEL_167:
  [(CBDevice *)self setDockKitAccessoryPayloadData:v97];
  self->_changedTypesInternal.bitArray[1] |= 0x10u;
  int v101 = [v4 doubleTapActionLeft];
  if (!v101) {
    goto LABEL_168;
  }
LABEL_164:
  if (self->_doubleTapActionLeft != v101)
  {
    self->_doubleTapActionLeft = v101;
    v14 |= 0x80000000000uLL;
  }
LABEL_168:
  int v102 = [v4 doubleTapActionRight];
  if (v102 && self->_doubleTapActionRight != v102)
  {
    self->_doubleTapActionRight = v102;
    v14 |= 0x80000000000uLL;
  }
  int v103 = [v4 doubleTapCapability];
  if (v103 && self->_doubleTapCapability != v103)
  {
    self->_doubleTapCapability = v103;
    v14 |= 0x80000000000uLL;
  }
  unint64_t v104 = discoveryFlags;
  if ((v5 & 0x80) != 0)
  {
    unint64_t v104 = discoveryFlags & 0xFFFBFFFFFFFFFFFFLL | ((((unint64_t)[v4 discoveryFlags] >> 50) & 1) << 50);
    if ((v5 & 4) == 0)
    {
LABEL_176:
      if (v104 == discoveryFlags) {
        goto LABEL_177;
      }
LABEL_181:
      self->_unint64_t discoveryFlags = v104;
      v14 |= 0x800000000uLL;
      if ((v5 & 2) == 0) {
        goto LABEL_188;
      }
LABEL_182:
      uint64_t v105 = [v4 dsInfoVehicleConfidence];
      if (v105)
      {
        uint64_t v106 = v105;
        if (v105 != [(CBDevice *)self dsInfoVehicleConfidence])
        {
          [(CBDevice *)self setDsInfoVehicleConfidence:v106];
          v14 |= 0x800000000000000uLL;
        }
      }
      uint64_t v107 = [v4 dsInfoVehicleState];
      if (v107)
      {
        uint64_t v108 = v107;
        if (v107 != [(CBDevice *)self dsInfoVehicleState])
        {
          [(CBDevice *)self setDsInfoVehicleState:v108];
          v14 |= 0x800000000000000uLL;
        }
      }
      goto LABEL_188;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_176;
  }
  unint64_t v104 = [v4 discoveryFlags] & 0xA00000 | v104 & 0xFFFFFFFFFF5FFFFFLL;
  if (v104 != discoveryFlags) {
    goto LABEL_181;
  }
LABEL_177:
  if ((v5 & 2) != 0) {
    goto LABEL_182;
  }
LABEL_188:
  int v109 = [v4 endCallCapability];
  if (v109 && v109 != self->_endCallCapability)
  {
    self->_endCallCapability = v109;
    v14 |= 0x80000000000uLL;
  }
  uint64_t v110 = [v4 endCallConfig];
  if (v110)
  {
    uint64_t v111 = v110;
    if (v110 != [(CBDevice *)self endCallConfig])
    {
      [(CBDevice *)self setEndCallConfig:v111];
      v14 |= 0x80000000000uLL;
    }
  }
  uint64_t v112 = [v4 fidoPayloadData];
  v311 = (void *)v112;
  if ((v5 & 2) == 0) {
    goto LABEL_200;
  }
  uint64_t v113 = (void *)v112;
  v114 = [(CBDevice *)self fidoPayloadData];
  id v115 = v113;
  id v116 = v114;
  if (v115 == v116)
  {

    goto LABEL_200;
  }
  v117 = v116;
  if ((v115 == 0) == (v116 != 0))
  {

    goto LABEL_207;
  }
  char v118 = [v115 isEqual:v116];

  if (v118)
  {
LABEL_200:
    v119 = [v4 findMyCaseIdentifier];
    if (!v119) {
      goto LABEL_212;
    }
LABEL_201:
    id v120 = [(CBDevice *)self findMyCaseIdentifier];
    uint64_t v121 = v119;
    id v122 = v119;
    id v123 = v120;
    if (v122 == v123)
    {
    }
    else
    {
      v124 = v123;
      if (v123)
      {
        char v125 = [v122 isEqual:v123];

        if (v125) {
          goto LABEL_211;
        }
      }
      else
      {
      }
      [(CBDevice *)self setFindMyCaseIdentifier:v122];
      v14 |= 0x80000000000uLL;
    }
LABEL_211:
    v119 = v121;
    goto LABEL_212;
  }
LABEL_207:
  [(CBDevice *)self setFidoPayloadData:v115];
  v14 |= 0x8000000000000uLL;
  v119 = [v4 findMyCaseIdentifier];
  if (v119) {
    goto LABEL_201;
  }
LABEL_212:
  uint64_t v126 = [v4 findMyGroupIdentifier];
  v314 = (void *)v126;
  v315 = v119;
  if (!v126) {
    goto LABEL_218;
  }
  id v127 = (void *)v126;
  uint64_t v128 = [(CBDevice *)self findMyGroupIdentifier];
  id v129 = v127;
  id v130 = v128;
  if (v129 == v130)
  {

    goto LABEL_218;
  }
  v131 = v130;
  if (!v130)
  {

    goto LABEL_221;
  }
  char v132 = [v129 isEqual:v130];

  if (v132)
  {
LABEL_218:
    uint64_t v133 = [v4 frequencyBand];
    if (!v133) {
      goto LABEL_224;
    }
    goto LABEL_222;
  }
LABEL_221:
  [(CBDevice *)self setFindMyGroupIdentifier:v129];
  v14 |= 0x80000000000uLL;
  uint64_t v133 = [v4 frequencyBand];
  if (!v133) {
    goto LABEL_224;
  }
LABEL_222:
  uint64_t v134 = v133;
  if (v133 != [(CBDevice *)self frequencyBand])
  {
    [(CBDevice *)self setFrequencyBand:v134];
    v14 |= 0x80000000000uLL;
  }
LABEL_224:
  uint64_t v135 = [v4 gapaFlags];
  if (v135 != [(CBDevice *)self gapaFlags])
  {
    [(CBDevice *)self setGapaFlags:v135];
    v14 |= 0x80000000000uLL;
  }
  uint64_t v136 = [v4 gfpPayloadData];
  v336 = (void *)v136;
  if ((v5 & 2) != 0)
  {
    v137 = (void *)v136;
    v138 = [(CBDevice *)self gfpPayloadData];
    id v139 = v137;
    id v140 = v138;
    if (v139 == v140)
    {

      if ((unint64_t)[v139 length] < 3) {
        goto LABEL_237;
      }
    }
    else
    {
      v141 = v140;
      if ((v139 == 0) != (v140 != 0))
      {
        char v142 = [v139 isEqual:v140];

        if (v142)
        {
          if ((unint64_t)[v139 length] >= 3) {
            goto LABEL_231;
          }
LABEL_237:
          uint64_t v144 = 0;
          if (![(CBDevice *)self gfpModelID]) {
            goto LABEL_239;
          }
          goto LABEL_238;
        }
      }
      else
      {
      }
      [(CBDevice *)self setGfpPayloadData:v139];
      v14 |= 0x40000000000000uLL;
      if ((unint64_t)[v139 length] < 3) {
        goto LABEL_237;
      }
    }
LABEL_231:
    v143 = (unsigned __int8 *)[v139 bytes];
    uint64_t v144 = (*v143 << 16) | (v143[1] << 8) | v143[2];
    if (v144 == [(CBDevice *)self gfpModelID]) {
      goto LABEL_239;
    }
LABEL_238:
    [(CBDevice *)self setGfpModelID:v144];
    v14 |= 0x40000000000000uLL;
  }
LABEL_239:
  id v145 = [v4 firmwareVersion];
  id v333 = v145;
  if (![v145 length]) {
    goto LABEL_243;
  }
  firmwareVersion = self->_firmwareVersion;
  v147 = v145;
  size_t v148 = firmwareVersion;
  if (v147 != v148)
  {
    v149 = v148;
    if ((v147 == 0) != (v148 != 0))
    {
      char v150 = [(NSString *)v147 isEqual:v148];

      if (v150)
      {
LABEL_243:
        id v151 = [v4 identifier];
        id v325 = v151;
        if (!v151) {
          goto LABEL_252;
        }
        goto LABEL_249;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_firmwareVersion, v333);
    v14 |= 0x80000000000uLL;
    id v151 = [v4 identifier];
    id v325 = v151;
    if (!v151) {
      goto LABEL_252;
    }
    goto LABEL_249;
  }

  id v151 = [v4 identifier];
  id v325 = v151;
  if (!v151)
  {
LABEL_252:
    uint64_t v157 = [v4 idsDeviceID];
    id v324 = (id)v157;
    if (!v157) {
      goto LABEL_263;
    }
    goto LABEL_258;
  }
LABEL_249:
  identifier = self->_identifier;
  v153 = v151;
  size_t v154 = identifier;
  if (v153 != v154)
  {
    v155 = v154;
    if (v154)
    {
      char v156 = [(NSString *)v153 isEqual:v154];

      if (v156) {
        goto LABEL_252;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_identifier, v325);
    v14 |= 0x80000000000uLL;
    uint64_t v157 = [v4 idsDeviceID];
    id v324 = (id)v157;
    if (!v157) {
      goto LABEL_263;
    }
    goto LABEL_258;
  }

  uint64_t v157 = [v4 idsDeviceID];
  id v324 = (id)v157;
  if (!v157)
  {
LABEL_263:
    int v163 = [v4 interval];
    if (!v163) {
      goto LABEL_269;
    }
    goto LABEL_267;
  }
LABEL_258:
  id v158 = (void *)v157;
  uint64_t v159 = self->_idsDeviceID;
  v160 = v158;
  size_t v161 = v160;
  if (v159 == v160)
  {

    goto LABEL_263;
  }
  if (v159)
  {
    char v162 = [(NSString *)v159 isEqual:v160];

    if (v162) {
      goto LABEL_263;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_idsDeviceID, v324);
  v14 |= 0x80000000000uLL;
  int v163 = [v4 interval];
  if (!v163) {
    goto LABEL_269;
  }
LABEL_267:
  unsigned __int16 v164 = v163;
  if (v163 != [(CBDevice *)self interval])
  {
    self->_interval = v164;
    v14 |= 0x80000000000uLL;
  }
LABEL_269:
  unint64_t v165 = [v4 lastSeenTicks];
  if (v165 > self->_lastSeenTicks) {
    self->_lastSeenTicks = v165;
  }
  uint64_t v166 = [v4 listeningMode];
  if (v166)
  {
    uint64_t v167 = v166;
    if (v166 != [(CBDevice *)self listeningMode])
    {
      [(CBDevice *)self setListeningMode:v167];
      v14 |= 0x80000000000uLL;
    }
  }
  uint64_t v168 = [v4 listeningModeConfigs];
  if (v168)
  {
    uint64_t v169 = v168;
    if (v168 != [(CBDevice *)self listeningModeConfigs])
    {
      [(CBDevice *)self setListeningModeConfigs:v169];
      v14 |= 0x80000000000uLL;
    }
  }
  int v170 = [v4 microphoneMode];
  if (v170 && self->_microphoneMode != v170)
  {
    self->_microphoneMode = v170;
    v14 |= 0x80000000000uLL;
  }
  id v171 = [v4 model];
  id v332 = v171;
  if ([v171 length])
  {
    model = self->_model;
    v173 = v171;
    size_t v174 = model;
    if (v173 == v174)
    {

      goto LABEL_288;
    }
    v175 = v174;
    if ((v173 == 0) != (v174 != 0))
    {
      char v176 = [(NSString *)v173 isEqual:v174];

      if (v176) {
        goto LABEL_288;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_model, v332);
    v14 |= 0x80000000000uLL;
  }
LABEL_288:
  v177 = [v4 modelUser];
  v313 = v177;
  if (![v177 length]) {
    goto LABEL_292;
  }
  id v178 = [(CBDevice *)self modelUser];
  id v179 = v177;
  id v180 = v178;
  if (v179 == v180)
  {

    int v183 = [v4 muteControlCapability];
    int muteControlCapability = self->_muteControlCapability;
    if (!v183) {
      goto LABEL_299;
    }
  }
  else
  {
    size_t v181 = v180;
    if ((v179 == 0) == (v180 != 0))
    {
    }
    else
    {
      char v182 = [v179 isEqual:v180];

      if (v182)
      {
LABEL_292:
        int v183 = [v4 muteControlCapability];
        int muteControlCapability = self->_muteControlCapability;
        if (v183) {
          goto LABEL_293;
        }
LABEL_299:
        if (!muteControlCapability) {
          goto LABEL_302;
        }
        goto LABEL_300;
      }
    }
    [(CBDevice *)self setModelUser:v179];
    v14 |= 0x80000000000uLL;
    int v183 = [v4 muteControlCapability];
    int muteControlCapability = self->_muteControlCapability;
    if (!v183) {
      goto LABEL_299;
    }
  }
LABEL_293:
  if (v183 != muteControlCapability)
  {
    self->_int muteControlCapability = v183;
    v14 |= 0x80000000000uLL;
  }
LABEL_300:
  if (self->_endCallCapability)
  {
    self->_endCallCapability = 0;
    v14 |= 0x80000000000uLL;
  }
LABEL_302:
  uint64_t v185 = [v4 muteControlConfig];
  if (v185)
  {
    uint64_t v186 = v185;
    if (v185 != [(CBDevice *)self muteControlConfig])
    {
      [(CBDevice *)self setMuteControlConfig:v186];
      v14 |= 0x80000000000uLL;
    }
  }
  size_t v187 = [v4 name];
  v343 = [v4 leAdvName];
  v334 = v187;
  if ([v187 length])
  {
    name = self->_name;
    v189 = v187;
    id v190 = name;
    if (v189 == v190)
    {
    }
    else
    {
      uint64_t v191 = v190;
      if ((v189 == 0) == (v190 != 0))
      {
      }
      else
      {
        char v192 = [(NSString *)v189 isEqual:v190];

        if (v192) {
          goto LABEL_314;
        }
      }
      if ((v5 & 2) == 0)
      {
        p_name = &self->_name;
LABEL_317:
        v194 = v189;
        v195 = *p_name;
        *p_name = v194;

        v14 |= 0x80000000000uLL;
        goto LABEL_318;
      }
    }
  }
LABEL_314:
  if (!self->_name)
  {
    v189 = v343;
    if ([(NSString *)v343 length])
    {
      objc_storeStrong((id *)&self->_name, v343);
      p_name = &self->_leAdvName;
      goto LABEL_317;
    }
  }
LABEL_318:
  if ((v5 & 0x84) == 0) {
    goto LABEL_323;
  }
  uint64_t v196 = [v4 primaryBudSide];
  if (v196 == [(CBDevice *)self primaryBudSide])
  {
    int v197 = [v4 primaryPlacement];
    if (v197 == self->_primaryPlacement) {
      goto LABEL_321;
    }
LABEL_337:
    self->_int64_t primaryPlacement = v197;
    v14 |= 0x80000000000uLL;
    int v198 = [v4 secondaryPlacement];
    if (v198 == self->_secondaryPlacement) {
      goto LABEL_323;
    }
    goto LABEL_322;
  }
  [(CBDevice *)self setPrimaryBudSide:v196];
  v14 |= 0x80000000000uLL;
  int v197 = [v4 primaryPlacement];
  if (v197 != self->_primaryPlacement) {
    goto LABEL_337;
  }
LABEL_321:
  int v198 = [v4 secondaryPlacement];
  if (v198 != self->_secondaryPlacement)
  {
LABEL_322:
    self->_int64_t secondaryPlacement = v198;
    v14 |= 0x80000000000uLL;
  }
LABEL_323:
  int v199 = [v4 placementMode];
  if (v199 && self->_placementMode != v199)
  {
    self->_placementMode = v199;
    v14 |= 0x80000000000uLL;
  }
  unsigned int v200 = [v4 productID];
  if (v200 && v200 != self->_productID)
  {
    self->_uint64_t productID = v200;
    v14 |= 0x80000000000uLL;
  }
  v201 = [v4 proximityServiceData];
  __int16 v340 = v5;
  id v322 = v201;
  if ((v5 & 2) == 0 && !v201)
  {
    unint64_t v202 = discoveryFlags;
LABEL_340:
    int v342 = 0;
    goto LABEL_345;
  }
  proximityServiceData = self->_proximityServiceData;
  uint64_t v204 = v201;
  v205 = proximityServiceData;
  if (v204 == v205)
  {
    unint64_t v202 = discoveryFlags;

    goto LABEL_340;
  }
  size_t v206 = v205;
  unint64_t v202 = discoveryFlags;
  if ((v204 == 0) != (v205 != 0))
  {
    char v207 = [(NSData *)v204 isEqual:v205];

    if (v207) {
      goto LABEL_340;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_proximityServiceData, v322);
  v14 |= 0x80000000uLL;
  self->_discoveryFlags &= 0xFFFFFFFE7FFFFFFFLL;
  v208 = CBDiscoveryTypesProximityService();
  CBDiscoveryTypesRemoveTypes(self->_discoveryTypesInternal.bitArray, v208);
  if (v322) {
    [(CBDevice *)self _parseProximityServiceData:v204];
  }
  int v342 = 1;
LABEL_345:
  id v209 = [v4 safetyAlertsAlertData];
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  v211 = v209;
  size_t v212 = safetyAlertsAlertData;
  BOOL v213 = v211 != v212;
  v339 = v211;
  if (v211 == v212)
  {
  }
  else
  {
    v214 = v212;
    if ((v211 == 0) != (v212 != 0))
    {
      v215 = v211;
      char v216 = [(NSData *)v211 isEqual:v212];

      if (v216)
      {
        BOOL v213 = 0;
        goto LABEL_353;
      }
    }
    else
    {

      v215 = v211;
    }
    v217 = v215;
    v211 = self->_safetyAlertsAlertData;
    self->_safetyAlertsAlertData = v217;
  }

LABEL_353:
  v218 = [v4 safetyAlertsAlertID];
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  v220 = v218;
  v221 = safetyAlertsAlertID;
  if (v220 == v221)
  {

    v224 = v220;
LABEL_360:

    goto LABEL_361;
  }
  v222 = v221;
  if ((v220 == 0) == (v221 != 0))
  {

    goto LABEL_359;
  }
  char v223 = [(NSData *)v220 isEqual:v221];

  if ((v223 & 1) == 0)
  {
LABEL_359:
    v225 = v220;
    v224 = self->_safetyAlertsAlertID;
    self->_safetyAlertsAlertID = v225;
    BOOL v213 = 1;
    goto LABEL_360;
  }
LABEL_361:
  v338 = v220;
  v226 = [v4 safetyAlertsSignature];
  safetyAlertsSignature = self->_safetyAlertsSignature;
  v228 = v226;
  v229 = safetyAlertsSignature;
  v337 = v228;
  if (v228 == v229)
  {
  }
  else
  {
    v230 = v229;
    if ((v228 == 0) == (v229 != 0))
    {

LABEL_370:
      objc_storeStrong((id *)&self->_safetyAlertsSignature, v226);
      int v233 = [v4 safetyAlertsVersion];
      p_safetyAlertsVersion = &self->_safetyAlertsVersion;
      if (v233 == self->_safetyAlertsVersion)
      {
        v236 = v338;
        v235 = v339;
        v237 = v337;
        goto LABEL_374;
      }
      v236 = v338;
      v235 = v339;
LABEL_373:
      v237 = v337;
      unsigned __int8 *p_safetyAlertsVersion = v233;
      goto LABEL_374;
    }
    v231 = v228;
    int v232 = [(NSData *)v228 isEqual:v229];

    if (!v232) {
      goto LABEL_370;
    }
  }
  int v233 = [v4 safetyAlertsVersion];
  p_safetyAlertsVersion = &self->_safetyAlertsVersion;
  v236 = v338;
  v235 = v339;
  if (v233 != self->_safetyAlertsVersion) {
    goto LABEL_373;
  }
  v237 = v337;
  if (v213)
  {
LABEL_374:
    self->_changedTypesInternal.bitArray[3] |= 0x40u;
    int v342 = 1;
  }
  if (v233) {
    BOOL v238 = v237 == 0;
  }
  else {
    BOOL v238 = 1;
  }
  if (v238 || v236 == 0 || v235 == 0) {
    char v241 = 0;
  }
  else {
    char v241 = 64;
  }
  self->_discoveryTypesInternal.bitArray[3] = self->_discoveryTypesInternal.bitArray[3] & 0xBF | v241;
  v242 = [v4 safetyAlertsSegmentServiceData];
  id v321 = v242;
  if ((v340 & 0x4000) == 0)
  {
    unint64_t v243 = v202;
    int v244 = [v4 selectiveSpeechListeningCapability];
    if (!v244) {
      goto LABEL_402;
    }
    goto LABEL_396;
  }
  safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
  v246 = v242;
  v247 = safetyAlertsSegmentServiceData;
  if (v246 == v247)
  {

    unint64_t v243 = v202;
    goto LABEL_395;
  }
  v248 = v247;
  if ((v246 == 0) == (v247 != 0))
  {

    unint64_t v243 = v202;
    goto LABEL_399;
  }
  char v249 = [(NSData *)v246 isEqual:v247];

  unint64_t v243 = v202;
  if (v249)
  {
LABEL_395:
    int v244 = [v4 selectiveSpeechListeningCapability];
    if (!v244) {
      goto LABEL_402;
    }
    goto LABEL_396;
  }
LABEL_399:
  objc_storeStrong((id *)&self->_safetyAlertsSegmentServiceData, v321);
  self->_changedTypesInternal.bitArray[3] |= 0x40u;
  self->_discoveryTypesInternal.bitArray[3] &= ~0x40u;
  if (v246) {
    [(CBDevice *)self _parseSafetyAlertsSegmentServiceData:v246];
  }
  int v342 = 1;
  int v244 = [v4 selectiveSpeechListeningCapability];
  if (v244)
  {
LABEL_396:
    if (v244 != self->_selectiveSpeechListeningCapability)
    {
      self->_selectiveSpeechListeningCapability = v244;
      v14 |= 0x80000000000uLL;
    }
  }
LABEL_402:
  uint64_t v250 = [v4 selectiveSpeechListeningConfig];
  if (v250)
  {
    uint64_t v251 = v250;
    if (v250 != [(CBDevice *)self selectiveSpeechListeningConfig])
    {
      [(CBDevice *)self setSelectiveSpeechListeningConfig:v251];
      v14 |= 0x80000000000uLL;
    }
  }
  int v252 = [v4 hearingAidSupport];
  if (v252 && self->_hearingAidSupport != v252)
  {
    self->_hearingAidSupport = v252;
    v14 |= 0x80000000000uLL;
  }
  int v253 = [v4 hearingTestSupport];
  if (v253 && self->_hearingTestSupport != v253)
  {
    self->_hearingTestSupport = v253;
    v14 |= 0x80000000000uLL;
  }
  v254 = [v4 serialNumber];
  if ([v254 length])
  {
    serialNumber = self->_serialNumber;
    v256 = v254;
    v257 = serialNumber;
    if (v256 == v257)
    {

      goto LABEL_419;
    }
    v258 = v257;
    if ((v256 == 0) != (v257 != 0))
    {
      char v259 = [(NSString *)v256 isEqual:v257];

      if (v259) {
        goto LABEL_419;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_serialNumber, v254);
    v14 |= 0x80000000000uLL;
  }
LABEL_419:
  v260 = [v4 serialNumberLeft];
  id v331 = v260;
  if (![v260 length]) {
    goto LABEL_427;
  }
  serialNumberLeft = self->_serialNumberLeft;
  v262 = v260;
  v263 = serialNumberLeft;
  if (v262 == v263)
  {

    goto LABEL_427;
  }
  v264 = v263;
  if ((v262 == 0) == (v263 != 0))
  {

    goto LABEL_426;
  }
  char v265 = [(NSString *)v262 isEqual:v263];

  if ((v265 & 1) == 0)
  {
LABEL_426:
    objc_storeStrong((id *)&self->_serialNumberLeft, v331);
    v14 |= 0x80000000000uLL;
  }
LABEL_427:
  v266 = [v4 serialNumberRight];
  id v330 = v266;
  if (![v266 length]) {
    goto LABEL_433;
  }
  serialNumberRight = self->_serialNumberRight;
  v268 = v266;
  v269 = serialNumberRight;
  if (v268 == v269)
  {

    goto LABEL_433;
  }
  v270 = v269;
  if ((v268 == 0) == (v269 != 0))
  {

    goto LABEL_436;
  }
  char v271 = [(NSString *)v268 isEqual:v269];

  if (v271)
  {
LABEL_433:
    int v272 = [v4 smartRoutingMode];
    if (v272) {
      goto LABEL_437;
    }
    goto LABEL_439;
  }
LABEL_436:
  objc_storeStrong((id *)&self->_serialNumberRight, v330);
  v14 |= 0x80000000000uLL;
  int v272 = [v4 smartRoutingMode];
  if (v272)
  {
LABEL_437:
    if (self->_smartRoutingMode != v272)
    {
      self->_smartRoutingMode = v272;
      v14 |= 0x80000000000uLL;
    }
  }
LABEL_439:
  if (v21)
  {
    uint64_t v273 = [v4 spatialAudioMode];
    if (v273 != [(CBDevice *)self spatialAudioMode])
    {
      [(CBDevice *)self setSpatialAudioMode:v273];
      v14 |= 0x80000000000uLL;
    }
    unsigned int v274 = [v4 supportedServices];
    if (v274 != self->_supportedServices)
    {
      self->_uint64_t supportedServices = v274;
      v14 |= 0x80000200000uLL;
    }
  }
  v275 = [v4 txAddressData];
  id v323 = v275;
  if (!v275) {
    goto LABEL_450;
  }
  txAddressData = self->_txAddressData;
  v277 = v275;
  v278 = txAddressData;
  if (v277 == v278)
  {

    goto LABEL_450;
  }
  v279 = v278;
  if (!v278)
  {

    goto LABEL_453;
  }
  char v280 = [(NSData *)v277 isEqual:v278];

  if (v280)
  {
LABEL_450:
    int v281 = [v4 vendorID];
    if (!v281) {
      goto LABEL_456;
    }
    goto LABEL_454;
  }
LABEL_453:
  objc_storeStrong((id *)&self->_txAddressData, v323);
  v14 |= 0x80000000000uLL;
  int v281 = [v4 vendorID];
  if (!v281) {
    goto LABEL_456;
  }
LABEL_454:
  if (v281 != self->_vendorID)
  {
    self->_vendorID = v281;
    v14 |= 0x80000000000uLL;
  }
LABEL_456:
  int v282 = [v4 vendorIDSource];
  int vendorIDSource = self->_vendorIDSource;
  if (!v282)
  {
    int v282 = self->_vendorIDSource;
    v312 = v254;
    if (vendorIDSource != 1) {
      goto LABEL_460;
    }
LABEL_463:
    int v284 = 76;
LABEL_464:
    BOOL v285 = self->_vendorID == v284;
    uint64_t v286 = [(CBDevice *)self productID];
    if (v286) {
      goto LABEL_465;
    }
    goto LABEL_472;
  }
  if (v282 != vendorIDSource)
  {
    self->_int vendorIDSource = v282;
    v14 |= 0x80000000000uLL;
  }
  v312 = v254;
  if (v282 == 1) {
    goto LABEL_463;
  }
LABEL_460:
  if (v282 == 2)
  {
    int v284 = 1452;
    goto LABEL_464;
  }
  BOOL v285 = 0;
  uint64_t v286 = [(CBDevice *)self productID];
  if (v286)
  {
LABEL_465:
    if (v285) {
      goto LABEL_466;
    }
LABEL_476:
    v293 = v336;
    v295 = CBDeviceTypeToNSLocalizedString(self->_deviceType);
    if (!v285) {
      goto LABEL_490;
    }
    goto LABEL_484;
  }
LABEL_472:
  uint64_t v286 = [(CBDevice *)self proximityPairingProductID];
  if (v286) {
    BOOL v294 = v285;
  }
  else {
    BOOL v294 = 0;
  }
  if (!v294) {
    goto LABEL_476;
  }
LABEL_466:
  v287 = +[CBProductInfo productInfoWithProductID:v286];
  v288 = [v287 productName];

  if (!v288)
  {
LABEL_479:
    v293 = v336;
    goto LABEL_480;
  }
  unint64_t v289 = v243;
  v290 = self->_productName;
  v291 = v288;
  v292 = v291;
  if (v290 == v291)
  {

    unint64_t v243 = v289;
    goto LABEL_479;
  }
  if (!v290)
  {

    unint64_t v243 = v289;
    v293 = v336;
LABEL_483:
    objc_storeStrong((id *)&self->_productName, v288);
    v14 |= 0x80000000000uLL;

    v295 = CBDeviceTypeToNSLocalizedString(self->_deviceType);
    if (!v285) {
      goto LABEL_490;
    }
    goto LABEL_484;
  }
  char v310 = [(NSString *)v290 isEqual:v291];

  unint64_t v243 = v289;
  v293 = v336;
  if ((v310 & 1) == 0) {
    goto LABEL_483;
  }
LABEL_480:

  v295 = CBDeviceTypeToNSLocalizedString(self->_deviceType);
  if (!v285) {
    goto LABEL_490;
  }
LABEL_484:
  v296 = self->_name;
  if (!v296 || [(NSString *)v296 isEqualToString:v295])
  {
    v297 = CBProductIDToNSLocalizedProductNameString(v286);
    if (v297)
    {
      objc_storeStrong((id *)&self->_name, v297);
      v14 |= 0x80000000000uLL;
    }
    char v298 = v340;

    v293 = v336;
    v299 = &self->_name;
    if (!self->_name) {
      goto LABEL_491;
    }
    goto LABEL_492;
  }
LABEL_490:
  char v298 = v340;
  v299 = &self->_name;
  if (!self->_name)
  {
LABEL_491:
    objc_storeStrong((id *)v299, v295);
    v14 |= 0x80000000000uLL;
  }
LABEL_492:
  if ([(NSString *)v343 length] && [(NSString *)*v299 isEqualToString:v295])
  {
    objc_storeStrong((id *)v299, v343);
    objc_storeStrong((id *)&self->_leAdvName, v343);
    v14 |= 0x80000000000uLL;
  }
  int v300 = v342;
  if ((v14 & 0x40000000) != 0)
  {
    self->_discoveryFlags &= 0x8305793BCEB00040;
    int v344 = *(_DWORD *)self->_discoveryTypesInternal.bitArray;
    unsigned __int8 v345 = self->_discoveryTypesInternal.bitArray[4];
    v307 = CBDiscoveryTypesBLEScan();
    CBDiscoveryTypesRemoveTypes(self->_discoveryTypesInternal.bitArray, v307);
    id v308 = v335;
    uint64_t v309 = [v308 bytes];
    if (v309) {
      -[CBDevice _parseManufacturerPtr:end:](self, "_parseManufacturerPtr:end:", v309, v309 + [v308 length]);
    }
    CBDiscoveryTypesAddChangedTypes(self->_changedTypesInternal.bitArray, &v344, self->_discoveryTypesInternal.bitArray);
    int v300 = 1;
    v293 = v336;
    if ((v298 & 2) != 0)
    {
LABEL_497:
      self->_unint64_t discoveryFlags = self->_discoveryFlags & 0xFFFDFFFFFFFFFFFFLL | ((((unint64_t)[v4 discoveryFlags] >> 49) & 1) << 49);
      self->_unint64_t discoveryFlags = ((unint64_t)(v311 != 0) << 51) | ((unint64_t)(v293 != 0) << 54) | self->_discoveryFlags & 0xFFB7FFFFDFFFFFFFLL | [v4 discoveryFlags] & 0x20000000;
      self->_discoveryTypesInternal.bitArray[1] = self->_discoveryTypesInternal.bitArray[1] & 0xEF | (16 * (v341 != 0));
      if (!v300) {
        goto LABEL_498;
      }
      goto LABEL_507;
    }
  }
  else if ((v298 & 2) != 0)
  {
    goto LABEL_497;
  }
  if (!v300)
  {
LABEL_498:
    v301 = v317;
    if ((self->_internalFlags & 0x800) == 0) {
      goto LABEL_500;
    }
    goto LABEL_499;
  }
LABEL_507:
  [(CBDevice *)self _clearUnparsedProperties];
  v301 = v317;
  if ((self->_internalFlags & 0x800) != 0) {
LABEL_499:
  }
    self->_discoveryTypesInternal.bitArray[3] |= 0x80u;
LABEL_500:
  unint64_t v302 = self->_discoveryFlags;
  uint64_t v303 = v14 | 0x800000000;
  if (v302 == v243) {
    uint64_t v303 = v14;
  }
  unint64_t v304 = self->_changeFlags;
  unint64_t v305 = v304 ^ v319 | v302 ^ v243 | v303;
  self->_unint64_t changeFlags = v305 | v304;

  return v305;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)discoveryTypesContainCBDiscovery:(id)a3
{
  id v4 = a3;
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (([v4 discoveryFlags] & discoveryFlags) != 0)
  {

    return 1;
  }
  else
  {
    BOOL v7 = CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, (unsigned char *)[v4 discoveryTypesInternalPtr]);

    return v7;
  }
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (NSData)gfpPayloadData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"f", TypeID, 0);
}

- (unsigned)gapaFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (NSData)fidoPayloadData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"d", TypeID, 0);
}

- (NSData)dockKitAccessoryPayloadData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"dKA", TypeID, 0);
}

- (unsigned)productID
{
  return self->_productID;
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (unsigned)selectiveSpeechListeningConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)muteControlConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)modelUser
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFStringGetTypeID();

  return (NSString *)MEMORY[0x1F4115F30](deviceInfo, @"modU", TypeID, 0);
}

- (int)listeningMode
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)listeningModeConfigs
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)interval
{
  return self->_interval;
}

- (unsigned)frequencyBand
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)findMyGroupIdentifier
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFStringGetTypeID();

  return (NSString *)MEMORY[0x1F4115F30](deviceInfo, @"fmGI", TypeID, 0);
}

- (NSString)findMyCaseIdentifier
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFStringGetTypeID();

  return (NSString *)MEMORY[0x1F4115F30](deviceInfo, @"fmCI", TypeID, 0);
}

- (unsigned)endCallConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)crownRotationDirection
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)conversationDetectConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)clickHoldModeRight
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)clickHoldModeLeft
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)btVersion
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFStringGetTypeID();

  return (NSString *)MEMORY[0x1F4115F30](deviceInfo, @"btV", TypeID, 0);
}

- (unsigned)appearanceValue
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)adaptiveVolumeConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)proximityPairingProductID
{
  return self->_proximityPairingProductID;
}

- (NSString)model
{
  return self->_model;
}

- (int)bleChannel
{
  return self->_bleChannel;
}

- (unint64_t)bleAdvertisementTimestampMachContinuous
{
  return self->_bleAdvertisementTimestampMachContinuous;
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (unint64_t)lastSeenTicks
{
  return self->_lastSeenTicks;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (NSData)txAddressData
{
  return self->_txAddressData;
}

- (char)smartRoutingMode
{
  return self->_smartRoutingMode;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)serialNumberRight
{
  return self->_serialNumberRight;
}

- (NSString)serialNumberLeft
{
  return self->_serialNumberLeft;
}

- (unsigned)selectiveSpeechListeningCapability
{
  return self->_selectiveSpeechListeningCapability;
}

- (unsigned)safetyAlertsVersion
{
  return self->_safetyAlertsVersion;
}

- (NSData)safetyAlertsSignature
{
  return self->_safetyAlertsSignature;
}

- (NSData)safetyAlertsSegmentServiceData
{
  return self->_safetyAlertsSegmentServiceData;
}

- (NSData)safetyAlertsAlertID
{
  return self->_safetyAlertsAlertID;
}

- (NSData)safetyAlertsAlertData
{
  return self->_safetyAlertsAlertData;
}

- (NSData)proximityServiceData
{
  return self->_proximityServiceData;
}

- (char)placementMode
{
  return self->_placementMode;
}

- (unsigned)muteControlCapability
{
  return self->_muteControlCapability;
}

- (char)microphoneMode
{
  return self->_microphoneMode;
}

- (NSString)leAdvName
{
  return self->_leAdvName;
}

- (char)hearingTestSupport
{
  return self->_hearingTestSupport;
}

- (char)hearingAidSupport
{
  return self->_hearingAidSupport;
}

- (unsigned)gfpModelID
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (unsigned)endCallCapability
{
  return self->_endCallCapability;
}

- (unsigned)dsInfoVehicleState
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)dsInfoVehicleConfidence
{
  return CFDictionaryGetInt64Ranged();
}

- (char)doubleTapCapability
{
  return self->_doubleTapCapability;
}

- (char)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (char)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (unsigned)conversationDetectCapability
{
  return self->_conversationDetectCapability;
}

- (CBControllerInfo)controllerInfo
{
  return self->_controllerInfo;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (unsigned)colorInfo
{
  return self->_colorInfo;
}

- (char)classicRSSI
{
  return self->_classicRSSI;
}

- (NSString)caseVersion
{
  return self->_caseVersion;
}

- (int)bleRSSI
{
  return self->_bleRSSI;
}

- (NSData)bleAppleManufacturerData
{
  return self->_bleAppleManufacturerData;
}

- (double)bleAdvertisementTimestamp
{
  return self->_bleAdvertisementTimestamp;
}

- (NSData)bleAdvertisementData
{
  return self->_bleAdvertisementData;
}

- (NSData)bleAddressData
{
  return self->_bleAddressData;
}

- (unsigned)autoAncCapability
{
  return self->_autoAncCapability;
}

- (int)audioStreamState
{
  return self->_audioStreamState;
}

- (unsigned)adaptiveVolumeCapability
{
  return self->_adaptiveVolumeCapability;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)_parseManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 2)
  {
    int v6 = *(unsigned __int16 *)a3;
    id v4 = a3 + 2;
    int v5 = v6;
    if (v6 == 6)
    {
      -[CBDevice _parseMicrosoftManufacturerPtr:end:](self, "_parseMicrosoftManufacturerPtr:end:", v4);
    }
    else if (v5 == 76)
    {
      -[CBDevice _parseAppleManufacturerPtr:end:](self, "_parseAppleManufacturerPtr:end:", v4);
    }
  }
}

- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 2)
  {
    int v5 = a3;
    do
    {
      uint64_t v7 = v5[1] & 0x1F;
      if (a4 - (v5 + 2) < v7) {
        break;
      }
      int v8 = *(unsigned __int8 *)v5;
      v5 += v7 + 2;
      switch(v8)
      {
        case 5:
          -[CBDevice _parseAirDropPtr:end:](self, "_parseAirDropPtr:end:");
          break;
        case 6:
          -[CBDevice _parseHomeKitV1Ptr:end:](self, "_parseHomeKitV1Ptr:end:");
          break;
        case 7:
          -[CBDevice _parseProximityPairingPtr:end:](self, "_parseProximityPairingPtr:end:");
          break;
        case 8:
          -[CBDevice _parseHeySiriPtr:end:](self, "_parseHeySiriPtr:end:");
          break;
        case 9:
          -[CBDevice _parseAirPlayTargetPtr:end:](self, "_parseAirPlayTargetPtr:end:");
          break;
        case 10:
          -[CBDevice _parseAirPlaySourcePtr:end:](self, "_parseAirPlaySourcePtr:end:");
          break;
        case 15:
          -[CBDevice _parseNearbyActionPtr:end:](self, "_parseNearbyActionPtr:end:");
          break;
        case 16:
          -[CBDevice _parseNearbyInfoPtr:end:](self, "_parseNearbyInfoPtr:end:");
          break;
        case 17:
          -[CBDevice _parseHomeKitV2Ptr:end:](self, "_parseHomeKitV2Ptr:end:");
          break;
        case 18:
          -[CBDevice _parseObjectDiscoveryPtr:end:](self, "_parseObjectDiscoveryPtr:end:");
          break;
        case 19:
          -[CBDevice _parseSpatialInteractionPtr:end:](self, "_parseSpatialInteractionPtr:end:");
          break;
        case 21:
          -[CBDevice _parseNearbyActionV2Ptr:end:](self, "_parseNearbyActionV2Ptr:end:");
          break;
        case 22:
          -[CBDevice _parseNearbyInfoV2Ptr:end:](self, "_parseNearbyInfoV2Ptr:end:");
          break;
        case 24:
          -[CBDevice _parseDSInfoPtr:end:](self, "_parseDSInfoPtr:end:");
          break;
        case 26:
          -[CBDevice _parseNearbyActionNoWakePtr:end:](self, "_parseNearbyActionNoWakePtr:end:");
          break;
        default:
          break;
      }
    }
    while (a4 - v5 > 1);
  }
}

- (void)_parseObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a4 - a3 >= 1)
  {
    uint64_t v7 = a3 + 1;
    unint64_t v8 = *(unsigned __int8 *)a3;
    uint64_t v9 = (v8 >> 4) & 3;
    if (v9 == 3) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = dword_1ABA91718[v9];
    }
    id v11 = self->_btAddressData;
    if ([(NSData *)v11 length] != 6) {
      goto LABEL_19;
    }
    if (a4 - v7 < 22)
    {
      uint64_t v17 = [(NSData *)v11 bytes];
      __int16 v18 = *(_WORD *)(v17 + 4);
      int v20 = *(_DWORD *)v17;
      __int16 v21 = v18;
      if (a4 - v7 >= 1) {
        LOBYTE(v20) = v20 & 0x3F | (*v7 << 6);
      }
      uint64_t v14 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v20 length:6];
      self->_objectDiscoveryBatteryState = v8 >> 6;
      self->_objectDiscoveryMode = 1;
      self->_uint64_t objectDiscoveryProductID = v10;
      if (!v14)
      {
        uint64_t v16 = 0x20000000000;
        goto LABEL_18;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
      self->_objectDiscoveryNearOwnerID = v14;
      uint64_t v16 = 0x20000000000;
    }
    else
    {
      uint64_t v12 = [(NSData *)v11 bytes];
      __int16 v13 = *(_WORD *)(v12 + 4);
      int v20 = *(_DWORD *)v12;
      __int16 v21 = v13;
      *(_OWORD *)int v22 = *(_OWORD *)v7;
      *(void *)&v22[14] = *(void *)(v7 + 14);
      if (a4 - (a3 + 23) >= 1) {
        LOBYTE(v20) = v20 & 0x3F | (a3[23] << 6);
      }
      uint64_t v14 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v20 length:28];
      self->_objectDiscoveryBatteryState = v8 >> 6;
      self->_objectDiscoveryMode = 2;
      self->_uint64_t objectDiscoveryProductID = v10;
      if (!v14)
      {
        uint64_t v16 = 0x40000000000;
        goto LABEL_18;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryPublicKeyData;
      self->_objectDiscoveryPublicKeyData = v14;
      uint64_t v16 = 0x40000000000;
    }
    uint64_t v19 = v14;

LABEL_18:
    self->_discoveryFlags |= v16;
LABEL_19:
  }
}

- (NSData)nearbyAuthTag
{
  return self->_nearbyAuthTag;
}

- (void)updateWithReceivedAuthTag:(id)a3 forType:(unsigned __int8)a4
{
  int v4 = a4;
  id v13 = a3;
  if (v13)
  {
    if (v4 == 21)
    {
      int v6 = [(CBDevice *)self nearbyActionV2TargetData];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        unint64_t v8 = [(CBDevice *)self nearbyActionV2TargetData];
        id v9 = v13;
        id v10 = v8;
        if (v10 == v9)
        {

          goto LABEL_11;
        }
        id v11 = v10;
        if (v10)
        {
          char v12 = [v9 isEqual:v10];

          if (v12) {
            goto LABEL_11;
          }
        }
        else
        {
        }
        [(CBDevice *)self setNearbyActionV2Flags:0];
        [(CBDevice *)self setNearbyActionV2Type:0];
        [(CBDevice *)self setNearbyActionV2TargetData:0];
        self->_discoveryFlags &= 0xDFFFFFFBFFFDFEF7;
        self->_changeFlags &= 0xDFFFFFFBFFFDFEF7;
      }
    }
  }
LABEL_11:
}

- (NSData)nearbyActionV2TargetData
{
  return (NSData *)MEMORY[0x1F4115ED0](self->_deviceInfo, @"u", 3, 0);
}

- (CBDevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v129.receiver = self;
  v129.super_class = (Class)CBDevice;
  uint64_t v7 = [(CBDevice *)&v129 init];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_330;
    }
    char v125 = "CBDevice super init failed";
LABEL_329:
    CBErrorF(-6756, (uint64_t)v125, v8, v9, v10, v11, v12, v13, v128);
    id v123 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_324;
  }
  uint64_t v14 = MEMORY[0x1AD1120E0](v6);
  uint64_t v15 = MEMORY[0x1E4F14590];
  if (v14 != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_330;
    }
    char v125 = "XPC non-dict";
    goto LABEL_329;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_adaptiveVolumeCapability = v130;
  }
  else if (v16 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_int64_t audioStreamState = v130;
  }
  else if (v17 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_autoAncCapability = v130;
  }
  else if (v18 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_batteryInfoMain = v130;
  }
  else if (v19 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_batteryInfoLeft = v130;
  }
  else if (v20 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_batteryInfoRight = v130;
  }
  else if (v21 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_batteryInfoCase = v130;
  }
  else if (v22 == 5)
  {
    goto LABEL_330;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeDouble()) {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_uint64_t bleAdvertisementTimestampMachContinuous = v130;
  }
  else if (v23 == 5)
  {
    goto LABEL_330;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v24 = CUXPCDecodeSInt64RangedEx();
  if (v24 == 6)
  {
    v7->_int64_t bleChannel = v130;
  }
  else if (v24 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v25 = CUXPCDecodeSInt64RangedEx();
  if (v25 == 6)
  {
    v7->_int64_t bleRSSI = v130;
  }
  else if (v25 == 5)
  {
    goto LABEL_330;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSString()) {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v26 = CUXPCDecodeUInt64RangedEx();
  if (v26 == 6)
  {
    v7->_unint64_t changeFlags = v130;
  }
  else if (v26 == 5)
  {
    goto LABEL_330;
  }
  if (!CBXPCDecodeDiscoveryTypes(v6, "chTy", &v7->_changedTypesInternal)) {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v27 = CUXPCDecodeSInt64RangedEx();
  if (v27 == 6)
  {
    v7->_classicRSSI = v130;
  }
  else if (v27 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_colorInfo = v130;
  }
  else if (v28 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v7->_uint64_t connectedServices = v130;
  }
  else if (v29 == 5)
  {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_conversationDetectCapability = v130;
  }
  else if (v30 == 5)
  {
    goto LABEL_330;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_330;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_330;
  }
  unint64_t v130 = 0;
  int v31 = CUXPCDecodeUInt64RangedEx();
  if (v31 == 6)
  {
    v7->_unint64_t deviceFlags = v130;
    goto LABEL_60;
  }
  if (v31 == 5)
  {
LABEL_330:
    id v123 = 0;
    goto LABEL_324;
  }
LABEL_60:
  uint64_t v32 = xpc_dictionary_get_value(v6, "dvIn");
  v33 = (void *)v32;
  if (!v32) {
    goto LABEL_65;
  }
  if (MEMORY[0x1AD1120E0](v32) != v15)
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"Bad DeviceInfo XPC type", v34, v35, v36, v37, v38, v39, v128);
      id v123 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_323;
    }
    goto LABEL_333;
  }
  char v46 = (void *)CUXPCCreateCFObjectFromXPCObject();
  if (!v46)
  {
    if (a4)
    {
      uint64_t v126 = "XPC->CF failed";
      int v127 = -6732;
LABEL_338:
      CBErrorF(v127, (uint64_t)v126, v40, v41, v42, v43, v44, v45, v128);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_339:

    id v123 = 0;
    goto LABEL_323;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      uint64_t v126 = "Bad DeviceInfo NS type";
      int v127 = -6756;
      goto LABEL_338;
    }
    goto LABEL_339;
  }
  uint64_t v47 = [v46 mutableCopy];
  deviceInfo = v7->_deviceInfo;
  v7->_deviceInfo = (NSMutableDictionary *)v47;

LABEL_65:
  unint64_t v130 = 0;
  int v49 = CUXPCDecodeUInt64RangedEx();
  if (v49 == 6)
  {
    v7->_deviceType = v130;
  }
  else if (v49 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v50 = CUXPCDecodeUInt64RangedEx();
  if (v50 == 6)
  {
    v7->_unint64_t discoveryFlags = v130;
  }
  else if (v50 == 5)
  {
    goto LABEL_333;
  }
  if (!CBXPCDecodeDiscoveryTypes(v6, "dsTy", &v7->_discoveryTypesInternal)) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v51 = CUXPCDecodeSInt64RangedEx();
  if (v51 == 6)
  {
    v7->_doubleTapActionLeft = v130;
  }
  else if (v51 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v52 = CUXPCDecodeSInt64RangedEx();
  if (v52 == 6)
  {
    v7->_doubleTapActionRight = v130;
  }
  else if (v52 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v53 = CUXPCDecodeSInt64RangedEx();
  if (v53 == 6)
  {
    v7->_doubleTapCapability = v130;
  }
  else if (v53 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v54 = CUXPCDecodeUInt64RangedEx();
  if (v54 == 6)
  {
    v7->_endCallCapability = v130;
  }
  else if (v54 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v55 = CUXPCDecodeUInt64RangedEx();
  if (v55 == 6)
  {
    v7->_interval = v130;
  }
  else if (v55 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v56 = CUXPCDecodeSInt64RangedEx();
  if (v56 == 6)
  {
    v7->_microphoneMode = v130;
  }
  else if (v56 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v57 = CUXPCDecodeUInt64RangedEx();
  if (v57 == 6)
  {
    v7->_int muteControlCapability = v130;
  }
  else if (v57 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v58 = CUXPCDecodeSInt64RangedEx();
  if (v58 == 6)
  {
    v7->_int64_t primaryPlacement = v130;
  }
  else if (v58 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v59 = CUXPCDecodeSInt64RangedEx();
  if (v59 == 6)
  {
    v7->_int64_t secondaryPlacement = v130;
  }
  else if (v59 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v60 = CUXPCDecodeSInt64RangedEx();
  if (v60 == 6)
  {
    v7->_placementMode = v130;
  }
  else if (v60 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v61 = CUXPCDecodeUInt64RangedEx();
  if (v61 == 6)
  {
    v7->_uint64_t productID = v130;
  }
  else if (v61 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v62 = CUXPCDecodeSInt64RangedEx();
  if (v62 == 6)
  {
    v7->_smartRoutingMode = v130;
  }
  else if (v62 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v63 = CUXPCDecodeUInt64RangedEx();
  if (v63 == 6)
  {
    v7->_uint64_t supportedServices = v130;
  }
  else if (v63 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v64 = CUXPCDecodeUInt64RangedEx();
  if (v64 == 6)
  {
    v7->_vendorID = v130;
  }
  else if (v64 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v65 = CUXPCDecodeUInt64RangedEx();
  if (v65 == 6)
  {
    v7->_int vendorIDSource = v130;
  }
  else if (v65 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v66 = CUXPCDecodeUInt64RangedEx();
  if (v66 == 6)
  {
    v7->_airdropFlags = v130;
  }
  else if (v66 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v67 = CUXPCDecodeUInt64RangedEx();
  if (v67 == 6)
  {
    v7->_airdropModel = v130;
  }
  else if (v67 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v68 = CUXPCDecodeUInt64RangedEx();
  if (v68 == 6)
  {
    v7->_airdropVersion = v130;
  }
  else if (v68 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v69 = CUXPCDecodeUInt64RangedEx();
  if (v69 == 6)
  {
    v7->_airdropHash1 = v130;
  }
  else if (v69 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v70 = CUXPCDecodeUInt64RangedEx();
  if (v70 == 6)
  {
    v7->_airdropHash2 = v130;
  }
  else if (v70 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v71 = CUXPCDecodeUInt64RangedEx();
  if (v71 == 6)
  {
    v7->_airdropHash3 = v130;
  }
  else if (v71 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v72 = CUXPCDecodeUInt64RangedEx();
  if (v72 == 6)
  {
    v7->_airdropHash4 = v130;
  }
  else if (v72 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v73 = CUXPCDecodeUInt64RangedEx();
  if (v73 == 6)
  {
    v7->_airdropConfigData = v130;
  }
  else if (v73 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v74 = CUXPCDecodeUInt64RangedEx();
  if (v74 == 6)
  {
    v7->_airplaySourceFlags = v130;
  }
  else if (v74 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v75 = CUXPCDecodeUInt64RangedEx();
  if (v75 == 6)
  {
    v7->_airplayTargetConfigSeed = v130;
  }
  else if (v75 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v76 = CUXPCDecodeUInt64RangedEx();
  if (v76 == 6)
  {
    v7->_airplayTargetFlags = v130;
  }
  else if (v76 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v77 = CUXPCDecodeUInt64RangedEx();
  if (v77 == 6)
  {
    v7->_airplayTargetIPint v4 = v130;
  }
  else if (v77 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v78 = CUXPCDecodeUInt64RangedEx();
  if (v78 == 6)
  {
    v7->_homeKitV1Category = v130;
  }
  else if (v78 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v79 = CUXPCDecodeUInt64RangedEx();
  if (v79 == 6)
  {
    v7->_homeKitV1CompatibleVersion = v130;
  }
  else if (v79 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v80 = CUXPCDecodeUInt64RangedEx();
  if (v80 == 6)
  {
    v7->_homeKitV1ConfigurationNumber = v130;
  }
  else if (v80 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v81 = CUXPCDecodeUInt64RangedEx();
  if (v81 == 6)
  {
    v7->_homeKitV1Flags = v130;
  }
  else if (v81 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v82 = CUXPCDecodeUInt64RangedEx();
  if (v82 == 6)
  {
    v7->_homeKitV1StateNumber = v130;
  }
  else if (v82 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v83 = CUXPCDecodeUInt64RangedEx();
  if (v83 == 6)
  {
    v7->_uint64_t homeKitV1SetupHash = v130;
  }
  else if (v83 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v84 = CUXPCDecodeUInt64RangedEx();
  if (v84 == 6)
  {
    v7->_homeKitV2InstanceID = v130;
  }
  else if (v84 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v85 = CUXPCDecodeUInt64RangedEx();
  if (v85 == 6)
  {
    v7->_homeKitV2StateNumber = v130;
  }
  else if (v85 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v86 = CUXPCDecodeUInt64RangedEx();
  if (v86 == 6)
  {
    v7->_uint64_t homeKitV2Value = v130;
  }
  else if (v86 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v87 = CUXPCDecodeUInt64RangedEx();
  if (v87 == 6)
  {
    v7->_uint64_t nearbyActionFlags = v130;
  }
  else if (v87 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v88 = CUXPCDecodeUInt64RangedEx();
  if (v88 == 6)
  {
    v7->_nearbyActionType = v130;
  }
  else if (v88 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v89 = CUXPCDecodeUInt64RangedEx();
  if (v89 == 6)
  {
    v7->_uint64_t nearbyInfoFlags = v130;
  }
  else if (v89 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v90 = CUXPCDecodeUInt64RangedEx();
  if (v90 == 6)
  {
    v7->_nearbyInfoV2DecryptedFlags = v130;
  }
  else if (v90 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v91 = CUXPCDecodeUInt64RangedEx();
  if (v91 == 6)
  {
    v7->_nearbyInfoV2Flags = v130;
  }
  else if (v91 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v92 = CUXPCDecodeUInt64RangedEx();
  if (v92 == 6)
  {
    v7->_nearbyInfoV2InvitationCounter = v130;
  }
  else if (v92 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v93 = CUXPCDecodeUInt64RangedEx();
  if (v93 == 6)
  {
    v7->_nearbyInfoV2InvitationTypes = v130;
  }
  else if (v93 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v94 = CUXPCDecodeUInt64RangedEx();
  if (v94 == 6)
  {
    v7->_nearbyInfoV2InvitationRouteType = v130;
  }
  else if (v94 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v95 = CUXPCDecodeUInt64RangedEx();
  if (v95 == 6)
  {
    v7->_objectDiscoveryBatteryState = v130;
  }
  else if (v95 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v96 = CUXPCDecodeUInt64RangedEx();
  if (v96 == 6)
  {
    v7->_objectDiscoveryMode = v130;
  }
  else if (v96 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v97 = CUXPCDecodeUInt64RangedEx();
  if (v97 == 6)
  {
    v7->_uint64_t objectDiscoveryProductID = v130;
  }
  else if (v97 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v98 = CUXPCDecodeUInt64RangedEx();
  if (v98 == 6)
  {
    v7->_uint64_t proximityPairingProductID = v130;
  }
  else if (v98 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v99 = CUXPCDecodeUInt64RangedEx();
  if (v99 == 6)
  {
    v7->_proximityPairingSubType = v130;
  }
  else if (v99 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v100 = CUXPCDecodeUInt64RangedEx();
  if (v100 == 6)
  {
    v7->_peerStatusFlag = v130;
  }
  else if (v100 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v101 = CUXPCDecodeUInt64RangedEx();
  if (v101 == 6)
  {
    v7->_transmitPowerOne = v130;
  }
  else if (v101 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v102 = CUXPCDecodeUInt64RangedEx();
  if (v102 == 6)
  {
    v7->_transmitPowerTwo = v130;
  }
  else if (v102 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v103 = CUXPCDecodeUInt64RangedEx();
  if (v103 == 6)
  {
    v7->_transmitPowerThree = v130;
  }
  else if (v103 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v104 = CUXPCDecodeUInt64RangedEx();
  if (v104 == 6)
  {
    v7->_proximityServiceCategory = v130;
  }
  else if (v104 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v105 = CUXPCDecodeUInt64RangedEx();
  if (v105 == 6)
  {
    v7->_proximityServiceFlags = v130;
  }
  else if (v105 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v106 = CUXPCDecodeSInt64RangedEx();
  if (v106 == 6)
  {
    v7->_proximityServiceMeasuredPower = v130;
  }
  else if (v106 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v107 = CUXPCDecodeUInt64RangedEx();
  if (v107 == 6)
  {
    v7->_uint64_t proximityServiceProductID = v130;
  }
  else if (v107 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v108 = CUXPCDecodeUInt64RangedEx();
  if (v108 == 6)
  {
    v7->_proximityServicePSM = v130;
  }
  else if (v108 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v109 = CUXPCDecodeUInt64RangedEx();
  if (v109 == 6)
  {
    v7->_proximityServiceSubType = v130;
  }
  else if (v109 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v110 = CUXPCDecodeUInt64RangedEx();
  if (v110 == 6)
  {
    v7->_proximityServiceVendorID = v130;
  }
  else if (v110 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v111 = CUXPCDecodeUInt64RangedEx();
  if (v111 == 6)
  {
    v7->_proximityServiceVersion = v130;
  }
  else if (v111 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSData()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSDataOfLength())
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v112 = CUXPCDecodeUInt64RangedEx();
  if (v112 == 6)
  {
    v7->_safetyAlertsVersion = v130;
  }
  else if (v112 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v113 = CUXPCDecodeUInt64RangedEx();
  if (v113 == 6)
  {
    v7->_selectiveSpeechListeningCapability = v130;
  }
  else if (v113 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v114 = CUXPCDecodeSInt64RangedEx();
  if (v114 == 6)
  {
    v7->_hearingAidSupport = v130;
  }
  else if (v114 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v115 = CUXPCDecodeSInt64RangedEx();
  if (v115 == 6)
  {
    v7->_hearingTestSupport = v130;
  }
  else if (v115 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v116 = CUXPCDecodeUInt64RangedEx();
  if (v116 == 6)
  {
    v7->_spatialInteractionConfigFlags = v130;
  }
  else if (v116 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v117 = CUXPCDecodeUInt64RangedEx();
  if (v117 == 6)
  {
    v7->_spatialInteractionFlags = v130;
  }
  else if (v117 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSArrayOfNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v118 = CUXPCDecodeUInt64RangedEx();
  if (v118 == 6)
  {
    v7->_uint64_t spatialInteractionPeerID = v130;
  }
  else if (v118 == 5)
  {
    goto LABEL_333;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSData()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v119 = CUXPCDecodeUInt64RangedEx();
  if (v119 == 6)
  {
    v7->_tipiConnectionStatus = v130;
  }
  else if (v119 == 5)
  {
    goto LABEL_333;
  }
  objc_opt_class();
  if (!CUXPCDecodeNSArrayOfClass()) {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v120 = CUXPCDecodeUInt64RangedEx();
  if (v120 == 6)
  {
    v7->_tipiState = v130;
  }
  else if (v120 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v121 = CUXPCDecodeUInt64RangedEx();
  if (v121 == 6)
  {
    v7->_nearbyActionNoWakeType = v130;
  }
  else if (v121 == 5)
  {
    goto LABEL_333;
  }
  unint64_t v130 = 0;
  int v122 = CUXPCDecodeUInt64RangedEx();
  if (v122 != 6)
  {
    if (v122 != 5) {
      goto LABEL_319;
    }
LABEL_333:
    id v123 = 0;
    goto LABEL_323;
  }
  v7->_nearbyActionNWPrecisionFindingStatus = v130;
LABEL_319:
  if (!CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeBool())
  {
    goto LABEL_333;
  }
  id v123 = v7;
LABEL_323:

LABEL_324:
  return v123;
}

- (void)_parseNearbyInfoPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    unsigned int v9 = 0;
    id obj = 0;
    int v8 = 0;
    goto LABEL_29;
  }
  unsigned int v7 = *(unsigned __int8 *)a3;
  int v8 = v7 & 0xF;
  unsigned int v9 = (v7 >> 2) & 4 | (v7 >> 6) & 1 | (v7 >> 4) & 2;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1) {
    goto LABEL_28;
  }
  uint64_t v10 = (char *)(a3 + 2);
  unsigned int v11 = *((unsigned __int8 *)a3 + 1);
  if ((v11 & 0x80u) == 0) {
    int v12 = (v7 >> 2) & 4 | (v7 >> 6) & 1 | (v7 >> 4) & 2;
  }
  else {
    int v12 = v9 | 8;
  }
  unsigned int v13 = v11 & 0x20 | (v11 >> 2) & 0x10 | v12 & 0xFFFFFFBF | (((v11 >> 4) & 1) << 6);
  unsigned int v9 = (v11 << 8) & 0x200 | (((v11 & 4) != 0) << 8) | (((v11 >> 3) & 1) << 7) | v13;
  if ((v13 & 0x40) == 0)
  {
    id obj = 0;
    if ((v11 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (a4 - v10 < 3)
  {
LABEL_28:
    id obj = 0;
    goto LABEL_29;
  }
  id obj = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 2 length:3];
  uint64_t v10 = (char *)(a3 + 5);
  if ((v11 & 1) == 0)
  {
LABEL_8:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_17;
  }
LABEL_13:
  if (a4 - v10 < 1) {
    goto LABEL_29;
  }
  int v15 = *v10++;
  char v14 = v15;
  int v16 = v9 | 0x400;
  if (v15 >= 0) {
    int v16 = v9;
  }
  unsigned int v9 = v16 | ((v14 & 4) << 10);
  if ((v9 & 0x1000) == 0)
  {
LABEL_29:
    [(CBDevice *)self _setDeviceInfoKey:@"w" value:0];
    [(CBDevice *)self _setDeviceInfoKey:@"x" value:0];
    [(CBDevice *)self _setDeviceInfoKey:@"y" value:0];
    uint64_t v22 = 0;
    if (v8 != self->_nearbyActivityLevel) {
      goto LABEL_30;
    }
LABEL_25:
    if (v9 != self->_nearbyInfoFlags) {
      goto LABEL_31;
    }
    goto LABEL_26;
  }
LABEL_17:
  if (a4 - v10 < 3) {
    goto LABEL_29;
  }
  unsigned int v17 = v10[1] & 0x7F;
  if (v17 >= 0x64) {
    unsigned int v17 = 100;
  }
  char v18 = *v10;
  double v19 = (double)v17 / 100.0;
  uint64_t v20 = v10[2] & 0xF;
  [(CBDevice *)self nearbyInfoStatusProgress];
  if (v19 != v21)
  {
    [(CBDevice *)self setNearbyInfoStatusProgress:v19];
    uint64_t v22 = 64;
    uint64_t v23 = v18 & 0x1F;
    if (v20 == [(CBDevice *)self nearbyInfoStatusTime]) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v22 = 0;
  uint64_t v23 = v18 & 0x1F;
  if (v20 != [(CBDevice *)self nearbyInfoStatusTime])
  {
LABEL_22:
    [(CBDevice *)self setNearbyInfoStatusTime:v20];
    uint64_t v22 = 64;
  }
LABEL_23:
  if (v23 == [(CBDevice *)self nearbyInfoStatusType])
  {
    if (v8 != self->_nearbyActivityLevel) {
      goto LABEL_30;
    }
    goto LABEL_25;
  }
  [(CBDevice *)self setNearbyInfoStatusType:v23];
  uint64_t v22 = 64;
  if (v8 == self->_nearbyActivityLevel) {
    goto LABEL_25;
  }
LABEL_30:
  self->_nearbyActivityLevel = v8;
  uint64_t v22 = 64;
  if (v9 != self->_nearbyInfoFlags)
  {
LABEL_31:
    self->_uint64_t nearbyInfoFlags = v9;
    v22 |= 0x40uLL;
    if ((v9 & 0x40) == 0) {
      goto LABEL_39;
    }
    goto LABEL_32;
  }
LABEL_26:
  if ((v9 & 0x40) == 0) {
    goto LABEL_39;
  }
LABEL_32:
  nearbyInfoAuthTag = self->_nearbyInfoAuthTag;
  int v25 = (NSData *)obj;
  int v26 = nearbyInfoAuthTag;
  if (v25 == v26)
  {

    goto LABEL_39;
  }
  int v27 = v26;
  if ((v25 == 0) == (v26 != 0))
  {

    goto LABEL_38;
  }
  char v28 = [(NSData *)v25 isEqual:v26];

  if ((v28 & 1) == 0)
  {
LABEL_38:
    objc_storeStrong((id *)&self->_nearbyInfoAuthTag, obj);
    v22 |= 0x40uLL;
  }
LABEL_39:
  self->_discoveryFlags |= 0x40uLL;
  self->_changeFlags |= v22;
}

- (void)_clearUnparsedProperties
{
  unint64_t discoveryFlags = self->_discoveryFlags;
  if ((discoveryFlags & 0x4000000000) != 0)
  {
    if ((discoveryFlags & 0x8000000000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    self->_airplaySourceFlags = 0;
    if ((discoveryFlags & 0x8000000000) != 0)
    {
LABEL_3:
      if ((discoveryFlags & 0x8000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  self->_airplayTargetFlags = 0;
  self->_airplayTargetIPint v4 = 0;
  if ((discoveryFlags & 0x8000000000000) != 0)
  {
LABEL_4:
    if ((discoveryFlags & 0x40000000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  [(CBDevice *)self setFidoPayloadData:0];
  if ((discoveryFlags & 0x40000000000000) != 0)
  {
LABEL_5:
    if ((discoveryFlags & 0x400000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  [(CBDevice *)self setGfpModelID:0];
  [(CBDevice *)self setGfpPayloadData:0];
  if ((discoveryFlags & 0x400000) != 0)
  {
LABEL_6:
    if ((discoveryFlags & 0x1000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_WORD *)&self->_homeKitV1CompatibleVersion = 0;
  self->_homeKitV1Flags = 0;
  self->_homeKitV1StateNumber = 0;
  self->_uint64_t homeKitV1SetupHash = 0;
  if ((discoveryFlags & 0x1000000) != 0)
  {
LABEL_7:
    if ((discoveryFlags & 0x80000000000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
  self->_homeKitV2AuthTagData = 0;

  *(_DWORD *)&self->_homeKitV2InstanceID = 0;
  self->_uint64_t homeKitV2Value = 0;
  if ((discoveryFlags & 0x80000000000000) != 0)
  {
LABEL_8:
    if ((discoveryFlags & 0x5030800010083E37) != 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [(CBDevice *)self setMspAddressData:0];
  [(CBDevice *)self setMspDeviceClass:0];
  [(CBDevice *)self setMspDisplayName:0];
  [(CBDevice *)self setMspSubScenario:0];
  if ((discoveryFlags & 0x5030800010083E37) != 0)
  {
LABEL_9:
    if ((discoveryFlags & 0x2000000400020108) != 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  nearbyActionAuthTag = self->_nearbyActionAuthTag;
  self->_nearbyActionAuthTag = 0;

  [(CBDevice *)self setNearbyActionDeviceClass:0];
  self->_uint64_t nearbyActionFlags = 0;
  self->_nearbyActionType = 0;
  if ((discoveryFlags & 0x2000000400020108) != 0)
  {
LABEL_10:
    int v4 = self->_nearbyActionAuthTag;
    if (v4) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [(CBDevice *)self setNearbyActionV2Flags:0];
  [(CBDevice *)self setNearbyActionV2Type:0];
  int v4 = self->_nearbyActionAuthTag;
  if (v4)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_nearbyAuthTag, v4);
    if ((discoveryFlags & 0x60000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  objc_storeStrong((id *)&self->_nearbyAuthTag, self->_nearbyInfoAuthTag);
  if ((discoveryFlags & 0x60000000000) != 0)
  {
LABEL_12:
    if ((discoveryFlags & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_objectDiscoveryMode = 0;
  objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
  self->_objectDiscoveryNearOwnerID = 0;

  objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
  self->_objectDiscoveryPublicKeyData = 0;

  if ((discoveryFlags & 0x10000) != 0)
  {
LABEL_13:
    if ((discoveryFlags & 0x80000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_objectSetupFlags = 0;
  objectSetupFontCode = self->_objectSetupFontCode;
  self->_objectSetupFontCode = 0;

  objectSetupMessage = self->_objectSetupMessage;
  self->_objectSetupMessage = 0;

  if ((discoveryFlags & 0x80000000) != 0)
  {
LABEL_14:
    if ((discoveryFlags & 0x40000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_WORD *)&self->_proximityServiceFlags = 0;
  self->_proximityServicePSM = 0;
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  self->_proximityServiceSetupHash = 0;

  *(_WORD *)&self->_proximityServiceSubType = 0;
  if ((discoveryFlags & 0x40000) != 0)
  {
LABEL_15:
    unsigned __int8 v5 = self->_discoveryTypesInternal.bitArray[3];
    if ((self->_discoveryTypesInternal.bitArray[1] & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_34:
    [(CBDevice *)self setDockKitAccessoryPayloadData:0];
    if ((v5 & 0x40) != 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_33:
  self->_spatialInteractionConfigFlags = 0;
  self->_spatialInteractionFlags = 0;
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  self->_spatialInteractionIdentifiers = 0;

  self->_uint64_t spatialInteractionPeerID = 0;
  spatialInteractionPresenceConfigData = self->_spatialInteractionPresenceConfigData;
  self->_spatialInteractionPresenceConfigData = 0;

  spatialInteractionTokenData = self->_spatialInteractionTokenData;
  self->_spatialInteractionTokenData = 0;

  spatialInteractionUserInfo = self->_spatialInteractionUserInfo;
  self->_spatialInteractionUserInfo = 0;

  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  self->_spatialInteractionUWBConfigData = 0;

  unsigned __int8 v5 = self->_discoveryTypesInternal.bitArray[3];
  if ((self->_discoveryTypesInternal.bitArray[1] & 0x10) == 0) {
    goto LABEL_34;
  }
LABEL_16:
  if ((v5 & 0x40) != 0) {
    return;
  }
LABEL_17:
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  self->_safetyAlertsAlertData = 0;

  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  self->_safetyAlertsAlertID = 0;

  safetyAlertsSignature = self->_safetyAlertsSignature;
  self->_safetyAlertsSignature = 0;

  self->_safetyAlertsVersion = 0;
  safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
  self->_safetyAlertsSegmentAlertData = 0;

  *(_WORD *)&self->_safetyAlertsSegmentSegmentNumber = 0;
  safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
  self->_safetyAlertsSegmentServiceData = 0;

  safetyAlertsSegmentSignature = self->_safetyAlertsSegmentSignature;
  self->_safetyAlertsSegmentSignature = 0;
}

- (void)_setDeviceInfoKey:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned int v7 = self->_deviceInfo;
  int v8 = v7;
  if (v6 && !v7)
  {
    int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_storeStrong((id *)&self->_deviceInfo, v8);
  }
  [(NSMutableDictionary *)v8 setObject:v6 forKeyedSubscript:v9];
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedChar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDevice *)self _setDeviceInfoKey:@"v" value:v4];
  }
  else
  {
    [(CBDevice *)self _setDeviceInfoKey:@"v" value:0];
  }
}

- (void)setNearbyActionV2Flags:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDevice *)self _setDeviceInfoKey:@"t" value:v4];
  }
  else
  {
    [(CBDevice *)self _setDeviceInfoKey:@"t" value:0];
  }
}

- (void)setNearbyActionDeviceClass:(unsigned __int8)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedChar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDevice *)self _setDeviceInfoKey:@"z" value:v4];
  }
  else
  {
    [(CBDevice *)self _setDeviceInfoKey:@"z" value:0];
  }
}

- (void)setMspSubScenario:(unsigned __int8)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedChar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDevice *)self _setDeviceInfoKey:@"s" value:v4];
  }
  else
  {
    [(CBDevice *)self _setDeviceInfoKey:@"s" value:0];
  }
}

- (void)setMspDisplayName:(id)a3
{
}

- (void)setMspDeviceClass:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDevice *)self _setDeviceInfoKey:@"q" value:v4];
  }
  else
  {
    [(CBDevice *)self _setDeviceInfoKey:@"q" value:0];
  }
}

- (void)setMspAddressData:(id)a3
{
}

- (void)setGfpPayloadData:(id)a3
{
}

- (void)setGfpModelID:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDevice *)self _setDeviceInfoKey:@"e" value:v4];
  }
  else
  {
    [(CBDevice *)self _setDeviceInfoKey:@"e" value:0];
  }
}

- (void)setFidoPayloadData:(id)a3
{
}

- (void)setDockKitAccessoryPayloadData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialInteractionDeviceTimestampArrayDictionary, 0);
  objc_storeStrong((id *)&self->_spatialInteractionDeviceTimestampArrayClientIDs, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSegmentSignature, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSegmentServiceData, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSegmentAlertData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2EncryptedData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoAuthTag, 0);
  objc_storeStrong((id *)&self->_nearbyActionTargetAuthTag, 0);
  objc_storeStrong((id *)&self->_nearbyActionAuthTag, 0);
  objc_storeStrong((id *)&self->_leAdvName, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeConfigData, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAuthTagData, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSignature, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertID, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionUWBConfigData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionUserInfo, 0);
  objc_storeStrong((id *)&self->_spatialInteractionTokenData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionPresenceConfigData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionIdentifiers, 0);
  objc_storeStrong((id *)&self->_proximityServiceSetupHash, 0);
  objc_storeStrong((id *)&self->_proximityServiceData, 0);
  objc_storeStrong((id *)&self->_proximityServiceClassicAddress, 0);
  objc_storeStrong((id *)&self->_objectSetupMessage, 0);
  objc_storeStrong((id *)&self->_objectSetupFontCode, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryPublicKeyData, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryNearOwnerID, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2TempAuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, 0);
  objc_storeStrong((id *)&self->_nearbyAuthTag, 0);
  objc_storeStrong((id *)&self->_homeKitV2AuthTagData, 0);
  objc_storeStrong((id *)&self->_homeKitV2AccessoryIDData, 0);
  objc_storeStrong((id *)&self->_homeKitV1DeviceIDData, 0);
  objc_storeStrong((id *)&self->_airplaySourceAuthTagData, 0);
  objc_storeStrong((id *)&self->_airdropTempAuthTagData, 0);
  objc_storeStrong((id *)&self->_txAddressData, 0);
  objc_storeStrong((id *)&self->_tipiDevices, 0);
  objc_storeStrong((id *)&self->_serialNumberRight, 0);
  objc_storeStrong((id *)&self->_serialNumberLeft, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_remoteHostID, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_caseVersion, 0);
  objc_storeStrong((id *)&self->_btAddressData, 0);
  objc_storeStrong((id *)&self->_bleAppleManufacturerData, 0);
  objc_storeStrong((id *)&self->_bleAdvertisementData, 0);
  objc_storeStrong((id *)&self->_bleAddressData, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

- (BOOL)discoveryTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, a3);
}

- (BOOL)changedTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, a3);
}

- (BOOL)changedTypesContainCBDiscovery:(id)a3
{
  id v4 = a3;
  unint64_t changeFlags = self->_changeFlags;
  if (([v4 discoveryFlags] & changeFlags) != 0)
  {

    return 1;
  }
  else
  {
    BOOL v7 = CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, (unsigned char *)[v4 discoveryTypesInternalPtr]);

    return v7;
  }
}

- (void)_parseNearbyInfoV2Ptr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1)
  {
    if ((uint64_t)&a4[~(unint64_t)a3] < 1 || a4 - (a3 + 2) < 3)
    {
      uint64_t v10 = 0;
      goto LABEL_10;
    }
    int v8 = *(unsigned __int8 *)a3;
    int v9 = *((unsigned __int8 *)a3 + 1);
    uint64_t v10 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 2 length:3];
    if (a4 - (a3 + 5) < 3) {
      goto LABEL_10;
    }
    uint64_t v32 = v10;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 5 length:3];
    if (!v11)
    {
LABEL_51:
      uint64_t v10 = v32;
LABEL_10:
      goto LABEL_12;
    }
    int v12 = (void *)v11;
    unsigned int v13 = a3 + 8;
    if (a4 - v13 < 2)
    {
      char v14 = 0;
      if ((v8 & 4) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      char v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v13 length:2];
      if ((v8 & 4) == 0)
      {
LABEL_18:
        int v15 = [(CBDevice *)self nearbyInfoV2Flags];
        BOOL v16 = v8 != v15;
        if (v8 == v15)
        {
          if (v9 == [(CBDevice *)self nearbyInfoV2EncryptedFlags]) {
            goto LABEL_25;
          }
        }
        else
        {
          if ((v8 & 4) != ([(CBDevice *)self nearbyInfoV2Flags] & 4)) {
            self->_changedTypesInternal.bitArray[2] |= 8u;
          }
          self->_nearbyInfoV2Flags = v8;
          if (v9 == [(CBDevice *)self nearbyInfoV2EncryptedFlags])
          {
LABEL_25:
            unsigned int v17 = [(CBDevice *)self nearbyInfoV2AuthTagData];
            uint64_t v32 = v32;
            char v18 = v17;
            if (v32 == v18)
            {

              nearbyInfoV2AuthTagData = v32;
            }
            else
            {
              if ((v32 == 0) != (v18 != 0))
              {
                char v19 = [(NSData *)v32 isEqual:v18];

                if (v19)
                {
LABEL_33:
                  uint64_t v22 = [(CBDevice *)self nearbyInfoV2AuthIntegrityTagData];
                  id v23 = v12;
                  id v24 = v22;
                  if (v23 == v24)
                  {

                    goto LABEL_40;
                  }
                  int v25 = v24;
                  if (v24)
                  {
                    char v26 = [v23 isEqual:v24];

                    if (v26)
                    {
LABEL_40:
                      int v27 = [(CBDevice *)self nearbyInfoV2EncryptedData];
                      id v28 = v14;
                      id v29 = v27;
                      if (v28 == v29)
                      {
                      }
                      else
                      {
                        int v30 = v29;
                        if ((v28 == 0) == (v29 != 0))
                        {

LABEL_48:
                          objc_storeStrong((id *)&self->_nearbyInfoV2EncryptedData, v14);
                          self->_discoveryTypesInternal.bitArray[0] |= 0x10u;
LABEL_49:
                          self->_changedTypesInternal.bitArray[0] |= 0x10u;
LABEL_50:

                          goto LABEL_51;
                        }
                        char v31 = [v28 isEqual:v29];

                        if ((v31 & 1) == 0) {
                          goto LABEL_48;
                        }
                      }
                      self->_discoveryTypesInternal.bitArray[0] |= 0x10u;
                      if (!v16) {
                        goto LABEL_50;
                      }
                      goto LABEL_49;
                    }
                  }
                  else
                  {
                  }
                  objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, v12);
                  BOOL v16 = 1;
                  goto LABEL_40;
                }
              }
              else
              {
              }
              double v21 = v32;
              nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
              self->_nearbyInfoV2AuthTagData = v21;
              BOOL v16 = 1;
            }

            goto LABEL_33;
          }
        }
        self->_nearbyInfoV2EncryptedFlags = v9;
        BOOL v16 = 1;
        goto LABEL_25;
      }
    }
    self->_discoveryTypesInternal.bitArray[2] |= 8u;
    goto LABEL_18;
  }
  uint64_t v10 = 0;
LABEL_12:
}

- (NSData)nearbyInfoV2AuthTagData
{
  return self->_nearbyInfoV2AuthTagData;
}

- (unsigned)nearbyInfoV2Flags
{
  return self->_nearbyInfoV2Flags;
}

- (unsigned)nearbyInfoV2EncryptedFlags
{
  return self->_nearbyInfoV2EncryptedFlags;
}

- (NSData)nearbyInfoV2AuthIntegrityTagData
{
  return self->_nearbyInfoV2AuthIntegrityTagData;
}

- (BOOL)changedTypesNeedsIdentify
{
  if ((self->_changeFlags & 0x4000080040) != 0
    || self->_nearbyInfoV2AuthTagData && (self->_changedTypesInternal.bitArray[0] & 0x10) != 0)
  {
    return 1;
  }
  uint64_t v4 = CBDiscoveryTypesNeedsIdentify();
  if (CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, v4)) {
    return 1;
  }
  unsigned __int8 v5 = [(CBDevice *)self nearbyInfoV2EncryptedData];

  return v5 != 0;
}

- (NSData)nearbyInfoV2EncryptedData
{
  return self->_nearbyInfoV2EncryptedData;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v681 = 0;
  v682 = (id *)&v681;
  uint64_t v683 = 0x3032000000;
  v684 = __Block_byref_object_copy__5;
  v685 = __Block_byref_object_dispose__5;
  id v686 = 0;
  uint64_t v680 = 0;
  identifier = self->_identifier;
  NSAppendPrintF_safe();
  objc_storeStrong(&v686, 0);
  unsigned __int8 v5 = self->_btAddressData;
  if (v5)
  {
    id v6 = v682;
    id v679 = v682[5];
    identifier = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    objc_storeStrong(v6 + 5, v679);
  }
  BOOL v7 = self->_txAddressData;
  if (v7)
  {
    int v8 = v682;
    id v678 = v682[5];
    identifier = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    objc_storeStrong(v8 + 5, v678);
  }
  int v9 = self->_name;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = v682;
    id v677 = v682[5];
    identifier = v9;
    NSAppendPrintF_safe();
    objc_storeStrong(v11 + 5, v677);
  }

  int v12 = self->_model;
  unsigned int v13 = v12;
  if (v12)
  {
    char v14 = v682;
    id v676 = v682[5];
    identifier = v12;
    NSAppendPrintF_safe();
    objc_storeStrong(v14 + 5, v676);
  }

  uint64_t productID = self->_productID;
  if (productID)
  {
    BOOL v16 = CBProductIDToString_0(self->_productID);
    unsigned int v17 = v682;
    id v675 = v682[5];
    identifier = (void *)productID;
    v473 = v16;
    NSAppendPrintF_safe();
    objc_storeStrong(v17 + 5, v675);
    uint64_t v18 = CBProductIDToNSLocalizedProductNameString(productID);
    char v19 = (void *)v18;
    if (v18)
    {
      uint64_t v20 = v682;
      id v674 = v682[5];
      identifier = (void *)v18;
      NSAppendPrintF_safe();
      objc_storeStrong(v20 + 5, v674);
    }
  }
  unsigned int v21 = a3;
  if (a3 <= 0x3Bu)
  {
    vendorID = (void *)self->_vendorID;
    if (self->_vendorID)
    {
      id v23 = v682;
      id v673 = v682[5];
      identifier = vendorID;
      NSAppendPrintF_safe();
      objc_storeStrong(v23 + 5, v673);
    }
    int vendorIDSource = (void *)self->_vendorIDSource;
    if (self->_vendorIDSource)
    {
      int v25 = v682;
      id v672 = v682[5];
      identifier = vendorIDSource;
      NSAppendPrintF_safe();
      objc_storeStrong(v25 + 5, v672);
    }
    char v26 = self->_idsDeviceID;
    int v27 = v26;
    if (v26)
    {
      id v28 = v682;
      id v671 = v682[5];
      identifier = v26;
      NSAppendPrintF_safe();
      objc_storeStrong(v28 + 5, v671);
    }

    id v29 = self->_accountID;
    int v30 = v29;
    if (v29)
    {
      char v31 = v682;
      id v670 = v682[5];
      identifier = v29;
      NSAppendPrintF_safe();
      objc_storeStrong(v31 + 5, v670);
    }

    adaptiveVolumeCapability = (void *)self->_adaptiveVolumeCapability;
    if (self->_adaptiveVolumeCapability)
    {
      v33 = v682;
      id v669 = v682[5];
      identifier = adaptiveVolumeCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v33 + 5, v669);
    }
    unsigned int v34 = [(CBDevice *)self adaptiveVolumeConfig];
    if (v34)
    {
      uint64_t v35 = v682;
      id v668 = v682[5];
      uint64_t v428 = v34;
      NSAppendPrintF_safe();
      objc_storeStrong(v35 + 5, v668);
    }
    uint64_t v36 = self->_contactID;
    uint64_t v37 = v36;
    if (v36)
    {
      uint64_t v38 = v682;
      id obj = v682[5];
      uint64_t v428 = (uint64_t)v36;
      NSAppendPrintF_safe();
      objc_storeStrong(v38 + 5, obj);
    }

    uint64_t v39 = [(CBDevice *)self stableIdentifier];
    uint64_t v40 = (void *)v39;
    if (v39)
    {
      uint64_t v41 = v682;
      id v666 = v682[5];
      uint64_t v428 = v39;
      NSAppendPrintF_safe();
      objc_storeStrong(v41 + 5, v666);
    }

    if (self->_discoveryFlags)
    {
      uint64_t v42 = v682;
      id v665 = v682[5];
      uint64_t v428 = CUPrintFlags64();
      NSAppendPrintF_safe();
      objc_storeStrong(v42 + 5, v665);
    }
    uint64_t v43 = v682;
    id v664 = v682[5];
    CBDiscoveryTypesAppendString((uint64_t)&v664, (uint64_t)", DsTy", (uint64_t)&self->_discoveryTypesInternal);
    objc_storeStrong(v43 + 5, v664);
    if (self->_deviceFlags)
    {
      uint64_t v44 = v682;
      id v663 = v682[5];
      uint64_t v428 = CUPrintFlags64();
      NSAppendPrintF_safe();
      objc_storeStrong(v44 + 5, v663);
    }
    unsigned int deviceType = self->_deviceType;
    if (self->_deviceType)
    {
      char v46 = v682;
      id v662 = v682[5];
      uint64_t v428 = (uint64_t)CBDeviceTypeToString(deviceType);
      NSAppendPrintF_safe();
      objc_storeStrong(v46 + 5, v662);
    }
    int v47 = [(CBDevice *)self rssi];
    if (v47)
    {
      int v48 = v682;
      id v661 = v682[5];
      uint64_t v429 = v47;
      NSAppendPrintF_safe();
      objc_storeStrong(v48 + 5, v661);
    }
    if (self->_connectedServices)
    {
      int v49 = v682;
      id v660 = v682[5];
      uint64_t v429 = CUPrintFlags32();
      NSAppendPrintF_safe();
      objc_storeStrong(v49 + 5, v660);
    }
    if (self->_supportedServices)
    {
      int v50 = v682;
      id v659 = v682[5];
      uint64_t v429 = CUPrintFlags32();
      NSAppendPrintF_safe();
      objc_storeStrong(v50 + 5, v659);
    }
    int v51 = [(CBDevice *)self appearanceValue];
    if (v51)
    {
      int v52 = v682 + 5;
      id v658 = v682[5];
      if (v51 <= 2368)
      {
        switch(v51)
        {
          case 2112:
            int v53 = @"Generic Audio Sink";
            break;
          case 2113:
            int v53 = @"Standalone Speaker";
            break;
          case 2114:
            int v53 = @"Soundbar";
            break;
          case 2115:
            int v53 = @"Bookshelf Speaker";
            break;
          case 2116:
            int v53 = @"Standmounted Speaker";
            break;
          case 2117:
            int v53 = @"Speakerphone";
            break;
          default:
            int v53 = @"Keyboard";
            switch(v51)
            {
              case 961:
                goto LABEL_65;
              case 962:
                int v53 = @"Mouse";
                break;
              case 963:
                int v53 = @"Joystick";
                break;
              case 964:
                int v53 = @"Gamepad";
                break;
              case 969:
                int v53 = @"Touchpad";
                break;
              default:
                goto LABEL_56;
            }
            break;
        }
      }
      else if (v51 > 2370)
      {
        if (v51 == 2371)
        {
          int v53 = @"Headphones";
        }
        else if (v51 == 2625)
        {
          int v53 = @"Hearing Aid";
        }
        else
        {
LABEL_56:
          int v53 = @"?";
        }
      }
      else if (v51 == 2369)
      {
        int v53 = @"Earbud";
      }
      else
      {
        int v53 = @"Headset";
      }
LABEL_65:
      v430 = v53;
      NSAppendPrintF_safe();
      objc_storeStrong(v52, v658);
    }
    unsigned int audioStreamState = self->_audioStreamState;
    if (audioStreamState)
    {
      int v55 = v682 + 5;
      id v657 = v682[5];
      if (audioStreamState > 3) {
        int v56 = "?";
      }
      else {
        int v56 = off_1E5E34B10[audioStreamState - 1];
      }
      v430 = (void *)v56;
      NSAppendPrintF_safe();
      objc_storeStrong(v55, v657);
    }
    int v57 = [(CBDevice *)self frequencyBand];
    if (v57)
    {
      int v58 = "2.4";
      if (v57 != 1) {
        int v58 = "?";
      }
      if (v57 == 2) {
        int v58 = "5";
      }
      int v59 = v682;
      id v656 = v682[5];
      v431 = v58;
      NSAppendPrintF_safe();
      objc_storeStrong(v59 + 5, v656);
    }
    int64_t bleChannel = (const char *)self->_bleChannel;
    if (bleChannel)
    {
      int v61 = v682;
      id v655 = v682[5];
      v431 = bleChannel;
      NSAppendPrintF_safe();
      objc_storeStrong(v61 + 5, v655);
    }
    autoAncCapability = (const char *)self->_autoAncCapability;
    if (self->_autoAncCapability)
    {
      int v63 = v682;
      id v654 = v682[5];
      v431 = autoAncCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v63 + 5, v654);
    }
    int v64 = a3;
    unsigned int batteryInfoMain = self->_batteryInfoMain;
    unsigned int batteryInfoLeft = self->_batteryInfoLeft;
    unsigned int batteryInfoRight = self->_batteryInfoRight;
    unsigned int batteryInfoCase = self->_batteryInfoCase;
    if (self->_batteryInfoMain || self->_batteryInfoLeft || self->_batteryInfoRight || self->_batteryInfoCase)
    {
      int v69 = v682;
      id v653 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v69 + 5, v653);
      if (batteryInfoMain)
      {
        int v70 = v682 + 5;
        id v652 = v682[5];
        int v71 = (batteryInfoMain >> 8) & 7;
        int v72 = "";
        if (v71 == 2) {
          int v72 = "-";
        }
        if (v71 == 1) {
          int v73 = "+";
        }
        else {
          int v73 = v72;
        }
        v431 = v73;
        uint64_t v474 = (float)((float)((float)(batteryInfoMain & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v70, v652);
      }
      if (batteryInfoLeft)
      {
        int v74 = v682 + 5;
        id v651 = v682[5];
        int v75 = (batteryInfoLeft >> 8) & 7;
        int v76 = "";
        if (v75 == 2) {
          int v76 = "-";
        }
        if (v75 == 1) {
          int v77 = "+";
        }
        else {
          int v77 = v76;
        }
        v431 = v77;
        uint64_t v474 = (float)((float)((float)(batteryInfoLeft & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v74, v651);
      }
      if (batteryInfoRight)
      {
        int v78 = v682 + 5;
        id v650 = v682[5];
        int v79 = (batteryInfoRight >> 8) & 7;
        int v80 = "";
        if (v79 == 2) {
          int v80 = "-";
        }
        if (v79 == 1) {
          int v81 = "+";
        }
        else {
          int v81 = v80;
        }
        v431 = v81;
        uint64_t v474 = (float)((float)((float)(batteryInfoRight & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v78, v650);
      }
      if (batteryInfoCase)
      {
        int v82 = v682 + 5;
        id v649 = v682[5];
        int v83 = (batteryInfoCase >> 8) & 7;
        int v84 = "";
        if (v83 == 2) {
          int v84 = "-";
        }
        if (v83 == 1) {
          int v85 = "+";
        }
        else {
          int v85 = v84;
        }
        v431 = v85;
        uint64_t v474 = (float)((float)((float)(batteryInfoCase & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v82, v649);
      }
    }
    unsigned int v86 = [(CBDevice *)self clickHoldModeLeft];
    unsigned int v87 = [(CBDevice *)self clickHoldModeRight];
    if (v86 | v87)
    {
      int v88 = v682;
      id v648 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v88 + 5, v648);
      if (v86)
      {
        int v89 = v682 + 5;
        id v647 = v682[5];
        if (v86 > 7) {
          int v90 = @"?";
        }
        else {
          int v90 = (__CFString *)*((void *)&off_1E5E34B28 + (char)(v86 - 1));
        }
        v432 = v90;
        NSAppendPrintF_safe();
        objc_storeStrong(v89, v647);
      }
      if (v87)
      {
        int v91 = v682 + 5;
        id v646 = v682[5];
        if (v87 > 7) {
          int v92 = @"?";
        }
        else {
          int v92 = (__CFString *)*((void *)&off_1E5E34B28 + (char)(v87 - 1));
        }
        v432 = v92;
        NSAppendPrintF_safe();
        objc_storeStrong(v91, v646);
      }
    }
    endCallCapability = (__CFString *)self->_endCallCapability;
    int v94 = v64;
    if (self->_endCallCapability)
    {
      int v95 = v682;
      id v645 = v682[5];
      v432 = endCallCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v95 + 5, v645);
    }
    unsigned int v96 = [(CBDevice *)self endCallConfig];
    if (v96)
    {
      int v97 = v682;
      id v644 = v682[5];
      uint64_t v433 = v96;
      NSAppendPrintF_safe();
      objc_storeStrong(v97 + 5, v644);
    }
    uint64_t muteControlCapability = self->_muteControlCapability;
    if (self->_muteControlCapability)
    {
      int v99 = v682;
      id v643 = v682[5];
      uint64_t v433 = muteControlCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v99 + 5, v643);
    }
    unsigned int v100 = [(CBDevice *)self muteControlConfig];
    if (v100)
    {
      int v101 = v682;
      id v642 = v682[5];
      v434 = (CBControllerInfo *)v100;
      NSAppendPrintF_safe();
      objc_storeStrong(v101 + 5, v642);
    }
    int v102 = self->_caseVersion;
    int v103 = v102;
    if (v102)
    {
      int v104 = v682;
      id v641 = v682[5];
      v434 = (CBControllerInfo *)v102;
      NSAppendPrintF_safe();
      objc_storeStrong(v104 + 5, v641);
    }

    if ((self->_colorInfo & 0x100) != 0)
    {
      int v105 = v682;
      id v640 = v682[5];
      v434 = (CBControllerInfo *)[(CBDevice *)self colorCodeBest];
      NSAppendPrintF_safe();
      objc_storeStrong(v105 + 5, v640);
    }
    int v106 = self->_controllerInfo;
    int v107 = v106;
    if (v106)
    {
      int v108 = v682;
      id v639 = v682[5];
      v434 = v106;
      NSAppendPrintF_safe();
      objc_storeStrong(v108 + 5, v639);
    }

    conversationDetectCapability = (CBControllerInfo *)self->_conversationDetectCapability;
    if (self->_conversationDetectCapability)
    {
      int v110 = v682;
      id v638 = v682[5];
      v434 = conversationDetectCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v110 + 5, v638);
    }
    unsigned int v111 = [(CBDevice *)self conversationDetectConfig];
    if (v111)
    {
      int v112 = v682;
      id v637 = v682[5];
      uint64_t v435 = v111;
      NSAppendPrintF_safe();
      objc_storeStrong(v112 + 5, v637);
    }
    int v113 = [(CBDevice *)self crownRotationDirection];
    if (v113)
    {
      int v114 = @"?";
      if (v113 == 1) {
        int v114 = @"BackToFront";
      }
      if (v113 == 2) {
        int v114 = @"FrontToBack";
      }
      int v115 = v682;
      id v636 = v682[5];
      v436 = v114;
      NSAppendPrintF_safe();
      objc_storeStrong(v115 + 5, v636);
    }
    uint64_t doubleTapActionLeft = self->_doubleTapActionLeft;
    char doubleTapActionRight = self->_doubleTapActionRight;
    char doubleTapCapability = self->_doubleTapCapability;
    if (self->_doubleTapActionLeft || self->_doubleTapActionRight || self->_doubleTapCapability)
    {
      int v119 = v682;
      id v635 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v119 + 5, v635);
      if (doubleTapActionLeft)
      {
        int v120 = v682 + 5;
        id v634 = v682[5];
        if (doubleTapActionLeft > 5) {
          int v121 = "?";
        }
        else {
          int v121 = off_1E5E34B60[doubleTapActionLeft];
        }
        v436 = (__CFString *)v121;
        NSAppendPrintF_safe();
        objc_storeStrong(v120, v634);
      }
      if (doubleTapActionRight)
      {
        int v122 = v682 + 5;
        id v633 = v682[5];
        if (doubleTapActionRight > 5) {
          id v123 = "?";
        }
        else {
          id v123 = off_1E5E34B60[doubleTapActionRight];
        }
        v436 = (__CFString *)v123;
        NSAppendPrintF_safe();
        objc_storeStrong(v122, v633);
      }
      if (doubleTapCapability)
      {
        v124 = v682 + 5;
        id v632 = v682[5];
        if (doubleTapCapability > 3) {
          char v125 = "?";
        }
        else {
          char v125 = off_1E5E34B90[doubleTapCapability];
        }
        v436 = (__CFString *)v125;
        NSAppendPrintF_safe();
        objc_storeStrong(v124, v632);
      }
    }
    if ([(CBDevice *)self gapaFlags])
    {
      uint64_t v126 = v682;
      id v631 = v682[5];
      v437 = CUPrintFlags32();
      NSAppendPrintF_safe();
      objc_storeStrong(v126 + 5, v631);
    }
    int v127 = self->_firmwareVersion;
    uint64_t v128 = v127;
    if (v127)
    {
      objc_super v129 = v682;
      id v630 = v682[5];
      v437 = v127;
      NSAppendPrintF_safe();
      objc_storeStrong(v129 + 5, v630);
    }

    unsigned int v130 = [(CBDevice *)self listeningMode];
    if (v130)
    {
      v131 = v682 + 5;
      id v629 = v682[5];
      if (v130 > 4) {
        char v132 = "?";
      }
      else {
        char v132 = off_1E5E34BB0[v130 - 1];
      }
      v437 = (void *)v132;
      NSAppendPrintF_safe();
      objc_storeStrong(v131, v629);
    }
    if ([(CBDevice *)self listeningModeConfigs])
    {
      uint64_t v133 = v682;
      id v628 = v682[5];
      v438 = CUPrintFlags32();
      NSAppendPrintF_safe();
      objc_storeStrong(v133 + 5, v628);
    }
    uint64_t v134 = [(CBDevice *)self btVersion];
    uint64_t v135 = v134;
    if (v134)
    {
      uint64_t v136 = v682;
      id v627 = v682[5];
      uint64_t v439 = [v134 cStringUsingEncoding:4];
      NSAppendPrintF_safe();
      objc_storeStrong(v136 + 5, v627);
    }

    uint64_t microphoneMode = self->_microphoneMode;
    if (self->_microphoneMode)
    {
      v138 = v682 + 5;
      id v626 = v682[5];
      if (microphoneMode > 3) {
        id v139 = "?";
      }
      else {
        id v139 = off_1E5E34BD0[microphoneMode];
      }
      uint64_t v439 = (uint64_t)v139;
      NSAppendPrintF_safe();
      objc_storeStrong(v138, v626);
    }
    unsigned int primaryPlacement = self->_primaryPlacement;
    unsigned int secondaryPlacement = self->_secondaryPlacement;
    char placementMode = self->_placementMode;
    if (__PAIR64__(secondaryPlacement, primaryPlacement) || self->_placementMode)
    {
      v143 = v682;
      id v625 = v682[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v143 + 5, v625);
      if (primaryPlacement)
      {
        uint64_t v144 = v682 + 5;
        id v624 = v682[5];
        if (primaryPlacement > 7) {
          id v145 = "?";
        }
        else {
          id v145 = off_1E5E351B8[primaryPlacement - 1];
        }
        uint64_t v439 = (uint64_t)v145;
        NSAppendPrintF_safe();
        objc_storeStrong(v144, v624);
      }
      if (secondaryPlacement)
      {
        uint64_t v146 = v682 + 5;
        id v623 = v682[5];
        if (secondaryPlacement > 7) {
          v147 = "?";
        }
        else {
          v147 = off_1E5E351B8[secondaryPlacement - 1];
        }
        uint64_t v439 = (uint64_t)v147;
        NSAppendPrintF_safe();
        objc_storeStrong(v146, v623);
      }
      if (placementMode)
      {
        size_t v148 = v682 + 5;
        id v622 = v682[5];
        if (placementMode > 2) {
          v149 = "?";
        }
        else {
          v149 = off_1E5E34C08[placementMode];
        }
        uint64_t v439 = (uint64_t)v149;
        NSAppendPrintF_safe();
        objc_storeStrong(v148, v622);
      }
    }
    unsigned int v150 = [(CBDevice *)self primaryBudSide];
    if (v150)
    {
      id v151 = v682 + 5;
      id v621 = v682[5];
      if (v150 > 3) {
        uint64_t v152 = "?";
      }
      else {
        uint64_t v152 = off_1E5E34BF0[(char)(v150 - 1)];
      }
      v440 = v152;
      NSAppendPrintF_safe();
      objc_storeStrong(v151, v621);
    }
    uint64_t v153 = [(CBDevice *)self findMyCaseIdentifier];
    size_t v154 = (void *)v153;
    if (v153)
    {
      v155 = v682;
      id v620 = v682[5];
      double v441 = *(double *)&v153;
      NSAppendPrintF_safe();
      objc_storeStrong(v155 + 5, v620);
    }

    uint64_t v156 = [(CBDevice *)self findMyGroupIdentifier];
    uint64_t v157 = (void *)v156;
    if (v156)
    {
      id v158 = v682;
      id v619 = v682[5];
      double v441 = *(double *)&v156;
      NSAppendPrintF_safe();
      objc_storeStrong(v158 + 5, v619);
    }

    unsigned int v159 = [(CBDevice *)self interval];
    if (v159 && ([(CBDevice *)self discoveryFlags] & 0x200000) != 0)
    {
      double v160 = (double)v159;
      if (([(CBDevice *)self deviceFlags] & 0x4000) != 0)
      {
        size_t v161 = v682 + 5;
        id v618 = v682[5];
        double v441 = v160 * 0.625;
        NSAppendPrintF_safe();
        char v162 = v618;
      }
      else
      {
        if (([(CBDevice *)self deviceFlags] & 0x2000) == 0) {
          goto LABEL_217;
        }
        size_t v161 = v682 + 5;
        id v617 = v682[5];
        double v441 = v160 * 1.25;
        NSAppendPrintF_safe();
        char v162 = v617;
      }
      id v163 = v162;
      unsigned __int16 v164 = *v161;
      *size_t v161 = v163;
    }
LABEL_217:
    uint64_t v165 = [(CBDevice *)self modelUser];
    uint64_t v166 = (void *)v165;
    if (v165)
    {
      uint64_t v167 = v682;
      id v616 = v682[5];
      uint64_t v442 = v165;
      NSAppendPrintF_safe();
      objc_storeStrong(v167 + 5, v616);
    }

    uint64_t v168 = self->_serialNumber;
    uint64_t v169 = v168;
    if (v168)
    {
      int v170 = v682;
      id v615 = v682[5];
      uint64_t v442 = (uint64_t)v168;
      NSAppendPrintF_safe();
      objc_storeStrong(v170 + 5, v615);
    }

    id v171 = self->_serialNumberLeft;
    uint64_t v172 = v171;
    if (v171)
    {
      v173 = v682;
      id v614 = v682[5];
      uint64_t v442 = (uint64_t)v171;
      NSAppendPrintF_safe();
      objc_storeStrong(v173 + 5, v614);
    }

    size_t v174 = self->_serialNumberRight;
    v175 = v174;
    if (v174)
    {
      char v176 = v682;
      id v613 = v682[5];
      uint64_t v442 = (uint64_t)v174;
      NSAppendPrintF_safe();
      objc_storeStrong(v176 + 5, v613);
    }

    uint64_t smartRoutingMode = self->_smartRoutingMode;
    if (self->_smartRoutingMode)
    {
      id v178 = v682 + 5;
      id v612 = v682[5];
      if (smartRoutingMode > 2) {
        id v179 = "?";
      }
      else {
        id v179 = off_1E5E34C08[smartRoutingMode];
      }
      uint64_t v442 = (uint64_t)v179;
      NSAppendPrintF_safe();
      objc_storeStrong(v178, v612);
    }
    int v180 = [(CBDevice *)self spatialAudioMode];
    if (!v180)
    {
LABEL_242:
      int v183 = CBDiscoveryTypesBuffer();
      if (CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, v183)
        && IsAppleInternalBuild()
        && self->_bleAdvertisementTimestamp != 0.0)
      {
        id v184 = v682;
        id v610 = v682[5];
        v443 = [(CBDevice *)self bleAdvertisementTimestampString];
        NSAppendPrintF_safe();
        objc_storeStrong(v184 + 5, v610);
      }
      unint64_t bleAdvertisementTimestampMachContinuous = self->_bleAdvertisementTimestampMachContinuous;
      if (bleAdvertisementTimestampMachContinuous)
      {
        uint64_t v186 = v682;
        id v609 = v682[5];
        v443 = (void *)bleAdvertisementTimestampMachContinuous;
        NSAppendPrintF_safe();
        objc_storeStrong(v186 + 5, v609);
      }
      size_t v187 = self->_bleAppleManufacturerData;
      if (v187)
      {
        v188 = v682;
        id v608 = v682[5];
        v443 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v188 + 5, v608);
      }
      if ((v94 & 0x800000) != 0)
      {
        v189 = [(CBDevice *)self linkKeyData];
        if (v189)
        {
          id v190 = v682;
          id v607 = v682[5];
          v443 = CUPrintNSDataHex();
          NSAppendPrintF_safe();
          objc_storeStrong(v190 + 5, v607);
        }
        uint64_t v191 = [(CBDevice *)self irkData];
        if (v191)
        {
          char v192 = v682;
          id v606 = v682[5];
          v443 = CUPrintNSDataHex();
          NSAppendPrintF_safe();
          objc_storeStrong(v192 + 5, v606);
        }
        size_t v193 = [(CBDevice *)self ltkData];
        if (v193)
        {
          v194 = v682;
          id v605 = v682[5];
          v443 = CUPrintNSDataHex();
          NSAppendPrintF_safe();
          objc_storeStrong(v194 + 5, v605);
        }
      }
      unint64_t discoveryFlags = self->_discoveryFlags;
      if ((discoveryFlags & 0x80) != 0)
      {
        uint64_t v196 = v682;
        id v604 = v682[5];
        [(CBDevice *)self accessoryStatusFlags];
        v444 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v196 + 5, v604);

        int v197 = v682;
        id v603 = v682[5];
        uint64_t v445 = [(CBDevice *)self accessoryStatusLidOpenCount];
        NSAppendPrintF_safe();
        objc_storeStrong(v197 + 5, v603);
        int v198 = v682;
        id v602 = v682[5];
        [(CBDevice *)self accessoryStatusOBCTime];
        v443 = CUPrintDurationDouble();
        NSAppendPrintF_safe();
        objc_storeStrong(v198 + 5, v602);
      }
      if (self->_airdropFlags)
      {
        int v199 = v682;
        id v601 = v682[5];
        v443 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v199 + 5, v601);
      }
      unsigned int v200 = [(CBDevice *)self airdropTempAuthTagData];
      if (v200)
      {
        v201 = v682;
        id v600 = v682[5];
        uint64_t v446 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v201 + 5, v600);
      }
      uint64_t airdropModel = self->_airdropModel;
      if (self->_airdropModel)
      {
        id v203 = v682;
        id v599 = v682[5];
        uint64_t v446 = airdropModel;
        NSAppendPrintF_safe();
        objc_storeStrong(v203 + 5, v599);
      }
      uint64_t airdropVersion = self->_airdropVersion;
      if (self->_airdropVersion)
      {
        v205 = v682;
        id v598 = v682[5];
        uint64_t v446 = airdropVersion;
        NSAppendPrintF_safe();
        objc_storeStrong(v205 + 5, v598);
      }
      uint64_t airdropHash1 = self->_airdropHash1;
      if (self->_airdropHash1)
      {
        char v207 = v682;
        id v597 = v682[5];
        uint64_t v446 = airdropHash1;
        NSAppendPrintF_safe();
        objc_storeStrong(v207 + 5, v597);
      }
      uint64_t airdropHash2 = self->_airdropHash2;
      if (self->_airdropHash2)
      {
        id v209 = v682;
        id v596 = v682[5];
        uint64_t v446 = airdropHash2;
        NSAppendPrintF_safe();
        objc_storeStrong(v209 + 5, v596);
      }
      uint64_t airdropHash3 = self->_airdropHash3;
      if (self->_airdropHash3)
      {
        v211 = v682;
        id v595 = v682[5];
        uint64_t v446 = airdropHash3;
        NSAppendPrintF_safe();
        objc_storeStrong(v211 + 5, v595);
      }
      uint64_t airdropHash4 = self->_airdropHash4;
      if (self->_airdropHash4)
      {
        BOOL v213 = v682;
        id v594 = v682[5];
        uint64_t v446 = airdropHash4;
        NSAppendPrintF_safe();
        objc_storeStrong(v213 + 5, v594);
      }
      if (self->_airdropConfigData)
      {
        v214 = v682;
        id v593 = v682[5];
        uint64_t v446 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v214 + 5, v593);
      }
      if ((discoveryFlags & 0x4000000000) != 0)
      {
        v215 = self->_airplaySourceAuthTagData;
        if (v215)
        {
          char v216 = v682;
          id v592 = v682[5];
          v447 = CUPrintNSDataHex();
          NSAppendPrintF_safe();
          objc_storeStrong(v216 + 5, v592);
        }
        v217 = v682;
        id v591 = v682[5];
        v448 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v217 + 5, v591);

        v218 = [(CBDevice *)self airplaySourceUWBConfigData];
        if (v218)
        {
          v219 = v682;
          id v590 = v682[5];
          uint64_t v446 = CUPrintNSDataHex();
          NSAppendPrintF_safe();
          objc_storeStrong(v219 + 5, v590);
        }
      }
      if ((discoveryFlags & 0x8000000000) != 0)
      {
        v220 = v682;
        id v589 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v220 + 5, v589);
        v221 = v682;
        id v588 = v682[5];
        v222 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v221 + 5, v588);

        char v223 = v682;
        id v587 = v682[5];
        uint64_t v446 = CUPrintAddress();
        NSAppendPrintF_safe();
        objc_storeStrong(v223 + 5, v587);

        if ((self->_airplayTargetFlags & 0x10) != 0)
        {
          v224 = v682;
          id v586 = v682[5];
          uint64_t v446 = [(CBDevice *)self airplayTargetPort];
          NSAppendPrintF_safe();
          objc_storeStrong(v224 + 5, v586);
        }
      }
      v225 = [(CBDevice *)self dockKitAccessoryPayloadData];
      if (v225)
      {
        v226 = v682;
        id v585 = v682[5];
        uint64_t v449 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v226 + 5, v585);
      }
      if ((discoveryFlags & 0x1000000000000000) != 0)
      {
        v227 = v682;
        id v584 = v682[5];
        [(CBDevice *)self dsActionFlags];
        v450 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v227 + 5, v584);

        v228 = v682;
        id v583 = v682[5];
        uint64_t v451 = [(CBDevice *)self dsActionMeasuredPower];
        NSAppendPrintF_safe();
        objc_storeStrong(v228 + 5, v583);
        v229 = v682;
        id v582 = v682[5];
        uint64_t v449 = [(CBDevice *)self dsActionTieBreaker];
        NSAppendPrintF_safe();
        objc_storeStrong(v229 + 5, v582);
      }
      if ((discoveryFlags & 0x800000000000000) != 0)
      {
        v230 = v682;
        id v581 = v682[5];
        uint64_t v452 = [(CBDevice *)self dsInfoVehicleConfidence];
        NSAppendPrintF_safe();
        objc_storeStrong(v230 + 5, v581);
        v231 = v682 + 5;
        id v580 = v682[5];
        unsigned int v232 = [(CBDevice *)self dsInfoVehicleState];
        if (v232 > 2) {
          int v233 = "?";
        }
        else {
          int v233 = off_1E5E34C20[(char)v232];
        }
        uint64_t v449 = (uint64_t)v233;
        NSAppendPrintF_safe();
        objc_storeStrong(v231, v580);
      }
      v234 = [(CBDevice *)self gfpPayloadData];
      if (v234)
      {
        v235 = v682;
        id v579 = v682[5];
        unint64_t homeKitV1SetupHash = CUPrintNSDataHex();
        v475 = (const char *)[(CBDevice *)self gfpModelID];
        NSAppendPrintF_safe();
        objc_storeStrong(v235 + 5, v579);
      }
      v236 = [(CBDevice *)self fidoPayloadData];
      if (v236)
      {
        v237 = v682;
        id v578 = v682[5];
        unint64_t homeKitV1SetupHash = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v237 + 5, v578);
      }
      if ((discoveryFlags & 0x400000000000000) != 0)
      {
        BOOL v238 = v682;
        id v577 = v682[5];
        uint64_t v454 = [(CBDevice *)self heySiriConfidence];
        NSAppendPrintF_safe();
        objc_storeStrong(v238 + 5, v577);
        v239 = v682 + 5;
        id v576 = v682[5];
        unsigned int v240 = [(CBDevice *)self heySiriDeviceClass];
        if (v240 > 0xA) {
          char v241 = "?";
        }
        else {
          char v241 = off_1E5E34C38[(__int16)v240];
        }
        v455 = v241;
        NSAppendPrintF_safe();
        objc_storeStrong(v239, v576);
        v242 = v682;
        id v575 = v682[5];
        uint64_t v456 = [(CBDevice *)self heySiriPerceptualHash];
        NSAppendPrintF_safe();
        objc_storeStrong(v242 + 5, v575);
        unint64_t v243 = v682 + 5;
        id v574 = v682[5];
        unsigned int v244 = [(CBDevice *)self heySiriProductType];
        if (v244 > 4) {
          v245 = "?";
        }
        else {
          v245 = off_1E5E34C90[(char)v244];
        }
        v457 = v245;
        NSAppendPrintF_safe();
        objc_storeStrong(v243, v574);
        v246 = v682;
        id v573 = v682[5];
        uint64_t v458 = [(CBDevice *)self heySiriRandom];
        NSAppendPrintF_safe();
        objc_storeStrong(v246 + 5, v573);
        v247 = v682;
        id v572 = v682[5];
        unint64_t homeKitV1SetupHash = [(CBDevice *)self heySiriSNR];
        NSAppendPrintF_safe();
        objc_storeStrong(v247 + 5, v572);
      }
      if ((discoveryFlags & 0x400000) != 0)
      {
        v248 = v682;
        id v571 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v248 + 5, v571);
        char v249 = v682;
        id v570 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v249 + 5, v570);
        uint64_t v250 = v682;
        id v569 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v250 + 5, v569);
        uint64_t v251 = v682;
        id v568 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v251 + 5, v568);
        int v252 = v682;
        id v567 = v682[5];
        int v253 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v252 + 5, v567);

        v254 = v682;
        id v566 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v254 + 5, v566);
        v255 = v682;
        id v565 = v682[5];
        unint64_t homeKitV1SetupHash = self->_homeKitV1SetupHash;
        NSAppendPrintF_safe();
        objc_storeStrong(v255 + 5, v565);
      }
      if ((discoveryFlags & 0x1000000) != 0)
      {
        v256 = v682;
        id v564 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v256 + 5, v564);
        v257 = v682;
        id v563 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v257 + 5, v563);
        v258 = v682;
        id v562 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v258 + 5, v562);
        char v259 = v682;
        id v561 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v259 + 5, v561);
        v260 = v682;
        id v560 = v682[5];
        unint64_t homeKitV1SetupHash = self->_homeKitV2Value;
        NSAppendPrintF_safe();
        objc_storeStrong(v260 + 5, v560);
      }
      if ((discoveryFlags & 0x80000000000000) != 0)
      {
        v261 = [(CBDevice *)self mspAddressData];
        if (v261)
        {
          v262 = v682;
          id v559 = v682[5];
          unint64_t homeKitV1SetupHash = CUPrintNSDataAddress();
          NSAppendPrintF_safe();
          objc_storeStrong(v262 + 5, v559);
        }
        unint64_t v263 = [(CBDevice *)self mspDeviceClass];
        if (v263)
        {
          v264 = v682;
          id v558 = v682[5];
          unint64_t homeKitV1SetupHash = v263;
          NSAppendPrintF_safe();
          objc_storeStrong(v264 + 5, v558);
        }
        char v265 = [(CBDevice *)self mspDisplayName];
        if (v265)
        {
          v266 = v682;
          id v557 = v682[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v266 + 5, v557);
        }

        v267 = v682 + 5;
        id v556 = v682[5];
        unsigned int v268 = [(CBDevice *)self mspSubScenario];
        if (v268 > 2) {
          v269 = "?";
        }
        else {
          v269 = off_1E5E34CB8[(char)v268];
        }
        unint64_t homeKitV1SetupHash = (unint64_t)v269;
        NSAppendPrintF_safe();
        objc_storeStrong(v267, v556);
      }
      unsigned int v270 = [(CBDevice *)self nearbyActionColorCode];
      if (v270)
      {
        char v271 = v682;
        id v555 = v682[5];
        uint64_t v459 = v270;
        NSAppendPrintF_safe();
        objc_storeStrong(v271 + 5, v555);
      }
      int v272 = [(CBDevice *)self nearbyActionExtraData];
      if (v272)
      {
        uint64_t v273 = v682;
        id v554 = v682[5];
        v460 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v273 + 5, v554);
      }
      if (self->_nearbyActionFlags)
      {
        unsigned int v274 = v682;
        id v553 = v682[5];
        v460 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v274 + 5, v553);
      }
      unsigned int nearbyActionType = self->_nearbyActionType;
      if (self->_nearbyActionType)
      {
        v276 = v682 + 5;
        id v552 = v682[5];
        if (nearbyActionType > 0x58) {
          v277 = "?";
        }
        else {
          v277 = off_1E5E34D18[(char)(nearbyActionType - 1)];
        }
        v460 = (void *)v277;
        NSAppendPrintF_safe();
        objc_storeStrong(v276, v552);
      }
      v278 = self->_nearbyActionAuthTag;
      if (v278)
      {
        v279 = v682;
        id v551 = v682[5];
        v460 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v279 + 5, v551);
      }
      char v280 = self->_nearbyActionTargetAuthTag;
      if (v280)
      {
        int v281 = v682;
        id v550 = v682[5];
        v460 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v281 + 5, v550);
      }
      unsigned int v282 = [(CBDevice *)self nearbyActionDeviceClass];
      if (v282)
      {
        v283 = v682 + 5;
        id v549 = v682[5];
        if (v282 > 9) {
          int v284 = "?";
        }
        else {
          int v284 = off_1E5E34CD0[(char)(v282 - 1)];
        }
        v460 = (void *)v284;
        NSAppendPrintF_safe();
        objc_storeStrong(v283, v549);
      }
      if ([(CBDevice *)self nearbyActionV2Flags])
      {
        BOOL v285 = v682;
        id v548 = v682[5];
        v461 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v285 + 5, v548);
      }
      unsigned int v286 = [(CBDevice *)self nearbyActionV2Type];
      if (v286)
      {
        v287 = v682 + 5;
        id v547 = v682[5];
        if (v286 >= 0x59) {
          v288 = "?";
        }
        else {
          v288 = off_1E5E34D18[(char)(v286 - 1)];
        }
        v462 = v288;
        NSAppendPrintF_safe();
        objc_storeStrong(v287, v547);
      }
      unint64_t v289 = [(CBDevice *)self nearbyActionV2TargetData];
      if (v289)
      {
        v290 = v682;
        id v546 = v682[5];
        v463 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v290 + 5, v546);
      }
      v291 = self->_nearbyInfoAuthTag;
      if (v291)
      {
        v292 = v682;
        id v545 = v682[5];
        v463 = CUPrintNSDataHex();
        NSAppendPrintF_safe();
        objc_storeStrong(v292 + 5, v545);
      }
      if (self->_nearbyInfoFlags)
      {
        v293 = v682;
        id v544 = v682[5];
        v463 = CUPrintFlags32();
        NSAppendPrintF_safe();
        objc_storeStrong(v293 + 5, v544);
      }
      [(CBDevice *)self nearbyInfoStatusProgress];
      if (v294 != 0.0)
      {
        v295 = v682;
        id v543 = v682[5];
        double v464 = v294 * 100.0;
        NSAppendPrintF_safe();
        objc_storeStrong(v295 + 5, v543);
      }
      unsigned int v296 = [(CBDevice *)self nearbyInfoStatusTime];
      if (v296)
      {
        v297 = v682 + 5;
        id v542 = v682[5];
        if (v296 > 0xE) {
          char v298 = "?";
        }
        else {
          char v298 = off_1E5E34FD8[(char)(v296 - 1)];
        }
        v465 = v298;
        NSAppendPrintF_safe();
        objc_storeStrong(v297, v542);
      }
      unsigned int v299 = [(CBDevice *)self nearbyInfoStatusType];
      if (v299)
      {
        int v300 = v682 + 5;
        id v541 = v682[5];
        if (v299 > 0xD) {
          v301 = "?";
        }
        else {
          v301 = off_1E5E35048[(char)(v299 - 1)];
        }
        objectDiscoveryPublicKeyData = (__CFString *)v301;
        NSAppendPrintF_safe();
        objc_storeStrong(v300, v541);
      }
      if (self->_nearbyInfoV2Flags)
      {
        unint64_t v302 = v682;
        id v540 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v302 + 5, v540);
      }
      if (self->_nearbyInfoV2DecryptedFlags)
      {
        uint64_t v303 = v682;
        id v539 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v303 + 5, v539);
      }
      unint64_t v304 = self->_nearbyInfoV2AuthTagData;
      if (v304)
      {
        unint64_t v305 = v682;
        id v538 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v305 + 5, v538);
      }
      v306 = self->_nearbyInfoV2AuthIntegrityTagData;
      if (v306)
      {
        v307 = v682;
        id v537 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v307 + 5, v537);
      }
      nearbyInfoV2InvitationCounter = (__CFString *)self->_nearbyInfoV2InvitationCounter;
      if (self->_nearbyInfoV2InvitationCounter)
      {
        uint64_t v309 = v682;
        id v536 = v682[5];
        objectDiscoveryPublicKeyData = nearbyInfoV2InvitationCounter;
        NSAppendPrintF_safe();
        objc_storeStrong(v309 + 5, v536);
      }
      if (self->_nearbyInfoV2InvitationTypes)
      {
        char v310 = v682;
        id v535 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v310 + 5, v535);
      }
      unsigned int nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
      if (self->_nearbyInfoV2InvitationRouteType)
      {
        v312 = v682 + 5;
        id v534 = v682[5];
        if (nearbyInfoV2InvitationRouteType > 0xB) {
          v313 = "?";
        }
        else {
          v313 = off_1E5E350B0[(char)(nearbyInfoV2InvitationRouteType - 1)];
        }
        objectDiscoveryPublicKeyData = (__CFString *)v313;
        NSAppendPrintF_safe();
        objc_storeStrong(v312, v534);
      }
      if (self->_nearbyActionNoWakeType)
      {
        if (self->_nearbyActionNoWakeType == 1) {
          v314 = "PrecisionFinding";
        }
        else {
          v314 = "?";
        }
        v315 = v682;
        id v533 = v682[5];
        objectDiscoveryPublicKeyData = (__CFString *)v314;
        NSAppendPrintF_safe();
        objc_storeStrong(v315 + 5, v533);
      }
      if (self->_nearbyActionNWPrecisionFindingStatus)
      {
        v316 = v682;
        id v532 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v316 + 5, v532);
      }
      v317 = self->_nearbyActionNoWakeAuthTagData;
      if (v317)
      {
        v318 = v682;
        id v531 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v318 + 5, v531);
      }
      unint64_t v319 = self->_nearbyActionNoWakeConfigData;
      if (v319)
      {
        v320 = v682;
        id v530 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v320 + 5, v530);
      }
      if ((discoveryFlags & 0x60000000000) != 0)
      {
        id v321 = v682 + 5;
        id v529 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v321, v529);
        id v322 = v682 + 5;
        id v528 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v322, v528);
        id v323 = v682;
        id v527 = v682[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v323 + 5, v527);
        id v324 = v682;
        id v526 = v682[5];
        CBProductIDToString_0(self->_objectDiscoveryProductID);
        NSAppendPrintF_safe();
        objc_storeStrong(v324 + 5, v526);
        id v325 = v682;
        id v525 = v682[5];
        objectDiscoveryPublicKeyData = (__CFString *)self->_objectDiscoveryPublicKeyData;
        NSAppendPrintF_safe();
        objc_storeStrong(v325 + 5, v525);
      }
      id v326 = self->_proximityServiceData;
      if (v326)
      {
        id v327 = v682;
        id v524 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v327 + 5, v524);
      }
      proximityServiceCategory = (__CFString *)self->_proximityServiceCategory;
      if (self->_proximityServiceCategory)
      {
        v329 = v682;
        id v523 = v682[5];
        objectDiscoveryPublicKeyData = proximityServiceCategory;
        NSAppendPrintF_safe();
        objc_storeStrong(v329 + 5, v523);
      }
      id v330 = self->_proximityServiceClassicAddress;
      if (v330)
      {
        id v331 = v682;
        id v522 = v682[5];
        CUPrintNSDataAddress();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v331 + 5, v522);
      }
      if (self->_proximityServiceFlags)
      {
        id v332 = v682;
        id v521 = v682[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v332 + 5, v521);
      }
      proximityServiceMeasuredPower = (__CFString *)self->_proximityServiceMeasuredPower;
      if (self->_proximityServiceMeasuredPower)
      {
        v334 = v682;
        id v520 = v682[5];
        objectDiscoveryPublicKeyData = proximityServiceMeasuredPower;
        NSAppendPrintF_safe();
        objc_storeStrong(v334 + 5, v520);
      }
      uint64_t proximityServiceProductID = (__CFString *)self->_proximityServiceProductID;
      if (proximityServiceProductID)
      {
        v336 = CBProductIDToString_0(self->_proximityServiceProductID);
        v337 = v682;
        id v519 = v682[5];
        objectDiscoveryPublicKeyData = proximityServiceProductID;
        v475 = v336;
        NSAppendPrintF_safe();
        objc_storeStrong(v337 + 5, v519);
      }
      proximityServicePSM = (__CFString *)self->_proximityServicePSM;
      if (self->_proximityServicePSM)
      {
        v339 = v682;
        id v518 = v682[5];
        objectDiscoveryPublicKeyData = proximityServicePSM;
        NSAppendPrintF_safe();
        objc_storeStrong(v339 + 5, v518);
      }
      __int16 v340 = self->_proximityServiceSetupHash;
      if (v340)
      {
        v341 = v682;
        id v517 = v682[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v341 + 5, v517);
      }
      unsigned int proximityServiceSubType = self->_proximityServiceSubType;
      if (self->_proximityServiceSubType)
      {
        v343 = v682 + 5;
        id v516 = v682[5];
        if (proximityServiceSubType > 6) {
          int v344 = "?";
        }
        else {
          int v344 = off_1E5E35140[(char)(proximityServiceSubType - 1)];
        }
        objectDiscoveryPublicKeyData = (__CFString *)v344;
        NSAppendPrintF_safe();
        objc_storeStrong(v343, v516);
      }
      proximityServiceVendorID = (__CFString *)self->_proximityServiceVendorID;
      if (!self->_proximityServiceVendorID) {
        goto LABEL_432;
      }
      v346 = v682 + 5;
      id v515 = v682[5];
      v347 = "Apple";
      if ((int)proximityServiceVendorID > 300)
      {
        if (proximityServiceVendorID == 1452) {
          goto LABEL_431;
        }
        if (proximityServiceVendorID == 1356 || proximityServiceVendorID == 301)
        {
          v347 = "Sony";
          goto LABEL_431;
        }
      }
      else
      {
        switch(proximityServiceVendorID)
        {
          case 6:
            v347 = "MS";
            goto LABEL_431;
          case 0x4C:
LABEL_431:
            objectDiscoveryPublicKeyData = proximityServiceVendorID;
            v475 = v347;
            NSAppendPrintF_safe();
            objc_storeStrong(v346, v515);
LABEL_432:
            proximityServiceVersion = (__CFString *)self->_proximityServiceVersion;
            if (self->_proximityServiceVersion)
            {
              v349 = v682;
              id v514 = v682[5];
              objectDiscoveryPublicKeyData = proximityServiceVersion;
              NSAppendPrintF_safe();
              objc_storeStrong(v349 + 5, v514);
            }
            if ((discoveryFlags & 0xC080) != 0)
            {
              uint64_t proximityPairingProductID = (__CFString *)self->_proximityPairingProductID;
              if (proximityPairingProductID)
              {
                v351 = CBProductIDToString_0(self->_proximityPairingProductID);
                v352 = v682;
                id v513 = v682[5];
                objectDiscoveryPublicKeyData = proximityPairingProductID;
                v475 = v351;
                NSAppendPrintF_safe();
                objc_storeStrong(v352 + 5, v513);
              }
              proximityPairingSubType = (__CFString *)self->_proximityPairingSubType;
              if (self->_proximityPairingSubType)
              {
                v354 = v682 + 5;
                id v512 = v682[5];
                if (proximityPairingSubType > 9) {
                  v355 = "?";
                }
                else {
                  v355 = off_1E5E35170[(char)((_BYTE)proximityPairingSubType - 1)];
                }
                objectDiscoveryPublicKeyData = proximityPairingSubType;
                v475 = v355;
                NSAppendPrintF_safe();
                objc_storeStrong(v354, v512);
              }
              unsigned int v356 = [(CBDevice *)self proximityPairingPrimaryPlacement];
              if (v356)
              {
                v357 = v682 + 5;
                id v511 = v682[5];
                if (v356 > 7) {
                  v358 = "?";
                }
                else {
                  v358 = off_1E5E351B8[v356 - 1];
                }
                v467 = v358;
                NSAppendPrintF_safe();
                objc_storeStrong(v357, v511);
              }
              unsigned int v359 = [(CBDevice *)self proximityPairingSecondaryPlacement];
              if (v359)
              {
                v360 = v682 + 5;
                id v510 = v682[5];
                if (v359 > 7) {
                  v361 = "?";
                }
                else {
                  v361 = off_1E5E351B8[v359 - 1];
                }
                objectDiscoveryPublicKeyData = (__CFString *)v361;
                NSAppendPrintF_safe();
                objc_storeStrong(v360, v510);
              }
            }
            if (self->_selectiveSpeechListeningCapability)
            {
              if (self->_selectiveSpeechListeningCapability == 1) {
                v362 = @"Enabled";
              }
              else {
                v362 = @"?";
              }
              v363 = v682;
              id v509 = v682[5];
              objectDiscoveryPublicKeyData = v362;
              NSAppendPrintF_safe();
              objc_storeStrong(v363 + 5, v509);
            }
            unsigned int v364 = [(CBDevice *)self selectiveSpeechListeningConfig];
            if (v364)
            {
              v365 = v682 + 5;
              id v508 = v682[5];
              if (v364 > 3) {
                v366 = @"?";
              }
              else {
                v366 = (__CFString *)*((void *)&off_1E5E351F0 + (char)(v364 - 1));
              }
              v468 = v366;
              NSAppendPrintF_safe();
              objc_storeStrong(v365, v508);
            }
            uint64_t hearingAidSupport = self->_hearingAidSupport;
            if (self->_hearingAidSupport)
            {
              v368 = v682 + 5;
              id v507 = v682[5];
              if (hearingAidSupport > 2) {
                v369 = "?";
              }
              else {
                v369 = off_1E5E35208[hearingAidSupport];
              }
              v468 = (void *)v369;
              NSAppendPrintF_safe();
              objc_storeStrong(v368, v507);
            }
            uint64_t hearingTestSupport = self->_hearingTestSupport;
            if (self->_hearingTestSupport)
            {
              v371 = v682 + 5;
              id v506 = v682[5];
              if (hearingTestSupport > 2) {
                v372 = "?";
              }
              else {
                v372 = off_1E5E35208[hearingTestSupport];
              }
              v468 = (void *)v372;
              NSAppendPrintF_safe();
              objc_storeStrong(v371, v506);
            }
            v373 = self->_safetyAlertsAlertData;
            if (v373)
            {
              v374 = v682;
              id v505 = v682[5];
              v468 = CUPrintNSDataHex();
              NSAppendPrintF_safe();
              objc_storeStrong(v374 + 5, v505);
            }
            v375 = self->_safetyAlertsAlertID;
            if (v375)
            {
              v376 = v682;
              id v504 = v682[5];
              v468 = CUPrintNSDataHex();
              NSAppendPrintF_safe();
              objc_storeStrong(v376 + 5, v504);
            }
            v377 = self->_safetyAlertsSignature;
            if (v377)
            {
              v378 = v682;
              id v503 = v682[5];
              v468 = CUPrintNSDataHex();
              NSAppendPrintF_safe();
              objc_storeStrong(v378 + 5, v503);
            }
            if (self->_safetyAlertsVersion)
            {
              if (self->_safetyAlertsVersion == 1) {
                v379 = "1";
              }
              else {
                v379 = "?";
              }
              v380 = v682;
              id v502 = v682[5];
              v468 = (void *)v379;
              NSAppendPrintF_safe();
              objc_storeStrong(v380 + 5, v502);
            }
            if ((self->_internalFlags & 0x4000) != 0)
            {
              v381 = self->_safetyAlertsSegmentAlertData;
              if (v381)
              {
                v382 = v682;
                id v501 = v682[5];
                v468 = CUPrintNSDataHex();
                NSAppendPrintF_safe();
                objc_storeStrong(v382 + 5, v501);
              }
              safetyAlertsSegmentSegmentNumber = (void *)self->_safetyAlertsSegmentSegmentNumber;
              if (self->_safetyAlertsSegmentSegmentNumber)
              {
                v384 = v682;
                id v500 = v682[5];
                v468 = safetyAlertsSegmentSegmentNumber;
                NSAppendPrintF_safe();
                objc_storeStrong(v384 + 5, v500);
              }
              safetyAlertsSegmentSegmentsTotal = (void *)self->_safetyAlertsSegmentSegmentsTotal;
              if (self->_safetyAlertsSegmentSegmentsTotal)
              {
                v386 = v682;
                id v499 = v682[5];
                v468 = safetyAlertsSegmentSegmentsTotal;
                NSAppendPrintF_safe();
                objc_storeStrong(v386 + 5, v499);
              }
              v387 = self->_safetyAlertsSegmentServiceData;
              if (v387)
              {
                v388 = v682;
                id v498 = v682[5];
                v468 = CUPrintNSDataHex();
                NSAppendPrintF_safe();
                objc_storeStrong(v388 + 5, v498);
              }
              v389 = self->_safetyAlertsSegmentSignature;
              if (v389)
              {
                v390 = v682;
                id v497 = v682[5];
                v468 = CUPrintNSDataHex();
                NSAppendPrintF_safe();
                objc_storeStrong(v390 + 5, v497);
              }
            }
            v391 = self->_spatialInteractionIdentifiers;
            if (v391)
            {
              v392 = v682;
              id v496 = v682[5];
              v468 = CUPrintNSObjectOneLine();
              NSAppendPrintF_safe();
              objc_storeStrong(v392 + 5, v496);
            }
            if (self->_spatialInteractionFlags)
            {
              v393 = v682;
              id v495 = v682[5];
              v468 = CUPrintFlags32();
              NSAppendPrintF_safe();
              objc_storeStrong(v393 + 5, v495);
            }
            if (self->_spatialInteractionConfigFlags)
            {
              v394 = v682;
              id v494 = v682[5];
              v468 = CUPrintFlags32();
              NSAppendPrintF_safe();
              objc_storeStrong(v394 + 5, v494);
            }
            v395 = self->_spatialInteractionTokenData;
            if (v395)
            {
              v396 = v682;
              id v493 = v682[5];
              v468 = CUPrintNSObjectMasked();
              NSAppendPrintF_safe();
              objc_storeStrong(v396 + 5, v493);
            }
            v397 = self->_spatialInteractionUserInfo;
            if (v397)
            {
              v398 = v682;
              id v492 = v682[5];
              v468 = CUPrintNSObjectOneLineEx();
              NSAppendPrintF_safe();
              objc_storeStrong(v398 + 5, v492);
            }
            v399 = self->_spatialInteractionUWBConfigData;
            v400 = v399;
            if (v399)
            {
              v401 = v682;
              id v491 = v682[5];
              v468 = v399;
              NSAppendPrintF_safe();
              objc_storeStrong(v401 + 5, v491);
            }

            spatialInteractionUWBTokenFlags = (void *)self->_spatialInteractionUWBTokenFlags;
            if (spatialInteractionUWBTokenFlags)
            {
              v403 = v682;
              id v490 = v682[5];
              v468 = spatialInteractionUWBTokenFlags;
              NSAppendPrintF_safe();
              objc_storeStrong(v403 + 5, v490);
            }
            v404 = self->_spatialInteractionPresenceConfigData;
            v405 = v404;
            if (v404)
            {
              v406 = v682;
              id v489 = v682[5];
              v468 = v404;
              NSAppendPrintF_safe();
              objc_storeStrong(v406 + 5, v489);
            }

            v407 = self->_tipiDevices;
            if (v407)
            {
              v408 = v682;
              id v488 = v682[5];
              v468 = CUPrintNSObjectOneLine();
              NSAppendPrintF_safe();
              objc_storeStrong(v408 + 5, v488);
            }
            unsigned int tipiConnectionStatus = self->_tipiConnectionStatus;
            if (self->_tipiConnectionStatus)
            {
              v410 = v682 + 5;
              id v487 = v682[5];
              if (tipiConnectionStatus > 3) {
                v411 = "?";
              }
              else {
                v411 = off_1E5E35220[(char)(tipiConnectionStatus - 1)];
              }
              v468 = (void *)v411;
              NSAppendPrintF_safe();
              objc_storeStrong(v410, v487);
            }
            if (self->_tipiState)
            {
              v412 = v682;
              id v486 = v682[5];
              v468 = CUPrintFlags32();
              NSAppendPrintF_safe();
              objc_storeStrong(v412 + 5, v486);
            }
            v413 = [(CBDevice *)self watchSetupData];
            if (v413)
            {
              v414 = v682;
              id v485 = v682[5];
              v469 = CUPrintNSDataHex();
              NSAppendPrintF_safe();
              objc_storeStrong(v414 + 5, v485);
            }
            if (v21 < 0x1F)
            {
              if (self->_internalFlags)
              {
                v415 = v682;
                id v484 = v682[5];
                v470 = CUPrintFlags32();
                NSAppendPrintF_safe();
                objc_storeStrong(v415 + 5, v484);
              }
              if (self->_attributeInternalFlags)
              {
                v416 = v682;
                id v483 = v682[5];
                v471 = CUPrintFlags32();
                NSAppendPrintF_safe();
                objc_storeStrong(v416 + 5, v483);
              }
            }
            if (self->_changeFlags != self->_discoveryFlags)
            {
              v417 = v682;
              id v482 = v682[5];
              v472 = CUPrintFlags64();
              NSAppendPrintF_safe();
              objc_storeStrong(v417 + 5, v482);
            }
            if (*(_DWORD *)self->_changedTypesInternal.bitArray != *(_DWORD *)self->_discoveryTypesInternal.bitArray
              || self->_changedTypesInternal.bitArray[4] != self->_discoveryTypesInternal.bitArray[4])
            {
              v419 = v682;
              id v481 = v682[5];
              CBDiscoveryTypesAppendString((uint64_t)&v481, (uint64_t)", ChTy", (uint64_t)&self->_changedTypesInternal);
              objc_storeStrong(v419 + 5, v481);
            }
            if (v21 <= 0x14)
            {
              v420 = v682;
              id v480 = v682[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v420 + 5, v480);
            }
            v421 = self->_spatialInteractionDeviceTimestampArrayDictionary;
            if (v421)
            {
              v422 = v682;
              id v479 = v682[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v422 + 5, v479);
              spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
              v477[0] = MEMORY[0x1E4F143A8];
              v477[1] = 3221225472;
              v477[2] = __33__CBDevice_descriptionWithLevel___block_invoke;
              v477[3] = &unk_1E5E34AF0;
              v477[4] = &v681;
              int v478 = v94;
              [(NSMutableDictionary *)spatialInteractionDeviceTimestampArrayDictionary enumerateKeysAndObjectsUsingBlock:v477];
              v424 = v682;
              id v476 = v682[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v424 + 5, v476);
            }

            goto LABEL_539;
          case 0xC4:
            v347 = "LG";
            goto LABEL_431;
        }
      }
      v347 = "?";
      goto LABEL_431;
    }
    size_t v181 = v682 + 5;
    id v611 = v682[5];
    if (v180 > 2)
    {
      if (v180 == 3)
      {
        char v182 = "NoStereoUpSample";
        goto LABEL_241;
      }
      if (v180 == 255)
      {
        char v182 = "Unknown";
        goto LABEL_241;
      }
    }
    else
    {
      if (v180 == 1)
      {
        char v182 = "ContentDriven";
        goto LABEL_241;
      }
      if (v180 == 2)
      {
        char v182 = "Always";
LABEL_241:
        v443 = (void *)v182;
        NSAppendPrintF_safe();
        objc_storeStrong(v181, v611);
        goto LABEL_242;
      }
    }
    char v182 = "?";
    goto LABEL_241;
  }
LABEL_539:
  id v425 = v682[5];
  _Block_object_dispose(&v681, 8);

  return v425;
}

- (char)rssi
{
  int bleRSSI = self->_bleRSSI;
  if (!bleRSSI) {
    LOBYTE(bleRSSI) = self->_classicRSSI;
  }
  return bleRSSI;
}

- (NSData)watchSetupData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"wsDa", TypeID, 0);
}

- (NSString)stableIdentifier
{
  v3 = self->_idsDeviceID;
  if (v3)
  {
  }
  else
  {
    unsigned __int8 v5 = self->_homeKitV2AccessoryIDData;
    if ([(NSData *)v5 length] == 6)
    {
      uint64_t v6 = CUPrintNSDataAddress();
    }
    else
    {
      BOOL v7 = self->_homeKitV1DeviceIDData;
      if ([(NSData *)v7 length] == 6)
      {
        uint64_t v6 = CUPrintNSDataAddress();
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    v3 = (NSString *)v6;
  }
  return v3;
}

- (int)spatialAudioMode
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)primaryBudSide
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyInfoStatusType
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyInfoStatusTime
{
  return CFDictionaryGetInt64Ranged();
}

- (double)nearbyInfoStatusProgress
{
  CFDictionaryGetDouble();
  return result;
}

- (unsigned)nearbyActionV2Type
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyActionV2Flags
{
  return CFDictionaryGetInt64Ranged();
}

- (NSData)nearbyActionExtraData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"naED", TypeID, 0);
}

- (unsigned)nearbyActionDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyActionColorCode
{
  return CFDictionaryGetInt64Ranged();
}

- (NSData)airdropTempAuthTagData
{
  return self->_airdropTempAuthTagData;
}

- (unint64_t)removeInternalFlags:(unsigned int)a3
{
  unsigned int v4 = self->_internalFlags & ~a3;
  self->_internalFlags = v4;
  unint64_t v5 = (unint64_t)((v4 & 0x86) == 0) << 27;
  if (self->_audioStreamState)
  {
    self->_unsigned int audioStreamState = 0;
    v5 |= 0x80000000000uLL;
  }
  if ((v4 & 0x84) == 0 && (self->_discoveryFlags & 0x80) == 0)
  {
    if (self->_batteryInfoMain)
    {
      self->_unsigned int batteryInfoMain = 0;
      v5 |= 0x80000000000uLL;
    }
    if (self->_batteryInfoLeft)
    {
      self->_unsigned int batteryInfoLeft = 0;
      v5 |= 0x80000000000uLL;
    }
    if (self->_batteryInfoRight)
    {
      self->_unsigned int batteryInfoRight = 0;
      v5 |= 0x80000000000uLL;
    }
    if (self->_batteryInfoCase)
    {
      self->_unsigned int batteryInfoCase = 0;
      v5 |= 0x80000000000uLL;
    }
  }
  bleAddressData = self->_bleAddressData;
  if (bleAddressData) {
    BOOL v7 = (v4 & 2) == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    self->_bleAddressData = 0;

    v5 |= 0x80000000000uLL;
  }
  bleAdvertisementData = self->_bleAdvertisementData;
  if (bleAdvertisementData && (v4 & 2) == 0)
  {
    self->_bleAdvertisementData = 0;

    v5 |= 0x40000000uLL;
  }
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  if (bleAppleManufacturerData && (v4 & 2) == 0)
  {
    self->_bleAppleManufacturerData = 0;

    v5 |= 0x40000000uLL;
  }
  if (self->_bleChannel && (v4 & 2) == 0)
  {
    self->_int64_t bleChannel = 0;
    v5 |= 0x200000000uLL;
  }
  if (self->_bleRSSI && (v4 & 2) == 0)
  {
    self->_int bleRSSI = 0;
    v5 |= 0x200000000uLL;
  }
  if (self->_classicRSSI && (v4 & 0x84) == 0)
  {
    self->_classicRSSI = 0;
    v5 |= 0x200000000uLL;
  }
  if (self->_connectedServices && (v4 & 0x84) == 0)
  {
    self->_uint64_t connectedServices = 0;
    v5 |= 0x80000000000uLL;
  }
  if ((v4 & 0x84) == 0)
  {
    unint64_t deviceFlags = self->_deviceFlags;
    if ((deviceFlags & 0xFFFFF87F00000F80) != deviceFlags)
    {
      self->_unint64_t deviceFlags = deviceFlags & 0xFFFFF87F00000F80;
      v5 |= 0x80000000000uLL;
    }
  }
  if (self->_deviceType && (v4 & 0x84) == 0)
  {
    self->_unsigned int deviceType = 0;
    v5 |= 0x80000000000uLL;
  }
  unint64_t discoveryFlags = self->_discoveryFlags;
  unint64_t v12 = discoveryFlags & 0x8305593A4EB00000;
  if ((v4 & 2) != 0) {
    unint64_t v12 = self->_discoveryFlags;
  }
  if ((v4 & 0x84) == 0) {
    v12 &= 0xFFFFFFFFFF5FFFFFLL;
  }
  if ((v4 & 0x80) == 0) {
    v12 &= ~0x4000000000000uLL;
  }
  unint64_t v13 = v12 ^ discoveryFlags;
  if (v13)
  {
    self->_unint64_t discoveryFlags = v12;
    self->_changeFlags |= v13 | 0x800000000;
    v5 |= v13 | 0x800000000;
  }
  if ((v4 & 2) == 0)
  {
    char v14 = (char *)CBDiscoveryTypesBLEScan();
    CBDiscoveryTypesRemoveTypesAndReportChanges((char *)&self->_discoveryTypesInternal, v14, self->_changedTypesInternal.bitArray);
  }
  if (self->_doubleTapActionLeft && (v4 & 0x84) == 0)
  {
    self->_uint64_t doubleTapActionLeft = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_doubleTapActionRight && (v4 & 0x84) == 0)
  {
    self->_char doubleTapActionRight = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_doubleTapCapability && (v4 & 0x84) == 0)
  {
    self->_char doubleTapCapability = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_microphoneMode && (v4 & 0x84) == 0)
  {
    self->_uint64_t microphoneMode = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_primaryPlacement && (v4 & 0x84) == 0)
  {
    self->_unsigned int primaryPlacement = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_secondaryPlacement && (v4 & 0x84) == 0)
  {
    self->_unsigned int secondaryPlacement = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_placementMode && (v4 & 0x84) == 0)
  {
    self->_char placementMode = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_smartRoutingMode && (v4 & 0x84) == 0)
  {
    self->_uint64_t smartRoutingMode = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_supportedServices && (v4 & 0x84) == 0)
  {
    self->_uint64_t supportedServices = 0;
    v5 |= 0x80000000000uLL;
  }
  [(CBDevice *)self _clearUnparsedProperties];
  return v5;
}

- (NSMutableDictionary)spatialInteractionDeviceTimestampArrayDictionary
{
  return self->_spatialInteractionDeviceTimestampArrayDictionary;
}

- (void)_parseAirPlaySourcePtr:(const char *)a3 end:(const char *)a4
{
  unint64_t v5 = a3;
  BOOL v7 = a4 - a3 > 0;
  if (a4 - a3 >= 1)
  {
    unint64_t v5 = a3 + 1;
    char v8 = *a3;
    if (*(unsigned __int8 *)a3 == self->_airplaySourceFlags) {
      goto LABEL_3;
    }
LABEL_10:
    self->_airplaySourceFlags = v8;
    uint64_t v9 = 0x4000000000;
    if ((v8 & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  char v8 = 0;
  if (self->_airplaySourceFlags) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v9 = 0;
  if ((v8 & 8) != 0)
  {
LABEL_4:
    id v23 = 0;
    BOOL v7 = 0;
    if (a4 - a3 >= 1 && a4 - v5 >= 1)
    {
      BOOL v7 = 1;
      id v23 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5++ length:1];
    }
    if ((v8 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
LABEL_11:
  id v23 = 0;
  if ((v8 & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  if (a4 - v5 > 2 && v7)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:3];
    if ((v8 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((v8 & 8) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  unint64_t v12 = [(CBDevice *)self airplaySourceUWBConfigData];
  id v13 = v23;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_25;
  }
  int v15 = v14;
  if ((v13 == 0) != (v14 != 0))
  {
    char v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0)
    {
      [(CBDevice *)self setAirplaySourceUWBConfigData:v13];
      uint64_t v9 = 0x4000000000;
      if ((v8 & 0x10) == 0) {
        goto LABEL_36;
      }
LABEL_26:
      unsigned int v17 = [(CBDevice *)self airplaySourceAuthTagData];
      airplaySourceAuthTagData = v11;
      char v19 = v17;
      if (airplaySourceAuthTagData == v19)
      {
      }
      else
      {
        uint64_t v20 = v19;
        if ((airplaySourceAuthTagData == 0) == (v19 != 0))
        {
        }
        else
        {
          char v21 = [(NSData *)airplaySourceAuthTagData isEqual:v19];

          if (v21) {
            goto LABEL_36;
          }
        }
        uint64_t v22 = airplaySourceAuthTagData;
        airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
        self->_airplaySourceAuthTagData = v22;
        uint64_t v9 = 0x4000000000;
      }

      goto LABEL_36;
    }
LABEL_25:
    if ((v8 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_26;
  }

  [(CBDevice *)self setAirplaySourceUWBConfigData:v13];
  uint64_t v9 = 0x4000000000;
  if ((v8 & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_36:
  self->_discoveryFlags |= 0x4000000000uLL;
  self->_changeFlags |= v9;
}

- (NSData)airplaySourceAuthTagData
{
  return self->_airplaySourceAuthTagData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDevice)initWithXPCEventRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CBDevice;
  id v13 = [(CBDevice *)&v26 init];
  if (!v13)
  {
    if (a4)
    {
      uint64_t v22 = "CBDevice super init failed";
LABEL_16:
      CBErrorF(-6756, (uint64_t)v22, v7, v8, v9, v10, v11, v12, v23);
      uint64_t v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_17:
    uint64_t v20 = 0;
    goto LABEL_11;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      uint64_t v22 = "XPC non-dict";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (xpc_dictionary_get_string(v6, "btAddress"))
  {
    __int16 v25 = 0;
    int v24 = 0;
    if (!TextToHardwareAddress())
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v24 length:6];
      btAddressData = v13->_btAddressData;
      v13->_btAddressData = (NSData *)v14;
    }
  }
  string = xpc_dictionary_get_string(v6, "deviceID");
  if (string)
  {
    uint64_t v17 = [NSString stringWithUTF8String:string];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "deviceClass");
  if (int64) {
    [(CBDevice *)v13 setNearbyActionDeviceClass:int64];
  }
  uint64_t v20 = v13;
LABEL_11:

  return v20;
}

- (OS_xpc_object)xpcEventRepresentation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  unsigned int v4 = self->_btAddressData;
  unint64_t v5 = v4;
  if (v4 && [(NSData *)v4 length] == 6)
  {
    LOWORD(v10) = 0;
    [(NSData *)v5 bytes];
    HardwareAddressToCString();
    xpc_dictionary_set_string(v3, "btAddress", (const char *)&v9);
  }

  id v6 = [(NSString *)self->_identifier UTF8String];
  if (v6) {
    xpc_dictionary_set_string(v3, "deviceID", v6);
  }
  unsigned int v7 = [(CBDevice *)self nearbyActionDeviceClass];
  if (v7) {
    xpc_dictionary_set_int64(v3, "deviceClass", v7);
  }

  return (OS_xpc_object *)v3;
}

- (CBDevice)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:9];
  unsigned int v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16, v17, v18);

  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"devi"];

  uint64_t v9 = [(CBDevice *)self initWithDictionary:v8 error:0];
  return v9;
}

- (CBDevice)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = [(CBDevice *)self initWithXPCObject:v12 error:a4];
    uint64_t v13 = self;
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBDevice convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [(CBDevice *)self dictionaryRepresentation];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"devi"];
  }
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(CBDevice *)self encodeWithXPCObject:v3];
  unsigned int v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (!v4) {
    unsigned int v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v6 = v4;

  return v6;
}

void __33__CBDevice_descriptionWithLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = a3;
  [a2 unsignedIntValue];
  id v6 = CUDescriptionWithLevel();

  uint64_t v7 = CUPrintNSObjectOneLine();
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (float)batteryLevelMain
{
  return (float)(self->_batteryInfoMain & 0x7F) / 100.0;
}

- (unsigned)batteryStateMain
{
  return HIBYTE(self->_batteryInfoMain) & 7;
}

- (float)batteryLevelLeft
{
  return (float)(self->_batteryInfoLeft & 0x7F) / 100.0;
}

- (unsigned)batteryStateLeft
{
  return HIBYTE(self->_batteryInfoLeft) & 7;
}

- (float)batteryLevelRight
{
  return (float)(self->_batteryInfoRight & 0x7F) / 100.0;
}

- (unsigned)batteryStateRight
{
  return HIBYTE(self->_batteryInfoRight) & 7;
}

- (float)batteryLevelCase
{
  return (float)(self->_batteryInfoCase & 0x7F) / 100.0;
}

- (unsigned)batteryStateCase
{
  return HIBYTE(self->_batteryInfoCase) & 7;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)changedTypesInternalPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_changedTypesInternal;
}

- (unsigned)colorCodeBest
{
  switch(self->_productID)
  {
    case 0x200Au:
    case 0x201Fu:
      unsigned __int8 result = self->_colorInfo & 0x1F;
      break;
    case 0x200Bu:
    case 0x2011u:
    case 0x2012u:
      unsigned int colorInfo_low = LOBYTE(self->_colorInfo);
      unsigned int v3 = colorInfo_low >> 4;
      int v4 = colorInfo_low & 0xF;
      if (v4 == 15) {
        LOBYTE(v4) = 0;
      }
      if (v3 == 15) {
        unsigned __int8 result = v4;
      }
      else {
        unsigned __int8 result = v3;
      }
      break;
    default:
      unsigned __int8 result = self->_colorInfo;
      break;
  }
  return result;
}

- (unsigned)colorFlags
{
  return HIBYTE(self->_colorInfo) & 1;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_discoveryTypesInternal;
}

- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"aVC" value:v4];
}

- (void)setAppearanceValue:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"a" value:v4];
}

- (void)setBtVersion:(id)a3
{
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"clHL" value:v4];
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"clHR" value:v4];
}

- (void)setConversationDetectConfig:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"cDC" value:v4];
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"crRD" value:v4];
}

- (void)setEndCallConfig:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"eCC" value:v4];
}

- (void)setFindMyCaseIdentifier:(id)a3
{
}

- (void)setFindMyGroupIdentifier:(id)a3
{
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"bndI" value:v4];
}

- (void)setGapaFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"gapa" value:v4];
}

- (NSData)irkData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"m", TypeID, 0);
}

- (void)setIrkData:(id)a3
{
}

- (NSData)linkKeyData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"n", TypeID, 0);
}

- (void)setLinkKeyData:(id)a3
{
}

- (void)setListeningMode:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"lsnM" value:v4];
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"lsMC" value:v4];
}

- (NSData)ltkData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"o", TypeID, 0);
}

- (void)setLtkData:(id)a3
{
}

- (void)setModelUser:(id)a3
{
}

- (void)setMuteControlConfig:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"mCC" value:v4];
}

- (void)setSpatialAudioMode:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"spAM" value:v4];
}

- (unsigned)accessoryStatusLidOpenCount
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAccessoryStatusLidOpenCount:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"asLO" value:v4];
}

- (unsigned)accessoryStatusFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAccessoryStatusFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"asFl" value:v4];
}

- (double)accessoryStatusOBCTime
{
  CFDictionaryGetDouble();
  return result;
}

- (void)setAccessoryStatusOBCTime:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"asOT" value:v4];
}

- (NSData)airplaySourceUWBConfigData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"apUW", TypeID, 0);
}

- (void)setAirplaySourceUWBConfigData:(id)a3
{
}

- (unsigned)airplayTargetPort
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAirplayTargetPort:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"apTP" value:v4];
}

- (unsigned)dsActionFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionFlags:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"dsAF" value:v4];
}

- (char)dsActionMeasuredPower
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionMeasuredPower:(char)a3
{
  id v4 = [NSNumber numberWithChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"dsAP" value:v4];
}

- (unsigned)dsActionTieBreaker
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionTieBreaker:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"dsAT" value:v4];
}

- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"b" value:v4];
}

- (void)setDsInfoVehicleState:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"c" value:v4];
}

- (unsigned)heySiriConfidence
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriConfidence:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"g" value:v4];
}

- (unsigned)heySiriDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriDeviceClass:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"h" value:v4];
}

- (unsigned)heySiriPerceptualHash
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriPerceptualHash:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"i" value:v4];
}

- (unsigned)heySiriProductType
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriProductType:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"j" value:v4];
}

- (unsigned)heySiriRandom
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriRandom:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"k" value:v4];
}

- (unsigned)heySiriSNR
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriSNR:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"l" value:v4];
}

- (NSData)mspAddressData
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFDataGetTypeID();

  return (NSData *)MEMORY[0x1F4115F30](deviceInfo, @"p", TypeID, 0);
}

- (unsigned)mspDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)mspDisplayName
{
  deviceInfo = self->_deviceInfo;
  CFTypeID TypeID = CFStringGetTypeID();

  return (NSString *)MEMORY[0x1F4115F30](deviceInfo, @"r", TypeID, 0);
}

- (unsigned)mspSubScenario
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyActionColorCode:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"naCC" value:v4];
}

- (void)setNearbyActionExtraData:(id)a3
{
}

- (void)setNearbyActionV2TargetData:(id)a3
{
}

- (void)setNearbyInfoStatusProgress:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"w" value:v4];
}

- (void)setNearbyInfoStatusTime:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"x" value:v4];
}

- (void)setNearbyInfoStatusType:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"y" value:v4];
}

- (void)setPrimaryBudSide:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"pBSd" value:v4];
}

- (int)proximityPairingPrimaryPlacement
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setProximityPairingPrimaryPlacement:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"ppPP" value:v4];
}

- (int)proximityPairingSecondaryPlacement
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setProximityPairingSecondaryPlacement:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(CBDevice *)self _setDeviceInfoKey:@"ppSP" value:v4];
}

- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  [(CBDevice *)self _setDeviceInfoKey:@"ssLC" value:v4];
}

- (void)setWatchSetupData:(id)a3
{
}

- (id)bleAdvertisementTimestampString
{
  if (qword_1EB479270 != -1) {
    dispatch_once(&qword_1EB479270, &__block_literal_global_7);
  }
  unsigned int v3 = (void *)_MergedGlobals_3;
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_bleAdvertisementTimestamp];
  id v5 = [v3 stringFromDate:v4];

  return v5;
}

uint64_t __43__CBDevice_bleAdvertisementTimestampString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_3;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (void)decryptApplePayloadWithIdentity:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  if (a4 == 22) {
    [(CBDevice *)self decryptNearbyInfoV2PayloadWithIdentity:a3 error:a5];
  }
}

- (void)decryptNearbyInfoV2PayloadWithIdentity:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  uint64_t v57 = 0;
  int v58 = &v57;
  uint64_t v59 = 0x3032000000;
  int v60 = __Block_byref_object_copy__5;
  int v61 = __Block_byref_object_dispose__5;
  id v62 = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __57__CBDevice_decryptNearbyInfoV2PayloadWithIdentity_error___block_invoke;
  v56[3] = &unk_1E5E314A0;
  v56[5] = &v57;
  v56[6] = a4;
  v56[4] = self;
  id v6 = (void (**)(void))MEMORY[0x1AD111AA0](v56);
  uint64_t v7 = [(CBDevice *)self nearbyInfoV2AuthTagData];
  uint64_t v8 = [v53 deviceIRKData];
  uint64_t v15 = v8;
  if (!self->_nearbyInfoV2EncryptedData && !self->_nearbyInfoV2EncryptedFlags) {
    goto LABEL_37;
  }
  if (!v7)
  {
    uint64_t v45 = CBErrorF(-6705, (uint64_t)"Unable to decrypt AuthTag data is not available", v9, v10, v11, v12, v13, v14, v52);
    char v46 = (void *)v58[5];
    v58[5] = v45;

    goto LABEL_37;
  }
  if (!v8)
  {
    uint64_t v47 = CBErrorF(-6705, (uint64_t)"Unable to decrypt IRK data is not available", v9, v10, v11, v12, v13, v14, v52);
    int v48 = (void *)v58[5];
    v58[5] = v47;

    goto LABEL_37;
  }
  memset(v64, 0, 32);
  id v16 = v8;
  [v16 bytes];
  [v16 length];
  id v17 = v7;
  [v17 bytes];
  [v17 length];
  CryptoHKDF();
  unsigned __int8 v55 = 0;
  if (![(CBDevice *)self decryptNearbyInfoV2PayloadPtr:&self->_nearbyInfoV2EncryptedFlags payloadLength:1 key:v64 keyLength:32 decryptedPtr:&v55])
  {
    uint64_t v49 = CBErrorF(-6777, (uint64_t)"Unable to decrypt NearbyInfoV2 sensitive flags", v18, v19, v20, v21, v22, v23, (uint64_t)v64);
LABEL_42:
    int v30 = (NSData *)v58[5];
    v58[5] = v49;
    goto LABEL_36;
  }
  int v24 = v55 & 7;
  v55 &= 7u;
  if (!v24)
  {
    uint64_t v49 = CBErrorF(-6777, (uint64_t)"Unable to verify NearbyInfoV2 sensitive flags mask", v18, v19, v20, v21, v22, v23, (uint64_t)v64);
    goto LABEL_42;
  }
  int v25 = [(CBDevice *)self nearbyInfoV2DecryptedFlags];
  int v26 = v55;
  self->_nearbyInfoV2DecryptedFlags = v55;
  if (v26)
  {
    if (v24 == v25)
    {
      if ((v26 & 1) == 0)
      {
LABEL_14:
        if ((v26 & 2) != 0)
        {
          uint64_t v27 = 14;
          if ((self->_internalFlags & 0x800) != 0)
          {
            char v28 = 32;
          }
          else
          {
            uint64_t v27 = 15;
            char v28 = 64;
          }
          if (v24 != v25)
          {
            uint64_t v29 = 9;
            if ((self->_internalFlags & 0x800) == 0) {
              uint64_t v29 = 10;
            }
            *((unsigned char *)&self->super.isa + v29) |= v28;
          }
          *((unsigned char *)&self->super.isa + v27) |= v28;
        }
        if ((v26 & 4) != 0)
        {
          if (v24 != v25) {
            self->_changedTypesInternal.bitArray[2] |= 0x20u;
          }
          self->_discoveryTypesInternal.bitArray[2] |= 0x20u;
        }
        int v30 = self->_nearbyInfoV2EncryptedData;
        if ([(NSData *)v30 length] != 2) {
          goto LABEL_36;
        }
        memset(v63, 0, sizeof(v63));
        id v31 = v16;
        [v31 bytes];
        [v31 length];
        id v32 = v17;
        [v32 bytes];
        [v32 length];
        CryptoHKDF();
        __int16 v54 = 0;
        int v30 = v30;
        if ([(CBDevice *)self decryptNearbyInfoV2PayloadPtr:[(NSData *)v30 bytes] payloadLength:[(NSData *)v30 length] key:v63 keyLength:32 decryptedPtr:&v54])
        {
          int v39 = v55;
          char v40 = v54;
          char v41 = HIBYTE(v54);
          int v42 = [(CBDevice *)self nearbyInfoV2InvitationCounter];
          int v43 = v39 << 31 >> 31;
          unsigned __int8 v44 = v43 & v40;
          if (v42 != (v43 & v40)) {
            self->_nearbyInfoV2InvitationCounter = v44;
          }
          if ([(CBDevice *)self nearbyInfoV2InvitationRouteType] == (v43 & v41))
          {
            if (v42 == v44) {
              goto LABEL_36;
            }
          }
          else
          {
            self->_unsigned int nearbyInfoV2InvitationRouteType = v43 & v41;
          }
          self->_changedTypesInternal.bitArray[2] |= 8u;
        }
        else
        {
          uint64_t v50 = CBErrorF(-6777, (uint64_t)"Unable to decrypt NearbyInfoV2 sensitive data", v33, v34, v35, v36, v37, v38, (uint64_t)v63);
          int v51 = (void *)v58[5];
          v58[5] = v50;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      self->_changedTypesInternal.bitArray[0] |= 0x10u;
      if ((v26 & 1) == 0) {
        goto LABEL_14;
      }
      self->_changedTypesInternal.bitArray[2] |= 8u;
    }
    self->_discoveryTypesInternal.bitArray[2] |= 8u;
    self->_nearbyInfoV2Flags |= 4u;
    goto LABEL_14;
  }
LABEL_37:

  v6[2](v6);
  _Block_object_dispose(&v57, 8);
}

void __57__CBDevice_decryptNearbyInfoV2PayloadWithIdentity_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2 && *(void *)(a1 + 48))
  {
    **(void **)(a1 + 48) = v2;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 688);
    *(void *)(v3 + 688) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 75) = 0;
  }
}

- (BOOL)decryptNearbyInfoV2PayloadPtr:(const char *)a3 payloadLength:(unint64_t)a4 key:(const char *)a5 keyLength:(unint64_t)a6 decryptedPtr:(void *)a7
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4 >= 2) {
    size_t v8 = 2;
  }
  else {
    size_t v8 = a4;
  }
  __int16 __src = 0;
  __memcpy_chk();
  ccaes_ecb_encrypt_mode();
  uint64_t v9 = ccecb_context_size();
  bzero((char *)v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (ccecb_init()) {
    return 0;
  }
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (cclr_aes_init() || cclr_decrypt_block()) {
    return 0;
  }
  memcpy(a7, &__src, v8);
  ccecb_context_size();
  cc_clear();
  return 1;
}

- (BOOL)discoveryTypesContainType:(int)a3
{
  if ((a3 - 34) >= 0xFFFFFFDF) {
    return (self->_discoveryTypesInternal.bitArray[(unint64_t)(a3 - 1) >> 3] >> (-(char)a3 & 7)) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isEquivalentToCBDevice:(id)a3 compareFlags:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if ((v4 & 1) == 0) {
    goto LABEL_2;
  }
  uint64_t v9 = [v6 bleAdvertisementData];
  bleAdvertisementData = self->_bleAdvertisementData;
  uint64_t v11 = v9;
  uint64_t v12 = bleAdvertisementData;
  if (v11 == v12)
  {
  }
  else
  {
    uint64_t v13 = v12;
    if ((v11 == 0) == (v12 != 0)) {
      goto LABEL_18;
    }
    int v14 = [(NSData *)v11 isEqual:v12];

    if (!v14) {
      goto LABEL_51;
    }
  }
  uint64_t v15 = [v7 bleAppleManufacturerData];
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  uint64_t v11 = v15;
  id v17 = bleAppleManufacturerData;
  if (v11 == v17)
  {

    goto LABEL_2;
  }
  uint64_t v13 = v17;
  if ((v11 == 0) == (v17 != 0))
  {
LABEL_18:

LABEL_51:
    BOOL v8 = 0;
    goto LABEL_52;
  }
  int v18 = [(NSData *)v11 isEqual:v17];

  if (!v18) {
    goto LABEL_51;
  }
LABEL_2:
  if ((v4 & 4) != 0
    && ([v7 bleRSSI] != self->_bleRSSI
     || [v7 bleChannel] != self->_bleChannel
     || self->_classicRSSI != [v7 classicRSSI]))
  {
    goto LABEL_51;
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v19 = [v7 btAddressData];
    uint64_t v20 = self->_btAddressData;
    uint64_t v21 = v20;
    if (!v19 || !v20 || ([v19 isEqual:v20] & 1) == 0)
    {
      uint64_t v22 = [v7 identifier];
      uint64_t v23 = self->_identifier;
      int v24 = v23;
      BOOL v25 = 0;
      if (v22 && v23) {
        BOOL v25 = [v22 caseInsensitiveCompare:v23] == 0;
      }
      if (v22)
      {
        if (!v25 && [(NSData *)v21 length] == 6)
        {
          [v22 UTF8String];
          BOOL v25 = 0;
          if (!TextToHardwareAddress())
          {
            uint64_t v26 = [(NSData *)v21 bytes];
            if (*(_DWORD *)v26) {
              BOOL v27 = 0;
            }
            else {
              BOOL v27 = *(unsigned __int16 *)(v26 + 4) == 0;
            }
            BOOL v25 = v27;
          }
        }
      }
      if (!v25 && v24 && [v19 length] == 6)
      {
        char v28 = v24;
        [(NSString *)v28 UTF8String];
        if (TextToHardwareAddress())
        {

LABEL_50:
          goto LABEL_51;
        }
        uint64_t v29 = [v19 bytes];
        if (*(_DWORD *)v29) {
          BOOL v30 = 0;
        }
        else {
          BOOL v30 = *(unsigned __int16 *)(v29 + 4) == 0;
        }
        int v31 = !v30;

        if (v31) {
          goto LABEL_50;
        }
      }
      else
      {

        if (!v25) {
          goto LABEL_50;
        }
      }
    }

    BOOL v8 = 1;
    goto LABEL_52;
  }
  BOOL v8 = 1;
LABEL_52:

  return v8;
}

- (void)updateWithCBDeviceIdentity:(id)a3
{
  id v10 = a3;
  if (self->_accountID)
  {
    if (self->_contactID) {
      goto LABEL_3;
    }
  }
  else
  {
    id v6 = [v10 accountID];
    if (v6) {
      objc_storeStrong((id *)&self->_accountID, v6);
    }

    if (self->_contactID)
    {
LABEL_3:
      unsigned int v4 = [v10 type] - 2;
      if (v4 > 4) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = [v10 contactID];
  if (v7) {
    objc_storeStrong((id *)&self->_contactID, v7);
  }

  unsigned int v4 = [v10 type] - 2;
  if (v4 > 4)
  {
LABEL_4:
    if (self->_idsDeviceID) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_deviceFlags |= qword_1ABA916B0[v4];
  if (self->_idsDeviceID)
  {
LABEL_5:
    if (self->_model) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_18:
  BOOL v8 = [v10 idsDeviceID];
  if (v8) {
    objc_storeStrong((id *)&self->_idsDeviceID, v8);
  }

  if (self->_model)
  {
LABEL_6:
    id v5 = [v10 name];
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  uint64_t v9 = [v10 model];
  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    self->_attributeInternalFlags |= 1u;
  }

  id v5 = [v10 name];
  if (v5) {
LABEL_7:
  }
    objc_storeStrong((id *)&self->_name, v5);
LABEL_8:
}

- (unint64_t)updateWithPowerSourceDescription:(id)a3
{
  id v4 = a3;
  CFDictionaryGetDouble();
  double v6 = v5;
  CFDictionaryGetDouble();
  double v8 = 0.0;
  if (v7 > 0.0) {
    double v8 = v6 / v7 * 100.0;
  }
  double v9 = 100.0;
  if (v8 <= 100.0) {
    double v9 = v8;
  }
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  if (CFDictionaryGetInt64())
  {
    int v11 = 768;
  }
  else
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if (v10 > 0.0) {
      int v13 = 512;
    }
    else {
      int v13 = 0;
    }
    if (Int64) {
      int v11 = 256;
    }
    else {
      int v11 = v13;
    }
  }
  int v14 = (int)v10;
  if ((int)v10 >= 100) {
    int v14 = 100;
  }
  int v15 = v11 | v14 & ~(v14 >> 31);
  if (self->_batteryInfoMain == v15)
  {

    return 0;
  }
  else
  {
    self->_unsigned int batteryInfoMain = v15;

    return 0x80000000000;
  }
}

- (void)updateWithRPIdentity:(id)a3
{
  id v10 = a3;
  if (self->_accountID)
  {
    if (self->_contactID) {
      goto LABEL_3;
    }
  }
  else
  {
    double v5 = [v10 accountID];
    if (v5) {
      objc_storeStrong((id *)&self->_accountID, v5);
    }

    if (self->_contactID)
    {
LABEL_3:
      unsigned int v4 = [v10 type] - 2;
      if (v4 > 7) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  double v6 = [v10 contactID];
  if (v6) {
    objc_storeStrong((id *)&self->_contactID, v6);
  }

  unsigned int v4 = [v10 type] - 2;
  if (v4 <= 7)
  {
LABEL_11:
    if ((0xD5u >> v4)) {
      self->_deviceFlags |= qword_1ABA916D8[v4];
    }
  }
LABEL_13:
  if (self->_idsDeviceID)
  {
    if (self->_model) {
      goto LABEL_15;
    }
  }
  else
  {
    double v8 = [v10 idsDeviceID];
    if (v8) {
      objc_storeStrong((id *)&self->_idsDeviceID, v8);
    }

    if (self->_model)
    {
LABEL_15:
      double v7 = [v10 name];
      if (!v7) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  double v9 = [v10 model];
  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    self->_attributeInternalFlags |= 1u;
  }

  double v7 = [v10 name];
  if (v7) {
LABEL_16:
  }
    objc_storeStrong((id *)&self->_name, v7);
LABEL_17:
}

- (void)updateWithSafetyAlertsSegments:(id)a3 error:(id *)a4
{
  id v40 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  unsigned int safetyAlertsSegmentSegmentsTotal = self->_safetyAlertsSegmentSegmentsTotal;
  if (self->_safetyAlertsSegmentSegmentsTotal)
  {
    int safetyAlertsVersion = self->_safetyAlertsVersion;
    unsigned __int8 v10 = 1;
    while (1)
    {
      int v11 = [NSNumber numberWithUnsignedChar:v10];
      uint64_t v12 = [v40 objectForKeyedSubscript:v11];

      if (!v12) {
        break;
      }
      if ([v12 safetyAlertsSegmentSegmentsTotal] != safetyAlertsSegmentSegmentsTotal)
      {
        if (!a4) {
          goto LABEL_21;
        }
        uint64_t v36 = "Invalid value";
        int v37 = -6737;
LABEL_19:
        CBErrorF(v37, (uint64_t)v36, v19, v20, v21, v22, v23, v24, v39);
        goto LABEL_20;
      }
      if ([v12 safetyAlertsVersion] != safetyAlertsVersion)
      {
        if (!a4) {
          goto LABEL_21;
        }
        uint64_t v36 = "Invalid version";
        int v37 = -6715;
        goto LABEL_19;
      }
      BOOL v25 = [v12 safetyAlertsSegmentAlertData];
      [v6 appendData:v25];

      uint64_t v26 = [v12 safetyAlertsSegmentSignature];
      [v7 appendData:v26];

      if (safetyAlertsSegmentSegmentsTotal < ++v10) {
        goto LABEL_7;
      }
    }
    if (!a4) {
      goto LABEL_21;
    }
    CBErrorF(-6727, (uint64_t)"Segment %d/%d not found", v13, v14, v15, v16, v17, v18, v10);
LABEL_20:
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_10;
  }
LABEL_7:
  if ((unint64_t)[v6 length] >= 0x1D)
  {
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v38 = "Invalid alert data length";
    goto LABEL_26;
  }
  if ([v7 length] == 56)
  {
    objc_storeStrong((id *)&self->_safetyAlertsAlertData, v6);
    objc_storeStrong((id *)&self->_safetyAlertsSignature, v7);
    self->_internalFlags &= ~0x4000u;
    safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
    self->_safetyAlertsSegmentAlertData = 0;

    *(_WORD *)&self->_safetyAlertsSegmentSegmentNumber = 0;
    safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
    self->_safetyAlertsSegmentServiceData = 0;

    safetyAlertsSegmentSignature = self->_safetyAlertsSegmentSignature;
    self->_safetyAlertsSegmentSignature = 0;

    goto LABEL_10;
  }
  if (a4)
  {
    uint64_t v38 = "Invalid signature length";
LABEL_26:
    CBErrorF(-6743, (uint64_t)v38, v27, v28, v29, v30, v31, v32, v39);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
}

- (void)_parseAirPlayTargetPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 < 1)
  {
    unsigned __int8 v6 = 0;
    if (!self->_airplayTargetFlags)
    {
LABEL_3:
      uint64_t v8 = 0;
      BOOL v10 = v5 > 0 && a4 - a3 > 0;
      if (!v10) {
        goto LABEL_10;
      }
LABEL_20:
      int v13 = *(unsigned __int8 *)a3++;
      unsigned __int8 v11 = v13;
      if (v13 == self->_airplayTargetConfigSeed) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else
  {
    int v7 = *(unsigned __int8 *)a3++;
    unsigned __int8 v6 = v7;
    if (v7 == self->_airplayTargetFlags) {
      goto LABEL_3;
    }
  }
  self->_airplayTargetFlags = v6;
  uint64_t v8 = 0x8000000000;
  BOOL v10 = v5 > 0 && a4 - a3 > 0;
  if (v10) {
    goto LABEL_20;
  }
LABEL_10:
  unsigned __int8 v11 = 0;
  if (self->_airplayTargetConfigSeed)
  {
LABEL_21:
    self->_airplayTargetConfigSeed = v11;
    uint64_t v8 = 0x8000000000;
  }
LABEL_22:
  if (a4 - a3 <= 3) {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    unsigned int v15 = 0;
    if (!self->_airplayTargetIPv4) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  unsigned int v14 = *(_DWORD *)a3;
  a3 += 4;
  unsigned int v15 = bswap32(v14);
  if (v15 != self->_airplayTargetIPv4)
  {
LABEL_28:
    self->_airplayTargetIPunsigned int v4 = v15;
    uint64_t v8 = 0x8000000000;
  }
LABEL_29:
  uint64_t v16 = 0;
  BOOL v17 = (v6 & 0x10) == 0;
  char v18 = !v10;
  if (v17) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0 && a4 - a3 >= 2) {
    uint64_t v16 = bswap32(*(unsigned __int16 *)a3) >> 16;
  }
  if (v16 != [(CBDevice *)self airplayTargetPort])
  {
    [(CBDevice *)self setAirplayTargetPort:v16];
    uint64_t v8 = 0x8000000000;
  }
  self->_discoveryFlags |= 0x8000000000uLL;
  self->_changeFlags |= v8;
}

- (void)_parseDSInfoPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    if (![(CBDevice *)self dsInfoVehicleState])
    {
LABEL_3:
      uint64_t v7 = 0;
      uint64_t v8 = (v5 >> 2) & 0xF;
      if (v8 == [(CBDevice *)self dsInfoVehicleConfidence]) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else
  {
    unsigned int v5 = *(unsigned __int8 *)a3;
    uint64_t v6 = v5 & 3;
    if (v6 == [(CBDevice *)self dsInfoVehicleState]) {
      goto LABEL_3;
    }
  }
  [(CBDevice *)self setDsInfoVehicleState:v6];
  uint64_t v7 = 0x800000000000000;
  uint64_t v8 = (v5 >> 2) & 0xF;
  if (v8 != [(CBDevice *)self dsInfoVehicleConfidence])
  {
LABEL_7:
    [(CBDevice *)self setDsInfoVehicleConfidence:v8];
    uint64_t v7 = 0x800000000000000;
  }
LABEL_8:
  self->_discoveryFlags |= 0x800000000000000uLL;
  self->_changeFlags |= v7;
}

- (void)_parseHeySiriPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 2)
  {
    uint64_t v8 = 0;
    if ([(CBDevice *)self heySiriPerceptualHash])
    {
LABEL_3:
      [(CBDevice *)self setHeySiriPerceptualHash:v8];
      uint64_t v9 = 0x400000000000000;
      BOOL v11 = v7 > 1 && a4 - v5 > 0;
      if (!v11) {
        goto LABEL_10;
      }
LABEL_20:
      unsigned int v14 = *(unsigned __int8 *)v5++;
      uint64_t v12 = v14;
      if (v14 == [(CBDevice *)self heySiriSNR]) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else
  {
    unsigned int v5 = a3 + 2;
    uint64_t v8 = bswap32(*(unsigned __int16 *)a3) >> 16;
    if (v8 != [(CBDevice *)self heySiriPerceptualHash]) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  BOOL v11 = v7 > 1 && a4 - v5 > 0;
  if (v11) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v12 = 0;
  if ([(CBDevice *)self heySiriSNR])
  {
LABEL_21:
    [(CBDevice *)self setHeySiriSNR:v12];
    uint64_t v9 = 0x400000000000000;
  }
LABEL_22:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v15 = 0;
    if (![(CBDevice *)self heySiriConfidence]) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  unsigned int v16 = *(unsigned __int8 *)v5++;
  uint64_t v15 = v16;
  if (v16 != [(CBDevice *)self heySiriConfidence])
  {
LABEL_28:
    [(CBDevice *)self setHeySiriConfidence:v15];
    uint64_t v9 = 0x400000000000000;
  }
LABEL_29:
  if (a4 - v5 <= 1) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v18 = 0;
    if (![(CBDevice *)self heySiriDeviceClass]) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  unsigned int v17 = *(unsigned __int16 *)v5;
  v5 += 2;
  uint64_t v18 = bswap32(v17) >> 16;
  if (v18 != [(CBDevice *)self heySiriDeviceClass])
  {
LABEL_35:
    [(CBDevice *)self setHeySiriDeviceClass:v18];
    uint64_t v9 = 0x400000000000000;
  }
LABEL_36:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v19 = 0;
    if (![(CBDevice *)self heySiriRandom]) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  unsigned int v20 = *(unsigned __int8 *)v5++;
  uint64_t v19 = v20;
  if (v20 != [(CBDevice *)self heySiriRandom])
  {
LABEL_42:
    [(CBDevice *)self setHeySiriRandom:v19];
    v9 |= 0x400000000000000uLL;
  }
LABEL_43:
  if (a4 - v5 > 0 && v11)
  {
    uint64_t v22 = *(unsigned __int8 *)v5;
    if (v22 == [(CBDevice *)self heySiriProductType]) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  uint64_t v22 = 0;
  if ([(CBDevice *)self heySiriProductType])
  {
LABEL_50:
    [(CBDevice *)self setHeySiriProductType:v22];
    v9 |= 0x400000000000000uLL;
  }
LABEL_51:
  self->_discoveryFlags |= 0x400000000000000uLL;
  self->_changeFlags |= v9;
}

- (void)_parseHomeKitV1Ptr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    unsigned int v5 = a3 + 1;
    int homeKitV1Flags = self->_homeKitV1Flags;
    int v9 = homeKitV1Flags & 0xFE | *a3 & 1;
    if (v9 == homeKitV1Flags) {
      goto LABEL_3;
    }
LABEL_12:
    self->_int homeKitV1Flags = v9;
    uint64_t v10 = 0x400000;
    BOOL v12 = v7 > 0 && a4 - v5 > 5;
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
  int v14 = self->_homeKitV1Flags;
  LOBYTE(v9) = v14 & 0xFE;
  if ((v14 & 0xFE) != v14) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v10 = 0;
  BOOL v12 = v7 > 0 && a4 - v5 > 5;
  if (!v12)
  {
LABEL_10:
    int v13 = 0;
    goto LABEL_20;
  }
LABEL_19:
  int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:6];
  v5 += 6;
LABEL_20:
  homeKitV1DeviceIDData = self->_homeKitV1DeviceIDData;
  uint64_t v32 = v13;
  unsigned int v17 = homeKitV1DeviceIDData;
  if (v32 == v17)
  {

    uint64_t v23 = v32;
  }
  else
  {
    if ((v32 == 0) != (v17 != 0))
    {
      char v18 = [(NSData *)v32 isEqual:v17];

      if (v18)
      {
        BOOL v19 = a4 - v5 > 1 && v12;
        if (v19) {
          goto LABEL_27;
        }
LABEL_36:
        unsigned __int16 v20 = 0;
        uint64_t v22 = v32;
        if (!self->_homeKitV1Category) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    else
    {
    }
    uint64_t v24 = v32;
    uint64_t v23 = self->_homeKitV1DeviceIDData;
    self->_homeKitV1DeviceIDData = v24;
    uint64_t v10 = 0x400000;
  }

  BOOL v19 = a4 - v5 > 1 && v12;
  if (!v19) {
    goto LABEL_36;
  }
LABEL_27:
  int v21 = *(unsigned __int16 *)v5;
  v5 += 2;
  unsigned __int16 v20 = v21;
  uint64_t v22 = v32;
  if (v21 != self->_homeKitV1Category)
  {
LABEL_37:
    self->_homeKitV1Category = v20;
    uint64_t v10 = 0x400000;
  }
LABEL_38:
  if (a4 - v5 <= 1) {
    BOOL v19 = 0;
  }
  if (!v19)
  {
    unsigned __int16 v25 = 0;
    if (!self->_homeKitV1StateNumber) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  int v26 = *(unsigned __int16 *)v5;
  v5 += 2;
  unsigned __int16 v25 = v26;
  if (v26 != self->_homeKitV1StateNumber)
  {
LABEL_44:
    self->_homeKitV1StateNumber = v25;
    uint64_t v10 = 0x400000;
  }
LABEL_45:
  if (a4 - v5 <= 0) {
    BOOL v19 = 0;
  }
  if (!v19)
  {
    unsigned __int8 v27 = 0;
    if (!self->_homeKitV1ConfigurationNumber) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  int v28 = *(unsigned __int8 *)v5++;
  unsigned __int8 v27 = v28;
  if (v28 != self->_homeKitV1ConfigurationNumber)
  {
LABEL_51:
    self->_homeKitV1ConfigurationNumber = v27;
    v10 |= 0x400000uLL;
  }
LABEL_52:
  if (a4 - v5 <= 0) {
    BOOL v19 = 0;
  }
  if (!v19)
  {
    unsigned __int8 v29 = 0;
    if (!self->_homeKitV1CompatibleVersion) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  int v30 = *(unsigned __int8 *)v5++;
  unsigned __int8 v29 = v30;
  if (v30 != self->_homeKitV1CompatibleVersion)
  {
LABEL_58:
    self->_homeKitV1CompatibleVersion = v29;
    v10 |= 0x400000uLL;
  }
LABEL_59:
  if (a4 - v5 <= 3) {
    BOOL v19 = 0;
  }
  if (!v19)
  {
    unsigned int v31 = 0;
    if (!self->_homeKitV1SetupHash) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  unsigned int v31 = *(_DWORD *)v5;
  if (*(_DWORD *)v5 != self->_homeKitV1SetupHash)
  {
LABEL_65:
    self->_unint64_t homeKitV1SetupHash = v31;
    v10 |= 0x400000uLL;
  }
LABEL_66:
  self->_discoveryFlags |= 0x400000uLL;
  self->_changeFlags |= v10;
}

- (void)_parseHomeKitV2Ptr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:6];
    v5 += 6;
  }
  homeKitV2AccessoryIDData = self->_homeKitV2AccessoryIDData;
  uint64_t v32 = v8;
  uint64_t v10 = homeKitV2AccessoryIDData;
  if (v32 == v10)
  {

    uint64_t v13 = 0;
    unsigned int v17 = v32;
  }
  else
  {
    if ((v32 == 0) != (v10 != 0))
    {
      char v11 = [(NSData *)v32 isEqual:v10];

      BOOL v12 = v32;
      if (v11)
      {
        uint64_t v13 = 0;
        BOOL v15 = v7 > 5 && a4 - v5 > 1;
        if (!v15) {
          goto LABEL_14;
        }
LABEL_26:
        int v20 = *(unsigned __int16 *)v5;
        v5 += 2;
        unsigned __int16 v16 = v20;
        if (v20 == self->_homeKitV2StateNumber) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    else
    {

      BOOL v12 = v32;
    }
    char v18 = v12;
    unsigned int v17 = self->_homeKitV2AccessoryIDData;
    self->_homeKitV2AccessoryIDData = v18;
    uint64_t v13 = 0x1000000;
  }

  BOOL v15 = v7 > 5 && a4 - v5 > 1;
  if (v15) {
    goto LABEL_26;
  }
LABEL_14:
  unsigned __int16 v16 = 0;
  if (self->_homeKitV2StateNumber)
  {
LABEL_27:
    self->_homeKitV2StateNumber = v16;
    uint64_t v13 = 0x1000000;
  }
LABEL_28:
  if (a4 - v5 <= 1) {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    unsigned __int16 v21 = 0;
    if (!self->_homeKitV2InstanceID) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  int v22 = *(unsigned __int16 *)v5;
  v5 += 2;
  unsigned __int16 v21 = v22;
  if (v22 != self->_homeKitV2InstanceID)
  {
LABEL_34:
    self->_homeKitV2InstanceID = v21;
    uint64_t v13 = 0x1000000;
  }
LABEL_35:
  if (a4 - v5 <= 7) {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    unint64_t v23 = 0;
    if (!self->_homeKitV2Value) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  unint64_t v24 = *(void *)v5;
  v5 += 8;
  unint64_t v23 = v24;
  if (v24 != self->_homeKitV2Value)
  {
LABEL_41:
    self->_uint64_t homeKitV2Value = v23;
    uint64_t v13 = 0x1000000;
  }
LABEL_42:
  if (a4 - v5 <= 3) {
    BOOL v15 = 0;
  }
  if (v15)
  {
    unsigned __int16 v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:4];
    homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
    unsigned __int8 v27 = v25;
    int v28 = homeKitV2AuthTagData;
    if (v27 != v28) {
      goto LABEL_46;
    }
LABEL_50:

    goto LABEL_53;
  }
  unsigned __int16 v25 = 0;
  unsigned int v31 = self->_homeKitV2AuthTagData;
  unsigned __int8 v27 = (NSData *)0;
  int v28 = v31;
  if (v27 == v28) {
    goto LABEL_50;
  }
LABEL_46:
  unsigned __int8 v29 = v28;
  if ((v27 == 0) == (v28 != 0))
  {

    goto LABEL_52;
  }
  char v30 = [(NSData *)v27 isEqual:v28];

  if ((v30 & 1) == 0)
  {
LABEL_52:
    objc_storeStrong((id *)&self->_homeKitV2AuthTagData, v25);
    v13 |= 0x1000000uLL;
  }
LABEL_53:
  self->_discoveryFlags |= 0x1000000uLL;
  self->_changeFlags |= v13;
}

- (void)_parseNearbyActionPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    char v11 = 0;
    int v48 = 0;
    id v49 = 0;
    int v50 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    unsigned int v7 = 0;
    int v10 = 0;
    id obj = 0;
    BOOL v46 = 1;
    int v47 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = a3 + 1;
  unsigned int v7 = *(unsigned __int8 *)a3;
  int64_t v8 = a4 - (a3 + 1);
  BOOL v9 = v8 > 0;
  if (v8 < 1)
  {
    int v10 = 0;
    if ((v7 & 0x80) == 0) {
      goto LABEL_4;
    }
LABEL_43:
    id obj = 0;
    BOOL v9 = 0;
    if (v8 >= 1 && a4 - v6 >= 3)
    {
      id obj = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 length:3];
      v6 += 3;
      BOOL v9 = 1;
    }
    goto LABEL_46;
  }
  uint64_t v6 = a3 + 2;
  int v10 = *((unsigned __int8 *)a3 + 1);
  if ((v7 & 0x80) != 0) {
    goto LABEL_43;
  }
LABEL_4:
  id obj = 0;
LABEL_46:
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  int v50 = 0;
  switch(v10)
  {
    case 2:
    case 37:
    case 44:
    case 45:
    case 47:
    case 85:
      if (a4 - v6 <= 0) {
        BOOL v9 = 0;
      }
      if (!v9) {
        goto LABEL_83;
      }
      uint64_t v12 = 0;
      int v50 = 0;
      unsigned int v33 = *(unsigned __int8 *)v6++;
      uint64_t v13 = v33 >> 4;
      BOOL v9 = 1;
      int v48 = 0;
      BOOL v46 = (v7 & 0x200) == 0;
      int v47 = 0;
      goto LABEL_86;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 55:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      goto LABEL_85;
    case 5:
      if (!v9) {
        goto LABEL_84;
      }
      uint64_t v40 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 length:a4 - v6];
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      int v50 = 0;
      BOOL v9 = 1;
      uint64_t v6 = a4;
      int v48 = (void *)v40;
      BOOL v46 = (v7 & 0x200) == 0;
      int v47 = 0;
      goto LABEL_86;
    case 54:
      if (a4 - v6 <= 2) {
        BOOL v9 = 0;
      }
      if (!v9) {
        goto LABEL_83;
      }
      uint64_t v13 = 0;
      uint64_t v12 = *(unsigned __int8 *)v6;
      int v50 = *((unsigned __int8 *)v6 + 1);
      int v41 = *((unsigned __int8 *)v6 + 2);
      v6 += 3;
      BOOL v9 = 1;
      int v48 = 0;
      BOOL v46 = (v7 & 0x200) == 0;
      int v47 = v41;
      goto LABEL_86;
    case 56:
      if (a4 - v6 <= 0) {
        BOOL v9 = 0;
      }
      if (!v9)
      {
LABEL_83:
        BOOL v9 = 0;
LABEL_84:
        uint64_t v13 = 0;
        uint64_t v12 = 0;
        int v50 = 0;
LABEL_85:
        int v48 = 0;
        BOOL v46 = (v7 & 0x200) == 0;
        int v47 = 0;
LABEL_86:
        id v49 = 0;
        char v11 = 0;
        if (!v9) {
          goto LABEL_90;
        }
        uint64_t v34 = (const char *)(a4 - v6);
        if (a4 - v6 < 1) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      int v50 = 0;
      int v42 = *(unsigned __int8 *)v6++;
      v7 |= v42 << 8;
      int v48 = 0;
      BOOL v46 = (v7 & 0x200) == 0;
      int v47 = 0;
      if ((v7 & 0x200) == 0) {
        goto LABEL_86;
      }
      if (a4 - v6 > 2)
      {
        id v49 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 length:3];
        v6 += 3;
        uint64_t v34 = (const char *)(a4 - v6);
        if (a4 - v6 < 1) {
          goto LABEL_89;
        }
LABEL_88:
        char v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 length:v34];
        goto LABEL_90;
      }
      id v49 = 0;
LABEL_89:
      char v11 = 0;
LABEL_90:
      uint64_t v14 = 0x80000;
      switch(v10)
      {
        case 0:
          goto LABEL_7;
        case 1:
          uint64_t v14 = 524290;
          goto LABEL_7;
        case 2:
          uint64_t v14 = 0x4000000000080000;
          goto LABEL_7;
        case 5:
          uint64_t v14 = 0x20000000080000;
          goto LABEL_7;
        case 8:
          uint64_t v14 = 532480;
          goto LABEL_7;
        case 9:
          uint64_t v14 = 524320;
          goto LABEL_7;
        case 10:
          uint64_t v14 = 524800;
          goto LABEL_7;
        case 11:
          uint64_t v14 = 524304;
          goto LABEL_7;
        case 12:
          uint64_t v14 = 524289;
          goto LABEL_7;
        case 13:
          uint64_t v14 = 528384;
          goto LABEL_7;
        case 25:
          uint64_t v14 = 526336;
          goto LABEL_7;
        case 27:
          uint64_t v14 = 525312;
          goto LABEL_7;
        case 28:
          uint64_t v14 = 524292;
          goto LABEL_7;
        case 34:
          uint64_t v14 = 268959744;
          goto LABEL_7;
        case 37:
          uint64_t v14 = 0x800000080000;
          goto LABEL_7;
        case 39:
          uint64_t v14 = 0x10000000080000;
          goto LABEL_7;
        case 44:
          self->_discoveryTypesInternal.bitArray[0] |= 0x40u;
          int v10 = 44;
          goto LABEL_6;
        case 45:
          self->_discoveryTypesInternal.bitArray[0] |= 8u;
          int v10 = 45;
          goto LABEL_6;
        case 46:
          self->_discoveryTypesInternal.bitArray[0] |= 1u;
          int v10 = 46;
          goto LABEL_6;
        case 47:
          self->_discoveryTypesInternal.bitArray[1] |= 8u;
          int v10 = 47;
          goto LABEL_6;
        case 48:
          self->_discoveryTypesInternal.bitArray[1] |= 0x80u;
          int v10 = 48;
          goto LABEL_6;
        case 54:
          uint64_t v14 = 0x1000000000080000;
          goto LABEL_7;
        case 55:
          self->_discoveryTypesInternal.bitArray[0] |= 4u;
          int v10 = 55;
          goto LABEL_6;
        case 56:
          self->_discoveryTypesInternal.bitArray[1] |= 0x40u;
          int v10 = 56;
          goto LABEL_6;
        case 83:
          self->_discoveryTypesInternal.bitArray[2] |= 4u;
          int v10 = 83;
          goto LABEL_6;
        default:
          if (!"AirDrop") {
            goto LABEL_6;
          }
          int v43 = &off_1E5E330E8;
          uint64_t v14 = 0x80000;
          break;
      }
      while (*((unsigned __int8 *)v43 - 8) != v10)
      {
        unsigned __int8 v44 = *v43;
        v43 += 3;
        if (!v44) {
          goto LABEL_7;
        }
      }
      int v45 = *((_DWORD *)v43 - 4);
      if ((v45 - 34) >= 0xFFFFFFDF) {
        self->_discoveryTypesInternal.bitArray[(unint64_t)(v45 - 1) >> 3] |= 1 << (-(char)v45 & 7);
      }
LABEL_6:
      uint64_t v14 = 0x80000;
LABEL_7:
      if ([(CBDevice *)self nearbyActionColorCode])
      {
        [(CBDevice *)self setNearbyActionColorCode:0];
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v15 = 0;
      }
      unsigned __int16 v16 = [(CBDevice *)self nearbyActionExtraData];
      id v17 = v11;
      id v18 = v16;
      if (v17 == v18)
      {

        if (v7 != self->_nearbyActionFlags) {
          goto LABEL_21;
        }
LABEL_14:
        if (v10 == self->_nearbyActionType) {
          goto LABEL_15;
        }
LABEL_22:
        self->_unsigned int nearbyActionType = v10;
        uint64_t v15 = v14;
        if ((v7 & 0x80) == 0) {
          goto LABEL_26;
        }
        goto LABEL_23;
      }
      BOOL v19 = v18;
      if ((v17 == 0) == (v18 != 0))
      {

LABEL_20:
        [(CBDevice *)self setNearbyActionExtraData:v17];
        uint64_t v15 = v14;
        if (v7 != self->_nearbyActionFlags) {
          goto LABEL_21;
        }
        goto LABEL_14;
      }
      char v20 = [v17 isEqual:v18];

      if ((v20 & 1) == 0) {
        goto LABEL_20;
      }
      if (v7 == self->_nearbyActionFlags) {
        goto LABEL_14;
      }
LABEL_21:
      self->_uint64_t nearbyActionFlags = v7;
      uint64_t v15 = v14;
      if (v10 != self->_nearbyActionType) {
        goto LABEL_22;
      }
LABEL_15:
      if ((v7 & 0x80) == 0)
      {
LABEL_26:
        int v26 = v49;
        if (v46) {
          goto LABEL_27;
        }
LABEL_58:
        nearbyActionTargetAuthTag = self->_nearbyActionTargetAuthTag;
        uint64_t v36 = v26;
        int v37 = nearbyActionTargetAuthTag;
        if (v36 != v37)
        {
          uint64_t v38 = v37;
          if ((v36 == 0) != (v37 != 0))
          {
            char v39 = [(NSData *)v36 isEqual:v37];

            if (v39)
            {
              int v26 = v49;
              if (v13 != [(CBDevice *)self nearbyActionDeviceClass]) {
                goto LABEL_68;
              }
              goto LABEL_28;
            }
          }
          else
          {
          }
          int v26 = v49;
          objc_storeStrong((id *)&self->_nearbyActionTargetAuthTag, v49);
          v15 |= v14;
          if (v13 != [(CBDevice *)self nearbyActionDeviceClass]) {
            goto LABEL_68;
          }
          goto LABEL_28;
        }

        if (v13 != [(CBDevice *)self nearbyActionDeviceClass]) {
          goto LABEL_68;
        }
LABEL_28:
        int v27 = v50;
        if (v12 == [(CBDevice *)self dsActionFlags]) {
          goto LABEL_29;
        }
        goto LABEL_69;
      }
LABEL_23:
      nearbyActionAuthTag = self->_nearbyActionAuthTag;
      int v22 = (NSData *)obj;
      unint64_t v23 = nearbyActionAuthTag;
      if (v22 == v23)
      {

        int v26 = v49;
        if (!v46) {
          goto LABEL_58;
        }
      }
      else
      {
        unint64_t v24 = v23;
        if ((v22 == 0) != (v23 != 0))
        {
          char v25 = [(NSData *)v22 isEqual:v23];

          if (v25) {
            goto LABEL_26;
          }
        }
        else
        {
        }
        objc_storeStrong((id *)&self->_nearbyActionAuthTag, obj);
        v15 |= v14;
        int v26 = v49;
        if (!v46) {
          goto LABEL_58;
        }
      }
LABEL_27:
      if (v13 == [(CBDevice *)self nearbyActionDeviceClass]) {
        goto LABEL_28;
      }
LABEL_68:
      [(CBDevice *)self setNearbyActionDeviceClass:v13];
      v15 |= v14;
      int v27 = v50;
      if (v12 == [(CBDevice *)self dsActionFlags])
      {
LABEL_29:
        if (v27 == [(CBDevice *)self dsActionMeasuredPower]) {
          goto LABEL_30;
        }
        goto LABEL_70;
      }
LABEL_69:
      [(CBDevice *)self setDsActionFlags:v12];
      v15 |= v14;
      if (v27 == [(CBDevice *)self dsActionMeasuredPower])
      {
LABEL_30:
        if (v47 == [(CBDevice *)self dsActionTieBreaker]) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
LABEL_70:
      [(CBDevice *)self setDsActionMeasuredPower:(char)v27];
      v15 |= v14;
      if (v47 != [(CBDevice *)self dsActionTieBreaker])
      {
LABEL_31:
        -[CBDevice setDsActionTieBreaker:](self, "setDsActionTieBreaker:");
        v15 |= v14;
      }
LABEL_32:
      int v28 = [(CBDevice *)self watchSetupData];
      id v29 = v48;
      id v30 = v28;
      if (v29 == v30)
      {

        goto LABEL_39;
      }
      unsigned int v31 = v30;
      if ((v29 == 0) == (v30 != 0))
      {

        goto LABEL_38;
      }
      char v32 = [v29 isEqual:v30];

      if ((v32 & 1) == 0)
      {
LABEL_38:
        [(CBDevice *)self setWatchSetupData:v29];
        v15 |= v14;
      }
LABEL_39:
      self->_discoveryFlags |= v14;
      self->_changeFlags |= v15;

      return;
    default:
      int v50 = 0;
      int v48 = 0;
      BOOL v46 = (v7 & 0x200) == 0;
      int v47 = 0;
      goto LABEL_86;
  }
}

- (void)_parseNearbyActionV2Ptr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] <= 0)
  {
LABEL_9:
    id v15 = 0;
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    BOOL v7 = (v5 & 1) == 0;
    goto LABEL_10;
  }
  id v15 = 0;
  uint64_t v6 = *((unsigned __int8 *)a3 + 1);
  BOOL v7 = (v5 & 1) == 0;
  if ((v5 & 1) != 0 && a4 - (a3 + 2) >= 3) {
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 2 length:3];
  }
  uint64_t v8 = 0;
  switch((int)v6)
  {
    case '&':
      uint64_t v8 = 0x400000000;
      break;
    case '(':
      uint64_t v8 = 0x2000000000000000;
      break;
    case ')':
      uint64_t v8 = 0x20000;
      break;
    case '2':
      uint64_t v8 = 256;
      break;
    case '3':
      uint64_t v8 = 8;
      break;
    default:
      break;
  }
LABEL_10:
  if ([(CBDevice *)self nearbyActionV2Flags] != v5)
  {
    [(CBDevice *)self setNearbyActionV2Flags:v5];
    uint64_t v9 = v8;
    if (v6 == [(CBDevice *)self nearbyActionV2Type]) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v9 = 0;
  if (v6 != [(CBDevice *)self nearbyActionV2Type])
  {
LABEL_14:
    [(CBDevice *)self setNearbyActionV2Type:v6];
    uint64_t v9 = v8;
  }
LABEL_15:
  if (v7) {
    goto LABEL_23;
  }
  int v10 = [(CBDevice *)self nearbyActionV2TargetData];
  id v11 = v15;
  id v12 = v10;
  if (v11 == v12)
  {

    goto LABEL_23;
  }
  uint64_t v13 = v12;
  if ((v11 == 0) == (v12 != 0))
  {

    goto LABEL_22;
  }
  char v14 = [v11 isEqual:v12];

  if ((v14 & 1) == 0)
  {
LABEL_22:
    [(CBDevice *)self setNearbyActionV2TargetData:v11];
    uint64_t v9 = v8;
  }
LABEL_23:
  self->_discoveryFlags |= v8;
  self->_changeFlags |= v9;
}

- (void)_parseNearbyActionNoWakePtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v6 = 0;
    goto LABEL_9;
  }
  int v6 = *(unsigned __int8 *)a3;
  if ((v6 & 1) == 0)
  {
LABEL_9:
    int v8 = 0;
    uint64_t v9 = 0;
    int v10 = 0;
    goto LABEL_14;
  }
  if (a4 - (a3 + 1) < 1)
  {
    uint64_t v9 = 0;
    int v8 = 0;
  }
  else
  {
    int v8 = *((unsigned __int8 *)a3 + 1);
    if (a4 - (a3 + 2) >= 3)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 2 length:3];
      int v10 = 0;
      if (v8)
      {
        id v11 = a3 + 5;
        if (a4 - v11 >= 1) {
          int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v11 length:1];
        }
      }
      goto LABEL_13;
    }
    uint64_t v9 = 0;
  }
  int v10 = 0;
LABEL_13:
  self->_discoveryTypesInternal.bitArray[1] |= 1u;
LABEL_14:
  self->_discoveryTypesInternal.bitArray[1] |= 2u;
  if (v6 != [(CBDevice *)self nearbyActionNoWakeType]) {
    self->_nearbyActionNoWakeType = v6;
  }
  if (v8 != [(CBDevice *)self nearbyActionNWPrecisionFindingStatus]) {
    self->_nearbyActionNWPrecisionFindingStatus = v8;
  }
  id v12 = [(CBDevice *)self nearbyActionNoWakeAuthTagData];
  id v23 = v9;
  id v13 = v12;
  if (v23 != v13)
  {
    if ((v23 == 0) != (v13 != 0))
    {
      char v14 = [v23 isEqual:v13];

      if (v14)
      {
        if ((v8 & 1) == 0) {
          goto LABEL_35;
        }
        goto LABEL_27;
      }
    }
    else
    {
    }
    id v15 = (NSData *)v23;
    nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
    self->_nearbyActionNoWakeAuthTagData = v15;

    if ((v8 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_27;
  }

  if ((v8 & 1) == 0) {
    goto LABEL_35;
  }
LABEL_27:
  id v17 = [(CBDevice *)self nearbyActionNoWakeConfigData];
  nearbyActionNoWakeConfigData = v10;
  BOOL v19 = v17;
  if (nearbyActionNoWakeConfigData == v19)
  {

LABEL_34:
    goto LABEL_35;
  }
  char v20 = v19;
  if ((nearbyActionNoWakeConfigData == 0) == (v19 != 0))
  {

    goto LABEL_33;
  }
  char v21 = [(NSData *)nearbyActionNoWakeConfigData isEqual:v19];

  if ((v21 & 1) == 0)
  {
LABEL_33:
    int v22 = nearbyActionNoWakeConfigData;
    nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
    self->_nearbyActionNoWakeConfigData = v22;
    goto LABEL_34;
  }
LABEL_35:
}

- (void)_parseProximityPairingPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    int v7 = *(unsigned __int8 *)a3++;
    int v6 = v7;
    int proximityPairingSubType = self->_proximityPairingSubType;
    if (v7 == proximityPairingSubType) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v6 = 255;
  int proximityPairingSubType = self->_proximityPairingSubType;
  if (proximityPairingSubType != 255) {
LABEL_3:
  }
    self->_int proximityPairingSubType = v6;
LABEL_4:
  BOOL v10 = v5 > 0 && a4 - a3 > 1;
  if (!v10)
  {
    unsigned int v11 = 0;
    unsigned int proximityPairingProductID = self->_proximityPairingProductID;
    if (!proximityPairingProductID) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  unsigned int v12 = *(unsigned __int16 *)a3;
  a3 += 2;
  unsigned int v11 = v12;
  unsigned int proximityPairingProductID = self->_proximityPairingProductID;
  if (v12 != proximityPairingProductID) {
LABEL_14:
  }
    self->_unsigned int proximityPairingProductID = v11;
LABEL_15:
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (v10)
  {
    switch(v6)
    {
      case 0:
        -[CBDevice _parseProximityPairingWxSetupPtr:end:](self, "_parseProximityPairingWxSetupPtr:end:", a3);
        break;
      case 1:
        -[CBDevice _parseProximityPairingWxStatusPtr:end:](self, "_parseProximityPairingWxStatusPtr:end:", a3);
        break;
      case 4:
        -[CBDevice _parseProximityPairingAirPodsMismatchedPtr:end:](self, "_parseProximityPairingAirPodsMismatchedPtr:end:", a3);
        break;
      case 5:
        -[CBDevice _parseProximityPairingObjectSetupPtr:end:](self, "_parseProximityPairingObjectSetupPtr:end:", a3);
        break;
      case 6:
        -[CBDevice _parseProximityPairingAccessoryStatusPtr:end:](self, "_parseProximityPairingAccessoryStatusPtr:end:", a3);
        break;
      case 7:
        -[CBDevice _parseProximityPairingV2Ptr:end:](self, "_parseProximityPairingV2Ptr:end:", a3);
        break;
      case 8:
        -[CBDevice _parseProximityPairingFindMyAccessoryStatusPtr:end:](self, "_parseProximityPairingFindMyAccessoryStatusPtr:end:", a3);
        break;
      case 9:
        -[CBDevice _parseProximityPairingObjectSetupPtrV2:end:](self, "_parseProximityPairingObjectSetupPtrV2:end:", a3);
        break;
      default:
        break;
    }
  }
  BOOL v15 = v11 == proximityPairingProductID && v6 == proximityPairingSubType;
  unint64_t v16 = self->_discoveryFlags;
  unint64_t v17 = v16 ^ discoveryFlags;
  uint64_t v18 = v16 & 0x1C080;
  if (v15) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v16 & 0x1C080;
  }
  unint64_t v20 = self->_changeFlags | v17 | v19;
  self->_unint64_t changeFlags = v20;
  if (v18 && (self->_internalFlags & 0x800) != 0) {
    self->_discoveryTypesInternal.bitArray[3] |= 8u;
  }
  if ((v20 & 0x1C080) != 0 && (self->_internalFlags & 0x800) != 0) {
    self->_changedTypesInternal.bitArray[3] |= 8u;
  }
}

- (void)_parseProximityPairingWxSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v7 = a4 - a3;
  int64_t v8 = a4 - a3 - 6;
  if (v8 < 1)
  {
    uint64_t v9 = 0;
    uint64_t v11 = 6;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = *((unsigned __int8 *)a3 + 6);
    uint64_t v10 = v7 - 7;
    uint64_t v11 = 7;
  }
  BOOL v12 = v8 > 0;
  id v13 = &a3[v11];
  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v28 = 0;
  [(CBDevice *)self _parseStatusOne:v9 deviceFlags:&deviceFlags primaryPlacement:(char *)&v28 + 4 secondaryPlacement:&v28];
  unint64_t v14 = 0;
  uint64_t v15 = 3;
  if (!v12 || v10 <= 2) {
    uint64_t v15 = 0;
  }
  unint64_t v16 = &v13[v15];
  uint64_t v17 = a4 - v16;
  if (v12 && v10 > 2 && v17 >= 1)
  {
    char v18 = *v16++;
    unint64_t v14 = (unint64_t)(v18 & 8) << 33;
    uint64_t v17 = a4 - v16;
  }
  unint64_t deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | v14;
  if (v17 >= 1)
  {
    uint64_t v19 = *(unsigned __int8 *)v16;
    int v20 = [(CBDevice *)self colorInfo];
    BOOL v21 = v20 != v19;
    if (v20 == v19) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v19 = 0;
  int v26 = [(CBDevice *)self colorInfo];
  BOOL v21 = v26 != 0;
  if (v26) {
LABEL_11:
  }
    -[CBDevice setColorInfo:](self, "setColorInfo:", v19, deviceFlags);
LABEL_12:
  if (deviceFlags == self->_deviceFlags)
  {
    int v22 = HIDWORD(v28);
    if (v22 == [(CBDevice *)self proximityPairingPrimaryPlacement]) {
      goto LABEL_14;
    }
  }
  else
  {
    self->_unint64_t deviceFlags = deviceFlags;
    BOOL v21 = 1;
    int v24 = HIDWORD(v28);
    if (v24 == [(CBDevice *)self proximityPairingPrimaryPlacement])
    {
LABEL_14:
      int v23 = v28;
      if (v23 == [(CBDevice *)self proximityPairingSecondaryPlacement])goto LABEL_15; {
LABEL_19:
      }
      [(CBDevice *)self setProximityPairingSecondaryPlacement:v28];
      self->_discoveryFlags |= 0x4000uLL;
      goto LABEL_20;
    }
  }
  -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v28), deviceFlags);
  BOOL v21 = 1;
  int v25 = v28;
  if (v25 != [(CBDevice *)self proximityPairingSecondaryPlacement]) {
    goto LABEL_19;
  }
LABEL_15:
  self->_discoveryFlags |= 0x4000uLL;
  if (v21) {
LABEL_20:
  }
    self->_changeFlags |= 0x80000004000uLL;
}

- (void)_parseProximityPairingWxStatusPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7;
  }
  else
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    uint64_t v9 = a4 - v5;
  }
  BOOL v10 = v7 > 0;
  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v22 = 0;
  [(CBDevice *)self _parseStatusOne:v8 deviceFlags:&deviceFlags primaryPlacement:(char *)&v22 + 4 secondaryPlacement:&v22];
  unint64_t v11 = 0;
  uint64_t v12 = 2;
  if (!v10 || v9 <= 1) {
    uint64_t v12 = 0;
  }
  if (v10 && v9 > 1)
  {
    id v13 = &v5[v12];
    if (a4 - v13 >= 1) {
      unint64_t v11 = (unint64_t)(*v13 & 8) << 33;
    }
  }
  unint64_t v14 = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | v11;
  unint64_t deviceFlags = v14;
  unint64_t v15 = self->_deviceFlags;
  BOOL v16 = v14 != v15;
  if (v14 == v15)
  {
    int v17 = HIDWORD(v22);
    if (v17 != [(CBDevice *)self proximityPairingPrimaryPlacement]) {
      goto LABEL_16;
    }
  }
  else
  {
    self->_unint64_t deviceFlags = v14;
    int v19 = HIDWORD(v22);
    if (v19 != [(CBDevice *)self proximityPairingPrimaryPlacement])
    {
LABEL_16:
      [(CBDevice *)self setProximityPairingPrimaryPlacement:HIDWORD(v22)];
      BOOL v16 = 1;
      int v20 = v22;
      if (v20 != [(CBDevice *)self proximityPairingSecondaryPlacement]) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  int v18 = v22;
  if (v18 != [(CBDevice *)self proximityPairingSecondaryPlacement])
  {
LABEL_17:
    [(CBDevice *)self setProximityPairingSecondaryPlacement:v22];
    self->_discoveryFlags |= 0x8000uLL;
    goto LABEL_18;
  }
LABEL_13:
  self->_discoveryFlags |= 0x8000uLL;
  if (v16) {
LABEL_18:
  }
    self->_changeFlags |= 0x80000008000uLL;
}

- (void)_parseStatusOne:(unsigned __int8)a3 deviceFlags:(unint64_t *)a4 primaryPlacement:(int *)a5 secondaryPlacement:(int *)a6
{
  if (self->_proximityPairingProductID == 8202)
  {
    int v6 = (a3 >> 5) & 3;
    if (v6 == 1) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  unint64_t v7 = *a4 & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 & 1) << 35);
  *a4 = v7;
  int v8 = (a3 >> 3) & 3;
  if (v8 == 1) {
    goto LABEL_8;
  }
  if (v8 != 3)
  {
    if (v8 != 2)
    {
LABEL_9:
      unint64_t v9 = *a4 & 0xFFFFFFBFFFFFFFFFLL;
      goto LABEL_11;
    }
    int v8 = 3;
LABEL_8:
    *a6 = v8;
    goto LABEL_9;
  }
  unint64_t v9 = v7 | 0x4000000000;
LABEL_11:
  *a4 = v9 & 0xFFFFFFF9FFFFFFFFLL | ((((unint64_t)(a3 & 0x20) >> 5) & 1) << 34) | ((((unint64_t)(a3 & 0x40) >> 6) & 1) << 33);
  int v6 = (a3 >> 1) & 3;
  if (v6 == 1) {
    goto LABEL_15;
  }
LABEL_12:
  if (v6 != 3)
  {
    if (v6 != 2)
    {
LABEL_16:
      *a4 = *a4 & 0xFFFFFFDEFFFFFFFFLL | ((((unint64_t)(a3 & 0x80) >> 7) & 1) << 32);
      return;
    }
    int v6 = 3;
LABEL_15:
    *a5 = v6;
    goto LABEL_16;
  }
  *a4 = *a4 & 0xFFFFFFDEFFFFFFFFLL | 0x2000000000 | ((((unint64_t)(a3 & 0x80) >> 7) & 1) << 32);
}

- (void)_parseProximityPairingAirPodsMismatchedPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    uint64_t v8 = 0;
    unint64_t v9 = (const char *)v7;
  }
  else
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    unint64_t v9 = (const char *)(a4 - v5);
  }
  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v44 = 0;
  [(CBDevice *)self _parseStatusOne:v8 deviceFlags:&deviceFlags primaryPlacement:(char *)&v44 + 4 secondaryPlacement:&v44];
  BOOL v11 = v7 > 0 && (uint64_t)v9 > 0;
  if (!v11)
  {
    char v12 = 0;
    goto LABEL_15;
  }
  char v13 = *v5++;
  char v12 = v13;
  if (v13 != -1)
  {
    if (v12 < 0)
    {
      int v14 = 256;
      goto LABEL_16;
    }
LABEL_15:
    int v14 = 512;
LABEL_16:
    int v15 = v12 & 0x7F;
    if (v15 >= 100) {
      int v15 = 100;
    }
    int v16 = v15 | v14;
    int batteryInfoCase = self->_batteryInfoCase;
    BOOL v18 = v16 != batteryInfoCase;
    if (v16 != batteryInfoCase) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  LOWORD(v16) = 0;
  BOOL v18 = self->_batteryInfoCase != 0;
  if (self->_batteryInfoCase) {
LABEL_19:
  }
    self->_int batteryInfoCase = v16;
LABEL_20:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    char v19 = 0;
    goto LABEL_27;
  }
  char v20 = *v5++;
  char v19 = v20;
  if (v20 != -1)
  {
    if (v19 < 0)
    {
      int v21 = 256;
      goto LABEL_28;
    }
LABEL_27:
    int v21 = 512;
LABEL_28:
    int v22 = v19 & 0x7F;
    if (v22 >= 100) {
      int v22 = 100;
    }
    int v23 = v22 | v21;
    if (v23 != self->_batteryInfoLeft) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  LOWORD(v23) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_31:
    self->_unsigned int batteryInfoLeft = v23;
    BOOL v18 = 1;
  }
LABEL_32:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    char v24 = 0;
    goto LABEL_39;
  }
  char v25 = *v5++;
  char v24 = v25;
  if (v25 != -1)
  {
    if (v24 < 0)
    {
      int v26 = 256;
      goto LABEL_40;
    }
LABEL_39:
    int v26 = 512;
LABEL_40:
    int v27 = v24 & 0x7F;
    if (v27 >= 100) {
      int v27 = 100;
    }
    int v28 = v26 | v27;
    if (v28 != self->_batteryInfoRight) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  LOWORD(v28) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_43:
    self->_unsigned int batteryInfoRight = v28;
    BOOL v18 = 1;
  }
LABEL_44:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    char v29 = 0;
    uint64_t v31 = 0;
    if (![(CBDevice *)self accessoryStatusLidOpenCount]) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  char v30 = *v5++;
  char v29 = v30;
  uint64_t v31 = v30 & 7;
  if (v31 != [(CBDevice *)self accessoryStatusLidOpenCount])
  {
LABEL_50:
    [(CBDevice *)self setAccessoryStatusLidOpenCount:v31];
    BOOL v18 = 1;
  }
LABEL_51:
  unint64_t deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v29 & 8) >> 3) & 1) << 36);
  if (a4 - v5 >= 1)
  {
    unsigned int v33 = *(unsigned __int8 *)v5++;
    uint64_t v32 = v33;
    if ([(CBDevice *)self colorInfo] == v33) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  uint64_t v32 = 0;
  if ([(CBDevice *)self colorInfo])
  {
LABEL_53:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v32, deviceFlags);
    BOOL v18 = 1;
  }
LABEL_54:
  uint64_t v34 = a4 - v5;
  if (a4 - v5 < 1)
  {
    unint64_t v36 = 0;
  }
  else
  {
    char v35 = *v5++;
    unint64_t v36 = (unint64_t)(v35 & 1) << 43;
  }
  unsigned int v37 = 0;
  unint64_t v38 = deviceFlags & 0xFFFFF7FFFFFFFFFFLL | v36;
  unint64_t deviceFlags = v38;
  if (v34 >= 1 && a4 - v5 - 12 >= 2) {
    unsigned int v37 = *((unsigned __int16 *)v5 + 6);
  }
  if (v37 == self->_proximityPairingOtherBudProductID)
  {
    if (v38 == self->_deviceFlags) {
      goto LABEL_64;
    }
  }
  else
  {
    self->_proximityPairingOtherBudProductID = v37;
    BOOL v18 = 1;
    if (v38 == self->_deviceFlags)
    {
LABEL_64:
      int v39 = HIDWORD(v44);
      if (v39 == [(CBDevice *)self proximityPairingPrimaryPlacement]) {
        goto LABEL_65;
      }
      goto LABEL_70;
    }
  }
  self->_unint64_t deviceFlags = v38;
  BOOL v18 = 1;
  int v41 = HIDWORD(v44);
  if (v41 == [(CBDevice *)self proximityPairingPrimaryPlacement])
  {
LABEL_65:
    int v40 = v44;
    if (v40 == [(CBDevice *)self proximityPairingSecondaryPlacement]) {
      goto LABEL_66;
    }
LABEL_71:
    [(CBDevice *)self setProximityPairingSecondaryPlacement:v44];
    self->_discoveryFlags |= 0x8000uLL;
    goto LABEL_72;
  }
LABEL_70:
  [(CBDevice *)self setProximityPairingPrimaryPlacement:HIDWORD(v44)];
  BOOL v18 = 1;
  int v42 = v44;
  if (v42 != [(CBDevice *)self proximityPairingSecondaryPlacement]) {
    goto LABEL_71;
  }
LABEL_66:
  self->_discoveryFlags |= 0x8000uLL;
  if (v18) {
LABEL_72:
  }
    self->_changeFlags |= 0x80000008000uLL;
}

- (void)_parseProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v12 = 0;
    unsigned int v7 = 0;
LABEL_9:
    int v9 = 0;
    int v10 = 0;
LABEL_11:
    int v14 = 0;
    goto LABEL_12;
  }
  unsigned int v7 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
  {
    int v12 = 0;
    goto LABEL_9;
  }
  unsigned int v8 = *((unsigned __int8 *)a3 + 1);
  int v9 = (v8 >> 2) & 3;
  int v10 = v8 & 3;
  if (a4 - a3 - 2 < 1)
  {
    int v12 = 0;
    goto LABEL_11;
  }
  BOOL v11 = a3 + 3;
  int v12 = *((unsigned __int8 *)a3 + 2);
  int64_t v13 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v13 >= 7)
  {
    int v14 = (void *)[[NSString alloc] initWithBytes:a3 + 3 length:7 encoding:4];
    BOOL v11 = a3 + 10;
    int64_t v13 = a4 - (a3 + 10);
  }
  else
  {
    int v14 = 0;
    if ((v7 & 0x10) == 0)
    {
      int v15 = 0;
      goto LABEL_13;
    }
  }
  if (v13 < 1)
  {
LABEL_12:
    int v15 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)v13 >= 0xC) {
    size_t v27 = 12;
  }
  else {
    size_t v27 = v13;
  }
  int v15 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v11, strnlen(v11, v27), 4);
LABEL_13:
  if (v7 != self->_objectSetupFlags)
  {
    self->_objectSetupFlags = v7;
    uint64_t v16 = 0x10000;
    if (v9 == self->_objectSetupBatteryPerformance) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v16 = 0;
  if (v9 != self->_objectSetupBatteryPerformance)
  {
LABEL_17:
    self->_objectSetupBatteryPerformance = v9;
    uint64_t v16 = 0x10000;
  }
LABEL_18:
  if (v10 == self->_objectSetupBatteryState)
  {
    if (v12 == self->_objectSetupColorCode) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  self->_objectSetupBatteryState = v10;
  uint64_t v16 = 0x10000;
  if (v12 != self->_objectSetupColorCode)
  {
LABEL_20:
    self->_objectSetupColorCode = v12;
    uint64_t v16 = 0x10000;
  }
LABEL_21:
  objectSetupFontCode = self->_objectSetupFontCode;
  int v28 = v14;
  BOOL v18 = objectSetupFontCode;
  if (v28 == v18)
  {

    objectSetupMessage = self->_objectSetupMessage;
    int v21 = v15;
    int v22 = objectSetupMessage;
    if (v21 == v22) {
      goto LABEL_34;
    }
  }
  else
  {
    if ((v28 == 0) != (v18 != 0))
    {
      char v19 = [(NSString *)v28 isEqual:v18];

      if (v19)
      {
        char v20 = self->_objectSetupMessage;
        int v21 = v15;
        int v22 = v20;
        if (v21 != v22) {
          goto LABEL_25;
        }
LABEL_34:

        goto LABEL_37;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_objectSetupFontCode, v14);
    v16 |= 0x10000uLL;
    int v26 = self->_objectSetupMessage;
    int v21 = v15;
    int v22 = v26;
    if (v21 == v22) {
      goto LABEL_34;
    }
  }
LABEL_25:
  int v23 = v22;
  if ((v21 == 0) == (v22 != 0))
  {

    goto LABEL_36;
  }
  char v24 = [(NSString *)v21 isEqual:v22];

  if ((v24 & 1) == 0)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_objectSetupMessage, v15);
    v16 |= 0x10000uLL;
  }
LABEL_37:
  self->_discoveryFlags |= 0x10000uLL;
  self->_changeFlags |= v16;
}

- (void)_parseProximityPairingAccessoryStatusPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    unsigned int v8 = 0;
  }
  else
  {
    int64_t v5 = a3 + 1;
    unsigned int v8 = *(unsigned __int8 *)a3;
  }
  if ((v8 & 7) != [(CBDevice *)self accessoryStatusLidOpenCount])
  {
    [(CBDevice *)self setAccessoryStatusLidOpenCount:v8 & 7];
    uint64_t v9 = 0x80000000080;
    uint64_t v10 = (v8 >> 3) & 7;
    if ([(CBDevice *)self accessoryStatusFlags] == v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v9 = 0;
  uint64_t v10 = (v8 >> 3) & 7;
  if ([(CBDevice *)self accessoryStatusFlags] != v10)
  {
LABEL_8:
    [(CBDevice *)self setAccessoryStatusFlags:v10];
    uint64_t v9 = 0x80000000080;
  }
LABEL_9:
  BOOL v12 = v7 > 0 && a4 - v5 > 0;
  if (!v12)
  {
    char v13 = 0;
    goto LABEL_20;
  }
  char v14 = *v5++;
  char v13 = v14;
  if (v14 != -1)
  {
    if (v13 < 0)
    {
      int v15 = 256;
      goto LABEL_21;
    }
LABEL_20:
    int v15 = 512;
LABEL_21:
    int v16 = v13 & 0x7F;
    if (v16 >= 100) {
      int v16 = 100;
    }
    int v17 = v16 | v15;
    if (v17 != self->_batteryInfoCase) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  LOWORD(v17) = 0;
  if (self->_batteryInfoCase)
  {
LABEL_24:
    self->_int batteryInfoCase = v17;
    uint64_t v9 = 0x80000000080;
  }
LABEL_25:
  if (a4 - v5 <= 0) {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    char v18 = 0;
    goto LABEL_32;
  }
  char v19 = *v5++;
  char v18 = v19;
  if (v19 != -1)
  {
    if (v18 < 0)
    {
      int v20 = 256;
      goto LABEL_33;
    }
LABEL_32:
    int v20 = 512;
LABEL_33:
    int v21 = v18 & 0x7F;
    if (v21 >= 100) {
      int v21 = 100;
    }
    int v22 = v20 | v21;
    if (v22 != self->_batteryInfoLeft) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  LOWORD(v22) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_36:
    self->_unsigned int batteryInfoLeft = v22;
    uint64_t v9 = 0x80000000080;
  }
LABEL_37:
  if (a4 - v5 <= 0) {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    char v23 = 0;
    goto LABEL_44;
  }
  char v24 = *v5++;
  char v23 = v24;
  if (v24 != -1)
  {
    if (v23 < 0)
    {
      int v25 = 256;
      goto LABEL_45;
    }
LABEL_44:
    int v25 = 512;
LABEL_45:
    int v26 = v23 & 0x7F;
    if (v26 >= 100) {
      int v26 = 100;
    }
    int v27 = v25 | v26;
    if (v27 != self->_batteryInfoRight) {
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  LOWORD(v27) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_48:
    self->_unsigned int batteryInfoRight = v27;
    v9 |= 0x80000000080uLL;
  }
LABEL_49:
  BOOL v28 = a4 - v5 > 2 && v12;
  if (v28)
  {
    unsigned int v29 = *(unsigned __int16 *)v5 | (*((unsigned __int8 *)v5 + 2) << 16);
    v5 += 3;
  }
  else
  {
    unsigned int v29 = 0;
  }
  char v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u.%u.%u", HIWORD(v29), BYTE1(v29), v29);
  firmwareVersion = self->_firmwareVersion;
  int v39 = v30;
  uint64_t v32 = firmwareVersion;
  if (v39 == v32)
  {
  }
  else
  {
    if ((v39 == 0) == (v32 != 0))
    {

      goto LABEL_67;
    }
    char v33 = [(NSString *)v39 isEqual:v32];

    if ((v33 & 1) == 0)
    {
LABEL_67:
      objc_storeStrong((id *)&self->_firmwareVersion, v30);
      v9 |= 0x80000000080uLL;
      if (a4 - v5 <= 0 || !v28) {
        goto LABEL_71;
      }
      goto LABEL_64;
    }
  }
  if (a4 - v5 <= 0 || !v28)
  {
LABEL_71:
    int v35 = 0;
    [(CBDevice *)self accessoryStatusOBCTime];
    if (v38 == (double)0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
LABEL_64:
  int v35 = *(unsigned __int8 *)v5;
  [(CBDevice *)self accessoryStatusOBCTime];
  if (v36 != (double)v35)
  {
LABEL_72:
    [(CBDevice *)self setAccessoryStatusOBCTime:(double)(600 * v35)];
    v9 |= 0x80000000080uLL;
  }
LABEL_73:
  self->_discoveryFlags |= 0x80uLL;
  self->_changeFlags |= v9;
}

- (void)_parseProximityPairingV2Ptr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (const char *)v7;
  }
  else
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    uint64_t v9 = (const char *)(a4 - v5);
  }
  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v38 = 0;
  [(CBDevice *)self _parseStatusOne:v8 deviceFlags:&deviceFlags primaryPlacement:(char *)&v38 + 4 secondaryPlacement:&v38];
  BOOL v11 = v7 > 0 && (uint64_t)v9 > 0;
  if (!v11)
  {
    char v12 = 0;
    goto LABEL_15;
  }
  char v13 = *v5++;
  char v12 = v13;
  if (v13 != -1)
  {
    if (v12 < 0)
    {
      int v14 = 256;
      goto LABEL_16;
    }
LABEL_15:
    int v14 = 512;
LABEL_16:
    int v15 = v12 & 0x7F;
    if (v15 >= 100) {
      int v15 = 100;
    }
    int v16 = v15 | v14;
    int batteryInfoCase = self->_batteryInfoCase;
    BOOL v18 = v16 != batteryInfoCase;
    if (v16 != batteryInfoCase) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  LOWORD(v16) = 0;
  BOOL v18 = self->_batteryInfoCase != 0;
  if (self->_batteryInfoCase) {
LABEL_19:
  }
    self->_int batteryInfoCase = v16;
LABEL_20:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    char v19 = 0;
    goto LABEL_27;
  }
  char v20 = *v5++;
  char v19 = v20;
  if (v20 != -1)
  {
    if (v19 < 0)
    {
      int v21 = 256;
      goto LABEL_28;
    }
LABEL_27:
    int v21 = 512;
LABEL_28:
    int v22 = v19 & 0x7F;
    if (v22 >= 100) {
      int v22 = 100;
    }
    int v23 = v21 | v22;
    if (v23 != self->_batteryInfoLeft) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  LOWORD(v23) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_31:
    self->_unsigned int batteryInfoLeft = v23;
    BOOL v18 = 1;
  }
LABEL_32:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    char v24 = 0;
    goto LABEL_39;
  }
  char v25 = *v5++;
  char v24 = v25;
  if (v25 != -1)
  {
    if (v24 < 0)
    {
      int v26 = 256;
      goto LABEL_40;
    }
LABEL_39:
    int v26 = 512;
LABEL_40:
    int v27 = v24 & 0x7F;
    if (v27 >= 100) {
      int v27 = 100;
    }
    int v28 = v26 | v27;
    if (v28 != self->_batteryInfoRight) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  LOWORD(v28) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_43:
    self->_unsigned int batteryInfoRight = v28;
    BOOL v18 = 1;
  }
LABEL_44:
  if (a4 - v5 <= 0) {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    char v29 = 0;
    uint64_t v31 = 0;
    if (![(CBDevice *)self accessoryStatusLidOpenCount]) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  char v30 = *v5++;
  char v29 = v30;
  uint64_t v31 = v30 & 7;
  if (v31 != [(CBDevice *)self accessoryStatusLidOpenCount])
  {
LABEL_50:
    [(CBDevice *)self setAccessoryStatusLidOpenCount:v31];
    BOOL v18 = 1;
  }
LABEL_51:
  unint64_t deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v29 & 8) >> 3) & 1) << 36);
  if (a4 - v5 >= 1)
  {
    uint64_t v32 = *(unsigned __int8 *)v5;
    if ([(CBDevice *)self colorInfo] == v32) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  uint64_t v32 = 0;
  if ([(CBDevice *)self colorInfo])
  {
LABEL_53:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v32, deviceFlags);
    BOOL v18 = 1;
  }
LABEL_54:
  if (deviceFlags == self->_deviceFlags)
  {
    int v33 = HIDWORD(v38);
    if (v33 == [(CBDevice *)self proximityPairingPrimaryPlacement]) {
      goto LABEL_56;
    }
  }
  else
  {
    self->_unint64_t deviceFlags = deviceFlags;
    BOOL v18 = 1;
    int v35 = HIDWORD(v38);
    if (v35 == [(CBDevice *)self proximityPairingPrimaryPlacement])
    {
LABEL_56:
      int v34 = v38;
      if (v34 == [(CBDevice *)self proximityPairingSecondaryPlacement])goto LABEL_57; {
LABEL_61:
      }
      [(CBDevice *)self setProximityPairingSecondaryPlacement:v38];
      self->_discoveryFlags |= 0x4000uLL;
      goto LABEL_62;
    }
  }
  -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v38), deviceFlags);
  BOOL v18 = 1;
  int v36 = v38;
  if (v36 != [(CBDevice *)self proximityPairingSecondaryPlacement]) {
    goto LABEL_61;
  }
LABEL_57:
  self->_discoveryFlags |= 0x4000uLL;
  if (v18) {
LABEL_62:
  }
    self->_changeFlags |= 0x80000004000uLL;
}

- (void)_parseProximityPairingFindMyAccessoryStatusPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1)
  {
    char v4 = *a3++;
    int v5 = v4 & 3;
    if (v5 == self->_peerStatusFlag) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  LOBYTE(v5) = 0;
  if (self->_peerStatusFlag)
  {
LABEL_3:
    self->_peerStatusFlag = v5;
    self->_changedTypesInternal.bitArray[1] |= 4u;
  }
LABEL_4:
  if (a4 - a3 < 1)
  {
    float v7 = 0.0;
  }
  else
  {
    unsigned int v6 = *(unsigned __int8 *)a3++;
    float v7 = (float)v6;
  }
  int v8 = (int)(float)(v7 / 100.0);
  if (self->_batteryInfoMain != v8)
  {
    self->_unsigned int batteryInfoMain = v8;
    self->_changedTypesInternal.bitArray[1] |= 4u;
  }
  if (a4 - a3 <= 0)
  {
    self->_transmitPowerOne = 0;
    goto LABEL_17;
  }
  self->_transmitPowerOne = *a3;
  if ((uint64_t)&a4[~(unint64_t)a3] <= 0)
  {
LABEL_17:
    self->_transmitPowerTwo = 0;
    self->_transmitPowerThree = 0;
    self->_discoveryTypesInternal.bitArray[1] |= 4u;
    return;
  }
  self->_transmitPowerTwo = a3[1];
  if (a4 - (a3 + 2) < 1) {
    self->_transmitPowerThree = 0;
  }
  else {
    self->_transmitPowerThree = a3[2];
  }
  self->_discoveryTypesInternal.bitArray[1] |= 4u;
}

- (void)_parseProximityPairingObjectSetupPtrV2:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v12 = 0;
    unsigned int v7 = 0;
LABEL_9:
    int v9 = 0;
    int v10 = 0;
LABEL_11:
    int v14 = 0;
    goto LABEL_12;
  }
  unsigned int v7 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
  {
    int v12 = 0;
    goto LABEL_9;
  }
  unsigned int v8 = *((unsigned __int8 *)a3 + 1);
  int v9 = (v8 >> 2) & 3;
  int v10 = v8 & 3;
  if (a4 - a3 - 2 < 1)
  {
    int v12 = 0;
    goto LABEL_11;
  }
  BOOL v11 = a3 + 3;
  int v12 = *((unsigned __int8 *)a3 + 2);
  int64_t v13 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v13 >= 7)
  {
    int v14 = (void *)[[NSString alloc] initWithBytes:a3 + 3 length:7 encoding:4];
    BOOL v11 = a3 + 10;
    int64_t v13 = a4 - (a3 + 10);
  }
  else
  {
    int v14 = 0;
    if ((v7 & 0x10) == 0)
    {
      int v15 = 0;
      goto LABEL_13;
    }
  }
  if (v13 < 1)
  {
LABEL_12:
    int v15 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)v13 >= 0xC) {
    size_t v27 = 12;
  }
  else {
    size_t v27 = v13;
  }
  int v15 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v11, strnlen(v11, v27), 4);
LABEL_13:
  if (v7 != self->_objectSetupFlags)
  {
    self->_objectSetupFlags = v7;
    uint64_t v16 = 0x10000;
    if (v9 == self->_objectSetupBatteryPerformance) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v16 = 0;
  if (v9 != self->_objectSetupBatteryPerformance)
  {
LABEL_17:
    self->_objectSetupBatteryPerformance = v9;
    uint64_t v16 = 0x10000;
  }
LABEL_18:
  if (v10 == self->_objectSetupBatteryState)
  {
    if (v12 == self->_objectSetupColorCode) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  self->_objectSetupBatteryState = v10;
  uint64_t v16 = 0x10000;
  if (v12 != self->_objectSetupColorCode)
  {
LABEL_20:
    self->_objectSetupColorCode = v12;
    uint64_t v16 = 0x10000;
  }
LABEL_21:
  objectSetupFontCode = self->_objectSetupFontCode;
  int v28 = v14;
  BOOL v18 = objectSetupFontCode;
  if (v28 == v18)
  {

    objectSetupMessage = self->_objectSetupMessage;
    int v21 = v15;
    int v22 = objectSetupMessage;
    if (v21 == v22) {
      goto LABEL_34;
    }
  }
  else
  {
    if ((v28 == 0) != (v18 != 0))
    {
      char v19 = [(NSString *)v28 isEqual:v18];

      if (v19)
      {
        char v20 = self->_objectSetupMessage;
        int v21 = v15;
        int v22 = v20;
        if (v21 != v22) {
          goto LABEL_25;
        }
LABEL_34:

        goto LABEL_37;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_objectSetupFontCode, v14);
    v16 |= 0x10000uLL;
    int v26 = self->_objectSetupMessage;
    int v21 = v15;
    int v22 = v26;
    if (v21 == v22) {
      goto LABEL_34;
    }
  }
LABEL_25:
  int v23 = v22;
  if ((v21 == 0) == (v22 != 0))
  {

    goto LABEL_36;
  }
  char v24 = [(NSString *)v21 isEqual:v22];

  if ((v24 & 1) == 0)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_objectSetupMessage, v15);
    v16 |= 0x10000uLL;
  }
LABEL_37:
  self->_discoveryFlags |= 0x10000uLL;
  self->_changeFlags |= v16;
}

- (void)_parseProximityServiceData:(id)a3
{
  id v4 = a3;
  int v5 = (unsigned __int8 *)[v4 bytes];
  uint64_t v6 = [v4 length];

  if (v6 <= 0)
  {
    self->_unsigned int proximityServiceSubType = 0;
    unint64_t discoveryFlags = self->_discoveryFlags;
    self->_unint64_t discoveryFlags = discoveryFlags | 0x80000000;
  }
  else
  {
    unsigned int v7 = &v5[v6];
    int v10 = *v5;
    int v9 = v5 + 1;
    int v8 = v10;
    self->_unsigned int proximityServiceSubType = v10;
    unint64_t discoveryFlags = self->_discoveryFlags;
    self->_unint64_t discoveryFlags = discoveryFlags | 0x80000000;
    if (v10 == 6)
    {
      [(CBDevice *)self _parseProximityServiceWatchSetupPtr:v9 end:v7];
    }
    else if (v8 == 1)
    {
      [(CBDevice *)self _parseProximityServiceHomeKitSetupPtr:v9 end:v7];
    }
  }
  self->_changeFlags |= self->_discoveryFlags ^ discoveryFlags;
}

- (void)_parseProximityServiceHomeKitSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 < 2)
  {
    unsigned __int16 v7 = 0;
    int v13 = 0;
    int v10 = 0;
    int v8 = 0;
    int v6 = 0;
LABEL_15:
    int v9 = 0;
LABEL_16:
    int v11 = 0;
    int v12 = 0;
    goto LABEL_17;
  }
  int v6 = *(unsigned __int16 *)a3;
  if (a4 - a3 - 2 < 2)
  {
    unsigned __int16 v7 = 0;
    goto LABEL_14;
  }
  unsigned __int16 v7 = *((_WORD *)a3 + 1);
  if (v5 - 4 < 1)
  {
LABEL_14:
    int v13 = 0;
    int v10 = 0;
    int v8 = 0;
    goto LABEL_15;
  }
  int v8 = *((unsigned __int8 *)a3 + 4);
  if (v5 - 5 < 2)
  {
    int v13 = 0;
    int v10 = 0;
    goto LABEL_15;
  }
  int v9 = *(unsigned __int16 *)(a3 + 5);
  if (v5 - 7 < 1)
  {
    int v13 = 0;
    int v10 = 0;
    goto LABEL_16;
  }
  int v10 = *((unsigned __int8 *)a3 + 7);
  if (v5 - 8 < 1)
  {
    int v13 = 0;
    goto LABEL_16;
  }
  int v11 = *((unsigned __int8 *)a3 + 8);
  if (v5 - 9 < 1)
  {
    int v13 = 0;
    int v12 = 0;
    unsigned int v14 = *((unsigned __int16 *)a3 + 1);
    if (v6 != self->_proximityServiceVendorID) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  int v12 = 0;
  int v13 = *((unsigned __int8 *)a3 + 9);
  if ((v13 & 2) == 0 || a4 - (a3 + 10) < 4)
  {
LABEL_17:
    unsigned int v14 = v7;
    if (v6 != self->_proximityServiceVendorID) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 10 length:4];
  unsigned int v14 = v7;
  if (v6 != self->_proximityServiceVendorID)
  {
LABEL_24:
    self->_proximityServiceVendorID = v6;
    uint64_t v15 = 0x100000000;
    if (self->_proximityServiceProductID == v14) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_18:
  uint64_t v15 = 0;
  if (self->_proximityServiceProductID != v14)
  {
LABEL_25:
    self->_uint64_t proximityServiceProductID = v14;
    uint64_t v15 = 0x100000000;
  }
LABEL_26:
  if (v8 == self->_proximityServiceCategory)
  {
    if (v9 == self->_proximityServicePSM) {
      goto LABEL_28;
    }
  }
  else
  {
    self->_proximityServiceCategory = v8;
    uint64_t v15 = 0x100000000;
    if (v9 == self->_proximityServicePSM)
    {
LABEL_28:
      if (v10 == self->_proximityServiceMeasuredPower) {
        goto LABEL_29;
      }
      goto LABEL_38;
    }
  }
  self->_proximityServicePSM = v9;
  uint64_t v15 = 0x100000000;
  if (v10 == self->_proximityServiceMeasuredPower)
  {
LABEL_29:
    if (v11 == self->_proximityServiceVersion) {
      goto LABEL_30;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_proximityServiceMeasuredPower = v10;
  v15 |= 0x100000000uLL;
  if (v11 == self->_proximityServiceVersion)
  {
LABEL_30:
    if (v13 == self->_proximityServiceFlags) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_39:
  self->_proximityServiceVersion = v11;
  v15 |= 0x100000000uLL;
  if (v13 != self->_proximityServiceFlags)
  {
LABEL_31:
    self->_proximityServiceFlags = v13;
    v15 |= 0x100000000uLL;
  }
LABEL_32:
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  char v19 = v12;
  int v17 = proximityServiceSetupHash;
  if (v19 == v17)
  {

    goto LABEL_44;
  }
  if ((v19 == 0) == (v17 != 0))
  {

    goto LABEL_43;
  }
  char v18 = [(NSData *)v19 isEqual:v17];

  if ((v18 & 1) == 0)
  {
LABEL_43:
    objc_storeStrong((id *)&self->_proximityServiceSetupHash, v12);
    v15 |= 0x100000000uLL;
  }
LABEL_44:
  self->_discoveryFlags |= 0x100000000uLL;
  self->_changeFlags |= v15;
}

- (void)_parseProximityServiceWatchSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4 - a3];
  int v6 = [(CBDevice *)self watchSetupData];
  id v9 = v5;
  id v7 = v6;
  if (v9 == v7)
  {

    goto LABEL_8;
  }
  if ((v9 == 0) == (v7 != 0))
  {

    goto LABEL_7;
  }
  char v8 = [v9 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    [(CBDevice *)self setWatchSetupData:v9];
    self->_changedTypesInternal.bitArray[2] |= 2u;
  }
LABEL_8:
  self->_discoveryTypesInternal.bitArray[2] |= 2u;
}

- (void)_parseSafetyAlertsSegmentServiceData:(id)a3
{
  id v4 = a3;
  int64_t v5 = (char *)[v4 bytes];
  uint64_t v6 = [v4 length];

  if (v6 >= 1)
  {
    char v7 = *v5;
    if ((*v5 & 0xF) == 1)
    {
      self->_int safetyAlertsVersion = 1;
      if ((unint64_t)v6 >= 2)
      {
        unsigned int v8 = v5[1];
        if ((v8 & 0xF) == 3 && v8 - 64 >= 0xFFFFFFD0)
        {
          self->_unsigned int safetyAlertsSegmentSegmentsTotal = 3;
          self->_safetyAlertsSegmentSegmentNumber = v8 >> 4;
          if ((unint64_t)v6 >= 5)
          {
            id v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 + 2 length:3];
            safetyAlertsAlertID = self->_safetyAlertsAlertID;
            self->_safetyAlertsAlertID = v9;

            btAddressData = self->_btAddressData;
            if (btAddressData)
            {
              if ([(NSData *)btAddressData length] == 6)
              {
                id obj = (id) [(NSData *)self->_btAddressData mutableCopy];
                int v12 = (unsigned char *)[obj mutableBytes];
                *int v12 = *v12 & 0x3F | v7 & 0xC0;
                int v13 = obj;
                if (self->_safetyAlertsSegmentSegmentNumber == self->_safetyAlertsSegmentSegmentsTotal) {
                  unint64_t v14 = 12;
                }
                else {
                  unint64_t v14 = 13;
                }
                if (v6 - 5 >= v14)
                {
                  uint64_t v15 = &v5[v6];
                  uint64_t v16 = v5 + 5;
                  [obj appendBytes:v16 length:v14];
                  int v17 = &v16[v14];
                  objc_storeStrong((id *)&self->_safetyAlertsSegmentSignature, obj);
                  if (v15 - v17 >= 1)
                  {
                    char v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:((_BYTE)v15 - (_BYTE)v17)];
                    safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
                    self->_safetyAlertsSegmentAlertData = v18;
                  }
                  self->_discoveryTypesInternal.bitArray[3] |= 0x40u;
                  int v13 = obj;
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_parseSpatialInteractionPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 0)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v14 = 0;
    unsigned int v8 = 0;
    int v12 = 0;
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  char v7 = a3 + 1;
  unsigned int v8 = *(unsigned __int8 *)a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v10 = v8 & 3;
  if ((v8 & 3) == 0) {
    goto LABEL_5;
  }
  if (a4 - v7 >= 3)
  {
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:3];
    char v7 = a3 + 4;
    [v9 addObject:v11];

    if (v10 == 1) {
      goto LABEL_5;
    }
    if (a4 - v7 >= 3)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 4 length:3];
      char v7 = a3 + 7;
      [v9 addObject:v16];

      if (v10 == 2) {
        goto LABEL_5;
      }
      if (a4 - v7 >= 3)
      {
        int v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 7 length:3];
        char v7 = a3 + 10;
        [v9 addObject:v17];

LABEL_5:
        int v12 = 0;
        if ((v8 & 8) != 0)
        {
          int v13 = (v8 >> 6) & 1;
          if ((v8 & 0x80u) == 0) {
            int v13 = 1;
          }
          if (a4 - v7 >= 5 && v13)
          {
            int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:5];
            v7 += 5;
          }
        }
        goto LABEL_17;
      }
    }
  }
  int v12 = 0;
LABEL_17:
  uint64_t v15 = 0;
  int v14 = 0;
  if (a4 - v7 >= 1 && (char)v8 < 0)
  {
    uint64_t v15 = 0;
    int v19 = *(unsigned __int8 *)v7;
    char v18 = v7 + 1;
    int v14 = v19;
    if ((v19 & 1) != 0 && a4 - v18 >= 1) {
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v18 length:1];
    }
  }
LABEL_22:
  if (v14 != self->_spatialInteractionConfigFlags) {
    self->_spatialInteractionConfigFlags = v14;
  }
  if (v8 == self->_spatialInteractionFlags)
  {
    uint64_t v20 = 0;
  }
  else
  {
    self->_spatialInteractionFlags = v8;
    uint64_t v20 = 0x40000;
  }
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  int v42 = (NSArray *)v9;
  int v22 = spatialInteractionIdentifiers;
  if (v42 == v22)
  {

    int v34 = v42;
    goto LABEL_40;
  }
  if ((v42 == 0) == (v22 != 0))
  {

    goto LABEL_39;
  }
  char v23 = [(NSArray *)v42 isEqual:v22];

  if ((v23 & 1) == 0)
  {
LABEL_39:
    int v35 = (NSArray *)[(NSArray *)v42 copy];
    int v34 = self->_spatialInteractionIdentifiers;
    self->_spatialInteractionIdentifiers = v35;
    uint64_t v20 = 0x40000;
LABEL_40:

    spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
    char v25 = v12;
    int v26 = spatialInteractionUWBConfigData;
    if (v25 != v26) {
      goto LABEL_31;
    }
LABEL_41:

    unsigned int v37 = v25;
    goto LABEL_44;
  }
  char v24 = self->_spatialInteractionUWBConfigData;
  char v25 = v12;
  int v26 = v24;
  if (v25 == v26) {
    goto LABEL_41;
  }
LABEL_31:
  size_t v27 = v26;
  if ((v25 == 0) != (v26 != 0))
  {
    char v28 = [(NSData *)v25 isEqual:v26];

    if (v28)
    {
      spatialInteractionPresenceConfigData = self->_spatialInteractionPresenceConfigData;
      char v30 = v15;
      uint64_t v31 = spatialInteractionPresenceConfigData;
      if (v30 != v31) {
        goto LABEL_34;
      }
LABEL_45:

      int v40 = v30;
LABEL_48:

      goto LABEL_49;
    }
  }
  else
  {
  }
  uint64_t v38 = v25;
  unsigned int v37 = self->_spatialInteractionUWBConfigData;
  self->_spatialInteractionUWBConfigData = v38;
  uint64_t v20 = 0x40000;
LABEL_44:

  int v39 = self->_spatialInteractionPresenceConfigData;
  char v30 = v15;
  uint64_t v31 = v39;
  if (v30 == v31) {
    goto LABEL_45;
  }
LABEL_34:
  uint64_t v32 = v31;
  if ((v30 == 0) == (v31 != 0))
  {

    goto LABEL_47;
  }
  char v33 = [(NSData *)v30 isEqual:v31];

  if ((v33 & 1) == 0)
  {
LABEL_47:
    int v41 = v30;
    int v40 = self->_spatialInteractionPresenceConfigData;
    self->_spatialInteractionPresenceConfigData = v41;
    uint64_t v20 = 0x40000;
    goto LABEL_48;
  }
LABEL_49:
  self->_discoveryFlags |= 0x40000uLL;
  self->_changeFlags |= v20;
}

- (void)_parseAirDropPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 < 18)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    int v12 = 0;
    int v10 = 0;
    int v9 = 0;
LABEL_12:
    int v11 = 0;
LABEL_13:
    unsigned int v13 = 0;
LABEL_14:
    unsigned int v14 = 0;
    goto LABEL_15;
  }
  unsigned int v8 = a3 + 1;
  int v9 = *(unsigned __int8 *)a3;
  if ((v9 & 0x40) == 0)
  {
    int v10 = 0;
    if ((v9 & 0x80) == 0) {
      goto LABEL_4;
    }
    goto LABEL_45;
  }
  if (a4 - v8 < 3)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    int v12 = 0;
    int v10 = 0;
    goto LABEL_12;
  }
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:3];
  if ((v9 & 0x80) == 0)
  {
LABEL_4:
    int v11 = 0;
    if (v5 - 8 >= 1) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_45:
  if (a4 - (a3 + 4) < 1)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    int v12 = 0;
    goto LABEL_12;
  }
  int v11 = *((unsigned __int8 *)a3 + 4);
  if (v5 - 8 < 1)
  {
LABEL_47:
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    int v12 = 0;
    goto LABEL_13;
  }
LABEL_5:
  int v12 = *((unsigned __int8 *)a3 + 8);
  if (v5 - 9 < 2)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    goto LABEL_13;
  }
  unsigned int v13 = __rev16(*(unsigned __int16 *)(a3 + 9));
  if (v5 - 11 < 2)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    goto LABEL_14;
  }
  unsigned int v25 = __rev16(*(unsigned __int16 *)(a3 + 11));
  if (v5 - 13 < 2)
  {
    unsigned int v15 = 0;
    goto LABEL_14;
  }
  unsigned int v14 = __rev16(*(unsigned __int16 *)(a3 + 13));
  if (v5 - 15 < 2)
  {
    unsigned int v15 = 0;
  }
  else
  {
    unsigned int v15 = __rev16(*(unsigned __int16 *)(a3 + 15));
    if (a4 - (a3 + 17) >= 1)
    {
      int v16 = *((unsigned __int8 *)a3 + 17);
      goto LABEL_16;
    }
  }
LABEL_15:
  int v16 = 0;
LABEL_16:
  self->_discoveryTypesInternal.bitArray[0] |= 0x80u;
  if (v9 != [(CBDevice *)self airdropFlags]) {
    self->_airdropFlags = v9;
  }
  int v17 = [(CBDevice *)self airdropTempAuthTagData];
  id v26 = v10;
  id v18 = v17;
  if (v26 == v18)
  {

    if (v11 != [(CBDevice *)self airdropModel]) {
      goto LABEL_36;
    }
LABEL_22:
    if (v12 == [(CBDevice *)self airdropVersion]) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
  if ((v26 == 0) == (v18 != 0))
  {

LABEL_35:
    int v22 = (NSData *)v26;
    airdropTempAuthTagData = self->_airdropTempAuthTagData;
    self->_airdropTempAuthTagData = v22;

    if (v11 != [(CBDevice *)self airdropModel]) {
      goto LABEL_36;
    }
    goto LABEL_22;
  }
  char v19 = [v26 isEqual:v18];

  if ((v19 & 1) == 0) {
    goto LABEL_35;
  }
  if (v11 == [(CBDevice *)self airdropModel]) {
    goto LABEL_22;
  }
LABEL_36:
  self->_uint64_t airdropModel = v11;
  if (v12 == [(CBDevice *)self airdropVersion])
  {
LABEL_23:
    if (v13 == [(CBDevice *)self airdropHash1]) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_uint64_t airdropVersion = v12;
  if (v13 == [(CBDevice *)self airdropHash1])
  {
LABEL_24:
    int v20 = [(CBDevice *)self airdropHash2];
    unsigned __int16 v21 = v25;
    if (v25 == v20) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_uint64_t airdropHash1 = v13;
  int v24 = [(CBDevice *)self airdropHash2];
  unsigned __int16 v21 = v25;
  if (v25 == v24)
  {
LABEL_25:
    if (v14 == [(CBDevice *)self airdropHash3]) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_uint64_t airdropHash2 = v21;
  if (v14 == [(CBDevice *)self airdropHash3])
  {
LABEL_26:
    if (v15 == [(CBDevice *)self airdropHash4]) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_uint64_t airdropHash3 = v14;
  if (v15 == [(CBDevice *)self airdropHash4])
  {
LABEL_27:
    if (v16 == [(CBDevice *)self airdropConfigData]) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_41:
  self->_uint64_t airdropHash4 = v15;
  if (v16 != [(CBDevice *)self airdropConfigData]) {
LABEL_28:
  }
    self->_airdropConfigData = v16;
LABEL_29:
}

- (void)_parseMicrosoftManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1 && *a3 == 3) {
    -[CBDevice _parseMicrosoftSwiftPairPtr:end:](self, "_parseMicrosoftSwiftPairPtr:end:", a3 + 1);
  }
}

- (void)_parseMicrosoftSwiftPairPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    if (v8 == [(CBDevice *)self mspSubScenario]) {
      goto LABEL_3;
    }
LABEL_27:
    [(CBDevice *)self setMspSubScenario:v8];
    uint64_t v9 = 0x80000000000000;
    int v10 = (const char *)(a4 - v5);
    if (v8 != 2) {
      goto LABEL_4;
    }
LABEL_28:
    BOOL v22 = v7 <= 0 || (uint64_t)v10 <= 0;
    int v23 = !v22;
    if (v22) {
      int v24 = (unsigned __int16 *)v5;
    }
    else {
      int v24 = (unsigned __int16 *)(v5 + 1);
    }
    unsigned int v25 = (const char *)(a4 - (const char *)v24);
    if (a4 - (const char *)v24 <= 2) {
      int v23 = 0;
    }
    if (v23 == 1)
    {
      uint64_t v19 = *v24 | (*((unsigned __int8 *)v24 + 2) << 16);
      int v24 = (unsigned __int16 *)((char *)v24 + 3);
      unsigned int v25 = (const char *)(a4 - (const char *)v24);
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v18 = 0;
    BOOL v37 = (uint64_t)v25 > 0;
    if ((v23 & v37) != 0) {
      int v20 = (const char *)v24;
    }
    else {
      int v20 = 0;
    }
    if ((v23 & v37) != 0) {
      size_t v21 = (size_t)v25;
    }
    else {
      size_t v21 = 0;
    }
    goto LABEL_79;
  }
  uint64_t v8 = 0;
  if ([(CBDevice *)self mspSubScenario]) {
    goto LABEL_27;
  }
LABEL_3:
  uint64_t v9 = 0;
  int v10 = (const char *)(a4 - v5);
  if (v8 == 2) {
    goto LABEL_28;
  }
LABEL_4:
  if (v8 != 1)
  {
    BOOL v11 = v7 <= 0 || (uint64_t)v10 <= 0;
    int v12 = !v11;
    if (v11) {
      unsigned int v13 = v5;
    }
    else {
      unsigned int v13 = v5 + 1;
    }
    BOOL v14 = a4 - v13 > 0;
    BOOL v15 = (v12 & v14) == 0;
    if ((v12 & v14) != 0) {
      int v16 = v13;
    }
    else {
      int v16 = 0;
    }
    if (v15) {
      int v17 = 0;
    }
    else {
      int v17 = (const char *)(a4 - v13);
    }
    id v18 = 0;
    uint64_t v19 = 0;
    if (v8) {
      int v20 = 0;
    }
    else {
      int v20 = v16;
    }
    if (v8) {
      size_t v21 = 0;
    }
    else {
      size_t v21 = (size_t)v17;
    }
    goto LABEL_79;
  }
  BOOL v26 = v7 <= 0 || (uint64_t)v10 <= 0;
  char v27 = !v26;
  if (v26) {
    char v28 = v5;
  }
  else {
    char v28 = v5 + 1;
  }
  unsigned __int8 v29 = v27 & (a4 - v28 > 5);
  uint64_t v30 = 6;
  if (!v29) {
    uint64_t v30 = 0;
  }
  uint64_t v31 = &v28[v30];
  if (v29) {
    id v18 = (void *)v28;
  }
  else {
    id v18 = 0;
  }
  uint64_t v32 = (const char *)(a4 - v31);
  int v33 = v29 & (a4 - v31 > 2);
  if (v33 == 1)
  {
    uint64_t v19 = *(unsigned __int16 *)v31 | (*((unsigned __int8 *)v31 + 2) << 16);
    int v34 = v31 + 3;
    int v35 = (const char *)(a4 - v34);
    BOOL v36 = a4 - v34 > 0;
    if (a4 - v34 <= 0) {
      int v20 = 0;
    }
    else {
      int v20 = v34;
    }
    if (v36) {
      size_t v21 = (size_t)v35;
    }
    else {
      size_t v21 = 0;
    }
    if (!v18) {
      goto LABEL_79;
    }
LABEL_78:
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v18 length:6];
    goto LABEL_79;
  }
  uint64_t v19 = 0;
  BOOL v38 = (uint64_t)v32 > 0;
  if ((v33 & v38) != 0) {
    int v20 = v31;
  }
  else {
    int v20 = 0;
  }
  if ((v33 & v38) != 0) {
    size_t v21 = (size_t)v32;
  }
  else {
    size_t v21 = 0;
  }
  if (v18) {
    goto LABEL_78;
  }
LABEL_79:
  int v39 = [(CBDevice *)self mspAddressData];
  id v48 = v18;
  id v40 = v39;
  if (v48 == v40)
  {

    if (v19 != [(CBDevice *)self mspDeviceClass]) {
      goto LABEL_90;
    }
LABEL_83:
    if (v20) {
      goto LABEL_84;
    }
LABEL_91:
    int v42 = 0;
    goto LABEL_92;
  }
  if ((v48 == 0) == (v40 != 0))
  {

LABEL_89:
    [(CBDevice *)self setMspAddressData:v48];
    uint64_t v9 = 0x80000000000000;
    if (v19 != [(CBDevice *)self mspDeviceClass]) {
      goto LABEL_90;
    }
    goto LABEL_83;
  }
  char v41 = [v48 isEqual:v40];

  if ((v41 & 1) == 0) {
    goto LABEL_89;
  }
  if (v19 == [(CBDevice *)self mspDeviceClass]) {
    goto LABEL_83;
  }
LABEL_90:
  [(CBDevice *)self setMspDeviceClass:v19];
  uint64_t v9 = 0x80000000000000;
  if (!v20) {
    goto LABEL_91;
  }
LABEL_84:
  int v42 = (void *)strnlen(v20, v21);
  if (v42) {
    int v42 = (void *)[[NSString alloc] initWithBytes:v20 length:v42 encoding:4];
  }
LABEL_92:
  int v43 = [(CBDevice *)self mspDisplayName];
  id v44 = v42;
  id v45 = v43;
  if (v44 == v45)
  {

    goto LABEL_99;
  }
  BOOL v46 = v45;
  if ((v44 == 0) == (v45 != 0))
  {

    goto LABEL_98;
  }
  char v47 = [v44 isEqual:v45];

  if ((v47 & 1) == 0)
  {
LABEL_98:
    [(CBDevice *)self setMspDisplayName:v44];
    uint64_t v9 = 0x80000000000000;
  }
LABEL_99:
  self->_discoveryFlags |= 0x80000000000000uLL;
  self->_changeFlags |= v9;
}

- (void)resetNearbyInfoV2SensitiveProperties
{
  self->_unsigned int nearbyInfoV2InvitationRouteType = 0;
  *(_DWORD *)&self->_nearbyInfoV2DecryptedFlags = 0;
  unsigned __int8 v2 = self->_discoveryTypesInternal.bitArray[2];
  self->_discoveryTypesInternal.bitArray[1] &= ~0x20u;
  self->_discoveryTypesInternal.bitArray[2] = v2 & 0x97;
  unsigned __int8 v3 = self->_changedTypesInternal.bitArray[2];
  self->_changedTypesInternal.bitArray[1] &= ~0x20u;
  self->_changedTypesInternal.bitArray[2] = v3 & 0x97;
}

- (id)getSpatialInteractionDeviceTimestampArrayForClientID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
    if (!spatialInteractionDeviceTimestampArrayDictionary || !self->_spatialInteractionDeviceTimestampArrayClientIDs)
    {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int64_t v7 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      self->_spatialInteractionDeviceTimestampArrayDictionary = v6;

      uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      spatialInteractionDeviceTimestampArrayClientIDs = self->_spatialInteractionDeviceTimestampArrayClientIDs;
      self->_spatialInteractionDeviceTimestampArrayClientIDs = v8;

      spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
    }
    int v10 = [(NSMutableDictionary *)spatialInteractionDeviceTimestampArrayDictionary objectForKeyedSubscript:v4];

    if (!v10)
    {
      BOOL v11 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)v11 setObject:v12 forKey:v4];

      [(NSMutableArray *)self->_spatialInteractionDeviceTimestampArrayClientIDs addObject:v4];
    }
    unsigned int v13 = [(NSMutableDictionary *)self->_spatialInteractionDeviceTimestampArrayDictionary objectForKeyedSubscript:v4];
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (void)setSpatialInteractionDeviceTimestampArrayForClientID:(id)a3 clientID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14 && v6)
  {
    if (!self->_spatialInteractionDeviceTimestampArrayDictionary
      || (int64_t v7 = self->_spatialInteractionDeviceTimestampArrayClientIDs) == 0)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
      self->_spatialInteractionDeviceTimestampArrayDictionary = v8;

      int v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      spatialInteractionDeviceTimestampArrayClientIDs = self->_spatialInteractionDeviceTimestampArrayClientIDs;
      self->_spatialInteractionDeviceTimestampArrayClientIDs = v10;

      int64_t v7 = self->_spatialInteractionDeviceTimestampArrayClientIDs;
    }
    if ((unint64_t)[(NSMutableArray *)v7 count] >= 6)
    {
      id v12 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      unsigned int v13 = [(NSMutableArray *)self->_spatialInteractionDeviceTimestampArrayClientIDs objectAtIndexedSubscript:0];
      [(NSMutableDictionary *)v12 removeObjectForKey:v13];

      [(NSMutableArray *)self->_spatialInteractionDeviceTimestampArrayClientIDs removeObjectAtIndex:0];
    }
    [(NSMutableDictionary *)self->_spatialInteractionDeviceTimestampArrayDictionary setObject:v14 forKeyedSubscript:v6];
  }
}

- (void)setAccountID:(id)a3
{
}

- (void)setAdaptiveVolumeCapability:(unsigned __int8)a3
{
  self->_adaptiveVolumeCapability = a3;
}

- (void)setAudioStreamState:(int)a3
{
  self->_unsigned int audioStreamState = a3;
}

- (void)setAutoAncCapability:(unsigned __int8)a3
{
  self->_autoAncCapability = a3;
}

- (void)setBleAddressData:(id)a3
{
}

- (void)setBleAdvertisementData:(id)a3
{
}

- (void)setCaseVersion:(id)a3
{
}

- (void)setClassicRSSI:(char)a3
{
  self->_classicRSSI = a3;
}

- (void)setControllerInfo:(id)a3
{
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_uint64_t connectedServices = a3;
}

- (void)setContactID:(id)a3
{
}

- (void)setConversationDetectCapability:(unsigned __int8)a3
{
  self->_conversationDetectCapability = a3;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_unsigned int deviceType = a3;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_unint64_t discoveryFlags = a3;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  self->_uint64_t doubleTapActionLeft = a3;
}

- (void)setDoubleTapActionRight:(char)a3
{
  self->_char doubleTapActionRight = a3;
}

- (void)setDoubleTapCapability:(char)a3
{
  self->_char doubleTapCapability = a3;
}

- (void)setEndCallCapability:(unsigned __int8)a3
{
  self->_endCallCapability = a3;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (void)setHearingAidSupport:(char)a3
{
  self->_uint64_t hearingAidSupport = a3;
}

- (void)setHearingTestSupport:(char)a3
{
  self->_uint64_t hearingTestSupport = a3;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (void)setInterval:(unsigned __int16)a3
{
  self->_interval = a3;
}

- (void)setMicrophoneMode:(char)a3
{
  self->_uint64_t microphoneMode = a3;
}

- (void)setModel:(id)a3
{
}

- (void)setMuteControlCapability:(unsigned __int8)a3
{
  self->_uint64_t muteControlCapability = a3;
}

- (void)setName:(id)a3
{
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_unsigned int primaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_unsigned int secondaryPlacement = a3;
}

- (void)setPlacementMode:(char)a3
{
  self->_char placementMode = a3;
}

- (void)setProductID:(unsigned int)a3
{
  self->_uint64_t productID = a3;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)remoteHostID
{
  return self->_remoteHostID;
}

- (void)setRemoteHostID:(id)a3
{
}

- (void)setSelectiveSpeechListeningCapability:(unsigned __int8)a3
{
  self->_selectiveSpeechListeningCapability = a3;
}

- (void)setSerialNumber:(id)a3
{
}

- (void)setSerialNumberLeft:(id)a3
{
}

- (void)setSerialNumberRight:(id)a3
{
}

- (void)setSmartRoutingMode:(char)a3
{
  self->_uint64_t smartRoutingMode = a3;
}

- (unsigned)tipiConnectionStatus
{
  return self->_tipiConnectionStatus;
}

- (void)setTipiConnectionStatus:(unsigned __int8)a3
{
  self->_unsigned int tipiConnectionStatus = a3;
}

- (NSArray)tipiDevices
{
  return self->_tipiDevices;
}

- (void)setTipiDevices:(id)a3
{
}

- (unsigned)tipiState
{
  return self->_tipiState;
}

- (void)setTipiState:(unsigned __int8)a3
{
  self->_tipiState = a3;
}

- (void)setTxAddressData:(id)a3
{
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (void)setVendorIDSource:(unsigned __int8)a3
{
  self->_int vendorIDSource = a3;
}

- (unsigned)airdropFlags
{
  return self->_airdropFlags;
}

- (void)setAirdropFlags:(unsigned __int8)a3
{
  self->_airdropFlags = a3;
}

- (void)setAirdropTempAuthTagData:(id)a3
{
}

- (unsigned)airdropModel
{
  return self->_airdropModel;
}

- (void)setAirdropModel:(unsigned __int8)a3
{
  self->_uint64_t airdropModel = a3;
}

- (unsigned)airdropVersion
{
  return self->_airdropVersion;
}

- (void)setAirdropVersion:(unsigned __int8)a3
{
  self->_uint64_t airdropVersion = a3;
}

- (unsigned)airdropHash1
{
  return self->_airdropHash1;
}

- (void)setAirdropHash1:(unsigned __int16)a3
{
  self->_uint64_t airdropHash1 = a3;
}

- (unsigned)airdropHash2
{
  return self->_airdropHash2;
}

- (void)setAirdropHash2:(unsigned __int16)a3
{
  self->_uint64_t airdropHash2 = a3;
}

- (unsigned)airdropHash3
{
  return self->_airdropHash3;
}

- (void)setAirdropHash3:(unsigned __int16)a3
{
  self->_uint64_t airdropHash3 = a3;
}

- (unsigned)airdropHash4
{
  return self->_airdropHash4;
}

- (void)setAirdropHash4:(unsigned __int16)a3
{
  self->_uint64_t airdropHash4 = a3;
}

- (unsigned)airdropConfigData
{
  return self->_airdropConfigData;
}

- (void)setAirdropConfigData:(unsigned __int8)a3
{
  self->_airdropConfigData = a3;
}

- (void)setAirplaySourceAuthTagData:(id)a3
{
}

- (unsigned)airplaySourceFlags
{
  return self->_airplaySourceFlags;
}

- (void)setAirplaySourceFlags:(unsigned __int8)a3
{
  self->_airplaySourceFlags = a3;
}

- (unsigned)airplayTargetConfigSeed
{
  return self->_airplayTargetConfigSeed;
}

- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3
{
  self->_airplayTargetConfigSeed = a3;
}

- (unsigned)airplayTargetFlags
{
  return self->_airplayTargetFlags;
}

- (void)setAirplayTargetFlags:(unsigned __int8)a3
{
  self->_airplayTargetFlags = a3;
}

- (unsigned)airplayTargetIPv4
{
  return self->_airplayTargetIPv4;
}

- (void)setAirplayTargetIPv4:(unsigned int)a3
{
  self->_airplayTargetIPid v4 = a3;
}

- (unsigned)peerStatusFlag
{
  return self->_peerStatusFlag;
}

- (void)setPeerStatusFlag:(unsigned __int8)a3
{
  self->_peerStatusFlag = a3;
}

- (unsigned)transmitPowerOne
{
  return self->_transmitPowerOne;
}

- (void)setTransmitPowerOne:(unsigned __int8)a3
{
  self->_transmitPowerOne = a3;
}

- (unsigned)transmitPowerTwo
{
  return self->_transmitPowerTwo;
}

- (void)setTransmitPowerTwo:(unsigned __int8)a3
{
  self->_transmitPowerTwo = a3;
}

- (unsigned)transmitPowerThree
{
  return self->_transmitPowerThree;
}

- (void)setTransmitPowerThree:(unsigned __int8)a3
{
  self->_transmitPowerThree = a3;
}

- (unsigned)homeKitV1Category
{
  return self->_homeKitV1Category;
}

- (void)setHomeKitV1Category:(unsigned __int16)a3
{
  self->_homeKitV1Category = a3;
}

- (unsigned)homeKitV1CompatibleVersion
{
  return self->_homeKitV1CompatibleVersion;
}

- (void)setHomeKitV1CompatibleVersion:(unsigned __int8)a3
{
  self->_homeKitV1CompatibleVersion = a3;
}

- (unsigned)homeKitV1ConfigurationNumber
{
  return self->_homeKitV1ConfigurationNumber;
}

- (void)setHomeKitV1ConfigurationNumber:(unsigned __int8)a3
{
  self->_homeKitV1ConfigurationNumber = a3;
}

- (NSData)homeKitV1DeviceIDData
{
  return self->_homeKitV1DeviceIDData;
}

- (void)setHomeKitV1DeviceIDData:(id)a3
{
}

- (unsigned)homeKitV1Flags
{
  return self->_homeKitV1Flags;
}

- (void)setHomeKitV1Flags:(unsigned __int8)a3
{
  self->_int homeKitV1Flags = a3;
}

- (unsigned)homeKitV1StateNumber
{
  return self->_homeKitV1StateNumber;
}

- (void)setHomeKitV1StateNumber:(unsigned __int16)a3
{
  self->_homeKitV1StateNumber = a3;
}

- (unsigned)homeKitV1SetupHash
{
  return self->_homeKitV1SetupHash;
}

- (void)setHomeKitV1SetupHash:(unsigned int)a3
{
  self->_unint64_t homeKitV1SetupHash = a3;
}

- (NSData)homeKitV2AccessoryIDData
{
  return self->_homeKitV2AccessoryIDData;
}

- (void)setHomeKitV2AccessoryIDData:(id)a3
{
}

- (NSData)homeKitV2AuthTagData
{
  return self->_homeKitV2AuthTagData;
}

- (void)setHomeKitV2AuthTagData:(id)a3
{
}

- (unsigned)homeKitV2InstanceID
{
  return self->_homeKitV2InstanceID;
}

- (void)setHomeKitV2InstanceID:(unsigned __int16)a3
{
  self->_homeKitV2InstanceID = a3;
}

- (unsigned)homeKitV2StateNumber
{
  return self->_homeKitV2StateNumber;
}

- (void)setHomeKitV2StateNumber:(unsigned __int16)a3
{
  self->_homeKitV2StateNumber = a3;
}

- (unint64_t)homeKitV2Value
{
  return self->_homeKitV2Value;
}

- (void)setHomeKitV2Value:(unint64_t)a3
{
  self->_uint64_t homeKitV2Value = a3;
}

- (unsigned)nearbyActionFlags
{
  return self->_nearbyActionFlags;
}

- (void)setNearbyActionFlags:(unsigned int)a3
{
  self->_uint64_t nearbyActionFlags = a3;
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  self->_unsigned int nearbyActionType = a3;
}

- (unsigned)nearbyActivityLevel
{
  return self->_nearbyActivityLevel;
}

- (void)setNearbyAuthTag:(id)a3
{
}

- (unsigned)nearbyInfoFlags
{
  return self->_nearbyInfoFlags;
}

- (void)setNearbyInfoFlags:(unsigned int)a3
{
  self->_uint64_t nearbyInfoFlags = a3;
}

- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3
{
}

- (void)setNearbyInfoV2AuthTagData:(id)a3
{
}

- (unsigned)nearbyInfoV2DecryptedFlags
{
  return self->_nearbyInfoV2DecryptedFlags;
}

- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3
{
  self->_nearbyInfoV2DecryptedFlags = a3;
}

- (void)setNearbyInfoV2Flags:(unsigned __int8)a3
{
  self->_nearbyInfoV2Flags = a3;
}

- (unsigned)nearbyInfoV2InvitationCounter
{
  return self->_nearbyInfoV2InvitationCounter;
}

- (unsigned)nearbyInfoV2InvitationTypes
{
  return self->_nearbyInfoV2InvitationTypes;
}

- (unsigned)nearbyInfoV2InvitationRouteType
{
  return self->_nearbyInfoV2InvitationRouteType;
}

- (NSData)nearbyInfoV2TempAuthTagData
{
  return self->_nearbyInfoV2TempAuthTagData;
}

- (unsigned)objectDiscoveryBatteryState
{
  return self->_objectDiscoveryBatteryState;
}

- (void)setObjectDiscoveryBatteryState:(unsigned __int8)a3
{
  self->_objectDiscoveryBatteryState = a3;
}

- (unsigned)objectDiscoveryMode
{
  return self->_objectDiscoveryMode;
}

- (void)setObjectDiscoveryMode:(unsigned __int8)a3
{
  self->_objectDiscoveryMode = a3;
}

- (NSData)objectDiscoveryNearOwnerID
{
  return self->_objectDiscoveryNearOwnerID;
}

- (void)setObjectDiscoveryNearOwnerID:(id)a3
{
}

- (unsigned)objectDiscoveryProductID
{
  return self->_objectDiscoveryProductID;
}

- (void)setObjectDiscoveryProductID:(unsigned int)a3
{
  self->_uint64_t objectDiscoveryProductID = a3;
}

- (NSData)objectDiscoveryPublicKeyData
{
  return self->_objectDiscoveryPublicKeyData;
}

- (void)setObjectDiscoveryPublicKeyData:(id)a3
{
}

- (unsigned)objectSetupBatteryPerformance
{
  return self->_objectSetupBatteryPerformance;
}

- (unsigned)objectSetupBatteryState
{
  return self->_objectSetupBatteryState;
}

- (unsigned)objectSetupColorCode
{
  return self->_objectSetupColorCode;
}

- (unsigned)objectSetupFlags
{
  return self->_objectSetupFlags;
}

- (NSString)objectSetupFontCode
{
  return self->_objectSetupFontCode;
}

- (NSString)objectSetupMessage
{
  return self->_objectSetupMessage;
}

- (void)setProximityPairingProductID:(unsigned int)a3
{
  self->_unsigned int proximityPairingProductID = a3;
}

- (unsigned)proximityPairingSubType
{
  return self->_proximityPairingSubType;
}

- (void)setProximityPairingSubType:(unsigned __int8)a3
{
  self->_int proximityPairingSubType = a3;
}

- (unsigned)proximityServiceCategory
{
  return self->_proximityServiceCategory;
}

- (void)setProximityServiceCategory:(unsigned __int8)a3
{
  self->_proximityServiceCategory = a3;
}

- (NSData)proximityServiceClassicAddress
{
  return self->_proximityServiceClassicAddress;
}

- (void)setProximityServiceClassicAddress:(id)a3
{
}

- (void)setProximityServiceData:(id)a3
{
}

- (unsigned)proximityServiceFlags
{
  return self->_proximityServiceFlags;
}

- (void)setProximityServiceFlags:(unsigned __int8)a3
{
  self->_proximityServiceFlags = a3;
}

- (char)proximityServiceMeasuredPower
{
  return self->_proximityServiceMeasuredPower;
}

- (void)setProximityServiceMeasuredPower:(char)a3
{
  self->_proximityServiceMeasuredPower = a3;
}

- (unsigned)proximityServiceProductID
{
  return self->_proximityServiceProductID;
}

- (void)setProximityServiceProductID:(unsigned int)a3
{
  self->_uint64_t proximityServiceProductID = a3;
}

- (unsigned)proximityServicePSM
{
  return self->_proximityServicePSM;
}

- (void)setProximityServicePSM:(unsigned __int16)a3
{
  self->_proximityServicePSM = a3;
}

- (NSData)proximityServiceSetupHash
{
  return self->_proximityServiceSetupHash;
}

- (void)setProximityServiceSetupHash:(id)a3
{
}

- (unsigned)proximityServiceSubType
{
  return self->_proximityServiceSubType;
}

- (void)setProximityServiceSubType:(unsigned __int8)a3
{
  self->_unsigned int proximityServiceSubType = a3;
}

- (unsigned)proximityServiceVendorID
{
  return self->_proximityServiceVendorID;
}

- (void)setProximityServiceVendorID:(unsigned __int16)a3
{
  self->_proximityServiceVendorID = a3;
}

- (unsigned)proximityServiceVersion
{
  return self->_proximityServiceVersion;
}

- (void)setProximityServiceVersion:(unsigned __int8)a3
{
  self->_proximityServiceVersion = a3;
}

- (unsigned)spatialInteractionFlags
{
  return self->_spatialInteractionFlags;
}

- (void)setSpatialInteractionFlags:(unsigned __int8)a3
{
  self->_spatialInteractionFlags = a3;
}

- (NSArray)spatialInteractionIdentifiers
{
  return self->_spatialInteractionIdentifiers;
}

- (void)setSpatialInteractionIdentifiers:(id)a3
{
}

- (void)setSpatialInteractionPresenceConfigData:(id)a3
{
}

- (NSData)spatialInteractionTokenData
{
  return self->_spatialInteractionTokenData;
}

- (void)setSpatialInteractionTokenData:(id)a3
{
}

- (NSDictionary)spatialInteractionUserInfo
{
  return self->_spatialInteractionUserInfo;
}

- (void)setSpatialInteractionUserInfo:(id)a3
{
}

- (NSData)spatialInteractionUWBConfigData
{
  return self->_spatialInteractionUWBConfigData;
}

- (void)setSpatialInteractionUWBConfigData:(id)a3
{
}

- (unsigned)spatialInteractionUWBTokenFlags
{
  return self->_spatialInteractionUWBTokenFlags;
}

- (void)setSpatialInteractionUWBTokenFlags:(unsigned int)a3
{
  self->_spatialInteractionUWBTokenFlags = a3;
}

- (unsigned)safetyAlertsAlertIndex
{
  return self->_safetyAlertsAlertIndex;
}

- (NSData)nearbyActionNoWakeAuthTagData
{
  return self->_nearbyActionNoWakeAuthTagData;
}

- (void)setNearbyActionNoWakeAuthTagData:(id)a3
{
}

- (NSData)nearbyActionNoWakeConfigData
{
  return self->_nearbyActionNoWakeConfigData;
}

- (void)setNearbyActionNoWakeConfigData:(id)a3
{
}

- (unsigned)nearbyActionNoWakeType
{
  return self->_nearbyActionNoWakeType;
}

- (void)setNearbyActionNoWakeType:(unsigned __int8)a3
{
  self->_nearbyActionNoWakeType = a3;
}

- (unsigned)nearbyActionNWPrecisionFindingStatus
{
  return self->_nearbyActionNWPrecisionFindingStatus;
}

- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3
{
  self->_nearbyActionNWPrecisionFindingStatus = a3;
}

- (void)setAttributeInternalFlags:(unsigned int)a3
{
  self->_attributeInternalFlags = a3;
}

- (unsigned)batteryInfoMain
{
  return self->_batteryInfoMain;
}

- (void)setBatteryInfoMain:(unsigned __int16)a3
{
  self->_unsigned int batteryInfoMain = a3;
}

- (unsigned)batteryInfoLeft
{
  return self->_batteryInfoLeft;
}

- (void)setBatteryInfoLeft:(unsigned __int16)a3
{
  self->_unsigned int batteryInfoLeft = a3;
}

- (unsigned)batteryInfoRight
{
  return self->_batteryInfoRight;
}

- (void)setBatteryInfoRight:(unsigned __int16)a3
{
  self->_unsigned int batteryInfoRight = a3;
}

- (unsigned)batteryInfoCase
{
  return self->_batteryInfoCase;
}

- (void)setBatteryInfoCase:(unsigned __int16)a3
{
  self->_int batteryInfoCase = a3;
}

- ($F6EBB11256A2F6C4B9D2EC026D0EABA8)callMgmtMsg
{
  return ($F6EBB11256A2F6C4B9D2EC026D0EABA8)(*(unsigned int *)&self->_callMgmtMsg.version | ((unint64_t)self->_callMgmtMsg.muteControlConfig << 32));
}

- (void)setCallMgmtMsg:(id)a3
{
  self->_callMgmtMsg = ($9586B29D337632A0E7B5229ABB253883)a3;
}

- (void)setColorInfo:(unsigned __int16)a3
{
  self->_colorInfo = a3;
}

- (NSMutableDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void)setLeAdvName:(id)a3
{
}

- (unsigned)leaVersion
{
  return self->_leaVersion;
}

- (void)setLeaVersion:(unsigned __int8 *)a3
{
  self->_leaVersion = a3;
}

- (unint64_t)oldDiscoveryFlags
{
  return self->_oldDiscoveryFlags;
}

- (void)setOldDiscoveryFlags:(unint64_t)a3
{
  self->_oldDiscoveryFlags = a3;
}

- (unsigned)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(unsigned int)a3
{
  self->_uint64_t supportedServices = a3;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_enableEPAForLEAdvertisement = a3;
}

- (NSData)nearbyActionAuthTag
{
  return self->_nearbyActionAuthTag;
}

- (void)setNearbyActionAuthTag:(id)a3
{
}

- (NSData)nearbyActionTargetAuthTag
{
  return self->_nearbyActionTargetAuthTag;
}

- (void)setNearbyActionTargetAuthTag:(id)a3
{
}

- (NSData)nearbyInfoAuthTag
{
  return self->_nearbyInfoAuthTag;
}

- (void)setNearbyInfoAuthTag:(id)a3
{
}

- (void)setNearbyInfoV2EncryptedFlags:(unsigned __int8)a3
{
  self->_nearbyInfoV2EncryptedFlags = a3;
}

- (void)setNearbyInfoV2EncryptedData:(id)a3
{
}

- (unsigned)proximityPairingOtherBudProductID
{
  return self->_proximityPairingOtherBudProductID;
}

- (void)setProximityPairingOtherBudProductID:(unsigned int)a3
{
  self->_proximityPairingOtherBudProductID = a3;
}

- (NSData)safetyAlertsSegmentAlertData
{
  return self->_safetyAlertsSegmentAlertData;
}

- (void)setSafetyAlertsSegmentAlertData:(id)a3
{
}

- (unsigned)safetyAlertsSegmentSegmentNumber
{
  return self->_safetyAlertsSegmentSegmentNumber;
}

- (void)setSafetyAlertsSegmentSegmentNumber:(unsigned __int8)a3
{
  self->_safetyAlertsSegmentSegmentNumber = a3;
}

- (unsigned)safetyAlertsSegmentSegmentsTotal
{
  return self->_safetyAlertsSegmentSegmentsTotal;
}

- (void)setSafetyAlertsSegmentSegmentsTotal:(unsigned __int8)a3
{
  self->_unsigned int safetyAlertsSegmentSegmentsTotal = a3;
}

- (void)setSafetyAlertsSegmentServiceData:(id)a3
{
}

- (NSData)safetyAlertsSegmentSignature
{
  return self->_safetyAlertsSegmentSignature;
}

- (void)setSafetyAlertsSegmentSignature:(id)a3
{
}

- (unsigned)spatialInteractionConfigFlags
{
  return self->_spatialInteractionConfigFlags;
}

- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3
{
  self->_spatialInteractionConfigFlags = a3;
}

- (unsigned)spatialInteractionPeerID
{
  return self->_spatialInteractionPeerID;
}

- (void)setSpatialInteractionPeerID:(unsigned int)a3
{
  self->_uint64_t spatialInteractionPeerID = a3;
}

- (NSMutableArray)spatialInteractionDeviceTimestampArrayClientIDs
{
  return self->_spatialInteractionDeviceTimestampArrayClientIDs;
}

- (void)setSpatialInteractionDeviceTimestampArrayClientIDs:(id)a3
{
}

- (void)setSpatialInteractionDeviceTimestampArrayDictionary:(id)a3
{
}

@end