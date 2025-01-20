@interface LACDTOMutableNotificationCategory
+ (id)newSecurityDelayRequiredCategory;
+ (id)securityDelayEndedCategory;
- (BOOL)hiddenPreviewShowsTitle;
- (LACDTOMutableNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewShowsTitle:(BOOL)a5;
- (NSArray)actions;
- (NSString)identifier;
- (void)setActions:(id)a3;
- (void)setHiddenPreviewShowsTitle:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation LACDTOMutableNotificationCategory

- (LACDTOMutableNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewShowsTitle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOMutableNotificationCategory;
  v10 = [(LACDTOMutableNotificationCategory *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(LACDTOMutableNotificationCategory *)v10 setIdentifier:v8];
    [(LACDTOMutableNotificationCategory *)v11 setActions:v9];
    [(LACDTOMutableNotificationCategory *)v11 setHiddenPreviewShowsTitle:v5];
  }

  return v11;
}

+ (id)newSecurityDelayRequiredCategory
{
  v8[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)a1);
  v3 = +[LACDTOMutableNotificationAction startNewDelayAction];
  v8[0] = v3;
  v4 = +[LACDTOMutableNotificationAction doNotStartNewDelayAction];
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = (void *)[v2 initWithIdentifier:@"com.apple.coreauthd.notifications.category.securityDelay.required" actions:v5 hiddenPreviewShowsTitle:1];

  return v6;
}

+ (id)securityDelayEndedCategory
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithIdentifier:@"com.apple.coreauthd.notifications.category.securityDelay.ended" actions:MEMORY[0x263EFFA68] hiddenPreviewShowsTitle:1];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)hiddenPreviewShowsTitle
{
  return self->_hiddenPreviewShowsTitle;
}

- (void)setHiddenPreviewShowsTitle:(BOOL)a3
{
  self->_hiddenPreviewShowsTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end