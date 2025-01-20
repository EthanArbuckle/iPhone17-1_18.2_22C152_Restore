@interface BluetoothUIServiceBanner
+ (id)_bundleID;
- (BOOL)_canShowWhileLocked;
- (BOOL)canRequestAlertingAssertion;
- (BOOL)checkifVideoAssetExists;
- (BOOL)isNewAsset:(id)a3;
- (BOOL)preventsInteractiveDismissal;
- (BOOL)providesHostedContent;
- (BTUIBatteryLevelIndicator)batteryLevelIndicator;
- (BUISAgentXPCConnection)xpcCon;
- (BluetoothUIServiceBanner)initWithXPCObject:(id)a3 error:(id *)a4;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIEdgeInsets)bannerContentOutsets;
- (UILabel)ccBottomViewLabel;
- (UILabel)ccTopViewLabel;
- (UIStackView)verticalTrailingStackView;
- (_UIStaticBatteryView)batteryView;
- (id)_systemApertureLeadingAccessoryView;
- (id)_systemApertureTrailingAccessoryView;
- (id)createInUseConnectButton;
- (id)createMuteUnmuteButton:(id)a3;
- (id)createReverseButton;
- (id)getAppIcon:(id)a3;
- (id)removedAccessoryColorCode:(id)a3;
- (id)userInfoForPosting;
- (int)pid;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (int64_t)presentableType;
- (void)_activateConstraintsForBatteryLevelIndicator;
- (void)_checkValidBatteryRange;
- (void)_createBatteryView;
- (void)_createConstraintsForInUseBannerIfNeeded;
- (void)_createConstraintsForReverseBannerIfNeeded;
- (void)_createConstraintsIfNeeded;
- (void)_createInUseBannerTextLabel:(id)a3 bottomLabel:(id)a4;
- (void)_createccBottomViewLabel:(id)a3;
- (void)_createccBottomViewLabel:(id)a3 labelString:(id)a4;
- (void)_createccTopViewLabel:(id)a3 labelString:(id)a4;
- (void)_fillBatteryPercentage;
- (void)_showInUseBanner;
- (void)_showMuteBanner;
- (void)activateWithActionHandler:(id)a3;
- (void)bannerDidDismiss:(id)a3;
- (void)createCustomAVPlayerLayerView:(id)a3 WithCustomIconName:(id)a4;
- (void)createCustomStaticImageView:(id)a3 WithCustomIconName:(id)a4;
- (void)createCustomStaticImageView:(id)a3 withIcon:(id)a4;
- (void)createCustomView:(id)a3 WithCustomIconName:(id)a4;
- (void)createCustomView:(id)a3 WithCustomIconPath:(id)a4;
- (void)createCustomView:(id)a3 WithImage:(id)a4;
- (void)createCustomViewForNativeReverseSymbol:(id)a3;
- (void)createCustomViewFromUILabel:(id)a3 WithStr:(id)a4;
- (void)createGenericHeadphoneView:(id)a3;
- (void)createGenericSpeakerView:(id)a3;
- (void)dismissBanner;
- (void)handleTap:(id)a3;
- (void)invalidate;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setBannerTimer;
- (void)setBatteryLevelIndicator:(id)a3;
- (void)setBatteryView:(id)a3;
- (void)setCanRequestAlertingAssertion:(BOOL)a3;
- (void)setCcBottomViewLabel:(id)a3;
- (void)setCcTopViewLabel:(id)a3;
- (void)setPid:(int)a3;
- (void)setVerticalTrailingStackView:(id)a3;
- (void)setXpcCon:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation BluetoothUIServiceBanner

- (BOOL)canRequestAlertingAssertion
{
  return self->_canRequestAlertingAssertion;
}

- (void)setCanRequestAlertingAssertion:(BOOL)a3
{
  if (self->_canRequestAlertingAssertion != a3)
  {
    self->_canRequestAlertingAssertion = a3;
    if (a3 && (self->_isReverseRouteBanner || self->_isInUseBanner))
    {
      v4 = [(BluetoothUIServiceBanner *)self systemApertureElementContext];
      v5 = [v4 requestAlertingAssertion];
      [v5 setAutomaticallyInvalidatable:0];

      if (dword_10001EDF0 <= 50 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      dispatch_time_t v6 = dispatch_time(0, 6000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006FD8;
      block[3] = &unk_1000185C0;
      block[4] = self;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (id)_systemApertureLeadingAccessoryView
{
  if (SBUIIsSystemApertureEnabled()) {
    leadingAccessoryView = self->_leadingAccessoryView;
  }
  else {
    leadingAccessoryView = 0;
  }

  return leadingAccessoryView;
}

- (id)_systemApertureTrailingAccessoryView
{
  if (SBUIIsSystemApertureEnabled()) {
    trailingAccessoryView = self->_trailingAccessoryView;
  }
  else {
    trailingAccessoryView = 0;
  }

  return trailingAccessoryView;
}

- (id)userInfoForPosting
{
  uint64_t v4 = kSBUIPresentableSystemApertureSupportingUserInfoKey;
  v5 = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  if (self->_isReverseRouteBanner || self->_isInUseBanner) {
    v2 = 0;
  }
  else {
    v2 = self->_leadingView;
  }

  return v2;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  if (self->_isReverseRouteBanner || self->_isInUseBanner) {
    v2 = 0;
  }
  else {
    v2 = self->_trailingView;
  }

  return v2;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  if (self->_isReverseRouteBanner || self->_isInUseBanner) {
    v2 = 0;
  }
  else {
    v2 = self->_minimalAccessoryView;
  }

  return (SBUISystemApertureAccessoryView *)v2;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  if (self->_isInvalidated) {
    return -1;
  }
  if (self->_isReverseRouteBanner) {
    return 4;
  }
  if (self->_isInUseBanner) {
    return 4;
  }
  return 3;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_activeLayoutMode = a3;
  if (a3 == -1)
  {
    self->_bannerActive = 0;
    bannerTransaction = self->_bannerTransaction;
    self->_bannerTransaction = 0;

    id actionHandler = self->_actionHandler;
    if (actionHandler)
    {
      id v6 = objc_retainBlock(actionHandler);
      v7 = v6;
      if (v6) {
        (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 6, 0);
      }

      id v8 = self->_actionHandler;
      self->_id actionHandler = 0;
    }
  }
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (BluetoothUIServiceBanner)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v113.receiver = self;
  v113.super_class = (Class)BluetoothUIServiceBanner;
  v7 = [(BluetoothUIServiceBanner *)&v113 initWithNibName:0 bundle:0];
  if (!v7)
  {
LABEL_169:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000891C;
    block[3] = &unk_1000185C0;
    v97 = v7;
    v112 = v97;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v33 = v97;

    goto LABEL_170;
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (a4)
    {
      NSErrorF();
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_170;
    }
    goto LABEL_108;
  }
  if (SBUIIsSystemApertureEnabled())
  {
    id v8 = v7->_leadingView;
    if (!v8)
    {
      id v8 = -[SRHostedJindoPresentableAccessoryView initWithFrame:]([SRHostedJindoPresentableAccessoryView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      if (v7->_muteUnmuteButton)
      {
        unsigned int v9 = [(NSString *)v7->_receivedMuteAction containsString:@"mute"];
        double v10 = 30.0;
        if (v9) {
          double v10 = 28.0;
        }
      }
      else
      {
        double v10 = 30.0;
      }
      -[SRHostedJindoPresentableAccessoryView setCompactSize:](v8, "setCompactSize:", v10, v10);
    }
    v17 = v7->_trailingView;
    if (!v17)
    {
      v17 = -[SRHostedJindoPresentableAccessoryView initWithFrame:]([SRHostedJindoPresentableAccessoryView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      -[SRHostedJindoPresentableAccessoryView setCompactSize:](v17, "setCompactSize:", 20.0, 20.0);
    }
    leadingAccessoryView = v7->_leadingAccessoryView;
    v7->_leadingAccessoryView = &v8->super;
    centerContentItems = v8;

    trailingAccessoryView = v7->_trailingAccessoryView;
    v7->_trailingAccessoryView = &v17->super;
    v20 = v17;

    v21 = -[SRHostedJindoPresentableAccessoryView initWithFrame:]([SRHostedJindoPresentableAccessoryView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    minimalAccessoryView = v7->_minimalAccessoryView;
    v7->_minimalAccessoryView = &v21->super;

    -[UIView setCompactSize:](v7->_minimalAccessoryView, "setCompactSize:", 20.0, 20.0);
  }
  else
  {
    v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    v12 = v7->_leadingAccessoryView;
    v7->_leadingAccessoryView = v11;

    v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 40.0, 40.0);
    v14 = v7->_trailingAccessoryView;
    v7->_trailingAccessoryView = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    centerContentItems = (SRHostedJindoPresentableAccessoryView *)v7->_centerContentItems;
    v7->_centerContentItems = v15;
  }

  uint64_t v114 = 0;
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_uint64_t bannerType = v114;
  }
  else if (v23 == 5)
  {
    goto LABEL_108;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_108;
  }
  p_ccItemsIcon = (id *)&v7->_ccItemsIcon;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  p_ccItemsText = (id *)&v7->_ccItemsText;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  p_ccText = (id *)&v7->_ccText;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  uint64_t v114 = 0;
  int v27 = CUXPCDecodeSInt64RangedEx();
  if (v27 != 6)
  {
    int v28 = 0;
    if (v27 != 5) {
      goto LABEL_26;
    }
LABEL_108:
    v33 = 0;
    goto LABEL_170;
  }
  int v28 = v114;
LABEL_26:
  v7->_backgroundColor = v28;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  p_leadingAccessoryIconName = (id *)&v7->_leadingAccessoryIconName;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  p_trailingAccessoryIconName = &v7->_trailingAccessoryIconName;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_108;
  }
  p_trailingAccessoryText = (id *)&v7->_trailingAccessoryText;
  if (!CUXPCDecodeNSString() || !CUXPCDecodeDouble() || !CUXPCDecodeDouble()) {
    goto LABEL_108;
  }
  v30 = &selRef__createInUseBannerTextLabel_bottomLabel_;
  if (dword_10001EDF0 <= 50 && (dword_10001EDF0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t bannerType = (int)v7->_bannerType;
    if (bannerType > 2) {
      v32 = "?";
    }
    else {
      v32 = (&off_100018628)[bannerType];
    }
    v106 = *p_trailingAccessoryIconName;
    v107 = v32;
    id v104 = *p_leadingAccessoryIconName;
    id v105 = *p_trailingAccessoryText;
    id v102 = *p_ccItemsIcon;
    id v103 = *p_ccItemsText;
    id v101 = *p_ccText;
    LogPrintF();
  }
  if (v7->_bannerType != 2)
  {
    if ([*p_trailingAccessoryText containsString:@"InUse"])
    {
      [(BluetoothUIServiceBanner *)v7 _showInUseBanner];
      goto LABEL_46;
    }
    v34 = (id *)&v7->_leadingAccessoryIconName;
    if (*p_ccText)
    {
      if ([*p_ccText isEqualToString:@"AirPods Case"])
      {
        if (([*p_leadingAccessoryIconName containsString:@"8203"] & 1) != 0
          || [*p_leadingAccessoryIconName containsString:@"8210"])
        {
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"BEATS_CASE";
        }
        else if ([*p_leadingAccessoryIconName containsString:@"8209"])
        {
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"BEATS_STUDIO_BUDS_CASE";
        }
        else if ([*p_leadingAccessoryIconName containsString:@"8214"])
        {
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"BEATS_STUDIO_BUDS_PLUS_CASE";
        }
        else
        {
          unsigned int v108 = [*p_leadingAccessoryIconName containsString:@"8221"];
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          if (v108) {
            CFStringRef v37 = @"POWERBEATS_PRO_CASE";
          }
          else {
            CFStringRef v37 = @"AIRPODS_CASE";
          }
        }
        uint64_t v38 = objc_msgSend(v35, "localizedStringForKey:value:table:", v37, &stru_1000188C0, 0, v101);
        id v39 = *p_ccText;
        id *p_ccText = (id)v38;

        v30 = &selRef__createInUseBannerTextLabel_bottomLabel_;
      }
      if (SBUIIsSystemApertureEnabled())
      {
        if (([*p_trailingAccessoryText containsString:@"Reverse"] & 1) == 0) {
          [(BluetoothUIServiceBanner *)v7 _createccBottomViewLabel:*p_ccText];
        }
      }
      else
      {
        v40 = (PLPillContentItem *)[objc_alloc((Class)PLPillContentItem) initWithText:*p_ccText style:1];
        centerContentText = v7->_centerContentText;
        v7->_centerContentText = v40;

        v30 = &selRef__createInUseBannerTextLabel_bottomLabel_;
        [(NSMutableArray *)v7->_centerContentItems addObject:v7->_centerContentText];
      }
    }
    id v42 = *p_ccItemsText;
    if (*p_ccItemsIcon)
    {
      if (v42)
      {
        if ([*p_ccItemsIcon isEqualToString:@"LowBattery"])
        {
          v43 = (UIView *)[objc_alloc((Class)_UIStaticBatteryView) initWithSizeCategory:0];
          [(UIView *)v43 setChargingState:0];
          [(UIView *)v43 setChargePercent:v7->_lowBatteryLevel];
          if (SBUIIsSystemApertureEnabled())
          {
            v7->_isLowBatteryBanner = 1;
            v44 = +[NSBundle mainBundle];
            customItems = [v44 localizedStringForKey:@"LOW_BATTERY" value:&stru_1000188C0 table:0];

            v46 = +[UIColor systemRedColor];
            [(BluetoothUIServiceBanner *)v7 _createccTopViewLabel:v46 labelString:customItems];
            [(BluetoothUIServiceBanner *)v7 _createBatteryView];
            [*p_ccItemsText doubleValue];
            double v48 = v47 / 100.0;
            v49 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
            [v49 setPercentageLevel:v48];

            [(BluetoothUIServiceBanner *)v7 _checkValidBatteryRange];
            [(BluetoothUIServiceBanner *)v7 _fillBatteryPercentage];
            v50 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
            v34 = (id *)&v7->_leadingAccessoryIconName;
            v51 = +[UIColor systemRedColor];
            [v50 setColorforPercentageLabel:v51];

            v52 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
            [v52 setShowsPercentageLabel:1];
LABEL_100:

LABEL_133:
            goto LABEL_134;
          }
          id v57 = objc_alloc((Class)PLPillContentItem);
          id v58 = *p_ccItemsText;
          v59 = v43;
LABEL_130:
          v78 = (PLPillContentItem *)objc_msgSend(v57, "initWithText:style:accessoryView:", v58, 2, v59, v101);
          customItems = v7->_customItems;
          v7->_customItems = v78;
          goto LABEL_133;
        }
LABEL_135:
        if (v7->_customItems) {
          -[NSMutableArray addObject:](v7->_centerContentItems, "addObject:");
        }
        if (*v34)
        {
          if ([*v34 containsString:@"Headset"])
          {
            [(BluetoothUIServiceBanner *)v7 createGenericHeadphoneView:v7->_leadingAccessoryView];
          }
          else if ([*v34 containsString:@"Speaker"])
          {
            [(BluetoothUIServiceBanner *)v7 createGenericSpeakerView:v7->_leadingAccessoryView];
          }
          else if (SBUIIsSystemApertureEnabled())
          {
            if ([(BluetoothUIServiceBanner *)v7 checkifVideoAssetExists])
            {
              v7->_isFirstInstance = 1;
              [(BluetoothUIServiceBanner *)v7 createCustomAVPlayerLayerView:v7->_leadingAccessoryView WithCustomIconName:*v34];
              if (!v7->_isReverseRouteBanner) {
                [(BluetoothUIServiceBanner *)v7 createCustomAVPlayerLayerView:v7->_minimalAccessoryView WithCustomIconName:*v34];
              }
            }
            else
            {
              [(BluetoothUIServiceBanner *)v7 createCustomStaticImageView:v7->_leadingAccessoryView WithCustomIconName:*v34];
              if (!v7->_isReverseRouteBanner) {
                [(BluetoothUIServiceBanner *)v7 createCustomStaticImageView:v7->_minimalAccessoryView WithCustomIconName:*v34];
              }
            }
          }
          else
          {
            [(BluetoothUIServiceBanner *)v7 createCustomView:v7->_leadingAccessoryView WithCustomIconName:*v34];
          }
        }
        else if (v7->_leadingAccessoryIconPath)
        {
          -[BluetoothUIServiceBanner createCustomView:WithCustomIconPath:](v7, "createCustomView:WithCustomIconPath:", v7->_leadingAccessoryView);
        }
        if (*p_trailingAccessoryIconName)
        {
          -[BluetoothUIServiceBanner createCustomView:WithCustomIconName:](v7, "createCustomView:WithCustomIconName:", v7->_trailingAccessoryView);
        }
        else if (v7->_trailingAccessoryIconPath)
        {
          -[BluetoothUIServiceBanner createCustomView:WithCustomIconPath:](v7, "createCustomView:WithCustomIconPath:", v7->_trailingAccessoryView);
        }
        else if (*p_trailingAccessoryText)
        {
          if ([*p_trailingAccessoryText containsString:@"Reverse"])
          {
            if (SBUIIsSystemApertureEnabled())
            {
              v84 = [(BluetoothUIServiceBanner *)v7 createReverseButton];
              [(UIView *)v7->_trailingAccessoryView addSubview:v84];
              [v84 setTranslatesAutoresizingMaskIntoConstraints:0];
              v85 = [v84 widthAnchor];
              v86 = [(UIView *)v7->_trailingAccessoryView widthAnchor];
              v87 = [v85 constraintEqualToAnchor:v86];
              [v87 setActive:1];

              v88 = [v84 heightAnchor];
              v89 = [(UIView *)v7->_trailingAccessoryView heightAnchor];
              v90 = [v88 constraintEqualToAnchor:v89];
              [v90 setActive:1];

              v91 = [v84 centerXAnchor];
              v92 = [(UIView *)v7->_trailingAccessoryView centerXAnchor];
              v93 = [v91 constraintEqualToAnchor:v92];
              [v93 setActive:1];

              v94 = [v84 centerYAnchor];
              v95 = [(UIView *)v7->_trailingAccessoryView centerYAnchor];
              v96 = [v94 constraintEqualToAnchor:v95];
              [v96 setActive:1];

              v30 = &selRef__createInUseBannerTextLabel_bottomLabel_;
            }
            else
            {
              v99 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 22.0, 22.0);
              v100 = v7->_trailingAccessoryView;
              v7->_trailingAccessoryView = v99;

              [(BluetoothUIServiceBanner *)v7 createCustomViewForNativeReverseSymbol:v7->_trailingAccessoryView];
            }
          }
          else
          {
            [(BluetoothUIServiceBanner *)v7 createCustomViewFromUILabel:v7->_trailingAccessoryView WithStr:*p_trailingAccessoryText];
          }
        }
        if (SBUIIsSystemApertureEnabled())
        {
          objc_storeStrong((id *)&v7->_leadingView, v7->_leadingAccessoryView);
          v81 = v7->_trailingAccessoryView;
          trailingView = v7->_trailingView;
          v7->_trailingView = (SBUISystemApertureAccessoryView *)v81;
        }
        else
        {
          trailingView = (SBUISystemApertureAccessoryView *)[objc_alloc((Class)PLPillView) initWithLeadingAccessoryView:v7->_leadingAccessoryView trailingAccessoryView:v7->_trailingAccessoryView];
          [(SBUISystemApertureAccessoryView *)trailingView setTranslatesAutoresizingMaskIntoConstraints:0];
          objc_storeStrong((id *)&v7->_pillView, trailingView);
          if (v7->_centerContentItems)
          {
            -[PLPillView setCenterContentItems:](v7->_pillView, "setCenterContentItems:");
          }
          else
          {
            int v83 = *((_DWORD *)v30 + 892);
            if (v83 <= 90 && (v83 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
          }
        }

        goto LABEL_169;
      }
      v54 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 40.0, 40.0);
      customView = v7->_customView;
      v7->_customView = v54;

      [(BluetoothUIServiceBanner *)v7 createCustomView:v7->_customView WithCustomIconName:*p_ccItemsIcon];
      [(UIView *)v7->_customView intrinsicContentSize];
      v56 = (PLPillContentItem *)[objc_alloc((Class)PLPillContentItem) initWithAccessoryView:v7->_customView];
LABEL_89:
      v43 = (UIView *)v7->_customItems;
      v7->_customItems = v56;
LABEL_134:

      v30 = &selRef__createInUseBannerTextLabel_bottomLabel_;
      goto LABEL_135;
    }
    if (!v42) {
      goto LABEL_135;
    }
    if (![*p_ccItemsText containsString:@"Connected"])
    {
      if ([*p_trailingAccessoryText containsString:@"Reverse"])
      {
        v7->_isReverseRouteBanner = 1;
        GestaltProductTypeStringToDeviceClass();
        CUAddSuffixForDeviceClass();
        v43 = (UIView *)objc_claimAutoreleasedReturnValue();
        if (SBUIIsSystemApertureEnabled())
        {
          customItems = +[UIColor systemWhiteColor];
          v46 = +[NSBundle mainBundle];
          v52 = [v46 localizedStringForKey:v43 value:&stru_1000188C0 table:0];
          [(BluetoothUIServiceBanner *)v7 _createccTopViewLabel:customItems labelString:v52];
        }
        else
        {
          id v60 = objc_alloc((Class)PLPillContentItem);
          customItems = +[NSBundle mainBundle];
          v46 = [customItems localizedStringForKey:v43 value:&stru_1000188C0 table:0];
          v61 = (PLPillContentItem *)[v60 initWithText:v46 style:2 accessoryView:v7->_customView];
          v52 = v7->_customItems;
          v7->_customItems = v61;
        }
        goto LABEL_100;
      }
      v56 = (PLPillContentItem *)[objc_alloc((Class)PLPillContentItem) initWithText:*p_ccItemsText style:2];
      goto LABEL_89;
    }
    if (*p_ccText)
    {
      if (([*p_leadingAccessoryIconName containsString:@"8194"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8207"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8206"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8197"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8195"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8205"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8208"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8210"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8221"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8209"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8211"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8212"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8228"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8214"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8230"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8217"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8219"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8222"] & 1) != 0
        || ([*p_leadingAccessoryIconName containsString:@"8224"] & 1) != 0
        || [*p_leadingAccessoryIconName containsString:@"8203"])
      {
        int v53 = *((_DWORD *)v30 + 892);
        if (v53 <= 50 && (v53 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v62 = +[NSBundle mainBundle];
        v63 = v62;
        CFStringRef v64 = @"CONNECTED_EARBUDS";
LABEL_125:
        v67 = [v62 localizedStringForKey:v64 value:&stru_1000188C0 table:0];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v67, *p_ccItemsText);
        v43 = (UIView *)objc_claimAutoreleasedReturnValue();
LABEL_126:

        if (SBUIIsSystemApertureEnabled())
        {
          v7->_connectedBanner = 1;
          customItems = +[UIColor systemGrayColor];
          [(BluetoothUIServiceBanner *)v7 _createccTopViewLabel:customItems labelString:v43];
          [(BluetoothUIServiceBanner *)v7 _createBatteryView];
          v68 = +[NSString stringWithFormat:@"%.2f", *(void *)&v7->_batteryLevel];
          [v68 doubleValue];
          double v70 = v69;
          v71 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
          [v71 setPercentageLevel:v70];

          [(BluetoothUIServiceBanner *)v7 _checkValidBatteryRange];
          [(BluetoothUIServiceBanner *)v7 _fillBatteryPercentage];
          v72 = +[UIColor colorWithRed:0.2728 green:0.9028 blue:0.4567 alpha:1.0];
          v73 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
          [v73 percentageLevel];
          double v75 = v74;

          v76 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
          v77 = v76;
          if (v75 <= 0.2)
          {
            v79 = +[UIColor systemRedColor];
            [v77 setColorforPercentageLabel:v79];
          }
          else
          {
            [v76 setColorforPercentageLabel:v72];
          }

          v80 = [(BluetoothUIServiceBanner *)v7 batteryLevelIndicator];
          [v80 setShowsPercentageLabel:0];

          v34 = (id *)&v7->_leadingAccessoryIconName;
          goto LABEL_133;
        }
        id v57 = objc_alloc((Class)PLPillContentItem);
        v59 = v7->_customView;
        id v58 = v43;
        goto LABEL_130;
      }
      if (*p_ccText
        && (([*p_leadingAccessoryIconName containsString:@"8198"] & 1) != 0
         || ([*p_leadingAccessoryIconName containsString:@"8199"] & 1) != 0
         || ([*p_leadingAccessoryIconName containsString:@"8204"] & 1) != 0
         || ([*p_leadingAccessoryIconName containsString:@"8202"] & 1) != 0
         || ([*p_leadingAccessoryIconName containsString:@"8223"] & 1) != 0
         || ([*p_leadingAccessoryIconName containsString:@"8229"] & 1) != 0
         || [*p_leadingAccessoryIconName containsString:@"8201"]))
      {
        int v65 = *((_DWORD *)v30 + 892);
        if (v65 <= 50 && (v65 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v63 = +[NSBundle mainBundle];
        v67 = [v63 localizedStringForKey:@"CONNECTED_OVEREAR_HEADPHONES" value:&stru_1000188C0 table:0];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v67, *p_ccItemsText);
        v43 = (UIView *)objc_claimAutoreleasedReturnValue();
        v34 = (id *)&v7->_leadingAccessoryIconName;
        goto LABEL_126;
      }
    }
    int v66 = *((_DWORD *)v30 + 892);
    if (v66 <= 50 && (v66 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v62 = +[NSBundle mainBundle];
    v63 = v62;
    CFStringRef v64 = @"CONNECTED";
    goto LABEL_125;
  }
  [(BluetoothUIServiceBanner *)v7 _showMuteBanner];
LABEL_46:
  v33 = v7;
LABEL_170:

  return v33;
}

- (void)_showInUseBanner
{
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_isInUseBanner = 1;
  v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:self->_ccText value:&stru_1000188C0 table:0];

  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"IN_USE_BY_OTHER_DEVICE" value:&stru_1000188C0 table:0];

  if (SBUIIsSystemApertureEnabled())
  {
    [(BluetoothUIServiceBanner *)self _createInUseBannerTextLabel:v4 bottomLabel:v6];
    if ([(BluetoothUIServiceBanner *)self checkifVideoAssetExists])
    {
      self->_isFirstInstance = 1;
      [(BluetoothUIServiceBanner *)self createCustomAVPlayerLayerView:self->_leadingAccessoryView WithCustomIconName:self->_leadingAccessoryIconName];
    }
    else
    {
      [(BluetoothUIServiceBanner *)self createCustomStaticImageView:self->_leadingAccessoryView WithCustomIconName:self->_leadingAccessoryIconName];
    }
    if (SBUIIsSystemApertureEnabled())
    {
      v7 = [(BluetoothUIServiceBanner *)self createInUseConnectButton];
      [(UIView *)self->_trailingAccessoryView addSubview:v7];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v8 = [v7 widthAnchor];
      unsigned int v9 = [(UIView *)self->_trailingAccessoryView widthAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      [v10 setActive:1];

      v11 = [v7 heightAnchor];
      v12 = [(UIView *)self->_trailingAccessoryView heightAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      [v13 setActive:1];

      v14 = [v7 centerXAnchor];
      v15 = [(UIView *)self->_trailingAccessoryView centerXAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      [v16 setActive:1];

      v17 = [v7 centerYAnchor];
      v18 = [(UIView *)self->_trailingAccessoryView centerYAnchor];
      v19 = [v17 constraintEqualToAnchor:v18];
      [v19 setActive:1];
    }
    objc_storeStrong((id *)&self->_leadingView, self->_leadingAccessoryView);
    objc_storeStrong((id *)&self->_trailingView, self->_trailingAccessoryView);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008EA8;
    block[3] = &unk_1000185C0;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v20 = [objc_alloc((Class)PLPillContentItem) initWithText:v4 style:1];
    id v21 = [objc_alloc((Class)PLPillContentItem) initWithText:v6 style:2];
    if (v20) {
      [(NSMutableArray *)self->_centerContentItems addObject:v20];
    }
    if (v21) {
      [(NSMutableArray *)self->_centerContentItems addObject:v21];
    }
    [(BluetoothUIServiceBanner *)self createCustomView:self->_leadingAccessoryView WithCustomIconName:self->_leadingAccessoryIconName];
    v22 = [(BluetoothUIServiceBanner *)self createInUseConnectButton];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v23 = [objc_alloc((Class)PLPillView) initWithLeadingAccessoryView:self->_leadingAccessoryView trailingAccessoryView:v22];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&self->_pillView, v23);
    if (self->_centerContentItems)
    {
      -[PLPillView setCenterContentItems:](self->_pillView, "setCenterContentItems:");
    }
    else if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_showMuteBanner
{
  if (dword_10001EDF0 <= 50 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  p_ccItemsText = &self->_ccItemsText;
  p_receivedMuteAction = &self->_receivedMuteAction;
  objc_storeStrong((id *)&self->_receivedMuteAction, self->_ccItemsText);
  if ([(NSString *)self->_ccItemsText isEqualToString:@"mute"])
  {
    v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"MICROPHONE_OFF";
LABEL_9:
    CFStringRef v9 = [v5 localizedStringForKey:v7 value:&stru_1000188C0 table:0];
    goto LABEL_13;
  }
  unsigned int v8 = [(NSString *)*p_ccItemsText isEqualToString:@"unmute"];
  v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v8)
  {
    CFStringRef v7 = @"MICROPHONE_ON";
    goto LABEL_9;
  }
  CFStringRef v9 = &stru_1000188C0;
  uint64_t v10 = [v5 localizedStringForKey:@"REJECTED_WITH_DEVICE_FORMAT" value:&stru_1000188C0 table:0];

  if (v10)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, *p_ccItemsText);
    CFStringRef v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v6 = (void *)v10;
LABEL_13:
  v11 = *p_ccItemsText;
  id *p_ccItemsText = &v9->isa;

  if (SBUIIsSystemApertureEnabled())
  {
    v12 = *p_ccItemsText;
    v13 = *p_ccItemsText;
    objc_storeStrong((id *)&self->_ccItemsText, self->_ccText);
    objc_storeStrong((id *)&self->_ccText, v12);
    v14 = +[UIColor systemWhiteColor];
    [(BluetoothUIServiceBanner *)self _createccBottomViewLabel:v14 labelString:self->_ccText];
    v15 = +[UIColor systemGrayColor];

    [(BluetoothUIServiceBanner *)self _createccTopViewLabel:v15 labelString:*p_ccItemsText];
    v16 = [(BluetoothUIServiceBanner *)self getAppIcon:self->_bannerAppID];
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
    leadingAccessoryView = self->_leadingAccessoryView;
    self->_leadingAccessoryView = v17;

    [(BluetoothUIServiceBanner *)self createCustomView:self->_leadingAccessoryView WithImage:v16];
    v19 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
    trailingAccessoryView = self->_trailingAccessoryView;
    self->_trailingAccessoryView = v19;

    if ([(NSString *)*p_receivedMuteAction isEqualToString:@"mute"]
      || [(NSString *)*p_receivedMuteAction isEqualToString:@"unmute"])
    {
      id v21 = [(BluetoothUIServiceBanner *)self createMuteUnmuteButton:*p_receivedMuteAction];
      muteUnmuteButton = self->_muteUnmuteButton;
      self->_muteUnmuteButton = v21;

      [(UIView *)self->_trailingAccessoryView addSubview:self->_muteUnmuteButton];
      [(UIButton *)self->_muteUnmuteButton setTranslatesAutoresizingMaskIntoConstraints:0];
      id v23 = [(UIButton *)self->_muteUnmuteButton widthAnchor];
      v24 = [(UIView *)self->_trailingAccessoryView widthAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      [v25 setActive:1];

      v26 = [(UIButton *)self->_muteUnmuteButton heightAnchor];
      int v27 = [(UIView *)self->_trailingAccessoryView heightAnchor];
      int v28 = [v26 constraintEqualToAnchor:v27];
      [v28 setActive:1];

      v29 = [(UIButton *)self->_muteUnmuteButton centerXAnchor];
      v30 = [(UIView *)self->_trailingAccessoryView centerXAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v32 = [(UIButton *)self->_muteUnmuteButton centerYAnchor];
      v33 = [(UIView *)self->_trailingAccessoryView centerYAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      [v34 setActive:1];
    }
    [(BluetoothUIServiceBanner *)self createCustomStaticImageView:self->_leadingAccessoryView withIcon:v16];
    [(BluetoothUIServiceBanner *)self createCustomStaticImageView:self->_minimalAccessoryView withIcon:v16];
    objc_storeStrong((id *)&self->_leadingView, self->_leadingAccessoryView);
    objc_storeStrong((id *)&self->_trailingView, self->_trailingAccessoryView);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000979C;
    block[3] = &unk_1000185C0;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v35 = (PLPillContentItem *)[objc_alloc((Class)PLPillContentItem) initWithText:self->_ccText style:1];
    centerContentText = self->_centerContentText;
    self->_centerContentText = v35;

    [(NSMutableArray *)self->_centerContentItems addObject:self->_centerContentText];
    CFStringRef v37 = (PLPillContentItem *)[objc_alloc((Class)PLPillContentItem) initWithText:*p_ccItemsText style:2 accessoryView:self->_customView];
    customItems = self->_customItems;
    self->_customItems = v37;

    if (self->_customItems) {
      -[NSMutableArray addObject:](self->_centerContentItems, "addObject:");
    }
    id v57 = [(BluetoothUIServiceBanner *)self getAppIcon:self->_bannerAppID];
    id v39 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
    v40 = self->_leadingAccessoryView;
    self->_leadingAccessoryView = v39;

    [(BluetoothUIServiceBanner *)self createCustomView:self->_leadingAccessoryView WithImage:v57];
    v41 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
    id v42 = self->_trailingAccessoryView;
    self->_trailingAccessoryView = v41;

    if ([(NSString *)*p_receivedMuteAction isEqualToString:@"mute"]
      || [(NSString *)*p_receivedMuteAction isEqualToString:@"unmute"])
    {
      v43 = [(BluetoothUIServiceBanner *)self createMuteUnmuteButton:*p_receivedMuteAction];
      [(UIView *)self->_trailingAccessoryView addSubview:v43];
      [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
      v44 = [v43 widthAnchor];
      v45 = [(UIView *)self->_trailingAccessoryView widthAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v46 setActive:1];

      double v47 = [v43 heightAnchor];
      double v48 = [(UIView *)self->_trailingAccessoryView heightAnchor];
      v49 = [v47 constraintEqualToAnchor:v48];
      [v49 setActive:1];

      v50 = [v43 centerXAnchor];
      v51 = [(UIView *)self->_trailingAccessoryView centerXAnchor];
      v52 = [v50 constraintEqualToAnchor:v51];
      [v52 setActive:1];

      int v53 = [v43 centerYAnchor];
      v54 = [(UIView *)self->_trailingAccessoryView centerYAnchor];
      v55 = [v53 constraintEqualToAnchor:v54];
      [v55 setActive:1];

      [v43 addTarget:self action:"handleTap:" forControlEvents:64];
    }
    id v56 = [objc_alloc((Class)PLPillView) initWithLeadingAccessoryView:self->_leadingAccessoryView trailingAccessoryView:self->_trailingAccessoryView];
    [v56 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&self->_pillView, v56);
    if (self->_centerContentItems)
    {
      -[PLPillView setCenterContentItems:](self->_pillView, "setCenterContentItems:");
    }
    else if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_createccBottomViewLabel:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 30.0, 30.0);
  [v7 setText:v4];

  v5 = +[UIColor whiteColor];
  [v7 setTextColor:v5];

  id v6 = +[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium];
  [v7 setFont:v6];

  [v7 setMarqueeEnabled:1];
  [(BluetoothUIServiceBanner *)self setCcBottomViewLabel:v7];
}

- (void)_createccBottomViewLabel:(id)a3 labelString:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 30.0, 30.0);
  [v7 setText:v6];

  if (v10)
  {
    [v7 setTextColor:v10];
  }
  else
  {
    if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v8 = +[UIColor whiteColor];
    [v7 setTextColor:v8];
  }
  CFStringRef v9 = +[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium];
  [v7 setFont:v9];

  [v7 setMarqueeEnabled:1];
  [(BluetoothUIServiceBanner *)self setCcBottomViewLabel:v7];
}

- (void)_createccTopViewLabel:(id)a3 labelString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
  [v9 setText:v6];

  [v9 setTextColor:v7];
  [v9 setAlpha:0.8];
  unsigned int v8 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium];
  [v9 setFont:v8];

  [(BluetoothUIServiceBanner *)self setCcTopViewLabel:v9];
}

- (void)_createInUseBannerTextLabel:(id)a3 bottomLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
  [v13 setText:v7];

  unsigned int v8 = +[UIColor systemGrayColor];
  [v13 setTextColor:v8];

  [v13 setAlpha:0.8];
  id v9 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium];
  [v13 setFont:v9];

  [v13 setMarqueeEnabled:1];
  [(BluetoothUIServiceBanner *)self setCcTopViewLabel:v13];
  id v10 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 30.0, 30.0);
  [v10 setText:v6];

  v11 = +[UIColor whiteColor];
  [v10 setTextColor:v11];

  v12 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightMedium];
  [v10 setFont:v12];

  [v10 setMarqueeEnabled:1];
  [(BluetoothUIServiceBanner *)self setCcBottomViewLabel:v10];
}

- (void)_createBatteryView
{
  v3 = objc_alloc_init(BTUIBatteryLevelIndicator);
  [(BluetoothUIServiceBanner *)self setBatteryLevelIndicator:v3];

  trailingAccessoryView = self->_trailingAccessoryView;
  v5 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [(UIView *)trailingAccessoryView addSubview:v5];

  [(BluetoothUIServiceBanner *)self _activateConstraintsForBatteryLevelIndicator];
}

- (void)_checkValidBatteryRange
{
  v3 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v3 percentageLevel];
  if (v4 < 0.0)
  {

LABEL_6:
    if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize()))
    {
      double batteryLevel = self->_batteryLevel;
      LogPrintF();
    }
    id v12 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
    [v12 setPercentageLevel:0.0];
    goto LABEL_11;
  }
  v5 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v5 percentageLevel];
  double v7 = v6;

  if (v7 > 1.0) {
    goto LABEL_6;
  }
  unsigned int v8 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v8 percentageLevel];
  double v10 = v9;

  if (v10 != 0.0) {
    return;
  }
  id v12 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v12 setAlpha:0.0];
LABEL_11:
}

- (void)_activateConstraintsForBatteryLevelIndicator
{
  v3 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v4 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  v5 = [v4 widthAnchor];
  double v6 = [(UIView *)self->_trailingAccessoryView widthAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  unsigned int v8 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  double v9 = [v8 heightAnchor];
  double v10 = [(UIView *)self->_trailingAccessoryView heightAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  id v13 = [v12 centerXAnchor];
  v14 = [(UIView *)self->_trailingAccessoryView centerXAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v19 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  v16 = [v19 centerYAnchor];
  v17 = [(UIView *)self->_trailingAccessoryView centerYAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];
}

- (void)_fillBatteryPercentage
{
  v3 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  double v4 = [v3 micaRootLayer];
  id v8 = [v4 publishedObjectWithName:@"progress fill"];

  v5 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v5 percentageLevel];
  [v8 setStrokeStart:1.0 - v6 + 0.001];

  double v7 = [(BluetoothUIServiceBanner *)self batteryLevelIndicator];
  [v7 setMicaProgressFill:v8];
}

- (void)_createConstraintsForInUseBannerIfNeeded
{
  uint64_t v3 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
  if (v3)
  {
    double v4 = (void *)v3;
    v5 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];

    if (v5)
    {
      double v6 = [(NSMutableDictionary *)self->_constraintsForLayoutMode objectForKeyedSubscript:&off_1000191E8];

      if (!v6)
      {
        if (!self->_constraintsForLayoutMode)
        {
          double v7 = +[NSMutableDictionary dictionary];
          constraintsForLayoutMode = self->_constraintsForLayoutMode;
          self->_constraintsForLayoutMode = v7;
        }
        v96 = [(SBUISystemApertureAccessoryView *)self->_leadingView widthAnchor];
        v95 = [v96 constraintEqualToConstant:48.0];
        v97[0] = v95;
        v94 = [(SBUISystemApertureAccessoryView *)self->_leadingView heightAnchor];
        v93 = [v94 constraintEqualToConstant:48.0];
        v97[1] = v93;
        v91 = [(SBUISystemApertureAccessoryView *)self->_leadingView leadingAnchor];
        v92 = [(BluetoothUIServiceBanner *)self view];
        v90 = [v92 leadingAnchor];
        v89 = [v91 constraintEqualToAnchor:v90 constant:16.0];
        v97[2] = v89;
        v87 = [(SBUISystemApertureAccessoryView *)self->_leadingView centerYAnchor];
        v88 = [(BluetoothUIServiceBanner *)self view];
        v86 = [v88 centerYAnchor];
        v85 = [v87 constraintEqualToAnchor:v86];
        v97[3] = v85;
        v84 = [(BluetoothUIServiceBanner *)self view];
        v82 = [v84 widthAnchor];
        int v83 = [(BluetoothUIServiceBanner *)self view];
        v81 = [v83 window];
        v80 = [v81 widthAnchor];
        v79 = [v82 constraintEqualToAnchor:v80];
        v97[4] = v79;
        v78 = [(BluetoothUIServiceBanner *)self view];
        v76 = [v78 heightAnchor];
        v77 = [(BluetoothUIServiceBanner *)self view];
        double v75 = objc_msgSend(v77, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");
        double v74 = [v75 heightAnchor];
        v73 = [v76 constraintEqualToAnchor:v74];
        v97[5] = v73;
        v71 = [(SBUISystemApertureAccessoryView *)self->_leadingView trailingAnchor];
        v72 = [(BluetoothUIServiceBanner *)self view];
        double v70 = objc_msgSend(v72, "SBUISA_systemApertureObstructedAreaLayoutGuide");
        double v69 = [v70 leadingAnchor];
        v68 = [v71 constraintLessThanOrEqualToAnchor:v69];
        v97[6] = v68;
        v67 = [(SBUISystemApertureAccessoryView *)self->_trailingView heightAnchor];
        int v66 = [v67 constraintEqualToConstant:35.0];
        v97[7] = v66;
        int v65 = [(SBUISystemApertureAccessoryView *)self->_trailingView widthAnchor];
        CFStringRef v64 = [v65 constraintGreaterThanOrEqualToConstant:100.0];
        v97[8] = v64;
        v62 = [(SBUISystemApertureAccessoryView *)self->_trailingView centerYAnchor];
        v63 = [(BluetoothUIServiceBanner *)self view];
        v61 = [v63 centerYAnchor];
        id v60 = [v62 constraintEqualToAnchor:v61];
        v97[9] = v60;
        id v58 = [(SBUISystemApertureAccessoryView *)self->_trailingView leadingAnchor];
        v59 = [(BluetoothUIServiceBanner *)self view];
        id v57 = objc_msgSend(v59, "SBUISA_systemApertureObstructedAreaLayoutGuide");
        id v56 = [v57 trailingAnchor];
        v55 = [v58 constraintGreaterThanOrEqualToAnchor:v56];
        v97[10] = v55;
        int v53 = [(SBUISystemApertureAccessoryView *)self->_trailingView trailingAnchor];
        v54 = [(BluetoothUIServiceBanner *)self view];
        v52 = [v54 trailingAnchor];
        v51 = [v53 constraintEqualToAnchor:v52 constant:-16.0];
        v97[11] = v51;
        v50 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
        double v48 = [v50 leadingAnchor];
        v49 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
        double v47 = [v49 leadingAnchor];
        v46 = [v48 constraintEqualToAnchor:v47];
        v97[12] = v46;
        v45 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
        v44 = [v45 _tightBoundingBoxLayoutGuide];
        id v42 = [v44 topAnchor];
        v43 = [(BluetoothUIServiceBanner *)self view];
        v41 = objc_msgSend(v43, "SBUISA_systemApertureObstructedAreaLayoutGuide");
        v40 = [v41 bottomAnchor];
        id v39 = [v42 constraintEqualToAnchor:v40];
        v97[13] = v39;
        uint64_t v38 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
        CFStringRef v37 = [v38 trailingAnchor];
        v35 = [(SBUISystemApertureAccessoryView *)self->_trailingView leadingAnchor];
        v36 = [(BluetoothUIServiceBanner *)self view];
        objc_msgSend(v36, "SBUISA_standardInteritemPadding");
        v34 = [v37 constraintEqualToAnchor:v35 constant:-v9];
        v97[14] = v34;
        v33 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
        v30 = [v33 firstBaselineAnchor];
        v32 = [(BluetoothUIServiceBanner *)self view];
        v31 = objc_msgSend(v32, "SBUISA_systemApertureLegibleContentLayoutMarginsGuide");
        v29 = [v31 bottomAnchor];
        int v28 = [v30 constraintEqualToAnchor:v29 constant:2.0];
        v97[15] = v28;
        int v27 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
        v25 = [v27 leadingAnchor];
        v26 = [(BluetoothUIServiceBanner *)self view];
        v24 = [v26 leadingAnchor];
        id v23 = [v25 constraintEqualToAnchor:v24 constant:78.0];
        v97[16] = v23;
        v22 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
        id v21 = [v22 _tightBoundingBoxLayoutGuide];
        id v20 = [v21 topAnchor];
        double v10 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
        v11 = [v10 bottomAnchor];
        id v12 = [v20 constraintEqualToAnchor:v11];
        v97[17] = v12;
        id v13 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
        v14 = [v13 trailingAnchor];
        v15 = [(SBUISystemApertureAccessoryView *)self->_trailingView leadingAnchor];
        v16 = [(BluetoothUIServiceBanner *)self view];
        objc_msgSend(v16, "SBUISA_standardInteritemPadding");
        v18 = [v14 constraintEqualToAnchor:v15 constant:-v17];
        v97[18] = v18;
        id v19 = +[NSArray arrayWithObjects:v97 count:19];
        [(NSMutableDictionary *)self->_constraintsForLayoutMode setObject:v19 forKeyedSubscript:&off_1000191E8];
      }
    }
  }
}

- (void)_createConstraintsForReverseBannerIfNeeded
{
  uint64_t v3 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];

  if (v3)
  {
    double v4 = [(NSMutableDictionary *)self->_constraintsForLayoutMode objectForKeyedSubscript:&off_1000191E8];

    if (!v4)
    {
      if (!self->_constraintsForLayoutMode)
      {
        v5 = +[NSMutableDictionary dictionary];
        constraintsForLayoutMode = self->_constraintsForLayoutMode;
        self->_constraintsForLayoutMode = v5;
      }
      v62 = [(SBUISystemApertureAccessoryView *)self->_leadingView widthAnchor];
      v61 = [v62 constraintEqualToConstant:118.0];
      v63[0] = v61;
      id v60 = [(SBUISystemApertureAccessoryView *)self->_leadingView heightAnchor];
      v59 = [v60 constraintEqualToConstant:48.0];
      v63[1] = v59;
      id v57 = [(SBUISystemApertureAccessoryView *)self->_leadingView leadingAnchor];
      id v58 = [(BluetoothUIServiceBanner *)self view];
      id v56 = [v58 leadingAnchor];
      v55 = [v57 constraintEqualToAnchor:v56 constant:-15.0];
      v63[2] = v55;
      int v53 = [(SBUISystemApertureAccessoryView *)self->_leadingView centerYAnchor];
      v54 = [(BluetoothUIServiceBanner *)self view];
      v52 = [v54 centerYAnchor];
      v51 = [v53 constraintEqualToAnchor:v52];
      v63[3] = v51;
      v50 = [(BluetoothUIServiceBanner *)self view];
      v49 = [v50 heightAnchor];
      double v48 = [v49 constraintEqualToConstant:65.33];
      v63[4] = v48;
      v46 = [(SBUISystemApertureAccessoryView *)self->_leadingView trailingAnchor];
      double v47 = [(BluetoothUIServiceBanner *)self view];
      v45 = objc_msgSend(v47, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      v44 = [v45 leadingAnchor];
      v43 = [v46 constraintLessThanOrEqualToAnchor:v44];
      v63[5] = v43;
      id v42 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      v40 = [v42 leadingAnchor];
      v41 = [(BluetoothUIServiceBanner *)self view];
      id v39 = [v41 leadingAnchor];
      uint64_t v38 = [v40 constraintEqualToAnchor:v39 constant:78.0];
      v63[6] = v38;
      CFStringRef v37 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      v36 = [v37 _tightBoundingBoxLayoutGuide];
      v34 = [v36 topAnchor];
      v35 = [(BluetoothUIServiceBanner *)self view];
      v33 = objc_msgSend(v35, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      v32 = [v33 bottomAnchor];
      v31 = [v34 constraintEqualToAnchor:v32];
      v63[7] = v31;
      v30 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      v29 = [v30 trailingAnchor];
      int v27 = [(SBUISystemApertureAccessoryView *)self->_trailingView leadingAnchor];
      int v28 = [(BluetoothUIServiceBanner *)self view];
      objc_msgSend(v28, "SBUISA_standardInteritemPadding");
      v26 = [v29 constraintEqualToAnchor:v27 constant:-v7];
      v63[8] = v26;
      v25 = [(SBUISystemApertureAccessoryView *)self->_trailingView heightAnchor];
      v24 = [v25 constraintEqualToConstant:30.0];
      v63[9] = v24;
      id v23 = [(SBUISystemApertureAccessoryView *)self->_trailingView widthAnchor];
      v22 = [v23 constraintEqualToConstant:64.0];
      v63[10] = v22;
      id v20 = [(SBUISystemApertureAccessoryView *)self->_trailingView centerYAnchor];
      id v21 = [(BluetoothUIServiceBanner *)self view];
      id v19 = [v21 centerYAnchor];
      v18 = [v20 constraintEqualToAnchor:v19];
      v63[11] = v18;
      double v17 = [(SBUISystemApertureAccessoryView *)self->_trailingView leadingAnchor];
      id v8 = [(BluetoothUIServiceBanner *)self view];
      double v9 = objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      double v10 = [v9 trailingAnchor];
      v11 = [v17 constraintGreaterThanOrEqualToAnchor:v10];
      v63[12] = v11;
      id v12 = [(SBUISystemApertureAccessoryView *)self->_trailingView trailingAnchor];
      id v13 = [(BluetoothUIServiceBanner *)self view];
      v14 = [v13 trailingAnchor];
      v15 = [v12 constraintEqualToAnchor:v14 constant:-16.0];
      v63[13] = v15;
      v16 = +[NSArray arrayWithObjects:v63 count:14];
      [(NSMutableDictionary *)self->_constraintsForLayoutMode setObject:v16 forKeyedSubscript:&off_1000191E8];
    }
  }
}

- (void)_createConstraintsIfNeeded
{
  uint64_t v3 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
  if (v3)
  {
    double v4 = (void *)v3;
    v5 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];

    if (v5)
    {
      double v6 = [(BluetoothUIServiceBanner *)self trailingView];
      double v7 = [v6 widthAnchor];
      id v8 = [v7 constraintEqualToConstant:20.0];
      trailingViewWidth = self->_trailingViewWidth;
      self->_trailingViewWidth = v8;

      double v10 = [(BluetoothUIServiceBanner *)self trailingView];
      v11 = [v10 heightAnchor];
      id v12 = [v11 constraintEqualToConstant:20.0];
      trailingViewHeight = self->_trailingViewHeight;
      self->_trailingViewHeight = v12;

      uint64_t v14 = [(NSMutableDictionary *)self->_constraintsForLayoutMode objectForKeyedSubscript:&off_100019200];
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [(NSMutableDictionary *)self->_constraintsForLayoutMode objectForKeyedSubscript:&off_1000191E8];
        if (v16)
        {
          double v17 = (void *)v16;
          v18 = [(NSMutableDictionary *)self->_constraintsForLayoutMode objectForKeyedSubscript:&off_100019218];

          if (v18) {
            return;
          }
        }
        else
        {
        }
      }
      if (!self->_constraintsForLayoutMode)
      {
        id v19 = +[NSMutableDictionary dictionary];
        constraintsForLayoutMode = self->_constraintsForLayoutMode;
        self->_constraintsForLayoutMode = v19;
      }
      if (self->_muteUnmuteButton)
      {
        if ([(NSString *)self->_receivedMuteAction containsString:@"mute"]) {
          double v21 = 28.0;
        }
        else {
          double v21 = 30.0;
        }
      }
      else
      {
        double v21 = 30.0;
      }
      v22 = [(BluetoothUIServiceBanner *)self minimalView];
      id v23 = [v22 widthAnchor];
      v24 = [v23 constraintEqualToConstant:v21];
      v161[0] = v24;
      v25 = [(BluetoothUIServiceBanner *)self minimalView];
      v26 = [v25 heightAnchor];
      int v27 = [v26 constraintEqualToConstant:v21];
      v161[1] = v27;
      int v28 = +[NSArray arrayWithObjects:v161 count:2];
      [(NSMutableDictionary *)self->_constraintsForLayoutMode setObject:v28 forKeyedSubscript:&off_100019200];

      v156 = [(BluetoothUIServiceBanner *)self leadingView];
      v154 = [v156 widthAnchor];
      v152 = [v154 constraintEqualToConstant:v21];
      v160[0] = v152;
      v150 = [(BluetoothUIServiceBanner *)self leadingView];
      v148 = [v150 heightAnchor];
      v146 = [v148 constraintEqualToConstant:v21];
      v160[1] = v146;
      v144 = [(BluetoothUIServiceBanner *)self leadingView];
      v140 = [v144 leadingAnchor];
      v142 = [(BluetoothUIServiceBanner *)self view];
      v138 = [v142 leadingAnchor];
      v136 = [v140 constraintEqualToAnchor:v138 constant:8.0];
      v160[2] = v136;
      v134 = [(BluetoothUIServiceBanner *)self leadingView];
      v130 = [v134 centerYAnchor];
      v132 = [(BluetoothUIServiceBanner *)self view];
      v128 = [v132 centerYAnchor];
      v126 = [v130 constraintEqualToAnchor:v128];
      v29 = self->_trailingViewWidth;
      v160[3] = v126;
      v160[4] = v29;
      v160[5] = self->_trailingViewHeight;
      v124 = [(BluetoothUIServiceBanner *)self trailingView];
      v120 = [v124 centerXAnchor];
      v122 = [(BluetoothUIServiceBanner *)self view];
      v118 = objc_msgSend(v122, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");
      v116 = [v118 centerXAnchor];
      uint64_t v114 = [v120 constraintEqualToAnchor:v116];
      v160[6] = v114;
      v112 = [(BluetoothUIServiceBanner *)self trailingView];
      unsigned int v108 = [v112 centerYAnchor];
      v110 = [(BluetoothUIServiceBanner *)self view];
      v106 = objc_msgSend(v110, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");
      id v104 = [v106 centerYAnchor];
      id v102 = [v108 constraintEqualToAnchor:v104];
      v160[7] = v102;
      v100 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      v96 = [v100 leadingAnchor];
      v98 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v94 = [v98 leadingAnchor];
      v92 = [v96 constraintEqualToAnchor:v94];
      v160[8] = v92;
      v90 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      v86 = [v90 firstBaselineAnchor];
      v88 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v84 = [v88 topAnchor];
      v82 = [v86 constraintEqualToAnchor:v84];
      v160[9] = v82;
      v80 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v76 = [v80 firstBaselineAnchor];
      v78 = [(BluetoothUIServiceBanner *)self view];
      double v74 = objc_msgSend(v78, "SBUISA_systemApertureLegibleContentLayoutMarginsGuide");
      v30 = [v74 bottomAnchor];
      v31 = [v76 constraintEqualToAnchor:v30];
      v160[10] = v31;
      v32 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v33 = [v32 leadingAnchor];
      v34 = [(BluetoothUIServiceBanner *)self view];
      v35 = objc_msgSend(v34, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      v36 = [v35 leadingAnchor];
      CFStringRef v37 = [v33 constraintEqualToAnchor:v36];
      v160[11] = v37;
      uint64_t v38 = +[NSArray arrayWithObjects:v160 count:12];
      [(NSMutableDictionary *)self->_constraintsForLayoutMode setObject:v38 forKeyedSubscript:&off_100019218];

      if (self->_muteUnmuteButton)
      {
        if ([(NSString *)self->_receivedMuteAction containsString:@"mute"]) {
          double v39 = 48.0;
        }
        else {
          double v39 = 60.0;
        }
      }
      else
      {
        double v39 = 60.0;
      }
      v158 = [(BluetoothUIServiceBanner *)self leadingView];
      v157 = [v158 widthAnchor];
      v155 = [v157 constraintEqualToConstant:v39];
      v159[0] = v155;
      v153 = [(BluetoothUIServiceBanner *)self leadingView];
      v151 = [v153 heightAnchor];
      v149 = [v151 constraintEqualToConstant:v39];
      v159[1] = v149;
      v147 = [(BluetoothUIServiceBanner *)self trailingView];
      v145 = [v147 widthAnchor];
      v143 = [v145 constraintEqualToConstant:49.5];
      v159[2] = v143;
      v141 = [(BluetoothUIServiceBanner *)self trailingView];
      v139 = [v141 heightAnchor];
      v137 = [v139 constraintEqualToConstant:49.5];
      v159[3] = v137;
      v135 = [(BluetoothUIServiceBanner *)self view];
      v131 = [v135 widthAnchor];
      v133 = [(BluetoothUIServiceBanner *)self view];
      v129 = [v133 window];
      v127 = [v129 widthAnchor];
      v125 = [v131 constraintEqualToAnchor:v127];
      v159[4] = v125;
      v123 = [(BluetoothUIServiceBanner *)self view];
      v119 = [v123 heightAnchor];
      v121 = [(BluetoothUIServiceBanner *)self view];
      v117 = objc_msgSend(v121, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");
      v115 = [v117 heightAnchor];
      objc_super v113 = [v119 constraintEqualToAnchor:v115];
      v159[5] = v113;
      v111 = [(BluetoothUIServiceBanner *)self leadingView];
      v107 = [v111 leadingAnchor];
      v109 = [(BluetoothUIServiceBanner *)self view];
      id v105 = [v109 leadingAnchor];
      id v103 = [v107 constraintEqualToAnchor:v105 constant:20.0];
      v159[6] = v103;
      id v101 = [(BluetoothUIServiceBanner *)self leadingView];
      v97 = [v101 centerYAnchor];
      v99 = [(BluetoothUIServiceBanner *)self view];
      v95 = [v99 centerYAnchor];
      v93 = [v97 constraintEqualToAnchor:v95];
      v159[7] = v93;
      v91 = [(BluetoothUIServiceBanner *)self trailingView];
      v87 = [v91 centerXAnchor];
      v89 = [(BluetoothUIServiceBanner *)self view];
      v85 = objc_msgSend(v89, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");
      int v83 = [v85 centerXAnchor];
      v81 = [v87 constraintEqualToAnchor:v83];
      v159[8] = v81;
      v79 = [(BluetoothUIServiceBanner *)self trailingView];
      double v75 = [v79 centerYAnchor];
      v77 = [(BluetoothUIServiceBanner *)self view];
      v73 = objc_msgSend(v77, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");
      v72 = [v73 centerYAnchor];
      v71 = [v75 constraintEqualToAnchor:v72];
      v159[9] = v71;
      double v70 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      v68 = [v70 leadingAnchor];
      double v69 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v67 = [v69 leadingAnchor];
      int v66 = [v68 constraintEqualToAnchor:v67];
      v159[10] = v66;
      int v65 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
      CFStringRef v64 = [v65 _tightBoundingBoxLayoutGuide];
      v62 = [v64 topAnchor];
      v63 = [(BluetoothUIServiceBanner *)self view];
      v61 = objc_msgSend(v63, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      id v60 = [v61 bottomAnchor];
      v59 = [v62 constraintEqualToAnchor:v60];
      v159[11] = v59;
      id v58 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v55 = [v58 firstBaselineAnchor];
      id v57 = [(BluetoothUIServiceBanner *)self view];
      id v56 = objc_msgSend(v57, "SBUISA_systemApertureLegibleContentLayoutMarginsGuide");
      v54 = [v56 bottomAnchor];
      int v53 = [v55 constraintEqualToAnchor:v54 constant:-2.5];
      v159[12] = v53;
      v52 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v50 = [v52 trailingAnchor];
      v51 = [(BluetoothUIServiceBanner *)self trailingView];
      v40 = [v51 leadingAnchor];
      v41 = [(BluetoothUIServiceBanner *)self view];
      objc_msgSend(v41, "SBUISA_standardInteritemPadding");
      v43 = [v50 constraintLessThanOrEqualToAnchor:v40 constant:-v42];
      v159[13] = v43;
      v44 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
      v45 = [v44 leadingAnchor];
      v46 = [(BluetoothUIServiceBanner *)self leadingView];
      double v47 = [v46 trailingAnchor];
      double v48 = [v45 constraintEqualToAnchor:v47 constant:13.0];
      v159[14] = v48;
      v49 = +[NSArray arrayWithObjects:v159 count:15];
      [(NSMutableDictionary *)self->_constraintsForLayoutMode setObject:v49 forKeyedSubscript:&off_1000191E8];
    }
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(BluetoothUIServiceBanner *)self minimalView];
  [v5 setHidden:0];

  double v6 = [(BluetoothUIServiceBanner *)self view];
  [v6 addSubview:self->_leadingAccessoryView];

  double v7 = [(BluetoothUIServiceBanner *)self view];
  [v7 addSubview:self->_minimalAccessoryView];

  id v8 = [(BluetoothUIServiceBanner *)self view];
  [v8 addSubview:self->_trailingAccessoryView];

  double v9 = [(BluetoothUIServiceBanner *)self view];
  double v10 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
  [v9 addSubview:v10];

  if (self->_isReverseRouteBanner || self->_isInUseBanner)
  {
    [(SBUISystemApertureAccessoryView *)self->_leadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBUISystemApertureAccessoryView *)self->_trailingView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    v15 = [(BluetoothUIServiceBanner *)self leadingView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v16 = [(BluetoothUIServiceBanner *)self trailingView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v17 = [(BluetoothUIServiceBanner *)self minimalView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v11 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  if (self->_isInUseBanner)
  {
    id v12 = [(BluetoothUIServiceBanner *)self view];
    id v13 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
    [v12 addSubview:v13];

    [(BluetoothUIServiceBanner *)self _createConstraintsForInUseBannerIfNeeded];
  }
  else
  {
    if (self->_isReverseRouteBanner)
    {
      [(BluetoothUIServiceBanner *)self _createConstraintsForReverseBannerIfNeeded];
      goto LABEL_9;
    }
    v18 = [(BluetoothUIServiceBanner *)self view];
    id v19 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
    [v18 addSubview:v19];

    [(BluetoothUIServiceBanner *)self _createConstraintsIfNeeded];
  }
  uint64_t v14 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

LABEL_9:
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000C378;
  v20[3] = &unk_1000185E8;
  v20[4] = self;
  [v4 animateAlongsideTransition:v20 completion:0];
}

- (void)activateWithActionHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = v4;

  double v6 = (OS_os_transaction *)os_transaction_create();
  bannerTransaction = self->_bannerTransaction;
  self->_bannerTransaction = v6;

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  double v9 = [v8 bundleIdentifier];
  double v10 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:v9];
  bannerSource = self->_bannerSource;
  self->_bannerSource = v10;

  id v12 = self->_bannerSource;
  id v29 = 0;
  id v13 = [(BNBannerSource *)v12 layoutDescriptionWithError:&v29];
  id v14 = v29;
  if (v13)
  {
    [v13 presentationSize];
    double v16 = v15;
    double v18 = v17;
    [v13 containerSize];
    -[BluetoothUIServiceBanner preferredContentSizeWithPresentationSize:containerSize:](self, "preferredContentSizeWithPresentationSize:containerSize:", v16, v18, v19, v20);
    -[BluetoothUIServiceBanner setPreferredContentSize:](self, "setPreferredContentSize:");
    int v21 = SBUIIsSystemApertureEnabled();
    v22 = self->_bannerSource;
    if (v21)
    {
      v32[0] = kSBUIPresentableShouldBypassScreenSharingUserInfoKey;
      v32[1] = kSBUIPresentableSystemApertureSupportingUserInfoKey;
      v33[0] = &__kCFBooleanTrue;
      v33[1] = &__kCFBooleanTrue;
      id v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      uint64_t v28 = 0;
      v24 = (id *)&v28;
      v25 = &v28;
    }
    else
    {
      uint64_t v30 = kSBUIPresentableShouldBypassScreenSharingUserInfoKey;
      v31 = &__kCFBooleanTrue;
      id v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v27 = 0;
      v24 = (id *)&v27;
      v25 = &v27;
    }
    [(BNBannerSource *)v22 postPresentable:self options:1 userInfo:v23 error:v25];
    id v26 = *v24;

    if (v26)
    {
      if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      self->_bannerActive = 1;
    }
  }
  else
  {
    if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v26 = v14;
  }
}

- (void)invalidate
{
  self->_isInvalidated = 1;
  self->_isFirstInstance = 0;
  if (self->_bannerActive) {
    [(BluetoothUIServiceBanner *)self dismissBanner];
  }
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  self->_bannerActive = 0;
  bannerSource = self->_bannerSource;
  self->_bannerSource = 0;

  bannerTimer = self->_bannerTimer;
  if (bannerTimer)
  {
    double v6 = bannerTimer;
    dispatch_source_cancel(v6);
    double v7 = self->_bannerTimer;
    self->_bannerTimer = 0;
  }
  self->_bannerTimeoutInSeconds = 0.0;
  ccText = self->_ccText;
  self->_ccText = 0;

  ccItemsIcon = self->_ccItemsIcon;
  self->_ccItemsIcon = 0;

  ccItemsText = self->_ccItemsText;
  self->_ccItemsText = 0;

  centerContentItems = self->_centerContentItems;
  self->_centerContentItems = 0;

  self->_connectedBanner = 0;
  identifier = self->_identifier;
  self->_identifier = 0;

  pillView = self->_pillView;
  self->_pillView = 0;

  leadingAccessoryView = self->_leadingAccessoryView;
  self->_leadingAccessoryView = 0;

  leadingAccessoryIconName = self->_leadingAccessoryIconName;
  self->_leadingAccessoryIconName = 0;

  leadingAccessoryIconPath = self->_leadingAccessoryIconPath;
  self->_leadingAccessoryIconPath = 0;

  centerContentText = self->_centerContentText;
  self->_centerContentText = 0;

  trailingAccessoryIconName = self->_trailingAccessoryIconName;
  self->_trailingAccessoryIconName = 0;

  trailingAccessoryIconPath = self->_trailingAccessoryIconPath;
  self->_trailingAccessoryIconPath = 0;

  trailingAccessoryView = self->_trailingAccessoryView;
  self->_trailingAccessoryView = 0;

  xpcCon = self->_xpcCon;
  self->_xpcCon = 0;

  self->_uint64_t bannerType = 0;
  bannerAppID = self->_bannerAppID;
  self->_bannerAppID = 0;

  receivedMuteAction = self->_receivedMuteAction;
  self->_receivedMuteAction = 0;

  muteUnmuteButton = self->_muteUnmuteButton;
  self->_muteUnmuteButton = 0;

  mediaPlayerView = self->_mediaPlayerView;
  if (mediaPlayerView)
  {
    [(BTMediaPlayerView *)mediaPlayerView stop];
    id v26 = self->_mediaPlayerView;
    self->_mediaPlayerView = 0;
  }
  mediaPlayerViewFirstInstance = self->_mediaPlayerViewFirstInstance;
  if (mediaPlayerViewFirstInstance)
  {
    [(BTMediaPlayerView *)mediaPlayerViewFirstInstance stop];
    uint64_t v28 = self->_mediaPlayerViewFirstInstance;
    self->_mediaPlayerViewFirstInstance = 0;
  }
}

- (id)getAppIcon:(id)a3
{
  id v3 = a3;
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v3;
    LogPrintF();
  }
  id v4 = +[UIScreen mainScreen];
  [v4 scale];
  v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 0);

  return v5;
}

- (void)createCustomViewFromUILabel:(id)a3 WithStr:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 40.0, 40.0);
  id v7 = +[UIColor clearColor];
  [v11 setBackgroundColor:v7];

  id v8 = +[UIColor systemBlueColor];
  [v11 setTextColor:v8];

  double v9 = +[BSUIFontProvider defaultFontProvider];
  double v10 = [v9 preferredFontForTextStyle:UIFontTextStyleFootnote hiFontStyle:4];
  [v11 setFont:v10];

  [v11 setTextAlignment:1];
  [v11 setText:v5];

  [v6 addSubview:v11];
}

- (void)createCustomViewForNativeReverseSymbol:(id)a3
{
  id v3 = a3;
  id v8 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:12.0];
  id v4 = +[UIImage systemImageNamed:@"arrow.uturn.backward.circle.fill"];
  id v5 = [v4 imageWithSymbolConfiguration:v8];
  id v6 = [v5 imageWithRenderingMode:2];

  id v7 = [objc_alloc((Class)UIImageView) initWithImage:v6];
  [v3 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAutoresizingMask:18];
  [v3 addSubview:v7];
}

- (void)createGenericSpeakerView:(id)a3
{
  id v3 = a3;
  id v8 = +[UIImage _systemImageNamed:@"speaker.bluetooth.fill"];
  id v4 = [objc_alloc((Class)UIImageView) initWithImage:v8];
  id v5 = +[UIColor systemGrayColor];
  [v4 setTintColor:v5];

  id v6 = +[UIFont systemFontOfSize:18.0];
  id v7 = +[UIImageSymbolConfiguration configurationWithFont:v6];
  [v4 setPreferredSymbolConfiguration:v7];

  [v4 setContentMode:4];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [v3 addSubview:v4];
}

- (void)createGenericHeadphoneView:(id)a3
{
  id v3 = a3;
  id v8 = +[UIImage _systemImageNamed:@"headphones"];
  id v4 = [objc_alloc((Class)UIImageView) initWithImage:v8];
  id v5 = +[UIColor systemGrayColor];
  [v4 setTintColor:v5];

  id v6 = +[UIFont systemFontOfSize:18.0];
  id v7 = +[UIImageSymbolConfiguration configurationWithFont:v6];
  [v4 setPreferredSymbolConfiguration:v7];

  [v4 setContentMode:4];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [v3 addSubview:v4];
}

- (void)createCustomView:(id)a3 WithCustomIconName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)UIImageView);
  id v8 = +[UIImage imageNamed:v5];

  id v9 = [v7 initWithImage:v8];
  [v9 setContentMode:2];
  [v6 bounds];
  objc_msgSend(v9, "setFrame:");
  [v9 setAutoresizingMask:18];
  [v6 addSubview:v9];
}

- (void)createCustomView:(id)a3 WithCustomIconPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [objc_alloc((Class)UIImage) initWithContentsOfFile:v5];

  id v7 = [objc_alloc((Class)UIImageView) initWithImage:v8];
  [v7 setContentMode:2];
  [v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAutoresizingMask:18];
  [v6 addSubview:v7];
}

- (void)createCustomView:(id)a3 WithImage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)UIImageView) initWithImage:v5];

  [v7 setContentMode:2];
  [v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAutoresizingMask:18];
  [v6 addSubview:v7];
}

- (void)createCustomAVPlayerLayerView:(id)a3 WithCustomIconName:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(BTMediaPlayerView);
  id v7 = objc_alloc_init((Class)AVPlayer);
  [v7 setAllowsExternalPlayback:0];
  [v7 setPreventsDisplaySleepDuringVideoPlayback:0];
  [v7 _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:1];
  v36 = v7;
  [(BTMediaPlayerView *)v6 setAvPlayer:v7];
  p_mediaPlayerView = &self->_mediaPlayerView;
  CFStringRef v37 = v6;
  objc_storeStrong((id *)&self->_mediaPlayerView, v6);
  [(BTMediaPlayerView *)self->_mediaPlayerView setBackgroundColor:0];
  [v5 addSubview:self->_mediaPlayerView];
  [(BTMediaPlayerView *)self->_mediaPlayerView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_isFirstInstance)
  {
    objc_storeStrong((id *)&self->_mediaPlayerViewFirstInstance, *p_mediaPlayerView);
    self->_isFirstInstance = 0;
  }
  v35 = [(BTMediaPlayerView *)*p_mediaPlayerView centerXAnchor];
  v34 = [v5 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v40[0] = v33;
  id v9 = [(BTMediaPlayerView *)*p_mediaPlayerView centerYAnchor];
  double v10 = [v5 centerYAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v40[1] = v11;
  [(BTMediaPlayerView *)*p_mediaPlayerView widthAnchor];
  v12 = double v39 = self;
  id v13 = [v5 widthAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  v40[2] = v14;
  v32 = (id *)p_mediaPlayerView;
  double v15 = [(BTMediaPlayerView *)*p_mediaPlayerView heightAnchor];
  uint64_t v38 = v5;
  double v16 = [v5 heightAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16];
  v40[3] = v17;
  double v18 = +[NSArray arrayWithObjects:v40 count:4];

  double v19 = v39;
  +[NSLayoutConstraint activateConstraints:v18];
  if ([(BluetoothUIServiceBanner *)v39 checkifVideoAssetExists])
  {
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v39->_leadingAccessoryIconName];
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%@-Loop", v20];
    id v22 = objc_alloc((Class)NSString);
    id v23 = [(BluetoothUIServiceBanner *)v39 removedAccessoryColorCode:v39->_leadingAccessoryIconName];
    id v24 = [v22 initWithFormat:@"%@-mov", v23];

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    id v26 = [v25 pathForResource:v21 ofType:@"mov" inDirectory:v24];

    if (!v26)
    {
      leadingAccessoryIconName = v39->_leadingAccessoryIconName;
      v39->_leadingAccessoryIconName = (NSString *)@"Banner-PID-8206";

      id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v39->_leadingAccessoryIconName];
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%@-Loop", v28];
      id v30 = [objc_alloc((Class)NSString) initWithFormat:@"%@-mov", v39->_leadingAccessoryIconName];
      v31 = +[NSBundle bundleForClass:objc_opt_class()];
      id v26 = [v31 pathForResource:v29 ofType:@"mov" inDirectory:v30];

      double v19 = v39;
    }
    [*v32 loadMovieLoopWithPath:v26 bannerInstance:v19];
  }
}

- (void)createCustomStaticImageView:(id)a3 WithCustomIconName:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)UIImageView);
  [v5 addSubview:v6];
  [v6 setBackgroundColor:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  p_imageView = &self->_imageView;
  v36 = v6;
  objc_storeStrong((id *)&self->_imageView, v6);
  unsigned int v8 = [(BluetoothUIServiceBanner *)self isNewAsset:self->_leadingAccessoryIconName];
  id v9 = objc_alloc((Class)NSString);
  if (v8)
  {
    CFStringRef v10 = @"%@-Seed";
    id v11 = [v9 initWithFormat:@"%@-Seed", self->_leadingAccessoryIconName];
  }
  else
  {
    CFStringRef v10 = @"%@";
    id v11 = [v9 initWithFormat:@"%@", self->_leadingAccessoryIconName];
  }
  id v12 = v11;
  id v13 = objc_alloc((Class)NSString);
  id v14 = [(BluetoothUIServiceBanner *)self removedAccessoryColorCode:self->_leadingAccessoryIconName];
  id v29 = v12;
  id v30 = objc_msgSend(v13, "initWithFormat:", v10, v14);

  double v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v35 = [v15 pathForResource:v12 ofType:@"png" inDirectory:v30];

  double v16 = +[UIImage imageWithContentsOfFile:v35];
  [(UIImageView *)*p_imageView setImage:v16];

  v34 = [(UIImageView *)*p_imageView centerXAnchor];
  v33 = [v5 centerXAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v37[0] = v32;
  double v17 = [(UIImageView *)*p_imageView centerYAnchor];
  double v18 = [v5 centerYAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  v37[1] = v19;
  id v20 = [(UIImageView *)*p_imageView widthAnchor];
  id v21 = [v5 widthAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21];
  v37[2] = v22;
  uint64_t v23 = [(UIImageView *)*p_imageView heightAnchor];
  id v24 = v5;
  v31 = v5;
  v25 = (void *)v23;
  id v26 = [v24 heightAnchor];
  uint64_t v27 = [v25 constraintEqualToAnchor:v26];
  v37[3] = v27;
  id v28 = +[NSArray arrayWithObjects:v37 count:4];

  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)createCustomStaticImageView:(id)a3 withIcon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  [v7 addSubview:v8];
  [(UIImageView *)v8 setBackgroundColor:0];
  [(UIImageView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  imageView = self->_imageView;
  self->_imageView = v8;
  uint64_t v23 = v8;

  [(UIImageView *)self->_imageView setImage:v6];
  id v22 = [(UIImageView *)self->_imageView centerXAnchor];
  id v21 = [v7 centerXAnchor];
  id v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  CFStringRef v10 = [(UIImageView *)self->_imageView centerYAnchor];
  id v11 = [v7 centerYAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  v24[1] = v12;
  id v13 = [(UIImageView *)self->_imageView widthAnchor];
  id v14 = [v7 widthAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  v24[2] = v15;
  double v16 = [(UIImageView *)self->_imageView heightAnchor];
  double v17 = [v7 heightAnchor];

  double v18 = [v16 constraintEqualToAnchor:v17];
  v24[3] = v18;
  double v19 = +[NSArray arrayWithObjects:v24 count:4];

  +[NSLayoutConstraint activateConstraints:v19];
}

- (id)createInUseConnectButton
{
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"CONNECT" value:&stru_1000188C0 table:0];

  int v5 = SBUIIsSystemApertureEnabled();
  id v6 = +[UIButton buttonWithType:1];
  [v6 setTitle:v4 forState:0];
  id v7 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline variant:1024];
  unsigned int v8 = [v6 titleLabel];
  [v8 setFont:v7];

  if (v5)
  {
    id v9 = [v6 titleLabel];
    [v9 setAdjustsFontSizeToFitWidth:1];

    CFStringRef v10 = [v6 titleLabel];
    [v10 setMinimumScaleFactor:0.5];

    id v11 = +[UIColor systemBlueColor];
    id v12 = [v11 colorWithAlphaComponent:0.4];
    [v6 setBackgroundColor:v12];

    [v6 _setCornerRadius:15.0];
    [v6 setUserInteractionEnabled:1];
    objc_msgSend(v6, "setContentEdgeInsets:", 8.0, 16.0, 8.0, 16.0);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = [v6 widthAnchor];
    [v6 intrinsicContentSize];
    id v14 = objc_msgSend(v13, "constraintEqualToConstant:");
    id v21 = v14;
    double v15 = &v21;
  }
  else
  {
    double v16 = +[UIColor labelColor];
    [v6 setTintColor:v16];

    double v17 = +[UIColor secondarySystemFillColor];
    [v6 setBackgroundColor:v17];

    [v6 _setCornerRadius:15.0];
    [v6 setUserInteractionEnabled:1];
    objc_msgSend(v6, "setContentEdgeInsets:", 8.0, 16.0, 8.0, 16.0);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = [v6 widthAnchor];
    [v6 intrinsicContentSize];
    id v14 = objc_msgSend(v13, "constraintEqualToConstant:");
    id v20 = v14;
    double v15 = &v20;
  }
  double v18 = +[NSArray arrayWithObjects:v15 count:1];
  +[NSLayoutConstraint activateConstraints:v18];

  [v6 addTarget:self action:"handleTap:" forControlEvents:64];

  return v6;
}

- (id)createReverseButton
{
  id v3 = +[UIButtonConfiguration tintedButtonConfiguration];
  id v4 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:13.0];
  int v5 = +[UIImage systemImageNamed:@"arrow.uturn.backward"];
  id v6 = [v5 imageWithRenderingMode:2];

  [v3 setImage:v6];
  [v3 setPreferredSymbolConfigurationForImage:v4];
  id v7 = +[UIColor systemBlueColor];
  unsigned int v8 = [v7 colorWithAlphaComponent:0.4];
  id v9 = [v3 background];
  [v9 setBackgroundColor:v8];

  CFStringRef v10 = [v3 background];
  [v10 setCornerRadius:15.0];

  id v11 = +[SBUISystemApertureButton buttonWithConfiguration:v3 primaryAction:0];
  [v11 setConfiguration:v3];
  [v11 setUserInteractionEnabled:1];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [v11 widthAnchor];
  [v11 intrinsicContentSize];
  id v14 = [v12 constraintEqualToConstant:v13 + 30.0];
  double v17 = v14;
  double v15 = +[NSArray arrayWithObjects:&v17 count:1];
  +[NSLayoutConstraint activateConstraints:v15];

  [v11 addTarget:self action:"handleTap:" forControlEvents:64];

  return v11;
}

- (id)removedAccessoryColorCode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSString);
  int v5 = [v3 componentsSeparatedByString:@"-"];
  id v6 = +[NSMutableArray arrayWithArray:v5];
  id v7 = [v5 lastObject];
  if ((unint64_t)[v7 length] <= 3)
  {

    goto LABEL_9;
  }
  unsigned int v8 = [v5 lastObject];
  unsigned int v9 = [v8 containsString:@"default"];

  if (v9)
  {
LABEL_9:
    [v6 removeLastObject];
    id v13 = [v6 componentsJoinedByString:@"-"];

    if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  CFStringRef v10 = [v5 lastObject];
  if (([v10 containsString:@"Case"] & 1) == 0)
  {

    goto LABEL_15;
  }
  id v11 = objc_msgSend(v6, "objectAtIndex:", (char *)objc_msgSend(v6, "count") - 2);
  id v12 = [v11 length];

  if ((unint64_t)v12 > 2)
  {
LABEL_15:
    id v13 = v3;

    goto LABEL_16;
  }
  objc_msgSend(v6, "removeObjectAtIndex:", (char *)objc_msgSend(v6, "count") - 2);
  id v13 = [v6 componentsJoinedByString:@"-"];

  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
LABEL_11:
  }
    LogPrintF();
LABEL_16:

  return v13;
}

- (BOOL)checkifVideoAssetExists
{
  leadingAccessoryIconName = self->_leadingAccessoryIconName;
  if (leadingAccessoryIconName) {
    LOBYTE(leadingAccessoryIconName) = ![(NSString *)leadingAccessoryIconName containsString:@"8197"]&& ![(NSString *)self->_leadingAccessoryIconName containsString:@"8205"]&& ![(NSString *)self->_leadingAccessoryIconName containsString:@"8208"]&& ![(NSString *)self->_leadingAccessoryIconName containsString:@"8218"]&& ![(NSString *)self->_leadingAccessoryIconName containsString:@"8195"];
  }
  return (char)leadingAccessoryIconName;
}

- (id)createMuteUnmuteButton:(id)a3
{
  id v3 = a3;
  id v4 = +[UIButtonConfiguration tintedButtonConfiguration];
  unsigned int v5 = [v3 isEqualToString:@"mute"];

  if (v5) {
    CFStringRef v6 = @"mic.slash.fill";
  }
  else {
    CFStringRef v6 = @"mic.fill";
  }
  id v7 = +[UIImage systemImageNamed:v6];
  [v4 setImage:v7];
  id v8 = objc_alloc((Class)UIImageView);
  [v7 size];
  double v10 = v9;
  [v7 size];
  id v12 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, v10, v11);
  if (SBUIIsSystemApertureEnabled())
  {
    id v13 = +[UIColor systemGray6Color];
    id v14 = [v4 background];
    [v14 setBackgroundColor:v13];

    [v4 setCornerStyle:4];
    double v15 = +[UIColor whiteColor];
    double v16 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v15];

    [v7 size];
    double v18 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:v17];
    double v19 = [v16 configurationByApplyingConfiguration:v18];
    [v12 setPreferredSymbolConfiguration:v19];
    id v20 = +[UIColor whiteColor];
    [v12 setTintColor:v20];

    [v4 setPreferredSymbolConfigurationForImage:v19];
  }
  else
  {
    id v21 = +[UIBlurEffect effectWithStyle:8];
    double v16 = +[UIVibrancyEffect effectForBlurEffect:v21 style:6];

    id v22 = +[UIColor systemGray6Color];
    uint64_t v23 = [v4 background];
    [v23 setBackgroundColor:v22];

    id v24 = [v4 background];
    [v24 setVisualEffect:v16];

    v25 = [v4 background];
    [v25 setCornerRadius:15.0];

    id v26 = +[UIColor blackColor];
    double v18 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v26];

    double v19 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:16.0];
    uint64_t v27 = [v18 configurationByApplyingConfiguration:v19];
    [v12 setPreferredSymbolConfiguration:v27];
    id v28 = +[UIColor blackColor];
    [v12 setTintColor:v28];

    [v4 setPreferredSymbolConfigurationForImage:v27];
  }

  id v29 = +[SBUISystemApertureButton buttonWithConfiguration:v4 primaryAction:0];
  [v29 setConfiguration:v4];
  [v29 setUserInteractionEnabled:1];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v30 = [v29 widthAnchor];
  [v29 intrinsicContentSize];
  v32 = [v30 constraintEqualToConstant:v31 + 30.0];
  v35 = v32;
  v33 = +[NSArray arrayWithObjects:&v35 count:1];
  +[NSLayoutConstraint activateConstraints:v33];

  return v29;
}

- (BOOL)isNewAsset:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"-"];
  if (![v3 count])
  {
LABEL_9:
    double v11 = 0;
    BOOL v14 = 0;
    goto LABEL_10;
  }
  unint64_t v4 = 0;
  unsigned int v5 = 1;
  while (1)
  {
    CFStringRef v6 = [v3 objectAtIndexedSubscript:v4];
    unint64_t v4 = v5;
    if (![v6 isEqualToString:@"PID"]
      || (unint64_t)[v3 count] <= v5)
    {

      goto LABEL_8;
    }
    id v7 = [v3 count];

    if ((unint64_t)v7 > v5 + 1) {
      break;
    }
LABEL_8:
    ++v5;
    if ((unint64_t)[v3 count] <= v4) {
      goto LABEL_9;
    }
  }
  double v11 = [v3 objectAtIndexedSubscript:v5];
  id v12 = [v3 objectAtIndexedSubscript:v5 + 1];
  unsigned __int8 v13 = [v12 intValue];

  BOOL v14 = (v13 & 0xFE) == 6;
LABEL_10:
  id v8 = +[NSString stringWithFormat:@"%d", 8218];
  unsigned __int8 v9 = [v8 isEqualToString:v11];

  return v9 & v14;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)BluetoothUIServiceBanner;
  [(BluetoothUIServiceBanner *)&v23 viewDidLoad];
  id v3 = [(BluetoothUIServiceBanner *)self view];
  if ((SBUIIsSystemApertureEnabled() & 1) == 0)
  {
    [v3 addSubview:self->_pillView];
    unint64_t v4 = [(PLPillView *)self->_pillView leadingAnchor];
    unsigned int v5 = [v3 leadingAnchor];
    CFStringRef v6 = [v4 constraintEqualToAnchor:v5];
    [v6 setActive:1];

    id v7 = [(PLPillView *)self->_pillView trailingAnchor];
    id v8 = [v3 trailingAnchor];
    unsigned __int8 v9 = [v7 constraintEqualToAnchor:v8];
    [v9 setActive:1];

    double v10 = [(PLPillView *)self->_pillView topAnchor];
    double v11 = [v3 topAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    unsigned __int8 v13 = [(PLPillView *)self->_pillView bottomAnchor];
    BOOL v14 = [v3 bottomAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];
  }
  id v16 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  [v16 setNumberOfTapsRequired:1];
  [v16 setNumberOfTouchesRequired:1];
  if (!SBUIIsSystemApertureEnabled())
  {
    if (self->_bannerType == 2) {
      goto LABEL_11;
    }
    pillView = self->_pillView;
LABEL_10:
    [(PLPillView *)pillView addGestureRecognizer:v16];
    goto LABEL_11;
  }
  double v17 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
  [v17 setMarqueeRunning:1];

  double v18 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
  [v18 setMarqueeRunning:1];

  double v19 = [(BluetoothUIServiceBanner *)self view];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v20 = (OS_os_transaction *)os_transaction_create();
  bannerAssetTransaction = self->_bannerAssetTransaction;
  self->_bannerAssetTransaction = v20;

  [(BTMediaPlayerView *)self->_mediaPlayerView setHidden:0];
  if (!self->_isReverseRouteBanner && !self->_isInUseBanner)
  {
    pillView = (PLPillView *)v3;
    if (self->_bannerType != 2) {
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)viewWillLayoutSubviews
{
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v3.receiver = self;
  v3.super_class = (Class)BluetoothUIServiceBanner;
  [(BluetoothUIServiceBanner *)&v3 viewWillLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BluetoothUIServiceBanner;
  [(BluetoothUIServiceBanner *)&v3 viewWillAppear:a3];
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BluetoothUIServiceBanner;
  [(BluetoothUIServiceBanner *)&v4 viewDidAppear:a3];
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(BluetoothUIServiceBanner *)self setBannerTimer];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BluetoothUIServiceBanner;
  [(BluetoothUIServiceBanner *)&v8 viewWillDisappear:a3];
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (SBUIIsSystemApertureEnabled())
  {
    [(BTMediaPlayerView *)self->_mediaPlayerView stop];
    mediaPlayerViewFirstInstance = self->_mediaPlayerViewFirstInstance;
    if (mediaPlayerViewFirstInstance) {
      [(BTMediaPlayerView *)mediaPlayerViewFirstInstance stop];
    }
    unsigned int v5 = [(BluetoothUIServiceBanner *)self ccTopViewLabel];
    [v5 setMarqueeRunning:0];

    CFStringRef v6 = [(BluetoothUIServiceBanner *)self ccBottomViewLabel];
    [v6 setMarqueeRunning:0];

    bannerAssetTransaction = self->_bannerAssetTransaction;
    self->_bannerAssetTransaction = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BluetoothUIServiceBanner;
  [(BluetoothUIServiceBanner *)&v8 viewDidDisappear:a3];
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_bannerActive)
  {
    self->_bannerActive = 0;
    id actionHandler = self->_actionHandler;
    if (actionHandler)
    {
      id v5 = objc_retainBlock(actionHandler);
      CFStringRef v6 = v5;
      if (v5) {
        (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 2, 0);
      }

      id v7 = self->_actionHandler;
      self->_id actionHandler = 0;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleTap:(id)a3
{
  id actionHandler = a3;
  id v5 = actionHandler;
  if (dword_10001EDF0 <= 50)
  {
    id v9 = actionHandler;
    if (dword_10001EDF0 != -1 || (id actionHandler = (id)_LogCategory_Initialize(), v5 = v9, actionHandler))
    {
      id actionHandler = (id)LogPrintF();
      id v5 = v9;
    }
  }
  if (self->_bannerActive)
  {
    id actionHandler = self->_actionHandler;
    if (actionHandler)
    {
      id v10 = v5;
      id v6 = objc_retainBlock(actionHandler);
      id v7 = v6;
      if (v6) {
        (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
      }

      id v8 = self->_actionHandler;
      self->_id actionHandler = 0;

      id v5 = v10;
    }
  }

  _objc_release_x1(actionHandler, v5);
}

- (void)bannerDidDismiss:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_10001EDF0 <= 50)
  {
    id v5 = v3;
    if (dword_10001EDF0 != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }

  _objc_release_x1(v3, v4);
}

- (void)dismissBanner
{
  if (self->_bannerActive)
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 bundleIdentifier];
    id v5 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:v4];

    id v6 = [(BluetoothUIServiceBanner *)self requestIdentifier];
    CFStringRef v17 = @"Key";
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    double v18 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v16 = 0;
    [v5 revokePresentableWithRequestIdentifier:v6 animated:1 reason:@"_BUISScheduledTimeout" userInfo:v9 error:&v16];
    id v10 = v16;

    if (v10)
    {
      if (dword_10001EDF0 <= 90 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_10001EDF0 <= 50 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_bannerActive = 0;
      bannerTransaction = self->_bannerTransaction;
      self->_bannerTransaction = 0;

      id actionHandler = self->_actionHandler;
      if (actionHandler)
      {
        id v13 = objc_retainBlock(actionHandler);
        BOOL v14 = v13;
        if (v13) {
          (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 6, 0);
        }

        id v15 = self->_actionHandler;
        self->_id actionHandler = 0;
      }
    }
  }
}

- (void)setBannerTimer
{
  if ((SBUIIsSystemApertureEnabled() & 1) == 0)
  {
    double bannerTimeoutInSeconds = self->_bannerTimeoutInSeconds;
    if (bannerTimeoutInSeconds != 0.0)
    {
      if (dword_10001EDF0 <= 50)
      {
        if (dword_10001EDF0 != -1
          || (int v4 = _LogCategory_Initialize(), bannerTimeoutInSeconds = self->_bannerTimeoutInSeconds, v4))
        {
          LogPrintF();
          double bannerTimeoutInSeconds = self->_bannerTimeoutInSeconds;
        }
      }
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(bannerTimeoutInSeconds * 1000000000.0));
      bannerTimer = self->_bannerTimer;
      if (bannerTimer)
      {
        dispatch_source_set_timer(bannerTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        id v8 = self->_bannerTimer;
        self->_bannerTimer = v7;

        id v9 = self->_bannerTimer;
        if (v9)
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_10000F8BC;
          handler[3] = &unk_1000185C0;
          handler[4] = self;
          dispatch_source_set_event_handler(v9, handler);
          dispatch_source_set_timer((dispatch_source_t)self->_bannerTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
          dispatch_resume((dispatch_object_t)self->_bannerTimer);
        }
        else
        {
          uint64_t v10 = FatalErrorF();
          sub_10000F8BC(v10);
        }
      }
    }
  }
}

- (UIEdgeInsets)bannerContentOutsets
{
  [(BluetoothUIServiceBanner *)self loadViewIfNeeded];
  pillView = self->_pillView;

  [(PLPillView *)pillView shadowOutsets];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  [(PLPillView *)self->_pillView intrinsicContentSize];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (id)_bundleID
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9B4;
  block[3] = &unk_100018608;
  void block[4] = a1;
  if (qword_10001F108 != -1) {
    dispatch_once(&qword_10001F108, block);
  }
  v2 = (void *)qword_10001F100;

  return v2;
}

- (NSString)requesterIdentifier
{
  v2 = objc_opt_class();

  return (NSString *)[v2 _bundleID];
}

- (NSString)requestIdentifier
{
  if (!self->_requestIdentifier)
  {
    identifier = self->_identifier;
    if (identifier)
    {
      double v4 = identifier;
      requestIdentifier = self->_requestIdentifier;
      self->_requestIdentifier = v4;
    }
    else
    {
      requestIdentifier = +[NSUUID UUID];
      double v6 = [requestIdentifier UUIDString];
      double v7 = self->_requestIdentifier;
      self->_requestIdentifier = v6;
    }
  }
  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = self->_requestIdentifier;

  return v8;
}

- (int64_t)presentableType
{
  self->_presentableType = 1;
  return 1;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return self->_associatedScenePersistenceIdentifier;
}

- (BTUIBatteryLevelIndicator)batteryLevelIndicator
{
  return self->_batteryLevelIndicator;
}

- (void)setBatteryLevelIndicator:(id)a3
{
}

- (_UIStaticBatteryView)batteryView
{
  return self->_batteryView;
}

- (void)setBatteryView:(id)a3
{
}

- (UILabel)ccBottomViewLabel
{
  return self->_ccBottomViewLabel;
}

- (void)setCcBottomViewLabel:(id)a3
{
}

- (UILabel)ccTopViewLabel
{
  return self->_ccTopViewLabel;
}

- (void)setCcTopViewLabel:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (UIStackView)verticalTrailingStackView
{
  return self->_verticalTrailingStackView;
}

- (void)setVerticalTrailingStackView:(id)a3
{
}

- (BUISAgentXPCConnection)xpcCon
{
  return self->_xpcCon;
}

- (void)setXpcCon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCon, 0);
  objc_storeStrong((id *)&self->_verticalTrailingStackView, 0);
  objc_storeStrong((id *)&self->_ccTopViewLabel, 0);
  objc_storeStrong((id *)&self->_ccBottomViewLabel, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_batteryLevelIndicator, 0);
  objc_storeStrong((id *)&self->_associatedScenePersistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_receivedMuteAction, 0);
  objc_storeStrong((id *)&self->_muteUnmuteButton, 0);
  objc_storeStrong((id *)&self->_bannerAppID, 0);
  objc_storeStrong((id *)&self->_revokeButton, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_trailingViewWidth, 0);
  objc_storeStrong((id *)&self->_trailingViewHeight, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryText, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryIconPath, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryIconName, 0);
  objc_storeStrong((id *)&self->_minimalAccessoryView, 0);
  objc_storeStrong((id *)&self->_mediaPlayerViewFirstInstance, 0);
  objc_storeStrong((id *)&self->_mediaPlayerView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryIconPath, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryIconName, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_customItems, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_constraintsForLayoutMode, 0);
  objc_storeStrong((id *)&self->_collapseButton, 0);
  objc_storeStrong((id *)&self->_centerContentText, 0);
  objc_storeStrong((id *)&self->_centerContentItems, 0);
  objc_storeStrong((id *)&self->_ccItemsText, 0);
  objc_storeStrong((id *)&self->_ccItemsIcon, 0);
  objc_storeStrong((id *)&self->_ccText, 0);
  objc_storeStrong((id *)&self->_bannerTransaction, 0);
  objc_storeStrong((id *)&self->_bannerTimer, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_bannerAssetTransaction, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong(&self->_actionHandler, 0);

  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end