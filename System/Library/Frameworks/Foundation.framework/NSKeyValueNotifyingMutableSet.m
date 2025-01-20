@interface NSKeyValueNotifyingMutableSet
+ (id)_proxyShare;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation NSKeyValueNotifyingMutableSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_89;
  if (!_proxyShare_proxyShare_89)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_89 = (uint64_t)result;
  }
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueNotifyingMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueNotifyingMutableSet;
  [(NSKeyValueMutableSet *)&v3 _proxyNonGCFinalize];
  self->_mutableSet = 0;
}

- (unint64_t)count
{
  return [(NSMutableSet *)self->_mutableSet count];
}

- (id)member:(id)a3
{
  return (id)[(NSMutableSet *)self->_mutableSet member:a3];
}

- (id)objectEnumerator
{
  return (id)[(NSMutableSet *)self->_mutableSet objectEnumerator];
}

- (void)addObject:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v5 count:1];
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:1 usingObjects:v4];
  [(NSMutableSet *)self->_mutableSet addObject:v5[0]];
  [self->super._container didChangeValueForKey:self->super._key withSetMutation:1 usingObjects:v4];
}

- (void)addObjectsFromArray:(id)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a3];
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:1 usingObjects:v5];
  [(NSMutableSet *)self->_mutableSet addObjectsFromArray:a3];
  [self->super._container didChangeValueForKey:self->super._key withSetMutation:1 usingObjects:v5];
}

- (void)intersectSet:(id)a3
{
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:3 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet intersectSet:a3];
  container = self->super._container;
  key = self->super._key;

  [container didChangeValueForKey:key withSetMutation:3 usingObjects:a3];
}

- (void)minusSet:(id)a3
{
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:2 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet minusSet:a3];
  container = self->super._container;
  key = self->super._key;

  [container didChangeValueForKey:key withSetMutation:2 usingObjects:a3];
}

- (void)removeAllObjects
{
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:3 usingObjects:v3];
  [(NSMutableSet *)self->_mutableSet removeAllObjects];
  container = self->super._container;
  key = self->super._key;

  [container didChangeValueForKey:key withSetMutation:3 usingObjects:v3];
}

- (void)removeObject:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v5 count:1];
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:2 usingObjects:v4];
  [(NSMutableSet *)self->_mutableSet removeObject:v5[0]];
  [self->super._container didChangeValueForKey:self->super._key withSetMutation:2 usingObjects:v4];
}

- (void)setSet:(id)a3
{
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:4 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet setSet:a3];
  container = self->super._container;
  key = self->super._key;

  [container didChangeValueForKey:key withSetMutation:4 usingObjects:a3];
}

- (void)unionSet:(id)a3
{
  [self->super._container willChangeValueForKey:self->super._key withSetMutation:1 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet unionSet:a3];
  container = self->super._container;
  key = self->super._key;

  [container didChangeValueForKey:key withSetMutation:1 usingObjects:a3];
}

@end