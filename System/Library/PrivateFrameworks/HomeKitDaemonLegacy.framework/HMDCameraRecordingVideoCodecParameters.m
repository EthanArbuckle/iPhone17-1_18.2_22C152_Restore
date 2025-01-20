@interface HMDCameraRecordingVideoCodecParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingVideoCodecParameters)initWithCoder:(id)a3;
- (HMDCameraRecordingVideoCodecParameters)initWithProfiles:(id)a3 levels:(id)a4 bitRate:(id)a5 iFrameInterval:(id)a6;
- (NSArray)levels;
- (NSArray)profiles;
- (NSData)tlvData;
- (NSNumber)bitRate;
- (NSNumber)iFrameInterval;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingVideoCodecParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iFrameInterval, 0);
  objc_storeStrong((id *)&self->_bitRate, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

- (NSNumber)iFrameInterval
{
  return self->_iFrameInterval;
}

- (NSNumber)bitRate
{
  return self->_bitRate;
}

- (NSArray)levels
{
  return self->_levels;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingVideoCodecParameters *)self profiles];
  [v4 encodeObject:v5 forKey:@"kVideoCodecParametersProfileID"];

  v6 = [(HMDCameraRecordingVideoCodecParameters *)self levels];
  [v4 encodeObject:v6 forKey:@"kVideoCodecParametersLevel"];

  v7 = [(HMDCameraRecordingVideoCodecParameters *)self bitRate];
  [v4 encodeObject:v7 forKey:@"kVideoCodecParameters"];

  id v8 = [(HMDCameraRecordingVideoCodecParameters *)self iFrameInterval];
  [v4 encodeObject:v8 forKey:@"kVideoCodecParameters"];
}

- (HMDCameraRecordingVideoCodecParameters)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraRecordingVideoCodecParameters;
  v5 = [(HMDCameraRecordingVideoCodecParameters *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoCodecParametersProfileID"];
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoCodecParametersLevel"];
    levels = v5->_levels;
    v5->_levels = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoCodecParameters"];
    bitRate = v5->_bitRate;
    v5->_bitRate = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoCodecParameters"];
    iFrameInterval = v5->_iFrameInterval;
    v5->_iFrameInterval = (NSNumber *)v18;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDCameraRecordingVideoCodecParameters *)self profiles];
  v10 = [v6 indentationByLevels:1];
  v11 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@h264Profile = %@ ", v6, v11];

  v12 = [(HMDCameraRecordingVideoCodecParameters *)self levels];
  v13 = [v6 indentationByLevels:1];
  uint64_t v14 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@levels = %@", v6, v14];

  v15 = [(HMDCameraRecordingVideoCodecParameters *)self bitRate];
  [v7 appendFormat:@"\n%@bitRate = %@", v6, v15];

  id v16 = [(HMDCameraRecordingVideoCodecParameters *)self iFrameInterval];
  [v7 appendFormat:@"\n%@iFrameInterval = %@", v6, v16];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = NSNumber;
  v5 = [(HMDCameraRecordingVideoCodecParameters *)self profiles];
  id v6 = [v5 firstObject];
  id v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "h264Profile"));
  [v3 addTLV:1 length:1 number:v7];

  id v8 = NSNumber;
  uint64_t v9 = [(HMDCameraRecordingVideoCodecParameters *)self levels];
  v10 = [v9 firstObject];
  v11 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "h264Level"));
  [v3 addTLV:2 length:1 number:v11];

  v12 = [(HMDCameraRecordingVideoCodecParameters *)self bitRate];
  [v3 addTLV:3 length:4 number:v12];

  v13 = [(HMDCameraRecordingVideoCodecParameters *)self iFrameInterval];
  [v3 addTLV:4 length:4 number:v13];

  uint64_t v14 = [v3 serialize];

  return (NSData *)v14;
}

- (BOOL)_parseFromTLVData
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BC58] wrappertlv:1 name:@"kVideoCodecParametersProfileID" objectCreator:&__block_literal_global_135356];
  id v4 = [MEMORY[0x1E4F5BC58] wrappertlv:2 name:@"kVideoCodecParametersLevel" objectCreator:&__block_literal_global_184_135357];
  v5 = [MEMORY[0x1E4F5BDE8] wrappertlv:3 name:@"kVideoCodecParameters"];
  id v6 = [MEMORY[0x1E4F5BDE8] wrappertlv:4 name:@"kVideoCodecParameters"];
  v20[0] = v3;
  v20[1] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v19[0] = v5;
  v19[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  BOOL v9 = [(HAPTLVBase *)self _parseMandatory:v7 optional:v8];
  if (v9)
  {
    v10 = [v3 field];
    profiles = self->_profiles;
    self->_profiles = v10;

    v12 = [v4 field];
    levels = self->_levels;
    self->_levels = v12;
  }
  uint64_t v14 = [v5 field];
  bitRate = self->_bitRate;
  self->_bitRate = v14;

  id v16 = [v6 field];
  iFrameInterval = self->_iFrameInterval;
  self->_iFrameInterval = v16;

  return v9;
}

HMDCameraRecordingH264Level *__59__HMDCameraRecordingVideoCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCameraRecordingH264Level alloc] initWithTLVData:v2];

  return v3;
}

HMDCameraRecordingH264Profile *__59__HMDCameraRecordingVideoCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCameraRecordingH264Profile alloc] initWithTLVData:v2];

  return v3;
}

- (HMDCameraRecordingVideoCodecParameters)initWithProfiles:(id)a3 levels:(id)a4 bitRate:(id)a5 iFrameInterval:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraRecordingVideoCodecParameters;
  v15 = [(HMDCameraRecordingVideoCodecParameters *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_profiles, a3);
    objc_storeStrong((id *)&v16->_levels, a4);
    objc_storeStrong((id *)&v16->_bitRate, a5);
    objc_storeStrong((id *)&v16->_iFrameInterval, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end