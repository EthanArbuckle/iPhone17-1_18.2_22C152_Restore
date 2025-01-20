@interface HMDMediaPlaybackActionEvent
- (BOOL)isPlaybackArchivePresent;
- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3;
- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3;
- (HMDMediaPlaybackActionEvent)initWithIsPlaybackArchivePresent:(BOOL)a3 playbackStateNumber:(id)a4 volumeNumber:(id)a5 sourceNumber:(id)a6 sourceClientName:(id)a7 accessories:(id)a8;
- (NSArray)accessories;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)playbackStateNumber;
- (NSNumber)sourceNumber;
- (NSNumber)volumeNumber;
- (NSString)clientMetricIdentifier;
- (NSString)coreAnalyticsEventName;
- (NSString)playbackStateString;
- (NSString)sourceClientName;
- (NSString)sourceString;
- (id)biomeEventsRepresentationForLogObserver:(id)a3;
- (id)microLocationMetadataForLogEventObserver:(id)a3;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3;
- (unint64_t)numAccessoriesInHome;
- (unint64_t)numNonEmptyScenesInHome;
- (unint64_t)numberOfMediaProfiles;
@end

@implementation HMDMediaPlaybackActionEvent

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  v90 = self;
  v4 = [(HMDMediaPlaybackActionEvent *)self accessories];
  v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_788);
  v6 = [v5 home];

  v83 = v6;
  if (v6)
  {
    if (v90)
    {
      v7 = (objc_class *)MEMORY[0x1E4F28C18];
      id v8 = v6;
      id v9 = [v7 alloc];
      v10 = [(HMMDatedLogEvent *)v90 startDate];
      v11 = [(HMMDatedLogEvent *)v90 endDate];
      v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

      id v13 = objc_alloc(MEMORY[0x1E4F50370]);
      v14 = [v8 spiClientIdentifier];
      v15 = [v14 UUIDString];
      uint64_t v16 = [v8 atHomeLevel];

      BOOL v17 = (v16 & 0xFFFFFFFFFFFFFFFELL) == 2;
      v18 = [(HMDMediaPlaybackActionEvent *)v90 sourceNumber];
      unint64_t v19 = [v18 unsignedIntegerValue];
      if (v19 > 9) {
        v20 = @"Unknown";
      }
      else {
        v20 = off_1E6A07FB8[v19];
      }
      v26 = v20;
      v27 = [(HMDMediaPlaybackActionEvent *)v90 sourceClientName];
      v28 = [(HMDMediaPlaybackActionEvent *)v90 clientMetricIdentifier];
      if (v28)
      {
        v74 = (void *)[v13 initWithDateInterval:v12 homeUniqueIdentifier:v15 homeOccupancy:v17 source:v26 clientName:v27 eventCorrelationIdentifier:v28];
      }
      else
      {
        [MEMORY[0x1E4F29128] UUID];
        v88 = v14;
        v30 = v29 = v12;
        v31 = [v30 UUIDString];
        v74 = (void *)[v13 initWithDateInterval:v29 homeUniqueIdentifier:v15 homeOccupancy:v17 source:v26 clientName:v27 eventCorrelationIdentifier:v31];

        v12 = v29;
        v14 = v88;
      }
    }
    else
    {
      v74 = 0;
    }
    v32 = (void *)MEMORY[0x1E4F1CA48];
    v33 = [(HMDMediaPlaybackActionEvent *)v90 accessories];
    v73 = objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = [(HMDMediaPlaybackActionEvent *)v90 accessories];
    uint64_t v89 = [obj countByEnumeratingWithState:&v93 objects:v101 count:16];
    if (v89)
    {
      uint64_t v34 = *(void *)v94;
      uint64_t v75 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v89; ++i)
        {
          if (*(void *)v94 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          v37 = [v36 room];
          if (v37)
          {
            v38 = [v36 accessoryProfiles];
            v39 = objc_msgSend(v38, "na_firstObjectPassingTest:", &__block_literal_global_77);

            if (v39)
            {
              v40 = [v83 zones];
              v91[0] = MEMORY[0x1E4F143A8];
              v91[1] = 3221225472;
              v91[2] = __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_79;
              v91[3] = &unk_1E6A123A0;
              v87 = v37;
              id v41 = v37;
              id v92 = v41;
              v42 = objc_msgSend(v40, "na_filter:", v91);

              uint64_t v85 = objc_msgSend(v42, "na_map:", &__block_literal_global_83);
              uint64_t v84 = objc_msgSend(v42, "na_map:", &__block_literal_global_85);
              v43 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
              v44 = [(HMDMediaPlaybackActionEvent *)v90 playbackStateNumber];
              uint64_t v45 = [v44 integerValue];

              if (v45)
              {
                v46 = [(HMDMediaPlaybackActionEvent *)v90 playbackStateNumber];
                [v43 setObject:v46 forKeyedSubscript:@"playback-state"];
              }
              v86 = v42;
              v47 = [(HMDMediaPlaybackActionEvent *)v90 volumeNumber];

              if (v47)
              {
                v48 = [(HMDMediaPlaybackActionEvent *)v90 volumeNumber];
                [v43 setObject:v48 forKeyedSubscript:@"volume"];
              }
              if ([v43 count])
              {
                id v77 = objc_alloc(MEMORY[0x1E4F50378]);
                v79 = [v36 spiClientIdentifier];
                v76 = [v79 UUIDString];
                v49 = (void *)[v43 copy];
                v50 = [v39 mediaRouteID];
                [v41 spiClientIdentifier];
                v78 = v80 = v43;
                [v78 UUIDString];
                v51 = v81 = v39;
                v52 = [v36 name];
                v53 = [v41 name];
                v54 = [v83 name];
                v56 = (void *)v84;
                v55 = (void *)v85;
                v57 = (void *)[v77 initWithBase:v74 accessoryUniqueIdentifier:v76 accessoryStateString:MEMORY[0x1E4F1CC08] accessoryStateNumber:v49 accessoryStateData:MEMORY[0x1E4F1CC08] accessoryMediaRouteIdentifier:v50 zoneUniqueIdentifiers:v85 roomUniqueIdentifier:v51 accessoryName:v52 roomName:v53 zoneNames:v84 homeName:v54];
                [v73 addObject:v57];

                v39 = v81;
                v43 = v80;

                uint64_t v34 = v75;
                v58 = v86;
              }
              else
              {
                v67 = (void *)MEMORY[0x1D9452090]();
                v68 = v90;
                v69 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  v70 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v98 = v70;
                  __int16 v99 = 2112;
                  v100 = v36;
                  _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no media state for media accessory: %@", buf, 0x16u);
                }
                uint64_t v34 = v75;
                v55 = (void *)v85;
                v58 = v42;
                v56 = (void *)v84;
              }

              v37 = v87;
            }
            else
            {
              v63 = (void *)MEMORY[0x1D9452090]();
              v64 = v90;
              v65 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                v66 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v98 = v66;
                __int16 v99 = 2112;
                v100 = v36;
                _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no media profile for media accessory: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            v59 = (void *)MEMORY[0x1D9452090]();
            v60 = v90;
            v61 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              v62 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v98 = v62;
              __int16 v99 = 2112;
              v100 = v36;
              _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@Unable to log media event metadata to biome, no room for accessory: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v89 = [obj countByEnumeratingWithState:&v93 objects:v101 count:16];
      }
      while (v89);
    }

    v25 = (void *)[v73 copy];
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = v90;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v98 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to log media event metadata to biome, no home", buf, 0xCu);
    }
    v25 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

uint64_t __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_79(uint64_t a1, void *a2)
{
  v3 = [a2 roomUUIDs];
  v4 = [*(id *)(a1 + 32) uuid];
  v5 = [v4 UUIDString];
  uint64_t v6 = [v3 containsObject:v5];

  return v6;
}

uint64_t __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 name];
}

id __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 spiClientIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

uint64_t __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_74(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

BOOL __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 home];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3
{
  return 1;
}

- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3
{
  unint64_t v4 = [(HMDMediaPlaybackActionEvent *)self numAccessoriesInHome];
  unint64_t v5 = [(HMDMediaPlaybackActionEvent *)self numNonEmptyScenesInHome];
  uint64_t v6 = [(HMDMediaPlaybackActionEvent *)self sourceNumber];
  unint64_t v7 = [v6 unsignedIntegerValue];
  if (v5 + v4 > 3) {
    unsigned int v8 = (v7 < 7) & (0x67u >> v7);
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3
{
  unint64_t v4 = [(HMDMediaPlaybackActionEvent *)self numAccessoriesInHome];
  unint64_t v5 = [(HMDMediaPlaybackActionEvent *)self numNonEmptyScenesInHome];
  uint64_t v6 = [(HMDMediaPlaybackActionEvent *)self sourceNumber];
  unint64_t v7 = [v6 unsignedIntegerValue];
  if (v5 + v4 > 3) {
    unsigned int v8 = (v7 < 7) & (0x67u >> v7);
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)microLocationMetadataForLogEventObserver:(id)a3
{
  unint64_t v4 = [(HMDMediaPlaybackActionEvent *)self accessories];
  unint64_t v5 = [v4 firstObject];

  uint64_t v6 = [(HMDMediaPlaybackActionEvent *)self playbackStateNumber];
  uint64_t v7 = [v6 integerValue];

  if (v7)
  {
    unsigned int v8 = [(HMDMediaPlaybackActionEvent *)self playbackStateString];
    id v9 = @"playback-state";
  }
  else
  {
    v10 = [(HMDMediaPlaybackActionEvent *)self volumeNumber];

    if (v10)
    {
      v11 = [(HMDMediaPlaybackActionEvent *)self volumeNumber];
      unsigned int v8 = [v11 stringValue];

      id v9 = @"volume";
    }
    else
    {
      id v9 = @"media";
      unsigned int v8 = @"unknown";
    }
  }
  v12 = (void *)MEMORY[0x1E4F77EF0];
  id v13 = [v5 spiClientIdentifier];
  v14 = [v13 UUIDString];
  v15 = [(HMDMediaPlaybackActionEvent *)self sourceString];
  uint64_t v16 = [v5 room];
  BOOL v17 = [v16 spiClientIdentifier];
  v18 = [v17 UUIDString];
  unint64_t v19 = [v12 metadataForHomekitAccessoryControlEventWithUUID:v14 stateString:v8 serviceUUID:v9 serviceType:v9 characteristicType:v9 serviceGroupUUID:&stru_1F2C9F1A8 source:v15 roomUUID:v18];

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceClientName, 0);
  objc_storeStrong((id *)&self->_sourceNumber, 0);
  objc_storeStrong((id *)&self->_volumeNumber, 0);
  objc_storeStrong((id *)&self->_playbackStateNumber, 0);
}

- (unint64_t)numNonEmptyScenesInHome
{
  return self->_numNonEmptyScenesInHome;
}

- (unint64_t)numAccessoriesInHome
{
  return self->_numAccessoriesInHome;
}

- (NSArray)accessories
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)numberOfMediaProfiles
{
  return self->_numberOfMediaProfiles;
}

- (NSString)clientMetricIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)sourceClientName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)sourceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)volumeNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)playbackStateNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isPlaybackArchivePresent
{
  return self->_isPlaybackArchivePresent;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDMediaPlaybackActionEvent isPlaybackArchivePresent](self, "isPlaybackArchivePresent"));
  [v3 setObject:v4 forKeyedSubscript:@"playbackArchivePresent"];

  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDMediaPlaybackActionEvent numberOfMediaProfiles](self, "numberOfMediaProfiles"));
  [v3 setObject:v5 forKeyedSubscript:@"numberOfMediaProfiles"];

  uint64_t v6 = +[HMDLogEventHistograms highVolumeHistogram];
  uint64_t v7 = objc_msgSend(v6, "intervalIndexForValue:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v7 forKeyedSubscript:@"duration"];

  unsigned int v8 = [(HMDMediaPlaybackActionEvent *)self volumeNumber];
  if (v8)
  {
    id v9 = +[HMDLogEventHistograms lowVolumeHistogram];
    v10 = [(HMDMediaPlaybackActionEvent *)self volumeNumber];
    v11 = objc_msgSend(v9, "intervalIndexForValue:", objc_msgSend(v10, "unsignedIntegerValue"));
    [v3 setObject:v11 forKeyedSubscript:@"volume"];
  }
  else
  {
    [v3 setObject:&unk_1F2DC8680 forKeyedSubscript:@"volume"];
  }

  v12 = [(HMDMediaPlaybackActionEvent *)self playbackStateString];
  [v3 setObject:v12 forKeyedSubscript:@"playbackState"];

  id v13 = [(HMDMediaPlaybackActionEvent *)self sourceString];
  [v3 setObject:v13 forKeyedSubscript:@"actionSource"];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.media.playbackAction";
}

- (NSString)sourceString
{
  id v2 = [(HMDMediaPlaybackActionEvent *)self sourceNumber];
  unint64_t v3 = [v2 unsignedIntegerValue];
  if (v3 > 9) {
    unint64_t v4 = @"Unknown";
  }
  else {
    unint64_t v4 = off_1E6A07FB8[v3];
  }
  unint64_t v5 = v4;

  return v5;
}

- (NSString)playbackStateString
{
  unint64_t v3 = [(HMDMediaPlaybackActionEvent *)self playbackStateNumber];

  if (v3)
  {
    unint64_t v4 = [(HMDMediaPlaybackActionEvent *)self playbackStateNumber];
    [v4 integerValue];
    playbackStateAsString();
    unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v5 = @"Unset";
  }
  return (NSString *)v5;
}

- (HMDMediaPlaybackActionEvent)initWithIsPlaybackArchivePresent:(BOOL)a3 playbackStateNumber:(id)a4 volumeNumber:(id)a5 sourceNumber:(id)a6 sourceClientName:(id)a7 accessories:(id)a8
{
  id v15 = a4;
  id v32 = a5;
  id v16 = a6;
  BOOL v17 = (__CFString *)a7;
  id v18 = a8;
  v33.receiver = self;
  v33.super_class = (Class)HMDMediaPlaybackActionEvent;
  unint64_t v19 = [(HMMDatedLogEvent *)&v33 init];
  if (v19)
  {
    [MEMORY[0x1E4F653F0] currentActivity];
    v20 = id v31 = v15;
    uint64_t v21 = [v20 clientMetricIdentifier];
    clientMetricIdentifier = v19->_clientMetricIdentifier;
    v19->_clientMetricIdentifier = (NSString *)v21;

    v19->_isPlaybackArchivePresent = a3;
    v19->_numberOfMediaProfiles = [v18 count];
    objc_storeStrong((id *)&v19->_playbackStateNumber, a4);
    objc_storeStrong((id *)&v19->_volumeNumber, a5);
    objc_storeStrong((id *)&v19->_sourceNumber, a6);
    if (v17) {
      v23 = v17;
    }
    else {
      v23 = @"Unknown";
    }
    objc_storeStrong((id *)&v19->_sourceClientName, v23);
    objc_storeStrong((id *)&v19->_accessories, a8);
    v24 = [v18 firstObject];
    v25 = [v24 home];

    v26 = [v25 accessories];
    v19->_numAccessoriesInHome = [v26 count];

    v27 = [v25 actionSets];
    v28 = (void *)[v27 copy];

    v29 = objc_msgSend(v28, "na_filter:", &__block_literal_global_98819);
    v19->_numNonEmptyScenesInHome = [v29 count];

    id v15 = v31;
  }

  return v19;
}

BOOL __139__HMDMediaPlaybackActionEvent_initWithIsPlaybackArchivePresent_playbackStateNumber_volumeNumber_sourceNumber_sourceClientName_accessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

@end