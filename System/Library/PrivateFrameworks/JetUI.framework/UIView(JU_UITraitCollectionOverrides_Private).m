@interface UIView(JU_UITraitCollectionOverrides_Private)
- (id)_juLayoutDirectionValue;
- (unint64_t)_juLayoutDirectionFromLayoutDirectionValue:()JU_UITraitCollectionOverrides_Private;
@end

@implementation UIView(JU_UITraitCollectionOverrides_Private)

- (id)_juLayoutDirectionValue
{
  return objc_getAssociatedObject(a1, sel_juLayoutDirection);
}

- (unint64_t)_juLayoutDirectionFromLayoutDirectionValue:()JU_UITraitCollectionOverrides_Private
{
  if (!a3) {
    return -1;
  }
  unint64_t result = [a3 integerValue];
  if (result >= 2) {
    return -1;
  }
  return result;
}

@end