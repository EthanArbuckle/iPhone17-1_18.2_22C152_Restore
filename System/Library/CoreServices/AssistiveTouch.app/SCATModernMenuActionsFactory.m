@interface SCATModernMenuActionsFactory
+ (id)_additionalMenuItemsForHomeActionForMenu:(id)a3 delegate:(id)a4;
+ (id)_capitalizedMenuTitle:(id)a3;
+ (id)_escapableElements;
+ (id)_fallbackImageForCustomActionMenuItem:(id)a3 charactersInUse:(id)a4;
+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3;
+ (id)_imageNameForNumberOfFingers:(unint64_t)a3;
+ (id)_menuItemsForElementSpecificActionsForMenu:(id)a3 delegate:(id)a4;
+ (id)_typingCandidates;
+ (id)dragMenuItemsForElement:(id)a3 delegate:(id)a4;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemForTapWithMenu:(id)a3 delegate:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForCustomActions:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForDrops:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
+ (void)_handlePerformEscapeWithMenu:(id)a3;
+ (void)_title:(id *)a3 imageForAlternateNavigationItem:(id *)a4;
+ (void)_title:(id *)a3 imageForNavigationItem:(id *)a4;
+ (void)toggleAlternativeNavigationMode;
+ (void)toggleNavigationMode;
@end

@implementation SCATModernMenuActionsFactory

+ (id)menuItemForTapWithMenu:(id)a3 delegate:(id)a4
{
  v13[0] = @"action_activate";
  v12[0] = @"identifier";
  v12[1] = @"title";
  id v6 = a4;
  id v7 = a3;
  v8 = sub_100040EC8(@"TAP");
  v13[1] = v8;
  v13[2] = @"SCATIcon_gestures_tap";
  v12[2] = @"imageName";
  v12[3] = @"activateBehavior";
  v13[3] = &off_1001BBFB8;
  v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  v10 = [a1 menuItemWithItemDictionary:v9 menu:v7 delegate:v6];

  return v10;
}

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:AXSSwitchControlMenuItemElementSpecificActions])
  {
    id v11 = [a1 _menuItemsForElementSpecificActionsForMenu:v9 delegate:v10];
    goto LABEL_21;
  }
  if ([v8 isEqualToString:AXSSwitchControlMenuItemSideApp])
  {
    if (AXDeviceSupportsSideApp())
    {
      v12 = +[AXSpringBoardServer server];
      v13 = [v12 allowedMedusaGestures];

      if ([v13 count] == (id)1)
      {
        v14 = [v13 firstObject];
        v15 = +[SCATModernMenuSideAppSheet makeSideAppMenuItemForGesture:delegate:](SCATModernMenuSideAppSheet, "makeSideAppMenuItemForGesture:delegate:", [v14 unsignedIntegerValue], v10);
        v33 = v15;
        id v11 = +[NSArray arrayWithObjects:&v33 count:1];
LABEL_18:

        goto LABEL_21;
      }
      if ((unint64_t)[v13 count] >= 2)
      {
        v31[0] = @"action_sideApp";
        v30[0] = @"identifier";
        v30[1] = @"title";
        v14 = sub_100040EC8(@"SIDE_APP_MENU_TITLE");
        v31[1] = v14;
        v31[2] = @"SCATIcon_sideApp_pinnedHalf";
        v30[2] = @"imageName";
        v30[3] = @"activateBehavior";
        v31[3] = &off_1001BBFD0;
        v15 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
        v23 = [a1 menuItemWithItemDictionary:v15 menu:v9 delegate:v10];
        v32 = v23;
        id v11 = +[NSArray arrayWithObjects:&v32 count:1];

        goto LABEL_18;
      }
    }
    id v11 = &__NSArray0__struct;
  }
  else
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v16 = objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0);
    id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v25 + 1) + 8 * i) menu:v9 delegate:v10];
          [v11 addObject:v21];
        }
        id v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v18);
    }

    if ([v8 isEqualToString:AXSSwitchControlMenuItemHome])
    {
      v22 = [a1 _additionalMenuItemsForHomeActionForMenu:v9 delegate:v10];
      [v11 addObjectsFromArray:v22];
    }
  }
LABEL_21:

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDevice])
  {
    v134[0] = @"device";
    v133[0] = @"identifier";
    v133[1] = @"title";
    id v8 = sub_100040EC8(@"DEVICE");
    v134[1] = v8;
    v133[2] = @"imageName";
    id v9 = +[NSString sc_deviceIconNameForIdentifier:@"device"];
    v133[3] = @"activateBehavior";
    v134[2] = v9;
    v134[3] = &off_1001BBFD0;
    id v10 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:4];
    v135 = v10;
    id v11 = &v135;
LABEL_3:
    id v12 = +[NSArray arrayWithObjects:v11 count:1];
LABEL_4:

LABEL_11:
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemEdit])
  {
    id v12 = [v7 textElement];

    if (!v12) {
      goto LABEL_12;
    }
    v131[0] = @"action_edit";
    v130[0] = @"identifier";
    v130[1] = @"title";
    id v8 = sub_100040EC8(@"EDIT");
    v131[1] = v8;
    v131[2] = @"SCATIcon_edit";
    v130[2] = @"imageName";
    v130[3] = @"activateBehavior";
    v131[3] = &off_1001BBFD0;
    id v9 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:4];
    v132 = v9;
    v13 = &v132;
    goto LABEL_10;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemEscape])
  {
    v128[0] = @"action_escape";
    v127[0] = @"identifier";
    v127[1] = @"title";
    id v8 = sub_100040EC8(@"ESCAPE");
    v127[2] = @"activateBehavior";
    v128[1] = v8;
    v128[2] = &off_1001BBFB8;
    id v9 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:3];
    v129 = v9;
    v13 = &v129;
LABEL_10:
    id v12 = +[NSArray arrayWithObjects:v13 count:1];
    goto LABEL_11;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemToggleDictation])
  {
    id v8 = [v7 keyboardApplication];
    v15 = [v8 uiElement];
    unsigned int v16 = [v15 BOOLWithAXAttribute:3034];

    if (v16)
    {
      id v17 = [v8 uiElement];
      id v18 = [v17 BOOLWithAXAttribute:3010];

      v125[0] = @"action_toggle_dictation";
      v124[0] = @"identifier";
      v124[1] = @"title";
      if (v18) {
        uint64_t v19 = @"STOP_DICTATION";
      }
      else {
        uint64_t v19 = @"START_DICTATION";
      }
      id v9 = sub_100040EC8(v19);
      v125[1] = v9;
      v125[2] = @"SCATIcon_device_siri";
      v124[2] = @"imageName";
      v124[3] = @"allowsDwellScanningToAbortAfterTimeout";
      id v10 = +[NSNumber numberWithBool:v18];
      v124[4] = @"activateBehavior";
      v125[3] = v10;
      v125[4] = &off_1001BBFE8;
      v20 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:5];
      v126 = v20;
      id v12 = +[NSArray arrayWithObjects:&v126 count:1];

      goto LABEL_4;
    }
LABEL_58:

    goto LABEL_59;
  }
  if (![v6 isEqualToString:AXSSwitchControlMenuItemGestures])
  {
    uint64_t v21 = AXSSwitchControlMenuItemHome;
    if ([v6 isEqualToString:AXSSwitchControlMenuItemHome])
    {
      v119[0] = @"action_home";
      v118[0] = @"identifier";
      v118[1] = @"title";
      id v8 = sub_100040EC8(@"SCAT_QUICK_ITEM_HOME");
      v119[1] = v8;
      v119[2] = @"SCATIcon_device_home";
      v118[2] = @"imageName";
      v118[3] = @"guidedAccess";
      v118[4] = @"activateBehavior";
      v119[3] = &__kCFBooleanFalse;
      v119[4] = &off_1001BBFD0;
      id v9 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:5];
      v120 = v9;
      v13 = &v120;
      goto LABEL_10;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemIncrementDecrement])
    {
      v22 = [v7 element];
      unint64_t v23 = (unint64_t)[v22 scatTraits];
      unint64_t v24 = kAXAdjustableTrait & ~v23;

      if (!v24)
      {
        long long v25 = +[HNDAccessibilityManager sharedManager];
        if ([v25 applicationIsRTL]) {
          long long v26 = @"SCATIcon_action_increment";
        }
        else {
          long long v26 = @"SCATIcon_action_decrement";
        }
        long long v27 = v26;

        long long v28 = +[HNDAccessibilityManager sharedManager];
        if ([v28 applicationIsRTL]) {
          v29 = @"SCATIcon_action_decrement";
        }
        else {
          v29 = @"SCATIcon_action_increment";
        }
        v30 = v29;

        v116[0] = @"action_decrement";
        v115[0] = @"identifier";
        v115[1] = @"title";
        v31 = sub_100040EC8(@"DECREMENT");
        v116[1] = v31;
        v116[2] = v27;
        v115[2] = @"imageName";
        v115[3] = @"activateBehavior";
        v116[3] = &off_1001BBFE8;
        v32 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:4];
        v117[0] = v32;
        v114[0] = @"action_increment";
        v113[0] = @"identifier";
        v113[1] = @"title";
        v33 = sub_100040EC8(@"INCREMENT");
        v114[1] = v33;
        v114[2] = v30;
        v113[2] = @"imageName";
        v113[3] = @"activateBehavior";
        v114[3] = &off_1001BBFE8;
        v34 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:4];
        v117[1] = v34;
        id v12 = +[NSArray arrayWithObjects:v117 count:2];

        goto LABEL_12;
      }
      goto LABEL_59;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemNavigationMode])
    {
      id v71 = 0;
      id v72 = 0;
      [a1 _title:&v72 imageForNavigationItem:&v71];
      id v35 = v72;
      id v36 = v71;
      id v12 = objc_alloc_init((Class)NSMutableArray);
      if (v35 && v36)
      {
        v111[0] = @"identifier";
        v111[1] = @"title";
        v112[0] = @"settings_navigationMode";
        v112[1] = v35;
        v111[2] = @"imageName";
        v111[3] = @"activateBehavior";
        v112[2] = v36;
        v112[3] = &off_1001BBFB8;
        v37 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:4];
        [v12 addObject:v37];
      }
      else
      {
        v37 = SWCHLogMenu();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          sub_1001153E4((uint64_t)v6, v37);
        }
      }

      v38 = +[AXSettings sharedInstance];
      unsigned int v39 = [v38 switchControlUseCameraForPointMode];

      if (v39)
      {
        id v69 = 0;
        id v70 = 0;
        [a1 _title:&v70 imageForAlternateNavigationItem:&v69];
        id v40 = v70;
        id v41 = v69;
        v42 = v41;
        if (v40 && v41)
        {
          v109[0] = @"identifier";
          v109[1] = @"title";
          v110[0] = @"settings_alternativeNavigationMode";
          v110[1] = v40;
          v109[2] = @"imageName";
          v109[3] = @"activateBehavior";
          v110[2] = v41;
          v110[3] = &off_1001BBFB8;
          v43 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:4];
          [v12 addObject:v43];
        }
        else
        {
          v43 = SWCHLogMenu();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            sub_10011536C((uint64_t)v6, v43);
          }
        }
      }
      goto LABEL_54;
    }
    if ([v6 isEqualToString:v21])
    {
      v107[0] = @"action_home";
      v106[0] = @"identifier";
      v106[1] = @"title";
      id v8 = sub_100040EC8(@"SCAT_QUICK_ITEM_HOME");
      v107[1] = v8;
      v107[2] = @"SCATIcon_device_home";
      v106[2] = @"imageName";
      v106[3] = @"guidedAccess";
      v106[4] = @"activateBehavior";
      v107[3] = &__kCFBooleanFalse;
      v107[4] = &off_1001BBFD0;
      id v9 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:5];
      v108 = v9;
      v13 = &v108;
      goto LABEL_10;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemRecipes])
    {
      v44 = +[AXSettings sharedInstance];
      v45 = [v44 switchControlRecipes];
      if ([v45 count])
      {
      }
      else
      {
        v52 = [v7 screenPoint];

        if (!v52) {
          goto LABEL_59;
        }
      }
      v104[0] = @"recipes";
      v103[0] = @"identifier";
      v103[1] = @"title";
      id v8 = sub_100040EC8(@"RECIPES");
      v103[2] = @"activateBehavior";
      v104[1] = v8;
      v104[2] = &off_1001BBFD0;
      id v9 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
      v105 = v9;
      v13 = &v105;
      goto LABEL_10;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemRefineSelection])
    {
      id v8 = [v7 pointPicker];
      if ([v8 allowsSelectionRefinement])
      {
        v101[0] = @"action_refinePoint";
        v100[0] = @"identifier";
        v100[1] = @"title";
        id v9 = sub_100040EC8(@"REFINE-SELECTION");
        v100[2] = @"activateBehavior";
        v101[1] = v9;
        v101[2] = &off_1001BBFB8;
        id v10 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];
        v102 = v10;
        id v11 = &v102;
        goto LABEL_3;
      }
      goto LABEL_58;
    }
    if (![v6 isEqualToString:AXSSwitchControlMenuItemScroll])
    {
      if ([v6 isEqualToString:AXSSwitchControlMenuItemSettings])
      {
        v95[0] = @"settings";
        v94[0] = @"identifier";
        v94[1] = @"title";
        id v8 = sub_100040EC8(@"SETTINGS");
        v95[1] = v8;
        v95[2] = &__kCFBooleanFalse;
        v94[2] = @"guidedAccess";
        v94[3] = @"activateBehavior";
        v95[3] = &off_1001BBFD0;
        id v9 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:4];
        v96 = v9;
        v13 = &v96;
        goto LABEL_10;
      }
      if ([v6 isEqualToString:AXSSwitchControlMenuItemMediaControls])
      {
        v92[0] = @"mediacontrols";
        v91[0] = @"identifier";
        v91[1] = @"title";
        id v8 = sub_100040EC8(@"MEDIA_CONTROLS");
        v92[1] = v8;
        v92[2] = &__kCFBooleanFalse;
        v91[2] = @"guidedAccess";
        v91[3] = @"activateBehavior";
        v92[3] = &off_1001BBFD0;
        id v9 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:4];
        v93 = v9;
        v13 = &v93;
        goto LABEL_10;
      }
      if ([v6 isEqualToString:AXSSwitchControlMenuItemItemMenu])
      {
        v55 = [v7 delegate];
        if ([v55 shouldAddItemSpecificMenuOptionsToMenu:v7])
        {
          v56 = [v7 delegate];
          id v57 = [v56 itemMenuStateForMenu:v7];

          if (v57 != (id)2)
          {
            v89[0] = @"action_itemSpecificMenu";
            v88[0] = @"identifier";
            v88[1] = @"title";
            id v8 = sub_100040EC8(@"ITEM_SPECIFIC_MENU");
            v89[1] = v8;
            v89[2] = @"SCATIcon_settings_moveTop";
            v88[2] = @"imageName";
            v88[3] = @"activateBehavior";
            v89[3] = &off_1001BBFB8;
            id v9 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:4];
            v90 = v9;
            v13 = &v90;
            goto LABEL_10;
          }
        }
        else
        {
        }
        goto LABEL_59;
      }
      if (![v6 isEqualToString:AXSSwitchControlMenuItemLockItemMenu])
      {
        if ([v6 isEqualToString:AXSSwitchControlMenuItemATVRemoteMenu])
        {
          v83[0] = @"action_ATVRemoteMenu";
          v82[0] = @"identifier";
          v82[1] = @"title";
          id v8 = sub_100040EC8(@"PRESS_MENU");
          v83[1] = v8;
          v83[2] = @"SCATIcon_action_menu";
          v82[2] = @"imageName";
          v82[3] = @"activateBehavior";
          v83[3] = &off_1001BBFE8;
          id v9 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:4];
          v84 = v9;
          v13 = &v84;
          goto LABEL_10;
        }
        if ([v6 isEqualToString:AXSSwitchControlMenuItemSwitchDisplay])
        {
          v80[0] = @"action_switchDisplay";
          v79[0] = @"identifier";
          v79[1] = @"title";
          id v8 = sub_100040EC8(@"SWITCH_DISPLAY");
          v80[1] = v8;
          v80[2] = @"SCATIcon_switch_display";
          v79[2] = @"imageName";
          v79[3] = @"activateBehavior";
          v80[3] = &off_1001BBFB8;
          id v9 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
          v81 = v9;
          v13 = &v81;
          goto LABEL_10;
        }
        if ([v6 isEqualToString:AXSSwitchControlMenuItemSiriShortcuts])
        {
          if (sub_100040890())
          {
            v66 = +[AXSiriShortcutsManager sharedManager];
            v67 = [v66 shortcuts];
            id v68 = [v67 count];

            if (v68)
            {
              v77[0] = @"siri_shortcuts";
              v76[0] = @"identifier";
              v76[1] = @"title";
              id v8 = sub_100040EC8(@"SIRI_SHORTCUTS");
              v77[1] = v8;
              v77[2] = &__kCFBooleanFalse;
              v76[2] = @"guidedAccess";
              v76[3] = @"activateBehavior";
              v77[3] = &off_1001BBFD0;
              id v9 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:4];
              v78 = v9;
              v13 = &v78;
              goto LABEL_10;
            }
          }
        }
        else if ([v6 isEqualToString:AXSSwitchControlMenuItemAppleWatchRemoteScreen])
        {
          if (sub_100040994())
          {
            v74[0] = @"action_applewatchRemoteScreen";
            v73[0] = @"identifier";
            v73[1] = @"title";
            id v8 = sub_100040EC8(@"APPLE_WATCH_REMOTE_SCREEN");
            v73[2] = @"activateBehavior";
            v74[1] = v8;
            v74[2] = &off_1001BBFB8;
            id v9 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
            v75 = v9;
            v13 = &v75;
            goto LABEL_10;
          }
        }
        else
        {
          _AXAssert();
        }
        goto LABEL_59;
      }
      v58 = [v7 delegate];
      unsigned int v59 = [v58 shouldAddItemSpecificMenuOptionsToMenu:v7];

      if (!v59)
      {
LABEL_59:
        id v12 = 0;
        goto LABEL_12;
      }
      v60 = [v7 delegate];
      id v61 = [v60 itemMenuStateForMenu:v7];

      v86[0] = @"action_lockItemSpecificMenu";
      v85[0] = @"identifier";
      v85[1] = @"title";
      if (v61 == (id)2)
      {
        sub_100040EC8(@"UNLOCK_ITEM_SPECIFIC_MENU");
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        CFStringRef v62 = @"SCATIcon_action_unlockItemMenu";
      }
      else
      {
        sub_100040EC8(@"LOCK_ITEM_SPECIFIC_MENU");
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        CFStringRef v62 = @"SCATIcon_action_lockItemMenu";
      }
      v86[1] = v35;
      v86[2] = v62;
      v85[2] = @"imageName";
      v85[3] = @"activateBehavior";
      v86[3] = &off_1001BBFB8;
      v65 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:4];
      v87 = v65;
      id v12 = +[NSArray arrayWithObjects:&v87 count:1];

LABEL_54:
      goto LABEL_12;
    }
    v46 = [v7 delegate];
    unsigned int v47 = [v46 shouldShowAppWideScrollActionsInMenu:v7];

    if (v47)
    {
      v48 = +[HNDAccessibilityManager sharedManager];
      v49 = [v48 scrollViewsForAction:2006];
      if ([v49 count])
      {
LABEL_67:

        goto LABEL_73;
      }
      v50 = [v48 scrollViewsForAction:2007];
      if ([v50 count])
      {
LABEL_66:

        goto LABEL_67;
      }
      v51 = [v48 scrollViewsForAction:2009];
      if ([v51 count])
      {

        goto LABEL_66;
      }
      v63 = [v48 scrollViewsForAction:2008];
      id v64 = [v63 count];

      if (!v64) {
        goto LABEL_59;
      }
    }
    else
    {
      v53 = [v7 element];
      unsigned __int8 v54 = +[SCATModernMenuScrollSheet isValidForElement:v53];

      if ((v54 & 1) == 0) {
        goto LABEL_59;
      }
    }
LABEL_73:
    v98[0] = @"action_scroll";
    v97[0] = @"identifier";
    v97[1] = @"title";
    id v8 = sub_100040EC8(@"SCROLL");
    v97[2] = @"activateBehavior";
    v98[1] = v8;
    v98[2] = &off_1001BBFD0;
    id v9 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:3];
    v99 = v9;
    v13 = &v99;
    goto LABEL_10;
  }
  id v12 = [v7 screenPoint];

  if (v12)
  {
    v122[0] = @"gestures";
    v121[0] = @"identifier";
    v121[1] = @"title";
    id v8 = sub_100040EC8(@"SCAT_QUICK_ITEM_GESTURES");
    v122[1] = v8;
    v122[2] = @"SCATIcon_gestures";
    v121[2] = @"imageName";
    v121[3] = @"activateBehavior";
    v122[3] = &off_1001BBFD0;
    id v9 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];
    v123 = v9;
    v13 = &v123;
    goto LABEL_10;
  }
LABEL_12:

  return v12;
}

+ (id)_additionalMenuItemsForHomeActionForMenu:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[AXSpringBoardServer isAvailable])
  {
    id v7 = +[AXSpringBoardServer server];
    unsigned int v8 = [v7 isScreenLockedWithPasscode:0];

    id v9 = +[AXSpringBoardServer server];
    unsigned __int8 v10 = [v9 isControlCenterVisible];

    id v11 = +[AXSpringBoardServer server];
    unsigned __int8 v12 = [v11 isShowingLongLookNotification];

    v13 = 0;
    if (v8 && (v10 & 1) == 0 && (v12 & 1) == 0)
    {
      v14 = +[HNDAccessibilityManager sharedManager];
      unsigned int v15 = [v14 applicationIsRTL];

      BOOL v16 = v15 == 0;
      if (v15) {
        uint64_t v17 = 2009;
      }
      else {
        uint64_t v17 = 2008;
      }
      if (v16) {
        uint64_t v18 = 2009;
      }
      else {
        uint64_t v18 = 2008;
      }
      v13 = +[NSMutableArray array];
      uint64_t v19 = +[SCATMenuItemFactory menuItemsForItem:AXSSwitchControlMenuItemDeviceNotificationCenter menu:v5 delegate:v6];
      [v13 addObjectsFromArray:v19];

      v20 = +[SCATModernMenuScrollFactory menuItemForScrollAction:v17 withDelegate:v6];
      [v13 axSafelyAddObject:v20];

      uint64_t v21 = +[SCATModernMenuScrollFactory menuItemForScrollAction:v18 withDelegate:v6];
      [v13 axSafelyAddObject:v21];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v28 = a5;
  unsigned int v8 = [v7 objectForKey:@"identifier"];
  id v9 = [v7 objectForKey:@"title"];
  v29 = [v7 objectForKey:@"imageName"];
  unsigned __int8 v10 = [v7 objectForKey:@"allowsDwellScanningToAbortAfterTimeout"];
  unsigned int v27 = [v10 BOOLValue];

  id v11 = [v7 objectForKey:@"activateBehavior"];
  id v26 = [v11 unsignedIntegerValue];

  unsigned __int8 v12 = [v7 objectForKey:@"guidedAccess"];
  v13 = v12;
  if (v12) {
    uint64_t v14 = (uint64_t)[v12 BOOLValue];
  }
  else {
    uint64_t v14 = 1;
  }
  unsigned int v15 = [v7 objectForKeyedSubscript:@"assistiveAccess"];
  BOOL v16 = v15;
  unsigned __int8 v17 = v14;
  if (v15) {
    unsigned __int8 v17 = [v15 BOOLValue];
  }
  if ([v8 isEqualToString:@"action_activate"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD5C0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_scroll"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD5E0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_home"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD600;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_dismissAutocorrection"])
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10009B5B8;
    v38[3] = &unk_1001AD620;
    v38[4] = a1;
    v20 = v38;
LABEL_16:
    uint64_t v19 = objc_retainBlock(v20);
LABEL_17:
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_acceptCandidate"])
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10009B638;
    v37[3] = &unk_1001AD620;
    v37[4] = a1;
    v20 = v37;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"gestures"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD640;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"device"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD660;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"settings"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD680;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"mediacontrols"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD6A0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"siri_shortcuts"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD6C0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"recipes"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD6E0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_decrement"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD700;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_increment"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD720;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_alternateKeys"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD740;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_edit"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD760;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_zoomIn"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD780;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_zoomOut"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD7A0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_escape"])
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10009BBD0;
    v36[3] = &unk_1001AD620;
    v36[4] = a1;
    v20 = v36;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"action_toggle_dictation"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD7C0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_refinePoint"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD7E0;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"settings_navigationMode"])
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10009BC88;
    v35[3] = &unk_1001AD620;
    v35[4] = a1;
    v20 = v35;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"settings_alternativeNavigationMode"])
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10009BC90;
    v34[3] = &unk_1001AD620;
    v34[4] = a1;
    v20 = v34;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"action_sideApp"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD800;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_itemSpecificMenu"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD820;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_ATVRemoteMenu"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD840;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_switchDisplay"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD860;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"action_lockItemSpecificMenu"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD880;
    goto LABEL_18;
  }
  if ([v8 hasPrefix:@"customAction_"])
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10009BE7C;
    v32[3] = &unk_1001ABE78;
    id v33 = v8;
    uint64_t v19 = objc_retainBlock(v32);
    unint64_t v24 = v33;
LABEL_73:

    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"action_cancelDrag"])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &stru_1001AD8A0;
  }
  else
  {
    if ([v8 containsString:@"sideApp_gesture"])
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10009BF48;
      v30[3] = &unk_1001ABE78;
      id v31 = v8;
      uint64_t v19 = objc_retainBlock(v30);
      unint64_t v24 = v31;
      goto LABEL_73;
    }
    if (![v8 isEqualToString:@"action_applewatchRemoteScreen"])
    {
      uint64_t v19 = 0;
      goto LABEL_17;
    }
    uint64_t v18 = AXUIAssistiveTouchImageForName();
    uint64_t v19 = &stru_1001AD8C0;
  }
LABEL_18:
  uint64_t v21 = [(id)objc_opt_class() updateBlockForIdentifier:v8];
  LOBYTE(v25) = v17;
  v22 = +[SCATModernMenuItem itemWithIdentifier:v8 delegate:v28 title:v9 imageName:v29 activateBehavior:v26 allowedWithGuidedAccess:v14 allowedWithAssistiveAccess:v25 activateHandler:v19 updateHandler:v21];

  [v22 setAllowsDwellScanningToAbortAfterTimeout:v27];
  if (v18) {
    [v22 setImage:v18];
  }

  return v22;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"action_toggle_dictation"])
  {
    id v5 = &stru_1001AD8E0;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"settings_navigationMode"])
  {
    id v6 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    id v7 = sub_10009C2BC;
LABEL_7:
    v6[2] = v7;
    v6[3] = &unk_1001ABF58;
    v6[4] = a1;
    id v5 = objc_retainBlock(v6);
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"settings_alternativeNavigationMode"])
  {
    id v6 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    id v7 = sub_10009C348;
    goto LABEL_7;
  }
  id v5 = &stru_1001AD900;
LABEL_9:

  return v5;
}

+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3
{
  v3 = sub_100040EC8(@"FingersFormat");
  id v4 = AXFormatInteger();
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);

  return v5;
}

+ (id)_imageNameForNumberOfFingers:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return *(&off_1001AD968 + a3 - 1);
  }
}

+ (void)_title:(id *)a3 imageForNavigationItem:(id *)a4
{
  id v6 = +[AXSettings sharedInstance];
  id v7 = [v6 assistiveTouchScanningMode];
  if ((unint64_t)v7 > 3)
  {
    unsigned int v8 = 0;
    id v9 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unsigned int v8 = *(&off_1001AD9B0 + (void)v7);
  id v9 = sub_100040EC8(*(&off_1001AD990 + (void)v7));
  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:
  id v10 = v9;
  if (a3) {
    *a3 = v9;
  }
}

+ (void)_title:(id *)a3 imageForAlternateNavigationItem:(id *)a4
{
  id v8 = +[AXSettings sharedInstance];
  id v6 = [v8 assistiveTouchScanningMode];
  if ((unint64_t)v6 <= 3)
  {
    id v7 = *(&off_1001AD9F0 + (void)v6);
    sub_100040EC8(*(&off_1001AD9D0 + (void)v6));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v7;
  }
}

+ (void)_handlePerformEscapeWithMenu:(id)a3
{
  id v4 = [a3 element];
  id v7 = v4;
  if (v4)
  {
    [v4 scatPerformAction:2013];
  }
  else
  {
    id v5 = [a1 _escapableElements];
    id v6 = [v5 firstObject];

    [v6 performAction:2013];
  }
}

+ (id)_escapableElements
{
  v2 = +[HNDAccessibilityManager sharedManager];
  v3 = [v2 elementsForMatchingBlock:&stru_1001AD920];

  return v3;
}

+ (id)_typingCandidates
{
  v2 = +[HNDAccessibilityManager sharedManager];
  v3 = [v2 firstResponder];
  id v4 = [v3 elementForAttribute:2017];
  id v5 = [v4 typingCandidates];

  return v5;
}

+ (void)toggleNavigationMode
{
  id v3 = +[AXSettings sharedInstance];
  unint64_t v2 = (unint64_t)[v3 assistiveTouchScanningMode];
  if (v2 <= 3) {
    [v3 setAssistiveTouchScanningMode:qword_100197980[v2]];
  }
}

+ (void)toggleAlternativeNavigationMode
{
  id v6 = +[AXSettings sharedInstance];
  id v2 = [v6 assistiveTouchScanningMode];
  if ((unint64_t)v2 >= 3)
  {
    if (v2 != (id)3) {
      goto LABEL_7;
    }
    uint64_t v5 = 1;
  }
  else
  {
    id v3 = +[AXSpringBoardServer server];
    unsigned __int8 v4 = [v3 isContinuitySessionActive];

    if (v4) {
      goto LABEL_7;
    }
    uint64_t v5 = 3;
  }
  [v6 setAssistiveTouchScanningMode:v5];
LABEL_7:
}

+ (id)_menuItemsForElementSpecificActionsForMenu:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 element];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  v55 = [v8 scatCustomActions];
  id v10 = objc_msgSend(a1, "menuItemsForCustomActions:menu:delegate:");
  [v9 axSafelyAddObjectsFromArray:v10];

  unsigned __int8 v54 = [v8 scatCustomHardwareActions];
  id v11 = +[SCATMenuHardwareActionsMovementFactory menuItemsForCustomHardwareActions:menu:delegate:](SCATMenuHardwareActionsMovementFactory, "menuItemsForCustomHardwareActions:menu:delegate:");
  [v9 axSafelyAddObjectsFromArray:v11];

  unsigned __int8 v12 = +[SCATScannerManager sharedManager];
  unsigned int v13 = [v12 isDragActive];

  id v59 = v9;
  id v61 = v8;
  if (v13)
  {
    if (v8)
    {
      uint64_t v14 = [v8 scatDrops];
      unsigned int v15 = [a1 menuItemsForDrops:v14 menu:v6 delegate:v7];
      [v9 axSafelyAddObjectsFromArray:v15];
    }
    else
    {
      unsigned __int8 v17 = [SCATDropMenuItem alloc];
      uint64_t v18 = sub_100040EC8(@"DROP_HERE");
      uint64_t v19 = [v6 screenPoint];
      [v19 CGPointValue];
      uint64_t v14 = -[SCATDropMenuItem initWithTitle:fixedSpaceScreenPoint:delegate:menu:](v17, "initWithTitle:fixedSpaceScreenPoint:delegate:menu:", v18, v7, v6);

      [v9 addObject:v14];
    }

    v78[0] = @"action_cancelDrag";
    v77[0] = @"identifier";
    v77[1] = @"title";
    v20 = sub_100040EC8(@"CANCEL_DRAG");
    v78[1] = v20;
    v78[2] = @"SCATIcon_gestures_drop";
    v77[2] = @"imageName";
    v77[3] = @"activateBehavior";
    v78[3] = &off_1001BBFB8;
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:4];
    v22 = [a1 menuItemWithItemDictionary:v21 menu:v6 delegate:v7];
    [v9 addObject:v22];

    id v8 = v61;
  }
  else
  {
    BOOL v16 = [a1 dragMenuItemsForElement:v8 delegate:v7];
    [v9 axSafelyAddObjectsFromArray:v16];
  }
  if ([v8 scatCanShowAlternateKeys])
  {
    v76[0] = @"action_alternateKeys";
    v75[0] = @"identifier";
    v75[1] = @"title";
    unint64_t v23 = sub_100040EC8(@"ALT_KEYS");
    v75[2] = @"activateBehavior";
    v76[1] = v23;
    v76[2] = &off_1001BBFB8;
    unint64_t v24 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:3];
    uint64_t v25 = [a1 menuItemWithItemDictionary:v24 menu:v6 delegate:v7];
    [v9 addObject:v25];

    id v8 = v61;
  }
  id v26 = [a1 _typingCandidates];
  v53 = v26;
  if ([v26 count] == (id)1
    && ([v26 lastObject],
        unsigned int v27 = objc_claimAutoreleasedReturnValue(),
        unint64_t v28 = (unint64_t)[v27 traits],
        unint64_t v29 = UIAccessibilityTraitSelectionDismissesItem & v28,
        v27,
        v29))
  {
    v74[0] = @"action_dismissAutocorrection";
    v73[0] = @"identifier";
    v73[1] = @"title";
    v30 = sub_100040EC8(@"DISMISS_AUTOCORRECTION");
    v73[2] = @"activateBehavior";
    v74[1] = v30;
    v74[2] = &off_1001BBFB8;
    id v31 = v74;
    v32 = v73;
  }
  else
  {
    if (![v26 count]) {
      goto LABEL_15;
    }
    v72[0] = @"action_acceptCandidate";
    v71[0] = @"identifier";
    v71[1] = @"title";
    v30 = sub_100040EC8(@"CHOOSE_CANDIDATE");
    v71[2] = @"activateBehavior";
    v72[1] = v30;
    v72[2] = &off_1001BBFB8;
    id v31 = v72;
    v32 = v71;
  }
  id v33 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v32 count:3];
  v34 = [a1 menuItemWithItemDictionary:v33 menu:v6 delegate:v7];
  [v59 addObject:v34];

  id v8 = v61;
LABEL_15:
  if ([v8 scatSupportsAction:2001])
  {
    v70[0] = @"action_zoomIn";
    v69[0] = @"identifier";
    v69[1] = @"title";
    id v35 = sub_100040EC8(@"ZOOM_IN");
    v69[2] = @"activateBehavior";
    v70[1] = v35;
    v70[2] = &off_1001BBFB8;
    id v36 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];
    v37 = [a1 menuItemWithItemDictionary:v36 menu:v6 delegate:v7];
    [v59 addObject:v37];

    v68[0] = @"action_zoomOut";
    v67[0] = @"identifier";
    v67[1] = @"title";
    v38 = sub_100040EC8(@"ZOOM_OUT");
    v67[2] = @"activateBehavior";
    v68[1] = v38;
    v68[2] = &off_1001BBFB8;
    unsigned int v39 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
    id v40 = [a1 menuItemWithItemDictionary:v39 menu:v6 delegate:v7];
    [v59 addObject:v40];

    id v8 = v61;
  }
  id v57 = v7;
  v58 = v6;
  id v41 = [v8 scatSupportedGestures];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v42 = [v41 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v42)
  {
    id v43 = v42;
    BOOL v44 = 0;
    uint64_t v45 = *(void *)v63;
    uint64_t v60 = kAXTextEntryTrait;
    uint64_t v56 = AXSSwitchControlMenuItemGesturesTapAndHold;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(v41);
        }
        if (v44)
        {
          BOOL v44 = 1;
          continue;
        }
        unsigned int v47 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v48 = [v47 objectForKey:@"AXSupportedGestureTypeKey"];
        if ([v48 intValue] == 1)
        {
          v49 = [v47 objectForKey:@"AXGestureFingerCountKey"];
          unsigned int v50 = [v49 intValue];
          BOOL v44 = v50 == 1;
          if (v50 == 1)
          {
            unint64_t v51 = v60 & (unint64_t)[v61 scatTraits];

            if (v51)
            {
              BOOL v44 = 0;
              continue;
            }
            v48 = +[SCATMenuItemFactory menuItemsForItem:v56 menu:v58 delegate:v57];
            v49 = [v48 firstObject];
            [v59 addObject:v49];
          }
        }
        else
        {
          BOOL v44 = 0;
        }
      }
      id v43 = [v41 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v43);
  }

  return v59;
}

+ (id)menuItemsForCustomActions:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v38 = a5;
  if ([v8 count])
  {
    id v35 = +[NSMutableSet set];
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v8;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(obj);
          }
          unsigned int v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v14 = [v13 objectForKeyedSubscript:@"CustomActionShortName"];
          if (!v14)
          {
            uint64_t v14 = [v13 objectForKeyedSubscript:@"CustomActionName"];
          }
          unsigned int v15 = [a1 _capitalizedMenuTitle:v14];

          v44[0] = @"identifier";
          BOOL v16 = [v13 objectForKeyedSubscript:@"CustomActionIdentifier"];
          unsigned __int8 v17 = +[NSString stringWithFormat:@"%@%@", @"customAction_", v16];
          v45[0] = v17;
          v45[1] = v15;
          v44[1] = @"title";
          v44[2] = @"activateBehavior";
          v45[2] = &off_1001BBFB8;
          uint64_t v18 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
          uint64_t v19 = [a1 menuItemWithItemDictionary:v18 menu:v39 delegate:v38];

          v20 = [v13 objectForKeyedSubscript:@"CustomActionImage"];
          uint64_t v21 = +[UIScreen mainScreen];
          [v21 scale];
          v22 = +[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v20);
          [v19 setImage:v22];

          unint64_t v23 = [v19 image];
          unint64_t v24 = +[UIColor whiteColor];
          uint64_t v25 = [v23 imageWithTintColor:v24 renderingMode:1];
          [v19 setImage:v25];

          id v26 = [v13 objectForKeyedSubscript:@"CustomActionImageOrientation"];
          id v27 = [v26 integerValue];

          if (v27)
          {
            if (v27 == (id)4)
            {
              unint64_t v28 = [v19 image];
              unint64_t v29 = [v28 imageWithHorizontallyFlippedOrientation];
              [v19 setImage:v29];
            }
            else
            {
              id v33 = v13;
              _AXAssert();
            }
          }
          v30 = objc_msgSend(v19, "image", v33);

          if (!v30)
          {
            id v31 = [a1 _fallbackImageForCustomActionMenuItem:v19 charactersInUse:v35];
            [v19 setImage:v31];
          }
          [v37 addObject:v19];
        }
        id v10 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v10);
    }

    id v8 = v34;
  }
  else
  {
    id v37 = &__NSArray0__struct;
  }

  return v37;
}

+ (id)dragMenuItemsForElement:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SCATScannerManager sharedManager];
  unsigned __int8 v8 = [v7 isDragActive];

  if (v8)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    id v10 = [v5 scatDrags];
    uint64_t v11 = AXNamesForDrags();
    unsigned __int8 v12 = +[NSMutableArray array];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10009D5B8;
    v17[3] = &unk_1001AD948;
    id v18 = v11;
    id v19 = v5;
    id v20 = v6;
    id v13 = v12;
    id v21 = v13;
    id v14 = v11;
    [v10 enumerateObjectsUsingBlock:v17];
    unsigned int v15 = v21;
    id v9 = v13;
  }

  return v9;
}

+ (id)menuItemsForDrops:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[SCATScannerManager sharedManager];
  unsigned int v11 = [v10 isDragActive];

  if (v11)
  {
    unsigned __int8 v12 = +[NSMutableArray array];
    AXNamesForDrops();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10009D7CC;
    v18[3] = &unk_1001AD948;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = v9;
    id v21 = v8;
    id v13 = v12;
    id v22 = v13;
    id v14 = v19;
    [v7 enumerateObjectsUsingBlock:v18];
    unsigned int v15 = v22;
    id v16 = v13;
  }
  else
  {
    id v16 = &__NSArray0__struct;
  }

  return v16;
}

+ (id)_fallbackImageForCustomActionMenuItem:(id)a3 charactersInUse:(id)a4
{
  id v5 = a4;
  id v6 = [a3 title];
  id v7 = sub_100040EC8(@"DELETE");
  unsigned int v8 = [v6 hasPrefix:v7];

  if (v8)
  {
    id v9 = +[UIImage scat_cachedMenuImageForImageName:@"SCATIcon_action_delete"];
    if (v9) {
      goto LABEL_9;
    }
    CFStringRef v10 = @"SCATIcon_action_delete";
LABEL_7:
    id v13 = +[UIImage _deviceSpecificImageNamed:v10];
    id v14 = +[UIColor whiteColor];
    id v9 = [v13 imageWithTintColor:v14 renderingMode:1];

    +[UIImage scat_setCachedMenuImage:v9 forImageName:v10];
    goto LABEL_9;
  }
  unsigned int v11 = sub_100040EC8(@"MORE");
  unsigned int v12 = [v6 hasPrefix:v11];

  if (v12)
  {
    id v9 = +[UIImage scat_cachedMenuImageForImageName:@"SCATIcon_action_more"];
    if (v9) {
      goto LABEL_9;
    }
    CFStringRef v10 = @"SCATIcon_action_more";
    goto LABEL_7;
  }
  id v9 = +[UIImage scat_singleCharacterImageForTitle:v6 charactersInUse:v5];
LABEL_9:

  return v9;
}

+ (id)_capitalizedMenuTitle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  id v5 = [v3 localizedCapitalizedString];
  if ([v3 length])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v3 rangeOfComposedCharacterSequenceAtIndex:v6];
      uint64_t v9 = v8;
      CFStringRef v10 = objc_msgSend(v3, "substringWithRange:", v7, v8);
      unsigned int v11 = [v10 uppercaseString];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = [v5 rangeOfComposedCharacterSequenceAtIndex:v6];
        uint64_t v15 = objc_msgSend(v5, "substringWithRange:", v13, v14);

        CFStringRef v10 = (void *)v15;
      }
      [v4 appendString:v10];
      v6 += v9;
    }
    while (v6 < (unint64_t)[v3 length]);
  }

  return v4;
}

@end