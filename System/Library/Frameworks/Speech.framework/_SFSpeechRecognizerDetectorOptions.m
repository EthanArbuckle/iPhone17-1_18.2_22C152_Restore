@interface _SFSpeechRecognizerDetectorOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_SFSpeechRecognizerDetectorOptions)initWithCoder:(id)a3;
- (_SFSpeechRecognizerDetectorOptions)initWithDetectAfterTime:(double)a3;
- (double)detectAfterTime;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFSpeechRecognizerDetectorOptions

- (double)detectAfterTime
{
  return self->_detectAfterTime;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<_SFSpeechRecognizerDetectorOptions: detectAfterTime %f>", *(void *)&self->_detectAfterTime);
}

- (unint64_t)hash
{
  return *(void *)&self->_detectAfterTime;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SFSpeechRecognizerDetectorOptions *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(_SFSpeechRecognizerDetectorOptions *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = self->_detectAfterTime == v4->_detectAfterTime;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (_SFSpeechRecognizerDetectorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFSpeechRecognizerDetectorOptions;
  BOOL v5 = [(_SFSpeechRecognizerDetectorOptions *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_detectAfterTime"];
    v5->_detectAfterTime = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_SFSpeechRecognizerDetectorOptions)initWithDetectAfterTime:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFSpeechRecognizerDetectorOptions;
  result = [(_SFSpeechRecognizerDetectorOptions *)&v5 init];
  if (result) {
    result->_detectAfterTime = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end