@interface _AXObjectCacheHelper
+ (void)helperWithElement:(uint64_t)a3 uid:;
- (void)dealloc;
@end

@implementation _AXObjectCacheHelper

+ (void)helperWithElement:(uint64_t)a3 uid:
{
  self;
  v5 = objc_opt_new();
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

- (void)dealloc
{
  element = self->_element;
  if (element)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = ___AXInternalRemoveFromElementCache_block_invoke;
    v8 = &__block_descriptor_40_e5_v8__0l;
    v9 = element;
    AX_PERFORM_WITH_LOCK();
  }
  v4.receiver = self;
  v4.super_class = (Class)_AXObjectCacheHelper;
  [(_AXObjectCacheHelper *)&v4 dealloc];
}

@end