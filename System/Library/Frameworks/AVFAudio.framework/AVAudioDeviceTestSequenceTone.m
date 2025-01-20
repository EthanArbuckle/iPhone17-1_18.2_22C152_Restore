@interface AVAudioDeviceTestSequenceTone
+ (BOOL)supportsSecureCoding;
- (AVAudioDeviceTestSequenceTone)init;
- (AVAudioDeviceTestSequenceTone)initWithCoder:(id)a3;
- (double)amplitude;
- (double)duration;
- (double)frequency;
- (double)pauseDuration;
- (double)pulseDuration;
- (double)rampDuration;
- (double)soundLevel;
- (double)startDelay;
- (int)numberOfPulses;
- (void)encodeWithCoder:(id)a3;
- (void)setAmplitude:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFrequency:(double)a3;
- (void)setNumberOfPulses:(int)a3;
- (void)setPauseDuration:(double)a3;
- (void)setPulseDuration:(double)a3;
- (void)setRampDuration:(double)a3;
- (void)setSoundLevel:(double)a3;
- (void)setStartDelay:(double)a3;
@end

@implementation AVAudioDeviceTestSequenceTone

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setRampDuration:(double)a3
{
  self->_rampDuration = a3;
}

- (double)rampDuration
{
  return self->_rampDuration;
}

- (void)setPauseDuration:(double)a3
{
  self->_pauseDuration = a3;
}

- (double)pauseDuration
{
  return self->_pauseDuration;
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (void)setNumberOfPulses:(int)a3
{
  self->_numberOfPulses = a3;
}

- (int)numberOfPulses
{
  return self->_numberOfPulses;
}

- (void)setSoundLevel:(double)a3
{
  self->_soundLevel = a3;
}

- (double)soundLevel
{
  return self->_soundLevel;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)frequency
{
  return self->_frequency;
}

- (AVAudioDeviceTestSequenceTone)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVAudioDeviceTestSequenceTone;
  v5 = [(AVAudioDeviceTestSequence *)&v15 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"frequency"];
    v5->_frequency = v6;
    [v4 decodeDoubleForKey:@"amplitude"];
    v5->_amplitude = v7;
    [v4 decodeDoubleForKey:@"soundLevel"];
    v5->_soundLevel = v8;
    v5->_numberOfPulses = [v4 decodeIntForKey:@"numberOfPulses"];
    [v4 decodeDoubleForKey:@"pulseDuration"];
    v5->_pulseDuration = v9;
    [v4 decodeDoubleForKey:@"pauseDuration"];
    v5->_pauseDuration = v10;
    [v4 decodeDoubleForKey:@"rampDuration"];
    v5->_rampDuration = v11;
    [v4 decodeDoubleForKey:@"startDelay"];
    v5->_startDelay = v12;
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioDeviceTestSequenceTone;
  id v4 = a3;
  [(AVAudioDeviceTestSequence *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"frequency", self->_frequency, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"amplitude" forKey:self->_amplitude];
  [v4 encodeDouble:@"soundLevel" forKey:self->_soundLevel];
  [v4 encodeInt:self->_numberOfPulses forKey:@"numberOfPulses"];
  [v4 encodeDouble:@"pulseDuration" forKey:self->_pulseDuration];
  [v4 encodeDouble:@"pauseDuration" forKey:self->_pauseDuration];
  [v4 encodeDouble:@"rampDuration" forKey:self->_rampDuration];
  [v4 encodeDouble:@"startDelay" forKey:self->_startDelay];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
}

- (AVAudioDeviceTestSequenceTone)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioDeviceTestSequenceTone;
  result = [(AVAudioDeviceTestSequence *)&v3 init];
  if (result)
  {
    result->_frequency = 0.0;
    result->_amplitude = 0.0;
    result->_soundLevel = 0.0;
    result->_numberOfPulses = 0;
    result->_pulseDuration = 200.0;
    result->_pauseDuration = 200.0;
    result->_rampDuration = 35.0;
    result->_startDelay = 150.0;
    result->_duration = 0.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end