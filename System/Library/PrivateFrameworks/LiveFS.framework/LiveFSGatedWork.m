@interface LiveFSGatedWork
- (LiveFSGatedWork)initWithCount:(int64_t)a3 workBlock:(id)a4;
- (NSObject)parameter;
- (id)workBlock;
- (int64_t)neededCount;
- (void)abort;
- (void)approve;
- (void)setNeededCount:(int64_t)a3;
- (void)setParameter:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation LiveFSGatedWork

- (LiveFSGatedWork)initWithCount:(int64_t)a3 workBlock:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LiveFSGatedWork;
  v7 = [(LiveFSGatedWork *)&v11 init];
  if (v7)
  {
    v8 = _Block_copy(v6);
    id workBlock = v7->_workBlock;
    v7->_id workBlock = v8;

    v7->_neededCount = a3;
  }

  return v7;
}

- (void)approve
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_neededCount - 1;
  v2->_neededCount = v3;
  if (v3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = _Block_copy(v2->_workBlock);
    id workBlock = v2->_workBlock;
    v2->_id workBlock = 0;
  }
  objc_sync_exit(v2);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(void *, LiveFSGatedWork *))v6 + 2))(v6, v2);
    v5 = v6;
  }
}

- (void)abort
{
  obj = self;
  objc_sync_enter(obj);
  id workBlock = obj->_workBlock;
  obj->_id workBlock = 0;

  objc_sync_exit(obj);
}

- (int64_t)neededCount
{
  return self->_neededCount;
}

- (void)setNeededCount:(int64_t)a3
{
  self->_neededCount = a3;
}

- (NSObject)parameter
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setParameter:(id)a3
{
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_workBlock, 0);

  objc_storeStrong((id *)&self->_parameter, 0);
}

@end