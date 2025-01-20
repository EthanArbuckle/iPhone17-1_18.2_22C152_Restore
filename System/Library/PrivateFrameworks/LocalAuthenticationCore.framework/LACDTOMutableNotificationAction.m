@interface LACDTOMutableNotificationAction
+ (id)doNotStartNewDelayAction;
+ (id)startNewDelayAction;
- (BOOL)isDestructive;
- (BOOL)isTitleLocalized;
- (LACDTOMutableNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 isTitleLocalized:(BOOL)a5 isDestructive:(BOOL)a6;
- (NSString)identifier;
- (NSString)title;
- (void)setIdentifier:(id)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setIsTitleLocalized:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation LACDTOMutableNotificationAction

- (LACDTOMutableNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 isTitleLocalized:(BOOL)a5 isDestructive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOMutableNotificationAction;
  v12 = [(LACDTOMutableNotificationAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(LACDTOMutableNotificationAction *)v12 setIdentifier:v10];
    [(LACDTOMutableNotificationAction *)v13 setTitle:v11];
    [(LACDTOMutableNotificationAction *)v13 setIsTitleLocalized:v7];
    [(LACDTOMutableNotificationAction *)v13 setIsDestructive:v6];
  }

  return v13;
}

+ (id)doNotStartNewDelayAction
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIdentifier:@"com.apple.coreauthd.notifications.action.securityDelay.start" title:@"START_SECURITY_DELAY_ACTION" isTitleLocalized:0 isDestructive:0];
  return v2;
}

+ (id)startNewDelayAction
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIdentifier:@"com.apple.coreauthd.notifications.action.securityDelay.dismiss" title:@"NOT_NOW_ACTION" isTitleLocalized:0 isDestructive:1];
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (BOOL)isTitleLocalized
{
  return self->_isTitleLocalized;
}

- (void)setIsTitleLocalized:(BOOL)a3
{
  self->_isTitleLocalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end