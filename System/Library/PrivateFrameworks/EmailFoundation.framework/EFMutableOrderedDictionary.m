@interface EFMutableOrderedDictionary
- (EFMutableOrderedDictionary)init;
- (EFMutableOrderedDictionary)initWithCapacity:(unint64_t)a3;
- (id)_initWithOrderedKeys:(id)a3 objectsByKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)moveObjectForKey:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectForKey:(id)a3;
- (void)replaceObject:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceObject:(id)a3 forKey:(id)a4;
- (void)setOrAddObject:(id)a3 forKey:(id)a4;
- (void)setOrInsertObject:(id)a3 forKey:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation EFMutableOrderedDictionary

- (EFMutableOrderedDictionary)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7.receiver = self;
  v7.super_class = (Class)EFMutableOrderedDictionary;
  v5 = [(EFOrderedDictionary *)&v7 _initWithOrderedKeys:v3 objectsByKey:v4];

  return v5;
}

- (EFMutableOrderedDictionary)initWithCapacity:(unint64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:a3];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  v9.receiver = self;
  v9.super_class = (Class)EFMutableOrderedDictionary;
  objc_super v7 = [(EFOrderedDictionary *)&v9 _initWithOrderedKeys:v5 objectsByKey:v6];

  return v7;
}

- (id)_initWithOrderedKeys:(id)a3 objectsByKey:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)[a3 mutableCopy];
  v8 = (void *)[v6 mutableCopy];
  v11.receiver = self;
  v11.super_class = (Class)EFMutableOrderedDictionary;
  id v9 = [(EFOrderedDictionary *)&v11 _initWithOrderedKeys:v7 objectsByKey:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [EFOrderedDictionary alloc];
  v5 = (void *)[(NSOrderedSet *)self->super._orderedKeys copy];
  id v6 = (void *)[(NSDictionary *)self->super._objectsByKey copy];
  id v7 = [(EFOrderedDictionary *)v4 _initWithOrderedKeys:v5 objectsByKey:v6];

  return v7;
}

- (void)setOrAddObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(NSOrderedSet *)self->super._orderedKeys addObject:v6];
  [(NSDictionary *)self->super._objectsByKey setObject:v7 forKeyedSubscript:v6];
}

- (void)setOrInsertObject:(id)a3 forKey:(id)a4 atIndex:(unint64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  [(NSOrderedSet *)self->super._orderedKeys insertObject:v8 atIndex:a5];
  [(NSDictionary *)self->super._objectsByKey setObject:v9 forKeyedSubscript:v8];
}

- (void)moveObjectForKey:(id)a3 toIndex:(unint64_t)a4
{
  NSUInteger v5 = [(NSOrderedSet *)self->super._orderedKeys indexOfObject:a3];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v5];
    -[NSOrderedSet moveObjectsAtIndexes:toIndex:](self->super._orderedKeys, "moveObjectsAtIndexes:toIndex:");
  }
}

- (void)replaceObject:(id)a3 atIndex:(unint64_t)a4
{
  id v8 = a3;
  if ([(NSOrderedSet *)self->super._orderedKeys count] > a4)
  {
    objectsByKey = self->super._objectsByKey;
    id v7 = [(NSOrderedSet *)self->super._orderedKeys objectAtIndexedSubscript:a4];
    [(NSDictionary *)objectsByKey setObject:v8 forKeyedSubscript:v7];
  }
}

- (void)replaceObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NSOrderedSet *)self->super._orderedKeys containsObject:v6]) {
    [(NSDictionary *)self->super._objectsByKey setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if ([(NSOrderedSet *)self->super._orderedKeys count] > a3)
  {
    objectsByKey = self->super._objectsByKey;
    id v6 = [(NSOrderedSet *)self->super._orderedKeys objectAtIndexedSubscript:a3];
    [(NSDictionary *)objectsByKey setObject:0 forKeyedSubscript:v6];

    orderedKeys = self->super._orderedKeys;
    [(NSOrderedSet *)orderedKeys removeObjectAtIndex:a3];
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  -[NSOrderedSet removeObject:](self->super._orderedKeys, "removeObject:");
  [(NSDictionary *)self->super._objectsByKey setObject:0 forKeyedSubscript:v4];
}

- (void)removeAllObjects
{
  [(NSOrderedSet *)self->super._orderedKeys removeAllObjects];
  objectsByKey = self->super._objectsByKey;
  [(NSDictionary *)objectsByKey removeAllObjects];
}

@end