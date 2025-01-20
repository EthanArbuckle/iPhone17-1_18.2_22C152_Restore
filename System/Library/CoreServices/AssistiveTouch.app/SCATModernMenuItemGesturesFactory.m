@interface SCATModernMenuItemGesturesFactory
+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3;
+ (id)_imageNameForNumberOfFingers:(unint64_t)a3;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
@end

@implementation SCATModernMenuItemGesturesFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0);
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v19 + 1) + 8 * i) menu:v9 delegate:v10];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesTap])
  {
    v50[0] = @"gestures_tap";
    v49[0] = @"identifier";
    v49[1] = @"title";
    v7 = sub_100040EC8(@"TAP");
    v49[2] = @"activateBehavior";
    v50[1] = v7;
    v50[2] = &off_1001BC030;
    id v8 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
    v51 = v8;
    id v9 = &v51;
LABEL_31:
    id v11 = +[NSArray arrayWithObjects:v9 count:1];
    goto LABEL_32;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesTapAndHold])
  {
    v47[0] = @"gestures_tapAndHold";
    v46[0] = @"identifier";
    v46[1] = @"title";
    v7 = sub_100040EC8(@"TAP_AND_HOLD");
    v46[2] = @"activateBehavior";
    v47[1] = v7;
    v47[2] = &off_1001BC048;
    id v8 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
    v48 = v8;
    id v9 = &v48;
    goto LABEL_31;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesForceTouch])
  {
    if (AXForceTouchAvailableAndEnabled())
    {
      v44[0] = @"gestures_forceTouch";
      v43[0] = @"identifier";
      v43[1] = @"title";
      v7 = sub_100040EC8(@"FORCE_TOUCH");
      v44[1] = v7;
      v44[2] = @"SCATIcon_gestures_3dtouch";
      v43[2] = @"imageName";
      v43[3] = @"activateBehavior";
      v44[3] = &off_1001BC030;
      id v8 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
      v45 = v8;
      id v9 = &v45;
      goto LABEL_31;
    }
LABEL_24:
    id v11 = 0;
    goto LABEL_33;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesFlick])
  {
    v41[0] = @"gestures_flick";
    v40[0] = @"identifier";
    v40[1] = @"title";
    v7 = sub_100040EC8(@"FlickMenu");
    v40[2] = @"activateBehavior";
    v41[1] = v7;
    v41[2] = &off_1001BC048;
    id v8 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    v42 = v8;
    id v9 = &v42;
    goto LABEL_31;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesPan])
  {
    v38[0] = @"gestures_pan";
    v37[0] = @"identifier";
    v37[1] = @"title";
    v7 = sub_100040EC8(@"PanMenu");
    v37[2] = @"activateBehavior";
    v38[1] = v7;
    v38[2] = &off_1001BC048;
    id v8 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    v39 = v8;
    id v9 = &v39;
    goto LABEL_31;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesPinch])
  {
    v35[0] = @"gestures_pinch";
    v34[0] = @"identifier";
    v34[1] = @"title";
    v7 = sub_100040EC8(@"PinchMenu");
    v35[1] = v7;
    v35[2] = @"SCATIcon_gestures_pinchIn";
    v34[2] = @"imageName";
    v34[3] = @"activateBehavior";
    v35[3] = &off_1001BC048;
    id v8 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    v36 = v8;
    id v9 = &v36;
    goto LABEL_31;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesDrag])
  {
    v32[0] = @"gestures_dragAndDrop";
    v31[0] = @"identifier";
    v31[1] = @"title";
    v7 = sub_100040EC8(@"DRAG_AND_DROP");
    v32[1] = v7;
    v32[2] = @"SCATIcon_gestures_drag";
    v31[2] = @"imageName";
    v31[3] = @"activateBehavior";
    v32[3] = &off_1001BC030;
    id v8 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
    v33 = v8;
    id v9 = &v33;
    goto LABEL_31;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesHoldAndDrag])
  {
    v29[0] = @"gestures_holdAndDrag";
    v28[0] = @"identifier";
    v28[1] = @"title";
    v7 = sub_100040EC8(@"HOLD_AND_DRAG");
    v29[1] = v7;
    v29[2] = @"SCATIcon_gestures_holdAndDrag";
    v28[2] = @"imageName";
    v28[3] = @"activateBehavior";
    v29[3] = &off_1001BC030;
    id v8 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
    v30 = v8;
    id v9 = &v30;
    goto LABEL_31;
  }
  if (![v5 isEqualToString:AXSSwitchControlMenuItemGesturesActiveHoldAndDrag])
  {
    if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesDoubleTap])
    {
      v23[0] = @"gestures_doubleTap";
      v22[0] = @"identifier";
      v22[1] = @"title";
      v7 = sub_100040EC8(@"DOUBLE_TAP");
      v22[2] = @"activateBehavior";
      v23[1] = v7;
      v23[2] = &off_1001BC030;
      id v8 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
      v24 = v8;
      id v9 = &v24;
      goto LABEL_31;
    }
    if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesFreehand])
    {
      v20[0] = @"freehand";
      v19[0] = @"identifier";
      v19[1] = @"title";
      v7 = sub_100040EC8(@"DrawingGesture");
      v19[2] = @"activateBehavior";
      v20[1] = v7;
      v20[2] = &off_1001BC048;
      id v8 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
      long long v21 = v8;
      id v9 = &v21;
      goto LABEL_31;
    }
    if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesFingers])
    {
      v17[0] = @"gestures_fingers1";
      v16[0] = @"identifier";
      v16[1] = @"title";
      v7 = sub_100040EC8(@"FingersMenu");
      v16[2] = @"activateBehavior";
      v17[1] = v7;
      v17[2] = &off_1001BC048;
      id v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
      v18 = v8;
      id v9 = &v18;
      goto LABEL_31;
    }
    if ([v5 isEqualToString:AXSSwitchControlMenuItemGesturesSaved])
    {
      v14[0] = @"gestures_favorites";
      v13[0] = @"identifier";
      v13[1] = @"title";
      v7 = sub_100040EC8(@"CustomGesturesMenu");
      v13[2] = @"activateBehavior";
      v14[1] = v7;
      v14[2] = &off_1001BC048;
      id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
      uint64_t v15 = v8;
      id v9 = &v15;
      goto LABEL_31;
    }
    _AXAssert();
    goto LABEL_24;
  }
  v7 = [v6 pointPicker];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_24;
  }
  v26[0] = @"gestures_activeHoldAndDrag";
  v25[0] = @"identifier";
  v25[1] = @"title";
  id v8 = sub_100040EC8(@"ACTIVE_DRAG");
  v26[1] = v8;
  v26[2] = @"SCATIcon_gestures_directTouch";
  v25[2] = @"imageName";
  v25[3] = @"activateBehavior";
  v26[3] = &off_1001BC030;
  id v10 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v27 = v10;
  id v11 = +[NSArray arrayWithObjects:&v27 count:1];

LABEL_32:
LABEL_33:

  return v11;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = [v7 objectForKey:@"identifier"];
  id v9 = [v7 objectForKey:@"title"];
  id v10 = [v7 objectForKey:@"imageName"];
  id v11 = [v7 objectForKey:@"activateBehavior"];

  id v12 = [v11 unsignedIntegerValue];
  if ([v8 isEqualToString:@"gestures_tap"])
  {
    id v13 = &stru_1001ADCA8;
  }
  else if ([v8 isEqualToString:@"gestures_tapAndHold"])
  {
    id v13 = &stru_1001ADCC8;
  }
  else if ([v8 isEqualToString:@"gestures_flick"])
  {
    id v13 = &stru_1001ADCE8;
  }
  else if ([v8 isEqualToString:@"gestures_pan"])
  {
    id v13 = &stru_1001ADD08;
  }
  else if ([v8 isEqualToString:@"gestures_pinch"])
  {
    id v13 = &stru_1001ADD28;
  }
  else if ([v8 isEqualToString:@"gestures_dragAndDrop"])
  {
    id v13 = &stru_1001ADD48;
  }
  else if ([v8 isEqualToString:@"gestures_fingers1"])
  {
    id v13 = &stru_1001ADD68;
  }
  else if ([v8 isEqualToString:@"gestures_doubleTap"])
  {
    id v13 = &stru_1001ADD88;
  }
  else if ([v8 isEqualToString:@"gestures_holdAndDrag"])
  {
    id v13 = &stru_1001ADDA8;
  }
  else if ([v8 isEqualToString:@"gestures_activeHoldAndDrag"])
  {
    id v13 = &stru_1001ADDC8;
  }
  else if ([v8 isEqualToString:@"gestures_favorites"])
  {
    id v13 = &stru_1001ADDE8;
  }
  else if ([v8 isEqualToString:@"freehand"])
  {
    id v13 = &stru_1001ADE08;
  }
  else if ([v8 isEqual:@"gestures_forceTouch"])
  {
    id v13 = &stru_1001ADE28;
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [(id)objc_opt_class() updateBlockForIdentifier:v8];
  LOBYTE(v17) = 1;
  uint64_t v15 = +[SCATModernMenuItem itemWithIdentifier:v8 delegate:v6 title:v9 imageName:v10 activateBehavior:v12 allowedWithGuidedAccess:1 allowedWithAssistiveAccess:v17 activateHandler:v13 updateHandler:v14];

  return v15;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  if ([a3 isEqualToString:@"gestures_fingers1"])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AAB78;
    v6[3] = &unk_1001ABF58;
    v6[4] = a1;
    v4 = objc_retainBlock(v6);
  }
  else
  {
    v4 = &stru_1001ADE48;
  }

  return v4;
}

+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3
{
  v3 = sub_100040EC8(@"FingersFormat");
  v4 = AXFormatInteger();
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);

  return v5;
}

+ (id)_imageNameForNumberOfFingers:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return off_1001ADE68[a3 - 1];
  }
}

@end