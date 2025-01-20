@interface SYStateProvider
+ (id)stateProviderWithName:(id)a3 type:(unsigned int)a4 typeName:(id)a5;
- (SYStateProvider)init;
- (SYStateProvider)initWithName:(id)a3 type:(unsigned int)a4 typeName:(id)a5;
- (id)_encodedState;
- (id)encoder;
- (void)dealloc;
- (void)setEncoder:(id)a3;
- (void)updateState:(id)a3;
@end

@implementation SYStateProvider

+ (id)stateProviderWithName:(id)a3 type:(unsigned int)a4 typeName:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&__provider_table_lock);
  v9 = (void *)__provider_table;
  if (!__provider_table)
  {
    uint64_t v10 = objc_opt_new();
    v11 = (void *)__provider_table;
    __provider_table = v10;

    v9 = (void *)__provider_table;
  }
  v12 = [v9 objectForKeyedSubscript:v7];
  if (!v12)
  {
    v12 = [[SYStateProvider alloc] initWithName:v7 type:v6 typeName:v8];
    [(id)__provider_table setObject:v12 forKeyedSubscript:v7];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__provider_table_lock);

  return v12;
}

- (SYStateProvider)init
{
  return 0;
}

- (SYStateProvider)initWithName:(id)a3 type:(unsigned int)a4 typeName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SYStateProvider;
  uint64_t v10 = [(SYStateProvider *)&v23 init];
  if (v10)
  {
    v11 = (void *)[v8 copy];
    v12 = (void *)[v9 copy];
    v10->_type = a4;
    v10->_lock._os_unfair_lock_opaque = 0;
    [(SYStateProvider *)v10 setEncoder:0];
    objc_initWeak(&location, v10);
    v13 = dispatch_get_global_queue(0, 0);
    objc_copyWeak(&v20, &location);
    unsigned int v21 = a4;
    id v18 = v9;
    v19 = v11;
    id v14 = v11;
    id v15 = v12;
    v10->_handle = os_state_add_handler();

    v16 = v10;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

char *__46__SYStateProvider_initWithName_type_typeName___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4B1560]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained _encodedState];
  }
  else
  {
    v5 = 0;
  }
  uint64_t v6 = (char *)malloc_type_malloc([v5 length] + 200, 0xD0FC354AuLL);
  *(_DWORD *)uint64_t v6 = *(_DWORD *)(a1 + 64);
  if (*(void *)(a1 + 32))
  {
    __strlcpy_chk();
    [*(id *)(a1 + 40) UTF8String];
    __strlcpy_chk();
  }
  else
  {
    v6[8] = 0;
    v6[72] = 0;
  }
  [*(id *)(a1 + 48) UTF8String];
  __strlcpy_chk();
  *((_DWORD *)v6 + 1) = [v5 length];
  objc_msgSend(v5, "getBytes:length:", v6 + 200, objc_msgSend(v5, "length"));

  return v6;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)SYStateProvider;
  [(SYStateProvider *)&v3 dealloc];
}

- (void)updateState:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id state = self->_state;
  self->_id state = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setEncoder:(id)a3
{
  if (a3)
  {
    id v4 = (void *)[a3 copy];
    id encoder = self->_encoder;
    self->_id encoder = v4;
    MEMORY[0x270F9A758](v4, encoder);
  }
  else
  {
    unsigned int type = self->_type;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__SYStateProvider_setEncoder___block_invoke;
    v9[3] = &__block_descriptor_36_e16___NSData_16__0_8l;
    unsigned int v10 = type;
    id v7 = (void *)MEMORY[0x21D4B17C0](v9, a2);
    id v8 = self->_encoder;
    self->_id encoder = v7;
  }
}

id __30__SYStateProvider_setEncoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  int v5 = *(_DWORD *)(a1 + 32);
  switch(v5)
  {
    case 3:
      id v14 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v14;
      }
      else {
        id v6 = 0;
      }

      break;
    case 2:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 data];
      }
      else {
      id v6 = [@"<object is not a protobuf object>" dataUsingEncoding:4];
      }
      break;
    case 1:
      id v16 = 0;
      id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:&v16];
      if (!v6)
      {
        id v7 = (objc_class *)NSString;
        id v8 = v16;
        id v9 = [v7 alloc];
        unsigned int v10 = [v8 localizedDescription];
        v11 = [v8 domain];
        uint64_t v12 = [v8 code];

        v13 = (void *)[v9 initWithFormat:@"<object does not support property list serialization : %@ (%@ / %ld)>", v10, v11, v12];
        id v6 = [v13 dataUsingEncoding:4];
      }
      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)_encodedState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    int v5 = (*((void (**)(void))self->_encoder + 2))();
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)encoder
{
  return self->_encoder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_encoder, 0);
  objc_storeStrong(&self->_state, 0);
}

@end