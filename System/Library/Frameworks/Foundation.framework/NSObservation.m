@interface NSObservation
+ (id)allocWithZone:(_NSZone *)a3;
- (id)_observerStorage;
- (void)_observerStorageOfSize:(unint64_t)a3;
@end

@implementation NSObservation

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSObservation == a1) {
    return &___placeholderObservation;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSObservation;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
}

- (id)_observerStorage
{
}

@end