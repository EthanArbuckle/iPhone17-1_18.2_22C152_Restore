@interface SCATMenuHardwareActionsMovementFactory
+ (id)_locKeyForHardwareActionString:(id)a3;
+ (id)_menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5 hardwareActionString:(id)a6;
+ (id)_systemImageNameForHardwareActionString:(id)a3;
+ (id)menuItemsForCustomHardwareActions:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForHardwareRotateCrownGestureWithMenu:(id)a3 delegate:(id)a4;
@end

@implementation SCATMenuHardwareActionsMovementFactory

+ (id)menuItemsForCustomHardwareActions:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v29 = a4;
  id v28 = a5;
  if ([v7 count])
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = v7;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      CFStringRef v11 = @"rotateCrownToSwitch";
      uint64_t v12 = *(void *)v31;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v14 isEqualToString:v11])
          {
            v15 = [a1 menuItemsForHardwareRotateCrownGestureWithMenu:v29 delegate:v28];
            [v8 addObjectsFromArray:v15];
          }
          else
          {
            v16 = [a1 _locKeyForHardwareActionString:v14];
            v15 = sub_100040EC8(v16);

            v34[0] = @"identifier";
            v17 = +[NSString stringWithFormat:@"%@%@", @"hardwareAction_", v14];
            v35[0] = v17;
            v35[1] = v15;
            v34[1] = @"title";
            v34[2] = @"imageName";
            [a1 _systemImageNameForHardwareActionString:v14];
            id v18 = v8;
            v20 = CFStringRef v19 = v11;
            v34[3] = @"activateBehavior";
            v35[2] = v20;
            v35[3] = &off_1001BBCA0;
            v21 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
            v22 = [a1 _menuItemWithItemDictionary:v21 menu:v29 delegate:v28 hardwareActionString:v14];

            CFStringRef v11 = v19;
            id v8 = v18;
            uint64_t v12 = v25;

            [v8 addObject:v22];
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v10);
    }

    id v7 = v24;
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

+ (id)menuItemsForHardwareRotateCrownGestureWithMenu:(id)a3 delegate:(id)a4
{
  v20[0] = @"identifier";
  id v6 = a4;
  id v7 = a3;
  v17 = +[NSString stringWithFormat:@"%@%@", @"hardwareAction_", @"rotateCrownClockwise"];
  v21[0] = v17;
  v20[1] = @"title";
  id v8 = sub_100040EC8(@"Next");
  v21[1] = v8;
  v21[2] = @"digitalcrown.horizontal.arrow.clockwise.fill";
  v20[2] = @"imageName";
  v20[3] = @"activateBehavior";
  v21[3] = &off_1001BBCB8;
  id v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  id v10 = [a1 _menuItemWithItemDictionary:v9 menu:v7 delegate:v6 hardwareActionString:0];
  v22[0] = v10;
  v18[0] = @"identifier";
  CFStringRef v11 = +[NSString stringWithFormat:@"%@%@", @"hardwareAction_", @"kSCATMenuItemIDRotateCounterclockwise"];
  v19[0] = v11;
  v18[1] = @"title";
  uint64_t v12 = sub_100040EC8(@"Previous");
  v19[1] = v12;
  v19[2] = @"digitalcrown.horizontal.arrow.counterclockwise.fill";
  v18[2] = @"imageName";
  v18[3] = @"activateBehavior";
  v19[3] = &off_1001BBCB8;
  v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  v14 = [a1 _menuItemWithItemDictionary:v13 menu:v7 delegate:v6 hardwareActionString:0];

  v22[1] = v14;
  v15 = +[NSArray arrayWithObjects:v22 count:2];

  return v15;
}

+ (id)_menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5 hardwareActionString:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = a3;
  CFStringRef v11 = [v10 objectForKey:@"identifier"];
  uint64_t v12 = [v10 objectForKey:@"title"];
  v13 = [v10 objectForKey:@"imageName"];
  v14 = [v10 objectForKey:@"activateBehavior"];

  id v15 = [v14 unsignedIntegerValue];
  if ([v11 containsString:@"rotateCrownClockwise"])
  {
    v16 = &stru_1001ABE30;
  }
  else if ([v11 containsString:@"kSCATMenuItemIDRotateCounterclockwise"])
  {
    v16 = &stru_1001ABE50;
  }
  else
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10003F358;
    v23 = &unk_1001ABE78;
    id v24 = v9;
    v16 = objc_retainBlock(&v20);
  }
  LOBYTE(v19) = 0;
  v17 = +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:](SCATModernMenuItem, "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:", v11, v8, v12, v13, v15, 0, v19, v16, 0, v20, v21, v22, v23);

  return v17;
}

+ (id)_locKeyForHardwareActionString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"pressCrownToSetUpLater"])
  {
    CFStringRef v4 = @"SET_UP_LATER";
  }
  else
  {
    if ([v3 isEqualToString:@"pressCrownToSetUpManually"]) {
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"pressCrownToOpenHome"])
    {
      CFStringRef v4 = @"OPEN_HOME";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownToContinue"])
    {
      CFStringRef v4 = @"CONTINUE";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownToBegin"])
    {
      CFStringRef v4 = @"BEGIN";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownToTryAgain"])
    {
      CFStringRef v4 = @"TRY_AGAIN";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownToSelect"])
    {
      CFStringRef v4 = @"SELECT";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownToStart"])
    {
      CFStringRef v4 = @"START";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownToResume"])
    {
      CFStringRef v4 = @"RESUME";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownAfterInsertsAttached"])
    {
      CFStringRef v4 = @"CONFIRM_INSERTS_ATTACHED";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownAfterInsertsRemoved"])
    {
      CFStringRef v4 = @"CONFIRM_INSERTS_REMOVED";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressCrownForMoreOptions"])
    {
      CFStringRef v4 = @"MORE_OPTIONS";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"pressTopButtonToReplayVideo"])
    {
      CFStringRef v4 = @"REPLAY_VIDEO";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"triplePressLockToShowAccessibilityOptions"])
    {
      CFStringRef v4 = @"ACCESSIBILITY_OPTIONS";
      goto LABEL_35;
    }
    if ([v3 isEqualToString:@"doublePressCrownToSetUpManually"])
    {
LABEL_4:
      CFStringRef v4 = @"SET_UP_MANUALLY";
    }
    else if ([v3 isEqualToString:@"doublePressCrownToContinueWithoutLenses"])
    {
      CFStringRef v4 = @"CONTINUE_WITHOUT_LENSES";
    }
    else if ([v3 isEqualToString:@"doublePressCrownToCancel"])
    {
      CFStringRef v4 = @"CANCEL";
    }
    else
    {
      CFStringRef v4 = &stru_1001B1E10;
    }
  }
LABEL_35:

  return (id)v4;
}

+ (id)_systemImageNameForHardwareActionString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"pressCrownToSetUpLater"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToSetUpManually"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToOpenHome"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToContinue"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToBegin"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToTryAgain"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToSelect"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToStart"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToResume"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownAfterInsertsAttached"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownAfterInsertsRemoved"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownForMoreOptions"] & 1) != 0
    || ([v3 isEqualToString:@"doublePressCrownToSetUpManually"] & 1) != 0
    || ([v3 isEqualToString:@"doublePressCrownToContinueWithoutLenses"] & 1) != 0
    || ([v3 isEqualToString:@"doublePressCrownToCancel"] & 1) != 0)
  {
    CFStringRef v4 = @"digitalcrown.horizontal.press.fill";
  }
  else
  {
    CFStringRef v4 = @"button.horizontal.top.press.fill";
    if (([v3 isEqualToString:@"pressTopButtonToReplayVideo"] & 1) == 0
      && ![v3 isEqualToString:@"triplePressLockToShowAccessibilityOptions"])
    {
      CFStringRef v4 = &stru_1001B1E10;
    }
  }

  return (id)v4;
}

@end