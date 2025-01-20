@interface AVGlobalOperationQueue
+ (id)defaultQueue;
- (AVGlobalOperationQueue)init;
- (NSArray)unfinishedOperations;
- (id)description;
- (void)dealloc;
- (void)enqueueOperation:(id)a3;
@end

@implementation AVGlobalOperationQueue

+ (id)defaultQueue
{
  if (defaultQueue_sSharedManagerOnce != -1) {
    dispatch_once(&defaultQueue_sSharedManagerOnce, &__block_literal_global_29);
  }
  return (id)defaultQueue_sDefaultQueue;
}

AVGlobalOperationQueue *__38__AVGlobalOperationQueue_defaultQueue__block_invoke()
{
  result = objc_alloc_init(AVGlobalOperationQueue);
  defaultQueue_sDefaultQueue = (uint64_t)result;
  return result;
}

- (AVGlobalOperationQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVGlobalOperationQueue;
  v2 = [(AVGlobalOperationQueue *)&v5 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v2->_operationQueue = v3;
    -[NSOperationQueue setName:](v3, "setName:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.avfoundation.globaloperationqueue.%p", v2));
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVGlobalOperationQueue;
  [(AVGlobalOperationQueue *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, unfinishedOperations=%@>", NSStringFromClass(v4), self, -[AVGlobalOperationQueue unfinishedOperations](self, "unfinishedOperations")];
}

- (void)enqueueOperation:(id)a3
{
}

- (NSArray)unfinishedOperations
{
  return [(NSOperationQueue *)self->_operationQueue operations];
}

@end