@interface SCATModernMenuScrollFactory
+ (id)_fallbackAncestorForAutoscrollForMenu:(id)a3;
+ (id)_fallbackAncestorForScrollToTopForMenu:(id)a3;
+ (id)_menuItemDetailsForScrollAction:(int)a3;
+ (id)menuItemForScrollAction:(int)a3 withDelegate:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
+ (void)_performFallbackScrollAncestorAction:(int)a3 withMenu:(id)a4;
+ (void)_performScrollAction:(int)a3 withMenu:(id)a4;
@end

@implementation SCATModernMenuScrollFactory

+ (id)menuItemForScrollAction:(int)a3 withDelegate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [a1 _menuItemDetailsForScrollAction:v4];
  v8 = [v6 menu];
  v9 = [a1 menuItemWithItemDictionary:v7 menu:v8 delegate:v6];

  return v9;
}

+ (id)_menuItemDetailsForScrollAction:(int)a3
{
  switch(a3)
  {
    case 2006:
      v30[0] = @"action_scrollDown";
      v29[0] = @"identifier";
      v29[1] = @"title";
      v3 = sub_100040EC8(@"Scroll-Down");
      v29[2] = @"activateBehavior";
      v30[1] = v3;
      v30[2] = &off_1001BC060;
      uint64_t v4 = v30;
      v5 = v29;
      goto LABEL_18;
    case 2007:
      v28[0] = @"action_scrollUp";
      v27[0] = @"identifier";
      v27[1] = @"title";
      v3 = sub_100040EC8(@"Scroll-Up");
      v27[2] = @"activateBehavior";
      v28[1] = v3;
      v28[2] = &off_1001BC060;
      uint64_t v4 = v28;
      v5 = v27;
      goto LABEL_18;
    case 2008:
      v26[0] = @"action_scrollLeft";
      v25[0] = @"identifier";
      v25[1] = @"title";
      v3 = sub_100040EC8(@"Scroll-Left");
      v25[2] = @"activateBehavior";
      v26[1] = v3;
      v26[2] = &off_1001BC060;
      uint64_t v4 = v26;
      v5 = v25;
      goto LABEL_18;
    case 2009:
      v24[0] = @"action_scrollRight";
      v23[0] = @"identifier";
      v23[1] = @"title";
      v3 = sub_100040EC8(@"Scroll-Right");
      v23[2] = @"activateBehavior";
      v24[1] = v3;
      v24[2] = &off_1001BC060;
      uint64_t v4 = v24;
      v5 = v23;
      goto LABEL_18;
    case 2010:
    case 2011:
    case 2012:
    case 2013:
    case 2014:
    case 2015:
    case 2016:
    case 2017:
    case 2018:
      goto LABEL_6;
    case 2019:
      v22[0] = @"action_scrollNext";
      v21[0] = @"identifier";
      v21[1] = @"title";
      v3 = sub_100040EC8(@"Scroll-Next");
      v22[1] = v3;
      v21[2] = @"imageName";
      v7 = +[HNDAccessibilityManager sharedManager];
      unsigned int v8 = [v7 applicationIsRTL];
      CFStringRef v9 = @"SCATIcon_action_scrollRight";
      if (v8) {
        CFStringRef v9 = @"SCATIcon_action_scrollLeft";
      }
      v21[3] = @"activateBehavior";
      v22[2] = v9;
      v22[3] = &off_1001BC078;
      v10 = v22;
      v11 = v21;
      goto LABEL_16;
    case 2020:
      v20[0] = @"action_scrollPrevious";
      v19[0] = @"identifier";
      v19[1] = @"title";
      v3 = sub_100040EC8(@"Scroll-Next");
      v20[1] = v3;
      v19[2] = @"imageName";
      v7 = +[HNDAccessibilityManager sharedManager];
      unsigned int v12 = [v7 applicationIsRTL];
      CFStringRef v13 = @"SCATIcon_action_scrollLeft";
      if (v12) {
        CFStringRef v13 = @"SCATIcon_action_scrollRight";
      }
      v19[3] = @"activateBehavior";
      v20[2] = v13;
      v20[3] = &off_1001BC078;
      v10 = v20;
      v11 = v19;
LABEL_16:
      id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:4];

      goto LABEL_19;
    default:
      if (a3 == 2030)
      {
        v18[0] = @"action_scrollToTop";
        v17[0] = @"identifier";
        v17[1] = @"title";
        v3 = sub_100040EC8(@"SCROLL_TOP");
        v17[2] = @"activateBehavior";
        v18[1] = v3;
        v18[2] = &off_1001BC090;
        uint64_t v4 = v18;
        v5 = v17;
      }
      else
      {
        if (a3 != 2031)
        {
LABEL_6:
          _AXAssert();
          id v6 = 0;
          goto LABEL_20;
        }
        v16[0] = @"action_autoscroll";
        v15[0] = @"identifier";
        v15[1] = @"title";
        v3 = sub_100040EC8(@"Scroll-Auto");
        v15[2] = @"activateBehavior";
        v16[1] = v3;
        v16[2] = &off_1001BC078;
        uint64_t v4 = v16;
        v5 = v15;
      }
LABEL_18:
      id v6 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v5 count:3];
LABEL_19:

LABEL_20:
      return v6;
  }
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v25 = a5;
  unsigned int v8 = [v7 objectForKey:@"identifier"];
  v26 = [v7 objectForKey:@"title"];
  v24 = [v7 objectForKey:@"imageName"];
  CFStringRef v9 = [v7 objectForKey:@"activateBehavior"];
  id v23 = [v9 unsignedIntegerValue];

  v10 = [v7 objectForKeyedSubscript:@"guidedAccess"];
  v11 = v10;
  if (v10) {
    unsigned int v12 = [v10 BOOLValue];
  }
  else {
    unsigned int v12 = 1;
  }
  CFStringRef v13 = [v7 objectForKeyedSubscript:@"assistiveAccess"];
  v14 = v13;
  unsigned int v22 = v12;
  if (v13) {
    LOBYTE(v12) = [v13 BOOLValue];
  }
  if ([v8 isEqualToString:@"action_scrollUp"])
  {
    v15 = v32;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v16 = sub_1000CEFB0;
LABEL_14:
    v15[2] = v16;
    void v15[3] = &unk_1001AD620;
    v15[4] = a1;
    v17 = objc_retainBlock(v15);
    goto LABEL_15;
  }
  if ([v8 isEqualToString:@"action_scrollDown"])
  {
    v15 = v31;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v16 = sub_1000CEFC0;
    goto LABEL_14;
  }
  if ([v8 isEqualToString:@"action_scrollLeft"])
  {
    v15 = v30;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v16 = sub_1000CEFD0;
    goto LABEL_14;
  }
  if ([v8 isEqualToString:@"action_scrollRight"])
  {
    v15 = v29;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v16 = sub_1000CEFE0;
    goto LABEL_14;
  }
  if ([v8 isEqualToString:@"action_scrollNext"])
  {
    v17 = &stru_1001AE500;
  }
  else if ([v8 isEqualToString:@"action_scrollPrevious"])
  {
    v17 = &stru_1001AE520;
  }
  else
  {
    if ([v8 isEqualToString:@"action_scrollToTop"])
    {
      v15 = v28;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v16 = sub_1000CF0B0;
      goto LABEL_14;
    }
    if ([v8 isEqualToString:@"action_autoscroll"])
    {
      v15 = v27;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v16 = sub_1000CF1F0;
      goto LABEL_14;
    }
    v17 = 0;
  }
LABEL_15:
  v18 = [(id)objc_opt_class() updateBlockForIdentifier:v8];
  LOBYTE(v21) = v12;
  v19 = +[SCATModernMenuItem itemWithIdentifier:v8 delegate:v25 title:v26 imageName:v24 activateBehavior:v23 allowedWithGuidedAccess:v22 allowedWithAssistiveAccess:v21 activateHandler:v17 updateHandler:v18];

  return v19;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  return &stru_1001AE560;
}

+ (id)_fallbackAncestorForScrollToTopForMenu:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fallbackScrollUpAncestor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 fallbackScrollDownAncestor];
  }
  id v7 = v6;

  unsigned int v8 = +[AXElement elementWithUIElement:v7];

  return v8;
}

+ (id)_fallbackAncestorForAutoscrollForMenu:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fallbackScrollDownAncestor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 fallbackScrollUpAncestor];
  }
  id v7 = v6;

  unsigned int v8 = +[AXElement elementWithUIElement:v7];

  return v8;
}

+ (void)_performFallbackScrollAncestorAction:(int)a3 withMenu:(id)a4
{
  id v17 = a4;
  switch(a3)
  {
    case 2006:
      v5 = [v17 fallbackScrollDownAncestor];
      unsigned __int8 v6 = [v5 performAXAction:2006];

      id v7 = v17;
      if ((v6 & 1) == 0)
      {
        unsigned int v8 = [v17 fallbackScrollUpAncestor];
        CFStringRef v9 = v8;
        uint64_t v10 = 2006;
        goto LABEL_11;
      }
      break;
    case 2007:
      v15 = [v17 fallbackScrollUpAncestor];
      unsigned __int8 v16 = [v15 performAXAction:2007];

      id v7 = v17;
      if ((v16 & 1) == 0)
      {
        unsigned int v8 = [v17 fallbackScrollDownAncestor];
        CFStringRef v9 = v8;
        uint64_t v10 = 2007;
        goto LABEL_11;
      }
      break;
    case 2008:
      v11 = [v17 fallbackScrollLeftAncestor];
      unsigned __int8 v12 = [v11 performAXAction:2008];

      id v7 = v17;
      if ((v12 & 1) == 0)
      {
        unsigned int v8 = [v17 fallbackScrollRightAncestor];
        CFStringRef v9 = v8;
        uint64_t v10 = 2008;
        goto LABEL_11;
      }
      break;
    case 2009:
      CFStringRef v13 = [v17 fallbackScrollRightAncestor];
      unsigned __int8 v14 = [v13 performAXAction:2009];

      id v7 = v17;
      if ((v14 & 1) == 0)
      {
        unsigned int v8 = [v17 fallbackScrollLeftAncestor];
        CFStringRef v9 = v8;
        uint64_t v10 = 2009;
LABEL_11:
        [v8 performAXAction:v10];

        goto LABEL_12;
      }
      break;
    default:
      _AXAssert();
LABEL_12:
      id v7 = v17;
      break;
  }
}

+ (void)_performScrollAction:(int)a3 withMenu:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [v6 element];
  unsigned int v8 = [v7 scrollableElement];

  if (v8)
  {
    if (([v8 performAction:v4] & 1) == 0) {
      [a1 _performFallbackScrollAncestorAction:v4 withMenu:v6];
    }
  }
  else
  {
    CFStringRef v9 = +[HNDAccessibilityManager sharedManager];
    id v18 = 0;
    uint64_t v10 = [v9 scrollViewsForAction:v4 elementsToScroll:&v18];
    id v11 = v18;

    if ([v11 count] == (id)1)
    {
      unsigned __int8 v12 = [v11 firstObject];
      [v12 performAction:v4];
    }
    else if ((unint64_t)[v10 count] < 2)
    {
      _AXLogWithFacility();
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000CF7C4;
      v13[3] = &unk_1001ABCD8;
      id v14 = v6;
      id v15 = v10;
      id v16 = v11;
      int v17 = v4;
      [v14 hideWithCompletion:v13];
    }
  }
}

@end