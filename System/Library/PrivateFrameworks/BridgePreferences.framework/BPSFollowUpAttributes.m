@interface BPSFollowUpAttributes
+ (id)attributeWithOptions:(id)a3;
- (BOOL)wantNotification;
- (NSDictionary)followUpActions;
- (NSString)localizedDescription;
- (NSString)localizedNotificationDescription;
- (NSString)localizedNotificationTitle;
- (NSString)localizedTitle;
- (void)setFollowUpActions:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedNotificationDescription:(id)a3;
- (void)setLocalizedNotificationTitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setWantNotification:(BOOL)a3;
@end

@implementation BPSFollowUpAttributes

+ (id)attributeWithOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BPSFollowUpAttributes);
  v5 = [v3 objectForKeyedSubscript:@"title"];
  [(BPSFollowUpAttributes *)v4 setLocalizedTitle:v5];

  v6 = [v3 objectForKeyedSubscript:@"description"];
  [(BPSFollowUpAttributes *)v4 setLocalizedDescription:v6];

  v7 = [v3 objectForKeyedSubscript:@"followUpActions"];
  [(BPSFollowUpAttributes *)v4 setFollowUpActions:v7];

  v8 = [v3 objectForKeyedSubscript:@"notificationTitle"];
  v9 = [v3 objectForKeyedSubscript:@"notificationDescription"];

  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    [(BPSFollowUpAttributes *)v4 setWantNotification:1];
    [(BPSFollowUpAttributes *)v4 setLocalizedNotificationTitle:v8];
    [(BPSFollowUpAttributes *)v4 setLocalizedNotificationDescription:v9];
  }

  return v4;
}

- (BOOL)wantNotification
{
  return self->_wantNotification;
}

- (void)setWantNotification:(BOOL)a3
{
  self->_wantNotification = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSDictionary)followUpActions
{
  return self->_followUpActions;
}

- (void)setFollowUpActions:(id)a3
{
}

- (NSString)localizedNotificationTitle
{
  return self->_localizedNotificationTitle;
}

- (void)setLocalizedNotificationTitle:(id)a3
{
}

- (NSString)localizedNotificationDescription
{
  return self->_localizedNotificationDescription;
}

- (void)setLocalizedNotificationDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNotificationDescription, 0);
  objc_storeStrong((id *)&self->_localizedNotificationTitle, 0);
  objc_storeStrong((id *)&self->_followUpActions, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end