@interface AVSpeechUtterance
+ (AVSpeechUtterance)speechUtteranceWithAttributedString:(NSAttributedString *)string;
+ (AVSpeechUtterance)speechUtteranceWithSSMLRepresentation:(NSString *)string;
+ (AVSpeechUtterance)speechUtteranceWithString:(NSString *)string;
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVSpeechSynthesisVoice)voice;
- (AVSpeechUtterance)initWithAttributedString:(NSAttributedString *)string;
- (AVSpeechUtterance)initWithCoder:(id)a3;
- (AVSpeechUtterance)initWithSSMLRepresentation:(NSString *)string;
- (AVSpeechUtterance)initWithString:(NSString *)string;
- (BOOL)prefersAssistiveTechnologySettings;
- (NSAttributedString)attributedSpeechString;
- (NSString)speechString;
- (NSTimeInterval)postUtteranceDelay;
- (NSTimeInterval)preUtteranceDelay;
- (float)pitchMultiplier;
- (float)rate;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedSpeechString:(id)a3;
- (void)setPitchMultiplier:(float)pitchMultiplier;
- (void)setPostUtteranceDelay:(NSTimeInterval)postUtteranceDelay;
- (void)setPreUtteranceDelay:(NSTimeInterval)preUtteranceDelay;
- (void)setPrefersAssistiveTechnologySettings:(BOOL)prefersAssistiveTechnologySettings;
- (void)setRate:(float)rate;
- (void)setSpeechString:(id)a3;
- (void)setVoice:(AVSpeechSynthesisVoice *)voice;
- (void)setVolume:(float)volume;
@end

@implementation AVSpeechUtterance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSpeechString, 0);
  objc_storeStrong((id *)&self->_speechString, 0);

  objc_storeStrong((id *)&self->_voice, 0);
}

- (void)setPostUtteranceDelay:(NSTimeInterval)postUtteranceDelay
{
  self->_postUtteranceDelay = postUtteranceDelay;
}

- (NSTimeInterval)postUtteranceDelay
{
  return self->_postUtteranceDelay;
}

- (void)setPreUtteranceDelay:(NSTimeInterval)preUtteranceDelay
{
  self->_preUtteranceDelay = preUtteranceDelay;
}

- (NSTimeInterval)preUtteranceDelay
{
  return self->_preUtteranceDelay;
}

- (void)setPrefersAssistiveTechnologySettings:(BOOL)prefersAssistiveTechnologySettings
{
  self->_prefersAssistiveTechnologySettings = prefersAssistiveTechnologySettings;
}

- (BOOL)prefersAssistiveTechnologySettings
{
  return self->_prefersAssistiveTechnologySettings;
}

- (float)volume
{
  return self->_volume;
}

- (float)pitchMultiplier
{
  return self->_pitchMultiplier;
}

- (float)rate
{
  return self->_rate;
}

- (void)setAttributedSpeechString:(id)a3
{
}

- (NSAttributedString)attributedSpeechString
{
  return self->_attributedSpeechString;
}

- (void)setSpeechString:(id)a3
{
}

- (NSString)speechString
{
  return self->_speechString;
}

- (void)setVoice:(AVSpeechSynthesisVoice *)voice
{
}

- (AVSpeechSynthesisVoice)voice
{
  return self->_voice;
}

- (void)setPitchMultiplier:(float)pitchMultiplier
{
  self->_pitchMultiplier = fmaxf(pitchMultiplier, 0.5);
}

- (void)setRate:(float)rate
{
  self->_rate = fmaxf(rate, 0.0);
}

- (void)setVolume:(float)volume
{
  self->_volume = fmaxf(volume, 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(AVSpeechUtterance *)self voice];
  [v4 setVoice:v5];

  v6 = [(AVSpeechUtterance *)self speechString];
  [v4 setSpeechString:v6];

  v7 = [(AVSpeechUtterance *)self attributedSpeechString];
  [v4 setAttributedSpeechString:v7];

  [(AVSpeechUtterance *)self rate];
  objc_msgSend(v4, "setRate:");
  [(AVSpeechUtterance *)self pitchMultiplier];
  objc_msgSend(v4, "setPitchMultiplier:");
  [(AVSpeechUtterance *)self volume];
  objc_msgSend(v4, "setVolume:");
  [(AVSpeechUtterance *)self preUtteranceDelay];
  objc_msgSend(v4, "setPreUtteranceDelay:");
  [(AVSpeechUtterance *)self postUtteranceDelay];
  objc_msgSend(v4, "setPostUtteranceDelay:");
  return v4;
}

- (AVSpeechUtterance)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVSpeechUtterance;
  v5 = [(AVSpeechUtterance *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voice"];
    [(AVSpeechUtterance *)v5 setVoice:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechString"];
    [(AVSpeechUtterance *)v5 setSpeechString:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedSpeechString"];
    [(AVSpeechUtterance *)v5 setAttributedSpeechString:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rate"];
    [v9 floatValue];
    -[AVSpeechUtterance setRate:](v5, "setRate:");

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pitchMultiplier"];
    [v10 floatValue];
    -[AVSpeechUtterance setPitchMultiplier:](v5, "setPitchMultiplier:");

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
    [v11 floatValue];
    -[AVSpeechUtterance setVolume:](v5, "setVolume:");

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preUtteranceDelay"];
    [v12 doubleValue];
    -[AVSpeechUtterance setPreUtteranceDelay:](v5, "setPreUtteranceDelay:");

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postUtteranceDelay"];
    [v13 doubleValue];
    -[AVSpeechUtterance setPostUtteranceDelay:](v5, "setPostUtteranceDelay:");

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = [(AVSpeechUtterance *)self voice];
  [v17 encodeObject:v4 forKey:@"voice"];

  v5 = [(AVSpeechUtterance *)self speechString];
  [v17 encodeObject:v5 forKey:@"speechString"];

  v6 = [(AVSpeechUtterance *)self attributedSpeechString];
  [v17 encodeObject:v6 forKey:@"speechString"];

  v7 = NSNumber;
  [(AVSpeechUtterance *)self rate];
  v8 = objc_msgSend(v7, "numberWithFloat:");
  [v17 encodeObject:v8 forKey:@"rate"];

  v9 = NSNumber;
  [(AVSpeechUtterance *)self pitchMultiplier];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v17 encodeObject:v10 forKey:@"pitchMultiplier"];

  v11 = NSNumber;
  [(AVSpeechUtterance *)self volume];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v17 encodeObject:v12 forKey:@"volume"];

  v13 = NSNumber;
  [(AVSpeechUtterance *)self preUtteranceDelay];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  [v17 encodeObject:v14 forKey:@"preUtteranceDelay"];

  v15 = NSNumber;
  [(AVSpeechUtterance *)self postUtteranceDelay];
  objc_super v16 = objc_msgSend(v15, "numberWithDouble:");
  [v17 encodeObject:v16 forKey:@"postUtteranceDelay"];
}

- (AVSpeechUtterance)initWithSSMLRepresentation:(NSString *)string
{
  return 0;
}

- (AVSpeechUtterance)initWithAttributedString:(NSAttributedString *)string
{
  return 0;
}

- (AVSpeechUtterance)initWithString:(NSString *)string
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AVSpeechUtterance)speechUtteranceWithSSMLRepresentation:(NSString *)string
{
  return 0;
}

+ (AVSpeechUtterance)speechUtteranceWithAttributedString:(NSAttributedString *)string
{
  return 0;
}

+ (AVSpeechUtterance)speechUtteranceWithString:(NSString *)string
{
  return 0;
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1) {
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_5009);
  }
}

@end