@interface HMDCameraVideoParameterSelection
+ (id)logCategory;
- (BOOL)_selectParametersFromCodec:(id)a3 profiles:(id)a4 levels:(id)a5 packetizationModes:(id)a6 videoAttributes:(id)a7;
- (BOOL)selectVideoParameters;
- (HMDCameraVideoParameterSelection)initWithSessionID:(id)a3 videoTierParameters:(id)a4 supportedVideoConfiguration:(id)a5 supportedRTPConfiguration:(id)a6 streamingCapabilities:(id)a7;
- (HMDCameraVideoTier)selectedVideoTier;
- (HMDCameraVideoTierParameters)videoTierParameters;
- (HMDH264Level)selectedLevel;
- (HMDH264Profile)selectedProfile;
- (HMDPacketizationMode)selectedPacketizationMode;
- (HMDSelectedVideoParameters)selectedVideoParameters;
- (HMDStreamingCapabilities)streamingCapabilities;
- (HMDSupportedRTPConfiguration)rtpConfiguration;
- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration;
- (HMDVideoCodec)selectedCodecType;
- (NSArray)h264LevelsPreference;
- (NSArray)h264PacketizationPreference;
- (NSArray)h264ProfilesPreference;
- (NSArray)validVideoParameterCombinations;
- (NSArray)videoCodecsPreference;
- (NSArray)videoResolutionsPreference;
- (NSNumber)selectedFramerate;
- (NSNumber)syncSource;
- (id)createReselectedVideoParameters:(id)a3;
- (id)createSRTPParamters;
- (id)createSelectedVideoParameters;
- (id)logIdentifier;
- (void)_generateAllCombinations;
- (void)_setVideoResolutionPreference;
- (void)setSelectedCodecType:(id)a3;
- (void)setSelectedFramerate:(id)a3;
- (void)setSelectedLevel:(id)a3;
- (void)setSelectedPacketizationMode:(id)a3;
- (void)setSelectedProfile:(id)a3;
- (void)setSelectedVideoParameters:(id)a3;
- (void)setSelectedVideoTier:(id)a3;
@end

@implementation HMDCameraVideoParameterSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCodecType, 0);
  objc_storeStrong((id *)&self->_selectedVideoTier, 0);
  objc_storeStrong((id *)&self->_selectedFramerate, 0);
  objc_storeStrong((id *)&self->_selectedPacketizationMode, 0);
  objc_storeStrong((id *)&self->_selectedLevel, 0);
  objc_storeStrong((id *)&self->_selectedProfile, 0);
  objc_storeStrong((id *)&self->_videoTierParameters, 0);
  objc_storeStrong((id *)&self->_validVideoParameterCombinations, 0);
  objc_storeStrong((id *)&self->_videoResolutionsPreference, 0);
  objc_storeStrong((id *)&self->_h264PacketizationPreference, 0);
  objc_storeStrong((id *)&self->_h264LevelsPreference, 0);
  objc_storeStrong((id *)&self->_h264ProfilesPreference, 0);
  objc_storeStrong((id *)&self->_videoCodecsPreference, 0);
  objc_storeStrong((id *)&self->_streamingCapabilities, 0);
  objc_storeStrong((id *)&self->_selectedVideoParameters, 0);
  objc_storeStrong((id *)&self->_syncSource, 0);
  objc_storeStrong((id *)&self->_rtpConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, 0);
}

- (void)setSelectedCodecType:(id)a3
{
}

- (HMDVideoCodec)selectedCodecType
{
  return self->_selectedCodecType;
}

- (void)setSelectedVideoTier:(id)a3
{
}

- (HMDCameraVideoTier)selectedVideoTier
{
  return self->_selectedVideoTier;
}

- (void)setSelectedFramerate:(id)a3
{
}

- (NSNumber)selectedFramerate
{
  return self->_selectedFramerate;
}

- (void)setSelectedPacketizationMode:(id)a3
{
}

- (HMDPacketizationMode)selectedPacketizationMode
{
  return self->_selectedPacketizationMode;
}

- (void)setSelectedLevel:(id)a3
{
}

- (HMDH264Level)selectedLevel
{
  return self->_selectedLevel;
}

- (void)setSelectedProfile:(id)a3
{
}

- (HMDH264Profile)selectedProfile
{
  return self->_selectedProfile;
}

- (HMDCameraVideoTierParameters)videoTierParameters
{
  return self->_videoTierParameters;
}

- (NSArray)validVideoParameterCombinations
{
  return self->_validVideoParameterCombinations;
}

- (NSArray)videoResolutionsPreference
{
  return self->_videoResolutionsPreference;
}

- (NSArray)h264PacketizationPreference
{
  return self->_h264PacketizationPreference;
}

- (NSArray)h264LevelsPreference
{
  return self->_h264LevelsPreference;
}

- (NSArray)h264ProfilesPreference
{
  return self->_h264ProfilesPreference;
}

- (NSArray)videoCodecsPreference
{
  return self->_videoCodecsPreference;
}

- (HMDStreamingCapabilities)streamingCapabilities
{
  return self->_streamingCapabilities;
}

- (void)setSelectedVideoParameters:(id)a3
{
}

- (HMDSelectedVideoParameters)selectedVideoParameters
{
  return self->_selectedVideoParameters;
}

- (NSNumber)syncSource
{
  return self->_syncSource;
}

- (HMDSupportedRTPConfiguration)rtpConfiguration
{
  return self->_rtpConfiguration;
}

- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration
{
  return self->_supportedVideoStreamConfiguration;
}

- (void)_generateAllCombinations
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  v3 = +[HMDVideoResolution arrayWithResolutions:&unk_26E474350];
  v4 = [MEMORY[0x263EFF980] array];
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id obj = v3;
  uint64_t v143 = [obj countByEnumeratingWithState:&v159 objects:v166 count:16];
  if (v143)
  {
    uint64_t v139 = *(void *)v160;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v160 != v139) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v159 + 1) + 8 * v5);
        v7 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v8 = [v7 videoTierCombinations];
        v9 = [v8 objectForKeyedSubscript:v6];

        if (v9)
        {
          v10 = [HMDCameraVideoParameterCombination alloc];
          v11 = [[HMDH264Profile alloc] initWithH264Profile:0];
          v12 = [[HMDH264Level alloc] initWithH264Level:0];
          v13 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v14 = [v13 videoTierCombinations];
          v15 = [v14 objectForKeyedSubscript:v6];
          v16 = [(HMDCameraVideoParameterCombination *)v10 initWithProfile:v11 level:v12 videoTier:v15];
          [v4 addObject:v16];
        }
        v17 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v18 = [v17 videoTierCombinations];
        v19 = [v18 objectForKeyedSubscript:v6];

        if (v19)
        {
          v20 = [HMDCameraVideoParameterCombination alloc];
          v21 = [[HMDH264Profile alloc] initWithH264Profile:1];
          v22 = [[HMDH264Level alloc] initWithH264Level:0];
          v23 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v24 = [v23 videoTierCombinations];
          v25 = [v24 objectForKeyedSubscript:v6];
          v26 = [(HMDCameraVideoParameterCombination *)v20 initWithProfile:v21 level:v22 videoTier:v25];
          [v4 addObject:v26];
        }
        v27 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v28 = [v27 videoTierCombinations];
        v29 = [v28 objectForKeyedSubscript:v6];

        if (v29)
        {
          v30 = [HMDCameraVideoParameterCombination alloc];
          v31 = [[HMDH264Profile alloc] initWithH264Profile:2];
          v32 = [[HMDH264Level alloc] initWithH264Level:0];
          v33 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v34 = [v33 videoTierCombinations];
          v35 = [v34 objectForKeyedSubscript:v6];
          v36 = [(HMDCameraVideoParameterCombination *)v30 initWithProfile:v31 level:v32 videoTier:v35];
          [v4 addObject:v36];
        }
        ++v5;
      }
      while (v143 != v5);
      uint64_t v143 = [obj countByEnumeratingWithState:&v159 objects:v166 count:16];
    }
    while (v143);
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id obja = obj;
  uint64_t v144 = [obja countByEnumeratingWithState:&v155 objects:v165 count:16];
  if (v144)
  {
    uint64_t v140 = *(void *)v156;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v156 != v140) {
          objc_enumerationMutation(obja);
        }
        uint64_t v38 = *(void *)(*((void *)&v155 + 1) + 8 * v37);
        v39 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v40 = [v39 videoTierCombinations];
        v41 = [v40 objectForKeyedSubscript:v38];

        if (v41)
        {
          v42 = [HMDCameraVideoParameterCombination alloc];
          v43 = [[HMDH264Profile alloc] initWithH264Profile:0];
          v44 = [[HMDH264Level alloc] initWithH264Level:1];
          v45 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v46 = [v45 videoTierCombinations];
          v47 = [v46 objectForKeyedSubscript:v38];
          v48 = [(HMDCameraVideoParameterCombination *)v42 initWithProfile:v43 level:v44 videoTier:v47];
          [v4 addObject:v48];
        }
        v49 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v50 = [v49 videoTierCombinations];
        v51 = [v50 objectForKeyedSubscript:v38];

        if (v51)
        {
          v52 = [HMDCameraVideoParameterCombination alloc];
          v53 = [[HMDH264Profile alloc] initWithH264Profile:1];
          v54 = [[HMDH264Level alloc] initWithH264Level:1];
          v55 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v56 = [v55 videoTierCombinations];
          v57 = [v56 objectForKeyedSubscript:v38];
          v58 = [(HMDCameraVideoParameterCombination *)v52 initWithProfile:v53 level:v54 videoTier:v57];
          [v4 addObject:v58];
        }
        v59 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v60 = [v59 videoTierCombinations];
        v61 = [v60 objectForKeyedSubscript:v38];

        if (v61)
        {
          v62 = [HMDCameraVideoParameterCombination alloc];
          v63 = [[HMDH264Profile alloc] initWithH264Profile:2];
          v64 = [[HMDH264Level alloc] initWithH264Level:1];
          v65 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v66 = [v65 videoTierCombinations];
          v67 = [v66 objectForKeyedSubscript:v38];
          v68 = [(HMDCameraVideoParameterCombination *)v62 initWithProfile:v63 level:v64 videoTier:v67];
          [v4 addObject:v68];
        }
        ++v37;
      }
      while (v144 != v37);
      uint64_t v144 = [obja countByEnumeratingWithState:&v155 objects:v165 count:16];
    }
    while (v144);
  }

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id objb = obja;
  uint64_t v145 = [objb countByEnumeratingWithState:&v151 objects:v164 count:16];
  if (v145)
  {
    uint64_t v141 = *(void *)v152;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v152 != v141) {
          objc_enumerationMutation(objb);
        }
        uint64_t v70 = *(void *)(*((void *)&v151 + 1) + 8 * v69);
        v71 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v72 = [v71 videoTierCombinations];
        v73 = [v72 objectForKeyedSubscript:v70];

        if (v73)
        {
          v74 = [HMDCameraVideoParameterCombination alloc];
          v75 = [[HMDH264Profile alloc] initWithH264Profile:0];
          v76 = [[HMDH264Level alloc] initWithH264Level:2];
          v77 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v78 = [v77 videoTierCombinations];
          v79 = [v78 objectForKeyedSubscript:v70];
          v80 = [(HMDCameraVideoParameterCombination *)v74 initWithProfile:v75 level:v76 videoTier:v79];
          [v4 addObject:v80];
        }
        v81 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v82 = [v81 videoTierCombinations];
        v83 = [v82 objectForKeyedSubscript:v70];

        if (v83)
        {
          v84 = [HMDCameraVideoParameterCombination alloc];
          v85 = [[HMDH264Profile alloc] initWithH264Profile:1];
          v86 = [[HMDH264Level alloc] initWithH264Level:2];
          v87 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v88 = [v87 videoTierCombinations];
          v89 = [v88 objectForKeyedSubscript:v70];
          v90 = [(HMDCameraVideoParameterCombination *)v84 initWithProfile:v85 level:v86 videoTier:v89];
          [v4 addObject:v90];
        }
        v91 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v92 = [v91 videoTierCombinations];
        v93 = [v92 objectForKeyedSubscript:v70];

        if (v93)
        {
          v94 = [HMDCameraVideoParameterCombination alloc];
          v95 = [[HMDH264Profile alloc] initWithH264Profile:2];
          v96 = [[HMDH264Level alloc] initWithH264Level:2];
          v97 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v98 = [v97 videoTierCombinations];
          v99 = [v98 objectForKeyedSubscript:v70];
          v100 = [(HMDCameraVideoParameterCombination *)v94 initWithProfile:v95 level:v96 videoTier:v99];
          [v4 addObject:v100];
        }
        ++v69;
      }
      while (v145 != v69);
      uint64_t v145 = [objb countByEnumeratingWithState:&v151 objects:v164 count:16];
    }
    while (v145);
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id objc = objb;
  uint64_t v146 = [objc countByEnumeratingWithState:&v147 objects:v163 count:16];
  if (v146)
  {
    uint64_t v142 = *(void *)v148;
    do
    {
      uint64_t v101 = 0;
      do
      {
        if (*(void *)v148 != v142) {
          objc_enumerationMutation(objc);
        }
        uint64_t v102 = *(void *)(*((void *)&v147 + 1) + 8 * v101);
        v103 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v104 = [v103 videoTierCombinations];
        v105 = [v104 objectForKeyedSubscript:v102];

        if (v105)
        {
          v106 = [HMDCameraVideoParameterCombination alloc];
          v107 = [[HMDH264Profile alloc] initWithH264Profile:0];
          v108 = [[HMDH264Level alloc] initWithH264Level:3];
          v109 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v110 = [v109 videoTierCombinations];
          v111 = [v110 objectForKeyedSubscript:v102];
          v112 = [(HMDCameraVideoParameterCombination *)v106 initWithProfile:v107 level:v108 videoTier:v111];
          [v4 addObject:v112];
        }
        v113 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v114 = [v113 videoTierCombinations];
        v115 = [v114 objectForKeyedSubscript:v102];

        if (v115)
        {
          v116 = [HMDCameraVideoParameterCombination alloc];
          v117 = [[HMDH264Profile alloc] initWithH264Profile:1];
          v118 = [[HMDH264Level alloc] initWithH264Level:3];
          v119 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v120 = [v119 videoTierCombinations];
          v121 = [v120 objectForKeyedSubscript:v102];
          v122 = [(HMDCameraVideoParameterCombination *)v116 initWithProfile:v117 level:v118 videoTier:v121];
          [v4 addObject:v122];
        }
        v123 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
        v124 = [v123 videoTierCombinations];
        v125 = [v124 objectForKeyedSubscript:v102];

        if (v125)
        {
          v126 = [HMDCameraVideoParameterCombination alloc];
          v127 = [[HMDH264Profile alloc] initWithH264Profile:2];
          v128 = [[HMDH264Level alloc] initWithH264Level:3];
          v129 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
          v130 = [v129 videoTierCombinations];
          v131 = [v130 objectForKeyedSubscript:v102];
          v132 = [(HMDCameraVideoParameterCombination *)v126 initWithProfile:v127 level:v128 videoTier:v131];
          [v4 addObject:v132];
        }
        ++v101;
      }
      while (v146 != v101);
      uint64_t v146 = [objc countByEnumeratingWithState:&v147 objects:v163 count:16];
    }
    while (v146);
  }

  v133 = (NSArray *)[v4 copy];
  validVideoParameterCombinations = self->_validVideoParameterCombinations;
  self->_validVideoParameterCombinations = v133;
}

- (id)createReselectedVideoParameters:(id)a3
{
  id v3 = a3;
  v4 = [HMDVideoAttributes alloc];
  uint64_t v5 = [v3 videoResolution];
  uint64_t v6 = [v3 framerate];
  v7 = [(HMDVideoAttributes *)v4 initWithResolution:v5 framerate:v6];

  v8 = [HMDReselectedRTPParameters alloc];
  v9 = [v3 maxBitRate];
  v10 = [v3 minBitRate];
  v11 = [v3 rtcpInterval];

  v12 = [(HMDReselectedRTPParameters *)v8 initWithMaximumBitrate:v9 minimumBitrate:v10 rtcpInterval:v11];
  v13 = [[HMDReselectedVideoParameters alloc] initWithAttribute:v7 rtpParameter:v12];

  return v13;
}

- (id)createSelectedVideoParameters
{
  v34[1] = *MEMORY[0x263EF8340];
  id v3 = [HMDVideoCodecParameters alloc];
  v4 = [(HMDCameraVideoParameterSelection *)self selectedProfile];
  v34[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  uint64_t v6 = [(HMDCameraVideoParameterSelection *)self selectedLevel];
  v33 = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  v8 = [(HMDCameraVideoParameterSelection *)self selectedPacketizationMode];
  v32 = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  v31 = [(HMDVideoCodecParameters *)v3 initWithProfiles:v5 levels:v7 packetizationModes:v9];

  v10 = [HMDVideoAttributes alloc];
  v11 = [(HMDCameraVideoParameterSelection *)self selectedVideoTier];
  v12 = [v11 videoResolution];
  v13 = [(HMDCameraVideoParameterSelection *)self selectedVideoTier];
  v14 = [v13 framerate];
  v30 = [(HMDVideoAttributes *)v10 initWithResolution:v12 framerate:v14];

  v15 = [HMDSelectedRTPParameters alloc];
  v16 = NSNumber;
  v17 = [(HMDCameraVideoParameterSelection *)self selectedCodecType];
  [v17 codecType];
  v18 = [v16 numberWithUnsignedInteger:99];
  v19 = [(HMDCameraVideoParameterSelection *)self selectedVideoTier];
  v20 = [v19 maxBitRate];
  v21 = [(HMDCameraVideoParameterSelection *)self selectedVideoTier];
  v22 = [v21 minBitRate];
  v23 = [(HMDCameraVideoParameterSelection *)self selectedVideoTier];
  v24 = [v23 rtcpInterval];
  v25 = [(HMDSelectedRTPParameters *)v15 initWithPayloadType:v18 maximumBitrate:v20 minimumBitrate:v22 rtcpInterval:v24 comfortNoisePayloadType:0];

  v26 = [HMDSelectedVideoParameters alloc];
  v27 = [(HMDCameraVideoParameterSelection *)self selectedCodecType];
  v28 = [(HMDSelectedVideoParameters *)v26 initWithCodec:v27 codecParameter:v31 attribute:v30 rtpParameter:v25];

  return v28;
}

- (id)createSRTPParamters
{
  id v3 = objc_opt_class();
  v4 = [(HMDCameraVideoParameterSelection *)self rtpConfiguration];
  uint64_t v5 = [v4 srtpCryptoSuites];
  uint64_t v6 = [v3 selectedSRTPParametersFromCryptoSuites:v5];

  return v6;
}

- (BOOL)_selectParametersFromCodec:(id)a3 profiles:(id)a4 levels:(id)a5 packetizationModes:(id)a6 videoAttributes:(id)a7
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v81;
    id v65 = v14;
    id v66 = v12;
    id v63 = v17;
    v64 = v15;
    id v62 = v16;
    uint64_t v57 = *(void *)v81;
    do
    {
      uint64_t v20 = 0;
      uint64_t v56 = v18;
      do
      {
        if (*(void *)v81 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v59 = v20;
        uint64_t v70 = *(void *)(*((void *)&v80 + 1) + 8 * v20);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v21 = v14;
        uint64_t v60 = [v21 countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v60)
        {
          uint64_t v22 = *(void *)v77;
          v67 = v21;
          uint64_t v58 = *(void *)v77;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v77 != v22) {
                objc_enumerationMutation(v21);
              }
              uint64_t v61 = v23;
              uint64_t v71 = *(void *)(*((void *)&v76 + 1) + 8 * v23);
              long long v72 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              id obj = v16;
              uint64_t v24 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v69 = *(void *)v73;
                while (2)
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    if (*(void *)v73 != v69) {
                      objc_enumerationMutation(obj);
                    }
                    v27 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                    v28 = [HMDCameraVideoParameterCombination alloc];
                    v29 = [(HMDCameraVideoParameterSelection *)self videoTierParameters];
                    v30 = [v29 videoTierCombinations];
                    v31 = [v27 videoResolution];
                    v32 = [v30 objectForKeyedSubscript:v31];
                    v33 = [(HMDCameraVideoParameterCombination *)v28 initWithProfile:v70 level:v71 videoTier:v32];

                    v34 = [(HMDCameraVideoParameterSelection *)self validVideoParameterCombinations];
                    uint64_t v35 = [v34 indexOfObject:v33];

                    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v42 = [(HMDCameraVideoParameterSelection *)self validVideoParameterCombinations];
                      v43 = [v42 objectAtIndex:v35];

                      v44 = (void *)MEMORY[0x230FBD990]();
                      v45 = self;
                      v46 = HMFGetOSLogHandle();
                      id v15 = v64;
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                      {
                        v47 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543618;
                        v85 = v47;
                        __int16 v86 = 2112;
                        v87 = v43;
                        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Selected video parameter combination: %@", buf, 0x16u);
                      }
                      id v12 = v66;
                      [(HMDCameraVideoParameterSelection *)v45 setSelectedCodecType:v66];
                      [(HMDCameraVideoParameterSelection *)v45 setSelectedProfile:v70];
                      [(HMDCameraVideoParameterSelection *)v45 setSelectedLevel:v71];
                      v48 = [(HMDCameraVideoParameterCombination *)v33 videoTier];
                      [(HMDCameraVideoParameterSelection *)v45 setSelectedVideoTier:v48];

                      v49 = [v43 videoTier];
                      v50 = [v49 framerate];
                      [(HMDCameraVideoParameterSelection *)v45 setSelectedFramerate:v50];

                      v51 = [v64 objectAtIndex:0];
                      [(HMDCameraVideoParameterSelection *)v45 setSelectedPacketizationMode:v51];

                      v52 = [(HMDCameraVideoParameterSelection *)v45 videoTierParameters];
                      [v52 updateTierOrder:obj];

                      v53 = [(HMDCameraVideoParameterSelection *)v45 videoTierParameters];
                      v54 = [(HMDCameraVideoParameterSelection *)v45 selectedVideoTier];
                      [v53 updateFirstPickedTier:v54];

                      BOOL v41 = 1;
                      id v14 = v65;
                      id v16 = v62;
                      id v17 = v63;
                      goto LABEL_30;
                    }
                    v36 = (void *)MEMORY[0x230FBD990]();
                    uint64_t v37 = self;
                    uint64_t v38 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                    {
                      v39 = HMFGetLogIdentifier();
                      v40 = [v27 videoResolution];
                      *(_DWORD *)buf = 138543618;
                      v85 = v39;
                      __int16 v86 = 2112;
                      v87 = v40;
                      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Combination does not exist for video resolution: %@", buf, 0x16u);
                    }
                  }
                  uint64_t v25 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
                  if (v25) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v23 = v61 + 1;
              id v14 = v65;
              id v12 = v66;
              id v17 = v63;
              id v15 = v64;
              id v16 = v62;
              id v21 = v67;
              uint64_t v22 = v58;
            }
            while (v61 + 1 != v60);
            uint64_t v60 = [v67 countByEnumeratingWithState:&v76 objects:v89 count:16];
          }
          while (v60);
        }

        uint64_t v20 = v59 + 1;
        uint64_t v19 = v57;
      }
      while (v59 + 1 != v56);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v80 objects:v90 count:16];
      uint64_t v19 = v57;
      BOOL v41 = 0;
    }
    while (v18);
  }
  else
  {
    BOOL v41 = 0;
  }
LABEL_30:

  return v41;
}

- (BOOL)selectVideoParameters
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_class();
  v4 = [(HMDCameraVideoParameterSelection *)self videoCodecsPreference];
  uint64_t v5 = [(HMDCameraVideoParameterSelection *)self streamingCapabilities];
  uint64_t v6 = [v5 supportedVideoCodecs];
  v7 = [v6 allObjects];
  long long v81 = self;
  v8 = [(HMDCameraVideoParameterSelection *)self supportedVideoStreamConfiguration];
  v9 = [v8 codecConfigurations];
  v10 = [v9 allKeys];
  if (supportedVideoCodecs)
  {
    v11 = +[HMDVideoCodec arrayWithCodecTypes:](HMDVideoCodec, "arrayWithCodecTypes:");
  }
  else
  {
    v11 = 0;
  }
  id v12 = [v3 selectedParametersFromPreferredParameters:v4 deviceSupportedParameters:v7 cameraSupportedParameters:v10 overriddenParameters:v11 parameterDescription:@"Video-Codecs"];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v12;
  uint64_t v80 = [obj countByEnumeratingWithState:&v105 objects:v124 count:16];
  if (v80)
  {
    char v77 = 0;
    uint64_t v79 = *(void *)v106;
    unint64_t v13 = 0x263EFF000uLL;
    id v14 = self;
LABEL_6:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v106 != v79) {
        objc_enumerationMutation(obj);
      }
      uint64_t v83 = v15;
      uint64_t v16 = *(void *)(*((void *)&v105 + 1) + 8 * v15);
      id v17 = [(HMDCameraVideoParameterSelection *)v14 supportedVideoStreamConfiguration];
      uint64_t v18 = [v17 codecConfigurations];
      uint64_t v19 = [v18 objectForKeyedSubscript:v16];
      uint64_t v20 = [v19 codecParameters];

      id v21 = [(HMDCameraVideoParameterSelection *)v14 supportedVideoStreamConfiguration];
      uint64_t v22 = [v21 codecConfigurations];
      uint64_t v82 = v16;
      uint64_t v23 = [v22 objectForKeyedSubscript:v16];
      uint64_t v24 = [v23 videoAttributes];

      uint64_t v25 = objc_opt_class();
      v26 = [(HMDCameraVideoParameterSelection *)v14 h264ProfilesPreference];
      v27 = [(HMDCameraVideoParameterSelection *)v14 streamingCapabilities];
      v28 = [v27 supportedH264Profiles];
      v29 = [v28 allObjects];
      v30 = [v20 h264Profiles];
      __int16 v86 = [v25 selectedParametersFromPreferredParameters:v26 deviceSupportedParameters:v29 cameraSupportedParameters:v30 overriddenParameters:0 parameterDescription:@"H264-Profile"];

      v31 = objc_opt_class();
      v32 = [(HMDCameraVideoParameterSelection *)v14 h264LevelsPreference];
      v33 = [(HMDCameraVideoParameterSelection *)v14 streamingCapabilities];
      v34 = [v33 supportedH264Levels];
      uint64_t v35 = [v34 allObjects];
      v36 = [v20 levels];
      v85 = [v31 selectedParametersFromPreferredParameters:v32 deviceSupportedParameters:v35 cameraSupportedParameters:v36 overriddenParameters:0 parameterDescription:@"H264-Level"];

      uint64_t v37 = objc_opt_class();
      uint64_t v38 = [(HMDCameraVideoParameterSelection *)v14 h264PacketizationPreference];
      v39 = [(HMDCameraVideoParameterSelection *)v14 streamingCapabilities];
      v40 = [v39 supportedPacketizationModes];
      BOOL v41 = [v40 allObjects];
      v87 = v20;
      v42 = [v20 packetizationModes];
      v88 = [v37 selectedParametersFromPreferredParameters:v38 deviceSupportedParameters:v41 cameraSupportedParameters:v42 overriddenParameters:0 parameterDescription:@"H264-Packetization"];

      v43 = [*(id *)(v13 + 2432) array];
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v92 = v24;
      uint64_t v44 = [v92 countByEnumeratingWithState:&v101 objects:v123 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v102 != v46) {
              objc_enumerationMutation(v92);
            }
            v48 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            v49 = [v48 videoResolution];

            if (v49)
            {
              v50 = [v48 videoResolution];
              [v43 addObject:v50];
            }
          }
          uint64_t v45 = [v92 countByEnumeratingWithState:&v101 objects:v123 count:16];
        }
        while (v45);
      }

      v51 = objc_opt_class();
      v52 = [(HMDCameraVideoParameterSelection *)v14 videoResolutionsPreference];
      v53 = [(HMDCameraVideoParameterSelection *)v14 streamingCapabilities];
      v54 = [v53 supportedVideoResolutions];
      v55 = [v54 allObjects];
      if (supportedResolutions)
      {
        uint64_t v56 = +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:");
      }
      else
      {
        uint64_t v56 = 0;
      }
      v84 = v43;
      uint64_t v57 = [v51 selectedParametersFromPreferredParameters:v52 deviceSupportedParameters:v55 cameraSupportedParameters:v43 overriddenParameters:v56 parameterDescription:@"Resolution"];

      uint64_t v58 = [*(id *)(v13 + 2432) array];
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v89 = v57;
      uint64_t v91 = [v89 countByEnumeratingWithState:&v97 objects:v122 count:16];
      if (v91)
      {
        uint64_t v90 = *(void *)v98;
        do
        {
          for (uint64_t j = 0; j != v91; ++j)
          {
            if (*(void *)v98 != v90) {
              objc_enumerationMutation(v89);
            }
            uint64_t v60 = *(void **)(*((void *)&v97 + 1) + 8 * j);
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v61 = v92;
            uint64_t v62 = [v61 countByEnumeratingWithState:&v93 objects:v121 count:16];
            if (v62)
            {
              uint64_t v63 = v62;
              uint64_t v64 = *(void *)v94;
              do
              {
                for (uint64_t k = 0; k != v63; ++k)
                {
                  if (*(void *)v94 != v64) {
                    objc_enumerationMutation(v61);
                  }
                  id v66 = *(void **)(*((void *)&v93 + 1) + 8 * k);
                  v67 = [v66 videoResolution];
                  int v68 = [v60 isEqual:v67];

                  if (v68) {
                    [v58 addObject:v66];
                  }
                }
                uint64_t v63 = [v61 countByEnumeratingWithState:&v93 objects:v121 count:16];
              }
              while (v63);
            }
          }
          uint64_t v91 = [v89 countByEnumeratingWithState:&v97 objects:v122 count:16];
        }
        while (v91);
      }

      if ([v86 count]
        && [v85 count]
        && [v88 count]
        && [v58 count])
      {
        id v14 = v81;
        BOOL v69 = [(HMDCameraVideoParameterSelection *)v81 _selectParametersFromCodec:v82 profiles:v86 levels:v85 packetizationModes:v88 videoAttributes:v58];
        v77 |= v69;
        int v70 = v69 ? 2 : 0;
        unint64_t v13 = 0x263EFF000;
        uint64_t v71 = v87;
      }
      else
      {
        long long v72 = (void *)MEMORY[0x230FBD990]();
        id v14 = v81;
        long long v73 = v81;
        long long v74 = HMFGetOSLogHandle();
        unint64_t v13 = 0x263EFF000;
        uint64_t v71 = v87;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          long long v75 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544642;
          v110 = v75;
          __int16 v111 = 2112;
          v112 = v86;
          __int16 v113 = 2112;
          v114 = v85;
          __int16 v115 = 2112;
          v116 = v88;
          __int16 v117 = 2112;
          id v118 = v89;
          __int16 v119 = 2112;
          v120 = v58;
          _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_INFO, "%{public}@One of the intersected candidates is empty: candidateProfiles: %@, candidateLevels: %@, candidatePacketModes: %@, candidateVideoResolutions: %@, candidateAttributes: %@", buf, 0x3Eu);
        }
        int v70 = 3;
      }

      if (v70 != 3)
      {
        if (v70) {
          break;
        }
      }
      uint64_t v15 = v83 + 1;
      if (v83 + 1 == v80)
      {
        uint64_t v80 = [obj countByEnumeratingWithState:&v105 objects:v124 count:16];
        if (v80) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  else
  {
    char v77 = 0;
  }

  return v77 & 1;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraParameterSelection *)self sessionID];
  id v3 = [v2 description];

  return v3;
}

- (void)_setVideoResolutionPreference
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = [[HMDVideoResolution alloc] initWithResolution:29];
    [v3 addObject:v5];
    uint64_t v6 = [[HMDVideoResolution alloc] initWithResolution:28];
    [v4 addObject:v6];
  }
  uint64_t v7 = +[HMDVideoResolution arrayWithResolutions:&unk_26E4742D8];
  uint64_t v8 = +[HMDVideoResolution arrayWithResolutions:&unk_26E4742F0];
  v28 = (void *)v7;
  [v3 addObjectsFromArray:v7];
  v27 = (void *)v8;
  [v4 addObjectsFromArray:v8];
  v9 = +[HMDVideoResolution arrayWithResolutions:&unk_26E474308];
  v10 = +[HMDVideoResolution arrayWithResolutions:&unk_26E474320];
  v11 = +[HMDVideoResolution arrayWithResolutions:&unk_26E474338];
  id v12 = [MEMORY[0x263EFF980] array];
  unint64_t v13 = [(HMDCameraVideoParameterSelection *)self streamingCapabilities];
  uint64_t v14 = [v13 streamingTierType];

  BOOL v15 = v14 == 0;
  if (v14) {
    uint64_t v16 = v3;
  }
  else {
    uint64_t v16 = v9;
  }
  if (v14) {
    id v17 = v9;
  }
  else {
    id v17 = v10;
  }
  v29 = v3;
  if (v14) {
    uint64_t v18 = v4;
  }
  else {
    uint64_t v18 = v3;
  }
  if (v15) {
    uint64_t v19 = v4;
  }
  else {
    uint64_t v19 = v10;
  }
  [v12 addObjectsFromArray:v16];
  [v12 addObjectsFromArray:v17];
  [v12 addObjectsFromArray:v18];
  [v12 addObjectsFromArray:v19];
  [v12 addObjectsFromArray:v11];
  uint64_t v20 = (NSArray *)[v12 copy];
  videoResolutionsPreference = self->_videoResolutionsPreference;
  self->_videoResolutionsPreference = v20;

  uint64_t v22 = (void *)MEMORY[0x230FBD990]();
  uint64_t v23 = self;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    v26 = self->_videoResolutionsPreference;
    *(_DWORD *)buf = 138543618;
    v31 = v25;
    __int16 v32 = 2112;
    v33 = v26;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting the video resolution preference order to %@", buf, 0x16u);
  }
}

- (HMDCameraVideoParameterSelection)initWithSessionID:(id)a3 videoTierParameters:(id)a4 supportedVideoConfiguration:(id)a5 supportedRTPConfiguration:(id)a6 streamingCapabilities:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraVideoParameterSelection;
  id v17 = [(HMDCameraParameterSelection *)&v28 initWithSessionID:a3];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_supportedVideoStreamConfiguration, a5);
    objc_storeStrong((id *)&v18->_rtpConfiguration, a6);
    objc_storeStrong((id *)&v18->_streamingCapabilities, a7);
    uint64_t v19 = +[HMDVideoCodec arrayWithCodecTypes:&unk_26E474278];
    videoCodecsPreference = v18->_videoCodecsPreference;
    v18->_videoCodecsPreference = (NSArray *)v19;

    uint64_t v21 = +[HMDH264Profile arrayWithProfiles:&unk_26E474290];
    h264ProfilesPreference = v18->_h264ProfilesPreference;
    v18->_h264ProfilesPreference = (NSArray *)v21;

    uint64_t v23 = +[HMDH264Level arrayWithLevels:&unk_26E4742A8];
    h264LevelsPreference = v18->_h264LevelsPreference;
    v18->_h264LevelsPreference = (NSArray *)v23;

    uint64_t v25 = +[HMDPacketizationMode arrayWithModes:&unk_26E4742C0];
    h264PacketizationPreference = v18->_h264PacketizationPreference;
    v18->_h264PacketizationPreference = (NSArray *)v25;

    objc_storeStrong((id *)&v18->_videoTierParameters, a4);
    [(HMDCameraVideoParameterSelection *)v18 _generateAllCombinations];
    [(HMDCameraVideoParameterSelection *)v18 _setVideoResolutionPreference];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_144570 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_144570, &__block_literal_global_144571);
  }
  v2 = (void *)logCategory__hmf_once_v2_144572;
  return v2;
}

void __47__HMDCameraVideoParameterSelection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_144572;
  logCategory__hmf_once_v2_144572 = v0;
}

@end