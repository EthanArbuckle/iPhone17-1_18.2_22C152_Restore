@interface AVAudioDeviceTestResult
+ (BOOL)supportsSecureCoding;
- (AVAudioDeviceTestResult)initWithCoder:(id)a3;
- (AVAudioDeviceTestResult)initWithData:(id)a3 inputID:(int64_t)a4 outputID:(int64_t)a5 sampleRate:(double)a6 correlationValue:(double)a7;
- (NSData)data;
- (double)correlationValue;
- (double)sampleRate;
- (int64_t)inputID;
- (int64_t)outputID;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrelationValue:(double)a3;
- (void)setInputID:(int64_t)a3;
- (void)setOutputID:(int64_t)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation AVAudioDeviceTestResult

- (void).cxx_destruct
{
}

- (void)setCorrelationValue:(double)a3
{
  self->_correlationValue = a3;
}

- (double)correlationValue
{
  return self->_correlationValue;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (NSData)data
{
  return self->_data;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (void)setInputID:(int64_t)a3
{
  self->_inputID = a3;
}

- (int64_t)inputID
{
  return self->_inputID;
}

- (AVAudioDeviceTestResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVAudioDeviceTestResult;
  v5 = [(AVAudioDeviceTestResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_outputID = (int64_t)[v4 decodeIntegerForKey:@"outputID"];
    v5->_inputID = (int64_t)[v4 decodeIntegerForKey:@"inputID"];
    [v4 decodeDoubleForKey:@"sampleRate"];
    v5->_sampleRate = v8;
    [v4 decodeDoubleForKey:@"correlationValue"];
    v5->_correlationValue = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"data"];
  [v5 encodeInteger:self->_outputID forKey:@"outputID"];
  [v5 encodeInteger:self->_inputID forKey:@"inputID"];
  [v5 encodeDouble:@"sampleRate" forKey:self->_sampleRate];
  [v5 encodeDouble:@"correlationValue" forKey:self->_correlationValue];
}

- (AVAudioDeviceTestResult)initWithData:(id)a3 inputID:(int64_t)a4 outputID:(int64_t)a5 sampleRate:(double)a6 correlationValue:(double)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVAudioDeviceTestResult;
  v14 = [(AVAudioDeviceTestResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    v15->_inputID = a4;
    v15->_outputID = a5;
    v15->_sampleRate = a6;
    v15->_correlationValue = a7;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end