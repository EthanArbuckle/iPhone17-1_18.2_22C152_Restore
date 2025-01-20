@interface HMDStreamingCapabilities
+ (BOOL)supportsSecureCoding;
+ (unint64_t)aspectRatioOfResolution:(id)a3;
+ (void)translateCapabilities:(id)a3;
- (BOOL)supportsComfortNoise;
- (HMDStreamingCapabilities)initWithCoder:(id)a3;
- (HMDStreamingCapabilities)initWithStreamPreference:(id)a3;
- (NSDictionary)supportedAudioCodecs;
- (NSSet)supportedAudioSampleRates;
- (NSSet)supportedBitRateSettings;
- (NSSet)supportedH264Levels;
- (NSSet)supportedH264Profiles;
- (NSSet)supportedPacketizationModes;
- (NSSet)supportedVideoCodecs;
- (NSSet)supportedVideoResolutions;
- (id)_supportedResolutionsWithOverrides;
- (id)description;
- (unint64_t)streamingTierType;
- (void)_updateWithStreamPreference:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setStreamingTierType:(unint64_t)a3;
- (void)setSupportsComfortNoise:(BOOL)a3;
- (void)updateWithRemoteSettings:(id)a3;
@end

@implementation HMDStreamingCapabilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAudioSampleRates, 0);
  objc_storeStrong((id *)&self->_supportedBitRateSettings, 0);
  objc_storeStrong((id *)&self->_supportedPacketizationModes, 0);
  objc_storeStrong((id *)&self->_supportedH264Levels, 0);
  objc_storeStrong((id *)&self->_supportedH264Profiles, 0);
  objc_storeStrong((id *)&self->_supportedVideoResolutions, 0);
  objc_storeStrong((id *)&self->_supportedVideoCodecs, 0);
  objc_storeStrong((id *)&self->_supportedAudioCodecs, 0);
}

- (void)setSupportsComfortNoise:(BOOL)a3
{
  self->_supportsComfortNoise = a3;
}

- (BOOL)supportsComfortNoise
{
  return self->_supportsComfortNoise;
}

- (void)setStreamingTierType:(unint64_t)a3
{
  self->_streamingTierType = a3;
}

- (unint64_t)streamingTierType
{
  return self->_streamingTierType;
}

- (NSSet)supportedAudioSampleRates
{
  return self->_supportedAudioSampleRates;
}

- (NSSet)supportedBitRateSettings
{
  return self->_supportedBitRateSettings;
}

- (NSSet)supportedPacketizationModes
{
  return self->_supportedPacketizationModes;
}

- (NSSet)supportedH264Levels
{
  return self->_supportedH264Levels;
}

- (NSSet)supportedH264Profiles
{
  return self->_supportedH264Profiles;
}

- (NSSet)supportedVideoResolutions
{
  return self->_supportedVideoResolutions;
}

- (NSSet)supportedVideoCodecs
{
  return self->_supportedVideoCodecs;
}

- (NSDictionary)supportedAudioCodecs
{
  return self->_supportedAudioCodecs;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(HMDStreamingCapabilities *)self supportedVideoCodecs];
  [v7 encodeObject:v4 forKey:@"a"];

  v5 = [(HMDStreamingCapabilities *)self supportedAudioCodecs];
  [v7 encodeObject:v5 forKey:@"b"];

  v6 = [(HMDStreamingCapabilities *)self supportedVideoResolutions];
  [v7 encodeObject:v6 forKey:@"c"];

  objc_msgSend(v7, "encodeInt32:forKey:", -[HMDStreamingCapabilities streamingTierType](self, "streamingTierType"), @"d");
  objc_msgSend(v7, "encodeBool:forKey:", -[HMDStreamingCapabilities supportsComfortNoise](self, "supportsComfortNoise"), @"e");
}

- (HMDStreamingCapabilities)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDStreamingCapabilities;
  v5 = [(HMDStreamingCapabilities *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"a"];
    supportedVideoCodecs = v5->_supportedVideoCodecs;
    v5->_supportedVideoCodecs = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"b"];
    supportedAudioCodecs = v5->_supportedAudioCodecs;
    v5->_supportedAudioCodecs = (NSDictionary *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"c"];
    supportedVideoResolutions = v5->_supportedVideoResolutions;
    v5->_supportedVideoResolutions = (NSSet *)v19;

    v5->_streamingTierType = (int)[v4 decodeInt32ForKey:@"d"];
    v5->_supportsComfortNoise = [v4 decodeBoolForKey:@"e"];
  }

  return v5;
}

- (void)updateWithRemoteSettings:(id)a3
{
  id v28 = a3;
  id v4 = [v28 supportedAudioCodecs];

  if (v4)
  {
    v5 = [v28 supportedAudioCodecs];
    supportedAudioCodecs = self->_supportedAudioCodecs;
    self->_supportedAudioCodecs = v5;
  }
  id v7 = [v28 supportedVideoCodecs];

  if (v7)
  {
    v8 = [v28 supportedVideoCodecs];
    supportedVideoCodecs = self->_supportedVideoCodecs;
    self->_supportedVideoCodecs = v8;
  }
  v10 = [v28 supportedVideoResolutions];

  if (v10)
  {
    v11 = [v28 supportedVideoResolutions];
    supportedVideoResolutions = self->_supportedVideoResolutions;
    self->_supportedVideoResolutions = v11;
  }
  v13 = [v28 supportedH264Profiles];

  if (v13)
  {
    uint64_t v14 = [v28 supportedH264Profiles];
    supportedH264Profiles = self->_supportedH264Profiles;
    self->_supportedH264Profiles = v14;
  }
  v16 = [v28 supportedH264Levels];

  if (v16)
  {
    v17 = [v28 supportedH264Levels];
    supportedH264Levels = self->_supportedH264Levels;
    self->_supportedH264Levels = v17;
  }
  uint64_t v19 = [v28 supportedPacketizationModes];

  if (v19)
  {
    v20 = [v28 supportedPacketizationModes];
    supportedPacketizationModes = self->_supportedPacketizationModes;
    self->_supportedPacketizationModes = v20;
  }
  objc_super v22 = [v28 supportedBitRateSettings];

  if (v22)
  {
    v23 = [v28 supportedBitRateSettings];
    supportedBitRateSettings = self->_supportedBitRateSettings;
    self->_supportedBitRateSettings = v23;
  }
  v25 = [v28 supportedAudioSampleRates];

  if (v25)
  {
    v26 = [v28 supportedAudioSampleRates];
    supportedAudioSampleRates = self->_supportedAudioSampleRates;
    self->_supportedAudioSampleRates = v26;
  }
  -[HMDStreamingCapabilities setStreamingTierType:](self, "setStreamingTierType:", [v28 streamingTierType]);
  -[HMDStreamingCapabilities setSupportsComfortNoise:](self, "setSupportsComfortNoise:", [v28 supportsComfortNoise]);
}

- (void)_updateWithStreamPreference:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 videoPreferences];
  v6 = [v5 resolutions];

  if ([v6 count])
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v8 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v56 + 1) + 8 * i) videoResolution];
          if ((unint64_t)(v14 - 1) <= 0x1C)
          {
            v15 = [[HMDVideoResolution alloc] initWithResolution:v14];
            [v7 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v11);
    }

    v16 = (NSSet *)[v7 copy];
    supportedVideoResolutions = self->_supportedVideoResolutions;
    self->_supportedVideoResolutions = v16;

    v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v21;
      __int16 v64 = 2112;
      v65 = v7;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding the video resolution capabilities with %@", buf, 0x16u);
    }

    v6 = v8;
  }
  objc_super v22 = [v4 audioPreferences];
  v23 = [v22 codecs];

  if ([v23 count])
  {
    v47 = v6;
    v24 = [MEMORY[0x1E4F1CA80] set];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (!v26) {
      goto LABEL_27;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v53;
    while (1)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v53 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = [*(id *)(*((void *)&v52 + 1) + 8 * j) audioCodec];
        if (v30 == 1)
        {
          uint64_t v31 = 2;
        }
        else
        {
          if (v30 != 2) {
            continue;
          }
          uint64_t v31 = 3;
        }
        v32 = [[HMDAudioCodecGroup alloc] initWithAudioCodecGroup:v31];
        [v24 addObject:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (!v27)
      {
LABEL_27:

        v33 = [(HMDStreamingCapabilities *)self supportedAudioCodecs];
        v34 = (void *)[v33 mutableCopy];

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v35 = [(HMDStreamingCapabilities *)self supportedAudioCodecs];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v49 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v48 + 1) + 8 * k);
              if (([v24 containsObject:v40] & 1) == 0) {
                [v34 removeObjectForKey:v40];
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v37);
        }

        v41 = (NSDictionary *)[v34 copy];
        supportedAudioCodecs = self->_supportedAudioCodecs;
        self->_supportedAudioCodecs = v41;

        v43 = (void *)MEMORY[0x1D9452090]();
        v44 = self;
        v45 = HMFGetOSLogHandle();
        v6 = v47;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v63 = v46;
          __int16 v64 = 2112;
          v65 = v34;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding the audio codec group capabilities with %@", buf, 0x16u);
        }

        break;
      }
    }
  }
}

- (id)_supportedResolutionsWithOverrides
{
  v2 = [MEMORY[0x1E4F1CA80] setWithSet:supportedHMDVideoResolutions];
  BOOL v3 = isWatch();
  id v4 = [[HMDVideoResolution alloc] initWithResolution:23];
  [v2 addObject:v4];

  v5 = [HMDVideoResolution alloc];
  if (v3)
  {
    v6 = [(HMDVideoResolution *)v5 initWithResolution:11];
    uint64_t v7 = 27;
    uint64_t v8 = 7;
  }
  else
  {
    id v9 = [(HMDVideoResolution *)v5 initWithResolution:22];
    [v2 addObject:v9];

    uint64_t v10 = [[HMDVideoResolution alloc] initWithResolution:21];
    [v2 addObject:v10];

    uint64_t v11 = [[HMDVideoResolution alloc] initWithResolution:20];
    [v2 addObject:v11];

    uint64_t v12 = [[HMDVideoResolution alloc] initWithResolution:19];
    [v2 addObject:v12];

    v13 = [[HMDVideoResolution alloc] initWithResolution:11];
    [v2 addObject:v13];

    uint64_t v14 = [[HMDVideoResolution alloc] initWithResolution:12];
    [v2 addObject:v14];

    v15 = [[HMDVideoResolution alloc] initWithResolution:13];
    [v2 addObject:v15];

    v16 = [[HMDVideoResolution alloc] initWithResolution:14];
    [v2 addObject:v16];

    v17 = [[HMDVideoResolution alloc] initWithResolution:17];
    [v2 addObject:v17];

    v18 = [[HMDVideoResolution alloc] initWithResolution:18];
    [v2 addObject:v18];

    uint64_t v19 = [[HMDVideoResolution alloc] initWithResolution:15];
    [v2 addObject:v19];

    v20 = [[HMDVideoResolution alloc] initWithResolution:16];
    [v2 addObject:v20];

    v21 = [[HMDVideoResolution alloc] initWithResolution:24];
    [v2 addObject:v21];

    objc_super v22 = [[HMDVideoResolution alloc] initWithResolution:25];
    [v2 addObject:v22];

    v23 = [[HMDVideoResolution alloc] initWithResolution:26];
    [v2 addObject:v23];

    v6 = [[HMDVideoResolution alloc] initWithResolution:27];
    uint64_t v7 = 29;
    uint64_t v8 = 28;
  }
  [v2 addObject:v6];

  v24 = [[HMDVideoResolution alloc] initWithResolution:v8];
  [v2 addObject:v24];

  id v25 = [[HMDVideoResolution alloc] initWithResolution:v7];
  [v2 addObject:v25];

  uint64_t v26 = (void *)[v2 copy];
  return v26;
}

- (HMDStreamingCapabilities)initWithStreamPreference:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDStreamingCapabilities;
  v5 = [(HMDStreamingCapabilities *)&v29 init];
  if (v5)
  {
    if (initWithStreamPreference__onceToken != -1) {
      dispatch_once(&initWithStreamPreference__onceToken, &__block_literal_global_62431);
    }
    objc_storeStrong((id *)&v5->_supportedVideoCodecs, (id)supportedHMDVideoCodecs);
    objc_storeStrong((id *)&v5->_supportedAudioCodecs, (id)supportedHMDAudioCodecs);
    uint64_t v6 = [(HMDStreamingCapabilities *)v5 _supportedResolutionsWithOverrides];
    supportedVideoResolutions = v5->_supportedVideoResolutions;
    v5->_supportedVideoResolutions = (NSSet *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = +[HMDH264Profile arrayWithProfiles:&unk_1F2DC6BF8];
    uint64_t v10 = [v8 setWithArray:v9];
    supportedH264Profiles = v5->_supportedH264Profiles;
    v5->_supportedH264Profiles = (NSSet *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = +[HMDH264Level arrayWithLevels:&unk_1F2DC6C10];
    uint64_t v14 = [v12 setWithArray:v13];
    supportedH264Levels = v5->_supportedH264Levels;
    v5->_supportedH264Levels = (NSSet *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v17 = +[HMDPacketizationMode arrayWithModes:&unk_1F2DC6C28];
    uint64_t v18 = [v16 setWithArray:v17];
    supportedPacketizationModes = v5->_supportedPacketizationModes;
    v5->_supportedPacketizationModes = (NSSet *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    v21 = +[HMDBitRateSetting arrayWithSettings:&unk_1F2DC6C40];
    uint64_t v22 = [v20 setWithArray:v21];
    supportedBitRateSettings = v5->_supportedBitRateSettings;
    v5->_supportedBitRateSettings = (NSSet *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    id v25 = +[HMDAudioSampleRate arrayWithRates:&unk_1F2DC6C58];
    uint64_t v26 = [v24 setWithArray:v25];
    supportedAudioSampleRates = v5->_supportedAudioSampleRates;
    v5->_supportedAudioSampleRates = (NSSet *)v26;

    v5->_supportsComfortNoise = !isWatch();
    [(HMDStreamingCapabilities *)v5 _updateWithStreamPreference:v4];
  }

  return v5;
}

void __53__HMDStreamingCapabilities_initWithStreamPreference___block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F47908] capabilities];
  v1 = (void *)MEMORY[0x1D9452090]();
  v2 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v0;
    _os_log_impl(&dword_1D49D5000, v2, OS_LOG_TYPE_INFO, "%{public}@Audio streaming capabilities as reported by AVCAudioStream: %@", (uint8_t *)&v9, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F47998] capabilities];
  v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Video streaming capabilities as reported by AVCVideoStream: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = (void *)[v0 mutableCopy];
  [v8 addEntriesFromDictionary:v4];
  +[HMDStreamingCapabilities translateCapabilities:v8];
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = HMDStreamingTierTypeAsString([(HMDStreamingCapabilities *)self streamingTierType]);
  v5 = [(HMDStreamingCapabilities *)self supportedAudioCodecs];
  uint64_t v6 = [(HMDStreamingCapabilities *)self supportedVideoCodecs];
  uint64_t v7 = [(HMDStreamingCapabilities *)self supportedVideoResolutions];
  [(HMDStreamingCapabilities *)self supportsComfortNoise];
  uint64_t v8 = HMFBooleanToString();
  int v9 = [v3 stringWithFormat:@"Streaming Tier: %@, Supported Audio Codecs : %@, Supported Video Codecs : %@, Supported Video Resolutions : %@, Supports Comfort Noise : %@", v4, v5, v6, v7, v8];

  return v9;
}

+ (unint64_t)aspectRatioOfResolution:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 resolutionType] - 1;
  if (v5 >= 0x1D)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      v17 = @"HMDVideoResolutionAspectRatio16x9";
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Resolution: %@ is not handled, returning default aspect ratio: %@", (uint8_t *)&v12, 0x20u);
    }
    unint64_t v6 = 1;
  }
  else
  {
    unint64_t v6 = qword_1D54D3B00[v5];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)translateCapabilities:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F479C8]];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HMDStreamingCapabilities_translateCapabilities___block_invoke;
  aBlock[3] = &unk_1E6A0C708;
  id v6 = v4;
  id v58 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v8);
        }
        switch([*(id *)(*((void *)&v53 + 1) + 8 * v12) unsignedIntegerValue])
        {
          case 0:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 5;
            goto LABEL_12;
          case 1:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 6;
            goto LABEL_17;
          case 2:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 0;
            goto LABEL_12;
          case 3:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 1;
LABEL_12:
            uint64_t v16 = 0;
            goto LABEL_18;
          case 4:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 2;
            goto LABEL_17;
          case 5:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 2;
            goto LABEL_14;
          case 9:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 3;
LABEL_14:
            uint64_t v16 = 2;
            goto LABEL_18;
          case 10:
            uint64_t v13 = (void (*)(void *, uint64_t, uint64_t))v7[2];
            __int16 v14 = v7;
            uint64_t v15 = 3;
LABEL_17:
            uint64_t v16 = 1;
LABEL_18:
            v13(v14, v15, v16);
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v10);
  }

  v43 = v6;
  uint64_t v17 = [v6 copy];
  uint64_t v18 = (void *)supportedHMDAudioCodecs;
  supportedHMDAudioCodecs = v17;

  v44 = v3;
  uint64_t v19 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F479D0]];
  v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v19, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        if (![*(id *)(*((void *)&v49 + 1) + 8 * v25) unsignedIntegerValue])
        {
          uint64_t v26 = [[HMDVideoCodec alloc] initWithCodec:0];
          [v20 addObject:v26];
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v23);
  }

  uint64_t v27 = [v20 copy];
  uint64_t v28 = (void *)supportedHMDVideoCodecs;
  supportedHMDVideoCodecs = v27;

  if (isWatch())
  {
    objc_super v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = [[HMDVideoResolution alloc] initWithResolution:1];
    v60 = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    uint64_t v32 = [v29 setWithArray:v31];
    v33 = v44;
  }
  else
  {
    id v42 = v8;
    v34 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F479D8]];
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v34, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v30 = v34;
    uint64_t v35 = [(HMDVideoResolution *)v30 countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v30);
          }
          unint64_t v39 = [*(id *)(*((void *)&v45 + 1) + 8 * v38) unsignedIntegerValue];
          if (v39 <= 9)
          {
            uint64_t v40 = [[HMDVideoResolution alloc] initWithResolution:v39 + 1];
            [v31 addObject:v40];
          }
          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [(HMDVideoResolution *)v30 countByEnumeratingWithState:&v45 objects:v59 count:16];
      }
      while (v36);
    }

    uint64_t v32 = [v31 copy];
    v33 = v44;
    id v8 = v42;
  }
  v41 = (void *)supportedHMDVideoResolutions;
  supportedHMDVideoResolutions = v32;
}

void __50__HMDStreamingCapabilities_translateCapabilities___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = [[HMDAudioCodecGroup alloc] initWithAudioCodecGroup:a2];
  unint64_t v5 = [[HMDAudioSampleRate alloc] initWithSampleRate:a3];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)[v6 mutableCopy];
    [v8 addObject:v5];
    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    [v8 addObject:v5];
    uint64_t v9 = (void *)[v8 copy];
  }

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

@end