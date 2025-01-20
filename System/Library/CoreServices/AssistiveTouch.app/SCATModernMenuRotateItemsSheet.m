@interface SCATModernMenuRotateItemsSheet
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuRotateItemsSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  v4 = sub_100040EC8(@"ORIENTATION-PORTRAIT");
  v5 = +[NSString sc_deviceIconNameForIdentifier:@"device_rotatePortrait"];
  v6 = +[SCATModernMenuItem itemWithIdentifier:@"device_rotatePortrait" delegate:self title:v4 imageName:v5 activateBehavior:0];
  [v3 addObject:v6];

  v7 = sub_100040EC8(@"ORIENTATION-LANDSCAPE-LEFT");
  v8 = +[NSString sc_deviceIconNameForIdentifier:@"device_rotateLeft"];
  v9 = +[SCATModernMenuItem itemWithIdentifier:@"device_rotateLeft" delegate:self title:v7 imageName:v8 activateBehavior:0];
  [v3 addObject:v9];

  v10 = sub_100040EC8(@"ORIENTATION-LANDSCAPE-RIGHT");
  v11 = +[NSString sc_deviceIconNameForIdentifier:@"device_rotateRight"];
  v12 = +[SCATModernMenuItem itemWithIdentifier:@"device_rotateRight" delegate:self title:v10 imageName:v11 activateBehavior:0];
  [v3 addObject:v12];

  v13 = sub_100040EC8(@"ORIENTATION-UPSIDE-DOWN");
  v14 = +[NSString sc_deviceIconNameForIdentifier:@"device_rotateUpsideDown"];
  v15 = +[SCATModernMenuItem itemWithIdentifier:@"device_rotateUpsideDown" delegate:self title:v13 imageName:v14 activateBehavior:0];
  [v3 addObject:v15];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"device_rotateLeft"])
  {
    v6 = +[AXPISystemActionHelper sharedInstance];
    [v6 rotateLeft];
  }
  else if ([v5 isEqualToString:@"device_rotateRight"])
  {
    v6 = +[AXPISystemActionHelper sharedInstance];
    [v6 rotateRight];
  }
  else if ([v5 isEqualToString:@"device_rotatePortrait"])
  {
    v6 = +[AXPISystemActionHelper sharedInstance];
    [v6 rotatePortrait];
  }
  else
  {
    if (![v5 isEqualToString:@"device_rotateUpsideDown"])
    {
      v7.receiver = self;
      v7.super_class = (Class)SCATModernMenuRotateItemsSheet;
      [(SCATModernMenuSheet *)&v7 menuItemWasActivated:v4];
      goto LABEL_10;
    }
    v6 = +[AXPISystemActionHelper sharedInstance];
    [v6 rotateUpsideDown];
  }

LABEL_10:
}

@end