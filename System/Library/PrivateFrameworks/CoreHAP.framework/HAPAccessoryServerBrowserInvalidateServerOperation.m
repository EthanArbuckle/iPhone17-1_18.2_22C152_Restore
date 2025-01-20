@interface HAPAccessoryServerBrowserInvalidateServerOperation
- (HAPAccessoryServerBrowserInvalidateServerOperation)initWithServer:(id)a3;
- (HAPAccessoryServerIP)server;
- (void)main;
- (void)setServer:(id)a3;
@end

@implementation HAPAccessoryServerBrowserInvalidateServerOperation

- (void).cxx_destruct
{
}

- (void)setServer:(id)a3
{
}

- (HAPAccessoryServerIP)server
{
  return self->_server;
}

- (void)main
{
  v3 = [(HAPAccessoryServerBrowserInvalidateServerOperation *)self server];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HAPAccessoryServerBrowserInvalidateServerOperation_main__block_invoke;
  v4[3] = &unk_1E69F4330;
  v4[4] = self;
  [v3 invalidateWithCompletionHandler:v4];
}

uint64_t __58__HAPAccessoryServerBrowserInvalidateServerOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (HAPAccessoryServerBrowserInvalidateServerOperation)initWithServer:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerBrowserInvalidateServerOperation;
  v7 = [(HAP2AsynchronousOperation *)&v9 initWithName:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_server, a3);
  }

  return v7;
}

@end