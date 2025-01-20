@interface _MFAtomTextViewAccessibility__ChatKit__MessageUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation _MFAtomTextViewAccessibility__ChatKit__MessageUI

+ (id)safeCategoryTargetClassName
{
  return @"_MFAtomTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextViewAccessibility__ChatKit__MessageUI;
  unint64_t v3 = [(_MFAtomTextViewAccessibility__ChatKit__MessageUI *)&v8 accessibilityTraits];
  v4 = [(_MFAtomTextViewAccessibility__ChatKit__MessageUI *)self _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:0];
  if (v4) {
    uint64_t v5 = ~*MEMORY[0x263F81408];
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v3;

  return v6;
}

@end