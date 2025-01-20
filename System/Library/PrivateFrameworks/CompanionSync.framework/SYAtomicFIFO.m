@interface SYAtomicFIFO
- (SYAtomicFIFO)init;
- (SYAtomicFIFO)initWithCapacity:(unint64_t)a3;
- (id)dequeue;
- (id)dequeueUntil:(id)a3;
- (id)head;
- (id)tail;
- (void)enqueue:(id)a3;
- (void)removeAllObjects;
@end

@implementation SYAtomicFIFO

- (SYAtomicFIFO)init
{
  return [(SYAtomicFIFO *)self initWithCapacity:0];
}

- (SYAtomicFIFO)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SYAtomicFIFO;
  v4 = [(SYAtomicFIFO *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    store = v5->_store;
    v5->_store = (NSMutableArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)enqueue:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_store addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)dequeue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableArray *)self->_store firstObject];
  if (v4) {
    [(NSMutableArray *)self->_store removeObjectAtIndex:0];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dequeueUntil:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3010000000;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v22 = &unk_21C88AE81;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  store = self->_store;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__SYAtomicFIFO_dequeueUntil___block_invoke;
  v9[3] = &unk_264422E48;
  v11 = &v19;
  id v6 = v4;
  id v10 = v6;
  v12 = &v13;
  [(NSMutableArray *)store enumerateObjectsUsingBlock:v9];
  -[NSMutableArray removeObjectsInRange:](self->_store, "removeObjectsInRange:", v20[4], v20[5]);
  os_unfair_lock_unlock(&self->_lock);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __29__SYAtomicFIFO_dequeueUntil___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  ++*(void *)(*(void *)(a1[5] + 8) + 40);
  id v8 = v7;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_store removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (id)head
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_store firstObject];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)tail
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_store lastObject];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
}

@end