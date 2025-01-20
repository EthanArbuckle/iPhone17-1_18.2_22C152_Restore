@interface CUOSStateHandler
- (CUOSStateHandler)initWithTitle:(id)a3 dispatchQueue:(id)a4 handler:(id)a5;
- (NSString)title;
- (id)handler;
- (id)simulate;
- (os_state_data_s)_generateState;
- (unint64_t)stateHandle;
- (void)dealloc;
- (void)remove;
- (void)setHandler:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation CUOSStateHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (os_state_data_s)_generateState
{
  v3 = (void *)MEMORY[0x1E4F28F98];
  v4 = (*((void (**)(void))self->_handler + 2))();
  v5 = [v3 dataWithPropertyList:v4 format:100 options:0 error:0];

  if (v5)
  {
    size_t v6 = [v5 length];
    v7 = (os_state_data_s *)malloc_type_calloc(1uLL, v6 + 200, 0xA9196D56uLL);
    v8 = v7;
    if (v7)
    {
      v7->var0 = 1;
      v7->var1.var1 = v6;
      [(NSString *)self->_title UTF8String];
      __strlcpy_chk();
      memcpy(v8->var4, (const void *)[v5 bytes], v6);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)simulate
{
  return (id)(*((uint64_t (**)(void))self->_handler + 2))();
}

- (void)remove
{
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
}

- (void)dealloc
{
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CUOSStateHandler;
  [(CUOSStateHandler *)&v3 dealloc];
}

- (CUOSStateHandler)initWithTitle:(id)a3 dispatchQueue:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CUOSStateHandler;
  v12 = [(CUOSStateHandler *)&v19 init];
  if (v12)
  {
    v13 = _Block_copy(v11);
    id handler = v12->_handler;
    v12->_id handler = v13;

    objc_storeStrong((id *)&v12->_title, a3);
    objc_initWeak(&location, v12);
    objc_copyWeak(&v17, &location);
    v12->_stateHandle = os_state_add_handler();
    v15 = v12;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v12;
}

uint64_t __56__CUOSStateHandler_initWithTitle_dispatchQueue_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _generateState];

  return v2;
}

@end