@interface ATXScorableTimeDigestTimeWrapper
- (ATXScorableTimeDigestTimeWrapper)initWithDigestTime:(int64_t)a3;
- (NSString)legacyScorableTimeIdentifier;
- (NSString)scorableTimeIdentifier;
- (int64_t)digestTime;
@end

@implementation ATXScorableTimeDigestTimeWrapper

- (ATXScorableTimeDigestTimeWrapper)initWithDigestTime:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXScorableTimeDigestTimeWrapper;
  result = [(ATXScorableTimeDigestTimeWrapper *)&v5 init];
  if (result) {
    result->_digestTime = a3;
  }
  return result;
}

- (NSString)scorableTimeIdentifier
{
  uint64_t v2 = [(ATXScorableTimeDigestTimeWrapper *)self digestTime];

  return (NSString *)ATXUserNotificationDigestDeliveryTimeToString(v2);
}

- (NSString)legacyScorableTimeIdentifier
{
  uint64_t v2 = [[ATXScorableTimeATXModeWrapper alloc] initWithATXMode:digestTimeToMode([(ATXScorableTimeDigestTimeWrapper *)self digestTime])];
  v3 = [(ATXScorableTimeATXModeWrapper *)v2 scorableTimeIdentifier];

  return (NSString *)v3;
}

- (int64_t)digestTime
{
  return self->_digestTime;
}

@end