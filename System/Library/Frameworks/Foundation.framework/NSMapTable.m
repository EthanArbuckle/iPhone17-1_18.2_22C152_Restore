@interface NSMapTable
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSMapTable)alloc;
+ (NSMapTable)allocWithZone:(_NSZone *)a3;
+ (NSMapTable)mapTableWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions;
+ (NSMapTable)strongToStrongObjectsMapTable;
+ (NSMapTable)strongToWeakObjectsMapTable;
+ (NSMapTable)weakToStrongObjectsMapTable;
+ (NSMapTable)weakToWeakObjectsMapTable;
+ (id)mapTableWithStrongToStrongObjects;
+ (id)mapTableWithStrongToWeakObjects;
+ (id)mapTableWithWeakToStrongObjects;
+ (id)mapTableWithWeakToWeakObjects;
- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5;
- (Class)classForCoder;
- (NSDictionary)dictionaryRepresentation;
- (NSEnumerator)keyEnumerator;
- (NSEnumerator)objectEnumerator;
- (NSMapTable)init;
- (NSMapTable)initWithCoder:(id)a3;
- (NSMapTable)initWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions capacity:(NSUInteger)initialCapacity;
- (NSMapTable)initWithKeyPointerFunctions:(NSPointerFunctions *)keyFunctions valuePointerFunctions:(NSPointerFunctions *)valueFunctions capacity:(NSUInteger)initialCapacity;
- (NSPointerFunctions)keyPointerFunctions;
- (NSPointerFunctions)valuePointerFunctions;
- (NSUInteger)count;
- (id)allKeys;
- (id)allValues;
- (id)copy;
- (id)description;
- (id)enumerator;
- (id)mutableDictionary;
- (id)objectForKey:(id)aKey;
- (unint64_t)__capacity;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)removeAllItems;
- (void)removeObjectForKey:(id)aKey;
- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4;
- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)setItem:(const void *)a3 forKey:(const void *)a4;
- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4;
- (void)setObject:(id)anObject forKey:(id)aKey;
@end

@implementation NSMapTable

+ (NSMapTable)alloc
{
  v2 = (objc_class *)self;

  return (NSMapTable *)NSAllocateObject(v2, 0, 0);
}

+ (NSMapTable)weakToWeakObjectsMapTable
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:5 valueOptions:5 capacity:16];

  return (NSMapTable *)v2;
}

+ (NSMapTable)strongToWeakObjectsMapTable
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:0 valueOptions:5 capacity:16];

  return (NSMapTable *)v2;
}

+ (NSMapTable)mapTableWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions
{
  v4 = [[NSConcreteMapTable alloc] initWithKeyOptions:keyOptions valueOptions:valueOptions capacity:16];

  return (NSMapTable *)v4;
}

+ (NSMapTable)weakToStrongObjectsMapTable
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:5 valueOptions:0 capacity:16];

  return (NSMapTable *)v2;
}

+ (NSMapTable)strongToStrongObjectsMapTable
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:0 valueOptions:0 capacity:16];

  return (NSMapTable *)v2;
}

+ (id)mapTableWithWeakToStrongObjects
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:1 valueOptions:0 capacity:16];

  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v4 = [(NSMapTable *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(self);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [(NSMapTable *)self objectForKey:v8];
        if (v9) {
          [(NSDictionary *)v3 setObject:v9 forKey:v8];
        }
      }
      unint64_t v5 = [(NSMapTable *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }
  return v3;
}

+ (NSMapTable)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)self;

  return (NSMapTable *)NSAllocateObject(v3, 0, 0);
}

+ (id)mapTableWithStrongToStrongObjects
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:0 valueOptions:0 capacity:16];

  return v2;
}

+ (id)mapTableWithStrongToWeakObjects
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:0 valueOptions:1 capacity:16];

  return v2;
}

+ (id)mapTableWithWeakToWeakObjects
{
  v2 = [[NSConcreteMapTable alloc] initWithKeyOptions:1 valueOptions:1 capacity:16];

  return v2;
}

- (NSMapTable)initWithCoder:(id)a3
{
  unint64_t v4 = [NSConcreteMapTable alloc];

  return (NSMapTable *)[(NSConcreteMapTable *)v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)self;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (NSMapTable)initWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions capacity:(NSUInteger)initialCapacity
{
}

- (NSMapTable)initWithKeyPointerFunctions:(NSPointerFunctions *)keyFunctions valuePointerFunctions:(NSPointerFunctions *)valueFunctions capacity:(NSUInteger)initialCapacity
{
}

- (NSMapTable)init
{
}

- (id)description
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSUInteger)count
{
}

- (unint64_t)__capacity
{
}

- (NSEnumerator)keyEnumerator
{
}

- (NSEnumerator)objectEnumerator
{
}

- (id)copy
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
}

- (NSPointerFunctions)keyPointerFunctions
{
}

- (NSPointerFunctions)valuePointerFunctions
{
}

- (id)objectForKey:(id)aKey
{
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
}

- (void)removeObjectForKey:(id)aKey
{
}

- (void)setItem:(const void *)a3 forKey:(const void *)a4
{
}

- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4
{
}

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
}

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
}

- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4
{
}

- (id)allKeys
{
}

- (id)allValues
{
}

- (void)removeAllItems
{
}

- (id)enumerator
{
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
}

- (id)mutableDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v4 = [(NSMapTable *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(self);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [(NSMapTable *)self objectForKey:v8];
        if (v9) {
          [v3 setObject:v9 forKey:v8];
        }
      }
      unint64_t v5 = [(NSMapTable *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }
  return v3;
}

@end