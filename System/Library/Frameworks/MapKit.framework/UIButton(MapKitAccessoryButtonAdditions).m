@interface UIButton(MapKitAccessoryButtonAdditions)
- (id)_mapkit_accessoryControlToExtendWithCallout;
@end

@implementation UIButton(MapKitAccessoryButtonAdditions)

- (id)_mapkit_accessoryControlToExtendWithCallout
{
  if ((unint64_t)([a1 buttonType] - 2) > 2) {
    id v2 = 0;
  }
  else {
    id v2 = a1;
  }

  return v2;
}

@end