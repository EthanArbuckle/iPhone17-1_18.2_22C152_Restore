@interface PHBottomBarButtonConfiguration
+ (UIColor)systemTintColor;
+ (UIColor)voipTintColor;
+ (double)defaultHeight;
+ (double)defaultWidth;
+ (double)smallHeight;
+ (double)smallWidth;
+ (id)bottomBarGlyphWithSymbolType:(int64_t)a3 sizeCategory:(int64_t)a4;
+ (id)bottomBarImageWithName:(id)a3 color:(id)a4;
+ (id)imageColorForState:(unint64_t)a3;
+ (id)imageForAction:(int64_t)a3 callState:(int64_t)a4;
+ (id)textStyleForSizeCategory:(int64_t)a3;
+ (int64_t)symbolScaleForSymbolType:(int64_t)a3 sizeCategory:(int64_t)a4;
+ (int64_t)weightForSymbolType:(int64_t)a3;
- (NSString)accessibilityIdentifier;
- (NSString)title;
- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3;
- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5;
- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 captureView:(id)a6;
- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 sizeCategory:(int64_t)a6;
- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 sizeCategory:(int64_t)a6 captureView:(id)a7;
- (UIColor)backgroundColor;
- (UIColor)highlightedColor;
- (UIColor)selectedColor;
- (UIColorEffect)colorEffect;
- (UIImage)icon;
- (UIImage)selectedIcon;
- (UIVisualEffect)backgroundMaterial;
- (_UIVisualEffectBackdropView)captureView;
- (double)diameter;
- (int64_t)action;
- (int64_t)callState;
- (int64_t)sizeCategory;
@end

@implementation PHBottomBarButtonConfiguration

+ (double)defaultHeight
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (!_os_feature_enabled_impl() || v3 == (id)1)
  {
    unint64_t v12 = +[PHUIConfiguration screenSize] - 10;
    if (v12 >= 6)
    {
      if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6)
      {
        return 82.0;
      }
      else
      {
        unint64_t v13 = +[PHUIConfiguration inCallBottomBarSpacing];
        double result = 72.0;
        if (v13 == 3) {
          return 82.0;
        }
      }
    }
    else
    {
      return dbl_1002043D0[v12];
    }
  }
  else
  {
    v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    if (v6 >= v8) {
      double v9 = v8;
    }
    else {
      double v9 = v6;
    }
    float v10 = v9 * 0.1976;
    return roundf(v10);
  }
  return result;
}

+ (double)defaultWidth
{
  v2 = objc_opt_class();

  [v2 defaultHeight];
  return result;
}

+ (double)smallHeight
{
  return dbl_1002043C0[(id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)5];
}

+ (double)smallWidth
{
  v2 = objc_opt_class();

  [v2 smallHeight];
  return result;
}

+ (UIColor)systemTintColor
{
  return +[UIColor systemGreenColor];
}

+ (UIColor)voipTintColor
{
  return +[UIColor colorWithRed:0.203921569 green:0.470588235 blue:0.964705882 alpha:1.0];
}

+ (id)imageColorForState:(unint64_t)a3
{
  if (a3 == 4)
  {
    id v3 = +[UIColor blackColor];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = +[UIColor whiteColor];
  }

  return v3;
}

+ (id)imageForAction:(int64_t)a3 callState:(int64_t)a4
{
  if (a3 == 15 && a4 == 1)
  {
    v4 = +[UIColor whiteColor];
    CFStringRef v5 = @"end_call_voip";
LABEL_7:
    double v6 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:v5 color:v4];
LABEL_9:

    goto LABEL_10;
  }
  if (a3 == 22)
  {
    v4 = +[TUCallCenter sharedInstance];
    double v7 = [v4 routeController];
    double v6 = [v7 audioRouteGlyph];

    goto LABEL_9;
  }
  if (a3 == 21)
  {
    v4 = +[UIColor whiteColor];
    CFStringRef v5 = @"icon-mute-small";
    goto LABEL_7;
  }
  double v6 = 0;
LABEL_10:

  return v6;
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 sizeCategory:(int64_t)a6 captureView:(id)a7
{
  id obj = a7;
  unint64_t v12 = [(id)objc_opt_class() imageColorForState:0];
  unint64_t v13 = +[UIDevice currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  int v15 = _os_feature_enabled_impl();
  if (v14 == (id)1) {
    int v16 = 0;
  }
  else {
    int v16 = v15;
  }
  +[PHUIConfiguration ambientInCallControlSize];
  double v18 = v17;
  switch(a3)
  {
    case 1:
      v24 = +[NSBundle mainBundle];
      v22 = [v24 localizedStringForKey:@"ACCEPT" value:&stru_100285990 table:@"BottomBar"];

      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      if (a5 == 1)
      {
        v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:10 sizeCategory:a6];
        uint64_t v25 = [(id)objc_opt_class() voipTintColor];
        goto LABEL_87;
      }
      if (a6 != 1 && ((v16 ^ 1) & 1) == 0 && v18 != a4)
      {
        uint64_t v29 = +[UIImage tpImageForSymbolType:1 textStyle:UIFontTextStyleTitle1 scale:2 isStaticSize:1];
        goto LABEL_13;
      }
      uint64_t v27 = 1;
      goto LABEL_12;
    case 2:
      int64_t v100 = a5;
      v102 = v12;
      v26 = +[NSBundle mainBundle];
      v22 = [v26 localizedStringForKey:@"ACCEPT" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v27 = 30;
      goto LABEL_11;
    case 3:
      int64_t v100 = a5;
      v102 = v12;
      v28 = +[NSBundle mainBundle];
      v22 = [v28 localizedStringForKey:@"ACCEPT" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v27 = 5;
LABEL_11:
      int64_t v101 = a6;
LABEL_12:
      uint64_t v29 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:v27 sizeCategory:a6];
LABEL_13:
      v21 = (void *)v29;
      uint64_t v25 = [(id)objc_opt_class() systemTintColor];
      goto LABEL_87;
    case 4:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      switch(a5)
      {
        case 1:
          v30 = @"end_voip_accept_voip";
          break;
        case 2:
          unint64_t v91 = +[PHUIConfiguration inCallBottomBarAssetSize];
          v92 = @"end_accept";
          if (v91 == 3) {
            v92 = @"end_accept_large";
          }
          v30 = v92;
          break;
        case 3:
          v30 = @"end_accept_voip";
          break;
        case 4:
          v30 = @"end_voip_accept";
          break;
        default:
          v30 = 0;
          break;
      }
      v93 = +[NSBundle mainBundle];
      v94 = v93;
      CFStringRef v95 = @"END_+_ACCEPT";
      goto LABEL_103;
    case 5:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      if ((unint64_t)(a5 - 1) > 3) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = (uint64_t)*(&off_10027DFB0 + a5 - 1);
      }
      v83 = +[NSBundle mainBundle];
      v22 = [v83 localizedStringForKey:@"ENDHOLD_+_ACCEPT" value:&stru_100285990 table:@"BottomBar"];

      v21 = +[UIImage imageNamed:v31];
      uint64_t v25 = +[UIColor clearColor];
      goto LABEL_87;
    case 6:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      switch(a5)
      {
        case 1:
        case 3:
          v30 = @"hold_accept_voip";
          break;
        case 2:
        case 4:
          unint64_t v88 = +[PHUIConfiguration inCallBottomBarAssetSize];
          v89 = @"hold_accept";
          if (v88 == 3) {
            v89 = @"hold_accept_large";
          }
          v30 = v89;
          break;
        default:
          v30 = 0;
          break;
      }
      v93 = +[NSBundle mainBundle];
      v94 = v93;
      CFStringRef v95 = @"HOLD_+_ACCEPT";
LABEL_103:
      v22 = [v93 localizedStringForKey:v95 value:&stru_100285990 table:@"BottomBar"];

      v21 = +[UIImage imageNamed:v30];
      uint64_t v50 = +[UIColor clearColor];
      goto LABEL_104;
    case 7:
      v32 = +[NSBundle mainBundle];
      v22 = [v32 localizedStringForKey:@"DECLINE" value:&stru_100285990 table:@"BottomBar"];

      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      {
        uint64_t v33 = 11;
      }
      else
      {
        if (a6 != 1 && ((v16 ^ 1) & 1) == 0 && v18 != a4)
        {
          uint64_t v84 = +[UIImage tpImageForSymbolType:2 textStyle:UIFontTextStyleTitle1 scale:2 isStaticSize:1];
          goto LABEL_86;
        }
        uint64_t v33 = 2;
      }
LABEL_85:
      uint64_t v84 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:v33 sizeCategory:a6];
LABEL_86:
      v21 = (void *)v84;
      uint64_t v25 = +[UIColor systemRedColor];
      goto LABEL_87;
    case 8:
      int64_t v100 = a5;
      v102 = v12;
      v34 = +[NSBundle mainBundle];
      v22 = [v34 localizedStringForKey:@"DECLINE" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v33 = 8;
      int64_t v101 = a6;
      goto LABEL_85;
    case 9:
      int64_t v100 = a5;
      v102 = v12;
      v35 = +[NSBundle mainBundle];
      v22 = [v35 localizedStringForKey:@"SEND_MESSAGE" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v36 = 14;
      goto LABEL_58;
    case 10:
      int64_t v100 = a5;
      v102 = v12;
      v37 = +[NSBundle mainBundle];
      v22 = [v37 localizedStringForKey:@"SCREENING_BLOCK" value:&stru_100285990 table:@"BottomBar"];

      int64_t v101 = a6;
      v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:15 sizeCategory:a6];
      uint64_t v25 = +[UIColor systemGray3Color];
      goto LABEL_87;
    case 11:
      int64_t v100 = a5;
      v102 = v12;
      v38 = +[NSBundle mainBundle];
      v22 = [v38 localizedStringForKey:@"SCREENING_STOP" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v36 = 9;
      goto LABEL_58;
    case 12:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v39 = +[UIColor whiteColor];
      v107[0] = v39;
      v40 = +[UIColor clearColor];
      v107[1] = v40;
      v41 = +[NSArray arrayWithObjects:v107 count:2];
      v21 = +[UIImage tpImageForSymbolType:14 textStyle:UIFontTextStyleTitle2 scale:1 paletteColors:v41 isStaticSize:1];

      v42 = +[NSBundle mainBundle];
      v22 = [v42 localizedStringForKey:@"SEND_MESSAGE" value:&stru_100285990 table:@"BottomBar"];

      goto LABEL_46;
    case 13:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v43 = +[NSBundle mainBundle];
      v22 = [v43 localizedStringForKey:@"CALL_BACK_LATER" value:&stru_100285990 table:@"BottomBar"];

      v44 = +[UIColor whiteColor];
      v105[0] = v44;
      v45 = +[UIColor clearColor];
      v105[1] = v45;
      v46 = +[NSArray arrayWithObjects:v105 count:2];
      v21 = +[UIImage tpImageForSymbolType:39 textStyle:UIFontTextStyleTitle2 scale:1 paletteColors:v46 isStaticSize:1];

      goto LABEL_46;
    case 14:
    case 16:
    case 17:
    case 23:
    case 30:
    case 31:
      v19 = +[UIColor clearColor];
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      goto LABEL_115;
    case 15:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      if (a5 == 1)
      {
        v47 = +[UIColor whiteColor];
        v21 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:@"end_call_voip" color:v47];
      }
      else
      {
        v85 = +[UIDevice currentDevice];
        id v86 = [v85 userInterfaceIdiom];

        if (!_os_feature_enabled_impl() || v86 == (id)1)
        {
          uint64_t v87 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:2 sizeCategory:a6];
        }
        else
        {
          uint64_t v87 = +[UIImage tpHierarchicalImageForSymbolType:2 pointSize:32.0];
        }
        v21 = (void *)v87;
      }
      uint64_t v71 = +[UIColor systemRedColor];
      goto LABEL_91;
    case 18:
      int64_t v100 = a5;
      v102 = v12;
      v48 = +[NSBundle mainBundle];
      v22 = [v48 localizedStringForKey:@"CALL_BACK" value:&stru_100285990 table:@"BottomBar"];

      int64_t v101 = a6;
      v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:1 sizeCategory:a6];
      goto LABEL_49;
    case 19:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v49 = +[NSBundle mainBundle];
      v22 = [v49 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"BottomBar"];

      v102 = v12;
      v21 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:@"cancel" color:v12];
      v30 = +[UIColor whiteColor];
      uint64_t v50 = [(__CFString *)v30 colorWithAlphaComponent:0.400000006];
LABEL_104:
      v19 = (void *)v50;
      goto LABEL_105;
    case 20:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      uint64_t v51 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:@"in-call-camera-flip" color:v12];
      goto LABEL_54;
    case 21:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      v52 = [(id)objc_opt_class() imageForAction:21 callState:a5];
      v53 = [(id)objc_opt_class() imageColorForState:0];
      v21 = [v52 _flatImageWithColor:v53];

      v54 = [(id)objc_opt_class() imageColorForState:4];
      v20 = [v52 _flatImageWithColor:v54];

      v55 = +[UIColor whiteColor];
      v19 = [v55 colorWithAlphaComponent:0.400000006];

      v56 = +[UIColor whiteColor];
      v57 = [v56 colorWithAlphaComponent:0.699999988];

      v58 = +[UIColor whiteColor];

      v59 = 0;
      v60 = 0;
      goto LABEL_93;
    case 22:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      if (!a6)
      {
        v75 = [(id)objc_opt_class() imageForAction:22 callState:a5];
        v21 = [v75 _flatImageWithColor:v12];
        v90 = +[UIColor whiteColor];
        v19 = [v90 colorWithAlphaComponent:0.400000006];

LABEL_55:
LABEL_92:
        v59 = 0;
        v57 = 0;
        v58 = 0;
        v60 = 0;
        v20 = 0;
        goto LABEL_93;
      }
      if (a6 != 1)
      {
LABEL_37:
        v19 = 0;
LABEL_52:
        v59 = 0;
        v57 = 0;
        v58 = 0;
        v60 = 0;
        v20 = 0;
        v21 = 0;
LABEL_93:
        v22 = 0;
        goto LABEL_109;
      }
      v61 = +[NSBundle mainBundle];
      v22 = [v61 localizedStringForKey:@"AUDIO" value:&stru_100285990 table:@"BottomBar"];

      v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:12 sizeCategory:1];
LABEL_39:
      uint64_t v25 = +[UIColor whiteColor];
LABEL_87:
      v19 = (void *)v25;
LABEL_106:
      v59 = 0;
LABEL_107:
      v57 = 0;
      v58 = 0;
      v60 = 0;
LABEL_108:
      v20 = 0;
LABEL_109:
      v104.receiver = self;
      v104.super_class = (Class)PHBottomBarButtonConfiguration;
      v96 = [(PHBottomBarButtonConfiguration *)&v104 init];
      p_isa = (id *)&v96->super.isa;
      if (v96)
      {
        v96->_diameter = a4;
        v96->_action = a3;
        v96->_callState = v100;
        if (v101 == 1) {
          v98 = 0;
        }
        else {
          v98 = v22;
        }
        objc_storeStrong((id *)&v96->_title, v98);
        objc_storeStrong(p_isa + 7, v21);
        objc_storeStrong(p_isa + 8, v20);
        objc_storeStrong(p_isa + 9, v19);
        objc_storeStrong(p_isa + 10, v59);
        objc_storeStrong(p_isa + 11, v57);
        objc_storeStrong(p_isa + 12, v58);
        objc_storeStrong(p_isa + 13, v22);
        objc_storeStrong(p_isa + 14, v60);
        objc_storeWeak(p_isa + 5, obj);
      }
      self = p_isa;

      v23 = self;
      unint64_t v12 = v102;
LABEL_115:

      return v23;
    case 24:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v62 = +[NSBundle mainBundle];
      v22 = [v62 localizedStringForKey:@"SEND_TO_VOICEMAL" value:&stru_100285990 table:@"BottomBar"];

      v63 = +[UIColor systemRedColor];
      v21 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:@"send_to_voicemail" color:v63];

      goto LABEL_39;
    case 25:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v64 = &UIFontTextStyleTitle1;
      if (v17 != a4) {
        v64 = &UIFontTextStyleTitle2;
      }
      UIFontTextStyle v65 = *v64;
      if (v17 == a4) {
        uint64_t v66 = 2;
      }
      else {
        uint64_t v66 = 1;
      }
      v67 = +[UIColor whiteColor];
      v106[0] = v67;
      v68 = +[UIColor clearColor];
      v106[1] = v68;
      v69 = +[NSArray arrayWithObjects:v106 count:2];
      v21 = +[UIImage tpImageForSymbolType:31 textStyle:v65 scale:v66 paletteColors:v69 isStaticSize:1];

      v70 = +[NSBundle mainBundle];
      v22 = [v70 localizedStringForKey:@"SEND_TO_CALL_SCREENING" value:&stru_100285990 table:@"BottomBar"];

LABEL_46:
      v19 = +[UIColor clearColor];
      v60 = +[UIColorEffect inCallControls];
      v59 = 0;
      goto LABEL_59;
    case 26:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:1 sizeCategory:a6];
      uint64_t v71 = +[UIColor systemGreenColor];
LABEL_91:
      v19 = (void *)v71;
      goto LABEL_92;
    case 27:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v72 = +[NSBundle mainBundle];
      v22 = [v72 localizedStringForKey:@"LEAVE_A_MESSAGE" value:&stru_100285990 table:@"BottomBar"];

      v73 = +[UIColor whiteColor];
      v21 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:@"leave-a-message" color:v73];

LABEL_49:
      uint64_t v25 = +[UIColor systemGreenColor];
      goto LABEL_87;
    case 28:
      int64_t v100 = a5;
      v102 = v12;
      v74 = +[NSBundle mainBundle];
      v22 = [v74 localizedStringForKey:@"SEND_MESSAGE" value:&stru_100285990 table:@"BottomBar"];

      int64_t v101 = a6;
      v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:14 sizeCategory:a6];
      v59 = +[UIBlurEffect effectWithStyle:11];
      v19 = +[UIColor clearColor];
      goto LABEL_107;
    case 29:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v19 = +[UIColor whiteColor];
      goto LABEL_52;
    case 32:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      uint64_t v51 = +[UIImage imageNamed:@"in-call-button-effects"];
LABEL_54:
      v21 = (void *)v51;
      v75 = +[UIColor whiteColor];
      v19 = [v75 colorWithAlphaComponent:0.400000006];
      goto LABEL_55;
    case 33:
      int64_t v100 = a5;
      v102 = v12;
      v76 = +[NSBundle mainBundle];
      v22 = [v76 localizedStringForKey:@"BLOCK_CALLER" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v36 = 15;
      goto LABEL_58;
    case 34:
      int64_t v100 = a5;
      v102 = v12;
      v77 = +[NSBundle mainBundle];
      v22 = [v77 localizedStringForKey:@"CREATE_CONTACT" value:&stru_100285990 table:@"BottomBar"];

      uint64_t v36 = 87;
LABEL_58:
      int64_t v101 = a6;
      v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:v36 sizeCategory:a6];
      v59 = +[UIBlurEffect effectWithStyle:11];
      v19 = +[UIColor clearColor];
      v60 = +[UIColorEffect inCallControls];
      goto LABEL_59;
    case 35:
      int64_t v100 = a5;
      v102 = v12;
      v78 = +[NSBundle mainBundle];
      v22 = [v78 localizedStringForKey:@"Close" value:&stru_100285990 table:@"BottomBar"];

      int64_t v101 = a6;
      v79 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:8 sizeCategory:a6];
      v80 = +[UIColor systemBlackColor];
      v21 = [v79 tpFlattenedWithColor:v80];

      v59 = +[UIBlurEffect effectWithStyle:11];
      v60 = +[UIColorEffect inCallControls];
      v19 = +[UIColor systemWhiteColor];
LABEL_59:
      v57 = 0;
      v58 = 0;
      goto LABEL_108;
    case 36:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      v81 = +[NSBundle mainBundle];
      v22 = [v81 localizedStringForKey:@"ALERT_ACTION_TEXT_BUTTON_LABEL" value:&stru_100285990 table:@"Localizable-Stewie"];

      v21 = +[UIImage imageNamed:@"text_sos_icon"];
      v19 = 0;
      goto LABEL_106;
    case 37:
      int64_t v101 = a6;
      v102 = v12;
      int64_t v100 = a5;
      if (a5 == 1)
      {
        v82 = +[UIColor whiteColor];
        v21 = +[PHBottomBarButtonConfiguration bottomBarImageWithName:@"end_call_voip" color:v82];
      }
      else
      {
        v21 = +[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:2 sizeCategory:a6];
      }
      v19 = +[UIColor systemRedColor];
      v30 = +[NSBundle mainBundle];
      v22 = [(__CFString *)v30 localizedStringForKey:@"ALERT_ACTION_END_BUTTON_LABEL" value:&stru_100285990 table:@"Localizable-Stewie"];
LABEL_105:

      goto LABEL_106;
    default:
      int64_t v100 = a5;
      int64_t v101 = a6;
      v102 = v12;
      goto LABEL_37;
  }
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 sizeCategory:(int64_t)a6
{
  return [(PHBottomBarButtonConfiguration *)self initWithAction:a3 diameter:a5 callState:a6 sizeCategory:0 captureView:a4];
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 captureView:(id)a6
{
  return [(PHBottomBarButtonConfiguration *)self initWithAction:a3 diameter:a5 callState:0 sizeCategory:a6 captureView:a4];
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5
{
  return [(PHBottomBarButtonConfiguration *)self initWithAction:a3 diameter:a5 callState:0 sizeCategory:a4];
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3
{
  [(id)objc_opt_class() defaultWidth];

  return -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](self, "initWithAction:diameter:callState:", a3, 2);
}

+ (id)bottomBarGlyphWithSymbolType:(int64_t)a3 sizeCategory:(int64_t)a4
{
  double v7 = [a1 textStyleForSizeCategory:a4];
  double v8 = +[UIImage tpImageForSymbolType:textStyle:scale:symbolWeight:](UIImage, "tpImageForSymbolType:textStyle:scale:symbolWeight:", a3, v7, [a1 symbolScaleForSymbolType:a3 sizeCategory:a4], [a1 weightForSymbolType:a3]);

  return v8;
}

+ (int64_t)weightForSymbolType:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 8) {
    return 7;
  }
  else {
    return 0;
  }
}

+ (id)textStyleForSizeCategory:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = (id *)&UIFontTextStyleBody;
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v4 = (id *)&UIFontTextStyleLargeTitle;
  }
  a1 = *v4;
LABEL_6:
  return a1;
}

+ (int64_t)symbolScaleForSymbolType:(int64_t)a3 sizeCategory:(int64_t)a4
{
  if (a4 == 1)
  {
    if ((unint64_t)a3 > 0x24) {
      return -1;
    }
    if (((1 << a3) & 0x1000001120) != 0) {
      return 2;
    }
    if (((1 << a3) & 6) != 0) {
      return 3;
    }
    if (a3 == 9) {
      return 1;
    }
    else {
      return -1;
    }
  }
  else
  {
    int64_t v4 = 1;
    if (a3 != 9) {
      return -1;
    }
    return v4;
  }
}

+ (id)bottomBarImageWithName:(id)a3 color:(id)a4
{
  id v5 = a4;
  double v6 = +[UIImage imageNamed:a3];
  double v7 = [v6 tpFlattenedWithColor:v5];

  return v7;
}

- (int64_t)action
{
  return self->_action;
}

- (int64_t)callState
{
  return self->_callState;
}

- (double)diameter
{
  return self->_diameter;
}

- (int64_t)sizeCategory
{
  return self->_sizeCategory;
}

- (_UIVisualEffectBackdropView)captureView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);

  return (_UIVisualEffectBackdropView *)WeakRetained;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UIImage)selectedIcon
{
  return self->_selectedIcon;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIVisualEffect)backgroundMaterial
{
  return self->_backgroundMaterial;
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (UIColorEffect)colorEffect
{
  return self->_colorEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorEffect, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_backgroundMaterial, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_destroyWeak((id *)&self->_captureView);
}

@end