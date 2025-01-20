@interface HDDeferredFeaturePropertiesWriting
@end

@implementation HDDeferredFeaturePropertiesWriting

void __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke()
{
  objc_opt_class();
  uint64_t v0 = HKCreateSerialUtilityDispatchQueue();
  v1 = (void *)_MergedGlobals_215;
  _MergedGlobals_215 = v0;
}

id __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 24) waitForActiveOrAltAccountDevice];
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)_HDDeferredFeaturePropertiesWriting;
  return objc_msgSendSuper2(&v4, sel_synchronize);
}

@end