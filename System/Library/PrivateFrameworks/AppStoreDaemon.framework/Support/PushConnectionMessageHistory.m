@interface PushConnectionMessageHistory
- (void)dealloc;
@end

@implementation PushConnectionMessageHistory

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)PushConnectionMessageHistory;
  [(PushConnectionMessageHistory *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_messageHistory, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end