@interface CPDistributedMessagingAsyncOperation
- (CPDistributedMessagingAsyncOperation)initWithCenter:(id)a3 messageName:(id)a4 userInfoData:(id)a5 oolKey:(id)a6 oolData:(id)a7 target:(id)a8 selector:(SEL)a9 context:(void *)a10 makeServer:(BOOL)a11;
- (void)_performCallout;
- (void)_releaseSendingData;
- (void)dealloc;
- (void)main;
@end

@implementation CPDistributedMessagingAsyncOperation

- (CPDistributedMessagingAsyncOperation)initWithCenter:(id)a3 messageName:(id)a4 userInfoData:(id)a5 oolKey:(id)a6 oolData:(id)a7 target:(id)a8 selector:(SEL)a9 context:(void *)a10 makeServer:(BOOL)a11
{
  v20.receiver = self;
  v20.super_class = (Class)CPDistributedMessagingAsyncOperation;
  v17 = [(CPDistributedMessagingAsyncOperation *)&v20 init];
  if (v17)
  {
    v17->_center = (CPDistributedMessagingCenter *)a3;
    v17->_name = (NSString *)[a4 copy];
    v17->_userInfoData = (NSData *)[a5 copy];
    v17->_oolKey = (NSString *)[a6 copy];
    v17->_oolData = (NSData *)a7;
    v17->_target = a8;
    if (a9) {
      SEL v18 = a9;
    }
    else {
      SEL v18 = 0;
    }
    v17->_selector = v18;
    v17->_context = a10;
    v17->_calloutThread = (NSThread *)(id)[MEMORY[0x1E4F29060] currentThread];
    v17->_makeServer = a11;
  }
  return v17;
}

- (void)dealloc
{
  [(CPDistributedMessagingAsyncOperation *)self _releaseSendingData];

  v3.receiver = self;
  v3.super_class = (Class)CPDistributedMessagingAsyncOperation;
  [(CPDistributedMessagingAsyncOperation *)&v3 dealloc];
}

- (void)_releaseSendingData
{
  userInfoData = self->_userInfoData;
  if (userInfoData)
  {

    self->_userInfoData = 0;
  }
  oolKey = self->_oolKey;
  if (oolKey)
  {

    self->_oolKey = 0;
  }
  oolData = self->_oolData;
  if (oolData)
  {

    self->_oolData = 0;
  }
}

- (void)main
{
  p_reply = &self->_reply;
  p_error = &self->_error;
  LOBYTE(v8) = 0;
  [(CPDistributedMessagingCenter *)self->_center _sendMessage:self->_name userInfoData:self->_userInfoData oolKey:self->_oolKey oolData:self->_oolData makeServer:self->_makeServer receiveReply:&self->_reply nonBlocking:v8 error:&self->_error];
  if (*p_reply) {
    v5 = *p_reply;
  }
  if (*p_error) {
    v6 = *p_error;
  }
  [(CPDistributedMessagingAsyncOperation *)self _releaseSendingData];
  calloutThread = self->_calloutThread;
  [(CPDistributedMessagingAsyncOperation *)self performSelector:sel__performCallout onThread:calloutThread withObject:0 waitUntilDone:0];
}

- (void)_performCallout
{
  id target = self->_target;
  selector = self->_selector;
  if (selector) {
    objc_msgSend(target, selector, self->_center, self->_reply, self->_error, self->_context);
  }
  else {
    objc_msgSend(target, 0, self->_center, self->_reply, self->_error, self->_context);
  }
}

@end