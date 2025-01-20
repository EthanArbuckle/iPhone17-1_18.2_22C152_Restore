@interface HFAccessoryRepresentableTransformItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (HFAccessoryRepresentable)accessoryRepresentableObject;
- (HFHomeKitObject)homeKitObject;
@end

@implementation HFAccessoryRepresentableTransformItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  return 0;
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  v2 = [(HFTransformItem *)self sourceItem];
  v3 = [v2 accessoryRepresentableObject];

  return (HFAccessoryRepresentable *)v3;
}

- (HFHomeKitObject)homeKitObject
{
  v2 = [(HFTransformItem *)self sourceItem];
  v3 = [v2 homeKitObject];

  return (HFHomeKitObject *)v3;
}

@end