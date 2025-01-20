@interface UIView(DOCAppearanceInheritance)
+ (uint64_t)load;
@end

@implementation UIView(DOCAppearanceInheritance)

+ (uint64_t)load
{
  return objc_msgSend(a1, "_doc_swapMethodWithSelector:withMethodWithSelector:", sel_didMoveToSuperview, sel_doc_didMoveToSuperview);
}

@end