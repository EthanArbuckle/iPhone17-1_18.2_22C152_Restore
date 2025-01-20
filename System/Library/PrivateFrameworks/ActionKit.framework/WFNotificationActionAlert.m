@interface WFNotificationActionAlert
- (NSString)body;
- (NSString)title;
- (WFNotificationActionAlert)initWithTitle:(id)a3 body:(id)a4;
@end

@implementation WFNotificationActionAlert

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)body
{
  return self->_body;
}

- (NSString)title
{
  return self->_title;
}

- (WFNotificationActionAlert)initWithTitle:(id)a3 body:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFNotificationActionAlert;
  v8 = [(WFNotificationActionAlert *)&v16 init];
  if (v8)
  {
    if ([v6 length] || objc_msgSend(v7, "length"))
    {
      if ([v7 length])
      {
        uint64_t v9 = [v6 copy];
        title = v8->_title;
        v8->_title = (NSString *)v9;
      }
      else
      {
        title = v8->_title;
        v8->_title = 0;
      }

      if ([v7 length]) {
        v11 = v7;
      }
      else {
        v11 = v6;
      }
      uint64_t v12 = [v11 copy];
    }
    else
    {
      uint64_t v12 = WFLocalizedString(@"Notification");
    }
    body = v8->_body;
    v8->_body = (NSString *)v12;

    v14 = v8;
  }

  return v8;
}

@end