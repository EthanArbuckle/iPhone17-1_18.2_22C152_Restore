@interface LANotificationOfBooleanState
+ (void)postNotificationWithNewBoolState:(BOOL)a3;
- (BOOL)BOOLValue;
- (BOOL)oldBoolValue;
- (id)darwinNotificationForBoolValue:(BOOL)a3;
- (id)darwinNotificationForValue:(id)a3;
@end

@implementation LANotificationOfBooleanState

- (BOOL)BOOLValue
{
  v3 = [(LANotification *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(LANotification *)self value];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)darwinNotificationForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = -[LANotificationOfBooleanState darwinNotificationForBoolValue:](self, "darwinNotificationForBoolValue:", [v4 BOOLValue]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  return 0;
}

+ (void)postNotificationWithNewBoolState:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_opt_new();
  id v4 = [NSNumber numberWithBool:v3];
  char v5 = [NSNumber numberWithInt:v3 ^ 1];
  [v6 postNewValue:v4 oldValue:v5];
}

- (BOOL)oldBoolValue
{
  return self->_oldBoolValue;
}

@end