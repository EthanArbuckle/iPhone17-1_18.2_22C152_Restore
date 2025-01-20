@interface HMFClassRegistry
- (Class)classForKey:(id)a3;
- (Class)defaultClass;
- (HMFClassRegistry)init;
- (HMFClassRegistry)initWithDefaultClass:(Class)a3;
- (void)setClass:(Class)a3 forKey:(id)a4;
@end

@implementation HMFClassRegistry

- (Class)classForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_classes objectForKey:v4];
  Class defaultClass = v6;
  if (!v6) {
    Class defaultClass = self->_defaultClass;
  }
  v8 = defaultClass;

  os_unfair_lock_unlock(&p_lock->lock);
  return v8;
}

- (HMFClassRegistry)initWithDefaultClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMFClassRegistry;
  id v4 = [(HMFClassRegistry *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    classes = v4->_classes;
    v4->_classes = (NSMutableDictionary *)v5;

    objc_storeStrong((id *)&v4->_defaultClass, a3);
  }
  return v4;
}

- (HMFClassRegistry)init
{
  return [(HMFClassRegistry *)self initWithDefaultClass:0];
}

- (void)setClass:(Class)a3 forKey:(id)a4
{
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  classes = self->_classes;
  if (a3) {
    [(NSMutableDictionary *)classes setObject:a3 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)classes removeObjectForKey:v7];
  }
  os_unfair_lock_unlock(&self->_lock.lock);
}

- (Class)defaultClass
{
  return self->_defaultClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultClass, 0);
  objc_storeStrong((id *)&self->_classes, 0);
}

@end