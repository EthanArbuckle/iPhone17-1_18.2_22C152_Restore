@interface HMDCameraRecordingMediaContainerParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingMediaContainerParameters)initWithCoder:(id)a3;
- (HMDCameraRecordingMediaContainerParameters)initWithFragmentLength:(id)a3;
- (NSData)tlvData;
- (NSNumber)fragmentLength;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingMediaContainerParameters

- (void).cxx_destruct
{
}

- (NSNumber)fragmentLength
{
  return self->_fragmentLength;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingMediaContainerParameters *)self fragmentLength];
  [v4 encodeObject:v5 forKey:@"kMediaContainerParametersFragmentLength"];
}

- (HMDCameraRecordingMediaContainerParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingMediaContainerParameters;
  id v5 = [(HMDCameraRecordingMediaContainerParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaContainerParametersFragmentLength"];
    fragmentLength = v5->_fragmentLength;
    v5->_fragmentLength = (NSNumber *)v6;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  id v9 = [(HMDCameraRecordingMediaContainerParameters *)self fragmentLength];
  [v7 appendFormat:@"\n%@fragmentLength = %@ ", v6, v9];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDCameraRecordingMediaContainerParameters *)self fragmentLength];
  [v3 addTLV:1 length:4 number:v4];

  id v5 = [v3 serialize];

  return (NSData *)v5;
}

- (BOOL)_parseFromTLVData
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kMediaContainerParametersFragmentLength"];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];
  if (v5)
  {
    id v6 = [v3 field];
    fragmentLength = self->_fragmentLength;
    self->_fragmentLength = v6;
  }
  return v5;
}

- (HMDCameraRecordingMediaContainerParameters)initWithFragmentLength:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingMediaContainerParameters;
  id v6 = [(HMDCameraRecordingMediaContainerParameters *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fragmentLength, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end