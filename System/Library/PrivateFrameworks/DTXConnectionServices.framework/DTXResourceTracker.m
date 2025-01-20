@interface DTXResourceTracker
- (BOOL)log;
- (DTXResourceTracker)init;
- (unint64_t)maxChunkSize;
- (unint64_t)totalSize;
- (unsigned)acquireSize:(unint64_t)a3;
- (void)forceAcquireSize:(unint64_t)a3;
- (void)releaseSize:(unint64_t)a3;
- (void)resumeLimits;
- (void)setLog:(BOOL)a3;
- (void)setMaxChunkSize:(unint64_t)a3;
- (void)setTotalSize:(unint64_t)a3;
- (void)suspendLimits;
@end

@implementation DTXResourceTracker

- (DTXResourceTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)DTXResourceTracker;
  v2 = [(DTXResourceTracker *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DTXResourceTracker queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    acqSem = v2->_acqSem;
    v2->_acqSem = (OS_dispatch_semaphore *)v5;

    v2->_total = -1;
    v2->_maxChunk = -1;
  }
  return v2;
}

- (unint64_t)totalSize
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF3D8D8;
  v5[3] = &unk_264883C08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTotalSize:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_22AF3D960;
  v4[3] = &unk_264883CD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (unint64_t)maxChunkSize
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF3DA64;
  v5[3] = &unk_264883C08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setMaxChunkSize:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_22AF3DAEC;
  v4[3] = &unk_264883CD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (unsigned)acquireSize:(unint64_t)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  do
  {
    queue = self->_queue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = sub_22AF3DC64;
    v9[3] = &unk_264883CF8;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = &v14;
    v9[7] = a3;
    dispatch_sync(queue, v9);
    if (*((unsigned char *)v15 + 24)) {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_acqSem, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  while (*((unsigned char *)v15 + 24));
  unsigned int v7 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)forceAcquireSize:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_22AF3DD7C;
  v4[3] = &unk_264883CD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)releaseSize:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_22AF3DE04;
  v4[3] = &unk_264883CD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)suspendLimits
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3DEDC;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resumeLimits
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3DFB0;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)log
{
  return self->_log;
}

- (void)setLog:(BOOL)a3
{
  self->_log = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTracker, 0);
  objc_storeStrong((id *)&self->_acqSem, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end