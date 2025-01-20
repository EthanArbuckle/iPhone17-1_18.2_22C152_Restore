@interface NSAsynchronousFetchRequest
- (NSAsynchronousFetchRequest)initWithFetchRequest:(NSFetchRequest *)request completionBlock:(void *)blk;
- (NSFetchRequest)fetchRequest;
- (NSInteger)estimatedResultCount;
- (NSPersistentStoreAsynchronousFetchResultCompletionBlock)completionBlock;
- (id)description;
- (unint64_t)requestType;
- (void)dealloc;
- (void)setEstimatedResultCount:(NSInteger)estimatedResultCount;
@end

@implementation NSAsynchronousFetchRequest

- (NSAsynchronousFetchRequest)initWithFetchRequest:(NSFetchRequest *)request completionBlock:(void *)blk
{
  v9.receiver = self;
  v9.super_class = (Class)NSAsynchronousFetchRequest;
  v6 = [(NSAsynchronousFetchRequest *)&v9 init];
  if (v6)
  {
    v6->_fetchRequest = request;
    if (blk) {
      v7 = _Block_copy(blk);
    }
    else {
      v7 = 0;
    }
    v6->_requestCompletionBlock = v7;
    if ([(NSFetchRequest *)request affectedStores]) {
      [(NSPersistentStoreRequest *)v6 setAffectedStores:[(NSFetchRequest *)request affectedStores]];
    }
  }
  return v6;
}

- (NSFetchRequest)fetchRequest
{
  return (NSFetchRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  self->_fetchRequest = 0;
  id requestCompletionBlock = self->_requestCompletionBlock;
  if (requestCompletionBlock)
  {
    _Block_release(requestCompletionBlock);
    self->_id requestCompletionBlock = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSAsynchronousFetchRequest;
  [(NSPersistentStoreRequest *)&v4 dealloc];
}

- (unint64_t)requestType
{
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSAsynchronousFetchRequest;
  return (id)[NSString stringWithFormat:@"%@ with fetch request %@", -[NSAsynchronousFetchRequest description](&v3, sel_description), self->_fetchRequest];
}

- (NSPersistentStoreAsynchronousFetchResultCompletionBlock)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSInteger)estimatedResultCount
{
  return self->_estimatedResultCount;
}

- (void)setEstimatedResultCount:(NSInteger)estimatedResultCount
{
  self->_estimatedResultCount = estimatedResultCount;
}

@end