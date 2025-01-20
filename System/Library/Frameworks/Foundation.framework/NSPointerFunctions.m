@interface NSPointerFunctions
+ (NSPointerFunctions)allocWithZone:(_NSZone *)a3;
+ (NSPointerFunctions)pointerFunctionsWithOptions:(NSPointerFunctionsOptions)options;
- (BOOL)isEqualFunction;
- (BOOL)usesStrongWriteBarrier;
- (BOOL)usesWeakReadAndWriteBarriers;
- (NSPointerFunctions)initWithOptions:(NSPointerFunctionsOptions)options;
- (NSString)descriptionFunction;
- (NSUInteger)hashFunction;
- (NSUInteger)sizeFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (void)acquireFunction;
- (void)relinquishFunction;
- (void)setAcquireFunction:(void *(__cdecl *)acquireFunction;
- (void)setDescriptionFunction:(NSString *(__cdecl *)descriptionFunction;
- (void)setHashFunction:(NSUInteger (__cdecl *)hashFunction;
- (void)setIsEqualFunction:(BOOL (__cdecl *)isEqualFunction;
- (void)setRelinquishFunction:(void (__cdecl *)relinquishFunction;
- (void)setSizeFunction:(NSUInteger (__cdecl *)sizeFunction;
- (void)setUsesStrongWriteBarrier:(BOOL)usesStrongWriteBarrier;
- (void)setUsesWeakReadAndWriteBarriers:(BOOL)usesWeakReadAndWriteBarriers;
@end

@implementation NSPointerFunctions

+ (NSPointerFunctions)pointerFunctionsWithOptions:(NSPointerFunctionsOptions)options
{
  v4 = (objc_class *)self;
  v5 = objc_msgSend(NSAllocateObject(v4, 0, 0), "initWithOptions:", options);

  return (NSPointerFunctions *)v5;
}

+ (NSPointerFunctions)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)self;

  return (NSPointerFunctions *)NSAllocateObject(v3, 0, 0);
}

- (NSPointerFunctions)initWithOptions:(NSPointerFunctionsOptions)options
{
}

- (id)copyWithZone:(_NSZone *)a3
{
}

- (void)setSizeFunction:(NSUInteger (__cdecl *)sizeFunction
{
}

- (void)setHashFunction:(NSUInteger (__cdecl *)hashFunction
{
}

- (void)setIsEqualFunction:(BOOL (__cdecl *)isEqualFunction
{
}

- (void)setDescriptionFunction:(NSString *(__cdecl *)descriptionFunction
{
}

- (void)setAcquireFunction:(void *(__cdecl *)acquireFunction
{
}

- (void)setRelinquishFunction:(void (__cdecl *)relinquishFunction
{
}

- (void)setUsesStrongWriteBarrier:(BOOL)usesStrongWriteBarrier
{
}

- (void)setUsesWeakReadAndWriteBarriers:(BOOL)usesWeakReadAndWriteBarriers
{
}

- (NSUInteger)sizeFunction
{
}

- (NSUInteger)hashFunction
{
}

- (BOOL)isEqualFunction
{
}

- (NSString)descriptionFunction
{
}

- (void)acquireFunction
{
}

- (void)relinquishFunction
{
}

- (BOOL)usesStrongWriteBarrier
{
}

- (BOOL)usesWeakReadAndWriteBarriers
{
}

@end