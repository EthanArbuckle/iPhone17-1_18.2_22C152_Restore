@interface HMDCameraAudioParameterSelection
+ (id)logCategory;
- (BOOL)_selectParametersFromCodec:(id)a3 bitRateSettings:(id)a4 sampleRates:(id)a5 audioChannelCount:(id)a6;
- (BOOL)selectAudioParameters;
- (HMDAudioCodecGroup)selectedCodecGroupType;
- (HMDAudioSampleRate)selectedSampleRate;
- (HMDBitRateSetting)selectedBitRateSetting;
- (HMDCameraAudioParameterCombination)selectedAudioParameterCombination;
- (HMDCameraAudioParameterSelection)initWithSessionID:(id)a3 supportedAudioConfiguration:(id)a4 supportedRTPConfiguration:(id)a5 streamingCapabilities:(id)a6;
- (HMDSelectedAudioParameters)selectedAudioParameters;
- (HMDStreamingCapabilities)streamingCapabilities;
- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration;
- (HMDSupportedRTPConfiguration)rtpConfiguration;
- (NSArray)audioCodecsPreference;
- (NSArray)bitrateSettingsPreference;
- (NSArray)sampleRatesPreference;
- (NSArray)validAudioParameterCombinations;
- (NSNumber)comfortNoiseSupported;
- (NSNumber)selectedAudioChannelCount;
- (id)createSRTPParamters;
- (id)createSelectedAudioParameters;
- (id)logIdentifier;
- (void)_generateAllCombinations:(id)a3;
- (void)setComfortNoiseSupported:(id)a3;
- (void)setSelectedAudioChannelCount:(id)a3;
- (void)setSelectedAudioParameterCombination:(id)a3;
- (void)setSelectedAudioParameters:(id)a3;
- (void)setSelectedBitRateSetting:(id)a3;
- (void)setSelectedCodecGroupType:(id)a3;
- (void)setSelectedSampleRate:(id)a3;
@end

@implementation HMDCameraAudioParameterSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comfortNoiseSupported, 0);
  objc_storeStrong((id *)&self->_selectedAudioParameterCombination, 0);
  objc_storeStrong((id *)&self->_selectedAudioChannelCount, 0);
  objc_storeStrong((id *)&self->_selectedSampleRate, 0);
  objc_storeStrong((id *)&self->_selectedBitRateSetting, 0);
  objc_storeStrong((id *)&self->_selectedCodecGroupType, 0);
  objc_storeStrong((id *)&self->_validAudioParameterCombinations, 0);
  objc_storeStrong((id *)&self->_sampleRatesPreference, 0);
  objc_storeStrong((id *)&self->_bitrateSettingsPreference, 0);
  objc_storeStrong((id *)&self->_audioCodecsPreference, 0);
  objc_storeStrong((id *)&self->_streamingCapabilities, 0);
  objc_storeStrong((id *)&self->_selectedAudioParameters, 0);
  objc_storeStrong((id *)&self->_rtpConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, 0);
}

- (void)setComfortNoiseSupported:(id)a3
{
}

- (NSNumber)comfortNoiseSupported
{
  return self->_comfortNoiseSupported;
}

- (void)setSelectedAudioParameterCombination:(id)a3
{
}

- (HMDCameraAudioParameterCombination)selectedAudioParameterCombination
{
  return self->_selectedAudioParameterCombination;
}

- (void)setSelectedAudioChannelCount:(id)a3
{
}

- (NSNumber)selectedAudioChannelCount
{
  return self->_selectedAudioChannelCount;
}

- (void)setSelectedSampleRate:(id)a3
{
}

- (HMDAudioSampleRate)selectedSampleRate
{
  return self->_selectedSampleRate;
}

- (void)setSelectedBitRateSetting:(id)a3
{
}

- (HMDBitRateSetting)selectedBitRateSetting
{
  return self->_selectedBitRateSetting;
}

- (void)setSelectedCodecGroupType:(id)a3
{
}

- (HMDAudioCodecGroup)selectedCodecGroupType
{
  return self->_selectedCodecGroupType;
}

- (NSArray)validAudioParameterCombinations
{
  return self->_validAudioParameterCombinations;
}

- (NSArray)sampleRatesPreference
{
  return self->_sampleRatesPreference;
}

- (NSArray)bitrateSettingsPreference
{
  return self->_bitrateSettingsPreference;
}

- (NSArray)audioCodecsPreference
{
  return self->_audioCodecsPreference;
}

- (HMDStreamingCapabilities)streamingCapabilities
{
  return self->_streamingCapabilities;
}

- (void)setSelectedAudioParameters:(id)a3
{
}

- (HMDSelectedAudioParameters)selectedAudioParameters
{
  return self->_selectedAudioParameters;
}

- (HMDSupportedRTPConfiguration)rtpConfiguration
{
  return self->_rtpConfiguration;
}

- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration
{
  return self->_supportedAudioStreamConfiguration;
}

- (void)_generateAllCombinations:(id)a3
{
  if (([a3 streamingTierType] | 4) == 4)
  {
    char v4 = 0;
    uint64_t v32 = 60;
  }
  else
  {
    uint64_t v32 = 0;
    char v4 = 1;
  }
  id v33 = [MEMORY[0x263EFF980] array];
  v5 = [HMDCameraAudioParameterCombination alloc];
  v6 = [[HMDAudioCodecGroup alloc] initWithAudioCodecGroup:2];
  v7 = [[HMDBitRateSetting alloc] initWithBitRateSetting:0];
  v8 = [[HMDAudioSampleRate alloc] initWithSampleRate:1];
  v31 = self;
  if (v4)
  {
    v9 = &unk_26E4708B8;
  }
  else
  {
    v9 = [NSNumber numberWithUnsignedInteger:v32];
  }
  v10 = [(HMDCameraAudioParameterCombination *)v5 initWithCodecGroup:v6 bitrateSetting:v7 sampleRate:v8 maximumBitrate:&unk_26E470888 minimumBitrate:&unk_26E470888 rtcpInterval:&unk_26E4708A0 rtpPtime:v9];
  [v33 addObject:v10];

  if ((v4 & 1) == 0) {
  v11 = [HMDCameraAudioParameterCombination alloc];
  }
  v12 = [[HMDAudioCodecGroup alloc] initWithAudioCodecGroup:2];
  v13 = [[HMDBitRateSetting alloc] initWithBitRateSetting:0];
  v14 = [[HMDAudioSampleRate alloc] initWithSampleRate:2];
  if (v4)
  {
    v15 = &unk_26E4708E8;
  }
  else
  {
    v15 = [NSNumber numberWithUnsignedInteger:v32];
  }
  v16 = [(HMDCameraAudioParameterCombination *)v11 initWithCodecGroup:v12 bitrateSetting:v13 sampleRate:v14 maximumBitrate:&unk_26E4708D0 minimumBitrate:&unk_26E4708D0 rtcpInterval:&unk_26E4708A0 rtpPtime:v15];
  [v33 addObject:v16];

  if ((v4 & 1) == 0) {
  v17 = [HMDCameraAudioParameterCombination alloc];
  }
  v18 = [[HMDAudioCodecGroup alloc] initWithAudioCodecGroup:3];
  v19 = [[HMDBitRateSetting alloc] initWithBitRateSetting:0];
  v20 = [[HMDAudioSampleRate alloc] initWithSampleRate:1];
  if (v4)
  {
    v21 = &unk_26E4708E8;
  }
  else
  {
    v21 = [NSNumber numberWithUnsignedInteger:v32];
  }
  v22 = [(HMDCameraAudioParameterCombination *)v17 initWithCodecGroup:v18 bitrateSetting:v19 sampleRate:v20 maximumBitrate:&unk_26E470888 minimumBitrate:&unk_26E470888 rtcpInterval:&unk_26E4708A0 rtpPtime:v21];
  [v33 addObject:v22];

  if ((v4 & 1) == 0) {
  v23 = [HMDCameraAudioParameterCombination alloc];
  }
  v24 = [[HMDAudioCodecGroup alloc] initWithAudioCodecGroup:3];
  v25 = [[HMDBitRateSetting alloc] initWithBitRateSetting:0];
  v26 = [[HMDAudioSampleRate alloc] initWithSampleRate:2];
  if (v4)
  {
    v27 = &unk_26E4708E8;
  }
  else
  {
    v27 = [NSNumber numberWithUnsignedInteger:v32];
  }
  v28 = [(HMDCameraAudioParameterCombination *)v23 initWithCodecGroup:v24 bitrateSetting:v25 sampleRate:v26 maximumBitrate:&unk_26E4708D0 minimumBitrate:&unk_26E4708D0 rtcpInterval:&unk_26E4708A0 rtpPtime:v27];
  [v33 addObject:v28];

  if ((v4 & 1) == 0) {
  uint64_t v29 = [v33 copy];
  }
  validAudioParameterCombinations = v31->_validAudioParameterCombinations;
  v31->_validAudioParameterCombinations = (NSArray *)v29;
}

- (id)createSelectedAudioParameters
{
  v34[1] = *MEMORY[0x263EF8340];
  id v3 = (id)rtpPtime;
  if (!v3)
  {
    char v4 = [(HMDCameraAudioParameterSelection *)self selectedAudioParameterCombination];
    id v3 = [v4 rtpPTime];
  }
  v31 = v3;
  v5 = [HMDAudioCodecParameters alloc];
  v6 = [(HMDCameraAudioParameterSelection *)self selectedAudioChannelCount];
  v7 = [(HMDCameraAudioParameterSelection *)self selectedBitRateSetting];
  v34[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  v9 = [(HMDCameraAudioParameterSelection *)self selectedSampleRate];
  id v33 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  uint64_t v32 = [(HMDAudioCodecParameters *)v5 initWithChannelCount:v6 bitRateSetting:v8 audioSampleRate:v10 rtpPtime:v3];

  v11 = [HMDSelectedRTPParameters alloc];
  v12 = NSNumber;
  v30 = [(HMDCameraAudioParameterSelection *)self selectedCodecGroupType];
  uint64_t v13 = [v30 codec];
  uint64_t v14 = 110;
  if (v13 == 1) {
    uint64_t v14 = 8;
  }
  if (v13) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = [v12 numberWithUnsignedInteger:v15];
  v17 = [(HMDCameraAudioParameterSelection *)self selectedAudioParameterCombination];
  v18 = [v17 maximumBitrate];
  v19 = [(HMDCameraAudioParameterSelection *)self selectedAudioParameterCombination];
  v20 = [v19 minimumBitrate];
  v21 = [(HMDCameraAudioParameterSelection *)self selectedAudioParameterCombination];
  v22 = [v21 rtcpInterval];
  v23 = [NSNumber numberWithUnsignedInteger:13];
  v24 = [(HMDSelectedRTPParameters *)v11 initWithPayloadType:v16 maximumBitrate:v18 minimumBitrate:v20 rtcpInterval:v22 comfortNoisePayloadType:v23];

  v25 = [HMDSelectedAudioParameters alloc];
  v26 = [(HMDCameraAudioParameterSelection *)self selectedCodecGroupType];
  v27 = [(HMDCameraAudioParameterSelection *)self comfortNoiseSupported];
  v28 = [(HMDSelectedAudioParameters *)v25 initWithCodecGroup:v26 codecParameter:v32 rtpParameter:v24 comfortNoiseEnabled:v27];

  return v28;
}

- (id)createSRTPParamters
{
  id v3 = objc_opt_class();
  char v4 = [(HMDCameraAudioParameterSelection *)self rtpConfiguration];
  v5 = [v4 srtpCryptoSuites];
  v6 = [v3 selectedSRTPParametersFromCryptoSuites:v5];

  return v6;
}

- (BOOL)_selectParametersFromCodec:(id)a3 bitRateSettings:(id)a4 sampleRates:(id)a5 audioChannelCount:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v11;
  uint64_t v39 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v39)
  {
    uint64_t v15 = *(void *)v51;
    id v44 = v10;
    id v42 = v13;
    id v43 = v12;
    v41 = v14;
    uint64_t v38 = *(void *)v51;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v14);
        }
        uint64_t v40 = v16;
        uint64_t v17 = *(void *)(*((void *)&v50 + 1) + 8 * v16);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id obj = v12;
        uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v47;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v47 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              v23 = [[HMDCameraAudioParameterCombination alloc] initWithCodecGroup:v10 bitrateSetting:v17 sampleRate:v22];
              v24 = [(HMDCameraAudioParameterSelection *)self validAudioParameterCombinations];
              uint64_t v25 = [v24 indexOfObject:v23];

              if (v25 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v31 = [(HMDCameraAudioParameterSelection *)self validAudioParameterCombinations];
                uint64_t v32 = [v31 objectAtIndex:v25];

                id v33 = (void *)MEMORY[0x230FBD990]();
                v34 = self;
                v35 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  v36 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v55 = v36;
                  __int16 v56 = 2112;
                  v57 = v32;
                  _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Using audio parameter combination: %@", buf, 0x16u);

                  id v10 = v44;
                }

                [(HMDCameraAudioParameterSelection *)v34 setSelectedCodecGroupType:v10];
                [(HMDCameraAudioParameterSelection *)v34 setSelectedBitRateSetting:v17];
                [(HMDCameraAudioParameterSelection *)v34 setSelectedSampleRate:v22];
                id v13 = v42;
                [(HMDCameraAudioParameterSelection *)v34 setSelectedAudioChannelCount:v42];
                [(HMDCameraAudioParameterSelection *)v34 setSelectedAudioParameterCombination:v32];

                BOOL v30 = 1;
                id v12 = v43;
                id v14 = v41;
                goto LABEL_23;
              }
              v26 = (void *)MEMORY[0x230FBD990]();
              v27 = self;
              v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                uint64_t v29 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v55 = v29;
                __int16 v56 = 2112;
                v57 = v23;
                _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Could not find audio parameter combination: %@", buf, 0x16u);

                id v10 = v44;
              }
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        uint64_t v16 = v40 + 1;
        id v13 = v42;
        id v12 = v43;
        id v14 = v41;
        uint64_t v15 = v38;
      }
      while (v40 + 1 != v39);
      BOOL v30 = 0;
      uint64_t v39 = [v41 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v39);
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_23:

  return v30;
}

- (BOOL)selectAudioParameters
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_class();
  char v4 = [(HMDCameraAudioParameterSelection *)self audioCodecsPreference];
  v5 = [(HMDCameraAudioParameterSelection *)self streamingCapabilities];
  v6 = [v5 supportedAudioCodecs];
  v7 = [v6 allKeys];
  long long v50 = self;
  v8 = [(HMDCameraAudioParameterSelection *)self supportedAudioStreamConfiguration];
  v9 = [v8 codecConfigurations];
  id v10 = [v9 allKeys];
  if (supportedAudioCodecs)
  {
    id v11 = +[HMDAudioCodecGroup arrayWithCodecs:](HMDAudioCodecGroup, "arrayWithCodecs:");
  }
  else
  {
    id v11 = 0;
  }
  id v12 = [v3 selectedParametersFromPreferredParameters:v4 deviceSupportedParameters:v7 cameraSupportedParameters:v10 overriddenParameters:v11 parameterDescription:@"Audio-Codec"];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v13 = v12;
  uint64_t v51 = [v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v51)
  {
    id obj = v13;
    uint64_t v49 = *(void *)v53;
    *(void *)&long long v14 = 138543874;
    long long v47 = v14;
    uint64_t v15 = self;
LABEL_6:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v53 != v49) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v52 + 1) + 8 * v16);
      uint64_t v18 = [(HMDCameraAudioParameterSelection *)v15 supportedAudioStreamConfiguration];
      uint64_t v19 = [v18 codecConfigurations];
      uint64_t v20 = [v19 objectForKeyedSubscript:v17];
      v21 = [v20 audioCodecParameters];

      uint64_t v22 = objc_opt_class();
      v23 = [(HMDCameraAudioParameterSelection *)v15 bitrateSettingsPreference];
      v24 = [(HMDCameraAudioParameterSelection *)v15 bitrateSettingsPreference];
      uint64_t v25 = [v21 bitRateSettings];
      v26 = [v22 selectedParametersFromPreferredParameters:v23 deviceSupportedParameters:v24 cameraSupportedParameters:v25 overriddenParameters:0 parameterDescription:@"Bit-Rate"];

      v27 = [(HMDCameraAudioParameterSelection *)v15 streamingCapabilities];
      v28 = [v27 supportedAudioCodecs];
      uint64_t v29 = [v28 objectForKeyedSubscript:v17];

      BOOL v30 = objc_opt_class();
      v31 = [(HMDCameraAudioParameterSelection *)v15 sampleRatesPreference];
      uint64_t v32 = [v29 allObjects];
      id v33 = [v21 audioSampleRates];
      v34 = [v30 selectedParametersFromPreferredParameters:v31 deviceSupportedParameters:v32 cameraSupportedParameters:v33 overriddenParameters:0 parameterDescription:@"Sample-Rate"];

      if ([v26 count] && objc_msgSend(v34, "count"))
      {
        v35 = [v21 audioChannelCount];
        uint64_t v15 = v50;
        BOOL v36 = [(HMDCameraAudioParameterSelection *)v50 _selectParametersFromCodec:v17 bitRateSettings:v26 sampleRates:v34 audioChannelCount:v35];

        if (v36)
        {

          [(HMDCameraAudioParameterSelection *)v50 setComfortNoiseSupported:MEMORY[0x263EFFA80]];
          id v42 = [(HMDCameraAudioParameterSelection *)v50 streamingCapabilities];
          char v43 = [v42 supportsComfortNoise];

          if (v43)
          {
            id v44 = [(HMDCameraAudioParameterSelection *)v50 supportedAudioStreamConfiguration];
            v45 = [v44 supportsComfortNoise];
            [(HMDCameraAudioParameterSelection *)v50 setComfortNoiseSupported:v45];

            BOOL v41 = 1;
            id v13 = obj;
            goto LABEL_23;
          }
          BOOL v41 = 1;
          id v13 = obj;
          goto LABEL_25;
        }
      }
      else
      {
        v37 = (void *)MEMORY[0x230FBD990]();
        uint64_t v15 = v50;
        uint64_t v38 = v50;
        uint64_t v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v47;
          v57 = v40;
          __int16 v58 = 2112;
          v59 = v26;
          __int16 v60 = 2112;
          v61 = v34;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@One of the intersected candidates is empty: candidateBitrateSettings: %@, candidateSampleRates: %@", buf, 0x20u);
        }
      }

      if (v51 == ++v16)
      {
        uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v51) {
          goto LABEL_6;
        }
        BOOL v41 = 0;
        id v13 = obj;
        goto LABEL_22;
      }
    }
  }
  BOOL v41 = 0;
LABEL_22:
  id v44 = v13;
LABEL_23:

LABEL_25:
  return v41;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraParameterSelection *)self sessionID];
  id v3 = [v2 description];

  return v3;
}

- (HMDCameraAudioParameterSelection)initWithSessionID:(id)a3 supportedAudioConfiguration:(id)a4 supportedRTPConfiguration:(id)a5 streamingCapabilities:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraAudioParameterSelection;
  long long v14 = [(HMDCameraParameterSelection *)&v23 initWithSessionID:a3];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_supportedAudioStreamConfiguration, a4);
    objc_storeStrong((id *)&v15->_rtpConfiguration, a5);
    objc_storeStrong((id *)&v15->_streamingCapabilities, a6);
    uint64_t v16 = +[HMDAudioCodecGroup arrayWithCodecs:&unk_26E473DE0];
    audioCodecsPreference = v15->_audioCodecsPreference;
    v15->_audioCodecsPreference = (NSArray *)v16;

    uint64_t v18 = +[HMDBitRateSetting arrayWithSettings:&unk_26E473DF8];
    bitrateSettingsPreference = v15->_bitrateSettingsPreference;
    v15->_bitrateSettingsPreference = (NSArray *)v18;

    uint64_t v20 = +[HMDAudioSampleRate arrayWithRates:&unk_26E473E10];
    sampleRatesPreference = v15->_sampleRatesPreference;
    v15->_sampleRatesPreference = (NSArray *)v20;

    [(HMDCameraAudioParameterSelection *)v15 _generateAllCombinations:v13];
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_12209 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_12209, &__block_literal_global_12210);
  }
  v2 = (void *)logCategory__hmf_once_v1_12211;
  return v2;
}

void __47__HMDCameraAudioParameterSelection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_12211;
  logCategory__hmf_once_v1_12211 = v0;
}

@end