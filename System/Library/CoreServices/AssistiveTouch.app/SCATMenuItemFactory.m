@interface SCATMenuItemFactory
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
@end

@implementation SCATMenuItemFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[AXSettings sharedInstance];
  v11 = [v10 gestureKeys];
  unsigned __int8 v12 = [v11 containsObject:v7];

  if (v12)
  {
    v13 = off_1001AA3F8;
  }
  else
  {
    v14 = [v10 settingsKeys];
    unsigned __int8 v15 = [v14 containsObject:v7];

    if (v15)
    {
      v13 = off_1001AA408;
    }
    else
    {
      v16 = [v10 deviceKeys];
      unsigned __int8 v17 = [v16 containsObject:v7];

      if (v17)
      {
        v13 = off_1001AA3F0;
      }
      else
      {
        v18 = [v10 mediaControlsKeys];
        unsigned int v19 = [v18 containsObject:v7];

        v13 = off_1001AA3E8;
        if (v19) {
          v13 = off_1001AA400;
        }
      }
    }
  }
  v20 = [(__objc2_class *)*v13 menuItemsForItem:v7 menu:v8 delegate:v9];

  return v20;
}

@end