@interface APOrderedMutableDictionary
+ (id)dictionary;
+ (id)dictionaryWithCapacity:(unint64_t)a3;
- (APOrderedMutableDictionary)init;
- (APOrderedMutableDictionary)initWithCapacity:(unint64_t)a3;
- (BOOL)containsKey:(id)a3;
- (NSArray)allKeys;
- (id)firstKey;
- (id)firstObject;
- (id)lastKey;
- (id)lastObject;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)enumerateKeysUsingBlock:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation APOrderedMutableDictionary

- (APOrderedMutableDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)APOrderedMutableDictionary;
  v2 = [(APOrderedMutableDictionary *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    mutableOrderedSet = v2->_mutableOrderedSet;
    v2->_mutableOrderedSet = v5;
  }
  return v2;
}

- (APOrderedMutableDictionary)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)APOrderedMutableDictionary;
  v4 = [(APOrderedMutableDictionary *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a3];
    dictionary = v4->_dictionary;
    v4->_dictionary = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:a3];
    mutableOrderedSet = v4->_mutableOrderedSet;
    v4->_mutableOrderedSet = (NSMutableOrderedSet *)v7;
  }
  return v4;
}

+ (id)dictionary
{
  v2 = objc_alloc_init(APOrderedMutableDictionary);
  return v2;
}

+ (id)dictionaryWithCapacity:(unint64_t)a3
{
  v3 = [[APOrderedMutableDictionary alloc] initWithCapacity:a3];
  return v3;
}

- (unint64_t)count
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet count];
}

- (NSArray)allKeys
{
  v2 = [(NSMutableOrderedSet *)self->_mutableOrderedSet array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v7) {
      [(APOrderedMutableDictionary *)self setObject:v7 forKey:v6];
    }
    else {
      [(APOrderedMutableDictionary *)self removeObjectForKey:v6];
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3 && a4)
  {
    mutableOrderedSet = self->_mutableOrderedSet;
    id v7 = a4;
    id v11 = a3;
    uint64_t v8 = [(NSMutableOrderedSet *)mutableOrderedSet indexOfObject:v7];
    v9 = self->_mutableOrderedSet;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableOrderedSet *)self->_mutableOrderedSet addObject:v7];
    }
    else
    {
      objc_super v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v8];
      [(NSMutableOrderedSet *)v9 moveObjectsAtIndexes:v10 toIndex:[(NSMutableOrderedSet *)self->_mutableOrderedSet count] - 1];
    }
    [(NSMutableDictionary *)self->_dictionary setObject:v11 forKey:v7];
  }
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
}

- (void)removeObjectForKey:(id)a3
{
  if (a3)
  {
    mutableOrderedSet = self->_mutableOrderedSet;
    id v5 = a3;
    [(NSMutableOrderedSet *)mutableOrderedSet removeObject:v5];
    [(NSMutableDictionary *)self->_dictionary removeObjectForKey:v5];
  }
}

- (BOOL)containsKey:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet containsObject:a3];
}

- (id)firstObject
{
  v3 = [(NSMutableOrderedSet *)self->_mutableOrderedSet firstObject];
  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->_dictionary objectForKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)firstKey
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet firstObject];
}

- (id)lastObject
{
  v3 = [(NSMutableOrderedSet *)self->_mutableOrderedSet lastObject];
  if (v3)
  {
    v4 = [(NSMutableDictionary *)self->_dictionary objectForKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)lastKey
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet lastObject];
}

- (void)enumerateKeysUsingBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableOrderedSet, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end