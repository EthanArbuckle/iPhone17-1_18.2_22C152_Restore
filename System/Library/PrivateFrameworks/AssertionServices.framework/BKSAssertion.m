@interface BKSAssertion
- (BKSAssertion)init;
- (BOOL)acquire;
- (BOOL)valid;
- (NSString)name;
- (id)_acquisitionHandler;
- (id)_attributes;
- (id)_initWithName:(id)a3 handler:(id)a4;
- (id)_internalAssertion;
- (id)_lock_acquisitionHandler;
- (id)_lock_attributes;
- (id)_lock_internalAssertion;
- (id)_lock_name;
- (id)_target;
- (id)invalidationHandler;
- (unint64_t)_bksErrorForRBSAssertionError:(unint64_t)a3;
- (void)_acquireAsynchronously;
- (void)_invalidateSynchronously:(BOOL)a3;
- (void)_lock:(id)a3;
- (void)_lock_reaquireAssertion;
- (void)_lock_setAttributes:(id)a3;
- (void)_lock_setInternalAssertion:(id)a3;
- (void)_lock_setName:(id)a3;
- (void)_setAttributes:(id)a3;
- (void)_setTarget:(id)a3;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
- (void)setName:(id)a3;
@end

@implementation BKSAssertion

- (void)dealloc
{
  [(RBSAssertion *)self->_internalAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKSAssertion;
  [(BKSAssertion *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)_invalidateSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(RBSAssertion *)self->_internalAssertion removeObserver:self];
  internalAssertion = self->_internalAssertion;
  if (v3)
  {
    uint64_t v9 = 0;
    [(RBSAssertion *)internalAssertion invalidateWithError:&v9];
  }
  else
  {
    [(RBSAssertion *)internalAssertion invalidate];
  }
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id acquisitionHandler = self->_acquisitionHandler;
  self->_id acquisitionHandler = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)valid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(RBSAssertion *)v2->_internalAssertion isValid];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)acquire
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_internalAssertion)
  {
    v5 = (void (**)(void, void, void))MEMORY[0x1BA997230](self->_acquisitionHandler);
    id acquisitionHandler = self->_acquisitionHandler;
    self->_id acquisitionHandler = 0;

    v7 = (RBSAssertion *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:self->_name target:self->_target attributes:self->_attributes];
    internalAssertion = self->_internalAssertion;
    self->_internalAssertion = v7;

    [(RBSAssertion *)self->_internalAssertion addObserver:self];
    uint64_t v9 = self->_internalAssertion;
    id v16 = 0;
    uint64_t v4 = [(RBSAssertion *)v9 acquireWithError:&v16];
    id v10 = v16;
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v12 = -[BKSAssertion _bksErrorForRBSAssertionError:](self, "_bksErrorForRBSAssertionError:", [v10 code]);
      v13 = [v10 userInfo];
      v14 = [v11 errorWithDomain:@"BKSAssertionError" code:v12 userInfo:v13];

      if (!v5)
      {
LABEL_6:

        return v4;
      }
    }
    else
    {
      v14 = 0;
      if (!v5) {
        goto LABEL_6;
      }
    }
    ((void (**)(void, uint64_t, void *))v5)[2](v5, v4, v14);
    goto LABEL_6;
  }
  os_unfair_lock_unlock(p_lock);
  LOBYTE(v4) = 1;
  return v4;
}

- (void)_setTarget:(id)a3
{
  uint64_t v4 = (RBSTarget *)a3;
  os_unfair_lock_lock(&self->_lock);
  target = self->_target;
  self->_target = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setAttributes:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(BKSAssertion *)self _lock_setAttributes:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setAttributes:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v9 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:0];
  v6 = [v5 arrayByAddingObject:v9];

  v7 = (NSMutableArray *)[v6 copy];
  attributes = self->_attributes;
  self->_attributes = v7;
}

- (id)_initWithName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKSAssertion;
  v8 = [(BKSAssertion *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    id acquisitionHandler = v9->_acquisitionHandler;
    v9->_id acquisitionHandler = (id)v12;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_acquisitionHandler, 0);
  objc_storeStrong((id *)&self->_internalAssertion, 0);
}

- (void)_acquireAsynchronously
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__BKSAssertion__acquireAsynchronously__block_invoke;
  v2[3] = &unk_1E60C6528;
  v2[4] = self;
  [MEMORY[0x1E4F964A0] performBackgroundWork:v2];
}

uint64_t __38__BKSAssertion__acquireAsynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) acquire];
}

- (void)setInvalidationHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)[v5 copy];

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)_bksErrorForRBSAssertionError:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return qword_1B50BEA20[a3 - 1];
  }
}

- (BKSAssertion)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BKSAssertion.m" lineNumber:38 description:@"Don't instantiate instances of this abstract base class"];

  return 0;
}

- (id)invalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)MEMORY[0x1BA997230](self->_invalidationHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x1BA997230](v4);

  return v5;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSString *)self->_name copy];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (NSString *)[v5 copy];

  name = self->_name;
  self->_name = v6;

  [(BKSAssertion *)self _lock_reaquireAssertion];
  os_unfair_lock_unlock(p_lock);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = MEMORY[0x1BA997230](self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  os_unfair_lock_unlock(p_lock);
  id v7 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    id v7 = (void *)v8;
  }
}

- (id)_target
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_target;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_attributes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_attributes copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_internalAssertion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_internalAssertion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_acquisitionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)MEMORY[0x1BA997230](self->_acquisitionHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x1BA997230](v4);

  return v5;
}

- (void)_lock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_reaquireAssertion
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:self->_name target:self->_target attributes:self->_attributes];
  [v3 addObserver:self];
  [v3 acquireWithError:0];
  [(RBSAssertion *)self->_internalAssertion removeObserver:self];
  [(RBSAssertion *)self->_internalAssertion invalidate];
  internalAssertion = self->_internalAssertion;
  self->_internalAssertion = (RBSAssertion *)v3;
}

- (id)_lock_name
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = (void *)[(NSString *)self->_name copy];
  return v3;
}

- (void)_lock_setName:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = (NSString *)[v5 copy];

  name = self->_name;
  self->_name = v6;
}

- (id)_lock_internalAssertion
{
  os_unfair_lock_assert_owner(&self->_lock);
  internalAssertion = self->_internalAssertion;
  return internalAssertion;
}

- (void)_lock_setInternalAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_internalAssertion)
  {
    id v5 = (void *)MEMORY[0x1E4F964A0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__BKSAssertion__lock_setInternalAssertion___block_invoke;
    v8[3] = &unk_1E60C6528;
    id v9 = v4;
    id v6 = v4;
    [v5 performBackgroundWork:v8];
  }
  else
  {
    self->_internalAssertion = (RBSAssertion *)v4;
    id v7 = v4;

    [(RBSAssertion *)self->_internalAssertion addObserver:self];
  }
}

uint64_t __43__BKSAssertion__lock_setInternalAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)_lock_acquisitionHandler
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = (void *)[self->_acquisitionHandler copy];
  id acquisitionHandler = self->_acquisitionHandler;
  self->_id acquisitionHandler = 0;

  id v5 = (void *)MEMORY[0x1BA997230](v3);
  return v5;
}

- (id)_lock_attributes
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = (void *)[(NSMutableArray *)self->_attributes copy];
  return v3;
}

@end