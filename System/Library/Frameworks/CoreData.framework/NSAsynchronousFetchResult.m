@interface NSAsynchronousFetchResult
- (NSArray)finalResult;
- (NSAsynchronousFetchRequest)fetchRequest;
- (id)initForFetchRequest:(id)a3 withContext:(id)a4 andProgress:(id)a5 completetionBlock:(id)a6;
- (uint64_t)setFinalResult:(uint64_t)result;
- (void)dealloc;
- (void)setOperationError:(id)a3;
@end

@implementation NSAsynchronousFetchResult

- (NSArray)finalResult
{
  return self->_finalResult;
}

- (id)initForFetchRequest:(id)a3 withContext:(id)a4 andProgress:(id)a5 completetionBlock:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)NSAsynchronousFetchResult;
  v7 = [(NSPersistentStoreAsynchronousResult *)&v9 initWithContext:a4 andProgress:a5 completetionBlock:a6];
  if (v7) {
    v7->_fetchRequest = (NSAsynchronousFetchRequest *)a3;
  }
  return v7;
}

- (void)dealloc
{
  [(NSFetchRequest *)[(NSAsynchronousFetchRequest *)self->_fetchRequest fetchRequest] _setAsyncResultHandle:0];

  self->_fetchRequest = 0;
  self->_finalResult = 0;
  id intermediateResultCallback = self->_intermediateResultCallback;
  if (intermediateResultCallback)
  {
    _Block_release(intermediateResultCallback);
    self->_id intermediateResultCallback = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSAsynchronousFetchResult;
  [(NSPersistentStoreAsynchronousResult *)&v4 dealloc];
}

- (uint64_t)setFinalResult:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_super v4 = *(void **)(result + 56);
    if (v4 != a2)
    {

      *(void *)(v3 + 56) = a2;
    }
    v5 = (void *)[*(id *)(v3 + 48) fetchRequest];
    return [v5 _setAsyncResultHandle:0];
  }
  return result;
}

- (void)setOperationError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSAsynchronousFetchResult;
  [(NSPersistentStoreAsynchronousResult *)&v4 setOperationError:a3];
  [(NSFetchRequest *)[(NSAsynchronousFetchRequest *)self->_fetchRequest fetchRequest] _setAsyncResultHandle:0];
}

- (NSAsynchronousFetchRequest)fetchRequest
{
  return (NSAsynchronousFetchRequest *)objc_getProperty(self, a2, 48, 1);
}

@end