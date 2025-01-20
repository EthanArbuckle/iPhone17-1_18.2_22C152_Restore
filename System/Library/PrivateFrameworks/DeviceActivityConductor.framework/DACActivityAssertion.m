@interface DACActivityAssertion
- (BOOL)isEqual:(id)a3;
- (DACActivityDescriptor)activity;
- (DACActivityDescriptor)origin;
- (DACChangeMarker)changeMarker;
- (id)_initWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5 relinquishHandler:(id)a6;
- (id)description;
- (id)invalidationHandler;
- (id)relinquishHandler;
- (unint64_t)hash;
- (unint64_t)state;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)setInvalidationHandler:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation DACActivityAssertion

- (id)_initWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5 relinquishHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)DACActivityAssertion;
  v15 = [(DACActivityAssertion *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_activity, a3);
    objc_storeStrong((id *)&v16->_origin, a4);
    id invalidationHandler = v16->_invalidationHandler;
    v16->_id invalidationHandler = 0;

    v16->_state = 0;
    uint64_t v18 = [v14 copy];
    id relinquishHandler = v16->_relinquishHandler;
    v16->_id relinquishHandler = (id)v18;

    p_changeMarker = (void **)&v16->_changeMarker;
    objc_storeStrong((id *)&v16->_changeMarker, a5);
    if (!v16->_changeMarker)
    {
      v21 = objc_alloc_init(DACChangeMarker);
      v22 = *p_changeMarker;
      *p_changeMarker = v21;
    }
  }

  return v16;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(DACActivityAssertion *)self state] != 2)
  {
    v3 = DACLogForCategory(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_2330F4000, v3, OS_LOG_TYPE_DEFAULT, "%p relinquishing", buf, 0xCu);
    }

    v4 = [(DACActivityAssertion *)self relinquishHandler];
    v5 = [(DACActivityAssertion *)self activity];
    v6 = [(DACActivityAssertion *)self origin];
    ((void (**)(void, void *, void *))v4)[2](v4, v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)DACActivityAssertion;
  [(DACActivityAssertion *)&v7 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(DACActivityAssertion *)self state];
  objc_super v7 = [(DACActivityAssertion *)self changeMarker];
  v8 = [(DACActivityAssertion *)self activity];
  v9 = [v3 stringWithFormat:@"<%@: %p, s(%lu) cm(%@) %@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v7 = (DACActivityAssertion *)a3;
  v8 = v7;
  if (v7)
  {
    if (self == v7)
    {
      LOBYTE(self) = 1;
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      if (!self)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v10 = [(DACActivityAssertion *)self activity];
      id v11 = [(DACActivityAssertion *)v9 activity];
      if (![v10 isEqual:v11])
      {
        LOBYTE(self) = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v12 = [(DACActivityAssertion *)self origin];
      if (v12
        || ([(DACActivityAssertion *)v9 origin], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v4 = [(DACActivityAssertion *)self origin];
        v5 = [(DACActivityAssertion *)v9 origin];
        if (([v4 isEqual:v5] & 1) == 0)
        {

          LOBYTE(self) = 0;
          goto LABEL_20;
        }
        int v18 = 1;
      }
      else
      {
        int v18 = 0;
      }
      unint64_t v13 = [(DACActivityAssertion *)self state];
      if (v13 == [(DACActivityAssertion *)v9 state])
      {
        id v14 = [(DACActivityAssertion *)self changeMarker];
        [(DACActivityAssertion *)v9 changeMarker];
        v15 = v17 = v3;
        LOBYTE(self) = [v14 isEqual:v15];

        v3 = v17;
        if (!v18) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      LOBYTE(self) = 0;
      if (v18)
      {
LABEL_19:
      }
LABEL_20:
      if (!v12) {

      }
      goto LABEL_23;
    }
  }
  LOBYTE(self) = 0;
LABEL_25:

  return (char)self;
}

- (unint64_t)hash
{
  v2 = [(DACActivityAssertion *)self activity];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (DACActivityDescriptor)origin
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__DACActivityAssertion_origin__block_invoke;
  v4[3] = &unk_264BDC9B8;
  v4[4] = self;
  v4[5] = &v5;
  [(DACActivityAssertion *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (DACActivityDescriptor *)v2;
}

uint64_t __30__DACActivityAssertion_origin__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (void)setOrigin:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__DACActivityAssertion_setOrigin___block_invoke;
  v6[3] = &unk_264BDC9E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DACActivityAssertion *)self _withLock:v6];
}

uint64_t __34__DACActivityAssertion_setOrigin___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (id)invalidationHandler
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__DACActivityAssertion_invalidationHandler__block_invoke;
  v4[3] = &unk_264BDC9B8;
  v4[4] = self;
  v4[5] = &v5;
  [(DACActivityAssertion *)self _withLock:v4];
  id v2 = (void *)MEMORY[0x237DB7D70](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __43__DACActivityAssertion_invalidationHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x270F9A758]();
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DACActivityAssertion_setInvalidationHandler___block_invoke;
  v6[3] = &unk_264BDCA08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DACActivityAssertion *)self _withLock:v6];
}

uint64_t __47__DACActivityAssertion_setInvalidationHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)state
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__DACActivityAssertion_state__block_invoke;
  v4[3] = &unk_264BDC9B8;
  v4[4] = self;
  v4[5] = &v5;
  [(DACActivityAssertion *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__DACActivityAssertion_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__DACActivityAssertion_setState___block_invoke;
  v7[3] = &unk_264BDCA30;
  v7[5] = &v8;
  v7[6] = a3;
  v7[4] = self;
  [(DACActivityAssertion *)self _withLock:v7];
  if (*((unsigned char *)v9 + 24))
  {
    id v4 = DACLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = self;
      _os_log_impl(&dword_2330F4000, v4, OS_LOG_TYPE_DEFAULT, "%p invalidating", buf, 0xCu);
    }

    uint64_t v5 = [(DACActivityAssertion *)self invalidationHandler];
    unint64_t v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }
  }
  _Block_object_dispose(&v8, 8);
}

void __33__DACActivityAssertion_setState___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (v2 == *(void *)(v3 + 32) + 1)
  {
    *(void *)(v3 + 32) = v2;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 32) == 2;
  }
  else
  {
    id v4 = DACLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[6];
      uint64_t v7 = *(void *)(v5 + 32);
      int v8 = 134218496;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_error_impl(&dword_2330F4000, v4, OS_LOG_TYPE_ERROR, "%p invalid state change to %lu from %lu", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (DACActivityDescriptor)activity
{
  return self->_activity;
}

- (id)relinquishHandler
{
  return self->_relinquishHandler;
}

- (DACChangeMarker)changeMarker
{
  return self->_changeMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMarker, 0);
  objc_storeStrong(&self->_relinquishHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_origin, 0);
}

@end