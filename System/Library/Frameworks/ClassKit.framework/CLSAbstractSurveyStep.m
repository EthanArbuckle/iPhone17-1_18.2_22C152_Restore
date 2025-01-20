@interface CLSAbstractSurveyStep
- (int64_t)type;
- (int64_t)version;
@end

@implementation CLSAbstractSurveyStep

- (int64_t)version
{
  return self->_version;
}

- (int64_t)type
{
  return self->_type;
}

@end