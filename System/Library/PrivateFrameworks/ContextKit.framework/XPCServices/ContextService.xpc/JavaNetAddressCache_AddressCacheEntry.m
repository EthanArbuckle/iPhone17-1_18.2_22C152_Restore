@interface JavaNetAddressCache_AddressCacheEntry
+ (const)__metadata;
- (JavaNetAddressCache_AddressCacheEntry)initWithId:(id)a3;
- (void)dealloc;
@end

@implementation JavaNetAddressCache_AddressCacheEntry

- (JavaNetAddressCache_AddressCacheEntry)initWithId:(id)a3
{
  self->expiryNanos_ = JavaLangSystem_nanoTime() + 2000000000;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetAddressCache_AddressCacheEntry;
  [(JavaNetAddressCache_AddressCacheEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044C958;
}

@end