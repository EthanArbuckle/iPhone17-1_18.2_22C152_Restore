@interface BMDistributedContextUserDefaultStorage
- (BMDistributedContextUserDefaultStorage)initWithUserDefault:(id)a3;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation BMDistributedContextUserDefaultStorage

- (BMDistributedContextUserDefaultStorage)initWithUserDefault:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDistributedContextUserDefaultStorage;
  v6 = [(BMDistributedContextUserDefaultStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)objectForKey:(id)a3
{
  return [(NSUserDefaults *)self->_storage objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end