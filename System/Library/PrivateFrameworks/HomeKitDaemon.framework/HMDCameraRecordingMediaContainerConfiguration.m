@interface HMDCameraRecordingMediaContainerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingMediaContainer)container;
- (HMDCameraRecordingMediaContainerConfiguration)initWithCoder:(id)a3;
- (HMDCameraRecordingMediaContainerConfiguration)initWithMediaContainer:(id)a3 containerParameters:(id)a4;
- (HMDCameraRecordingMediaContainerParameters)parameters;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingMediaContainerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (HMDCameraRecordingMediaContainerParameters)parameters
{
  return self->_parameters;
}

- (HMDCameraRecordingMediaContainer)container
{
  return self->_container;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingMediaContainerConfiguration *)self container];
  [v4 encodeObject:v5 forKey:@"kMediaContainerConfigurationContainerType"];

  id v6 = [(HMDCameraRecordingMediaContainerConfiguration *)self parameters];
  [v4 encodeObject:v6 forKey:@"MediaContainerConfigurationContainerParameters"];
}

- (HMDCameraRecordingMediaContainerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingMediaContainerConfiguration;
  v5 = [(HMDCameraRecordingMediaContainerConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaContainerConfigurationContainerType"];
    container = v5->_container;
    v5->_container = (HMDCameraRecordingMediaContainer *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MediaContainerConfigurationContainerParameters"];
    parameters = v5->_parameters;
    v5->_parameters = (HMDCameraRecordingMediaContainerParameters *)v8;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingMediaContainerConfiguration *)self container];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@container = %@ ", v6, v10];

  id v12 = [(HMDCameraRecordingMediaContainerConfiguration *)self parameters];
  objc_super v11 = [v12 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@parameters = %@ ", v6, v11];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = NSNumber;
  v5 = [(HMDCameraRecordingMediaContainerConfiguration *)self container];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "type"));
  [v3 addTLV:1 length:1 number:v6];

  id v7 = [(HMDCameraRecordingMediaContainerConfiguration *)self parameters];
  uint64_t v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  v9 = [v3 serialize];

  return (NSData *)v9;
}

- (BOOL)_parseFromTLVData
{
  v16[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:1 name:@"kMediaContainerConfigurationContainerType"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:2 name:@"MediaContainerConfigurationContainerParameters"];
  v16[0] = v3;
  v16[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];
  if (v6)
  {
    id v7 = [HMDCameraRecordingMediaContainer alloc];
    uint64_t v8 = [v3 field];
    v9 = -[HMDCameraRecordingMediaContainer initWithContainer:](v7, "initWithContainer:", [v8 integerValue]);
    container = self->_container;
    self->_container = v9;

    objc_super v11 = [HMDCameraRecordingMediaContainerParameters alloc];
    id v12 = [v4 field];
    v13 = [(HAPTLVBase *)v11 initWithTLVData:v12];
    parameters = self->_parameters;
    self->_parameters = v13;
  }
  return v6;
}

- (HMDCameraRecordingMediaContainerConfiguration)initWithMediaContainer:(id)a3 containerParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingMediaContainerConfiguration;
  v9 = [(HMDCameraRecordingMediaContainerConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end