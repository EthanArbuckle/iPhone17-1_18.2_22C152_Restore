@interface HMDCameraRecordingGeneralConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingGeneralConfiguration)initWithCoder:(id)a3;
- (HMDCameraRecordingGeneralConfiguration)initWithPrebufferLength:(id)a3 eventTriggerOptions:(unint64_t)a4 mediaContainerConfigurations:(id)a5;
- (NSArray)mediaContainerConfigurations;
- (NSData)tlvData;
- (NSNumber)prebufferLength;
- (unint64_t)eventTriggerOptions;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingGeneralConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContainerConfigurations, 0);
  objc_storeStrong((id *)&self->_prebufferLength, 0);
}

- (NSArray)mediaContainerConfigurations
{
  return self->_mediaContainerConfigurations;
}

- (unint64_t)eventTriggerOptions
{
  return self->_eventTriggerOptions;
}

- (NSNumber)prebufferLength
{
  return self->_prebufferLength;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingGeneralConfiguration *)self prebufferLength];
  [v4 encodeObject:v5 forKey:@"kGeneralConfigurationPrebufferLength"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDCameraRecordingGeneralConfiguration eventTriggerOptions](self, "eventTriggerOptions"));
  [v4 encodeObject:v6 forKey:@"kGeneralConfigurationEventTriggerOptions"];

  id v7 = [(HMDCameraRecordingGeneralConfiguration *)self mediaContainerConfigurations];
  [v4 encodeObject:v7 forKey:@"kGeneralConfigurationMediaContainerConfigurations"];
}

- (HMDCameraRecordingGeneralConfiguration)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingGeneralConfiguration;
  v5 = [(HMDCameraRecordingGeneralConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kGeneralConfigurationPrebufferLength"];
    prebufferLength = v5->_prebufferLength;
    v5->_prebufferLength = (NSNumber *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kGeneralConfigurationEventTriggerOptions"];
    v5->_eventTriggerOptions = [v8 unsignedLongLongValue];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kGeneralConfigurationMediaContainerConfigurations"];
    mediaContainerConfigurations = v5->_mediaContainerConfigurations;
    v5->_mediaContainerConfigurations = (NSArray *)v12;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingGeneralConfiguration *)self prebufferLength];
  [v7 appendFormat:@"\n%@prebufferLength = %@ ", v6, v9];

  v10 = HMDCameraRecordingEventTriggerOptionsAsString([(HMDCameraRecordingGeneralConfiguration *)self eventTriggerOptions]);
  [v7 appendFormat:@"\n%@eventTriggerOptions = %@ ", v6, v10];

  id v12 = [(HMDCameraRecordingGeneralConfiguration *)self mediaContainerConfigurations];
  v11 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@containerConfigurations = %@ ", v6, v11];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDCameraRecordingGeneralConfiguration *)self prebufferLength];
  [v3 addTLV:1 length:4 number:v4];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDCameraRecordingGeneralConfiguration eventTriggerOptions](self, "eventTriggerOptions"));
  [v3 addTLV:2 length:8 number:v5];

  id v6 = [(HMDCameraRecordingGeneralConfiguration *)self mediaContainerConfigurations];
  id v7 = [v6 firstObject];
  v8 = [v7 tlvData];

  [v3 addTLV:3 data:v8];
  v9 = [v3 serialize];

  return (NSData *)v9;
}

- (BOOL)_parseFromTLVData
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kGeneralConfigurationPrebufferLength"];
  id v4 = [MEMORY[0x1E4F5BDE8] wrappertlv:2 name:@"kGeneralConfigurationEventTriggerOptions"];
  v5 = [MEMORY[0x1E4F5BC58] wrappertlv:3 name:@"kGeneralConfigurationMediaContainerConfigurations" objectCreator:&__block_literal_global_89188];
  v14[0] = v3;
  v14[1] = v4;
  v14[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    v8 = [v3 field];
    prebufferLength = self->_prebufferLength;
    self->_prebufferLength = v8;

    v10 = [v4 field];
    self->_eventTriggerOptions = [v10 unsignedLongLongValue];

    v11 = [v5 field];
    mediaContainerConfigurations = self->_mediaContainerConfigurations;
    self->_mediaContainerConfigurations = v11;
  }
  return v7;
}

HMDCameraRecordingMediaContainerConfiguration *__59__HMDCameraRecordingGeneralConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDCameraRecordingMediaContainerConfiguration alloc] initWithTLVData:v2];

  return v3;
}

- (HMDCameraRecordingGeneralConfiguration)initWithPrebufferLength:(id)a3 eventTriggerOptions:(unint64_t)a4 mediaContainerConfigurations:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraRecordingGeneralConfiguration;
  v11 = [(HMDCameraRecordingGeneralConfiguration *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_prebufferLength, a3);
    v12->_eventTriggerOptions = a4;
    objc_storeStrong((id *)&v12->_mediaContainerConfigurations, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end