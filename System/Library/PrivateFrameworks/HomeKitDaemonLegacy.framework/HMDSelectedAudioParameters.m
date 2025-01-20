@interface HMDSelectedAudioParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDAudioCodecGroup)codecGroup;
- (HMDAudioCodecParameters)codecParameters;
- (HMDSelectedAudioParameters)initWithCodecGroup:(id)a3 codecParameter:(id)a4 rtpParameter:(id)a5 comfortNoiseEnabled:(id)a6;
- (HMDSelectedAudioParameters)initWithCoder:(id)a3;
- (HMDSelectedRTPParameters)rtpParameters;
- (NSData)tlvData;
- (NSNumber)comfortNoiseEnabled;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSelectedAudioParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comfortNoiseEnabled, 0);
  objc_storeStrong((id *)&self->_rtpParameters, 0);
  objc_storeStrong((id *)&self->_codecParameters, 0);
  objc_storeStrong((id *)&self->_codecGroup, 0);
}

- (NSNumber)comfortNoiseEnabled
{
  return self->_comfortNoiseEnabled;
}

- (HMDSelectedRTPParameters)rtpParameters
{
  return self->_rtpParameters;
}

- (HMDAudioCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (HMDAudioCodecGroup)codecGroup
{
  return self->_codecGroup;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSelectedAudioParameters *)self codecGroup];
  [v4 encodeObject:v5 forKey:@"kAudioParameters_CodecGroup"];

  v6 = [(HMDSelectedAudioParameters *)self codecParameters];
  [v4 encodeObject:v6 forKey:@"kAudioParameters_CodecParameters"];

  v7 = [(HMDSelectedAudioParameters *)self rtpParameters];
  [v4 encodeObject:v7 forKey:@"kAudioParameters_RTPParameter"];

  id v8 = [(HMDSelectedAudioParameters *)self comfortNoiseEnabled];
  [v4 encodeObject:v8 forKey:@"kAudioParameters_ComfortNoise"];
}

- (HMDSelectedAudioParameters)initWithCoder:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDSelectedAudioParameters;
  v5 = [(HMDSelectedAudioParameters *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kAudioParameters_CodecGroup"];
    codecGroup = v5->_codecGroup;
    v5->_codecGroup = (HMDAudioCodecGroup *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kAudioParameters_CodecParameters"];
    codecParameters = v5->_codecParameters;
    v5->_codecParameters = (HMDAudioCodecParameters *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kAudioParameters_RTPParameter"];
    rtpParameters = v5->_rtpParameters;
    v5->_rtpParameters = (HMDSelectedRTPParameters *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    v23 = [v21 setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"kAudioParameters_ComfortNoise"];
    comfortNoiseEnabled = v5->_comfortNoiseEnabled;
    v5->_comfortNoiseEnabled = (NSNumber *)v24;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDSelectedAudioParameters *)self codecGroup];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ selected-audio-codec = %@ ", v6, v10];

  v11 = [(HMDSelectedAudioParameters *)self codecParameters];
  v12 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ codecParameters = %@ ", v6, v12];

  v13 = [(HMDSelectedAudioParameters *)self rtpParameters];
  uint64_t v14 = [v13 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ rtpParameters = %@ ", v6, v14];

  id v15 = [(HMDSelectedAudioParameters *)self comfortNoiseEnabled];
  [v7 appendFormat:@"\n %@ comfortNoiseEnabled = %@ ", v6, v15];
}

- (BOOL)_parseFromTLVData
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kAudioParameters_CodecGroup"];
  id v4 = [MEMORY[0x1E4F5BD28] wrappertlv:2 name:@"kAudioParameters_CodecParameters"];
  v5 = [MEMORY[0x1E4F5BD28] wrappertlv:3 name:@"kAudioParameters_RTPParameter"];
  id v6 = [MEMORY[0x1E4F5BDE8] wrappertlv:4 name:@"kAudioParameters_ComfortNoise"];
  v31[0] = v3;
  v31[1] = v4;
  void v31[2] = v5;
  v31[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  if ([(HAPTLVBase *)self _parse:v7])
  {
    id v8 = [HMDAudioCodecGroup alloc];
    uint64_t v9 = [v3 field];
    v10 = -[HMDAudioCodecGroup initWithAudioCodecGroup:](v8, "initWithAudioCodecGroup:", [v9 unsignedIntegerValue]);
    codecGroup = self->_codecGroup;
    self->_codecGroup = v10;

    v12 = [HMDAudioCodecParameters alloc];
    v13 = [v4 field];
    uint64_t v14 = [(HAPTLVBase *)v12 initWithTLVData:v13];
    codecParameters = self->_codecParameters;
    self->_codecParameters = v14;

    v16 = [HMDSelectedRTPParameters alloc];
    v17 = [v5 field];
    v18 = [(HAPTLVBase *)v16 initWithTLVData:v17];
    rtpParameters = self->_rtpParameters;
    self->_rtpParameters = v18;

    v20 = [v6 field];
    comfortNoiseEnabled = self->_comfortNoiseEnabled;
    self->_comfortNoiseEnabled = v20;

    BOOL v29 = checkForParseResult(2, v22, v23, v24, v25, v26, v27, v28, (uint64_t)self->_codecParameters, (uint64_t)self->_rtpParameters);
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = NSNumber;
  v5 = [(HMDSelectedAudioParameters *)self codecGroup];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "codec"));
  [v3 addTLV:1 number:v6];

  id v7 = [(HMDSelectedAudioParameters *)self codecParameters];
  id v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  uint64_t v9 = [(HMDSelectedAudioParameters *)self rtpParameters];
  v10 = [v9 tlvData];

  [v3 addTLV:3 data:v10];
  v11 = [(HMDSelectedAudioParameters *)self comfortNoiseEnabled];
  [v3 addTLV:4 number:v11];

  v12 = [v3 serialize];

  return (NSData *)v12;
}

- (HMDSelectedAudioParameters)initWithCodecGroup:(id)a3 codecParameter:(id)a4 rtpParameter:(id)a5 comfortNoiseEnabled:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSelectedAudioParameters;
  id v15 = [(HMDSelectedAudioParameters *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_codecGroup, a3);
    objc_storeStrong((id *)&v16->_codecParameters, a4);
    objc_storeStrong((id *)&v16->_rtpParameters, a5);
    objc_storeStrong((id *)&v16->_comfortNoiseEnabled, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end