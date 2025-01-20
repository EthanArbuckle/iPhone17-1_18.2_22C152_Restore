@interface DOCICloudQuotaInAppAction
- (DOCICloudQuotaInAppAction)initWithICQInAppAction:(id)a3;
- (DOCICloudQuotaInAppAction)initWithTitle:(id)a3 type:(id)a4;
- (ICQInAppAction)action;
- (NSString)title;
- (NSString)type;
- (void)performAction;
@end

@implementation DOCICloudQuotaInAppAction

- (DOCICloudQuotaInAppAction)initWithICQInAppAction:(id)a3
{
  v4 = (ICQInAppAction *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DOCICloudQuotaInAppAction;
  v5 = [(DOCICloudQuotaInAppAction *)&v13 init];
  action = v5->_action;
  v5->_action = v4;
  v7 = v4;

  uint64_t v8 = [(ICQInAppAction *)v7 title];
  title = v5->_title;
  v5->_title = (NSString *)v8;

  uint64_t v10 = [(ICQInAppAction *)v7 type];
  type = v5->_type;
  v5->_type = (NSString *)v10;

  return v5;
}

- (DOCICloudQuotaInAppAction)initWithTitle:(id)a3 type:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)DOCICloudQuotaInAppAction;
  uint64_t v8 = [(DOCICloudQuotaInAppAction *)&v13 init];
  title = v8->_title;
  v8->_title = v6;
  uint64_t v10 = v6;

  type = v8->_type;
  v8->_type = v7;

  return v8;
}

- (void)performAction
{
  id v2 = [(DOCICloudQuotaInAppAction *)self action];
  [v2 performActionWithContext:MEMORY[0x263EFFA78]];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)type
{
  return self->_type;
}

- (ICQInAppAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end