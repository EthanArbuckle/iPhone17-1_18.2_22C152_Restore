@interface _NSNotifyingWrapperMutableSet
+ (Class)classForKeyedUnarchiver;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (Class)classForCoder;
- (_NSNotifyingWrapperMutableSet)initWithContainer:(id)a3 key:(id)a4 mutableSet:(id)a5;
- (id)allObjects;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)intersectSet:(id)a3;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)unionSet:(id)a3;
@end

@implementation _NSNotifyingWrapperMutableSet

- (void)dealloc
{
  self->_container = 0;
  self->_key = 0;

  self->_mutableSet = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSNotifyingWrapperMutableSet;
  [(_NSNotifyingWrapperMutableSet *)&v3 dealloc];
}

- (_NSNotifyingWrapperMutableSet)initWithContainer:(id)a3 key:(id)a4 mutableSet:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_NSNotifyingWrapperMutableSet;
  v8 = [(_NSNotifyingWrapperMutableSet *)&v10 init];
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)[a4 copy];
    v8->_mutableSet = (NSMutableSet *)a5;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  mutableSet = self->_mutableSet;

  return (id)[v4 initWithSet:mutableSet copyItems:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  mutableSet = self->_mutableSet;

  return (id)[v4 initWithSet:mutableSet copyItems:0];
}

- (id)description
{
  return (id)[(NSMutableSet *)self->_mutableSet description];
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)[(NSMutableSet *)self->_mutableSet descriptionWithLocale:a3];
}

- (id)allObjects
{
  return (id)[(NSMutableSet *)self->_mutableSet allObjects];
}

- (id)anyObject
{
  return (id)[(NSMutableSet *)self->_mutableSet anyObject];
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableSet *)self->_mutableSet containsObject:a3];
}

- (BOOL)isEqualToSet:(id)a3
{
  return [(NSMutableSet *)self->_mutableSet isEqualToSet:a3];
}

- (void)getObjects:(id *)a3
{
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return [(NSMutableSet *)self->_mutableSet isSubsetOfSet:a3];
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSMutableSet *)self->_mutableSet valueForKey:a3];
}

- (id)valueForKeyPath:(id)a3
{
  return (id)[(NSMutableSet *)self->_mutableSet valueForKeyPath:a3];
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

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableSet *)self->_mutableSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)[(NSMutableSet *)self->_mutableSet objectsWithOptions:a3 passingTest:a4];
}

- (void)addObject:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v5 count:1];
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:1 usingObjects:v4];
  [(NSMutableSet *)self->_mutableSet addObject:v5];
  [(NSManagedObject *)self->_container didChangeValueForKey:self->_key withSetMutation:1 usingObjects:v4];
}

- (void)addObjectsFromArray:(id)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a3];
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:1 usingObjects:v5];
  [(NSMutableSet *)self->_mutableSet addObjectsFromArray:a3];
  [(NSManagedObject *)self->_container didChangeValueForKey:self->_key withSetMutation:1 usingObjects:v5];
}

- (void)intersectSet:(id)a3
{
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:3 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet intersectSet:a3];
  container = self->_container;
  key = self->_key;

  [(NSManagedObject *)container didChangeValueForKey:key withSetMutation:3 usingObjects:a3];
}

- (void)minusSet:(id)a3
{
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:2 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet minusSet:a3];
  container = self->_container;
  key = self->_key;

  [(NSManagedObject *)container didChangeValueForKey:key withSetMutation:2 usingObjects:a3];
}

- (void)removeAllObjects
{
  uint64_t v3 = NSSet_EmptySet;
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:3 usingObjects:NSSet_EmptySet];
  [(NSMutableSet *)self->_mutableSet removeAllObjects];
  container = self->_container;
  key = self->_key;

  [(NSManagedObject *)container didChangeValueForKey:key withSetMutation:3 usingObjects:v3];
}

- (void)removeObject:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v5 count:1];
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:2 usingObjects:v4];
  [(NSMutableSet *)self->_mutableSet removeObject:v5];
  [(NSManagedObject *)self->_container didChangeValueForKey:self->_key withSetMutation:2 usingObjects:v4];
}

- (void)setSet:(id)a3
{
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:4 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet setSet:a3];
  container = self->_container;
  key = self->_key;

  [(NSManagedObject *)container didChangeValueForKey:key withSetMutation:4 usingObjects:a3];
}

- (void)unionSet:(id)a3
{
  [(NSManagedObject *)self->_container willChangeValueForKey:self->_key withSetMutation:1 usingObjects:a3];
  [(NSMutableSet *)self->_mutableSet unionSet:a3];
  container = self->_container;
  key = self->_key;

  [(NSManagedObject *)container didChangeValueForKey:key withSetMutation:1 usingObjects:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end