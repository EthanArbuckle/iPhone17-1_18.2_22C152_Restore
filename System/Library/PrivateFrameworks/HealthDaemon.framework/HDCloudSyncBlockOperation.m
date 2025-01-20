@interface HDCloudSyncBlockOperation
- (HDCloudSyncBlockOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 block:(id)a5;
- (HDCloudSyncBlockOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 synchronousBlock:(id)a5;
- (void)main;
- (void)skip;
@end

@implementation HDCloudSyncBlockOperation

- (HDCloudSyncBlockOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 synchronousBlock:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__HDCloudSyncBlockOperation_initWithConfiguration_cloudState_synchronousBlock___block_invoke;
  v12[3] = &unk_1E6305318;
  id v13 = v8;
  id v9 = v8;
  v10 = [(HDCloudSyncBlockOperation *)self initWithConfiguration:a3 cloudState:a4 block:v12];

  return v10;
}

void __79__HDCloudSyncBlockOperation_initWithConfiguration_cloudState_synchronousBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = 0;
  v3 = *(uint64_t (**)(uint64_t, id, id *))(v2 + 16);
  id v4 = a2;
  uint64_t v5 = v3(v2, v4, &v7);
  id v6 = v7;
  [v4 finishWithSuccess:v5 error:v6];
}

- (HDCloudSyncBlockOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 block:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncBlockOperation;
  id v9 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id block = v9->_block;
    v9->_id block = (id)v10;
  }
  return v9;
}

- (void)main
{
  (*((void (**)(void))self->_block + 2))();
  id block = self->_block;
  self->_id block = 0;
}

- (void)skip
{
  id block = self->_block;
  self->_id block = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncBlockOperation;
  [(HDCloudSyncOperation *)&v4 skip];
}

- (void).cxx_destruct
{
}

@end