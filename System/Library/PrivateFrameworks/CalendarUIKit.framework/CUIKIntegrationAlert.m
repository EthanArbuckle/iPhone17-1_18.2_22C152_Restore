@interface CUIKIntegrationAlert
- (CUIKIntegrationAlert)initWithTitle:(id)a3 message:(id)a4 actions:(id)a5 cancelBlock:(id)a6;
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (void)cancel;
@end

@implementation CUIKIntegrationAlert

- (CUIKIntegrationAlert)initWithTitle:(id)a3 message:(id)a4 actions:(id)a5 cancelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CUIKIntegrationAlert;
  v15 = [(CUIKIntegrationAlert *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_message, a4);
    objc_storeStrong((id *)&v16->_actions, a5);
    v17 = _Block_copy(v14);
    id cancelBlock = v16->_cancelBlock;
    v16->_id cancelBlock = v17;
  }
  return v16;
}

- (void)cancel
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_cancelBlock, 0);
}

@end