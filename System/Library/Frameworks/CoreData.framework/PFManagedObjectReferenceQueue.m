@interface PFManagedObjectReferenceQueue
@end

@implementation PFManagedObjectReferenceQueue

void __61___PFManagedObjectReferenceQueue__unregisterRunloopObservers__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end