void sub_1000050A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000050C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000353D8((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained invalidate];
    v7 = [v3 domain];
    if ([v7 isEqualToString:SBSLockScreenContentAssertionErrorDomain])
    {
      id v8 = [v3 code];

      if (v8 == (id)4) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    [v6 delayAcquire];
  }
LABEL_9:
}

id sub_100005220(uint64_t a1)
{
  return [*(id *)(a1 + 32) acquire];
}

uint64_t sub_100005300()
{
  if (qword_10005DF80 != -1) {
    dispatch_once(&qword_10005DF80, &stru_100049478);
  }
  return byte_10005DF88;
}

void sub_100005344(id a1)
{
  byte_10005DF88 = MGGetBoolAnswer();
}

uint64_t start(int a1, char **a2)
{
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = UIApplicationMain(a1, a2, v5, v7);

  return v8;
}

id sub_1000054F0()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v1 = [self mru_suggestedRouteBannerTitleFont];
  [v0 setFont:v1];

  id v2 = [self labelColor];
  [v0 setTextColor:v2];

  LODWORD(v3) = 1144750080;
  [v0 setContentCompressionResistancePriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [v0 setContentCompressionResistancePriority:1 forAxis:v4];
  return v0;
}

double sub_1000055EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

char *sub_100005660(uint64_t a1)
{
  uint64_t v3 = sub_1000075A0((uint64_t *)&unk_10005C360);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel;
  uint64_t v8 = v1;
  *(void *)&v1[v7] = sub_1000054F0();
  uint64_t v9 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView;
  id v10 = [objc_allocWithZone((Class)MRUCAPackageView) init];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v8[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide;
  *(void *)&v8[v11] = [objc_allocWithZone((Class)UILayoutGuide) init];
  uint64_t v12 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide;
  *(void *)&v8[v12] = [objc_allocWithZone((Class)UILayoutGuide) init];
  *(void *)&v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding] = 0x4020000000000000;
  v13 = &v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth];
  v42[0] = 0;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v6, v3);
  v14 = &v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v14 = *(_OWORD *)a1;
  *((_OWORD *)v14 + 1) = v15;
  long long v16 = *(_OWORD *)(a1 + 80);
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v14 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v14 + 5) = v16;
  *((_OWORD *)v14 + 2) = v18;
  *((_OWORD *)v14 + 3) = v17;
  long long v19 = *(_OWORD *)(a1 + 144);
  long long v21 = *(_OWORD *)(a1 + 96);
  long long v20 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v14 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v14 + 9) = v19;
  *((_OWORD *)v14 + 6) = v21;
  *((_OWORD *)v14 + 7) = v20;
  long long v23 = *(_OWORD *)(a1 + 176);
  long long v22 = *(_OWORD *)(a1 + 192);
  long long v24 = *(_OWORD *)(a1 + 160);
  *((void *)v14 + 26) = *(void *)(a1 + 208);
  *((_OWORD *)v14 + 11) = v23;
  *((_OWORD *)v14 + 12) = v22;
  *((_OWORD *)v14 + 10) = v24;
  sub_1000075E4((void *)a1);

  v25 = (objc_class *)type metadata accessor for SuggestedRouteBannerTitleView();
  v40.receiver = v8;
  v40.super_class = v25;
  v26 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v27 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView;
  v28 = *(void **)&v26[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
  v29 = self;
  v30 = v26;
  id v31 = v28;
  id v32 = [v29 suggestedRouteWaveformPackageName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v33 = objc_allocWithZone((Class)MRUCAPackageAsset);
  NSString v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v35 = [v33 initWithPackageName:v34];

  [v31 setAsset:v35];
  v36 = *(void **)&v26[v27];
  [v36 setScale:0.3017];
  LODWORD(v37) = 1148846080;
  [v36 setContentCompressionResistancePriority:0 forAxis:v37];
  [v30 addLayoutGuide:*(void *)&v30[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide]];
  [v30 addLayoutGuide:*(void *)&v30[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide]];
  [v30 addSubview:*(void *)&v30[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel]];
  [v30 addSubview:v36];
  sub_100005A20();
  sub_1000076D0((uint64_t)v42);
  sub_1000076F8((uint64_t)v42, (uint64_t)v41);
  sub_100006108((uint64_t)v41);
  sub_100007760((void *)a1);

  return v30;
}

void sub_100005A20()
{
  double v1 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel];
  id v2 = [v1 trailingAnchor];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide];
  id v4 = [v3 leadingAnchor];
  id v5 = [v2 constraintEqualToAnchor:v4];

  v6 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint];
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint] = v5;

  id v7 = [v1 trailingAnchor];
  id v38 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
  id v8 = [v38 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 constant:-*(double *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding]];

  id v10 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint];
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint] = v9;

  double v37 = self;
  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100037A60;
  uint64_t v12 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide];
  id v13 = [v12 leadingAnchor];
  id v14 = [v0 leadingAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  *(void *)(v11 + 32) = v15;
  id v16 = [v3 trailingAnchor];
  id v17 = [v0 trailingAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];

  *(void *)(v11 + 40) = v18;
  id v19 = [v12 widthAnchor];
  id v20 = [v3 widthAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];

  *(void *)(v11 + 48) = v21;
  id v22 = [v1 leadingAnchor];
  id v23 = [v12 trailingAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];

  *(void *)(v11 + 56) = v24;
  id v25 = [v1 topAnchor];
  id v26 = [v0 topAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];

  *(void *)(v11 + 64) = v27;
  id v28 = [v1 bottomAnchor];
  id v29 = [v0 bottomAnchor];
  id v30 = [v28 constraintEqualToAnchor:v29];

  *(void *)(v11 + 72) = v30;
  id v31 = [v38 centerYAnchor];
  id v32 = [v0 centerYAnchor];
  id v33 = [v31 constraintEqualToAnchor:v32];

  *(void *)(v11 + 80) = v33;
  id v34 = [v38 trailingAnchor];
  id v35 = [v3 leadingAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35];

  *(void *)(v11 + 88) = v36;
  specialized Array._endMutation()();
  sub_100007868();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v37 activateConstraints:isa];
}

double sub_100005F54()
{
  double v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel);
  [v1 intrinsicContentSize];
  double v3 = v2;
  double v4 = *(double *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding);
  [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView) intrinsicContentSize];
  double v6 = v5;
  id v7 = [v1 text];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  swift_bridgeObjectRelease();
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v12)
  {
LABEL_5:
    NSString v13 = String._bridgeToObjectiveC()();
    [v1 setText:v13];
  }
  [v1 intrinsicContentSize];
  return v3 + v4 + v6;
}

id sub_100006108(uint64_t a1)
{
  double v3 = &v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 40];
  sub_1000076F8(a1, (uint64_t)v22);
  if (sub_100007850((uint64_t)v22) != 1
    && (v5 == v23 ? (BOOL v9 = v4 == v24) : (BOOL v9 = 0), v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    char v8 = 1;
  }
  else
  {
    double v6 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel];
    swift_bridgeObjectRetain();
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v6 setText:v7];

    char v8 = 0;
  }
  uint64_t v10 = v3[112];
  sub_1000076F8(a1, (uint64_t)v21);
  id result = (id)sub_100007850((uint64_t)v21);
  if (result == 1 || (v21[112] & 1) != v10)
  {
    uint64_t v12 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint];
    if (v12)
    {
      NSString v13 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint];
      if (v13)
      {
        id v14 = v12;
        id v15 = v13;
        [v14 setActive:v10];
        [v15 setActive:(v3[112] & 1) == 0];
      }
    }
    id v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel];
    if (v3[112] == 1)
    {
      [v16 setTextAlignment:2];
      id v17 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
      NSString v18 = [self suggestedRouteWaveformPackageStateOn];
      if (!v18)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v18 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      [v17 setGlyphState:v18];

      [v17 setAlpha:1.0];
    }
    else
    {
      [v16 setTextAlignment:1];
      id v19 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
      NSString v20 = [self suggestedRouteWaveformPackageStateOff];
      if (!v20)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v20 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      [v19 setGlyphState:v20];

      [v19 setAlpha:0.0];
    }
    return [v1 invalidateIntrinsicContentSize];
  }
  if ((v8 & 1) == 0) {
    return [v1 invalidateIntrinsicContentSize];
  }
  return result;
}

id sub_100006400()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerTitleView();
  return [super dealloc];
}

uint64_t variable initialization expression of LockScreenCoordinator.artwork()
{
  return 0;
}

double variable initialization expression of LockScreenCoordinator.bottomBounds@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t variable initialization expression of LockScreenCoordinator.platterContentSize()
{
  return 0;
}

id variable initialization expression of LockScreenCoordinator.wallpaperService()
{
  id v0 = objc_allocWithZone((Class)SBSWallpaperService);

  return [v0 init];
}

uint64_t variable initialization expression of LockScreenCoordinator.prefersExpandedState()
{
  return MRPrefersExpandedLockScreenPlatter();
}

uint64_t variable initialization expression of LockScreenCoordinator.shouldExpandWhenAmbientSceneDisconnects()
{
  return 0;
}

double variable initialization expression of LockScreenCoordinator.ambientLifecycleCancellable@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_1000065F0()
{
  return type metadata accessor for SuggestedRouteBannerTitleView();
}

uint64_t type metadata accessor for SuggestedRouteBannerTitleView()
{
  uint64_t result = qword_10005C250;
  if (!qword_10005C250) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006644()
{
  sub_1000078D0(319, (unint64_t *)&qword_10005C260, (uint64_t)&type metadata for CGFloat, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void type metadata accessor for MRGroupSessionRouteType(uint64_t a1)
{
}

__n128 sub_100006758(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006768(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006788(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SuggestedRoute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000680C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006818(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006838(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureCustomLayout(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
}

void type metadata accessor for BNPresentableBehavior(uint64_t a1)
{
}

uint64_t sub_100006954(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t sub_100006968(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006988(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 12) = v3;
  return result;
}

void type metadata accessor for CAFrameRateRange(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

double sub_100006A04@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100006A84(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100006AFC(uint64_t a1, uint64_t a2)
{
  return sub_100007088(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006B14(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100006B8C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100006C0C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_100006C50(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_100006C58(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_100006C6C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100006C80(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100006CB0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100006CC4(void *result)
{
  *v1 &= *result;
  return result;
}

void sub_100006CDC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100006CE8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100006CFC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *sub_100006D10@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100006D3C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100006D60(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100006D74@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100006D88(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100006D9C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100006DB0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100006DC4()
{
  return *v0 == 0;
}

uint64_t sub_100006DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100006DEC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void sub_100006E00(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100006E0C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100006E18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006E44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100007568(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_100006E84@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100006ECC(uint64_t a1)
{
  uint64_t v2 = sub_100007018(&qword_10005C350, type metadata accessor for SBUISystemApertureElementIdentifier);
  uint64_t v3 = sub_100007018(&qword_10005C358, type metadata accessor for SBUISystemApertureElementIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006F88()
{
  return sub_100007018(&qword_10005C318, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100006FD0()
{
  return sub_100007018(&qword_10005C320, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100007018(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100007060@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100007070(uint64_t a1, uint64_t a2)
{
  return sub_100007088(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007088(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000070CC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007120()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100007194()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100007220()
{
  return sub_100007018(&qword_10005C328, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100007268()
{
  return sub_100007018(&qword_10005C330, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_1000072B0()
{
  return sub_100007018(&qword_10005C338, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_1000072F8()
{
  return sub_100007018(&qword_10005C340, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_100007340()
{
  return sub_100007018(&qword_10005C348, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

void sub_100007388()
{
  uint64_t v1 = sub_1000075A0((uint64_t *)&unk_10005C360);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel;
  *(void *)&v0[v5] = sub_1000054F0();
  uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView;
  id v7 = [objc_allocWithZone((Class)MRUCAPackageView) init];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v6] = v7;
  uint64_t v8 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide;
  *(void *)&v0[v8] = [objc_allocWithZone((Class)UILayoutGuide) init];
  uint64_t v9 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide;
  *(void *)&v0[v9] = [objc_allocWithZone((Class)UILayoutGuide) init];
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding] = 0x4020000000000000;
  uint64_t v10 = &v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth];
  v11[1] = 0;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v10, v4, v1);

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100007568(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1000075A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_1000075E4(void *a1)
{
  uint64_t v2 = (void *)a1[9];
  uint64_t v3 = (void *)a1[12];
  uint64_t v4 = (void *)a1[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v2;
  swift_bridgeObjectRetain();
  id v6 = v3;
  id v7 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

double sub_1000076D0(uint64_t a1)
{
  *(void *)(a1 + 208) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_1000076F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075A0((uint64_t *)&unk_10005D760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_100007760(void *a1)
{
  uint64_t v2 = (void *)a1[9];
  uint64_t v3 = (void *)a1[12];
  uint64_t v4 = (void *)a1[13];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100007850(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

unint64_t sub_100007868()
{
  unint64_t result = qword_10005C810;
  if (!qword_10005C810)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C810);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_1000078D0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id sub_10000794C()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack);
  }
  else
  {
    id v4 = sub_1000079B0(v0);
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1000079B0(uint64_t a1)
{
  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100037F40;
  id v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel);
  id v4 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  specialized Array._endMutation()();
  id v5 = objc_allocWithZone((Class)UIStackView);
  sub_100008C38(0, (unint64_t *)&qword_10005DA80);
  id v6 = v3;
  id v7 = v4;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v5 initWithArrangedSubviews:isa];

  [v9 setAxis:1];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v9;
}

id sub_100007ACC()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon);
  }
  else
  {
    uint64_t v4 = v0;
    self;
    char v5 = [(id)swift_dynamicCastObjCClassUnconditional() routeType];
    id v6 = objc_allocWithZone((Class)type metadata accessor for RouteIconView());
    id v7 = sub_10002DDB8(v5);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_100007BA4()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self systemImageNamed:v0];

  id v2 = [objc_allocWithZone((Class)UIImageView) initWithImage:v1];
  [v2 setContentMode:1];
  id v3 = [self secondaryLabelColor];
  [v2 setTintColor:v3];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

id sub_100007C98(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = v3;
  id v8 = [v6 init];
  id v9 = self;
  id v10 = [v9 systemFontOfSize:14.0 weight:UIFontWeightSemibold];
  [v8 setFont:v10];

  *(void *)&v3[v5] = v8;
  uint64_t v11 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel;
  id v12 = [objc_allocWithZone((Class)UILabel) init];
  id v13 = [v9 systemFontOfSize:10.0];
  [v12 setFont:v13];

  id v14 = [self secondaryLabelColor];
  [v12 setTextColor:v14];

  *(void *)&v7[v11] = v12;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack] = 0;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon] = 0;
  uint64_t v15 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon;
  *(void *)&v7[v15] = sub_100007BA4();
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode] = 1;
  swift_unknownObjectWeakInit();

  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate + 8] = 0;
  uint64_t v16 = swift_unknownObjectWeakInit();
  id v17 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(void *)id v17 = 0xD000000000000017;
  *((void *)v17 + 1) = 0x800000010003D9A0;
  v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  NSString v18 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(void *)NSString v18 = 0;
  v18[8] = 1;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a1;
  *(void *)(v16 + 8) = a3;
  swift_unknownObjectWeakAssign();
  v23.receiver = v7;
  v23.super_class = (Class)type metadata accessor for BannerBaseViewController();
  id v19 = a1;
  id v20 = [super initWithNibName:0 bundle:0];
  [v20 setPreferredContentSize:CGSizeMake(300.0, 70.0)];

  swift_unknownObjectRelease();
  return v20;
}

id sub_100007F84()
{
  id v1 = v0;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel];
  self;
  swift_dynamicCastObjCClassUnconditional();
  swift_unknownObjectRetain();
  sub_1000101BC();
  swift_unknownObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v2 setText:v3];

  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel];
  self;
  swift_dynamicCastObjCClassUnconditional();
  swift_unknownObjectRetain();
  sub_10001043C();
  swift_unknownObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v4 setText:v5];

  id result = [v1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v7 = result;
  id v8 = sub_10000794C();
  [v7 addSubview:v8];

  id result = [v1 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v9 = result;
  id v10 = sub_100007ACC();
  [v9 addSubview:v10];

  id result = [v1 view];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v11 = result;
  id v12 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon];
  [result addSubview:v12];

  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100037F50;
  id result = [v1 view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v14 = result;
  id v15 = [result SBUISA_systemApertureObstructedAreaLayoutGuide];

  id v16 = [v15 bottomAnchor];
  id v17 = sub_10000794C();
  id v18 = [v17 topAnchor];

  id v19 = [v16 constraintEqualToAnchor:v18];
  *(void *)(v13 + 32) = v19;
  id result = [v1 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v20 = result;
  id v21 = [result bottomAnchor];

  id v22 = sub_10000794C();
  id v23 = [v22 bottomAnchor];

  id v24 = [v21 constraintEqualToAnchor:v23 constant:16.0];
  *(void *)(v13 + 40) = v24;
  id v25 = sub_100007ACC();
  id v26 = [v25 trailingAnchor];

  id v27 = sub_10000794C();
  id v28 = [v27 leadingAnchor];

  id v29 = [v26 constraintEqualToAnchor:v28 constant:-8.0];
  *(void *)(v13 + 48) = v29;
  id v30 = sub_100007ACC();
  id v31 = [v30 widthAnchor];

  id v32 = [v31 constraintEqualToConstant:50.0];
  *(void *)(v13 + 56) = v32;
  id v33 = sub_100007ACC();
  id v34 = [v33 heightAnchor];

  id v35 = sub_100007ACC();
  id v36 = [v35 widthAnchor];

  id v37 = [v34 constraintEqualToAnchor:v36];
  *(void *)(v13 + 64) = v37;
  id v38 = [v12 leadingAnchor];
  id v39 = sub_10000794C();
  id v40 = [v39 trailingAnchor];

  id v41 = [v38 constraintEqualToAnchor:v40];
  *(void *)(v13 + 72) = v41;
  id v42 = [v12 widthAnchor];
  id v43 = [v42 constraintEqualToConstant:40.0];

  *(void *)(v13 + 80) = v43;
  id v44 = [v12 heightAnchor];
  id v45 = [v12 widthAnchor];
  id v46 = [v44 constraintEqualToAnchor:v45];

  *(void *)(v13 + 88) = v46;
  id result = [v1 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v47 = result;
  id v48 = [result topAnchor];

  id v49 = sub_100007ACC();
  id v50 = [v49 topAnchor];

  id v51 = [v48 constraintEqualToAnchor:v50];
  *(void *)(v13 + 96) = v51;
  id result = [v1 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v52 = result;
  id v53 = [result leadingAnchor];

  id v54 = sub_100007ACC();
  id v55 = [v54 leadingAnchor];

  id v56 = [v53 constraintEqualToAnchor:v55 constant:-16.0];
  *(void *)(v13 + 104) = v56;
  id result = [v1 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v57 = result;
  id v58 = [result bottomAnchor];

  id v59 = sub_100007ACC();
  id v60 = [v59 bottomAnchor];

  id v61 = [v58 constraintEqualToAnchor:v60];
  *(void *)(v13 + 112) = v61;
  id result = [v1 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v62 = result;
  id v63 = [result topAnchor];

  id v64 = [v12 topAnchor];
  id v65 = [v63 constraintEqualToAnchor:v64];

  *(void *)(v13 + 120) = v65;
  id result = [v1 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v66 = result;
  id v67 = [result trailingAnchor];

  id v68 = [v12 trailingAnchor];
  id v69 = [v67 constraintEqualToAnchor:v68 constant:16.0];

  *(void *)(v13 + 128) = v69;
  id result = [v1 view];
  if (result)
  {
    v70 = result;
    v71 = self;
    id v72 = [v70 bottomAnchor];

    id v73 = [v12 bottomAnchor];
    id v74 = [v72 constraintEqualToAnchor:v73];

    *(void *)(v13 + 136) = v74;
    uint64_t v77 = v13;
    specialized Array._endMutation()();
    sub_100008C38(0, (unint64_t *)&qword_10005C810);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v71 activateConstraints:isa];

    v76.receiver = v1;
    v76.super_class = (Class)type metadata accessor for GroupSessionSystemApertureViewController();
    return [super viewDidLoad];
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_100008AAC()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon));

  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext;

  return sub_100008C10(v1);
}

id sub_100008B2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionSystemApertureViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for GroupSessionSystemApertureViewController()
{
  return self;
}

uint64_t sub_100008C10(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008C38(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_100008C74()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel;
  id v2 = [objc_allocWithZone((Class)UILabel) init];
  NSString v3 = self;
  id v4 = [v3 systemFontOfSize:14.0 weight:UIFontWeightSemibold];
  [v2 setFont:v4];

  *(void *)&v0[v1] = v2;
  uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel;
  id v6 = [objc_allocWithZone((Class)UILabel) init];
  id v7 = [v3 systemFontOfSize:10.0];
  [v6 setFont:v7];

  id v8 = [self secondaryLabelColor];
  [v6 setTextColor:v8];

  *(void *)&v0[v5] = v6;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon] = 0;
  uint64_t v9 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon;
  *(void *)&v0[v9] = sub_100007BA4();
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode] = 1;
  swift_unknownObjectWeakInit();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100008E40()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v2 = (void *)Strong;
    id v3 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView) artworkImageView];
    [v3 bounds];

    [v2 bounds];
    id v4 = self;
    id v5 = [v4 currentSettings];
    [v5 lockScreenAPLRatio];

    id v6 = [v4 currentSettings];
    [v6 lockScreenAPLTarget];
  }
}

void sub_100008F6C()
{
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) == 1)
  {
    sub_1000097F8();
  }
  else
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v2 = (void *)Strong;
      id v3 = self;
      [self defaultAnimationDuration];
      double v5 = v4;
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v0;
      *(void *)(v6 + 24) = v2;
      v10[4] = sub_10000A31C;
      v10[5] = v6;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      v10[2] = sub_1000128F8;
      v10[3] = &unk_100049968;
      id v7 = _Block_copy(v10);
      id v8 = v0;
      id v9 = v2;
      swift_release();
      [v3 animateWithDuration:v7 animations:v5];
      _Block_release(v7);
    }
  }
}

void sub_1000090E4(char a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) == 1)
  {
    id v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) == 0)
    {
      *(_OWORD *)&v6.a = 0x3FF0000000000000uLL;
      v6.c = 0.0;
      v6.d = 1.0;
      *(_OWORD *)&v6.tx = 0uLL;
      [v3 setTransform:&v6];
      goto LABEL_7;
    }
    CGFloat v4 = 0.98;
    CGFloat v5 = 0.98;
  }
  else
  {
    id v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    CGFloat v4 = 0.5;
    CGFloat v5 = 0.5;
  }
  CGAffineTransformMakeScale(&v6, v4, v5);
  [v3 setTransform:&v6];
LABEL_7:
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) = a1 & 1;
  sub_100008F6C();
}

id sub_1000091C4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
  uint64_t v2 = OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView) setAlpha:v3];
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    CGFloat v5 = Strong;
    if (*(unsigned char *)(v0 + v2)) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    [Strong setAlpha:v6];
  }
  if (*(unsigned char *)(v0 + v2) != 1)
  {
    CGFloat v7 = 0.5;
    CGFloat v8 = 0.5;
    goto LABEL_13;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed))
  {
    CGFloat v7 = 0.98;
    CGFloat v8 = 0.98;
LABEL_13:
    CGAffineTransformMakeScale(&v10, v7, v8);
    return [v1 setTransform:&v10];
  }
  *(_OWORD *)&v10.a = 0x3FF0000000000000uLL;
  v10.c = 0.0;
  v10.d = 1.0;
  *(_OWORD *)&v10.tx = 0uLL;
  return [v1 setTransform:&v10];
}

id sub_1000092E8(double a1, double a2, double a3, double a4)
{
  v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isOnScreen] = 0;
  id v9 = &v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap];
  *(void *)id v9 = 0;
  v9[8] = 1;
  CGAffineTransform v10 = &v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_bottomGap];
  *(void *)CGAffineTransform v10 = 0;
  v10[8] = 1;
  swift_unknownObjectWeakInit();
  v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed] = 0;
  v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible] = 0;
  id v11 = objc_allocWithZone((Class)MRUArtworkView);
  id v12 = v4;
  id v13 = [v11 init];
  [v13 setUseVisualEffectPlaceholder:1];
  [v13 setStyle:3];
  [v13 setShowPlaceholder:0];
  *(void *)&v12[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView] = v13;
  id v14 = v13;

  v17.receiver = v12;
  v17.super_class = (Class)type metadata accessor for CoverSheetBackgroundView();
  id v15 = [super initWithFrame:a1, a2, a3, a4];
  [v15 addSubview:v14];
  [v14 addObserver:v15];

  return v15;
}

void sub_1000095BC()
{
  if ((v0[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap + 8] & 1) != 0
    || (v0[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_bottomGap + 8] & 1) != 0)
  {
    return;
  }
  [v0 bounds];
  CGRectGetWidth(v15);
  [v0 bounds];
  UIRectInset();
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  id v9 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView];
  id v10 = [v9 artworkImage];
  if (v10)
  {
    id v11 = v10;
    [v10 size];
    if (vabdd_f64(1.0, v12 / v13) >= 0.03)
    {
      v18.origin.x = v2;
      v18.origin.y = v4;
      v18.size.width = v6;
      v18.size.height = v8;
      CGRectGetWidth(v18);
      [v11 size];
      v19.origin.x = v2;
      v19.origin.y = v4;
      v19.size.width = v6;
      v19.size.height = v8;
      CGRectGetHeight(v19);
      [v11 size];
      [v11 size];
      [v11 size];

      goto LABEL_9;
    }
  }
  v16.origin.x = v2;
  v16.origin.y = v4;
  v16.size.width = v6;
  v16.size.height = v8;
  CGRectGetWidth(v16);
  v17.origin.x = v2;
  v17.origin.y = v4;
  v17.size.width = v6;
  v17.size.height = v8;
  CGRectGetHeight(v17);
LABEL_9:
  UIRectCenteredRect();

  [v9 setFrame:];
}

void sub_1000097F8()
{
  double v1 = v0;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v3 = Strong;
    id v4 = [Strong layer];
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v4 valueForKeyPath:v5];

    if (v6)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_10000A114((uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      sub_10000A114((uint64_t)&v24);

      id v7 = [self currentSettings];
      [v7 lockScreenAPLRatio];

      sub_100008E40();
      id v8 = sub_10000A174();
      id v4 = [v3 layer];
      sub_100009B50(v8);
    }
    id v9 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView];
    id v10 = [v9 artworkImageView];
    id v11 = [v10 layer];

    NSString v12 = String._bridgeToObjectiveC()();
    id v13 = [v11 valueForKeyPath:v12];

    if (v13)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_10000A114((uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      sub_10000A114((uint64_t)&v24);

      sub_100008E40();
      id v14 = sub_10000A174();
      id v15 = [v9 artworkImageView];
      id v16 = [v15 layer];

      sub_100009B50(v14);
    }
    CGRect v17 = self;
    [self defaultAnimationDuration];
    double v19 = v18;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v1;
    *(void *)(v20 + 24) = v3;
    id v26 = sub_10000A2AC;
    uint64_t v27 = v20;
    *(void *)&long long v24 = _NSConcreteStackBlock;
    *((void *)&v24 + 1) = 1107296256;
    *(void *)&long long v25 = sub_1000128F8;
    *((void *)&v25 + 1) = &unk_100049918;
    id v21 = _Block_copy(&v24);
    id v22 = v1;
    id v23 = v3;
    swift_release();
    [v17 animateWithDuration:v21 animations:v19];
    _Block_release(v21);
  }
}

void sub_100009B50(void *a1)
{
  id v3 = [v1 filters];
  if (v3)
  {
    id v4 = v3;
    NSString v5 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    NSString v5 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v11 = sub_10000A2CC();
  *(void *)&long long v10 = a1;
  id v6 = a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    NSString v5 = sub_100024764(0, *((void *)v5 + 2) + 1, 1, v5);
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1) {
    NSString v5 = sub_100024764((char *)(v7 > 1), v8 + 1, 1, v5);
  }
  *((void *)v5 + 2) = v8 + 1;
  sub_10000A30C(&v10, &v5[32 * v8 + 32]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 setFilters:isa v10];
}

void sub_100009C80(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) == 1)
  {
    id v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    if ((*(unsigned char *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) == 0)
    {
      *(_OWORD *)&v13.a = 0x3FF0000000000000uLL;
      v13.c = 0.0;
      v13.d = 1.0;
      *(_OWORD *)&v13.tx = 0uLL;
      [v3 setTransform:&v13];
      goto LABEL_7;
    }
    CGFloat v4 = 0.98;
    CGFloat v5 = 0.98;
  }
  else
  {
    id v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    CGFloat v4 = 0.5;
    CGFloat v5 = 0.5;
  }
  CGAffineTransformMakeScale(&v13, v4, v5);
  [v3 setTransform:&v13];
LABEL_7:
  id v6 = [v3 artworkImageView];
  id v7 = [v6 layer];

  Class isa = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  [v7 setValue:isa forKeyPath:v9];

  id v10 = [a2 layer];
  Class v11 = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  [v10 setValue:v11 forKeyPath:v12];
}

void sub_100009E78(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) == 1)
  {
    id v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    if ((*(unsigned char *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) == 0)
    {
      *(_OWORD *)&v13.a = 0x3FF0000000000000uLL;
      v13.c = 0.0;
      v13.d = 1.0;
      *(_OWORD *)&v13.tx = 0uLL;
      [v3 setTransform:&v13];
      goto LABEL_7;
    }
    CGFloat v4 = 0.98;
    CGFloat v5 = 0.98;
  }
  else
  {
    id v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    CGFloat v4 = 0.5;
    CGFloat v5 = 0.5;
  }
  CGAffineTransformMakeScale(&v13, v4, v5);
  [v3 setTransform:&v13];
LABEL_7:
  id v6 = [v3 artworkImageView];
  id v7 = [v6 layer];

  Class isa = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  [v7 setValue:isa forKeyPath:v9];

  id v10 = [a2 layer];
  Class v11 = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  [v10 setValue:v11 forKeyPath:v12];
}

id sub_10000A070()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoverSheetBackgroundView();
  return [super dealloc];
}

uint64_t type metadata accessor for CoverSheetBackgroundView()
{
  return self;
}

uint64_t sub_10000A114(uint64_t a1)
{
  uint64_t v2 = sub_1000075A0(&qword_10005CA00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10000A174()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v0 = objc_allocWithZone((Class)CAFilter);
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithType:v1];

  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v2 setValue:isa forKey:kCAFilterInputAmount];

  NSString v4 = String._bridgeToObjectiveC()();
  [v2 setName:v4];

  return v2;
}

uint64_t sub_10000A26C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000A2AC()
{
  sub_100009C80(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000A2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A2C4()
{
  return swift_release();
}

unint64_t sub_10000A2CC()
{
  unint64_t result = qword_10005CA08;
  if (!qword_10005CA08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005CA08);
  }
  return result;
}

_OWORD *sub_10000A30C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10000A31C()
{
  sub_100009E78(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

double sub_10000A330()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

char *sub_10000A3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v83 = a2;
  uint64_t v82 = sub_1000075A0((uint64_t *)&unk_10005C360);
  uint64_t v4 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  id v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView;
  id v8 = objc_allocWithZone((Class)MRUActivityRouteView);
  NSString v9 = v2;
  id v10 = [v8 init];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v2[v7] = v10;
  uint64_t v11 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel;
  id v12 = [objc_allocWithZone((Class)UILabel) init];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v9[v11] = v12;
  uint64_t v13 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView;
  id v14 = [objc_allocWithZone((Class)MRUCAPackageView) init];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v9[v13] = v14;
  uint64_t v15 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel;
  id v16 = [objc_allocWithZone((Class)UILabel) init];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v9[v15] = v16;
  uint64_t v17 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel;
  id v18 = [objc_allocWithZone((Class)UILabel) init];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v9[v17] = v18;
  uint64_t v19 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton;
  id v20 = [self buttonWithType:0];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v9[v19] = v20;
  uint64_t v21 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide;
  *(void *)&v9[v21] = [objc_allocWithZone((Class)UILayoutGuide) init];
  *(void *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint] = 0;
  *(void *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint] = 0;
  *(void *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint] = 0;
  id v22 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOn];
  *(void *)id v22 = 28239;
  *((void *)v22 + 1) = 0xE200000000000000;
  id v23 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOff];
  *(void *)id v23 = 6710863;
  *((void *)v23 + 1) = 0xE300000000000000;
  long long v24 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth];
  v86[0] = 0;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v24, v6, v82);
  long long v25 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  long long v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)long long v25 = *(_OWORD *)a1;
  *((_OWORD *)v25 + 1) = v26;
  long long v27 = *(_OWORD *)(a1 + 80);
  long long v29 = *(_OWORD *)(a1 + 32);
  long long v28 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v25 + 5) = v27;
  *((_OWORD *)v25 + 2) = v29;
  *((_OWORD *)v25 + 3) = v28;
  long long v30 = *(_OWORD *)(a1 + 144);
  long long v32 = *(_OWORD *)(a1 + 96);
  long long v31 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v25 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v25 + 9) = v30;
  *((_OWORD *)v25 + 6) = v32;
  *((_OWORD *)v25 + 7) = v31;
  long long v34 = *(_OWORD *)(a1 + 176);
  long long v33 = *(_OWORD *)(a1 + 192);
  long long v35 = *(_OWORD *)(a1 + 160);
  *((void *)v25 + 26) = *(void *)(a1 + 208);
  *((_OWORD *)v25 + 11) = v34;
  *((_OWORD *)v25 + 12) = v33;
  *((_OWORD *)v25 + 10) = v35;
  sub_1000075E4((void *)a1);

  id v36 = (objc_class *)type metadata accessor for SuggestedRouteSystemApertureView();
  v85.receiver = v9;
  v85.super_class = v36;
  id v37 = [(char *)[super initWithFrame:0.0, 0.0, 0.0, 0.0]];
  uint64_t v38 = *(void *)&v37[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide];
  id v39 = v37;
  [v39 addLayoutGuide:v38];
  [v39 addSubview:*(void *)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView]];
  uint64_t v82 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton;
  id v40 = *(void **)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];
  [v40 setPreferredSymbolConfiguration:*(void *)(a1 + 96) forImageInState:0];
  LODWORD(v41) = 1148846080;
  [v40 setContentHuggingPriority:0 forAxis:v41];
  [v39 addSubview:v40];
  uint64_t v42 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel;
  id v43 = *(void **)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel];
  id v44 = self;
  id v45 = v43;
  id v46 = [v44 mru_suggestedRouteActivityTitleFont];
  [v45 setFont:v46];

  v47 = *(void **)&v39[v42];
  id v48 = self;
  id v49 = v47;
  id v50 = [v48 whiteColor];
  [v49 setTextColor:v50];

  [v39 addSubview:*(void *)&v39[v42]];
  uint64_t v51 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView;
  v52 = *(void **)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
  id v53 = self;
  id v54 = v52;
  NSString v55 = [v53 suggestedRouteWaveformPackageName];
  if (!v55)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v55 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v56 = [self packageNamed:v55];

  [v54 setAsset:v56];
  v57 = *(void **)&v39[v51];
  [v57 setScale:0.3017];
  [v39 addSubview:v57];
  uint64_t v58 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel;
  id v59 = *(id *)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel];
  id v60 = [v44 mru_suggestedRouteActivityTitleFont];
  [v59 setFont:v60];

  id v61 = *(id *)&v39[v58];
  id v62 = [v48 secondaryLabelColor];
  [v61 setTextColor:v62];

  id v63 = *(id *)&v39[v58];
  [v39 alpha];
  [v63 setAlpha:];

  [v39 addSubview:*(void *)&v39[v58]];
  uint64_t v64 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel;
  id v65 = *(id *)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel];
  id v66 = [v44 mru_suggestedRouteActivitySubtitleFont];
  [v65 setFont:v66];

  id v67 = *(id *)&v39[v64];
  id v81 = v48;
  id v68 = [v48 secondaryLabelColor];
  [v67 setTextColor:v68];

  [v39 addSubview:*(void *)&v39[v64]];
  id v69 = objc_allocWithZone((Class)UIColor);
  v70 = v39;
  id v71 = [v69 initWithWhite:0.01 alpha:1.0];
  [v70 setBackgroundColor:v71];

  self;
  uint64_t v72 = swift_dynamicCastObjCClass();
  if (v72)
  {
    id v74 = (void *)v72;
    swift_unknownObjectRetain();
    if ([v74 bannerType] == (id)1 || objc_msgSend(v74, "bannerType") == (id)4)
    {
      uint64_t v75 = v82;
      id v76 = *(id *)&v39[v82];
      id v77 = [v81 systemCyanColor];
      id v78 = [v77 colorWithAlphaComponent:0.3];

      [v76 setBackgroundColor:v78];
      v79 = *(void **)&v39[v75];
      [v79 setClipsToBounds:1];
      [v79 _setCornerRadius:25.0];
    }
    swift_unknownObjectRelease();
  }
  sub_10000ACB0(v73);
  sub_1000076D0((uint64_t)v84);
  sub_1000076F8((uint64_t)v84, (uint64_t)v86);
  sub_10000B8C8((uint64_t)v86, 0);
  swift_unknownObjectRelease();
  sub_100007760((void *)a1);

  return v70;
}

void sub_10000ACB0(double a1)
{
  long long v2 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel];
  LODWORD(a1) = 1148846080;
  [v2 setContentHuggingPriority:0 forAxis:a1];
  LODWORD(v3) = 1148846080;
  [v2 setContentHuggingPriority:1 forAxis:v3];
  uint64_t v4 = v2;
  LODWORD(v5) = 1148846080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v5];
  id v6 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
  LODWORD(v7) = 1148846080;
  [v6 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v8];
  id v98 = *(id *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel];
  id v9 = [v98 trailingAnchor];
  id v10 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];
  id v11 = [v10 leadingAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11 constant:-8.0];

  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint];
  *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint] = v12;

  id v14 = [v4 widthAnchor];
  uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide];
  id v16 = [v15 widthAnchor];
  id v17 = [v14 constraintLessThanOrEqualToAnchor:v16 multiplier:0.5];

  id v18 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint];
  *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint] = v17;

  id v19 = [v4 trailingAnchor];
  id v20 = [v10 leadingAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20 constant:-8.0];

  id v22 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint];
  *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint] = v21;

  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100038000;
  id v24 = [v15 leadingAnchor];
  long long v25 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView];
  id v26 = [v25 trailingAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26 constant:8.0];

  *(void *)(v23 + 32) = v27;
  id v28 = [v15 trailingAnchor];
  id v29 = [v10 leadingAnchor];
  id v30 = [v28 constraintEqualToAnchor:v29 constant:-8.0];

  *(void *)(v23 + 40) = v30;
  id v31 = [v25 heightAnchor];
  id v32 = [v1 heightAnchor];
  id v33 = [v31 constraintEqualToAnchor:v32 multiplier:0.707106781];

  *(void *)(v23 + 48) = v33;
  id v34 = [v25 leadingAnchor];
  id v35 = [v1 leadingAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35 constant:12.0];

  *(void *)(v23 + 56) = v36;
  id v37 = [v25 centerYAnchor];
  id v38 = [v1 centerYAnchor];
  id v39 = [v37 constraintEqualToAnchor:v38];

  *(void *)(v23 + 64) = v39;
  id v40 = [v25 widthAnchor];
  id v41 = [v25 heightAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41];

  *(void *)(v23 + 72) = v42;
  id v43 = [v10 leadingAnchor];
  id v44 = [v1 SBUISA_systemApertureObstructedAreaLayoutGuide];
  id v45 = [v44 trailingAnchor];

  id v46 = [v43 constraintGreaterThanOrEqualToAnchor:v45 constant:8.0];
  *(void *)(v23 + 80) = v46;
  id v47 = [v10 trailingAnchor];
  id v48 = [v1 trailingAnchor];
  id v49 = [v47 constraintEqualToAnchor:v48 constant:-16.0];

  *(void *)(v23 + 88) = v49;
  id v50 = [v10 topAnchor];
  id v51 = [v1 topAnchor];
  id v52 = [v50 constraintEqualToAnchor:v51 constant:17.0];

  *(void *)(v23 + 96) = v52;
  id v53 = [v10 bottomAnchor];
  id v54 = [v1 bottomAnchor];
  id v55 = [v53 constraintEqualToAnchor:v54 constant:-17.0];

  *(void *)(v23 + 104) = v55;
  id v56 = [v10 widthAnchor];
  id v57 = [v10 heightAnchor];
  id v58 = [v56 constraintEqualToAnchor:v57];

  *(void *)(v23 + 112) = v58;
  id v59 = [v10 widthAnchor];
  id v60 = [v59 constraintEqualToConstant:50.0];

  *(void *)(v23 + 120) = v60;
  id v61 = [v4 _tightBoundingBoxLayoutGuide];
  id v62 = [v61 topAnchor];

  id v63 = [v1 SBUISA_systemApertureObstructedAreaLayoutGuide];
  id v64 = [v63 bottomAnchor];

  id v65 = [v62 constraintEqualToAnchor:v64];
  *(void *)(v23 + 128) = v65;
  id v66 = [v4 leadingAnchor];
  id v67 = [v25 trailingAnchor];
  id v68 = [v66 constraintEqualToAnchor:v67 constant:8.0];

  *(void *)(v23 + 136) = v68;
  id v69 = [v4 trailingAnchor];
  id v70 = [v6 leadingAnchor];
  id v71 = [v69 constraintEqualToAnchor:v70 constant:-8.0];

  *(void *)(v23 + 144) = v71;
  id v72 = [v6 centerYAnchor];
  id v73 = [v4 centerYAnchor];
  id v74 = [v72 constraintEqualToAnchor:v73];

  *(void *)(v23 + 152) = v74;
  id v75 = [v6 topAnchor];
  id v76 = [v1 SBUISA_systemApertureObstructedAreaLayoutGuide];
  id v77 = [v76 bottomAnchor];

  id v78 = [v75 constraintEqualToAnchor:v77];
  *(void *)(v23 + 160) = v78;
  id v79 = [v98 _tightBoundingBoxLayoutGuide];
  id v80 = [v79 topAnchor];

  id v81 = [v1 SBUISA_systemApertureObstructedAreaLayoutGuide];
  id v82 = [v81 bottomAnchor];

  id v83 = [v80 constraintEqualToAnchor:v82];
  *(void *)(v23 + 168) = v83;
  id v84 = [v98 leadingAnchor];
  id v85 = [v6 trailingAnchor];
  id v86 = [v84 constraintEqualToAnchor:v85 constant:8.0];

  *(void *)(v23 + 176) = v86;
  v87 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel];
  id v88 = [v87 leadingAnchor];
  id v89 = [v25 trailingAnchor];
  id v90 = [v88 constraintEqualToAnchor:v89 constant:8.0];

  *(void *)(v23 + 184) = v90;
  id v91 = [v87 trailingAnchor];
  id v92 = [v10 leadingAnchor];
  id v93 = [v91 constraintEqualToAnchor:v92 constant:-8.0];

  *(void *)(v23 + 192) = v93;
  id v94 = [v87 firstBaselineAnchor];
  id v95 = [v1 bottomAnchor];
  id v96 = [v94 constraintEqualToAnchor:v95 constant:-17.0];

  *(void *)(v23 + 200) = v96;
  specialized Array._endMutation()();
  v97 = self;
  sub_100007868();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v97 activateConstraints:isa];
}

void sub_10000B8C8(uint64_t a1, char a2)
{
  double v5 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint];
  if (v5) {
    [v5 setActive:v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112]];
  }
  id v6 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint];
  if (v6) {
    [v6 setActive:v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112]];
  }
  double v7 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint];
  if (v7) {
    [v7 setActive:(v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112] & 1) == 0];
  }
  double v8 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];
  id v9 = &v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  [v8 setPreferredSymbolConfiguration:*(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96] forImageInState:0];
  swift_bridgeObjectRetain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [self systemImageNamed:v10];

  [v8 setImage:v11 forState:0];
  id v12 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel];
  swift_bridgeObjectRetain();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v12 setText:v13];

  id v14 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel];
  if (*((void *)v9 + 16))
  {
    swift_bridgeObjectRetain();
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }
  [v14 setText:v15];

  id v16 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel];
  if (*((void *)v9 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v17 = 0;
  }
  [v16 setText:v17];

  int v18 = v9[112];
  sub_1000076F8(a1, (uint64_t)v41);
  if (sub_100007850((uint64_t)v41) == 1 || (v41[112] & 1) != v18)
  {
    if (v18) {
      double v19 = 1.0;
    }
    else {
      double v19 = 0.0;
    }
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v2;
    *(double *)(v20 + 24) = v19;
    if (a2)
    {
      if (v18)
      {
        uint64_t v21 = v9[112];
        id v22 = v2;
        [v14 setMarqueeEnabled:v21];
        [v22 layoutIfNeeded];
      }
      else
      {
        long long v25 = v2;
      }
      id v26 = self;
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = sub_10000C364;
      *(void *)(v27 + 24) = v20;
      id v39 = sub_10000C408;
      uint64_t v40 = v27;
      id v35 = _NSConcreteStackBlock;
      uint64_t v36 = 1107296256;
      id v37 = sub_1000128F8;
      id v38 = &unk_1000499E0;
      id v28 = _Block_copy(&v35);
      swift_retain();
      swift_release();
      uint64_t v29 = swift_allocObject();
      *(unsigned char *)(v29 + 16) = v18;
      *(void *)(v29 + 24) = v2;
      id v39 = sub_10000C480;
      uint64_t v40 = v29;
      id v35 = _NSConcreteStackBlock;
      uint64_t v36 = 1107296256;
      id v37 = sub_100028E78;
      id v38 = &unk_100049A30;
      id v30 = _Block_copy(&v35);
      id v31 = v2;
      swift_release();
      [v26 animateWithDuration:v28 animations:v30 completion:0.375];
      _Block_release(v30);
      _Block_release(v28);
      if ((v18 & 1) == 0)
      {
        uint64_t v32 = swift_allocObject();
        *(void *)(v32 + 16) = v31;
        id v39 = sub_10000C4F0;
        uint64_t v40 = v32;
        id v35 = _NSConcreteStackBlock;
        uint64_t v36 = 1107296256;
        id v37 = sub_1000128F8;
        id v38 = &unk_100049A80;
        id v33 = _Block_copy(&v35);
        id v31 = v31;
        swift_release();
        [v26 animateWithDuration:0 delay:v33 options:0 animations:0.25 completion:0.25];
        _Block_release(v33);
      }
      id v24 = *(void **)&v31[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
    }
    else
    {
      uint64_t v23 = v2;
      [v14 setAlpha:v19];
      id v24 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
      [v24 setAlpha:v19];
      [v14 setMarqueeEnabled:v9[112]];
    }
    swift_bridgeObjectRetain();
    NSString v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v24 setGlyphState:v34];
    swift_release();
  }
}

id sub_10000BEF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteSystemApertureView();
  return [super dealloc];
}

uint64_t sub_10000C0B8()
{
  return type metadata accessor for SuggestedRouteSystemApertureView();
}

uint64_t type metadata accessor for SuggestedRouteSystemApertureView()
{
  uint64_t result = qword_10005CAA8;
  if (!qword_10005CAA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C10C()
{
  sub_10000C1DC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000C1DC()
{
  if (!qword_10005C260)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005C260);
    }
  }
}

double sub_10000C234@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10000C2B4(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10000C32C()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10000C364()
{
  uint64_t v1 = *(void *)(v0 + 16);
  double v2 = *(double *)(v0 + 24);
  [*(id *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel) setAlpha:v2];
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView);

  return [v3 setAlpha:v2];
}

uint64_t sub_10000C3D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C408()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000C430(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C440()
{
  return swift_release();
}

uint64_t sub_10000C448()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10000C480()
{
  if ((*(unsigned char *)(v0 + 16) & 1) == 0) {
    return [*(id *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel) setMarqueeEnabled:*(unsigned __int8 *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute+ 112)];
  }
  return result;
}

uint64_t sub_10000C4B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000C4F0()
{
  return [*(id *)(v0 + 16) layoutIfNeeded];
}

void sub_10000C508()
{
  uint64_t v1 = sub_1000075A0((uint64_t *)&unk_10005C360);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView;
  id v6 = [objc_allocWithZone((Class)MRUActivityRouteView) init];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v5] = v6;
  uint64_t v7 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel;
  id v8 = [objc_allocWithZone((Class)UILabel) init];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v7] = v8;
  uint64_t v9 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView;
  id v10 = [objc_allocWithZone((Class)MRUCAPackageView) init];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel;
  id v12 = [objc_allocWithZone((Class)UILabel) init];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v11] = v12;
  uint64_t v13 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel;
  id v14 = [objc_allocWithZone((Class)UILabel) init];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v13] = v14;
  uint64_t v15 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton;
  id v16 = [self buttonWithType:0];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v15] = v16;
  uint64_t v17 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide;
  *(void *)&v0[v17] = [objc_allocWithZone((Class)UILayoutGuide) init];
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint] = 0;
  int v18 = &v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOn];
  *(void *)int v18 = 28239;
  *((void *)v18 + 1) = 0xE200000000000000;
  double v19 = &v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOff];
  *(void *)double v19 = 6710863;
  *((void *)v19 + 1) = 0xE300000000000000;
  uint64_t v20 = &v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth];
  v21[1] = 0;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v20, v4, v1);

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10000C960(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
}

id sub_10000CAC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AmbientCompactSceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for AmbientCompactSceneDelegate()
{
  return self;
}

void sub_10000CB6C(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = a1;
    static os_log_type_t.default.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    os_log(_:dso:log:_:_:)();
    if (qword_10005C190 != -1) {
      swift_once();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.setter();
    id Strong = (id)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      id v7 = [self proactiveEndpointController];
      id Strong = [objc_allocWithZone((Class)MRUNowPlayingController) initWithEndpointController:v7];

      swift_unknownObjectWeakAssign();
    }
    id v8 = [objc_allocWithZone((Class)MRUAmbientCompactNowPlayingViewController) initWithNowPlayingController:Strong];

    id v9 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v4];
    [v9 setRootViewController:v8];
    [v9 makeKeyAndVisible];
    id v10 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window);
    *(void *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = v9;
  }
}

uint64_t sub_10000CDA4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window);
  *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = 0;

  if (qword_10005C190 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.setter();
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  return os_log(_:dso:log:_:_:)();
}

float sub_10000CECC()
{
  uint64_t v0 = MGGetProductType();
  uint64_t v1 = v0;
  if (v0 <= 2270970152)
  {
    if (v0 <= 1429914405)
    {
      if (v0 == 502329937) {
        goto LABEL_17;
      }
      if (v0 != 1060988941) {
        goto LABEL_21;
      }
      goto LABEL_10;
    }
    if (v0 == 1429914406 || v0 == 1721691077) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v0 > 3242623366)
    {
      if (v0 == 3242623367) {
        goto LABEL_17;
      }
      if (v0 != 3885279870)
      {
        if (v0 != 3645319985) {
          goto LABEL_21;
        }
LABEL_17:
        sub_100005300();
LABEL_18:
        uint64_t v2 = 1097859072;
        Swift::Float v3 = 15.0;
        goto LABEL_19;
      }
LABEL_10:
      sub_100005300();
LABEL_11:
      uint64_t v2 = 1097859072;
      Swift::Float v3 = 5.0;
LABEL_19:
      Swift::Float v4 = 15.0;
      goto LABEL_20;
    }
    if (v0 == 2270970153 || v0 == 2311900306) {
      goto LABEL_17;
    }
  }
LABEL_21:
  int v6 = sub_100005300();
  if (v1 == 228444038) {
    goto LABEL_18;
  }
  if (v1 == 2159747553) {
    goto LABEL_11;
  }
  if (v6)
  {
    uint64_t v2 = 1103101952;
    Swift::Float v4 = 48.0;
    Swift::Float v3 = 5.0;
  }
  else
  {
    uint64_t v2 = 1101004800;
    Swift::Float v3 = 5.0;
    Swift::Float v4 = 30.0;
  }
LABEL_20:
  LODWORD(result) = CAFrameRateRange.init(minimum:maximum:preferred:)(v3, v4, (Swift::Float_optional *)v2);
  return result;
}

float sub_10000D060()
{
  uint64_t v0 = MGGetProductType();
  if (v0 <= 2159747552)
  {
    if (v0 <= 1060988940)
    {
      if (v0 != 228444038 && v0 != 502329937) {
        return CAFrameRateRangeDefault.minimum;
      }
    }
    else
    {
      if (v0 == 1060988941) {
        goto LABEL_15;
      }
      if (v0 != 1429914406 && v0 != 1721691077) {
        return CAFrameRateRangeDefault.minimum;
      }
    }
    goto LABEL_18;
  }
  if (v0 <= 3242623366)
  {
    if (v0 != 2159747553)
    {
      if (v0 != 2270970153 && v0 != 2311900306) {
        return CAFrameRateRangeDefault.minimum;
      }
      goto LABEL_18;
    }
LABEL_15:
    uint64_t v1 = 1114636288;
    Swift::Float v2 = 60.0;
    Swift::Float v3 = 30.0;
LABEL_19:
    LODWORD(result) = CAFrameRateRange.init(minimum:maximum:preferred:)(v3, v2, (Swift::Float_optional *)v1);
    return result;
  }
  if (v0 == 3242623367 || v0 == 3645319985)
  {
LABEL_18:
    uint64_t v1 = 1106247680;
    Swift::Float v3 = 15.0;
    Swift::Float v2 = 30.0;
    goto LABEL_19;
  }
  if (v0 == 3885279870) {
    goto LABEL_15;
  }
  return CAFrameRateRangeDefault.minimum;
}

uint64_t sub_10000D1B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v48 = a1;
  id v49 = a3;
  uint64_t v5 = sub_1000075A0(&qword_10005CB68);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000075A0((uint64_t *)&unk_10005CB70);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for MetalContext();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v48 - v16;
  int v18 = &v3[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange];
  double v19 = v3;
  *(float *)int v18 = sub_10000CECC();
  *((_DWORD *)v18 + 1) = v20;
  *((_DWORD *)v18 + 2) = v21;
  id v22 = &v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange];
  *(float *)id v22 = sub_10000D060();
  *((_DWORD *)v22 + 1) = v23;
  *((_DWORD *)v22 + 2) = v24;
  *(void *)&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer] = 0;
  swift_unknownObjectWeakInit();
  v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 0;
  v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed] = 0;
  v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink] = 0;
  static MetalContext.shared.getter();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    uint64_t v26 = type metadata accessor for Backdrop.ViewConfiguration();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
    id v27 = objc_allocWithZone((Class)type metadata accessor for Backdrop.CompositeRenderer());
    id v28 = (void *)Backdrop.CompositeRenderer.init(context:configuration:)();
    id v29 = [self systemGrayColor:v48];
    dispatch thunk of Backdrop.CompositeRenderer.setPlaceholderColor(_:animated:)();

    dispatch thunk of Backdrop.CompositeRenderer.isBehindLyrics.setter();
    *(void *)&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_backdropRenderer] = v28;
    id v30 = self;
    id v31 = v28;
    id v32 = [v30 mainScreen];
    [v32 bounds];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    id v41 = [objc_allocWithZone((Class)MTKView) initWithFrame:MetalContext.device.getter() v34, v36, v38, v40];
    swift_unknownObjectRelease();
    [v41 setAutoresizingMask:18];
    id v42 = [v41 layer];
    [v42 setAllowsDisplayCompositing:0];

    [v41 setPaused:1];
    [v41 setDelegate:v31];
    *(void *)&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView] = v41;
    id v43 = v41;

    if (a2)
    {
      NSString v44 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v44 = 0;
    }
    id v45 = v49;
    id v46 = (objc_class *)type metadata accessor for BackdropViewController();
    v50.receiver = v19;
    v50.super_class = v46;
    id v47 = [super initWithNibName:v44 bundle:v45];

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    return (uint64_t)v47;
  }
  return result;
}

void sub_10000D7C0(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for BackdropViewController();
  [super viewDidDisappear:a1 & 1];
  id Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong invalidate];

  swift_unknownObjectWeakAssign();
  int v4 = v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen];
  v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 0;
  if (v4 == 1) {
    sub_10000E068();
  }
}

void sub_10000D960(char a1)
{
  uint64_t v2 = OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink;
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink) != (a1 & 1))
  {
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    int v4 = qword_10005E7C0;
    objc_super v5 = v1;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v6 = v5;
      uint64_t v7 = swift_slowAlloc();
      uint64_t v15 = v5;
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412546;
      log = v4;
      uint64_t v9 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v10 = (void *)v8;
      objc_super v5 = v15;
      *id v10 = v6;

      *(_WORD *)(v7 + 12) = 1024;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, log, v3, "%@ update shouldBlockDisplayLink:%{BOOL}d", (uint8_t *)v7, 0x12u);
      sub_1000075A0(&qword_10005DBE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    if (*((unsigned char *)v1 + v2) == 1)
    {
      id Strong = (void *)swift_unknownObjectWeakLoadStrong();
      [Strong invalidate];

      swift_unknownObjectWeakAssign();
      id v12 = [*(id *)&v5[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView] layer];
      self;
      uint64_t v13 = (void *)swift_dynamicCastObjCClass();
      if (!v13) {

      }
      [v13 removeBackBuffers:log];
    }
    else if (v5[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] == 1)
    {
      sub_10000E6F8();
    }
  }
}

uint64_t sub_10000DBFC()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink);
}

uint64_t sub_10000DC0C(uint64_t result)
{
  if (result)
  {
    uint64_t v2 = v1;
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) == 1
      && (*(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) & 1) == 0)
    {
      uint64_t v3 = OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer;
      [*(id *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer) invalidate];
      id Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v8 = Strong;
        LODWORD(v5) = *(_DWORD *)(v2
                                + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange);
        LODWORD(v6) = *(_DWORD *)(v2
                                + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange
                                + 4);
        LODWORD(v7) = *(_DWORD *)(v2
                                + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange
                                + 8);
        [Strong setPreferredFrameRateRange:v5, v6, v7];
      }
      sub_10000E94C();
      uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v10 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v11 = objc_allocWithZone((Class)MSVTimer);
      v15[4] = sub_10000EB18;
      v15[5] = v10;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 1107296256;
      v15[2] = sub_1000128F8;
      v15[3] = &unk_100049B20;
      id v12 = _Block_copy(v15);
      swift_retain();
      swift_release();
      id v13 = [v11 initWithInterval:0 repeats:v9 queue:v12 block:1.0];

      _Block_release(v12);
      swift_release();
      uint64_t v14 = *(void **)(v2 + v3);
      *(void *)(v2 + v3) = v13;
    }
    uint64_t result = dispatch thunk of Backdrop.CompositeRenderer.setImage(_:animated:)();
    if (*(unsigned char *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) == 1) {
      return sub_10000E20C();
    }
  }
  return result;
}

void sub_10000DE0C()
{
  swift_beginAccess();
  id Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v1 = *(_DWORD *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange];
    int v2 = *(_DWORD *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 4];
    int v3 = *(_DWORD *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 8];

    swift_beginAccess();
    uint64_t v4 = swift_unknownObjectWeakLoadStrong();
    if (v4)
    {
      double v5 = (void *)v4;
      double v6 = (void *)swift_unknownObjectWeakLoadStrong();

      LODWORD(v7) = v1;
      LODWORD(v8) = v2;
      LODWORD(v9) = v3;
      [v6 setPreferredFrameRateRange:v7, v8, v9];
    }
  }
}

void sub_10000DF4C(uint64_t a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for BackdropViewController();
  [super traitCollectionDidChange:a1];
  int v3 = self;
  id v4 = [v1 traitCollection];
  unsigned int v5 = [v3 shouldUseTimelinesForTraitCollection:v4];

  if (v5 != v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed])
  {
    v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed] = v5;
    sub_10000E068();
  }
}

void sub_10000E068()
{
  id Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v2 = Strong;
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) == 1) {
      uint64_t v3 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed);
    }
    else {
      uint64_t v3 = 1;
    }
    [Strong setPaused:v3];
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen))
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) == 1)
    {
      sub_10000E20C();
    }
  }
  else
  {
    id v4 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView);
    id v5 = [v4 layer];
    self;
    objc_super v6 = (void *)swift_dynamicCastObjCClass();
    if (!v6) {

    }
    [v6 discardContents];
    id v7 = [v4 layer];
    self;
    double v8 = (void *)swift_dynamicCastObjCClass();
    id v9 = v8;
    if (!v8)
    {

      double v8 = 0;
    }
    [v8 removeBackBuffers];
  }
}

uint64_t sub_10000E20C()
{
  uint64_t v26 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v29 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  long long v25 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for DispatchQoS();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  __chkstk_darwin(v2);
  id v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchTimeInterval();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (uint64_t *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for DispatchTime();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v24 - v14;
  [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView] draw];
  sub_10000E94C();
  uint64_t v24 = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  *double v8 = 1100;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchTimeInterval.milliseconds(_:), v5);
  + infix(_:_:)();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v13, v9);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v0;
  aBlock[4] = sub_10000E9C4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000128F8;
  aBlock[3] = &unk_100049AD0;
  int v18 = _Block_copy(aBlock);
  double v19 = v0;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000E9E4();
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10000EA3C();
  int v21 = v25;
  uint64_t v20 = v26;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  id v22 = (void *)v24;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v28);
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, v9);
}

void sub_10000E644(uint64_t a1)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) == 1)
  {
    id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                               + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView), "layer"));
    self;
    uint64_t v2 = (void *)swift_dynamicCastObjCClass();
    id v3 = v2;
    if (!v2)
    {

      uint64_t v2 = 0;
    }
    [v2 removeBackBuffers];
  }
}

void sub_10000E6F8()
{
  id Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong invalidate];

  swift_unknownObjectWeakAssign();
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink) & 1) == 0)
  {
    id v2 = [self displayLinkWithTarget:v0 selector:"displayLinkFiredWithSender:"];
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) == 1) {
      uint64_t v3 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed);
    }
    else {
      uint64_t v3 = 1;
    }
    id v8 = v2;
    [v2 setPaused:v3];
    LODWORD(v4) = *(_DWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange);
    LODWORD(v5) = *(_DWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 4);
    LODWORD(v6) = *(_DWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 8);
    [v8 setPreferredFrameRateRange:v4, v5, v6];
    id v7 = [self currentRunLoop];
    [v8 addToRunLoop:v7 forMode:NSDefaultRunLoopMode];

    swift_unknownObjectWeakAssign();
  }
}

id sub_10000E888()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackdropViewController();
  [super dealloc];
}

uint64_t type metadata accessor for BackdropViewController()
{
  return self;
}

unint64_t sub_10000E94C()
{
  unint64_t result = qword_10005D5B0;
  if (!qword_10005D5B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005D5B0);
  }
  return result;
}

uint64_t sub_10000E98C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E9C4()
{
  sub_10000E644(*(void *)(v0 + 16));
}

uint64_t sub_10000E9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E9DC()
{
  return swift_release();
}

unint64_t sub_10000E9E4()
{
  unint64_t result = qword_10005DD70;
  if (!qword_10005DD70)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD70);
  }
  return result;
}

unint64_t sub_10000EA3C()
{
  unint64_t result = qword_10005DD80;
  if (!qword_10005DD80)
  {
    sub_10000EA98((uint64_t *)&unk_10005D540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD80);
  }
  return result;
}

uint64_t sub_10000EA98(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000EAE0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000EB18()
{
}

void sub_10000EB20()
{
  id v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange];
  *(float *)id v1 = sub_10000CECC();
  *((_DWORD *)v1 + 1) = v2;
  *((_DWORD *)v1 + 2) = v3;
  double v4 = &v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange];
  *(float *)double v4 = sub_10000D060();
  *((_DWORD *)v4 + 1) = v5;
  *((_DWORD *)v4 + 2) = v6;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer] = 0;
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed] = 0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id sub_10000ED50()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (!v1) {
    goto LABEL_9;
  }
  int v2 = v1;
  type metadata accessor for CoverSheetBackgroundView();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = *(id *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);

  [v4 addObserver:v0];
  uint64_t v5 = self;
  id v6 = [v0 traitCollection];
  LOBYTE(v5) = [(id)v5 shouldUseTimelinesForTraitCollection:v6];

  if ((v5 & 1) == 0) {
    return sub_10000F910();
  }
  id v7 = [v0 view];
  if (v7)
  {
    int v2 = v7;
    if (swift_dynamicCastClass())
    {
      sub_1000090E4(1);

      return sub_10000F910();
    }
LABEL_8:
  }
LABEL_9:
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000EF24(char a1)
{
  int v2 = v1;
  uint64_t v4 = sub_1000075A0(&qword_10005CCF0);
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  uint64_t v6 = sub_1000075A0(&qword_10005CBE0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000075A0(&qword_10005CBE8);
  uint64_t v25 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = (objc_class *)type metadata accessor for CoverSheetBackgroundViewController();
  v29.receiver = v2;
  v29.super_class = v13;
  [super viewWillAppear:a1 & 1];
  id v14 = [v2 view];
  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v15 = v14;
  type metadata accessor for CoverSheetBackgroundView();
  uint64_t v16 = swift_dynamicCastClass();
  if (!v16)
  {

LABEL_7:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t v26 = v10;
  uint64_t v27 = v2;
  *(unsigned char *)(v16 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isOnScreen) = 1;

  if (qword_10005C190 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_1000075A0((uint64_t *)&unk_10005CBF0);
  Published.projectedValue.getter();
  swift_endAccess();
  swift_beginAccess();
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100010118(&qword_10005CD20, &qword_10005CCF0);
  Publishers.CombineLatest.init(_:_:)();
  sub_100010118(&qword_10005CC00, &qword_10005CBE0);
  Publisher.map<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_getKeyPath();
  uint64_t v17 = v27;
  v28[0] = *(void *)&v27[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController];
  int v18 = (void *)v28[0];
  sub_100010118(&qword_10005CC08, &qword_10005CBE8);
  id v19 = v18;
  uint64_t v20 = v26;
  uint64_t v21 = Publisher<>.assign<A>(to:on:)();

  swift_release();
  v28[3] = type metadata accessor for AnyCancellable();
  v28[4] = &protocol witness table for AnyCancellable;
  v28[0] = v21;
  uint64_t v22 = (uint64_t)&v17[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable];
  swift_beginAccess();
  sub_100010040((uint64_t)v28, v22);
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v12, v20);
}

uint64_t sub_10000F438(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  [super viewDidDisappear:a1 & 1];
  id v3 = [v1 view];
  if (v3)
  {
    uint64_t v4 = v3;
    type metadata accessor for CoverSheetBackgroundView();
    uint64_t v5 = swift_dynamicCastClass();
    if (v5)
    {
      *(unsigned char *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isOnScreen) = 0;

      uint64_t v9 = 0;
      memset(v8, 0, sizeof(v8));
      uint64_t v6 = (uint64_t)v1 + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable;
      swift_beginAccess();
      sub_100010040((uint64_t)v8, v6);
      return swift_endAccess();
    }
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000F59C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_10000F738(uint64_t a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  [super traitCollectionDidChange:a1];
  id v3 = self;
  id v4 = [v1 traitCollection];
  unsigned int v5 = [v3 shouldUseTimelinesForTraitCollection:v4];

  id v6 = [v1 view];
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = v6;
  type metadata accessor for CoverSheetBackgroundView();
  uint64_t v8 = swift_dynamicCastClass();
  if (!v8) {
    goto LABEL_8;
  }
  int v9 = *(unsigned __int8 *)(v8 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed);

  if (v5 == v9) {
    return;
  }
  id v10 = [v1 view];
  if (!v10)
  {
LABEL_9:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  uint64_t v7 = v10;
  if (!swift_dynamicCastClass())
  {
LABEL_8:

    goto LABEL_9;
  }
  sub_1000090E4(v5);
}

id sub_10000F910()
{
  id v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController];
  [v1 addChildViewController:v2];
  id v3 = [v1 view];
  if (!v3) {
    goto LABEL_11;
  }
  id v4 = v3;
  type metadata accessor for CoverSheetBackgroundView();
  uint64_t v5 = swift_dynamicCastClass();
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = (void *)v5;
  id v7 = [v2 view];
  id Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  [Strong removeFromSuperview];
  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (v9)
  {
    id v10 = (void *)v9;
    [v6 insertSubview:v9 atIndex:0];

    id Strong = v7;
    id v7 = v10;
  }

  id v11 = [v1 view];
  if (!v11) {
    goto LABEL_11;
  }
  id v4 = v11;
  uint64_t v12 = swift_dynamicCastClass();
  if (!v12)
  {
LABEL_10:

LABEL_11:
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  id v13 = *(id *)(v12 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);

  id v14 = [v13 artworkImage];
  sub_10000DC0C((uint64_t)v14);

  return [v2 didMoveToParentViewController:v1];
}

void sub_10000FB1C(double a1, double a2)
{
  if ((v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap + 8] & 1) != 0
    || (v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap + 8] & 1) != 0
    || (v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap + 8] & 1) != 0)
  {
    return;
  }
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap];
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap];
  uint64_t v7 = *(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap];
  id v8 = [v2 view];
  id v12 = v8;
  if (a1 >= a2)
  {
    if (v8)
    {
      type metadata accessor for CoverSheetBackgroundView();
      uint64_t v9 = swift_dynamicCastClass();
      if (v9)
      {
        uint64_t v10 = v9 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap;
        *(void *)(v9 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap) = v5;
        goto LABEL_12;
      }
      goto LABEL_15;
    }
LABEL_16:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  if (!v8) {
    goto LABEL_16;
  }
  type metadata accessor for CoverSheetBackgroundView();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v10 = v9 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap;
  *(void *)(v9 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap) = v6;
LABEL_12:
  *(unsigned char *)(v10 + 8) = 0;
  uint64_t v11 = v9 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_bottomGap;
  *(void *)uint64_t v11 = v7;
  *(unsigned char *)(v11 + 8) = 0;
  sub_1000095BC();
}

id sub_10000FCE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for CoverSheetBackgroundViewController()
{
  return self;
}

uint64_t sub_10000FFC4()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000FFFC()
{
  sub_10000FB1C(*(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_100010028(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010038()
{
  return swift_release();
}

uint64_t sub_100010040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075A0((uint64_t *)&unk_10005CBD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unsigned char *sub_1000100A8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = (*result | result[1]) & 1;
  return result;
}

void *sub_1000100C0@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*result + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink);
  return result;
}

void sub_1000100DC(char *a1, void *a2)
{
  char v2 = *a1;
  char v3 = *(unsigned char *)(*a2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink);
  *(unsigned char *)(*a2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink) = v2;
  sub_10000D960(v3);
}

uint64_t sub_100010118(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000EA98(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001015C(uint64_t a1)
{
  uint64_t v2 = sub_1000075A0((uint64_t *)&unk_10005CBD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000101BC()
{
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin();
  unsigned int v1 = [v0 routeType];
  if (v1 > 0xB || ((1 << v1) & 0xB00) == 0)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    unint64_t v4 = 0x800000010003E280;
    unint64_t v3 = 0xD000000000000018;
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    unint64_t v3 = 0xD00000000000001BLL;
    unint64_t v4 = 0x800000010003E2A0;
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v3);
  id v5 = [v0 hostDisplayName];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;

  v9._countAndFlagsBits = v6;
  v9._object = v8;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v10);
  String.LocalizationValue.init(stringInterpolation:)();
  static Locale.current.getter();
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_10001043C()
{
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  [v0 routeType];
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  return String.init(localized:table:bundle:locale:comment:)();
}

int64x2_t sub_100010594()
{
  int64x2_t result = vdupq_n_s64(0x4062C00000000000uLL);
  xmmword_10005E6F0 = (__int128)result;
  return result;
}

id sub_1000105AC()
{
  unsigned int v1 = v0;
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v5 - 8);
  id v76 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000075A0(&qword_10005CC88);
  __chkstk_darwin(v8 - 8);
  Swift::String v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  id v75 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v68 - v15;
  uint64_t v17 = (objc_class *)type metadata accessor for ProximityCardViewController();
  v78.receiver = v0;
  v78.super_class = v17;
  [super viewDidLoad];
  id v19 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName + 8];
  if (v19)
  {
    uint64_t v20 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image];
    if (v20)
    {
      id v72 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName];
      id v73 = v4;
      uint64_t v21 = v12;
      uint64_t v22 = v11;
      int v23 = &v0[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];
      swift_beginAccess();
      uint64_t v24 = (uint64_t)v23;
      uint64_t v25 = (char *)v22;
      sub_100011648(v24, (uint64_t)v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v22) == 1)
      {
        return (id)sub_1000116B0((uint64_t)v10);
      }
      else
      {
        uint64_t v26 = v21;
        uint64_t v27 = *(void (**)(unint64_t, char *, char *))(v21 + 32);
        uint64_t v70 = v21 + 32;
        id v71 = v27;
        id v74 = v16;
        v27((unint64_t)v16, v10, v25);
        swift_bridgeObjectRetain();
        id v28 = v20;
        [v0 setDismissalType:3];
        String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
        v29._object = (void *)0x800000010003E360;
        v29._countAndFlagsBits = 0xD000000000000022;
        String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v29);
        v30._countAndFlagsBits = (uint64_t)v72;
        v30._object = v19;
        String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v30);
        swift_bridgeObjectRelease();
        v31._countAndFlagsBits = 0;
        v31._object = (void *)0xE000000000000000;
        String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v31);
        String.LocalizationValue.init(stringInterpolation:)();
        static Locale.current.getter();
        String.init(localized:table:bundle:locale:comment:)();
        id v32 = v25;
        NSString v33 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v1 setTitle:v33];

        String.LocalizationValue.init(stringLiteral:)();
        static Locale.current.getter();
        String.init(localized:table:bundle:locale:comment:)();
        NSString v34 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v1 setSubtitle:v34];

        id v35 = [objc_allocWithZone((Class)PRXImageView) initWithStyle:0];
        [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v35 setContentMode:1];
        id v72 = v28;
        [v35 setImage:v28];
        id v36 = [v1 contentView];
        [v36 addSubview:v35];

        String.LocalizationValue.init(stringLiteral:)();
        static Locale.current.getter();
        String.init(localized:table:bundle:locale:comment:)();
        uint64_t v69 = v26;
        double v37 = v75;
        (*(void (**)(char *, char *, char *))(v26 + 16))(v75, v74, v32);
        unint64_t v38 = (*(unsigned __int8 *)(v26 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
        uint64_t v39 = swift_allocObject();
        *(void *)(v39 + 16) = v1;
        id v76 = v32;
        v71(v39 + v38, v37, v32);
        id v40 = v1;
        NSString v41 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        aBlock[4] = sub_1000117DC;
        aBlock[5] = v39;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100010F90;
        aBlock[3] = &unk_100049BC0;
        id v42 = _Block_copy(aBlock);
        id v43 = [self actionWithTitle:v41 style:0 handler:v42];

        _Block_release(v42);
        swift_release();

        id v75 = (char *)self;
        sub_1000075A0((uint64_t *)&unk_10005C490);
        uint64_t v44 = swift_allocObject();
        *(_OWORD *)(v44 + 16) = xmmword_1000381F0;
        id v45 = [v35 centerXAnchor];
        id v46 = [v40 contentView];
        id v47 = [v46 mainContentGuide];

        id v48 = [v47 centerXAnchor];
        id v49 = [v45 constraintEqualToAnchor:v48];

        *(void *)(v44 + 32) = v49;
        id v50 = [v35 centerYAnchor];
        id v51 = [v40 contentView];
        id v52 = [v51 mainContentGuide];

        id v53 = [v52 centerYAnchor];
        id v54 = [v50 constraintEqualToAnchor:v53];

        *(void *)(v44 + 40) = v54;
        id v55 = [v35 topAnchor];
        id v56 = [v40 contentView];
        id v57 = [v56 mainContentGuide];

        id v58 = [v57 topAnchor];
        id v59 = [v55 constraintGreaterThanOrEqualToAnchor:v58];

        *(void *)(v44 + 48) = v59;
        id v60 = [v35 bottomAnchor];
        id v61 = [v40 contentView];
        id v62 = [v61 mainContentGuide];

        id v63 = [v62 bottomAnchor];
        id v64 = [v60 constraintLessThanOrEqualToAnchor:v63];

        *(void *)(v44 + 56) = v64;
        id v65 = [v35 heightAnchor];
        if (qword_10005C180 != -1) {
          swift_once();
        }
        id v66 = objc_retainAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", *((double *)&xmmword_10005E6F0
                                                                                                 + 1)));

        *(void *)(v44 + 64) = v66;
        aBlock[0] = v44;
        specialized Array._endMutation()();
        sub_100007868();
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v75 activateConstraints:isa];

        return (id)(*(uint64_t (**)(char *, char *))(v69 + 8))(v74, v76);
      }
    }
  }
  return result;
}

void sub_100010F90(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100011048(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_10005E7C0;
    os_log_type_t v4 = v2;
    if (os_log_type_enabled((os_log_t)qword_10005E7C0, v2))
    {
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 138412290;
      swift_errorRetain();
      uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v6 = v7;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to open application with error: %@", v5, 0xCu);
      sub_1000075A0(&qword_10005DBE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
}

void sub_1000111D0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_100011318()
{
  return sub_1000115EC(0, type metadata accessor for ProximityCardViewController);
}

uint64_t sub_100011394()
{
  return type metadata accessor for ProximityCardViewController();
}

uint64_t type metadata accessor for ProximityCardViewController()
{
  uint64_t result = qword_10005CC48;
  if (!qword_10005CC48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000113E8()
{
  sub_10001148C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001148C()
{
  if (!qword_10005CC58)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005CC58);
    }
  }
}

id sub_1000115D4(uint64_t a1)
{
  return sub_1000115EC(a1, type metadata accessor for ProximityCardRootViewController);
}

id sub_1000115EC(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for ProximityCardRootViewController()
{
  return self;
}

uint64_t sub_100011648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075A0(&qword_10005CC88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000116B0(uint64_t a1)
{
  uint64_t v2 = sub_1000075A0(&qword_10005CC88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011710()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000117DC()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_100011854(v2);
}

uint64_t sub_10001183C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001184C()
{
  return swift_release();
}

void sub_100011854(uint64_t a1)
{
  uint64_t v2 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = (id)SBSCreateOpenApplicationService();
    sub_1000075A0((uint64_t *)&unk_10005CC90);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100038200;
    uint64_t aBlock = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v6;
    AnyHashable.init<A>(_:)();
    uint64_t v7 = type metadata accessor for URL();
    *(void *)(inited + 96) = v7;
    uint64_t v8 = sub_100011ADC((uint64_t *)(inited + 72));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v8, a1, v7);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 168) = &type metadata for Bool;
    *(unsigned char *)(inited + 144) = 1;
    uint64_t aBlock = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v9;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 240) = &type metadata for Bool;
    *(unsigned char *)(inited + 216) = 1;
    sub_10002F050(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v11 = [self optionsWithDictionary:isa];

    if (v4)
    {
      uint64_t v17 = sub_100011048;
      uint64_t v18 = 0;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v14 = 1107296256;
      uint64_t v15 = sub_1000111D0;
      uint64_t v16 = &unk_100049BE8;
      uint64_t v12 = _Block_copy(&aBlock);
      [v4 openApplication:v3 withOptions:v11 completion:v12];

      _Block_release(v12);
      id v11 = v4;
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t *sub_100011ADC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

BOOL sub_100011BA0(unsigned char *a1)
{
  return (*a1 & 1) == 0;
}

id sub_100011BB0@<X0>(void *a1@<X8>)
{
  type metadata accessor for BackdropViewController();
  id result = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *a1 = result;
  return result;
}

uint64_t sub_100011BF0()
{
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }

  return os_log(_:dso:log:_:_:)();
}

id sub_100011D90()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window] = 0;
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_dependency;
  uint64_t v2 = qword_10005C188;
  uint64_t v3 = v0;
  if (v2 != -1) {
    swift_once();
  }
  *(void *)&v0[v1] = qword_10005E718;
  uint64_t v4 = OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_lockscreenCoordinator;
  uint64_t v5 = qword_10005C1C0;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_10005E808;
  *(void *)&v3[v4] = qword_10005E808;
  uint64_t v7 = &v3[OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable];
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  id v8 = v6;

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for AmbientSceneDelegate();
  return [super init];
}

id sub_100011EB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AmbientSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for AmbientSceneDelegate()
{
  return self;
}

void sub_100011F7C(void *a1)
{
  uint64_t v3 = sub_1000075A0(&qword_10005CCF0);
  uint64_t v35 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1000075A0(&qword_10005CCF8);
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_1000075A0(&qword_10005CD00);
  uint64_t v37 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000075A0(&qword_10005CD08);
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v41 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000075A0((uint64_t *)&unk_10005CD10);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  if (v17)
  {
    uint64_t v31 = v14;
    uint64_t v33 = v17;
    id v34 = a1;
    static os_log_type_t.default.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    uint64_t v32 = v13;
    uint64_t v18 = v1;
    os_log(_:dso:log:_:_:)();
    if (qword_10005C190 != -1) {
      swift_once();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v42[0]) = 1;
    swift_retain();
    static Published.subscript.setter();
    id Strong = (id)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      id v20 = [self proactiveEndpointController];
      id Strong = [objc_allocWithZone((Class)MRUNowPlayingController) initWithEndpointController:v20];

      swift_unknownObjectWeakAssign();
    }
    id v21 = [objc_allocWithZone((Class)MRUAmbientNowPlayingViewController) initWithNowPlayingController:Strong];

    swift_beginAccess();
    sub_1000075A0((uint64_t *)&unk_10005CBF0);
    Published.projectedValue.getter();
    swift_endAccess();
    sub_100010118(&qword_10005CD20, &qword_10005CCF0);
    Publisher.filter(_:)();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v3);
    sub_1000075A0(&qword_10005CD28);
    sub_100010118(&qword_10005CD30, &qword_10005CCF8);
    uint64_t v22 = v38;
    Publisher.map<A>(_:)();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v22);
    sub_100010118(&qword_10005CD38, &qword_10005CD00);
    uint64_t v23 = v39;
    Publisher.first()();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v23);
    sub_100010118(&qword_10005CD40, &qword_10005CD08);
    uint64_t v24 = v41;
    Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v24);
    swift_getKeyPath();
    v42[0] = v21;
    sub_100010118(&qword_10005CD48, (uint64_t *)&unk_10005CD10);
    uint64_t v25 = v32;
    uint64_t v26 = Publisher<>.assign<A>(to:on:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v25);
    v42[3] = type metadata accessor for AnyCancellable();
    v42[4] = &protocol witness table for AnyCancellable;
    v42[0] = v26;
    uint64_t v27 = v18 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable;
    swift_beginAccess();
    sub_100010040((uint64_t)v42, v27);
    swift_endAccess();
    id v28 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
    id v29 = [v28 initWithWindowScene:v33];
    [v29 setRootViewController:v21];
    [v29 makeKeyAndVisible];
    Swift::String v30 = *(void **)(v18 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window);
    *(void *)(v18 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window) = v29;
  }
}

uint64_t sub_100012734()
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable;
  swift_beginAccess();
  sub_100010040((uint64_t)v4, v1);
  swift_endAccess();
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window);
  *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window) = 0;

  if (qword_10005C190 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v4[0]) = 0;
  swift_retain();
  static Published.subscript.setter();
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  return os_log(_:dso:log:_:_:)();
}

const char *sub_10001289C()
{
  return "backdropViewController";
}

id sub_1000128A8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 backdropViewController];
  *a2 = result;
  return result;
}

id sub_1000128E4(void *a1, id *a2)
{
  return [*a2 setBackdropViewController:*a1];
}

uint64_t sub_1000128F8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

char *sub_10001293C(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v35 = a3;
  uint64_t v36 = a5;
  uint64_t v9 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000075A0((uint64_t *)&unk_10005D730);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000075A0((uint64_t *)&unk_10005CDB0);
  uint64_t v40 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000075A0(&qword_10005D740);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v42 = v18;
  uint64_t v43 = v19;
  __chkstk_darwin(v18);
  id v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables) = &_swiftEmptySetSingleton;
  *(void *)(v5
            + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration) = 0;
  *(unsigned char *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen) = 0;
  *(void *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView) = 0;
  swift_unknownObjectWeakInit();
  *(unsigned char *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_providesHostedContent) = 1;
  uint64_t v41 = a1;
  sub_1000075E4(a1);
  uint64_t v39 = a4;
  swift_unknownObjectRetain();
  id v22 = a2;
  id v38 = v22;
  id v23 = v35;
  uint64_t v24 = v22;
  id v25 = v23;
  uint64_t v26 = sub_100020798((uint64_t)a1, v24, v23, a4, v36);
  uint64_t v27 = v25;
  id v28 = [v25 configuration];
  id v29 = [self mru_suggestedRouteBannerTitleFont];
  [v28 setFont:v29];

  [v26 setPreferredContentSize:CGSizeMake(430.0, 50.0)];
  swift_beginAccess();
  Swift::String v30 = v26;
  sub_1000075A0(&qword_10005CDC0);
  Published.projectedValue.getter();
  swift_endAccess();

  sub_100010118(&qword_10005CDC8, (uint64_t *)&unk_10005D730);
  sub_10001416C();
  Publisher<>.removeDuplicates()();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
  id v31 = [self mainRunLoop];
  id v46 = v31;
  sub_1000141C0();
  sub_100010118(&qword_10005CDE0, (uint64_t *)&unk_10005CDB0);
  sub_100014200();
  uint64_t v32 = v37;
  Publisher.throttle<A>(for:scheduler:latest:)();

  (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v45);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v32);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100010118((unint64_t *)&unk_10005CDF0, &qword_10005D740);
  uint64_t v33 = v42;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v21, v33);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();

  swift_unknownObjectRelease();
  sub_100007760(v41);
  swift_release();

  return v30;
}

void sub_100012F24(long long *a1)
{
  long long v1 = a1[11];
  long long v117 = a1[10];
  long long v118 = v1;
  long long v119 = a1[12];
  uint64_t v120 = *((void *)a1 + 26);
  long long v2 = a1[7];
  long long v113 = a1[6];
  long long v114 = v2;
  long long v3 = a1[9];
  long long v115 = a1[8];
  long long v116 = v3;
  long long v4 = a1[3];
  long long v109 = a1[2];
  long long v110 = v4;
  long long v5 = a1[5];
  long long v111 = a1[4];
  long long v112 = v5;
  long long v6 = a1[1];
  long long v107 = *a1;
  long long v108 = v6;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_100020C50();
    uint64_t v9 = swift_allocObject();
    long long v10 = v111;
    *(_OWORD *)(v9 + 104) = v112;
    *(_OWORD *)(v9 + 88) = v10;
    long long v11 = v109;
    *(_OWORD *)(v9 + 72) = v110;
    *(_OWORD *)(v9 + 56) = v11;
    long long v12 = v115;
    *(_OWORD *)(v9 + 168) = v116;
    *(_OWORD *)(v9 + 152) = v12;
    long long v13 = v113;
    *(_OWORD *)(v9 + 136) = v114;
    *(_OWORD *)(v9 + 120) = v13;
    *(_OWORD *)(v9 + 216) = v119;
    long long v14 = v117;
    *(_OWORD *)(v9 + 200) = v118;
    *(_OWORD *)(v9 + 184) = v14;
    long long v15 = v108;
    *(_OWORD *)(v9 + 24) = v107;
    *(void *)(v9 + 16) = v8;
    *(void *)(v9 + 232) = v120;
    *(_OWORD *)(v9 + 40) = v15;
    if (*((unsigned char *)v8 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen) == 1)
    {
      uint64_t v16 = self;
      *(void *)&long long v95 = sub_100014348;
      *((void *)&v95 + 1) = v9;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v94 = sub_1000128F8;
      *((void *)&v94 + 1) = &unk_100049C60;
      uint64_t v17 = _Block_copy(&aBlock);
      id v18 = v8;
      sub_1000075E4(&v107);
      swift_retain();
      swift_release();
      [v16 animateWithDuration:4 delay:v17 options:0 animations:0.25 completion:0.0];

      swift_release();
      _Block_release(v17);
    }
    else
    {
      id v19 = v8;
      sub_1000075E4(&v107);
      uint64_t v20 = sub_100013698();
      id v21 = &v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
      long long v22 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
      long long aBlock = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
      long long v94 = v22;
      long long v23 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
      long long v25 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
      long long v24 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
      long long v98 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
      long long v97 = v23;
      long long v95 = v25;
      long long v96 = v24;
      long long v26 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
      long long v28 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
      long long v27 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
      long long v102 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
      long long v101 = v26;
      long long v99 = v28;
      long long v100 = v27;
      long long v30 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
      long long v29 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
      long long v31 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
      uint64_t v106 = *(void *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
      long long v105 = v29;
      long long v103 = v31;
      long long v104 = v30;
      long long v32 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
      long long v33 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
      long long v34 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
      long long v84 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
      long long v85 = v32;
      long long v86 = v33;
      uint64_t v87 = *(void *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
      long long v35 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
      long long v36 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
      long long v37 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
      long long v80 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
      long long v81 = v35;
      long long v82 = v36;
      long long v83 = v34;
      long long v38 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
      long long v39 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
      long long v40 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
      long long v76 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
      long long v77 = v38;
      long long v78 = v39;
      long long v79 = v37;
      long long v41 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
      long long v74 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
      long long v75 = v41;
      v88[0] = v74;
      v88[1] = v40;
      long long v42 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
      long long v43 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
      long long v44 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
      v88[4] = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
      v88[5] = v44;
      v88[2] = v42;
      v88[3] = v43;
      long long v45 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
      long long v46 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
      long long v47 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
      v88[8] = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
      v88[9] = v47;
      v88[6] = v45;
      v88[7] = v46;
      long long v48 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
      long long v49 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
      long long v50 = *(_OWORD *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
      uint64_t v89 = *(void *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
      v88[11] = v49;
      v88[12] = v50;
      v88[10] = v48;
      long long v51 = v108;
      *(_OWORD *)id v21 = v107;
      *((_OWORD *)v21 + 1) = v51;
      long long v52 = v109;
      long long v53 = v110;
      long long v54 = v112;
      *((_OWORD *)v21 + 4) = v111;
      *((_OWORD *)v21 + 5) = v54;
      *((_OWORD *)v21 + 2) = v52;
      *((_OWORD *)v21 + 3) = v53;
      long long v55 = v113;
      long long v56 = v114;
      long long v57 = v116;
      *((_OWORD *)v21 + 8) = v115;
      *((_OWORD *)v21 + 9) = v57;
      *((_OWORD *)v21 + 6) = v55;
      *((_OWORD *)v21 + 7) = v56;
      long long v58 = v117;
      long long v59 = v118;
      long long v60 = v119;
      *((void *)v21 + 26) = v120;
      *((_OWORD *)v21 + 11) = v59;
      *((_OWORD *)v21 + 12) = v60;
      *((_OWORD *)v21 + 10) = v58;
      sub_1000075E4(&v107);
      sub_1000075E4(&v107);
      sub_1000075E4(&aBlock);
      sub_100007760(v88);
      long long v61 = *((_OWORD *)v21 + 1);
      v91[0] = *(_OWORD *)v21;
      v91[1] = v61;
      long long v62 = *((_OWORD *)v21 + 5);
      long long v64 = *((_OWORD *)v21 + 2);
      long long v63 = *((_OWORD *)v21 + 3);
      v91[4] = *((_OWORD *)v21 + 4);
      v91[5] = v62;
      v91[2] = v64;
      v91[3] = v63;
      long long v65 = *((_OWORD *)v21 + 8);
      long long v67 = *((_OWORD *)v21 + 6);
      long long v66 = *((_OWORD *)v21 + 7);
      v91[9] = *((_OWORD *)v21 + 9);
      v91[8] = v65;
      v91[6] = v67;
      v91[7] = v66;
      long long v69 = *((_OWORD *)v21 + 11);
      long long v68 = *((_OWORD *)v21 + 12);
      long long v70 = *((_OWORD *)v21 + 10);
      uint64_t v92 = *((void *)v21 + 26);
      v91[12] = v68;
      v91[10] = v70;
      v91[11] = v69;
      sub_1000075E4(v91);
      LOBYTE(v21) = sub_10001B090((uint64_t)v91, (uint64_t)&aBlock);
      sub_100007760(v91);
      if ((v21 & 1) == 0)
      {
        v72[10] = v84;
        v72[11] = v85;
        v72[12] = v86;
        uint64_t v73 = v87;
        v72[6] = v80;
        v72[7] = v81;
        v72[8] = v82;
        v72[9] = v83;
        v72[2] = v76;
        v72[3] = v77;
        v72[4] = v78;
        v72[5] = v79;
        v72[0] = v74;
        v72[1] = v75;
        nullsub_2(v72);
        sub_1000076F8((uint64_t)v72, (uint64_t)v90);
        sub_100031938((uint64_t)v90);
        [*(id *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView] invalidateIntrinsicContentSize];
      }
      sub_100007760(&v107);
      sub_100007760(&aBlock);

      id v71 = sub_100013698();
      [v71 layoutIfNeeded];

      swift_release();
    }
  }
}

void sub_1000133F4(uint64_t a1, uint64_t a2)
{
  long long v3 = sub_100013698();
  long long v4 = &v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  long long v5 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  v60[0] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v60[1] = v5;
  long long v6 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
  long long v8 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  long long v7 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  v60[4] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v60[5] = v6;
  v60[2] = v8;
  v60[3] = v7;
  long long v9 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
  long long v11 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  long long v10 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
  v60[8] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  v60[9] = v9;
  v60[6] = v11;
  v60[7] = v10;
  long long v13 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
  long long v12 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
  long long v14 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
  uint64_t v61 = *(void *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
  v60[11] = v13;
  v60[12] = v12;
  v60[10] = v14;
  long long v15 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
  long long v16 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
  long long v17 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
  long long v72 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
  long long v73 = v15;
  long long v74 = v16;
  uint64_t v75 = *(void *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
  long long v18 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
  long long v19 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  long long v20 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
  long long v68 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  long long v69 = v18;
  long long v70 = v19;
  long long v71 = v17;
  long long v21 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  long long v22 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  long long v23 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  long long v64 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  long long v65 = v21;
  long long v66 = v22;
  long long v67 = v20;
  long long v24 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  long long v62 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  long long v63 = v24;
  v76[1] = v23;
  v76[0] = v62;
  long long v25 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  long long v26 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  long long v27 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v76[5] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
  v76[4] = v27;
  v76[3] = v26;
  v76[2] = v25;
  long long v28 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  long long v29 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
  long long v30 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  v76[9] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
  v76[8] = v30;
  v76[7] = v29;
  v76[6] = v28;
  long long v31 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
  long long v32 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
  long long v33 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
  uint64_t v77 = *(void *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
  v76[12] = v33;
  v76[11] = v32;
  v76[10] = v31;
  long long v34 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)long long v4 = *(_OWORD *)a2;
  *((_OWORD *)v4 + 1) = v34;
  long long v35 = *(_OWORD *)(a2 + 32);
  long long v36 = *(_OWORD *)(a2 + 48);
  long long v37 = *(_OWORD *)(a2 + 80);
  *((_OWORD *)v4 + 4) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v4 + 5) = v37;
  *((_OWORD *)v4 + 2) = v35;
  *((_OWORD *)v4 + 3) = v36;
  long long v38 = *(_OWORD *)(a2 + 96);
  long long v39 = *(_OWORD *)(a2 + 112);
  long long v40 = *(_OWORD *)(a2 + 144);
  *((_OWORD *)v4 + 8) = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v4 + 9) = v40;
  *((_OWORD *)v4 + 6) = v38;
  *((_OWORD *)v4 + 7) = v39;
  long long v41 = *(_OWORD *)(a2 + 160);
  long long v42 = *(_OWORD *)(a2 + 176);
  long long v43 = *(_OWORD *)(a2 + 192);
  *((void *)v4 + 26) = *(void *)(a2 + 208);
  *((_OWORD *)v4 + 11) = v42;
  *((_OWORD *)v4 + 12) = v43;
  *((_OWORD *)v4 + 10) = v41;
  sub_1000075E4((void *)a2);
  sub_1000075E4((void *)a2);
  sub_1000075E4(v60);
  sub_100007760(v76);
  long long v44 = *((_OWORD *)v4 + 1);
  v58[0] = *(_OWORD *)v4;
  v58[1] = v44;
  long long v45 = *((_OWORD *)v4 + 5);
  long long v47 = *((_OWORD *)v4 + 2);
  long long v46 = *((_OWORD *)v4 + 3);
  v58[4] = *((_OWORD *)v4 + 4);
  v58[5] = v45;
  v58[2] = v47;
  v58[3] = v46;
  long long v48 = *((_OWORD *)v4 + 9);
  long long v50 = *((_OWORD *)v4 + 6);
  long long v49 = *((_OWORD *)v4 + 7);
  v58[8] = *((_OWORD *)v4 + 8);
  v58[9] = v48;
  v58[6] = v50;
  v58[7] = v49;
  long long v52 = *((_OWORD *)v4 + 11);
  long long v51 = *((_OWORD *)v4 + 12);
  long long v53 = *((_OWORD *)v4 + 10);
  uint64_t v59 = *((void *)v4 + 26);
  v58[11] = v52;
  v58[12] = v51;
  v58[10] = v53;
  sub_1000075E4(v58);
  LOBYTE(v4) = sub_10001B090((uint64_t)v58, (uint64_t)v60);
  sub_100007760(v58);
  if ((v4 & 1) == 0)
  {
    v55[10] = v72;
    v55[11] = v73;
    v55[12] = v74;
    uint64_t v56 = v75;
    v55[6] = v68;
    v55[7] = v69;
    v55[8] = v70;
    v55[9] = v71;
    v55[2] = v64;
    v55[3] = v65;
    v55[4] = v66;
    v55[5] = v67;
    v55[0] = v62;
    v55[1] = v63;
    nullsub_2(v55);
    sub_1000076F8((uint64_t)v55, (uint64_t)v57);
    sub_100031938((uint64_t)v57);
    [*(id *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView] invalidateIntrinsicContentSize];
  }
  sub_100007760((void *)a2);
  sub_100007760(v60);

  long long v54 = sub_100013698();
  [v54 layoutIfNeeded];
}

char *sub_100013698()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView;
  long long v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView);
  if (v2)
  {
    long long v3 = *(char **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView);
  }
  else
  {
    uint64_t v4 = v0;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    v24[10] = v20;
    v24[11] = v21;
    v24[12] = v22;
    uint64_t v25 = v23;
    v24[6] = v16;
    v24[7] = v17;
    v24[8] = v18;
    v24[9] = v19;
    v24[2] = v12;
    v24[3] = v13;
    v24[4] = v14;
    v24[5] = v15;
    v24[0] = v10;
    v24[1] = v11;
    id v5 = objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerView());
    long long v6 = sub_1000310D8((uint64_t)v24);
    long long v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    long long v3 = v6;

    long long v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_100013820()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000075A0(&qword_10005CE08);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter] configuration];
  long long v7 = sub_100013698();
  double v8 = *(double *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_titleLabelMaxWidth];

  [v6 setTextBoundingWidth:v8];
  sub_100021430();
  long long v9 = sub_100013698();
  long long v10 = sub_100030F04();

  swift_beginAccess();
  sub_1000075A0((uint64_t *)&unk_10005C360);
  Published.projectedValue.getter();
  swift_endAccess();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100010118(&qword_10005D780, &qword_10005CE08);
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  long long v11 = sub_100013698();
  id v12 = *(id *)&v11[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView];

  long long v13 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView];
  *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView] = v12;
  id v14 = v12;

  sub_100020C50();
  long long v15 = (objc_class *)type metadata accessor for SuggestedRouteBannerViewController();
  v19.receiver = v1;
  v19.super_class = v15;
  [super viewDidLoad];
  long long v16 = sub_100013698();
  id v17 = *(id *)&v16[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton];

  [v17 addTarget:v1 action:"actionButtonTappedWithSender:" forControlEvents:64];
}

void sub_100013B1C(double *a1)
{
  double v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = [*(id *)(Strong + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter) configuration];
    [v4 textBoundingWidth];
    double v6 = v5;

    if (v6 < v1) {
      sub_1000215F0(v1);
    }
  }
}

id sub_100013C0C(char a1)
{
  uint64_t v2 = v1;
  id v4 = sub_100013698();
  sub_1000075A0(&qword_10005CE00);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100038360;
  *(void *)(v5 + 32) = type metadata accessor for UITraitUserInterfaceStyle();
  *(void *)(v5 + 40) = &protocol witness table for UITraitUserInterfaceStyle;
  double v6 = sub_100013698();
  v11[3] = type metadata accessor for SuggestedRouteBannerView();
  v11[0] = v6;
  uint64_t v7 = UIView.registerForTraitChanges(_:target:action:)();

  swift_bridgeObjectRelease();
  sub_100014434((uint64_t)v11);
  *(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration] = v7;
  swift_unknownObjectRelease();
  double v8 = sub_100013698();
  sub_100031E10();

  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController();
  return [super viewWillAppear:a1 & 1];
}

uint64_t sub_100013FAC()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView));
  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext;

  return sub_100008C10(v1);
}

id sub_10001400C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController();
  return [super dealloc];
}

uint64_t sub_1000140B0()
{
  return type metadata accessor for SuggestedRouteBannerViewController();
}

uint64_t type metadata accessor for SuggestedRouteBannerViewController()
{
  uint64_t result = qword_10005CD98;
  if (!qword_10005CD98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014104()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_10001416C()
{
  unint64_t result = qword_10005CDD0;
  if (!qword_10005CDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CDD0);
  }
  return result;
}

unint64_t sub_1000141C0()
{
  unint64_t result = qword_10005CDD8;
  if (!qword_10005CDD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005CDD8);
  }
  return result;
}

unint64_t sub_100014200()
{
  unint64_t result = qword_10005CDE8;
  if (!qword_10005CDE8)
  {
    sub_1000141C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CDE8);
  }
  return result;
}

uint64_t sub_100014258()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100014290(long long *a1)
{
}

uint64_t sub_100014298()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 240, 7);
}

void sub_100014348()
{
  sub_1000133F4(*(void *)(v0 + 16), v0 + 24);
}

uint64_t sub_100014358(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100014368()
{
  return swift_release();
}

void sub_100014378()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration] = 0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView] = 0;
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_providesHostedContent] = 1;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100014434(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100014484(double *a1)
{
}

void sub_10001448C(void *a1, uint64_t a2, uint64_t a3)
{
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (!v7) {
    return;
  }
  double v8 = (void *)v7;
  id v17 = a1;
  id v9 = [v8 configurationIdentifier];
  if (v9)
  {
    objc_super v10 = v9;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    if (v11 == 0x74696D69786F7270 && v13 == 0xEE00647261632D79)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
    }
    *(void *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate) = [objc_allocWithZone((Class)type metadata accessor for ProximityCardSceneDelegate()) init];
    swift_unknownObjectRelease();
  }
LABEL_12:
  long long v16 = *(void **)(v3 + OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate);
  if (v16 && ([v16 respondsToSelector:"scene:willConnectToSession:options:"] & 1) != 0) {
    [v16 scene:v17 willConnectToSession:a2 options:a3];
  }
}

char *sub_100014730(char *result, uint64_t a2, uint64_t a3, const char **a4)
{
  id v4 = *(void **)&result[OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate];
  if (v4)
  {
    unint64_t result = (char *)[*(id *)&result[OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate] respondsToSelector:*a4];
    if (result)
    {
      uint64_t v7 = *a4;
      return (char *)[v4 v7 a3];
    }
  }
  return result;
}

id sub_1000147FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  return self;
}

void sub_1000148BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = sub_1000075A0(&qword_10005CC88);
  __chkstk_darwin(v13 - 8);
  char v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for ProximityCardViewController();
    id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    id v17 = a1;
    uint64_t v18 = (char *)[v16 init];
    id v19 = [v17 mru_imageFittingSize:150.0, 150.0];
    long long v20 = *(void **)&v18[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image];
    *(void *)&v18[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image] = v19;

    long long v21 = &v18[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName];
    *(void *)long long v21 = a3;
    *((void *)v21 + 1) = a4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v22 = type metadata accessor for URL();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v15, a5, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v15, 0, 1, v22);
    uint64_t v24 = (uint64_t)&v18[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];
    swift_beginAccess();
    sub_1000158C0((uint64_t)v15, v24);
    swift_endAccess();
    type metadata accessor for ProximityCardRootViewController();
    id v25 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v26 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:a6];
    [v26 setRootViewController:v25];
    [v26 makeKeyAndVisible];
    long long v27 = *(void **)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
    *(void *)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = v26;
    id v28 = v26;

    id v29 = [v25 presentProxCardFlowWithDelegate:a7 initialViewController:v18];
    long long v30 = *(void **)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController);
    *(void *)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController) = v29;
  }
}

id sub_100014D88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProximityCardSceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for ProximityCardSceneDelegate()
{
  return self;
}

void sub_100014E2C(void *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_1000075A0(&qword_10005CC88);
  __chkstk_darwin(v4 - 8);
  double v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v39 - v12;
  self;
  uint64_t v14 = swift_dynamicCastObjCClass();
  if (v14)
  {
    char v15 = (void *)v14;
    id v48 = a1;
    id v16 = [v15 configurationContext];
    if (v16)
    {
      id v17 = v16;
      id v18 = [v16 userInfo];

      if (v18)
      {
        uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v50 = 0x614E656369766564;
        unint64_t v51 = 0xEA0000000000656DLL;
        AnyHashable.init<A>(_:)();
        if (*(void *)(v19 + 16) && (unint64_t v20 = sub_10003072C((uint64_t)aBlock), (v21 & 1) != 0))
        {
          sub_100015864(*(void *)(v19 + 56) + 32 * v20, (uint64_t)&v52);
        }
        else
        {
          long long v52 = 0u;
          long long v53 = 0u;
        }
        sub_1000155E8((uint64_t)aBlock);
        if (!*((void *)&v53 + 1))
        {

          goto LABEL_34;
        }
        if ((swift_dynamicCast() & 1) == 0)
        {

          goto LABEL_37;
        }
        unint64_t v23 = v51;
        uint64_t v47 = v50;
        uint64_t v50 = 0x6564496C65646F6DLL;
        unint64_t v51 = 0xEF7265696669746ELL;
        AnyHashable.init<A>(_:)();
        if (*(void *)(v19 + 16) && (unint64_t v24 = sub_10003072C((uint64_t)aBlock), (v25 & 1) != 0))
        {
          sub_100015864(*(void *)(v19 + 56) + 32 * v24, (uint64_t)&v52);
        }
        else
        {
          long long v52 = 0u;
          long long v53 = 0u;
        }
        sub_1000155E8((uint64_t)aBlock);
        if (*((void *)&v53 + 1))
        {
          if ((swift_dynamicCast() & 1) == 0)
          {

            goto LABEL_36;
          }
          NSString v45 = (NSString)v50;
          NSString v46 = (NSString)v51;
          uint64_t v50 = 0x726F6C6F63;
          unint64_t v51 = 0xE500000000000000;
          AnyHashable.init<A>(_:)();
          if (*(void *)(v19 + 16) && (unint64_t v26 = sub_10003072C((uint64_t)aBlock), (v27 & 1) != 0))
          {
            sub_100015864(*(void *)(v19 + 56) + 32 * v26, (uint64_t)&v52);
          }
          else
          {
            long long v52 = 0u;
            long long v53 = 0u;
          }
          sub_1000155E8((uint64_t)aBlock);
          if (*((void *)&v53 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v43 = v50;
              unint64_t v44 = v51;
              uint64_t v50 = 7107189;
              unint64_t v51 = 0xE300000000000000;
              AnyHashable.init<A>(_:)();
              if (*(void *)(v19 + 16) && (unint64_t v28 = sub_10003072C((uint64_t)aBlock), (v29 & 1) != 0))
              {
                sub_100015864(*(void *)(v19 + 56) + 32 * v28, (uint64_t)&v52);
              }
              else
              {
                long long v52 = 0u;
                long long v53 = 0u;
              }
              swift_bridgeObjectRelease();
              sub_1000155E8((uint64_t)aBlock);
              if (*((void *)&v53 + 1))
              {
                if (swift_dynamicCast())
                {
                  URL.init(string:)();
                  swift_bridgeObjectRelease();
                  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();

                    sub_10001563C((uint64_t)v6, &qword_10005CC88);
                  }
                  else
                  {
                    long long v40 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
                    uint64_t v42 = v8 + 32;
                    v40(v13, v6, v7);
                    id v41 = [self sharedManager];
                    NSString v45 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    NSString v46 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
                    unint64_t v30 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
                    unint64_t v44 = (v9 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
                    unint64_t v31 = (v44 + 15) & 0xFFFFFFFFFFFFFFF8;
                    uint64_t v32 = swift_allocObject();
                    *(void *)(v32 + 16) = v47;
                    *(void *)(v32 + 24) = v23;
                    v40((char *)(v32 + v30), v11, v7);
                    *(void *)(v32 + v44) = v15;
                    *(void *)(v32 + v31) = v2;
                    aBlock[4] = sub_100015790;
                    aBlock[5] = v32;
                    aBlock[0] = _NSConcreteStackBlock;
                    aBlock[1] = 1107296256;
                    aBlock[2] = sub_1000111D0;
                    aBlock[3] = &unk_100049CB0;
                    long long v33 = _Block_copy(aBlock);
                    id v34 = v48;
                    id v35 = v2;
                    swift_release();
                    id v36 = v41;
                    long long v37 = v45;
                    long long v38 = v46;
                    [v41 imageForModelIdentifier:v45 color:v46 allowFallback:1 completion:v33];
                    _Block_release(v33);

                    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
                  }
                  return;
                }

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_37:
                swift_bridgeObjectRelease();
                return;
              }

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_34:
              swift_bridgeObjectRelease();
              sub_10001563C((uint64_t)&v52, &qword_10005CA00);
              return;
            }

            swift_bridgeObjectRelease();
LABEL_36:
            swift_bridgeObjectRelease();
            goto LABEL_37;
          }

          swift_bridgeObjectRelease();
        }
        else
        {
        }
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
    }
    id v22 = v48;
  }
}

uint64_t sub_1000155E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001563C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000075A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100015698()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v7 + 8, v5);
}

void sub_100015790(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v2 + 24);
  uint64_t v10 = *(void *)(v2 + v7);
  uint64_t v11 = *(void *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_1000148BC(a1, a2, v8, v9, v2 + v6, v10, v11);
}

uint64_t sub_10001584C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001585C()
{
  return swift_release();
}

uint64_t sub_100015864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000158C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075A0(&qword_10005CC88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015928()
{
  type metadata accessor for AmbientSceneDependency();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_unknownObjectWeakInit();
  qword_10005E718 = v0;
  return result;
}

uint64_t sub_10001596C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AmbientSceneDependency()
{
  return self;
}

uint64_t sub_1000159C8()
{
  type metadata accessor for SceneMonitor();
  swift_allocObject();
  uint64_t result = sub_100015AB0();
  qword_10005E720 = result;
  return result;
}

uint64_t sub_100015A08()
{
  return sub_100015A44();
}

uint64_t sub_100015A1C()
{
  return sub_100015A44();
}

uint64_t sub_100015A30()
{
  return sub_100015A44();
}

uint64_t sub_100015A44()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100015AB0()
{
  uint64_t v1 = sub_1000075A0((uint64_t *)&unk_10005CBF0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientSceneActive;
  v10[15] = 0;
  Published.init(initialValue:)();
  unint64_t v6 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 32);
  v6(v5, v4, v1);
  uint64_t v7 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientCompactSceneActive;
  v10[14] = 0;
  Published.init(initialValue:)();
  v6(v7, v4, v1);
  uint64_t v8 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isBackdropSceneActive;
  v10[13] = 0;
  Published.init(initialValue:)();
  v6(v8, v4, v1);
  return v0;
}

uint64_t sub_100015C20()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientSceneActive;
  uint64_t v2 = sub_1000075A0((uint64_t *)&unk_10005CBF0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientCompactSceneActive, v2);
  v3(v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isBackdropSceneActive, v2);
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_100015D10()
{
  return type metadata accessor for SceneMonitor();
}

uint64_t type metadata accessor for SceneMonitor()
{
  uint64_t result = qword_10005D018;
  if (!qword_10005D018) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100015D64()
{
  sub_100015DF8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100015DF8()
{
  if (!qword_10005D028)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005D028);
    }
  }
}

uint64_t sub_100015E50@<X0>(unsigned char *a1@<X8>)
{
  return sub_100015E8C(a1);
}

uint64_t sub_100015E64()
{
  return sub_100015F1C();
}

uint64_t sub_100015E78@<X0>(unsigned char *a1@<X8>)
{
  return sub_100015E8C(a1);
}

uint64_t sub_100015E8C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100015F08()
{
  return sub_100015F1C();
}

uint64_t sub_100015F1C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100015F94@<X0>(unsigned char *a1@<X8>)
{
  return sub_100015E8C(a1);
}

uint64_t sub_100015FBC()
{
  return sub_100015F1C();
}

uint64_t sub_100015FE4@<X0>(unsigned char *a1@<X8>)
{
  return sub_100015E8C(a1);
}

uint64_t sub_10001600C()
{
  return sub_100015F1C();
}

void sub_1000160C4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_100008C38(0, &qword_10005D238);
    id v6 = a1;
    id v7 = v5;
    LOBYTE(v5) = static NSObject.== infix(_:_:)();

    if (v5)
    {
      if (qword_10005C1C0 != -1) {
        swift_once();
      }
      uint64_t v8 = *(void **)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
      *(void *)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) = 0;

      sub_100028F88();
      uint64_t v9 = qword_10005E808;
      uint64_t v10 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
      uint64_t v11 = *(void **)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
      *(void *)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = 0;

      sub_10002B210();
      uint64_t v12 = *(void **)(v9 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
      if (v12)
      {
        id v13 = *(id *)(v9 + v10);
        id v14 = v12;
        id v15 = [v14 artworkView];
        [v15 setArtwork:v13];
      }
      uint64_t v16 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow;
      goto LABEL_14;
    }
  }
  uint64_t v17 = swift_unknownObjectWeakLoadStrong();
  if (v17)
  {
    id v18 = (void *)v17;
    sub_100008C38(0, &qword_10005D238);
    id v19 = a1;
    id v20 = v18;
    LOBYTE(v18) = static NSObject.== infix(_:_:)();

    if (v18)
    {
      uint64_t v16 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow;
LABEL_14:
      char v25 = *(void **)(v2 + v16);
      *(void *)(v2 + v16) = 0;

      return;
    }
  }
  uint64_t v21 = swift_unknownObjectWeakLoadStrong();
  if (v21)
  {
    id v22 = (void *)v21;
    sub_100008C38(0, &qword_10005D238);
    id v23 = a1;
    id v24 = v22;
    LOBYTE(v22) = static NSObject.== infix(_:_:)();

    if (v22)
    {
      uint64_t v16 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow;
      goto LABEL_14;
    }
  }
  uint64_t v26 = swift_unknownObjectWeakLoadStrong();
  if (!v26) {
    goto LABEL_20;
  }
  char v27 = (void *)v26;
  sub_100008C38(0, &qword_10005D238);
  id v28 = a1;
  id v29 = v27;
  LOBYTE(v27) = static NSObject.== infix(_:_:)();

  if (v27)
  {
    uint64_t v30 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider;
  }
  else
  {
LABEL_20:
    uint64_t v31 = swift_unknownObjectWeakLoadStrong();
    if (!v31) {
      return;
    }
    uint64_t v32 = (void *)v31;
    sub_100008C38(0, &qword_10005D238);
    id v33 = a1;
    id v34 = v32;
    LOBYTE(v32) = static NSObject.== infix(_:_:)();

    if ((v32 & 1) == 0) {
      return;
    }
    uint64_t v30 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider;
  }
  *(void *)(v2 + v30) = 0;

  swift_unknownObjectRelease();
}

void sub_1000164B4(void *a1)
{
}

void sub_10001654C(void *a1)
{
}

void sub_10001657C(void *a1, const char *a2, char a3, const char *a4, const char *a5, const char *a6, const char *a7)
{
  uint64_t v12 = v7;
  swift_getObjectType();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v15 = (void *)Strong;
    sub_100008C38(0, &qword_10005D238);
    id v16 = a1;
    id v17 = v15;
    char v18 = static NSObject.== infix(_:_:)();

    if (v18)
    {
      if (qword_10005C1B0 != -1) {
        swift_once();
      }
      uint64_t v19 = type metadata accessor for Logger();
      sub_100017894(v19, (uint64_t)qword_10005E7D0);
      id v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        *(_DWORD *)id v22 = 136315138;
        uint64_t v23 = _typeName(_:qualified:)();
        sub_1000340A8(v23, v24, &v87);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v20, v21, a2, v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v25 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow;
      uint64_t v26 = *(void **)(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow);
      if (v26)
      {
        id v27 = [v26 rootViewController];
        if (v27)
        {
          id v28 = v27;
          [v27 beginAppearanceTransition:a3 & 1 animated:0];
        }
      }
LABEL_20:
      id v43 = [*(id *)(v12 + v25) rootViewController];
      [v43 endAppearanceTransition];

      return;
    }
  }
  uint64_t v29 = swift_unknownObjectWeakLoadStrong();
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    sub_100008C38(0, &qword_10005D238);
    id v31 = a1;
    id v32 = v30;
    char v33 = static NSObject.== infix(_:_:)();

    if (v33)
    {
      if (qword_10005C1B0 != -1) {
        swift_once();
      }
      uint64_t v34 = type metadata accessor for Logger();
      sub_100017894(v34, (uint64_t)qword_10005E7D0);
      id v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v35, v36))
      {
        long long v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        *(_DWORD *)long long v37 = 136315138;
        uint64_t v38 = _typeName(_:qualified:)();
        sub_1000340A8(v38, v39, &v87);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, a4, v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v25 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow;
      long long v40 = *(void **)(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow);
      if (v40)
      {
        id v41 = [v40 rootViewController];
        if (v41)
        {
          uint64_t v42 = v41;
          [v41 beginAppearanceTransition:a3 & 1 animated:0];
        }
      }
      goto LABEL_20;
    }
  }
  uint64_t v44 = swift_unknownObjectWeakLoadStrong();
  if (!v44) {
    goto LABEL_27;
  }
  NSString v45 = (void *)v44;
  sub_100008C38(0, &qword_10005D238);
  id v46 = a1;
  id v47 = v45;
  char v48 = static NSObject.== infix(_:_:)();

  if (v48)
  {
    if (qword_10005C1B0 != -1) {
      swift_once();
    }
    uint64_t v49 = type metadata accessor for Logger();
    sub_100017894(v49, (uint64_t)qword_10005E7D0);
    os_log_t osloga = (os_log_t)Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(osloga, v50))
    {
      unint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      *(_DWORD *)unint64_t v51 = 136315138;
      uint64_t v52 = _typeName(_:qualified:)();
      sub_1000340A8(v52, v53, &v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      long long v54 = osloga;
      os_log_type_t v55 = v50;
      uint64_t v56 = a5;
LABEL_45:
      _os_log_impl((void *)&_mh_execute_header, v54, v55, v56, v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
LABEL_27:
    uint64_t v57 = swift_unknownObjectWeakLoadStrong();
    if (!v57) {
      goto LABEL_33;
    }
    long long v58 = (void *)v57;
    sub_100008C38(0, &qword_10005D238);
    id v59 = a1;
    id v60 = v58;
    char v61 = static NSObject.== infix(_:_:)();

    if (v61)
    {
      if (qword_10005C1B0 != -1) {
        swift_once();
      }
      uint64_t v62 = type metadata accessor for Logger();
      sub_100017894(v62, (uint64_t)qword_10005E7D0);
      os_log_t osloga = (os_log_t)Logger.logObject.getter();
      os_log_type_t v63 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(osloga, v63))
      {
        unint64_t v51 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        *(_DWORD *)unint64_t v51 = 136315138;
        uint64_t v64 = _typeName(_:qualified:)();
        sub_1000340A8(v64, v65, &v87);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        long long v54 = osloga;
        os_log_type_t v55 = v63;
        uint64_t v56 = a4;
        goto LABEL_45;
      }
    }
    else
    {
LABEL_33:
      uint64_t v66 = swift_unknownObjectWeakLoadStrong();
      if (!v66) {
        goto LABEL_39;
      }
      long long v67 = (void *)v66;
      sub_100008C38(0, &qword_10005D238);
      id v68 = a1;
      id v69 = v67;
      char v70 = static NSObject.== infix(_:_:)();

      if (v70)
      {
        if (qword_10005C1B0 != -1) {
          swift_once();
        }
        uint64_t v71 = type metadata accessor for Logger();
        sub_100017894(v71, (uint64_t)qword_10005E7D0);
        os_log_t osloga = (os_log_t)Logger.logObject.getter();
        os_log_type_t v72 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(osloga, v72))
        {
          unint64_t v51 = (uint8_t *)swift_slowAlloc();
          uint64_t v87 = swift_slowAlloc();
          *(_DWORD *)unint64_t v51 = 136315138;
          uint64_t v73 = _typeName(_:qualified:)();
          sub_1000340A8(v73, v74, &v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          long long v54 = osloga;
          os_log_type_t v55 = v72;
          uint64_t v56 = a6;
          goto LABEL_45;
        }
      }
      else
      {
LABEL_39:
        uint64_t v75 = swift_unknownObjectWeakLoadStrong();
        if (!v75) {
          return;
        }
        long long v76 = (void *)v75;
        sub_100008C38(0, &qword_10005D238);
        id v77 = a1;
        id v78 = v76;
        char v79 = static NSObject.== infix(_:_:)();

        if ((v79 & 1) == 0) {
          return;
        }
        if (qword_10005C1B0 != -1) {
          swift_once();
        }
        uint64_t v80 = type metadata accessor for Logger();
        sub_100017894(v80, (uint64_t)qword_10005E7D0);
        os_log_t osloga = (os_log_t)Logger.logObject.getter();
        os_log_type_t v81 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(osloga, v81))
        {
          unint64_t v51 = (uint8_t *)swift_slowAlloc();
          uint64_t v87 = swift_slowAlloc();
          *(_DWORD *)unint64_t v51 = 136315138;
          uint64_t v82 = _typeName(_:qualified:)();
          sub_1000340A8(v82, v83, &v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          uint64_t v56 = a7;
          long long v54 = osloga;
          os_log_type_t v55 = v81;
          goto LABEL_45;
        }
      }
    }
  }
}

id sub_10001704C()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return [super init];
}

id sub_100017158()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for ActivitySceneDelegate()
{
  return self;
}

void sub_100017328(void *a1, double a2, double a3)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong && (uint64_t v7 = Strong, Strong, v7 == a1))
  {
    uint64_t v10 = swift_unknownObjectWeakLoadStrong();
    if (!v10) {
      return;
    }
    id v12 = (id)v10;
    id v11 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
    ActivitySceneMetrics.init(size:cornerRadius:)();
    dispatch thunk of ActivityScene.resolvedMetrics.setter();
  }
  else
  {
    uint64_t v8 = swift_unknownObjectWeakLoadStrong();
    if (!v8) {
      return;
    }
    id v12 = (id)v8;
    id v9 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
    ActivitySceneMetrics.init(size:cornerRadius:)();
    dispatch thunk of ActivityScene.resolvedMetrics.setter();
    if (qword_10005C1C0 != -1) {
      swift_once();
    }
    sub_10002A024(a2, a3);
  }
}

void sub_100017500(void *a1, unint64_t a2)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;

    if (v5 == a1)
    {
      uint64_t v22 = swift_unknownObjectWeakLoadStrong();
      if (!v22) {
        return;
      }
      id v38 = (id)v22;
      if (!(a2 >> 62))
      {
        uint64_t v23 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_19;
      }
LABEL_34:
      swift_bridgeObjectRetain();
      uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
LABEL_19:
      if (v23)
      {
        sub_100024A94(0, v23 & ~(v23 >> 63), 0);
        if (v23 < 0)
        {
          __break(1u);
          return;
        }
        uint64_t v24 = 0;
        do
        {
          if ((a2 & 0xC000000000000001) != 0) {
            id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v25 = *(id *)(a2 + 8 * v24 + 32);
          }
          uint64_t v26 = v25;
          [v25 CGRectValue];
          uint64_t v28 = v27;
          uint64_t v30 = v29;
          uint64_t v32 = v31;
          uint64_t v34 = v33;

          unint64_t v36 = *((void *)&_swiftEmptyArrayStorage + 2);
          unint64_t v35 = *((void *)&_swiftEmptyArrayStorage + 3);
          if (v36 >= v35 >> 1) {
            sub_100024A94(v35 > 1, v36 + 1, 1);
          }
          ++v24;
          *((void *)&_swiftEmptyArrayStorage + 2) = v36 + 1;
          long long v37 = (void *)((char *)&_swiftEmptyArrayStorage + 32 * v36);
          v37[4] = v28;
          v37[5] = v30;
          v37[6] = v32;
          v37[7] = v34;
        }
        while (v23 != v24);
      }
      goto LABEL_28;
    }
  }
  uint64_t v6 = swift_unknownObjectWeakLoadStrong();
  if (!v6) {
    return;
  }
  id v38 = (id)v6;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v7) {
    goto LABEL_28;
  }
  sub_100024A94(0, v7 & ~(v7 >> 63), 0);
  if (v7 < 0)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v8 = 0;
  do
  {
    if ((a2 & 0xC000000000000001) != 0) {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v9 = *(id *)(a2 + 8 * v8 + 32);
    }
    uint64_t v10 = v9;
    [v9 CGRectValue];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;

    unint64_t v20 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v20 >= v19 >> 1) {
      sub_100024A94(v19 > 1, v20 + 1, 1);
    }
    ++v8;
    *((void *)&_swiftEmptyArrayStorage + 2) = v20 + 1;
    os_log_type_t v21 = (void *)((char *)&_swiftEmptyArrayStorage + 32 * v20);
    v21[4] = v12;
    v21[5] = v14;
    v21[6] = v16;
    v21[7] = v18;
  }
  while (v7 != v8);
LABEL_28:
  dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.setter();
}

uint64_t sub_100017894(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1000178CC(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_1000075A0(&qword_10005D240);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v188 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MediaLiveActivityAttributes();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v201 = (char *)&v188 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v202 = (char *)&v188 - v10;
  __chkstk_darwin(v9);
  v204 = (char *)&v188 - v11;
  uint64_t v12 = sub_1000075A0(&qword_10005D248);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v188 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v188 - v16;
  uint64_t v18 = type metadata accessor for ActivityDescriptor();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  os_log_type_t v21 = (char *)&v188 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ActivityScene();
  uint64_t v22 = swift_dynamicCastClass();
  if (!v22) {
    goto LABEL_9;
  }
  uint64_t v23 = (void *)v22;
  uint64_t v197 = v6;
  uint64_t v199 = v5;
  v200 = v21;
  swift_getKeyPath();
  id v24 = a1;
  id v25 = v23;
  dispatch thunk of ActivityScene.subscript.getter();
  swift_release();
  if (!*((void *)&v210 + 1))
  {

LABEL_9:
    if (qword_10005C1B0 != -1) {
      swift_once();
    }
    uint64_t v38 = type metadata accessor for Logger();
    sub_100017894(v38, (uint64_t)qword_10005E7D0);
    unint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      id v41 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v210 = swift_slowAlloc();
      *(_DWORD *)id v41 = 136315138;
      uint64_t v42 = _typeName(_:qualified:)();
      *(void *)&long long v208 = sub_1000340A8(v42, v43, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "[%s] Did not receive activity scene with identifier.", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    goto LABEL_18;
  }
  unint64_t v198 = *((void *)&v210 + 1);
  uint64_t v26 = v210;
  swift_getKeyPath();
  id v194 = v25;
  dispatch thunk of ActivityScene.subscript.getter();
  swift_release();
  uint64_t v27 = (void *)v210;
  if (!(void)v210)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
LABEL_14:
    swift_bridgeObjectRelease();
    sub_10001563C((uint64_t)v17, &qword_10005D248);
    if (qword_10005C1B0 != -1) {
      swift_once();
    }
    uint64_t v44 = type metadata accessor for Logger();
    sub_100017894(v44, (uint64_t)qword_10005E7D0);
    unint64_t v39 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v39, v45))
    {

      return;
    }
    id v46 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v210 = swift_slowAlloc();
    *(_DWORD *)id v46 = 136315138;
    uint64_t v47 = _typeName(_:qualified:)();
    *(void *)&long long v208 = sub_1000340A8(v47, v48, (uint64_t *)&v210);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v39, v45, "[%s] Did not receive activity scene attributes.", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_18:
    return;
  }
  id v195 = v24;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v29 = v18;
  uint64_t v30 = 1;
  v28(v15, 1, 1, v29);
  sub_10001980C(&qword_10005D250, (void (*)(uint64_t))&type metadata accessor for ActivityDescriptor);
  dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();

  uint64_t v196 = v19;
  uint64_t v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  if (v31(v15, 1, v29) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v196 + 32))(v17, v15, v29);
    uint64_t v30 = 0;
  }
  v28(v17, v30, 1, v29);
  unsigned int v32 = v31(v17, 1, v29);
  id v24 = v195;
  if (v32 == 1) {
    goto LABEL_14;
  }
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v196 + 32);
  uint64_t v193 = v29;
  v33(v200, v17, v29);
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  uint64_t v34 = ActivityDescriptor.attributesData.getter();
  unint64_t v36 = v35;
  sub_10001980C((unint64_t *)&unk_10005D258, (void (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes);
  uint64_t v37 = v199;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  sub_1000197B4(v34, v36);
  swift_release();
  uint64_t v49 = v197;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v197 + 56))(v4, 0, 1, v37);
  os_log_type_t v50 = v204;
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v204, v4, v37);
  if (qword_10005C1B0 != -1) {
    swift_once();
  }
  uint64_t v51 = type metadata accessor for Logger();
  uint64_t v52 = sub_100017894(v51, (uint64_t)qword_10005E7D0);
  unint64_t v53 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  long long v54 = v202;
  uint64_t v190 = v49 + 16;
  v189 = v53;
  v53(v202, v50, v37);
  os_log_type_t v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.default.getter();
  BOOL v57 = os_log_type_enabled(v55, v56);
  id v192 = (id)v52;
  if (v57)
  {
    long long v58 = v54;
    uint64_t v59 = swift_slowAlloc();
    uint64_t v191 = swift_slowAlloc();
    *(void *)&long long v210 = v191;
    *(_DWORD *)uint64_t v59 = 136315394;
    uint64_t v60 = _typeName(_:qualified:)();
    *(void *)&long long v208 = sub_1000340A8(v60, v61, (uint64_t *)&v210);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2080;
    sub_10001980C(&qword_10005D268, (void (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes);
    uint64_t v62 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)&long long v208 = sub_1000340A8(v62, v63, (uint64_t *)&v210);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v202 = *(char **)(v49 + 8);
    ((void (*)(char *, uint64_t))v202)(v58, v199);
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "[%s] Media live activity attributes: %s", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v202 = *(char **)(v49 + 8);
    ((void (*)(char *, uint64_t))v202)(v54, v37);
  }

  uint64_t v191 = v26;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  MediaLiveActivityAttributes.subscript.getter();
  swift_bridgeObjectRelease();
  if (v209)
  {
    sub_10000A30C(&v208, &v210);
    swift_dynamicCast();
    NSString v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unint64_t v65 = v198;
    swift_bridgeObjectRetain_n();
    id v66 = v64;
    long long v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = swift_slowAlloc();
      *(void *)&long long v210 = swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 136315650;
      v188 = (char *)&type metadata for Any + 8;
      uint64_t v70 = _typeName(_:qualified:)();
      *(void *)&long long v208 = sub_1000340A8(v70, v71, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v69 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v208 = sub_1000340A8(v191, v65, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v69 + 22) = 2080;
      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)&long long v208 = sub_1000340A8(v72, v73, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "[%s] Configuring scene for identifier: %s, context: %s.", (uint8_t *)v69, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v74 = v193;
    id v75 = v194;
    uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v78 = v77;
    if (v76 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v78 == v79)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_33;
    }
    char v80 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v80)
    {
LABEL_33:
      if (SBUIIsSystemApertureEnabled()
        && objc_msgSend(v75, "SBUI_isHostedBySystemAperture"))
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectWeakAssign();
        id v81 = [objc_allocWithZone((Class)MRUActivityNowPlayingViewController) init];
        v206 = &OBJC_PROTOCOL___SBUISystemApertureElementProviding;
        uint64_t v82 = swift_dynamicCastObjCProtocolConditional();
        if (!v82)
        {

          uint64_t v82 = 0;
        }
        uint64_t v83 = v199;
        uint64_t v84 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider;
LABEL_38:
        long long v85 = v203;
        *(void *)&v203[v84] = v82;
        swift_unknownObjectRelease();
        [v194 setSystemApertureElementViewControllerProvider:*(void *)&v85[v84]];
LABEL_75:

LABEL_84:
        long long v110 = (void (*)(char *, uint64_t))v202;
LABEL_85:

        v110(v204, v83);
        (*(void (**)(char *, uint64_t))(v196 + 8))(v200, v74);
        return;
      }
      id v86 = [v75 session];
      id v87 = [v86 role];

      id v88 = (void *)static UISceneSessionRole.activityBanner.getter();
      uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v91 = v90;
      if (v89 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v91 == v92)
      {

        swift_bridgeObjectRelease_n();
LABEL_43:
        id v94 = v66;
        unint64_t v95 = v198;
        swift_bridgeObjectRetain();
        v201 = (char *)v94;
        long long v96 = Logger.logObject.getter();
        os_log_type_t v97 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v96, v97))
        {
          uint64_t v98 = swift_slowAlloc();
          uint64_t v99 = swift_slowAlloc();
          id v192 = v66;
          *(void *)&long long v210 = v99;
          *(_DWORD *)uint64_t v98 = 136315650;
          uint64_t v100 = _typeName(_:qualified:)();
          *(void *)&long long v208 = sub_1000340A8(v100, v101, (uint64_t *)&v210);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v98 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)&long long v208 = sub_1000340A8(v191, v95, (uint64_t *)&v210);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v98 + 22) = 2080;
          uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(void *)&long long v208 = sub_1000340A8(v102, v103, (uint64_t *)&v210);
          id v75 = v194;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          id v104 = v201;

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v96, v97, "[%s] Populating banner scene for %s, context: %s.", (uint8_t *)v98, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          id v109 = v201;
          swift_bridgeObjectRelease_n();
        }
        uint64_t v74 = v193;
        uint64_t v83 = v199;
        long long v110 = (void (*)(char *, uint64_t))v202;
        long long v111 = v203;
        swift_unknownObjectWeakAssign();
        id v112 = v75;
        id v113 = [objc_allocWithZone((Class)MRULockscreenViewController) init];
        [v113 setDelegate:v111];
        swift_unknownObjectWeakAssign();
        id v114 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v112];
        [v114 setRootViewController:v113];
        [v114 makeKeyAndVisible];
        long long v115 = *(void **)&v111[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow];
        *(void *)&v111[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow] = v114;

        id v24 = v115;
        goto LABEL_85;
      }
      char v93 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v93) {
        goto LABEL_43;
      }
      id v116 = [v75 session];
      id v117 = [v116 role];

      long long v118 = (void *)static UISceneSessionRole.activityListItem.getter();
      uint64_t v119 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v121 = v120;
      if (v119 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v121 == v122)
      {

        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v125 = _stringCompareWithSmolCheck(_:_:expecting:)();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v74 = v193;
        uint64_t v83 = v199;
        if ((v125 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_75;
        }
      }
      id v126 = v66;
      unint64_t v127 = v198;
      swift_bridgeObjectRetain();
      id v128 = v126;
      v129 = Logger.logObject.getter();
      os_log_type_t v130 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v129, v130))
      {
        uint64_t v131 = swift_slowAlloc();
        uint64_t v132 = swift_slowAlloc();
        id v192 = v66;
        *(void *)&long long v210 = v132;
        *(_DWORD *)uint64_t v131 = 136315650;
        uint64_t v133 = _typeName(_:qualified:)();
        *(void *)&long long v208 = sub_1000340A8(v133, v134, (uint64_t *)&v210);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v131 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&long long v208 = sub_1000340A8(v191, v127, (uint64_t *)&v210);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v131 + 22) = 2080;
        uint64_t v135 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)&long long v208 = sub_1000340A8(v135, v136, (uint64_t *)&v210);
        id v75 = v194;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v129, v130, "[%s] Populating cover sheet scene for %s, context: %s.", (uint8_t *)v131, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v141 = v203;
      swift_unknownObjectWeakAssign();
      id v142 = v75;
      id v143 = [objc_allocWithZone((Class)MRULockscreenViewController) init];
      [v143 setDelegate:v141];
      id v144 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v142];
      [v144 setRootViewController:v143];
      [v144 makeKeyAndVisible];
      v145 = *(void **)&v141[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow];
      *(void *)&v141[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow] = v144;
      id v146 = v144;

      id v147 = [v143 nowPlayingController];
      if (qword_10005C1C0 != -1) {
        swift_once();
      }
      uint64_t v148 = qword_10005E808;
      [v147 addSwiftObserver:qword_10005E808];
      id v149 = [v147 metadataController];
      id v150 = [v149 artwork];

      uint64_t v151 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
      v152 = *(void **)(v148 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
      *(void *)(v148 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = v150;
      id v153 = v150;

      sub_10002B210();
      v154 = *(void **)(v148 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
      if (v154)
      {
        id v155 = *(id *)(v148 + v151);
        id v156 = v154;
        id v157 = [v156 artworkView];
        [v157 setArtwork:v155];

        id v153 = v155;
      }

      v158 = *(void **)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
      *(void *)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) = v143;
      id v24 = v143;

      sub_100028F88();
      uint64_t v74 = v193;
LABEL_83:
      uint64_t v83 = v199;
      goto LABEL_84;
    }
    swift_bridgeObjectRelease();
    uint64_t v105 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v107 = v106;
    if (v105 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v107 == v108)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v83 = v199;
      goto LABEL_54;
    }
    char v123 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v83 = v199;
    if (v123)
    {
LABEL_54:
      if (!SBUIIsSystemApertureEnabled()
        || (objc_msgSend(v194, "SBUI_isHostedBySystemAperture") & 1) == 0)
      {
        goto LABEL_75;
      }
      swift_unknownObjectWeakAssign();
      id v124 = [objc_allocWithZone((Class)MRUActivityMirroringViewController) init];
      v207 = &OBJC_PROTOCOL___SBUISystemApertureElementProviding;
      uint64_t v82 = swift_dynamicCastObjCProtocolConditional();
      if (!v82)
      {

        uint64_t v82 = 0;
      }
      uint64_t v84 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider;
      goto LABEL_38;
    }
    uint64_t v137 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v139 = v138;
    if (v137 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v139 == v140)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v159 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v159 & 1) == 0) {
        goto LABEL_75;
      }
    }
    v160 = v203;
    swift_unknownObjectWeakAssign();
    id v161 = [self mainScreen];
    [v161 bounds];
    CGFloat v163 = v162;
    CGFloat v165 = v164;
    CGFloat v167 = v166;
    CGFloat v169 = v168;

    v212.origin.x = v163;
    v212.origin.y = v165;
    v212.size.width = v167;
    v212.size.height = v169;
    CGRectGetWidth(v212);
    id v170 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
    ActivitySceneMetrics.init(size:cornerRadius:)();
    dispatch thunk of ActivityScene.resolvedMetrics.setter();
    v171 = v201;
    v189(v201, v204, v83);
    v172 = v160;
    v173 = Logger.logObject.getter();
    os_log_type_t v174 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v173, v174))
    {
      uint64_t v175 = swift_slowAlloc();
      uint64_t v176 = swift_slowAlloc();
      id v192 = v66;
      *(void *)&long long v210 = v176;
      *(_DWORD *)uint64_t v175 = 136315650;
      uint64_t v177 = _typeName(_:qualified:)();
      *(void *)&long long v208 = sub_1000340A8(v177, v178, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v175 + 12) = 2080;
      sub_10001980C(&qword_10005D268, (void (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes);
      uint64_t v179 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)&long long v208 = sub_1000340A8(v179, v180, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v202)(v171, v83);
      *(_WORD *)(v175 + 22) = 2080;
      id v24 = v195;
      *(void *)&long long v208 = v172;
      uint64_t v181 = _Pointer.debugDescription.getter();
      *(void *)&long long v208 = sub_1000340A8(v181, v182, (uint64_t *)&v210);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v173, v174, "[%s] >>+ attrs are %s (%s", (uint8_t *)v175, 0x20u);
      swift_arrayDestroy();
      id v66 = v192;
      swift_slowDealloc();
      uint64_t v74 = v193;
      swift_slowDealloc();
    }
    else
    {
      ((void (*)(char *, uint64_t))v202)(v171, v83);
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    MediaLiveActivityAttributes.subscript.getter();
    swift_bridgeObjectRelease();
    if (v211)
    {
      if (swift_dynamicCast())
      {
        NSString v183 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
LABEL_82:
        id v184 = [objc_allocWithZone((Class)MRURouteRecommendationPlatterViewController) initWithRouteIdentifier:v183];

        id v185 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
        id v186 = [v185 initWithWindowScene:v194];
        [v186 setRootViewController:v184];
        [v186 makeKeyAndVisible];
        v187 = *(void **)&v172[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow];
        *(void *)&v172[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow] = v186;

        id v24 = v187;
        goto LABEL_83;
      }
    }
    else
    {
      sub_10001563C((uint64_t)&v210, &qword_10005CA00);
    }
    NSString v183 = 0;
    goto LABEL_82;
  }
  __break(1u);
}

uint64_t sub_10001976C()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t sub_100019790()
{
  return SceneSettingScopes.ActivitySettings.activityDescriptor.getter();
}

uint64_t sub_1000197B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10001980C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100019854()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon);
  }
  else
  {
    uint64_t v4 = v0;
    self;
    char v5 = [(id)swift_dynamicCastObjCClassUnconditional() routeType];
    id v6 = objc_allocWithZone((Class)type metadata accessor for RouteIconView());
    id v7 = sub_10002DDB8(v5);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_10001992C()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem);
  }
  else
  {
    uint64_t v4 = v0;
    self;
    swift_dynamicCastObjCClassUnconditional();
    swift_unknownObjectRetain();
    sub_1000101BC();
    swift_unknownObjectRelease();
    id v5 = objc_allocWithZone((Class)PLPillContentItem);
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v7 = [v5 initWithText:v6];

    uint64_t v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_100019A2C()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView);
  }
  else
  {
    id v4 = sub_100019A90(v0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100019A90(uint64_t a1)
{
  id v2 = sub_100019854();
  id v3 = [objc_allocWithZone((Class)PLPillView) initWithLeadingAccessoryView:v2 trailingAccessoryView:*(void *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon)];

  LODWORD(v4) = 1144750080;
  [v3 setContentHuggingPriority:1 forAxis:v4];
  LODWORD(v5) = 1144750080;
  [v3 setContentHuggingPriority:0 forAxis:v5];
  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100037F40;
  *(void *)(v6 + 32) = sub_10001992C();
  self;
  swift_dynamicCastObjCClassUnconditional();
  swift_unknownObjectRetain();
  sub_10001043C();
  swift_unknownObjectRelease();
  id v7 = objc_allocWithZone((Class)PLPillContentItem);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithText:v8 style:2];

  *(void *)(v6 + 40) = v9;
  specialized Array._endMutation()();
  id v10 = sub_10001992C();
  [v3 setReferenceContentItemForIntrinsicContentSize:v10];

  sub_10001A108();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 setCenterContentItems:isa animated:0];

  return v3;
}

id sub_100019C90(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon] = 0;
  uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon;
  id v7 = v3;
  *(void *)&v3[v6] = sub_100007BA4();
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem] = 0;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView] = 0;
  swift_unknownObjectWeakInit();

  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate + 8] = 0;
  uint64_t v8 = swift_unknownObjectWeakInit();
  id v9 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(void *)id v9 = 0xD000000000000017;
  *((void *)v9 + 1) = 0x800000010003D9A0;
  v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  id v10 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(void *)id v10 = 0;
  v10[8] = 1;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(void *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a1;
  *(void *)(v8 + 8) = a3;
  swift_unknownObjectWeakAssign();
  v20.receiver = v7;
  v20.super_class = (Class)type metadata accessor for BannerBaseViewController();
  id v11 = a1;
  id v12 = [super initWithNibName:0 bundle:0];
  id v13 = sub_100019A2C();
  id v14 = sub_10001992C();
  [v13 sizeThatFitsContentItem:v14];
  double v16 = v15;
  double v18 = v17;

  [v12 setPreferredContentSize:v16, v18];
  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_100019FC4()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem));

  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext;

  return sub_100008C10(v1);
}

id sub_10001A034()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionBannerViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for GroupSessionBannerViewController()
{
  return self;
}

unint64_t sub_10001A108()
{
  unint64_t result = qword_10005D328;
  if (!qword_10005D328)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005D328);
  }
  return result;
}

void sub_10001A148()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon] = 0;
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon;
  *(void *)&v0[v1] = sub_100007BA4();
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView] = 0;
  swift_unknownObjectWeakInit();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id sub_10001A300()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryImageView();
  return [super dealloc];
}

uint64_t type metadata accessor for AccessoryImageView()
{
  return self;
}

uint64_t destroy for SuggestedRoute(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  id v7 = *(void **)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  double v18 = *(void **)(a2 + 96);
  uint64_t v19 = *(void **)(a2 + 104);
  *(void *)(a1 + 96) = v18;
  *(void *)(a1 + 104) = v19;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  uint64_t v10 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v10;
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  uint64_t v12 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v12;
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  uint64_t v13 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v13;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v14 = v7;
  swift_bridgeObjectRetain();
  id v15 = v18;
  id v16 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 72);
  uint64_t v5 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v5;
  id v6 = v5;

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a2 + 96);
  uint64_t v8 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a1 + 104);
  uint64_t v11 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v11;
  id v12 = v11;

  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  __n128 result = *(__n128 *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 192);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  long long v6 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  long long v7 = *(void **)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);

  long long v8 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);

  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestedRoute(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 216)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SuggestedRoute(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 216) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 216) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SuggestedRoute()
{
  return &type metadata for SuggestedRoute;
}

uint64_t sub_10001A968(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 176);
  v15[10] = *(_OWORD *)(a1 + 160);
  v15[11] = v2;
  v15[12] = *(_OWORD *)(a1 + 192);
  uint64_t v16 = *(void *)(a1 + 208);
  long long v3 = *(_OWORD *)(a1 + 112);
  void v15[6] = *(_OWORD *)(a1 + 96);
  v15[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 144);
  v15[8] = *(_OWORD *)(a1 + 128);
  v15[9] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v15[4] = *(_OWORD *)(a1 + 64);
  v15[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v7;
  long long v8 = *(_OWORD *)(a2 + 176);
  v17[10] = *(_OWORD *)(a2 + 160);
  v17[11] = v8;
  v17[12] = *(_OWORD *)(a2 + 192);
  uint64_t v18 = *(void *)(a2 + 208);
  long long v9 = *(_OWORD *)(a2 + 112);
  v17[6] = *(_OWORD *)(a2 + 96);
  v17[7] = v9;
  long long v10 = *(_OWORD *)(a2 + 144);
  v17[8] = *(_OWORD *)(a2 + 128);
  v17[9] = v10;
  long long v11 = *(_OWORD *)(a2 + 48);
  v17[2] = *(_OWORD *)(a2 + 32);
  v17[3] = v11;
  long long v12 = *(_OWORD *)(a2 + 80);
  v17[4] = *(_OWORD *)(a2 + 64);
  v17[5] = v12;
  long long v13 = *(_OWORD *)(a2 + 16);
  v17[0] = *(_OWORD *)a2;
  v17[1] = v13;
  return sub_10001B090((uint64_t)v15, (uint64_t)v17) & 1;
}

uint64_t sub_10001AA1C()
{
  uint64_t v1 = 0x3E656E6F6E3CLL;
  _StringGuts.grow(_:)(460);
  v2._countAndFlagsBits = 0xD00000000000002FLL;
  v2._object = (void *)0x800000010003EC30;
  String.append(_:)(v2);
  uint64_t v3 = *(void *)v0;
  long long v4 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x800000010003EC60;
  v6._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v6);
  uint64_t v7 = *(void *)(v0 + 16);
  long long v8 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._object = (void *)0x800000010003EC90;
  v10._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v10);
  uint64_t v11 = *(void *)(v0 + 32);
  long long v12 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._object = (void *)0x800000010003ECC0;
  v14._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v14);
  if (*(void *)(v0 + 48))
  {
    swift_bridgeObjectRetain();
    sub_1000075A0(&qword_10005D358);
    sub_10001AF6C();
    uint64_t v15 = BidirectionalCollection<>.joined(separator:)();
    double v17 = v16;
    swift_bridgeObjectRelease();
  }
  else
  {
    double v17 = (void *)0xE600000000000000;
    uint64_t v15 = 0x3E656E6F6E3CLL;
  }
  v18._countAndFlagsBits = v15;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._object = (void *)0x800000010003ECF0;
  v19._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v19);
  if (*(void *)(v0 + 64))
  {
    uint64_t v20 = *(void *)(v0 + 56);
    os_log_type_t v21 = *(void **)(v0 + 64);
  }
  else
  {
    os_log_type_t v21 = (void *)0xE600000000000000;
    uint64_t v20 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain();
  v22._countAndFlagsBits = v20;
  v22._object = v21;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  v23._object = (void *)0x800000010003ED20;
  v23._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v23);
  if (*(unsigned char *)(v0 + 112)) {
    uint64_t v24 = 1702195828;
  }
  else {
    uint64_t v24 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 112)) {
    unint64_t v25 = 0xE400000000000000;
  }
  else {
    unint64_t v25 = 0xE500000000000000;
  }
  unint64_t v26 = v25;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease();
  v27._object = (void *)0x800000010003ED50;
  v27._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v27);
  if (*(void *)(v0 + 128))
  {
    uint64_t v28 = *(void *)(v0 + 120);
    uint64_t v29 = *(void **)(v0 + 128);
  }
  else
  {
    uint64_t v29 = (void *)0xE600000000000000;
    uint64_t v28 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain();
  v30._countAndFlagsBits = v28;
  v30._object = v29;
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  v31._object = (void *)0x800000010003ED80;
  v31._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v31);
  if (*(void *)(v0 + 144))
  {
    uint64_t v32 = *(void *)(v0 + 136);
    uint64_t v33 = *(void **)(v0 + 144);
  }
  else
  {
    uint64_t v33 = (void *)0xE600000000000000;
    uint64_t v32 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain();
  v34._countAndFlagsBits = v32;
  v34._object = v33;
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  v35._object = (void *)0x800000010003EDB0;
  v35._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v35);
  if (*(void *)(v0 + 160))
  {
    uint64_t v36 = *(void *)(v0 + 152);
    uint64_t v37 = *(void **)(v0 + 160);
  }
  else
  {
    uint64_t v37 = (void *)0xE600000000000000;
    uint64_t v36 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain();
  v38._countAndFlagsBits = v36;
  v38._object = v37;
  String.append(_:)(v38);
  swift_bridgeObjectRelease();
  v39._object = (void *)0x800000010003EDE0;
  v39._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v39);
  if (*(void *)(v0 + 176))
  {
    uint64_t v40 = *(void *)(v0 + 168);
    id v41 = *(void **)(v0 + 176);
  }
  else
  {
    id v41 = (void *)0xE600000000000000;
    uint64_t v40 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain();
  v42._countAndFlagsBits = v40;
  v42._object = v41;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  v43._object = (void *)0x800000010003EE10;
  v43._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v43);
  if (*(unsigned char *)(v0 + 184)) {
    uint64_t v44 = 1702195828;
  }
  else {
    uint64_t v44 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 184)) {
    unint64_t v45 = 0xE400000000000000;
  }
  else {
    unint64_t v45 = 0xE500000000000000;
  }
  unint64_t v46 = v45;
  String.append(_:)(*(Swift::String *)&v44);
  swift_bridgeObjectRelease();
  v47._object = (void *)0x800000010003EE40;
  v47._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v47);
  uint64_t v48 = *(void *)(v0 + 192);
  uint64_t v49 = *(void **)(v0 + 200);
  swift_bridgeObjectRetain();
  v50._countAndFlagsBits = v48;
  v50._object = v49;
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  v51._object = (void *)0x800000010003EE70;
  v51._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v51);
  if (*(void *)(v0 + 208))
  {
    swift_bridgeObjectRetain();
    sub_1000075A0(&qword_10005D358);
    sub_10001AF6C();
    uint64_t v1 = BidirectionalCollection<>.joined(separator:)();
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v53 = (void *)0xE600000000000000;
  }
  v54._countAndFlagsBits = v1;
  v54._object = v53;
  String.append(_:)(v54);
  swift_bridgeObjectRelease();
  v55._countAndFlagsBits = 8194619;
  v55._object = (void *)0xE300000000000000;
  String.append(_:)(v55);
  return 0;
}

unint64_t sub_10001AF6C()
{
  unint64_t result = qword_10005D360;
  if (!qword_10005D360)
  {
    sub_10000EA98(&qword_10005D358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D360);
  }
  return result;
}

uint64_t sub_10001AFC8(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    Swift::String v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_10001B090(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v8 & 1) != 0))
    {
      if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)
        || (char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v9 & 1) != 0))
      {
        Swift::String v10 = *(void **)(a1 + 48);
        BOOL v11 = *(void **)(a2 + 48);
        if (v10)
        {
          if (!v11 || (sub_10001AFC8(v10, v11) & 1) == 0) {
            return 0;
          }
        }
        else if (v11)
        {
          return 0;
        }
        uint64_t v12 = *(void *)(a1 + 64);
        uint64_t v13 = *(void *)(a2 + 64);
        if (v12)
        {
          if (!v13) {
            return 0;
          }
          if (*(void *)(a1 + 56) != *(void *)(a2 + 56) || v12 != v13)
          {
            char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
            uint64_t result = 0;
            if ((v14 & 1) == 0) {
              return result;
            }
          }
        }
        else if (v13)
        {
          return 0;
        }
        uint64_t v15 = *(void **)(a1 + 72);
        uint64_t v16 = *(void **)(a2 + 72);
        if (v15)
        {
          if (!v16) {
            return 0;
          }
          sub_100008C38(0, &qword_10005D378);
          id v17 = v16;
          id v18 = v15;
          char v19 = static NSObject.== infix(_:_:)();

          if ((v19 & 1) == 0) {
            return 0;
          }
        }
        else if (v16)
        {
          return 0;
        }
        if (*(void *)(a1 + 80) != *(void *)(a2 + 80) || *(void *)(a1 + 88) != *(void *)(a2 + 88))
        {
          char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t result = 0;
          if ((v20 & 1) == 0) {
            return result;
          }
        }
        sub_100008C38(0, &qword_10005D368);
        if (static NSObject.== infix(_:_:)())
        {
          os_log_type_t v21 = *(void **)(a1 + 104);
          Swift::String v22 = *(void **)(a2 + 104);
          if (v21)
          {
            if (!v22) {
              return 0;
            }
            sub_100008C38(0, &qword_10005D370);
            id v23 = v22;
            id v24 = v21;
            char v25 = static NSObject.== infix(_:_:)();

            if ((v25 & 1) == 0) {
              return 0;
            }
          }
          else if (v22)
          {
            return 0;
          }
          if (((*(unsigned __int8 *)(a1 + 112) ^ *(unsigned __int8 *)(a2 + 112)) & 1) == 0)
          {
            uint64_t v26 = *(void *)(a1 + 128);
            uint64_t v27 = *(void *)(a2 + 128);
            if (v26)
            {
              if (!v27) {
                return 0;
              }
              if (*(void *)(a1 + 120) != *(void *)(a2 + 120) || v26 != v27)
              {
                char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
                uint64_t result = 0;
                if ((v28 & 1) == 0) {
                  return result;
                }
              }
            }
            else if (v27)
            {
              return 0;
            }
            uint64_t v29 = *(void *)(a1 + 144);
            uint64_t v30 = *(void *)(a2 + 144);
            if (v29)
            {
              if (!v30) {
                return 0;
              }
              if (*(void *)(a1 + 136) != *(void *)(a2 + 136) || v29 != v30)
              {
                char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
                uint64_t result = 0;
                if ((v31 & 1) == 0) {
                  return result;
                }
              }
            }
            else if (v30)
            {
              return 0;
            }
            uint64_t v32 = *(void *)(a1 + 160);
            uint64_t v33 = *(void *)(a2 + 160);
            if (v32)
            {
              if (!v33) {
                return 0;
              }
              if (*(void *)(a1 + 152) != *(void *)(a2 + 152) || v32 != v33)
              {
                char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
                uint64_t result = 0;
                if ((v34 & 1) == 0) {
                  return result;
                }
              }
            }
            else if (v33)
            {
              return 0;
            }
            uint64_t v35 = *(void *)(a1 + 176);
            uint64_t v36 = *(void *)(a2 + 176);
            if (v35)
            {
              if (!v36) {
                return 0;
              }
              if (*(void *)(a1 + 168) != *(void *)(a2 + 168) || v35 != v36)
              {
                char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
                uint64_t result = 0;
                if ((v37 & 1) == 0) {
                  return result;
                }
              }
            }
            else if (v36)
            {
              return 0;
            }
            if (((*(unsigned __int8 *)(a1 + 184) ^ *(unsigned __int8 *)(a2 + 184)) & 1) == 0)
            {
              if (*(void *)(a1 + 192) != *(void *)(a2 + 192) || *(void *)(a1 + 200) != *(void *)(a2 + 200))
              {
                char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
                uint64_t result = 0;
                if ((v38 & 1) == 0) {
                  return result;
                }
              }
              Swift::String v39 = *(void **)(a1 + 208);
              uint64_t v40 = *(void **)(a2 + 208);
              if (v39)
              {
                if (!v40 || (sub_10001AFC8(v39, v40) & 1) == 0) {
                  return 0;
                }
              }
              else if (v40)
              {
                return 0;
              }
              return 1;
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

void sub_10001B4CC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_10001B64C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  char v9 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, v8))
  {
    swift_bridgeObjectRetain_n();
    Swift::String v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)Swift::String v10 = 136315138;
    swift_bridgeObjectRetain();
    sub_1000340A8(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "[MainServer] revokeBanner %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  return sub_10002F478(a1, a2, 0x757165722044524DLL, 0xEB00000000747365, a3, a4);
}

id sub_10001B8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = [*(id *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI6Client_connection) remoteTarget];
  if (result)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10000A30C(&v15, &v16);
    sub_1000075A0(&qword_10005D5D8);
    swift_dynamicCast();
    NSString v8 = String._bridgeToObjectiveC()();
    Class isa = UInt._bridgeToObjectiveC()().super.super.isa;
    [v14 bannerWithIdentifier:v8 postedEvent:isa];

    if (a3 == 2)
    {
      uint64_t v10 = a1;
      uint64_t v11 = a2;
      uint64_t v12 = 0x65727020676E6F6CLL;
      uint64_t v13 = 0xEC00000064657373;
    }
    else
    {
      if (a3 != 1) {
        return (id)swift_unknownObjectRelease();
      }
      uint64_t v10 = a1;
      uint64_t v11 = a2;
      uint64_t v12 = 0x646570706174;
      uint64_t v13 = 0xE600000000000000;
    }
    sub_10002F478(v10, v11, v12, v13, 0, 0);
    return (id)swift_unknownObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_10001BACC()
{
  return sub_10001D158(0, type metadata accessor for Client);
}

uint64_t sub_10001BB78()
{
  return type metadata accessor for Client();
}

uint64_t type metadata accessor for Client()
{
  uint64_t result = qword_10005D410;
  if (!qword_10005D410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001BBCC()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001BC70()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self interfaceWithIdentifier:v0];

  uint64_t v2 = self;
  id v3 = [v2 protocolForProtocol:&OBJC_PROTOCOL___MRUIServerProtocol];
  [v1 setServer:v3];

  id v4 = [v2 protocolForProtocol:&OBJC_PROTOCOL___MRUIClientProtocol];
  [v1 setClient:v4];

  [v1 setClientMessagingExpectation:0];
  [v1 copy];
  _bridgeAnyObjectToAny(_:)();

  swift_unknownObjectRelease();
  sub_100008C38(0, &qword_10005D5D0);
  swift_dynamicCast();
  return v6;
}

id sub_10001BDE4()
{
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs] = &off_1000495B8;
  uint64_t v11 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue;
  uint64_t v10 = sub_100008C38(0, (unint64_t *)&qword_10005D5B0);
  uint64_t v6 = v0;
  static DispatchQoS.userInitiated.getter();
  char v14 = _swiftEmptyArrayStorage;
  sub_10001E5FC((unint64_t *)&unk_10005DB70, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000075A0((uint64_t *)&unk_10005D5C0);
  sub_10001E644((unint64_t *)&unk_10005DB80, (uint64_t *)&unk_10005D5C0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v12);
  *(void *)&v0[v11] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v6[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener] = 0;
  *(void *)&v6[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients] = &_swiftEmptySetSingleton;
  uint64_t v7 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface;
  *(void *)&v6[v7] = sub_10001BC70();

  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  NSString v8 = (objc_class *)type metadata accessor for ClientConnectionManager();
  v13.receiver = v6;
  v13.super_class = v8;
  return [super init];
}

id sub_10001C138()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = sub_10001D994;
  *(void *)(v1 + 24) = &v8;
  aBlock[4] = sub_10001E704;
  aBlock[5] = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C364;
  aBlock[3] = &unk_100049DD0;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = self;
  swift_retain();
  id v4 = [v3 listenerWithConfigurator:v2];
  _Block_release(v2);
  swift_release();
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  id result = (id)swift_release();
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener;
    uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener);
    *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener) = v4;

    id result = *(id *)(v0 + v6);
    if (result) {
      return [result activate];
    }
  }
  __break(1u);
  return result;
}

id sub_10001C2A4(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 setDomain:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

uint64_t sub_10001C368(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_10001C430(void *a1, uint64_t a2, uint64_t a3)
{
  [a1 setTargetQueue:*(void *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue)];
  id v6 = [self userInitiated];
  [a1 setServiceQuality:v6];

  [a1 setInterface:*(void *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface)];
  [a1 setInterfaceTarget:a3];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  *(void *)(v9 + 24) = v8;
  void v11[4] = sub_10001E5A8;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  void v11[2] = sub_100010F90;
  v11[3] = &unk_100049F38;
  uint64_t v10 = _Block_copy(v11);
  swift_release();
  [a1 setInvalidationHandler:v10];
  _Block_release(v10);
}

uint64_t sub_10001C5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  id v13 = *(id *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue];

  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a2;
  aBlock[4] = sub_10001E5F4;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000128F8;
  aBlock[3] = &unk_100049F88;
  long long v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v17[1] = _swiftEmptyArrayStorage;
  sub_10001E5FC((unint64_t *)&qword_10005DD70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10001E644((unint64_t *)&qword_10005DD80, (uint64_t *)&unk_10005D540);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void))(v9 + 8))(v11, v17[0]);
  return swift_release();
}

void sub_10001C8AC()
{
  os_log_type_t v0 = static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, v0))
  {
    swift_retain_n();
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136446210;
    uint64_t Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    id v4 = [Strong description];
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;

    sub_1000340A8(v5, v7, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v0, "[ClientConnectionManager] client %{public}s invalidated", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v8 = (void *)swift_unknownObjectUnownedLoadStrong();
  uint64_t v9 = (void *)swift_unknownObjectUnownedLoadStrong();
  sub_10001CE68(v9);
}

uint64_t sub_10001CAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

void sub_10001CB8C(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchPredicate();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue);
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  id v8 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    LOBYTE(v6) = static os_log_type_t.default.getter();
    if (qword_10005C1A0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v9 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, (os_log_type_t)v6))
  {
    id v10 = a1;
    uint64_t v20 = v1;
    id v11 = v10;
    BOOL v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    os_log_type_t v21 = a1;
    v22[0] = v13;
    *(_DWORD *)BOOL v12 = 136446210;
    id v14 = v11;
    id v15 = [v14 description];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;

    uint64_t v23 = sub_1000340A8(v16, v18, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, (os_log_type_t)v6, "[ClientConnectionManager] adding client %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    a1 = v21;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  swift_beginAccess();
  sub_100024DA0(&v23, a1);
  char v19 = (void *)v23;
  swift_endAccess();
}

void sub_10001CE68(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchPredicate();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue);
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  id v8 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    LOBYTE(v6) = static os_log_type_t.default.getter();
    if (qword_10005C1A0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v9 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, (os_log_type_t)v6))
  {
    id v10 = a1;
    uint64_t v20 = v1;
    id v11 = v10;
    BOOL v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    os_log_type_t v21 = a1;
    v23[0] = v13;
    *(_DWORD *)BOOL v12 = 136446210;
    id v14 = v11;
    id v15 = [v14 description];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;

    uint64_t v22 = sub_1000340A8(v16, v18, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, (os_log_type_t)v6, "[ClientConnectionManager] removing client %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    a1 = v21;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  swift_beginAccess();
  char v19 = (void *)sub_10001D49C(a1);
  swift_endAccess();
}

id sub_10001D140(uint64_t a1)
{
  return sub_10001D158(a1, type metadata accessor for ClientConnectionManager);
}

id sub_10001D158(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  [super dealloc];
}

uint64_t type metadata accessor for ClientConnectionManager()
{
  return self;
}

Swift::Int sub_10001D230(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000075A0(&qword_10005D4D0);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      type metadata accessor for Client();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1000251D0();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

unint64_t sub_10001D418(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t sub_10001D49C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = __CocoaSet.contains(_:)();

    if (v6)
    {
      uint64_t v7 = sub_10001D664();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = NSObject._rawHashValue(seed:)(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  type metadata accessor for Client();
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = static NSObject.== infix(_:_:)();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = static NSObject.== infix(_:_:)();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100025A64();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_10001D7F0(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10001D664()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = __CocoaSet.count.getter();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_10001D230(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = NSObject._rawHashValue(seed:)(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    type metadata accessor for Client();
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = static NSObject.== infix(_:_:)();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_10001D7F0(v8);
      if (static NSObject.== infix(_:_:)())
      {
        *uint64_t v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = static NSObject.== infix(_:_:)();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_10001D7F0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

id sub_10001D994(void *a1)
{
  return sub_10001C2A4(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001D99C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001D9AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001D9BC()
{
  return swift_release();
}

void sub_10001D9C4(void *a1, uint64_t a2, void *aBlock)
{
  _Block_copy(aBlock);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, v6))
  {
    id v8 = a1;
    uint64_t v16 = a2;
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 136315138;
    id v10 = [v8 requestIdentifier];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    a2 = v16;
    sub_1000340A8(v14, v13, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v6, "[Client] postBanner %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v15 = *(void *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController);
  _Block_copy(aBlock);
  sub_100030BB0(a1, v15, aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

void sub_10001DBC0(uint64_t isEscapingClosureAtFileLocation)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  os_log_type_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v49 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [(id)isEscapingClosureAtFileLocation remoteProcess];
  id v11 = [v10 auditToken];

  if (!v11)
  {
    static os_log_type_t.default.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    os_log(_:dso:log:_:_:)();
    goto LABEL_8;
  }
  uint64_t v46 = v7;
  uint64_t v47 = v4;
  uint64_t v48 = v3;
  [v11 realToken];
  long long v50 = v53;
  long long v51 = aBlock;

  long long aBlock = v51;
  long long v53 = v50;
  id v12 = (id)MSVBundleIDForAuditToken();
  if (v12)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    uint64_t v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs];
    swift_bridgeObjectRetain();
    uint64_t v17 = (uint64_t)v15;
    id v12 = v15;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v17 = 0xE000000000000000;
    uint64_t v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs];
  }
  swift_bridgeObjectRetain();
  char v18 = sub_10001C368(v13, v17, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    os_log_type_t v41 = static os_log_type_t.default.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    Swift::String v42 = qword_10005E7C0;
    os_log_type_t v43 = v41;
    if (os_log_type_enabled((os_log_t)qword_10005E7C0, v41))
    {
      swift_bridgeObjectRetain();
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      if (v12)
      {
        unint64_t v45 = (unint64_t)v12;
      }
      else
      {
        uint64_t v13 = 7104878;
        unint64_t v45 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      BOOL v57 = (void *)sub_1000340A8(v13, v45, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "[ClientConnectionManager] rejecting connection from unauthorized process %s", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  id v19 = [(id)isEscapingClosureAtFileLocation remoteProcess];
  NSString v20 = String._bridgeToObjectiveC()();
  unsigned __int8 v21 = [v19 hasEntitlement:v20];

  static os_log_type_t.default.getter();
  if ((v21 & 1) == 0)
  {
    if (qword_10005C1A0 == -1)
    {
LABEL_24:
      os_log(_:dso:log:_:_:)();
LABEL_8:
      [(id)isEscapingClosureAtFileLocation invalidate];
      return;
    }
LABEL_27:
    swift_once();
    goto LABEL_24;
  }
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t v22 = (objc_class *)type metadata accessor for Client();
  id v23 = objc_allocWithZone(v22);
  id v24 = (id)isEscapingClosureAtFileLocation;
  char v25 = (char *)v23;
  UUID.init()();
  *(void *)&v25[OBJC_IVAR____TtC13MediaRemoteUI6Client_connection] = v24;
  id v26 = objc_allocWithZone((Class)type metadata accessor for BannerController());
  id v27 = v24;
  *(void *)&long long v51 = v27;
  id v28 = [v26 init];
  *(void *)&v25[OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController] = v28;

  v56.receiver = v25;
  v56.super_class = v22;
  uint64_t v29 = (char *)[super init];
  *(void *)(*(void *)&v29[OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController]
            + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate
            + 8) = &off_100049D98;
  swift_unknownObjectWeakAssign();

  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v1;
  *(void *)(v30 + 24) = v29;
  Swift::String v54 = sub_10001E504;
  uint64_t v55 = v30;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v53 = sub_1000128F8;
  *((void *)&v53 + 1) = &unk_100049E20;
  char v31 = _Block_copy(&aBlock);
  uint64_t v32 = v1;
  uint64_t v33 = v29;
  static DispatchQoS.unspecified.getter();
  BOOL v57 = _swiftEmptyArrayStorage;
  sub_10001E5FC((unint64_t *)&qword_10005DD70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10001E644((unint64_t *)&qword_10005DD80, (uint64_t *)&unk_10005D540);
  uint64_t v34 = v48;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v31);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v6, v34);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v46);
  swift_release();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v32;
  *(void *)(v35 + 24) = v33;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = sub_10001E52C;
  *(void *)(v36 + 24) = v35;
  Swift::String v54 = sub_10001E544;
  uint64_t v55 = v36;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v53 = sub_10001C364;
  *((void *)&v53 + 1) = &unk_100049E98;
  char v37 = _Block_copy(&aBlock);
  char v38 = v32;
  Swift::String v39 = v33;
  swift_retain();
  uint64_t v40 = (void *)v51;
  swift_release();
  [v40 configureConnection:v37];
  _Block_release(v37);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
    goto LABEL_27;
  }
  [v40 activate];
  swift_release();
}

uint64_t sub_10001E4C4()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001E504()
{
  sub_10001CB8C(*(void **)(v0 + 24));
}

void sub_10001E52C(void *a1)
{
  sub_10001C430(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001E534()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E544()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001E56C()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001E5A8(uint64_t a1)
{
  return sub_10001C5D4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001E5B4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001E5F4()
{
}

uint64_t sub_10001E5FC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001E644(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000EA98(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001E694()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001E6CC(uint64_t a1)
{
  sub_10001B4CC(a1, *(void *)(v1 + 16));
}

id sub_10001E880()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

uint64_t sub_10001E8D8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000203A8(v0, qword_10005D670);
  sub_100017894(v0, (uint64_t)qword_10005D670);
  if (qword_10005C1A8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10005E7C8;
  return Logger.init(_:)();
}

char *sub_10001E964(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  os_log_type_t v6 = v5;
  id v55 = a5;
  id v56 = a2;
  long long v67 = a3;
  uint64_t v66 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v63 = v10;
  unint64_t v65 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
  uint64_t v57 = *(void *)(v11 - 8);
  uint64_t v58 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000075A0((uint64_t *)&unk_10005D730);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v51 = v14;
  uint64_t v52 = v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000075A0((uint64_t *)&unk_10005CDB0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v53 = v18;
  uint64_t v54 = v19;
  __chkstk_darwin(v18);
  unsigned __int8 v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000075A0(&qword_10005D740);
  uint64_t v59 = *(void *)(v22 - 8);
  uint64_t v60 = v22;
  __chkstk_darwin(v22);
  long long v50 = (char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1000075A0((uint64_t *)&unk_10005D748);
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  unint64_t v61 = (char *)&v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView] = 0;
  swift_unknownObjectWeakInit();
  v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_providesHostedContent] = 1;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableBehavior] = 1;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_activeLayoutMode] = 1;
  char v25 = &v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier];
  void *v25 = 0;
  v25[1] = 0;
  id v26 = &v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier];
  void *v26 = 0;
  v26[1] = 0;
  uint64_t v27 = OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_elementIdentifier;
  id v28 = v5;
  *(void *)&v6[v27] = String._bridgeToObjectiveC()();
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_contentRole] = 1;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_maximumLayoutMode] = 4;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredLayoutMode] = 4;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredCustomLayout] = 4;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentationBehaviors] = 1;
  v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preventsAutomaticDismissal] = 1;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_leadingView] = 0;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_trailingView] = 0;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView] = 0;
  *(void *)&v28[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredHeightForBottomSafeArea] = 0x4047AAAAAAAAAAABLL;

  sub_1000075E4(a1);
  swift_unknownObjectRetain();
  id v29 = v56;
  uint64_t v30 = v67;
  long long v67 = a1;
  id v56 = v29;
  char v31 = sub_100020798((uint64_t)a1, v29, v30, a4, (uint64_t)v55);
  id v55 = v30;
  id v32 = [v30 configuration];
  id v33 = [self mru_suggestedRouteActivityTitleFont];
  [v32 setFont:v33];

  [v31 setPreferredContentSize:250.0, 50.0];
  id v34 = [*(id *)&v31[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter] configuration];
  [v31 preferredContentSize];
  [v34 setTextBoundingWidth:];

  swift_beginAccess();
  uint64_t v35 = v31;
  sub_1000075A0(&qword_10005CDC0);
  Published.projectedValue.getter();
  swift_endAccess();

  sub_100010118(&qword_10005CDC8, (uint64_t *)&unk_10005D730);
  sub_10001416C();
  uint64_t v36 = v51;
  Publisher<>.removeDuplicates()();
  char v37 = v17;
  char v38 = v50;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v36);
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
  id v39 = [self mainRunLoop];
  id v68 = v39;
  sub_1000141C0();
  sub_100010118(&qword_10005CDE0, (uint64_t *)&unk_10005CDB0);
  sub_100014200();
  uint64_t v40 = v53;
  Publisher.throttle<A>(for:scheduler:latest:)();

  (*(void (**)(char *, uint64_t))(v57 + 8))(v13, v58);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v21, v40);
  if (qword_10005C198 != -1) {
    swift_once();
  }
  uint64_t v41 = v66;
  uint64_t v42 = sub_100017894(v66, (uint64_t)qword_10005D670);
  os_log_type_t v43 = v65;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v65, v42, v41);
  unint64_t v44 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v45 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v45 + v44, v43, v41);
  sub_100010118((unint64_t *)&unk_10005CDF0, &qword_10005D740);
  uint64_t v46 = v60;
  uint64_t v47 = v61;
  Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v38, v46);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100010118(&qword_10005D758, (uint64_t *)&unk_10005D748);
  uint64_t v48 = v64;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v47, v48);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();

  swift_unknownObjectRelease();
  sub_100007760(v67);
  swift_release();

  return v35;
}

void sub_10001F2D0(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 176);
  v14[10] = *(_OWORD *)(a1 + 160);
  v14[11] = v1;
  v14[12] = *(_OWORD *)(a1 + 192);
  uint64_t v15 = *(void *)(a1 + 208);
  long long v2 = *(_OWORD *)(a1 + 112);
  v14[6] = *(_OWORD *)(a1 + 96);
  v14[7] = v2;
  long long v3 = *(_OWORD *)(a1 + 144);
  v14[8] = *(_OWORD *)(a1 + 128);
  v14[9] = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  v14[2] = *(_OWORD *)(a1 + 32);
  v14[3] = v4;
  long long v5 = *(_OWORD *)(a1 + 80);
  v14[4] = *(_OWORD *)(a1 + 64);
  v14[5] = v5;
  long long v6 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  v14[1] = v6;
  sub_1000075E4(v14);
  sub_1000075E4(v14);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_1000075E4(v14);
    uint64_t v10 = sub_10001AA1C();
    unint64_t v12 = v11;
    sub_100007760(v14);
    sub_1000340A8(v10, v12, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100007760(v14);
    sub_100007760(v14);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[BannerDebug] will update view with %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_100007760(v14);
    sub_100007760(v14);
  }
}

void sub_10001F4A0(long long *a1)
{
  long long v1 = a1[11];
  long long v93 = a1[10];
  long long v94 = v1;
  long long v95 = a1[12];
  uint64_t v96 = *((void *)a1 + 26);
  long long v2 = a1[7];
  long long v89 = a1[6];
  long long v90 = v2;
  long long v3 = a1[9];
  long long v91 = a1[8];
  long long v92 = v3;
  long long v4 = a1[3];
  long long v85 = a1[2];
  long long v86 = v4;
  long long v5 = a1[5];
  long long v87 = a1[4];
  long long v88 = v5;
  long long v6 = a1[1];
  long long v83 = *a1;
  long long v84 = v6;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    os_log_type_t v8 = (void *)Strong;
    sub_100020C50();
    uint64_t v9 = sub_10001F770();
    uint64_t v10 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
    long long v11 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 16];
    v81[0] = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
    v81[1] = v11;
    long long v12 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 64];
    long long v14 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 32];
    long long v13 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 48];
    v81[5] = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 80];
    v81[4] = v12;
    v81[2] = v14;
    v81[3] = v13;
    long long v15 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 128];
    long long v17 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96];
    long long v16 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112];
    v81[9] = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 144];
    v81[8] = v15;
    v81[6] = v17;
    v81[7] = v16;
    long long v19 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 176];
    long long v18 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 192];
    long long v20 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 160];
    uint64_t v82 = *(void *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 208];
    v81[12] = v18;
    v81[10] = v20;
    v81[11] = v19;
    long long v21 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 176];
    long long v22 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 192];
    long long v23 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 144];
    long long v72 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 160];
    long long v73 = v21;
    long long v74 = v22;
    uint64_t v75 = *(void *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 208];
    long long v24 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112];
    long long v25 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 128];
    long long v26 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 80];
    long long v68 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96];
    long long v69 = v24;
    long long v70 = v25;
    long long v71 = v23;
    long long v27 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 48];
    long long v28 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 64];
    long long v29 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 16];
    long long v64 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 32];
    long long v65 = v27;
    long long v66 = v28;
    long long v67 = v26;
    long long v30 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 16];
    long long v62 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
    long long v63 = v30;
    v76[0] = v62;
    v76[1] = v29;
    long long v31 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 32];
    long long v32 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 48];
    long long v33 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 80];
    v76[4] = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 64];
    v76[5] = v33;
    v76[2] = v31;
    v76[3] = v32;
    long long v34 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96];
    long long v35 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112];
    long long v36 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 144];
    v76[8] = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 128];
    v76[9] = v36;
    v76[6] = v34;
    v76[7] = v35;
    long long v37 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 160];
    long long v38 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 176];
    long long v39 = *(_OWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 192];
    uint64_t v77 = *(void *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 208];
    v76[11] = v38;
    v76[12] = v39;
    v76[10] = v37;
    long long v40 = v84;
    *(_OWORD *)uint64_t v10 = v83;
    *((_OWORD *)v10 + 1) = v40;
    long long v41 = v85;
    long long v42 = v86;
    long long v43 = v88;
    *((_OWORD *)v10 + 4) = v87;
    *((_OWORD *)v10 + 5) = v43;
    *((_OWORD *)v10 + 2) = v41;
    *((_OWORD *)v10 + 3) = v42;
    long long v44 = v89;
    long long v45 = v90;
    long long v46 = v92;
    *((_OWORD *)v10 + 8) = v91;
    *((_OWORD *)v10 + 9) = v46;
    *((_OWORD *)v10 + 6) = v44;
    *((_OWORD *)v10 + 7) = v45;
    long long v47 = v93;
    long long v48 = v94;
    long long v49 = v95;
    *((void *)v10 + 26) = v96;
    *((_OWORD *)v10 + 11) = v48;
    *((_OWORD *)v10 + 12) = v49;
    *((_OWORD *)v10 + 10) = v47;
    sub_1000075E4(&v83);
    sub_1000075E4(&v83);
    sub_1000075E4(v81);
    sub_100007760(v76);
    long long v50 = *((_OWORD *)v10 + 1);
    v79[0] = *(_OWORD *)v10;
    v79[1] = v50;
    long long v51 = *((_OWORD *)v10 + 5);
    long long v53 = *((_OWORD *)v10 + 2);
    long long v52 = *((_OWORD *)v10 + 3);
    v79[4] = *((_OWORD *)v10 + 4);
    v79[5] = v51;
    v79[2] = v53;
    v79[3] = v52;
    long long v54 = *((_OWORD *)v10 + 8);
    long long v56 = *((_OWORD *)v10 + 6);
    long long v55 = *((_OWORD *)v10 + 7);
    v79[9] = *((_OWORD *)v10 + 9);
    v79[8] = v54;
    v79[6] = v56;
    v79[7] = v55;
    long long v58 = *((_OWORD *)v10 + 11);
    long long v57 = *((_OWORD *)v10 + 12);
    long long v59 = *((_OWORD *)v10 + 10);
    uint64_t v80 = *((void *)v10 + 26);
    v79[12] = v57;
    v79[10] = v59;
    v79[11] = v58;
    sub_1000075E4(v79);
    LOBYTE(v10) = sub_10001B090((uint64_t)v79, (uint64_t)v81);
    sub_100007760(v79);
    if ((v10 & 1) == 0)
    {
      v60[10] = v72;
      v60[11] = v73;
      v60[12] = v74;
      uint64_t v61 = v75;
      v60[6] = v68;
      v60[7] = v69;
      v60[8] = v70;
      v60[9] = v71;
      v60[2] = v64;
      v60[3] = v65;
      v60[4] = v66;
      v60[5] = v67;
      v60[0] = v62;
      v60[1] = v63;
      nullsub_2(v60);
      sub_1000076F8((uint64_t)v60, (uint64_t)v78);
      sub_10000B8C8((uint64_t)v78, 1);
    }
    sub_100007760(&v83);
    sub_100007760(v81);
  }
}

char *sub_10001F770()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView;
  long long v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView);
  if (v2)
  {
    long long v3 = *(char **)(v0
                  + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView);
  }
  else
  {
    uint64_t v4 = v0;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    v24[10] = v20;
    v24[11] = v21;
    v24[12] = v22;
    uint64_t v25 = v23;
    v24[6] = v16;
    v24[7] = v17;
    v24[8] = v18;
    v24[9] = v19;
    v24[2] = v12;
    v24[3] = v13;
    v24[4] = v14;
    v24[5] = v15;
    v24[0] = v10;
    v24[1] = v11;
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
    objc_allocWithZone((Class)type metadata accessor for SuggestedRouteSystemApertureView());
    swift_unknownObjectRetain();
    long long v6 = sub_10000A3A4((uint64_t)v24, v5);
    uint64_t v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    long long v3 = v6;

    long long v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_10001F918()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000075A0(&qword_10005CE08);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000075A0((uint64_t *)&unk_10005D770);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = (objc_class *)type metadata accessor for SuggestedRouteSystemApertureViewController();
  v22.receiver = v0;
  v22.super_class = v10;
  [super viewDidLoad];
  id v11 = [v0 view];
  if (v11)
  {
    long long v12 = v11;
    id v13 = [objc_allocWithZone((Class)UIColor) initWithWhite:0.01 alpha:1.0];
    [v12 setBackgroundColor:v13];

    long long v14 = sub_10001F770();
    swift_beginAccess();
    sub_1000075A0((uint64_t *)&unk_10005C360);
    Published.projectedValue.getter();
    swift_endAccess();

    sub_100010118(&qword_10005D780, &qword_10005CE08);
    sub_1000205AC();
    Publisher<>.removeDuplicates()();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_100010118((unint64_t *)&unk_10005D790, (uint64_t *)&unk_10005D770);
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();
    swift_release();
    long long v15 = sub_10001F770();
    id v16 = *(id *)&v15[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView];

    long long v17 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView];
    *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView] = v16;
    id v18 = v16;

    sub_100020C50();
    long long v19 = sub_10001F770();
    id v20 = *(id *)&v19[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];

    [v20 addTarget:v1 action:"actionButtonTappedWithSender:" forControlEvents:64];
  }
  else
  {
    __break(1u);
  }
}

void sub_10001FCF4(double *a1)
{
  double v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = [*(id *)(Strong + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter) configuration];
    [v4 setTextBoundingWidth:v1];

    sub_100021430();
  }
}

id sub_10001FE80(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

void sub_10001FFC8()
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView));
  sub_100008C10(v0 + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  double v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView);
}

id sub_100020080()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteSystemApertureViewController();
  return [super dealloc];
}

uint64_t sub_10002017C()
{
  return type metadata accessor for SuggestedRouteSystemApertureViewController();
}

uint64_t type metadata accessor for SuggestedRouteSystemApertureViewController()
{
  uint64_t result = qword_10005D6C0;
  if (!qword_10005D6C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000201D0()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_100020268()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000202F8(uint64_t a1)
{
  type metadata accessor for Logger();

  sub_10001F2D0(a1);
}

uint64_t sub_100020368()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000203A0(long long *a1)
{
}

uint64_t *sub_1000203A8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_100020414()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView] = 0;
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_providesHostedContent] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableBehavior] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_activeLayoutMode] = 1;
  uint64_t v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier];
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier];
  *uint64_t v2 = 0;
  v2[1] = 0;
  uint64_t v3 = OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_elementIdentifier;
  *(void *)&v0[v3] = String._bridgeToObjectiveC()();
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_contentRole] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_maximumLayoutMode] = 4;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredLayoutMode] = 4;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredCustomLayout] = 4;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentationBehaviors] = 1;
  v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preventsAutomaticDismissal] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_leadingView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_trailingView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredHeightForBottomSafeArea] = 0x4047AAAAAAAAAAABLL;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

unint64_t sub_1000205AC()
{
  unint64_t result = qword_10005D788;
  if (!qword_10005D788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D788);
  }
  return result;
}

void sub_100020600(double *a1)
{
}

uint64_t sub_100020610()
{
  sub_1000206CC();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10005E7C0 = result;
  return result;
}

uint64_t sub_100020664()
{
  sub_1000206CC();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10005E7C8 = result;
  return result;
}

unint64_t sub_1000206CC()
{
  unint64_t result = qword_10005D7A0;
  if (!qword_10005D7A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005D7A0);
  }
  return result;
}

uint64_t sub_10002070C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000203A8(v0, qword_10005E7D0);
  sub_100017894(v0, (uint64_t)qword_10005E7D0);
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10005E7C0;
  return Logger.init(_:)();
}

char *sub_100020798(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView] = 0;
  swift_beginAccess();
  long long v10 = *(_OWORD *)(a1 + 176);
  v45[10] = *(_OWORD *)(a1 + 160);
  v45[11] = v10;
  v45[12] = *(_OWORD *)(a1 + 192);
  uint64_t v46 = *(void *)(a1 + 208);
  long long v11 = *(_OWORD *)(a1 + 112);
  v45[6] = *(_OWORD *)(a1 + 96);
  v45[7] = v11;
  long long v12 = *(_OWORD *)(a1 + 144);
  v45[8] = *(_OWORD *)(a1 + 128);
  v45[9] = v12;
  long long v13 = *(_OWORD *)(a1 + 48);
  v45[2] = *(_OWORD *)(a1 + 32);
  v45[3] = v13;
  long long v14 = *(_OWORD *)(a1 + 80);
  v45[4] = *(_OWORD *)(a1 + 64);
  v45[5] = v14;
  long long v15 = *(_OWORD *)(a1 + 16);
  v45[0] = *(_OWORD *)a1;
  v45[1] = v15;
  id v16 = v5;
  sub_1000075E4((void *)a1);
  Published.init(initialValue:)();
  swift_endAccess();
  id v17 = objc_allocWithZone((Class)MRUEndpointController);
  swift_bridgeObjectRetain();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithRouteUID:v18 client:0 player:0];

  *(void *)&v16[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_endpointController] = v19;
  id v20 = [objc_allocWithZone((Class)MRUNowPlayingController) initWithEndpointController:v19];
  *(void *)&v16[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller] = v20;
  *(void *)&v16[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter] = a3;
  id v43 = a3;

  *(void *)&v16[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate + 8] = 0;
  uint64_t v21 = swift_unknownObjectWeakInit();
  objc_super v22 = &v16[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(void *)objc_super v22 = 0xD000000000000017;
  *((void *)v22 + 1) = 0x800000010003D9A0;
  v16[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  uint64_t v23 = &v16[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(void *)uint64_t v23 = 0;
  v23[8] = 1;
  *(void *)&v16[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(void *)&v16[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a2;
  *(void *)(v21 + 8) = a5;
  swift_unknownObjectWeakAssign();
  v44.receiver = v16;
  v44.super_class = (Class)type metadata accessor for BannerBaseViewController();
  id v24 = a2;
  uint64_t v25 = (char *)[v44 initWithNibName:0 bundle:0];
  uint64_t v26 = OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller;
  long long v27 = *(void **)&v25[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller];
  long long v28 = v25;
  [v27 addObserver:v28];
  [v27 updateAutomaticResponseLoading];
  BOOL v29 = [v24 bannerType] == 0;
  v28[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = v29;
  if (v29) {
    long long v30 = &selRef_oneTapSuggestionInactiveTimeout;
  }
  else {
    long long v30 = &selRef_autoRouteInactiveTimeout;
  }
  long long v31 = self;
  long long v32 = v28;
  id v33 = [v31 currentSettings];
  [v33 *v30];
  uint64_t v35 = v34;

  long long v36 = &v32[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(void *)long long v36 = v35;
  v36[8] = 0;

  sub_100021430();
  id v37 = [*(id *)&v25[v26] metadataController];
  id v38 = [v37 artwork];

  swift_getKeyPath();
  swift_getKeyPath();
  long long v39 = (void (*)(_OWORD *, void))static Published.subscript.modify();
  long long v41 = *(void **)(v40 + 104);
  *(void *)(v40 + 104) = v38;

  v39(v45, 0);
  swift_release();
  swift_release();
  sub_1000217C0();

  swift_unknownObjectRelease();
  sub_100007760((void *)a1);

  return v32;
}

double sub_100020B9C@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 160) = v13;
  *(_OWORD *)(a1 + 176) = v14;
  *(_OWORD *)(a1 + 192) = v15;
  *(void *)(a1 + 208) = v16;
  *(_OWORD *)(a1 + 96) = v9;
  *(_OWORD *)(a1 + 112) = v10;
  *(_OWORD *)(a1 + 128) = v11;
  *(_OWORD *)(a1 + 144) = v12;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v8;
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  return result;
}

void sub_100020C50()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView];
  if (!v1) {
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  v83[10] = v79;
  v83[11] = v80;
  v83[12] = v81;
  uint64_t v84 = v82;
  v83[6] = v75;
  v83[7] = v76;
  v83[8] = v77;
  v83[9] = v78;
  v83[2] = v71;
  v83[3] = v72;
  v83[4] = v73;
  v83[5] = v74;
  v83[0] = v69;
  v83[1] = v70;
  swift_bridgeObjectRetain();
  sub_100007760(v83);
  if (!(void)v79) {
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v79 = v65;
  long long v80 = v66;
  long long v81 = v67;
  uint64_t v82 = v68;
  long long v75 = v61;
  long long v76 = v62;
  long long v77 = v63;
  long long v78 = v64;
  long long v71 = v57;
  long long v72 = v58;
  long long v73 = v59;
  long long v74 = v60;
  long long v69 = aBlock;
  long long v70 = v56;
  swift_bridgeObjectRetain();
  sub_100007760(&v69);
  if (!(void)v66)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    id v10 = [v2 deviceIconView];
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    long long v79 = v65;
    long long v80 = v66;
    long long v81 = v67;
    uint64_t v82 = v68;
    long long v75 = v61;
    long long v76 = v62;
    long long v77 = v63;
    long long v78 = v64;
    long long v71 = v57;
    long long v72 = v58;
    long long v73 = v59;
    long long v74 = v60;
    long long v69 = aBlock;
    long long v70 = v56;
    id v11 = *((id *)&v59 + 1);
    sub_100007760(&v69);
    if (!*((void *)&v59 + 1))
    {
      NSString v12 = String._bridgeToObjectiveC()();
      id v11 = [self systemImageNamed:v12];
    }
    [v10 setImage:v11];

    goto LABEL_9;
  }
  id v3 = [self sharedManager];
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + 24) = v0;
  *(void *)&long long v57 = sub_100022574;
  *((void *)&v57 + 1) = v6;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v56 = sub_1000111D0;
  *((void *)&v56 + 1) = &unk_10004A078;
  long long v7 = _Block_copy(&aBlock);
  id v8 = v2;
  long long v9 = v0;
  swift_release();
  [v3 imageForModelIdentifier:v4 color:v5 completion:v7];
  _Block_release(v7);

LABEL_9:
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v79 = v65;
  long long v80 = v66;
  long long v81 = v67;
  uint64_t v82 = v68;
  long long v75 = v61;
  long long v76 = v62;
  long long v77 = v63;
  long long v78 = v64;
  long long v71 = v57;
  long long v72 = v58;
  long long v73 = v59;
  long long v74 = v60;
  long long v69 = aBlock;
  long long v70 = v56;
  sub_100007760(&v69);
  if (v76 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    long long v65 = v51;
    long long v66 = v52;
    long long v67 = v53;
    uint64_t v68 = v54;
    long long v61 = v47;
    long long v62 = v48;
    long long v63 = v49;
    long long v64 = v50;
    long long v57 = v43;
    long long v58 = v44;
    long long v59 = v45;
    long long v60 = v46;
    long long aBlock = v41;
    long long v56 = v42;
    id v13 = *((id *)&v47 + 1);
    sub_100007760(&aBlock);
    if (*((void *)&v47 + 1))
    {
      id v14 = [v2 artworkView];
      [v14 setArtwork:v13];
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v65 = v51;
  long long v66 = v52;
  long long v67 = v53;
  uint64_t v68 = v54;
  long long v61 = v47;
  long long v62 = v48;
  long long v63 = v49;
  long long v64 = v50;
  long long v57 = v43;
  long long v58 = v44;
  long long v59 = v45;
  long long v60 = v46;
  long long aBlock = v41;
  long long v56 = v42;
  swift_bridgeObjectRetain();
  sub_100007760(&aBlock);
  if ((void)v50)
  {
    id v15 = [v2 artworkView];
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v15 setItemIdentifier:v16];
  }
  id v17 = [v2 artworkView];
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v37 = v51;
  long long v38 = v52;
  long long v39 = v53;
  uint64_t v40 = v54;
  v33[6] = v47;
  long long v34 = v48;
  long long v35 = v49;
  long long v36 = v50;
  v33[2] = v43;
  v33[3] = v44;
  v33[4] = v45;
  v33[5] = v46;
  v33[0] = v41;
  v33[1] = v42;
  sub_100007760(v33);
  [v17 setHidden:(v34 & 1) == 0];

  id v18 = [v2 artworkView];
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v51 = v29;
  long long v52 = v30;
  long long v53 = v31;
  uint64_t v54 = v32;
  long long v47 = v25;
  long long v48 = v26;
  long long v49 = v27;
  long long v50 = v28;
  long long v43 = v21;
  long long v44 = v22;
  long long v45 = v23;
  long long v46 = v24;
  long long v41 = v19;
  long long v42 = v20;
  sub_100007760(&v41);
  [v18 setPlaying:v48];
}

void *sub_100021430()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  v22[10] = v18;
  v22[11] = v19;
  v22[12] = v20;
  uint64_t v23 = v21;
  v22[6] = v14;
  v22[7] = v15;
  v22[8] = v16;
  v22[9] = v17;
  v22[2] = v10[2];
  uint64_t v22[3] = v11;
  v22[4] = v12;
  v22[5] = v13;
  v22[0] = v10[0];
  v22[1] = v10[1];
  swift_bridgeObjectRetain();
  double result = sub_100007760(v22);
  if ((void)v11)
  {
    id v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 textForRouteNames:isa];

    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    swift_getKeyPath();
    swift_getKeyPath();
    id v8 = (void (*)(_OWORD *, void))static Published.subscript.modify();
    *(void *)(v9 + 32) = v5;
    *(void *)(v9 + 40) = v7;
    swift_bridgeObjectRelease();
    v8(v10, 0);
    swift_release();
    return (void *)swift_release();
  }
  return result;
}

void *sub_1000215F0(double a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  v24[10] = v20;
  v24[11] = v21;
  v24[12] = v22;
  uint64_t v25 = v23;
  v24[6] = v16;
  v24[7] = v17;
  v24[8] = v18;
  v24[9] = v19;
  v24[2] = v12[2];
  v24[3] = v13;
  v24[4] = v14;
  v24[5] = v15;
  v24[0] = v12[0];
  v24[1] = v12[1];
  swift_bridgeObjectRetain();
  double result = sub_100007760(v24);
  if ((void)v13)
  {
    id v4 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = [v4 textForRouteNames:isa textBoundingWidth:a1];

    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    swift_getKeyPath();
    swift_getKeyPath();
    id v10 = (void (*)(_OWORD *, void))static Published.subscript.modify();
    *(void *)(v11 + 32) = v7;
    *(void *)(v11 + 40) = v9;
    swift_bridgeObjectRelease();
    v10(v12, 0);
    swift_release();
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1000217C0()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller) metadataController];
  id v2 = [v1 nowPlayingInfo];

  id v3 = [v2 identifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v7 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  *(void *)(v8 + 136) = v4;
  *(void *)(v8 + 144) = v6;
  swift_bridgeObjectRelease();
  v7(v20, 0);
  swift_release();
  swift_release();
  id v9 = [v2 stringForComponents:1];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  long long v14 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  *(void *)(v15 + 120) = v11;
  *(void *)(v15 + 128) = v13;
  swift_bridgeObjectRelease();
  v14(v20, 0);
  swift_release();
  swift_release();
  unsigned __int8 v16 = [v2 isPlaying];
  swift_getKeyPath();
  swift_getKeyPath();
  long long v17 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  *(unsigned char *)(v18 + 112) = v16;
  v17(v20, 0);

  swift_release();
  return swift_release();
}

double sub_1000219FC@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 160) = v13;
  *(_OWORD *)(a1 + 176) = v14;
  *(_OWORD *)(a1 + 192) = v15;
  *(void *)(a1 + 208) = v16;
  *(_OWORD *)(a1 + 96) = v9;
  *(_OWORD *)(a1 + 112) = v10;
  *(_OWORD *)(a1 + 128) = v11;
  *(_OWORD *)(a1 + 144) = v12;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v8;
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_100021AD4(uint64_t a1, void **a2)
{
  long long v2 = *(_OWORD *)(a1 + 176);
  v11[10] = *(_OWORD *)(a1 + 160);
  v11[11] = v2;
  v11[12] = *(_OWORD *)(a1 + 192);
  uint64_t v12 = *(void *)(a1 + 208);
  long long v3 = *(_OWORD *)(a1 + 112);
  void v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 144);
  v11[8] = *(_OWORD *)(a1 + 128);
  v11[9] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  void v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  void v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v7;
  long long v8 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000075E4(v11);
  id v9 = v8;
  return static Published.subscript.setter();
}

void sub_100021C48(void *a1, int a2, id a3)
{
  if (a1)
  {
    id v4 = a1;
    id v5 = [a3 deviceIconView];
    id v6 = [a3 deviceIconView];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;

    id v14 = [v4 mru_imageFittingSize:v8, v10];
    [v5 setImage:v14];
  }
  else
  {
    id v11 = [a3 deviceIconView];
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    v29[10] = v25;
    v29[11] = v26;
    v29[12] = v27;
    uint64_t v30 = v28;
    v29[6] = v21;
    v29[7] = v22;
    v29[8] = v23;
    v29[9] = v24;
    v29[2] = v17;
    v29[3] = v18;
    v29[4] = v19;
    v29[5] = v20;
    v29[0] = v15;
    v29[1] = v16;
    id v12 = *((id *)&v19 + 1);
    sub_100007760(v29);
    if (!*((void *)&v19 + 1))
    {
      NSString v13 = String._bridgeToObjectiveC()();
      id v12 = [self systemImageNamed:v13];
    }
    [v11 setImage:v12];
  }
}

void sub_100022138()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute;
  uint64_t v2 = sub_1000075A0(&qword_10005CDC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  long long v3 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter);
}

id sub_1000221E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBaseBannerViewController();
  return [super dealloc];
}

uint64_t sub_1000222D4()
{
  return type metadata accessor for SuggestedRouteBaseBannerViewController();
}

uint64_t type metadata accessor for SuggestedRouteBaseBannerViewController()
{
  uint64_t result = qword_10005D840;
  if (!qword_10005D840) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100022328()
{
  sub_1000223D4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000223D4()
{
  if (!qword_10005D850)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005D850);
    }
  }
}

uint64_t sub_100022434()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
  *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = 0;

  uint64_t v2 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    id v6 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration) requestIdentifier];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 24))(v7, v9, ObjectType, v4);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100022534()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100022574(void *a1, int a2)
{
  sub_100021C48(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_10002257C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002258C()
{
  return swift_release();
}

void *sub_100022594(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100024AB4(0, v1, 0);
    uint64_t v3 = a1 + 56;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = static String._fromSubstring(_:)();
      uint64_t v6 = v5;
      swift_bridgeObjectRelease();
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_100024AB4(v7 > 1, v8 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v8 + 1;
      uint64_t v9 = &_swiftEmptyArrayStorage[2 * v8];
      v9[4] = v4;
      v9[5] = v6;
      v3 += 32;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100022694(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    long long v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    long long v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        long long v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

char *sub_100022938(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v63 = a4;
  uint64_t v64 = a3;
  v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState] = 1;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode] = 0;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_contentRole] = 2;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredLayoutMode] = 3;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_maximumLayoutMode] = 3;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredCustomLayout] = 4;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors] = 1072;
  v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal] = 1;
  v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal] = 1;
  *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea] = 0x3FF0000000000000;
  uint64_t v7 = &v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  long long v8 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v7 + 10) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v7 + 11) = v8;
  *((_OWORD *)v7 + 12) = *(_OWORD *)(a1 + 192);
  *((void *)v7 + 26) = *(void *)(a1 + 208);
  long long v9 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v7 + 6) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v7 + 7) = v9;
  long long v10 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v7 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v7 + 9) = v10;
  long long v11 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v7 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v7 + 3) = v11;
  long long v12 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v7 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v7 + 5) = v12;
  long long v13 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a1;
  *((_OWORD *)v7 + 1) = v13;
  uint64_t v14 = v4;
  sub_1000075E4((void *)a1);
  id v15 = [a2 bundleIdentifierAffinity];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    unint64_t v66 = 0xD000000000000027;
    unint64_t v67 = 0x800000010003F8C0;
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = String._bridgeToObjectiveC()();
  }
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_elementIdentifier] = v21;
  id v22 = [a2 bannerType:v63, v64];
  BOOL v23 = self;
  uint64_t v24 = &selRef_userSelectedEndpointController;
  if (v22 != (id)3) {
    uint64_t v24 = &selRef_localEndpointController;
  }
  id v25 = [v23 *v24];
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController] = v25;
  id v26 = [objc_allocWithZone((Class)MRUNowPlayingController) initWithEndpointController:v25];
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller] = v26;
  id v27 = [a2 staticRequest];
  if (v27)
  {
    BOOL v28 = v27;
    id v29 = [v27 actionImageName];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  NSString v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  int64_t v31 = self;
  id v32 = [v31 systemImageNamed:v30];

  id v33 = self;
  id v34 = [v33 systemTealColor];
  long long v35 = (objc_class *)type metadata accessor for AccessoryImageView();
  v68.receiver = objc_allocWithZone(v35);
  v68.super_class = v35;
  id v36 = [super initWithImage:v32];
  [v36 setContentMode:1];
  [v36 setTintColor:v34];

  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_airPlayImageView] = v36;
  id v37 = [a2 staticRequest];
  if (v37)
  {
    long long v38 = v37;
    id v39 = [v37 routeSymbolName];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v40 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v41 = [v31 _systemImageNamed:v40];
  }
  else
  {
    id v41 = 0;
  }
  id v42 = [objc_allocWithZone((Class)UIImageView) init];
  [v42 setImage:v41];
  id v43 = [v33 whiteColor];
  [v42 setTintColor:v43];

  id v44 = objc_allocWithZone((Class)type metadata accessor for ActivityIndicatorImageAccessoryView());
  id v45 = v42;
  long long v46 = sub_100028AE8(v45);
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView] = v46;
  uint64_t v47 = *(void *)(a1 + 16);
  unint64_t v48 = *(void *)(a1 + 24);
  unint64_t v66 = 124;
  unint64_t v67 = 0xE100000000000000;
  __chkstk_darwin(v46);
  v62[2] = &v66;
  swift_bridgeObjectRetain();
  sub_1000075E4((void *)a1);
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_100024164(0x7FFFFFFFFFFFFFFFLL, 1, sub_1000262F0, (uint64_t)v62, v47, v48);
  swift_bridgeObjectRelease();
  long long v50 = sub_100022594(v49);
  swift_bridgeObjectRelease();
  uint64_t v51 = sub_100026440((uint64_t)v50);
  swift_bridgeObjectRelease();
  sub_100007760((void *)a1);
  long long v52 = &v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state];
  char *v52 = 0;
  *((void *)v52 + 1) = &_swiftEmptySetSingleton;
  *((void *)v52 + 2) = v51;

  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate + 8] = 0;
  uint64_t v53 = swift_unknownObjectWeakInit();
  uint64_t v54 = &v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(void *)uint64_t v54 = 0xD000000000000017;
  *((void *)v54 + 1) = 0x800000010003D9A0;
  v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  long long v55 = &v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(void *)long long v55 = 0;
  v55[8] = 1;
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a2;
  *(void *)(v53 + 8) = v63;
  swift_unknownObjectWeakAssign();
  long long v56 = (objc_class *)type metadata accessor for BannerBaseViewController();
  v65.receiver = v14;
  v65.super_class = v56;
  id v57 = a2;
  long long v58 = [(char *)[super initWithNibName:0 bundle:0]];
  long long v59 = *(void **)&v58[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller];
  long long v60 = v58;
  [v59 addObserver:v60];
  [v59 updateAutomaticResponseLoading];
  sub_1000234A0();

  swift_unknownObjectRelease();
  sub_100007760((void *)a1);

  return v60;
}

uint64_t sub_100023250()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    id v5 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration) requestIdentifier];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 24))(v6, v8, ObjectType, v3);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000234A0()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController) route];
  id v19 = [v1 endpointObject];

  if (!v19) {
    return;
  }
  id v2 = [v19 outputDevices];
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  sub_100026618();
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18 >= 1) {
      goto LABEL_5;
    }
  }
  else if (*(uint64_t *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
LABEL_5:
    id v5 = [v0 metadataController:v19];
    id v6 = [v5 nowPlayingInfo];

    unsigned __int8 v7 = [v6 isPlaying];
    uint64_t v8 = sub_100023734(v4);
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_100026440((uint64_t)v8);
    swift_bridgeObjectRelease();
    uint64_t v10 = v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state;
    *(unsigned char *)uint64_t v10 = v7;
    uint64_t v11 = *(void *)(v10 + 8);
    swift_bridgeObjectRetain();
    uint64_t v12 = swift_bridgeObjectRetain();
    char v13 = sub_100022694(v12, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState;
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState) == 1) {
      *(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState) = (v13 & 1) == 0;
    }
    sub_100023BE0();
    *(void *)(v10 + 8) = v9;
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(v10 + 8);
    swift_bridgeObjectRetain();
    uint64_t v16 = swift_bridgeObjectRetain();
    char v17 = sub_100022694(v16, v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v0 + v14) == 1) {
      *(unsigned char *)(v0 + v14) = (v17 & 1) == 0;
    }
    sub_100023BE0();
LABEL_10:

    return;
  }

  swift_bridgeObjectRelease();
}

void *sub_100023734(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v4);
      id v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 uid];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_100024984(0, v3[2] + 1, 1, v3);
        }
        unint64_t v14 = v3[2];
        unint64_t v13 = v3[3];
        if (v14 >= v13 >> 1) {
          uint64_t v3 = sub_100024984((void *)(v13 > 1), v14 + 1, 1, v3);
        }
        v3[2] = v14 + 1;
        uint64_t v15 = &v3[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }
      else
      {
      }
      ++v4;
      if (v7 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1000238CC()
{
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController] route];
  id v15 = [v1 endpointObject];

  if (v15)
  {
    id v2 = [v15 outputDevices];
    if (v2)
    {
      uint64_t v3 = v2;
      sub_100026618();
      unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v4 >> 62) {
        goto LABEL_19;
      }
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
      {
        uint64_t v6 = 4;
        while (1)
        {
          id v7 = (v4 & 0xC000000000000001) != 0
             ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
             : *(id *)(v4 + 8 * v6);
          id v8 = v7;
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v6 - 4, 1)) {
            break;
          }
          if ([v7 deviceType] == 1)
          {
          }
          else
          {
            unsigned int v10 = [v8 deviceType];

            if (v10 != 3)
            {

              swift_bridgeObjectRelease_n();
              return;
            }
          }
          ++v6;
          if (v9 == v5) {
            goto LABEL_20;
          }
        }
        __break(1u);
LABEL_19:
        swift_bridgeObjectRetain();
      }
LABEL_20:
      swift_bridgeObjectRelease_n();
      uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller];
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v0;
      aBlock[4] = sub_100026690;
      aBlock[5] = v12;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100010F90;
      aBlock[3] = &unk_10004A1A0;
      unint64_t v13 = _Block_copy(aBlock);
      unint64_t v14 = v0;
      swift_release();
      [v11 routingDeviceImage:v13];
      _Block_release(v13);
    }
    else
    {
    }
  }
}

void sub_100023B64(void *a1, uint64_t a2)
{
  id v2 = *(char **)(a2 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView);
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView];
  id v4 = a1;
  [v3 setImage:v4];
  [v2 sizeToFit];
}

void sub_100023BE0()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState) == 1)
  {
    uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView);
    if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state) & 1) == 0
      && (*(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) & 1) == 0)
    {
      *(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = 0;
      return;
    }
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state + 8);
    swift_bridgeObjectRetain();
    uint64_t v3 = swift_bridgeObjectRetain();
    char v4 = sub_100022694(v3, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning;
    int v6 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning);
    int v7 = (v4 & 1) == 0;
    *(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = v7;
    if (v6 == v7) {
      return;
    }
    id v8 = &selRef_stopAnimating;
    if ((v4 & 1) == 0) {
      id v8 = &selRef_startAnimating;
    }
    [*(id *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView) *v8];
    uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView);
    uint64_t v10 = *(unsigned __int8 *)(v1 + v5);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView);
    uint64_t v12 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning;
    int v13 = *(unsigned __int8 *)(v11
                             + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning);
    *(unsigned char *)(v11 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = 0;
    if (v13 != 1) {
      return;
    }
    [*(id *)(v11 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView) stopAnimating];
    uint64_t v9 = *(void **)(v11 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView);
    uint64_t v10 = *(unsigned __int8 *)(v11 + v12);
  }

  [v9 setHidden:v10];
}

void sub_100023D5C()
{
  long long v1 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 176);
  v7[10] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 160);
  v7[11] = v1;
  v7[12] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 192);
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 208);
  long long v2 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 112);
  v7[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 96);
  v7[7] = v2;
  long long v3 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 144);
  v7[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 128);
  v7[9] = v3;
  long long v4 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 48);
  v7[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 32);
  v7[3] = v4;
  long long v5 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 80);
  v7[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 64);
  v7[5] = v5;
  long long v6 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 16);
  v7[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute);
  v7[1] = v6;
  sub_100007760(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_100023E40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteConnectedViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SuggestedRouteConnectedViewController()
{
  return self;
}

uint64_t destroy for SuggestedRouteConnectedViewControllerState()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s13MediaRemoteUI42SuggestedRouteConnectedViewControllerStateVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SuggestedRouteConnectedViewControllerState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SuggestedRouteConnectedViewControllerState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SuggestedRouteConnectedViewControllerState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestedRouteConnectedViewControllerState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SuggestedRouteConnectedViewControllerState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SuggestedRouteConnectedViewControllerState()
{
  return &type metadata for SuggestedRouteConnectedViewControllerState;
}

uint64_t sub_100024164(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = _swiftEmptyArrayStorage;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_100024608(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    int v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  int v13 = _swiftEmptyArrayStorage;
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = String.subscript.getter();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = String.index(after:)();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = String.index(after:)();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = String.subscript.getter();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v13 = sub_100024874(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    int v13 = sub_100024874((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  BOOL v28 = &v13[4 * v27];
  v28[4] = v45;
  void v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = String.index(after:)();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = String.subscript.getter();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v13 = sub_100024874(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      int v13 = sub_100024874((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    NSString v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_42:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100024608(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = String.subscript.getter();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_100024874(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_100024874((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100024764(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000075A0((uint64_t *)&unk_10005D9A0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100026348(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100024874(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000075A0(&qword_10005D980);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      _OWORD v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100026524(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100024984(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000075A0(&qword_10005D978);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      _OWORD v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1000266B0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100024A94(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100024AD4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100024AB4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100024C34(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100024AD4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000075A0(&qword_10005D998);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100024C34(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000075A0(&qword_10005D978);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100024DA0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for Client();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10001D230(v7, result + 1);
    BOOL v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_1000251D0();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10001D418((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      type metadata accessor for Client();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100025750((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_100025020(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    Swift::Int v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000258C8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000251D0()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  sub_1000075A0(&qword_10005D4D0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    BOOL v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                long long v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v4;
  return result;
}

uint64_t sub_100025470()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  sub_1000075A0(&qword_10005D970);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                long long v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v4;
  return result;
}

void sub_100025750(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000251D0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100025A64();
      goto LABEL_14;
    }
    sub_100025DC4();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for Client();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

Swift::Int sub_1000258C8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100025470();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100025C10();
      goto LABEL_22;
    }
    sub_100026040();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    char v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        BOOL v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

id sub_100025A64()
{
  long long v1 = v0;
  sub_1000075A0(&qword_10005D4D0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *long long v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100025C10()
{
  long long v1 = v0;
  sub_1000075A0(&qword_10005D970);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *long long v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100025DC4()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  sub_1000075A0(&qword_10005D4D0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *long long v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    long long v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100026040()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  sub_1000075A0(&qword_10005D970);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *long long v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    long long v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000262F0(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
  }
}

uint64_t sub_100026348(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100026440(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100025020(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000264DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026514()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026524(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100026618()
{
  unint64_t result = qword_10005D988;
  if (!qword_10005D988)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005D988);
  }
  return result;
}

uint64_t sub_100026658()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100026690(void *a1)
{
  sub_100023B64(a1, *(void *)(v1 + 16));
}

uint64_t sub_100026698(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000266A8()
{
  return swift_release();
}

uint64_t sub_1000266B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_1000267A4()
{
  v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_contentRole] = 2;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredLayoutMode] = 3;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_maximumLayoutMode] = 3;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredCustomLayout] = 4;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors] = 1072;
  v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal] = 1;
  v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea] = 0x3FF0000000000000;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1000268A0()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView) == 1)
  {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
    *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = 0;

    uint64_t v2 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v3 = *(void *)(v2 + 8);
      uint64_t ObjectType = swift_getObjectType();
      id v5 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration) requestIdentifier];
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 24))(v6, v8, ObjectType, v3);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1000269A8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
  *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = 0;

  uint64_t v2 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    id v6 = [*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration) requestIdentifier];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 32))(v7, v9, ObjectType, v4);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100026A9C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000203A8(v0, qword_10005D9B0);
  sub_100017894(v0, (uint64_t)qword_10005D9B0);
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10005E7C0;
  return Logger.init(_:)();
}

id sub_100026C48()
{
  id v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v2 = *((void *)v1 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v4 = [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] requestIdentifier];
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16))(v5, v7, ObjectType, v2);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for BannerBaseViewController();
  [super dealloc];
}

void sub_100026DC8()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for BannerBaseViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v0 action:"bannerTapActionWithSender:"];
    [v2 addGestureRecognizer:v3];

    id v4 = [v0 view];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = [objc_allocWithZone((Class)UILongPressGestureRecognizer) initWithTarget:v0 action:"bannerLongPressActionWithSender:"];
      [v5 addGestureRecognizer:v6];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100026F28(char a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v7 = (objc_class *)type metadata accessor for BannerBaseViewController();
  v54.receiver = v1;
  v54.super_class = v7;
  [super viewDidAppear:a1 & 1];
  uint64_t v8 = &v1[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    long long v52 = v6;
    uint64_t v11 = v4;
    uint64_t v12 = v3;
    uint64_t v13 = ObjectType;
    id v14 = [*(id *)&v1[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] requestIdentifier];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    uint64_t v18 = v13;
    uint64_t v3 = v12;
    uint64_t v4 = v11;
    id v6 = v52;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(v15, v17, v18, v9);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  if (qword_10005C1B8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_100017894(v3, (uint64_t)qword_10005D9B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v19, v3);
  uint64_t v20 = v1;
  uint64_t v21 = Logger.logObject.getter();
  int v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, (os_log_type_t)v22))
  {
    HIDWORD(v47) = v22;
    os_log_t v48 = v21;
    uint64_t v50 = v19;
    uint64_t v51 = v3;
    uint64_t v23 = swift_slowAlloc();
    unint64_t v24 = (char *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    aBlock[0] = v49;
    *(_DWORD *)uint64_t v23 = 67109890;
    LODWORD(v53) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v23 + 8) = 2112;
    uint64_t v53 = (uint64_t)v20;
    char v25 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    long long v52 = v24;
    *(void *)unint64_t v24 = v20;

    *(_WORD *)(v23 + 18) = 2112;
    id v26 = [v25 view];
    id v27 = v26;
    if (v26) {
      uint64_t v53 = (uint64_t)v26;
    }
    else {
      uint64_t v53 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((void *)v52 + 1) = v27;

    *(_WORD *)(v23 + 28) = 2080;
    id v28 = [v25 view];
    if (!v28)
    {

      __break(1u);
      return;
    }
    int64_t v29 = v28;
    id v30 = [v28 subviews];

    sub_100028980();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v31 = Array.description.getter();
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_1000340A8(v31, v33, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v34 = v48;
    _os_log_impl((void *)&_mh_execute_header, v48, BYTE4(v47), "[MRUIBanner]: Banner did appear (animated: %{BOOL}d) %@ with view %@ - %s", (uint8_t *)v23, 0x26u);
    sub_1000075A0(&qword_10005DBE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v51);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v35 = (double *)&v20[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  if ((v20[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration + 8] & 1) == 0)
  {
    double v36 = *v35;
    if (*v35 > 0.0)
    {
      uint64_t v37 = v20;
      unint64_t v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        id v41 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 138412546;
        aBlock[0] = (uint64_t)v37;
        uint64_t v42 = v37;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v41 = v37;

        *(_WORD *)(v40 + 12) = 2048;
        *(double *)long long aBlock = v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "[MRUIBanner]: Banner  %@ set idle timer of %f seconds", (uint8_t *)v40, 0x16u);
        sub_1000075A0(&qword_10005DBE0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        unint64_t v38 = v37;
      }

      uint64_t v43 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = (uint64_t)sub_1000289F8;
      aBlock[5] = v43;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000128F8;
      aBlock[3] = (uint64_t)&unk_10004A1F0;
      uint64_t v44 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      uint64_t v45 = (objc_class *)[self timerWithInterval:0 repeats:v44 block:v36];
      _Block_release(v44);
      swift_release();
      long long v46 = *(Class *)((char *)&v37->isa + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
      *(Class *)((char *)&v37->isa + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = v45;
    }
  }
}

void sub_10002767C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (char *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v3 = *(void *)(v2 + 8);
      uint64_t ObjectType = swift_getObjectType();
      id v5 = [*(id *)&v1[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] requestIdentifier];
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 48))(v6, v8, ObjectType, v3);
      swift_bridgeObjectRelease();

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_1000277D0(char a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (objc_class *)type metadata accessor for BannerBaseViewController();
  v30.receiver = v1;
  v30.super_class = v7;
  [super viewDidDisappear:a1 & 1];
  if (qword_10005C1B8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100017894(v3, (uint64_t)qword_10005D9B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  id v9 = v1;
  uint64_t v10 = Logger.logObject.getter();
  int v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    int v25 = v11;
    uint64_t v26 = v3;
    os_log_t v28 = v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v31 = v27;
    *(_DWORD *)uint64_t v12 = 67109890;
    LODWORD(v29) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 8) = 2112;
    uint64_t v29 = (uint64_t)v9;
    id v14 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v13 = v9;

    *(_WORD *)(v12 + 18) = 2112;
    id v15 = [v14 view];
    id v16 = v15;
    if (v15) {
      uint64_t v29 = (uint64_t)v15;
    }
    else {
      uint64_t v29 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v13[1] = v16;

    *(_WORD *)(v12 + 28) = 2080;
    id v17 = [v14 view];
    if (v17)
    {
      uint64_t v18 = v17;
      id v19 = [v17 subviews];

      sub_100028980();
      static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v20 = Array.description.getter();
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_1000340A8(v20, v22, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      os_log_t v23 = v28;
      _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v25, "[MRUIBanner]: Banner did disappear (animated: %{BOOL}d) %@ with view %@ - %s", (uint8_t *)v12, 0x26u);
      sub_1000075A0(&qword_10005DBE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v26);
    }
    else
    {

      __break(1u);
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_100027CA4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v6 = a1;
  _bridgeAnyObjectToAny(_:)();
  uint64_t v7 = swift_unknownObjectRelease();
  a4(v7);

  return sub_100014434((uint64_t)&v9);
}

void sub_100027DA8(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void *))
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a1;
  a5(a4);
  swift_unknownObjectRelease();
}

uint64_t type metadata accessor for BannerBaseViewController()
{
  return self;
}

uint64_t sub_100027E90(void (*a1)(void))
{
  a1();

  return _typeName(_:qualified:)();
}

void sub_100027ECC()
{
  swift_getObjectType();
  if (qword_10005C1B8 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100017894(v1, (uint64_t)qword_10005D9B0);
  int v11 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v5 = _typeName(_:qualified:)();
    sub_1000340A8(v5, v6, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    id v7 = [*(id *)&v11[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] description];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    sub_1000340A8(v8, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%s] Will appear - %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10002812C(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C1B8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100017894(v4, (uint64_t)qword_10005D9B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = v2;
  id v11 = v9;
  uint64_t v12 = (char *)v10;
  uint64_t v13 = Logger.logObject.getter();
  int v14 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v26 = v14;
    uint64_t v27 = v4;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v29 = v25;
    *(_DWORD *)uint64_t v15 = 136315650;
    uint64_t v16 = _typeName(_:qualified:)();
    uint64_t v28 = sub_1000340A8(v16, v17, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    if (a1)
    {
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v28 = sub_1000340A8(v18, v19, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2080;
      id v20 = [*(id *)&v12[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] description];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v23 = v22;

      uint64_t v28 = sub_1000340A8(v21, v23, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v26, "[%s] Rejected because: %s - %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
    }
    else
    {

      __break(1u);
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_100028484(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C1B8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100017894(v4, (uint64_t)qword_10005D9B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = v2;
  id v11 = v9;
  uint64_t v12 = (char *)v10;
  uint64_t v13 = Logger.logObject.getter();
  int v14 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v13, (os_log_type_t)v14))
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (a1) {
      goto LABEL_7;
    }
LABEL_19:
    __break(1u);
    return;
  }
  int v43 = v14;
  uint64_t v44 = v4;
  uint64_t v45 = v12;
  uint64_t v15 = swift_slowAlloc();
  uint64_t v42 = swift_slowAlloc();
  uint64_t v48 = v42;
  *(_DWORD *)uint64_t v15 = 136315650;
  long long v46 = a1;
  uint64_t v16 = _typeName(_:qualified:)();
  uint64_t v47 = sub_1000340A8(v16, v17, &v48);
  uint64_t v18 = v46;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v15 + 12) = 2080;
  if (!v18)
  {

    __break(1u);
    goto LABEL_19;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v47 = sub_1000340A8(v19, v20, &v48);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *(_WORD *)(v15 + 22) = 2080;
  uint64_t v21 = v45;
  id v22 = [*(id *)&v45[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] description];
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v25 = v24;

  uint64_t v47 = sub_1000340A8(v23, v25, &v48);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v43, "[%s] Disappeared because: %s - %s", (uint8_t *)v15, 0x20u);
  swift_arrayDestroy();
  swift_slowDealloc();
  uint64_t v12 = v21;
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v44);
LABEL_7:
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;
  if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
    p_cache = (void **)(&OBJC_METACLASS____TtC13MediaRemoteUI12SceneMonitor + 16);
  }
  else
  {
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    p_cache = &OBJC_METACLASS____TtC13MediaRemoteUI12SceneMonitor.cache;
    if ((v31 & 1) == 0)
    {
      if (static String._unconditionallyBridgeFromObjectiveC(_:)() == 0xD000000000000017
        && v32 == 0x800000010003FBB0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v33 & 1) == 0) {
          return;
        }
      }
    }
  }
  os_log_t v34 = &v12[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v35 = *((void *)v34 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v37 = [*(id *)((char *)p_cache[314] + (void)v12) requestIdentifier];
    uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v40 = v39;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 40))(v38, v40, ObjectType, v35);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

unint64_t sub_100028980()
{
  unint64_t result = qword_10005DA80;
  if (!qword_10005DA80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DA80);
  }
  return result;
}

uint64_t sub_1000289C0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000289F8()
{
}

uint64_t sub_100028A00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100028A10()
{
  return swift_release();
}

void sub_100028A18()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *uint64_t v1 = 0xD000000000000017;
  v1[1] = 0x800000010003D9A0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  uint64_t v2 = &v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(void *)uint64_t v2 = 0;
  v2[8] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

char *sub_100028AE8(void *a1)
{
  v1[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning] = 0;
  uint64_t v3 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView;
  id v4 = objc_allocWithZone((Class)UIActivityIndicatorView);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView] = a1;
  id v6 = a1;

  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for ActivityIndicatorImageAccessoryView();
  id v7 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView];
  id v9 = v7;
  [v9 addSubview:v8];
  id v10 = *(void **)&v9[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView];
  [v9 addSubview:v10];
  uint64_t v11 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning;
  if (v9[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning]) {
    uint64_t v12 = &selRef_startAnimating;
  }
  else {
    uint64_t v12 = &selRef_stopAnimating;
  }
  [v10 *v12];
  [v8 setHidden:v9[v11]];

  return v9;
}

id sub_100028DD4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityIndicatorImageAccessoryView();
  return [super dealloc];
}

uint64_t type metadata accessor for ActivityIndicatorImageAccessoryView()
{
  return self;
}

uint64_t sub_100028E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_100028ECC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for LockScreenCoordinator()) init];
  qword_10005E808 = (uint64_t)result;
  return result;
}

void sub_100028F88()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer];
  if (v1)
  {
    [v1 preferredContentSize];
    objc_super v2 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize];
    *(void *)objc_super v2 = v3;
    *((void *)v2 + 1) = v4;
    v2[16] = 0;
  }
  sub_10002BAA0(0, 0, 0);
  if (sub_1000297C0())
  {
    if (*(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
    {
      sub_10002BAA0(1, 0, 0);
      return;
    }
    id v7 = [self currentSettings];
    unsigned __int8 v8 = [v7 supportLockScreenBackground];

    if ((v8 & 1) == 0) {
      return;
    }
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v0;
    *(unsigned char *)(v9 + 24) = 0;
    id v10 = v0;
    sub_10002A4E0((uint64_t)sub_10002CB14, v9);
  }
  else
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v0;
    id v6 = v0;
    sub_10002BAA0(0, (uint64_t)sub_10002CB74, v5);
  }

  swift_release();
}

void sub_10002914C(char *a1, uint64_t a2, void *a3, void *a4, void (*a5)(void))
{
  id v7 = *(void **)&a1[*a4];
  *(void *)&a1[*a4] = a3;
  id v9 = a3;
  unsigned __int8 v8 = a1;

  a5();
}

void sub_1000291C4()
{
  sub_10002BAA0(0, 0, 0);
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer;
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer];
  if (v2)
  {
    id v3 = [v2 artworkView];
    [v3 addObserver:v0];

    uint64_t v4 = *(void **)&v0[v1];
    if (v4)
    {
      id v5 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork];
      id v6 = v4;
      id v7 = [v6 artworkView];
      [v7 setArtwork:v5];
    }
  }
  unsigned __int8 v8 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion];
  if (!v8)
  {
    char v9 = 0;
    if (sub_1000297C0()) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v0;
    uint64_t v11 = v0;
    sub_10002BE0C(0, v9, (uint64_t)sub_10002C524, v10);
    goto LABEL_12;
  }
  char v9 = [v8 isAnimated];
  if ((sub_1000297C0() & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  if (*(void *)&v0[v1])
  {
    sub_10002BE0C(1, v9, 0, 0);
    return;
  }
  id v12 = [self currentSettings];
  unsigned __int8 v13 = [v12 supportLockScreenBackground];

  if ((v13 & 1) == 0) {
    return;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v0;
  *(unsigned char *)(v14 + 24) = v9;
  uint64_t v15 = v0;
  sub_10002A4E0((uint64_t)sub_10002C52C, v14);
LABEL_12:

  swift_release();
}

uint64_t sub_100029578()
{
  uint64_t result = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (result)
  {
    uint64_t result = (uint64_t)[(id)result catalog];
    if (result)
    {

      id v2 = [self currentDevice];
      id v3 = [v2 userInterfaceIdiom];

      if (v3 == (id)1)
      {
        return 1;
      }
      else
      {
        id v4 = [self sharedApplication];
        id v5 = [v4 activeInterfaceOrientation];

        return sub_10002C538((uint64_t)v5);
      }
    }
  }
  return result;
}

void sub_100029648(char a1)
{
  int v2 = v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState];
  v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState] = a1;
  if (v2 == (a1 & 1)) {
    return;
  }
  MRSetPrefersExpandedLockScreenPlatter();
  if (sub_1000297C0())
  {
    if (*(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
    {
      sub_10002BAA0(1, 0, 0);
      return;
    }
    id v5 = [self currentSettings];
    unsigned int v6 = [v5 supportLockScreenBackground];

    if (!v6) {
      return;
    }
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v1;
    *(unsigned char *)(v7 + 24) = 0;
    unsigned __int8 v8 = v1;
    sub_10002A4E0((uint64_t)sub_10002CB14, v7);
  }
  else
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    id v4 = v1;
    sub_10002BAA0(0, (uint64_t)sub_10002CB74, v3);
  }

  swift_release();
}

unint64_t sub_1000297C0()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState) != 1) {
    return 0;
  }
  unint64_t result = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (result)
  {
    unint64_t result = (unint64_t)[(id)result catalog];
    if (result)
    {

      id v2 = [self currentDevice];
      id v3 = [v2 userInterfaceIdiom];

      if (v3 == (id)1) {
        return *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) != 0;
      }
      id v4 = [self sharedApplication];
      id v5 = [v4 activeInterfaceOrientation];

      unint64_t result = sub_10002C538((uint64_t)v5);
      if (result) {
        return *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) != 0;
      }
    }
  }
  return result;
}

id sub_1000298C4()
{
  uint64_t v1 = sub_1000075A0(&qword_10005CCF0);
  uint64_t v28 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  __chkstk_darwin(v1);
  uint64_t v27 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  id v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer] = 0;
  unsigned __int8 v8 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds];
  *(_OWORD *)unsigned __int8 v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  v8[32] = 1;
  char v9 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds];
  *(_OWORD *)char v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  uint64_t v10 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds];
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v10[32] = 1;
  uint64_t v11 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v12 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService;
  id v13 = objc_allocWithZone((Class)SBSWallpaperService);
  uint64_t v14 = v0;
  *(void *)&v0[v12] = [v13 init];
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer] = 0;
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer] = 0;
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork] = 0;
  uint64_t v15 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState;
  v14[v15] = MRPrefersExpandedLockScreenPlatter();
  v14[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_shouldExpandWhenAmbientSceneDisconnects] = 0;
  uint64_t v16 = &v14[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable];
  sub_10000E94C();
  *(_OWORD *)uint64_t v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((void *)v16 + 4) = 0;
  static DispatchQoS.unspecified.getter();
  v30[0] = _swiftEmptyArrayStorage;
  sub_10001E5FC((unint64_t *)&unk_10005DB70, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000075A0((uint64_t *)&unk_10005D5C0);
  sub_100010118((unint64_t *)&unk_10005DB80, (uint64_t *)&unk_10005D5C0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v26);
  *(void *)&v14[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_workerQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  unint64_t v17 = (objc_class *)type metadata accessor for LockScreenCoordinator();
  v31.receiver = v14;
  v31.super_class = v17;
  id v18 = [super init];
  uint64_t v19 = qword_10005C190;
  id v20 = v18;
  if (v19 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_1000075A0((uint64_t *)&unk_10005CBF0);
  uint64_t v21 = v27;
  Published.projectedValue.getter();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100010118(&qword_10005CD20, &qword_10005CCF0);
  uint64_t v22 = v29;
  uint64_t v23 = Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v21, v22);
  v30[3] = type metadata accessor for AnyCancellable();
  v30[4] = &protocol witness table for AnyCancellable;

  v30[0] = v23;
  uint64_t v24 = (uint64_t)v20 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable;
  swift_beginAccess();
  sub_100010040((uint64_t)v30, v24);
  swift_endAccess();
  return v20;
}

void sub_100029E28(char *a1)
{
  char v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_10002B870(v1);
  }
}

id LockScreenCoordinator.__deallocating_deinit()
{
  [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService] invalidate];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenCoordinator();
  return [super dealloc];
}

uint64_t type metadata accessor for LockScreenCoordinator()
{
  return self;
}

void sub_10002A024(double a1, double a2)
{
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer];
  if (!v3) {
    return;
  }
  id v13 = v3;
  if ([v13 isShowingMediaSuggestions]) {
    goto LABEL_13;
  }
  uint64_t v6 = (double *)&v2[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize];
  double *v6 = a1;
  v6[1] = a2;
  *((unsigned char *)v6 + 16) = 0;
  if (sub_1000297C0())
  {
    if (*(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
    {
      sub_10002BAA0(1, 0, 0);
LABEL_13:

      return;
    }
    id v9 = [self currentSettings];
    unsigned int v10 = [v9 supportLockScreenBackground];

    if (!v10) {
      goto LABEL_13;
    }
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v2;
    *(unsigned char *)(v11 + 24) = 0;
    uint64_t v12 = v2;
    sub_10002A4E0((uint64_t)sub_10002CB14, v11);
  }
  else
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v2;
    unsigned __int8 v8 = v2;
    sub_10002BAA0(0, (uint64_t)sub_10002CB74, v7);
  }

  swift_release();
}

void sub_10002A250(CGFloat a1, CGFloat a2)
{
  if (qword_10005C1C0 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void **)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  if (v4)
  {
    id v5 = [v4 artworkView];
    [v5 frame];
    v7.x = a1;
    v7.y = a2;
    if (CGRectContainsPoint(v8, v7)) {
      sub_100029648(0);
    }
  }
}

uint64_t sub_10002A384()
{
  id v1 = [self currentSettings];
  unsigned int v2 = [v1 supportLockScreenBackground];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (!v3) {
    return 0;
  }
  id v4 = [v3 catalog];
  if (!v4) {
    return 0;
  }

  id v5 = [self currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 != (id)1)
  {
    id v7 = [self sharedApplication];
    id v8 = [v7 activeInterfaceOrientation];

    if (!sub_10002C538((uint64_t)v8)) {
      return 0;
    }
  }
  uint64_t v9 = 1;
  sub_100029648(1);
  return v9;
}

uint64_t sub_10002A4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = a1;
  uint64_t v54 = a2;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v60 = v7;
  uint64_t v61 = v8;
  __chkstk_darwin(v7);
  unsigned int v10 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = 0u;
  *(_OWORD *)(v11 + 32) = 0u;
  uint64_t v51 = v11;
  *(unsigned char *)(v11 + 48) = 1;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = 0u;
  *(_OWORD *)(v12 + 32) = 0u;
  uint64_t v59 = v12;
  *(unsigned char *)(v12 + 48) = 1;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = 0u;
  *(_OWORD *)(v13 + 32) = 0u;
  *(unsigned char *)(v13 + 48) = 1;
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  uint64_t v57 = *(void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_workerQueue);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = v14;
  unint64_t v67 = sub_10002C66C;
  objc_super v68 = (void *)v15;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v64 = 1107296256;
  long long v58 = &v65;
  objc_super v65 = sub_1000128F8;
  unint64_t v66 = &unk_10004A470;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  unint64_t v17 = v14;
  static DispatchQoS.unspecified.getter();
  long long v62 = &_swiftEmptyArrayStorage;
  uint64_t v18 = sub_10001E5FC((unint64_t *)&qword_10005DD70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v19 = sub_1000075A0((uint64_t *)&unk_10005D540);
  uint64_t v20 = sub_100010118((unint64_t *)&qword_10005DD80, (uint64_t *)&unk_10005D540);
  uint64_t v49 = v19;
  uint64_t v47 = v20;
  uint64_t v52 = v18;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  long long v55 = v6;
  uint64_t v56 = v3;
  uint64_t v22 = v3;
  uint64_t v23 = (char *)v45[1];
  uint64_t v57 = v4 + 8;
  uint64_t v48 = v21;
  v21(v6, v22);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v61 + 8);
  uint64_t v50 = v10;
  v61 += 8;
  long long v46 = v24;
  v24(v10, v60);
  swift_release();
  id v25 = [self currentDevice];
  id v26 = [v25 userInterfaceIdiom];

  if (v26 == (id)1)
  {
    dispatch_group_enter(v17);
    uint64_t v27 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService];
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = v59;
    *(void *)(v28 + 24) = v17;
    unint64_t v67 = sub_10002C724;
    objc_super v68 = (void *)v28;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v64 = 1107296256;
    objc_super v65 = sub_10002AF40;
    unint64_t v66 = &unk_10004A560;
    uint64_t v29 = _Block_copy(&aBlock);
    objc_super v30 = v17;
    swift_retain();
    swift_release();
    [v27 fetchLockScreenContentCutoutBoundsForOrientation:1 completionHandler:v29];
    _Block_release(v29);
  }
  dispatch_group_enter(v17);
  objc_super v31 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService];
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = v51;
  *(void *)(v32 + 16) = v51;
  *(void *)(v32 + 24) = v17;
  unint64_t v67 = sub_10002CB18;
  objc_super v68 = (void *)v32;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v64 = 1107296256;
  objc_super v65 = sub_10002AF40;
  unint64_t v66 = &unk_10004A4C0;
  os_log_t v34 = _Block_copy(&aBlock);
  uint64_t v35 = v17;
  swift_retain();
  swift_release();
  [v31 fetchMaximalLockScreenContentCutoutBoundsForOrientation:1 completionHandler:v34];
  _Block_release(v34);
  sub_10000E94C();
  double v36 = (void *)static OS_dispatch_queue.main.getter();
  id v37 = (void *)swift_allocObject();
  v37[2] = v33;
  v37[3] = v13;
  v37[4] = v59;
  v37[5] = v23;
  uint64_t v38 = v54;
  v37[6] = v53;
  v37[7] = v38;
  unint64_t v67 = sub_10002C6D0;
  objc_super v68 = v37;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v64 = 1107296256;
  objc_super v65 = sub_1000128F8;
  unint64_t v66 = &unk_10004A510;
  uint64_t v39 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v40 = v23;
  swift_retain();
  uint64_t v41 = v50;
  static DispatchQoS.unspecified.getter();
  long long v62 = &_swiftEmptyArrayStorage;
  int v43 = v55;
  uint64_t v42 = v56;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_group.notify(qos:flags:queue:execute:)();
  _Block_release(v39);

  v48(v43, v42);
  v46(v41, v60);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

id sub_10002ABB4(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  unsigned int v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = sub_10002C740();
  if (result)
  {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    sub_10000E94C();
    uint64_t v13 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a1;
    v14[3] = ObjCClassMetadata;
    v14[4] = a2;
    aBlock[4] = sub_10002C864;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000128F8;
    aBlock[3] = &unk_10004A5B0;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    id v16 = a2;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10001E5FC((unint64_t *)&qword_10005DD70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000075A0((uint64_t *)&unk_10005D540);
    sub_100010118((unint64_t *)&qword_10005DD80, (uint64_t *)&unk_10005D540);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10002AEA8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  [(id)swift_getObjCClassFromMetadata() contentCutoutBoundsForInterfaceOrientation:1];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_beginAccess();
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v12;
  *(unsigned char *)(a1 + 48) = 0;
  dispatch_group_leave(a3);
}

uint64_t sub_10002AF40(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9 = *(void (**)(uint64_t, double, double, double, double))(a1 + 32);
  uint64_t v10 = swift_retain();
  v9(v10, a2, a3, a4, a5);

  return swift_release();
}

void sub_10002AFB4(uint64_t a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  if (!CGRectIsNull(*(CGRect *)&a3))
  {
    swift_beginAccess();
    *(double *)(a1 + 16) = a3;
    *(double *)(a1 + 24) = a4;
    *(double *)(a1 + 32) = a5;
    *(double *)(a1 + 40) = a6;
    *(unsigned char *)(a1 + 48) = 0;
  }
  dispatch_group_leave(a2);
}

uint64_t sub_10002B030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a1 + 48) & 1) == 0)
  {
    double v12 = *(double *)(a1 + 32);
    double v11 = *(double *)(a1 + 40);
    double v14 = *(double *)(a1 + 16);
    double v13 = *(double *)(a1 + 24);
    uint64_t result = swift_beginAccess();
    if ((*(unsigned char *)(a2 + 48) & 1) == 0)
    {
      long long v33 = *(_OWORD *)(a2 + 32);
      long long v34 = *(_OWORD *)(a2 + 16);
      swift_beginAccess();
      double v15 = v14;
      double v16 = v13;
      double v17 = v12;
      double v18 = v11;
      if ((*(unsigned char *)(a3 + 48) & 1) == 0)
      {
        double v17 = *(double *)(a3 + 32);
        double v18 = *(double *)(a3 + 40);
        double v15 = *(double *)(a3 + 16);
        double v16 = *(double *)(a3 + 24);
      }
      double v35 = v17;
      double v36 = v18;
      uint64_t v19 = a4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds;
      *(_OWORD *)uint64_t v19 = v34;
      *(_OWORD *)(v19 + 16) = v33;
      *(unsigned char *)(v19 + 32) = 0;
      uint64_t v20 = self;
      id v21 = [v20 mainScreen];
      [v21 bounds];
      double v23 = v22;
      double v25 = v24;

      uint64_t v26 = a4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds;
      *(double *)uint64_t v26 = v14 * v23;
      *(double *)(v26 + 8) = v13 * v25;
      *(double *)(v26 + 16) = v12 * v23;
      *(double *)(v26 + 24) = v11 * v25;
      *(unsigned char *)(v26 + 32) = 0;
      id v27 = [v20 mainScreen];
      [v27 bounds];
      double v29 = v28;
      double v31 = v30;

      uint64_t v32 = a4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds;
      *(double *)uint64_t v32 = v15 * v29;
      *(double *)(v32 + 8) = v16 * v31;
      *(double *)(v32 + 16) = v35 * v29;
      *(double *)(v32 + 24) = v36 * v31;
      *(unsigned char *)(v32 + 32) = 0;
      return a5();
    }
  }
  return result;
}

void sub_10002B210()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer;
  [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer] invalidate];
  uint64_t v2 = *(void **)&v0[v1];
  *(void *)&v0[v1] = 0;

  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork];
  if (!v3) {
    goto LABEL_10;
  }
  id v4 = [v3 catalog];
  if (!v4
    || (v4,
        id v5 = [self currentDevice],
        id v6 = [v5 userInterfaceIdiom],
        v5,
        v6 != (id)1)
    && (id v7 = [self sharedApplication],
        id v8 = [v7 activeInterfaceOrientation],
        v7,
        !sub_10002C538((uint64_t)v8)))
  {
LABEL_10:
    uint64_t v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v19[4] = sub_10002C650;
    v19[5] = v9;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 1107296256;
    v19[2] = sub_1000128F8;
    v19[3] = &unk_10004A358;
    uint64_t v10 = _Block_copy(v19);
    swift_retain();
    swift_release();
    id v11 = [self timerWithInterval:0 repeats:v10 block:2.0];
    _Block_release(v10);
    swift_release();
    double v12 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v11;

    return;
  }
  if (sub_1000297C0())
  {
    if (*(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
    {
      sub_10002BE0C(1, 1, 0, 0);
      return;
    }
    id v15 = [self currentSettings];
    unsigned int v16 = [v15 supportLockScreenBackground];

    if (!v16) {
      return;
    }
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v0;
    *(unsigned char *)(v17 + 24) = 1;
    double v18 = v0;
    sub_10002A4E0((uint64_t)sub_10002CB14, v17);
  }
  else
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v0;
    double v14 = v0;
    sub_10002BE0C(0, 1, (uint64_t)sub_10002CB74, v13);
  }

  swift_release();
}

void sub_10002B54C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    if (sub_1000297C0())
    {
      if (*(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
      {
        sub_10002BE0C(1, 1, 0, 0);
LABEL_9:

        return;
      }
      id v4 = [self currentSettings];
      unsigned int v5 = [v4 supportLockScreenBackground];

      if (!v5) {
        goto LABEL_9;
      }
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v1;
      *(unsigned char *)(v6 + 24) = 1;
      uint64_t v3 = v1;
      sub_10002A4E0((uint64_t)sub_10002CB14, v6);
    }
    else
    {
      uint64_t v2 = swift_allocObject();
      *(void *)(v2 + 16) = v1;
      uint64_t v3 = v1;
      sub_10002BE0C(0, 1, (uint64_t)sub_10002CB74, v2);
    }

    swift_release();
  }
}

void sub_10002B6B4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState) != 1) {
    goto LABEL_7;
  }
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (!v2) {
    goto LABEL_7;
  }
  id v3 = [v2 catalog];
  if (!v3) {
    goto LABEL_7;
  }

  id v4 = [self currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 != (id)1)
  {
    id v6 = [self sharedApplication];
    id v7 = [v6 activeInterfaceOrientation];

    if (!sub_10002C538((uint64_t)v7)) {
      goto LABEL_7;
    }
  }
  if (!*(void *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer))
  {
LABEL_7:
    id v8 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion);
    *(void *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion) = 0;
  }
}

uint64_t sub_10002B7E0(uint64_t a1, char a2)
{
  uint64_t v4 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion;
  id v5 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion);
  if (!v5 || (uint64_t result = (uint64_t)[v5 isValid], (result & 1) == 0))
  {
    *(void *)(a1 + v4) = [objc_allocWithZone((Class)MRUILockScreenAssertion) initWithAnimated:a2 & 1];
    return _objc_release_x1();
  }
  return result;
}

void sub_10002B870(char a1)
{
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, v3))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v5 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v3, "LockScreenCoordinator handleAmbientSceneIsActive:%{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }
  if (a1)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_shouldExpandWhenAmbientSceneDisconnects) = *(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState);
    char v6 = 0;
LABEL_7:
    sub_100029648(v6);
    return;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_shouldExpandWhenAmbientSceneDisconnects) == 1)
  {
    id v7 = [self currentSettings];
    unsigned int v8 = [v7 supportLockScreenBackground];

    if (v8)
    {
      uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
      if (v9)
      {
        id v10 = [v9 catalog];
        if (v10)
        {

          id v11 = [self currentDevice];
          id v12 = [v11 userInterfaceIdiom];

          if (v12 == (id)1
            || (id v13 = [self sharedApplication],
                id v14 = [v13 activeInterfaceOrientation],
                v13,
                sub_10002C538((uint64_t)v14)))
          {
            char v6 = 1;
            goto LABEL_7;
          }
        }
      }
    }
  }
}

void sub_10002BAA0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState) == (a1 & 1))
  {
    uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer;
    id v7 = *(void **)(v3 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
    if (v7)
    {
      if (a2)
      {
        aBlock[4] = a2;
        aBlock[5] = a3;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000128F8;
        aBlock[3] = &unk_10004A308;
        uint64_t v9 = _Block_copy(aBlock);
        id v10 = v7;
        sub_10002C608(a2);
        swift_release();
      }
      else
      {
        id v11 = v7;
        uint64_t v9 = 0;
      }
      [v7 setShowArtworkView:(a1 & 1) == 0 completion:v9];
      _Block_release(v9);

      id v12 = *(void **)(v4 + v6);
      if (v12)
      {
        id v13 = [v12 view];
        if (!v13)
        {
          __break(1u);
          goto LABEL_21;
        }
        id v14 = v13;
        [v13 layoutIfNeeded];
      }
    }
  }
  id v15 = (CGFloat *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds);
  if ((*(unsigned char *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds + 32) & 1) == 0)
  {
    unsigned int v16 = (CGFloat *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds);
    if ((*(unsigned char *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds + 32) & 1) == 0
      && (*(unsigned char *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds + 32) & 1) == 0
      && (*(unsigned char *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize + 16) & 1) == 0)
    {
      CGFloat v18 = v15[2];
      CGFloat v17 = v15[3];
      CGFloat v20 = *v15;
      CGFloat v19 = v15[1];
      CGFloat v22 = v16[2];
      CGFloat v21 = v16[3];
      CGFloat v23 = *v16;
      CGFloat v24 = v16[1];
      double v53 = *(double *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize + 8);
      double MaxY = CGRectGetMaxY(*(CGRect *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds));
      v55.origin.x = v20;
      v55.origin.y = v19;
      v55.size.width = v18;
      v55.size.height = v17;
      double v51 = CGRectGetMaxY(v55);
      v56.origin.x = v20;
      v56.origin.y = v19;
      v56.size.width = v18;
      v56.size.height = v17;
      CGFloat MinY = CGRectGetMinY(v56);
      v57.origin.x = v23;
      v57.origin.y = v24;
      v57.size.width = v22;
      v57.size.height = v21;
      CGFloat v26 = CGRectGetMinY(v57);
      id v27 = [self mainScreen];
      [v27 bounds];
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;

      v58.origin.x = v29;
      v58.origin.y = v31;
      v58.size.width = v33;
      v58.size.height = v35;
      double Height = CGRectGetHeight(v58);
      uint64_t v37 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer;
      uint64_t v38 = *(char **)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
      if (v38)
      {
        double v39 = v51 + -80.0;
        if (v51 + -80.0 >= MaxY) {
          double v39 = MaxY;
        }
        uint64_t v40 = (CGFloat *)&v38[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap];
        *uint64_t v40 = MinY;
        *((unsigned char *)v40 + 8) = 0;
        uint64_t v41 = (CGFloat *)&v38[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap];
        *uint64_t v41 = v26;
        *((unsigned char *)v41 + 8) = 0;
        uint64_t v42 = (double *)&v38[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap];
        *uint64_t v42 = v53 + Height - v39 + 20.0;
        *((unsigned char *)v42 + 8) = 0;
        int v43 = v38;
        id v44 = [v43 view];
        if (v44)
        {
          uint64_t v45 = v44;
          [v44 bounds];
          double v47 = v46;
          double v49 = v48;

          sub_10000FB1C(v47, v49);
          uint64_t v50 = *(void **)(v4 + v37);
          if (v50) {
            [v50 setArtworkVisible:a1 & 1];
          }
          return;
        }
LABEL_21:
        __break(1u);
      }
    }
  }
}

void sub_10002BE0C(char a1, char a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unsigned int v8 = self;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v4;
    *(unsigned char *)(v9 + 24) = a1 & 1;
    CGFloat v19 = sub_10002C548;
    uint64_t v20 = v9;
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    CGFloat v17 = sub_1000128F8;
    CGFloat v18 = &unk_10004A290;
    id v10 = _Block_copy(&v15);
    id v11 = v4;
    swift_release();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a3;
    *(void *)(v12 + 24) = a4;
    CGFloat v19 = sub_10002C5D4;
    uint64_t v20 = v12;
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    CGFloat v17 = sub_100028E78;
    CGFloat v18 = &unk_10004A2E0;
    id v13 = _Block_copy(&v15);
    sub_10002C608(a3);
    swift_release();
    [v8 _animateUsingSpringWithDuration:1 delay:v10 options:v13 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:42.0 completion:0.0];
    _Block_release(v13);
    _Block_release(v10);
  }
  else
  {
    char v14 = a1 & 1;
    sub_10002BAA0(v14, a3, a4);
  }
}

void LockScreenCoordinator.nowPlayingController(_:metadataController:didChange:)(uint64_t a1, uint64_t a2, void *a3)
{
}

void LockScreenCoordinator.artworkView(_:didChangeArtworkImage:)()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
  if (v1)
  {
    id v2 = v1;
    NSString v3 = String._bridgeToObjectiveC()();
    [v2 invalidateAllTimelinesForReason:v3];
  }
}

void *sub_10002C230(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_10002C2D4(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_10002C300(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10002C328@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void sub_10002C358(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
  NSString v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  *(void *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = a1;
  id v4 = a1;

  sub_10002B210();
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  if (v5)
  {
    id v8 = *(id *)(v1 + v2);
    id v6 = v5;
    id v7 = [v6 artworkView];
    [v7 setArtwork:v8];
  }
}

void sub_10002C420(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
  NSString v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  *(void *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = a1;
  id v9 = a1;

  sub_10002B210();
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  if (v4)
  {
    id v5 = *(id *)(v1 + v2);
    id v6 = v4;
    id v7 = [v6 artworkView];
    [v7 setArtwork:v5];

    id v8 = v5;
  }
  else
  {
    id v8 = v9;
  }
}

uint64_t sub_10002C4EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002C524()
{
  sub_10002B6B4(*(void *)(v0 + 16));
}

uint64_t sub_10002C52C()
{
  return sub_10002B7E0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

BOOL sub_10002C538(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void sub_10002C548()
{
  sub_10002BAA0(*(unsigned char *)(v0 + 24), 0, 0);
}

uint64_t sub_10002C57C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C58C()
{
  return swift_release();
}

uint64_t sub_10002C594()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C5D4(uint64_t result)
{
  if (result)
  {
    uint64_t v2 = *(uint64_t (**)(void))(v1 + 16);
    if (v2) {
      return v2();
    }
  }
  return result;
}

uint64_t sub_10002C608(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10002C618()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002C650()
{
}

uint64_t sub_10002C658()
{
  return _swift_deallocObject(v0, 56, 7);
}

id sub_10002C66C()
{
  return sub_10002ABB4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10002C678()
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002C6D0()
{
  return sub_10002B030(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(uint64_t (**)(void))(v0 + 48));
}

uint64_t sub_10002C6E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002C724(double a1, double a2, double a3, double a4)
{
  sub_10002AFB4(*(void *)(v4 + 16), *(NSObject **)(v4 + 24), a1, a2, a3, a4);
}

id sub_10002C740()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_10005E6D0;
  uint64_t v7 = qword_10005E6D0;
  if (!qword_10005E6D0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10002C8B0;
    v3[3] = &unk_10004A6D0;
    v3[4] = &v4;
    sub_10002C8B0(v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10002C80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C824()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10002C864()
{
  sub_10002AEA8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(NSObject **)(v0 + 32));
}

uint64_t sub_10002C870()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10002C8A8(char *a1)
{
}

Class sub_10002C8B0(void *a1)
{
  v7[0] = 0;
  if (!qword_10005E6D8)
  {
    v7[1] = _NSConcreteStackBlock;
    v7[2] = (void *)3221225472;
    v7[3] = sub_10002CAA0;
    v7[4] = &unk_10004A708;
    v7[5] = v7;
    long long v8 = off_10004A6F0;
    uint64_t v9 = 0;
    qword_10005E6D8 = _sl_dlopen();
  }
  if (qword_10005E6D8)
  {
    uint64_t v2 = v7[0];
    if (!v7[0]) {
      goto LABEL_5;
    }
  }
  else
  {
    a1 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"void *CoverSheetLibrary(void)"];
    [a1 handleFailureInFunction:v4 file:@"MediaRemoteUI-Bridging-Header.h" lineNumber:17 description:@"%s" v7[0]];

    __break(1u);
  }
  free(v2);
LABEL_5:
  Class result = objc_getClass("CSContentCutoutBoundsCalculator");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  if (!*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    id v5 = +[NSAssertionHandler currentHandler];
    uint64_t v6 = +[NSString stringWithUTF8String:"Class getCSContentCutoutBoundsCalculatorClass(void)_block_invoke"];
    [v5 handleFailureInFunction:v6 file:@"MediaRemoteUI-Bridging-Header.h" lineNumber:18 description:@"Unable to find class %s" CSContentCutoutBoundsCalculator];

    __break(1u);
  }
  qword_10005E6D0 = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_10002CAA0()
{
  uint64_t result = _sl_dlopen();
  qword_10005E6D8 = result;
  return result;
}

uint64_t sub_10002CB8C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000203A8(v0, qword_10005DB90);
  sub_100017894(v0, (uint64_t)qword_10005DB90);
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10005E7C0;
  return Logger.init(_:)();
}

id sub_10002CC48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BannerPresenter();
  return [super dealloc];
}

uint64_t type metadata accessor for BannerPresenter()
{
  return self;
}

uint64_t sub_10002CCEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002CD14(a1, a2, a3, a4, 3);
}

uint64_t sub_10002CCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002CD14(a1, a2, a3, a4, 0);
}

uint64_t sub_10002CCFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002CD14(a1, a2, a3, a4, 1);
}

uint64_t sub_10002CD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002CD14(a1, a2, a3, a4, 2);
}

uint64_t sub_10002CD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002CD14(a1, a2, a3, a4, 4);
}

uint64_t sub_10002CD14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v11 = *(void *)(v9 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8))(a1, a2, a5, ObjectType, v11);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10002CDC4()
{
  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xB8))();
}

uint64_t sub_10002CDF8(char *a1, int a2, char *a3)
{
  LODWORD(v4) = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  long long v73 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v67 - v11;
  if (qword_10005C1C8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100017894(v7, (uint64_t)qword_10005DB90);
  swift_unknownObjectRetain_n();
  uint64_t v72 = v13;
  char v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  long long v70 = v12;
  uint64_t v71 = ObjectType;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v69 = v7;
    uint64_t v18 = v17;
    unint64_t v67 = (void *)swift_slowAlloc();
    id v76 = v67;
    *(_DWORD *)uint64_t v18 = 136315394;
    long long v74 = a1;
    uint64_t v19 = _typeName(_:qualified:)();
    LODWORD(v68) = v4;
    uint64_t v75 = sub_1000340A8(v19, v20, (uint64_t *)&v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    id v4 = [v74 description];
    CGFloat v21 = a3;
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = v8;
    unint64_t v25 = v24;

    LOBYTE(v4) = (_BYTE)v68;
    uint64_t v26 = v22;
    a3 = v21;
    uint64_t v75 = sub_1000340A8(v26, v25, (uint64_t *)&v76);
    a1 = v74;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    uint64_t v8 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%s] Will present %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v69;
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v27 = *(void **)&a3[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source];
  if (!v27) {
    goto LABEL_12;
  }
  if (sub_10002D748(v4 & 1))
  {
    sub_1000075A0(&qword_10005DBE8);
    v28.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v28.super.Class isa = 0;
  }
  id v76 = 0;
  unsigned int v29 = [v27 postPresentable:a1 options:1 userInfo:v28.super.isa error:&v76];

  if (v29)
  {
    id v30 = v76;
LABEL_12:
    CGFloat v31 = v73;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v73, v72, v7);
    swift_unknownObjectRetain_n();
    double v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v32, v33))
    {

      swift_unknownObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v31, v7);
    }
    uint64_t v72 = v8;
    double v34 = a1;
    uint64_t v35 = swift_slowAlloc();
    id v76 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315394;
    uint64_t v36 = _typeName(_:qualified:)();
    uint64_t v75 = sub_1000340A8(v36, v37, (uint64_t *)&v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    long long v74 = v34;
    id v38 = [v34 requestIdentifier];
    if (v38)
    {
      double v39 = v38;
      uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v42 = v41;

      uint64_t v75 = sub_1000340A8(v40, v42, (uint64_t *)&v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%s] Presented %s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v73, v7);
    }
    swift_unknownObjectRelease();
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  long long v74 = a3;
  id v44 = v76;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  uint64_t v45 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v70, v72, v7);
  swift_unknownObjectRetain();
  swift_errorRetain();
  swift_unknownObjectRetain();
  swift_errorRetain();
  double v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.error.getter();
  double v48 = &selRef_presentableContext;
  if (!os_log_type_enabled(v46, v47))
  {
    swift_unknownObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v45, v7);
    goto LABEL_20;
  }
  uint64_t v72 = v8;
  uint64_t v69 = v7;
  uint64_t v49 = swift_slowAlloc();
  objc_super v68 = (void *)swift_slowAlloc();
  long long v73 = (char *)swift_slowAlloc();
  id v76 = v73;
  *(_DWORD *)uint64_t v49 = 136315650;
  uint64_t v50 = _typeName(_:qualified:)();
  uint64_t v75 = sub_1000340A8(v50, v51, (uint64_t *)&v76);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v49 + 12) = 2080;
  id v52 = [a1 requestIdentifier];
  double v53 = a1;
  if (v52)
  {
    uint64_t v54 = v52;
    uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v57 = v56;

    uint64_t v75 = sub_1000340A8(v55, v57, (uint64_t *)&v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 22) = 2112;
    swift_errorRetain();
    uint64_t v58 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v75 = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *objc_super v68 = v58;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "[%s] Presentable %s failed with: %@", (uint8_t *)v49, 0x20u);
    sub_1000075A0(&qword_10005DBE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v72 + 8))(v70, v69);
    a1 = v53;
    double v48 = &selRef_presentableContext;
LABEL_20:
    uint64_t v59 = &v74[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
    if (!swift_unknownObjectWeakLoadStrong()) {
      return swift_errorRelease();
    }
    uint64_t v60 = *((void *)v59 + 1);
    id v61 = [a1 v48[256]];
    if (v61)
    {
      long long v62 = v61;
      uint64_t v63 = swift_getObjectType();
      uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v66 = v65;

      (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v60 + 8))(v64, v66, 0, v63, v60);
      swift_errorRelease();
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
    goto LABEL_25;
  }
LABEL_26:
  swift_errorRelease();
  swift_unknownObjectRelease();
  uint64_t result = swift_errorRelease();
  __break(1u);
  return result;
}

unint64_t sub_10002D748(Swift::Bool a1)
{
  sub_1000075A0(&qword_10005DBF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038AE0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v3;
  sub_10002D7F0();
  char v4 = SBUIIsSystemApertureEnabled();
  *(NSNumber *)(inited + 48) = NSNumber.init(BOOLeanLiteral:)(v4);
  *(void *)(inited + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 64) = v5;
  *(NSNumber *)(inited + 72) = NSNumber.init(BOOLeanLiteral:)(a1);
  return sub_10002F180(inited);
}

unint64_t sub_10002D7F0()
{
  unint64_t result = qword_10005DBF8;
  if (!qword_10005DBF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DBF8);
  }
  return result;
}

uint64_t sub_10002D830(void *a1, void *a2)
{
  if (SBUIIsSystemApertureEnabled())
  {
    objc_allocWithZone((Class)type metadata accessor for GroupSessionSystemApertureViewController());
    id v4 = a2;
    id v5 = a1;
    uint64_t v6 = (char *)sub_100007C98(v4, (uint64_t)a1, (uint64_t)&off_10004A728);
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for GroupSessionBannerViewController());
    id v7 = a2;
    id v8 = a1;
    uint64_t v6 = (char *)sub_100019C90(v7, (uint64_t)a1, (uint64_t)&off_10004A728);
  }
  uint64_t v9 = v6;
  swift_getObjectType();
  sub_10002CDF8(v9, 0, (char *)a1);

  return swift_unknownObjectRelease();
}

id sub_10002D900()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionBannerPresenter();
  return [super dealloc];
}

uint64_t type metadata accessor for GroupSessionBannerPresenter()
{
  return self;
}

uint64_t sub_10002D958(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E94C();
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_10002DC1C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000128F8;
  aBlock[3] = &unk_10004A788;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v1;
  id v14 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10000E9E4();
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10000EA3C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v17);
}

uint64_t sub_10002DBDC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002DC1C()
{
  return sub_10002D830(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10002DC24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002DC34()
{
  return swift_release();
}

void sub_10002DC3C()
{
  uint64_t v1 = qword_10005C1D0;
  uint64_t v2 = v0;
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_10005E810;
  id v4 = objc_allocWithZone((Class)type metadata accessor for ClientConnectionManager());
  uint64_t v5 = v3;
  id v6 = [v4 init];
  uint64_t v7 = OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager;
  uint64_t v8 = *(void **)&v5[OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager];
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager] = v6;

  uint64_t v9 = *(void **)&v5[v7];
  if (v9)
  {
    uint64_t v10 = OBJC_IVAR____TtC13MediaRemoteUI11AppDelegate_server;
    id v11 = v9;
    sub_10001C138();

    *(void *)&v2[v10] = v5;
    v12.receiver = v2;
    v12.super_class = (Class)type metadata accessor for AppDelegate();
    [super init];
  }
  else
  {
    __break(1u);
  }
}

id sub_10002DD50()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_10002DDB8(char a1)
{
  sub_1000075A0(&qword_10005DCF0);
  __chkstk_darwin();
  id v4 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[OBJC_IVAR____TtC13MediaRemoteUI13RouteIconView_routeType] = a1;
  uint64_t v5 = (objc_class *)type metadata accessor for RouteIconView();
  v42.receiver = v1;
  v42.super_class = v5;
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v7 = (id)MRGroupCompositionForMRGroupSessionRouteType();
  id v8 = [self symbolNameForComposition:v7];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = [self _systemImageNamed:v9];

  [v6 setImage:v10];
  [v6 setContentMode:1];
  id v11 = self;
  id v12 = v6;
  id v13 = [v11 secondaryLabelColor];
  [v12 setTintColor:v13];

  [v12 setClipsToBounds:0];
  id v14 = [objc_allocWithZone((Class)UIImageView) init];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  type metadata accessor for MainActor();
  id v16 = v12;
  id v17 = v14;
  uint64_t v18 = static MainActor.shared.getter();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v18;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v17;
  v19[5] = v16;
  sub_10002E7CC((uint64_t)v4, (uint64_t)&unk_10005DD00, (uint64_t)v19);
  swift_release();
  [v17 setContentMode:1];
  id v20 = [v17 layer];
  [v20 setShadowRadius:10.0];

  id v21 = [v17 layer];
  id v22 = [v11 blackColor];
  id v23 = [v22 CGColor];

  [v21 setShadowColor:v23];
  [v17 setClipsToBounds:0];
  id v24 = [v17 layer];
  [v24 setMasksToBounds:0];

  [v16 addSubview:v17];
  unint64_t v25 = self;
  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_100038B90;
  id v27 = [v17 leadingAnchor];
  id v28 = [v16 centerXAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28 constant:4.0];

  *(void *)(v26 + 32) = v29;
  id v30 = [v17 topAnchor];
  id v31 = [v16 centerYAnchor];
  id v32 = [v30 constraintEqualToAnchor:v31 constant:4.0];

  *(void *)(v26 + 40) = v32;
  id v33 = [v17 widthAnchor];
  id v34 = [v16 widthAnchor];
  id v35 = [v33 constraintEqualToAnchor:v34 multiplier:0.4];

  *(void *)(v26 + 48) = v35;
  id v36 = [v17 heightAnchor];
  id v37 = [v17 widthAnchor];
  id v38 = [v36 constraintEqualToAnchor:v37];

  *(void *)(v26 + 56) = v38;
  v41[1] = v26;
  specialized Array._endMutation()();
  sub_100007868();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 activateConstraints:isa];

  return v16;
}

uint64_t sub_10002E3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  type metadata accessor for MainActor();
  v5[18] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[19] = v7;
  v5[20] = v6;
  return _swift_task_switch(sub_10002E440, v7, v6);
}

uint64_t sub_10002E440()
{
  uint64_t v1 = (void *)v0[17];
  id v2 = [self sharedAssetsProvider];
  v0[21] = v2;
  NSString v3 = String._bridgeToObjectiveC()();
  v0[22] = v3;
  id v4 = [v1 traitCollection];
  v0[23] = v4;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10002E5C4;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10002E770;
  v0[13] = &unk_10004A800;
  v0[14] = v5;
  [v2 applicationIconForBundleIdentifier:v3 traitCollection:v4 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10002E5C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return _swift_task_switch(sub_10002E6CC, v2, v1);
}

uint64_t sub_10002E6CC()
{
  uint64_t v2 = (void *)v0[22];
  uint64_t v1 = (void *)v0[23];
  NSString v3 = (void *)v0[21];
  uint64_t v4 = (void *)v0[16];
  swift_release();
  uint64_t v5 = (void *)v0[15];
  [v4 setImage:v5];

  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10002E770(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_10002EFE8((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

uint64_t sub_10002E7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10002ECC4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_10002EA70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RouteIconView();
  return [super dealloc];
}

uint64_t type metadata accessor for RouteIconView()
{
  return self;
}

uint64_t sub_10002EAC8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002EB10(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10002EBD0;
  return sub_10002E3A8(a1, v4, v5, v7, v6);
}

uint64_t sub_10002EBD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002ECC4(uint64_t a1)
{
  uint64_t v2 = sub_1000075A0(&qword_10005DCF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002ED24(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002EE00;
  return v6(a1);
}

uint64_t sub_10002EE00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002EEF8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002EF30(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10002EBD0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005DD08 + dword_10005DD08);
  return v6(a1, v4);
}

uint64_t sub_10002EFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075A0(&qword_10005DD18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002F050(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000075A0(&qword_10005DD98);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100030E8C(v6, (uint64_t)v15);
    unint64_t result = sub_10003072C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000A30C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10002F180(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000075A0(&qword_10005DD88);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_100030770(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_10002F29C()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter];
  }
  else
  {
    uint64_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for GroupSessionBannerPresenter());
    uint64_t v5 = &v4[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
    *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate + 8] = 0;
    swift_unknownObjectWeakInit();
    uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source;
    uint64_t v7 = v0;
    char v8 = v4;
    NSString v9 = String._bridgeToObjectiveC()();
    id v10 = [self bannerSourceForDestination:0 forRequesterIdentifier:v9];

    *(void *)&v4[v6] = v10;
    *((void *)v5 + 1) = &off_10004A818;
    swift_unknownObjectWeakAssign();

    v15.receiver = v8;
    v15.super_class = (Class)type metadata accessor for BannerPresenter();
    [super init];

    BOOL v12 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v11;
    id v3 = v11;

    uint64_t v2 = 0;
  }
  id v13 = v2;
  return v3;
}

id sub_10002F3F4()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter];
  }
  else
  {
    uint64_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerPresenter());
    uint64_t v5 = v0;
    id v6 = sub_100030A00((uint64_t)v5, v4);

    uint64_t v7 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

uint64_t sub_10002F478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a6;
  uint64_t v12 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v28 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t v26 = *(void *)(v15 - 8);
  uint64_t v27 = v15;
  __chkstk_darwin(v15);
  long long v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E94C();
  uint64_t v25 = static OS_dispatch_queue.main.getter();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = v6;
  v18[5] = a1;
  v18[6] = a2;
  v18[7] = a5;
  v18[8] = v24;
  aBlock[4] = sub_1000309EC;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000128F8;
  aBlock[3] = &unk_10004A8A0;
  uint64_t v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v20 = v6;
  swift_bridgeObjectRetain();
  sub_10002C608(a5);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10000E9E4();
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10000EA3C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  id v21 = (void *)v25;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v17, v27);
}

void sub_10002F73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  NSString v8 = String._bridgeToObjectiveC()();
  NSString v9 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
  if (!v9)
  {
LABEL_4:
    if (a6) {
      a6(0);
    }

    return;
  }
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = v8;
  sub_10002F180((uint64_t)_swiftEmptyArrayStorage);
  sub_1000075A0(&qword_10005DBE8);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v23 = 0;
  id v13 = [v9 revokePresentableWithRequestIdentifier:v10 reason:v11 animated:1 userInfo:isa error:&v23];

  if (v13)
  {
    id v14 = v23;

    goto LABEL_4;
  }
  id v15 = v23;
  uint64_t v16 = _convertNSErrorToError(_:)();

  swift_willThrow();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_10005E7C0;
  os_log_type_t v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, v17))
  {
    swift_errorRetain();
    swift_errorRetain();
    id v20 = (uint8_t *)swift_slowAlloc();
    id v21 = (void *)swift_slowAlloc();
    *(_DWORD *)id v20 = 138412290;
    swift_errorRetain();
    id v22 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v23 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v21 = v22;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "revoke banner failed: %@", v20, 0xCu);
    sub_1000075A0(&qword_10005DBE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  if (a6)
  {
    swift_errorRetain();
    a6(v16);
    swift_errorRelease();
  }
  swift_errorRelease();
}

uint64_t sub_10002FA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a3;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  NSString v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E94C();
  id v14 = (void *)static OS_dispatch_queue.main.getter();
  id v15 = (void *)swift_allocObject();
  _OWORD v15[2] = a1;
  v15[3] = a2;
  uint64_t v16 = v21;
  v15[4] = v4;
  v15[5] = v16;
  void v15[6] = a4;
  aBlock[4] = sub_1000306A4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000128F8;
  aBlock[3] = &unk_10004A850;
  os_log_type_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v18 = v4;
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10000E9E4();
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10000EA3C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v22);
}

void sub_10002FCD4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  NSString v6 = String._bridgeToObjectiveC()();
  uint64_t v7 = v6;
  uint64_t v8 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = v6;
  sub_10002F180((uint64_t)_swiftEmptyArrayStorage);
  sub_1000075A0(&qword_10005DBE8);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v21 = 0;
  id v11 = [v8 revokeAllPresentablesWithReason:v9 userInfo:isa error:&v21];

  if (v11)
  {
    id v12 = v21;

LABEL_4:
    a4(0);

    return;
  }
  id v13 = v21;
  uint64_t v14 = _convertNSErrorToError(_:)();

  swift_willThrow();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_10005E7C0;
  os_log_type_t v17 = v15;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, v15))
  {
    swift_errorRetain();
    swift_errorRetain();
    id v18 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 138412290;
    swift_errorRetain();
    uint64_t v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v21 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v19 = v20;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "revoke banner failed: %@", v18, 0xCu);
    sub_1000075A0(&qword_10005DBE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  swift_errorRetain();
  a4(v14);
  swift_errorRelease();
  swift_errorRelease();
}

id sub_10002FF94()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v25 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v24 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [v0 description];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  long long aBlock = (void **)v9;
  uint64_t v28 = v11;
  v12._countAndFlagsBits = 0x74696E69656420;
  v12._object = (void *)0xE700000000000000;
  String.append(_:)(v12);
  uint64_t v14 = aBlock;
  uint64_t v13 = v28;
  sub_10000E94C();
  os_log_type_t v15 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source];
  os_log_type_t v17 = (void *)swift_allocObject();
  void v17[2] = v14;
  v17[3] = v13;
  v17[4] = v16;
  id v31 = sub_100030BA4;
  id v32 = v17;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v28 = 1107296256;
  id v29 = sub_1000128F8;
  id v30 = &unk_10004A8F0;
  id v18 = _Block_copy(&aBlock);
  id v19 = v16;
  swift_release();
  static DispatchQoS.unspecified.getter();
  long long aBlock = (void **)_swiftEmptyArrayStorage;
  sub_10000E9E4();
  sub_1000075A0((uint64_t *)&unk_10005D540);
  sub_10000EA3C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v24);
  uint64_t v20 = (objc_class *)type metadata accessor for BannerController();
  v26.receiver = v1;
  v26.super_class = v20;
  return [super dealloc];
}

void sub_100030288(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  if (a3)
  {
    id v5 = v4;
    sub_10002F180((uint64_t)_swiftEmptyArrayStorage);
    sub_1000075A0(&qword_10005DBE8);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v10 = 0;
    id v7 = [a3 revokeAllPresentablesWithReason:v5 userInfo:isa error:&v10];

    if (v7)
    {
      id v8 = v10;
    }
    else
    {
      id v9 = v10;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease();
    }
  }
  else
  {
  }
}

id sub_100030480()
{
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter] = 0;
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source;
  uint64_t v2 = v0;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self bannerSourceForDestination:0 forRequesterIdentifier:v3];

  *(void *)&v0[v1] = v4;
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for BannerController();
  return [super init];
}

uint64_t type metadata accessor for BannerController()
{
  return self;
}

uint64_t sub_1000305AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v9 = *(void *)(v7 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, ObjectType, v9);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10003065C()
{
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000306A4()
{
  sub_10002FCD4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(uint64_t))(v0 + 40));
}

uint64_t sub_1000306B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000306C4()
{
  return swift_release();
}

uint64_t sub_1000306CC(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_100030704(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_10003072C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000307E8(a1, v4);
}

unint64_t sub_100030770(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000308B0(a1, a2, v4);
}

unint64_t sub_1000307E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100030E30(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000155E8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000308B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100030994()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 72, 7);
}

void sub_1000309EC()
{
  sub_10002F73C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void (**)(uint64_t))(v0 + 56));
}

id sub_100030A00(uint64_t a1, char *a2)
{
  uint64_t v3 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter;
  id v4 = objc_allocWithZone((Class)MRURouteTextFormatter);
  uint64_t v5 = a2;
  id v6 = [v4 init];
  id v7 = [v6 configuration];
  [v7 setOmitGroupLeaderName:1];

  *(void *)&a2[v3] = v6;
  id v8 = &v5[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source;
  id v10 = v5;
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [self bannerSourceForDestination:0 forRequesterIdentifier:v11];

  *(void *)&v5[v9] = v12;
  *((void *)v8 + 1) = &off_10004A818;
  swift_unknownObjectWeakAssign();

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for BannerPresenter();
  return [super init];
}

uint64_t sub_100030B64()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100030BA4()
{
  sub_100030288(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

void sub_100030BB0(void *a1, uint64_t a2, void *a3)
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    id v6 = (void *)v5;
    _Block_copy(a3);
    id v7 = a1;
    id v8 = (char *)sub_10002F3F4();
    _Block_copy(a3);
    sub_1000347C8(v6, v8, (void (**)(const void *, void))a3);
    _Block_release(a3);
LABEL_5:

    goto LABEL_6;
  }
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClass();
  _Block_copy(a3);
  if (v9)
  {
    id v7 = a1;
    id v8 = (char *)sub_10002F29C();
    sub_10002D958(v9);
    goto LABEL_5;
  }
  uint64_t v10 = static os_log_type_t.error.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  NSString v11 = qword_10005E7C0;
  if (os_log_type_enabled((os_log_t)qword_10005E7C0, (os_log_type_t)v10))
  {
    id v12 = a1;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_unknownObjectRetain();
    sub_1000075A0(&qword_10005DD90);
    uint64_t v14 = String.init<A>(describing:)();
    sub_1000340A8(v14, v15, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v10, "Unsupported banner configuration: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    _Block_release(a3);
    return;
  }
LABEL_6:

  _Block_release(a3);
}

uint64_t sub_100030E30(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100030E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075A0((uint64_t *)&unk_10005DDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_100030F04()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView);
  if (v2)
  {
    uint64_t v3 = *(char **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView);
  }
  else
  {
    uint64_t v4 = v0;
    long long v5 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176);
    v16[10] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160);
    v16[11] = v5;
    v16[12] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192);
    uint64_t v17 = *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208);
    long long v6 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112);
    v16[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96);
    v16[7] = v6;
    long long v7 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144);
    v16[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128);
    v16[9] = v7;
    long long v8 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48);
    v16[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32);
    v16[3] = v8;
    long long v9 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80);
    v16[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64);
    v16[5] = v9;
    long long v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16);
    v16[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute);
    v16[1] = v10;
    id v11 = objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerTitleView());
    sub_1000075E4(v16);
    id v12 = sub_100005660((uint64_t)v16);
    uint64_t v13 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v12;
    uint64_t v3 = v12;

    uint64_t v2 = 0;
  }
  id v14 = v2;
  return v3;
}

id sub_100030FD8()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v1 = [self mru_suggestedRouteBannerSubtitleFont];
  [v0 setFont:v1];

  [v0 setTextAlignment:1];
  LODWORD(v2) = 1148846080;
  [v0 setContentCompressionResistancePriority:0 forAxis:v2];
  LODWORD(v3) = 1148846080;
  [v0 setContentCompressionResistancePriority:1 forAxis:v3];
  NSString v4 = String._bridgeToObjectiveC()();
  [v0 setText:v4];

  return v0;
}

char *sub_1000310D8(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView;
  id v4 = objc_allocWithZone((Class)MRUActivityRouteView);
  long long v5 = v1;
  id v6 = [v4 init];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v3] = v6;
  uint64_t v7 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton;
  id v8 = [self buttonWithType:0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v5[v7] = v8;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView] = 0;
  uint64_t v9 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView;
  *(void *)&v5[v9] = sub_100030FD8();
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_titleLabelMaxWidth] = 0x4066400000000000;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillViewMaxWidth] = 0x4072C00000000000;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_maxActivityRouteViewSide] = 0x4049000000000000;
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_waveformIconPointSizeRatio] = 0x3FEB333333333333;
  long long v10 = &v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  long long v12 = *(_OWORD *)(a1 + 176);
  long long v11 = *(_OWORD *)(a1 + 192);
  long long v13 = *(_OWORD *)(a1 + 160);
  *((void *)v10 + 26) = *(void *)(a1 + 208);
  *((_OWORD *)v10 + 11) = v12;
  *((_OWORD *)v10 + 12) = v11;
  *((_OWORD *)v10 + 10) = v13;
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v14 = *(_OWORD *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v10 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v10 + 9) = v16;
  *((_OWORD *)v10 + 6) = v15;
  *((_OWORD *)v10 + 7) = v14;
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 48);
  long long v19 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v10 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v10 + 5) = v19;
  *((_OWORD *)v10 + 2) = v18;
  *((_OWORD *)v10 + 3) = v17;
  long long v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)long long v10 = *(_OWORD *)a1;
  *((_OWORD *)v10 + 1) = v20;
  id v21 = objc_allocWithZone((Class)PLPillView);
  sub_1000075E4((void *)a1);
  id v22 = [v21 initWithLeadingAccessoryView:v6 trailingAccessoryView:v8];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView] = v22;

  v38.receiver = v5;
  v38.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  uint64_t v23 = (char *)[super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v24 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView;
  uint64_t v25 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView];
  objc_super v26 = v23;
  LODWORD(v27) = 1148846080;
  [v25 setContentCompressionResistancePriority:0 forAxis:v27];
  [v25 setMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  [v26 addSubview:v25];
  [*(id *)&v26[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton] _setTouchInsets:-8.0, -8.0, -8.0, -8.0];
  sub_1000314B0();
  uint64_t v28 = sub_100030F04();
  id v29 = [objc_allocWithZone((Class)PLPillContentItem) initWithText:0 style:1 accessoryView:v28];

  id v30 = [objc_allocWithZone((Class)PLPillContentItem) initWithText:0 style:1 accessoryView:*(void *)&v26[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView]];
  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_100037F40;
  *(void *)(v31 + 32) = v29;
  *(void *)(v31 + 40) = v30;
  v40[0] = v31;
  specialized Array._endMutation()();
  id v32 = *(void **)&v23[v24];
  sub_100008C38(0, (unint64_t *)&qword_10005D328);
  id v33 = v29;
  id v34 = v30;
  id v35 = v32;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v35 setCenterContentItems:isa animated:0];

  [*(id *)&v23[v24] setReferenceContentItemForIntrinsicContentSize:v33];
  sub_1000076D0((uint64_t)v40);
  sub_1000076F8((uint64_t)v40, (uint64_t)v39);
  sub_100031938((uint64_t)v39);
  sub_100007760((void *)a1);

  return v26;
}

void sub_1000314B0()
{
  id v1 = self;
  sub_1000075A0((uint64_t *)&unk_10005C490);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100038C30;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView];
  id v4 = [v3 topAnchor];
  id v5 = [v0 topAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];

  *(void *)(v2 + 32) = v6;
  id v7 = [v3 centerXAnchor];
  id v8 = [v0 centerXAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];

  *(void *)(v2 + 40) = v9;
  id v10 = [v3 widthAnchor];
  id v11 = [v10 constraintLessThanOrEqualToConstant:*(double *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillViewMaxWidth]];

  *(void *)(v2 + 48) = v11;
  specialized Array._endMutation()();
  sub_100008C38(0, (unint64_t *)&qword_10005C810);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 activateConstraints:isa];
}

id sub_1000316A4()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  [super layoutSubviews];
  [*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView] bounds];
  double v1 = *(double *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_maxActivityRouteViewSide];
  double v2 = ceil(CGRectGetHeight(v6) / 1.41421356);
  if (v2 >= v1) {
    double v2 = v1;
  }
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView];
  [v3 setSide:v2];
  return [v3 setSideConstraintActive:1];
}

void sub_100031938(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = sub_100030F04();
  uint64_t v5 = v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute;
  long long v6 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80);
  v87[4] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64);
  v87[5] = v6;
  long long v7 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48);
  v87[2] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32);
  v87[3] = v7;
  long long v8 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144);
  v87[8] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128);
  v87[9] = v8;
  long long v9 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112);
  v87[6] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96);
  v87[7] = v9;
  uint64_t v88 = *(void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208);
  v87[12] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192);
  long long v10 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160);
  v87[11] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176);
  v87[10] = v10;
  long long v11 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16);
  v87[0] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute);
  v87[1] = v11;
  long long v12 = &v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  long long v13 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 16];
  v85[0] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v85[1] = v13;
  long long v14 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 80];
  long long v16 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  long long v15 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 48];
  v85[4] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 64];
  v85[5] = v14;
  v85[2] = v16;
  v85[3] = v15;
  long long v17 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 144];
  long long v19 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 96];
  long long v18 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 112];
  v85[8] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 128];
  v85[9] = v17;
  v85[6] = v19;
  v85[7] = v18;
  long long v21 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 176];
  long long v20 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 192];
  long long v22 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 160];
  uint64_t v86 = *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 208];
  v85[11] = v21;
  v85[12] = v20;
  v85[10] = v22;
  long long v23 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 176];
  long long v24 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 192];
  long long v25 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 144];
  long long v99 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 160];
  long long v100 = v23;
  long long v101 = v24;
  uint64_t v102 = *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 208];
  long long v26 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 112];
  long long v27 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 128];
  long long v28 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 80];
  long long v95 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 96];
  long long v96 = v26;
  long long v97 = v27;
  long long v98 = v25;
  long long v29 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 48];
  long long v30 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 64];
  long long v31 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 16];
  long long v91 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  long long v92 = v29;
  long long v93 = v30;
  long long v94 = v28;
  long long v32 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 16];
  long long v89 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  long long v90 = v32;
  v103[1] = v31;
  v103[0] = v89;
  long long v33 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  long long v34 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 48];
  long long v35 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 64];
  v103[5] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 80];
  v103[4] = v35;
  v103[3] = v34;
  v103[2] = v33;
  long long v36 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 96];
  long long v37 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 112];
  long long v38 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 128];
  v103[9] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 144];
  v103[8] = v38;
  v103[7] = v37;
  v103[6] = v36;
  long long v39 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 160];
  long long v40 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 176];
  long long v41 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 192];
  uint64_t v104 = *(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 208];
  v103[12] = v41;
  v103[11] = v40;
  v103[10] = v39;
  memmove(&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute], (const void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute), 0xD8uLL);
  sub_1000075E4(v87);
  sub_1000075E4(v87);
  sub_1000075E4(v85);
  sub_100007760(v103);
  long long v42 = *((_OWORD *)v12 + 1);
  v83[0] = *(_OWORD *)v12;
  v83[1] = v42;
  long long v43 = *((_OWORD *)v12 + 5);
  long long v45 = *((_OWORD *)v12 + 2);
  long long v44 = *((_OWORD *)v12 + 3);
  v83[4] = *((_OWORD *)v12 + 4);
  v83[5] = v43;
  v83[2] = v45;
  v83[3] = v44;
  long long v46 = *((_OWORD *)v12 + 9);
  long long v48 = *((_OWORD *)v12 + 6);
  long long v47 = *((_OWORD *)v12 + 7);
  v83[8] = *((_OWORD *)v12 + 8);
  v83[9] = v46;
  v83[6] = v48;
  v83[7] = v47;
  long long v50 = *((_OWORD *)v12 + 11);
  long long v49 = *((_OWORD *)v12 + 12);
  long long v51 = *((_OWORD *)v12 + 10);
  uint64_t v84 = *((void *)v12 + 26);
  v83[11] = v50;
  v83[12] = v49;
  v83[10] = v51;
  sub_1000075E4(v83);
  LOBYTE(v12) = sub_10001B090((uint64_t)v83, (uint64_t)v85);
  sub_100007760(v83);
  if ((v12 & 1) == 0)
  {
    long long v78 = v99;
    long long v79 = v100;
    long long v80 = v101;
    uint64_t v81 = v102;
    long long v74 = v95;
    long long v75 = v96;
    long long v76 = v97;
    long long v77 = v98;
    v70[2] = v91;
    long long v71 = v92;
    long long v72 = v93;
    long long v73 = v94;
    v70[0] = v89;
    v70[1] = v90;
    nullsub_2(v70);
    sub_1000076F8((uint64_t)v70, (uint64_t)v82);
    sub_100006108((uint64_t)v82);
  }
  sub_100007760(v87);
  sub_100007760(v85);

  uint64_t v53 = *(void *)(v5 + 56);
  uint64_t v52 = *(void *)(v5 + 64);
  sub_1000076F8(a1, (uint64_t)v70);
  if (sub_100007850((uint64_t)v70) == 1)
  {
    if (!v52) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v55 = *((void *)&v71 + 1);
  uint64_t v54 = v72;
  swift_bridgeObjectRetain();
  if (!v52)
  {
    if (!v54) {
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  if (!v54) {
    goto LABEL_14;
  }
  if (v53 == v55 && v52 == v54)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v56 & 1) == 0)
  {
LABEL_14:
    unint64_t v57 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView);
    if (*(void *)(v5 + 64))
    {
      swift_bridgeObjectRetain();
      NSString v58 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v58 = 0;
    }
    [v57 setText:v58];
  }
LABEL_18:
  uint64_t v59 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView);
  int v60 = *(unsigned __int8 *)(v5 + 184);
  id v61 = self;
  long long v62 = &selRef_secondaryLabelColor;
  if (!v60) {
    long long v62 = &selRef_systemBlueColor;
  }
  id v63 = [v61 *v62];
  [v59 setTextColor:v63];

  uint64_t v64 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton);
  swift_bridgeObjectRetain();
  NSString v65 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v66 = [self systemImageNamed:v65];

  if (v66)
  {
    id v67 = [v66 imageWithSymbolConfiguration:*(void *)(v5 + 96)];
  }
  else
  {
    id v67 = 0;
  }
  [v64 setImage:v67 forState:0];

  id v68 = [v64 imageView];
  if (v68)
  {
    uint64_t v69 = v68;
    [v68 setContentMode:1];
  }
}

void sub_100031E10()
{
  uint64_t v1 = sub_100030F04();
  id v2 = [v0 traitCollection];
  id v3 = [v2 userInterfaceStyle];

  id v4 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
  uint64_t v5 = self;
  long long v6 = &selRef_blackColor;
  if (v3 != (id)1) {
    long long v6 = &selRef_whiteColor;
  }
  id v7 = [v5 *v6];
  [v4 setTintColor:v7];
}

id sub_100031F88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  return [super dealloc];
}

uint64_t type metadata accessor for SuggestedRouteBannerView()
{
  return self;
}

void sub_1000320AC()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView;
  id v2 = [objc_allocWithZone((Class)MRUActivityRouteView) init];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton;
  id v4 = [self buttonWithType:0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v0[v3] = v4;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView] = 0;
  uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView;
  *(void *)&v0[v5] = sub_100030FD8();
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_titleLabelMaxWidth] = 0x4066400000000000;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillViewMaxWidth] = 0x4072C00000000000;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_maxActivityRouteViewSide] = 0x4049000000000000;
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_waveformIconPointSizeRatio] = 0x3FEB333333333333;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id sub_100032448()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackdropSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for BackdropSceneDelegate()
{
  return self;
}

uint64_t sub_1000324B0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100032530()
{
  return static Published.subscript.setter();
}

void sub_1000325A4(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = a1;
    static os_log_type_t.default.getter();
    if (qword_10005C1A0 != -1) {
      swift_once();
    }
    os_log(_:dso:log:_:_:)();
    if (qword_10005C190 != -1) {
      swift_once();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    char v20 = 1;
    swift_retain();
    static Published.subscript.setter();
    type metadata accessor for BackdropViewController();
    id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v7 = (objc_class *)type metadata accessor for CoverSheetBackgroundViewController();
    long long v8 = (char *)objc_allocWithZone(v7);
    long long v9 = &v8[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap];
    *(void *)long long v9 = 0;
    v9[8] = 1;
    long long v10 = &v8[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap];
    *(void *)long long v10 = 0;
    v10[8] = 1;
    long long v11 = &v8[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap];
    *(void *)long long v11 = 0;
    v11[8] = 1;
    long long v12 = &v8[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable];
    *(_OWORD *)long long v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    *((void *)v12 + 4) = 0;
    *(void *)&v8[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController] = v6;
    v19.receiver = v8;
    v19.super_class = v7;
    id v13 = [super initWithNibName:0 bundle:0];
    id v14 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v4];
    [v14 setRootViewController:v13];
    [v14 makeKeyWindow];
    long long v15 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
    *(void *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window) = v14;
    id v16 = v14;

    if (qword_10005C1C0 != -1) {
      swift_once();
    }
    long long v17 = *(void **)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
    *(void *)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer) = v13;
    id v18 = v13;

    sub_1000291C4();
  }
}

uint64_t sub_100032870()
{
  if (qword_10005C1C0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  *(void *)(qword_10005E808 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer) = 0;

  sub_1000291C4();
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window) = 0;

  if (qword_10005C190 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.setter();
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  return os_log(_:dso:log:_:_:)();
}

void sub_1000329E8()
{
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  if (v2)
  {
    [v2 setHidden:0];
    uint64_t v3 = *(void **)(v0 + v1);
    if (v3)
    {
      id v4 = [v3 rootViewController];
      if (v4)
      {
        id v5 = v4;
        [v4 beginAppearanceTransition:1 animated:0];
      }
    }
  }
  id v6 = [*(id *)(v0 + v1) rootViewController];
  [v6 endAppearanceTransition];
}

void sub_100032B10()
{
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  if (v2)
  {
    id v3 = [v2 rootViewController];
    if (v3)
    {
      id v4 = v3;
      [v3 beginAppearanceTransition:0 animated:0];
    }
  }
  id v5 = [*(id *)(v0 + v1) rootViewController];
  [v5 endAppearanceTransition];
}

id sub_100032C28()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for MainServer()) init];
  qword_10005E810 = (uint64_t)result;
  return result;
}

id sub_100032D1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MainServer();
  return [super dealloc];
}

uint64_t type metadata accessor for MainServer()
{
  return self;
}

uint64_t sub_100032D84()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000203A8(v0, qword_10005DE90);
  sub_100017894(v0, (uint64_t)qword_10005DE90);
  if (qword_10005C1A8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10005E7C8;
  return Logger.init(_:)();
}

void sub_100032E10(char *a1, void *a2, void *a3, void (*a4)(void))
{
  id v6 = sub_100032E94(a2, a3);
  swift_getObjectType();
  sub_10002CDF8(v6, 1, a1);
  a4(0);
}

char *sub_100032E94(void *a1, void *a2)
{
  if (SBUIIsSystemApertureEnabled())
  {
    if ([a2 bannerType] == (id)2 || objc_msgSend(a2, "bannerType") == (id)3)
    {
      objc_allocWithZone((Class)type metadata accessor for SuggestedRouteConnectedViewController());
      sub_1000075E4(a1);
      id v5 = a2;
      id v6 = v2;
      return sub_100022938((uint64_t)a1, v5, (uint64_t)v2, (uint64_t)&off_10004A728);
    }
    else
    {
      long long v11 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter];
      objc_allocWithZone((Class)type metadata accessor for SuggestedRouteSystemApertureViewController());
      sub_1000075E4(a1);
      id v12 = a2;
      id v13 = v2;
      return sub_10001E964(a1, v12, v11, (uint64_t)v2, &off_10004A728);
    }
  }
  else
  {
    long long v8 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter];
    objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerViewController());
    sub_1000075E4(a1);
    id v9 = a2;
    long long v10 = v2;
    return sub_10001293C(a1, v9, v8, (uint64_t)v2, (uint64_t)&off_10004A728);
  }
}

uint64_t sub_100032FEC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = [a1 bannerType] == (id)1;
  char v5 = [a1 bannerType] == (id)4;
  if (v5) {
    char v6 = 1;
  }
  else {
    char v6 = v4;
  }
  uint64_t v83 = sub_100033974(v5, a1, v2, v4);
  uint64_t v8 = v7;
  char v84 = v6;
  long long v85 = sub_100033BC4(v6);
  if (qword_10005C1D8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100017894(v9, (uint64_t)qword_10005DE90);
  id v10 = a1;
  long long v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v81 = v8;
    uint64_t v13 = swift_slowAlloc();
    id v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412546;
    v99[0] = (uint64_t)v10;
    id v15 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v14 = v10;

    *(_WORD *)(v13 + 12) = 2112;
    id v16 = [v15 staticRequest];
    id v17 = v16;
    if (v16) {
      v99[0] = (uint64_t)v16;
    }
    else {
      v99[0] = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v14[1] = v17;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MRDRRC] configuration: %@ static request: %@", (uint8_t *)v13, 0x16u);
    sub_1000075A0(&qword_10005DBE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v8 = v81;
  }
  else
  {
  }
  id v18 = [v10 staticRequest];
  if (v18)
  {
    objc_super v19 = v18;
    switch((unint64_t)[v10 bannerType])
    {
      case 1uLL:
        int v30 = SBUIIsSystemApertureEnabled();
        BOOL v31 = v30 == 0;
        if (v30) {
          unint64_t v27 = 0xD000000000000014;
        }
        else {
          unint64_t v27 = 0xD000000000000020;
        }
        unint64_t v32 = 0x8000000100040700;
        unint64_t v33 = 0x8000000100040730;
        goto LABEL_27;
      case 4uLL:
        int v34 = SBUIIsSystemApertureEnabled();
        BOOL v31 = v34 == 0;
        if (v34) {
          unint64_t v27 = 1937075312;
        }
        else {
          unint64_t v27 = 0xD000000000000010;
        }
        unint64_t v32 = 0x8000000100040750;
        unint64_t v33 = 0xE400000000000000;
LABEL_27:
        if (v31) {
          unint64_t v29 = v32;
        }
        else {
          unint64_t v29 = v33;
        }
        break;
      default:
        id v26 = [v19 actionImageName];
        unint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v29 = v28;

        break;
    }
    id v35 = v10;
    swift_bridgeObjectRetain_n();
    id v36 = v35;
    long long v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.default.getter();
    unint64_t v80 = v29;
    unint64_t v82 = v27;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      long long v77 = (void *)swift_slowAlloc();
      v99[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315394;
      swift_bridgeObjectRetain();
      sub_1000340A8(v27, v29, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v39 + 12) = 2112;
      v87[0] = v36;
      long long v40 = v19;
      id v41 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v77 = v36;

      objc_super v19 = v40;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "[MRDRRC] actionImageName: %s config: %@", (uint8_t *)v39, 0x16u);
      sub_1000075A0(&qword_10005DBE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v42 = [v36 requestIdentifier];
    uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v78 = v44;
    uint64_t v79 = v43;

    id v45 = [v36 routeIdentifier];
    uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v75 = v47;
    uint64_t v76 = v46;

    id v48 = [v19 routeName];
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v74 = v50;

    id v51 = [v19 outputDeviceNames];
    uint64_t v52 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v53 = [v19 routeSymbolName];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v54 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v55 = [self systemImageNamed:v54];

    if (v55)
    {
      id v56 = [self labelColor];
      id v57 = [self configurationWithHierarchicalColor:v56];

      id v58 = [v55 imageByApplyingSymbolConfiguration:v57];
    }
    else
    {
      id v58 = 0;
    }
    id v59 = [v19 soloModelID];
    if (v59)
    {
      int v60 = v59;
      uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v63 = v62;
    }
    else
    {
      uint64_t v61 = 0;
      uint64_t v63 = 0;
    }
    id v64 = [v19 soloDeviceEnclosureColor];
    if (v64)
    {
      NSString v65 = v64;
      uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v68 = v67;
    }
    else
    {
      uint64_t v66 = 0;
      uint64_t v68 = 0;
    }
    id v69 = [v19 userSelectedDeviceNames];
    uint64_t v70 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    long long v71 = v19;
    uint64_t v72 = v70;

    v87[0] = v79;
    v87[1] = v78;
    v87[2] = v76;
    v87[3] = v75;
    v87[4] = v49;
    v87[5] = v74;
    v87[6] = v52;
    v87[7] = v83;
    v87[8] = v8;
    v87[9] = v58;
    v87[10] = v82;
    v87[11] = v80;
    v87[12] = v85;
    _OWORD v87[13] = 0;
    char v88 = 0;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v91 = v61;
    uint64_t v92 = v63;
    uint64_t v93 = v66;
    uint64_t v94 = v68;
    char v95 = v84;
    uint64_t v96 = 0;
    unint64_t v97 = 0xE000000000000000;
    uint64_t v98 = v72;
    nullsub_2(v87);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v20 = v10;
    long long v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      long long v23 = (uint8_t *)swift_slowAlloc();
      long long v24 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v23 = 138412290;
      v99[0] = (uint64_t)v20;
      long long v25 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v24 = v20;

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "[MRDRRC] configuration: %@ has static type but no static request", v23, 0xCu);
      sub_1000075A0(&qword_10005DBE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      char v20 = v85;
    }
    else
    {

      long long v21 = v20;
    }

    sub_1000076D0((uint64_t)v87);
  }
  sub_1000076F8((uint64_t)v87, (uint64_t)v99);
  return sub_1000076F8((uint64_t)v99, a2);
}

uint64_t sub_100033974(char a1, id a2, uint64_t a3, char a4)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v13 = self;
    if (a4) {
      id v14 = [v13 routeRecommendationAirPlayConnected];
    }
    else {
      id v14 = [v13 routeRecommendationTapToAirPlay];
    }
LABEL_14:
    id v11 = v14;
    goto LABEL_15;
  }
  id v5 = [a2 staticRequest];
  if (!v5)
  {
    if (qword_10005C1D8 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100017894(v15, (uint64_t)qword_10005DE90);
    id v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Attempted to create delta banner without providing existing device names. Fallback to TapToAirPlay string", v18, 2u);
      swift_slowDealloc();
    }

    id v14 = [self routeRecommendationTapToAirPlay];
    goto LABEL_14;
  }
  char v6 = v5;
  id v7 = [v5 userSelectedDeviceNames];

  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v10 = [v8 textForRouteNames:isa];

  if (!v10)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v11 = [self routeRecommendationAddWithFormattedExistingRouteName:v10];

LABEL_15:
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v19;
}

id sub_100033BC4(char a1)
{
  if (a1)
  {
    int v1 = SBUIIsSystemApertureEnabled();
    uint64_t v2 = self;
    id v3 = [v2 configurationWithTextStyle:UIFontTextStyleTitle1 scale:1];
    id v4 = [v2 configurationWithWeight:5];
    id v5 = [v3 configurationByApplyingConfiguration:v4];

    if (v1)
    {
      Class isa = (Class)[self systemCyanColor];
      id v7 = [v2 configurationWithHierarchicalColor:isa];
    }
    else
    {
      sub_1000075A0((uint64_t *)&unk_10005C490);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_100037F40;
      uint64_t v15 = self;
      *(void *)(v14 + 32) = [v15 systemWhiteColor];
      *(void *)(v14 + 40) = [v15 systemBlueColor];
      specialized Array._endMutation()();
      sub_100008C38(0, &qword_10005DEE0);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v7 = [v2 configurationWithPaletteColors:isa];
    }
    id v12 = v7;

    id v13 = [v5 configurationByApplyingConfiguration:v12];
  }
  else
  {
    uint64_t v8 = self;
    id v9 = [v8 configurationWithTextStyle:UIFontTextStyleTitle1 scale:1];
    id v10 = [v8 configurationWithWeight:5];
    id v5 = [v9 configurationByApplyingConfiguration:v10];

    id v11 = [self secondaryLabelColor];
    id v12 = [v8 configurationWithHierarchicalColor:v11];

    id v13 = [v5 configurationByApplyingConfiguration:v12];
  }
  id v16 = v13;

  return v16;
}

uint64_t sub_100033E94(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    type metadata accessor for BannerController();
    swift_dynamicCastClassUnconditional();
    sub_10002F478(a1, a2, 0x756F2064656D6974, 0xE900000000000074, 0, 0);
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100033F44()
{
}

id sub_100033F54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerPresenter();
  [super dealloc];
}

uint64_t type metadata accessor for SuggestedRouteBannerPresenter()
{
  return self;
}

uint64_t sub_100033FBC(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100033FCC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100034008(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100034030(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1000340A8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1000340A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10003417C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100015864((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100015864((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100014434((uint64_t)v12);
  return v7;
}

uint64_t sub_10003417C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100034338(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100034338(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000343D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000345B0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000345B0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000343D0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100034548(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100034548(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000075A0(&qword_10005DED8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000345B0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000075A0(&qword_10005DED8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **sub_100034700(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_100034710(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_1000347C8(void *a1, char *a2, void (**a3)(const void *, void))
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v72 = (char *)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v70 = v9;
  uint64_t v71 = v10;
  __chkstk_darwin(v9);
  id v69 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  long long v73 = a3;
  _Block_copy(a3);
  if (qword_10005C1D8 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = sub_100017894(v13, (uint64_t)qword_10005DE90);
  id v15 = a1;
  id v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v74 = a2;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v68 = v6;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v65 = swift_slowAlloc();
    *(void *)&long long v79 = v65;
    uint64_t v66 = v14;
    *(_DWORD *)uint64_t v19 = 136315138;
    v64[1] = v19 + 4;
    id v20 = [v15 requestIdentifier];
    long long v21 = v15;
    uint64_t v22 = v12;
    id v23 = v20;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v67 = v7;
    unint64_t v26 = v25;

    uint64_t v12 = v22;
    id v15 = v21;
    uint64_t v27 = v24;
    a2 = v74;
    *(void *)&v77[0] = sub_1000340A8(v27, v26, (uint64_t *)&v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v7 = v67;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "[MRDRRC] got request %s - will not try to resolve (not required)", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v68;
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100032FEC(v15, (uint64_t)v76);
  sub_1000076F8((uint64_t)v76, (uint64_t)v77);
  if (sub_100007850((uint64_t)v77) == 1)
  {
    id v28 = v15;
    unint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.default.getter();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v74 = a2;
      uint64_t v33 = v32;
      uint64_t v72 = (char *)swift_slowAlloc();
      *(void *)&long long v79 = v72;
      *(_DWORD *)uint64_t v33 = 136315394;
      LODWORD(v71) = v31;
      id v34 = [v28 routeIdentifier];
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v37 = v36;

      v75[0] = sub_1000340A8(v35, v37, (uint64_t *)&v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      id v38 = [v28 requestIdentifier];
      uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v41 = v40;

      v75[0] = sub_1000340A8(v39, v41, (uint64_t *)&v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v71, "[MRDRRC] couldn't generate suggested route %s for %s - will say it's invalidated", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v74;
      swift_slowDealloc();
    }
    else
    {
    }
    id v56 = &a2[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v57 = *((void *)v56 + 1);
      uint64_t ObjectType = swift_getObjectType();
      id v59 = [v28 requestIdentifier];
      uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v62 = v61;

      (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v57 + 8))(v60, v62, 0, ObjectType, v57);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    v73[2](v73, 0);
  }
  else
  {
    long long v89 = v77[10];
    long long v90 = v77[11];
    long long v91 = v77[12];
    uint64_t v92 = v78;
    long long v85 = v77[6];
    long long v86 = v77[7];
    long long v87 = v77[8];
    long long v88 = v77[9];
    long long v81 = v77[2];
    long long v82 = v77[3];
    long long v83 = v77[4];
    long long v84 = v77[5];
    long long v79 = v77[0];
    long long v80 = v77[1];
    sub_100008C38(0, (unint64_t *)&qword_10005D5B0);
    id v42 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v43 = swift_allocObject();
    long long v44 = v90;
    *(_OWORD *)(v43 + 184) = v89;
    *(_OWORD *)(v43 + 200) = v44;
    *(_OWORD *)(v43 + 216) = v91;
    long long v45 = v86;
    *(_OWORD *)(v43 + 120) = v85;
    *(_OWORD *)(v43 + 136) = v45;
    long long v46 = v88;
    *(_OWORD *)(v43 + 152) = v87;
    *(_OWORD *)(v43 + 168) = v46;
    long long v47 = v82;
    *(_OWORD *)(v43 + 56) = v81;
    *(_OWORD *)(v43 + 72) = v47;
    long long v48 = v84;
    *(_OWORD *)(v43 + 88) = v83;
    *(_OWORD *)(v43 + 104) = v48;
    long long v49 = v80;
    *(_OWORD *)(v43 + 24) = v79;
    *(void *)(v43 + 16) = a2;
    uint64_t v50 = v92;
    *(_OWORD *)(v43 + 40) = v49;
    *(void *)(v43 + 232) = v50;
    *(void *)(v43 + 240) = v15;
    *(void *)(v43 + 248) = sub_10001E6CC;
    *(void *)(v43 + 256) = v12;
    v75[4] = sub_1000350F8;
    v75[5] = v43;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 1107296256;
    v75[2] = sub_1000128F8;
    v75[3] = &unk_10004A968;
    id v51 = _Block_copy(v75);
    id v52 = v15;
    id v53 = a2;
    sub_100035224(v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100035124);
    swift_retain();
    swift_release();
    NSString v54 = v69;
    static DispatchQoS.unspecified.getter();
    v75[0] = _swiftEmptyArrayStorage;
    sub_10000E9E4();
    sub_1000075A0((uint64_t *)&unk_10005D540);
    sub_10000EA3C();
    id v55 = v72;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v51);

    sub_100035224(v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000352A0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v55, v6);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v54, v70);
  }
  return swift_release();
}

uint64_t sub_100035000()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100035038()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 264, 7);
}

void sub_1000350F8()
{
  sub_100032E10(*(char **)(v0 + 16), (void *)(v0 + 24), *(void **)(v0 + 240), *(void (**)(void))(v0 + 248));
}

uint64_t sub_10003510C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003511C()
{
  return swift_release();
}

uint64_t sub_100035124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v14 = a10;
    swift_bridgeObjectRetain();
    id v15 = a13;
    id v16 = a14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_100035224(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23],
    a1[24],
    a1[25],
    a1[26]);
  return a1;
}

uint64_t sub_1000352A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000353A4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1000353D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to acquire assertion: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t UUID.hashValue.getter()
{
  return UUID.hashValue.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t ActivityDescriptor.attributesData.getter()
{
  return ActivityDescriptor.attributesData.getter();
}

uint64_t type metadata accessor for ActivityDescriptor()
{
  return type metadata accessor for ActivityDescriptor();
}

uint64_t MetalContext.device.getter()
{
  return MetalContext.device.getter();
}

uint64_t static MetalContext.shared.getter()
{
  return static MetalContext.shared.getter();
}

uint64_t type metadata accessor for MetalContext()
{
  return type metadata accessor for MetalContext();
}

uint64_t dispatch thunk of Backdrop.CompositeRenderer.isBehindLyrics.setter()
{
  return dispatch thunk of Backdrop.CompositeRenderer.isBehindLyrics.setter();
}

uint64_t dispatch thunk of Backdrop.CompositeRenderer.setPlaceholderColor(_:animated:)()
{
  return dispatch thunk of Backdrop.CompositeRenderer.setPlaceholderColor(_:animated:)();
}

uint64_t Backdrop.CompositeRenderer.init(context:configuration:)()
{
  return Backdrop.CompositeRenderer.init(context:configuration:)();
}

uint64_t dispatch thunk of Backdrop.CompositeRenderer.setImage(_:animated:)()
{
  return dispatch thunk of Backdrop.CompositeRenderer.setImage(_:animated:)();
}

uint64_t type metadata accessor for Backdrop.CompositeRenderer()
{
  return type metadata accessor for Backdrop.CompositeRenderer();
}

uint64_t type metadata accessor for Backdrop.ViewConfiguration()
{
  return type metadata accessor for Backdrop.ViewConfiguration();
}

uint64_t type metadata accessor for MediaLiveActivityAttributes()
{
  return type metadata accessor for MediaLiveActivityAttributes();
}

uint64_t MediaLiveActivityAttributes.subscript.getter()
{
  return MediaLiveActivityAttributes.subscript.getter();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.subscript.getter()
{
  return dispatch thunk of ActivityScene.subscript.getter();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.setter()
{
  return dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t SceneSettingScopes.ActivitySettings.activityDescriptor.getter()
{
  return SceneSettingScopes.ActivitySettings.activityDescriptor.getter();
}

uint64_t SceneSettingScopes.ActivitySettings.activityIdentifier.getter()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t type metadata accessor for UITraitUserInterfaceStyle()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t Publishers.CombineLatest.init(_:_:)()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)()
{
  return Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.first()()
{
  return Publisher.first()();
}

uint64_t Publisher.filter(_:)()
{
  return Publisher.filter(_:)();
}

uint64_t Publisher.throttle<A>(for:scheduler:latest:)()
{
  return Publisher.throttle<A>(for:scheduler:latest:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t Publisher<>.assign<A>(to:on:)()
{
  return Publisher<>.assign<A>(to:on:)();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)Float._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

__C::CAFrameRateRange __swiftcall CAFrameRateRange.init(minimum:maximum:preferred:)(Swift::Float minimum, Swift::Float maximum, Swift::Float_optional *preferred)
{
  CAFrameRateRange.init(minimum:maximum:preferred:)(preferred, minimum, maximum);
  result.__preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static UISceneSessionRole.activityBanner.getter()
{
  return static UISceneSessionRole.activityBanner.getter();
}

uint64_t static UISceneSessionRole.activityListItem.getter()
{
  return static UISceneSessionRole.activityListItem.getter();
}

uint64_t UIView.registerForTraitChanges(_:target:action:)()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t UIView.unregisterForTraitChanges(_:)()
{
  return UIView.unregisterForTraitChanges(_:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)()
{
  return NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerTimeType.Stride()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

NSNumber __swiftcall UInt._bridgeToObjectiveC()()
{
  return (NSNumber)UInt._bridgeToObjectiveC()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _Pointer.debugDescription.getter()
{
  return _Pointer.debugDescription.getter();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MRGroupCompositionForMRGroupSessionRouteType()
{
  return _MRGroupCompositionForMRGroupSessionRouteType();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return _MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
}

uint64_t MRPrefersExpandedLockScreenPlatter()
{
  return _MRPrefersExpandedLockScreenPlatter();
}

uint64_t MRSetPrefersExpandedLockScreenPlatter()
{
  return _MRSetPrefersExpandedLockScreenPlatter();
}

uint64_t MSVBundleIDForAuditToken()
{
  return _MSVBundleIDForAuditToken();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return _SBUIIsSystemApertureEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIRectCenteredRect()
{
  return _UIRectCenteredRect();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _MRLogForCategory()
{
  return __MRLogForCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return _[a1 acquire];
}

id objc_msgSend_acquireBackgroundContentAssertionWithDefinition_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 acquireBackgroundContentAssertionWithDefinition:errorHandler:];
}

id objc_msgSend_artworkView(void *a1, const char *a2, ...)
{
  return _[a1 artworkView];
}

id objc_msgSend_backgroundContainer(void *a1, const char *a2, ...)
{
  return _[a1 backgroundContainer];
}

id objc_msgSend_backgroundContentAssertion(void *a1, const char *a2, ...)
{
  return _[a1 backgroundContentAssertion];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_delayAcquire(void *a1, const char *a2, ...)
{
  return _[a1 delayAcquire];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_handleBackgroundTapAt_(void *a1, const char *a2, ...)
{
  return [a1 handleBackgroundTapAt:];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:description:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_setBackgroundContentAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundContentAssertion:];
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setIdleTimerDisabled:];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}