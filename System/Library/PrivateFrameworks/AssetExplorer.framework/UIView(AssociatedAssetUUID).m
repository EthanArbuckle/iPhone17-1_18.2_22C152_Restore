@interface UIView(AssociatedAssetUUID)
- (id)associatedAssetUUID;
- (void)setAssociatedAssetUUID:()AssociatedAssetUUID;
@end

@implementation UIView(AssociatedAssetUUID)

- (void)setAssociatedAssetUUID:()AssociatedAssetUUID
{
}

- (id)associatedAssetUUID
{
  return objc_getAssociatedObject(a1, sel_associatedAssetUUID);
}

@end