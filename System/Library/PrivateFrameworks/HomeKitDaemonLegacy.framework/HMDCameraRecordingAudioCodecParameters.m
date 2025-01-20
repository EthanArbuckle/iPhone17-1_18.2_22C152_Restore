@interface HMDCameraRecordingAudioCodecParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingAudioCodecParameters)initWithChannelCount:(id)a3 bitRateModes:(id)a4 audioSampleRates:(id)a5 maxAudioBitRate:(id)a6;
- (HMDCameraRecordingAudioCodecParameters)initWithCoder:(id)a3;
- (NSArray)audioSampleRates;
- (NSArray)bitRateModes;
- (NSData)tlvData;
- (NSNumber)audioChannelCount;
- (NSNumber)maxAudioBitRate;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingAudioCodecParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAudioBitRate, 0);
  objc_storeStrong((id *)&self->_audioSampleRates, 0);
  objc_storeStrong((id *)&self->_bitRateModes, 0);
  objc_storeStrong((id *)&self->_audioChannelCount, 0);
}

- (NSNumber)maxAudioBitRate
{
  return self->_maxAudioBitRate;
}

- (NSArray)audioSampleRates
{
  return self->_audioSampleRates;
}

- (NSArray)bitRateModes
{
  return self->_bitRateModes;
}

- (NSNumber)audioChannelCount
{
  return self->_audioChannelCount;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingAudioCodecParameters *)self audioChannelCount];
  [v4 encodeObject:v5 forKey:@"kAudioCodecParametersChannels"];

  v6 = [(HMDCameraRecordingAudioCodecParameters *)self bitRateModes];
  [v4 encodeObject:v6 forKey:@"kAudioCodecParametersBitRateModes"];

  v7 = [(HMDCameraRecordingAudioCodecParameters *)self audioSampleRates];
  [v4 encodeObject:v7 forKey:@"kAudioCodecParametersSampleRates"];

  id v8 = [(HMDCameraRecordingAudioCodecParameters *)self maxAudioBitRate];
  [v4 encodeObject:v8 forKey:@"kAudioCodecParametersMaxAudioBitrate"];
}

- (HMDCameraRecordingAudioCodecParameters)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraRecordingAudioCodecParameters;
  v5 = [(HMDCameraRecordingAudioCodecParameters *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAudioCodecParametersChannels"];
    audioChannelCount = v5->_audioChannelCount;
    v5->_audioChannelCount = (NSNumber *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kAudioCodecParametersBitRateModes"];
    bitRateModes = v5->_bitRateModes;
    v5->_bitRateModes = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v15 = [v13 setWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"kAudioCodecParametersSampleRates"];
    audioSampleRates = v5->_audioSampleRates;
    v5->_audioSampleRates = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAudioCodecParametersMaxAudioBitrate"];
    maxAudioBitRate = v5->_maxAudioBitRate;
    v5->_maxAudioBitRate = (NSNumber *)v18;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingAudioCodecParameters *)self audioChannelCount];
  [v7 appendFormat:@"\n%@channels = %@ ", v6, v9];

  v10 = [(HMDCameraRecordingAudioCodecParameters *)self bitRateModes];
  uint64_t v11 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@bitRateModes = %@", v6, v11];

  v12 = [(HMDCameraRecordingAudioCodecParameters *)self audioSampleRates];
  v13 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@audioSampleRates = %@", v6, v13];

  id v14 = [(HMDCameraRecordingAudioCodecParameters *)self maxAudioBitRate];
  [v7 appendFormat:@"\n%@maxAudioBitRate = %@", v6, v14];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDCameraRecordingAudioCodecParameters *)self audioChannelCount];
  [v3 addTLV:1 length:1 number:v4];

  v5 = NSNumber;
  id v6 = [(HMDCameraRecordingAudioCodecParameters *)self bitRateModes];
  id v7 = [v6 firstObject];
  id v8 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "type"));
  [v3 addTLV:2 length:1 number:v8];

  v9 = NSNumber;
  v10 = [(HMDCameraRecordingAudioCodecParameters *)self audioSampleRates];
  uint64_t v11 = [v10 firstObject];
  v12 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "type"));
  [v3 addTLV:3 length:1 number:v12];

  v13 = [(HMDCameraRecordingAudioCodecParameters *)self maxAudioBitRate];
  [v3 addTLV:4 length:4 number:v13];

  id v14 = [v3 serialize];

  return (NSData *)v14;
}

- (BOOL)_parseFromTLVData
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kAudioCodecParametersChannels"];
  id v4 = [MEMORY[0x1E4F5BC58] wrappertlv:2 name:@"kAudioCodecParametersBitRateModes" objectCreator:&__block_literal_global_185603];
  v5 = [MEMORY[0x1E4F5BC58] wrappertlv:3 name:@"kAudioCodecParametersSampleRates" objectCreator:&__block_literal_global_118_185604];
  id v6 = [MEMORY[0x1E4F5BDE8] wrappertlv:4 name:@"kAudioCodecParametersMaxAudioBitrate"];
  v20[0] = v3;
  v20[1] = v4;
  v20[2] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v19 = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  BOOL v9 = [(HAPTLVBase *)self _parseMandatory:v7 optional:v8];
  if (v9)
  {
    v10 = [v4 field];
    bitRateModes = self->_bitRateModes;
    self->_bitRateModes = v10;

    v12 = [v5 field];
    audioSampleRates = self->_audioSampleRates;
    self->_audioSampleRates = v12;

    id v14 = [v3 field];
    audioChannelCount = self->_audioChannelCount;
    self->_audioChannelCount = v14;
  }
  uint64_t v16 = [v6 field];
  maxAudioBitRate = self->_maxAudioBitRate;
  self->_maxAudioBitRate = v16;

  return v9;
}

HMDCameraRecordingAudioSampleRate *__59__HMDCameraRecordingAudioCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCameraRecordingAudioSampleRate alloc] initWithTLVData:v2];

  return v3;
}

HMDCameraRecordingAudioBitRateMode *__59__HMDCameraRecordingAudioCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCameraRecordingAudioBitRateMode alloc] initWithTLVData:v2];

  return v3;
}

- (HMDCameraRecordingAudioCodecParameters)initWithChannelCount:(id)a3 bitRateModes:(id)a4 audioSampleRates:(id)a5 maxAudioBitRate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraRecordingAudioCodecParameters;
  v15 = [(HMDCameraRecordingAudioCodecParameters *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_audioChannelCount, a3);
    objc_storeStrong((id *)&v16->_bitRateModes, a4);
    objc_storeStrong((id *)&v16->_audioSampleRates, a5);
    objc_storeStrong((id *)&v16->_maxAudioBitRate, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end