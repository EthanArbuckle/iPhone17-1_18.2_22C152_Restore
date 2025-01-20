@interface _MFMFMailboxMessageBodyProcessorLoaderClient
- (BOOL)wantsContentsOfType:(int64_t)a3;
- (EFFuture)future;
- (MFMailMessage)message;
- (_MFMFMailboxMessageBodyProcessorLoaderClient)initWithMessage:(id)a3;
- (double)ordering;
- (int64_t)priority;
- (void)notifyFullMessageContentsAvailableForMessage:(id)a3;
- (void)notifyFullMessageContentsUnavailableForMessage:(id)a3 error:(id)a4;
@end

@implementation _MFMFMailboxMessageBodyProcessorLoaderClient

- (_MFMFMailboxMessageBodyProcessorLoaderClient)initWithMessage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MFMFMailboxMessageBodyProcessorLoaderClient;
  v6 = [(_MFMFMailboxMessageBodyProcessorLoaderClient *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v8 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    promise = v7->_promise;
    v7->_promise = v8;
  }
  return v7;
}

- (EFFuture)future
{
  return (EFFuture *)[(EFPromise *)self->_promise future];
}

- (int64_t)priority
{
  return -100;
}

- (double)ordering
{
  v3 = [(_MFMFMailboxMessageBodyProcessorLoaderClient *)self message];
  v4 = [v3 headersIfAvailable];

  if (!v4) {
    return 0.0;
  }
  id v5 = [(_MFMFMailboxMessageBodyProcessorLoaderClient *)self message];
  [v5 dateReceivedAsTimeIntervalSince1970];
  double v7 = v6;

  return v7;
}

- (BOOL)wantsContentsOfType:(int64_t)a3
{
  return a3 == 1;
}

- (void)notifyFullMessageContentsUnavailableForMessage:(id)a3 error:(id)a4
{
}

- (void)notifyFullMessageContentsAvailableForMessage:(id)a3
{
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_promise, 0);
}

@end