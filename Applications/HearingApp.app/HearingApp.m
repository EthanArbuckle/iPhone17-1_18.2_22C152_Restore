uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100005718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000573C(uint64_t a1, double a2)
{
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)&a2;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v3);
}

void sub_1000057D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000057E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateLevel:*(double *)(a1 + 40)];
}

void sub_100005910(uint64_t a1, void *a2, unint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  UIUserInterfaceLayoutDirection v7 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v5 semanticContentAttribute]);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  double v12 = (double)a3;
  if (v7 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v13 = CGRectGetMinX(*(CGRect *)&v8)
  }
        + 20.0
        + v12 * *(double *)(*(void *)(a1 + 32) + 24)
        + v12 * *(double *)(*(void *)(a1 + 32) + 32);
  else {
    double v13 = CGRectGetMaxX(*(CGRect *)&v8)
  }
        + -20.0
        - v12 * *(double *)(*(void *)(a1 + 32) + 24)
        - v12 * *(double *)(*(void *)(a1 + 32) + 32);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v13, CGRectGetMidY(*(CGRect *)(a1 + 40)) + *(double *)(*(void *)(a1 + 32) + 24) * -0.5, *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 24), 20.0);
  id v14 = objc_claimAutoreleasedReturnValue();
  [v6 setPath:[v14 CGPath]];
}

void sub_100005AFC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(int *)(*(void *)(a1 + 32) + 8);
  int v4 = (int)(*(double *)(a1 + 40) * (double)(int)v3);
  unint64_t v5 = v3 - a3 + 1;
  id v6 = a2;
  UIUserInterfaceLayoutDirection v7 = +[UIColor systemOrangeColor];
  id v10 = v7;
  double v8 = 0.25;
  if (v5 < v4) {
    double v8 = 1.0;
  }
  id v9 = [v7 colorWithAlphaComponent:v8];
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v9, "CGColor"));
}

void sub_100005E80()
{
  v38.receiver = v0;
  v38.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  [super viewDidLoad];
  v1 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView];
  if (v1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v3 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v4 = String._bridgeToObjectiveC()();
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v3 localizedStringForKey:v4 value:0 table:v5];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v1 setAccessibilityLabel:v7];

    [v1 setTintColor:*(void *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor]];
    id v8 = v1;
    id v9 = [v0 view];
    if (!v9)
    {
      __break(1u);
      goto LABEL_14;
    }
    id v10 = v9;
    [v9 addSubview:v8];
  }
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView];
  if (v11)
  {
    uint64_t v12 = swift_getObjCClassFromMetadata();
    id v13 = [self bundleForClass:v12];
    NSString v14 = String._bridgeToObjectiveC()();
    NSString v15 = String._bridgeToObjectiveC()();
    id v16 = [v13 localizedStringForKey:v14 value:0 table:v15];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v11 setAccessibilityLabel:v17];

    [v11 setTintColor:*(void *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor]];
    id v18 = v11;
    id v19 = [v0 view];
    if (v19)
    {
      v20 = v19;
      [v19 addSubview:v18];

      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  v21 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView];
  if (!v21)
  {
LABEL_12:
    sub_1000063D0();
    return;
  }
  uint64_t v22 = swift_getObjCClassFromMetadata();
  id v23 = [self bundleForClass:v22];
  NSString v24 = String._bridgeToObjectiveC()();
  NSString v25 = String._bridgeToObjectiveC()();
  id v26 = [v23 localizedStringForKey:v24 value:0 table:v25];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v21 setAccessibilityLabel:v27];

  uint64_t v28 = *(void *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor];
  [v21 setTintColor:v28];
  id v29 = v21;
  [v29 frame];
  id v34 = [objc_allocWithZone((Class)LiveListenLevels) initWithFrame:1 inCompact:v30, v31, v32, v33];
  if (!v34)
  {
LABEL_11:

    goto LABEL_12;
  }
  v35 = v34;
  [v29 addSubview:v34];
  [v29 setTintColor:v28];
  id v36 = [v0 view];
  if (v36)
  {
    id v37 = v36;
    [v36 addSubview:v29];

    id v29 = v37;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1000063D0()
{
  v1 = v0;
  type metadata accessor for UIButton.Configuration();
  __chkstk_darwin();
  id v3 = (char *)v169 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_allocWithZone((Class)type metadata accessor for LiveListenLeadingView());
  sub_100008B34(0);
  uint64_t v5 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView;
  id v6 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView];
  *(void *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView] = v7;

  [*(id *)&v0[v5] setHidden:1];
  [*(id *)&v0[v5] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = *(id *)&v0[v5];
  id v9 = [v0 view];
  if (!v9)
  {
    __break(1u);
    goto LABEL_31;
  }
  id v10 = v9;
  [v9 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  [v8 setFrame:v12, v14, v16, v18];
  id v19 = *(void **)&v1[v5];
  type metadata accessor for LiveListenSystemApertureViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v21 = self;
  id v22 = v19;
  id v174 = v21;
  uint64_t v175 = ObjCClassFromMetadata;
  id v23 = [v21 bundleForClass:ObjCClassFromMetadata];
  NSString v24 = String._bridgeToObjectiveC()();
  NSString v25 = String._bridgeToObjectiveC()();
  id v26 = [v23 localizedStringForKey:v24 value:0 table:v25];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v22 setAccessibilityLabel:v27];

  uint64_t v28 = *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor];
  [*(id *)&v1[v5] setTintColor:v28];
  id v29 = [v1 view];
  if (!v29)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  double v30 = v29;
  v169[1] = v3;
  [v29 addSubview:*(void *)&v1[v5]];

  uint64_t v173 = sub_100009798(&qword_1000169B0);
  uint64_t v31 = swift_allocObject();
  long long v170 = xmmword_10000BBD0;
  *(_OWORD *)(v31 + 16) = xmmword_10000BBD0;
  id v32 = [*(id *)&v1[v5] leadingAnchor];
  id v33 = [v1 view];
  if (!v33)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v34 = v33;
  id v35 = [v33 leadingAnchor];

  id v36 = [v32 constraintEqualToAnchor:v35 constant:30.0];
  *(void *)(v31 + 32) = v36;
  id v37 = [*(id *)&v1[v5] topAnchor];
  id v38 = [v1 view];
  if (!v38)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v39 = v38;
  v40 = self;
  id v41 = [v39 SBUISA_systemApertureObstructedAreaLayoutGuide];

  id v42 = [v41 bottomAnchor];
  id v43 = [v37 constraintEqualToAnchor:v42];

  *(void *)(v31 + 40) = v43;
  aBlock[0] = v31;
  specialized Array._endMutation()();
  uint64_t v171 = sub_100009A24(0, &qword_1000169B8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v172 = v40;
  [v40 activateConstraints:isa];

  uint64_t v45 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel;
  [*(id *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v46 = *(id *)&v1[v45];
  id v47 = [v174 bundleForClass:v175];
  NSString v48 = String._bridgeToObjectiveC()();
  NSString v49 = String._bridgeToObjectiveC()();
  id v50 = [v47 localizedStringForKey:v48 value:0 table:v49];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v46 setText:v51];

  [*(id *)&v1[v45] setTextColor:v28];
  [*(id *)&v1[v45] setHidden:1];
  [*(id *)&v1[v45] sizeToFit];
  v52 = *(void **)&v1[v45];
  id v53 = objc_allocWithZone((Class)UIFontMetrics);
  id v54 = v52;
  id v55 = [v53 initForTextStyle:UIFontTextStyleBody];
  id v56 = [self preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  [v56 pointSize];
  if (v57 <= 20.0) {
    double v58 = v57;
  }
  else {
    double v58 = 20.0;
  }
  id v59 = [self systemFontOfSize:v58 weight:UIFontWeightMedium];
  id v60 = [v55 scaledFontForFont:v59];

  [v54 setFont:v60];
  [*(id *)&v1[v45] setAdjustsFontForContentSizeCategory:1];
  [*(id *)&v1[v45] setUserInteractionEnabled:0];
  id v61 = [v1 view];
  if (!v61) {
    goto LABEL_34;
  }
  v62 = v61;
  [v61 addSubview:*(void *)&v1[v45]];

  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = v170;
  id v64 = [*(id *)&v1[v45] topAnchor];
  id v65 = [v1 view];
  if (!v65)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v66 = v65;
  id v67 = [v65 SBUISA_systemApertureObstructedAreaLayoutGuide];

  id v68 = [v67 bottomAnchor];
  id v69 = [v64 constraintEqualToAnchor:v68];

  *(void *)(v63 + 32) = v69;
  id v70 = [*(id *)&v1[v45] leadingAnchor];
  id v71 = [v1 view];
  if (!v71)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v72 = v71;
  id v73 = [v71 leadingAnchor];

  id v74 = [v70 constraintEqualToAnchor:v73 constant:72.0];
  *(void *)(v63 + 40) = v74;
  aBlock[0] = v63;
  specialized Array._endMutation()();
  Class v75 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v172 activateConstraints:v75];

  [*(id *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v76 = [self sharedUtilities];
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 16) = v1;
  aBlock[4] = sub_1000099FC;
  aBlock[5] = v77;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007A04;
  aBlock[3] = &unk_100010910;
  v78 = _Block_copy(aBlock);
  v79 = v1;
  swift_release();
  [v76 requestCurrentRoutesWithCompletion:v78];
  _Block_release(v78);

  v80 = *(void **)&v79[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView];
  if (v80)
  {
    id v81 = v80;
    [v81 setTintColor:v28];
    [v81 setHidden:1];
    [v81 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v82 = v81;
    id v83 = [v79 view];
    if (v83)
    {
      v84 = v83;
      [v83 frame];
      double v86 = v85;
      double v88 = v87;
      double v90 = v89;
      double v92 = v91;

      [v82 setFrame:v86, v88, v90, v92];
      id v93 = v82;
      id v94 = [v174 bundleForClass:v175];
      NSString v95 = String._bridgeToObjectiveC()();
      NSString v96 = String._bridgeToObjectiveC()();
      id v97 = [v94 localizedStringForKey:v95 value:0 table:v96];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v98 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v93 setAccessibilityLabel:v98];

      id v99 = [v79 view];
      if (v99)
      {
        v100 = v99;
        [v99 addSubview:v93];

        id v101 = [v79 view];
        if (v101)
        {
          v102 = v101;
          [v101 bringSubviewToFront:v93];

          uint64_t v103 = swift_allocObject();
          *(_OWORD *)(v103 + 16) = v170;
          id v104 = [v93 trailingAnchor];
          id v105 = [v79 view];
          if (v105)
          {
            v106 = v105;
            id v107 = [v105 trailingAnchor];

            id v108 = [v104 constraintEqualToAnchor:v107 constant:-34.0];
            *(void *)(v103 + 32) = v108;
            id v109 = [v93 topAnchor];
            id v110 = [v79 view];
            if (v110)
            {
              v111 = v110;
              id v112 = [v110 topAnchor];

              id v113 = [v109 constraintEqualToAnchor:v112 constant:50.0];
              *(void *)(v103 + 40) = v113;
              aBlock[0] = v103;
              specialized Array._endMutation()();
              Class v114 = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [v172 activateConstraints:v114];

              goto LABEL_18;
            }
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            goto LABEL_44;
          }
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_18:
  v115 = self;
  id v116 = [self traitCollectionWithLegibilityWeight:1];
  id v117 = [v115 sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:v116];

  [v117 setBaseBackgroundColor:v28];
  [v117 setBaseForegroundColor:v28];
  id v118 = [v174 bundleForClass:v175];
  NSString v119 = String._bridgeToObjectiveC()();
  NSString v120 = String._bridgeToObjectiveC()();
  id v121 = [v118 localizedStringForKey:v119 value:0 table:v120];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v122 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v117 setTitle:v122];

  sub_100009A24(0, &qword_1000169C0);
  static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100009A24(0, &qword_1000169C8);
  *(void *)(swift_allocObject() + 16) = v79;
  v123 = v79;
  UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  uint64_t v124 = UIButton.init(configuration:primaryAction:)();
  uint64_t v125 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton;
  v126 = *(void **)&v123[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton];
  *(void *)&v123[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton] = v124;

  v127 = *(void **)&v123[v125];
  if (!v127) {
    goto LABEL_29;
  }
  [v127 setHidden:1];
  v128 = *(void **)&v123[v125];
  if (!v128) {
    goto LABEL_29;
  }
  [v128 setTranslatesAutoresizingMaskIntoConstraints:0];
  v129 = *(void **)&v123[v125];
  if (!v129) {
    goto LABEL_29;
  }
  id v130 = v129;
  id v131 = [v123 view];
  if (!v131) {
    goto LABEL_42;
  }
  v132 = v131;
  [v131 frame];
  double v134 = v133;
  double v136 = v135;
  double v138 = v137;
  double v140 = v139;

  [v130 setFrame:v134, v136, v138, v140];
  v141 = *(void **)&v123[v125];
  if (!v141) {
    goto LABEL_29;
  }
  id v142 = v141;
  id v143 = [v174 bundleForClass:v175];
  NSString v144 = String._bridgeToObjectiveC()();
  NSString v145 = String._bridgeToObjectiveC()();
  id v146 = [v143 localizedStringForKey:v144 value:0 table:v145];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v147 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v142 setAccessibilityLabel:v147];

  v148 = *(void **)&v123[v125];
  if (!v148) {
    goto LABEL_29;
  }
  id v149 = v148;
  id v150 = [v123 view];
  if (!v150) {
    goto LABEL_43;
  }
  v151 = v150;
  [v150 addSubview:v149];

  uint64_t v152 = swift_allocObject();
  *(_OWORD *)(v152 + 16) = xmmword_10000BBE0;
  id v153 = [v149 leadingAnchor];
  id v154 = [v123 view];
  if (!v154)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v155 = v154;
  id v156 = [v154 leadingAnchor];

  id v157 = [v153 constraintEqualToAnchor:v156 constant:20.0];
  *(void *)(v152 + 32) = v157;
  id v158 = [v149 trailingAnchor];
  id v159 = [v123 view];
  if (!v159)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v160 = v159;
  id v161 = [v159 trailingAnchor];

  id v162 = [v158 constraintEqualToAnchor:v161 constant:-20.0];
  *(void *)(v152 + 40) = v162;
  id v163 = [v149 bottomAnchor];
  id v164 = [v123 view];
  if (v164)
  {
    v165 = v164;
    id v166 = [v164 bottomAnchor];

    id v167 = [v163 constraintEqualToAnchor:v166 constant:-20.0];
    *(void *)(v152 + 48) = v167;
    aBlock[0] = v152;
    specialized Array._endMutation()();
    Class v168 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v172 activateConstraints:v168];

LABEL_29:
    return;
  }
LABEL_46:
  __break(1u);
}

uint64_t sub_1000076F8(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009A24(0, &qword_1000169D0);
  double v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_100009AA0;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000079C0;
  aBlock[3] = &unk_100010988;
  double v13 = _Block_copy(aBlock);
  id v14 = a2;
  swift_bridgeObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100009460(&qword_1000169D8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100009798(&qword_1000169E0);
  sub_100009AC8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

uint64_t sub_1000079C0(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100007A04(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_100007A88()
{
  id v0 = [self sharedInstance];
  if (v0)
  {
    id v1 = v0;
    [v0 stopLiveListen];
  }
  else
  {
    __break(1u);
  }
}

void sub_100007AF0(uint64_t a1)
{
  uint64_t v2 = v1;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_1000096A0((uint64_t)v37), (v5 & 1) != 0))
  {
    sub_100009844(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v38);
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_1000096E4((uint64_t)v37);
  if (!*((void *)&v39 + 1))
  {
    uint64_t v7 = &v38;
LABEL_20:
    sub_100009738((uint64_t)v7);
    return;
  }
  sub_100009A24(0, &qword_1000169A8);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  *(void *)&long long v38 = 0x6D614E6574756F52;
  *((void *)&v38 + 1) = 0xE900000000000065;
  id v6 = [0xD000000000000014 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v6)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_1000097DC((uint64_t)&v38, (uint64_t)v37);
  if (!v37[3])
  {

    uint64_t v7 = (long long *)v37;
    goto LABEL_20;
  }
  if (swift_dynamicCast())
  {
    uint64_t v8 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel;
    id v9 = *(id *)&v2[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel];
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v9 setText:v10];

    double v11 = *(void **)&v2[v8];
    uint64_t v12 = self;
    id v13 = v11;
    id v14 = [v12 grayColor];
    [v13 setTextColor:v14];

    [*(id *)&v2[v8] setHidden:1];
    [*(id *)&v2[v8] sizeToFit];
    double v15 = *(void **)&v2[v8];
    id v16 = objc_allocWithZone((Class)UIFontMetrics);
    id v17 = v15;
    id v18 = [v16 initForTextStyle:UIFontTextStyleFootnote];
    id v19 = [self preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
    [v19 pointSize];
    if (v20 <= 20.0) {
      double v21 = v20;
    }
    else {
      double v21 = 20.0;
    }
    id v22 = [self systemFontOfSize:v21 weight:UIFontWeightMedium];
    id v23 = [v18 scaledFontForFont:v22];

    [v17 setFont:v23];
    [*(id *)&v2[v8] setAdjustsFontForContentSizeCategory:1];
    [*(id *)&v2[v8] setUserInteractionEnabled:0];
    id v24 = [v2 view];
    if (v24)
    {
      NSString v25 = v24;
      [v24 addSubview:*(void *)&v2[v8]];

      sub_100009798(&qword_1000169B0);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_10000BBD0;
      id v27 = [*(id *)&v2[v8] leadingAnchor];
      id v28 = [v2 view];
      if (v28)
      {
        id v29 = v28;
        double v30 = self;
        id v31 = [v29 leadingAnchor];

        id v32 = [v27 constraintEqualToAnchor:v31 constant:72.0];
        *(void *)(v26 + 32) = v32;
        id v33 = [*(id *)&v2[v8] topAnchor];
        id v34 = [*(id *)&v2[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel] bottomAnchor];
        id v35 = [v33 constraintEqualToAnchor:v34 constant:2.0];

        *(void *)(v26 + 40) = v35;
        v37[0] = v26;
        specialized Array._endMutation()();
        sub_100009A24(0, &qword_1000169B8);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v30 activateConstraints:isa];

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
  }
}

void sub_10000807C(void *a1, double a2, double a3)
{
  v17.receiver = v3;
  v17.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  [super viewWillTransitionToSize:a1 withTransitionCoordinator:a2 a3];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  double v15 = sub_100009FA8;
  uint64_t v16 = v7;
  double v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  id v13 = sub_100008410;
  id v14 = &unk_1000109D8;
  uint64_t v8 = _Block_copy(&v11);
  id v9 = v3;
  swift_release();
  double v15 = (void (*)(uint64_t))nullsub_1;
  uint64_t v16 = 0;
  double v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  id v13 = sub_100008410;
  id v14 = &unk_100010A00;
  NSString v10 = _Block_copy(&v11);
  [a1 animateAlongsideTransition:v8 completion:v10];
  _Block_release(v10);
  _Block_release(v8);
}

void sub_1000081F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode);
  switch(v3)
  {
    case 4:
      char v5 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView);
      if (v5) {
        [v5 setHidden:1];
      }
      id v6 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView);
      if (v6) {
        [v6 setHidden:1];
      }
      uint64_t v7 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView);
      if (v7) {
        [v7 setHidden:1];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView) setHidden:0];
      uint64_t v8 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView);
      if (v8) {
        [v8 setHidden:0];
      }
      id v9 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton);
      if (v9) {
        [v9 setHidden:0];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel) setHidden:0];
      unint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel);
      break;
    case 3:
      double v11 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView);
      if (v11) {
        [v11 setHidden:0];
      }
      uint64_t v12 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView);
      if (v12) {
        [v12 setHidden:0];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView) setHidden:1];
      id v13 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView);
      if (v13) {
        [v13 setHidden:1];
      }
      id v14 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton);
      if (v14) {
        [v14 setHidden:1];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel) setHidden:1];
      unint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel);
      uint64_t v10 = 1;
      goto LABEL_27;
    case 2:
      unint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView);
      if (!v4) {
        return;
      }
      break;
    default:
      return;
  }
  uint64_t v10 = 0;
LABEL_27:

  [v4 setHidden:v10];
}

uint64_t sub_100008410(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_1000084FC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode] = 0;
  *(void *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_contentRole] = 2;
  *(void *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredLayoutMode] = 3;
  *(void *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_maximumLayoutMode] = 4;
  id v6 = (void *)SBUISystemApertureElementIdentifierLiveListen;
  *(void *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierLiveListen;
  uint64_t v7 = &v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_statusBarStyleOverridesToSuppress] = 1024;
  uint64_t v8 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredHeightForBottomSafeArea;
  id v9 = v3;
  id v10 = v6;
  *(double *)&v3[v8] = sub_100009B6C();
  uint64_t v11 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView;
  uint64_t v12 = (objc_class *)type metadata accessor for LiveListenLeadingView();
  id v13 = objc_allocWithZone(v12);
  sub_100008B34(1);
  *(void *)&v9[v11] = v14;
  uint64_t v15 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView;
  *(void *)&v9[v15] = [objc_allocWithZone((Class)type metadata accessor for LiveListenTrailingView()) init];
  uint64_t v16 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView;
  id v17 = objc_allocWithZone(v12);
  sub_100008B34(1);
  *(void *)&v9[v16] = v18;
  uint64_t v19 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView;
  *(void *)&v9[v19] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v20 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView;
  *(void *)&v9[v20] = [objc_allocWithZone((Class)LiveListenLevels) initWithFrame:0 inCompact:0.0 0.0 160.0 40.0];
  uint64_t v21 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel;
  *(void *)&v9[v21] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v22 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel;
  *(void *)&v9[v22] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v9[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton] = 0;
  uint64_t v23 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor;
  *(void *)&v9[v23] = [self systemOrangeColor];

  if (a2)
  {
    NSString v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v24 = 0;
  }
  v27.receiver = v9;
  v27.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  id v25 = [super initWithNibName:v24 bundle:a3];

  return v25;
}

id sub_1000087C4(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_contentRole] = 2;
  *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredLayoutMode] = 3;
  *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_maximumLayoutMode] = 4;
  uint64_t v3 = (void *)SBUISystemApertureElementIdentifierLiveListen;
  *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierLiveListen;
  unint64_t v4 = &v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier];
  *(void *)unint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_statusBarStyleOverridesToSuppress] = 1024;
  uint64_t v5 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredHeightForBottomSafeArea;
  id v6 = v1;
  id v7 = v3;
  *(double *)&v1[v5] = sub_100009B6C();
  uint64_t v8 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView;
  id v9 = (objc_class *)type metadata accessor for LiveListenLeadingView();
  id v10 = objc_allocWithZone(v9);
  sub_100008B34(1);
  *(void *)&v6[v8] = v11;
  uint64_t v12 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView;
  *(void *)&v6[v12] = [objc_allocWithZone((Class)type metadata accessor for LiveListenTrailingView()) init];
  uint64_t v13 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView;
  id v14 = objc_allocWithZone(v9);
  sub_100008B34(1);
  *(void *)&v6[v13] = v15;
  uint64_t v16 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView;
  *(void *)&v6[v16] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v17 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView;
  *(void *)&v6[v17] = [objc_allocWithZone((Class)LiveListenLevels) initWithFrame:0 inCompact:0.0, 0.0, 160.0, 40.0];
  uint64_t v18 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel;
  *(void *)&v6[v18] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v19 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel;
  *(void *)&v6[v19] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v6[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton] = 0;
  uint64_t v20 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor;
  *(void *)&v6[v20] = [self systemOrangeColor];

  v23.receiver = v6;
  v23.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  id v21 = [super initWithCoder:a1];

  return v21;
}

id sub_100008A18()
{
  return sub_100008FD0(type metadata accessor for LiveListenSystemApertureViewController);
}

uint64_t type metadata accessor for LiveListenSystemApertureViewController()
{
  return self;
}

void sub_100008B34(char a1)
{
  uint64_t v3 = (double *)&v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_compressedElementSize];
  double v4 = nullsub_1(14.3, 19.0);
  double v6 = v5;
  *uint64_t v3 = v4;
  v3[1] = v5;
  id v7 = (double *)&v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_customElementSize];
  double v8 = nullsub_1(28.0, 37.7);
  *id v7 = v8;
  v7[1] = v9;
  if ((a1 & 1) == 0)
  {
    double v4 = v8;
    double v6 = v9;
  }
  v20.receiver = v1;
  v20.super_class = (Class)type metadata accessor for LiveListenLeadingView();
  id v10 = [super initWithFrame:0.0, 0.0, v4, v6];
  type metadata accessor for LiveListenSystemApertureViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v12 = self;
  id v13 = v10;
  id v14 = [v12 bundleForClass:ObjCClassFromMetadata];
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [self imageNamed:v15 inBundle:v14];

  if (v16)
  {
    id v17 = [v16 imageWithRenderingMode:2];

    id v18 = [objc_allocWithZone((Class)UIImageView) initWithImage:v17];
    [v18 setFrame:0.0, 0.0, v4, v6];
    id v19 = [self systemOrangeColor];
    [v18 setTintColor:v19];

    [v13 addSubview:v18];
  }
  else
  {
    __break(1u);
  }
}

id sub_100008D50(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_compressedElementSize];
  *(double *)uint64_t v3 = nullsub_1(14.3, 19.0);
  *((void *)v3 + 1) = v4;
  double v5 = &v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_customElementSize];
  *(double *)double v5 = nullsub_1(28.0, 37.7);
  *((void *)v5 + 1) = v6;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for LiveListenLeadingView();
  [super initWithCoder:a1];

  return v7;
}

id sub_100008E68()
{
  return sub_100008FD0(type metadata accessor for LiveListenLeadingView);
}

uint64_t type metadata accessor for LiveListenLeadingView()
{
  return self;
}

id sub_100008FB8()
{
  return sub_100008FD0(type metadata accessor for LiveListenTrailingView);
}

id sub_100008FD0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for LiveListenTrailingView()
{
  return self;
}

__n128 sub_10000902C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000903C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000905C(uint64_t result, int a2, int a3)
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

void type metadata accessor for _UIStatusBarStyleOverrides(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

void sub_1000090E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100009130(uint64_t a1, uint64_t a2)
{
  return sub_1000094C0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100009148(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000091C0(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100009240@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_100009284@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100009294(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000092A0@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000092E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009314(uint64_t a1)
{
  uint64_t v2 = sub_100009460(&qword_100016990, type metadata accessor for SBUISystemApertureElementIdentifier);
  uint64_t v3 = sub_100009460(&qword_100016998, type metadata accessor for SBUISystemApertureElementIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000093D0()
{
  return sub_100009460(&qword_100016978, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100009418()
{
  return sub_100009460(&qword_100016980, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100009460(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000094A8(uint64_t a1, uint64_t a2)
{
  return sub_1000094C0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000094C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100009504()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100009558()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000095CC()
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

uint64_t sub_100009658()
{
  return sub_100009460(&qword_100016988, type metadata accessor for SBUISystemApertureElementIdentifier);
}

unint64_t sub_1000096A0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000098A0(a1, v4);
}

uint64_t sub_1000096E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009738(uint64_t a1)
{
  uint64_t v2 = sub_100009798(&qword_1000169A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009798(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000097DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009798(&qword_1000169A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000098A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100009968(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000096E4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100009968(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000099C4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000099FC(uint64_t a1)
{
  return sub_1000076F8(a1, *(void **)(v1 + 16));
}

uint64_t sub_100009A04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009A14()
{
  return swift_release();
}

void sub_100009A1C()
{
}

uint64_t sub_100009A24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009A60()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100009AA0()
{
  sub_100007AF0(*(void *)(v0 + 24));
}

unint64_t sub_100009AC8()
{
  unint64_t result = qword_1000169E8;
  if (!qword_1000169E8)
  {
    sub_100009B24(&qword_1000169E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000169E8);
  }
  return result;
}

uint64_t sub_100009B24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

double sub_100009B6C()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  if (v2 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v4 == v5) {
    goto LABEL_13;
  }
  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_14:

    *(double *)&uint64_t v18 = 160.0;
    return *(double *)&v18;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v11)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_14;
  }
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  if (v14 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v16 == v17) {
    goto LABEL_13;
  }
  char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_14;
  }
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;
  if (v21 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v23 == v24) {
    goto LABEL_13;
  }
  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_14;
  }
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;
  if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
LABEL_24:

    uint64_t v31 = 0x200000000000;
LABEL_25:
    uint64_t v18 = v31 & 0xFFFFFFFFFFFFLL | 0x4062000000000000;
    return *(double *)&v18;
  }
  char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_24;
  }
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v34 = v33;
  if (v32 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v34 == v35)
  {
    swift_bridgeObjectRelease_n();
LABEL_30:

    uint64_t v31 = 0xC00000000000;
    goto LABEL_25;
  }
  char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_30;
  }
  uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v39 = v38;
  if (v37 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v39 == v40)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:

    *(double *)&uint64_t v18 = 140.0;
    return *(double *)&v18;
  }
  char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v41) {
    goto LABEL_35;
  }
  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v44 = v43;
  if (v42 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v44 == v45)
  {
    double v49 = 130.0;
  }
  else
  {
    char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
    double v47 = 120.0;
    if (v46) {
      double v47 = 130.0;
    }
    double v49 = v47;
  }
  id v48 = v1;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v49;
}

void sub_100009FA8(uint64_t a1)
{
  sub_1000081F0(a1, *(void *)(v1 + 16));
}

void sub_10000A09C(void *a1, uint64_t a2, void *a3, const char *a4)
{
  id v10 = a3;
  id v6 = a1;
  char v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, a4, v9, 2u);
    swift_slowDealloc();
  }
}

id sub_10000A244()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingSessionSceneDelegate();
  return [super dealloc];
}

uint64_t sub_10000A2FC()
{
  return type metadata accessor for HearingSessionSceneDelegate();
}

uint64_t type metadata accessor for HearingSessionSceneDelegate()
{
  uint64_t result = qword_100016AE0;
  if (!qword_100016AE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A350()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000A3F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A4C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009844((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100009844((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AD58((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A4C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000A680(a5, a6);
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

uint64_t sub_10000A680(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A718(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A8F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A8F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A718(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A890(v2, 0);
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

void *sub_10000A890(uint64_t a1, uint64_t a2)
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
  sub_100009798((uint64_t *)&unk_100016AF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A8F8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009798((uint64_t *)&unk_100016AF0);
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
  char v13 = a4 + 32;
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

void sub_10000AA48(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for ActivityScene();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    size_t v5 = (void *)v4;
    id v6 = a1;
    int64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      int64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)int64_t v9 = 136315138;
      id v10 = [v5 description];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;

      sub_10000A3F0(v11, v13, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "SessionSceneDelegate: Connecting session scene: %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v1;
      swift_slowDealloc();
    }
    else
    {
    }
    if (objc_msgSend(v5, "SBUI_isHostedBySystemAperture"))
    {
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Returning system aperture view controller", v18, 2u);
        swift_slowDealloc();
      }

      uint64_t v19 = OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider;
      [*(id *)(v2 + OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider) loadViewIfNeeded];
      [v5 setSystemApertureElementViewControllerProvider:*(void *)(v2 + v19)];
    }
  }
  else
  {
    oslog = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "SessionSceneDelegate: Received a UIScene that is not of type SessionScene.", v15, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10000AD58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000ADAC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRoundedRect:cornerRadius:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_levels(void *a1, const char *a2, ...)
{
  return _[a1 levels];
}

id objc_msgSend_registerListener_forLiveListenLevelsHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerListener:forLiveListenLevelsHandler:];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateClass:];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return [a1 setFillColor:];
}

id objc_msgSend_setLevels_(void *a1, const char *a2, ...)
{
  return [a1 setLevels:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_updateLevel_(void *a1, const char *a2, ...)
{
  return [a1 updateLevel:];
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirectionForSemanticContentAttribute:];
}