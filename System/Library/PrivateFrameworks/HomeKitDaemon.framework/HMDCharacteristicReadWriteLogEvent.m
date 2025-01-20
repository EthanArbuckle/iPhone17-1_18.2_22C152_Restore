@interface HMDCharacteristicReadWriteLogEvent
+ (id)eventWithCharacteristicsToRead:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isLocal:(BOOL)a7 transactionId:(id)a8 isCached:(BOOL)a9 bundleId:(id)a10 userUUID:(id)a11;
+ (id)eventWithCharacteristicsToWrite:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isTimedWrite:(BOOL)a7 isLocal:(BOOL)a8 transactionId:(id)a9 bundleId:(id)a10 userUUID:(id)a11 writtenValues:(id)a12;
+ (id)eventWithStartTime:(double)a3 characteristicsToWrite:(id)a4 hmdAccessory:(id)a5 hapAccessory:(id)a6 source:(unint64_t)a7 isTimedWrite:(BOOL)a8 isLocal:(BOOL)a9 transactionId:(id)a10 bundleId:(id)a11 userUUID:(id)a12 writtenValues:(id)a13;
- (BOOL)enabledForSiriSELFLogging;
- (BOOL)hasEnabledResidents;
- (BOOL)hasSession;
- (BOOL)isAtHome;
- (BOOL)isBSSIDSameAsLastSuccessRequest;
- (BOOL)isCached;
- (BOOL)isConnectedToInternet;
- (BOOL)isCurrentDeviceAvailableResident;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isCurrentNetworkSignatureSameAsLastFailure;
- (BOOL)isCurrentNetworkSignatureSameAsLastSuccess;
- (BOOL)isDeviceAtHome;
- (BOOL)isHomeThreadCapable;
- (BOOL)isLinkFallback;
- (BOOL)isLocal;
- (BOOL)isLocalFallback;
- (BOOL)isModernTransport;
- (BOOL)isNetworkAvailable;
- (BOOL)isPrimaryResidentAvailable;
- (BOOL)isPrimaryResidentReachable;
- (BOOL)isReachable;
- (BOOL)isRemoteAccessAllowed;
- (BOOL)isRemotelyReachable;
- (BOOL)isResidentAvailable;
- (BOOL)isResidentFirstEnabled;
- (BOOL)isSSIDSameAsLastSuccessRequest;
- (BOOL)isSentOverThread;
- (BOOL)isSlowRapport;
- (BOOL)isThreadAccessory;
- (BOOL)isThreadNetworkUpInHome;
- (BOOL)isTimedWrite;
- (BOOL)isWriteOperation;
- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3;
- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3;
- (BOOL)threadPreferredNetworkExistsInHome;
- (HMDCharacteristicReadWriteLogEvent)initWithCharacteristics:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isWriteOperation:(BOOL)a7 isTimedWrite:(BOOL)a8 isLocal:(BOOL)a9 transactionId:(id)a10 isCached:(BOOL)a11 bundleId:(id)a12 userUUID:(id)a13 writtenValues:(id)a14;
- (HMDCharacteristicReadWriteLogEvent)initWithStartTime:(double)a3 characteristics:(id)a4 hmdAccessory:(id)a5 hapAccessory:(id)a6 source:(unint64_t)a7 isWriteOperation:(BOOL)a8 isTimedWrite:(BOOL)a9 isLocal:(BOOL)a10 transactionId:(id)a11 isCached:(BOOL)a12 bundleId:(id)a13 userUUID:(id)a14 writtenValues:(id)a15;
- (HMDCharacteristicReadWriteLogEventManager)readWriteLogEventManager;
- (NSArray)accessoryZoneNames;
- (NSArray)accessoryZoneUniqueIdentifiers;
- (NSArray)characteristicsInRequest;
- (NSArray)writtenValues;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSDictionary)serviceUUIDToServiceGroupName;
- (NSDictionary)serviceUUIDToServiceGroupUniqueIdentifier;
- (NSError)residentFirstError;
- (NSString)accessoryCategory;
- (NSString)accessoryIdentifier;
- (NSString)accessoryManufacturer;
- (NSString)accessoryMediaRouteID;
- (NSString)accessoryName;
- (NSString)accessoryRoomName;
- (NSString)bundleId;
- (NSString)clientMetricIdentifier;
- (NSString)coreAnalyticsEventName;
- (NSString)expectedTransport;
- (NSString)homeName;
- (NSString)primaryServiceType;
- (NSString)topSessionFailureErrorDomain;
- (NSString)transactionIdentifier;
- (NSString)transportProtocolVersion;
- (NSString)userUUID;
- (NSUUID)accessoryRoomUniqueIdentifier;
- (NSUUID)accessoryUUID;
- (NSUUID)accessoryUniqueIdentifier;
- (NSUUID)homeUniqueIdentifier;
- (SISchemaTopLevelUnionType)siriInstrumentationMessage;
- (double)timeIntervalSinceCurrentDeviceAsPrimary;
- (double)timeIntervalSinceFirstFailure;
- (double)timeIntervalSinceLastFailedRequest;
- (double)timeIntervalSinceLastSuccessfulRequest;
- (double)timeIntervalSincePrimaryChanged;
- (double)timeIntervalSincePrimaryLost;
- (id)biomeEventsRepresentationForLogObserver:(id)a3;
- (id)firstDonatableCharacteristicForLogEventObserver:(void *)a1;
- (id)microLocationMetadataForLogEventObserver:(id)a3;
- (int)btAudioTask;
- (int)btLoad;
- (int)btNonAudioTask;
- (int)transportType;
- (int64_t)accessoryCertificationStatus;
- (int64_t)bluetoothState;
- (int64_t)communicationProtocol;
- (int64_t)lastFailedLinkLayerType;
- (int64_t)lastSuccessLinkLayerType;
- (int64_t)linkLayerType;
- (int64_t)linkType;
- (int64_t)localDurationInMilliseconds;
- (int64_t)residentFirstDurationInMilliseconds;
- (int64_t)threadNetworkConnectionState;
- (int64_t)threadNetworkNodeType;
- (int64_t)topSessionFailureErrorCode;
- (unint64_t)cellularDataConnectionState;
- (unint64_t)consecutiveFailureCount;
- (unint64_t)consecutiveSuccessCount;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)ethernetConnectionState;
- (unint64_t)lastKnownLinkQuality;
- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3;
- (unint64_t)percentageOfIDSReachableResidents;
- (unint64_t)percentageOfLocalReachableResidents;
- (unint64_t)recentSessionRetries;
- (unint64_t)triggerSource;
- (unint64_t)wifiConnectionState;
- (unsigned)numAccessoriesInHome;
- (unsigned)numNonEmptyScenesInHome;
- (void)_setBtLoad;
- (void)markEndTime;
- (void)prepareForObservation;
- (void)setBluetoothState:(int64_t)a3;
- (void)setCellularDataConnectionState:(unint64_t)a3;
- (void)setConsecutiveFailureCount:(unint64_t)a3;
- (void)setConsecutiveSuccessCount:(unint64_t)a3;
- (void)setEthernetConnectionState:(unint64_t)a3;
- (void)setHasEnabledResidents:(BOOL)a3;
- (void)setIsBSSIDSameAsLastSuccessRequest:(BOOL)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setIsConnectedToInternet:(BOOL)a3;
- (void)setIsCurrentNetworkSignatureSameAsLastFailure:(BOOL)a3;
- (void)setIsCurrentNetworkSignatureSameAsLastSuccess:(BOOL)a3;
- (void)setIsDeviceAtHome:(BOOL)a3;
- (void)setIsLinkFallback:(BOOL)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setIsLocalFallback:(BOOL)a3;
- (void)setIsModernTransport:(BOOL)a3;
- (void)setIsResidentFirstEnabled:(BOOL)a3;
- (void)setIsSSIDSameAsLastSuccessRequest:(BOOL)a3;
- (void)setIsSentOverThread:(BOOL)a3;
- (void)setIsSlowRapport:(BOOL)a3;
- (void)setIsThreadNetworkUpInHome:(BOOL)a3;
- (void)setIsTimedWrite:(BOOL)a3;
- (void)setLastFailedLinkLayerType:(int64_t)a3;
- (void)setLastSuccessLinkLayerType:(int64_t)a3;
- (void)setLinkLayerType:(int64_t)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setLocalDurationInMilliseconds:(int64_t)a3;
- (void)setPercentageOfIDSReachableResidents:(unint64_t)a3;
- (void)setPercentageOfLocalReachableResidents:(unint64_t)a3;
- (void)setResidentFirstDurationInMilliseconds:(int64_t)a3;
- (void)setResidentFirstEndTime:(double)a3;
- (void)setResidentFirstError:(id)a3;
- (void)setThreadAccessory:(BOOL)a3;
- (void)setThreadNetworkConnectionState:(int64_t)a3;
- (void)setThreadNetworkNodeType:(int64_t)a3;
- (void)setThreadPreferredNetworkExistsInHome:(BOOL)a3;
- (void)setTimeIntervalSinceCurrentDeviceAsPrimary:(double)a3;
- (void)setTimeIntervalSinceFirstFailure:(double)a3;
- (void)setTimeIntervalSinceLastFailedRequest:(double)a3;
- (void)setTimeIntervalSinceLastSuccessfulRequest:(double)a3;
- (void)setTimeIntervalSincePrimaryChanged:(double)a3;
- (void)setTimeIntervalSincePrimaryLost:(double)a3;
- (void)setTransportType:(int)a3;
- (void)setWifiConnectionState:(unint64_t)a3;
@end

@implementation HMDCharacteristicReadWriteLogEvent

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  uint64_t v237 = *MEMORY[0x263EF8340];
  v225 = (id *)a3;
  if (![(HMDCharacteristicReadWriteLogEvent *)self isWriteOperation]) {
    goto LABEL_13;
  }
  v4 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
  uint64_t v5 = [v4 count];
  v6 = [(HMDCharacteristicReadWriteLogEvent *)self writtenValues];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [(HMDCharacteristicReadWriteLogEvent *)v20 characteristicsInRequest];
      v24 = NSNumber;
      v25 = [(HMDCharacteristicReadWriteLogEvent *)v20 characteristicsInRequest];
      v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      v27 = [(HMDCharacteristicReadWriteLogEvent *)v20 writtenValues];
      v28 = NSNumber;
      v29 = [(HMDCharacteristicReadWriteLogEvent *)v20 writtenValues];
      v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
      *(_DWORD *)buf = 138544386;
      v228 = v22;
      __int16 v229 = 2112;
      v230 = v23;
      __int16 v231 = 2112;
      v232 = v26;
      __int16 v233 = 2112;
      v234 = v27;
      __int16 v235 = 2112;
      id v236 = v30;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Attempting to get metadata for mismatched number of characteristics (%@) : %@, and values (%@): %@", buf, 0x34u);

LABEL_11:
    }
LABEL_12:

LABEL_13:
    v31 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_14;
  }
  v8 = [(HMDCharacteristicReadWriteLogEvent *)self homeUniqueIdentifier];

  if (!v8)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v228 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no home data for event", buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (self)
  {
    id v9 = objc_alloc(MEMORY[0x263F08798]);
    v10 = [(HMMDatedHomeLogEvent *)self startDate];
    v11 = [(HMMDatedHomeLogEvent *)self endDate];
    v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

    id v13 = objc_alloc(MEMORY[0x263F2A7C0]);
    v14 = [(HMDCharacteristicReadWriteLogEvent *)self homeUniqueIdentifier];
    v15 = [v14 UUIDString];
    BOOL v16 = [(HMDCharacteristicReadWriteLogEvent *)self isAtHome];
    unint64_t v17 = [(HMDCharacteristicReadWriteLogEvent *)self triggerSource];
    if (v17 > 9) {
      v18 = @"Unknown";
    }
    else {
      v18 = off_264A1BC48[v17];
    }
    v33 = v18;
    v34 = [(HMDCharacteristicReadWriteLogEvent *)self bundleId];
    v35 = [(HMDCharacteristicReadWriteLogEvent *)self clientMetricIdentifier];
    if (v35)
    {
      v219 = (void *)[v13 initWithDateInterval:v12 homeUniqueIdentifier:v15 homeOccupancy:v16 source:v33 clientName:v34 eventCorrelationIdentifier:v35];
    }
    else
    {
      v36 = [MEMORY[0x263F08C38] UUID];
      uint64_t v37 = [v36 UUIDString];
      v38 = v13;
      v39 = v12;
      v40 = (void *)v37;
      v219 = (void *)[v38 initWithDateInterval:v39 homeUniqueIdentifier:v15 homeOccupancy:v16 source:v33 clientName:v34 eventCorrelationIdentifier:v37];

      v12 = v39;
    }
  }
  else
  {
    v219 = 0;
  }
  v41 = (void *)MEMORY[0x263EFF980];
  v42 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
  v220 = objc_msgSend(v41, "arrayWithCapacity:", objc_msgSend(v42, "count"));

  v43 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    unint64_t v45 = 0;
    uint64_t v182 = *MEMORY[0x263F0C518];
    uint64_t v181 = *MEMORY[0x263F0C5A0];
    uint64_t v178 = *MEMORY[0x263F0C290];
    v222 = self;
    do
    {
      v46 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
      v47 = [v46 objectAtIndexedSubscript:v45];

      v48 = [v47 service];
      v49 = [v48 type];
      v226 = v47;
      uint64_t v50 = [v47 type];
      v51 = (void *)v50;
      if (v49)
      {
        if (v50)
        {
          id v52 = v49;
          id v53 = v51;
          if (v225)
          {
            v223 = v53;
            id WeakRetained = objc_loadWeakRetained(v225 + 2);
            if (WeakRetained)
            {
              v55 = WeakRetained;
              v56 = v51;
              v57 = [WeakRetained hapMetadataForBiomeLogEventObserver:v225];
              if (([v52 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"] & 1) != 0
                || ([v57 shouldFilterServiceOfTypeFromApp:v52] & 1) == 0)
              {
                v58 = v52;
                char v59 = [v57 isStandardServiceType:v52];
              }
              else
              {
                v58 = v52;
                char v59 = 0;
              }
              if ([v57 shouldFilterCharacteristicOfTypeFromApp:v223]) {
                char v70 = 0;
              }
              else {
                char v70 = [v57 isStandardCharacteristicType:v223];
              }
              char v76 = v59 & v70;

              v77 = v58;
              v51 = v56;
              if (v76)
              {
                v78 = [(HMDCharacteristicReadWriteLogEvent *)self writtenValues];
                v79 = [v78 objectAtIndexedSubscript:v45];

                v221 = v79;
                if ([v77 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"])
                {
                  id v80 = v223;
                  id v81 = v79;
                  id v224 = v219;
                  if (!self)
                  {
                    v132 = 0;
                    goto LABEL_113;
                  }
                  v82 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryMediaRouteID];

                  id v218 = v80;
                  if (!v82)
                  {
                    id v125 = v81;
                    v126 = (void *)MEMORY[0x230FBD990]();
                    v127 = self;
                    v128 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v129 = v49;
                      v131 = v130 = v48;
                      *(_DWORD *)buf = 138543362;
                      v228 = v131;
                      _os_log_impl(&dword_22F52A000, v128, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to log event metadata to biome, smart speaker event is missing media profile", buf, 0xCu);

                      v48 = v130;
                      v49 = v129;
                      v79 = v221;
                    }

                    v132 = 0;
                    id v81 = v125;
                    goto LABEL_112;
                  }
                  v216 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
                  v214 = v81;
                  if ([v80 isEqualToString:v182])
                  {
                    id v83 = v81;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      v84 = v83;
                    }
                    else {
                      v84 = 0;
                    }
                    id v85 = v84;

                    if (v85)
                    {
                      unint64_t v86 = [v85 integerValue];
                      if (v86 >= 3)
                      {
                        v87 = v48;
                        v88 = (void *)MEMORY[0x230FBD990]();
                        v89 = self;
                        v90 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                        {
                          v91 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138543362;
                          v228 = v91;
                          v92 = v90;
                          v93 = "%{public}@Unable to log event metadata to biome, unknown playback state not eligible for donation";
                          goto LABEL_95;
                        }
                        goto LABEL_96;
                      }
                      v145 = [NSNumber numberWithInteger:qword_2303E4970[v86]];
                      v135 = v216;
                      [v216 setObject:v145 forKeyedSubscript:@"playback-state"];

LABEL_98:
                      v179 = v51;
                      v180 = v49;

LABEL_99:
                      id v209 = objc_alloc(MEMORY[0x263F2A7C8]);
                      v213 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryUniqueIdentifier];
                      v203 = [v213 UUIDString];
                      v207 = (void *)[v135 copy];
                      v205 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryMediaRouteID];
                      v201 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneUniqueIdentifiers];
                      v211 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomUniqueIdentifier];
                      v199 = [v211 UUIDString];
                      v146 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryName];
                      v147 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomName];
                      v148 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneNames];
                      [(HMDCharacteristicReadWriteLogEvent *)self homeName];
                      v150 = v149 = v48;
                      v132 = (void *)[v209 initWithBase:v224 accessoryUniqueIdentifier:v203 accessoryStateString:MEMORY[0x263EFFA78] accessoryStateNumber:v207 accessoryStateData:MEMORY[0x263EFFA78] accessoryMediaRouteIdentifier:v205 zoneUniqueIdentifiers:v201 roomUniqueIdentifier:v199 accessoryName:v146 roomName:v147 zoneNames:v148 homeName:v150];

                      v48 = v149;
                      v79 = v221;

                      v151 = v216;
                      v51 = v179;
                      v49 = v180;
                      id v81 = v214;
LABEL_111:

LABEL_112:
                      id v80 = v218;
LABEL_113:

                      objc_msgSend(v220, "na_safeAddObject:", v132);
                      goto LABEL_114;
                    }
                    v87 = v48;
                    v88 = (void *)MEMORY[0x230FBD990]();
                    v144 = self;
                    v90 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                    {
                      v91 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543362;
                      v228 = v91;
                      v92 = v90;
                      v93 = "%{public}@Unable to log event metadata to biome, non number playback state not eligible for donation";
LABEL_95:
                      _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_DEFAULT, v93, buf, 0xCu);
                    }
LABEL_96:
                    id v81 = v214;

                    v132 = 0;
                    v48 = v87;
                    v79 = v221;
                  }
                  else
                  {
                    if ([v80 isEqualToString:v181])
                    {
                      id v133 = v81;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        v134 = v133;
                      }
                      else {
                        v134 = 0;
                      }
                      id v85 = v134;

                      if (v85)
                      {
                        v135 = v216;
                        [v216 setObject:v85 forKeyedSubscript:@"volume"];
                        goto LABEL_98;
                      }
                      v152 = (void *)MEMORY[0x230FBD990]();
                      v153 = self;
                      v154 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                      {
                        HMFGetLogIdentifier();
                        v155 = v49;
                        v157 = v156 = v48;
                        *(_DWORD *)buf = 138543362;
                        v228 = v157;
                        _os_log_impl(&dword_22F52A000, v154, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to log event metadata to biome, unknown volume state not eligible for donation", buf, 0xCu);

                        v48 = v156;
                        v49 = v155;
                        v79 = v221;
                      }

                      v132 = 0;
                    }
                    else
                    {
                      v179 = v51;
                      v180 = v49;
                      v135 = v216;
                      if (![v80 isEqualToString:v178]) {
                        goto LABEL_99;
                      }
                      id v136 = v214;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        v137 = v136;
                      }
                      else {
                        v137 = 0;
                      }
                      id v85 = v137;

                      if (v85)
                      {
                        v135 = v216;
                        [v216 setObject:v85 forKeyedSubscript:@"mute"];
                        goto LABEL_98;
                      }
                      v165 = (void *)MEMORY[0x230FBD990]();
                      v166 = self;
                      v167 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                      {
                        HMFGetLogIdentifier();
                        v169 = v168 = v48;
                        *(_DWORD *)buf = 138543362;
                        v228 = v169;
                        _os_log_impl(&dword_22F52A000, v167, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to log event metadata to biome, unknown mute state not eligible for donation", buf, 0xCu);

                        v48 = v168;
                      }

                      v132 = 0;
                      v49 = v180;
                    }
                    id v81 = v214;
                  }
                  v151 = v216;
                  goto LABEL_111;
                }
                id v99 = v79;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v100 = v99;
                }
                else {
                  v100 = 0;
                }
                id v101 = v100;

                id v102 = v99;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v103 = v102;
                }
                else {
                  v103 = 0;
                }
                id v104 = v103;

                id v105 = v102;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v106 = v105;
                }
                else {
                  v106 = 0;
                }
                id v107 = v106;

                v204 = v104;
                v202 = v107;
                v208 = v101;
                if (v101)
                {
                  id v183 = objc_alloc(MEMORY[0x263F2A7A0]);
                  v200 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryUniqueIdentifier];
                  v217 = [v200 UUIDString];
                  v198 = [v48 spiClientIdentifier];
                  uint64_t v186 = [v198 UUIDString];
                  v108 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupUniqueIdentifier];
                  v196 = [v48 uuid];
                  v197 = v108;
                  v195 = objc_msgSend(v108, "objectForKeyedSubscript:");
                  v215 = [v195 UUIDString];
                  v212 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneUniqueIdentifiers];
                  v194 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomUniqueIdentifier];
                  v210 = [v194 UUIDString];
                  uint64_t v109 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryName];
                  uint64_t v110 = [v48 name];
                  uint64_t v111 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomName];
                  v112 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupName];
                  v192 = [v48 uuid];
                  v193 = v112;
                  uint64_t v113 = objc_msgSend(v112, "objectForKeyedSubscript:");
                  uint64_t v114 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneNames];
                  v189 = [(HMDCharacteristicReadWriteLogEvent *)self homeName];
                  v190 = (void *)v114;
                  v191 = (void *)v113;
                  uint64_t v172 = v111;
                  uint64_t v173 = v113;
                  uint64_t v170 = v109;
                  v206 = (void *)v109;
                  v115 = (void *)v110;
                  v116 = (void *)v111;
                  v117 = (void *)v186;
                  v118 = objc_msgSend(v183, "initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v219, v208, v217, v215, v212, v210, v170, v110, v172, v173, v114, v189);
                  v79 = v221;
                }
                else
                {
                  if (v104)
                  {
                    id v184 = objc_alloc(MEMORY[0x263F2A7A0]);
                    v200 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryUniqueIdentifier];
                    v217 = [v200 UUIDString];
                    v198 = [v48 spiClientIdentifier];
                    uint64_t v187 = [v198 UUIDString];
                    v119 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupUniqueIdentifier];
                    v196 = [v48 uuid];
                    v197 = v119;
                    v195 = objc_msgSend(v119, "objectForKeyedSubscript:");
                    v215 = [v195 UUIDString];
                    v212 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneUniqueIdentifiers];
                    v194 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomUniqueIdentifier];
                    v210 = [v194 UUIDString];
                    v206 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryName];
                    uint64_t v120 = [v48 name];
                    v116 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomName];
                    v121 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupName];
                    v192 = [v48 uuid];
                    v193 = v121;
                    uint64_t v122 = objc_msgSend(v121, "objectForKeyedSubscript:");
                    uint64_t v123 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneNames];
                    v189 = [(HMDCharacteristicReadWriteLogEvent *)self homeName];
                    v190 = (void *)v123;
                    uint64_t v174 = v123;
                    v79 = v221;
                    v191 = (void *)v122;
                    uint64_t v171 = v120;
                    v115 = (void *)v120;
                    v117 = (void *)v187;
                    uint64_t v124 = objc_msgSend(v184, "initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v219, v204, v217, v215, v212, v210, v206, v171, v116, v122, v174, v189);
                  }
                  else
                  {
                    if (!v107)
                    {
                      v158 = v48;
                      v159 = (void *)MEMORY[0x230FBD990]();
                      v160 = self;
                      v161 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
                      {
                        v162 = HMFGetLogIdentifier();
                        v163 = objc_opt_class();
                        *(_DWORD *)buf = 138544386;
                        v228 = v162;
                        __int16 v229 = 2112;
                        v230 = v163;
                        __int16 v231 = 2112;
                        v232 = v226;
                        __int16 v233 = 2112;
                        v234 = v158;
                        __int16 v235 = 2112;
                        id v236 = v105;
                        id v164 = v163;
                        _os_log_impl(&dword_22F52A000, v161, OS_LOG_TYPE_INFO, "%{public}@Unable to log event metadata to biome, unknown write value type (%@) for characteristic: %@, Service: %@, written value: %@", buf, 0x34u);

                        v79 = v221;
                      }

                      v48 = v158;
                      goto LABEL_114;
                    }
                    id v185 = objc_alloc(MEMORY[0x263F2A7A0]);
                    v200 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryUniqueIdentifier];
                    v217 = [v200 UUIDString];
                    v198 = [v48 spiClientIdentifier];
                    uint64_t v188 = [v198 UUIDString];
                    v138 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupUniqueIdentifier];
                    v196 = [v48 uuid];
                    v197 = v138;
                    v195 = objc_msgSend(v138, "objectForKeyedSubscript:");
                    v215 = [v195 UUIDString];
                    v212 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneUniqueIdentifiers];
                    v194 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomUniqueIdentifier];
                    v210 = [v194 UUIDString];
                    v206 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryName];
                    uint64_t v177 = [v48 name];
                    uint64_t v176 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryRoomName];
                    v139 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupName];
                    v192 = [v48 uuid];
                    v193 = v139;
                    uint64_t v140 = objc_msgSend(v139, "objectForKeyedSubscript:");
                    uint64_t v141 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryZoneNames];
                    uint64_t v142 = [(HMDCharacteristicReadWriteLogEvent *)self homeName];
                    id v143 = v107;
                    v116 = (void *)v176;
                    v115 = (void *)v177;
                    v189 = (void *)v142;
                    v190 = (void *)v141;
                    uint64_t v175 = v141;
                    v79 = v221;
                    v191 = (void *)v140;
                    v117 = (void *)v188;
                    uint64_t v124 = objc_msgSend(v185, "initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v219, v143, v217, v215, v212, v210, v206, v177, v176, v140, v175, v142);
                  }
                  v118 = (void *)v124;
                }
                [v220 addObject:v118];

LABEL_114:
                goto LABEL_59;
              }
              goto LABEL_56;
            }
            v71 = (void *)MEMORY[0x230FBD990]();
            v72 = v225;
            v73 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v75 = v74 = v51;
              *(_DWORD *)buf = 138543362;
              v228 = v75;
              _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@HAP event ineligible for donation because data source is nil", buf, 0xCu);

              v51 = v74;
              self = v222;
            }

            id v53 = v223;
          }

LABEL_56:
          v60 = (void *)MEMORY[0x230FBD990]();
          v61 = self;
          v62 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v94 = v49;
            v96 = v95 = v48;
            *(_DWORD *)buf = 138543874;
            v228 = v96;
            __int16 v229 = 2112;
            v230 = v226;
            __int16 v231 = 2112;
            v232 = v95;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Unable to log event metadata to biome, not eligible for donation. Characteristic: %@, Service: %@", buf, 0x20u);

            v48 = v95;
            v49 = v94;
          }
          goto LABEL_58;
        }
        v60 = (void *)MEMORY[0x230FBD990]();
        v61 = self;
        v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v66 = v49;
          v68 = v67 = v48;
          v69 = [NSNumber numberWithInt:v45];
          *(_DWORD *)buf = 138543874;
          v228 = v68;
          __int16 v229 = 2112;
          v230 = v226;
          __int16 v231 = 2112;
          v232 = v69;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no characteristic type for characteristic (%@) at index: %@", buf, 0x20u);

          v48 = v67;
          v49 = v66;
          v51 = 0;
          goto LABEL_35;
        }
      }
      else
      {
        v60 = (void *)MEMORY[0x230FBD990]();
        v61 = self;
        v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v64 = v63 = v48;
          v65 = [NSNumber numberWithInt:v45];
          *(_DWORD *)buf = 138543874;
          v228 = v64;
          __int16 v229 = 2112;
          v230 = v226;
          __int16 v231 = 2112;
          v232 = v65;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no service type for characteristic (%@) at index: %@", buf, 0x20u);

          v48 = v63;
          v49 = 0;
LABEL_35:
          self = v222;
        }
      }
LABEL_58:

LABEL_59:

      ++v45;
      v97 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
      unint64_t v98 = [v97 count];
    }
    while (v98 > v45);
  }
  v31 = (void *)[v220 copy];

LABEL_14:
  return v31;
}

- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3
{
  v3 = -[HMDCharacteristicReadWriteLogEvent firstDonatableCharacteristicForLogEventObserver:](self, a3);
  v4 = [v3 service];
  uint64_t v5 = [v4 type];
  unint64_t v6 = [v5 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"];

  return v6;
}

- (id)firstDonatableCharacteristicForLogEventObserver:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 characteristicsInRequest];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __108__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__firstDonatableCharacteristicForLogEventObserver___block_invoke;
    v6[3] = &unk_264A1C3D0;
    id v7 = v3;
    v8 = a1;
    a1 = objc_msgSend(v4, "na_firstObjectPassingTest:", v6);
  }
  return a1;
}

uint64_t __108__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__firstDonatableCharacteristicForLogEventObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 service];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  unint64_t v6 = *(id **)(a1 + 32);
  id v7 = [v4 type];
  v8 = [v3 type];
  LODWORD(v6) = -[HMDMicroLocationLogEventObserver isEligibleForDonationWithHAPServiceType:HAPCharacteristicType:](v6, v7, v8);

  if (v6)
  {
    unsigned int v9 = [*(id *)(a1 + 40) numAccessoriesInHome];
    uint64_t v10 = [*(id *)(a1 + 40) numNonEmptyScenesInHome];
    unint64_t v11 = [*(id *)(a1 + 40) triggerSource];
    if (v10 + (unint64_t)v9 > 3) {
      uint64_t v12 = (v11 < 7) & (0x67u >> v11);
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
LABEL_6:
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3
{
  id v4 = a3;
  if ([(HMDCharacteristicReadWriteLogEvent *)self isWriteOperation])
  {
    uint64_t v5 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __119__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationRecordingScanForLogEventObserver___block_invoke;
    v8[3] = &unk_264A1C3D0;
    id v9 = v4;
    uint64_t v10 = self;
    char v6 = objc_msgSend(v5, "na_any:", v8);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __119__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationRecordingScanForLogEventObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 service];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  char v6 = *(id **)(a1 + 32);
  id v7 = [v4 type];
  v8 = [v3 type];
  LODWORD(v6) = -[HMDMicroLocationLogEventObserver isEligibleForDonationWithHAPServiceType:HAPCharacteristicType:](v6, v7, v8);

  if (v6)
  {
    unsigned int v9 = [*(id *)(a1 + 40) numAccessoriesInHome];
    uint64_t v10 = [*(id *)(a1 + 40) numNonEmptyScenesInHome];
    unint64_t v11 = [*(id *)(a1 + 40) triggerSource];
    if (v10 + (unint64_t)v9 > 3) {
      uint64_t v12 = (v11 < 7) & (0x67u >> v11);
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
LABEL_6:
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3
{
  id v4 = a3;
  if ([(HMDCharacteristicReadWriteLogEvent *)self isWriteOperation])
  {
    uint64_t v5 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __122__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationLocalizationScanForLogEventObserver___block_invoke;
    v8[3] = &unk_264A1C3D0;
    id v9 = v4;
    uint64_t v10 = self;
    char v6 = objc_msgSend(v5, "na_any:", v8);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __122__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationLocalizationScanForLogEventObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 service];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  char v6 = *(id **)(a1 + 32);
  id v7 = [v4 type];
  v8 = [v3 type];
  LODWORD(v6) = -[HMDMicroLocationLogEventObserver isEligibleForDonationWithHAPServiceType:HAPCharacteristicType:](v6, v7, v8);

  if (v6)
  {
    unsigned int v9 = [*(id *)(a1 + 40) numAccessoriesInHome];
    uint64_t v10 = [*(id *)(a1 + 40) numNonEmptyScenesInHome];
    unint64_t v11 = [*(id *)(a1 + 40) triggerSource];
    if (v10 + (unint64_t)v9 > 3) {
      uint64_t v12 = (v11 < 7) & (0x67u >> v11);
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
LABEL_6:
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)microLocationMetadataForLogEventObserver:(id)a3
{
  id v4 = a3;
  if ([(HMDCharacteristicReadWriteLogEvent *)self isWriteOperation])
  {
    uint64_t v5 = -[HMDCharacteristicReadWriteLogEvent firstDonatableCharacteristicForLogEventObserver:](self, v4);
    char v6 = [v5 service];
    uint64_t v7 = [v5 accessory];
    v8 = (void *)v7;
    unsigned int v9 = (void *)MEMORY[0x263EFFA78];
    if (v5 && v6 && v7)
    {
      uint64_t v10 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
      unint64_t v11 = [v10 indexOfObject:v5];

      uint64_t v12 = [(HMDCharacteristicReadWriteLogEvent *)self writtenValues];
      unint64_t v13 = [v12 count];

      char v59 = v8;
      if (v11 <= v13)
      {
        v14 = [(HMDCharacteristicReadWriteLogEvent *)self writtenValues];
        v15 = [v14 objectAtIndexedSubscript:v11];

        id v16 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v17 = v16;
        }
        else {
          unint64_t v17 = 0;
        }
        id v18 = v17;

        v19 = (__CFString *)v16;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
        v21 = v20;

        if (v18)
        {
          v58 = [v18 stringValue];
        }
        else if (v21)
        {
          v22 = v21;
          v58 = v19;
        }
        else
        {
          v58 = @"unknown";
        }
      }
      else
      {
        v58 = @"unknown";
      }
      v23 = [v6 spiClientIdentifier];
      v24 = [v23 UUIDString];

      v25 = [v6 type];
      id v53 = [v5 type];
      v26 = [(HMDCharacteristicReadWriteLogEvent *)self serviceUUIDToServiceGroupUniqueIdentifier];
      v27 = [v6 uuid];
      v28 = [v26 objectForKeyedSubscript:v27];
      uint64_t v29 = [v28 UUIDString];
      v30 = (void *)v29;
      v31 = &stru_26E2EB898;
      if (v29) {
        v31 = (__CFString *)v29;
      }
      v51 = v31;

      if ([(__CFString *)v25 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"])
      {

        v32 = &stru_26E2EB898;
        v24 = @"media";
        v25 = @"media";
        v33 = @"media";
        v34 = v59;
      }
      else
      {
        v34 = v59;
        v32 = v51;
        v33 = v53;
      }
      id v52 = (void *)MEMORY[0x263F55790];
      v35 = [v34 spiClientIdentifier];
      uint64_t v36 = [v35 UUIDString];
      unint64_t v37 = [(HMDCharacteristicReadWriteLogEvent *)self triggerSource];
      v56 = v6;
      id v57 = v4;
      v54 = v35;
      v55 = v5;
      v38 = v24;
      v39 = (void *)v36;
      v40 = v25;
      v41 = v38;
      if (v37 > 9) {
        v42 = @"Unknown";
      }
      else {
        v42 = off_264A1BC48[v37];
      }
      v43 = v42;
      v8 = v59;
      uint64_t v44 = [v59 room];
      unint64_t v45 = [v44 spiClientIdentifier];
      v46 = [v45 UUIDString];
      v47 = v41;
      uint64_t v50 = v41;
      v48 = v32;
      unsigned int v9 = [v52 metadataForHomekitAccessoryControlEventWithUUID:v39 stateString:v58 serviceUUID:v47 serviceType:v40 characteristicType:v33 serviceGroupUUID:v32 source:v43 roomUUID:v46];

      char v6 = v56;
      id v4 = v57;
      uint64_t v5 = v55;
    }
  }
  else
  {
    unsigned int v9 = (void *)MEMORY[0x263EFFA78];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_topSessionFailureErrorDomain, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_writtenValues, 0);
  objc_storeStrong((id *)&self->_characteristicsInRequest, 0);
  objc_storeStrong((id *)&self->_accessoryZoneNames, 0);
  objc_storeStrong((id *)&self->_accessoryZoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceUUIDToServiceGroupName, 0);
  objc_storeStrong((id *)&self->_serviceUUIDToServiceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryMediaRouteID, 0);
  objc_storeStrong((id *)&self->_accessoryRoomName, 0);
  objc_storeStrong((id *)&self->_accessoryRoomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_residentFirstError, 0);
  objc_storeStrong((id *)&self->_transportProtocolVersion, 0);
  objc_storeStrong((id *)&self->_expectedTransport, 0);
  objc_storeStrong((id *)&self->_primaryServiceType, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_readWriteLogEventManager, 0);
}

- (void)setHasEnabledResidents:(BOOL)a3
{
  self->_hasEnabledResidents = a3;
}

- (BOOL)hasEnabledResidents
{
  return self->_hasEnabledResidents;
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setThreadNetworkNodeType:(int64_t)a3
{
  self->_threadNetworkNodeType = a3;
}

- (int64_t)threadNetworkNodeType
{
  return self->_threadNetworkNodeType;
}

- (void)setThreadNetworkConnectionState:(int64_t)a3
{
  self->_threadNetworkConnectionState = a3;
}

- (int64_t)threadNetworkConnectionState
{
  return self->_threadNetworkConnectionState;
}

- (void)setPercentageOfIDSReachableResidents:(unint64_t)a3
{
  self->_percentageOfIDSReachableResidents = a3;
}

- (unint64_t)percentageOfIDSReachableResidents
{
  return self->_percentageOfIDSReachableResidents;
}

- (void)setPercentageOfLocalReachableResidents:(unint64_t)a3
{
  self->_percentageOfLocalReachableResidents = a3;
}

- (unint64_t)percentageOfLocalReachableResidents
{
  return self->_percentageOfLocalReachableResidents;
}

- (void)setThreadPreferredNetworkExistsInHome:(BOOL)a3
{
  self->_threadPreferredNetworkExistsInHome = a3;
}

- (BOOL)threadPreferredNetworkExistsInHome
{
  return self->_threadPreferredNetworkExistsInHome;
}

- (void)setIsThreadNetworkUpInHome:(BOOL)a3
{
  self->_isThreadNetworkUpInHome = a3;
}

- (BOOL)isThreadNetworkUpInHome
{
  return self->_isThreadNetworkUpInHome;
}

- (void)setIsCurrentNetworkSignatureSameAsLastFailure:(BOOL)a3
{
  self->_isCurrentNetworkSignatureSameAsLastFailure = a3;
}

- (BOOL)isCurrentNetworkSignatureSameAsLastFailure
{
  return self->_isCurrentNetworkSignatureSameAsLastFailure;
}

- (void)setIsCurrentNetworkSignatureSameAsLastSuccess:(BOOL)a3
{
  self->_isCurrentNetworkSignatureSameAsLastSuccess = a3;
}

- (BOOL)isCurrentNetworkSignatureSameAsLastSuccess
{
  return self->_isCurrentNetworkSignatureSameAsLastSuccess;
}

- (void)setIsConnectedToInternet:(BOOL)a3
{
  self->_isConnectedToInternet = a3;
}

- (BOOL)isConnectedToInternet
{
  return self->_isConnectedToInternet;
}

- (void)setCellularDataConnectionState:(unint64_t)a3
{
  self->_cellularDataConnectionState = a3;
}

- (unint64_t)cellularDataConnectionState
{
  return self->_cellularDataConnectionState;
}

- (void)setEthernetConnectionState:(unint64_t)a3
{
  self->_ethernetConnectionState = a3;
}

- (unint64_t)ethernetConnectionState
{
  return self->_ethernetConnectionState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setWifiConnectionState:(unint64_t)a3
{
  self->_wifiConnectionState = a3;
}

- (unint64_t)wifiConnectionState
{
  return self->_wifiConnectionState;
}

- (void)setTimeIntervalSincePrimaryLost:(double)a3
{
  self->_timeIntervalSincePrimaryLost = a3;
}

- (double)timeIntervalSincePrimaryLost
{
  return self->_timeIntervalSincePrimaryLost;
}

- (void)setTimeIntervalSincePrimaryChanged:(double)a3
{
  self->_timeIntervalSincePrimaryChanged = a3;
}

- (double)timeIntervalSincePrimaryChanged
{
  return self->_timeIntervalSincePrimaryChanged;
}

- (void)setTimeIntervalSinceCurrentDeviceAsPrimary:(double)a3
{
  self->_timeIntervalSinceCurrentDeviceAsPrimary = a3;
}

- (double)timeIntervalSinceCurrentDeviceAsPrimary
{
  return self->_timeIntervalSinceCurrentDeviceAsPrimary;
}

- (BOOL)isPrimaryResidentAvailable
{
  return self->_isPrimaryResidentAvailable;
}

- (void)setIsBSSIDSameAsLastSuccessRequest:(BOOL)a3
{
  self->_isBSSIDSameAsLastSuccessRequest = a3;
}

- (BOOL)isBSSIDSameAsLastSuccessRequest
{
  return self->_isBSSIDSameAsLastSuccessRequest;
}

- (void)setIsSSIDSameAsLastSuccessRequest:(BOOL)a3
{
  self->_isSSIDSameAsLastSuccessRequest = a3;
}

- (BOOL)isSSIDSameAsLastSuccessRequest
{
  return self->_isSSIDSameAsLastSuccessRequest;
}

- (void)setLastFailedLinkLayerType:(int64_t)a3
{
  self->_lastFailedLinkLayerType = a3;
}

- (int64_t)lastFailedLinkLayerType
{
  return self->_lastFailedLinkLayerType;
}

- (void)setLastSuccessLinkLayerType:(int64_t)a3
{
  self->_lastSuccessLinkLayerType = a3;
}

- (int64_t)lastSuccessLinkLayerType
{
  return self->_lastSuccessLinkLayerType;
}

- (void)setConsecutiveSuccessCount:(unint64_t)a3
{
  self->_consecutiveSuccessCount = a3;
}

- (unint64_t)consecutiveSuccessCount
{
  return self->_consecutiveSuccessCount;
}

- (void)setTimeIntervalSinceLastFailedRequest:(double)a3
{
  self->_timeIntervalSinceLastFailedRequest = a3;
}

- (double)timeIntervalSinceLastFailedRequest
{
  return self->_timeIntervalSinceLastFailedRequest;
}

- (void)setTimeIntervalSinceLastSuccessfulRequest:(double)a3
{
  self->_timeIntervalSinceLastSuccessfulRequest = a3;
}

- (double)timeIntervalSinceLastSuccessfulRequest
{
  return self->_timeIntervalSinceLastSuccessfulRequest;
}

- (void)setIsLinkFallback:(BOOL)a3
{
  self->_isLinkFallback = a3;
}

- (BOOL)isLinkFallback
{
  return self->_isLinkFallback;
}

- (void)setIsLocalFallback:(BOOL)a3
{
  self->_isLocalFallback = a3;
}

- (BOOL)isLocalFallback
{
  return self->_isLocalFallback;
}

- (BOOL)isNetworkAvailable
{
  return self->_isNetworkAvailable;
}

- (unint64_t)lastKnownLinkQuality
{
  return self->_lastKnownLinkQuality;
}

- (BOOL)isHomeThreadCapable
{
  return self->_homeThreadCapable;
}

- (NSString)topSessionFailureErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (int64_t)topSessionFailureErrorCode
{
  return self->_topSessionFailureErrorCode;
}

- (unint64_t)recentSessionRetries
{
  return self->_recentSessionRetries;
}

- (BOOL)hasSession
{
  return self->_hasSession;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (int)btNonAudioTask
{
  return self->_btNonAudioTask;
}

- (int)btLoad
{
  return self->_btLoad;
}

- (int)btAudioTask
{
  return self->_btAudioTask;
}

- (NSString)clientMetricIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (NSString)transactionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (NSArray)writtenValues
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (NSArray)characteristicsInRequest
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (NSArray)accessoryZoneNames
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (NSArray)accessoryZoneUniqueIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (NSDictionary)serviceUUIDToServiceGroupName
{
  return (NSDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (NSDictionary)serviceUUIDToServiceGroupUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (NSString)accessoryMediaRouteID
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (NSString)accessoryRoomName
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (NSUUID)accessoryRoomUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (NSUUID)accessoryUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 312, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 304, 1);
}

- (NSString)accessoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (NSString)accessoryName
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (unsigned)numNonEmptyScenesInHome
{
  return self->_numNonEmptyScenesInHome;
}

- (unsigned)numAccessoriesInHome
{
  return self->_numAccessoriesInHome;
}

- (NSString)userUUID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (BOOL)isAtHome
{
  return self->_isAtHome;
}

- (NSString)homeName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSUUID)homeUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 264, 1);
}

- (void)setThreadAccessory:(BOOL)a3
{
  self->_threadAccessory = a3;
}

- (BOOL)isThreadAccessory
{
  return self->_threadAccessory;
}

- (void)setTimeIntervalSinceFirstFailure:(double)a3
{
  self->_timeIntervalSinceFirstFailure = a3;
}

- (double)timeIntervalSinceFirstFailure
{
  return self->_timeIntervalSinceFirstFailure;
}

- (void)setConsecutiveFailureCount:(unint64_t)a3
{
  self->_consecutiveFailureCount = a3;
}

- (unint64_t)consecutiveFailureCount
{
  return self->_consecutiveFailureCount;
}

- (BOOL)isRemotelyReachable
{
  return self->_isRemotelyReachable;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_isRemoteAccessAllowed;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  return self->_isCurrentDeviceConfirmedPrimaryResident;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_isCurrentDevicePrimaryResident;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  return self->_isCurrentDeviceAvailableResident;
}

- (BOOL)isPrimaryResidentReachable
{
  return self->_isPrimaryResidentReachable;
}

- (BOOL)isResidentAvailable
{
  return self->_isResidentAvailable;
}

- (void)setIsDeviceAtHome:(BOOL)a3
{
  self->_isDeviceAtHome = a3;
}

- (BOOL)isDeviceAtHome
{
  return self->_isDeviceAtHome;
}

- (void)setIsSlowRapport:(BOOL)a3
{
  self->_isSlowRapport = a3;
}

- (BOOL)isSlowRapport
{
  return self->_isSlowRapport;
}

- (void)setIsModernTransport:(BOOL)a3
{
  self->_isModernTransport = a3;
}

- (BOOL)isModernTransport
{
  return self->_isModernTransport;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setResidentFirstError:(id)a3
{
}

- (NSError)residentFirstError
{
  return (NSError *)objc_getProperty(self, a2, 240, 1);
}

- (void)setIsResidentFirstEnabled:(BOOL)a3
{
  self->_isResidentFirstEnabled = a3;
}

- (BOOL)isResidentFirstEnabled
{
  return self->_isResidentFirstEnabled;
}

- (void)setResidentFirstDurationInMilliseconds:(int64_t)a3
{
  self->_residentFirstDurationInMilliseconds = a3;
}

- (int64_t)residentFirstDurationInMilliseconds
{
  return self->_residentFirstDurationInMilliseconds;
}

- (void)setLocalDurationInMilliseconds:(int64_t)a3
{
  self->_localDurationInMilliseconds = a3;
}

- (int64_t)localDurationInMilliseconds
{
  return self->_localDurationInMilliseconds;
}

- (void)setIsSentOverThread:(BOOL)a3
{
  self->_isSentOverThread = a3;
}

- (BOOL)isSentOverThread
{
  return self->_isSentOverThread;
}

- (NSString)transportProtocolVersion
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (NSString)expectedTransport
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setLinkLayerType:(int64_t)a3
{
  self->_linkLayerType = a3;
}

- (int64_t)linkLayerType
{
  return self->_linkLayerType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (NSString)primaryServiceType
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIsTimedWrite:(BOOL)a3
{
  self->_isTimedWrite = a3;
}

- (BOOL)isTimedWrite
{
  return self->_isTimedWrite;
}

- (BOOL)isWriteOperation
{
  return self->_isWriteOperation;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (NSString)accessoryCategory
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)accessoryCertificationStatus
{
  return self->_accessoryCertificationStatus;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (unint64_t)triggerSource
{
  return self->_triggerSource;
}

- (HMDCharacteristicReadWriteLogEventManager)readWriteLogEventManager
{
  return (HMDCharacteristicReadWriteLogEventManager *)objc_getProperty(self, a2, 136, 1);
}

- (SISchemaTopLevelUnionType)siriInstrumentationMessage
{
  id v3 = objc_alloc_init(MEMORY[0x263F6DDE0]);
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v5 = [(HMDCharacteristicReadWriteLogEvent *)self clientMetricIdentifier];
  char v6 = (void *)[v4 initWithUUIDString:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v6];
  [v3 setSharedMetricsId:v7];

  v8 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryCategory];
  [v3 setAccessoryCategory:v8];

  int64_t v9 = [(HMDCharacteristicReadWriteLogEvent *)self communicationProtocol];
  if (v9 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v9 == 2);
  }
  [v3 setCommunicationProtocol:v10];
  BOOL v11 = [(HMDCharacteristicReadWriteLogEvent *)self isLocal];
  int64_t v12 = [(HMDCharacteristicReadWriteLogEvent *)self linkType];
  BOOL v13 = [(HMDCharacteristicReadWriteLogEvent *)self isSentOverThread];
  [(HMDCharacteristicReadWriteLogEvent *)self transportType];
  unsigned int v14 = 2 * (v12 == 2);
  if (v12 == 1) {
    unsigned int v14 = 1;
  }
  if (v13) {
    unsigned int v14 = 3;
  }
  if (v11) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 4;
  }
  [v3 setTransportType:v15];
  if ([(HMDCharacteristicReadWriteLogEvent *)self isWriteOperation]) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  [v3 setOperationType:v16];
  objc_msgSend(v3, "setWasLocal:", -[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal"));
  objc_msgSend(v3, "setWasCached:", -[HMDCharacteristicReadWriteLogEvent isCached](self, "isCached"));
  objc_msgSend(v3, "setWasRemoteAccessAllowed:", -[HMDCharacteristicReadWriteLogEvent isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  objc_msgSend(v3, "setWasResidentFirstEnabled:", -[HMDCharacteristicReadWriteLogEvent isResidentFirstEnabled](self, "isResidentFirstEnabled"));
  objc_msgSend(v3, "setWasRapportSlow:", -[HMDCharacteristicReadWriteLogEvent isSlowRapport](self, "isSlowRapport"));
  objc_msgSend(v3, "setResidentFirstDuration:", -[HMDCharacteristicReadWriteLogEvent residentFirstDurationInMilliseconds](self, "residentFirstDurationInMilliseconds"));
  unint64_t v17 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstError];
  id v18 = [v17 domain];
  [v3 setResidentFirstErrorDomain:v18];

  v19 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstError];
  objc_msgSend(v3, "setResidentFirstErrorCode:", objc_msgSend(v19, "code"));

  objc_msgSend(v3, "setTotalDuration:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v20 = [(HMMLogEvent *)self error];
  v21 = [v20 domain];
  [v3 setFinalErrorDomain:v21];

  v22 = [(HMMLogEvent *)self error];
  objc_msgSend(v3, "setFinalErrorCode:", objc_msgSend(v22, "code"));

  objc_msgSend(v3, "setConsecutiveFailureCount:", -[HMDCharacteristicReadWriteLogEvent consecutiveFailureCount](self, "consecutiveFailureCount"));
  id v23 = objc_alloc_init(MEMORY[0x263F6DDE8]);
  [v23 setHomeKitAccessoryOperationReported:v3];

  return (SISchemaTopLevelUnionType *)v23;
}

- (BOOL)enabledForSiriSELFLogging
{
  return [(HMDCharacteristicReadWriteLogEvent *)self triggerSource] == 1;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(HMDCharacteristicReadWriteLogEvent *)self accessoryCertificationStatus];
  id v4 = HMAccessoryCertificationStatusToString();
  [v3 setObject:v4 forKeyedSubscript:@"accessoryCertificationStatus"];

  if (isInternalBuild())
  {
    uint64_t v5 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryUUID];
    char v6 = [v5 UUIDString];
    [v3 setObject:v6 forKeyedSubscript:@"accessoryUUID"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"accessoryUUID"];
  }
  uint64_t v7 = [(HMDCharacteristicReadWriteLogEvent *)self primaryServiceType];
  [v3 setObject:v7 forKeyedSubscript:@"accessoryPrimaryServiceType"];

  v8 = [(HMDCharacteristicReadWriteLogEvent *)self bundleId];
  if (+[HMDMetricsUtilities shouldRedactBundleID:v8])
  {
    [v3 setObject:@"Third-party app" forKeyedSubscript:@"appIdentifier"];
  }
  else
  {
    int64_t v9 = [(HMDCharacteristicReadWriteLogEvent *)self bundleId];
    [v3 setObject:v9 forKeyedSubscript:@"appIdentifier"];
  }
  if (isInternalBuild())
  {
    uint64_t v10 = [(HMDCharacteristicReadWriteLogEvent *)self clientMetricIdentifier];
    [v3 setObject:v10 forKeyedSubscript:@"clientMetricIdentifier"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"clientMetricIdentifier"];
  }
  BOOL v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent communicationProtocol](self, "communicationProtocol"));
  [v3 setObject:v11 forKeyedSubscript:@"communicationProtocol"];

  int64_t v12 = [(HMDCharacteristicReadWriteLogEvent *)self expectedTransport];
  [v3 setObject:v12 forKeyedSubscript:@"expectedTransport"];

  BOOL v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent consecutiveFailureCount](self, "consecutiveFailureCount"));
  [v3 setObject:v13 forKeyedSubscript:@"consecutiveFailureCount"];

  unsigned int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCached](self, "isCached"));
  [v3 setObject:v14 forKeyedSubscript:@"isCached"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"));
  [v3 setObject:v15 forKeyedSubscript:@"isCurrentDeviceConfirmedPrimaryResident"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"));
  [v3 setObject:v16 forKeyedSubscript:@"isCurrentDevicePrimaryResident"];

  unint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentDeviceAvailableResident](self, "isCurrentDeviceAvailableResident"));
  [v3 setObject:v17 forKeyedSubscript:@"isCurrentDeviceAvailableResident"];

  id v18 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isPrimaryResidentReachable](self, "isPrimaryResidentReachable"));
  [v3 setObject:v18 forKeyedSubscript:@"isPrimaryResidentReachable"];

  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal") ^ 1);
  [v3 setObject:v19 forKeyedSubscript:@"isRemote"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isRemotelyReachable](self, "isRemotelyReachable"));
  [v3 setObject:v20 forKeyedSubscript:@"isRemotelyReachable"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  [v3 setObject:v21 forKeyedSubscript:@"isRemoteAccessAllowed"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isResidentAvailable](self, "isResidentAvailable"));
  [v3 setObject:v22 forKeyedSubscript:@"isResidentAvailable"];

  if ([(HMDCharacteristicReadWriteLogEvent *)self linkLayerType] == 4)
  {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isSentOverThread"];
  }
  else
  {
    id v23 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isSentOverThread](self, "isSentOverThread"));
    [v3 setObject:v23 forKeyedSubscript:@"isSentOverThread"];
  }
  if ([(HMDCharacteristicReadWriteLogEvent *)self linkLayerType] == 4)
  {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isThreadAccessory"];
  }
  else
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isThreadAccessory](self, "isThreadAccessory"));
    [v3 setObject:v24 forKeyedSubscript:@"isThreadAccessory"];
  }
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"));
  [v3 setObject:v25 forKeyedSubscript:@"isWrite"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isTimedWrite](self, "isTimedWrite"));
  [v3 setObject:v26 forKeyedSubscript:@"isTimedWrite"];

  v27 = HMDRequestSourceAsLegacyMetricString([(HMDCharacteristicReadWriteLogEvent *)self triggerSource]);
  [v3 setObject:v27 forKeyedSubscript:@"source"];

  v28 = NSNumber;
  [(HMDCharacteristicReadWriteLogEvent *)self timeIntervalSinceFirstFailure];
  v30 = [v28 numberWithUnsignedLong:(unint64_t)v29];
  [v3 setObject:v30 forKeyedSubscript:@"timeElapsedSinceFirstFailure"];

  v31 = [(HMDCharacteristicReadWriteLogEvent *)self transportProtocolVersion];
  [v3 setObject:v31 forKeyedSubscript:@"transportProtocolVersion"];

  if ([(HMDCharacteristicReadWriteLogEvent *)self isLocal])
  {
    [(HMDCharacteristicReadWriteLogEvent *)self linkType];
    HAPLinkTypeDescription();
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v33 = [(HMDCharacteristicReadWriteLogEvent *)self transportType];
    if (v33 > 6) {
      v34 = 0;
    }
    else {
      v34 = off_264A2EB80[v33];
    }
    v32 = v34;
  }
  v35 = v32;
  [v3 setObject:v32 forKeyedSubscript:@"transportType"];

  uint64_t v36 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent linkLayerType](self, "linkLayerType"));
  [v3 setObject:v36 forKeyedSubscript:@"linkLayerType"];

  unint64_t v37 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isModernTransport](self, "isModernTransport"));
  [v3 setObject:v37 forKeyedSubscript:@"isModernTransport"];

  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isSlowRapport](self, "isSlowRapport"));
  [v3 setObject:v38 forKeyedSubscript:@"isSlowRapport"];

  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isDeviceAtHome](self, "isDeviceAtHome"));
  [v3 setObject:v39 forKeyedSubscript:@"isDeviceAtHome"];

  v40 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent localDurationInMilliseconds](self, "localDurationInMilliseconds"));
  [v3 setObject:v40 forKeyedSubscript:@"localDuration"];

  v41 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent residentFirstDurationInMilliseconds](self, "residentFirstDurationInMilliseconds"));
  [v3 setObject:v41 forKeyedSubscript:@"residentFirstDuration"];

  v42 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v42 forKeyedSubscript:@"duration"];

  v43 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent btLoad](self, "btLoad"));
  [v3 setObject:v43 forKeyedSubscript:@"btLoad"];

  uint64_t v44 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent btAudioTask](self, "btAudioTask"));
  [v3 setObject:v44 forKeyedSubscript:@"btAudioTask"];

  unint64_t v45 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent btNonAudioTask](self, "btNonAudioTask"));
  [v3 setObject:v45 forKeyedSubscript:@"btNonAudioTask"];

  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent hasSession](self, "hasSession"));
  [v3 setObject:v46 forKeyedSubscript:@"hasActiveSession"];

  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isReachable](self, "isReachable"));
  [v3 setObject:v47 forKeyedSubscript:@"isReachable"];

  v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent recentSessionRetries](self, "recentSessionRetries"));
  [v3 setObject:v48 forKeyedSubscript:@"recentSessionRetries"];

  v49 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent topSessionFailureErrorCode](self, "topSessionFailureErrorCode"));
  [v3 setObject:v49 forKeyedSubscript:@"topSessionFailureErrorCode"];

  uint64_t v50 = [(HMDCharacteristicReadWriteLogEvent *)self topSessionFailureErrorDomain];
  [v3 setObject:v50 forKeyedSubscript:@"topSessionFailureErrorDomain"];

  v51 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isHomeThreadCapable](self, "isHomeThreadCapable"));
  [v3 setObject:v51 forKeyedSubscript:@"isHomeThreadCapable"];

  id v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent lastKnownLinkQuality](self, "lastKnownLinkQuality"));
  [v3 setObject:v52 forKeyedSubscript:@"lastKnownLinkQuality"];

  id v53 = NSNumber;
  v54 = [(HMMLogEvent *)self error];
  v55 = objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v54, "code"));
  [v3 setObject:v55 forKeyedSubscript:@"errorCode"];

  v56 = [(HMMLogEvent *)self error];
  id v57 = [v56 domain];
  [v3 setObject:v57 forKeyedSubscript:@"errorDomain"];

  v58 = [(HMMLogEvent *)self error];
  char v59 = [v58 userInfo];
  v60 = [v59 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v61 = v60;
  }
  else {
    v61 = 0;
  }
  id v62 = v61;

  if (v62)
  {
    v63 = [v62 domain];
    [v3 setObject:v63 forKeyedSubscript:@"underlyingErrorDomain"];

    v64 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v62, "code"));
    [v3 setObject:v64 forKeyedSubscript:@"underlyingErrorCode"];
  }
  v65 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstError];

  if (v65)
  {
    v66 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstError];
    v67 = [v66 domain];
    [v3 setObject:v67 forKeyedSubscript:@"residentFirstErrorDomain"];

    v68 = NSNumber;
    v69 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstError];
    char v70 = objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v69, "code"));
    [v3 setObject:v70 forKeyedSubscript:@"residentFirstErrorCode"];
  }
  v71 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isNetworkAvailable](self, "isNetworkAvailable"));
  [v3 setObject:v71 forKeyedSubscript:@"isNetworkAvailable"];

  v72 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isLocalFallback](self, "isLocalFallback"));
  [v3 setObject:v72 forKeyedSubscript:@"isLocalFallback"];

  v73 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isLinkFallback](self, "isLinkFallback"));
  [v3 setObject:v73 forKeyedSubscript:@"isLinkFallback"];

  v74 = NSNumber;
  [(HMDCharacteristicReadWriteLogEvent *)self timeIntervalSinceLastSuccessfulRequest];
  char v76 = [v74 numberWithInteger:(uint64_t)v75];
  [v3 setObject:v76 forKeyedSubscript:@"durationSecondsSinceLastSuccessfulRequest"];

  v77 = NSNumber;
  [(HMDCharacteristicReadWriteLogEvent *)self timeIntervalSinceLastFailedRequest];
  v79 = [v77 numberWithInteger:(uint64_t)v78];
  [v3 setObject:v79 forKeyedSubscript:@"durationSecondsSinceLastFailedRequest"];

  id v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent consecutiveSuccessCount](self, "consecutiveSuccessCount"));
  [v3 setObject:v80 forKeyedSubscript:@"consecutiveSuccessCount"];

  id v81 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent lastSuccessLinkLayerType](self, "lastSuccessLinkLayerType"));
  [v3 setObject:v81 forKeyedSubscript:@"lastSuccessLinkLayerType"];

  v82 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent lastFailedLinkLayerType](self, "lastFailedLinkLayerType"));
  [v3 setObject:v82 forKeyedSubscript:@"lastFailedLinkLayerType"];

  id v83 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isSSIDSameAsLastSuccessRequest](self, "isSSIDSameAsLastSuccessRequest"));
  [v3 setObject:v83 forKeyedSubscript:@"isSSIDSameAsLastSuccessRequest"];

  v84 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isBSSIDSameAsLastSuccessRequest](self, "isBSSIDSameAsLastSuccessRequest"));
  [v3 setObject:v84 forKeyedSubscript:@"isBSSIDSameAsLastSuccessRequest"];

  id v85 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isPrimaryResidentAvailable](self, "isPrimaryResidentAvailable"));
  [v3 setObject:v85 forKeyedSubscript:@"isPrimaryResidentAvailable"];

  if ([(HMDCharacteristicReadWriteLogEvent *)self isCurrentDevicePrimaryResident])
  {
    unint64_t v86 = NSNumber;
    [(HMDCharacteristicReadWriteLogEvent *)self timeIntervalSinceCurrentDeviceAsPrimary];
    v88 = [v86 numberWithInteger:(uint64_t)v87];
    [v3 setObject:v88 forKeyedSubscript:@"currentDeviceAsPrimaryDurationSeconds"];
  }
  if ([(HMDCharacteristicReadWriteLogEvent *)self hasEnabledResidents])
  {
    v89 = NSNumber;
    [(HMDCharacteristicReadWriteLogEvent *)self timeIntervalSincePrimaryChanged];
    v91 = [v89 numberWithInteger:(uint64_t)v90];
    [v3 setObject:v91 forKeyedSubscript:@"durationSecondsSincePrimaryChanged"];

    v92 = NSNumber;
    [(HMDCharacteristicReadWriteLogEvent *)self timeIntervalSincePrimaryLost];
    v94 = [v92 numberWithInteger:(uint64_t)v93];
    [v3 setObject:v94 forKeyedSubscript:@"durationSecondsSincePrimaryLost"];

    v95 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent percentageOfLocalReachableResidents](self, "percentageOfLocalReachableResidents"));
    [v3 setObject:v95 forKeyedSubscript:@"percentageOfLocalReachableResidents"];

    v96 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent percentageOfIDSReachableResidents](self, "percentageOfIDSReachableResidents"));
    [v3 setObject:v96 forKeyedSubscript:@"percentageOfIDSReachableResidents"];
  }
  v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent wifiConnectionState](self, "wifiConnectionState"));
  [v3 setObject:v97 forKeyedSubscript:@"wifiConnectionState"];

  unint64_t v98 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent bluetoothState](self, "bluetoothState"));
  [v3 setObject:v98 forKeyedSubscript:@"bluetoothState"];

  id v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent ethernetConnectionState](self, "ethernetConnectionState"));
  [v3 setObject:v99 forKeyedSubscript:@"ethernetConnectionState"];

  v100 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent cellularDataConnectionState](self, "cellularDataConnectionState"));
  [v3 setObject:v100 forKeyedSubscript:@"cellularDataConnectionState"];

  id v101 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isConnectedToInternet](self, "isConnectedToInternet"));
  [v3 setObject:v101 forKeyedSubscript:@"isConnectedToInternet"];

  id v102 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentNetworkSignatureSameAsLastSuccess](self, "isCurrentNetworkSignatureSameAsLastSuccess"));
  [v3 setObject:v102 forKeyedSubscript:@"isCurrentNetworkSignatureSameAsLastSuccess"];

  v103 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentNetworkSignatureSameAsLastFailure](self, "isCurrentNetworkSignatureSameAsLastFailure"));
  [v3 setObject:v103 forKeyedSubscript:@"isCurrentNetworkSignatureSameAsLastFailure"];

  if ([(HMDCharacteristicReadWriteLogEvent *)self isCurrentDeviceAvailableResident])
  {
    id v104 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isThreadNetworkUpInHome](self, "isThreadNetworkUpInHome"));
    [v3 setObject:v104 forKeyedSubscript:@"isThreadNetworkUpInHome"];

    id v105 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent threadPreferredNetworkExistsInHome](self, "threadPreferredNetworkExistsInHome"));
    [v3 setObject:v105 forKeyedSubscript:@"threadPreferredNetworkExistsInHome"];
  }
  v106 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent threadNetworkConnectionState](self, "threadNetworkConnectionState"));
  [v3 setObject:v106 forKeyedSubscript:@"threadNetworkConnectionState"];

  id v107 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent threadNetworkNodeType](self, "threadNetworkNodeType"));
  [v3 setObject:v107 forKeyedSubscript:@"threadNetworkNodeType"];

  v108 = (void *)[v3 copy];
  return (NSDictionary *)v108;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.AccessoryReadWriteEvent";
}

- (void)_setBtLoad
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = +[HMDWirelessLoadManager sharedInstance];
  id v4 = [v3 getBtLoadData];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kBtLoadKey"];
  self->_btLoad = [v5 intValue];

  char v6 = [v4 objectForKeyedSubscript:@"kBtAudioTask"];
  self->_btAudioTask = [v6 intValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"kBtNonAudioTask"];
  self->_btNonAudioTask = [v7 intValue];

  v8 = (void *)MEMORY[0x230FBD990]();
  int64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = HMFGetLogIdentifier();
    int v12 = 138544130;
    BOOL v13 = v11;
    __int16 v14 = 1024;
    int v15 = [(HMDCharacteristicReadWriteLogEvent *)v9 btLoad];
    __int16 v16 = 1024;
    int v17 = [(HMDCharacteristicReadWriteLogEvent *)v9 btAudioTask];
    __int16 v18 = 1024;
    int v19 = [(HMDCharacteristicReadWriteLogEvent *)v9 btNonAudioTask];
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@RW BT Load: %d AudioTsk: %d NonAudioTsk: %d", (uint8_t *)&v12, 0x1Eu);
  }
}

- (void)prepareForObservation
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)HMDCharacteristicReadWriteLogEvent;
  [(HMMLogEvent *)&v29 prepareForObservation];
  id v3 = [(HMDCharacteristicReadWriteLogEvent *)self readWriteLogEventManager];
  [v3 _updateNetworkStatisticsForLogEvent:self];

  if ([(HMDCharacteristicReadWriteLogEvent *)self isCached]
    || (uint64_t v4 = [(HMDCharacteristicReadWriteLogEvent *)self isLocal], (v4 & 1) == 0))
  {
    uint64_t v4 = [(HMDCharacteristicReadWriteLogEvent *)self setIsSentOverThread:0];
  }
  uint64_t v5 = (void *)MEMORY[0x230FBD990](v4);
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v28 = HMFGetLogIdentifier();
    if ([(HMDCharacteristicReadWriteLogEvent *)self isWriteOperation]) {
      uint64_t v7 = @"Writing";
    }
    else {
      uint64_t v7 = @"Reading";
    }
    v27 = [(HMDCharacteristicReadWriteLogEvent *)self characteristicsInRequest];
    uint64_t v8 = [v27 count];
    v26 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryUUID];
    v25 = [(HMDCharacteristicReadWriteLogEvent *)self accessoryManufacturer];
    v24 = [(HMMLogEvent *)self error];
    id v23 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstError];
    int64_t v22 = [(HMMLogEvent *)self durationMilliseconds];
    int64_t v21 = [(HMDCharacteristicReadWriteLogEvent *)self localDurationInMilliseconds];
    int64_t v20 = [(HMDCharacteristicReadWriteLogEvent *)self residentFirstDurationInMilliseconds];
    if ([(HMDCharacteristicReadWriteLogEvent *)self isLocal])
    {
      [(HMDCharacteristicReadWriteLogEvent *)self linkType];
      HAPLinkTypeDescription();
      int64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v10 = [(HMDCharacteristicReadWriteLogEvent *)self transportType];
      if (v10 > 6) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = off_264A2EB80[v10];
      }
      int64_t v9 = v11;
    }
    int v19 = v9;
    __int16 v18 = HMDRequestSourceAsLegacyMetricString([(HMDCharacteristicReadWriteLogEvent *)self triggerSource]);
    [(HMDCharacteristicReadWriteLogEvent *)self isReachable];
    int v17 = HMFBooleanToString();
    [(HMDCharacteristicReadWriteLogEvent *)self hasSession];
    __int16 v16 = HMFBooleanToString();
    unint64_t v15 = [(HMDCharacteristicReadWriteLogEvent *)self recentSessionRetries];
    int v12 = [(HMDCharacteristicReadWriteLogEvent *)self topSessionFailureErrorDomain];
    int64_t v13 = [(HMDCharacteristicReadWriteLogEvent *)self topSessionFailureErrorCode];
    [(HMDCharacteristicReadWriteLogEvent *)self isHomeThreadCapable];
    __int16 v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138547714;
    v31 = v28;
    __int16 v32 = 2114;
    unsigned int v33 = v7;
    __int16 v34 = 2050;
    uint64_t v35 = v8;
    __int16 v36 = 2114;
    unint64_t v37 = v26;
    __int16 v38 = 2112;
    v39 = v25;
    __int16 v40 = 2114;
    v41 = v24;
    __int16 v42 = 2114;
    v43 = v23;
    __int16 v44 = 2048;
    int64_t v45 = v22;
    __int16 v46 = 2048;
    int64_t v47 = v21;
    __int16 v48 = 2048;
    int64_t v49 = v20;
    __int16 v50 = 2114;
    v51 = v19;
    __int16 v52 = 2114;
    id v53 = v18;
    __int16 v54 = 2114;
    v55 = v17;
    __int16 v56 = 2114;
    id v57 = v16;
    __int16 v58 = 2048;
    unint64_t v59 = v15;
    __int16 v60 = 2112;
    v61 = v12;
    __int16 v62 = 2048;
    int64_t v63 = v13;
    __int16 v64 = 2114;
    v65 = v14;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[CA] HMDCharacteristicReadWriteLogEvent -- %{public}@ %{public}tu characteristic(s) on accessory %{public}@ (%@) completed with error: %{public}@ (Resident first error: %{public}@), Total duration: %ld ms (Local duration: %ld ms, Resident first duration: %ld ms) using transport: %{public}@, Request source: %{public}@, isReachable:%{public}@, hasSession: %{public}@, recentSessionRetries: %lu, topSessionFailureErrorDomain: %@, topSessionFailureErrorCode: %ld, homeThreadCapable: %{public}@", buf, 0xB6u);
  }
}

- (void)markEndTime
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicReadWriteLogEvent;
  [(HMMDatedHomeLogEvent *)&v4 markEndTime];
  os_unfair_lock_lock_with_options();
  id v3 = [(HMDCharacteristicReadWriteLogEvent *)self readWriteLogEventManager];
  [v3 updateStatisticsForLogEvent:self];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setResidentFirstEndTime:(double)a3
{
  [(HMMLogEvent *)self startTime];
  [(HMDCharacteristicReadWriteLogEvent *)self setResidentFirstDurationInMilliseconds:(uint64_t)((a3 - v5) * 1000.0)];
}

- (HMDCharacteristicReadWriteLogEvent)initWithStartTime:(double)a3 characteristics:(id)a4 hmdAccessory:(id)a5 hapAccessory:(id)a6 source:(unint64_t)a7 isWriteOperation:(BOOL)a8 isTimedWrite:(BOOL)a9 isLocal:(BOOL)a10 transactionId:(id)a11 isCached:(BOOL)a12 bundleId:(id)a13 userUUID:(id)a14 writtenValues:(id)a15
{
  BOOL v15 = a8;
  uint64_t v223 = *MEMORY[0x263EF8340];
  id v193 = a4;
  id v21 = a5;
  id v22 = a6;
  id v202 = a11;
  id v201 = a13;
  id v23 = v22;
  id v24 = a14;
  id v200 = a15;
  v25 = [v21 home];
  v26 = [v25 uuid];
  v212.receiver = self;
  v212.super_class = (Class)HMDCharacteristicReadWriteLogEvent;
  v27 = [(HMMDatedHomeLogEvent *)&v212 initWithStartTime:v26 homeUUID:a3];

  if (v27)
  {
    id v195 = v24;
    uint64_t v28 = +[HMDCharacteristicReadWriteLogEventManager sharedInstance];
    readWriteLogEventManager = v27->_readWriteLogEventManager;
    v27->_readWriteLogEventManager = (HMDCharacteristicReadWriteLogEventManager *)v28;

    v30 = [(HMDCharacteristicReadWriteLogEvent *)v27 readWriteLogEventManager];
    v204 = v25;
    v31 = [v25 wifiManager];
    [v30 _setupNetworkCacheWithWifiManager:v31];

    uint64_t v32 = [MEMORY[0x263F424F0] currentClientMetricIdentifier];
    clientMetricIdentifier = v27->_clientMetricIdentifier;
    v203 = v27;
    v27->_clientMetricIdentifier = (NSString *)v32;

    __int16 v34 = (void *)MEMORY[0x230FBD990]();
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      unint64_t v37 = (void *)v36;
      __int16 v38 = @"Reading";
      if (v15) {
        __int16 v38 = @"Writing";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v38;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@[HMDCharacteristicReadWriteLogEvent] %@...", buf, 0x16u);
    }
    id v39 = v21;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v40 = v39;
    }
    else {
      __int16 v40 = 0;
    }
    id v41 = v40;
    v198 = v39;

    v192 = [v23 server];
    if (v41)
    {
      v203->_accessoryCertificationStatus = [v41 certificationStatus];
      v203->_communicationProtocol = [v41 communicationProtocol];
      uint64_t v42 = [v41 expectedTransport];
      expectedTransport = v203->_expectedTransport;
      v203->_expectedTransport = (NSString *)v42;
    }
    uint64_t v44 = [v39 uuid];
    accessoryUUID = v203->_accessoryUUID;
    v203->_accessoryUUID = (NSUUID *)v44;

    uint64_t v46 = [v39 identifier];
    accessoryIdentifier = v203->_accessoryIdentifier;
    v203->_accessoryIdentifier = (NSString *)v46;

    uint64_t v48 = [v39 spiClientIdentifier];
    accessoryUniqueIdentifier = v203->_accessoryUniqueIdentifier;
    v203->_accessoryUniqueIdentifier = (NSUUID *)v48;

    uint64_t v50 = [v39 name];
    accessoryName = v203->_accessoryName;
    v203->_accessoryName = (NSString *)v50;

    __int16 v52 = [v39 category];
    uint64_t v53 = [v52 categoryType];
    accessoryCategory = v203->_accessoryCategory;
    v203->_accessoryCategory = (NSString *)v53;

    uint64_t v55 = [v39 manufacturer];
    accessoryManufacturer = v203->_accessoryManufacturer;
    v203->_accessoryManufacturer = (NSString *)v55;

    id v57 = [v39 room];
    uint64_t v58 = [v57 spiClientIdentifier];
    accessoryRoomUniqueIdentifier = v203->_accessoryRoomUniqueIdentifier;
    v203->_accessoryRoomUniqueIdentifier = (NSUUID *)v58;

    v194 = v57;
    __int16 v60 = [v57 name];
    uint64_t v61 = [v60 copy];
    accessoryRoomName = v203->_accessoryRoomName;
    v203->_accessoryRoomName = (NSString *)v61;

    int64_t v63 = [v41 accessoryMetric];
    __int16 v64 = [v63 sessionMetric];

    v203->_hasSession = [v198 hasActiveSession];
    v203->_reachable = [v198 isReachable];
    uint64_t v65 = [v64 successfulSessionRetries];
    v203->_recentSessionRetries = [v64 sessionFailures] + v65;
    uint64_t v66 = [v64 topError];
    v203->_topSessionFailureErrorCode = [v66 code];

    v189 = v64;
    v67 = [v64 topError];
    uint64_t v68 = [v67 domain];
    topSessionFailureErrorDomain = v203->_topSessionFailureErrorDomain;
    v203->_topSessionFailureErrorDomain = (NSString *)v68;

    id v70 = v41;
    v71 = [v204 threadNetworkID];
    v203->_homeThreadCapable = v71 != 0;

    v203->_lastKnownLinkQuality = 5;
    objc_storeStrong((id *)&v203->_characteristicsInRequest, a4);
    v203->_triggerSource = a7;
    v203->_isWriteOperation = v15;
    v203->_isTimedWrite = a9;
    v203->_isLocal = a10;
    uint64_t v72 = [v202 UUIDString];
    transactionIdentifier = v203->_transactionIdentifier;
    v203->_transactionIdentifier = (NSString *)v72;

    v203->_isCached = a12;
    v203->_linkType = [v23 linkType];
    v203->_linkLayerType = [v23 linkLayerType];
    v74 = [v192 version];
    uint64_t v75 = [v74 versionString];
    transportProtocolVersion = v203->_transportProtocolVersion;
    v203->_transportProtocolVersion = (NSString *)v75;

    v197 = v70;
    uint64_t v77 = +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:v70];
    primaryServiceType = v203->_primaryServiceType;
    v203->_primaryServiceType = (NSString *)v77;

    if (v24)
    {
      uint64_t v79 = [v24 UUIDString];
      userUUID = v203->_userUUID;
      v203->_userUUID = (NSString *)v79;
    }
    else
    {
      userUUID = [v204 currentUser];
      id v81 = [userUUID uuid];
      uint64_t v82 = [v81 UUIDString];
      id v83 = v203->_userUUID;
      v203->_userUUID = (NSString *)v82;
    }
    v84 = [v204 spiClientIdentifier];
    uint64_t v85 = [v84 copy];
    homeUniqueIdentifier = v203->_homeUniqueIdentifier;
    v203->_homeUniqueIdentifier = (NSUUID *)v85;

    double v87 = [v204 name];
    uint64_t v88 = [v87 copy];
    homeName = v203->_homeName;
    v203->_homeName = (NSString *)v88;

    uint64_t v90 = [v204 atHomeLevel];
    BOOL v91 = 1;
    if (v90 != 2) {
      BOOL v91 = [v204 atHomeLevel] == 3;
    }
    v203->_isAtHome = v91;
    v92 = [v204 residentDeviceManager];
    v203->_isResidentAvailable = [v92 isResidentAvailable];

    double v93 = [v204 residentDeviceManager];
    v203->_isCurrentDeviceAvailableResident = [v93 isCurrentDeviceAvailableResident];

    v94 = [v204 residentDeviceManager];
    v203->_isCurrentDevicePrimaryResident = [v94 isCurrentDevicePrimaryResident];

    v95 = [v204 residentDeviceManager];
    v203->_isCurrentDeviceConfirmedPrimaryResident = [v95 isCurrentDeviceConfirmedPrimaryResident];

    v96 = [v204 residentDeviceManager];
    v97 = [v96 primaryResidentDevice];
    v203->_isPrimaryResidentReachable = [v97 isReachable];

    unint64_t v98 = [v204 currentUser];
    v203->_isRemoteAccessAllowed = [v98 isRemoteAccessAllowed];

    v203->_isRemotelyReachable = [v198 isRemotelyReachable];
    id v99 = [v204 enabledResidents];
    v203->_hasEnabledResidents = [v99 count] != 0;

    v100 = v204;
    v203->_isResidentFirstEnabled = 1;
    id v101 = v203;
    v203->_isDeviceAtHome = [v204 homeLocation] == 1;
    uint64_t v102 = +[HMDMetricsUtilities redactedThirdPartyBundleID:v201];
    bundleId = v203->_bundleId;
    v203->_bundleId = (NSString *)v102;

    v190 = v23;
    id v191 = v21;
    if (v204)
    {
      id v104 = [(HMDCharacteristicReadWriteLogEvent *)v203 characteristicsInRequest];
      id v206 = v204;
      id v105 = [MEMORY[0x263EFF9A0] dictionary];
      long long v215 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      long long v218 = 0u;
      id v106 = v104;
      uint64_t v107 = [v106 countByEnumeratingWithState:&v215 objects:buf count:16];
      if (v107)
      {
        uint64_t v108 = v107;
        uint64_t v109 = *(void *)v216;
        do
        {
          for (uint64_t i = 0; i != v108; ++i)
          {
            if (*(void *)v216 != v109) {
              objc_enumerationMutation(v106);
            }
            uint64_t v111 = [*(id *)(*((void *)&v215 + 1) + 8 * i) service];
            v112 = v111;
            if (v111)
            {
              uint64_t v113 = [v111 uuid];
              uint64_t v114 = [v105 objectForKeyedSubscript:v113];

              if (!v114)
              {
                v115 = [v206 serviceGroups];
                v213[0] = MEMORY[0x263EF8330];
                v213[1] = 3221225472;
                v213[2] = __90__HMDCharacteristicReadWriteLogEvent_serviceUUIDToServiceGroupsForCharacteristics_inHome___block_invoke;
                v213[3] = &unk_264A26458;
                id v116 = v112;
                id v214 = v116;
                v117 = objc_msgSend(v115, "na_firstObjectPassingTest:", v213);

                if (v117)
                {
                  v118 = [v116 uuid];
                  [v105 setObject:v117 forKeyedSubscript:v118];
                }
              }
            }
          }
          uint64_t v108 = [v106 countByEnumeratingWithState:&v215 objects:buf count:16];
        }
        while (v108);
      }

      v119 = (void *)[v105 copy];
      id v23 = v190;
      id v24 = v195;
      id v101 = v203;
      v100 = v204;
    }
    else
    {
      v119 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v120 = objc_msgSend(v119, "na_dictionaryByMappingValues:", &__block_literal_global_356);
    uint64_t v188 = objc_msgSend(v119, "na_dictionaryByMappingValues:", &__block_literal_global_359_202349);
    uint64_t v121 = [v188 copy];
    serviceUUIDToServiceGroupName = v101->_serviceUUIDToServiceGroupName;
    v101->_serviceUUIDToServiceGroupName = (NSDictionary *)v121;

    v207 = v120;
    uint64_t v123 = [v120 copy];
    serviceUUIDToServiceGroupUniqueIdentifier = v101->_serviceUUIDToServiceGroupUniqueIdentifier;
    v101->_serviceUUIDToServiceGroupUniqueIdentifier = (NSDictionary *)v123;

    id v125 = (void *)MEMORY[0x263EFFA68];
    v126 = v197;
    if (v100 && v194)
    {
      id v127 = [v194 uuid];
      v128 = [v204 zones];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __62__HMDCharacteristicReadWriteLogEvent_zonesForRoomUUID_inHome___block_invoke;
      v221 = &unk_264A26430;
      id v129 = v127;
      v100 = v204;
      id v130 = v129;
      id v222 = v129;
      id v125 = objc_msgSend(v128, "na_filter:", buf);

      v126 = v197;
    }
    uint64_t v131 = objc_msgSend(v125, "na_map:", &__block_literal_global_362);
    accessoryZoneUniqueIdentifiers = v101->_accessoryZoneUniqueIdentifiers;
    v101->_accessoryZoneUniqueIdentifiers = (NSArray *)v131;

    uint64_t v187 = v125;
    uint64_t v133 = objc_msgSend(v125, "na_map:", &__block_literal_global_364_202350);
    accessoryZoneNames = v101->_accessoryZoneNames;
    v101->_accessoryZoneNames = (NSArray *)v133;

    v135 = [v100 accessories];
    v101->_numAccessoriesInHome = [v135 count];

    id v136 = [v100 actionSets];
    v137 = (void *)[v136 copy];

    uint64_t v186 = v137;
    v138 = objc_msgSend(v137, "na_filter:", &__block_literal_global_367);
    v101->_numNonEmptyScenesInHome = [v138 count];

    v139 = [v198 accessoryProfiles];
    uint64_t v140 = objc_msgSend(v139, "na_firstObjectPassingTest:", &__block_literal_global_370_202351);

    v199 = v140;
    uint64_t v141 = [v140 mediaRouteID];
    accessoryMediaRouteID = v101->_accessoryMediaRouteID;
    v101->_accessoryMediaRouteID = (NSString *)v141;

    uint64_t v143 = [v200 copy];
    writtenValues = v101->_writtenValues;
    v101->_writtenValues = (NSArray *)v143;

    v145 = [v126 findServiceWithServiceType:@"00000701-0000-1000-8000-0026BB765291"];

    if (v145) {
      v101->_threadAccessory = 1;
    }
    v146 = [v23 server];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v146) {
      v101->_isSentOverThread = 1;
    }
    v147 = [v100 homeManager];
    v148 = [v147 reachabilityMonitor];
    v101->_isNetworkAvailable = [v148 isReachable];

    v101->_isLocalFallback = 0;
    v101->_isLinkFallback = 0;
    v149 = [v100 residentDeviceManager];
    v150 = [v149 confirmedPrimaryResidentDevice];
    v101->_isPrimaryResidentAvailable = v150 != 0;

    [(HMDCharacteristicReadWriteLogEvent *)v101 setTimeIntervalSinceCurrentDeviceAsPrimary:0.0];
    [v100 currentDeviceBecamePrimaryTime];
    if ((int)v151 >= 1)
    {
      HMFUptime();
      double v153 = v152;
      [v100 currentDeviceBecamePrimaryTime];
      [(HMDCharacteristicReadWriteLogEvent *)v101 setTimeIntervalSinceCurrentDeviceAsPrimary:v153 - v154];
    }
    [(HMDCharacteristicReadWriteLogEvent *)v101 setTimeIntervalSincePrimaryChanged:0.0];
    [v100 primaryResidentChangedTime];
    if ((int)v155 >= 1)
    {
      HMFUptime();
      double v157 = v156;
      [v100 primaryResidentChangedTime];
      [(HMDCharacteristicReadWriteLogEvent *)v101 setTimeIntervalSincePrimaryChanged:v157 - v158];
    }
    [(HMDCharacteristicReadWriteLogEvent *)v101 setTimeIntervalSincePrimaryLost:0.0];
    v159 = [v100 reachabilityNotificationManager];
    [v159 primaryResidentUnreachableTime];
    int v161 = (int)v160;

    BOOL v162 = v161 < 1;
    v163 = v204;
    if (!v162)
    {
      HMFUptime();
      double v165 = v164;
      v166 = [v204 reachabilityNotificationManager];
      [v166 primaryResidentUnreachableTime];
      [(HMDCharacteristicReadWriteLogEvent *)v101 setTimeIntervalSincePrimaryLost:v165 - v167];
    }
    v168 = [v204 residentDeviceManager];
    v169 = [v168 residentDevices];
    uint64_t v170 = [v169 count];

    if (v170)
    {
      id v185 = v119;
      uint64_t v171 = [v204 residentDeviceManager];
      uint64_t v172 = [v171 residentDevices];
      unint64_t v173 = [v172 count];

      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      uint64_t v174 = [v204 residentDeviceManager];
      uint64_t v175 = [v174 residentDevices];

      uint64_t v176 = [v175 countByEnumeratingWithState:&v208 objects:v219 count:16];
      if (v176)
      {
        uint64_t v177 = v176;
        uint64_t v178 = 0;
        uint64_t v179 = 0;
        uint64_t v180 = *(void *)v209;
        do
        {
          for (uint64_t j = 0; j != v177; ++j)
          {
            if (*(void *)v209 != v180) {
              objc_enumerationMutation(v175);
            }
            uint64_t v182 = *(void **)(*((void *)&v208 + 1) + 8 * j);
            if ([v182 isEnabled])
            {
              v178 += [v182 isReachable];
              v179 += [v182 isReachableByIDS];
            }
          }
          uint64_t v177 = [v175 countByEnumeratingWithState:&v208 objects:v219 count:16];
        }
        while (v177);
      }
      else
      {
        uint64_t v178 = 0;
        uint64_t v179 = 0;
      }

      [(HMDCharacteristicReadWriteLogEvent *)v203 setPercentageOfLocalReachableResidents:100 * v178 / v173];
      [(HMDCharacteristicReadWriteLogEvent *)v203 setPercentageOfIDSReachableResidents:100 * v179 / v173];
      id v23 = v190;
      id v21 = v191;
      id v24 = v195;
      v163 = v204;
      v119 = v185;
    }
    uint64_t v183 = [v163 threadNetworkIsUp];
    v25 = v163;
    v27 = v203;
    [(HMDCharacteristicReadWriteLogEvent *)v203 setIsThreadNetworkUpInHome:v183];
    -[HMDCharacteristicReadWriteLogEvent setThreadPreferredNetworkExistsInHome:](v203, "setThreadPreferredNetworkExistsInHome:", [v25 threadPreferredNetworkExists]);
    -[HMDCharacteristicReadWriteLogEvent setThreadNetworkConnectionState:](v203, "setThreadNetworkConnectionState:", [v25 threadNetworkConnectionState]);
    -[HMDCharacteristicReadWriteLogEvent setThreadNetworkNodeType:](v203, "setThreadNetworkNodeType:", [v25 threadNetworkNodeType]);
  }
  return v27;
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

BOOL __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 name];
}

id __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 spiClientIdentifier];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

uint64_t __62__HMDCharacteristicReadWriteLogEvent_zonesForRoomUUID_inHome___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 roomUUIDs];
  objc_super v4 = [*(id *)(a1 + 32) UUIDString];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 name];
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 spiClientIdentifier];
}

uint64_t __90__HMDCharacteristicReadWriteLogEvent_serviceUUIDToServiceGroupsForCharacteristics_inHome___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 serviceUUIDs];
  objc_super v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = [v3 containsObject:v5];

  return v6;
}

- (HMDCharacteristicReadWriteLogEvent)initWithCharacteristics:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isWriteOperation:(BOOL)a7 isTimedWrite:(BOOL)a8 isLocal:(BOOL)a9 transactionId:(id)a10 isCached:(BOOL)a11 bundleId:(id)a12 userUUID:(id)a13 writtenValues:(id)a14
{
  BOOL v31 = a7;
  BOOL v32 = a8;
  int v17 = (void *)MEMORY[0x263F499B8];
  id v18 = a14;
  id v19 = a13;
  id v20 = a12;
  id v21 = a10;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  [v17 currentTime];
  LOBYTE(v28) = a11;
  LOBYTE(v27) = a9;
  v25 = -[HMDCharacteristicReadWriteLogEvent initWithStartTime:characteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:](self, "initWithStartTime:characteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:", v24, v23, v22, a6, v31, v32, v27, v21, v28, v20, v19, v18);

  return v25;
}

+ (id)eventWithStartTime:(double)a3 characteristicsToWrite:(id)a4 hmdAccessory:(id)a5 hapAccessory:(id)a6 source:(unint64_t)a7 isTimedWrite:(BOOL)a8 isLocal:(BOOL)a9 transactionId:(id)a10 bundleId:(id)a11 userUUID:(id)a12 writtenValues:(id)a13
{
  BOOL v30 = a8;
  id v19 = a13;
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  LOBYTE(v29) = 0;
  LOBYTE(v28) = a9;
  v26 = [[HMDCharacteristicReadWriteLogEvent alloc] initWithStartTime:v25 characteristics:v24 hmdAccessory:v23 hapAccessory:a7 source:1 isWriteOperation:v30 isTimedWrite:a3 isLocal:v28 transactionId:v22 isCached:v29 bundleId:v21 userUUID:v20 writtenValues:v19];

  return v26;
}

+ (id)eventWithCharacteristicsToWrite:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isTimedWrite:(BOOL)a7 isLocal:(BOOL)a8 transactionId:(id)a9 bundleId:(id)a10 userUUID:(id)a11 writtenValues:(id)a12
{
  BOOL v28 = a7;
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOBYTE(v27) = 0;
  LOBYTE(v26) = a8;
  id v24 = [[HMDCharacteristicReadWriteLogEvent alloc] initWithCharacteristics:v23 hmdAccessory:v22 hapAccessory:v21 source:a6 isWriteOperation:1 isTimedWrite:v28 isLocal:v26 transactionId:v20 isCached:v27 bundleId:v19 userUUID:v18 writtenValues:v17];

  return v24;
}

+ (id)eventWithCharacteristicsToRead:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isLocal:(BOOL)a7 transactionId:(id)a8 isCached:(BOOL)a9 bundleId:(id)a10 userUUID:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [HMDCharacteristicReadWriteLogEvent alloc];
  LOBYTE(v27) = a9;
  LOBYTE(v26) = a7;
  id v24 = [(HMDCharacteristicReadWriteLogEvent *)v23 initWithCharacteristics:v22 hmdAccessory:v21 hapAccessory:v20 source:a6 isWriteOperation:0 isTimedWrite:0 isLocal:v26 transactionId:v19 isCached:v27 bundleId:v18 userUUID:v17 writtenValues:MEMORY[0x263EFFA68]];

  return v24;
}

@end