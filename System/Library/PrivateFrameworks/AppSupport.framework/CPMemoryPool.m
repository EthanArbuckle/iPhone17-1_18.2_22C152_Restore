@interface CPMemoryPool
- (CPMemoryPool)initWithLabel:(const char *)a3 slotLength:(unint64_t)a4;
- (id)nextSlotWithBytes:(const void *)a3 length:(unint64_t)a4;
- (unint64_t)slotLength;
- (void)dealloc;
@end

@implementation CPMemoryPool

- (CPMemoryPool)initWithLabel:(const char *)a3 slotLength:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CPMemoryPool;
  v6 = [(CPMemoryPool *)&v10 init];
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_lock, 0);
    v7->_files = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3) {
      v8 = a3;
    }
    else {
      v8 = "memorypool";
    }
    v7->_label = strdup(v8);
    v7->_slotLength = a4;
  }
  return v7;
}

- (id)nextSlotWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  files = self->_files;
  uint64_t v9 = [(NSMutableArray *)files countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(files);
        }
        uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) nextSlotWithBytes:a3 length:a4];
        if (v13)
        {
          id v15 = (id)v13;
          goto LABEL_14;
        }
      }
      uint64_t v10 = [(NSMutableArray *)files countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v14 = [[CPMemoryPoolFile alloc] initWithLabel:self->_label slotCount:128 slotLength:self->_slotLength];
  if (v14)
  {
    [(NSMutableArray *)self->_files addObject:v14];
    id v15 = [(CPMemoryPoolFile *)v14 nextSlotWithBytes:a3 length:a4];
  }
  else
  {
    id v15 = 0;
  }

LABEL_14:
  pthread_mutex_unlock(p_lock);
  return v15;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);

  free(self->_label);
  v3.receiver = self;
  v3.super_class = (Class)CPMemoryPool;
  [(CPMemoryPool *)&v3 dealloc];
}

- (unint64_t)slotLength
{
  return self->_slotLength;
}

@end