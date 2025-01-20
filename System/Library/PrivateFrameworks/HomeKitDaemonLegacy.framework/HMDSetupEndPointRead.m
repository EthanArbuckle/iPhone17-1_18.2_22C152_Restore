@interface HMDSetupEndPointRead
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (BOOL)_parseFromTLVDataOnFailure;
- (BOOL)_parseFromTLVDataOnSuccess;
- (HMDSetupEndPointRead)initWithCoder:(id)a3;
- (HMDSetupEndPointRead)initWithSessionIdentifier:(id)a3 address:(id)a4 videoSrtpParameters:(id)a5 audioSrtpParameters:(id)a6 responseStatus:(unint64_t)a7 videoSSRC:(id)a8 audioSSRC:(id)a9;
- (NSNumber)audioSSRC;
- (NSNumber)videoSSRC;
- (id)tlvData;
- (unint64_t)responseStatus;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSetupEndPointRead

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSSRC, 0);
  objc_storeStrong((id *)&self->_videoSSRC, 0);
}

- (NSNumber)audioSSRC
{
  return self->_audioSSRC;
}

- (NSNumber)videoSSRC
{
  return self->_videoSSRC;
}

- (unint64_t)responseStatus
{
  return self->_responseStatus;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDSetupEndPointRead;
  id v4 = a3;
  [(HMDSetupEndPointWrite *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[HMDSetupEndPointRead responseStatus](self, "responseStatus", v7.receiver, v7.super_class), @"kSetupEndPointRead__Status");
  v5 = [(HMDSetupEndPointRead *)self videoSSRC];
  [v4 encodeObject:v5 forKey:@"kSetupEndPointRead__VideoSSRC"];

  v6 = [(HMDSetupEndPointRead *)self audioSSRC];
  [v4 encodeObject:v6 forKey:@"kSetupEndPointRead__AudioSSRC"];
}

- (HMDSetupEndPointRead)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDSetupEndPointRead;
  v5 = [(HMDSetupEndPointWrite *)&v17 initWithCoder:v4];
  if (v5)
  {
    v5->_responseStatus = (int)[v4 decodeInt32ForKey:@"kSetupEndPointRead__Status"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSetupEndPointRead__VideoSSRC"];
    videoSSRC = v5->_videoSSRC;
    v5->_videoSSRC = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kSetupEndPointRead__AudioSSRC"];
    audioSSRC = v5->_audioSSRC;
    v5->_audioSSRC = (NSNumber *)v14;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HMDSetupEndPointRead;
  id v6 = a4;
  id v7 = a3;
  [(HMDSetupEndPointWrite *)&v11 description:v7 indent:v6];
  v8 = [(HMDSetupEndPointRead *)self videoSSRC];
  [v7 appendFormat:@"\n %@ videoSSRC = %@ ", v6, v8, v11.receiver, v11.super_class];

  uint64_t v9 = [(HMDSetupEndPointRead *)self audioSSRC];
  [v7 appendFormat:@"\n %@ audioSSRC = %@ ", v6, v9];

  v10 = HMDStreamControlPointResponseStatusAsString([(HMDSetupEndPointRead *)self responseStatus]);
  [v7 appendFormat:@"\n %@ responseStatus = %@ ", v6, v10];
}

- (BOOL)_parseFromTLVDataOnFailure
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSetupEndPointRead;
  return [(HMDSetupEndPointWrite *)&v3 _parseFromTLVDataOnFailure];
}

- (BOOL)_parseFromTLVDataOnSuccess
{
  v14[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:6 name:@"kSetupEndPointRead__VideoSSRC"];
  id v4 = [MEMORY[0x1E4F5BDE8] wrappertlv:7 name:@"kSetupEndPointRead__AudioSSRC"];
  v14[0] = v3;
  v14[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];

  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)HMDSetupEndPointRead,
        [(HMDSetupEndPointWrite *)&v13 _parseFromTLVDataOnSuccess]))
  {
    id v7 = [v3 field];
    videoSSRC = self->_videoSSRC;
    self->_videoSSRC = v7;

    uint64_t v9 = [v4 field];
    audioSSRC = self->_audioSSRC;
    self->_audioSSRC = v9;

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_parseFromTLVData
{
  v11[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F5BE78] wrappertlv:1 name:@"kSetupEndPoint__SessionIdentifier"];
  id v4 = [MEMORY[0x1E4F5BDE8] wrappertlv:2 name:@"kSetupEndPointRead__Status"];
  v11[0] = v3;
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];

  if (v6)
  {
    id v7 = [v4 field];
    self->_responseStatus = [v7 unsignedIntegerValue];

    if (self->_responseStatus) {
      BOOL v8 = [(HMDSetupEndPointRead *)self _parseFromTLVDataOnFailure];
    }
    else {
      BOOL v8 = [(HMDSetupEndPointRead *)self _parseFromTLVDataOnSuccess];
    }
    BOOL v9 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)tlvData
{
  v12.receiver = self;
  v12.super_class = (Class)HMDSetupEndPointRead;
  objc_super v3 = [(HMDSetupEndPointWrite *)&v12 tlvData];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [MEMORY[0x1E4F5BE50] creator];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSetupEndPointRead responseStatus](self, "responseStatus"));
  [v5 addTLV:2 number:v6];

  id v7 = [(HMDSetupEndPointRead *)self videoSSRC];
  [v5 addTLV:6 length:4 number:v7];

  BOOL v8 = [(HMDSetupEndPointRead *)self audioSSRC];
  [v5 addTLV:7 length:4 number:v8];

  BOOL v9 = [v5 serialize];
  [v4 appendData:v9];

  v10 = (void *)[v4 copy];
  return v10;
}

- (HMDSetupEndPointRead)initWithSessionIdentifier:(id)a3 address:(id)a4 videoSrtpParameters:(id)a5 audioSrtpParameters:(id)a6 responseStatus:(unint64_t)a7 videoSSRC:(id)a8 audioSSRC:(id)a9
{
  id v16 = a8;
  id v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)HMDSetupEndPointRead;
  uint64_t v18 = [(HMDSetupEndPointWrite *)&v21 initWithSessionIdentifier:a3 address:a4 videoSrtpParameters:a5 audioSrtpParameters:a6];
  v19 = v18;
  if (v18)
  {
    v18->_responseStatus = a7;
    objc_storeStrong((id *)&v18->_videoSSRC, a8);
    objc_storeStrong((id *)&v19->_audioSSRC, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end