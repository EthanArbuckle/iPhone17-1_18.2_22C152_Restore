@interface _DKKnowledgeStorageSimpleKeyValueStore
- (id)initWithStorage:(void *)a3 domain:;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _DKKnowledgeStorageSimpleKeyValueStore

- (id)initWithStorage:(void *)a3 domain:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_DKKnowledgeStorageSimpleKeyValueStore;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)objectForKey:(id)a3
{
  return -[_DKKnowledgeStorage keyValueObjectForKey:domain:](self->_storage, a3, self->_domain);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end