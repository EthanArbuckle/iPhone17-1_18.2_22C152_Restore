@interface IMItemChatContext
- (IMHandle)otherHandle;
- (IMHandle)senderHandle;
- (void)dealloc;
- (void)setOtherHandle:(id)a3;
- (void)setSenderHandle:(id)a3;
@end

@implementation IMItemChatContext

- (IMHandle)senderHandle
{
  return self->_senderHandle;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (void)setOtherHandle:(id)a3
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMItemChatContext;
  [(IMItemChatContext *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherHandle, 0);

  objc_storeStrong((id *)&self->_senderHandle, 0);
}

@end