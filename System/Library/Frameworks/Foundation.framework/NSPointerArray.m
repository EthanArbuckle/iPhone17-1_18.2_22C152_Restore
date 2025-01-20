@interface NSPointerArray
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSPointerArray)allocWithZone:(_NSZone *)a3;
+ (NSPointerArray)pointerArrayWithOptions:(NSPointerFunctionsOptions)options;
+ (NSPointerArray)pointerArrayWithPointerFunctions:(NSPointerFunctions *)functions;
+ (NSPointerArray)strongObjectsPointerArray;
+ (NSPointerArray)weakObjectsPointerArray;
+ (id)pointerArrayWithStrongObjects;
+ (id)pointerArrayWithWeakObjects;
- (Class)classForCoder;
- (NSArray)allObjects;
- (NSPointerArray)init;
- (NSPointerArray)initWithCoder:(id)a3;
- (NSPointerArray)initWithOptions:(NSPointerFunctionsOptions)options;
- (NSPointerArray)initWithPointerFunctions:(NSPointerFunctions *)functions;
- (NSPointerFunctions)pointerFunctions;
- (NSUInteger)count;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableArray;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addPointer:(void *)pointer;
- (void)compact;
- (void)encodeWithCoder:(id)a3;
- (void)insertPointer:(void *)item atIndex:(NSUInteger)index;
- (void)pointerAtIndex:(NSUInteger)index;
- (void)removePointerAtIndex:(NSUInteger)index;
- (void)replacePointerAtIndex:(NSUInteger)index withPointer:(void *)item;
- (void)setCount:(NSUInteger)count;
@end

@implementation NSPointerArray

+ (NSPointerArray)pointerArrayWithOptions:(NSPointerFunctionsOptions)options
{
  v4 = (objc_class *)self;
  v5 = objc_msgSend(NSAllocateObject(v4, 0, 0), "initWithOptions:", options);

  return (NSPointerArray *)v5;
}

+ (NSPointerArray)weakObjectsPointerArray
{
  v2 = [[NSConcretePointerArray alloc] initWithOptions:5];

  return (NSPointerArray *)v2;
}

+ (NSPointerArray)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)self;

  return (NSPointerArray *)NSAllocateObject(v3, 0, 0);
}

+ (NSPointerArray)strongObjectsPointerArray
{
  v2 = objc_alloc_init(NSConcretePointerArray);

  return (NSPointerArray *)v2;
}

- (NSArray)allObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = [(NSPointerArray *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * v7)) {
          -[NSArray addObject:](v3, "addObject:");
        }
        ++v7;
      }
      while (v5 != v7);
      unint64_t v5 = [(NSPointerArray *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  return v3;
}

- (NSPointerArray)init
{
}

- (NSPointerArray)initWithOptions:(NSPointerFunctionsOptions)options
{
}

- (NSPointerArray)initWithPointerFunctions:(NSPointerFunctions *)functions
{
}

+ (NSPointerArray)pointerArrayWithPointerFunctions:(NSPointerFunctions *)functions
{
  unint64_t v4 = (objc_class *)self;
  unint64_t v5 = objc_msgSend(NSAllocateObject(v4, 0, 0), "initWithPointerFunctions:", functions);

  return (NSPointerArray *)v5;
}

- (NSPointerArray)initWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSPointerArray;
  [(NSPointerArray *)&v5 dealloc];
  return (NSPointerArray *)[[NSConcretePointerArray alloc] initWithCoder:a3];
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

- (NSPointerFunctions)pointerFunctions
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
}

- (void)pointerAtIndex:(NSUInteger)index
{
}

- (void)addPointer:(void *)pointer
{
}

- (void)removePointerAtIndex:(NSUInteger)index
{
}

- (void)insertPointer:(void *)item atIndex:(NSUInteger)index
{
}

- (void)replacePointerAtIndex:(NSUInteger)index withPointer:(void *)item
{
}

- (void)compact
{
}

- (NSUInteger)count
{
}

- (void)setCount:(NSUInteger)count
{
}

- (id)copyWithZone:(_NSZone *)a3
{
}

- (void)encodeWithCoder:(id)a3
{
}

+ (id)pointerArrayWithStrongObjects
{
  v2 = objc_alloc_init(NSConcretePointerArray);

  return v2;
}

+ (id)pointerArrayWithWeakObjects
{
  v2 = [[NSConcretePointerArray alloc] initWithOptions:1];

  return v2;
}

- (id)mutableArray
{
}

@end