@interface ICBufferCache
- (BOOL)reading;
- (ICBufferCache)initWithFile:(id)a3;
- (MSCameraFile)msFile;
- (NSMutableArray)availSlots;
- (NSMutableDictionary)bufDict;
- (OS_dispatch_queue)opQueue;
- (OS_dispatch_semaphore)addSemaphore;
- (char)bufferAtSlot:(unint64_t)a3;
- (char)consumeBufferAtOffset:(unint64_t)a3 sized:(unint64_t *)a4;
- (char)resetBufferAtSlot:(unint64_t)a3;
- (int64_t)consumedOffset;
- (unint64_t)bytesRead;
- (unint64_t)readLength;
- (unint64_t)readOffset;
- (void)dealloc;
- (void)dequeueBufferAtOffset:(unint64_t)a3 sized:(unint64_t *)a4 buf:(char *)a5;
- (void)readQueue;
- (void)resetBufferAtOffset:(unint64_t)a3;
- (void)setAddSemaphore:(id)a3;
- (void)setAvailSlots:(id)a3;
- (void)setBufDict:(id)a3;
- (void)setBytesRead:(unint64_t)a3;
- (void)setConsumedOffset:(int64_t)a3;
- (void)setMsFile:(id)a3;
- (void)setOpQueue:(id)a3;
- (void)setReadLength:(unint64_t)a3;
- (void)setReadOffset:(unint64_t)a3;
- (void)setReading:(BOOL)a3;
- (void)startReading;
- (void)stopReading;
@end

@implementation ICBufferCache

- (ICBufferCache)initWithFile:(id)a3
{
  v4 = (MSCameraFile *)a3;
  v27.receiver = self;
  v27.super_class = (Class)ICBufferCache;
  v5 = [(ICBufferCache *)&v27 init];
  if (v5)
  {
    v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    availSlots = v5->_availSlots;
    v5->_availSlots = v6;

    uint64_t v8 = 0;
    while (1)
    {
      v9 = (char *)mmap(0, 0x200000uLL, 3, 4097, -1, 0);
      v5->_bufferCache[v8] = v9;
      if (v9 == (char *)-1) {
        break;
      }
      v10 = v5->_availSlots;
      v11 = +[NSNumber numberWithInt:v8];
      [(NSMutableArray *)v10 addObject:v11];

      if (++v8 == 5)
      {
        v5->_msFile = v4;
        v5->_reading = 0;
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        addSemaphore = v5->_addSemaphore;
        v5->_addSemaphore = (OS_dispatch_semaphore *)v12;

        dispatch_queue_t v14 = dispatch_queue_create("op", 0);
        opQueue = v5->_opQueue;
        v5->_opQueue = (OS_dispatch_queue *)v14;

        v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        bufDict = v5->_bufDict;
        v5->_bufDict = v16;

        v5->_consumedOffset = -1;
        goto LABEL_6;
      }
    }
    int v19 = *__error();
    __ICOSLogCreate();
    v20 = [(ICBufferCache *)v5 msFile];
    v21 = [v20 name];

    if ((unint64_t)[v21 length] >= 0x15)
    {
      v22 = objc_msgSend(v21, "substringWithRange:", 0, 18);
      uint64_t v23 = [v22 stringByAppendingString:@".."];

      v21 = (void *)v23;
    }
    v24 = +[NSString stringWithFormat:@"mmap failed for slot: %d cause: %s", v8, strerror(v19)];
    v25 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024E40(v21, v25);
    }

    v18 = 0;
  }
  else
  {
LABEL_6:
    v18 = v5;
  }

  return v18;
}

- (void)dealloc
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_availSlots;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) intValue];
        if (v8 <= 4) {
          munmap(self->_bufferCache[v8], 0x200000uLL);
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  self->_msFile = 0;
  v9.receiver = self;
  v9.super_class = (Class)ICBufferCache;
  [(ICBufferCache *)&v9 dealloc];
}

- (void)startReading
{
  opQueue = self->_opQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013738;
  block[3] = &unk_100034A78;
  block[4] = self;
  dispatch_async(opQueue, block);
}

- (void)stopReading
{
  opQueue = self->_opQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000137EC;
  block[3] = &unk_100034A78;
  block[4] = self;
  dispatch_async(opQueue, block);
}

- (void)readQueue
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013884;
  v4[3] = &unk_100034A78;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  dispatch_async((dispatch_queue_t)self->_opQueue, v3);
}

- (char)bufferAtSlot:(unint64_t)a3
{
  return self->_bufferCache[a3];
}

- (void)dequeueBufferAtOffset:(unint64_t)a3 sized:(unint64_t *)a4 buf:(char *)a5
{
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  long long v10 = [(ICBufferCache *)self bufDict];
  id v11 = [v10 count];

  if (!v11)
  {
    long long v12 = [(ICBufferCache *)self addSemaphore];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  opQueue = self->_opQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013DC8;
  block[3] = &unk_100034B08;
  unint64_t v17 = a3;
  v18 = a4;
  int v19 = a5;
  block[4] = self;
  dispatch_semaphore_t v16 = v9;
  dispatch_queue_t v14 = v9;
  dispatch_async(opQueue, block);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)resetBufferAtOffset:(unint64_t)a3
{
  opQueue = self->_opQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014214;
  v4[3] = &unk_100034B30;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(opQueue, v4);
}

- (char)resetBufferAtSlot:(unint64_t)a3
{
  result = (char *)mmap(0, 0x200000uLL, 3, 4097, -1, 0);
  self->_bufferCache[a3] = result;
  return result;
}

- (char)consumeBufferAtOffset:(unint64_t)a3 sized:(unint64_t *)a4
{
  if (self->_consumedOffset != -1) {
    -[ICBufferCache resetBufferAtOffset:](self, "resetBufferAtOffset:");
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  unsigned int v8 = [(ICBufferCache *)self bufDict];
  id v9 = [v8 count];

  if (!v9)
  {
    long long v10 = [(ICBufferCache *)self addSemaphore];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  opQueue = self->_opQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014598;
  block[3] = &unk_100034B58;
  unint64_t v18 = a3;
  int v19 = a4;
  dispatch_semaphore_t v16 = v7;
  unint64_t v17 = &v20;
  block[4] = self;
  long long v12 = v7;
  dispatch_async(opQueue, block);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  long long v13 = (char *)v21[3];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (unint64_t)readOffset
{
  return self->_readOffset;
}

- (void)setReadOffset:(unint64_t)a3
{
  self->_readOffset = a3;
}

- (unint64_t)readLength
{
  return self->_readLength;
}

- (void)setReadLength:(unint64_t)a3
{
  self->_readLength = a3;
}

- (unint64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(unint64_t)a3
{
  self->_bytesRead = a3;
}

- (BOOL)reading
{
  return self->_reading;
}

- (void)setReading:(BOOL)a3
{
  self->_reading = a3;
}

- (MSCameraFile)msFile
{
  return self->_msFile;
}

- (void)setMsFile:(id)a3
{
  self->_msFile = (MSCameraFile *)a3;
}

- (OS_dispatch_queue)opQueue
{
  return self->_opQueue;
}

- (void)setOpQueue:(id)a3
{
}

- (OS_dispatch_semaphore)addSemaphore
{
  return self->_addSemaphore;
}

- (void)setAddSemaphore:(id)a3
{
}

- (NSMutableDictionary)bufDict
{
  return self->_bufDict;
}

- (void)setBufDict:(id)a3
{
}

- (int64_t)consumedOffset
{
  return self->_consumedOffset;
}

- (void)setConsumedOffset:(int64_t)a3
{
  self->_consumedOffset = a3;
}

- (NSMutableArray)availSlots
{
  return self->_availSlots;
}

- (void)setAvailSlots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availSlots, 0);
  objc_storeStrong((id *)&self->_bufDict, 0);
  objc_storeStrong((id *)&self->_addSemaphore, 0);

  objc_storeStrong((id *)&self->_opQueue, 0);
}

@end