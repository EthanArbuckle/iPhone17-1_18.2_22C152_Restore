@interface IMMessageItemChatContext
- (BOOL)invitation;
- (IMMessage)message;
- (void)dealloc;
- (void)setInvitation:(BOOL)a3;
- (void)setMessage:(id)a3;
@end

@implementation IMMessageItemChatContext

- (BOOL)invitation
{
  return self->_invitation;
}

- (IMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMMessageItemChatContext;
  [(IMItemChatContext *)&v2 dealloc];
}

- (void).cxx_destruct
{
}

- (void)setInvitation:(BOOL)a3
{
  self->_invitation = a3;
}

@end