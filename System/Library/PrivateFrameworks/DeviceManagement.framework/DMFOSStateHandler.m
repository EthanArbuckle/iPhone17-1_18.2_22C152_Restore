@interface DMFOSStateHandler
- (DMFOSStateHandler)initWithQueue:(id)a3 name:(id)a4 stateHandlerBlock:(id)a5;
- (NSString)name;
- (OS_os_transaction)transaction;
- (id)block;
- (os_state_data_s)_serializeState;
- (unint64_t)handle;
- (void)_serializeState;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setHandle:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMFOSStateHandler

- (DMFOSStateHandler)initWithQueue:(id)a3 name:(id)a4 stateHandlerBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DMFOSStateHandler;
  v11 = [(DMFOSStateHandler *)&v20 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x1C188B2F0](v10);
    id block = v11->_block;
    v11->_id block = (id)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    objc_initWeak(&location, v11);
    objc_copyWeak(&v18, &location);
    id v17 = v8;
    v11->_handle = os_state_add_handler();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

uint64_t __58__DMFOSStateHandler_initWithQueue_name_stateHandlerBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) == 2)
  {
    v5 = (void *)os_transaction_create();
    v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__DMFOSStateHandler_initWithQueue_name_stateHandlerBlock___block_invoke_2;
    block[3] = &unk_1E63722B0;
    id v11 = v5;
    id v7 = v5;
    dispatch_async(v6, block);
    uint64_t v8 = [WeakRetained _serializeState];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (os_state_data_s)_serializeState
{
  v3 = [(DMFOSStateHandler *)self block];
  v4 = v3[2]();

  id v12 = 0;
  v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v12];
  id v6 = v12;
  if (v5)
  {
    uint64_t v7 = [v5 length];
    if ((unint64_t)(v7 + 200) < 0x8000)
    {
      uint64_t v9 = v7;
      uint64_t v8 = (os_state_data_s *)malloc_type_calloc(1uLL, v7 + 200, 0xED55C9D0uLL);
      v8->var0 = 1;
      v8->var1.var1 = v9;
      id v10 = [(DMFOSStateHandler *)self name];
      [v10 getCString:v8->var3 maxLength:64 encoding:4];

      [v5 getBytes:v8->var4 length:v9];
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DMFOSStateHandler _serializeState](self);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    [(DMFOSStateHandler *)self _serializeState];
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)DMFOSStateHandler;
  [(DMFOSStateHandler *)&v3 dealloc];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)_serializeState
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 name];
  int v2 = 138543362;
  objc_super v3 = v1;
  _os_log_error_impl(&dword_1BE0E2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can't encode os_state data '%{public}@', too large", (uint8_t *)&v2, 0xCu);
}

@end