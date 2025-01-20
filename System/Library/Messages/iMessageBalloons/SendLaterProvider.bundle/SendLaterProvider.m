uint64_t sub_516C()
{
  uint64_t v0;

  v0 = sub_B790();
  sub_7704(v0, qword_169B0);
  sub_76CC(v0, (uint64_t)qword_169B0);
  return sub_B780();
}

void sub_54CC(void *a1)
{
  uint64_t v2 = v1;
  v3 = a1;
  uint64_t v4 = OBJC_IVAR___SendLaterRootViewController_context;
  v5 = *(void **)(v2 + OBJC_IVAR___SendLaterRootViewController_context);
  *(void *)(v2 + OBJC_IVAR___SendLaterRootViewController_context) = a1;
  id v9 = a1;
  if (v3)
  {
    if (!v5) {
      goto LABEL_5;
    }
    sub_B970();
    id v6 = v5;
    id v7 = v9;
    char v8 = sub_B980();

    if (v8) {
      goto LABEL_7;
    }
    v3 = *(void **)(v2 + v4);
    if (v3) {
LABEL_5:
    }
      [v3 addObserver:v2];
  }
  id v6 = v5;
LABEL_7:
}

uint64_t sub_5690(uint64_t a1)
{
  sub_760C(a1, (uint64_t)v8, &qword_166E8);
  if (v9)
  {
    sub_B970();
    if (swift_dynamicCast())
    {
      uint64_t v2 = v7;
      sub_54CC(v7);
LABEL_10:

      return sub_7670(a1, &qword_166E8);
    }
  }
  else
  {
    sub_7670((uint64_t)v8, &qword_166E8);
  }
  if (*(void *)(a1 + 24))
  {
    if (qword_164E0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_B790();
    sub_76CC(v3, (uint64_t)qword_169B0);
    uint64_t v2 = sub_B770();
    os_log_type_t v4 = sub_B920();
    if (os_log_type_enabled(v2, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v2, v4, "Could not set pluginContext, newValue is not of expected type CKSendLaterPluginInfo", v5, 2u);
      swift_slowDealloc();
    }
    goto LABEL_10;
  }
  return sub_7670(a1, &qword_166E8);
}

char *sub_586C(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_58A0(a1);
}

char *sub_58A0(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_presentationViewController] = 0;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_sendDelegate] = 0;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_balloonPlugin] = 0;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_isiMessage] = 0;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_conversationID] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_wantsDarkUI] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_wantsOpaqueUI] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_supportsQuickView] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_shouldSuppressEntryView] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_isPrimaryViewController] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_isDismissing] = 0;
  v1[OBJC_IVAR___SendLaterRootViewController_mayBeKeptInViewHierarchy] = 1;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_context] = 0;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_timePickerViewModel] = 0;
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_cancellables] = &_swiftEmptySetSingleton;
  v1[OBJC_IVAR___SendLaterRootViewController_shouldShowChatChrome] = 1;
  v1[OBJC_IVAR___SendLaterRootViewController_inExpandedPresentation] = 1;
  v1[OBJC_IVAR___SendLaterRootViewController_inFullScreenModalPresentation] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SendLaterRootViewController();
  id v3 = (char *)objc_msgSendSuper2(&v6, "initWithNibName:bundle:", 0, 0);
  os_log_type_t v4 = *(void **)&v3[OBJC_IVAR___SendLaterRootViewController_balloonPlugin];
  *(void *)&v3[OBJC_IVAR___SendLaterRootViewController_balloonPlugin] = a1;

  return v3;
}

void sub_5A50()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_75C0(&qword_16728);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v73 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_75C0(&qword_166D8);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_B6F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v71 - v13;
  v15 = (objc_class *)type metadata accessor for SendLaterRootViewController();
  v75.receiver = v0;
  v75.super_class = v15;
  objc_msgSendSuper2(&v75, "viewDidLoad");
  uint64_t v16 = OBJC_IVAR___SendLaterRootViewController_context;
  v17 = *(void **)&v0[OBJC_IVAR___SendLaterRootViewController_context];
  if (v17) {
    goto LABEL_7;
  }
  uint64_t v72 = v3;
  if (qword_164E0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_B790();
  sub_76CC(v18, (uint64_t)qword_169B0);
  v19 = sub_B770();
  os_log_type_t v20 = sub_B920();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v71 = v2;
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_0, v19, v20, "Did not have a plugin context for tracking the selected date. We'll set the current date on the view model as a fallback, but this is programmer error!", v21, 2u);
    uint64_t v2 = v71;
    swift_slowDealloc();
  }

  v17 = *(void **)&v1[v16];
  uint64_t v3 = v72;
  if (v17)
  {
LABEL_7:
    id v22 = [v17 selectedDate];
    sub_B6C0();

    v23 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v23(v7, v12, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v23(v14, v7, v8);
      goto LABEL_11;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_B6E0();
  sub_7670((uint64_t)v7, &qword_166D8);
LABEL_11:
  v24 = v73;
  type metadata accessor for TimePickerViewModel();
  swift_allocObject();
  uint64_t v25 = sub_8CA0(v14);
  swift_beginAccess();
  sub_75C0(&qword_16730);
  sub_B7D0();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_7F98(&qword_16738, &qword_16728);
  sub_B810();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v24, v2);
  swift_beginAccess();
  sub_B7A0();
  swift_endAccess();
  swift_release();
  *(void *)&v1[OBJC_IVAR___SendLaterRootViewController_timePickerViewModel] = v25;
  swift_retain();
  swift_release();
  id v26 = objc_allocWithZone((Class)type metadata accessor for TimePickerView());
  uint64_t v27 = swift_retain();
  v28 = sub_9AEC(v27);
  v29 = self;
  v30 = v28;
  id v31 = [v29 clearColor];
  [v30 setBackgroundColor:v31];

  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v32 = [v1 view];
  if (!v32)
  {
    __break(1u);
    goto LABEL_20;
  }
  v33 = v32;
  [v32 addSubview:v30];

  id v34 = [v1 view];
  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v35 = v34;
  id v36 = [v29 systemGray4Color];
  [v35 setBackgroundColor:v36];

  v37 = v30;
  id v38 = [v1 view];
  if (!v38)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v39 = v38;
  [v38 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

  objc_msgSend(v37, "setFrame:", v41, v43, v45, v47);
  sub_75C0(&qword_16740);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_C160;
  id v49 = [v37 leadingAnchor];
  id v50 = [v1 view];
  if (!v50)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v51 = v50;
  id v52 = [v50 leadingAnchor];

  id v53 = [v49 constraintEqualToAnchor:v52];
  *(void *)(v48 + 32) = v53;
  id v54 = [v37 trailingAnchor];
  id v55 = [v1 view];
  if (!v55)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v56 = v55;
  id v57 = [v55 trailingAnchor];

  id v58 = [v54 constraintEqualToAnchor:v57];
  *(void *)(v48 + 40) = v58;
  id v59 = [v37 topAnchor];
  id v60 = [v1 view];
  if (!v60)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v61 = v60;
  id v62 = [v60 topAnchor];

  id v63 = [v59 constraintEqualToAnchor:v62];
  *(void *)(v48 + 48) = v63;
  id v64 = [v37 bottomAnchor];
  id v65 = [v1 view];
  if (v65)
  {
    v66 = v65;
    v67 = self;
    id v68 = [v66 bottomAnchor];

    id v69 = [v64 constraintEqualToAnchor:v68];
    *(void *)(v48 + 56) = v69;
    uint64_t v74 = v48;
    sub_B900();
    sub_7FDC(0, &qword_16748);
    Class isa = sub_B8E0().super.isa;
    swift_bridgeObjectRelease();
    [v67 activateConstraints:isa];
    swift_release();

    return;
  }
LABEL_25:
  __break(1u);
}

void sub_6340()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR___SendLaterRootViewController_context);
    id v3 = v2;

    if (v2)
    {
      Class isa = sub_B6B0().super.isa;
      [v3 setSelectedDate:isa];
    }
  }
}

void sub_6420()
{
  uint64_t v1 = sub_B820();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_B840();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (objc_class *)type metadata accessor for SendLaterRootViewController();
  v67.receiver = v0;
  v67.super_class = v9;
  objc_msgSendSuper2(&v67, "viewDidLayoutSubviews");
  id v10 = [v0 view];
  if (!v10)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  id v12 = [v10 window];

  if (!v12) {
    id v12 = [self mainScreen];
  }
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  id v21 = [v0 view];
  if (!v21) {
    goto LABEL_19;
  }
  id v22 = v21;
  [v21 frame];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v69.origin.x = v24;
  v69.origin.y = v26;
  v69.size.width = v28;
  v69.size.height = v30;
  double Height = CGRectGetHeight(v69);
  v70.origin.x = v14;
  v70.origin.y = v16;
  v70.size.width = v18;
  v70.size.height = v20;
  if (CGRectGetHeight(v70) * 0.5 >= Height) {
    return;
  }
  uint64_t v58 = v5;
  if (qword_164E0 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_B790();
  sub_76CC(v32, (uint64_t)qword_169B0);
  id v33 = v0;
  id v34 = sub_B770();
  os_log_type_t v35 = sub_B930();
  BOOL v36 = os_log_type_enabled(v34, v35);
  v37 = &stru_15000;
  uint64_t v59 = v2;
  uint64_t v57 = v6;
  if (v36)
  {
    id v38 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)id v38 = 136315138;
    id v39 = [v33 sheetPresentationController];
    double v40 = v39;
    uint64_t v56 = v1;
    if (v39)
    {
      id v41 = [v39 detents];

      sub_7FDC(0, &qword_16718);
      double v40 = (void *)sub_B8F0();
    }
    uint64_t v66 = (uint64_t)v40;
    sub_75C0(&qword_166F0);
    uint64_t v42 = sub_B8A0();
    uint64_t v66 = sub_7850(v42, v43, &aBlock);
    sub_B990();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v34, v35, "Detected full-screen presentation of time picker. Dismissing. Detents: %s", v38, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v56;
    v37 = &stru_15000;
  }
  else
  {
  }
  id v44 = [self sharedInstance];
  if (!v44)
  {
LABEL_20:
    __break(1u);
    return;
  }
  double v45 = v44;
  NSString v46 = sub_B880();
  NSString v47 = sub_B880();
  uint64_t aBlock = 0x3A73746E65746544;
  unint64_t v61 = 0xE900000000000020;
  id v48 = [v33 v37[235].attr];
  id v49 = v48;
  if (v48)
  {
    id v50 = [v48 detents];

    sub_7FDC(0, &qword_16718);
    id v49 = (void *)sub_B8F0();
  }
  uint64_t v66 = (uint64_t)v49;
  sub_75C0(&qword_166F0);
  v68._countAndFlagsBits = sub_B8B0();
  sub_B8C0(v68);
  swift_bridgeObjectRelease();
  NSString v51 = sub_B880();
  swift_bridgeObjectRelease();
  [v45 forceAutoBugCaptureWithSubType:v46 errorPayload:0 type:v47 context:v51];

  sub_7FDC(0, &qword_166F8);
  id v52 = (void *)sub_B950();
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = v33;
  id v64 = sub_77A0;
  uint64_t v65 = v53;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  unint64_t v61 = 1107296256;
  id v62 = sub_6CB8;
  id v63 = &unk_10760;
  id v54 = _Block_copy(&aBlock);
  id v55 = v33;
  swift_release();
  sub_B830();
  uint64_t aBlock = (uint64_t)&_swiftEmptyArrayStorage;
  sub_77C0(&qword_16700, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_75C0(&qword_16708);
  sub_7F98(&qword_16710, &qword_16708);
  sub_B9C0();
  sub_B960();
  _Block_release(v54);

  (*(void (**)(char *, uint64_t))(v59 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v8, v58);
}

id sub_6BB0(uint64_t a1)
{
  if (qword_164E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_B790();
  sub_76CC(v2, (uint64_t)qword_169B0);
  uint64_t v3 = sub_B770();
  os_log_type_t v4 = sub_B940();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Dismissing programmatically due to a full-screen presentation.", v5, 2u);
    swift_slowDealloc();
  }

  id result = *(id *)(a1 + OBJC_IVAR___SendLaterRootViewController_sendDelegate);
  if (result)
  {
    return [result dismiss];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_6CB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_6D64(void *a1, uint64_t a2, uint64_t a3, const char **a4, char a5)
{
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for SendLaterRootViewController();
  uint64_t v8 = *a4;
  uint64_t v9 = (char *)v11.receiver;
  objc_msgSendSuper2(&v11, v8, a3);
  id v10 = *(void **)&v9[OBJC_IVAR___SendLaterRootViewController_context];
  if (v10) {
    objc_msgSend(v10, "setShowingDatePicker:", a5 & 1, v11.receiver, v11.super_class);
  }
}

uint64_t sub_6E80(void *a1)
{
  uint64_t v3 = sub_B6F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v42 = &v36[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v8 = &v36[-v7];
  uint64_t v9 = sub_75C0(&qword_166D0);
  __chkstk_darwin(v9);
  objc_super v11 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_75C0(&qword_166D8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  CGFloat v16 = &v36[-v15];
  uint64_t result = __chkstk_darwin(v14);
  CGFloat v20 = &v36[-v18];
  id v21 = *(void **)(v1 + OBJC_IVAR___SendLaterRootViewController_context);
  id v43 = a1;
  if (v21) {
    BOOL v22 = v21 == a1;
  }
  else {
    BOOL v22 = 0;
  }
  if (v22)
  {
    uint64_t v40 = v1;
    id v41 = v8;
    uint64_t v38 = v19;
    uint64_t v39 = OBJC_IVAR___SendLaterRootViewController_timePickerViewModel;
    if (*(void *)(v1 + OBJC_IVAR___SendLaterRootViewController_timePickerViewModel))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_B7E0();
      swift_release();
      swift_release();
      swift_release();
      double v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
      v23(v20, 0, 1, v3);
    }
    else
    {
      double v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
      v23(&v36[-v18], 1, 1, v3);
    }
    id v24 = [v43 selectedDate];
    sub_B6C0();

    v23(v16, 0, 1, v3);
    uint64_t v25 = (uint64_t)&v11[*(int *)(v9 + 48)];
    sub_760C((uint64_t)v20, (uint64_t)v11, &qword_166D8);
    sub_760C((uint64_t)v16, v25, &qword_166D8);
    CGFloat v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    if (v26((uint64_t)v11, 1, v3) == 1)
    {
      sub_7670((uint64_t)v16, &qword_166D8);
      sub_7670((uint64_t)v20, &qword_166D8);
      int v27 = v26(v25, 1, v3);
      uint64_t v28 = v4;
      if (v27 == 1) {
        return sub_7670((uint64_t)v11, &qword_166D8);
      }
    }
    else
    {
      uint64_t v29 = v38;
      sub_760C((uint64_t)v11, v38, &qword_166D8);
      if (v26(v25, 1, v3) != 1)
      {
        uint64_t v32 = v41;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 32))(v41, v25, v3);
        sub_77C0(&qword_166E0, (void (*)(uint64_t))&type metadata accessor for Date);
        int v37 = sub_B870();
        id v33 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
        v33(v32, v3);
        sub_7670((uint64_t)v16, &qword_166D8);
        uint64_t v34 = (uint64_t)v20;
        id v31 = v32;
        sub_7670(v34, &qword_166D8);
        v33((unsigned char *)v29, v3);
        uint64_t v28 = v4;
        uint64_t result = sub_7670((uint64_t)v11, &qword_166D8);
        uint64_t v30 = v40;
        if (v37) {
          return result;
        }
        goto LABEL_16;
      }
      sub_7670((uint64_t)v16, &qword_166D8);
      sub_7670((uint64_t)v20, &qword_166D8);
      uint64_t v28 = v4;
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v29, v3);
    }
    uint64_t result = sub_7670((uint64_t)v11, &qword_166D0);
    uint64_t v30 = v40;
    id v31 = v41;
LABEL_16:
    if (*(void *)(v30 + v39))
    {
      swift_retain();
      id v35 = [v43 selectedDate];
      sub_B6C0();

      swift_getKeyPath();
      swift_getKeyPath();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v28 + 16))(v42, v31, v3);
      swift_retain();
      sub_B7F0();
      (*(void (**)(unsigned char *, uint64_t))(v28 + 8))(v31, v3);
      return swift_release();
    }
  }
  return result;
}

id sub_74BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SendLaterRootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SendLaterRootViewController()
{
  return self;
}

uint64_t sub_75C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_760C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_75C0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_7670(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_75C0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_76CC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_7704(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_7768()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_77A0()
{
  return sub_6BB0(*(void *)(v0 + 16));
}

uint64_t sub_77A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_77B8()
{
  return swift_release();
}

uint64_t sub_77C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_7808(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7850(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_7924(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7EF8((uint64_t)v12, *a3);
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
      sub_7EF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7EA8((uint64_t)v12);
  return v7;
}

uint64_t sub_7924(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_B9A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_7AE0(a5, a6);
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
  uint64_t v8 = sub_B9F0();
  if (!v8)
  {
    sub_BA00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_BA20();
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

uint64_t sub_7AE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_7B78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_7D58(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_7D58(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_7B78(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_7CF0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_B9E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_BA00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_B8D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_BA20();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_BA00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_7CF0(uint64_t a1, uint64_t a2)
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
  sub_75C0(&qword_16720);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_7D58(char a1, int64_t a2, char a3, char *a4)
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
    sub_75C0(&qword_16720);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_BA20();
  __break(1u);
  return result;
}

uint64_t sub_7EA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_7F58()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_7F90()
{
}

uint64_t sub_7F98(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_7808(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_7FDC(uint64_t a1, unint64_t *a2)
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

void sub_8018()
{
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_presentationViewController] = 0;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_sendDelegate] = 0;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_balloonPlugin] = 0;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_isiMessage] = 0;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_conversationID] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_wantsDarkUI] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_wantsOpaqueUI] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_supportsQuickView] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_shouldSuppressEntryView] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_isPrimaryViewController] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_isDismissing] = 0;
  v0[OBJC_IVAR___SendLaterRootViewController_mayBeKeptInViewHierarchy] = 1;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_context] = 0;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_timePickerViewModel] = 0;
  *(void *)&v0[OBJC_IVAR___SendLaterRootViewController_cancellables] = &_swiftEmptySetSingleton;
  v0[OBJC_IVAR___SendLaterRootViewController_shouldShowChatChrome] = 1;
  v0[OBJC_IVAR___SendLaterRootViewController_inExpandedPresentation] = 1;
  v0[OBJC_IVAR___SendLaterRootViewController_inFullScreenModalPresentation] = 0;

  sub_BA10();
  __break(1u);
}

uint64_t sub_8168()
{
  uint64_t v0 = sub_B790();
  sub_7704(v0, qword_169C8);
  sub_76CC(v0, (uint64_t)qword_169C8);
  return sub_B780();
}

uint64_t sub_81E8()
{
  return sub_8210();
}

uint64_t sub_81FC()
{
  return sub_8210();
}

uint64_t sub_8210()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_B7E0();
  swift_release();

  return swift_release();
}

uint64_t sub_8280@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_75C0(&qword_16978);
  uint64_t v3 = __chkstk_darwin(v2);
  size_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v23 - v6;
  uint64_t v8 = sub_B6F0();
  int64_t v9 = *(void **)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v23 - v13;
  sub_8560((uint64_t)&v23 - v13);
  sub_88A4((uint64_t)v12);
  sub_B648(&qword_16980, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t result = sub_B860();
  if (result)
  {
    uint64_t v23 = v2;
    id v24 = a1;
    CGFloat v16 = &v7[*(int *)(v2 + 48)];
    double v17 = (void (*)(char *, char *, uint64_t))v9[4];
    v17(v7, v14, v8);
    v17(v16, v12, v8);
    uint64_t v18 = &v5[*(int *)(v2 + 48)];
    uint64_t v19 = (void (*)(char *, char *, uint64_t))v9[2];
    v19(v5, v7, v8);
    v19(v18, v16, v8);
    v17(v24, v5, v8);
    CGFloat v20 = (void (*)(char *, uint64_t))v9[1];
    v20(v18, v8);
    id v21 = &v5[*(int *)(v23 + 48)];
    v17(v5, v7, v8);
    v17(v21, v16, v8);
    uint64_t v22 = sub_75C0((uint64_t *)&unk_16810);
    v17(&v24[*(int *)(v22 + 36)], v21, v8);
    return ((uint64_t (*)(char *, uint64_t))v20)(v5, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_8560@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v23 = sub_B6F0();
  uint64_t v1 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_B740();
  uint64_t v21 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_B760();
  uint64_t v8 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_75C0(&qword_166D8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B730();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Calendar.Component.minute(_:), v4);
  NSString v14 = sub_B880();
  NSString v15 = sub_B880();
  IMGetCachedDomainIntForKeyWithDefaultValue();

  sub_B6D0();
  sub_B720();
  CGFloat v16 = *(void (**)(char *, uint64_t))(v1 + 8);
  double v17 = v3;
  uint64_t v18 = v23;
  v16(v17, v23);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v22);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v13, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_A90C(v20);
    return ((uint64_t (*)(char *, uint64_t))v16)(v13, v18);
  }
  return result;
}

uint64_t sub_88A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v26 = sub_B6F0();
  uint64_t v1 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_B740();
  uint64_t v4 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_B760();
  uint64_t v7 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_75C0(&qword_166D8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [self sharedInstanceForBagType:1];
  NSString v14 = sub_B880();
  id v15 = [v13 objectForKey:v14];

  if (v15)
  {
    sub_B9B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  sub_B2C8((uint64_t)v28, (uint64_t)v29);
  if (v30)
  {
    sub_7FDC(0, &qword_16988);
    if (swift_dynamicCast())
    {
      id v16 = v27;
      [v27 integerValue];
    }
  }
  else
  {
    sub_7670((uint64_t)v29, &qword_166E8);
  }
  sub_B730();
  uint64_t v17 = v25;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Calendar.Component.day(_:), v25);
  sub_B6D0();
  sub_B720();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v19 = v3;
  uint64_t v20 = v26;
  v18(v19, v26);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v12, 1, v20);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_A90C(v23);
    return ((uint64_t (*)(char *, uint64_t))v18)(v12, v20);
  }
  return result;
}

uint64_t sub_8CA0(char *a1)
{
  uint64_t v59 = a1;
  uint64_t v56 = sub_B740();
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v53 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_B760();
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  id v52 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_B6F0();
  uint64_t v4 = *(void *)(v51 - 8);
  uint64_t v5 = __chkstk_darwin(v51);
  id v49 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v45 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v50 = sub_75C0(&qword_16960);
  uint64_t v12 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  NSString v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_75C0((uint64_t *)&unk_16810);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v45 - v19;
  uint64_t v21 = v1 + OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel__dateClosedRange;
  type metadata accessor for TimePickerViewModel();
  sub_8280(v20);
  sub_B16C((uint64_t)v20, (uint64_t)v18);
  sub_B7C0();
  sub_7670((uint64_t)v20, (uint64_t *)&unk_16810);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v21, v14, v50);
  uint64_t v48 = OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel_dateRangeUpdateTimer;
  uint64_t v22 = v59;
  *(void *)(v58 + OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel_dateRangeUpdateTimer) = 0;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v24 = v51;
  v23(v11, (uint64_t)v22, v51);
  swift_beginAccess();
  v23(v9, (uint64_t)v11, v24);
  NSString v47 = v9;
  uint64_t v25 = v24;
  sub_B7C0();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v50 = v4 + 8;
  v26(v11, v24);
  swift_endAccess();
  sub_B6E0();
  id v27 = v52;
  sub_B730();
  uint64_t v28 = v53;
  uint64_t v29 = v54;
  uint64_t v30 = v56;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v53, enum case for Calendar.Component.second(_:), v56);
  id v31 = v11;
  uint64_t v32 = v27;
  uint64_t v33 = sub_B750();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v32, v57);
  if (__OFSUB__(60, v33))
  {
    __break(1u);
  }
  else
  {
    id v35 = v47;
    NSString v46 = v31;
    sub_B6A0();
    BOOL v36 = v49;
    v23(v49, (uint64_t)v35, v25);
    uint64_t v37 = swift_allocObject();
    uint64_t v38 = v58;
    swift_weakInit();
    id v39 = objc_allocWithZone((Class)NSTimer);
    swift_retain();
    Class isa = sub_B6B0().super.isa;
    aBlock[4] = sub_B2A8;
    aBlock[5] = v37;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_AF58;
    aBlock[3] = &unk_10800;
    id v41 = _Block_copy(aBlock);
    id v42 = [v39 initWithFireDate:isa interval:1 repeats:v41 block:60.0];
    _Block_release(v41);

    v26(v36, v25);
    swift_release();
    swift_release();
    id v43 = [self mainRunLoop];
    [v43 addTimer:v42 forMode:NSDefaultRunLoopMode];

    v26(v59, v25);
    v26(v35, v25);
    v26(v46, v25);
    id v44 = *(void **)(v38 + v48);
    *(void *)(v38 + v48) = v42;

    return v38;
  }
  return result;
}

uint64_t sub_930C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_75C0((uint64_t *)&unk_16810);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v22 - v11;
  __chkstk_darwin(v10);
  NSString v14 = (char *)&v22 - v13;
  type metadata accessor for TimePickerViewModel();
  sub_8280(v14);
  if (qword_164E8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_B790();
  sub_76CC(v15, (uint64_t)qword_169C8);
  sub_B16C((uint64_t)v14, (uint64_t)v12);
  uint64_t v16 = sub_B770();
  os_log_type_t v17 = sub_B910();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v22 = a2 + 16;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    uint64_t v23 = v6;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v19 = sub_9634();
    uint64_t v24 = sub_7850(v19, v20, v25);
    uint64_t v6 = v23;
    sub_B990();
    swift_bridgeObjectRelease();
    sub_7670((uint64_t)v12, (uint64_t *)&unk_16810);
    _os_log_impl(&dword_0, v16, v17, "Update timer fired. Updating dateClosedRange to %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_7670((uint64_t)v12, (uint64_t *)&unk_16810);
  }

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_B16C((uint64_t)v14, (uint64_t)v9);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_B16C((uint64_t)v9, (uint64_t)v6);
    swift_retain();
    sub_B7F0();
    sub_7670((uint64_t)v9, (uint64_t *)&unk_16810);
    swift_release();
  }
  return sub_7670((uint64_t)v14, (uint64_t *)&unk_16810);
}

uint64_t sub_9634()
{
  id v0 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v0 setTimeStyle:2];
  [v0 setDateStyle:1];
  Class isa = sub_B6B0().super.isa;
  id v2 = [v0 stringFromDate:isa];

  uint64_t v3 = sub_B890();
  uint64_t v11 = v3;
  v12._countAndFlagsBits = 3026478;
  v12._object = (void *)0xE300000000000000;
  sub_B8C0(v12);
  sub_75C0((uint64_t *)&unk_16810);
  id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v4 setTimeStyle:2];
  [v4 setDateStyle:1];
  Class v5 = sub_B6B0().super.isa;
  id v6 = [v4 stringFromDate:v5];

  uint64_t v7 = sub_B890();
  uint64_t v9 = v8;

  v13._countAndFlagsBits = v7;
  v13._object = v9;
  sub_B8C0(v13);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_97B8()
{
  uint64_t v1 = OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel_dateRangeUpdateTimer;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel_dateRangeUpdateTimer);
  if (v2) {
    [v2 invalidate];
  }
  uint64_t v3 = v0 + OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel__date;
  uint64_t v4 = sub_75C0(&qword_16730);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC17SendLaterProvider19TimePickerViewModel__dateClosedRange;
  uint64_t v6 = sub_75C0(&qword_16960);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_deallocClassInstance();
}

uint64_t sub_98D0()
{
  return type metadata accessor for TimePickerViewModel();
}

uint64_t type metadata accessor for TimePickerViewModel()
{
  uint64_t result = qword_167F0;
  if (!qword_167F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_9924()
{
  sub_99F8();
  if (v0 <= 0x3F)
  {
    sub_9A50();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_99F8()
{
  if (!qword_16800)
  {
    sub_B6F0();
    unint64_t v0 = sub_B800();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_16800);
    }
  }
}

void sub_9A50()
{
  if (!qword_16808)
  {
    sub_7808((uint64_t *)&unk_16810);
    unint64_t v0 = sub_B800();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_16808);
    }
  }
}

uint64_t sub_9AAC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TimePickerViewModel();
  uint64_t result = sub_B7B0();
  *a1 = result;
  return result;
}

char *sub_9AEC(uint64_t a1)
{
  uint64_t v3 = sub_75C0(&qword_16968);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  uint64_t v63 = v4;
  __chkstk_darwin(v3);
  unint64_t v61 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_B6F0();
  uint64_t v6 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_75C0((uint64_t *)&unk_16810) - 8;
  __chkstk_darwin(v58);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_cancellables] = &_swiftEmptySetSingleton;
  uint64_t v60 = a1;
  *(void *)&v1[OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_model] = a1;
  id v11 = objc_allocWithZone((Class)UIDatePicker);
  Swift::String v12 = v1;
  swift_retain();
  id v13 = objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v12[OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker] = v13;

  NSString v14 = (objc_class *)type metadata accessor for TimePickerView();
  v67.receiver = v12;
  v67.super_class = v14;
  uint64_t v15 = (char *)objc_msgSendSuper2(&v67, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v16 = *(void **)&v15[OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker];
  uint64_t v17 = OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker;
  uint64_t v56 = OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker;
  uint64_t v64 = OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_model;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v59 = v15;
  id v18 = v16;
  swift_retain();
  sub_B7E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v19 = v65;
  v57(v8, v10, v65);
  sub_7670((uint64_t)v10, (uint64_t *)&unk_16810);
  Class isa = sub_B6B0().super.isa;
  uint64_t v21 = v6 + 8;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v55 = v21;
  v22(v8, v19);
  [v18 setMinimumDate:isa];

  uint64_t v23 = *(void **)&v15[v17];
  swift_getKeyPath();
  swift_getKeyPath();
  id v24 = v23;
  swift_retain();
  sub_B7E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v25 = v65;
  v57(v8, &v10[*(int *)(v58 + 44)], v65);
  sub_7670((uint64_t)v10, (uint64_t *)&unk_16810);
  Class v26 = sub_B6B0().super.isa;
  v22(v8, v25);
  [v24 setMaximumDate:v26];

  uint64_t v27 = v56;
  uint64_t v28 = *(void **)&v15[v56];
  swift_getKeyPath();
  swift_getKeyPath();
  id v29 = v28;
  swift_retain();
  sub_B7E0();
  swift_release();
  swift_release();
  swift_release();
  Class v30 = sub_B6B0().super.isa;
  v22(v8, v65);
  [v29 setDate:v30];

  uint64_t v31 = v27;
  [*(id *)&v15[v27] setDatePickerMode:2];
  [*(id *)&v15[v27] setPreferredDatePickerStyle:1];
  uint64_t v32 = *(void **)&v15[v27];
  uint64_t v33 = v59;
  [v32 addTarget:v59 action:"dateChanged:" forControlEvents:4096];
  [*(id *)&v15[v31] addTarget:v33 action:"disableKeypad:" forControlEvents:0x10000];
  [v33 addSubview:*(void *)&v15[v31]];
  [*(id *)&v15[v31] setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v34 = self;
  sub_75C0(&qword_16740);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_C160;
  id v36 = [*(id *)&v15[v31] leadingAnchor];
  id v37 = [v33 leadingAnchor];
  id v38 = [v36 constraintEqualToAnchor:v37];

  *(void *)(v35 + 32) = v38;
  id v39 = [*(id *)&v15[v31] trailingAnchor];
  id v40 = [v33 trailingAnchor];
  id v41 = [v39 constraintEqualToAnchor:v40];

  *(void *)(v35 + 40) = v41;
  id v42 = [*(id *)&v15[v31] topAnchor];
  id v43 = [v33 topAnchor];
  id v44 = [v42 constraintEqualToAnchor:v43];

  *(void *)(v35 + 48) = v44;
  id v45 = [*(id *)&v15[v31] bottomAnchor];
  id v46 = [v33 bottomAnchor];
  id v47 = [v45 constraintEqualToAnchor:v46];

  *(void *)(v35 + 56) = v47;
  uint64_t v66 = v35;
  sub_B900();
  sub_7FDC(0, &qword_16748);
  Class v48 = sub_B8E0().super.isa;
  swift_bridgeObjectRelease();
  [v34 activateConstraints:v48];

  id v49 = self;
  uint64_t v50 = v33;
  id v51 = [v49 clearColor];
  [v50 setBackgroundColor:v51];

  swift_beginAccess();
  sub_75C0(&qword_16960);
  id v52 = v61;
  sub_B7D0();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_B214();
  uint64_t v53 = v62;
  sub_B810();
  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v52, v53);
  swift_beginAccess();
  sub_B7A0();
  swift_endAccess();
  swift_release();

  swift_release();
  return v50;
}

void sub_A37C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = *(id *)(Strong + OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker);

    Class isa = sub_B6B0().super.isa;
    [v2 setMinimumDate:isa];
  }
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectWeakLoadStrong();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = *(id *)(v4 + OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker);

    sub_75C0((uint64_t *)&unk_16810);
    Class v7 = sub_B6B0().super.isa;
    [v6 setMaximumDate:v7];
  }
}

void sub_A55C(void *a1)
{
  uint64_t v3 = sub_B6F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  Class v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_7FDC(0, &qword_16958);
  id v10 = *(id *)(v1 + OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker);
  char v11 = sub_B980();

  if (v11)
  {
    swift_retain();
    id v12 = [a1 date];
    sub_B6C0();

    swift_getKeyPath();
    swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    swift_retain();
    sub_B7F0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    swift_release();
  }
}

id sub_A84C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TimePickerView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TimePickerView()
{
  return self;
}

void *sub_A900()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_A90C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v29 = sub_B6F0();
  uint64_t v31 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v23 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_75C0(&qword_166D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v27 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_B690();
  uint64_t v26 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_B760();
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B730();
  sub_75C0(&qword_16990);
  uint64_t v9 = sub_B740();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_C210;
  unint64_t v14 = v13 + v12;
  uint64_t v15 = *(void (**)(unint64_t, void, uint64_t))(v10 + 104);
  v15(v14, enum case for Calendar.Component.year(_:), v9);
  v15(v14 + v11, enum case for Calendar.Component.month(_:), v9);
  v15(v14 + 2 * v11, enum case for Calendar.Component.day(_:), v9);
  v15(v14 + 3 * v11, enum case for Calendar.Component.hour(_:), v9);
  v15(v14 + 4 * v11, enum case for Calendar.Component.minute(_:), v9);
  uint64_t v16 = v23;
  sub_B330(v13);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v17 = v29;
  swift_deallocClassInstance();
  uint64_t v18 = v30;
  sub_B700();
  uint64_t v19 = (uint64_t)v27;
  swift_bridgeObjectRelease();
  sub_B710();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v28);
  unint64_t v20 = v8;
  uint64_t v21 = v31;
  (*(void (**)(char *, uint64_t))(v24 + 8))(v20, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v16, v18, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v19, 1, v17) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v32, v16, v17);
    return sub_7670(v19, &qword_166D8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v17);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v32, v19, v17);
  }
}

uint64_t sub_ADA8()
{
  return sub_AFC0();
}

uint64_t sub_ADBC()
{
  return sub_AFC0();
}

uint64_t sub_ADE4(uint64_t a1)
{
  uint64_t v2 = sub_B6F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  sub_B7F0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

void sub_AF58(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_AFC0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_B7E0();
  swift_release();

  return swift_release();
}

uint64_t sub_B038()
{
  return sub_AFC0();
}

uint64_t sub_B060(uint64_t a1)
{
  uint64_t v2 = sub_75C0((uint64_t *)&unk_16810);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_B16C(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_B16C((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_B7F0();
  return sub_7670((uint64_t)v7, (uint64_t *)&unk_16810);
}

uint64_t sub_B16C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75C0((uint64_t *)&unk_16810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_B1D4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_B20C()
{
}

unint64_t sub_B214()
{
  unint64_t result = qword_16970;
  if (!qword_16970)
  {
    sub_7808(&qword_16968);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_16970);
  }
  return result;
}

uint64_t sub_B270()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_B2A8(uint64_t a1)
{
  return sub_930C(a1, v1);
}

uint64_t sub_B2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_B2C0()
{
  return swift_release();
}

uint64_t sub_B2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75C0(&qword_166E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_B330(uint64_t a1)
{
  uint64_t v2 = sub_B740();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_75C0(&qword_16998);
    uint64_t v9 = sub_B9D0();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_B648(&qword_169A0, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
      uint64_t v16 = sub_B850();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_B648(&qword_169A8, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
          char v23 = sub_B870();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        unint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_B648(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_B690()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_B6A0()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_B6B0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_B6C0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B6D0()
{
  return static Date.now.getter();
}

uint64_t sub_B6E0()
{
  return Date.init()();
}

uint64_t sub_B6F0()
{
  return type metadata accessor for Date();
}

uint64_t sub_B700()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_B710()
{
  return Calendar.date(from:)();
}

uint64_t sub_B720()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_B730()
{
  return static Calendar.current.getter();
}

uint64_t sub_B740()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_B750()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_B760()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_B770()
{
  return Logger.logObject.getter();
}

uint64_t sub_B780()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_B790()
{
  return type metadata accessor for Logger();
}

uint64_t sub_B7A0()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_B7B0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_B7C0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_B7D0()
{
  return Published.projectedValue.getter();
}

uint64_t sub_B7E0()
{
  return static Published.subscript.getter();
}

uint64_t sub_B7F0()
{
  return static Published.subscript.setter();
}

uint64_t sub_B800()
{
  return type metadata accessor for Published();
}

uint64_t sub_B810()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_B820()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_B830()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_B840()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_B850()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_B860()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_B870()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_B880()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_B890()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B8A0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_B8B0()
{
  return String.init<A>(reflecting:)();
}

void sub_B8C0(Swift::String a1)
{
}

Swift::Int sub_B8D0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_B8E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_B8F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B900()
{
  return specialized Array._endMutation()();
}

uint64_t sub_B910()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_B920()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_B930()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_B940()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_B950()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_B960()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_B970()
{
  return type metadata accessor for CKSendLaterPluginInfo();
}

uint64_t sub_B980()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_B990()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_B9A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_B9B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_B9C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_B9D0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_B9E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_B9F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_BA00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_BA10()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_BA20()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_BA30()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return _IMGetCachedDomainIntForKeyWithDefaultValue();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}