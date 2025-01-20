@interface HMFMutableThreadSafeDictionary
+ (id)threadSafeDictionary;
- (HMFMutableThreadSafeDictionary)init;
- (HMFMutableThreadSafeDictionary)initWithDictionary:(id)a3;
- (NSArray)allKeys;
- (NSArray)allValues;
- (NSDictionary)rawDictionarySnapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (unint64_t)count;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation HMFMutableThreadSafeDictionary

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_dictionary objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (HMFMutableThreadSafeDictionary)init
{
  return [(HMFMutableThreadSafeDictionary *)self initWithDictionary:MEMORY[0x1E4F1CC08]];
}

- (HMFMutableThreadSafeDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMFMutableThreadSafeDictionary;
  v5 = [(HMFMutableThreadSafeDictionary *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 mutableCopy];
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSMutableDictionary *)v7;
  }
  return v6;
}

+ (id)threadSafeDictionary
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSMutableDictionary *)self->_dictionary count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)allKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSMutableDictionary *)self->_dictionary allKeys];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)allValues
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSMutableDictionary *)self->_dictionary allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_dictionary objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v9 = [(NSMutableDictionary *)self->_dictionary objectsForKeys:v6 notFoundMarker:v7];
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_dictionary setObject:v7 forKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_dictionary setObject:v7 forKeyedSubscript:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_dictionary removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_dictionary removeObjectsForKeys:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)keyEnumerator
{
  id v2 = [(HMFMutableThreadSafeDictionary *)self rawDictionarySnapshot];
  v3 = [v2 keyEnumerator];

  return v3;
}

- (id)objectEnumerator
{
  id v2 = [(HMFMutableThreadSafeDictionary *)self rawDictionarySnapshot];
  v3 = [v2 objectEnumerator];

  return v3;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(HMFMutableThreadSafeDictionary *)self rawDictionarySnapshot];
  [v7 enumerateKeysAndObjectsWithOptions:a3 usingBlock:v6];
}

- (NSDictionary)rawDictionarySnapshot
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_dictionary copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMFMutableThreadSafeDictionary alloc];
  v5 = [(HMFMutableThreadSafeDictionary *)self rawDictionarySnapshot];
  id v6 = [(HMFMutableThreadSafeDictionary *)v4 initWithDictionary:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end