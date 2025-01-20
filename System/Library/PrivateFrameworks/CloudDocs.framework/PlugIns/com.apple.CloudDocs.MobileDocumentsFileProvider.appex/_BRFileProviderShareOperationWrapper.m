@interface _BRFileProviderShareOperationWrapper
- (NSString)description;
- (_BRFileProviderShareOperationWrapper)initWithOperation:(id)a3;
- (void)progressCallbackWithTopic:(id)a3 userInfo:(id)a4;
- (void)setRemoteOperationProxy:(id)a3 userInfo:(id)a4;
@end

@implementation _BRFileProviderShareOperationWrapper

- (_BRFileProviderShareOperationWrapper)initWithOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BRFileProviderShareOperationWrapper;
  v6 = [(_BRFileProviderShareCancellableWrapper *)&v9 initWithCancellable:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrapped, a3);
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(BROperationClient *)self->_wrapped description];
}

- (void)progressCallbackWithTopic:(id)a3 userInfo:(id)a4
{
}

- (void)setRemoteOperationProxy:(id)a3 userInfo:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = [[_BRFileProviderShareCancellableWrapper alloc] initWithCancellable:v6];

  remoteOperationProxy = self->_remoteOperationProxy;
  self->_remoteOperationProxy = (BRCancellable *)v7;

  [(BROperationClient *)self->_wrapped setRemoteOperationProxy:self->_remoteOperationProxy userInfo:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteOperationProxy, 0);

  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end