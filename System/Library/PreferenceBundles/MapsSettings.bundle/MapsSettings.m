id MapsCachedConformsToProtocol(uint64_t a1, Protocol *a2)
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v3 = objc_opt_class();
  if (!v3) {
    return 0;
  }
  v4 = (void *)v3;
  if (qword_8DC50 != -1)
  {
    dispatch_once(&qword_8DC50, &stru_60C78);
    if (a2) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!a2) {
    return 0;
  }
LABEL_4:
  v5 = atomic_load((unsigned int *)dword_8A5E0);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_8DC40);
  v6 = [(id)qword_8DC48 objectForKey:v4];
  if (!v6)
  {
    v6 = +[NSMapTable mapTableWithKeyOptions:256 valueOptions:0];
    [(id)qword_8DC48 setObject:v6 forKey:v4];
  }
  v7 = objc_msgSend(objc_msgSend(v6, "objectForKey:", a2), "unsignedIntegerValue");
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_8DC40);
  if (v5 == v7 >> 1) {
    return (id)(v7 & 1);
  }
  v8 = [v4 conformsToProtocol:a2];
  if (qword_8DC60 != -1) {
    dispatch_once(&qword_8DC60, &stru_60C98);
  }
  v9 = (void *)qword_8DC58;
  if (os_log_type_enabled((os_log_t)qword_8DC58, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = NSStringFromClass((Class)v4);
    if (v8) {
      v12 = "conforms to";
    }
    else {
      v12 = "does not conform to";
    }
    v13 = NSStringFromProtocol(a2);
    v16 = 138544130;
    v17 = v11;
    v18 = 2080;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 1024;
    v23 = v5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%{public}@ %s %{public}@ (gen: %u)", (uint8_t *)&v16, 0x26u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_8DC40);
  v14 = +[NSNumber numberWithUnsignedInt:v8 | (2 * v5)];
  [v6 setObject:v14 forKey:a2];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_8DC40);
  return v8;
}

void sub_4E44(id a1)
{
  objc_addLoadImageFunc((objc_func_loadImage)sub_4EA0);
  qword_8DC48 = +[NSMapTable mapTableWithKeyOptions:256 valueOptions:0];

  _objc_release_x1();
}

void sub_4EA0()
{
}

void sub_4EB4(id a1)
{
  qword_8DC58 = (uint64_t)os_log_create("com.apple.Maps", "MapsProtocolConformance");

  _objc_release_x1();
}

void sub_5244(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5268(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5278(uint64_t a1)
{
}

void sub_5280(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5374;
  block[3] = &unk_60CC0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v15 = v7;
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_5374(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5) {
      objc_storeStrong(v4, v2);
    }
  }
  [*(id *)(a1 + 40) addObjectsFromArray:*(void *)(a1 + 48)];
  id v6 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v6);
}

void sub_53CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "locationOfInterest", (void)v14);
          if (v13) {
            [v7 addObject:v13];
          }

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5554(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) allObjects];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v4, 0);
  }
}

UIColor *__cdecl sub_55F8(id a1, MapsTheme *a2)
{
  return [(MapsTheme *)a2 keyColor];
}

UIColor *__cdecl sub_5600(id a1, MapsTheme *a2)
{
  return [(MapsTheme *)a2 controlBackgroundColor];
}

void sub_59D8(id a1)
{
  uint64_t v1 = +[NSMutableDictionary dictionary];
  v2 = (void *)qword_8DC68;
  qword_8DC68 = v1;

  v59[0] = @"ControlBackgroundColorKey";
  v53 = +[UIColor colorWithWhite:0.968627453 alpha:1.0];
  v60[0] = v53;
  v59[1] = @"controlTintColorKey";
  v51 = +[UIColor _maps_keyColor];
  v60[1] = v51;
  v59[2] = @"HairLineColorKey";
  v49 = +[UIColor colorWithWhite:0.0 alpha:0.200000003];
  v60[2] = v49;
  v59[3] = @"GreenButtonColorKey";
  v47 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v60[3] = v47;
  v59[4] = @"GreenButtonHighlightedColorKey";
  v45 = +[UIColor colorWithRed:0.268235296 green:0.765882313 blue:0.352941185 alpha:1.0];
  v60[4] = v45;
  v59[5] = @"GroupTableViewBackgroundColorKey";
  v43 = +[UIColor colorWithRed:0.937254906 green:0.937254906 blue:0.956862748 alpha:1.0];
  v60[5] = v43;
  v59[6] = @"GroupTableViewCellBackgroundColorKey";
  v41 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  v60[6] = v41;
  v59[7] = @"BlueButtonHighlightedColorKey";
  v39 = +[UIColor _maps_keyColor];
  v38 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0);
  v37 = [v39 _colorBlendedWithColor:v38];
  v60[7] = v37;
  v59[8] = @"kNavEndButtonBackgroundColor";
  uint64_t v3 = +[UIColor colorWithRed:1.0 green:0.282352954 blue:0.282352954 alpha:1.0];
  v60[8] = v3;
  v59[9] = @"NavResumeButtonHighlightedColor";
  id v4 = +[UIColor colorWithWhite:0.0 alpha:0.0500000007];
  id v5 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
  id v6 = [v4 _colorBlendedWithColor:v5];
  v60[9] = v6;
  v59[10] = @"kNavTraySecondaryTextColor";
  uint64_t v7 = +[UIColor colorWithRed:0.392156869 green:0.392156869 blue:0.392156869 alpha:1.0];
  v60[10] = v7;
  v59[11] = @"VibrantTopColorKey";
  id v8 = +[UIColor colorWithRed:0.203921571 green:0.223529413 blue:0.313725501 alpha:0.150000006];
  v60[11] = v8;
  v59[12] = @"VibrantBackgroundColorKey";
  id v9 = +[UIColor colorWithWhite:0.479999989 alpha:1.0];
  v60[12] = v9;
  v60[13] = kCAFilterPlusD;
  v59[13] = @"VibrantTopFilterKey";
  v59[14] = @"VibrantBackgroundFilterKey";
  v60[14] = kCAFilterColorBurnBlendMode;
  v59[15] = @"StatusIndicatorHighlightedColorKey";
  id v10 = +[UIColor colorWithRed:0.0 green:0.419607848 blue:0.874509811 alpha:1.0];
  v60[15] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:16];

  [(id)qword_8DC68 setObject:v11 forKeyedSubscript:@"StandardTheme"];
  id v12 = [(id)qword_8DC68 objectForKeyedSubscript:@"StandardTheme"];
  id v13 = [v12 copy];

  [(id)qword_8DC68 setObject:v13 forKeyedSubscript:@"StandardThemeWithoutVisualEffect"];
  v57[0] = @"ControlBackgroundColorKey";
  v54 = +[UIColor colorWithRed:0.172549024 green:0.168627456 blue:0.168627456 alpha:1.0];
  v58[0] = v54;
  v57[1] = @"controlTintColorKey";
  v52 = +[UIColor whiteColor];
  v58[1] = v52;
  v57[2] = @"HairLineColorKey";
  v50 = +[UIColor colorWithWhite:1.0 alpha:0.150000006];
  v58[2] = v50;
  v57[3] = @"GreenButtonColorKey";
  v56 = +[UIColor colorWithRed:0.298039228 green:0.850980401 blue:0.392156869 alpha:1.0];
  v58[3] = v56;
  v57[4] = @"GreenButtonHighlightedColorKey";
  v55 = +[UIColor colorWithRed:0.268235296 green:0.765882313 blue:0.352941185 alpha:1.0];
  v58[4] = v55;
  v57[5] = @"GroupTableViewBackgroundColorKey";
  v48 = +[UIColor colorWithRed:0.752941191 green:0.768627465 blue:0.78039217 alpha:1.0];
  v58[5] = v48;
  v57[6] = @"GroupTableViewCellBackgroundColorKey";
  v46 = +[UIColor colorWithRed:0.811764717 green:0.827450991 blue:0.843137264 alpha:1.0];
  v58[6] = v46;
  v57[7] = @"BlueButtonHighlightedColorKey";
  v44 = +[UIColor _maps_keyColor];
  v42 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
  v40 = [v44 _colorBlendedWithColor:v42];
  v58[7] = v40;
  v57[8] = @"kNavEndButtonBackgroundColor";
  long long v14 = +[UIColor colorWithRed:1.0 green:0.23137255 blue:0.188235298 alpha:1.0];
  v58[8] = v14;
  v57[9] = @"NavResumeButtonHighlightedColor";
  long long v15 = +[UIColor colorWithWhite:1.0 alpha:0.0500000007];
  long long v16 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
  long long v17 = [v15 _colorBlendedWithColor:v16];
  v58[9] = v17;
  v57[10] = @"kNavTraySecondaryTextColor";
  v18 = +[UIColor colorWithRed:0.392156869 green:0.392156869 blue:0.392156869 alpha:1.0];
  v58[10] = v18;
  v57[11] = @"VibrantTopColorKey";
  v19 = +[UIColor colorWithWhite:1.0 alpha:0.0399999991];
  v58[11] = v19;
  v57[12] = @"VibrantBackgroundColorKey";
  v20 = +[UIColor colorWithWhite:1.0 alpha:0.519999981];
  v58[12] = v20;
  v58[13] = kCAFilterPlusL;
  v57[13] = @"VibrantTopFilterKey";
  v57[14] = @"VibrantBackgroundFilterKey";
  v58[14] = kCAFilterOverlayBlendMode;
  v57[15] = @"StatusIndicatorHighlightedColorKey";
  v21 = +[UIColor colorWithRed:0.0235294122 green:0.360784322 blue:0.698039234 alpha:1.0];
  v58[15] = v21;
  v22 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:16];

  [(id)qword_8DC68 setObject:v22 forKeyedSubscript:@"DarkTheme"];
  v23 = [(id)qword_8DC68 objectForKeyedSubscript:@"DarkTheme"];
  id v24 = [v23 mutableCopy];

  v25 = +[UIColor colorWithRed:0.152941182 green:0.184313729 blue:0.215686277 alpha:1.0];
  [v24 setObject:v25 forKeyedSubscript:@"ControlBackgroundColorKey"];

  v26 = +[UIColor colorWithRed:0.278431386 green:0.305882365 blue:0.333333343 alpha:1.0];
  [v24 setObject:v26 forKeyedSubscript:@"HairLineColorKey"];

  v27 = +[UIColor colorWithRed:0.113725491 green:0.686274529 blue:0.925490201 alpha:1.0];
  [v24 setObject:v27 forKeyedSubscript:@"controlTintColorKey"];

  v28 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.439999998];
  [v24 setObject:v28 forKeyedSubscript:@"kNavTraySecondaryTextColor"];

  v29 = +[UIColor colorWithRed:0.90196079 green:0.20784314 blue:0.168627456 alpha:1.0];
  [v24 setObject:v29 forKeyedSubscript:@"kNavEndButtonBackgroundColor"];

  v30 = +[UIColor colorWithRed:0.278431386 green:0.31764707 blue:0.360784322 alpha:1.0];
  [v24 setObject:v30 forKeyedSubscript:@"VibrantBackgroundColorKey"];

  v31 = +[UIColor colorWithRed:0.278431386 green:0.31764707 blue:0.360784322 alpha:1.0];
  [v24 setObject:v31 forKeyedSubscript:@"VibrantTopColorKey"];

  v32 = +[UIColor colorWithRed:0.243137255 green:0.776470602 blue:0.333333343 alpha:1.0];
  [v24 setObject:v32 forKeyedSubscript:@"GreenButtonColorKey"];

  v33 = +[UIColor colorWithRed:0.218823522 green:0.698823512 blue:0.300000012 alpha:1.0];
  [v24 setObject:v33 forKeyedSubscript:@"GreenButtonHighlightedColorKey"];

  v34 = +[UIColor colorWithRed:0.125490203 green:0.152941182 blue:0.180392161 alpha:1.0];
  [v24 setObject:v34 forKeyedSubscript:@"GroupTableViewBackgroundColorKey"];

  v35 = +[UIColor colorWithRed:0.152941182 green:0.184313729 blue:0.215686277 alpha:1.0];
  [v24 setObject:v35 forKeyedSubscript:@"GroupTableViewCellBackgroundColorKey"];

  id v36 = [v24 copy];
  [(id)qword_8DC68 setObject:v36 forKeyedSubscript:@"DarkThemeWithoutVisualEffect"];
}

void sub_6620(id a1)
{
  uint64_t v1 = [[MapsTheme alloc] initWithMapsThemeStyle:0 visualEffectStyle:0];
  v2 = (void *)qword_8DC78;
  qword_8DC78 = (uint64_t)v1;

  +[MKInfoCardThemeManager setTintColorProvider:&stru_60E30];
}

UIColor *__cdecl sub_667C(id a1)
{
  return (UIColor *)[(id)qword_8DC78 keyColor];
}

id sub_6960(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = +[UIImage imageNamed:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v2) {
    [v3 _flatImageWithColor:*(void *)(a1 + 32)];
  }
  else {
  id v5 = [v3 imageWithRenderingMode:2];
  }

  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(a1 + 48) + 24))
  {
    id v6 = v5;
    id v7 = [v6 CGImage];
    [v6 scale];
    +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v7, 4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

void sub_74BC(id a1)
{
  id v5 = +[UITraitCollection _currentTraitCollection];
  uint64_t v1 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  +[UITraitCollection _setCurrentTraitCollection:v1];

  id v2 = +[UIColor systemGray5Color];
  uint64_t v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 CGColor]);
  id v4 = (void *)qword_8DC88;
  qword_8DC88 = v3;

  +[UITraitCollection _setCurrentTraitCollection:v5];
}

void sub_7878(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() globalThemes];
  uint64_t v3 = [*(id *)(a1 + 32) _mapsThemeStyleKey:0];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [(id)objc_opt_class() globalThemes];
  id v6 = [*(id *)(a1 + 32) _mapsThemeStyleKey:1];
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v4 objectForKeyedSubscript:@"ControlBackgroundColorKey"];
  [v7 objectForKeyedSubscript:@"ControlBackgroundColorKey"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7A08;
  v13[3] = &unk_60EA0;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v9 = v8;
  id v10 = v14;
  uint64_t v11 = +[UIColor colorWithDynamicProvider:v13];
  id v12 = (void *)qword_8DC98;
  qword_8DC98 = v11;
}

id sub_7A08(uint64_t a1, void *a2)
{
  uint64_t v3 = (char *)[a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == (unsigned char *)&dword_0 + 2) {
    uint64_t v4 = 32;
  }
  id v5 = *(void **)(a1 + v4);

  return v5;
}

void sub_7B18(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() globalThemes];
  uint64_t v3 = [*(id *)(a1 + 32) _mapsThemeStyleKey:0];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [(id)objc_opt_class() globalThemes];
  id v6 = [*(id *)(a1 + 32) _mapsThemeStyleKey:1];
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v4 objectForKeyedSubscript:@"HairLineColorKey"];
  [v7 objectForKeyedSubscript:@"HairLineColorKey"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7CA8;
  v13[3] = &unk_60EA0;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v9 = v8;
  id v10 = v14;
  uint64_t v11 = +[UIColor colorWithDynamicProvider:v13];
  id v12 = (void *)qword_8DCA8;
  qword_8DCA8 = v11;
}

id sub_7CA8(uint64_t a1, void *a2)
{
  uint64_t v3 = (char *)[a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == (unsigned char *)&dword_0 + 2) {
    uint64_t v4 = 32;
  }
  id v5 = *(void **)(a1 + v4);

  return v5;
}

BOOL isBigScreen()
{
  v0 = +[UIScreen mainScreen];
  [v0 bounds];
  BOOL v2 = v1 > 750.0;

  return v2;
}

BOOL isSmallScreen()
{
  v0 = +[UIScreen mainScreen];
  [v0 bounds];
  BOOL v2 = v1 == 320.0;

  return v2;
}

double MapsChromeFloatingControlsInset()
{
  v0 = +[UIDevice currentDevice];
  double v1 = (char *)[v0 userInterfaceIdiom];

  double result = 10.0;
  if (v1 == (unsigned char *)&dword_4 + 1) {
    return 13.0;
  }
  return result;
}

double MapsChromeFloatingControlsBottomInset(int a1)
{
  if (a1)
  {
    BOOL v2 = +[UIDevice currentDevice];
    uint64_t v3 = (char *)[v2 userInterfaceIdiom];

    uint64_t v1 = vars8;
    if (v3 != (unsigned char *)&dword_4 + 1) {
      return 30.0;
    }
  }
  return MapsChromeFloatingControlsInset();
}

void MapsChromeDefaultMediumCardHeightConstant()
{
  if (!GEOConfigGetBOOL())
  {
    if (!isSmallScreen())
    {
      isBigScreen();
      return;
    }
LABEL_5:
    BOOL v2 = +[UIScreen mainScreen];
    [v2 bounds];
    UIRoundToScreenScale();

    return;
  }
  v0 = +[UIDevice currentDevice];
  uint64_t v1 = (char *)[v0 userInterfaceIdiom];

  if (v1 != (unsigned char *)&dword_0 + 1) {
    goto LABEL_5;
  }
}

id GEOAvoidedTransitModesFromMapsTransitModes(uint64_t a1)
{
  BOOL v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (qword_8DCC0 != -1) {
    dispatch_once(&qword_8DCC0, &stru_60EF0);
  }
  id v3 = (id)qword_8DCB8;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (uint64_t)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue", (void)v12);
        if ((v8 & a1) != 0)
        {
          id v9 = _geoModesFromIndividualMapsTransitMode(v8);
          [v2 addObjectsFromArray:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v10 = [v2 copy];

  return v10;
}

id _geoModesFromIndividualMapsTransitMode(uint64_t a1)
{
  BOOL v2 = objc_opt_new();
  id v3 = v2;
  id v4 = &off_7C478;
  switch(a1)
  {
    case 1:
      goto LABEL_5;
    case 2:
      [v2 addObject:&off_7C490];
      id v4 = &off_7C4A8;
      goto LABEL_5;
    case 4:
      id v4 = &off_7C4C0;
      goto LABEL_5;
    case 8:
      id v4 = &off_7C4D8;
LABEL_5:
      [v3 addObject:v4];
      break;
    default:
      break;
  }

  return v3;
}

void sub_AF40(id a1)
{
  uint64_t v1 = (void *)qword_8DCB8;
  qword_8DCB8 = (uint64_t)&off_7C370;
}

BOOL _currentDeviceSupportsVLF()
{
  if (qword_8DCD0 != -1) {
    dispatch_once(&qword_8DCD0, &stru_60F10);
  }
  return (byte_8DCC8 & 1) == 0;
}

void sub_AFA4(id a1)
{
  if (MGGetBoolAnswer())
  {
    if (MGGetSInt32Answer() == 1)
    {
      if (MGGetBoolAnswer())
      {
        if (+[ARGeoTrackingConfiguration isSupportedWithOptions:4])
        {
          uint64_t v1 = sub_B158();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v4 = 0;
            BOOL v2 = "VLF is supported on the current device";
            id v3 = (uint8_t *)&v4;
LABEL_15:
            _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
          }
        }
        else
        {
          byte_8DCC8 = 1;
          uint64_t v1 = sub_B158();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            BOOL v2 = "VLF is not supported because the current device does not support geo tracking";
            id v3 = buf;
            goto LABEL_15;
          }
        }
      }
      else
      {
        byte_8DCC8 = 1;
        uint64_t v1 = sub_B158();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v6 = 0;
          BOOL v2 = "VLF is not supported because the current device does not support the DeviceSupportsMapsOpticalHeading gestalt key";
          id v3 = (uint8_t *)&v6;
          goto LABEL_15;
        }
      }
    }
    else
    {
      byte_8DCC8 = 1;
      uint64_t v1 = sub_B158();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v7 = 0;
        BOOL v2 = "VLF is not supported because the current device is not an iPhone";
        id v3 = (uint8_t *)&v7;
        goto LABEL_15;
      }
    }
  }
  else
  {
    byte_8DCC8 = 1;
    uint64_t v1 = sub_B158();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      BOOL v2 = "VLF is not supported because the current device does not support ARKit";
      id v3 = (uint8_t *)&v8;
      goto LABEL_15;
    }
  }
}

id sub_B158()
{
  if (qword_8DCE0 != -1) {
    dispatch_once(&qword_8DCE0, &stru_60F30);
  }
  v0 = (void *)qword_8DCD8;

  return v0;
}

void sub_B1AC(id a1)
{
  qword_8DCD8 = (uint64_t)os_log_create("com.apple.Maps", "VLFAvailability");

  _objc_release_x1();
}

id MAPSGetCameraLog()
{
  if (qword_8DCF0 != -1) {
    dispatch_once(&qword_8DCF0, &stru_60F50);
  }
  v0 = (void *)qword_8DCE8;

  return v0;
}

void sub_C210(id a1)
{
  qword_8DCE8 = (uint64_t)os_log_create("com.apple.Maps", "Camera");

  _objc_release_x1();
}

id MAPSGetCollectionsLog()
{
  if (qword_8DD00 != -1) {
    dispatch_once(&qword_8DD00, &stru_60F70);
  }
  v0 = (void *)qword_8DCF8;

  return v0;
}

void sub_C2A8(id a1)
{
  qword_8DCF8 = (uint64_t)os_log_create("com.apple.Maps", "Collections");

  _objc_release_x1();
}

id MAPSGetContainerVCLog()
{
  if (qword_8DD10 != -1) {
    dispatch_once(&qword_8DD10, &stru_60F90);
  }
  v0 = (void *)qword_8DD08;

  return v0;
}

void sub_C340(id a1)
{
  qword_8DD08 = (uint64_t)os_log_create("com.apple.Maps", "ContainerVC");

  _objc_release_x1();
}

id MAPSGetCuratedCollectionsLog()
{
  if (qword_8DD20 != -1) {
    dispatch_once(&qword_8DD20, &stru_60FB0);
  }
  v0 = (void *)qword_8DD18;

  return v0;
}

void sub_C3D8(id a1)
{
  qword_8DD18 = (uint64_t)os_log_create("com.apple.Maps", "CuratedCollections");

  _objc_release_x1();
}

id MAPSGetEVOnboardingLog()
{
  if (qword_8DD30 != -1) {
    dispatch_once(&qword_8DD30, &stru_60FD0);
  }
  v0 = (void *)qword_8DD28;

  return v0;
}

void sub_C470(id a1)
{
  qword_8DD28 = (uint64_t)os_log_create("com.apple.Maps", "EVOnboarding");

  _objc_release_x1();
}

id MAPSGetLightLevelProvidingLog()
{
  if (qword_8DD40 != -1) {
    dispatch_once(&qword_8DD40, &stru_60FF0);
  }
  v0 = (void *)qword_8DD38;

  return v0;
}

void sub_C508(id a1)
{
  qword_8DD38 = (uint64_t)os_log_create("com.apple.Maps", "LightLevelProviding");

  _objc_release_x1();
}

id MAPSGetMapModeLog()
{
  if (qword_8DD50 != -1) {
    dispatch_once(&qword_8DD50, &stru_61010);
  }
  v0 = (void *)qword_8DD48;

  return v0;
}

void sub_C5A0(id a1)
{
  qword_8DD48 = (uint64_t)os_log_create("com.apple.Maps", "MapMode");

  _objc_release_x1();
}

id MAPSGetMapsActivityLog()
{
  if (qword_8DD60 != -1) {
    dispatch_once(&qword_8DD60, &stru_61030);
  }
  v0 = (void *)qword_8DD58;

  return v0;
}

void sub_C638(id a1)
{
  qword_8DD58 = (uint64_t)os_log_create("com.apple.Maps", "MapsActivity");

  _objc_release_x1();
}

id MAPSGetMapsAssertLog()
{
  if (qword_8E378 != -1) {
    dispatch_once(&qword_8E378, &stru_61050);
  }
  v0 = (void *)qword_8E370;

  return v0;
}

void sub_C6D0(id a1)
{
  qword_8E370 = (uint64_t)os_log_create("com.apple.Maps", "MapsAssert");

  _objc_release_x1();
}

id MAPSGetMapsChromeLog()
{
  if (qword_8DD70 != -1) {
    dispatch_once(&qword_8DD70, &stru_61070);
  }
  v0 = (void *)qword_8DD68;

  return v0;
}

void sub_C768(id a1)
{
  qword_8DD68 = (uint64_t)os_log_create("com.apple.Maps", "MapsChrome");

  _objc_release_x1();
}

id MAPSGetMapsDefaultLog()
{
  if (qword_8DD80 != -1) {
    dispatch_once(&qword_8DD80, &stru_61090);
  }
  v0 = (void *)qword_8DD78;

  return v0;
}

void sub_C800(id a1)
{
  qword_8DD78 = (uint64_t)os_log_create("com.apple.Maps", "MapsDefault");

  _objc_release_x1();
}

id MAPSGetMapsLaunchLog()
{
  if (qword_8DD90 != -1) {
    dispatch_once(&qword_8DD90, &stru_610B0);
  }
  v0 = (void *)qword_8DD88;

  return v0;
}

void sub_C898(id a1)
{
  qword_8DD88 = (uint64_t)os_log_create("com.apple.Maps", "MapsLaunch");

  _objc_release_x1();
}

id MAPSGetMapsNotificationsLog()
{
  if (qword_8DDA0 != -1) {
    dispatch_once(&qword_8DDA0, &stru_610D0);
  }
  v0 = (void *)qword_8DD98;

  return v0;
}

void sub_C930(id a1)
{
  qword_8DD98 = (uint64_t)os_log_create("com.apple.Maps", "MapsNotifications");

  _objc_release_x1();
}

id MAPSGetMapsPerformanceLog()
{
  if (qword_8DDB0 != -1) {
    dispatch_once(&qword_8DDB0, &stru_610F0);
  }
  v0 = (void *)qword_8DDA8;

  return v0;
}

void sub_C9C8(id a1)
{
  qword_8DDA8 = (uint64_t)os_log_create("com.apple.Maps", "MapsPerformance");

  _objc_release_x1();
}

id MAPSGetLookAroundLog()
{
  if (qword_8DDC0 != -1) {
    dispatch_once(&qword_8DDC0, &stru_61110);
  }
  v0 = (void *)qword_8DDB8;

  return v0;
}

void sub_CA60(id a1)
{
  qword_8DDB8 = (uint64_t)os_log_create("com.apple.Maps", "LookAround");

  _objc_release_x1();
}

id MAPSGetNavigationLog()
{
  if (qword_8DDD0 != -1) {
    dispatch_once(&qword_8DDD0, &stru_61130);
  }
  v0 = (void *)qword_8DDC8;

  return v0;
}

void sub_CAF8(id a1)
{
  qword_8DDC8 = (uint64_t)os_log_create("com.apple.Maps", "Navigation");

  _objc_release_x1();
}

id MAPSGetNavigationBannersLog()
{
  if (qword_8DDE0 != -1) {
    dispatch_once(&qword_8DDE0, &stru_61150);
  }
  v0 = (void *)qword_8DDD8;

  return v0;
}

void sub_CB90(id a1)
{
  qword_8DDD8 = (uint64_t)os_log_create("com.apple.Maps", "NavigationBanners");

  _objc_release_x1();
}

id MAPSGetNearbyTransitLog()
{
  if (qword_8DDF0 != -1) {
    dispatch_once(&qword_8DDF0, &stru_61170);
  }
  v0 = (void *)qword_8DDE8;

  return v0;
}

void sub_CC28(id a1)
{
  qword_8DDE8 = (uint64_t)os_log_create("com.apple.Maps", "NearbyTransit");

  _objc_release_x1();
}

id MAPSGetOfflineLog()
{
  if (qword_8E388 != -1) {
    dispatch_once(&qword_8E388, &stru_61190);
  }
  v0 = (void *)qword_8E380;

  return v0;
}

void sub_CCC0(id a1)
{
  qword_8E380 = (uint64_t)os_log_create("com.apple.Maps", "Offline");

  _objc_release_x1();
}

id MAPSGetPlaceCardLog()
{
  if (qword_8DE00 != -1) {
    dispatch_once(&qword_8DE00, &stru_611B0);
  }
  v0 = (void *)qword_8DDF8;

  return v0;
}

void sub_CD58(id a1)
{
  qword_8DDF8 = (uint64_t)os_log_create("com.apple.Maps", "PlaceCard");

  _objc_release_x1();
}

id MAPSGetPPTLog()
{
  if (qword_8DE10 != -1) {
    dispatch_once(&qword_8DE10, &stru_611D0);
  }
  v0 = (void *)qword_8DE08;

  return v0;
}

void sub_CDF0(id a1)
{
  qword_8DE08 = (uint64_t)os_log_create("com.apple.Maps", "PPT");

  _objc_release_x1();
}

id MAPSGetPreferencesSyncLog()
{
  if (qword_8E398 != -1) {
    dispatch_once(&qword_8E398, &stru_611F0);
  }
  v0 = (void *)qword_8E390;

  return v0;
}

void sub_CE88(id a1)
{
  qword_8E390 = (uint64_t)os_log_create("com.apple.Maps", "PreferencesSync");

  _objc_release_x1();
}

id MAPSGetPrintLog()
{
  if (qword_8DE20 != -1) {
    dispatch_once(&qword_8DE20, &stru_61210);
  }
  v0 = (void *)qword_8DE18;

  return v0;
}

void sub_CF20(id a1)
{
  qword_8DE18 = (uint64_t)os_log_create("com.apple.Maps", "Print");

  _objc_release_x1();
}

id MAPSGetRAPLayoutLog()
{
  if (qword_8DE30 != -1) {
    dispatch_once(&qword_8DE30, &stru_61230);
  }
  v0 = (void *)qword_8DE28;

  return v0;
}

void sub_CFB8(id a1)
{
  qword_8DE28 = (uint64_t)os_log_create("com.apple.Maps", "RAPLayout");

  _objc_release_x1();
}

id MAPSGetRAPNavigationLog()
{
  if (qword_8DE40 != -1) {
    dispatch_once(&qword_8DE40, &stru_61250);
  }
  v0 = (void *)qword_8DE38;

  return v0;
}

void sub_D050(id a1)
{
  qword_8DE38 = (uint64_t)os_log_create("com.apple.Maps", "RAPNavigation");

  _objc_release_x1();
}

id MAPSGetRAPSubmissionLog()
{
  if (qword_8DE50 != -1) {
    dispatch_once(&qword_8DE50, &stru_61270);
  }
  v0 = (void *)qword_8DE48;

  return v0;
}

void sub_D0E8(id a1)
{
  qword_8DE48 = (uint64_t)os_log_create("com.apple.Maps", "RAPSubmission");

  _objc_release_x1();
}

id MAPSGetRecentsLog()
{
  if (qword_8DE60 != -1) {
    dispatch_once(&qword_8DE60, &stru_61290);
  }
  v0 = (void *)qword_8DE58;

  return v0;
}

void sub_D180(id a1)
{
  qword_8DE58 = (uint64_t)os_log_create("com.apple.Maps", "Recents");

  _objc_release_x1();
}

id MAPSGetRouteCreationLog()
{
  if (qword_8DE70 != -1) {
    dispatch_once(&qword_8DE70, &stru_612B0);
  }
  v0 = (void *)qword_8DE68;

  return v0;
}

void sub_D218(id a1)
{
  qword_8DE68 = (uint64_t)os_log_create("com.apple.Maps", "RouteCreation");

  _objc_release_x1();
}

id MAPSGetRoutePlanningLog()
{
  if (qword_8DE80 != -1) {
    dispatch_once(&qword_8DE80, &stru_612D0);
  }
  v0 = (void *)qword_8DE78;

  return v0;
}

void sub_D2B0(id a1)
{
  qword_8DE78 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanning");

  _objc_release_x1();
}

id MAPSGetRoutePlanningFeatureDiscoveryLog()
{
  if (qword_8DE90 != -1) {
    dispatch_once(&qword_8DE90, &stru_612F0);
  }
  v0 = (void *)qword_8DE88;

  return v0;
}

void sub_D348(id a1)
{
  qword_8DE88 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningFeatureDiscovery");

  _objc_release_x1();
}

id MAPSGetSearchACLog()
{
  if (qword_8DEA0 != -1) {
    dispatch_once(&qword_8DEA0, &stru_61310);
  }
  v0 = (void *)qword_8DE98;

  return v0;
}

void sub_D3E0(id a1)
{
  qword_8DE98 = (uint64_t)os_log_create("com.apple.Maps", "SearchAC");

  _objc_release_x1();
}

id MAPSGetSearchACFindMyLog()
{
  if (qword_8DEB0 != -1) {
    dispatch_once(&qword_8DEB0, &stru_61330);
  }
  v0 = (void *)qword_8DEA8;

  return v0;
}

void sub_D478(id a1)
{
  qword_8DEA8 = (uint64_t)os_log_create("com.apple.Maps", "SearchACFindMy");

  _objc_release_x1();
}

id MAPSGetSearchHomeLog()
{
  if (qword_8DEC0 != -1) {
    dispatch_once(&qword_8DEC0, &stru_61350);
  }
  v0 = (void *)qword_8DEB8;

  return v0;
}

void sub_D510(id a1)
{
  qword_8DEB8 = (uint64_t)os_log_create("com.apple.Maps", "SearchHome");

  _objc_release_x1();
}

id MAPSGetSharedTripLog()
{
  if (qword_8DED0 != -1) {
    dispatch_once(&qword_8DED0, &stru_61370);
  }
  v0 = (void *)qword_8DEC8;

  return v0;
}

void sub_D5A8(id a1)
{
  qword_8DEC8 = (uint64_t)os_log_create("com.apple.Maps", "SharedTrip");

  _objc_release_x1();
}

id MAPSGetSharingLog()
{
  if (qword_8DEE0 != -1) {
    dispatch_once(&qword_8DEE0, &stru_61390);
  }
  v0 = (void *)qword_8DED8;

  return v0;
}

void sub_D640(id a1)
{
  qword_8DED8 = (uint64_t)os_log_create("com.apple.Maps", "Sharing");

  _objc_release_x1();
}

id MAPSGetShortcutsLog()
{
  if (qword_8DEF0 != -1) {
    dispatch_once(&qword_8DEF0, &stru_613B0);
  }
  v0 = (void *)qword_8DEE8;

  return v0;
}

void sub_D6D8(id a1)
{
  qword_8DEE8 = (uint64_t)os_log_create("com.apple.Maps", "Shortcuts");

  _objc_release_x1();
}

id MAPSGetTileStateCaptureLog()
{
  if (qword_8DF00 != -1) {
    dispatch_once(&qword_8DF00, &stru_613D0);
  }
  v0 = (void *)qword_8DEF8;

  return v0;
}

void sub_D770(id a1)
{
  qword_8DEF8 = (uint64_t)os_log_create("com.apple.Maps", "TileStateCapture");

  _objc_release_x1();
}

id MAPSGetTransitLog()
{
  if (qword_8DF10 != -1) {
    dispatch_once(&qword_8DF10, &stru_613F0);
  }
  v0 = (void *)qword_8DF08;

  return v0;
}

void sub_D808(id a1)
{
  qword_8DF08 = (uint64_t)os_log_create("com.apple.Maps", "Transit");

  _objc_release_x1();
}

id MAPSGetTransitPayLog()
{
  if (qword_8DF20 != -1) {
    dispatch_once(&qword_8DF20, &stru_61410);
  }
  v0 = (void *)qword_8DF18;

  return v0;
}

void sub_D8A0(id a1)
{
  qword_8DF18 = (uint64_t)os_log_create("com.apple.Maps", "TransitPay");

  _objc_release_x1();
}

id MAPSGetTransitSchedulesLog()
{
  if (qword_8DF30 != -1) {
    dispatch_once(&qword_8DF30, &stru_61430);
  }
  v0 = (void *)qword_8DF28;

  return v0;
}

void sub_D938(id a1)
{
  qword_8DF28 = (uint64_t)os_log_create("com.apple.Maps", "TransitSchedules");

  _objc_release_x1();
}

id MAPSGetUserProfileLog()
{
  if (qword_8DF40 != -1) {
    dispatch_once(&qword_8DF40, &stru_61450);
  }
  v0 = (void *)qword_8DF38;

  return v0;
}

void sub_D9D0(id a1)
{
  qword_8DF38 = (uint64_t)os_log_create("com.apple.Maps", "UserProfile");

  _objc_release_x1();
}

id MAPSGetVehicleDisambiguatorLog()
{
  if (qword_8DF50 != -1) {
    dispatch_once(&qword_8DF50, &stru_61470);
  }
  v0 = (void *)qword_8DF48;

  return v0;
}

void sub_DA68(id a1)
{
  qword_8DF48 = (uint64_t)os_log_create("com.apple.Maps", "VehicleDisambiguator");

  _objc_release_x1();
}

id MAPSGetVirtualGarageLog()
{
  if (qword_8E3A8 != -1) {
    dispatch_once(&qword_8E3A8, &stru_61490);
  }
  v0 = (void *)qword_8E3A0;

  return v0;
}

void sub_DB00(id a1)
{
  qword_8E3A0 = (uint64_t)os_log_create("com.apple.Maps", "VirtualGarage");

  _objc_release_x1();
}

id MAPSGetWeatherLog()
{
  if (qword_8DF60 != -1) {
    dispatch_once(&qword_8DF60, &stru_614B0);
  }
  v0 = (void *)qword_8DF58;

  return v0;
}

void sub_DB98(id a1)
{
  qword_8DF58 = (uint64_t)os_log_create("com.apple.Maps", "Weather");

  _objc_release_x1();
}

id MAPSGetXPCLog()
{
  if (qword_8DF70 != -1) {
    dispatch_once(&qword_8DF70, &stru_614D0);
  }
  v0 = (void *)qword_8DF68;

  return v0;
}

void sub_DC30(id a1)
{
  qword_8DF68 = (uint64_t)os_log_create("com.apple.Maps", "XPC");

  _objc_release_x1();
}

id MAPSGetUGCBAAUtilitiesLog()
{
  if (qword_8DF80 != -1) {
    dispatch_once(&qword_8DF80, &stru_614F0);
  }
  v0 = (void *)qword_8DF78;

  return v0;
}

void sub_DCC8(id a1)
{
  qword_8DF78 = (uint64_t)os_log_create("com.apple.Maps", "UGCBAAUtilities");

  _objc_release_x1();
}

id MAPSGetIncidentsReportingLog()
{
  if (qword_8DF90 != -1) {
    dispatch_once(&qword_8DF90, &stru_61510);
  }
  v0 = (void *)qword_8DF88;

  return v0;
}

void sub_DD60(id a1)
{
  qword_8DF88 = (uint64_t)os_log_create("com.apple.Maps", "IncidentsReporting");

  _objc_release_x1();
}

id MAPSGetWatermarkingLog()
{
  if (qword_8DFA0 != -1) {
    dispatch_once(&qword_8DFA0, &stru_61530);
  }
  v0 = (void *)qword_8DF98;

  return v0;
}

void sub_DDF8(id a1)
{
  qword_8DF98 = (uint64_t)os_log_create("com.apple.Maps", "Watermarking");

  _objc_release_x1();
}

id MAPSGetWaypointRequestLog()
{
  if (qword_8DFB0 != -1) {
    dispatch_once(&qword_8DFB0, &stru_61550);
  }
  v0 = (void *)qword_8DFA8;

  return v0;
}

void sub_DE90(id a1)
{
  qword_8DFA8 = (uint64_t)os_log_create("com.apple.Maps", "WaypointRequest");

  _objc_release_x1();
}

id MAPSGetWebBundleLog()
{
  if (qword_8DFC0 != -1) {
    dispatch_once(&qword_8DFC0, &stru_61570);
  }
  v0 = (void *)qword_8DFB8;

  return v0;
}

void sub_DF28(id a1)
{
  qword_8DFB8 = (uint64_t)os_log_create("com.apple.Maps", "WebBundle");

  _objc_release_x1();
}

id MAPSGetRAPRecordsManagerLog()
{
  if (qword_8DFD0 != -1) {
    dispatch_once(&qword_8DFD0, &stru_61590);
  }
  v0 = (void *)qword_8DFC8;

  return v0;
}

void sub_DFC0(id a1)
{
  qword_8DFC8 = (uint64_t)os_log_create("com.apple.Maps", "RAPRecordsManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoAttributionLog()
{
  if (qword_8DFE0 != -1) {
    dispatch_once(&qword_8DFE0, &stru_615B0);
  }
  v0 = (void *)qword_8DFD8;

  return v0;
}

void sub_E058(id a1)
{
  qword_8DFD8 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoAttribution");

  _objc_release_x1();
}

id MAPSGetSearchResultsImpressionsLog()
{
  if (qword_8DFF0 != -1) {
    dispatch_once(&qword_8DFF0, &stru_615D0);
  }
  v0 = (void *)qword_8DFE8;

  return v0;
}

void sub_E0F0(id a1)
{
  qword_8DFE8 = (uint64_t)os_log_create("com.apple.Maps", "SearchResultsImpressions");

  _objc_release_x1();
}

id MAPSGetSearchRedoLog()
{
  if (qword_8E000 != -1) {
    dispatch_once(&qword_8E000, &stru_615F0);
  }
  v0 = (void *)qword_8DFF8;

  return v0;
}

void sub_E188(id a1)
{
  qword_8DFF8 = (uint64_t)os_log_create("com.apple.Maps", "SearchRedo");

  _objc_release_x1();
}

id MAPSGetStaleTimeBug_105865770Log()
{
  if (qword_8E010 != -1) {
    dispatch_once(&qword_8E010, &stru_61610);
  }
  v0 = (void *)qword_8E008;

  return v0;
}

void sub_E220(id a1)
{
  qword_8E008 = (uint64_t)os_log_create("com.apple.Maps", "StaleTimeBug_105865770");

  _objc_release_x1();
}

id MAPSGetCustomPOIsControllerLog()
{
  if (qword_8E020 != -1) {
    dispatch_once(&qword_8E020, &stru_61630);
  }
  v0 = (void *)qword_8E018;

  return v0;
}

void sub_E2B8(id a1)
{
  qword_8E018 = (uint64_t)os_log_create("com.apple.Maps", "CustomPOIsController");

  _objc_release_x1();
}

id MAPSGetPOSIXSignalsLog()
{
  if (qword_8E030 != -1) {
    dispatch_once(&qword_8E030, &stru_61650);
  }
  v0 = (void *)qword_8E028;

  return v0;
}

void sub_E350(id a1)
{
  qword_8E028 = (uint64_t)os_log_create("com.apple.Maps", "POSIXSignals");

  _objc_release_x1();
}

id MAPSGetCoalescingSchedulerLog()
{
  if (qword_8E040 != -1) {
    dispatch_once(&qword_8E040, &stru_61670);
  }
  v0 = (void *)qword_8E038;

  return v0;
}

void sub_E3E8(id a1)
{
  qword_8E038 = (uint64_t)os_log_create("com.apple.Maps", "CoalescingScheduler");

  _objc_release_x1();
}

id MAPSGetDeviceConnectionLog()
{
  if (qword_8E3B8 != -1) {
    dispatch_once(&qword_8E3B8, &stru_61690);
  }
  v0 = (void *)qword_8E3B0;

  return v0;
}

void sub_E480(id a1)
{
  qword_8E3B0 = (uint64_t)os_log_create("com.apple.Maps", "DeviceConnection");

  _objc_release_x1();
}

id MAPSGetDictationLog()
{
  if (qword_8E050 != -1) {
    dispatch_once(&qword_8E050, &stru_616B0);
  }
  v0 = (void *)qword_8E048;

  return v0;
}

void sub_E518(id a1)
{
  qword_8E048 = (uint64_t)os_log_create("com.apple.Maps", "Dictation");

  _objc_release_x1();
}

id MAPSGetElevationGraphLog()
{
  if (qword_8E060 != -1) {
    dispatch_once(&qword_8E060, &stru_616D0);
  }
  v0 = (void *)qword_8E058;

  return v0;
}

void sub_E5B0(id a1)
{
  qword_8E058 = (uint64_t)os_log_create("com.apple.Maps", "ElevationGraph");

  _objc_release_x1();
}

id MAPSGetIncidentReportingLog()
{
  if (qword_8E070 != -1) {
    dispatch_once(&qword_8E070, &stru_616F0);
  }
  v0 = (void *)qword_8E068;

  return v0;
}

void sub_E648(id a1)
{
  qword_8E068 = (uint64_t)os_log_create("com.apple.Maps", "IncidentReporting");

  _objc_release_x1();
}

id MAPSGetLightLevelLog()
{
  if (qword_8E080 != -1) {
    dispatch_once(&qword_8E080, &stru_61710);
  }
  v0 = (void *)qword_8E078;

  return v0;
}

void sub_E6E0(id a1)
{
  qword_8E078 = (uint64_t)os_log_create("com.apple.Maps", "LightLevel");

  _objc_release_x1();
}

id MAPSGetMapRegionLog()
{
  if (qword_8E090 != -1) {
    dispatch_once(&qword_8E090, &stru_61730);
  }
  v0 = (void *)qword_8E088;

  return v0;
}

void sub_E778(id a1)
{
  qword_8E088 = (uint64_t)os_log_create("com.apple.Maps", "MapRegion");

  _objc_release_x1();
}

id MAPSGetNavigationSimulationPromptLog()
{
  if (qword_8E0A0 != -1) {
    dispatch_once(&qword_8E0A0, &stru_61750);
  }
  v0 = (void *)qword_8E098;

  return v0;
}

void sub_E810(id a1)
{
  qword_8E098 = (uint64_t)os_log_create("com.apple.Maps", "NavigationSimulationPrompt");

  _objc_release_x1();
}

id MAPSGetNavIndicatorsLog()
{
  if (qword_8E0B0 != -1) {
    dispatch_once(&qword_8E0B0, &stru_61770);
  }
  v0 = (void *)qword_8E0A8;

  return v0;
}

void sub_E8A8(id a1)
{
  qword_8E0A8 = (uint64_t)os_log_create("com.apple.Maps", "NavIndicators");

  _objc_release_x1();
}

id MAPSGetProactiveTrayLog()
{
  if (qword_8E0C0 != -1) {
    dispatch_once(&qword_8E0C0, &stru_61790);
  }
  v0 = (void *)qword_8E0B8;

  return v0;
}

void sub_E940(id a1)
{
  qword_8E0B8 = (uint64_t)os_log_create("com.apple.Maps", "ProactiveTray");

  _objc_release_x1();
}

id MAPSGetRAPPresenterLog()
{
  if (qword_8E0D0 != -1) {
    dispatch_once(&qword_8E0D0, &stru_617B0);
  }
  v0 = (void *)qword_8E0C8;

  return v0;
}

void sub_E9D8(id a1)
{
  qword_8E0C8 = (uint64_t)os_log_create("com.apple.Maps", "RAPPresenter");

  _objc_release_x1();
}

id MAPSGetRoutePlanningOutlineLog()
{
  if (qword_8E0E0 != -1) {
    dispatch_once(&qword_8E0E0, &stru_617D0);
  }
  v0 = (void *)qword_8E0D8;

  return v0;
}

void sub_EA70(id a1)
{
  qword_8E0D8 = (uint64_t)os_log_create("com.apple.Maps", "RoutePlanningOutline");

  _objc_release_x1();
}

id MAPSGetStatusIndicatorLog()
{
  if (qword_8E0F0 != -1) {
    dispatch_once(&qword_8E0F0, &stru_617F0);
  }
  v0 = (void *)qword_8E0E8;

  return v0;
}

void sub_EB08(id a1)
{
  qword_8E0E8 = (uint64_t)os_log_create("com.apple.Maps", "StatusIndicator");

  _objc_release_x1();
}

id MAPSGetTransitNavigationLog()
{
  if (qword_8E100 != -1) {
    dispatch_once(&qword_8E100, &stru_61810);
  }
  v0 = (void *)qword_8E0F8;

  return v0;
}

void sub_EBA0(id a1)
{
  qword_8E0F8 = (uint64_t)os_log_create("com.apple.Maps", "TransitNavigation");

  _objc_release_x1();
}

id MAPSGetTurnAlertsLog()
{
  if (qword_8E110 != -1) {
    dispatch_once(&qword_8E110, &stru_61830);
  }
  v0 = (void *)qword_8E108;

  return v0;
}

void sub_EC38(id a1)
{
  qword_8E108 = (uint64_t)os_log_create("com.apple.Maps", "TurnAlerts");

  _objc_release_x1();
}

id MAPSGetUGCCallToActionViewProviderLog()
{
  if (qword_8E120 != -1) {
    dispatch_once(&qword_8E120, &stru_61850);
  }
  v0 = (void *)qword_8E118;

  return v0;
}

void sub_ECD0(id a1)
{
  qword_8E118 = (uint64_t)os_log_create("com.apple.Maps", "UGCCallToActionViewProvider");

  _objc_release_x1();
}

id MAPSGetUGCPhotoDownloadManagerLog()
{
  if (qword_8E130 != -1) {
    dispatch_once(&qword_8E130, &stru_61870);
  }
  v0 = (void *)qword_8E128;

  return v0;
}

void sub_ED68(id a1)
{
  qword_8E128 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoDownloadManager");

  _objc_release_x1();
}

id MAPSGetUGCReviewedPlacesManagerLog()
{
  if (qword_8E140 != -1) {
    dispatch_once(&qword_8E140, &stru_61890);
  }
  v0 = (void *)qword_8E138;

  return v0;
}

void sub_EE00(id a1)
{
  qword_8E138 = (uint64_t)os_log_create("com.apple.Maps", "UGCReviewedPlacesManager");

  _objc_release_x1();
}

id MAPSGetUGCPhotoViewerDataProviderLog()
{
  if (qword_8E150 != -1) {
    dispatch_once(&qword_8E150, &stru_618B0);
  }
  v0 = (void *)qword_8E148;

  return v0;
}

void sub_EE98(id a1)
{
  qword_8E148 = (uint64_t)os_log_create("com.apple.Maps", "UGCPhotoViewerDataProvider");

  _objc_release_x1();
}

id MAPSGetCarBlurViewLog()
{
  if (qword_8E160 != -1) {
    dispatch_once(&qword_8E160, &stru_618D0);
  }
  v0 = (void *)qword_8E158;

  return v0;
}

void sub_EF30(id a1)
{
  qword_8E158 = (uint64_t)os_log_create("com.apple.Maps", "CarBlurView");

  _objc_release_x1();
}

id MAPSGetCarCardsLog()
{
  if (qword_8E170 != -1) {
    dispatch_once(&qword_8E170, &stru_618F0);
  }
  v0 = (void *)qword_8E168;

  return v0;
}

void sub_EFC8(id a1)
{
  qword_8E168 = (uint64_t)os_log_create("com.apple.Maps", "CarCards");

  _objc_release_x1();
}

id MAPSGetCarClusterSuggestionLog()
{
  if (qword_8E180 != -1) {
    dispatch_once(&qword_8E180, &stru_61910);
  }
  v0 = (void *)qword_8E178;

  return v0;
}

void sub_F060(id a1)
{
  qword_8E178 = (uint64_t)os_log_create("com.apple.Maps", "CarClusterSuggestion");

  _objc_release_x1();
}

id MAPSGetCarCompressionLog()
{
  if (qword_8E190 != -1) {
    dispatch_once(&qword_8E190, &stru_61930);
  }
  v0 = (void *)qword_8E188;

  return v0;
}

void sub_F0F8(id a1)
{
  qword_8E188 = (uint64_t)os_log_create("com.apple.Maps", "CarCompression");

  _objc_release_x1();
}

id MAPSGetCarFocusLog()
{
  if (qword_8E1A0 != -1) {
    dispatch_once(&qword_8E1A0, &stru_61950);
  }
  v0 = (void *)qword_8E198;

  return v0;
}

void sub_F190(id a1)
{
  qword_8E198 = (uint64_t)os_log_create("com.apple.Maps", "CarFocus");

  _objc_release_x1();
}

id MAPSGetCarInstrumentClusterLog()
{
  if (qword_8E1B0 != -1) {
    dispatch_once(&qword_8E1B0, &stru_61970);
  }
  v0 = (void *)qword_8E1A8;

  return v0;
}

void sub_F228(id a1)
{
  qword_8E1A8 = (uint64_t)os_log_create("com.apple.Maps", "CarInstrumentCluster");

  _objc_release_x1();
}

id MAPSGetCarGuidanceLog()
{
  if (qword_8E1C0 != -1) {
    dispatch_once(&qword_8E1C0, &stru_61990);
  }
  v0 = (void *)qword_8E1B8;

  return v0;
}

void sub_F2C0(id a1)
{
  qword_8E1B8 = (uint64_t)os_log_create("com.apple.Maps", "CarGuidance");

  _objc_release_x1();
}

id MAPSGetCarMapWidgetLog()
{
  if (qword_8E1D0 != -1) {
    dispatch_once(&qword_8E1D0, &stru_619B0);
  }
  v0 = (void *)qword_8E1C8;

  return v0;
}

void sub_F358(id a1)
{
  qword_8E1C8 = (uint64_t)os_log_create("com.apple.Maps", "CarMapWidget");

  _objc_release_x1();
}

id MAPSGetCarPlayLog()
{
  if (qword_8E1E0 != -1) {
    dispatch_once(&qword_8E1E0, &stru_619D0);
  }
  v0 = (void *)qword_8E1D8;

  return v0;
}

void sub_F3F0(id a1)
{
  qword_8E1D8 = (uint64_t)os_log_create("com.apple.Maps", "CarPlay");

  _objc_release_x1();
}

id MAPSGetCarRouteGeniusLog()
{
  if (qword_8E1F0 != -1) {
    dispatch_once(&qword_8E1F0, &stru_619F0);
  }
  v0 = (void *)qword_8E1E8;

  return v0;
}

void sub_F488(id a1)
{
  qword_8E1E8 = (uint64_t)os_log_create("com.apple.Maps", "CarRouteGenius");

  _objc_release_x1();
}

id MAPSGetCarSessionControllerLog()
{
  if (qword_8E200 != -1) {
    dispatch_once(&qword_8E200, &stru_61A10);
  }
  v0 = (void *)qword_8E1F8;

  return v0;
}

void sub_F520(id a1)
{
  qword_8E1F8 = (uint64_t)os_log_create("com.apple.Maps", "CarSessionController");

  _objc_release_x1();
}

id MAPSGetCarSmallWidgetLog()
{
  if (qword_8E210 != -1) {
    dispatch_once(&qword_8E210, &stru_61A30);
  }
  v0 = (void *)qword_8E208;

  return v0;
}

void sub_F5B8(id a1)
{
  qword_8E208 = (uint64_t)os_log_create("com.apple.Maps", "CarSmallWidget");

  _objc_release_x1();
}

id MAPSGetCompanionControllerLog()
{
  if (qword_8E220 != -1) {
    dispatch_once(&qword_8E220, &stru_61A50);
  }
  v0 = (void *)qword_8E218;

  return v0;
}

void sub_F650(id a1)
{
  qword_8E218 = (uint64_t)os_log_create("com.apple.Maps", "CompanionController");

  _objc_release_x1();
}

id MAPSGetHydrateGeoMapItemLog()
{
  if (qword_8E230 != -1) {
    dispatch_once(&qword_8E230, &stru_61A70);
  }
  v0 = (void *)qword_8E228;

  return v0;
}

void sub_F6E8(id a1)
{
  qword_8E228 = (uint64_t)os_log_create("com.apple.Maps", "HydrateGeoMapItem");

  _objc_release_x1();
}

id MAPSGetIdleTimerLog()
{
  if (qword_8E240 != -1) {
    dispatch_once(&qword_8E240, &stru_61A90);
  }
  v0 = (void *)qword_8E238;

  return v0;
}

void sub_F780(id a1)
{
  qword_8E238 = (uint64_t)os_log_create("com.apple.Maps", "IdleTimer");

  _objc_release_x1();
}

id MAPSGetPedestrianARLog()
{
  if (qword_8E250 != -1) {
    dispatch_once(&qword_8E250, &stru_61AB0);
  }
  v0 = (void *)qword_8E248;

  return v0;
}

void sub_F818(id a1)
{
  qword_8E248 = (uint64_t)os_log_create("com.apple.Maps", "PedestrianAR");

  _objc_release_x1();
}

id MAPSGetPuckTrackingLog()
{
  if (qword_8E260 != -1) {
    dispatch_once(&qword_8E260, &stru_61AD0);
  }
  v0 = (void *)qword_8E258;

  return v0;
}

void sub_F8B0(id a1)
{
  qword_8E258 = (uint64_t)os_log_create("com.apple.Maps", "PuckTracking");

  _objc_release_x1();
}

void sub_FA58(uint64_t a1)
{
  BOOL v2 = objc_getAssociatedObject(*(id *)(a1 + 32), off_8A7D0);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(v2, "copy", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      __int16 v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) performSelector:NSSelectorFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * (void)v7))];
        __int16 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_setAssociatedObject(*(id *)(a1 + 32), off_8A7D0, 0, (char *)&dword_0 + 1);
  objc_setAssociatedObject(*(id *)(a1 + 32), off_8A7C8, 0, (char *)&dword_0 + 3);
}

id sub_100EC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v10[0] = a2;
  id v7 = a2;
  long long v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  v10[1] = v8;
  long long v9 = +[NSArray arrayWithObjects:v10 count:2];
  [v6 addObject:v9];
}

id MapsMap(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    id v7 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      long long v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          long long v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i), &i[v9]);
          if (v12) {
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
        }
        long long v8 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v9 += (uint64_t)i;
      }
      while (v8);
    }

    id v13 = [v5 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

id MapsFlatMap(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v3;
    id obj = v3;
    id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v30;
      p_info = &@"Only Use Offline Maps [Settings]".info;
      do
      {
        long long v11 = 0;
        id v23 = v7;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v12 = v4[2](v4, *(void *)(*((void *)&v29 + 1) + 8 * (void)v11), v8);
          id v13 = v12;
          if (v12)
          {
            if ([v12 conformsToProtocol:p_info[472]])
            {
              uint64_t v14 = v9;
              id v15 = v13;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = *(void *)v26;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v26 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * i), v22);
                  }
                  id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
                }
                while (v17);
              }

              uint64_t v9 = v14;
              id v7 = v23;
              p_info = (void *)(@"Only Use Offline Maps [Settings]" + 8);
            }
            else
            {
              [v5 addObject:v13];
            }
          }
          ++v8;

          long long v11 = (char *)v11 + 1;
        }
        while (v11 != v7);
        id v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    id v20 = [v5 copy];
    id v3 = v22;
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

id MapsFilter(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        char v15 = 0;
        if (v4[2](v4, v12, v9 + v11, &v15)) {
          [v5 addObject:v12];
        }
        if (v15) {
          break;
        }
        if (v8 == (id)++v11)
        {
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          v9 += v11;
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v13 = [v5 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

id MapsFindFirst(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          char v14 = 0;
          if (v4[2](v4, v11, &i[v8], &v14))
          {
            id v12 = v11;
            goto LABEL_15;
          }
          if (v14) {
            goto LABEL_12;
          }
        }
        id v7 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        id v12 = 0;
        v8 += (uint64_t)i;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_12:
      id v12 = 0;
    }
LABEL_15:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t MapsAllSatisfies(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          if (!v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), &v10[v8]))
          {
            uint64_t v11 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v7 != v10);
        id v7 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        v8 += (uint64_t)v10;
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id MapsEquals(void *a1, void *a2)
{
  if (a1 == a2) {
    return &dword_0 + 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

__CFString *MapsStringFromBOOL(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void *MapsConfig_GetUserDefaultStringKeysForWatchSync()
{
  return &__NSArray0__struct;
}

_UNKNOWN **MapsConfig_GetConfigStoreStringKeysForWatchSync()
{
  return &off_7C388;
}

id sub_10AC4(id a1)
{
  return &__kCFBooleanTrue;
}

void sub_10AD0()
{
  if (qword_8E268 != -1) {
    dispatch_once(&qword_8E268, &stru_6C3F0);
  }
}

void sub_10AF8(id a1)
{
  byte_8D7F8 = 1;
  __GEOConfigRegisterStateCaptureFunctions(sub_10B28, sub_10B34);
}

_UNKNOWN **sub_10B28()
{
  return &off_7C3A0;
}

_UNKNOWN **sub_10B34()
{
  return &off_7C3B8;
}

id sub_10B40(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10B4C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10B58(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10B64(id a1)
{
  return &off_7C550;
}

id sub_10B70(id a1)
{
  return &off_7C568;
}

id sub_10B7C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10B88(id a1)
{
  uint64_t v1 = +[GEOPlatform sharedPlatform];
  BOOL v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 isInternalInstall]);

  return v2;
}

id sub_10BF0(id a1)
{
  return &off_7CD90;
}

id sub_10BFC(id a1)
{
  return &off_7CDA0;
}

id sub_10C08(id a1)
{
  return &off_7CDB0;
}

id sub_10C14(id a1)
{
  return &off_7CDC0;
}

id sub_10C20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C2C(id a1)
{
  return &off_7C580;
}

id sub_10C38(id a1)
{
  return &off_7C598;
}

id sub_10C44(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C50(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C5C(id a1)
{
  return &off_7C5B0;
}

id sub_10C68(id a1)
{
  return &off_7C5C8;
}

id sub_10C74(id a1)
{
  return &off_7C5E0;
}

id sub_10C80(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10C8C(id a1)
{
  return &off_7C3D0;
}

id sub_10C98(id a1)
{
  return &off_7CDD0;
}

id sub_10CA4(id a1)
{
  return &off_7CDE0;
}

id sub_10CB0(id a1)
{
  return &off_7C5B0;
}

id sub_10CBC(id a1)
{
  return 0;
}

id sub_10CC4(id a1)
{
  return &off_7CDF0;
}

id sub_10CD0(id a1)
{
  return &off_7CE00;
}

id sub_10CDC(id a1)
{
  return &off_7CE10;
}

id sub_10CE8(id a1)
{
  return &off_7CE20;
}

id sub_10CF4(id a1)
{
  return &off_7CE30;
}

id sub_10D00(id a1)
{
  return &off_7CDD0;
}

id sub_10D0C(id a1)
{
  return &off_7CE40;
}

id sub_10D18(id a1)
{
  return &off_7CE20;
}

id sub_10D24(id a1)
{
  return &off_7C568;
}

id sub_10D30(id a1)
{
  return &off_7CE50;
}

id sub_10D3C(id a1)
{
  return &off_7CE30;
}

id sub_10D48(id a1)
{
  return &off_7CE60;
}

id sub_10D54(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10D60(id a1)
{
  return &off_7C5F8;
}

id sub_10D6C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D78(id a1)
{
  return &off_7C610;
}

id sub_10D84(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D90(id a1)
{
  return &off_7C628;
}

id sub_10D9C(id a1)
{
  return &off_7CDF0;
}

id sub_10DA8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10DB4(id a1)
{
  return 0;
}

id sub_10DBC(id a1)
{
  return &off_7CE70;
}

id sub_10DC8(id a1)
{
  return &off_7C640;
}

id sub_10DD4(id a1)
{
  return &off_7C598;
}

id sub_10DE0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10DEC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10DF8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E04(id a1)
{
  return &off_7C568;
}

id sub_10E10(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E1C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10E28(id a1)
{
  return &off_7C658;
}

id sub_10E34(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E40(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10E4C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E58(id a1)
{
  return &off_7C670;
}

id sub_10E64(id a1)
{
  return &off_7CE20;
}

id sub_10E70(id a1)
{
  return &off_7CE80;
}

id sub_10E7C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10E88(id a1)
{
  return &off_7C688;
}

id sub_10E94(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10EA0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10EAC(id a1)
{
  return &off_7C598;
}

id sub_10EB8(id a1)
{
  return &off_7C568;
}

id sub_10EC4(id a1)
{
  return &off_7C6A0;
}

id sub_10ED0(id a1)
{
  return &off_7C6B8;
}

id sub_10EDC(id a1)
{
  return &off_7C6D0;
}

id sub_10EE8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10EF4(id a1)
{
  return &off_7C6E8;
}

id sub_10F00(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10F0C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10F18(id a1)
{
  return &off_7C700;
}

id sub_10F24(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10F30(id a1)
{
  return &off_7CE80;
}

id sub_10F3C(id a1)
{
  return &off_7CDF0;
}

id sub_10F48(id a1)
{
  return &off_7C718;
}

id sub_10F54(id a1)
{
  return &off_7C6E8;
}

id sub_10F60(id a1)
{
  return &off_7C718;
}

id sub_10F6C(id a1)
{
  return &off_7C730;
}

id sub_10F78(id a1)
{
  return &off_7C748;
}

id sub_10F84(id a1)
{
  return &off_7CE90;
}

id sub_10F90(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10F9C(id a1)
{
  return &off_7C760;
}

id sub_10FA8(id a1)
{
  return &off_7C568;
}

id sub_10FB4(id a1)
{
  return &off_7C760;
}

id sub_10FC0(id a1)
{
  return &off_7C6E8;
}

id sub_10FCC(id a1)
{
  return &off_7C568;
}

id sub_10FD8(id a1)
{
  return &off_7C568;
}

id sub_10FE4(id a1)
{
  return &off_7C628;
}

id sub_10FF0(id a1)
{
  return &off_7C778;
}

id sub_10FFC(id a1)
{
  return &off_7C790;
}

id sub_11008(id a1)
{
  return &off_7C7A8;
}

id sub_11014(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11020(id a1)
{
  return &off_7C7C0;
}

id sub_1102C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11038(id a1)
{
  return @"inbox.appleid.apple.com";
}

id sub_11044(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11050(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1105C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11068(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11074(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11080(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1108C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11098(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110A4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110B0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110BC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110C8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110E0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110EC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_110F8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11104(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11110(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1111C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11128(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11134(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11140(id a1)
{
  return &off_7C7D8;
}

id sub_1114C(id a1)
{
  return &off_7C760;
}

id sub_11158(id a1)
{
  return &off_7D0F0;
}

id sub_11164(id a1)
{
  return &off_7D100;
}

id sub_11170(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1117C(id a1)
{
  return &off_7C7A8;
}

id sub_11188(id a1)
{
  return &off_7C7A8;
}

id sub_11194(id a1)
{
  return &off_7C6E8;
}

id sub_111A0(id a1)
{
  return &off_7C6A0;
}

id sub_111AC(id a1)
{
  return &off_7C7A8;
}

id sub_111B8(id a1)
{
  return &off_7C7F0;
}

id sub_111C4(id a1)
{
  return &off_7C5E0;
}

id sub_111D0(id a1)
{
  return &off_7C760;
}

id sub_111DC(id a1)
{
  return &off_7C760;
}

id sub_111E8(id a1)
{
  return &off_7C760;
}

id sub_111F4(id a1)
{
  return &off_7C568;
}

id sub_11200(id a1)
{
  return &off_7C808;
}

id sub_1120C(id a1)
{
  return &off_7C718;
}

id sub_11218(id a1)
{
  return 0;
}

id sub_11220(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1122C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11238(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11244(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11250(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1125C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11268(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11274(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11280(id a1)
{
  return &off_7C820;
}

id sub_1128C(id a1)
{
  return &off_7CEA0;
}

id sub_11298(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_112A4(id a1)
{
  return &off_7CE70;
}

id sub_112B0(id a1)
{
  return &off_7CEB0;
}

id sub_112BC(id a1)
{
  return &off_7C838;
}

id sub_112C8(id a1)
{
  return &off_7C7A8;
}

id sub_112D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_112E0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_112EC(id a1)
{
  return &off_7CDC0;
}

id sub_112F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11304(id a1)
{
  return &off_7C7C0;
}

id sub_11310(id a1)
{
  return &off_7CEC0;
}

id sub_1131C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11328(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11334(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11340(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1134C(id a1)
{
  return &off_7CED0;
}

id sub_11358(id a1)
{
  return &off_7CE00;
}

id sub_11364(id a1)
{
  return &off_7CEE0;
}

id sub_11370(id a1)
{
  return &off_7CEF0;
}

id sub_1137C(id a1)
{
  return &off_7C6E8;
}

id sub_11388(id a1)
{
  return &off_7CF00;
}

id sub_11394(id a1)
{
  return &off_7CDE0;
}

id sub_113A0(id a1)
{
  return &off_7CF10;
}

id sub_113AC(id a1)
{
  return &off_7CF20;
}

id sub_113B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_113C4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_113D0(id a1)
{
  return &off_7CDF0;
}

id sub_113DC(id a1)
{
  return &off_7CF30;
}

id sub_113E8(id a1)
{
  return &off_7C598;
}

id sub_113F4(id a1)
{
  return &off_7C790;
}

id sub_11400(id a1)
{
  return &off_7C700;
}

id sub_1140C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11418(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11424(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11430(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1143C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11448(id a1)
{
  return &off_7C568;
}

id sub_11454(id a1)
{
  return &off_7C850;
}

id sub_11460(id a1)
{
  return &off_7CE40;
}

id sub_1146C(id a1)
{
  return &off_7CF20;
}

id sub_11478(id a1)
{
  return &off_7CF40;
}

id sub_11484(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11490(id a1)
{
  return &off_7C6A0;
}

id sub_1149C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_114A8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_114B4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_114C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_114CC(id a1)
{
  return &off_7C868;
}

id sub_114D8(id a1)
{
  return &off_7C598;
}

id sub_114E4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_114F0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_114FC(id a1)
{
  return &off_7C700;
}

id sub_11508(id a1)
{
  return &off_7C5E0;
}

id sub_11514(id a1)
{
  return &off_7C880;
}

id sub_11520(id a1)
{
  return &off_7C898;
}

id sub_1152C(id a1)
{
  return &off_7C898;
}

id sub_11538(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11544(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11550(id a1)
{
  return &off_7C8B0;
}

id sub_1155C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11568(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11574(id a1)
{
  return &off_7C7F0;
}

id sub_11580(id a1)
{
  return &off_7C628;
}

id sub_1158C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11598(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_115A4(id a1)
{
  return &off_7C6A0;
}

id sub_115B0(id a1)
{
  return &off_7C8C8;
}

id sub_115BC(id a1)
{
  return &off_7C550;
}

id sub_115C8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_115D4(id a1)
{
  return &off_7C598;
}

id sub_115E0(id a1)
{
  return &off_7CF50;
}

id sub_115EC(id a1)
{
  return &off_7CF60;
}

id sub_115F8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11604(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11610(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1161C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11628(id a1)
{
  return &off_7C598;
}

id sub_11634(id a1)
{
  return &off_7C598;
}

id sub_11640(id a1)
{
  return &off_7CDD0;
}

id sub_1164C(id a1)
{
  return &off_7C628;
}

id sub_11658(id a1)
{
  return &off_7C8E0;
}

id sub_11664(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11670(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1167C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11688(id a1)
{
  return &off_7CEC0;
}

id sub_11694(id a1)
{
  return &off_7C6E8;
}

id sub_116A0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116AC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116B8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116D0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116DC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116E8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_116F4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11700(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1170C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11718(id a1)
{
  return &off_7CF30;
}

id sub_11724(id a1)
{
  return &off_7CDF0;
}

id sub_11730(id a1)
{
  return &off_7CF70;
}

id sub_1173C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11748(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11754(id a1)
{
  return &off_7C790;
}

id sub_11760(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1176C(id a1)
{
  return &off_7CDF0;
}

id sub_11778(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11784(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11790(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1179C(id a1)
{
  return &off_7C898;
}

id sub_117A8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_117B4(id a1)
{
  return &off_7C598;
}

id sub_117C0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_117CC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_117D8(id a1)
{
  return &off_7C760;
}

id sub_117E4(id a1)
{
  return &off_7C850;
}

id sub_117F0(id a1)
{
  return &off_7CE50;
}

id sub_117FC(id a1)
{
  return &off_7C628;
}

id sub_11808(id a1)
{
  return &off_7C628;
}

id sub_11814(id a1)
{
  return &off_7C6A0;
}

id sub_11820(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1182C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11838(id a1)
{
  return &off_7C7A8;
}

id sub_11844(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11850(id a1)
{
  return @"https://www.apple.com/legal/internet-services/maps/ratings-photos/";
}

id sub_1185C(id a1)
{
  return &off_7C568;
}

id sub_11868(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11874(id a1)
{
  return &off_7C6E8;
}

id sub_11880(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1188C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11898(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_118A4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_118B0(id a1)
{
  return &off_7C8F8;
}

id sub_118BC(id a1)
{
  return &off_7C910;
}

id sub_118C8(id a1)
{
  return &off_7C928;
}

id sub_118D4(id a1)
{
  return &off_7C940;
}

id sub_118E0(id a1)
{
  return &off_7CF80;
}

id sub_118EC(id a1)
{
  return &off_7CF90;
}

id sub_118F8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11904(id a1)
{
  return &off_7CFA0;
}

id sub_11910(id a1)
{
  return &off_7CFB0;
}

id sub_1191C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11928(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11934(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11940(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1194C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11958(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11964(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11970(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1197C(id a1)
{
  return &off_7C718;
}

id sub_11988(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11994(id a1)
{
  return &off_7C6E8;
}

id sub_119A0(id a1)
{
  return &off_7C790;
}

id sub_119AC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_119B8(id a1)
{
  return @"https://www.apple.com/ios/feature-availability/#maps-cycling";
}

id sub_119C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_119D0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_119DC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_119E8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_119F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11A00(id a1)
{
  return &off_7C598;
}

id sub_11A0C(id a1)
{
  return &off_7C610;
}

id sub_11A18(id a1)
{
  return &off_7C7D8;
}

id sub_11A24(id a1)
{
  return &off_7C898;
}

id sub_11A30(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11A3C(id a1)
{
  return &off_7C880;
}

id sub_11A48(id a1)
{
  return &off_7C5E0;
}

id sub_11A54(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11A60(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11A6C(id a1)
{
  return &off_7C6E8;
}

id sub_11A78(id a1)
{
  return &off_7C880;
}

id sub_11A84(id a1)
{
  return &off_7C6A0;
}

id sub_11A90(id a1)
{
  return &off_7C700;
}

id sub_11A9C(id a1)
{
  return &off_7C898;
}

id sub_11AA8(id a1)
{
  return &off_7C5E0;
}

id sub_11AB4(id a1)
{
  return &off_7C3E8;
}

id sub_11AC0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11ACC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11AD8(id a1)
{
  return &off_7C8E0;
}

id sub_11AE4(id a1)
{
  return &off_7C8F8;
}

id sub_11AF0(id a1)
{
  return &off_7C868;
}

id sub_11AFC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11B08(id a1)
{
  return &off_7C970;
}

id sub_11B14(id a1)
{
  return &off_7C970;
}

id sub_11B20(id a1)
{
  return &off_7C628;
}

id sub_11B2C(id a1)
{
  return 0;
}

id sub_11B34(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11B40(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11B4C(id a1)
{
  return 0;
}

id sub_11B54(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11B60(id a1)
{
  return &off_7C598;
}

id sub_11B6C(id a1)
{
  return &off_7C598;
}

id sub_11B78(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11B84(id a1)
{
  return &off_7C988;
}

id sub_11B90(id a1)
{
  return &off_7C6A0;
}

id sub_11B9C(id a1)
{
  return &off_7C5F8;
}

id sub_11BA8(id a1)
{
  return &off_7C9A0;
}

id sub_11BB4(id a1)
{
  return @"https://www.apple.com/legal/internet-services/maps/";
}

id sub_11BC0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11BCC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11BD8(id a1)
{
  return &off_7C790;
}

id sub_11BE4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11BF0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11BFC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C08(id a1)
{
  return &off_7C5E0;
}

id sub_11C14(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11C20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C2C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C38(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C44(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C50(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C5C(id a1)
{
  return &off_7CE50;
}

id sub_11C68(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C74(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C80(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C8C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11C98(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11CA4(id a1)
{
  return &off_7C760;
}

id sub_11CB0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11CBC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11CC8(id a1)
{
  return &off_7C700;
}

id sub_11CD4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11CE0(id a1)
{
  return &off_7C760;
}

id sub_11CEC(id a1)
{
  return &off_7CFC0;
}

id sub_11CF8(id a1)
{
  return &off_7C760;
}

id sub_11D04(id a1)
{
  return &off_7C598;
}

id sub_11D10(id a1)
{
  return &off_7C568;
}

id sub_11D1C(id a1)
{
  return &off_7C6E8;
}

id sub_11D28(id a1)
{
  return &off_7C760;
}

id sub_11D34(id a1)
{
  return &off_7C9B8;
}

id sub_11D40(id a1)
{
  return &off_7C598;
}

id sub_11D4C(id a1)
{
  return &off_7C568;
}

id sub_11D58(id a1)
{
  return &off_7C6A0;
}

id sub_11D64(id a1)
{
  return &off_7C760;
}

id sub_11D70(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11D7C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11D88(id a1)
{
  return &off_7C9D0;
}

id sub_11D94(id a1)
{
  return &off_7C5C8;
}

id sub_11DA0(id a1)
{
  return &off_7C7A8;
}

id sub_11DAC(id a1)
{
  return &off_7C820;
}

id sub_11DB8(id a1)
{
  return &off_7C7A8;
}

id sub_11DC4(id a1)
{
  return &off_7C7A8;
}

id sub_11DD0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11DDC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11DE8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11DF4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11E00(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11E0C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11E18(id a1)
{
  return &off_7CFD0;
}

id sub_11E24(id a1)
{
  return 0;
}

id sub_11E2C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11E38(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11E44(id a1)
{
  return &off_7CE40;
}

id sub_11E50(id a1)
{
  return &off_7CFE0;
}

id sub_11E5C(id a1)
{
  return &off_7C6E8;
}

id sub_11E68(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11E74(id a1)
{
  return &off_7CED0;
}

id sub_11E80(id a1)
{
  return &off_7C718;
}

id sub_11E8C(id a1)
{
  return &off_7C550;
}

id sub_11E98(id a1)
{
  return &off_7C9E8;
}

id sub_11EA4(id a1)
{
  return &off_7CA00;
}

id sub_11EB0(id a1)
{
  return &off_7CE20;
}

id sub_11EBC(id a1)
{
  return &off_7C6B8;
}

id sub_11EC8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11ED4(id a1)
{
  return &off_7CEA0;
}

id sub_11EE0(id a1)
{
  return &off_7C7A8;
}

id sub_11EEC(id a1)
{
  return &off_7C598;
}

id sub_11EF8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11F04(id a1)
{
  return &off_7C7A8;
}

id sub_11F10(id a1)
{
  return &off_7C7A8;
}

id sub_11F1C(id a1)
{
  return &off_7CFF0;
}

id sub_11F28(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11F34(id a1)
{
  return &off_7D000;
}

id sub_11F40(id a1)
{
  return &off_7C628;
}

id sub_11F4C(id a1)
{
  return &off_7C628;
}

id sub_11F58(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11F64(id a1)
{
  return &off_7C880;
}

id sub_11F70(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11F7C(id a1)
{
  return &off_7CED0;
}

id sub_11F88(id a1)
{
  return &off_7CEA0;
}

id sub_11F94(id a1)
{
  return &off_7CE20;
}

id sub_11FA0(id a1)
{
  return &off_7C9B8;
}

id sub_11FAC(id a1)
{
  return &off_7C598;
}

id sub_11FB8(id a1)
{
  return &off_7C838;
}

id sub_11FC4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11FD0(id a1)
{
  return &off_7CDD0;
}

id sub_11FDC(id a1)
{
  return &off_7CEA0;
}

id sub_11FE8(id a1)
{
  return &off_7D010;
}

id sub_11FF4(id a1)
{
  return &off_7CEA0;
}

id sub_12000(id a1)
{
  return &off_7D020;
}

id sub_1200C(id a1)
{
  return &off_7CEA0;
}

id sub_12018(id a1)
{
  return &off_7D030;
}

id sub_12024(id a1)
{
  return &off_7CEA0;
}

id sub_12030(id a1)
{
  return &off_7D040;
}

id sub_1203C(id a1)
{
  return &off_7CEA0;
}

id sub_12048(id a1)
{
  return &off_7D010;
}

id sub_12054(id a1)
{
  return &off_7CEA0;
}

id sub_12060(id a1)
{
  return &off_7CF00;
}

id sub_1206C(id a1)
{
  return &off_7CEA0;
}

id sub_12078(id a1)
{
  return &off_7D050;
}

id sub_12084(id a1)
{
  return &off_7D010;
}

id sub_12090(id a1)
{
  return &off_7CEA0;
}

id sub_1209C(id a1)
{
  return &off_7D020;
}

id sub_120A8(id a1)
{
  return &off_7CEA0;
}

id sub_120B4(id a1)
{
  return &off_7CED0;
}

id sub_120C0(id a1)
{
  return &off_7CEA0;
}

id sub_120CC(id a1)
{
  return 0;
}

id sub_120D4(id a1)
{
  return 0;
}

id sub_120DC(id a1)
{
  return &off_7CA18;
}

id sub_120E8(id a1)
{
  return &off_7C838;
}

id sub_120F4(id a1)
{
  return 0;
}

id sub_120FC(id a1)
{
  return &off_7CA30;
}

id sub_12108(id a1)
{
  return 0;
}

id sub_12110(id a1)
{
  return 0;
}

id sub_12118(id a1)
{
  return &off_7C598;
}

id sub_12124(id a1)
{
  return &off_7C568;
}

id sub_12130(id a1)
{
  return &off_7C628;
}

id sub_1213C(id a1)
{
  return &off_7C628;
}

id sub_12148(id a1)
{
  return &off_7CA48;
}

id sub_12154(id a1)
{
  return &off_7C598;
}

id sub_12160(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1216C(id a1)
{
  return &off_7C6E8;
}

id sub_12178(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12184(id a1)
{
  return &off_7C550;
}

id sub_12190(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1219C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_121A8(id a1)
{
  return &off_7C568;
}

id sub_121B4(id a1)
{
  return &off_7C7A8;
}

id sub_121C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_121CC(id a1)
{
  return &off_7C898;
}

id sub_121D8(id a1)
{
  return &off_7C5E0;
}

id sub_121E4(id a1)
{
  return &off_7C880;
}

id sub_121F0(id a1)
{
  return &off_7C760;
}

id sub_121FC(id a1)
{
  return &off_7C550;
}

id sub_12208(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12214(id a1)
{
  return &off_7C940;
}

id sub_12220(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1222C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12238(id a1)
{
  return &off_7C628;
}

id sub_12244(id a1)
{
  return &off_7C718;
}

id sub_12250(id a1)
{
  return &off_7C598;
}

id sub_1225C(id a1)
{
  return &off_7C9D0;
}

id sub_12268(id a1)
{
  return &off_7D110;
}

id sub_12274(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12280(id a1)
{
  return &off_7C6E8;
}

id sub_1228C(id a1)
{
  return &off_7C790;
}

id sub_12298(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_122A4(id a1)
{
  return &off_7CA60;
}

id sub_122B0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_122BC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_122C8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_122D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_122E0(id a1)
{
  return &off_7C850;
}

id sub_122EC(id a1)
{
  return &off_7C7A8;
}

id sub_122F8(id a1)
{
  return &off_7C658;
}

id sub_12304(id a1)
{
  return &off_7D138;
}

id sub_12310(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1231C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12328(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12334(id a1)
{
  return &off_7CFF0;
}

id sub_12340(id a1)
{
  return &off_7C628;
}

id sub_1234C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12358(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12364(id a1)
{
  return &off_7C6A0;
}

id sub_12370(id a1)
{
  return &off_7C790;
}

id sub_1237C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12388(id a1)
{
  return &off_7C6A0;
}

id sub_12394(id a1)
{
  return &off_7C550;
}

id sub_123A0(id a1)
{
  return &off_7C568;
}

id sub_123AC(id a1)
{
  return &off_7C568;
}

id sub_123B8(id a1)
{
  return &off_7C598;
}

id sub_123C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_123D0(id a1)
{
  return &off_7CE50;
}

id sub_123DC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_123E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_123F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12400(id a1)
{
  return &off_7C748;
}

id sub_1240C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12418(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12424(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12430(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1243C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12448(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12454(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12460(id a1)
{
  return &off_7CE50;
}

id sub_1246C(id a1)
{
  return &off_7C598;
}

id sub_12478(id a1)
{
  return &off_7C598;
}

id sub_12484(id a1)
{
  return &off_7C6E8;
}

id sub_12490(id a1)
{
  return &off_7C628;
}

id sub_1249C(id a1)
{
  return &off_7CFF0;
}

id sub_124A8(id a1)
{
  return &off_7CFA0;
}

id sub_124B4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_124C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_124CC(id a1)
{
  return &off_7CA78;
}

id sub_124D8(id a1)
{
  return &off_7CA78;
}

id sub_124E4(id a1)
{
  return &off_7CA78;
}

id sub_124F0(id a1)
{
  return &off_7D060;
}

id sub_124FC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12508(id a1)
{
  return &off_7C6B8;
}

id sub_12514(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12520(id a1)
{
  return &off_7C5E0;
}

id sub_1252C(id a1)
{
  return &off_7C6A0;
}

id sub_12538(id a1)
{
  return &off_7D000;
}

id sub_12544(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12550(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1255C(id a1)
{
  return &off_7C670;
}

id sub_12568(id a1)
{
  return &off_7C670;
}

id sub_12574(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12580(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1258C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12598(id a1)
{
  return &off_7C598;
}

id sub_125A4(id a1)
{
  return &off_7CA90;
}

id sub_125B0(id a1)
{
  return &off_7CE40;
}

id sub_125BC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_125C8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_125D4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_125E0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_125EC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_125F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12604(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12610(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1261C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12628(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12634(id a1)
{
  return &off_7C6E8;
}

id sub_12640(id a1)
{
  return &off_7C760;
}

id sub_1264C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12658(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12664(id a1)
{
  return 0;
}

id sub_1266C(id a1)
{
  return 0;
}

id sub_12674(id a1)
{
  return &off_7D020;
}

id sub_12680(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1268C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12698(id a1)
{
  return &off_7CAA8;
}

id sub_126A4(id a1)
{
  return &off_7C790;
}

id sub_126B0(id a1)
{
  return &off_7CE50;
}

id sub_126BC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_126C8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_126D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_126E0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_126EC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_126F8(id a1)
{
  return &off_7D070;
}

id sub_12704(id a1)
{
  return &off_7D080;
}

id sub_12710(id a1)
{
  return &off_7C7F0;
}

id sub_1271C(id a1)
{
  return &off_7CA78;
}

id sub_12728(id a1)
{
  return &off_7C7A8;
}

id sub_12734(id a1)
{
  return &off_7C6A0;
}

id sub_12740(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1274C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12758(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12764(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12770(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1277C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12788(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12794(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_127A0(id a1)
{
  return &off_7C718;
}

id sub_127AC(id a1)
{
  return &off_7C790;
}

id sub_127B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_127C4(id a1)
{
  return &off_7C6E8;
}

id sub_127D0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_127DC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_127E8(id a1)
{
  return &off_7C568;
}

id sub_127F4(id a1)
{
  return &off_7CE50;
}

id sub_12800(id a1)
{
  return &off_7C6A0;
}

id sub_1280C(id a1)
{
  return &off_7C760;
}

id sub_12818(id a1)
{
  return &off_7C598;
}

id sub_12824(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12830(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1283C(id a1)
{
  return &off_7C760;
}

id sub_12848(id a1)
{
  return &off_7C6A0;
}

id sub_12854(id a1)
{
  return &off_7CE50;
}

id sub_12860(id a1)
{
  return &__NSArray0__struct;
}

id sub_1286C(id a1)
{
  return &off_7C7A8;
}

id sub_12878(id a1)
{
  return &off_7C5E0;
}

id sub_12884(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12890(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1289C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_128A8(id a1)
{
  return &off_7D090;
}

id sub_128B4(id a1)
{
  return &off_7C790;
}

id sub_128C0(id a1)
{
  return &off_7C628;
}

id sub_128CC(id a1)
{
  return &off_7C928;
}

id sub_128D8(id a1)
{
  return &off_7CEA0;
}

id sub_128E4(id a1)
{
  return &off_7D0A0;
}

id sub_128F0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_128FC(id a1)
{
  return &off_7CAC0;
}

id sub_12908(id a1)
{
  return &off_7CAD8;
}

id sub_12914(id a1)
{
  return &off_7C9A0;
}

id sub_12920(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1292C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12938(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12944(id a1)
{
  return &off_7CE80;
}

id sub_12950(id a1)
{
  return &off_7D0B0;
}

id sub_1295C(id a1)
{
  return &off_7CFA0;
}

id sub_12968(id a1)
{
  return &off_7D0C0;
}

id sub_12974(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12980(id a1)
{
  return &off_7CFF0;
}

id sub_1298C(id a1)
{
  return &off_7C868;
}

id sub_12998(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_129A4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_129B0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_129BC(id a1)
{
  return &off_7C6A0;
}

id sub_129C8(id a1)
{
  return &off_7C718;
}

id sub_129D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_129E0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_129EC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_129F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12A04(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12A10(id a1)
{
  return &off_7CAF0;
}

id sub_12A1C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12A28(id a1)
{
  return &off_7C5E0;
}

id sub_12A34(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12A40(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12A4C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12A58(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12A64(id a1)
{
  return &off_7C628;
}

id sub_12A70(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12A7C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12A88(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12A94(id a1)
{
  return &off_7C6E8;
}

id sub_12AA0(id a1)
{
  return &off_7CFF0;
}

id sub_12AAC(id a1)
{
  return &off_7C958;
}

id sub_12AB8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12AC4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12AD0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12ADC(id a1)
{
  return &off_7CF70;
}

id sub_12AE8(id a1)
{
  return &off_7CB08;
}

id sub_12AF4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B00(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B0C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12B18(id a1)
{
  return &off_7C718;
}

id sub_12B24(id a1)
{
  return &off_7C718;
}

id sub_12B30(id a1)
{
  return &off_7C718;
}

id sub_12B3C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B48(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12B54(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B60(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B6C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12B78(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12B84(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B90(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12B9C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12BA8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12BB4(id a1)
{
  return &off_7C718;
}

id sub_12BC0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12BCC(id a1)
{
  return &off_7C988;
}

id sub_12BD8(id a1)
{
  return &off_7C760;
}

id sub_12BE4(id a1)
{
  return &off_7C760;
}

id sub_12BF0(id a1)
{
  return &off_7C568;
}

id sub_12BFC(id a1)
{
  return &off_7C760;
}

id sub_12C08(id a1)
{
  return &off_7CFD0;
}

id sub_12C14(id a1)
{
  return &off_7CB20;
}

id sub_12C20(id a1)
{
  return &off_7CB38;
}

id sub_12C2C(id a1)
{
  return &off_7CB50;
}

id sub_12C38(id a1)
{
  return &off_7CB68;
}

id sub_12C44(id a1)
{
  return &off_7CB80;
}

id sub_12C50(id a1)
{
  return &off_7CB98;
}

id sub_12C5C(id a1)
{
  return &off_7C868;
}

id sub_12C68(id a1)
{
  return &off_7C808;
}

id sub_12C74(id a1)
{
  return &off_7C808;
}

id sub_12C80(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12C8C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12C98(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12CA4(id a1)
{
  return &off_7C808;
}

id sub_12CB0(id a1)
{
  return &off_7D0D0;
}

id sub_12CBC(id a1)
{
  return &off_7C808;
}

id sub_12CC8(id a1)
{
  return &off_7CFD0;
}

id sub_12CD4(id a1)
{
  return &off_7C5F8;
}

id sub_12CE0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12CEC(id a1)
{
  return &off_7C808;
}

id sub_12CF8(id a1)
{
  return &off_7C808;
}

id sub_12D04(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12D10(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12D1C(id a1)
{
  return &off_7C880;
}

id sub_12D28(id a1)
{
  return &off_7C598;
}

id sub_12D34(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12D40(id a1)
{
  return &off_7C6A0;
}

id sub_12D4C(id a1)
{
  return &off_7C5E0;
}

id sub_12D58(id a1)
{
  return &off_7C9D0;
}

id sub_12D64(id a1)
{
  return &off_7C910;
}

id sub_12D70(id a1)
{
  return 0;
}

id sub_12D78(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12D84(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12D90(id a1)
{
  return &off_7CBB0;
}

id sub_12D9C(id a1)
{
  return &off_7C718;
}

id sub_12DA8(id a1)
{
  return &off_7C760;
}

id sub_12DB4(id a1)
{
  return &off_7C6A0;
}

id sub_12DC0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12DCC(id a1)
{
  return &off_7C598;
}

id sub_12DD8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12DE4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12DF0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12DFC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12E08(id a1)
{
  return &off_7CBC8;
}

id sub_12E14(id a1)
{
  return &off_7C838;
}

id sub_12E20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12E2C(id a1)
{
  uint64_t v1 = +[GEOCountryConfiguration sharedConfiguration];
  BOOL v2 = [v1 countryCode];
  id v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 isEqualToString:@"CN"] ^ 1);

  return v3;
}

id sub_12EB4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12EC0(id a1)
{
  return 0;
}

id sub_12EC8(id a1)
{
  return 0;
}

id sub_12ED0(id a1)
{
  return &off_7C808;
}

id sub_12EDC(id a1)
{
  return &off_7C8B0;
}

id sub_12EE8(id a1)
{
  return &off_7C628;
}

id sub_12EF4(id a1)
{
  return &off_7C7A8;
}

id sub_12F00(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12F0C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12F18(id a1)
{
  return 0;
}

id sub_12F20(id a1)
{
  return &off_7CBE0;
}

id sub_12F2C(id a1)
{
  return &off_7C598;
}

id sub_12F38(id a1)
{
  return &off_7CBF8;
}

id sub_12F44(id a1)
{
  return &off_7CC10;
}

id sub_12F50(id a1)
{
  return &off_7CC28;
}

id sub_12F5C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12F68(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12F74(id a1)
{
  return &off_7CC40;
}

id sub_12F80(id a1)
{
  return &off_7C6A0;
}

id sub_12F8C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12F98(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12FA4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12FB0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12FBC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_12FC8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_12FD4(id a1)
{
  return &__kCFBooleanFalse;
}

void sub_13134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_13158(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13214;
  v5[3] = &unk_72438;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_13214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _consumeUpdatedGarage:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

int64_t sub_133D8(id a1, VGOEMApplication *a2, VGOEMApplication *a3)
{
  id v4 = a3;
  id v5 = [(VGOEMApplication *)a2 applicationRecord];
  id v6 = [v5 localizedName];
  id v7 = [(VGOEMApplication *)v4 applicationRecord];

  uint64_t v8 = [v7 localizedName];
  id v9 = [v6 localizedCompare:v8];

  return (int64_t)v9;
}

id sub_13D1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setApplications:*(void *)(a1 + 40)];
}

BOOL sub_13D98(id a1, VGVehicle *a2, unint64_t a3, BOOL *a4)
{
  return [(VGVehicle *)a2 isPureElectricVehicle];
}

id sub_13E38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _consumeUpdatedGarage:*(void *)(a1 + 40)];
}

uint64_t _maps_isNotchDevice()
{
  if (qword_8E278 != -1) {
    dispatch_once(&qword_8E278, &stru_72538);
  }
  return byte_8E270;
}

void sub_13F84(id a1)
{
  byte_8E270 = MGGetSInt32Answer() == 2;
}

void sub_14400(id a1)
{
  uint64_t v1 = +[NSUserDefaults standardUserDefaults];
  id v2 = [v1 integerForKey:@"__internal__keyColorOverride"];

  switch((unint64_t)v2)
  {
    case 1uLL:
      uint64_t v3 = +[UIColor systemRedColor];
      break;
    case 2uLL:
      uint64_t v3 = +[UIColor systemGreenColor];
      break;
    case 4uLL:
      uint64_t v3 = +[UIColor systemOrangeColor];
      break;
    case 5uLL:
      uint64_t v3 = +[UIColor systemYellowColor];
      break;
    case 6uLL:
      uint64_t v3 = +[UIColor systemTealColor];
      break;
    case 7uLL:
      uint64_t v3 = +[UIColor systemPinkColor];
      break;
    case 8uLL:
      uint64_t v3 = +[UIColor systemGrayColor];
      break;
    default:
      uint64_t v3 = +[UIColor systemBlueColor];
      break;
  }
  qword_8E280 = v3;

  _objc_release_x1();
}

void sub_145A0(id a1)
{
  uint64_t v1 = +[NSUserDefaults standardUserDefaults];
  id v2 = [v1 integerForKey:@"__internal__keyColorOverride"];

  switch((unint64_t)v2)
  {
    case 1uLL:
      uint64_t v3 = +[UIColor systemDarkRedColor];
      break;
    case 2uLL:
      uint64_t v3 = +[UIColor systemDarkGreenColor];
      break;
    case 4uLL:
      uint64_t v3 = +[UIColor systemDarkOrangeColor];
      break;
    case 5uLL:
      uint64_t v3 = +[UIColor systemDarkYellowColor];
      break;
    case 6uLL:
      uint64_t v3 = +[UIColor systemDarkTealColor];
      break;
    case 7uLL:
      uint64_t v3 = +[UIColor systemDarkPinkColor];
      break;
    case 8uLL:
      uint64_t v3 = +[UIColor darkGrayColor];
      break;
    default:
      uint64_t v3 = +[UIColor systemDarkBlueColor];
      break;
  }
  qword_8E290 = v3;

  _objc_release_x1();
}

uint64_t sub_16460(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && +[UIView areAnimationsEnabled])
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 postNotificationName:@"BacklightLuminanceDidChangeNotification" object:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_18CF0(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "removals", 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) object];
        [*(id *)(a1 + 40) sendSubviewToBack:v7];
        [v7 setAlpha:0.0];
        [v7 setHidden:1];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_18E1C(uint64_t a1)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [*(id *)(a1 + 32) removals];
  id v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v19 + 1) + 8 * i) object];
        objc_msgSend(*(id *)(a1 + 40), "_maps_removeArrangedSubview:", v7);
        [v7 setHidden:0];
        [v7 setAlpha:1.0];
      }
      id v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = objc_msgSend(*(id *)(a1 + 32), "insertions", 0);
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)j);
        long long v14 = [v13 object];
        [v14 setHidden:1];
        [v14 setAlpha:0.0];
        objc_msgSend(*(id *)(a1 + 40), "insertArrangedSubview:atIndex:", v14, objc_msgSend(v13, "index"));
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v10);
  }
}

void sub_19020(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "insertions", 0);
  id v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = [*(id *)(*((void *)&v7 + 1) + 8 * (void)v5) object];
        [v6 setHidden:0];
        [v6 setAlpha:1.0];

        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

id sub_19130(uint64_t a1)
{
  return [*(id *)(a1 + 32) runWithCurrentOptions];
}

NSString *MapsUIContentSizeCategoryClamp(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  id v6 = a2;
  long long v7 = a3;
  long long v8 = v5;
  if (v5)
  {
    NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v5, UIContentSizeCategoryUnspecified);
    long long v8 = v5;
    if (v9)
    {
      if (!v6
        || UIContentSizeCategoryCompareToCategory(v6, UIContentSizeCategoryUnspecified) == NSOrderedSame
        || (v10 = UIContentSizeCategoryCompareToCategory(v6, v5), long long v8 = v6, v10 != NSOrderedDescending))
      {
        if (!v7
          || UIContentSizeCategoryCompareToCategory(v7, UIContentSizeCategoryUnspecified) == NSOrderedSame
          || (v11 = UIContentSizeCategoryCompareToCategory(v7, v5), long long v8 = v7, v11 != NSOrderedAscending))
        {
          long long v8 = v5;
        }
      }
    }
  }
  id v12 = v8;

  return v12;
}

BOOL MapsUIContentSizeCategoryIsEqual(void *a1, void *a2)
{
  return sub_196BC(a1, a2) == 0;
}

uint64_t sub_196BC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = v4;
  if (v3 == v4)
  {
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  if (!v3)
  {
    BOOL v6 = 1;
    if (v4) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v11 = !v6;
    goto LABEL_18;
  }
  BOOL v6 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryUnspecified) == NSOrderedSame;
  if (!v5) {
    goto LABEL_17;
  }
LABEL_4:
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v5, UIContentSizeCategoryUnspecified);
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  if (v7) {
    char v9 = v6;
  }
  else {
    char v9 = 1;
  }
  uint64_t v10 = v8 - 1;
  if (v6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 1;
  }
  if ((v9 & 1) == 0) {
    uint64_t v11 = UIContentSizeCategoryCompareToCategory(v3, v5);
  }
LABEL_18:

  return v11;
}

BOOL MapsUIContentSizeCategoryIsLessThanOrEqual(void *a1, void *a2)
{
  return sub_196BC(a1, a2) != 1;
}

uint64_t MapsBacklightLuminanceDidChange(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (char *)[a1 _backlightLuminance];
  uint64_t v5 = (char *)[v3 _backlightLuminance];

  if (v4 == (char *)-1) {
    return 0;
  }
  BOOL v7 = v4 == (unsigned char *)&dword_0 + 2 && v5 == (unsigned char *)&dword_0 + 1;
  BOOL v8 = v5 == (unsigned char *)&dword_0 + 2 && v4 == (unsigned char *)&dword_0 + 1;
  uint64_t result = 1;
  if (!v8)
  {
    if (v4) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v5 == (unsigned char *)&dword_0 + 1;
    }
    unsigned int v11 = v10;
    if (v4 == (unsigned char *)&dword_0 + 1 && v5 == 0) {
      unsigned int v11 = 1;
    }
    if (v7) {
      return 1;
    }
    else {
      return v11;
    }
  }
  return result;
}

uint64_t MapsIdiomInTraitEnvironment(void *a1)
{
  if (!a1) {
    return -1;
  }
  uint64_t v1 = [a1 traitCollection];
  id v2 = [v1 userInterfaceIdiom];

  return (uint64_t)v2;
}

id MapsHorizontalSizeClassInTraitEnvironment(id result)
{
  if (result)
  {
    uint64_t v1 = [result traitCollection];
    id v2 = [v1 horizontalSizeClass];

    return v2;
  }
  return result;
}

id MapsVerticalSizeClassInTraitEnvironment(id result)
{
  if (result)
  {
    uint64_t v1 = [result traitCollection];
    id v2 = [v1 verticalSizeClass];

    return v2;
  }
  return result;
}

BOOL MapsIdiomIsPhone(void *a1)
{
  return MapsIdiomInTraitEnvironment(a1) == 0;
}

BOOL MapsIdiomIsPad(void *a1)
{
  return MapsIdiomInTraitEnvironment(a1) == 1;
}

BOOL MapsIdiomIsTV(void *a1)
{
  return MapsIdiomInTraitEnvironment(a1) == 2;
}

BOOL MapsIdiomIsCarPlay(void *a1)
{
  return MapsIdiomInTraitEnvironment(a1) == 3;
}

BOOL MapsIdiomIsMac(void *a1)
{
  return MapsIdiomInTraitEnvironment(a1) == 5;
}

BOOL MapsSizeClassIsRegularWidth(void *a1)
{
  return MapsHorizontalSizeClassInTraitEnvironment(a1) == (char *)&dword_0 + 2;
}

BOOL MapsSizeClassIsCompactWidth(void *a1)
{
  return MapsHorizontalSizeClassInTraitEnvironment(a1) == (char *)&dword_0 + 1;
}

BOOL MapsSizeClassIsRegularHeight(void *a1)
{
  return MapsVerticalSizeClassInTraitEnvironment(a1) == (char *)&dword_0 + 2;
}

BOOL MapsSizeClassIsCompactHeight(void *a1)
{
  return MapsVerticalSizeClassInTraitEnvironment(a1) == (char *)&dword_0 + 1;
}

id DictionaryOfLayoutMetricsFromDeclarationAndValues(void *a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v11 = a1;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  long long v30 = (double *)&a10;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = v11;
  long long v13 = [v11 componentsSeparatedByString:@","];
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    char v17 = 1;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v20 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        long long v21 = [v19 stringByTrimmingCharactersInSet:v20];

        if ((v17 & 1) == 0)
        {
          long long v22 = v30++;
          a2 = *v22;
        }
        id v23 = +[NSNumber numberWithDouble:a2];
        [v12 setObject:v23 forKeyedSubscript:v21];

        char v17 = 0;
      }
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      char v17 = 0;
    }
    while (v15);
  }

  return v12;
}

id MapsDefaultSimpleAlertPresenter()
{
  v0 = +[UIApplication sharedApplication];
  uint64_t v1 = [v0 delegate];
  id v2 = [v1 window];
  id v3 = [v2 rootViewController];

  return v3;
}

NSNumber *__cdecl sub_19ED0(id a1, NSNumber *a2, unint64_t a3)
{
  id v3 = a2;
  [(NSNumber *)v3 cgFloatValue];
  if (vabdd_f64(v4, UISheetPresentationControllerDetentInactive) <= 2.22044605e-16) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v3;
  }

  return v5;
}

void sub_1A020(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id sub_1A03C(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  double v4 = +[_UIBackgroundViewConfiguration defaultPlainListCellConfigurationForState:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((v2 & 4) != 0)
    {
      [v4 setBackgroundColorMode:1];
      [v4 setCornerRadius:5.0];
      objc_msgSend(v4, "setBackgroundInsets:", 0.0, 10.0, 0.0, 10.0);
    }
    else
    {
      [v4 setBackgroundColorMode:0];
      BOOL v6 = +[UIColor clearColor];
      [v4 setBackgroundColor:v6];
    }
  }

  return v4;
}

void sub_1A1B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id sub_1A1CC(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  double v4 = +[_UIBackgroundViewConfiguration defaultPlainListCellConfigurationForState:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((v2 & 4) != 0)
    {
      [v4 setBackgroundColorMode:1];
      [v4 setCornerRadius:5.0];
      objc_msgSend(v4, "setBackgroundInsets:", 0.0, 10.0, 0.0, 10.0);
    }
    else
    {
      [v4 setBackgroundColorMode:0];
      BOOL v6 = +[UIColor clearColor];
      [v4 setBackgroundColor:v6];
    }
  }

  return v4;
}

id sub_1A33C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemembersLastFocusedIndexPath:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1B0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0F8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      BOOL v7 = WeakRetained;
      BOOL v8 = +[MapsSettingsIntentsApplication applicationsFromExtensions:v5];
      char v9 = [v8 sortedArrayUsingComparator:&stru_726D8];

      BOOL v10 = [v7 applications];
      unsigned __int8 v11 = [v7 _countAndIdentifiersOfApplications:v9 matchCountAndIdentifiersOfApplications:v10];

      [v7 setApplications:v9];
      if ((v11 & 1) == 0)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1B28C;
        block[3] = &unk_60EC8;
        void block[4] = v7;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

int64_t sub_1B21C(id a1, MapsSettingsIntentsApplication *a2, MapsSettingsIntentsApplication *a3)
{
  double v4 = a3;
  id v5 = [(MapsSettingsIntentsApplication *)a2 displayName];
  BOOL v6 = [(MapsSettingsIntentsApplication *)v4 displayName];

  id v7 = [v5 caseInsensitiveCompare:v6];
  return (int64_t)v7;
}

id sub_1B28C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded]) {
    [*(id *)(a1 + 32) reloadSpecifiers];
  }
  char v2 = *(void **)(a1 + 32);

  return [v2 _callUpdateHandler];
}

id sub_1B594(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  double v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

id sub_1B708(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  double v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

BOOL _currentDeviceSupportsVIO()
{
  if (qword_8E3C8 != -1) {
    dispatch_once(&qword_8E3C8, &stru_72748);
  }
  return (byte_8E3C0 & 1) == 0;
}

void sub_1B890(id a1)
{
  if (MGGetBoolAnswer())
  {
    if (MGGetSInt32Answer() == 1)
    {
      if (MGGetBoolAnswer())
      {
        uint64_t v1 = sub_1B9F0();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v4 = 0;
          char v2 = "VIO is supported on the current device";
          id v3 = (uint8_t *)&v4;
LABEL_12:
          _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
        }
      }
      else
      {
        byte_8E3C0 = 1;
        uint64_t v1 = sub_1B9F0();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          char v2 = "VIO is not supported because the current device does not support the DeviceSupportsMapsOpticalHeading gestalt key";
          id v3 = buf;
          goto LABEL_12;
        }
      }
    }
    else
    {
      byte_8E3C0 = 1;
      uint64_t v1 = sub_1B9F0();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v6 = 0;
        char v2 = "VIO is not supported because the current device is not an iPhone";
        id v3 = (uint8_t *)&v6;
        goto LABEL_12;
      }
    }
  }
  else
  {
    byte_8E3C0 = 1;
    uint64_t v1 = sub_1B9F0();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      char v2 = "VIO is not supported because the current device does not support ARKit";
      id v3 = (uint8_t *)&v7;
      goto LABEL_12;
    }
  }
}

id sub_1B9F0()
{
  if (qword_8E2A8 != -1) {
    dispatch_once(&qword_8E2A8, &stru_72768);
  }
  v0 = (void *)qword_8E2A0;

  return v0;
}

void sub_1BA44(id a1)
{
  qword_8E2A0 = (uint64_t)os_log_create("com.apple.Maps", "VIOAvailability");

  _objc_release_x1();
}

id _isInternalInstall()
{
  v0 = +[GEOPlatform sharedPlatform];
  id v1 = [v0 isInternalInstall];

  return v1;
}

void sub_1CB4C(id a1)
{
  id v1 = (void *)qword_8E2B0;
  qword_8E2B0 = (uint64_t)&off_7C418;
}

void sub_1CF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF90(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    id v13 = v7;
    char v9 = *(void **)(a1 + 32);
    id v10 = a2;
    unsigned __int8 v11 = [v9 objectAtIndexedSubscript:a4];
    LODWORD(v9) = [v10 isEqual:v11];

    if (v9)
    {
      id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a4];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v13 isEqual:v12];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }

    id v7 = v13;
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 0;
  }
}

void sub_1D1F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[NSString stringWithFormat:@"%@: %@", a2, a3];
  [v3 addObject:v4];
}

void sub_1D3AC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = +[NSNull null];

  id v7 = [*(id *)(a1 + 32) defaults];
  uint64_t v8 = v7;
  if (v6 == v9) {
    [v7 removeObjectForKey:v5];
  }
  else {
    [v7 setObject:v9 forKey:v5];
  }
}

id MapsTransitModesLocalizedLongNameForIndividualMode(uint64_t a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 1:
      char v2 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      id v3 = v2;
      CFStringRef v4 = @"Bus [Long transit mode]";
      goto LABEL_6;
    case 2:
      char v2 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      id v3 = v2;
      CFStringRef v4 = @"Subway & Light Rail [Long transit mode]";
      goto LABEL_6;
    case 4:
      char v2 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      id v3 = v2;
      CFStringRef v4 = @"Commuter Rail [Long transit mode]";
      goto LABEL_6;
    case 8:
      char v2 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
      id v3 = v2;
      CFStringRef v4 = @"Ferry [Long transit mode]";
LABEL_6:
      id v1 = [v2 localizedStringForKey:v4 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v1;
}

uint64_t sub_1E988(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id MapsPerformSelector(void *a1, const char *a2)
{
  return [a1 performSelector:a2];
}

id MapsPerformSelectorWithObject(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 performSelector:a2 withObject:a3];
}

id MapsPerformSelectorWithObjectWithObject(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 performSelector:a2 withObject:a3 withObject:a4];
}

id MapsPerformNonownedReturnSelector(void *a1, const char *a2)
{
  return [a1 performSelector:a2];
}

uint64_t RideBookingGetMinimumRideOptionsExpirationInterval()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetMaximumCompletedRideDisplayTimeInterval()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetMaximumFinishedRideInformationRetainingTimeInterval()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetDistanceTolerance()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetPickupLocationZoomRadius()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetMaxVehicleAnnotationSizeHeight()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetMaxVehicleAnnotationSizeWidth()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetTemplatedBannerViewDelayInterval()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetMaximumListRideOptionsAttemptsOnXPCFailure()
{
  return _GEOConfigGetUint64(MapsConfig_RideBookingMaximumListRideOptionsAttemptsOnXPCFailure, off_8AA00);
}

uint64_t RideBookingGetIntervalBetweenListRideOptionsAttempts()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetDistanceToPickupThreshold()
{
  return GEOConfigGetDouble();
}

uint64_t RideBookingGetHideUserLocationThreshold()
{
  return GEOConfigGetDouble();
}

void RideBookingDidReportError()
{
  v0 = +[GEOPlatform sharedPlatform];
  unsigned int v1 = [v0 isInternalInstall];

  if (v1) {
    NSLog(@"[Maps Extensions - internal only: break on RideBookingDidReportError() to debug this.");
  }
}

BOOL RideBookingIsEnabled()
{
  if (qword_8E2C8 != -1) {
    dispatch_once(&qword_8E2C8, &stru_728A0);
  }
  if (!byte_8DA48) {
    return 0;
  }
  v0 = +[UIDevice currentDevice];
  unsigned int v1 = (char *)[v0 userInterfaceIdiom];

  if (v1 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t BOOL = GEOConfigGetBOOL();
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      CFStringRef v4 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/Utils/RideBookingUtils.m");
      id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"isRidebookingOverridenOniPad: %d", BOOL);
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v11 = v4;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = +[UIDevice currentDevice];
    id v7 = (char *)[v6 userInterfaceIdiom];

    return v7 != (unsigned char *)&dword_4 + 1 && byte_8DA48 != 0;
  }
  return BOOL;
}

void sub_1F114(id a1)
{
  byte_8DA48 = GEOConfigGetBOOL();
}

id GEOTransitOptionsFromTransitPreferences(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init((Class)GEOTransitOptions);
    objc_msgSend(v2, "setPrioritization:", objc_msgSend(v1, "sortOption"));
    id v3 = objc_alloc_init((Class)GEOFareOptions);
    objc_msgSend(v3, "setPaymentType:", objc_msgSend(v1, "showICFares"));
    CFStringRef v4 = [v1 surchargeOption];

    if (v4)
    {
      id v5 = [v1 surchargeOption];
      objc_msgSend(v3, "setPreferredSurchargeType:", objc_msgSend(v5, "integerValue"));
    }
    [v2 setFareOptions:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = GEOAvoidedTransitModesFromMapsTransitModes((uint64_t)objc_msgSend(v1, "disabledModes", 0));
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v2, "addAvoidedMode:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue"));
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    if (GEOConfigGetBOOL()) {
      [v2 setRoutingBehavior:1];
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_20AD4(id a1)
{
  id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:0 error:0];
  uint64_t v1 = [v3 dataContainerURL];
  id v2 = (void *)qword_8E2D0;
  qword_8E2D0 = v1;
}

void MapsRAPNotificationPreferenceSetForDefaultsKey(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:a2 forKey:v3];
}

id MapsRAPNotificationPreferenceForDefaultsKey(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:v1];

  if ((unint64_t)v3 <= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

unint64_t MapsRAPNotificationPreferenceForDefaultsValue(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

id MacMapsRAPContactBackEmailAddress()
{
  id v0 = objc_alloc_init((Class)ACAccountStore);
  id v1 = objc_msgSend(v0, "aa_primaryAppleAccount");
  id v2 = objc_msgSend(v1, "aa_primaryEmail");
  if (![v2 length])
  {
    id v4 = 0;
    goto LABEL_5;
  }
  unsigned int v3 = objc_msgSend(v1, "aa_isPrimaryEmailVerified");

  if (v3)
  {
    id v2 = objc_msgSend(v1, "aa_primaryEmail");
    id v4 = [v2 copy];
LABEL_5:

    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

void sub_210DC(uint64_t a1, void *a2, unsigned char *a3)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(a2, "values", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if (*a3) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void sub_21438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21450(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21460(uint64_t a1)
{
}

id sub_21468(uint64_t a1, void *a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_214E0;
  v4[3] = &unk_72920;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = a3;
  return [a2 enumerateValidComponentValuesOfType:7 usingBlock:v4];
}

void sub_214E0(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5 = [a2 photoAttributionPreferences];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(BOOL **)(a1 + 40);
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  *uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void sub_21648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_21660(uint64_t a1, void *a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_216D8;
  v4[3] = &unk_72920;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = a3;
  return [a2 enumerateValidComponentValuesOfType:6 usingBlock:v4];
}

void sub_216D8(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5 = [a2 thirdPartyPhotoSharingPreferences];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(BOOL **)(a1 + 40);
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  *uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

BOOL _isPedestrianARModeSupported()
{
  if (qword_8E2E8 != -1) {
    dispatch_once(&qword_8E2E8, &stru_72968);
  }
  return (byte_8E2E0 & 1) == 0;
}

void sub_21798(id a1)
{
  if (_currentDeviceSupportsVLF())
  {
    if (+[ARGeoTrackingConfiguration isSupported])
    {
      id v1 = sub_21898();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v4 = 0;
        id v2 = "Pedestrian AR is supported on the current device";
        unsigned int v3 = (uint8_t *)&v4;
LABEL_9:
        _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
      }
    }
    else
    {
      byte_8E2E0 = 1;
      id v1 = sub_21898();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v2 = "Pedestrian AR is not supported because the current device does not support geo tracking";
        unsigned int v3 = buf;
        goto LABEL_9;
      }
    }
  }
  else
  {
    byte_8E2E0 = 1;
    id v1 = sub_21898();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = 0;
      id v2 = "Pedestrian AR is not supported because the current device does not support VLF";
      unsigned int v3 = (uint8_t *)&v6;
      goto LABEL_9;
    }
  }
}

id sub_21898()
{
  if (qword_8E2F8 != -1) {
    dispatch_once(&qword_8E2F8, &stru_72988);
  }
  id v0 = (void *)qword_8E2F0;

  return v0;
}

void sub_218EC(id a1)
{
  qword_8E2F0 = (uint64_t)os_log_create("com.apple.Maps", "PedestrianARAvailability");

  _objc_release_x1();
}

void sub_21B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21BA4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isViewLoaded]) {
    [WeakRetained reloadSpecifiers];
  }
}

id sub_24CC4(uint64_t a1)
{
  GEOConfigSetBOOL();
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

id sub_24D0C(uint64_t a1)
{
  GEOConfigSetBOOL();
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_25D54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_25D78(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v6 = WeakRetained;
  if (!a3)
  {
    [WeakRetained setThirdPartyPhotoSharingPreference:v7];
    [v6 setThirdPartyPhotoSharingStatusLoading:0];
    [v6 reloadSpecifiers];
  }
}

void sub_25FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25FDC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id *)(a1 + 40);
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setThirdPartyPhotoSharingPreference:v8];

  [*(id *)(a1 + 32) setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
  if (a3 | a4)
  {
    uint64_t v9 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    long long v10 = [v9 localizedStringForKey:@"Submission Generic Failure Title [UGC]" value:@"localized string not found" table:0];
    long long v11 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    long long v12 = [v11 localizedStringForKey:@"Submission Generic Failure Description [UGC]" value:@"localized string not found" table:0];
    long long v13 = +[UIAlertController alertControllerWithTitle:v10 message:v12 preferredStyle:1];

    long long v14 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    long long v15 = [v14 localizedStringForKey:@"OK [UGC]" value:@"localized string not found" table:0];
    uint64_t v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
    [v13 addAction:v16];

    [WeakRetained presentViewController:v13 animated:1 completion:0];
  }
}

id MapsRAPContactBackEmailAddress()
{
  id v0 = objc_alloc_init((Class)ACAccountStore);
  id v1 = objc_msgSend(v0, "aa_primaryAppleAccount");
  uint64_t v2 = objc_msgSend(v1, "aa_primaryEmail");
  if (![v2 length])
  {
    id v4 = 0;
    goto LABEL_5;
  }
  unsigned int v3 = objc_msgSend(v1, "aa_isPrimaryEmailVerified");

  if (v3)
  {
    uint64_t v2 = objc_msgSend(v1, "aa_primaryEmail");
    id v4 = [v2 copy];
LABEL_5:

    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

id MapsRAPLocalizedPrivacyConsentAlertMessage()
{
  id v0 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v1 = [v0 localizedStringForKey:@"Reports may include location and contact information." value:@"localized string not found" table:0];

  return v1;
}

uint64_t MapsRAPIsAvailable()
{
  uint64_t result = _MKRAPIsAvailable();
  if (result) {
    return sub_29480() ^ 1;
  }
  return result;
}

uint64_t sub_29480()
{
  uint64_t v0 = MapsConfig_ReportAProblemIsDisabled;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    unsigned int v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPConfigDefaults(uint64_t a1)
{
  uint64_t v2 = 0;
  v5[0] = *(_OWORD *)&MapsConfig_ReportAProblemIsDisabled;
  v5[1] = *(_OWORD *)&MapsConfig_ReportAProblemInvalidEmailIsVisible;
  v5[2] = *(_OWORD *)&MapsConfig_ReportAProblemSettingsSearchIsVisible;
  v5[3] = *(_OWORD *)&MapsConfig_ReportAProblemDirectionsETAIsVisible;
  void v5[4] = *(_OWORD *)&MapsConfig_ReportAProblemRoutePlanningFlowIsVisible;
  v5[5] = *(_OWORD *)&MapsConfig_ReportAProblemApplePayIsVisible;
  v5[6] = *(_OWORD *)&MapsConfig_ReportAProblemRequirePhotosWhenNearby;
  v5[7] = *(_OWORD *)&MapsConfig_ReportAProblemAddStreetFlowIsVisible;
  v5[8] = *(_OWORD *)&MapsConfig_ReportAProblemAddAPlaceStartsWithPrivacy;
  v5[9] = *(_OWORD *)&MapsConfig_ReportAProblemStartsWithPrivacy;
  v5[10] = *(_OWORD *)&MapsConfig_ReportAProblemShouldIncludeHistoricLocationsInDirectionsRequest;
  v5[11] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeCredentials;
  v5[12] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeLocations;
  v5[13] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizePhotos;
  v5[14] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeScreenshots;
  v5[15] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeDirections;
  v5[16] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests;
  v5[17] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses;
  v5[18] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizeTransit;
  v5[19] = *(_OWORD *)&MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations;
  v5[20] = *(_OWORD *)&MapsConfig_ReportAProblemAddressEditIsProhibited;
  v5[21] = *(_OWORD *)&MapsConfig_RAPShouldFailSilentlyOnInvalidRequests;
  v5[22] = *(_OWORD *)&MapsConfig_RAPEnableAfterNavFeedbackFlow;
  v5[23] = MapsConfig_ShowRAPFeedbackPortalInternalUI;
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 16))(a1, *(void *)&v5[v2], *((void *)&v5[v2] + 1));
    if (!result) {
      break;
    }
  }
  while (v2++ != 23);
  return result;
}

BOOL RAPIsValidEmail(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = GEOConfigGetString();
    BOOL v3 = ![v2 length] || (objc_msgSend(v1, "hasSuffix:", v2) & 1) == 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t RAPPrivacyInvalidEmailIsVisible()
{
  uint64_t v0 = MapsConfig_ReportAProblemInvalidEmailIsVisible;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPSettingsSearchFlowIsVisible()
{
  if (!_MKRAPIsAvailable() || (sub_29480() & 1) != 0) {
    return 0;
  }
  uint64_t v2 = MapsConfig_ReportAProblemSettingsSearchIsVisible;
  if (!_GEOConfigHasValue())
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v3;
    v21[3] = &off_7D1D8;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v4;
    v21[4] = &off_7D200;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v5;
    v21[5] = &off_7D228;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v6;
    v21[6] = &off_7D250;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v7;
    v21[7] = &off_7D278;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v8;
    v21[8] = &off_7D2A0;
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v9;
    v21[9] = &off_7D2C8;
    long long v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v11 = +[NSNumber numberWithUnsignedInt:v2];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    long long v13 = +[GEOCountryConfiguration sharedConfiguration];
    long long v14 = [v13 countryCode];
    long long v15 = [v12 objectForKey:v14];

    if (v15) {
      id BOOL = [v15 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v0 = BOOL;

    return (uint64_t)v0;
  }

  return GEOConfigGetBOOL();
}

uint64_t RAPDirectionsETAFlowIsVisible()
{
  if (!_MKRAPIsAvailable() || (sub_29480() & 1) != 0) {
    return 0;
  }
  uint64_t v2 = MapsConfig_ReportAProblemDirectionsETAIsVisible;
  if (!_GEOConfigHasValue())
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v3;
    v21[3] = &off_7D1D8;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v4;
    v21[4] = &off_7D200;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v5;
    v21[5] = &off_7D228;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v6;
    v21[6] = &off_7D250;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v7;
    v21[7] = &off_7D278;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v8;
    v21[8] = &off_7D2A0;
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v9;
    v21[9] = &off_7D2C8;
    long long v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v11 = +[NSNumber numberWithUnsignedInt:v2];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    long long v13 = +[GEOCountryConfiguration sharedConfiguration];
    long long v14 = [v13 countryCode];
    long long v15 = [v12 objectForKey:v14];

    if (v15) {
      id BOOL = [v15 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v0 = BOOL;

    return (uint64_t)v0;
  }

  return GEOConfigGetBOOL();
}

uint64_t RAPRoutePlanningFlowIsVisible()
{
  if (!_MKRAPIsAvailable() || (sub_29480() & 1) != 0) {
    return 0;
  }
  uint64_t v2 = MapsConfig_ReportAProblemRoutePlanningFlowIsVisible;
  if (!_GEOConfigHasValue())
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v3;
    v21[3] = &off_7D1D8;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v4;
    v21[4] = &off_7D200;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v5;
    v21[5] = &off_7D228;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v6;
    v21[6] = &off_7D250;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v7;
    v21[7] = &off_7D278;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v8;
    v21[8] = &off_7D2A0;
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v9;
    v21[9] = &off_7D2C8;
    long long v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v11 = +[NSNumber numberWithUnsignedInt:v2];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    long long v13 = +[GEOCountryConfiguration sharedConfiguration];
    long long v14 = [v13 countryCode];
    long long v15 = [v12 objectForKey:v14];

    if (v15) {
      id BOOL = [v15 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v0 = BOOL;

    return (uint64_t)v0;
  }

  return GEOConfigGetBOOL();
}

uint64_t RAPApplePayIsVisible()
{
  uint64_t v0 = MapsConfig_ReportAProblemApplePayIsVisible;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPRequirePhotosWhenNearby()
{
  uint64_t v0 = MapsConfig_ReportAProblemRequirePhotosWhenNearby;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPSettingsAaPAddStreetFlowIsVisible()
{
  if (!_MKRAPIsAvailable() || (sub_29480() & 1) != 0) {
    return 0;
  }
  uint64_t v2 = MapsConfig_ReportAProblemAddStreetFlowIsVisible;
  if (!_GEOConfigHasValue())
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v3;
    v21[3] = &off_7D1D8;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v4;
    v21[4] = &off_7D200;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v5;
    v21[5] = &off_7D228;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v6;
    v21[6] = &off_7D250;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v7;
    v21[7] = &off_7D278;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v8;
    v21[8] = &off_7D2A0;
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v9;
    v21[9] = &off_7D2C8;
    long long v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v11 = +[NSNumber numberWithUnsignedInt:v2];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    long long v13 = +[GEOCountryConfiguration sharedConfiguration];
    long long v14 = [v13 countryCode];
    long long v15 = [v12 objectForKey:v14];

    if (v15) {
      id BOOL = [v15 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v0 = BOOL;

    return (uint64_t)v0;
  }

  return GEOConfigGetBOOL();
}

uint64_t RAPAddAPlaceStartsWithPrivacy()
{
  uint64_t v0 = MapsConfig_ReportAProblemAddAPlaceStartsWithPrivacy;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPStartsWithPrivacy()
{
  uint64_t v0 = MapsConfig_ReportAProblemStartsWithPrivacy;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPAddressEditIsProhibited()
{
  if (sub_29480()) {
    return 1;
  }
  uint64_t v1 = MapsConfig_ReportAProblemAddressEditIsProhibited;
  if (!_GEOConfigHasValue())
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v3;
    v21[3] = &off_7D1D8;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v4;
    v21[4] = &off_7D200;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v5;
    v21[5] = &off_7D228;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v6;
    v21[6] = &off_7D250;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v7;
    v21[7] = &off_7D278;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v8;
    v21[8] = &off_7D2A0;
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v9;
    v21[9] = &off_7D2C8;
    long long v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v11 = +[NSNumber numberWithUnsignedInt:v1];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    long long v13 = +[GEOCountryConfiguration sharedConfiguration];
    long long v14 = [v13 countryCode];
    long long v15 = [v12 objectForKey:v14];

    if (v15) {
      id BOOL = [v15 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v0 = BOOL;

    return (uint64_t)v0;
  }

  return GEOConfigGetBOOL();
}

uint64_t RAPShouldIncludeHistoricLocationsInDirectionsRequest()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldIncludeHistoricLocationsInDirectionsRequest;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeCredentials()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeCredentials;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeLocations()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeLocations;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizePhotos()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizePhotos;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeScreenshots()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeScreenshots;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeDirections()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeDirections;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeDirectionRequests()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeDirectionResponses()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizeTransit()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizeTransit;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldAnonymizePersonalizedLocations()
{
  uint64_t v0 = MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldFailSilentlyOnInvalidRequests()
{
  uint64_t v0 = MapsConfig_RAPShouldFailSilentlyOnInvalidRequests;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

uint64_t RAPShouldDisplayAfterNavigationFlow()
{
  uint64_t v0 = MapsConfig_RAPEnableAfterNavFeedbackFlow;
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    long long v19 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeCredentials];
    v20[0] = v19;
    v21[0] = &off_7D160;
    long long v18 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeLocations];
    v20[1] = v18;
    v21[1] = &off_7D188;
    char v17 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePhotos];
    v20[2] = v17;
    v21[2] = &off_7D1B0;
    uint64_t v2 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeScreenshots];
    v20[3] = v2;
    v21[3] = &off_7D1D8;
    BOOL v3 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirections];
    v20[4] = v3;
    v21[4] = &off_7D200;
    id v4 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionRequests];
    v20[5] = v4;
    v21[5] = &off_7D228;
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeDirectionResponses];
    v20[6] = v5;
    v21[6] = &off_7D250;
    __int16 v6 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizeTransit];
    v20[7] = v6;
    v21[7] = &off_7D278;
    id v7 = +[NSNumber numberWithUnsignedInt:MapsConfig_ReportAProblemShouldAnonymizePersonalizedLocations];
    v20[8] = v7;
    v21[8] = &off_7D2A0;
    id v8 = +[NSNumber numberWithUnsignedInt:MapsConfig_RAPShouldFailSilentlyOnInvalidRequests];
    v20[9] = v8;
    v21[9] = &off_7D2C8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:10];

    long long v10 = +[NSNumber numberWithUnsignedInt:v0];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    long long v12 = +[GEOCountryConfiguration sharedConfiguration];
    long long v13 = [v12 countryCode];
    long long v14 = [v11 objectForKey:v13];

    if (v14) {
      id BOOL = [v14 BOOLValue];
    }
    else {
      id BOOL = (id)GEOConfigGetBOOL();
    }
    id v16 = BOOL;

    return (uint64_t)v16;
  }
}

id sub_2E8F4()
{
  if (qword_8E308 != -1) {
    dispatch_once(&qword_8E308, &stru_72AE0);
  }
  uint64_t v0 = (void *)qword_8E300;

  return v0;
}

void sub_2F320(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _leaveCompletionWaitDispatchGroupWithReason:*(void *)(a1 + 32)];
}

id sub_2F624(uint64_t a1)
{
  uint64_t v2 = sub_2E8F4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 134349056;
    uint64_t v8 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "[%{public}p] child animation completion group notify block running", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  return [*(id *)(a1 + 32) _childAnimationsDidComplete];
}

void sub_2FD8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t sub_2FDAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2FDBC(uint64_t a1)
{
}

void sub_2FDC4(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      __int16 v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v6));
        __int16 v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

id sub_30BBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) animate];
}

id sub_30BC4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) complete:a2];
}

id sub_30DA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) animate];
}

id sub_30DAC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) complete:a2];
}

id sub_30FB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) animate];
}

id sub_30FC0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) complete:a2];
}

id sub_310DC(uint64_t a1)
{
  [*(id *)(a1 + 32) prepare];
  [*(id *)(a1 + 32) animate];
  id v2 = *(void **)(a1 + 32);

  return [v2 complete:1];
}

id sub_31AC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) animate];
}

id sub_31ACC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) complete:a2];
}

id sub_31AD8(uint64_t a1)
{
  [*(id *)(a1 + 32) prepare];
  [*(id *)(a1 + 32) animate];
  id v2 = *(void **)(a1 + 32);

  return [v2 complete:1];
}

void sub_31B3C(id a1)
{
  qword_8E300 = (uint64_t)os_log_create("com.apple.Maps", "GroupAnimation");

  _objc_release_x1();
}

void sub_32F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_32F44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_32F54(uint64_t a1)
{
}

void sub_32F5C(uint64_t a1, void *a2)
{
}

void sub_33BD8(id a1)
{
  qword_8E310 = objc_alloc_init(MapsOfflineUIHelper);

  _objc_release_x1();
}

void sub_33F8C(_Unwind_Exception *a1)
{
  __int16 v6 = v2;
  objc_destroyWeak(v6);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_33FE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reloadSubscriptions];
    id WeakRetained = v2;
  }
}

void sub_34028(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reloadLastUpdatedDates];
    id WeakRetained = v2;
  }
}

void sub_3406C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reloadLastUpdatedDates];
    id WeakRetained = v2;
  }
}

void sub_340B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reloadPairedDeviceSubscriptionInfos];
    [v2 setAvailableDiskSpaceForPairedDevice:0];
    id WeakRetained = v2;
  }
}

uint64_t sub_347F4(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (a2) {
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v4 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

void sub_34B18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = MAPSGetOfflineLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v6 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Error restoring expired subscription: %@, error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_35014(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_35038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      __int16 v6 = +[NSNumber numberWithLongLong:a2];
      [WeakRetained setAvailableDiskSpaceForPairedDevice:v6];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void sub_35604(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_3563C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      __int16 v9 = MAPSGetOfflineLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "[MapsOfflineUIHelper] refresh last update for paired date error: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
      [*(id *)(*(void *)(a1 + 32) + 8) lastUpdatedDateForPairedDeviceDidChange:*(void *)(*(void *)(a1 + 32) + 64)];
    }
  }
}

void sub_3574C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      __int16 v9 = MAPSGetOfflineLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "[MapsOfflineUIHelper] refresh last update date error: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
      [*(id *)(*(void *)(a1 + 32) + 8) lastUpdatedDateDidChange:*(void *)(*(void *)(a1 + 32) + 56)];
    }
  }
}

void sub_35A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_35A54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v28 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v8 = MAPSGetOfflineLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "[MapsOfflineUIHelper] subscription fetch error: %@", buf, 0xCu);
      }

      uint64_t v9 = *(void *)(v28 + 40);
      if (v9) {
        (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
      }
    }
    else
    {
      int v10 = MapsFilter(v5, &stru_72C20);
      [WeakRetained setSubscriptions:v10];

      id v11 = [WeakRetained subscriptions];
      id v12 = [v11 count];

      if (!v12) {
        GEOConfigSetBOOL();
      }
      id v26 = v5;
      long long v13 = +[NSMutableArray array];
      long long v14 = dispatch_group_create();
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v15 = WeakRetained;
      id obj = [WeakRetained subscriptions];
      id v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v40;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(obj);
            }
            long long v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            dispatch_group_enter(v14);
            long long v21 = [v15 subscriptionManager];
            long long v22 = [v20 identifier];
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_35E14;
            v34[3] = &unk_72C48;
            v35 = v14;
            id v38 = *(id *)(v28 + 40);
            id v36 = v20;
            id v37 = v13;
            [v21 fetchStateForSubscriptionWithIdentifier:v22 callbackQueue:&_dispatch_main_q completionHandler:v34];
          }
          id v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v17);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_360CC;
      block[3] = &unk_72C70;
      id v30 = v13;
      long long v31 = v15;
      id WeakRetained = v15;
      id v23 = *(id *)(v28 + 40);
      uint64_t v32 = *(void *)(v28 + 32);
      id v33 = v23;
      id v24 = v13;
      dispatch_group_notify(v14, (dispatch_queue_t)&_dispatch_main_q, block);

      id v6 = v25;
      id v5 = v26;
    }
  }
}

BOOL sub_35DF4(id a1, GEOMapDataSubscription *a2, unint64_t a3, BOOL *a4)
{
  return ((unint64_t)[(GEOMapDataSubscription *)a2 dataTypes] >> 10) & 1;
}

void sub_35E14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MAPSGetOfflineLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "[MapsOfflineUIHelper] subscription state error: %@", (uint8_t *)&v16, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    uint64_t v9 = [[MapDataSubscriptionInfo alloc] initWithSubscription:*(void *)(a1 + 40) state:v5];
    [*(id *)(a1 + 48) addObject:v9];
    switch((unint64_t)[v5 loadState])
    {
      case 0uLL:
        int v10 = MAPSGetOfflineLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        id v11 = *(void **)(a1 + 40);
        int v16 = 138412546;
        id v17 = v11;
        __int16 v18 = 2112;
        id v19 = v5;
        id v12 = "[MapsOfflineUIHelper] found not fully loaded subscription: %@, state: %@";
        break;
      case 1uLL:
        int v10 = MAPSGetOfflineLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        long long v13 = *(void **)(a1 + 40);
        int v16 = 138412546;
        id v17 = v13;
        __int16 v18 = 2112;
        id v19 = v5;
        id v12 = "[MapsOfflineUIHelper] found out of date subscription: %@, state: %@";
        break;
      case 2uLL:
        int v10 = MAPSGetOfflineLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        long long v14 = *(void **)(a1 + 40);
        int v16 = 138412546;
        id v17 = v14;
        __int16 v18 = 2112;
        id v19 = v5;
        id v12 = "[MapsOfflineUIHelper] found fully loaded subscription: %@, state: %@";
        break;
      case 3uLL:
        int v10 = MAPSGetOfflineLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        long long v15 = *(void **)(a1 + 40);
        int v16 = 138412546;
        id v17 = v15;
        __int16 v18 = 2112;
        id v19 = v5;
        id v12 = "[MapsOfflineUIHelper] found fully-loaded, incompatible subscription: %@, state: %@";
        break;
      default:
        goto LABEL_17;
    }
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, 0x16u);
LABEL_16:

LABEL_17:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_360CC(uint64_t a1)
{
  +[NSMutableSet set];
  v27 = uint64_t v26 = a1;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    goto LABEL_22;
  }
  id v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v32;
  uint64_t v29 = GEOMapDataSubscriptionDownloadReasonKey;
  uint64_t v28 = GEOMapDataSubscriptionProgressDownloadReasonForcedUpdate;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v32 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      uint64_t v9 = [v8 state];
      if ([v9 loadState] == (char *)&dword_0 + 1)
      {
      }
      else
      {
        int v10 = [v8 state];
        id v11 = (char *)[v10 loadState];

        if (v11 != (unsigned char *)&dword_0 + 2) {
          goto LABEL_10;
        }
      }
      ++v4;
LABEL_10:
      id v12 = [v8 state];
      if ([v12 loadState] == (char *)&dword_0 + 1)
      {
      }
      else
      {
        long long v13 = [v8 state];
        long long v14 = (char *)[v13 loadState];

        if (v14 != (unsigned char *)&dword_0 + 3) {
          continue;
        }
      }
      ++v5;
      long long v15 = [v8 state];
      int v16 = [v15 downloadProgress];

      if (v16)
      {
        id v17 = [v8 state];
        __int16 v18 = [v17 downloadProgress];
        id v19 = [v18 userInfo];
        long long v20 = [v19 objectForKeyedSubscript:v29];

        if (v20 && [v20 isEqualToString:v28])
        {
          long long v21 = [v8 subscription];
          long long v22 = [v21 identifier];
          [v27 addObject:v22];
        }
      }
    }
    id v3 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v3);
LABEL_22:

  [*(id *)(v26 + 40) setOutOfDateSubscriptionsCount:v5];
  [*(id *)(v26 + 40) setFullyLoadedSubscriptionsCount:v4];
  [*(id *)(v26 + 40) setUpdatingSubscriptions:v27];
  id v23 = [*(id *)(v26 + 32) copy];
  [*(id *)(v26 + 40) setSubscriptionInfos:v23];

  uint64_t v24 = *(void *)(v26 + 56);
  if (v24)
  {
    long long v25 = [*(id *)(v26 + 40) subscriptionInfos];
    (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v25, 0);
  }
  [*(id *)(v26 + 40) _subscriptionsDidChange];
  if ((uint64_t)[*(id *)(v26 + 48) pairedDeviceSubscriptionStatesMonitorCount] >= 1) {
    [*(id *)(v26 + 48) _reloadPairedDeviceSubscriptionInfos];
  }
}

void sub_364E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_36508(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained) {
      objc_msgSend(WeakRetained, "setExpiredSubscriptionsCount:", objc_msgSend(v6, "count"));
    }
  }
}

void sub_36678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3669C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained setTotalOfflineDataSize:a2];
    }
  }
}

void sub_36BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_36C20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v9 = MAPSGetOfflineLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "[MapsOfflineUIHelper] paired device subscription fetch error: %@", buf, 0xCu);
      }
    }
    else
    {
      id v18 = WeakRetained;
      int v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
      uint64_t v9 = dispatch_group_create();
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v19 = v5;
      id obj = v5;
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            dispatch_group_enter(v9);
            int v16 = [*(id *)(a1 + 32) subscriptionManager];
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_36F00;
            v23[3] = &unk_72CE8;
            id v24 = v10;
            uint64_t v25 = v15;
            uint64_t v26 = v9;
            [v16 fetchStateForPairedDeviceSubscriptionWithIdentifier:v15 callbackQueue:&_dispatch_main_q completionHandler:v23];
          }
          id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_36FD8;
      block[3] = &unk_724C8;
      void block[4] = *(void *)(a1 + 32);
      id v22 = v10;
      id v17 = v10;
      dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

      id v6 = 0;
      id v5 = v19;
      uint64_t v8 = v18;
    }
  }
}

void sub_36F00(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = MAPSGetOfflineLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "[MapsOfflineUIHelper] paired device subscription state fetch error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_36FD8(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "subscriptionInfos", 0);
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = [v7 subscription];
        int v10 = [v9 identifier];
        id v11 = [v8 objectForKeyedSubscript:v10];

        [v7 setPairedDeviceState:v11];
      }
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = (void *)v12[1];
  long long v14 = [v12 subscriptionInfos];
  [v13 pairedSubscriptionInfosDidChange:v14];
}

void sub_37690(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = MAPSGetOfflineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v5;
      __int16 v43 = 2112;
      id v44 = v3;
      __int16 v45 = 2112;
      uint64_t v46 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[MapsOfflineUIHelper] KVO update for keyPath: %@, state: %@, change: %@", buf, 0x20u);
    }

    int v7 = *(void **)(a1 + 40);
    id v8 = NSStringFromSelector("loadState");
    LODWORD(v7) = [v7 isEqualToString:v8];

    if (!v7)
    {
      long long v14 = *(void **)(a1 + 40);
      long long v15 = NSStringFromSelector("lastError");
      LOBYTE(v14) = [v14 isEqualToString:v15];

      if ((v14 & 1) == 0)
      {
        long long v16 = *(void **)(a1 + 40);
        long long v17 = NSStringFromSelector("downloadProgress");
        LODWORD(v16) = [v16 isEqualToString:v17];

        if (v16)
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v18 = *(id *)(*(void *)(a1 + 64) + 48);
          id v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v37;
            while (2)
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v37 != v20) {
                  objc_enumerationMutation(v18);
                }
                id v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                objc_msgSend(v22, "state", (void)v36);
                id v23 = (id)objc_claimAutoreleasedReturnValue();

                if (v23 == v3)
                {
                  long long v31 = [v22 subscription];
                  id v19 = [v31 identifier];

                  goto LABEL_36;
                }
              }
              id v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
LABEL_36:

          long long v32 = [v3 downloadProgress];

          if (v32)
          {
            id v33 = [v3 downloadProgress];
            long long v34 = [v33 userInfo];
            v35 = [v34 objectForKeyedSubscript:GEOMapDataSubscriptionDownloadReasonKey];

            if (([v3 loadState] == (char *)&dword_0 + 1
               || [v3 loadState] == (char *)&dword_0 + 3)
              && v35
              && [v35 isEqualToString:GEOMapDataSubscriptionProgressDownloadReasonForcedUpdate])
            {
              [*(id *)(a1 + 64) _startedUpdatingSubscription:v19];
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 64), "_stoppedUpdatingSubscription:", v19, (void)v36);
            }
          }
          else
          {
            [*(id *)(a1 + 64) _stoppedUpdatingSubscription:v19];
          }
        }
      }
      goto LABEL_46;
    }
    uint64_t v9 = [*(id *)(a1 + 56) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    unsigned int v10 = [v9 intValue];

    id v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    unsigned int v12 = [v11 intValue];

    if (v10 != 1 || v12 == 1)
    {
      if (v10 == 1 || v12 != 1) {
        goto LABEL_25;
      }
      uint64_t v24 = 1;
    }
    else
    {
      uint64_t v24 = -1;
    }
    objc_msgSend(WeakRetained, "setOutOfDateSubscriptionsCount:", (char *)objc_msgSend(WeakRetained, "outOfDateSubscriptionsCount") + v24);
LABEL_25:
    unsigned int v25 = v10 - 3;
    if ((v25 != 0) == (v12 == 3))
    {
      uint64_t v26 = (char *)[WeakRetained outOfDateSubscriptionsCount];
      if (v12 == 3) {
        long long v27 = v26 + 1;
      }
      else {
        long long v27 = v26 - 1;
      }
      [WeakRetained setOutOfDateSubscriptionsCount:v27];
    }
    unsigned int v28 = v12 - 1;
    if (v25 < 0xFFFFFFFE == v28 < 2)
    {
      long long v29 = (char *)[WeakRetained fullyLoadedSubscriptionsCount];
      if (v28 > 1) {
        long long v30 = v29 - 1;
      }
      else {
        long long v30 = v29 + 1;
      }
      [WeakRetained setFullyLoadedSubscriptionsCount:v30];
    }
LABEL_46:
  }
}

void sub_3828C(id a1)
{
  uint64_t v1 = (void *)qword_8E328;
  qword_8E328 = (uint64_t)&off_7C430;
}

uint64_t IsFetchAutomaticParkedCarLocationSupported()
{
  if (qword_8E338 != -1) {
    dispatch_once(&qword_8E338, &stru_72D78);
  }
  return byte_8E330;
}

void sub_384D8(id a1)
{
  if (MGGetBoolAnswer())
  {
    uint64_t v1 = dispatch_group_create();
    dispatch_group_enter(v1);
    uint64_t v2 = +[RTRoutineManager defaultManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_385B4;
    v5[3] = &unk_72DA0;
    uint64_t v6 = v1;
    id v3 = v1;
    [v2 fetchAutomaticVehicleEventDetectionSupportedWithHandler:v5];

    dispatch_time_t v4 = dispatch_walltime(0, 2000000000);
    dispatch_group_wait(v3, v4);
  }
}

void sub_385B4(uint64_t a1, char a2)
{
  byte_8E330 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_38618(id a1)
{
  qword_8E340 = objc_alloc_init(UGCThirdPartyPhotoSharingPreferencesManager);

  _objc_release_x1();
}

void sub_387B4(uint64_t a1)
{
  uint64_t v2 = sub_38A24();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "Fetching third party photo sharing preferences", (uint8_t *)buf, 2u);
  }

  id v3 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  id v4 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
  [v3 setQueryParameters:v4];

  uint64_t v5 = [v3 queryParameters];
  [v5 addFeedbackComponentType:6];

  id v6 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  int v7 = +[GEORPUserCredentials _credentialsForPrimaryICloudAccount];
  [v6 setUserCredentials:v7];

  objc_initWeak(buf, *(id *)(a1 + 32));
  id v8 = objc_alloc((Class)GEORPFeedbackRequest);
  uint64_t v9 = +[GEOMapService sharedService];
  unsigned int v10 = [v9 defaultTraits];
  id v11 = [v8 initWithFeedbackRequestParameters:v3 userInfo:v6 traits:v10];

  unsigned int v12 = +[GEOMapService sharedService];
  uint64_t v13 = +[GEOMapService sharedService];
  long long v14 = [v13 defaultTraits];
  long long v15 = [v12 ticketForFeedbackRequest:v11 traits:v14];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_38A78;
  v16[3] = &unk_72E10;
  objc_copyWeak(&v18, buf);
  id v17 = *(id *)(a1 + 40);
  [v15 submitWithHandler:v16 networkActivity:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

void sub_389FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_38A24()
{
  if (qword_8E358 != -1) {
    dispatch_once(&qword_8E358, &stru_72EE8);
  }
  uint64_t v0 = (void *)qword_8E350;

  return v0;
}

void sub_38A78(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = sub_38A24();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Preferences fetch failed with error %@", buf, 0xCu);
    }
  }
  uint64_t v9 = +[GEORPThirdPartyPhotoSharingPreference thirdPartyPhotoSharingPreferenceFromResponse:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_38C0C;
  v13[3] = &unk_72DE8;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v14 = v9;
  id v10 = *(id *)(a1 + 32);
  id v15 = v7;
  id v16 = v10;
  id v11 = v7;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v17);
}

void sub_38C0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _setDefaultsKeyForPreferences:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_38D24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_38D40(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 version];

  [WeakRetained _updateThirdPartyPhotoSharingPreferences:0 versionID:v4 eraseServerSavedSetting:1 completion:&stru_72E78];
}

void sub_38EA4(uint64_t a1)
{
  uint64_t v2 = sub_38A24();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "Updating third party photo sharing preferences", (uint8_t *)buf, 2u);
  }

  id v3 = objc_alloc_init((Class)GEORPThirdPartyPhotoSharingPreference);
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 56)) {
    [v3 setOptIn:*(unsigned __int8 *)(a1 + 57)];
  }
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v4, "setVersion:");
  }
  id v5 = objc_alloc_init((Class)GEORPThirdPartyPhotoSharingPreferenceUpdate);
  [v5 setPreference:v4];
  id v6 = objc_alloc_init((Class)GEORPFeedbackDetails);
  [v6 setThirdPartyPhotoSharingPreferenceUpdate:v5];
  id v7 = objc_alloc_init((Class)GEORPFeedbackSubmissionParameters);
  [v7 setType:18];
  unsigned int v28 = v6;
  [v7 setDetails:v6];
  id v8 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  [v8 setSubmissionParameters:v7];
  id v9 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  id v10 = +[GEORPUserCredentials _credentialsForPrimaryICloudAccount];
  [v9 setUserCredentials:v10];

  objc_initWeak(buf, *(id *)(a1 + 40));
  id v11 = objc_alloc((Class)GEORPFeedbackRequest);
  id v12 = +[GEOMapService sharedService];
  uint64_t v13 = [v12 defaultTraits];
  id v29 = [v11 initWithFeedbackRequestParameters:v8 userInfo:v9 traits:v13];
  id v24 = v5;
  uint64_t v26 = v4;

  id v14 = +[GEOMapService sharedService];
  id v15 = +[GEOMapService sharedService];
  id v16 = [v15 defaultTraits];
  id v17 = [v14 ticketForFeedbackRequest:v29 traits:v16];

  id v18 = sub_38A24();
  id v19 = [v8 submissionParameters];
  uint64_t v20 = [v19 clientSubmissionUuid];
  if ([v20 length])
  {
    long long v21 = objc_msgSend(v8, "submissionParameters", v24, v26);
    [v21 clientSubmissionUuid];
  }
  else
  {
    long long v21 = +[NSUUID UUID];
    [v21 UUIDString];
  id v22 = };

  id v23 = &_dispatch_main_q;
  MSPUGCPerformLogDiscardForCurrentSessionWithCompletion();

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_3924C;
  v30[3] = &unk_72E10;
  objc_copyWeak(&v32, buf);
  id v31 = *(id *)(a1 + 48);
  [v17 submitWithHandler:v30 networkActivity:0];

  objc_destroyWeak(&v32);
  objc_destroyWeak(buf);
}

void sub_39220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3924C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_38A24();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Update to third party photo settings failed with error %@", buf, 0xCu);
    }
  }
  id v11 = [v7 feedbackResult];
  id v12 = [v11 submissionResult];
  uint64_t v13 = [v12 thirdPartyPhotoSharingPreferenceUpdateResult];

  id v14 = [v13 preference];
  if ([v13 errorsCount])
  {
    id v15 = +[NSMutableArray array];
    if ([v13 errorsCount])
    {
      unint64_t v16 = 0;
      do
      {
        id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 errorsAtIndex:v16]);
        [v15 addObject:v17];

        ++v16;
      }
      while (v16 < (unint64_t)[v13 errorsCount]);
    }
  }
  else
  {
    id v15 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_394C8;
  block[3] = &unk_72EA0;
  objc_copyWeak(&v27, (id *)(a1 + 40));
  id v23 = v14;
  id v18 = *(id *)(a1 + 32);
  id v25 = v15;
  id v26 = v18;
  id v24 = v9;
  id v19 = v15;
  id v20 = v9;
  id v21 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v27);
}

void sub_394C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _setDefaultsKeyForPreferences:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = [*(id *)(a1 + 48) copy];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v2, v3, v5);
}

void sub_39604(id a1)
{
  qword_8E350 = (uint64_t)os_log_create("com.apple.Maps", "ThirdPartyPhotoSharingPreferencesManager");

  _objc_release_x1();
}

uint64_t MapsWalkPreferencesCurrentCountrySupportsAvoidHills()
{
  uint64_t v0 = +[GEOCountryConfiguration sharedConfiguration];
  uint64_t v1 = [v0 countryCode];
  uint64_t v2 = [v1 isEqualToString:@"CN"] ^ 1;

  return v2;
}

uint64_t MapsWalkPreferencesCurrentCountrySupportsAvoidBusyRoads()
{
  uint64_t v0 = +[GEOCountryConfiguration sharedConfiguration];
  uint64_t v1 = [v0 countryCode];
  uint64_t v2 = [v1 isEqualToString:@"CN"] ^ 1;

  return v2;
}

id MapsWalkPreferencesCurrentCountrySupportsAvoidStairs()
{
  uint64_t v0 = +[GEOCountryConfiguration sharedConfiguration];
  if ([v0 currentCountrySupportsAvoidStairs])
  {
    id v1 = &dword_0 + 1;
  }
  else
  {
    uint64_t v2 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v3 = [v2 countryCode];
    id v1 = [v3 isEqualToString:@"CN"];
  }
  return v1;
}

void sub_3A2CC(id a1)
{
  qword_8E360 = [[WeatherSettingsManager alloc] initSharedManager];

  _objc_release_x1();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

uint64_t GEOAreLagunaBeachSiriSuggestionsEnabled()
{
  return _GEOAreLagunaBeachSiriSuggestionsEnabled();
}

uint64_t GEOCanUserMakeLagunaBeachContributions()
{
  return _GEOCanUserMakeLagunaBeachContributions();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

uint64_t GEOConfigGetDouble()
{
  return _GEOConfigGetDouble();
}

uint64_t GEOConfigGetInteger()
{
  return _GEOConfigGetInteger();
}

uint64_t GEOConfigGetPropertiesForKey()
{
  return _GEOConfigGetPropertiesForKey();
}

uint64_t GEOConfigGetString()
{
  return _GEOConfigGetString();
}

uint64_t GEOConfigGetUInteger()
{
  return _GEOConfigGetUInteger();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return _GEOConfigRemoveDelegateListenerForAllKeys();
}

uint64_t GEOConfigRemoveDelegateListenerForKey()
{
  return _GEOConfigRemoveDelegateListenerForKey();
}

uint64_t GEOConfigSetBOOL()
{
  return _GEOConfigSetBOOL();
}

uint64_t GEOConfigSetInteger()
{
  return _GEOConfigSetInteger();
}

uint64_t GEOConfigSetString()
{
  return _GEOConfigSetString();
}

uint64_t GEODefaultsDomain()
{
  return _GEODefaultsDomain();
}

uint64_t GEODoesUserHaveValidAccountForMakingContributions()
{
  return _GEODoesUserHaveValidAccountForMakingContributions();
}

uint64_t GEOFindOrCreateLog()
{
  return _GEOFindOrCreateLog();
}

uint64_t GEOGetUserTransportTypePreference()
{
  return _GEOGetUserTransportTypePreference();
}

uint64_t GEOMapRectForMapRegion()
{
  return _GEOMapRectForMapRegion();
}

uint64_t GEOMapRectFractionCoveredByMapRects()
{
  return _GEOMapRectFractionCoveredByMapRects();
}

uint64_t GEOMapRectIntersection()
{
  return _GEOMapRectIntersection();
}

uint64_t GEOMapRectIsEmpty()
{
  return _GEOMapRectIsEmpty();
}

uint64_t GEOMapRectIsNull()
{
  return _GEOMapRectIsNull();
}

uint64_t GEOMaximumAutomaticUpdateOfflineDataSize()
{
  return _GEOMaximumAutomaticUpdateOfflineDataSize();
}

uint64_t GEOSetAreLagunaBeachSiriSuggestionsEnabled()
{
  return _GEOSetAreLagunaBeachSiriSuggestionsEnabled();
}

uint64_t GEOSetCanUserMakeLagunaBeachContributions()
{
  return _GEOSetCanUserMakeLagunaBeachContributions();
}

uint64_t GEOSetUserTransportTypePreference()
{
  return _GEOSetUserTransportTypePreference();
}

uint64_t GEOSupportsOfflineMaps()
{
  return _GEOSupportsOfflineMaps();
}

uint64_t GSSendAppPreferencesChanged()
{
  return _GSSendAppPreferencesChanged();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MSPSharedTripNetworkEnabled()
{
  return _MSPSharedTripNetworkEnabled();
}

uint64_t MSPUGCPerformLogDiscardForCurrentSessionWithCompletion()
{
  return _MSPUGCPerformLogDiscardForCurrentSessionWithCompletion();
}

uint64_t MapsFeature_IsEnabled_EVRouting()
{
  return _MapsFeature_IsEnabled_EVRouting();
}

uint64_t MapsFeature_IsEnabled_LagunaBeach()
{
  return _MapsFeature_IsEnabled_LagunaBeach();
}

uint64_t MapsFeature_IsEnabled_PedestrianAR()
{
  return _MapsFeature_IsEnabled_PedestrianAR();
}

uint64_t MapsFeature_IsEnabled_RAPCommunityID()
{
  return _MapsFeature_IsEnabled_RAPCommunityID();
}

uint64_t MapsFeature_IsEnabled_StandaloneWatchOffline()
{
  return _MapsFeature_IsEnabled_StandaloneWatchOffline();
}

uint64_t MapsFeature_IsEnabled_SydneyARP()
{
  return _MapsFeature_IsEnabled_SydneyARP();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return _PSBundlePathForPreferenceBundle();
}

uint64_t UICeilToScale()
{
  return _UICeilToScale();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return __CFPreferencesCopyAppValueWithContainer();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return __CFPreferencesCopyValueWithContainer();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return __CFPreferencesSynchronizeWithContainer();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return __CTServerConnectionCopyCellularUsagePolicy();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return __GEOConfigAddDelegateListenerForKey();
}

uint64_t _GEOConfigHasValue()
{
  return __GEOConfigHasValue();
}

uint64_t _GEOConfigSetEncodedValue()
{
  return __GEOConfigSetEncodedValue();
}

uint64_t _MKRAPIsAvailable()
{
  return __MKRAPIsAvailable();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

void objc_addLoadImageFunc(objc_func_loadImage func)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  objc_method_description MethodDescription = _protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod);
  types = MethodDescription.types;
  name = MethodDescription.name;
  result.types = types;
  result.name = name;
  return result;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__backlightLuminance(void *a1, const char *a2, ...)
{
  return [a1 _backlightLuminance];
}

id objc_msgSend__childAnimationsDidComplete(void *a1, const char *a2, ...)
{
  return [a1 _childAnimationsDidComplete];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return [a1 _commonInit];
}

id objc_msgSend__containingAppIdentifer(void *a1, const char *a2, ...)
{
  return [a1 _containingAppIdentifer];
}

id objc_msgSend__credentialsForPrimaryICloudAccount(void *a1, const char *a2, ...)
{
  return [a1 _credentialsForPrimaryICloudAccount];
}

id objc_msgSend__currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 _currentTraitCollection];
}

id objc_msgSend__detentValues(void *a1, const char *a2, ...)
{
  return [a1 _detentValues];
}

id objc_msgSend__hasPrepared(void *a1, const char *a2, ...)
{
  return [a1 _hasPrepared];
}

id objc_msgSend__isInAnimationBlock(void *a1, const char *a2, ...)
{
  return [a1 _isInAnimationBlock];
}

id objc_msgSend__keys(void *a1, const char *a2, ...)
{
  return [a1 _keys];
}

id objc_msgSend__mapLayer(void *a1, const char *a2, ...)
{
  return [a1 _mapLayer];
}

id objc_msgSend__offlineDownloadSettingsMenu(void *a1, const char *a2, ...)
{
  return [a1 _offlineDownloadSettingsMenu];
}

id objc_msgSend__panningGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 _panningGestureRecognizer];
}

id objc_msgSend__privacyIdentifiersForContributeToMapsSection(void *a1, const char *a2, ...)
{
  return [a1 _privacyIdentifiersForContributeToMapsSection];
}

id objc_msgSend__refreshThirdPartyPhotoSharingStatus(void *a1, const char *a2, ...)
{
  return [a1 _refreshThirdPartyPhotoSharingStatus];
}

id objc_msgSend__reloadLastUpdatedDates(void *a1, const char *a2, ...)
{
  return [a1 _reloadLastUpdatedDates];
}

id objc_msgSend__reloadPairedDeviceSubscriptionInfos(void *a1, const char *a2, ...)
{
  return [a1 _reloadPairedDeviceSubscriptionInfos];
}

id objc_msgSend__reloadSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 _reloadSubscriptions];
}

id objc_msgSend__saveState(void *a1, const char *a2, ...)
{
  return [a1 _saveState];
}

id objc_msgSend__selectedViewModeIsExpired(void *a1, const char *a2, ...)
{
  return [a1 _selectedViewModeIsExpired];
}

id objc_msgSend__setupExtensionManager(void *a1, const char *a2, ...)
{
  return [a1 _setupExtensionManager];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__subscriptionsDidChange(void *a1, const char *a2, ...)
{
  return [a1 _subscriptionsDidChange];
}

id objc_msgSend__updateAttributedText(void *a1, const char *a2, ...)
{
  return [a1 _updateAttributedText];
}

id objc_msgSend__updateConstraintConstants(void *a1, const char *a2, ...)
{
  return [a1 _updateConstraintConstants];
}

id objc_msgSend__updateConstraints(void *a1, const char *a2, ...)
{
  return [a1 _updateConstraints];
}

id objc_msgSend__updateCurrentTheme(void *a1, const char *a2, ...)
{
  return [a1 _updateCurrentTheme];
}

id objc_msgSend__updateExpiredSubscriptionsCount(void *a1, const char *a2, ...)
{
  return [a1 _updateExpiredSubscriptionsCount];
}

id objc_msgSend__updateImage(void *a1, const char *a2, ...)
{
  return [a1 _updateImage];
}

id objc_msgSend__updateSettingsFromCurrentGeoCountryConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _updateSettingsFromCurrentGeoCountryConfiguration];
}

id objc_msgSend__updateTintColor(void *a1, const char *a2, ...)
{
  return [a1 _updateTintColor];
}

id objc_msgSend__updateTitleColor(void *a1, const char *a2, ...)
{
  return [a1 _updateTitleColor];
}

id objc_msgSend__updateTotalDataSize(void *a1, const char *a2, ...)
{
  return [a1 _updateTotalDataSize];
}

id objc_msgSend__values(void *a1, const char *a2, ...)
{
  return [a1 _values];
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return [a1 adjustedContentInset];
}

id objc_msgSend_allConstraints(void *a1, const char *a2, ...)
{
  return [a1 allConstraints];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowEmailCorrespondence(void *a1, const char *a2, ...)
{
  return [a1 allowEmailCorrespondence];
}

id objc_msgSend_allowsEdgeAntialiasing(void *a1, const char *a2, ...)
{
  return [a1 allowsEdgeAntialiasing];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_animate(void *a1, const char *a2, ...)
{
  return [a1 animate];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return [a1 animationKeys];
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return [a1 appPolicy];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_applicationRecord(void *a1, const char *a2, ...)
{
  return [a1 applicationRecord];
}

id objc_msgSend_applications(void *a1, const char *a2, ...)
{
  return [a1 applications];
}

id objc_msgSend_applyInitialCameraPosition(void *a1, const char *a2, ...)
{
  return [a1 applyInitialCameraPosition];
}

id objc_msgSend_applyInitialZoomLevel(void *a1, const char *a2, ...)
{
  return [a1 applyInitialZoomLevel];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAnimationsEnabled];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrivalDate(void *a1, const char *a2, ...)
{
  return [a1 arrivalDate];
}

id objc_msgSend_arrivalTimeZone(void *a1, const char *a2, ...)
{
  return [a1 arrivalTimeZone];
}

id objc_msgSend_aspectRatioConstraintPriority(void *a1, const char *a2, ...)
{
  return [a1 aspectRatioConstraintPriority];
}

id objc_msgSend_attributedTextProvider(void *a1, const char *a2, ...)
{
  return [a1 attributedTextProvider];
}

id objc_msgSend_availableDiskSpaceForPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 availableDiskSpaceForPairedDevice];
}

id objc_msgSend_avoidBusyRoads(void *a1, const char *a2, ...)
{
  return [a1 avoidBusyRoads];
}

id objc_msgSend_avoidHills(void *a1, const char *a2, ...)
{
  return [a1 avoidHills];
}

id objc_msgSend_avoidStairs(void *a1, const char *a2, ...)
{
  return [a1 avoidStairs];
}

id objc_msgSend_avoidedModesCount(void *a1, const char *a2, ...)
{
  return [a1 avoidedModesCount];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blurEffect(void *a1, const char *a2, ...)
{
  return [a1 blurEffect];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderLineWidth(void *a1, const char *a2, ...)
{
  return [a1 borderLineWidth];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 bottomConstraint];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_canLocalizeLabels(void *a1, const char *a2, ...)
{
  return [a1 canLocalizeLabels];
}

id objc_msgSend_cellularStatus(void *a1, const char *a2, ...)
{
  return [a1 cellularStatus];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerCoordinate(void *a1, const char *a2, ...)
{
  return [a1 centerCoordinate];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_cgFloatValue(void *a1, const char *a2, ...)
{
  return [a1 cgFloatValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clientSubmissionUuid(void *a1, const char *a2, ...)
{
  return [a1 clientSubmissionUuid];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_controlBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 controlBackgroundColor];
}

id objc_msgSend_controlSize(void *a1, const char *a2, ...)
{
  return [a1 controlSize];
}

id objc_msgSend_controlTintColor(void *a1, const char *a2, ...)
{
  return [a1 controlTintColor];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_crosshairImage(void *a1, const char *a2, ...)
{
  return [a1 crosshairImage];
}

id objc_msgSend_crosshairImageView(void *a1, const char *a2, ...)
{
  return [a1 crosshairImageView];
}

id objc_msgSend_crosshairType(void *a1, const char *a2, ...)
{
  return [a1 crosshairType];
}

id objc_msgSend_crosshairXConstraint(void *a1, const char *a2, ...)
{
  return [a1 crosshairXConstraint];
}

id objc_msgSend_crosshairYConstraint(void *a1, const char *a2, ...)
{
  return [a1 crosshairYConstraint];
}

id objc_msgSend_currentCountrySupportsAvoidStairs(void *a1, const char *a2, ...)
{
  return [a1 currentCountrySupportsAvoidStairs];
}

id objc_msgSend_currentCountrySupportsNavigation(void *a1, const char *a2, ...)
{
  return [a1 currentCountrySupportsNavigation];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_customBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 customBackgroundColor];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 darkGrayColor];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_dataTypes(void *a1, const char *a2, ...)
{
  return [a1 dataTypes];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultAnimationDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultAnimationDuration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return [a1 delay];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_departureDate(void *a1, const char *a2, ...)
{
  return [a1 departureDate];
}

id objc_msgSend_departureTimeZone(void *a1, const char *a2, ...)
{
  return [a1 departureTimeZone];
}

id objc_msgSend_deviceSupportsCellularData(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsCellularData];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disabledAppIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 disabledAppIdentifiers];
}

id objc_msgSend_disabledModes(void *a1, const char *a2, ...)
{
  return [a1 disabledModes];
}

id objc_msgSend_disabledTitleColor(void *a1, const char *a2, ...)
{
  return [a1 disabledTitleColor];
}

id objc_msgSend_displayImage(void *a1, const char *a2, ...)
{
  return [a1 displayImage];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downloadProgress(void *a1, const char *a2, ...)
{
  return [a1 downloadProgress];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_electricVehicleCount(void *a1, const char *a2, ...)
{
  return [a1 electricVehicleCount];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_errorsCount(void *a1, const char *a2, ...)
{
  return [a1 errorsCount];
}

id objc_msgSend_evRoutingController(void *a1, const char *a2, ...)
{
  return [a1 evRoutingController];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_expiredSubscriptionsCount(void *a1, const char *a2, ...)
{
  return [a1 expiredSubscriptionsCount];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_extensionLookupPolicy(void *a1, const char *a2, ...)
{
  return [a1 extensionLookupPolicy];
}

id objc_msgSend_extensions(void *a1, const char *a2, ...)
{
  return [a1 extensions];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_fareOptions(void *a1, const char *a2, ...)
{
  return [a1 fareOptions];
}

id objc_msgSend_feedbackComponents(void *a1, const char *a2, ...)
{
  return [a1 feedbackComponents];
}

id objc_msgSend_feedbackInfos(void *a1, const char *a2, ...)
{
  return [a1 feedbackInfos];
}

id objc_msgSend_feedbackResult(void *a1, const char *a2, ...)
{
  return [a1 feedbackResult];
}

id objc_msgSend_findOEMApplications(void *a1, const char *a2, ...)
{
  return [a1 findOEMApplications];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flow(void *a1, const char *a2, ...)
{
  return [a1 flow];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_fontAttributes(void *a1, const char *a2, ...)
{
  return [a1 fontAttributes];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_footerTextForDisabledModes(void *a1, const char *a2, ...)
{
  return [a1 footerTextForDisabledModes];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullyLoadedSubscriptionsCount(void *a1, const char *a2, ...)
{
  return [a1 fullyLoadedSubscriptionsCount];
}

id objc_msgSend_getActivePairedDeviceExcludingAltAccount(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDeviceExcludingAltAccount];
}

id objc_msgSend_globalThemes(void *a1, const char *a2, ...)
{
  return [a1 globalThemes];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_groupDirectory(void *a1, const char *a2, ...)
{
  return [a1 groupDirectory];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_hairlineColor(void *a1, const char *a2, ...)
{
  return [a1 hairlineColor];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasFullyLoadedSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 hasFullyLoadedSubscriptions];
}

id objc_msgSend_hasInstalledApplications(void *a1, const char *a2, ...)
{
  return [a1 hasInstalledApplications];
}

id objc_msgSend_hasOptIn(void *a1, const char *a2, ...)
{
  return [a1 hasOptIn];
}

id objc_msgSend_hasPreferredSurchargeType(void *a1, const char *a2, ...)
{
  return [a1 hasPreferredSurchargeType];
}

id objc_msgSend_hasSubscriptionsBeingUpdated(void *a1, const char *a2, ...)
{
  return [a1 hasSubscriptionsBeingUpdated];
}

id objc_msgSend_hasSubscriptionsNeedingUpdate(void *a1, const char *a2, ...)
{
  return [a1 hasSubscriptionsNeedingUpdate];
}

id objc_msgSend_hasUserLocation(void *a1, const char *a2, ...)
{
  return [a1 hasUserLocation];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headerTextForDisabledModes(void *a1, const char *a2, ...)
{
  return [a1 headerTextForDisabledModes];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_homeDirectory(void *a1, const char *a2, ...)
{
  return [a1 homeDirectory];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_iconSize(void *a1, const char *a2, ...)
{
  return [a1 iconSize];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageOrientation];
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return [a1 imageProvider];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_initSharedManager(void *a1, const char *a2, ...)
{
  return [a1 initSharedManager];
}

id objc_msgSend_initialCamera(void *a1, const char *a2, ...)
{
  return [a1 initialCamera];
}

id objc_msgSend_initialMapViewZoomLevel(void *a1, const char *a2, ...)
{
  return [a1 initialMapViewZoomLevel];
}

id objc_msgSend_initialVelocity(void *a1, const char *a2, ...)
{
  return [a1 initialVelocity];
}

id objc_msgSend_insertions(void *a1, const char *a2, ...)
{
  return [a1 insertions];
}

id objc_msgSend_instructionsContainer(void *a1, const char *a2, ...)
{
  return [a1 instructionsContainer];
}

id objc_msgSend_instructionsLabel(void *a1, const char *a2, ...)
{
  return [a1 instructionsLabel];
}

id objc_msgSend_instructionsText(void *a1, const char *a2, ...)
{
  return [a1 instructionsText];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isAnimated(void *a1, const char *a2, ...)
{
  return [a1 isAnimated];
}

id objc_msgSend_isAuthorizedForPreciseLocation(void *a1, const char *a2, ...)
{
  return [a1 isAuthorizedForPreciseLocation];
}

id objc_msgSend_isCellConnection(void *a1, const char *a2, ...)
{
  return [a1 isCellConnection];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isEphemeralMultiUser];
}

id objc_msgSend_isFindMyCarAllowed(void *a1, const char *a2, ...)
{
  return [a1 isFindMyCarAllowed];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isLocationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLocationServicesEnabled];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return [a1 isSupported];
}

id objc_msgSend_isTextTruncated(void *a1, const char *a2, ...)
{
  return [a1 isTextTruncated];
}

id objc_msgSend_isThirdPartyPhotoSharingStatusLoading(void *a1, const char *a2, ...)
{
  return [a1 isThirdPartyPhotoSharingStatusLoading];
}

id objc_msgSend_isUsingOffline(void *a1, const char *a2, ...)
{
  return [a1 isUsingOffline];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_keyColor(void *a1, const char *a2, ...)
{
  return [a1 keyColor];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return [a1 launchedToTest];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return [a1 leading];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leadingConstraint(void *a1, const char *a2, ...)
{
  return [a1 leadingConstraint];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_leftConstraint(void *a1, const char *a2, ...)
{
  return [a1 leftConstraint];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_loadState(void *a1, const char *a2, ...)
{
  return [a1 loadState];
}

id objc_msgSend_loadValuesFromDefaults(void *a1, const char *a2, ...)
{
  return [a1 loadValuesFromDefaults];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_localizedExtensionsFooter(void *a1, const char *a2, ...)
{
  return [a1 localizedExtensionsFooter];
}

id objc_msgSend_localizedExtensionsHeader(void *a1, const char *a2, ...)
{
  return [a1 localizedExtensionsHeader];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locationImage(void *a1, const char *a2, ...)
{
  return [a1 locationImage];
}

id objc_msgSend_locationOfInterest(void *a1, const char *a2, ...)
{
  return [a1 locationOfInterest];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return [a1 mapView];
}

id objc_msgSend_mapViewConstraints(void *a1, const char *a2, ...)
{
  return [a1 mapViewConstraints];
}

id objc_msgSend_mapViewDelegate(void *a1, const char *a2, ...)
{
  return [a1 mapViewDelegate];
}

id objc_msgSend_mapsApplicationContainerPaths(void *a1, const char *a2, ...)
{
  return [a1 mapsApplicationContainerPaths];
}

id objc_msgSend_mapsThemeStyle(void *a1, const char *a2, ...)
{
  return [a1 mapsThemeStyle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_needsDisplayOnBoundsChange(void *a1, const char *a2, ...)
{
  return [a1 needsDisplayOnBoundsChange];
}

id objc_msgSend_needsInitialCameraPosition(void *a1, const char *a2, ...)
{
  return [a1 needsInitialCameraPosition];
}

id objc_msgSend_nextResponder(void *a1, const char *a2, ...)
{
  return [a1 nextResponder];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return [a1 numberOfLines];
}

id objc_msgSend_numberOfSegments(void *a1, const char *a2, ...)
{
  return [a1 numberOfSegments];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_offlineHelper(void *a1, const char *a2, ...)
{
  return [a1 offlineHelper];
}

id objc_msgSend_optIn(void *a1, const char *a2, ...)
{
  return [a1 optIn];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_outOfDateSubscriptionsCount(void *a1, const char *a2, ...)
{
  return [a1 outOfDateSubscriptionsCount];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_owningView(void *a1, const char *a2, ...)
{
  return [a1 owningView];
}

id objc_msgSend_pairedDeviceSubscriptionStatesMonitorCount(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceSubscriptionStatesMonitorCount];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_paymentType(void *a1, const char *a2, ...)
{
  return [a1 paymentType];
}

id objc_msgSend_photoAttributionPreferences(void *a1, const char *a2, ...)
{
  return [a1 photoAttributionPreferences];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_preference(void *a1, const char *a2, ...)
{
  return [a1 preference];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredDistanceUnit(void *a1, const char *a2, ...)
{
  return [a1 preferredDistanceUnit];
}

id objc_msgSend_preferredSurchargeType(void *a1, const char *a2, ...)
{
  return [a1 preferredSurchargeType];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return [a1 prepare];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_preventsAnimationDuringPreparation(void *a1, const char *a2, ...)
{
  return [a1 preventsAnimationDuringPreparation];
}

id objc_msgSend_prioritization(void *a1, const char *a2, ...)
{
  return [a1 prioritization];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressColor(void *a1, const char *a2, ...)
{
  return [a1 progressColor];
}

id objc_msgSend_progressPresentationValue(void *a1, const char *a2, ...)
{
  return [a1 progressPresentationValue];
}

id objc_msgSend_queryParameters(void *a1, const char *a2, ...)
{
  return [a1 queryParameters];
}

id objc_msgSend_queryResult(void *a1, const char *a2, ...)
{
  return [a1 queryResult];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_remembersLastFocusedIndexPath(void *a1, const char *a2, ...)
{
  return [a1 remembersLastFocusedIndexPath];
}

id objc_msgSend_removals(void *a1, const char *a2, ...)
{
  return [a1 removals];
}

id objc_msgSend_removeAllSegments(void *a1, const char *a2, ...)
{
  return [a1 removeAllSegments];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_restaurantBookingController(void *a1, const char *a2, ...)
{
  return [a1 restaurantBookingController];
}

id objc_msgSend_rideBookingController(void *a1, const char *a2, ...)
{
  return [a1 rideBookingController];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rightConstraint(void *a1, const char *a2, ...)
{
  return [a1 rightConstraint];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_runWithCurrentOptions(void *a1, const char *a2, ...)
{
  return [a1 runWithCurrentOptions];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sceneIdentifier];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_selectedBackgroundColorProvider(void *a1, const char *a2, ...)
{
  return [a1 selectedBackgroundColorProvider];
}

id objc_msgSend_selectedBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 selectedBackgroundView];
}

id objc_msgSend_separatorColorProvider(void *a1, const char *a2, ...)
{
  return [a1 separatorColorProvider];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settingsUpdatedNotificationKey(void *a1, const char *a2, ...)
{
  return [a1 settingsUpdatedNotificationKey];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedTheme(void *a1, const char *a2, ...)
{
  return [a1 sharedTheme];
}

id objc_msgSend_shouldShowAirQualityConditions(void *a1, const char *a2, ...)
{
  return [a1 shouldShowAirQualityConditions];
}

id objc_msgSend_shouldShowWeatherConditions(void *a1, const char *a2, ...)
{
  return [a1 shouldShowWeatherConditions];
}

id objc_msgSend_showICFares(void *a1, const char *a2, ...)
{
  return [a1 showICFares];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizingLength(void *a1, const char *a2, ...)
{
  return [a1 sizingLength];
}

id objc_msgSend_sortOption(void *a1, const char *a2, ...)
{
  return [a1 sortOption];
}

id objc_msgSend_springDamping(void *a1, const char *a2, ...)
{
  return [a1 springDamping];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_submissionParameters(void *a1, const char *a2, ...)
{
  return [a1 submissionParameters];
}

id objc_msgSend_submissionResult(void *a1, const char *a2, ...)
{
  return [a1 submissionResult];
}

id objc_msgSend_subscription(void *a1, const char *a2, ...)
{
  return [a1 subscription];
}

id objc_msgSend_subscriptionInfos(void *a1, const char *a2, ...)
{
  return [a1 subscriptionInfos];
}

id objc_msgSend_subscriptionManager(void *a1, const char *a2, ...)
{
  return [a1 subscriptionManager];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportsNavigation(void *a1, const char *a2, ...)
{
  return [a1 supportsNavigation];
}

id objc_msgSend_surchargeOption(void *a1, const char *a2, ...)
{
  return [a1 surchargeOption];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemDarkBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkBlueColor];
}

id objc_msgSend_systemDarkGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkGreenColor];
}

id objc_msgSend_systemDarkOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkOrangeColor];
}

id objc_msgSend_systemDarkPinkColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkPinkColor];
}

id objc_msgSend_systemDarkRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkRedColor];
}

id objc_msgSend_systemDarkTealColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkTealColor];
}

id objc_msgSend_systemDarkYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkYellowColor];
}

id objc_msgSend_systemGray5Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray5Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return [a1 systemPinkColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return [a1 systemTealColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_tableViewCellHighlightedOverlayColor(void *a1, const char *a2, ...)
{
  return [a1 tableViewCellHighlightedOverlayColor];
}

id objc_msgSend_tertiarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 tertiarySystemFillColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColorProvider(void *a1, const char *a2, ...)
{
  return [a1 textColorProvider];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_thirdPartyPhotoSharingPreference(void *a1, const char *a2, ...)
{
  return [a1 thirdPartyPhotoSharingPreference];
}

id objc_msgSend_thirdPartyPhotoSharingPreferenceUpdateResult(void *a1, const char *a2, ...)
{
  return [a1 thirdPartyPhotoSharingPreferenceUpdateResult];
}

id objc_msgSend_thirdPartyPhotoSharingPreferences(void *a1, const char *a2, ...)
{
  return [a1 thirdPartyPhotoSharingPreferences];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_tintColorProvider(void *a1, const char *a2, ...)
{
  return [a1 tintColorProvider];
}

id objc_msgSend_titleColorProvider(void *a1, const char *a2, ...)
{
  return [a1 titleColorProvider];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topConstraint(void *a1, const char *a2, ...)
{
  return [a1 topConstraint];
}

id objc_msgSend_topMostPresentedViewController(void *a1, const char *a2, ...)
{
  return [a1 topMostPresentedViewController];
}

id objc_msgSend_totalOfflineDataSize(void *a1, const char *a2, ...)
{
  return [a1 totalOfflineDataSize];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_trailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 trailingConstraint];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateCrosshairConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateCrosshairConstraints];
}

id objc_msgSend_updateHandler(void *a1, const char *a2, ...)
{
  return [a1 updateHandler];
}

id objc_msgSend_updateLocateMeButtonState(void *a1, const char *a2, ...)
{
  return [a1 updateLocateMeButtonState];
}

id objc_msgSend_updateTheme(void *a1, const char *a2, ...)
{
  return [a1 updateTheme];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_userLocation(void *a1, const char *a2, ...)
{
  return [a1 userLocation];
}

id objc_msgSend_userMode(void *a1, const char *a2, ...)
{
  return [a1 userMode];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_valuesCount(void *a1, const char *a2, ...)
{
  return [a1 valuesCount];
}

id objc_msgSend_vehicles(void *a1, const char *a2, ...)
{
  return [a1 vehicles];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return [a1 visible];
}

id objc_msgSend_visualEffectStyle(void *a1, const char *a2, ...)
{
  return [a1 visualEffectStyle];
}

id objc_msgSend_walkingUserPreferences(void *a1, const char *a2, ...)
{
  return [a1 walkingUserPreferences];
}

id objc_msgSend_wantsUniqueEntityUpdateNotifications(void *a1, const char *a2, ...)
{
  return [a1 wantsUniqueEntityUpdateNotifications];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}