@interface DDRVInteractionDelegate
- (DDRVInteractionDelegate)initWithItem:(id)a3;
- (void)actionDidFinish:(id)a3;
- (void)actionWillStart:(id)a3;
@end

@implementation DDRVInteractionDelegate

- (DDRVInteractionDelegate)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRVInteractionDelegate;
  v6 = [(DDRVInteractionDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (void)actionWillStart:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"kDDRVInteractionWillStartNotification" object:self->_item];
}

- (void)actionDidFinish:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"kDDRVInteractionDidFinishNotification" object:self->_item];
}

- (void).cxx_destruct
{
}

@end