@interface AUPasscodeCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (AUPasscodeCodecConfiguration)initWithAlgorithmName:(id)a3;
- (AUPasscodeCodecConfiguration)initWithCoder:(id)a3;
- (AUPasscodeCodecConfiguration)initWithCommandLineArgs:(id)a3;
- (NSString)algorithmName;
- (id)commandLineOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numChannels;
- (int64_t)payloadLengthBytes;
- (int64_t)sampleRate;
- (void)__setDefaultValues;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithmName:(id)a3;
- (void)setNumChannels:(int64_t)a3;
- (void)setPayloadLengthBytes:(int64_t)a3;
- (void)setSampleRate:(int64_t)a3;
@end

@implementation AUPasscodeCodecConfiguration

- (AUPasscodeCodecConfiguration)initWithAlgorithmName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUPasscodeCodecConfiguration;
  v6 = [(AUPasscodeCodecConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_algorithmName, a3);
    [(AUPasscodeCodecConfiguration *)v7 __setDefaultValues];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AUPasscodeCodecConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUPasscodeCodecConfiguration;
  id v5 = [(AUPasscodeCodecConfiguration *)&v9 init];
  if (v5)
  {
    v5->_payloadLengthBytes = [v4 decodeIntegerForKey:@"payLen"];
    v5->_sampleRate = [v4 decodeIntegerForKey:@"samplerate"];
    v5->_numChannels = [v4 decodeIntegerForKey:@"chans"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algoName"];
    algorithmName = v5->_algorithmName;
    v5->_algorithmName = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t payloadLengthBytes = self->_payloadLengthBytes;
  id v5 = a3;
  [v5 encodeInteger:payloadLengthBytes forKey:@"payLen"];
  [v5 encodeInteger:self->_sampleRate forKey:@"samplerate"];
  [v5 encodeInteger:self->_numChannels forKey:@"chans"];
  [v5 encodeObject:self->_algorithmName forKey:@"algoName"];
}

- (void)__setDefaultValues
{
  *(_OWORD *)&self->_int64_t payloadLengthBytes = xmmword_237D2DFD0;
  self->_numChannels = 1;
}

- (id)commandLineOptions
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-fs [sample_rate]" description:@"Set the sample rate to use for IO (44100 and 48000 only)"];
  v3 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-ps [payload_size]", @"Set the number of bytes in the payload (inferred from payload on encode/play)", v2 description];
  v7[1] = v3;
  id v4 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-nc [channels]" description:@"Set the number of channels to use for IO"];
  v7[2] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

- (AUPasscodeCodecConfiguration)initWithCommandLineArgs:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AUPasscodeCodecConfiguration;
  id v5 = [(AUPasscodeCodecConfiguration *)&v27 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(AUPasscodeCodecConfiguration *)v5 __setDefaultValues];
    id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v7 setNumberStyle:1];
    v26 = objc_alloc_init(AUPasscodeCodecCapability);
    uint64_t v8 = [v4 count];
    if ([v4 count])
    {
      for (unint64_t i = 0; i < [v4 count]; ++i)
      {
        v10 = [v4 objectAtIndex:i];
        if ([v10 isEqualToString:@"-fs"]) {
          BOOL v11 = v8 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11)
        {
          if ([v10 isEqualToString:@"-ps"] && v8)
          {
            v12 = [v4 objectAtIndex:++i];
            v13 = [v7 numberFromString:v12];
            v6->_int64_t payloadLengthBytes = [v13 unsignedIntegerValue];
          }
          else
          {
            if (![v10 isEqualToString:@"-nc"] || !v8) {
              goto LABEL_19;
            }
            v19 = [v4 objectAtIndex:++i];
            v20 = [v7 numberFromString:v19];
            v6->_unint64_t numChannels = [v20 unsignedIntegerValue];

            unint64_t numChannels = v6->_numChannels;
            unint64_t v22 = [(AUPasscodeCodecCapability *)v26 numChannelRange];
            if (numChannels < v22 || numChannels - v22 >= v23)
            {
LABEL_23:

              v24 = 0;
              goto LABEL_22;
            }
          }
        }
        else
        {
          v14 = [v4 objectAtIndex:++i];
          v15 = [v7 numberFromString:v14];
          v6->_sampleRate = [v15 unsignedIntegerValue];

          v16 = [(AUPasscodeCodecCapability *)v26 supportedSampleRates];
          v17 = [NSNumber numberWithInteger:v6->_sampleRate];
          int v18 = [v16 containsObject:v17];

          if (!v18) {
            goto LABEL_23;
          }
        }
        --v8;
LABEL_19:
        --v8;
      }
    }
  }
  v24 = v6;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AUPasscodeCodecConfiguration allocWithZone:a3] init];
  [(AUPasscodeCodecConfiguration *)v4 setPayloadLengthBytes:[(AUPasscodeCodecConfiguration *)self payloadLengthBytes]];
  [(AUPasscodeCodecConfiguration *)v4 setSampleRate:[(AUPasscodeCodecConfiguration *)self sampleRate]];
  [(AUPasscodeCodecConfiguration *)v4 setNumChannels:[(AUPasscodeCodecConfiguration *)self numChannels]];
  id v5 = [(AUPasscodeCodecConfiguration *)self algorithmName];
  uint64_t v6 = (void *)[v5 copy];
  [(AUPasscodeCodecConfiguration *)v4 setAlgorithmName:v6];

  return v4;
}

- (int64_t)payloadLengthBytes
{
  return self->_payloadLengthBytes;
}

- (void)setPayloadLengthBytes:(int64_t)a3
{
  self->_int64_t payloadLengthBytes = a3;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (int64_t)numChannels
{
  return self->_numChannels;
}

- (void)setNumChannels:(int64_t)a3
{
  self->_unint64_t numChannels = a3;
}

- (NSString)algorithmName
{
  return self->_algorithmName;
}

- (void)setAlgorithmName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end