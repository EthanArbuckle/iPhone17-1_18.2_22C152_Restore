@interface MCMResultPromise
- (BOOL)complete;
- (MCMResult)result;
- (MCMResultPromise)init;
- (MCMResultPromise)initWithCompletion:(id)a3;
- (id)completion;
- (void)completeWithResult:(id)a3;
@end

@implementation MCMResultPromise

- (MCMResultPromise)initWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMResultPromise;
  v5 = [(MCMResultPromise *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v7 = v5->_result;
    v5->_result = 0;

    uint64_t v8 = MEMORY[0x1D9479020](v4);
    id completion = v6->_completion;
    v6->_id completion = (id)v8;

    v6->_complete = 0;
  }

  return v6;
}

- (BOOL)complete
{
  return self->_complete;
}

- (MCMResult)result
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_result;
  if (!v3)
  {
    _os_crash();
    __break(1u);
  }
  id v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void)completeWithResult:(id)a3
{
  id v10 = a3;
  v5 = self;
  objc_sync_enter(v5);
  p_result = &v5->_result;
  objc_storeStrong((id *)&v5->_result, a3);
  v5->_complete = 1;
  v7 = [(MCMResultPromise *)v5 completion];
  objc_sync_exit(v5);

  if (v7)
  {
    uint64_t v8 = v7[2](v7, *p_result);
    v9 = (void *)*p_result;
    void *p_result = v8;
  }
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (MCMResultPromise)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MCMResultPromise;
  v2 = [(MCMResultPromise *)&v7 init];
  v3 = v2;
  if (v2)
  {
    id v4 = v2->_result;
    v2->_result = 0;

    id completion = v3->_completion;
    v3->_id completion = 0;

    v3->_complete = 0;
  }
  return v3;
}

@end