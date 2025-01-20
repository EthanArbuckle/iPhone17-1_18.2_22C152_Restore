@interface AXIPCServerClientRegistration
- (AXIPCServerClientRegistration)initWithPort:(unsigned int)a3 identifier:(id)a4;
- (AXIPCServerClientRegistrationDelegate)delegate;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (OS_dispatch_source)invalidationSource;
- (unint64_t)hash;
- (unsigned)port;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation AXIPCServerClientRegistration

- (AXIPCServerClientRegistration)initWithPort:(unsigned int)a3 identifier:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AXIPCServerClientRegistration;
  id v7 = [(AXIPCServerClientRegistration *)&v20 init];
  if (v7)
  {
    AXIncrefSendRight(a3);
    *((_DWORD *)v7 + 2) = a3;
    uint64_t v8 = [v6 copy];
    v9 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v8;

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14460], a3, 1uLL, MEMORY[0x1E4F14428]);
    v11 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v10;

    objc_initWeak(&location, v7);
    v12 = *((void *)v7 + 3);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke;
    handler[3] = &unk_1E5586A10;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v12, handler);
    v13 = *((void *)v7 + 3);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke_2;
    v15[3] = &__block_descriptor_36_e5_v8__0l;
    unsigned int v16 = a3;
    dispatch_source_set_cancel_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v7 + 3));
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (AXIPCServerClientRegistration *)v7;
}

void __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 serverClientRegistrationInvalidated:v3];
}

uint64_t __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke_2(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 32);
  if (v1)
  {
    result = mach_port_deallocate(*MEMORY[0x1E4F14960], v1);
    if (result) {
      return _AXAssert();
    }
  }
  return result;
}

- (void)dealloc
{
  invalidationSource = self->_invalidationSource;
  if (invalidationSource)
  {
    dispatch_source_cancel(invalidationSource);
    v4 = self->_invalidationSource;
    self->_invalidationSource = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AXIPCServerClientRegistration;
  [(AXIPCServerClientRegistration *)&v5 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [(AXIPCServerClientRegistration *)self port];
    BOOL v6 = v5 == [v4 port];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(AXIPCServerClientRegistration *)self port];
}

- (unsigned)port
{
  return self->_port;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_source)invalidationSource
{
  return self->_invalidationSource;
}

- (AXIPCServerClientRegistrationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXIPCServerClientRegistrationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invalidationSource, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end