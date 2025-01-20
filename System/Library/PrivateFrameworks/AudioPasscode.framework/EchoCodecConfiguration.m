@interface EchoCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)hfNoiseFillingFlag;
- (EchoCodecConfiguration)init;
- (EchoCodecConfiguration)initWithCapabilityData:(id)a3;
- (EchoCodecConfiguration)initWithCoder:(id)a3;
- (EchoCodecConfiguration)initWithCommandLineArgs:(id)a3;
- (float)delayForBit0;
- (float)delayForBit1;
- (float)echoGainDB;
- (float)hpfCutOffFreq;
- (float)noiseGainDB;
- (float)syncDetectThreshold;
- (id)commandLineOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)algorithmVersionNumber;
- (unint64_t)frameSize;
- (unint64_t)numFrameRepeat;
- (unint64_t)randomSeed;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithmVersionNumber:(unint64_t)a3;
- (void)setDefaultValues;
- (void)setDelayForBit0:(float)a3;
- (void)setDelayForBit1:(float)a3;
- (void)setEchoGainDB:(float)a3;
- (void)setFrameSize:(unint64_t)a3;
- (void)setHfNoiseFillingFlag:(BOOL)a3;
- (void)setHpfCutOffFreq:(float)a3;
- (void)setNoiseGainDB:(float)a3;
- (void)setNumFrameRepeat:(unint64_t)a3;
- (void)setRandomSeed:(unint64_t)a3;
- (void)setSyncDetectThreshold:(float)a3;
@end

@implementation EchoCodecConfiguration

- (EchoCodecConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EchoCodecConfiguration;
  v5 = [(AUPasscodeCodecConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"delayForBit0"];
    v5->_delayForBit0 = v6;
    [v4 decodeFloatForKey:@"delayForBit1"];
    v5->_delayForBit1 = v7;
    v5->_frameSize = [v4 decodeIntegerForKey:@"frameSize"];
    v5->_numFrameRepeat = [v4 decodeIntegerForKey:@"numFrameRepeat"];
    [v4 decodeFloatForKey:@"syncDetectThreshold"];
    v5->_syncDetectThreshold = v8;
    v5->_randomSeed = [v4 decodeIntegerForKey:@"randomSeed"];
    [v4 decodeFloatForKey:@"echoGain"];
    v5->_echoGainDB = v9;
    [v4 decodeFloatForKey:@"noiseGain"];
    v5->_noiseGainDB = v10;
    [v4 decodeFloatForKey:@"hpfCutOffFreq"];
    v5->_hpfCutOffFreq = v11;
    v5->_hfNoiseFillingFlag = [v4 decodeIntegerForKey:@"hfNoiseFilling"] != 0;
    v5->_algorithmVersionNumber = [v4 decodeIntegerForKey:@"algorithmVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(EchoCodecConfiguration *)self delayForBit0];
  objc_msgSend(v4, "encodeFloat:forKey:", @"delayForBit0");
  [(EchoCodecConfiguration *)self delayForBit1];
  objc_msgSend(v4, "encodeFloat:forKey:", @"delayForBit1");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration frameSize](self, "frameSize"), @"frameSize");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration numFrameRepeat](self, "numFrameRepeat"), @"numFrameRepeat");
  [(EchoCodecConfiguration *)self syncDetectThreshold];
  objc_msgSend(v4, "encodeFloat:forKey:", @"syncDetectThreshold");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration randomSeed](self, "randomSeed"), @"randomSeed");
  [(EchoCodecConfiguration *)self echoGainDB];
  objc_msgSend(v4, "encodeFloat:forKey:", @"echoGain");
  [(EchoCodecConfiguration *)self noiseGainDB];
  objc_msgSend(v4, "encodeFloat:forKey:", @"noiseGain");
  [(EchoCodecConfiguration *)self hpfCutOffFreq];
  objc_msgSend(v4, "encodeFloat:forKey:", @"hpfCutOffFreq");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration hfNoiseFillingFlag](self, "hfNoiseFillingFlag"), @"hfNoiseFilling");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration algorithmVersionNumber](self, "algorithmVersionNumber"), @"algorithmVersion");
  v5.receiver = self;
  v5.super_class = (Class)EchoCodecConfiguration;
  [(AUPasscodeCodecConfiguration *)&v5 encodeWithCoder:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EchoCodecConfiguration)init
{
  v3 = [NSString stringWithUTF8String:"echo"];
  v6.receiver = self;
  v6.super_class = (Class)EchoCodecConfiguration;
  id v4 = [(AUPasscodeCodecConfiguration *)&v6 initWithAlgorithmName:v3];

  if (v4) {
    [(EchoCodecConfiguration *)v4 setDefaultValues];
  }
  return v4;
}

- (void)setDefaultValues
{
  v3 = [NSString stringWithUTF8String:"echo"];
  [(AUPasscodeCodecConfiguration *)self setAlgorithmName:v3];

  self->_delayForBit0 = 0.002;
  self->_delayForBit1 = 0.008;
  self->_frameSize = 2048;
  self->_numFrameRepeat = 2;
  self->_randomSeed = 0;
  self->_echoGainDB = 0.0;
  self->_noiseGainDB = -40.0;
  self->_syncDetectThreshold = 6.0;
  self->_hpfCutOffFreq = 18000.0;
  self->_hfNoiseFillingFlag = 1;
  self->_algorithmVersionNumber = 100;
}

- (id)commandLineOptions
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v17 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-n [frames]" description:@"Set the echo frame size"];
  v19 = v17;
  uint64_t v20 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-r [repeats]" description:@"Set the number of frame repeats"];
  v16 = (void *)v20;
  v2 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-d0 [delay]" description:@"Set the echo delay in msec for bit 0"];
  v21 = v2;
  v3 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-d1 [delay]" description:@"Set the echo delay in msec for bit 1"];
  v22 = v3;
  id v4 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-s [seed]" description:@"Set the random number generator seed (32-bit non-zero unsigned integer)"];
  v23 = v4;
  objc_super v5 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-t [threshold]" description:@"Set the threshold for sync detection in decoder"];
  v24 = v5;
  objc_super v6 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-eg [echo gain ]" description:@"Set the echo gain in dB for the encoder"];
  v25 = v6;
  float v7 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-ng [noise gain]" description:@"Set the noise gain in dB for the encoder"];
  v26 = v7;
  float v8 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-f [freq]" description:@"Set the HPF cut-off frequency in Hz (16000 <= freq <= 20000)"];
  v27 = v8;
  float v9 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-alg [algorithm version]" description:@"Set the algorithm version number (100 or 110 (default))"];
  v28 = v9;
  float v10 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-nf [0/1]" description:@"Enable noise filling in high band (0:disable, 1:enable (default))"];
  v29 = v10;
  float v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:11];

  v18.receiver = self;
  v18.super_class = (Class)EchoCodecConfiguration;
  v12 = [(AUPasscodeCodecConfiguration *)&v18 commandLineOptions];
  objc_super v13 = [v12 arrayByAddingObjectsFromArray:v11];

  return v13;
}

- (EchoCodecConfiguration)initWithCapabilityData:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NSString stringWithUTF8String:"echo"];
  v11.receiver = self;
  v11.super_class = (Class)EchoCodecConfiguration;
  objc_super v6 = [(AUPasscodeCodecConfiguration *)&v11 initWithAlgorithmName:v5];

  if (v6)
  {
    [(EchoCodecConfiguration *)v6 setDefaultValues];
    float v7 = [v4 algorithmVersionNumbers];
    float v8 = [v7 valueForKeyPath:@"@max.self"];
    unsigned int v9 = [v8 intValue];

    v6->_algorithmVersionNumber = v9;
  }

  return v6;
}

- (EchoCodecConfiguration)initWithCommandLineArgs:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)EchoCodecConfiguration;
  objc_super v5 = [(AUPasscodeCodecConfiguration *)&v60 initWithCommandLineArgs:v4];
  objc_super v6 = v5;
  if (!v5) {
    goto LABEL_75;
  }
  [(EchoCodecConfiguration *)v5 setDefaultValues];
  v6->_unint64_t algorithmVersionNumber = 110;
  id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v7 setNumberStyle:1];
  uint64_t v8 = [v4 count];
  unsigned int v9 = objc_alloc_init(EchoCodecCapability);
  for (unint64_t i = 0; i < [v4 count]; ++i)
  {
    objc_super v11 = [v4 objectAtIndex:i];
    int v12 = [v11 isEqualToString:@"-n"];
    if (v8) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    if (v13 == 1)
    {
      v14 = [v4 objectAtIndex:++i];
      v15 = [v7 numberFromString:v14];
      v6->_unint64_t frameSize = [v15 unsignedIntegerValue];

      unint64_t frameSize = v6->_frameSize;
      unint64_t v17 = [(EchoCodecCapability *)v9 frameSizeRange];
LABEL_14:
      unint64_t v23 = frameSize - v17;
      if (frameSize < v17) {
        goto LABEL_73;
      }
LABEL_15:
      if (v23 >= v18) {
        goto LABEL_73;
      }
LABEL_29:
      --v8;
      goto LABEL_30;
    }
    int v19 = [v11 isEqualToString:@"-r"];
    if (v8) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    if (v20 == 1)
    {
      v21 = [v4 objectAtIndex:++i];
      v22 = [v7 numberFromString:v21];
      v6->_numFrameRepeat = [v22 unsignedIntegerValue];

      unint64_t frameSize = v6->_numFrameRepeat;
      unint64_t v17 = [(EchoCodecCapability *)v9 numFrameRepeatRange];
      goto LABEL_14;
    }
    int v24 = [v11 isEqualToString:@"-d0"];
    if (v8) {
      int v25 = v24;
    }
    else {
      int v25 = 0;
    }
    if (v25 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      [v27 floatValue];
      float v29 = v28 / 1000.0;
      uint64_t v30 = 44;
      goto LABEL_27;
    }
    int v31 = [v11 isEqualToString:@"-d1"];
    if (v8) {
      int v32 = v31;
    }
    else {
      int v32 = 0;
    }
    if (v32 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      [v27 floatValue];
      float v29 = v33 / 1000.0;
      uint64_t v30 = 48;
      goto LABEL_27;
    }
    int v34 = [v11 isEqualToString:@"-s"];
    if (v8) {
      int v35 = v34;
    }
    else {
      int v35 = 0;
    }
    if (v35 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      v6->_randomSeed = [v27 unsignedIntegerValue];
      goto LABEL_28;
    }
    int v36 = [v11 isEqualToString:@"-t"];
    if (v8) {
      int v37 = v36;
    }
    else {
      int v37 = 0;
    }
    if (v37 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      [v27 floatValue];
      uint64_t v30 = 52;
LABEL_27:
      *(float *)((char *)&v6->super.super.isa + v30) = v29;
      goto LABEL_28;
    }
    int v38 = [v11 isEqualToString:@"-eg"];
    if (v8) {
      int v39 = v38;
    }
    else {
      int v39 = 0;
    }
    if (v39 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      [v27 floatValue];
      uint64_t v30 = 56;
      goto LABEL_27;
    }
    int v40 = [v11 isEqualToString:@"-ng"];
    if (v8) {
      int v41 = v40;
    }
    else {
      int v41 = 0;
    }
    if (v41 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      [v27 floatValue];
      uint64_t v30 = 60;
      goto LABEL_27;
    }
    int v42 = [v11 isEqualToString:@"-f"];
    if (v8) {
      int v43 = v42;
    }
    else {
      int v43 = 0;
    }
    if (v43 == 1)
    {
      v44 = [v4 objectAtIndex:++i];
      v45 = [v7 numberFromString:v44];
      [v45 floatValue];
      v6->_float hpfCutOffFreq = v46;

      float hpfCutOffFreq = v6->_hpfCutOffFreq;
      unint64_t v48 = [(EchoCodecCapability *)v9 hpfCutOffFreqRange];
      unint64_t v23 = (unint64_t)hpfCutOffFreq - v48;
      if ((unint64_t)hpfCutOffFreq < v48) {
        goto LABEL_73;
      }
      goto LABEL_15;
    }
    int v49 = [v11 isEqualToString:@"-nf"];
    if (v8) {
      int v50 = v49;
    }
    else {
      int v50 = 0;
    }
    if (v50 == 1)
    {
      v26 = [v4 objectAtIndex:++i];
      v27 = [v7 numberFromString:v26];
      v6->_hfNoiseFillingFlag = [v27 unsignedIntegerValue] != 0;
LABEL_28:

      goto LABEL_29;
    }
    int v51 = [v11 isEqualToString:@"-alg"];
    if (v8) {
      int v52 = v51;
    }
    else {
      int v52 = 0;
    }
    if (v52 == 1)
    {
      v53 = [v4 objectAtIndex:++i];
      v54 = [v7 numberFromString:v53];
      v6->_unint64_t algorithmVersionNumber = [v54 unsignedIntegerValue];

      unint64_t algorithmVersionNumber = v6->_algorithmVersionNumber;
      v56 = &qword_237D2DCE8;
      if (!HIDWORD(algorithmVersionNumber))
      {
        uint64_t v57 = 0;
        while (kSupportedAlgorithmVersions[v57] != algorithmVersionNumber)
        {
          if (++v57 == 2)
          {
            v56 = &qword_237D2DCE8;
            goto LABEL_72;
          }
        }
        v56 = (uint64_t *)&kSupportedAlgorithmVersions[v57];
      }
LABEL_72:
      if ((char *)v56 - (char *)kSupportedAlgorithmVersions == 8)
      {
LABEL_73:

        v58 = 0;
        goto LABEL_76;
      }
      goto LABEL_29;
    }
LABEL_30:
    --v8;
  }
LABEL_75:
  v58 = v6;
LABEL_76:

  return v58;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[EchoCodecConfiguration allocWithZone:a3] init];
  [(AUPasscodeCodecConfiguration *)v4 setSampleRate:[(AUPasscodeCodecConfiguration *)self sampleRate]];
  [(AUPasscodeCodecConfiguration *)v4 setNumChannels:[(AUPasscodeCodecConfiguration *)self numChannels]];
  objc_super v5 = [(AUPasscodeCodecConfiguration *)self algorithmName];
  objc_super v6 = (void *)[v5 copy];
  [(AUPasscodeCodecConfiguration *)v4 setAlgorithmName:v6];

  [(AUPasscodeCodecConfiguration *)v4 setPayloadLengthBytes:[(AUPasscodeCodecConfiguration *)self payloadLengthBytes]];
  [(EchoCodecConfiguration *)v4 setFrameSize:[(EchoCodecConfiguration *)self frameSize]];
  [(EchoCodecConfiguration *)v4 setNumFrameRepeat:[(EchoCodecConfiguration *)self numFrameRepeat]];
  [(EchoCodecConfiguration *)self delayForBit0];
  -[EchoCodecConfiguration setDelayForBit0:](v4, "setDelayForBit0:");
  [(EchoCodecConfiguration *)self delayForBit1];
  -[EchoCodecConfiguration setDelayForBit1:](v4, "setDelayForBit1:");
  [(EchoCodecConfiguration *)v4 setRandomSeed:[(EchoCodecConfiguration *)self randomSeed]];
  [(EchoCodecConfiguration *)self syncDetectThreshold];
  -[EchoCodecConfiguration setSyncDetectThreshold:](v4, "setSyncDetectThreshold:");
  [(EchoCodecConfiguration *)self echoGainDB];
  -[EchoCodecConfiguration setEchoGainDB:](v4, "setEchoGainDB:");
  [(EchoCodecConfiguration *)self noiseGainDB];
  -[EchoCodecConfiguration setNoiseGainDB:](v4, "setNoiseGainDB:");
  [(EchoCodecConfiguration *)self hpfCutOffFreq];
  -[EchoCodecConfiguration setHpfCutOffFreq:](v4, "setHpfCutOffFreq:");
  [(EchoCodecConfiguration *)v4 setHfNoiseFillingFlag:[(EchoCodecConfiguration *)self hfNoiseFillingFlag]];
  [(EchoCodecConfiguration *)v4 setAlgorithmVersionNumber:[(EchoCodecConfiguration *)self algorithmVersionNumber]];
  return v4;
}

- (unint64_t)frameSize
{
  return self->_frameSize;
}

- (void)setFrameSize:(unint64_t)a3
{
  self->_unint64_t frameSize = a3;
}

- (unint64_t)numFrameRepeat
{
  return self->_numFrameRepeat;
}

- (void)setNumFrameRepeat:(unint64_t)a3
{
  self->_numFrameRepeat = a3;
}

- (float)delayForBit0
{
  return self->_delayForBit0;
}

- (void)setDelayForBit0:(float)a3
{
  self->_delayForBit0 = a3;
}

- (float)delayForBit1
{
  return self->_delayForBit1;
}

- (void)setDelayForBit1:(float)a3
{
  self->_delayForBit1 = a3;
}

- (float)syncDetectThreshold
{
  return self->_syncDetectThreshold;
}

- (void)setSyncDetectThreshold:(float)a3
{
  self->_syncDetectThreshold = a3;
}

- (unint64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(unint64_t)a3
{
  self->_randomSeed = a3;
}

- (float)echoGainDB
{
  return self->_echoGainDB;
}

- (void)setEchoGainDB:(float)a3
{
  self->_echoGainDB = a3;
}

- (float)noiseGainDB
{
  return self->_noiseGainDB;
}

- (void)setNoiseGainDB:(float)a3
{
  self->_noiseGainDB = a3;
}

- (float)hpfCutOffFreq
{
  return self->_hpfCutOffFreq;
}

- (void)setHpfCutOffFreq:(float)a3
{
  self->_float hpfCutOffFreq = a3;
}

- (BOOL)hfNoiseFillingFlag
{
  return self->_hfNoiseFillingFlag;
}

- (void)setHfNoiseFillingFlag:(BOOL)a3
{
  self->_hfNoiseFillingFlag = a3;
}

- (unint64_t)algorithmVersionNumber
{
  return self->_algorithmVersionNumber;
}

- (void)setAlgorithmVersionNumber:(unint64_t)a3
{
  self->_unint64_t algorithmVersionNumber = a3;
}

@end