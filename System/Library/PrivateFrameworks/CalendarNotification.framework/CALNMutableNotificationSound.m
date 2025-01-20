@interface CALNMutableNotificationSound
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlertTopic:(id)a3;
@end

@implementation CALNMutableNotificationSound

- (void)setAlertTopic:(id)a3
{
  self->super._alertTopic = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CALNNotificationSound allocWithZone:a3];
  int64_t v5 = [(CALNNotificationSound *)self alertType];
  v6 = [(CALNNotificationSound *)self alertTopic];
  id v7 = [(CALNNotificationSound *)v4 _initWithAlertType:v5 alertTopic:v6];

  return v7;
}

@end