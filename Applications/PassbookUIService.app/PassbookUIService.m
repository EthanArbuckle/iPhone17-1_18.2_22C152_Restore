void sub_100005074(id a1)
{
  uint64_t vars8;

  PKLinkNearField();

  +[PKAuthenticator preheatAuthenticator];
}

void sub_100005C34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to re-direct url: %@ to Safari with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void sub_100005E50(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006170(id a1, PKRemoteApplicationAuthorizationViewController *a2, UITraitCollection *a3)
{
}

void sub_100006178(void *a1)
{
  if (a1)
  {
    id v2 = [a1 traitCollection];
    sub_100006254((uint64_t)a1, v2);
    sub_100006700((uint64_t)a1, v2, 1, 1);
  }
}

void sub_1000061E8(id a1, PKRemoteApplicationAuthorizationViewController *a2, UITraitCollection *a3)
{
}

void sub_1000061F0(void *a1)
{
  if (a1)
  {
    id v2 = [a1 traitCollection];
    sub_100006700((uint64_t)a1, v2, 1, 0);
  }
}

void sub_100006254(uint64_t a1, void *a2)
{
  v3 = a2;
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    v4 = [(id)a1 viewIfLoaded];
    if (!v4)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v5 = *(void **)(a1 + 184);
    BOOL v6 = v5 != 0;
    if (v5)
    {
      v7 = PKFontForDefaultDesign(v3, UIFontTextStyleTitle2);
      [v5 setFont:v7];
    }
    uint64_t v8 = *(void **)(a1 + 192);
    if (v8)
    {
      int v9 = PKFontForDefaultDesign(v3, UIFontTextStyleTitle2);
      [v8 setFont:v9];

      BOOL v6 = 1;
    }
    uint64_t v10 = *(void **)(a1 + 136);
    if (v10)
    {
      __int16 v11 = PKFontForDefaultDesign(v3, UIFontTextStyleTitle2);
      [v10 setFont:v11];

      if (!*(void *)(a1 + 160))
      {
LABEL_17:
        [v4 setNeedsLayout];
        goto LABEL_18;
      }
    }
    else if (!*(void *)(a1 + 160))
    {
      if (!v6) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    id v12 = *(void **)(a1 + 200);
    if (v12) {
      [v12 removeFromSuperview];
    }
    v13 = PKLocalizedApplicationAuthorizationString(@"PASSCODE_BUTTON");
    v14 = v3;
    PKFloatRoundToPixel();
    double v16 = v15;
    v17 = UIContentSizeCategoryAccessibilityLarge;
    v18 = [(UITraitCollection *)v14 preferredContentSizeCategory];
    NSComparisonResult v19 = UIContentSizeCategoryCompareToCategory(v18, v17);

    if (v19 == NSOrderedDescending)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_10000C3CC;
      location[3] = &unk_100014A88;
      location[4] = v17;
      uint64_t v20 = [(UITraitCollection *)v14 traitCollectionByModifyingTraits:location];

      v14 = (UITraitCollection *)v20;
    }
    v21 = PKFontForDefaultDesign(v14, UIFontTextStyleCallout);
    [v21 lineHeight];
    PKFloatRoundToPixel();
    uint64_t v35 = v22;
    long long v36 = xmmword_100012E30;
    int64x2_t v37 = vdupq_n_s64(2uLL);
    id v23 = [objc_alloc((Class)PKContinuousButton) initWithConfiguration:&v35];
    [v23 setContentEdgeInsets:v16, 25.0, 16.0 - v16, 25.0];
    v24 = [v23 titleLabel];
    [v24 setFont:v21];
    [v24 setMinimumScaleFactor:0.5];
    [v24 setTextAlignment:1];
    [v24 setLineBreakMode:4];
    [v23 setTitle:v13 forState:0];
    [v23 _setTouchInsets:-10.0, -10.0, -10.0, -10.0];
    [v23 setExclusiveTouch:1];
    [v23 sizeToFit];

    v25 = *(void **)(a1 + 200);
    *(void *)(a1 + 200) = v23;

    id v26 = *(id *)(a1 + 200);
    [v26 setAnchorPoint:0.5, 0.0];
    [v26 setUserInteractionEnabled:1];
    [v26 _setTouchInsets:-8.0, -8.0, -8.0, -8.0];

    v27 = [*(id *)(a1 + 200) layer];
    sub_100008DF0(v27);

    objc_initWeak(location, (id)a1);
    v28 = *(void **)(a1 + 200);
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    v32 = sub_10000914C;
    v33 = &unk_100014748;
    objc_copyWeak(&v34, location);
    v29 = +[UIAction actionWithHandler:&v30];
    [v28 addAction:v29 forControlEvents:64, v30, v31, v32, v33];

    [*(id *)(a1 + 160) addSubview:*(void *)(a1 + 200)];
    objc_destroyWeak(&v34);
    objc_destroyWeak(location);
    goto LABEL_17;
  }
LABEL_19:
}

void sub_1000066E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006700(uint64_t a1, void *a2, int a3, char a4)
{
  id v7 = a2;
  if (a1 && *(void *)(a1 + 128) == 1 && !*(unsigned char *)(a1 + 8))
  {
    uint64_t v8 = [(id)a1 viewIfLoaded];
    if (!v8) {
      goto LABEL_20;
    }
    BOOL v9 = [v7 userInterfaceStyle] == (id)2;
    uint64_t v10 = *(void **)(a1 + 144);
    if (v10)
    {
      unsigned int v11 = [v10 isAnimating];
      id v12 = *(void **)(a1 + 144);
      if (v12)
      {
        if ((a4 & 1) == 0)
        {
          if ([v12 style] == (id)v9) {
            goto LABEL_16;
          }
          id v12 = *(void **)(a1 + 144);
        }
        id v13 = v12;
        v14 = *(void **)(a1 + 144);
        *(void *)(a1 + 144) = 0;

        if (a3)
        {
          [v13 setAnimating:0];
          uint64_t v15 = *(void *)(a1 + 96);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000091BC;
          v21[3] = &unk_100014770;
          id v22 = v13;
          [v22 pkui_setAlpha:v15 withAnimationFactory:v21 completion:0.0];
        }
        else
        {
          [v13 removeFromSuperview];
        }
      }
    }
    else
    {
      unsigned int v11 = 0;
    }
LABEL_16:
    if (!*(void *)(a1 + 144))
    {
      id v16 = [objc_alloc((Class)LAUIPhysicalButtonView) initWithStyle:v9];
      v17 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v16;

      [*(id *)(a1 + 144) setAnimating:0];
      [*(id *)(a1 + 144) setAlpha:1.0];
      v18 = *(void **)(a1 + 144);
      NSComparisonResult v19 = PKLocalizedApplicationAuthorizationString(@"DOUBLE_CLICK_TO_USE");
      [v18 setInstruction:v19];

      uint64_t v20 = *(void *)(a1 + 144);
      if (!*(void *)(a1 + 112))
      {
        [v8 insertSubview:v20 atIndex:0];
        if (!v11) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      [v8 insertSubview:v20 aboveSubview:];
      if (v11) {
LABEL_19:
      }
        [*(id *)(a1 + 144) setAnimating:1];
    }
LABEL_20:
  }
}

void sub_10000694C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    BOOL v6 = [(id)a1 viewIfLoaded];
    if (!v6)
    {
      if (v5) {
        v5[2](v5, 1);
      }
      goto LABEL_65;
    }
    id v7 = [*(id *)(a1 + 32) copy];
    id v8 = objc_alloc_init((Class)NSMutableArray);
    BOOL v9 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v8;

    if (v5)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      unsigned int v11 = objc_retainBlock(v5);
      [v10 addObject:v11];
    }
    id v12 = *(id *)(a1 + 32);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v125 objects:v131 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v126;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v126 != v16) {
            objc_enumerationMutation(v13);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v125 + 1) + 8 * i) + 16))();
        }
        id v15 = [v13 countByEnumeratingWithState:&v125 objects:v131 count:16];
      }
      while (v15);
    }

    if (*(id *)(a1 + 32) != v12)
    {
LABEL_64:

LABEL_65:
      goto LABEL_66;
    }
    v18 = &PKRemoteApplicationAuthorizationViewController__metaData;
    if (*(unsigned char *)(a1 + 26)) {
      *(unsigned char *)(a1 + 40) = 1;
    }
    NSComparisonResult v19 = [v6 layer];
    [v19 setAllowsHitTesting:*(unsigned __int8 *)(a1 + 26)];
    [v6 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 26)];
    uint64_t v20 = *(void *)(a1 + 112);
    BOOL v21 = v20 == 0;
    if (!*(unsigned char *)(a1 + 26))
    {
      if (!v20 && !*(void *)(a1 + 160))
      {
        v95 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = 0;

        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v90 = v12;
        id v96 = [v90 countByEnumeratingWithState:&v120 objects:v130 count:16];
        if (v96)
        {
          id v97 = v96;
          uint64_t v98 = *(void *)v121;
          do
          {
            for (j = 0; j != v97; j = (char *)j + 1)
            {
              if (*(void *)v121 != v98) {
                objc_enumerationMutation(v90);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v120 + 1) + 8 * (void)j) + 16))();
            }
            id v97 = [v90 countByEnumeratingWithState:&v120 objects:v130 count:16];
          }
          while (v97);
        }
        goto LABEL_62;
      }
      BOOL v21 = 0;
      if ((a2 & 1) == 0)
      {
LABEL_55:
        v89 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = 0;

        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v90 = v12;
        id v91 = [v90 countByEnumeratingWithState:&v109 objects:v129 count:16];
        if (v91)
        {
          id v92 = v91;
          uint64_t v93 = *(void *)v110;
          do
          {
            for (k = 0; k != v92; k = (char *)k + 1)
            {
              if (*(void *)v110 != v93) {
                objc_enumerationMutation(v90);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v109 + 1) + 8 * (void)k) + 16))();
            }
            id v92 = [v90 countByEnumeratingWithState:&v109 objects:v129 count:16];
          }
          while (v92);
        }
LABEL_62:

        goto LABEL_63;
      }
LABEL_27:
      if (!v21) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
    if (!v20)
    {
      char v105 = a2;
      v107 = v19;
      id v22 = objc_alloc_init((Class)PKBackdropView);
      id v23 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v22;

      [v6 insertSubview:*(void *)(a1 + 112) atIndex:0];
      id v103 = *(id *)(a1 + 112);
      id v24 = [v103 layer];
      if (!v24) {
        goto LABEL_75;
      }
      v25 = v24;
      id v26 = sub_10000C350();
      [v26 setValue:&__kCFBooleanTrue forKey:@"inputNormalizeEdges"];
      v132[0] = v26;
      long long v27 = *((_OWORD *)&CAColorMatrixIdentity + 3);
      v133[2] = *((_OWORD *)&CAColorMatrixIdentity + 2);
      v133[3] = v27;
      v133[4] = *((_OWORD *)&CAColorMatrixIdentity + 4);
      long long v28 = *((_OWORD *)&CAColorMatrixIdentity + 1);
      v133[0] = *(_OWORD *)&CAColorMatrixIdentity;
      v133[1] = v28;
      v29 = +[CAFilter filterWithType:kCAFilterColorMatrix];
      [v29 setName:@"colorMatrix"];
      v30 = +[NSValue valueWithCAColorMatrix:v133];
      [v29 setValue:v30 forKey:@"inputColorMatrix"];

      v132[1] = v29;
      uint64_t v31 = +[NSArray arrayWithObjects:v132 count:2];
      [v25 setFilters:v31];

      NSComparisonResult v19 = v107;
      a2 = v105;
      v18 = &PKRemoteApplicationAuthorizationViewController__metaData;
    }
    if (*(void *)(a1 + 160))
    {
      if ((a2 & 1) == 0) {
        goto LABEL_55;
      }
      goto LABEL_27;
    }
    id v32 = objc_alloc_init((Class)UIView);
    v33 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v32;

    [*(id *)(a1 + 160) setAnchorPoint:0.5, 0.0];
    id v34 = [*(id *)(a1 + 160) layer];
    if (v34)
    {
      uint64_t v35 = v34;
      long long v36 = sub_10000C350();
      *(void *)&v133[0] = v36;
      int64x2_t v37 = +[NSArray arrayWithObjects:v133 count:1];
      [v35 setFilters:v37];

      id v38 = v35;
      [v38 setAllowsGroupOpacity:0];
      [v38 setAllowsGroupBlending:0];

      id v39 = +[UIColor blackColor];
      [v38 setShadowColor:[v39 CGColor]];

      [v6 addSubview:*(void *)(a1 + 160)];
      v40 = [*(id *)(a1 + 56) process];
      v102 = v40;
      if (v40) {
        [v40 auditToken];
      }
      else {
        memset(v124, 0, sizeof(v124));
      }
      char v106 = a2;
      v41 = +[LSApplicationRecord bundleRecordForAuditToken:v124 error:0];
      v42 = v41;
      v104 = v41;
      v108 = v19;
      if (v41)
      {
        uint64_t v43 = [v41 URL];
        PKScreenScale();
        double v45 = v44;
        v46 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorLargeHomeScreen];
        [v46 setScale:v45];
        v100 = (void *)v43;
        id v47 = [objc_alloc((Class)ISIcon) initWithURL:v43];
        v48 = [v47 prepareImageForDescriptor:v46];
        CGImageRef v49 = CGImageRetain((CGImageRef)[v48 CGImage]);
        if (v49)
        {
          v50 = v49;
          id v51 = [objc_alloc((Class)UIImage) initWithCGImage:v49 scale:0 orientation:v45];
          CGImageRelease(v50);
        }
        else
        {
          id v51 = 0;
        }

        v42 = v104;
        if (v51)
        {
          id v52 = [objc_alloc((Class)UIImageView) initWithImage:v51];
          v53 = *(void **)(a1 + 176);
          *(void *)(a1 + 176) = v52;

          id v54 = *(id *)(a1 + 176);
          [v54 setAnchorPoint:0.5, 0.0];
          [v54 setUserInteractionEnabled:1];
          [v54 _setTouchInsets:-8.0, -8.0, -8.0, -8.0];

          v55 = [*(id *)(a1 + 176) layer];
          sub_100008DF0(v55);

          [*(id *)(a1 + 160) addSubview:*(void *)(a1 + 176)];
        }
      }
      id v56 = objc_alloc_init((Class)UILabel);
      v57 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v56;

      id v58 = *(id *)(a1 + 184);
      [v58 setAnchorPoint:0.5, 0.0];
      [v58 setUserInteractionEnabled:1];
      [v58 _setTouchInsets:-8.0, -8.0, -8.0, -8.0];

      v59 = [*(id *)(a1 + 184) layer];
      sub_100008DF0(v59);

      v60 = *(void **)(a1 + 184);
      v61 = [v42 localizedName];
      [v60 setText:v61];

      [*(id *)(a1 + 160) addSubview:*(void *)(a1 + 184)];
      id v62 = objc_alloc_init((Class)UILabel);
      v63 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v62;

      id v64 = *(id *)(a1 + 192);
      [v64 setAnchorPoint:0.5, 0.0];
      [v64 setUserInteractionEnabled:1];
      [v64 _setTouchInsets:-8.0, -8.0, -8.0, -8.0];

      v65 = [*(id *)(a1 + 192) layer];
      sub_100008DF0(v65);
      v101 = v65;
      sub_100008EA0(v65);
      [*(id *)(a1 + 192) setNumberOfLines:0];
      v66 = *(void **)(a1 + 192);
      v67 = [*(id *)(a1 + 48) name];
      v68 = PKLocalizedApplicationAuthorizationString(@"APPLICATION_AUTHORIZATION_SUBTITLE", @"%@", v67);
      [v66 setText:v68];

      v69 = *(void **)(a1 + 192);
      v70 = +[UIColor colorWithWhite:1.0 alpha:0.6];
      [v69 setTextColor:v70];

      [*(id *)(a1 + 160) addSubview:*(void *)(a1 + 192)];
      char v71 = v106;
      if ((PKSystemApertureIsAvailable() & 1) == 0)
      {
        if (PKPearlIsAvailable()) {
          uint64_t v72 = 6;
        }
        else {
          uint64_t v72 = 3;
        }
        id v73 = [objc_alloc((Class)PKGlyphView) initWithStyle:v72];
        v74 = *(void **)(a1 + 120);
        *(void *)(a1 + 120) = v73;

        id v75 = *(id *)(a1 + 120);
        [v75 setAnchorPoint:0.5, 0.0];
        [v75 setUserInteractionEnabled:1];
        [v75 _setTouchInsets:-8.0, -8.0, -8.0, -8.0];

        v76 = [*(id *)(a1 + 120) layer];
        sub_100008DF0(v76);
        if (PKPearlIsAvailable()) {
          sub_100008EA0(v76);
        }
        [*(id *)(a1 + 160) addSubview:*(void *)(a1 + 120)];
      }
      uint64_t v77 = *(void *)(a1 + 128);
      NSComparisonResult v19 = v108;
      if (v77 == 2)
      {
        v78 = @"ACCESSIBILITY_PUSH_BUTTON_ASSISTIVE_TOUCH";
        v18 = &PKRemoteApplicationAuthorizationViewController__metaData;
      }
      else
      {
        v18 = &PKRemoteApplicationAuthorizationViewController__metaData;
        if (v77 != 3) {
          goto LABEL_52;
        }
        v78 = @"ACCESSIBILITY_PUSH_BUTTON_SWITCH_CONTROL";
      }
      uint64_t v79 = PKLocalizedPearlString(&v78->isa);
      if (v79)
      {
        v80 = (void *)v79;
        id v81 = objc_alloc_init((Class)UILabel);
        v82 = *(void **)(a1 + 136);
        *(void *)(a1 + 136) = v81;

        id v83 = *(id *)(a1 + 136);
        [v83 setAnchorPoint:0.5, 0.0];
        [v83 setUserInteractionEnabled:1];
        [v83 _setTouchInsets:-8.0, -8.0, -8.0, -8.0];

        v84 = [*(id *)(a1 + 136) layer];
        sub_100008DF0(v84);
        sub_100008EA0(v84);
        [*(id *)(a1 + 136) setNumberOfLines:0];
        [*(id *)(a1 + 136) setText:v80];
        v85 = *(void **)(a1 + 136);
        v86 = +[UIColor colorWithWhite:1.0 alpha:0.6];
        v87 = v85;
        v18 = &PKRemoteApplicationAuthorizationViewController__metaData;
        [v87 setTextColor:v86];

        char v71 = v106;
        NSComparisonResult v19 = v108;
        [*(id *)(a1 + 160) addSubview:*(void *)(a1 + 136)];
      }
LABEL_52:
      v88 = [(id)a1 traitCollection];
      sub_100006254(a1, v88);

      if ((v71 & 1) == 0) {
        goto LABEL_55;
      }
LABEL_53:
      *(unsigned char *)(a1 + SLODWORD(v18[52].weak_ivar_lyt)) ^= 1u;
      PKUIViewLayoutIfNeeded();
      *(unsigned char *)(a1 + SLODWORD(v18[52].weak_ivar_lyt)) ^= 1u;
      [v6 setNeedsLayout];
LABEL_54:
      v113 = _NSConcreteStackBlock;
      uint64_t v114 = 3221225472;
      v115 = sub_100008F18;
      v116 = &unk_100014720;
      uint64_t v117 = a1;
      id v118 = v12;
      id v119 = v6;
      PKCATrackedLayoutPerform();

LABEL_63:
      goto LABEL_64;
    }
LABEL_75:
    __break(1u);
  }
LABEL_66:
}

void sub_100007640(uint64_t a1, int a2)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8)
      || ([*(id *)(a1 + 144) setAnimating:*(unsigned char *)(a1 + 41) == 0], *(unsigned char *)(a1 + 8))
      || !*(void *)(a1 + 48))
    {
      int v4 = 0;
    }
    else
    {
      int v4 = !PKSystemApertureIsAvailable() || *(unsigned char *)(a1 + 41) != 1 || *(unsigned char *)(a1 + 40) != 0;
    }
    id v5 = [(id)a1 viewIfLoaded];
    if (v5) {
      PKUIViewLayoutIfNeeded();
    }
    sub_100008C24(a1, v4, a2, 0);
  }
}

void sub_100007888(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  if (v2[18])
  {
    [v2[18] updateFrame];
    id v2 = *(id **)(a1 + 32);
  }
  id v3 = [v2 view];
  [v3 setNeedsLayout];
}

void sub_1000082DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(v67);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000082F8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = *(unsigned char *)(a1 + 48);
  sub_100008464(*(void **)(*(void *)(a1 + 32) + 160), *(unsigned __int8 *)(*(void *)(a1 + 32) + 168), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  int v4 = *(unsigned __int8 *)(v2 + 168);
  id v14 = *(id *)(v2 + 160);
  id v5 = v3;
  if (v14)
  {
    if (v5) {
      Tracker = (void *)PKCATrackedLayoutGetTracker();
    }
    else {
      Tracker = 0;
    }
    id v7 = [Tracker beginTrackingAnimation];
    double v8 = 0.35;
    if (v4)
    {
      double v9 = 33.3333333;
    }
    else
    {
      double v8 = 0.0;
      double v9 = 0.0;
    }
    if (v4) {
      double width = 0.0;
    }
    else {
      double width = CGSizeZero.width;
    }
    if (v4) {
      double height = -16.6666667;
    }
    else {
      double height = CGSizeZero.height;
    }
    [v14 pkui_setShadowOpacity:v5 withAnimationFactory:v7 completion:v8];

    id v12 = [Tracker beginTrackingAnimation];
    [v14 pkui_setShadowRadius:v5 withAdditiveAnimationFactory:v12 completion:v9];

    id v13 = [Tracker beginTrackingAnimation];
    [v14 pkui_setShadowOffset:v5 withAdditiveAnimationFactory:v13 completion:width, height];
  }
  else
  {
    __break(1u);
  }
}

void sub_100008464(void *a1, unsigned int a2, void *a3)
{
  id v12 = a1;
  id v5 = a3;
  if (v12)
  {
    if (v5) {
      Tracker = (void *)PKCATrackedLayoutGetTracker();
    }
    else {
      Tracker = 0;
    }
    id v7 = [v12 layer];
    double v8 = v7;
    double v9 = 6.17666667;
    if (a2) {
      double v9 = 0.0;
    }
    sub_10000C220(v7, v5, v9);
    double v10 = (double)a2;
    id v11 = [Tracker beginTrackingAnimation];
    [v12 pkui_setAlpha:v5 withAnimationFactory:v11 completion:v10];
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_100008544(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    --WeakRetained[169];
  }

  return a2 == 0;
}

double sub_100008594(uint64_t a1, double a2, double a3)
{
  double v5 = *(double *)(a1 + 56);
  double v6 = round((*(double *)(a1 + 72) - a2) * 0.5);
  uint64_t v61 = 0;
  id v62 = (double *)&v61;
  double v7 = v5 + v6;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100008AF4;
  v51[3] = &unk_1000146A8;
  double v56 = a2;
  double v57 = a3;
  id v54 = v60;
  v55 = &v61;
  double v58 = v5 + v6;
  uint64_t v59 = 0;
  id v52 = *(id *)(a1 + 32);
  id v53 = *(id *)(a1 + 40);
  double v8 = objc_retainBlock(v51);
  uint64_t v9 = *(void *)(a1 + 48);
  double v10 = *(void **)(v9 + 120);
  if (v10)
  {
    [v10 frame];
    double height = v11;
    CGFloat width = v12;
    uint64_t v9 = *(void *)(a1 + 48);
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  int v14 = *(unsigned __int8 *)(v9 + 41);
  if (*(void *)(v9 + 136)) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  int v16 = v15;
  unsigned int v48 = v16;
  [*(id *)(v9 + 200) frame];
  double v50 = v18;
  double v45 = width;
  double v46 = v7;
  double v47 = v17.n128_f64[0];
  NSComparisonResult v19 = *(void **)(a1 + 48);
  double v20 = 0.0;
  if (v19[22]) {
    double v21 = 10.0;
  }
  else {
    double v21 = 0.0;
  }
  uint64_t v22 = v19[24];
  if (v19[23])
  {
    if (v22) {
      double v20 = 10.0;
    }
  }
  else
  {
    double v23 = 0.0;
    if (!v22) {
      goto LABEL_19;
    }
  }
  double v23 = 10.0;
LABEL_19:
  if (v19[15]) {
    double v24 = 10.0;
  }
  else {
    double v24 = 0.0;
  }
  if (v48) {
    double v25 = 10.0;
  }
  else {
    double v25 = 0.0;
  }
  id v26 = v62;
  v62[3] = 0.0;
  uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 120);
  v17.n128_f64[0] = v18;
  double v28 = height + 0.0;
  if (!v27) {
    double v28 = 0.0;
  }
  double v29 = -0.0;
  if (v14 == 2) {
    double v29 = v18;
  }
  double v30 = v28 + v29;
  if (v27 || v14 == 2) {
    v26[3] = v30;
  }
  v26[3] = v25 + v21 + v20 + v23 + v24 + v30;
  uint64_t v31 = *(void **)(a1 + 48);
  id v32 = (void *)v31[22];
  if (v32)
  {
    v33 = [v32 image];
    [v33 size];
    double v35 = v34;
    double v37 = v36;

    ((void (*)(void *, void, uint64_t, double, double))v8[2])(v8, *(void *)(*(void *)(a1 + 48) + 176), 1, v35, v37);
    v62[3] = v62[3] - v21;
    ((void (*)(void *, void, uint64_t, double, double))v8[2])(v8, 0, 1, 0.0, v21);
    uint64_t v31 = *(void **)(a1 + 48);
  }
  id v38 = (void *)v31[23];
  if (!v38)
  {
    v40 = (void *)v31[24];
    if (!v40) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
  [v38 sizeThatFits:a2, 1.79769313e308, v17.n128_f64[0]];
  ((void (*)(void *, void, uint64_t, double))v8[2])(v8, *(void *)(*(void *)(a1 + 48) + 184), 1, fmin(v39, a2));
  uint64_t v31 = *(void **)(a1 + 48);
  v40 = (void *)v31[24];
  if (v40)
  {
LABEL_38:
    if (v31[23])
    {
      v62[3] = v62[3] - v20;
      ((void (*)(void *, void, uint64_t, double, double))v8[2])(v8, 0, 1, 0.0, v20);
      v40 = *(void **)(*(void *)(a1 + 48) + 192);
    }
    [v40 sizeThatFits:a2, 1.79769313e308];
    ((void (*)(void *, void, uint64_t, double))v8[2])(v8, *(void *)(*(void *)(a1 + 48) + 192), 1, fmin(v41, a2));
  }
  v62[3] = v62[3] - v23;
  ((void (*)(void *, void, uint64_t, double, double))v8[2])(v8, 0, 1, 0.0, v23);
  uint64_t v31 = *(void **)(a1 + 48);
LABEL_42:
  if (v31[15])
  {
    v62[3] = v62[3] - height;
    ((void (*)(void *, void, uint64_t, double))v8[2])(v8, *(void *)(*(void *)(a1 + 48) + 120), 1, v45);
    v62[3] = v62[3] - v24;
    ((void (*)(void *, void, uint64_t, double, double))v8[2])(v8, 0, 1, 0.0, v24);
    uint64_t v31 = *(void **)(a1 + 48);
  }
  v42 = (void *)v31[17];
  if (v42)
  {
    [v42 sizeThatFits:a2, 1.79769313e308, v17.n128_f64[0]];
    ((void (*)(void *, void, void, double))v8[2])(v8, *(void *)(*(void *)(a1 + 48) + 136), v48, fmin(v43, a2));
    v62[3] = v62[3] - v25;
    ((void (*)(void *, void, uint64_t, double, double))v8[2])(v8, 0, 1, 0.0, v25);
  }
  v62[3] = 0.0;
  ((void (*)(void *, void, BOOL, double, double, __n128))v8[2])(v8, *(void *)(*(void *)(a1 + 48) + 200), v14 == 2, v47, v50, v17);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v61, 8);
  return v46;
}

void sub_100008AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_100008AF4(uint64_t a1, void *a2, unsigned int a3, double a4, double a5)
{
  id v8 = a2;
  if ((a3 & 1) == 0)
  {
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(double *)(v9 + 24);
  double v11 = *(double *)(a1 + 72) - v10;
  double v12 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v13 = fmax(v11 - v12, 0.0);
  if (v12 > 0.0) {
    double v11 = v13;
  }
  *(double *)(v9 + 24) = fmin(a5, v11) + v10;
  if (v8)
  {
LABEL_7:
    id v24 = v8;
    PKSizeAlignedInRect();
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    sub_100008464(v24, a3, *(void **)(a1 + 32));
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = [*(id *)(a1 + 40) beginTrackingAnimation];
    [v24 pkui_setFrame:v22 withAdditiveAnimationFactory:v23 completion:v15, v17, v19, v21];

    id v8 = v24;
  }
LABEL_8:
}

void sub_100008C24(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 26) == a2)
    {
      if (!v7) {
        goto LABEL_13;
      }
      id v8 = *(void **)(a1 + 32);
      id v11 = v7;
      if (v8)
      {
        id v9 = objc_retainBlock(v7);
        [v8 addObject:v9];
      }
      else
      {
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      }
    }
    else
    {
      id v11 = v7;
      double v10 = [(id)a1 viewIfLoaded];
      if (v10)
      {
        if (a3) {
          PKUIViewLayoutIfNeeded();
        }
        [v10 setNeedsLayout];
      }
      *(unsigned char *)(a1 + 26) = a2;
      sub_10000694C(a1, a3, v11);
    }
    id v7 = v11;
  }
LABEL_13:
}

void sub_100008D34(unsigned char *a1, int a2, int a3)
{
  if (a1)
  {
    char v3 = a2;
    if (a1[41] != a2)
    {
      id v6 = [a1 viewIfLoaded];
      if (v6)
      {
        if (a3) {
          PKUIViewLayoutIfNeeded();
        }
        [v6 setNeedsLayout];
      }
      a1[41] = v3;
      sub_100007640((uint64_t)a1, a3);
    }
  }
}

void sub_100008DF0(void *a1)
{
  id v1 = a1;
  if (!v1) {
    __break(1u);
  }
  uint64_t v2 = v1;
  char v3 = sub_10000C350();
  double v5 = v3;
  int v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [v2 setFilters:v4];
}

void sub_100008EA0(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v3 = v1;
    uint64_t v2 = +[CAFilter filterWithType:kCAFilterPlusL];
    [v3 setCompositingFilter:v2];
  }
  else
  {
    __break(1u);
  }
}

void sub_100008F18(id *a1)
{
  Tracker = (void *)PKCATrackedLayoutGetTracker();
  if (Tracker)
  {
    objc_initWeak(&location, a1[4]);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000900C;
    v3[3] = &unk_1000146F8;
    objc_copyWeak(&v5, &location);
    id v4 = a1[5];
    [Tracker addCompletion:v3];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  [a1[6] layoutIfNeeded];
}

void sub_100008FF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000900C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 4);
    if (v4 == *(void **)(a1 + 32))
    {
      *((void *)WeakRetained + 4) = 0;

      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 32);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

void sub_10000914C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 8) && *((unsigned char *)WeakRetained + 72))
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[8] fallbackToSystemPasscodeUI];
    id WeakRetained = v2;
  }
}

id sub_1000091BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void sub_1000091C4(id val)
{
  if (!val || *((unsigned char *)val + 8)) {
    return;
  }
  uint64_t v2 = (void *)*((void *)val + 6);
  if (!v2 || *((unsigned char *)val + 73) || *((unsigned char *)val + 72)) {
    goto LABEL_26;
  }
  if (*((void *)val + 16) == -1)
  {
    objc_initWeak(&location, val);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000095AC;
    v24[3] = &unk_100014798;
    objc_copyWeak(&v25, &location);
    id v7 = objc_retainBlock(v24);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000095F4;
    v22[3] = &unk_1000147C0;
    objc_copyWeak(&v23, &location);
    uint64_t v8 = objc_retainBlock(v22);
    AccesibilityIntentUnavailable = (void *)PKAlertCreateAccesibilityIntentUnavailable();
    [val presentViewController:AccesibilityIntentUnavailable animated:1 completion:0];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    return;
  }
  id v3 = [v2 type];
  id v4 = v3;
  uint64_t v5 = (uint64_t)v3;
  if (v3)
  {
    if (v3 != (id)1) {
      goto LABEL_26;
    }
    uint64_t v5 = 2;
  }
  id v6 = +[PKAuthenticator currentStateForPolicy:v5];
  if ((v6 & 1) == 0)
  {
    sub_10000A1A4((uint64_t)val, 0);
    return;
  }
  uint64_t v10 = 1;
  if (v4)
  {
    if (v4 == (id)1)
    {
      uint64_t v10 = 0;
      goto LABEL_19;
    }
LABEL_26:
    __break(1u);
    return;
  }
LABEL_19:
  id v11 = [objc_alloc((Class)PKAuthenticatorEvaluationRequest) initWithPolicy:v5];
  long long v12 = [*((id *)val + 6) externalizedContext];
  [v11 setExternalizedContext:v12];

  [v11 setInitialAuthenticatorState:v6];
  long long v13 = PKLocalizedApplicationAuthorizationString(@"PASSCODE_TITLE");
  [v11 setPasscodeTitle:v13];

  [v11 setAssumeUserIntentAvailable:v10];
  *((unsigned char *)val + 72) = 1;
  if (v10)
  {
    uint64_t v14 = 0;
  }
  else
  {
    int IsAvailable = PKUserIntentIsAvailable();
    uint64_t v14 = 3;
    if (!IsAvailable) {
      uint64_t v14 = 0;
    }
  }
  *((void *)val + 10) = v14;
  if (!*((void *)val + 8))
  {
    id v16 = [objc_alloc((Class)PKAuthenticator) initWithDelegate:val];
    double v17 = (void *)*((void *)val + 8);
    *((void *)val + 8) = v16;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, val);
  double v19 = (void *)*((void *)val + 8);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000096F0;
  v20[3] = &unk_1000147E8;
  objc_copyWeak(v21, &location);
  v21[1] = *(id *)&Current;
  [v19 evaluateRequest:v11 withCompletion:v20];
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void sub_10000957C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1000095AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    sub_10000A1A4((uint64_t)WeakRetained, 0);
    id WeakRetained = v2;
  }
}

void sub_1000095F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    sub_10000A1A4((uint64_t)WeakRetained, 0);
    id v6 = objc_alloc_init((Class)_LSOpenConfiguration);
    [v6 setSensitive:1];
    uint64_t v8 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    id v9 = &__kCFBooleanTrue;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v6 setFrontBoardOptions:v7];

    PKOpenApplication();
  }
}

void sub_1000096F0(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 8))
  {
    if (!*((unsigned char *)WeakRetained + 72))
    {
      __break(1u);
      JUMPOUT(0x1000097FCLL);
    }
    *((unsigned char *)WeakRetained + 72) = 0;
    int IsAvailable = PKUserIntentIsAvailable();
    uint64_t v6 = 3;
    if (!IsAvailable) {
      uint64_t v6 = 0;
    }
    v4[10] = v6;
    switch((unint64_t)[v8 result])
    {
      case 0uLL:
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        sub_10000981C((uint64_t)v4, v8, fmax(Current - *(double *)(a1 + 40), 0.0));
        break;
      case 1uLL:
        sub_1000091C4(v4);
        break;
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        sub_10000A1A4((uint64_t)v4, 0);
        break;
      default:
        break;
    }
  }
}

void sub_10000981C(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  if (!a1)
  {
LABEL_22:

    return;
  }
  if (!*(unsigned char *)(a1 + 73))
  {
    *(unsigned char *)(a1 + 73) = 1;
    if (!*(unsigned char *)(a1 + 8))
    {
      objc_initWeak(&location, (id)a1);
      uint64_t v6 = *(void **)(a1 + 120);
      BOOL v7 = a3 >= 0.1 || v6 == 0;
      if (!v7 && ([v6 fadeOnRecognized] & 1) == 0) {
        [*(id *)(a1 + 120) setFadeOnRecognized:1];
      }
      if (*(void *)(a1 + 120)) {
        id v8 = dispatch_group_create();
      }
      else {
        id v8 = 0;
      }
      if ([v5 biometricMatch])
      {
        +[PKGlyphView invokeSuccessFeedback];
        if (*(void *)(a1 + 120))
        {
          dispatch_group_enter(v8);
          id v9 = *(void **)(a1 + 120);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100009BEC;
          v24[3] = &unk_100014770;
          id v25 = v8;
          [v9 setState:12 animated:1 completionHandler:v24];
        }
      }
      if (v8)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100009BF4;
        block[3] = &unk_100014798;
        objc_copyWeak(&v23, &location);
        dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v23);
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100009C60;
      v19[3] = &unk_100014858;
      uint64_t v10 = v8;
      double v20 = v10;
      objc_copyWeak(&v21, &location);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100009EA8;
      v16[3] = &unk_100014880;
      id v11 = objc_retainBlock(v19);
      id v17 = v11;
      objc_copyWeak(&v18, &location);
      long long v12 = (void *)sub_100009FB0(a1, v16);
      if (v12)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10000A078;
        v13[3] = &unk_1000148D0;
        uint64_t v14 = v11;
        objc_copyWeak(&v15, &location);
        [v12 performActionWithReply:v13];
        objc_destroyWeak(&v15);
      }
      else
      {
        ((void (*)(void *, uint64_t, void))v11[2])(v11, a1, 0);
      }

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
    }
    goto LABEL_22;
  }
  __break(1u);
}

void sub_100009BA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_100009BEC(uint64_t a1)
{
}

void sub_100009BF4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 8))
  {
    id v2 = WeakRetained;
    [WeakRetained[15] setState:7 animated:1 completionHandler:0];
    id WeakRetained = v2;
  }
}

void sub_100009C60(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5 && !*((unsigned char *)v5 + 8))
  {
    BOOL v7 = +[UIApplication sharedApplication];
    [v7 pkui_resetSharedRootAuthenticationContext];

    id v8 = (void *)v6[8];
    if (v8)
    {
      [v8 invalidate];
      id v9 = (void *)v6[8];
      v6[8] = 0;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100009DF4;
    v16[3] = &unk_100014808;
    char v17 = a3;
    uint64_t v10 = objc_retainBlock(v16);
    id v11 = v10;
    long long v12 = *(NSObject **)(a1 + 32);
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009E38;
      block[3] = &unk_100014830;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      id v14 = v11;
      dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v15);
    }
    else
    {
      ((void (*)(void *, void *))v10[2])(v10, v6);
    }
  }
}

void sub_100009DF4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = v2;
    sub_10000A1A4((uint64_t)v2, 0);
    id v2 = v3;
  }
}

uint64_t sub_100009E38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[8]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return _objc_release_x1();
}

void sub_100009EA8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100009F50;
  v2[3] = &unk_100014880;
  id v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v4);
}

void sub_100009F50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, WeakRetained, 0);
}

uint64_t sub_100009FB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 16);
    if (v3)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10000C090;
      v7[3] = &unk_100014A60;
      id v8 = v3;
      a1 = [v5 remoteObjectProxyWithErrorHandler:v7];
    }
    else
    {
      a1 = [v5 remoteObjectProxy];
    }
  }

  return a1;
}

void sub_10000A078(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A130;
  block[3] = &unk_1000148A8;
  id v5 = *(id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
}

void sub_10000A130(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, WeakRetained, *(unsigned __int8 *)(a1 + 48));
}

void sub_10000A1A4(uint64_t a1, char a2)
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    *(unsigned char *)(a1 + 8) = 1;
    id v4 = +[UIApplication sharedApplication];
    [v4 pkui_resetSharedRootAuthenticationContext];

    id v5 = *(void **)(a1 + 64);
    if (v5)
    {
      [v5 invalidate];
      id v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;
    }
    [*(id *)(a1 + 144) setAnimating:0];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000A56C;
    v23[3] = &unk_100014808;
    char v24 = a2;
    char v7 = objc_retainBlock(v23);
    id v8 = v7;
    if (*(unsigned char *)(a1 + 26))
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): dismissing.", (uint8_t *)&buf, 0xCu);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x2020000000;
      UIBackgroundTaskIdentifier v27 = UIBackgroundTaskInvalid;
      uint64_t v10 = +[UIApplication sharedApplication];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000A6A8;
      v22[3] = &unk_1000148F8;
      void v22[4] = &buf;
      id v11 = [v10 beginBackgroundTaskWithExpirationHandler:v22];
      *(void *)(*((void *)&buf + 1) + 24) = v11;

      objc_initWeak(&location, (id)a1);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000A724;
      v17[3] = &unk_100014948;
      objc_copyWeak(&v20, &location);
      id v18 = v8;
      p_long long buf = &buf;
      long long v12 = objc_retainBlock(v17);
      long long v13 = [(id)a1 presentedViewController];
      if (v13)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10000A91C;
        v14[3] = &unk_100014880;
        id v15 = v12;
        objc_copyWeak(&v16, &location);
        [(id)a1 dismissViewControllerAnimated:1 completion:v14];
        objc_destroyWeak(&v16);
      }
      else
      {
        ((void (*)(void *, uint64_t))v12[2])(v12, a1);
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      ((void (*)(void *, uint64_t))v7[2])(v7, a1);
    }
  }
}

void sub_10000A524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v24 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10000A56C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): invalidating.", (uint8_t *)&v11, 0xCu);
  }

  id v5 = v3;
  id v6 = v5;
  if (*(unsigned char *)(a1 + 32) != 1)
  {
    char v7 = [v5 _remoteViewControllerProxy];
    [v7 invalidate];
  }
  [v6 dismissViewControllerAnimated:0 completion:0];
  id v8 = (void *)v6[2];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = (void *)v6[2];
    v6[2] = 0;

    if (*(unsigned char *)(a1 + 32) != 2) {
      [v9 invalidate];
    }
  }
}

void sub_10000A6A8(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    uint64_t v2 = +[UIApplication sharedApplication];
    [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

void sub_10000A724(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A858;
    v7[3] = &unk_100014920;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    sub_100008C24((uint64_t)v3, 0, 1, v7);

    objc_destroyWeak(&v10);
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    id v6 = +[UIApplication sharedApplication];
    [v6 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

void sub_10000A844(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A858(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 48))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    uint64_t v2 = +[UIApplication sharedApplication];
    [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  }

  return _objc_release_x1();
}

void sub_10000A91C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

void sub_10000AF80(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "PKRemoteApplicationAuthorizationViewController (%p): ui-connection %p remotely interrupted.", buf, 0x16u);
  }

  [*(id *)(a1 + 40) invalidate];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B09C;
  block[3] = &unk_100014970;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000B09C(uint64_t a1)
{
}

void sub_10000B0A8(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "PKRemoteApplicationAuthorizationViewController (%p): ui-connection %p remotely invalidated.", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B1BC;
  block[3] = &unk_100014970;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000B1BC(uint64_t a1)
{
}

void sub_10000B5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B62C(uint64_t a1, void *a2, void *a3, void *a4)
{
  val = a2;
  id v7 = a3;
  id v8 = a4;
  if (val && !*((unsigned char *)val + 8))
  {
    if (v7 && v8)
    {
      id v9 = [val view];
      objc_storeStrong(val + 6, a3);
      objc_storeStrong(val + 7, a4);
      sub_100007640((uint64_t)val, 1);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      sub_1000091C4(val);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      sub_10000A1A4((uint64_t)val, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000B754(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000B7FC;
  v2[3] = &unk_100014880;
  id v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v4);
}

void sub_10000B7FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id, void, void))(v1 + 16))(v1, WeakRetained, 0, 0);
}

void sub_10000B860(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B950;
  v9[3] = &unk_1000149E8;
  id v12 = *(id *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v13);
}

void sub_10000B950(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, WeakRetained, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10000BD58(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_100008D34(*(unsigned char **)(a1 + 32), a2, 1);
  id v7 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v7) {
    [v7 setState:a3 animated:1 completionHandler:0];
  }
  if (a4 && (PKPearlIsAvailable() & 1) == 0)
  {
    AudioServicesPlaySystemSound(0x573u);
  }
}

uint64_t sub_10000BFCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000C090(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C220(void *a1, void *a2, double a3)
{
  id v14 = a1;
  id v5 = a2;
  if (v14)
  {
    id v6 = [v14 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
    id v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      double v9 = v8;
    }
    else
    {
      double v9 = 0.0;
    }
    if (v9 != a3)
    {
      if (v5)
      {
        Tracker = (void *)PKCATrackedLayoutGetTracker();
        id v11 = [v5 springAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
        [v11 pkui_updateForAdditiveAnimationFromScalar:v9 toScalar:a3];
        [Tracker trackAnimation:v11];
        id v12 = [v14 pkui_addAdditiveAnimation:v11];
      }
      id v13 = +[NSNumber numberWithDouble:a3];
      [v14 setValue:v13 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    }
  }
  else
  {
    __break(1u);
  }
}

void *sub_10000C350()
{
  v0 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
  [v0 setName:@"gaussianBlur"];
  uint64_t v1 = +[NSNumber numberWithDouble:0.0];
  [v0 setValue:v1 forKey:@"inputRadius"];

  return v0;
}

id sub_10000C3CC(uint64_t a1, void *a2)
{
  return [a2 setPreferredContentSizeCategory:*(void *)(a1 + 32)];
}

void sub_10000C9C0(uint64_t a1, char a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CA94;
  block[3] = &unk_100014AD8;
  char v13 = a2;
  id v9 = a3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000CA94(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32))
  {
    id v5 = [objc_alloc((Class)PKPaymentSetupNavigationController) initWithProvisioningController:*(void *)(a1 + 40) context:0];
    [v5 setPaymentSetupMode:1];
    [v5 setCustomFormSheetPresentationStyleForiPad];
    [v5 setAllowsManualEntry:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 40));
    [v5 setSetupDelegate:WeakRetained];

    [v5 setShowsWelcomeViewController:0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000CC7C;
    v7[3] = &unk_100014AB0;
    id v8 = v5;
    id v9 = *(id *)(a1 + 56);
    id v4 = v5;
    [v4 preflightWithCompletion:v7];
  }
  else
  {
    uint64_t v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment associateCredential failed for local device with error:%@", buf, 0xCu);
    }
    id v4 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:*(void *)(a1 + 32)];
    [v4 setModalInPresentation:1];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_10000CC7C(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalInPresentation:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

int main(int argc, const char **argv, const char **envp)
{
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v7, v9);

  return (int)argv;
}

void sub_10000CE00(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "PKRemoteApplicationAuthorizationViewController (%p): failed to create listener endpoint.", (uint8_t *)&v2, 0xCu);
}

void sub_10000CE78(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "PKRemoteApplicationAuthorizationViewController (%p): failed to create ui-connection.", (uint8_t *)&v2, 0xCu);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return _CGImageRetain(image);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t LAUIPhysicalButtonNormalizedFrame()
{
  return _LAUIPhysicalButtonNormalizedFrame();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PKApplicationAuthorizationViewServiceInterface_Remote()
{
  return _PKApplicationAuthorizationViewServiceInterface_Remote();
}

uint64_t PKApplicationAuthorizationViewServiceInterface_Service()
{
  return _PKApplicationAuthorizationViewServiceInterface_Service();
}

uint64_t PKCATrackedLayoutGetTracker()
{
  return _PKCATrackedLayoutGetTracker();
}

uint64_t PKCATrackedLayoutIsAnimated()
{
  return _PKCATrackedLayoutIsAnimated();
}

uint64_t PKDeviceLocked()
{
  return _PKDeviceLocked();
}

uint64_t PKFloatRoundToPixel()
{
  return _PKFloatRoundToPixel();
}

uint64_t PKLinkNearField()
{
  return _PKLinkNearField();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKPearlIsAvailable()
{
  return _PKPearlIsAvailable();
}

uint64_t PKRectRoundToPixel()
{
  return _PKRectRoundToPixel();
}

uint64_t PKRemoteNetworkPaymentEnabled()
{
  return _PKRemoteNetworkPaymentEnabled();
}

uint64_t PKScreenScale()
{
  return _PKScreenScale();
}

uint64_t PKSizeAlignedInRect()
{
  return _PKSizeAlignedInRect();
}

uint64_t PKSystemApertureIsAvailable()
{
  return _PKSystemApertureIsAvailable();
}

uint64_t PKUserIntentIsAvailable()
{
  return _PKUserIntentIsAvailable();
}

uint64_t PKValidateIssuerBindingData()
{
  return _PKValidateIssuerBindingData();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKOpenApplication()
{
  return PKOpenApplication();
}

uint64_t PKCurrencyAmountCreate(NSDecimalNumber *a1, NSString *a2, uint64_t a3)
{
  return PKCurrencyAmountCreate(a1, a2, a3);
}

uint64_t PKFontForDefaultDesign(UITraitCollection *a1, NSString *a2)
{
  return PKFontForDefaultDesign(a1, a2);
}

uint64_t PKLocalizedPearlString(NSString *a1)
{
  return PKLocalizedPearlString(a1);
}

uint64_t PKUIViewLayoutIfNeeded()
{
  return PKUIViewLayoutIfNeeded();
}

uint64_t PKCATrackedLayoutPerform()
{
  return PKCATrackedLayoutPerform();
}

uint64_t PKLocalizedApplicationAuthorizationString(NSString *a1)
{
  return PKLocalizedApplicationAuthorizationString(a1);
}

uint64_t PKLocalizedApplicationAuthorizationString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedApplicationAuthorizationString(a1, a2);
}

uint64_t PKAlertCreateAccesibilityIntentUnavailable()
{
  return PKAlertCreateAccesibilityIntentUnavailable();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CAColorMatrixValue(void *a1, const char *a2, ...)
{
  return [a1 CAColorMatrixValue];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__originatingProcess(void *a1, const char *a2, ...)
{
  return [a1 _originatingProcess];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_beginTrackingAnimation(void *a1, const char *a2, ...)
{
  return [a1 beginTrackingAnimation];
}

id objc_msgSend_biometricMatch(void *a1, const char *a2, ...)
{
  return [a1 biometricMatch];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return [a1 externalizedContext];
}

id objc_msgSend_fadeOnRecognized(void *a1, const char *a2, ...)
{
  return [a1 fadeOnRecognized];
}

id objc_msgSend_fallbackToSystemPasscodeUI(void *a1, const char *a2, ...)
{
  return [a1 fallbackToSystemPasscodeUI];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_fixedCoordinateSpace(void *a1, const char *a2, ...)
{
  return [a1 fixedCoordinateSpace];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fragment(void *a1, const char *a2, ...)
{
  return [a1 fragment];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invokeSuccessFeedback(void *a1, const char *a2, ...)
{
  return [a1 invokeSuccessFeedback];
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return [a1 isAnimating];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return [a1 isBeingDismissed];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_passbookUIServiceDidLaunch(void *a1, const char *a2, ...)
{
  return [a1 passbookUIServiceDidLaunch];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_presentationTarget(void *a1, const char *a2, ...)
{
  return [a1 presentationTarget];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_setCustomFormSheetPresentationStyleForiPad(void *a1, const char *a2, ...)
{
  return [a1 setCustomFormSheetPresentationStyleForiPad];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shouldDismissInSwitcher(void *a1, const char *a2, ...)
{
  return [a1 shouldDismissInSwitcher];
}

id objc_msgSend_shouldDismissOnUILock(void *a1, const char *a2, ...)
{
  return [a1 shouldDismissOnUILock];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_traitOverrides(void *a1, const char *a2, ...)
{
  return [a1 traitOverrides];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateFrame(void *a1, const char *a2, ...)
{
  return [a1 updateFrame];
}

id objc_msgSend_userIntentStyle(void *a1, const char *a2, ...)
{
  return [a1 userIntentStyle];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}