@interface SKThreadSafeMutableArray
- (NSArray)arrayRepresentation;
- (SKThreadSafeMutableArray)init;
- (SKThreadSafeMutableArray)initWithNSMutableArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)removeObjectsInArray:(id)a3;
@end

@implementation SKThreadSafeMutableArray

- (SKThreadSafeMutableArray)initWithNSMutableArray:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKThreadSafeMutableArray;
  v5 = [(SKThreadSafeMutableArray *)&v10 init];
  v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_storageLock, 0);
    uint64_t v7 = [v4 copy];
    storage = v6->_storage;
    v6->_storage = (NSMutableArray *)v7;
  }
  return v6;
}

- (SKThreadSafeMutableArray)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKThreadSafeMutableArray;
  v2 = [(SKThreadSafeMutableArray *)&v7 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_storageLock, 0);
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    storage = v3->_storage;
    v3->_storage = v4;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  pthread_mutex_init((pthread_mutex_t *)(v5 + 8), 0);
  pthread_mutex_lock(&self->_storageLock);
  uint64_t v6 = [(NSMutableArray *)self->_storage copyWithZone:a3];
  objc_super v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  pthread_mutex_unlock(&self->_storageLock);
  return (id)v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    pthread_mutex_lock(&self->_storageLock);
    [v4 invokeWithTarget:self->_storage];
    pthread_mutex_unlock(&self->_storageLock);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKThreadSafeMutableArray;
    [(SKThreadSafeMutableArray *)&v5 forwardInvocation:v4];
  }
}

- (void)removeObjectsInArray:(id)a3
{
  p_storageLock = &self->_storageLock;
  id v5 = a3;
  pthread_mutex_lock(p_storageLock);
  [(NSMutableArray *)self->_storage removeObjectsInArray:v5];

  pthread_mutex_unlock(p_storageLock);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKThreadSafeMutableArray;
  id v5 = -[SKThreadSafeMutableArray methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    id v5 = [(NSMutableArray *)self->_storage methodSignatureForSelector:a3];
  }

  return v5;
}

- (id)description
{
  return (id)[(NSMutableArray *)self->_storage description];
}

- (NSArray)arrayRepresentation
{
  return (NSArray *)self->_storage;
}

- (void).cxx_destruct
{
}

@end