@interface CLSAbstractAnswerFormat
- (int64_t)answerFormatType;
@end

@implementation CLSAbstractAnswerFormat

- (int64_t)answerFormatType
{
  return self->_answerFormatType;
}

@end