@interface HMDSupportedVideoStreamConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSupportedVideoStreamConfiguration)initWithCodecConfigurations:(id)a3;
- (HMDSupportedVideoStreamConfiguration)initWithCoder:(id)a3;
- (NSData)tlvData;
- (NSDictionary)codecConfigurations;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSupportedVideoStreamConfiguration

- (void).cxx_destruct
{
}

- (NSDictionary)codecConfigurations
{
  return self->_codecConfigurations;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSupportedVideoStreamConfiguration *)self codecConfigurations];
  [v4 encodeObject:v5 forKey:@"kSupportedVideoStreamConfiguration_VideoCodecConfigurations"];
}

- (HMDSupportedVideoStreamConfiguration)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDSupportedVideoStreamConfiguration;
  id v5 = [(HMDSupportedVideoStreamConfiguration *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSupportedVideoStreamConfiguration_VideoCodecConfigurations"];
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSDictionary *)v9;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  id v11 = [(HMDSupportedVideoStreamConfiguration *)self codecConfigurations];
  uint64_t v9 = [v11 allValues];
  v10 = arrayToString(v9, v6);
  [v7 appendFormat:@"\n %@ configurations = %@ ", v6, v10];
}

- (NSData)tlvData
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BE50] creator];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(HMDSupportedVideoStreamConfiguration *)self codecConfigurations];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) tlvData];
        [v3 addTLV:1 data:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v3 serialize];

  return (NSData *)v11;
}

- (BOOL)_parseFromTLVData
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BC58] wrappertlv:1 name:@"kSupportedVideoStreamConfiguration_VideoCodecConfigurations" objectCreator:&__block_literal_global_333];
  v25[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];
  if (v5)
  {
    v19 = self;
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v7 = [v3 field];
    uint64_t v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v3 field];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v15 = [v14 videoCodec];
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v8 copy];
    codecConfigurations = v19->_codecConfigurations;
    v19->_codecConfigurations = (NSDictionary *)v16;
  }
  return v5;
}

HMDVideoCodecConfiguration *__57__HMDSupportedVideoStreamConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDVideoCodecConfiguration alloc] initWithTLVData:v2];

  return v3;
}

- (HMDSupportedVideoStreamConfiguration)initWithCodecConfigurations:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSupportedVideoStreamConfiguration;
  BOOL v5 = [(HMDSupportedVideoStreamConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end