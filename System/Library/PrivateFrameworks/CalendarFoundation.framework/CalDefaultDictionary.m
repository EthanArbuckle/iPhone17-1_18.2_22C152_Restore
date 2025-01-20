@interface CalDefaultDictionary
- (CalDefaultDictionary)initWithDefaultClass:(Class)a3;
- (id)_copyWithZone:(_NSZone *)a3 isDeepCopy:(BOOL)a4;
- (id)_mutableCopyOfFinalDictionaryWithZone:(_NSZone *)a3 isDeepCopy:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopy;
- (id)existingObjectForKey:(id)a3;
- (id)finalDictionary;
- (id)keys;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDictionary:(id)a3;
@end

@implementation CalDefaultDictionary

- (CalDefaultDictionary)initWithDefaultClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CalDefaultDictionary;
  v4 = [(CalDefaultDictionary *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_defaultClass = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dict = v5->_dict;
    v5->_dict = v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(CalDefaultDictionary *)self _copyWithZone:a3 isDeepCopy:0];
}

- (id)deepCopy
{
  return [(CalDefaultDictionary *)self _copyWithZone:0 isDeepCopy:1];
}

- (id)_copyWithZone:(_NSZone *)a3 isDeepCopy:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [+[CalDefaultDictionary allocWithZone:](CalDefaultDictionary, "allocWithZone:") initWithDefaultClass:self->_defaultClass];
  id v8 = [(CalDefaultDictionary *)self _mutableCopyOfFinalDictionaryWithZone:a3 isDeepCopy:v4];
  [(CalDefaultDictionary *)v7 setDictionary:v8];

  return v7;
}

- (id)_mutableCopyOfFinalDictionaryWithZone:(_NSZone *)a3 isDeepCopy:(BOOL)a4
{
  if (a4)
  {
    v5 = [(CalDefaultDictionary *)self finalDictionary];
    uint64_t v6 = [v5 CalMutableRecursiveCopy];
  }
  else
  {
    v7 = (void *)[MEMORY[0x1E4F1CA60] allocWithZone:a3];
    v5 = [(CalDefaultDictionary *)self finalDictionary];
    uint64_t v6 = [v7 initWithDictionary:v5];
  }
  id v8 = (void *)v6;

  return v8;
}

- (id)existingObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dict objectForKey:a3];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_dict objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(self->_defaultClass);
    [(NSMutableDictionary *)self->_dict setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)removeAllObjects
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)keys
{
  return (id)[(NSMutableDictionary *)self->_dict allKeys];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_dict count];
}

- (void)setDictionary:(id)a3
{
}

- (id)finalDictionary
{
  return self->_dict;
}

- (void).cxx_destruct
{
}

@end