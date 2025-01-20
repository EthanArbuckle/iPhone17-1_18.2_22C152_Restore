@interface HSTNotificationEvent
+ (const)hsClassName;
- (unsigned)notification;
- (void)setNotification:(unsigned __int16)a3;
@end

@implementation HSTNotificationEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)78,(char)111,(char)116,(char)105,(char)102,(char)105,(char)99,(char)97,(char)116,(char)105,(char)111,(char)110,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned __int16)a3
{
  self->_notification = a3;
}

@end