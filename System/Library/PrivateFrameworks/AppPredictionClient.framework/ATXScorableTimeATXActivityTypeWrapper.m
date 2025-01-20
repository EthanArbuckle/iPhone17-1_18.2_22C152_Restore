@interface ATXScorableTimeATXActivityTypeWrapper
- (ATXScorableTimeATXActivityTypeWrapper)initWithActivityType:(unint64_t)a3;
- (NSString)legacyScorableTimeIdentifier;
- (NSString)scorableTimeIdentifier;
- (unint64_t)activityType;
@end

@implementation ATXScorableTimeATXActivityTypeWrapper

- (ATXScorableTimeATXActivityTypeWrapper)initWithActivityType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXScorableTimeATXActivityTypeWrapper;
  result = [(ATXScorableTimeATXActivityTypeWrapper *)&v5 init];
  if (result) {
    result->_activityType = a3;
  }
  return result;
}

- (NSString)legacyScorableTimeIdentifier
{
  v2 = [[ATXScorableTimeATXModeWrapper alloc] initWithATXMode:ATXModeFromActivityType([(ATXScorableTimeATXActivityTypeWrapper *)self activityType])];
  v3 = [(ATXScorableTimeATXModeWrapper *)v2 scorableTimeIdentifier];

  return (NSString *)v3;
}

- (NSString)scorableTimeIdentifier
{
  v2 = NSString;
  [(ATXScorableTimeATXActivityTypeWrapper *)self activityType];
  v3 = ATXActivityTypeToString();
  v4 = [v2 stringWithFormat:@"activityType__%@", v3];

  return (NSString *)v4;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

@end