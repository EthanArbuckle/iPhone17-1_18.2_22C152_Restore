@interface _LTSpeechRecognitionTokensAlternative
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSpaceAfter;
- (BOOL)isLowConfidence;
- (NSString)text;
- (_LTSpeechRecognitionTokensAlternative)initWithCoder:(id)a3;
- (int64_t)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(int64_t)a3;
- (void)setHasSpaceAfter:(BOOL)a3;
- (void)setLowConfidence:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation _LTSpeechRecognitionTokensAlternative

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeInteger:self->_confidence forKey:@"confidence"];
  [v5 encodeBool:self->_lowConfidence forKey:@"lowConfidence"];
  [v5 encodeBool:self->_hasSpaceAfter forKey:@"spaceAfter"];
}

- (_LTSpeechRecognitionTokensAlternative)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTSpeechRecognitionTokensAlternative;
  id v5 = [(_LTSpeechRecognitionTokensAlternative *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_confidence = [v4 decodeIntegerForKey:@"confidence"];
    v5->_lowConfidence = [v4 decodeBoolForKey:@"lowConfidence"];
    v5->_hasSpaceAfter = [v4 decodeBoolForKey:@"spaceAfter"];
    v8 = v5;
  }

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (BOOL)isLowConfidence
{
  return self->_lowConfidence;
}

- (void)setLowConfidence:(BOOL)a3
{
  self->_lowConfidence = a3;
}

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (void)setHasSpaceAfter:(BOOL)a3
{
  self->_hasSpaceAfter = a3;
}

- (void).cxx_destruct
{
}

@end