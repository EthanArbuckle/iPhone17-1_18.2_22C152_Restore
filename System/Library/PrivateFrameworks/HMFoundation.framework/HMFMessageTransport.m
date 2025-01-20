@interface HMFMessageTransport
- (HMFMessageTransportDelegate)delegate;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HMFMessageTransport

- (void)setDelegate:(id)a3
{
}

- (HMFMessageTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFMessageTransportDelegate *)WeakRetained;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void).cxx_destruct
{
}

@end