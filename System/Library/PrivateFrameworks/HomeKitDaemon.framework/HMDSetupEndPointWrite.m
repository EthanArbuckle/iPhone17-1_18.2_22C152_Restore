@interface HMDSetupEndPointWrite
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVDataImpl;
- (BOOL)_parseFromTLVDataOnFailure;
- (HMDEndPointAddress)address;
- (HMDSRTPParameters)audioSrtpParameters;
- (HMDSRTPParameters)videoSrtpParameters;
- (HMDSetupEndPointWrite)initWithCoder:(id)a3;
- (HMDSetupEndPointWrite)initWithSessionIdentifier:(id)a3 address:(id)a4 videoSrtpParameters:(id)a5 audioSrtpParameters:(id)a6;
- (NSData)tlvData;
- (NSUUID)sessionID;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSetupEndPointWrite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSrtpParameters, 0);
  objc_storeStrong((id *)&self->_videoSrtpParameters, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDSRTPParameters)audioSrtpParameters
{
  return self->_audioSrtpParameters;
}

- (HMDSRTPParameters)videoSrtpParameters
{
  return self->_videoSrtpParameters;
}

- (HMDEndPointAddress)address
{
  return self->_address;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSetupEndPointWrite *)self sessionID];
  [v4 encodeObject:v5 forKey:@"kSetupEndPoint__SessionIdentifier"];

  v6 = [(HMDSetupEndPointWrite *)self videoSrtpParameters];
  [v4 encodeObject:v6 forKey:@"kSetupEndPoint__SRTPVideoParameters"];

  id v7 = [(HMDSetupEndPointWrite *)self audioSrtpParameters];
  [v4 encodeObject:v7 forKey:@"kSetupEndPoint__SRTPAudioParameters"];
}

- (HMDSetupEndPointWrite)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDSetupEndPointWrite;
  v5 = [(HMDSetupEndPointWrite *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v27[0] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSetupEndPoint__SessionIdentifier"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kSetupEndPoint__SRTPVideoParameters"];
    videoSrtpParameters = v5->_videoSrtpParameters;
    v5->_videoSrtpParameters = (HMDSRTPParameters *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kSetupEndPoint__SRTPAudioParameters"];
    audioSrtpParameters = v5->_audioSrtpParameters;
    v5->_audioSrtpParameters = (HMDSRTPParameters *)v19;

    v21 = [[HMDEndPointAddress alloc] initWithIPAddress:&stru_26E2EB898 isIPv6Address:0 videoRTPPort:&unk_26E4706F0 audioRTPPort:&unk_26E4706F0];
    address = v5->_address;
    v5->_address = v21;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDSetupEndPointWrite *)self sessionID];
  [v7 appendFormat:@"\n %@ sessionID = %@ ", v6, v8];

  uint64_t v9 = [(HMDSetupEndPointWrite *)self address];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ deviceAddress = %@ ", v6, v10];

  v11 = [(HMDSetupEndPointWrite *)self videoSrtpParameters];
  v12 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ videoSRTPParameters = %@ ", v6, v12];

  id v14 = [(HMDSetupEndPointWrite *)self audioSrtpParameters];
  v13 = [v14 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ audioSRTPParameters = %@ ", v6, v13];
}

- (BOOL)_parseFromTLVDataOnFailure
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35B00] wrappertlv:1 name:@"kSetupEndPoint__SessionIdentifier"];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];

  if (v5)
  {
    id v6 = [v3 field];
    sessionID = self->_sessionID;
    self->_sessionID = v6;
  }
  return v5;
}

- (BOOL)_parseFromTLVDataImpl
{
  v32[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35B00] wrappertlv:1 name:@"kSetupEndPoint__SessionIdentifier"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:3 name:@"kSetupEndPoint__ControllerAddress"];
  BOOL v5 = [MEMORY[0x263F35990] wrappertlv:4 name:@"kSetupEndPoint__SRTPVideoParameters"];
  id v6 = [MEMORY[0x263F35990] wrappertlv:5 name:@"kSetupEndPoint__SRTPAudioParameters"];
  v32[0] = v3;
  v32[1] = v4;
  v32[2] = v5;
  v32[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  BOOL v8 = [(HAPTLVBase *)self _parse:v7];

  if (v8)
  {
    uint64_t v9 = [v3 field];
    sessionID = self->_sessionID;
    self->_sessionID = v9;

    v11 = [HMDEndPointAddress alloc];
    v12 = [v4 field];
    v13 = [(HAPTLVBase *)v11 initWithTLVData:v12];
    address = self->_address;
    self->_address = v13;

    v15 = [HMDSRTPParameters alloc];
    v16 = [v5 field];
    v17 = [(HAPTLVBase *)v15 initWithTLVData:v16];
    videoSrtpParameters = self->_videoSrtpParameters;
    self->_videoSrtpParameters = v17;

    uint64_t v19 = [HMDSRTPParameters alloc];
    v20 = [v6 field];
    v21 = [(HAPTLVBase *)v19 initWithTLVData:v20];
    audioSrtpParameters = self->_audioSrtpParameters;
    self->_audioSrtpParameters = v21;

    BOOL v30 = checkForParseResult(3, v23, v24, v25, v26, v27, v28, v29, (uint64_t)self->_address, (uint64_t)self->_videoSrtpParameters);
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = [(HMDSetupEndPointWrite *)self sessionID];
  [v3 addTLV:1 uuid:v4];

  BOOL v5 = [(HMDSetupEndPointWrite *)self address];
  id v6 = [v5 tlvData];

  [v3 addTLV:3 data:v6];
  id v7 = [(HMDSetupEndPointWrite *)self videoSrtpParameters];
  BOOL v8 = [v7 tlvData];

  [v3 addTLV:4 data:v8];
  uint64_t v9 = [(HMDSetupEndPointWrite *)self audioSrtpParameters];
  v10 = [v9 tlvData];

  [v3 addTLV:5 data:v10];
  v11 = [v3 serialize];

  return (NSData *)v11;
}

- (HMDSetupEndPointWrite)initWithSessionIdentifier:(id)a3 address:(id)a4 videoSrtpParameters:(id)a5 audioSrtpParameters:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSetupEndPointWrite;
  v15 = [(HMDSetupEndPointWrite *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_address, a4);
    objc_storeStrong((id *)&v16->_videoSrtpParameters, a5);
    objc_storeStrong((id *)&v16->_audioSrtpParameters, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end