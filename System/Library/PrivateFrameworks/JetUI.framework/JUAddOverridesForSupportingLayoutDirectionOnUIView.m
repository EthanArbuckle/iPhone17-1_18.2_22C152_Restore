@interface JUAddOverridesForSupportingLayoutDirectionOnUIView
@end

@implementation JUAddOverridesForSupportingLayoutDirectionOnUIView

uint64_t (*__JUAddOverridesForSupportingLayoutDirectionOnUIView_block_invoke())(void)
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_traitCollection);
  result = (uint64_t (*)(void))method_setImplementation(InstanceMethod, (IMP)swizzle_UIView_traitCollection);
  sOriginal_UIView_traitCollection = result;
  return result;
}

@end