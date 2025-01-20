@interface HMDSupportedRTPConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSupportedRTPConfiguration)initWithCoder:(id)a3;
- (HMDSupportedRTPConfiguration)initWithCryptoSuites:(id)a3;
- (NSArray)srtpCryptoSuites;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSupportedRTPConfiguration

- (void).cxx_destruct
{
}

- (NSArray)srtpCryptoSuites
{
  return self->_srtpCryptoSuites;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSupportedRTPConfiguration *)self srtpCryptoSuites];
  [v4 encodeObject:v5 forKey:@"kSupportedRTPParameters__SRTPCryptoSuite"];
}

- (HMDSupportedRTPConfiguration)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDSupportedRTPConfiguration;
  id v5 = [(HMDSupportedRTPConfiguration *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSupportedRTPParameters__SRTPCryptoSuite"];
    srtpCryptoSuites = v5->_srtpCryptoSuites;
    v5->_srtpCryptoSuites = (NSArray *)v9;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  id v10 = [(HMDSupportedRTPConfiguration *)self srtpCryptoSuites];
  uint64_t v9 = arrayToString(v10, v6);
  [v7 appendFormat:@"\n %@ srtpCryptoSuites = %@ ", v6, v9];
}

- (NSData)tlvData
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35AD8] creator];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDSupportedRTPConfiguration *)self srtpCryptoSuites];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "srtpCryptoSuite"));
        [v3 addTLV:2 number:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 serialize];

  return (NSData *)v10;
}

- (BOOL)_parseFromTLVData
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F358B8] wrappertlv:2 name:@"kSupportedRTPParameters__SRTPCryptoSuite" objectCreator:&__block_literal_global_529];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];
  if (v5)
  {
    uint64_t v6 = [v3 field];
    srtpCryptoSuites = self->_srtpCryptoSuites;
    self->_srtpCryptoSuites = v6;
  }
  return v5;
}

HMDSRTPCryptoSuite *__49__HMDSupportedRTPConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDSRTPCryptoSuite alloc] initWithTLVData:v2];

  return v3;
}

- (HMDSupportedRTPConfiguration)initWithCryptoSuites:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSupportedRTPConfiguration;
  BOOL v5 = [(HMDSupportedRTPConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    srtpCryptoSuites = v5->_srtpCryptoSuites;
    v5->_srtpCryptoSuites = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end