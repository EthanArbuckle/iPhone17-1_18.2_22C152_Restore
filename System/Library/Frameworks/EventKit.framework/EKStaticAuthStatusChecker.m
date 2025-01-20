@interface EKStaticAuthStatusChecker
- (BOOL)hasAccessToReminders;
- (EKStaticAuthStatusChecker)initWithEventAccessLevel:(int)a3 hasAccessToReminders:(BOOL)a4;
- (int)eventAccessLevel;
@end

@implementation EKStaticAuthStatusChecker

- (int)eventAccessLevel
{
  return self->_eventAccessLevel;
}

- (BOOL)hasAccessToReminders
{
  return self->_hasAccessToReminders;
}

- (EKStaticAuthStatusChecker)initWithEventAccessLevel:(int)a3 hasAccessToReminders:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKStaticAuthStatusChecker;
  result = [(EKStaticAuthStatusChecker *)&v7 init];
  if (result)
  {
    result->_eventAccessLevel = a3;
    result->_hasAccessToReminders = a4;
  }
  return result;
}

@end