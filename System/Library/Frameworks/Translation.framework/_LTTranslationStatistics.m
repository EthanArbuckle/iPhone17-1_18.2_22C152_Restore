@interface _LTTranslationStatistics
+ (BOOL)supportsSecureCoding;
- (_LTTranslationStatistics)initWithCoder:(id)a3;
- (int64_t)inputSubtokenCount;
- (int64_t)inputTokenCount;
- (void)encodeWithCoder:(id)a3;
- (void)setInputSubtokenCount:(int64_t)a3;
- (void)setInputTokenCount:(int64_t)a3;
@end

@implementation _LTTranslationStatistics

- (_LTTranslationStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LTTranslationStatistics;
  v5 = [(_LTTranslationStatistics *)&v8 init];
  if (v5)
  {
    v5->_inputTokenCount = [v4 decodeIntegerForKey:@"inputTokenCount"];
    v5->_inputSubtokenCount = [v4 decodeIntegerForKey:@"inputSubtokenCount"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t inputTokenCount = self->_inputTokenCount;
  id v5 = a3;
  [v5 encodeInteger:inputTokenCount forKey:@"inputTokenCount"];
  [v5 encodeInteger:self->_inputSubtokenCount forKey:@"inputSubtokenCount"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)inputTokenCount
{
  return self->_inputTokenCount;
}

- (void)setInputTokenCount:(int64_t)a3
{
  self->_int64_t inputTokenCount = a3;
}

- (int64_t)inputSubtokenCount
{
  return self->_inputSubtokenCount;
}

- (void)setInputSubtokenCount:(int64_t)a3
{
  self->_inputSubtokenCount = a3;
}

@end