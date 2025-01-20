@interface NSKeyValueNotifyingMutableOrderedSet
+ (id)_proxyShare;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)_proxyNonGCFinalize;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueNotifyingMutableOrderedSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_107;
  if (!_proxyShare_proxyShare_107)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_107 = (uint64_t)result;
  }
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueNotifyingMutableOrderedSet;
  v5 = -[NSKeyValueMutableOrderedSet _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
  v6 = v5;
  if (v5) {
    v5[3] = _NSGetProxyValueWithGetterNoLock(v5[1], (void *)[a4 mutableCollectionGetter]);
  }
  return v6;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueNotifyingMutableOrderedSet;
  [(NSKeyValueMutableOrderedSet *)&v3 _proxyNonGCFinalize];
  self->_mutableOrderedSet = 0;
}

- (unint64_t)count
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet count];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (unint64_t)indexOfObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObject:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet objectAtIndex:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet objectsAtIndexes:a3];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v7 = [[NSIndexSet alloc] initWithIndex:a4];
  [self->super._container willChange:2 valuesAtIndexes:v7 forKey:self->super._key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet insertObject:a3 atIndex:a4];
  [self->super._container didChange:2 valuesAtIndexes:v7 forKey:self->super._key];
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  [self->super._container willChange:2 valuesAtIndexes:a4 forKey:self->super._key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet insertObjects:a3 atIndexes:a4];
  container = self->super._container;
  key = self->super._key;

  [container didChange:2 valuesAtIndexes:a4 forKey:key];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  v5 = [[NSIndexSet alloc] initWithIndex:a3];
  [self->super._container willChange:3 valuesAtIndexes:v5 forKey:self->super._key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectAtIndex:a3];
  [self->super._container didChange:3 valuesAtIndexes:v5 forKey:self->super._key];
}

- (void)removeObjectsAtIndexes:(id)a3
{
  [self->super._container willChange:3 valuesAtIndexes:a3 forKey:self->super._key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:a3];
  container = self->super._container;
  key = self->super._key;

  [container didChange:3 valuesAtIndexes:a3 forKey:key];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v7 = [[NSIndexSet alloc] initWithIndex:a3];
  [self->super._container willChange:4 valuesAtIndexes:v7 forKey:self->super._key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet replaceObjectAtIndex:a3 withObject:a4];
  [self->super._container didChange:4 valuesAtIndexes:v7 forKey:self->super._key];
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  [self->super._container willChange:4 valuesAtIndexes:a3 forKey:self->super._key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet replaceObjectsAtIndexes:a3 withObjects:a4];
  container = self->super._container;
  key = self->super._key;

  [container didChange:4 valuesAtIndexes:a3 forKey:key];
}

@end