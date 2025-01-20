@interface AVAudioDeviceTestSequence
+ (BOOL)supportsSecureCoding;
- (AVAudioDeviceTestProcessingChain)inputProcessingChain;
- (AVAudioDeviceTestProcessingChain)outputProcessingChain;
- (AVAudioDeviceTestSequence)init;
- (AVAudioDeviceTestSequence)initWithCoder:(id)a3;
- (BOOL)calculateCrossCorrelationPeak;
- (BOOL)parallelCrossCorrelationCalculation;
- (BOOL)processSequenceAsynchronously;
- (BOOL)requiresBluetoothOutput;
- (NSArray)micBufferNumbers;
- (NSString)microphone;
- (NSString)mode;
- (NSURL)stimulusURL;
- (float)volume;
- (int64_t)numberOfChannels;
- (int64_t)outputID;
- (int64_t)outputMode;
- (int64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setCalculateCrossCorrelationPeak:(BOOL)a3;
- (void)setInputProcessingChain:(id)a3;
- (void)setMicBufferNumbers:(id)a3;
- (void)setMicrophone:(id)a3;
- (void)setMode:(id)a3;
- (void)setNumberOfChannels:(int64_t)a3;
- (void)setOutputID:(int64_t)a3;
- (void)setOutputMode:(int64_t)a3;
- (void)setOutputProcessingChain:(id)a3;
- (void)setParallelCrossCorrelationCalculation:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProcessSequenceAsynchronously:(BOOL)a3;
- (void)setRequiresBluetoothOutput:(BOOL)a3;
- (void)setStimulusURL:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation AVAudioDeviceTestSequence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphone, 0);
  objc_storeStrong((id *)&self->_micBufferNumbers, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_outputProcessingChain, 0);
  objc_storeStrong((id *)&self->_inputProcessingChain, 0);

  objc_storeStrong((id *)&self->_stimulusURL, 0);
}

- (void)setProcessSequenceAsynchronously:(BOOL)a3
{
  self->_processSequenceAsynchronously = a3;
}

- (BOOL)processSequenceAsynchronously
{
  return self->_processSequenceAsynchronously;
}

- (void)setMicrophone:(id)a3
{
}

- (NSString)microphone
{
  return self->_microphone;
}

- (void)setRequiresBluetoothOutput:(BOOL)a3
{
  self->_requiresBluetoothOutput = a3;
}

- (BOOL)requiresBluetoothOutput
{
  return self->_requiresBluetoothOutput;
}

- (void)setMicBufferNumbers:(id)a3
{
}

- (NSArray)micBufferNumbers
{
  return self->_micBufferNumbers;
}

- (void)setNumberOfChannels:(int64_t)a3
{
  self->_numberOfChannels = a3;
}

- (int64_t)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setParallelCrossCorrelationCalculation:(BOOL)a3
{
  self->_parallelCrossCorrelationCalculation = a3;
}

- (BOOL)parallelCrossCorrelationCalculation
{
  return self->_parallelCrossCorrelationCalculation;
}

- (void)setCalculateCrossCorrelationPeak:(BOOL)a3
{
  self->_calculateCrossCorrelationPeak = a3;
}

- (BOOL)calculateCrossCorrelationPeak
{
  return self->_calculateCrossCorrelationPeak;
}

- (void)setMode:(id)a3
{
}

- (NSString)mode
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setOutputMode:(int64_t)a3
{
  self->_outputMode = a3;
}

- (int64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputProcessingChain:(id)a3
{
}

- (AVAudioDeviceTestProcessingChain)outputProcessingChain
{
  return self->_outputProcessingChain;
}

- (void)setInputProcessingChain:(id)a3
{
}

- (AVAudioDeviceTestProcessingChain)inputProcessingChain
{
  return self->_inputProcessingChain;
}

- (void)setStimulusURL:(id)a3
{
}

- (NSURL)stimulusURL
{
  return self->_stimulusURL;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (AVAudioDeviceTestSequence)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AVAudioDeviceTestSequence;
  v5 = [(AVAudioDeviceTestSequence *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stimulusURL"];
    stimulusURL = v5->_stimulusURL;
    v5->_stimulusURL = (NSURL *)v6;

    v5->_outputID = [v4 decodeIntegerForKey:@"outputID"];
    v5->_outputMode = [v4 decodeIntegerForKey:@"outputMode"];
    [v4 decodeFloatForKey:@"volume"];
    v5->_volume = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputProcessingChain"];
    inputProcessingChain = v5->_inputProcessingChain;
    v5->_inputProcessingChain = (AVAudioDeviceTestProcessingChain *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputProcessingChain"];
    outputProcessingChain = v5->_outputProcessingChain;
    v5->_outputProcessingChain = (AVAudioDeviceTestProcessingChain *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    mode = v5->_mode;
    v5->_mode = (NSString *)v13;

    v5->_calculateCrossCorrelationPeak = [v4 decodeBoolForKey:@"calculateCrossCorrelationPeak"];
    v5->_processSequenceAsynchronously = [v4 decodeBoolForKey:@"processSequenceAsynchronously"];
    v5->_parallelCrossCorrelationCalculation = [v4 decodeBoolForKey:@"parallelCrossCorrelationCalculation"];
    v5->_numberOfChannels = [v4 decodeIntegerForKey:@"numberOfChannels"];
    uint64_t v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"micBufferNumbers"];
    micBufferNumbers = v5->_micBufferNumbers;
    v5->_micBufferNumbers = (NSArray *)v15;

    v5->_requiresBluetoothOutput = [v4 decodeBoolForKey:@"requiresBluetoothOutput"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"microphone"];
    microphone = v5->_microphone;
    v5->_microphone = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  stimulusURL = self->_stimulusURL;
  id v6 = a3;
  [v6 encodeObject:stimulusURL forKey:@"stimulusURL"];
  [v6 encodeInteger:self->_outputID forKey:@"outputID"];
  [v6 encodeInteger:self->_outputMode forKey:@"outputMode"];
  *(float *)&double v5 = self->_volume;
  [v6 encodeFloat:@"volume" forKey:v5];
  [v6 encodeObject:self->_inputProcessingChain forKey:@"inputProcessingChain"];
  [v6 encodeObject:self->_outputProcessingChain forKey:@"outputProcessingChain"];
  [v6 encodeObject:self->_mode forKey:@"mode"];
  [v6 encodeBool:self->_calculateCrossCorrelationPeak forKey:@"calculateCrossCorrelationPeak"];
  [v6 encodeBool:self->_processSequenceAsynchronously forKey:@"processSequenceAsynchronously"];
  [v6 encodeBool:self->_parallelCrossCorrelationCalculation forKey:@"parallelCrossCorrelationCalculation"];
  [v6 encodeInteger:self->_numberOfChannels forKey:@"numberOfChannels"];
  [v6 encodeObject:self->_micBufferNumbers forKey:@"micBufferNumbers"];
  [v6 encodeBool:self->_requiresBluetoothOutput forKey:@"requiresBluetoothOutput"];
  [v6 encodeObject:self->_microphone forKey:@"microphone"];
}

- (AVAudioDeviceTestSequence)init
{
  v12.receiver = self;
  v12.super_class = (Class)AVAudioDeviceTestSequence;
  v2 = [(AVAudioDeviceTestSequence *)&v12 init];
  v3 = v2;
  if (v2)
  {
    mode = v2->_mode;
    v2->_mode = 0;

    v3->_calculateCrossCorrelationPeak = 0;
    stimulusURL = v3->_stimulusURL;
    v3->_stimulusURL = 0;

    v3->_outputID = 0;
    v3->_outputMode = 0;
    v3->_volume = 0.5;
    inputProcessingChain = v3->_inputProcessingChain;
    v3->_inputProcessingChain = 0;

    outputProcessingChain = v3->_outputProcessingChain;
    v3->_outputProcessingChain = 0;

    v3->_processSequenceAsynchronously = 0;
    v3->_parallelCrossCorrelationCalculation = 0;
    micBufferNumbers = v3->_micBufferNumbers;
    uint64_t v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v3->_numberOfChannels = 0;
    v3->_micBufferNumbers = v9;

    v3->_requiresBluetoothOutput = 0;
    microphone = v3->_microphone;
    v3->_microphone = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end