@interface SKThreadSafeMutableDictionary
- (SKThreadSafeMutableDictionary)initWithNSMutableDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation SKThreadSafeMutableDictionary

- (SKThreadSafeMutableDictionary)initWithNSMutableDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKThreadSafeMutableDictionary;
  v5 = [(SKThreadSafeMutableDictionary *)&v10 init];
  v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_storageLock, 0);
    uint64_t v7 = [v4 copy];
    storage = v6->_storage;
    v6->_storage = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  pthread_mutex_init((pthread_mutex_t *)(v5 + 8), 0);
  pthread_mutex_lock(&self->_storageLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_storage copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 72);
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
    v5.super_class = (Class)SKThreadSafeMutableDictionary;
    [(SKThreadSafeMutableDictionary *)&v5 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKThreadSafeMutableDictionary;
  objc_super v5 = -[SKThreadSafeMutableDictionary methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(NSMutableDictionary *)self->_storage methodSignatureForSelector:a3];
  }

  return v5;
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_storage description];
}

- (void).cxx_destruct
{
}

@end