@interface HFHomeKitTransformItem
- (HFHomeKitObject)homeKitObject;
- (id)accessories;
@end

@implementation HFHomeKitTransformItem

- (HFHomeKitObject)homeKitObject
{
  v2 = [(HFHomeKitTransformItem *)self sourceHomeKitItem];
  v3 = [v2 homeKitObject];

  return (HFHomeKitObject *)v3;
}

- (id)accessories
{
  v2 = [(HFHomeKitTransformItem *)self sourceHomeKitItem];
  if ([v2 conformsToProtocol:&unk_26C0FBCA8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  v5 = [v4 accessories];

  if ([v5 count])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  v7 = v6;

  return v7;
}

@end