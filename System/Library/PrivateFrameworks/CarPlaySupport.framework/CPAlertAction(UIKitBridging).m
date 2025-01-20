@interface CPAlertAction(UIKitBridging)
- (id)alertActionRepresentationWithHandler:()UIKitBridging;
@end

@implementation CPAlertAction(UIKitBridging)

- (id)alertActionRepresentationWithHandler:()UIKitBridging
{
  id v8 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  if ((unint64_t)[v8 style] <= 2) {
    [v8 style];
  }
  v4 = (void *)MEMORY[0x263F1C3F0];
  id v5 = (id)[v8 title];
  id v6 = (id)objc_msgSend(v4, "actionWithTitle:style:handler:");

  objc_storeStrong(location, 0);

  return v6;
}

@end