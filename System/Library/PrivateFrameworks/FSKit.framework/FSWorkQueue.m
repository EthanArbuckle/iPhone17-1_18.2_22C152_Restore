@interface FSWorkQueue
- (NSMutableArray)queues;
- (id)initQueueWithDomain:(id)a3 concurrency:(int)a4;
- (int)index;
- (void)enqueue:(id)a3;
- (void)setIndex:(int)a3;
- (void)setQueues:(id)a3;
@end

@implementation FSWorkQueue

- (id)initQueueWithDomain:(id)a3 concurrency:(int)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FSWorkQueue;
  v7 = [(FSWorkQueue *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    queues = v7->_queues;
    v7->_queues = (NSMutableArray *)v8;

    v7->_index = 0;
    if (a4 >= 1)
    {
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = [NSString stringWithFormat:@"com.apple.fskit.FSWorkQueue.%@.%d", v6, v10];
        dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
        if (!v12) {
          break;
        }
        dispatch_queue_t v13 = v12;
        v14 = [(FSWorkQueue *)v7 queues];
        [v14 addObject:v13];

        uint64_t v10 = (v10 + 1);
        if (a4 == v10) {
          goto LABEL_10;
        }
      }
      v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FSWorkQueue initQueueWithDomain:concurrency:]((uint64_t)v11, v15);
      }

      v7 = 0;
    }
  }
LABEL_10:

  return v7;
}

- (void)enqueue:(id)a3
{
  dispatch_block_t block = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(FSWorkQueue *)v4 queues];
  id v6 = objc_msgSend(v5, "objectAtIndex:", -[FSWorkQueue index](v4, "index"));

  dispatch_async(v6, block);
  int v7 = [(FSWorkQueue *)v4 index];
  uint64_t v8 = [(FSWorkQueue *)v4 queues];
  -[FSWorkQueue setIndex:](v4, "setIndex:", ((v7 + 1) % (unint64_t)[v8 count]));

  objc_sync_exit(v4);
}

- (NSMutableArray)queues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueues:(id)a3
{
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

- (void)initQueueWithDomain:(uint64_t)a1 concurrency:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_ERROR, "Can't create FSWorkQueue, unable to create queue (%@), errno (%d)", (uint8_t *)&v5, 0x12u);
}

@end