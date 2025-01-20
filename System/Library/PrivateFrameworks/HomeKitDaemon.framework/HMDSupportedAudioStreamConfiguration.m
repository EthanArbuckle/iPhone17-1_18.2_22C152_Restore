@interface HMDSupportedAudioStreamConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSupportedAudioStreamConfiguration)initWithCoder:(id)a3;
- (HMDSupportedAudioStreamConfiguration)initWithComfortNoise:(id)a3 CodecConfigurations:(id)a4;
- (NSData)tlvData;
- (NSDictionary)codecConfigurations;
- (NSNumber)supportsComfortNoise;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSupportedAudioStreamConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfigurations, 0);
  objc_storeStrong((id *)&self->_supportsComfortNoise, 0);
}

- (NSDictionary)codecConfigurations
{
  return self->_codecConfigurations;
}

- (NSNumber)supportsComfortNoise
{
  return self->_supportsComfortNoise;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSupportedAudioStreamConfiguration *)self codecConfigurations];
  [v4 encodeObject:v5 forKey:@"kSupportedAudioStreamConfiguration_AudioCodecConfigurations"];

  id v6 = [(HMDSupportedAudioStreamConfiguration *)self supportsComfortNoise];
  [v4 encodeObject:v6 forKey:@"kSupportedAudioStreamConfiguration_ComfortNoise"];
}

- (HMDSupportedAudioStreamConfiguration)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDSupportedAudioStreamConfiguration;
  v5 = [(HMDSupportedAudioStreamConfiguration *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSupportedAudioStreamConfiguration_AudioCodecConfigurations"];
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kSupportedAudioStreamConfiguration_ComfortNoise"];
    supportsComfortNoise = v5->_supportsComfortNoise;
    v5->_supportsComfortNoise = (NSNumber *)v14;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDSupportedAudioStreamConfiguration *)self codecConfigurations];
  v10 = [v9 allValues];
  v11 = arrayToString(v10, v6);
  [v7 appendFormat:@"\n %@ configurations = %@ ", v6, v11];

  id v12 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ comfortNoise = %@ ", v6, v12];
}

- (NSData)tlvData
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35AD8] creator];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(HMDSupportedAudioStreamConfiguration *)self codecConfigurations];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) tlvData];
        [v3 addTLV:1 data:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v11 = [(HMDSupportedAudioStreamConfiguration *)self supportsComfortNoise];
  [v3 addTLV:2 number:v11];

  id v12 = [v3 serialize];

  return (NSData *)v12;
}

- (BOOL)_parseFromTLVData
{
  v30[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F358B8] wrappertlv:1 name:@"kSupportedAudioStreamConfiguration_AudioCodecConfigurations" objectCreator:&__block_literal_global_491];
  id v4 = [MEMORY[0x263F35A58] wrappertlv:2 name:@"kSupportedAudioStreamConfiguration_ComfortNoise"];
  v30[0] = v3;
  v30[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];
  BOOL v7 = v6;
  if (v6)
  {
    v23 = v5;
    BOOL v24 = v6;
    uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v9 = [v3 field];
    v10 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = [v3 field];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v17 = [v16 codecGroup];
          [v10 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    uint64_t v18 = (NSDictionary *)[v10 copy];
    codecConfigurations = self->_codecConfigurations;
    self->_codecConfigurations = v18;

    v20 = [v4 field];
    supportsComfortNoise = self->_supportsComfortNoise;
    self->_supportsComfortNoise = v20;

    BOOL v7 = v24;
    v5 = v23;
  }

  return v7;
}

HMDAudioCodecConfiguration *__57__HMDSupportedAudioStreamConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDAudioCodecConfiguration alloc] initWithTLVData:v2];

  return v3;
}

- (HMDSupportedAudioStreamConfiguration)initWithComfortNoise:(id)a3 CodecConfigurations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSupportedAudioStreamConfiguration;
  uint64_t v9 = [(HMDSupportedAudioStreamConfiguration *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_supportsComfortNoise, a3);
    uint64_t v11 = [v8 copy];
    codecConfigurations = v10->_codecConfigurations;
    v10->_codecConfigurations = (NSDictionary *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end