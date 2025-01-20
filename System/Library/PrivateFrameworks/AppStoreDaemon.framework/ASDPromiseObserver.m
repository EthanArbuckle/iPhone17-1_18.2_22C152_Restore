@interface ASDPromiseObserver
- (ASDPromiseObserver)initWithValueBlock:(id)a3 errorBlock:(id)a4 scheduler:(id)a5;
- (void)notifyRejectedWithError:(id)a3;
- (void)notifyResolvedWithValue:(id)a3;
@end

@implementation ASDPromiseObserver

- (ASDPromiseObserver)initWithValueBlock:(id)a3 errorBlock:(id)a4 scheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASDPromiseObserver;
  v11 = [(ASDPromiseObserver *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id valueBlock = v11->_valueBlock;
    v11->_id valueBlock = (id)v12;

    uint64_t v14 = [v9 copy];
    id errorBlock = v11->_errorBlock;
    v11->_id errorBlock = (id)v14;

    objc_storeStrong((id *)&v11->_scheduler, a5);
  }

  return v11;
}

- (void)notifyResolvedWithValue:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__ASDPromiseObserver_notifyResolvedWithValue___block_invoke;
  v8[3] = &unk_1E58B2DF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [Property scheduleBlock:v8];
}

uint64_t __46__ASDPromiseObserver_notifyResolvedWithValue___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(void **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  v3 = (uint64_t (*)(void))Property[2];
  return v3();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_valueBlock, 0);
}

- (void)notifyRejectedWithError:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__ASDPromiseObserver_notifyRejectedWithError___block_invoke;
  v8[3] = &unk_1E58B2DF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [Property scheduleBlock:v8];
}

uint64_t __46__ASDPromiseObserver_notifyRejectedWithError___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(void **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 16, 1);
  }
  v3 = (uint64_t (*)(void))Property[2];
  return v3();
}

@end