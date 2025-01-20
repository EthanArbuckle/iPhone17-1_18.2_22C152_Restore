@interface AUPasscodeCodecCapability
- (AUPasscodeCodecCapability)init;
- (AUPasscodeCodecCapability)initWithAlgorithmName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPasscodeCodecCapability:(id)a3;
- (NSArray)supportedSampleRates;
- (NSString)algorithmName;
- (_NSRange)numChannelRange;
@end

@implementation AUPasscodeCodecCapability

- (AUPasscodeCodecCapability)init
{
  return [(AUPasscodeCodecCapability *)self initWithAlgorithmName:&stru_26EAE53B8];
}

- (AUPasscodeCodecCapability)initWithAlgorithmName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AUPasscodeCodecCapability;
  v6 = [(AUPasscodeCodecCapability *)&v13 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = [NSNumber numberWithUnsignedInteger:44100];
    v9 = [NSNumber numberWithUnsignedInteger:48000];
    uint64_t v10 = objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
    v11 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v10;

    *(_OWORD *)(v6 + 24) = xmmword_237D2DFE0;
    objc_storeStrong((id *)v6 + 1, a3);
  }

  return (AUPasscodeCodecCapability *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AUPasscodeCodecCapability *)self isEqualToPasscodeCodecCapability:v4];

  return v5;
}

- (BOOL)isEqualToPasscodeCodecCapability:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AUPasscodeCodecCapability *)self supportedSampleRates];
  v6 = [v4 supportedSampleRates];
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = [(AUPasscodeCodecCapability *)self numChannelRange];
    uint64_t v9 = v8;
    char v11 = 0;
    if (v7 == [v4 numChannelRange] && v9 == v10)
    {
      v12 = [(AUPasscodeCodecCapability *)self algorithmName];
      objc_super v13 = [v4 algorithmName];
      char v11 = [v12 isEqual:v13];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)algorithmName
{
  return self->_algorithmName;
}

- (NSArray)supportedSampleRates
{
  return self->_supportedSampleRates;
}

- (_NSRange)numChannelRange
{
  NSUInteger length = self->_numChannelRange.length;
  NSUInteger location = self->_numChannelRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSampleRates, 0);

  objc_storeStrong((id *)&self->_algorithmName, 0);
}

@end