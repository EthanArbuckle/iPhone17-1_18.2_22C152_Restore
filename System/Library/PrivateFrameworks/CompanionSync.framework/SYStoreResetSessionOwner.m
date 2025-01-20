@interface SYStoreResetSessionOwner
- (BOOL)isResetSync;
- (SYStoreResetSessionOwner)init;
- (id)fetchNextBatch;
- (unsigned)_sendBufferedChanges:(id)a3;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)setFetchNextBatch:(id)a3;
@end

@implementation SYStoreResetSessionOwner

- (SYStoreResetSessionOwner)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYStoreResetSessionOwner;
  v2 = [(SYStoreResetSessionOwner *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isResetSync
{
  return 1;
}

- (unsigned)_sendBufferedChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (unsigned int (**)(id, void))a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_buffer;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      uint64_t v10 = 0;
      unint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v18 + 1) + 8 * v10)))
        {
          unint64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      unint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_12:

  v12 = [(SYStoreSessionOwner *)self session];
  int v13 = [v12 state];

  if (v13 == 5)
  {
    unsigned int bufferedState = 5;
  }
  else
  {
    unint64_t v15 = [(NSMutableArray *)self->_buffer count];
    buffer = self->_buffer;
    if (v11 >= v15)
    {
      [(NSMutableArray *)buffer removeAllObjects];
      unsigned int bufferedState = self->_bufferedState;
    }
    else
    {
      -[NSMutableArray removeObjectsInRange:](buffer, "removeObjectsInRange:", 0, v11);
      unsigned int bufferedState = 1;
    }
  }

  return bufferedState;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t (**)(id, void *))a4;
  if ([(NSMutableArray *)self->_buffer count])
  {
    unsigned int v7 = [(SYStoreResetSessionOwner *)self _sendBufferedChanges:v6];
  }
  else
  {
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    int v9 = 3;
    switch((*((uint64_t (**)(void))self->_fetchNextBatch + 2))())
    {
      case 1:
        int v9 = 2;
        goto LABEL_6;
      case 2:
        break;
      case 3:
        int v9 = 4;
        break;
      case 4:
        int v9 = 5;
        break;
      default:
        int v9 = 1;
LABEL_6:
        if ([v8 count])
        {
          int v20 = v9;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id obj = v8;
          uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
                unint64_t v15 = [(SYStoreSessionOwner *)self store];
                v16 = +[SYChange changeWithObject:v14 updateType:0 store:v15];

                if ((v6[2](v6, v16) & 1) == 0) {
                  [(NSMutableArray *)self->_buffer addObject:v16];
                }
              }
              uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
            }
            while (v11);
          }

          int v9 = v20;
        }
        break;
    }
    v17 = [(SYStoreSessionOwner *)self session];
    int v18 = [v17 state];

    if (v18 == 5) {
      unsigned int v7 = 5;
    }
    else {
      unsigned int v7 = v9;
    }
  }
  return v7;
}

- (id)fetchNextBatch
{
  return self->_fetchNextBatch;
}

- (void)setFetchNextBatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchNextBatch, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end