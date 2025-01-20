@interface NotificationSender
- (NSDictionary)userInfo;
- (NSString)name;
- (NotificationSender)initWithName:(id)a3;
- (void)dealloc;
- (void)setUserInfo:(id)a3;
@end

@implementation NotificationSender

- (NotificationSender)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NotificationSender;
  v6 = [(NotificationSender *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    userInfo = v7->_userInfo;
    v7->_userInfo = 0;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(NotificationSender *)self name];
  v4 = [(NotificationSender *)self userInfo];
  notifyClientsOfEvent(v3, v4);

  v5.receiver = self;
  v5.super_class = (Class)NotificationSender;
  [(NotificationSender *)&v5 dealloc];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end