@interface ATXScorableTimeATXModeWrapper
- (ATXScorableTimeATXModeWrapper)initWithATXMode:(unint64_t)a3;
- (NSString)scorableTimeIdentifier;
- (unint64_t)atxMode;
@end

@implementation ATXScorableTimeATXModeWrapper

- (ATXScorableTimeATXModeWrapper)initWithATXMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXScorableTimeATXModeWrapper;
  result = [(ATXScorableTimeATXModeWrapper *)&v5 init];
  if (result) {
    result->_atxMode = a3;
  }
  return result;
}

- (NSString)scorableTimeIdentifier
{
  unint64_t v2 = [(ATXScorableTimeATXModeWrapper *)self atxMode];

  return (NSString *)ATXModeToString(v2);
}

- (unint64_t)atxMode
{
  return self->_atxMode;
}

@end