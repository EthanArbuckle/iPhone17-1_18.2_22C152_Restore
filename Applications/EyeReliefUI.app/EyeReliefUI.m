BOOL sub_1000044EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100004500()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004548()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004574()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t *sub_1000045B8@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_1000045D0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000045DC(char a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000868C(0, (unint64_t *)&qword_100021B40);
  v12 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  aBlock[4] = sub_100008804;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008AB8;
  aBlock[3] = &unk_10001CF78;
  v14 = _Block_copy(aBlock);
  id v15 = a2;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000086D0();
  sub_100007428(&qword_100021B50);
  sub_100008728();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_100004870(char a1, char *a2)
{
  uint64_t v2 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel;
  if (*(void *)&a2[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (LOBYTE(v23[0]) == 1)
    {
      uint64_t v5 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer;
      uint64_t v6 = *(void **)&a2[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer];
      if (a1 == 1)
      {
        v7 = *(void **)&a2[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer];
        id v8 = v7;
        if (!v6)
        {
          if (qword_100021A30 != -1) {
            swift_once();
          }
          uint64_t v9 = type metadata accessor for Logger();
          sub_1000074E4(v9, (uint64_t)qword_100022A30);
          uint64_t v10 = Logger.logObject.getter();
          os_log_type_t v11 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v10, v11))
          {
            v12 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v12 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "Scheduled safe distance timer", v12, 2u);
            swift_slowDealloc();
          }

          uint64_t v6 = *(void **)&a2[v5];
          v7 = v6;
          id v8 = v6;
          if (!v6)
          {
            uint64_t v13 = self;
            uint64_t v14 = swift_allocObject();
            *(void *)(v14 + 16) = a2;
            v23[4] = sub_100008810;
            v23[5] = v14;
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 1107296256;
            v23[2] = sub_100004D5C;
            v23[3] = &unk_10001CFC8;
            id v15 = _Block_copy(v23);
            v16 = a2;
            swift_release();
            id v8 = [v13 scheduledTimerWithTimeInterval:0 repeats:v15 block:1.0];
            _Block_release(v15);
            v7 = 0;
            uint64_t v6 = *(void **)&a2[v5];
          }
        }
        *(void *)&a2[v5] = v8;
        id v17 = v7;
      }
      else
      {
        if (v6)
        {
          if (qword_100021A30 != -1) {
            swift_once();
          }
          uint64_t v18 = type metadata accessor for Logger();
          sub_1000074E4(v18, (uint64_t)qword_100022A30);
          v19 = Logger.logObject.getter();
          os_log_type_t v20 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v19, v20))
          {
            v21 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v21 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "Cancelled safe distance timer", v21, 2u);
            swift_slowDealloc();
          }
        }
        [*(id *)&a2[v5] invalidate];
        v22 = *(void **)&a2[v5];
        *(void *)&a2[v5] = 0;

        if (*(void *)&a2[v2])
        {
          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          static Published.subscript.setter();
        }
      }
    }
  }
}

void sub_100004C04(uint64_t a1, uint64_t a2)
{
  if (qword_100021A30 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000074E4(v3, (uint64_t)qword_100022A30);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Fired safe distance timer", v6, 2u);
    swift_slowDealloc();
  }

  if (*(void *)(a2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.setter();
  }
  if (*(void *)(a2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming))
  {
    swift_retain();
    sub_100013A88();
    swift_release();
  }
}

void sub_100004D5C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100004DC4(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000868C(0, (unint64_t *)&qword_100021B40);
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  aBlock[4] = sub_1000086C8;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008AB8;
  aBlock[3] = &unk_10001CF28;
  v12 = _Block_copy(aBlock);
  id v13 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000086D0();
  sub_100007428(&qword_100021B50);
  sub_100008728();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100005050(uint64_t a1)
{
  if (qword_100021A30 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000074E4(v2, (uint64_t)qword_100022A30);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unable to stream. Enabling continue button.", v5, 2u);
    swift_slowDealloc();
  }

  if (*(void *)(a1 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.setter();
  }
}

void sub_100005254()
{
  Swift::UInt v1 = v0;
  uint64_t v2 = type metadata accessor for ShieldIntervention(0);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InterventionViewModel(0);
  uint64_t v5 = swift_allocObject();
  LOBYTE(aBlock) = 1;
  Published.init(initialValue:)();
  uint64_t v6 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel;
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel] = v5;
  swift_release();
  id v7 = [v1 view];
  if (!v7)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = self;
  id v10 = [v9 clearColor];
  [v8 setBackgroundColor:v10];

  if (!*(void *)&v1[v6])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  v12 = v1;
  uint64_t v13 = swift_retain();
  sub_100008AFC(v13, (uint64_t)sub_100007420, v11, (uint64_t)v4);
  id v14 = objc_allocWithZone((Class)sub_100007428(&qword_100021AA8));
  uint64_t v15 = UIHostingController.init(rootView:)();
  uint64_t v16 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention;
  id v17 = *(void **)&v12[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
  *(void *)&v12[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention] = v15;

  uint64_t v18 = *(void **)&v12[v16];
  if (!v18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v19 = [v18 view];
  if (!v19)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  os_log_type_t v20 = v19;
  id v21 = [v9 clearColor];
  [v20 setBackgroundColor:v21];

  v22 = *(void **)&v12[v16];
  if (!v22)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v23 = [v22 view];
  if (!v23)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v24 = v23;
  id v25 = [v23 layer];

  [v25 setMasksToBounds:1];
  v26 = *(void **)&v12[v16];
  if (!v26)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v27 = [v26 view];
  if (!v27)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v28 = v27;
  id v29 = [v27 layer];

  v30 = self;
  id v31 = [v30 mainScreen];
  id v32 = [v31 traitCollection];

  [v32 displayCornerRadius];
  double v34 = v33;

  [v29 setCornerRadius:v34];
  v35 = *(void **)&v12[v16];
  if (!v35)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v36 = [v35 view];
  if (!v36)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v37 = v36;
  id v38 = [v36 layer];

  [v38 setCornerCurve:kCACornerCurveContinuous];
  id v39 = [v30 mainScreen];
  [v39 bounds];
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;

  v73.origin.x = v41;
  v73.origin.y = v43;
  v73.size.width = v45;
  v73.size.height = v47;
  double Height = CGRectGetHeight(v73);
  v74.origin.x = v41;
  v74.origin.y = v43;
  v74.size.width = v45;
  v74.size.height = v47;
  double Width = CGRectGetWidth(v74);
  v75.origin.x = v41;
  v75.origin.y = v43;
  v75.size.width = v45;
  v75.size.height = v47;
  double v50 = CGRectGetHeight(v75);
  v51 = *(void **)&v12[v16];
  if (!v51)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  double v52 = v50;
  id v53 = [v51 view];
  if (!v53)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v54 = v53;
  [v53 setFrame:0.0, Height, Width, v52];

  if (!*(void *)&v12[v16])
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  [v12 addChildViewController:];
  id v55 = [v12 view];
  if (!v55)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v56 = v55;
  v57 = *(void **)&v12[v16];
  if (!v57)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v58 = [v57 view];
  if (v58)
  {
    v59 = v58;
    [v56 addSubview:v58];

    sub_1000061BC();
    v60 = self;
    v61 = (CGFloat *)swift_allocObject();
    *((void *)v61 + 2) = v12;
    v61[3] = v41;
    v61[4] = v43;
    v61[5] = v45;
    v61[6] = v47;
    v71 = sub_1000074A4;
    v72 = v61;
    aBlock = _NSConcreteStackBlock;
    uint64_t v68 = 1107296256;
    v69 = sub_100008AB8;
    v70 = &unk_10001CD48;
    v62 = _Block_copy(&aBlock);
    v63 = v12;
    swift_release();
    uint64_t v64 = swift_allocObject();
    *(void *)(v64 + 16) = v63;
    v71 = sub_1000074D4;
    v72 = (CGFloat *)v64;
    aBlock = _NSConcreteStackBlock;
    uint64_t v68 = 1107296256;
    v69 = sub_100005FE8;
    v70 = &unk_10001CD98;
    v65 = _Block_copy(&aBlock);
    v66 = v63;
    swift_release();
    [v60 _animateUsingSpringWithTension:0 friction:v62 interactive:v65 animations:200.0 completion:35.0];
    _Block_release(v65);
    _Block_release(v62);
    return;
  }
LABEL_33:
  __break(1u);
}

void sub_1000058C0(char *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction];
  if (v6)
  {
    if (*(void *)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel])
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v7 = v6;
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      int v8 = aBlock;
    }
    else
    {
      id v9 = v6;
      int v8 = 0;
    }
    if (qword_100021A30 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1000074E4(v2, (uint64_t)qword_100022A30);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      id v14 = (void **)swift_slowAlloc();
      v48 = v6;
      uint64_t v46 = v3;
      CGFloat v47 = a1;
      *(_DWORD *)uint64_t v13 = 136315138;
      aBlock = v14;
      if (v8) {
        uint64_t v15 = 0x656661736E75;
      }
      else {
        uint64_t v15 = 1701208435;
      }
      if (v8) {
        unint64_t v16 = 0xE600000000000000;
      }
      else {
        unint64_t v16 = 0xE400000000000000;
      }
      uint64_t v49 = sub_100007598(v15, v16, (uint64_t *)&aBlock);
      a1 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "User pressed dismiss button at %s distance. Replying back to eyereliefd", v13, 0xCu);
      swift_arrayDestroy();
      uint64_t v6 = v48;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v46 + 8))(v5, v2);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    id v17 = *(void **)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
    if (v17)
    {
      id v18 = [v17 view];
      if (v18)
      {
        id v19 = v18;
        id v20 = [v18 layer];

        id v21 = self;
        id v22 = [v21 mainScreen];
        id v23 = [v22 traitCollection];

        [v23 displayCornerRadius];
        double v25 = v24;

        [v20 setCornerRadius:v25];
        id v26 = [v21 mainScreen];
        [v26 bounds];
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;

        v56.origin.x = v28;
        v56.origin.y = v30;
        v56.size.width = v32;
        v56.size.height = v34;
        CGFloat Height = CGRectGetHeight(v56);
        v57.origin.x = v28;
        v57.origin.y = v30;
        v57.size.width = v32;
        v57.size.height = v34;
        CGFloat Width = CGRectGetWidth(v57);
        v58.origin.x = v28;
        v58.origin.y = v30;
        v58.size.width = v32;
        v58.size.height = v34;
        CGFloat v37 = CGRectGetHeight(v58);
        id v38 = self;
        id v39 = (CGFloat *)swift_allocObject();
        *((void *)v39 + 2) = a1;
        v39[3] = 0.0;
        v39[4] = Height;
        v39[5] = Width;
        v39[6] = v37;
        v54 = sub_10000751C;
        id v55 = v39;
        aBlock = _NSConcreteStackBlock;
        uint64_t v51 = 1107296256;
        double v52 = sub_100008AB8;
        id v53 = &unk_10001CDE8;
        double v40 = _Block_copy(&aBlock);
        CGFloat v41 = a1;
        swift_release();
        uint64_t v42 = swift_allocObject();
        *(void *)(v42 + 16) = v6;
        *(void *)(v42 + 24) = v41;
        *(unsigned char *)(v42 + 32) = v8;
        v54 = sub_10000758C;
        id v55 = (CGFloat *)v42;
        aBlock = _NSConcreteStackBlock;
        uint64_t v51 = 1107296256;
        double v52 = sub_100005FE8;
        id v53 = &unk_10001CE38;
        CGFloat v43 = _Block_copy(&aBlock);
        id v44 = v6;
        CGFloat v45 = v41;
        swift_release();
        [v38 _animateUsingSpringWithTension:0 friction:v40 interactive:v43 animations:200.0 completion:30.0];
        _Block_release(v43);
        _Block_release(v40);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

id sub_100005E94(unsigned char *a1, double a2, double a3, double a4, double a5)
{
  id result = *(id *)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id result = [result view];
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v11 = result;
  [result setFrame:a2, a3, a4, a5];

  a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar] = 1;

  return [a1 setNeedsStatusBarAppearanceUpdate];
}

void sub_100005F54(int a1, int a2, id a3, uint64_t a4, char a5)
{
  if ([a3 canSendResponse]) {
    sub_1000082FC(a3, (a5 & 1) == 0);
  }
  id v7 = [self sharedApplication];
  [v7 terminateWithSuccess];
}

uint64_t sub_100005FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

void sub_100006048(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention);
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v11 = [v5 view];
  if (!v11)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  double Width = CGRectGetWidth(v13);
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  [v11 setFrame:CGRectMake(0.0, 0.0, Width, CGRectGetHeight(v14))];
}

void sub_100006120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a3 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention);
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = [v3 view];
  if (!v4)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v5 = v4;
  id v6 = [v4 layer];

  [v6 setCornerRadius:0.0];
}

void sub_1000061BC()
{
  uint64_t v1 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
  if (!v2)
  {
    __break(1u);
    goto LABEL_19;
  }
  id v3 = [v2 view];
  if (!v3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v4 = v3;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v5 = *(void **)&v0[v1];
  if (!v5)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v6 = [v5 view];
  if (!v6)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v7 = v6;
  id v8 = [v6 topAnchor];

  id v9 = [v0 view];
  if (!v9)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  id v11 = [v9 topAnchor];

  id v12 = [v8 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  CGRect v13 = *(void **)&v0[v1];
  if (!v13)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v14 = [v13 view];
  if (!v14)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v15 = v14;
  id v16 = [v14 bottomAnchor];

  id v17 = [v0 view];
  if (!v17)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v18 = v17;
  id v19 = [v17 bottomAnchor];

  id v20 = [v16 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  id v21 = *(void **)&v0[v1];
  if (!v21)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v22 = [v21 view];
  if (!v22)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v23 = v22;
  id v24 = [v22 leftAnchor];

  id v25 = [v0 view];
  if (!v25)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v26 = v25;
  id v27 = [v25 leftAnchor];

  id v28 = [v24 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  double v29 = *(void **)&v0[v1];
  if (!v29)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  id v30 = [v29 view];
  if (!v30)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  double v31 = v30;
  id v32 = [v30 rightAnchor];

  id v33 = [v0 view];
  if (!v33)
  {
LABEL_31:
    __break(1u);
    return;
  }
  CGFloat v34 = v33;
  id v35 = [v33 rightAnchor];

  id v36 = [v32 constraintEqualToAnchor:v35];
  [v36 setActive:1];
}

void sub_100006528(void *a1, void (*a2)(id))
{
  id v3 = v2;
  if ([v3 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10000849C(v24, v26);
    sub_100007C40((uint64_t)v26, (uint64_t)v24);
    sub_100007428(&qword_100021B30);
    swift_dynamicCast();
    [v25[0] setReachabilityDisabled:1];
    swift_unknownObjectRelease();
    sub_100007C40((uint64_t)v26, (uint64_t)v24);
    swift_dynamicCast();
    [v25[0] setAllowsAlertStacking:1];
    swift_unknownObjectRelease();
    sub_100007C40((uint64_t)v26, (uint64_t)v24);
    swift_dynamicCast();
    [v25[0] setWallpaperTunnelActive:1];
    swift_unknownObjectRelease();
    v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] = 1;
    if (a1)
    {
      id v6 = [a1 userInfo];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        *(void *)&long long v22 = 0xD000000000000012;
        *((void *)&v22 + 1) = 0x8000000100015B10;
        AnyHashable.init<A>(_:)();
        if (*(void *)(v8 + 16) && (unint64_t v9 = sub_100007CA0((uint64_t)v24), (v10 & 1) != 0))
        {
          sub_100007C40(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v22);
        }
        else
        {
          long long v22 = 0u;
          long long v23 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_1000084AC((uint64_t)v24);
        if (*((void *)&v23 + 1))
        {
          sub_10000849C(&v22, v25);
          sub_100007C40((uint64_t)v25, (uint64_t)v24);
          if (swift_dynamicCast())
          {
            uint64_t v14 = v22;
            uint64_t v15 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold;
          }
          else
          {
            uint64_t v15 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold;
            uint64_t v14 = *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold];
          }
          *(void *)&v3[v15] = v14;
          if (qword_100021A30 != -1) {
            swift_once();
          }
          uint64_t v16 = type metadata accessor for Logger();
          sub_1000074E4(v16, (uint64_t)qword_100022A30);
          id v17 = v3;
          id v18 = Logger.logObject.getter();
          os_log_type_t v19 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v18, v19))
          {
            id v20 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)id v20 = 134217984;
            *(void *)&v24[0] = *(void *)&v3[v15];
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            _os_log_impl((void *)&_mh_execute_header, v18, v19, "Setting distance threshold to %f mm", v20, 0xCu);
            swift_slowDealloc();
          }
          else
          {
          }
          id v6 = (id)sub_100007BF0((uint64_t)v25);
        }
        else
        {
          id v6 = (id)sub_100008500((uint64_t)&v22);
        }
      }
      if (a2)
      {
        a2(v6);
        sub_100007BF0((uint64_t)v26);
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
    if (qword_100021A30 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_1000074E4(v11, (uint64_t)qword_100022A30);
    oslog = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      CGRect v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGRect v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "configureWithContext: Failed to instantiate remote VC proxy", v13, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100006AB4(void *a1, void (*a2)(uint64_t))
{
  if (!a1) {
    goto LABEL_19;
  }
  id v5 = [a1 actions];
  sub_10000868C(0, &qword_100021AB8);
  sub_10000842C();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v6 & 0xC000000000000001) != 0) {
    uint64_t v7 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v7 = *(void *)(v6 + 16);
  }
  uint64_t v8 = swift_bridgeObjectRelease();
  if (v7)
  {
    id v9 = [a1 actions];
    uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v11 = (unint64_t)sub_100007DAC(v10);
    swift_bridgeObjectRelease();
    if ((v11 & 0x8000000000000000) != 0 || (v11 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_release();
      if (v15)
      {
LABEL_9:
        if ((v11 & 0xC000000000000001) == 0)
        {
          if (*(void *)(v11 + 16))
          {
            id v12 = *(id *)(v11 + 32);
LABEL_12:
            id v13 = v12;
            swift_release();
            uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction);
            *(void *)(v2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction) = v13;

            goto LABEL_13;
          }
          __break(1u);
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
LABEL_17:
        id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_12;
      }
    }
    else if (*(void *)(v11 + 16))
    {
      goto LABEL_9;
    }
    swift_release();
    __break(1u);
    goto LABEL_17;
  }
LABEL_13:
  if (a2)
  {
    a2(v8);
    return;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_100006D64()
{
  uint64_t result = (uint64_t)[v0 view];
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = [(id)result window];

    if (v3
      && (id v4 = [v3 windowScene], v3, v4)
      && (id v5 = (char *)[v4 interfaceOrientation], v4, (unint64_t)(v5 - 3) <= 1)
      && (id v6 = [self currentDevice],
          id v7 = [v6 userInterfaceIdiom],
          v6,
          !v7))
    {
      return 1;
    }
    else
    {
      return v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar];
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100006ED4(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention] = 0;
  v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] = 3;
  *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold] = 0x4072C00000000000;
  *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer] = 0;
  v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar] = 0;
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ViewController();
  [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_100007020(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention] = 0;
  v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] = 3;
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold] = 0x4072C00000000000;
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer] = 0;
  v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ViewController();
  [super initWithCoder:a1];

  return v3;
}

id sub_100007104()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ViewController()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for InterventionType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InterventionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InterventionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100007344);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000736C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007378(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InterventionType()
{
  return &type metadata for InterventionType;
}

unint64_t sub_100007394()
{
  unint64_t result = qword_100021AA0;
  if (!qword_100021AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021AA0);
  }
  return result;
}

uint64_t sub_1000073E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007420()
{
  sub_1000058C0(*(char **)(v0 + 16));
}

uint64_t sub_100007428(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000746C()
{
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000074A4()
{
  return sub_100007534((uint64_t (*)(void, double, double, double, double))sub_100006048);
}

uint64_t sub_1000074BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000074CC()
{
  return swift_release();
}

void sub_1000074D4(uint64_t a1, uint64_t a2)
{
  sub_100006120(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000074E4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000751C()
{
  return sub_100007534((uint64_t (*)(void, double, double, double, double))sub_100005E94);
}

uint64_t sub_100007534(uint64_t (*a1)(void, double, double, double, double))
{
  return a1(*(void *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_10000754C()
{
  return _swift_deallocObject(v0, 33, 7);
}

void sub_10000758C(int a1, int a2)
{
  sub_100005F54(a1, a2, *(id *)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32));
}

uint64_t sub_100007598(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000766C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007C40((uint64_t)v12, *a3);
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
      sub_100007C40((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007BF0((uint64_t)v12);
  return v7;
}

uint64_t sub_10000766C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100007828(a5, a6);
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

uint64_t sub_100007828(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000078C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007AA0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007AA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000078C0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007A38(v2, 0);
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

void *sub_100007A38(uint64_t a1, uint64_t a2)
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
  sub_100007428(&qword_100021AB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007AA0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007428(&qword_100021AB0);
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

uint64_t sub_100007BF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007C40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100007CA0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100007CE4(a1, v4);
}

unint64_t sub_100007CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100008560(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000084AC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_100007DAC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = __CocoaSet.count.getter();
    if (v2) {
      goto LABEL_3;
    }
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = &_swiftEmptyArrayStorage;
  }
  else
  {
    sub_100007428(&qword_100021AC8);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  char v6 = sub_100007EA8(&v8, v3 + 4, v2, a1);
  uint64_t result = (void *)sub_100008494();
  if (v6 == (void *)v2) {
    return v3;
  }
  __break(1u);
  return result;
}

void *sub_100007EA8(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  char v6 = a2;
  int64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    sub_10000868C(0, &qword_100021AB8);
    sub_10000842C();
    uint64_t result = (void *)Set.Iterator.init(_cocoa:)();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    id v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    void *v24 = v4;
    v24[1] = v8;
    _OWORD v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  id v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_45;
      }
      sub_10000868C(0, &qword_100021AB8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1000081B4()
{
  if (v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] == 1) {
    sub_100005254();
  }
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  double v3 = *(double *)&v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold];
  type metadata accessor for DistanceStreaming();
  swift_allocObject();
  uint64_t v4 = v0;
  sub_100012B74((uint64_t)sub_10000867C, v1, (uint64_t)sub_100008684, v2, v3);
  uint64_t v5 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming;
  *(void *)&v4[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming] = v6;
  uint64_t result = swift_release();
  if (*(void *)&v4[v5])
  {
    swift_retain();
    sub_10001348C();
    return swift_release();
  }
  return result;
}

void sub_1000082FC(void *a1, uint64_t a2)
{
  id v6 = [objc_allocWithZone((Class)BSMutableSettings) init];
  [v6 setFlag:a2 forSetting:0];
  id v4 = [self responseWithInfo:v6];
  if ([a1 canSendResponse])
  {
    id v5 = v4;
    [a1 sendResponse:v5];
  }
}

uint64_t sub_1000083D4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000083E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000841C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_10000842C()
{
  unint64_t result = qword_100021AC0;
  if (!qword_100021AC0)
  {
    sub_10000868C(255, &qword_100021AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021AC0);
  }
  return result;
}

uint64_t sub_100008494()
{
  return swift_release();
}

_OWORD *sub_10000849C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000084AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008500(uint64_t a1)
{
  uint64_t v2 = sub_100007428(&qword_100021B38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008560(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1000085BC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction);
  if (v1)
  {
    id v2 = v1;
    if ([v2 canSendResponse]) {
      sub_1000082FC(v2, 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  if (*(void *)(v0 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention))
  {
    id v3 = [self sharedApplication];
    [v3 terminateWithSuccess];
  }
}

uint64_t sub_10000867C(char a1)
{
  return sub_1000045DC(a1, *(void **)(v1 + 16));
}

uint64_t sub_100008684()
{
  return sub_100004DC4(*(void **)(v0 + 16));
}

uint64_t sub_10000868C(uint64_t a1, unint64_t *a2)
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

void sub_1000086C8()
{
  sub_100005050(*(void *)(v0 + 16));
}

unint64_t sub_1000086D0()
{
  unint64_t result = qword_100021B48;
  if (!qword_100021B48)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021B48);
  }
  return result;
}

unint64_t sub_100008728()
{
  unint64_t result = qword_100021B58;
  if (!qword_100021B58)
  {
    sub_100008784(&qword_100021B50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021B58);
  }
  return result;
}

uint64_t sub_100008784(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000087CC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100008804()
{
  sub_100004870(*(unsigned char *)(v0 + 16), *(char **)(v0 + 24));
}

void sub_100008810(uint64_t a1)
{
  sub_100004C04(a1, *(void *)(v1 + 16));
}

uint64_t sub_100008818(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000884C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100008858(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100008878(uint64_t result, int a2, int a3)
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

__n128 sub_1000088B8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000088C4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000088E4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100008934(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000089D4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008A54(v0, qword_100022A30);
  sub_1000074E4(v0, (uint64_t)qword_100022A30);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_100008A54(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008AB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100008AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_100007428(&qword_100022238);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  CGRect v56 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v51 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  int64_t v18 = (char *)&v50 - v17;
  __chkstk_darwin(v16);
  double v50 = (char *)&v50 - v19;
  char v57 = 0;
  State.init(wrappedValue:)();
  uint64_t v20 = v59;
  *(unsigned char *)(a4 + 16) = v58;
  *(void *)(a4 + 24) = v20;
  char v57 = 0;
  State.init(wrappedValue:)();
  uint64_t v21 = v59;
  *(unsigned char *)(a4 + 32) = v58;
  *(void *)(a4 + 40) = v21;
  char v57 = 0;
  State.init(wrappedValue:)();
  uint64_t v22 = v59;
  *(unsigned char *)(a4 + 48) = v58;
  *(void *)(a4 + 56) = v22;
  *(void *)(a4 + 80) = a2;
  *(void *)(a4 + 88) = a3;
  swift_retain();
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  sub_10001149C(a2);
  type metadata accessor for InterventionViewModel(0);
  sub_100010F80(&qword_100022240, (void (*)(uint64_t))type metadata accessor for InterventionViewModel);
  uint64_t v55 = a1;
  *(void *)(a4 + 64) = ObservedObject.init(wrappedValue:)();
  *(void *)(a4 + 72) = v23;
  type metadata accessor for ShieldConfiguration(0);
  uint64_t v24 = swift_allocObject();
  sub_100009BB0();
  *(void *)a4 = v24;
  *(void *)(a4 + 8) = 0;
  int64_t v25 = self;
  id v26 = [v25 mainBundle];
  NSString v27 = String._bridgeToObjectiveC()();
  NSString v28 = String._bridgeToObjectiveC()();
  id v29 = [v26 URLForResource:v27 withExtension:v28];

  double v52 = v18;
  if (v29)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    int64_t v30 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v30(v11, v18, v12);
    unint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v31(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      id v32 = v50;
      v30(v50, v11, v12);
      id v33 = (char *)(a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 40));
      v30(v33, v32, v12);
      uint64_t v34 = type metadata accessor for VideoPlayerUIViewWrapper(0);
      v33[*(int *)(v34 + 20)] = 1;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 0, 1, v34);
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v31(v11, 1, 1, v12);
  }
  sub_1000126D8((uint64_t)v11, &qword_100022238);
  uint64_t v35 = a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 40);
  uint64_t v36 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 1, 1, v36);
LABEL_6:
  id v37 = [v25 mainBundle];
  NSString v38 = String._bridgeToObjectiveC()();
  NSString v39 = String._bridgeToObjectiveC()();
  id v40 = [v37 URLForResource:v38 withExtension:v39];

  CGFloat v41 = v52;
  if (v40)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    sub_1000083D4(v53);

    swift_release();
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v43 = (uint64_t)v56;
    v42(v56, v41, v12);
    v31((char *)v43, 0, 1, v12);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v43, 1, v12) != 1)
    {
      id v44 = v51;
      v42(v51, (char *)v43, v12);
      CGFloat v45 = (char *)(a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 44));
      v42(v45, v44, v12);
      uint64_t v46 = type metadata accessor for VideoPlayerUIViewWrapper(0);
      v45[*(int *)(v46 + 20)] = 0;
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 0, 1, v46);
    }
  }
  else
  {
    sub_1000083D4(v53);
    swift_release();
    uint64_t v43 = (uint64_t)v56;
    v31(v56, 1, 1, v12);
  }
  sub_1000126D8(v43, &qword_100022238);
  uint64_t v48 = a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 44);
  uint64_t v49 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 1, 1, v49);
}

char *sub_1000091B8(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  uint64_t v13 = OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer;
  id v14 = objc_allocWithZone((Class)AVPlayerLayer);
  uint64_t v15 = v6;
  *(void *)&v6[v13] = [v14 init];
  *(void *)&v15[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper] = 0;

  v30.receiver = v15;
  v30.super_class = (Class)type metadata accessor for VideoPlayerUIView();
  id v16 = [super initWithFrame:a3, a4, a5, a6];
  id v17 = objc_allocWithZone((Class)AVPlayerItem);
  int64_t v18 = (char *)v16;
  URL._bridgeToObjectiveC()(v19);
  uint64_t v21 = v20;
  id v22 = [v17 initWithURL:v20];

  id v23 = [objc_allocWithZone((Class)AVQueuePlayer) init];
  [v23 setPreventsDisplaySleepDuringVideoPlayback:0];
  [v23 _setParticipatesInAudioSession:0];
  [v23 insertItem:v22 afterItem:0];
  if (a2)
  {
    id v24 = [self playerLooperWithPlayer:v23 templateItem:v22];
    int64_t v25 = *(void **)&v18[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper];
    *(void *)&v18[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper] = v24;
  }
  else
  {
    [v23 setActionAtItemEnd:2];
  }
  id v26 = *(void **)&v18[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer];
  [v26 setPlayer:v23];
  id v27 = [v18 layer];
  [v27 addSublayer:v26];

  [v23 play];
  uint64_t v28 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(a1, v28);
  return v18;
}

id sub_100009570()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlayerUIView();
  return [super dealloc];
}

uint64_t type metadata accessor for VideoPlayerUIView()
{
  return self;
}

char *sub_100009614(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, v2);
  LOBYTE(a2) = *(unsigned char *)(v2 + *(int *)(a2 + 20));
  id v8 = objc_allocWithZone((Class)type metadata accessor for VideoPlayerUIView());
  return sub_1000091B8((uint64_t)v6, a2, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_100009710()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100009754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100010F80(&qword_100022220, (void (*)(uint64_t))type metadata accessor for VideoPlayerUIViewWrapper);

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000097E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100010F80(&qword_100022220, (void (*)(uint64_t))type metadata accessor for VideoPlayerUIViewWrapper);

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10000987C()
{
}

uint64_t sub_1000098D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100009948()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EyeReliefUI21InterventionViewModel__isTooClose;
  uint64_t v2 = sub_100007428(&qword_100022230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000099EC()
{
  return type metadata accessor for InterventionViewModel(0);
}

uint64_t type metadata accessor for InterventionViewModel(uint64_t a1)
{
  return sub_10000B6DC(a1, (uint64_t *)&unk_100021BE0);
}

void sub_100009A14()
{
  sub_10000A2E8(319, (unint64_t *)&unk_100021BF0);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100009AB4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InterventionViewModel(0);
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009AF4()
{
  return sub_100009B44();
}

uint64_t sub_100009B08()
{
  return sub_100009B44();
}

uint64_t sub_100009B1C()
{
  return sub_100009B44();
}

uint64_t sub_100009B30()
{
  return sub_100009B44();
}

uint64_t sub_100009B44()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100009BB0()
{
  uint64_t v1 = v0;
  id v2 = [self currentDevice];
  id v3 = [v2 model];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v4 = String.uppercased()();
  swift_bridgeObjectRelease();
  String.append(_:)(v4);
  uint64_t v5 = self;
  id v6 = [v5 mainBundle];
  v26._object = (void *)0x8000000100015DD0;
  v7._countAndFlagsBits = 0xD000000000000017;
  v7._object = (void *)0x8000000100015DB0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v26._countAndFlagsBits = 0xD00000000000002ELL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v6, v8, v26);
  swift_bridgeObjectRelease();

  static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  Published.init(initialValue:)();
  swift_endAccess();
  String.append(_:)(v4);
  id v9 = [v5 mainBundle];
  v27._countAndFlagsBits = 0xD000000000000034;
  v27._object = (void *)0x8000000100015E20;
  v10._countAndFlagsBits = 0xD00000000000001ALL;
  v10._object = (void *)0x8000000100015E00;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v27);
  swift_bridgeObjectRelease();

  static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  Published.init(initialValue:)();
  swift_endAccess();
  id v12 = [v5 mainBundle];
  v13._countAndFlagsBits = 0xD000000000000014;
  v28._object = (void *)0x8000000100015E80;
  v13._object = (void *)0x8000000100015E60;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v28._countAndFlagsBits = 0xD00000000000002ELL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v28);

  static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  Published.init(initialValue:)();
  swift_endAccess();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  id v15 = [v5 mainBundle];
  v29._countAndFlagsBits = 0xD000000000000031;
  v29._object = (void *)0x8000000100015ED0;
  v16._countAndFlagsBits = 0xD000000000000018;
  v16._object = (void *)0x8000000100015EB0;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v29);
  swift_bridgeObjectRelease();

  static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  Published.init(initialValue:)();
  swift_endAccess();
  id v18 = [v5 mainBundle];
  v30._countAndFlagsBits = 0xD000000000000027;
  v30._object = (void *)0x8000000100015F10;
  v19._countAndFlagsBits = 0x45554E49544E4F43;
  v19._object = (void *)0xE800000000000000;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v19, (Swift::String_optional)0, (NSBundle)v18, v20, v30);

  uint64_t v21 = static String.localizedStringWithFormat(_:_:)();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  id v24 = (uint64_t *)(v1 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString);
  uint64_t *v24 = v21;
  v24[1] = v23;
  return v1;
}

uint64_t sub_10000A0F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__titleString;
  uint64_t v2 = sub_100007428(&qword_100022228);
  id v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__successTitleString, v2);
  v3(v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__successSubtitleString, v2);
  v3(v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__subtitleString, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_10000A210()
{
  return type metadata accessor for ShieldConfiguration(0);
}

uint64_t type metadata accessor for ShieldConfiguration(uint64_t a1)
{
  return sub_10000B6DC(a1, (uint64_t *)&unk_100021CE8);
}

void sub_10000A238()
{
  sub_10000A2E8(319, (unint64_t *)&unk_100021CF8);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000A2E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Published();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_10000A330(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    Swift::String v8 = a2 + 10;
    uint64_t v9 = a2[10];
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v10 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v10;
    *(void *)(a1 + 72) = a2[9];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v9)
    {
      uint64_t v11 = a2[11];
      *(void *)(a1 + 80) = v9;
      *(void *)(a1 + 88) = v11;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 80) = *v8;
    }
    uint64_t v12 = *(int *)(a3 + 40);
    Swift::String v13 = (void *)(a1 + v12);
    Swift::String v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for VideoPlayerUIViewWrapper(0);
    uint64_t v16 = *(void *)(v15 - 8);
    Swift::String v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
    if (v17(v14, 1, v15))
    {
      uint64_t v18 = sub_100007428(&qword_100021E58);
      memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = type metadata accessor for URL();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v13, v14, v19);
      *((unsigned char *)v13 + *(int *)(v15 + 20)) = v14[*(int *)(v15 + 20)];
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    uint64_t v20 = *(int *)(a3 + 44);
    uint64_t v21 = (void *)(a1 + v20);
    uint64_t v22 = (char *)a2 + v20;
    if (v17(v22, 1, v15))
    {
      uint64_t v23 = sub_100007428(&qword_100021E58);
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      uint64_t v24 = type metadata accessor for URL();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v21, v22, v24);
      *((unsigned char *)v21 + *(int *)(v15 + 20)) = v22[*(int *)(v15 + 20)];
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v21, 0, 1, v15);
    }
  }
  return a1;
}

uint64_t type metadata accessor for VideoPlayerUIViewWrapper(uint64_t a1)
{
  return sub_10000B6DC(a1, qword_100021F68);
}

uint64_t sub_10000A658(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 80)) {
    swift_release();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  id v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  if (!v6(v4, 1, v5))
  {
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 44);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v8, 1, v5);
  if (!result)
  {
    uint64_t v10 = type metadata accessor for URL();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    return v11(v8, v10);
  }
  return result;
}

uint64_t sub_10000A7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v9 = (_OWORD *)(a2 + 80);
  uint64_t v8 = *(void *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v8)
  {
    uint64_t v10 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v8;
    *(void *)(a1 + 88) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 80) = *v9;
  }
  uint64_t v11 = *(int *)(a3 + 40);
  uint64_t v12 = (void *)(a1 + v11);
  Swift::String v13 = (const void *)(a2 + v11);
  uint64_t v14 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = sub_100007428(&qword_100021E58);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = type metadata accessor for URL();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 16))(v12, v13, v18);
    *((unsigned char *)v12 + *(int *)(v14 + 20)) = *((unsigned char *)v13 + *(int *)(v14 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v19 = *(int *)(a3 + 44);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  if (v16(v21, 1, v14))
  {
    uint64_t v22 = sub_100007428(&qword_100021E58);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    uint64_t v23 = type metadata accessor for URL();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v23 - 8) + 16))(v20, v21, v23);
    *((unsigned char *)v20 + *(int *)(v14 + 20)) = *((unsigned char *)v21 + *(int *)(v14 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v20, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_10000AA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80))
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v6;
      *(void *)(a1 + 88) = v7;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v6;
    *(void *)(a1 + 88) = v8;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
LABEL_8:
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = (unsigned char *)(a1 + v9);
  uint64_t v11 = (unsigned char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      uint64_t v17 = type metadata accessor for URL();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v11, v17);
      v10[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v16)
  {
    sub_10000AEA0((uint64_t)v10);
LABEL_13:
    uint64_t v18 = sub_100007428(&qword_100021E58);
    memcpy(v10, v11, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_14;
  }
  uint64_t v27 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v27 - 8) + 24))(v10, v11, v27);
  v10[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
LABEL_14:
  uint64_t v19 = *(int *)(a3 + 44);
  uint64_t v20 = (unsigned char *)(a1 + v19);
  uint64_t v21 = (unsigned char *)(a2 + v19);
  int v22 = v14((unsigned char *)(a1 + v19), 1, v12);
  int v23 = v14(v21, 1, v12);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v28 = type metadata accessor for URL();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v28 - 8) + 24))(v20, v21, v28);
      v20[*(int *)(v12 + 20)] = v21[*(int *)(v12 + 20)];
      return a1;
    }
    sub_10000AEA0((uint64_t)v20);
    goto LABEL_19;
  }
  if (v23)
  {
LABEL_19:
    uint64_t v25 = sub_100007428(&qword_100021E58);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  uint64_t v24 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v24 - 8) + 16))(v20, v21, v24);
  v20[*(int *)(v12 + 20)] = v21[*(int *)(v12 + 20)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
  return a1;
}

uint64_t sub_10000AEA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000AEFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 80);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v8;
    *(void *)(a1 + 88) = v9;
  }
  else
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  }
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = sub_100007428(&qword_100021E58);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = type metadata accessor for URL();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 32))(v11, v12, v17);
    *((unsigned char *)v11 + *(int *)(v13 + 20)) = *((unsigned char *)v12 + *(int *)(v13 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v18 = *(int *)(a3 + 44);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v15(v20, 1, v13))
  {
    uint64_t v21 = sub_100007428(&qword_100021E58);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v22 = type metadata accessor for URL();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
    *((unsigned char *)v19 + *(int *)(v13 + 20)) = *((unsigned char *)v20 + *(int *)(v13 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v19, 0, 1, v13);
  }
  return a1;
}

uint64_t sub_10000B15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_release();
  uint64_t v7 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80))
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v7;
      *(void *)(a1 + 88) = v8;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v7;
    *(void *)(a1 + 88) = v9;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
LABEL_8:
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (unsigned char *)(a1 + v10);
  uint64_t v12 = (unsigned char *)(a2 + v10);
  uint64_t v13 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      uint64_t v18 = type metadata accessor for URL();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 32))(v11, v12, v18);
      v11[*(int *)(v13 + 20)] = v12[*(int *)(v13 + 20)];
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    sub_10000AEA0((uint64_t)v11);
LABEL_13:
    uint64_t v19 = sub_100007428(&qword_100021E58);
    memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  uint64_t v28 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v28 - 8) + 40))(v11, v12, v28);
  v11[*(int *)(v13 + 20)] = v12[*(int *)(v13 + 20)];
LABEL_14:
  uint64_t v20 = *(int *)(a3 + 44);
  uint64_t v21 = (unsigned char *)(a1 + v20);
  uint64_t v22 = (unsigned char *)(a2 + v20);
  int v23 = v15((unsigned char *)(a1 + v20), 1, v13);
  int v24 = v15(v22, 1, v13);
  if (!v23)
  {
    if (!v24)
    {
      uint64_t v29 = type metadata accessor for URL();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v29 - 8) + 40))(v21, v22, v29);
      v21[*(int *)(v13 + 20)] = v22[*(int *)(v13 + 20)];
      return a1;
    }
    sub_10000AEA0((uint64_t)v21);
    goto LABEL_19;
  }
  if (v24)
  {
LABEL_19:
    uint64_t v26 = sub_100007428(&qword_100021E58);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  uint64_t v25 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v25 - 8) + 32))(v21, v22, v25);
  v21[*(int *)(v13 + 20)] = v22[*(int *)(v13 + 20)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v21, 0, 1, v13);
  return a1;
}

uint64_t sub_10000B534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B548);
}

uint64_t sub_10000B548(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100007428(&qword_100021E58);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000B5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B610);
}

void *sub_10000B610(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100007428(&qword_100021E58);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 40);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ShieldIntervention(uint64_t a1)
{
  return sub_10000B6DC(a1, (uint64_t *)&unk_100021EB8);
}

uint64_t sub_10000B6DC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000B714()
{
  sub_10000B7BC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000B7BC()
{
  if (!qword_100021EC8)
  {
    type metadata accessor for VideoPlayerUIViewWrapper(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100021EC8);
    }
  }
}

void *sub_10000B814(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_10000B8E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10000B944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000B9C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000BA3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000BAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000BB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BB48);
}

uint64_t sub_10000BB48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_10000BC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000BC2C);
}

uint64_t sub_10000BC2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t sub_10000BCE8()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_10000BD7C()
{
  return &protocol witness table for Never;
}

uint64_t sub_10000BD88()
{
  return sub_100010F80(&qword_100021FA0, (void (*)(uint64_t))type metadata accessor for VideoPlayerUIViewWrapper);
}

uint64_t sub_10000BDD0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000179BC, 1);
}

uint64_t sub_10000BDEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100007428(&qword_1000221B0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Font.TextStyle();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  int v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v23 = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for Font.TextStyle.largeTitle(_:), v13);
  uint64_t v17 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  a3 &= 1u;
  sub_10001148C(a1, a2, a3);
  swift_bridgeObjectRetain();
  static Font.system(_:design:weight:)();
  sub_1000126D8((uint64_t)v12, &qword_1000221B0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v18 = Font.bold()();
  swift_release();
  uint64_t v19 = swift_getKeyPath();
  uint64_t v20 = static Color.primary.getter();
  uint64_t result = swift_getKeyPath();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3;
  uint64_t v22 = KeyPath;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = v22;
  *(void *)(a5 + 40) = 0;
  *(unsigned char *)(a5 + 48) = 1;
  *(void *)(a5 + 56) = v23;
  *(unsigned char *)(a5 + 64) = 1;
  *(void *)(a5 + 72) = v19;
  *(void *)(a5 + 80) = v18;
  *(void *)(a5 + 88) = result;
  *(void *)(a5 + 96) = v20;
  *(void *)(a5 + 104) = 0x4000000000000000;
  return result;
}

uint64_t sub_10000C058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100007428(&qword_1000221B0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Font.TextStyle();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  int v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v23 = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for Font.TextStyle.body(_:), v13);
  uint64_t v17 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  a3 &= 1u;
  sub_10001148C(a1, a2, a3);
  swift_bridgeObjectRetain();
  uint64_t v18 = static Font.system(_:design:weight:)();
  sub_1000126D8((uint64_t)v12, &qword_1000221B0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v19 = swift_getKeyPath();
  uint64_t v20 = static Color.primary.getter();
  uint64_t result = swift_getKeyPath();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3;
  uint64_t v22 = KeyPath;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = v22;
  *(void *)(a5 + 40) = 0;
  *(unsigned char *)(a5 + 48) = 1;
  *(void *)(a5 + 56) = v23;
  *(unsigned char *)(a5 + 64) = 1;
  *(void *)(a5 + 72) = v19;
  *(void *)(a5 + 80) = v18;
  *(void *)(a5 + 88) = result;
  *(void *)(a5 + 96) = v20;
  *(void *)(a5 + 104) = 0x4000000000000000;
  return result;
}

uint64_t sub_10000C2B0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v58 = a1;
  uint64_t v65 = a2;
  uint64_t v64 = type metadata accessor for ButtonBorderShape();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  v62 = &v49[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v61 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v59 = &v49[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100007428(&qword_100022118);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t)&v49[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_100007428(&qword_100022120);
  __chkstk_darwin(v50);
  uint64_t v8 = &v49[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v51 = sub_100007428(&qword_100022128);
  __chkstk_darwin(v51);
  uint64_t v10 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v52 = sub_100007428(&qword_100022130);
  __chkstk_darwin(v52);
  uint64_t v12 = &v49[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v55 = sub_100007428(&qword_100022138);
  __chkstk_darwin(v55);
  uint64_t v14 = &v49[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_100007428(&qword_100022140);
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  int v16 = &v49[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v54 = sub_100007428(&qword_100022148);
  __chkstk_darwin(v54);
  uint64_t v18 = &v49[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v19 = sub_100007428(&qword_100022028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v6, v53, v19);
  uint64_t v20 = (_OWORD *)(v6 + *(int *)(v4 + 36));
  long long v21 = v71;
  v20[4] = v70;
  v20[5] = v21;
  v20[6] = v72;
  long long v22 = v67;
  *uint64_t v20 = v66;
  v20[1] = v22;
  long long v23 = v69;
  v20[2] = v68;
  v20[3] = v23;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_1000125A0(v6, (uint64_t)v8, &qword_100022118);
  int v24 = &v8[*(int *)(v50 + 36)];
  long long v25 = v74;
  _OWORD *v24 = v73;
  v24[1] = v25;
  _OWORD v24[2] = v75;
  sub_1000126D8(v6, &qword_100022118);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = swift_allocObject();
  LOBYTE(v6) = v58;
  *(unsigned char *)(v27 + 16) = v58 & 1;
  sub_1000125A0((uint64_t)v8, (uint64_t)v10, &qword_100022120);
  uint64_t v28 = (uint64_t *)&v10[*(int *)(v51 + 36)];
  uint64_t *v28 = KeyPath;
  v28[1] = (uint64_t)sub_100011DEC;
  v28[2] = v27;
  sub_1000126D8((uint64_t)v8, &qword_100022120);
  uint64_t v29 = static Color.blue.getter();
  uint64_t v30 = swift_getKeyPath();
  sub_1000125A0((uint64_t)v10, (uint64_t)v12, &qword_100022128);
  unint64_t v31 = (uint64_t *)&v12[*(int *)(v52 + 36)];
  *unint64_t v31 = v30;
  v31[1] = v29;
  sub_1000126D8((uint64_t)v10, &qword_100022128);
  if (v6) {
    uint64_t v32 = static Color.gray.getter();
  }
  else {
    uint64_t v32 = static Color.white.getter();
  }
  uint64_t v33 = v32;
  uint64_t v34 = swift_getKeyPath();
  sub_1000125A0((uint64_t)v12, (uint64_t)v14, &qword_100022130);
  uint64_t v35 = (uint64_t *)&v14[*(int *)(v55 + 36)];
  uint64_t *v35 = v34;
  v35[1] = v33;
  sub_1000126D8((uint64_t)v12, &qword_100022130);
  uint64_t v36 = v59;
  BorderedProminentButtonStyle.init()();
  sub_100011EB4();
  sub_100010F80(&qword_1000221A0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v37 = v61;
  View.buttonStyle<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v36, v37);
  sub_1000126D8((uint64_t)v14, &qword_100022138);
  NSString v38 = v62;
  static ButtonBorderShape.capsule.getter();
  uint64_t v39 = swift_getKeyPath();
  id v40 = (uint64_t *)&v18[*(int *)(v54 + 36)];
  uint64_t v41 = sub_100007428(&qword_1000221A8);
  uint64_t v42 = v63;
  uint64_t v43 = v64;
  (*(void (**)(char *, unsigned char *, uint64_t))(v63 + 16))((char *)v40 + *(int *)(v41 + 28), v38, v64);
  *id v40 = v39;
  uint64_t v44 = v56;
  uint64_t v45 = v57;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v56 + 16))(v18, v16, v57);
  (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v38, v43);
  (*(void (**)(unsigned char *, uint64_t))(v44 + 8))(v16, v45);
  static AnyTransition.opacity.getter();
  static Animation.easeInOut(duration:)();
  uint64_t v46 = AnyTransition.animation(_:)();
  swift_release();
  swift_release();
  uint64_t v47 = v65;
  sub_1000125A0((uint64_t)v18, v65, &qword_100022148);
  *(void *)(v47 + *(int *)(sub_100007428(&qword_100022030) + 36)) = v46;
  return sub_1000126D8((uint64_t)v18, &qword_100022148);
}

uint64_t sub_10000CB6C@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v58 = a1;
  uint64_t v65 = a2;
  uint64_t v64 = type metadata accessor for ButtonBorderShape();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  v62 = &v49[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v61 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v59 = &v49[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100007428(&qword_1000221B8);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t)&v49[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_100007428(&qword_1000221C0);
  __chkstk_darwin(v50);
  uint64_t v8 = &v49[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v51 = sub_100007428(&qword_1000221C8);
  __chkstk_darwin(v51);
  uint64_t v10 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v52 = sub_100007428(&qword_1000221D0);
  __chkstk_darwin(v52);
  uint64_t v12 = &v49[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v55 = sub_100007428(&qword_1000221D8);
  __chkstk_darwin(v55);
  uint64_t v14 = &v49[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_100007428(&qword_1000221E0);
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  int v16 = &v49[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v54 = sub_100007428(&qword_1000221E8);
  __chkstk_darwin(v54);
  uint64_t v18 = &v49[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v19 = sub_100007428(&qword_100022000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v6, v53, v19);
  uint64_t v20 = (_OWORD *)(v6 + *(int *)(v4 + 36));
  long long v21 = v71;
  v20[4] = v70;
  v20[5] = v21;
  v20[6] = v72;
  long long v22 = v67;
  *uint64_t v20 = v66;
  v20[1] = v22;
  long long v23 = v69;
  v20[2] = v68;
  v20[3] = v23;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_1000125A0(v6, (uint64_t)v8, &qword_1000221B8);
  int v24 = &v8[*(int *)(v50 + 36)];
  long long v25 = v74;
  _OWORD *v24 = v73;
  v24[1] = v25;
  _OWORD v24[2] = v75;
  sub_1000126D8(v6, &qword_1000221B8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = swift_allocObject();
  LOBYTE(v6) = v58;
  *(unsigned char *)(v27 + 16) = v58 & 1;
  sub_1000125A0((uint64_t)v8, (uint64_t)v10, &qword_1000221C0);
  uint64_t v28 = (uint64_t *)&v10[*(int *)(v51 + 36)];
  uint64_t *v28 = KeyPath;
  v28[1] = (uint64_t)sub_100012A44;
  v28[2] = v27;
  sub_1000126D8((uint64_t)v8, &qword_1000221C0);
  uint64_t v29 = static Color.blue.getter();
  uint64_t v30 = swift_getKeyPath();
  sub_1000125A0((uint64_t)v10, (uint64_t)v12, &qword_1000221C8);
  unint64_t v31 = (uint64_t *)&v12[*(int *)(v52 + 36)];
  *unint64_t v31 = v30;
  v31[1] = v29;
  sub_1000126D8((uint64_t)v10, &qword_1000221C8);
  if (v6) {
    uint64_t v32 = static Color.gray.getter();
  }
  else {
    uint64_t v32 = static Color.white.getter();
  }
  uint64_t v33 = v32;
  uint64_t v34 = swift_getKeyPath();
  sub_1000125A0((uint64_t)v12, (uint64_t)v14, &qword_1000221D0);
  uint64_t v35 = (uint64_t *)&v14[*(int *)(v55 + 36)];
  uint64_t *v35 = v34;
  v35[1] = v33;
  sub_1000126D8((uint64_t)v12, &qword_1000221D0);
  uint64_t v36 = v59;
  BorderedProminentButtonStyle.init()();
  sub_100012288();
  sub_100010F80(&qword_1000221A0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v37 = v61;
  View.buttonStyle<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v36, v37);
  sub_1000126D8((uint64_t)v14, &qword_1000221D8);
  NSString v38 = v62;
  static ButtonBorderShape.capsule.getter();
  uint64_t v39 = swift_getKeyPath();
  id v40 = (uint64_t *)&v18[*(int *)(v54 + 36)];
  uint64_t v41 = sub_100007428(&qword_1000221A8);
  uint64_t v42 = v63;
  uint64_t v43 = v64;
  (*(void (**)(char *, unsigned char *, uint64_t))(v63 + 16))((char *)v40 + *(int *)(v41 + 28), v38, v64);
  *id v40 = v39;
  uint64_t v44 = v56;
  uint64_t v45 = v57;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v56 + 16))(v18, v16, v57);
  (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v38, v43);
  (*(void (**)(unsigned char *, uint64_t))(v44 + 8))(v16, v45);
  static AnyTransition.opacity.getter();
  static Animation.easeInOut(duration:)();
  uint64_t v46 = AnyTransition.animation(_:)();
  swift_release();
  swift_release();
  uint64_t v47 = v65;
  sub_1000125A0((uint64_t)v18, v65, &qword_1000221E8);
  *(void *)(v47 + *(int *)(sub_100007428(&qword_100022008) + 36)) = v46;
  return sub_1000126D8((uint64_t)v18, &qword_1000221E8);
}

uint64_t sub_10000D428@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    unint64_t v31 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_10001148C(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

id sub_10000D61C()
{
  id v0 = objc_allocWithZone((Class)UIVisualEffectView);

  return [v0 init];
}

id sub_10000D654(void *a1)
{
  return [a1 setEffect:*v1];
}

uint64_t sub_10000D664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000129E0();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000D6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000129E0();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000D72C()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000D748()
{
}

void sub_10000D770(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007428(&qword_100021FC8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - v8;
  id v10 = [self effectWithStyle:9];
  char v11 = static Edge.Set.all.getter();
  *(void *)uint64_t v9 = static VerticalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v12 = sub_100007428(&qword_100021FD0);
  sub_10000D8D4(a1, (uint64_t)&v9[*(int *)(v12 + 44)]);
  sub_1000125A0((uint64_t)v9, (uint64_t)v7, &qword_100021FC8);
  *(void *)a2 = v10;
  *(unsigned char *)(a2 + 8) = v11;
  uint64_t v13 = sub_100007428(&qword_100021FD8);
  sub_1000125A0((uint64_t)v7, a2 + *(int *)(v13 + 48), &qword_100021FC8);
  id v14 = v10;
  sub_1000126D8((uint64_t)v9, &qword_100021FC8);
  sub_1000126D8((uint64_t)v7, &qword_100021FC8);
}

uint64_t sub_10000D8D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007428(&qword_100021FE0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v14 - v8;
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0x4032000000000000;
  v9[16] = 0;
  uint64_t v10 = sub_100007428(&qword_100021FE8);
  sub_10000DA0C(a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  sub_1000125A0((uint64_t)v9, (uint64_t)v7, &qword_100021FE0);
  *(void *)a2 = 0x4040000000000000;
  *(unsigned char *)(a2 + 8) = 0;
  uint64_t v11 = sub_100007428(&qword_100021FF0);
  sub_1000125A0((uint64_t)v7, a2 + *(int *)(v11 + 48), &qword_100021FE0);
  uint64_t v12 = a2 + *(int *)(v11 + 64);
  *(void *)uint64_t v12 = 0x4040000000000000;
  *(unsigned char *)(v12 + 8) = 0;
  sub_1000126D8((uint64_t)v9, &qword_100021FE0);
  return sub_1000126D8((uint64_t)v7, &qword_100021FE0);
}

uint64_t sub_10000DA0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v324 = a2;
  uint64_t v325 = a1;
  uint64_t v315 = sub_100007428(&qword_100021FF8);
  __chkstk_darwin(v315);
  uint64_t v304 = (uint64_t)v276 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007428(&qword_100022000);
  uint64_t v294 = *(void *)(v3 - 8);
  uint64_t v295 = v3;
  __chkstk_darwin(v3);
  v293 = (char *)v276 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007428(&qword_100022008);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  *(void *)&long long v300 = (char *)v276 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v303 = (uint64_t)v276 - v8;
  uint64_t v9 = sub_100007428(&qword_100022010);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v301 = (uint64_t)v276 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v320 = (uint64_t)v276 - v12;
  uint64_t v312 = sub_100007428(&qword_100022018);
  __chkstk_darwin(v312);
  uint64_t v314 = (uint64_t)v276 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v313 = sub_100007428(&qword_100022020);
  __chkstk_darwin(v313);
  uint64_t v306 = (uint64_t)v276 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100007428(&qword_100022028);
  uint64_t v297 = *(void *)(v15 - 8);
  uint64_t v298 = v15;
  __chkstk_darwin(v15);
  v296 = (char *)v276 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100007428(&qword_100022030);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  *(void *)&long long v302 = (char *)v276 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v305 = (uint64_t)v276 - v20;
  *(void *)&long long v317 = type metadata accessor for ShieldIntervention(0);
  uint64_t v310 = *(void *)(v317 - 8);
  __chkstk_darwin(v317);
  uint64_t v311 = v21;
  uint64_t v321 = (uint64_t)v276 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v308 = (uint64_t (*)(void))sub_100007428(&qword_100022038);
  *(void *)&long long v291 = *((void *)v308 - 1);
  __chkstk_darwin(v308);
  *(void *)&long long v307 = (char *)v276 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v283 = sub_100007428(&qword_100022040);
  __chkstk_darwin(v283);
  uint64_t v285 = (uint64_t)v276 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v284 = sub_100007428(&qword_100022048);
  __chkstk_darwin(v284);
  uint64_t v288 = (uint64_t)v276 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v318 = sub_100007428(&qword_100022050);
  *(void *)&long long v292 = *(void *)(v318 - 8);
  uint64_t v25 = __chkstk_darwin(v318);
  uint64_t v287 = (uint64_t)v276 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v286 = (uint64_t)v276 - v27;
  uint64_t v28 = sub_100007428(&qword_100021E58);
  uint64_t v29 = __chkstk_darwin(v28 - 8);
  uint64_t v289 = (uint64_t)v276 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v290 = (uint64_t)v276 - v31;
  uint64_t v309 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  unint64_t v316 = *(void *)(v309 - 8);
  uint64_t v32 = __chkstk_darwin(v309);
  uint64_t v281 = (uint64_t)v276 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v282 = (uint64_t)v276 - v34;
  uint64_t v35 = sub_100007428(&qword_100022058);
  uint64_t v36 = __chkstk_darwin(v35 - 8);
  uint64_t v299 = (uint64_t)v276 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  uint64_t v322 = (uint64_t)v276 - v38;
  uint64_t v39 = sub_100007428(&qword_100022060);
  uint64_t v40 = __chkstk_darwin(v39 - 8);
  uint64_t v42 = (char *)v276 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  uint64_t v44 = (char *)v276 - v43;
  uint64_t v45 = sub_100007428(&qword_100022068);
  uint64_t v46 = __chkstk_darwin(v45 - 8);
  v323 = (char *)v276 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v46);
  uint64_t v49 = (char *)v276 - v48;
  uint64_t v50 = self;
  id v51 = [v50 currentDevice];
  id v280 = [v51 userInterfaceIdiom];

  id v52 = [v50 currentDevice];
  id v53 = [v52 userInterfaceIdiom];

  id v54 = [v50 currentDevice];
  id v55 = [v54 userInterfaceIdiom];

  id v56 = [v50 currentDevice];
  uint64_t v57 = v325;
  id v58 = [v56 userInterfaceIdiom];

  uint64_t v59 = *(void *)(v57 + 24);
  LOBYTE(v401) = *(unsigned char *)(v57 + 16);
  *((void *)&v401 + 1) = v59;
  uint64_t v60 = sub_100007428(&qword_100021FC0);
  State.wrappedValue.getter();
  if (v388 == 1)
  {
    v276[1] = v58;
    v276[2] = v55;
    v276[3] = v53;
    v277 = v44;
    uint64_t v61 = v317;
    uint64_t v319 = v60;
    uint64_t v62 = v322;
    v278 = v42;
    v279 = v49;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v63 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v316 + 48);
    if (v401 == 1)
    {
      uint64_t v64 = v290;
      sub_1000125A0(v57 + *(int *)(v61 + 40), v290, &qword_100021E58);
      int v65 = (*v63)(v64, 1, v309);
      uint64_t v66 = v62;
      uint64_t v67 = v318;
      uint64_t v68 = v292;
      if (v65 == 1)
      {
        sub_1000126D8(v64, &qword_100021E58);
        uint64_t v69 = 1;
      }
      else
      {
        uint64_t v79 = v282;
        sub_1000116D4(v64, v282, type metadata accessor for VideoPlayerUIViewWrapper);
        static Alignment.center.getter();
        _FrameLayout.init(width:height:alignment:)();
        uint64_t v80 = v307;
        sub_10001173C(v79, v307, type metadata accessor for VideoPlayerUIViewWrapper);
        v81 = (_OWORD *)(v80 + *((int *)v308 + 9));
        long long v82 = v427;
        _OWORD *v81 = v426;
        v81[1] = v82;
        v81[2] = v428;
        static AnyTransition.opacity.getter();
        static Animation.easeOut(duration:)();
        uint64_t v83 = AnyTransition.animation(_:)();
        swift_release();
        swift_release();
        uint64_t v84 = v285;
        sub_1000125A0(v80, v285, &qword_100022038);
        *(void *)(v84 + *(int *)(v283 + 36)) = v83;
        sub_1000126D8(v80, &qword_100022038);
        uint64_t v85 = *(void *)(v57 + 40);
        LOBYTE(v401) = *(unsigned char *)(v57 + 32);
        *((void *)&v401 + 1) = v85;
        State.wrappedValue.getter();
        if ((_BYTE)v388) {
          double v86 = 1.0;
        }
        else {
          double v86 = 0.1;
        }
        uint64_t v87 = v288;
        sub_1000125A0(v84, v288, &qword_100022040);
        *(double *)(v87 + *(int *)(v284 + 36)) = v86;
        sub_1000126D8(v84, &qword_100022040);
        uint64_t v88 = static Animation.spring(response:dampingFraction:blendDuration:)();
        uint64_t v89 = *(void *)(v57 + 40);
        LOBYTE(v401) = *(unsigned char *)(v57 + 32);
        *((void *)&v401 + 1) = v89;
        State.wrappedValue.getter();
        char v90 = v388;
        uint64_t v91 = v287;
        sub_1000125A0(v87, v287, &qword_100022048);
        uint64_t v92 = v91 + *(int *)(v318 + 36);
        *(void *)uint64_t v92 = v88;
        *(unsigned char *)(v92 + 8) = v90;
        sub_1000126D8(v87, &qword_100022048);
        sub_10000AEA0(v79);
        uint64_t v93 = v286;
        sub_100011D20(v91, v286, &qword_100022050);
        uint64_t v67 = v318;
        sub_100011D20(v93, v66, &qword_100022050);
        uint64_t v69 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v66, v69, 1, v67);
      uint64_t v94 = *(void *)(v57 + 8);
      *(void *)&long long v388 = *(void *)v57;
      *((void *)&v388 + 1) = v94;
      uint64_t v320 = sub_100007428(&qword_100022080);
      State.projectedValue.getter();
      long long v95 = v401;
      uint64_t v96 = v57;
      uint64_t v97 = *(void *)&v402[0];
      swift_getKeyPath();
      long long v388 = v95;
      *(void *)&long long v389 = v97;
      uint64_t v318 = sub_100007428(&qword_100022088);
      Binding.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      long long v388 = v401;
      long long v389 = v402[0];
      *(void *)&long long v317 = sub_100007428(&qword_100022090);
      Binding.wrappedValue.getter();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      long long v388 = v357;
      unint64_t v316 = sub_100011114();
      uint64_t v98 = Text.init<A>(_:)();
      uint64_t v100 = v99;
      char v102 = v101 & 1;
      sub_10000BDEC(v98, v99, v101 & 1, v103, (uint64_t)&v401);
      sub_100011168(v98, v100, v102);
      swift_bridgeObjectRelease();
      *(void *)&long long v292 = *((void *)&v401 + 1);
      char v104 = v402[0];
      char v105 = v403;
      uint64_t v303 = *((void *)&v403 + 1);
      uint64_t v304 = *((void *)&v402[1] + 1);
      LODWORD(v301) = LOBYTE(v404[0]);
      long long v300 = *(_OWORD *)((char *)v404 + 8);
      uint64_t v295 = *((void *)&v404[1] + 1);
      v293 = (char *)v401;
      uint64_t v106 = *((void *)&v405 + 1);
      uint64_t v294 = v405;
      char v107 = *(unsigned char *)(v96 + 32);
      uint64_t v108 = *(void *)(v96 + 40);
      LOBYTE(v388) = v107;
      *((void *)&v388 + 1) = v108;
      State.wrappedValue.getter();
      uint64_t v309 = 0x3FB999999999999ALL;
      if ((_BYTE)v357) {
        double v109 = 1.0;
      }
      else {
        double v109 = 0.1;
      }
      long long v291 = *(_OWORD *)((char *)v402 + 8);
      LOBYTE(v401) = v107;
      *((void *)&v401 + 1) = v108;
      State.wrappedValue.getter();
      if ((_BYTE)v388) {
        double v110 = 1.0;
      }
      else {
        double v110 = 0.8;
      }
      static UnitPoint.center.getter();
      uint64_t v112 = v111;
      uint64_t v114 = v113;
      char v425 = v104;
      char v424 = v105;
      uint64_t v290 = static Animation.spring(response:dampingFraction:blendDuration:)();
      LOBYTE(v401) = v107;
      *((void *)&v401 + 1) = v108;
      State.wrappedValue.getter();
      char v115 = v388;
      char v116 = v425;
      char v117 = v424;
      static AnyTransition.opacity.getter();
      static Animation.easeOut(duration:)();
      uint64_t v118 = AnyTransition.animation(_:)();
      swift_release();
      swift_release();
      uint64_t v119 = v325;
      uint64_t v120 = v321;
      *(void *)&long long v307 = type metadata accessor for ShieldIntervention;
      sub_10001173C(v325, v321, type metadata accessor for ShieldIntervention);
      uint64_t v121 = *(unsigned __int8 *)(v310 + 80);
      uint64_t v310 = (v121 + 16) & ~v121;
      v311 += v310;
      uint64_t v122 = v310;
      v308 = (uint64_t (*)(void))(v121 | 7);
      uint64_t v123 = swift_allocObject();
      sub_1000116D4(v120, v123 + v122, type metadata accessor for ShieldIntervention);
      *(void *)&long long v401 = v293;
      *((void *)&v401 + 1) = v292;
      LOBYTE(v402[0]) = v116;
      *(_OWORD *)((char *)v402 + 8) = v291;
      *((void *)&v402[1] + 1) = v304;
      LOBYTE(v403) = v117;
      *((void *)&v403 + 1) = v303;
      LOBYTE(v404[0]) = v301;
      *(_OWORD *)((char *)v404 + 8) = v300;
      *((void *)&v404[1] + 1) = v295;
      *(void *)&long long v405 = v294;
      *((void *)&v405 + 1) = v106;
      *(double *)&long long v406 = v109;
      *((double *)&v406 + 1) = v110;
      *(double *)&long long v407 = v110;
      *((void *)&v407 + 1) = v112;
      *(void *)&long long v408 = v114;
      *((void *)&v408 + 1) = v290;
      LOBYTE(v409) = v115;
      *((void *)&v409 + 1) = v118;
      *(void *)&long long v410 = sub_1000117F8;
      *((void *)&v410 + 1) = v123;
      long long v411 = 0uLL;
      uint64_t v124 = *(void *)(v119 + 8);
      *(void *)&long long v357 = *(void *)v119;
      *((void *)&v357 + 1) = v124;
      State.projectedValue.getter();
      long long v125 = v388;
      uint64_t v126 = v389;
      swift_getKeyPath();
      long long v357 = v125;
      *(void *)&long long v358 = v126;
      Binding.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      long long v357 = v388;
      long long v358 = v389;
      Binding.wrappedValue.getter();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      long long v357 = v335;
      uint64_t v127 = Text.init<A>(_:)();
      uint64_t v129 = v128;
      LOBYTE(v120) = v130 & 1;
      sub_10000C058(v127, v128, v130 & 1, v131, (uint64_t)&v412);
      sub_100011168(v127, v129, v120);
      swift_bridgeObjectRelease();
      uint64_t v301 = v412;
      uint64_t v132 = v413;
      char v133 = v414;
      unsigned __int8 v134 = v417;
      uint64_t v320 = v418;
      LODWORD(v318) = v419;
      long long v317 = v420;
      unint64_t v316 = v421;
      uint64_t v303 = v416;
      uint64_t v304 = v422;
      uint64_t v135 = v423;
      char v136 = *(unsigned char *)(v119 + 32);
      uint64_t v137 = *(void *)(v119 + 40);
      LOBYTE(v388) = v136;
      *((void *)&v388 + 1) = v137;
      State.wrappedValue.getter();
      if ((_BYTE)v357) {
        double v138 = 1.0;
      }
      else {
        double v138 = *(double *)&v309;
      }
      uint64_t v139 = static Animation.spring(response:dampingFraction:blendDuration:)();
      LOBYTE(v388) = v136;
      *((void *)&v388 + 1) = v137;
      State.wrappedValue.getter();
      char v140 = v357;
      char v349 = v133;
      unsigned __int8 v348 = v134;
      static AnyTransition.opacity.getter();
      static Animation.easeOut(duration:)();
      uint64_t v141 = AnyTransition.animation(_:)();
      swift_release();
      swift_release();
      *(void *)&long long v350 = v301;
      *((void *)&v350 + 1) = v132;
      LOBYTE(v351[0]) = v349;
      *(_OWORD *)((char *)v351 + 8) = v415;
      *((void *)&v351[1] + 1) = v303;
      LOBYTE(v352) = v348;
      uint64_t v142 = v321;
      *((void *)&v352 + 1) = v320;
      LOBYTE(v353[0]) = v318;
      *(_OWORD *)((char *)v353 + 8) = v317;
      *((void *)&v353[1] + 1) = v316;
      *(void *)&long long v354 = v304;
      *((void *)&v354 + 1) = v135;
      *(double *)&long long v355 = v138;
      *((void *)&v355 + 1) = v139;
      LOBYTE(v356) = v140;
      *((void *)&v356 + 1) = v141;
      v143 = (uint64_t (*)(void))v307;
      sub_10001173C(v119, v321, (uint64_t (*)(void))v307);
      uint64_t v144 = swift_allocObject();
      uint64_t v145 = sub_1000116D4(v142, v144 + v310, v143);
      __chkstk_darwin(v145);
      v276[-4] = v119;
      *(_OWORD *)&v276[-3] = xmmword_100015070;
      sub_100007428(&qword_1000220F0);
      sub_1000118DC();
      v146 = v296;
      Button.init(action:label:)();
      uint64_t v147 = v302;
      sub_10000C2B0(1, v302);
      (*(void (**)(char *, uint64_t))(v297 + 8))(v146, v298);
      uint64_t v148 = v305;
      sub_100011D20(v147, v305, &qword_100022030);
      v149 = &qword_100022058;
      uint64_t v150 = v299;
      sub_1000125A0(v322, v299, &qword_100022058);
      long long v345 = v409;
      long long v346 = v410;
      long long v347 = v411;
      long long v341 = v405;
      long long v342 = v406;
      long long v343 = v407;
      long long v344 = v408;
      long long v337 = v402[1];
      long long v338 = v403;
      long long v339 = v404[0];
      long long v340 = v404[1];
      long long v335 = v401;
      long long v336 = v402[0];
      long long v332 = v354;
      long long v333 = v355;
      long long v334 = v356;
      long long v328 = v351[1];
      long long v329 = v352;
      long long v330 = v353[0];
      long long v331 = v353[1];
      long long v326 = v350;
      long long v327 = v351[0];
      sub_1000125A0(v148, v147, &qword_100022030);
      uint64_t v151 = v306;
      sub_1000125A0(v150, v306, &qword_100022058);
      v152 = (int *)sub_100007428(&qword_100022110);
      uint64_t v153 = v152[12];
      long long v155 = v345;
      long long v154 = v346;
      long long v367 = v345;
      long long v368 = v346;
      long long v156 = v347;
      long long v369 = v347;
      long long v158 = v341;
      long long v157 = v342;
      long long v363 = v341;
      long long v364 = v342;
      long long v159 = v343;
      long long v160 = v344;
      long long v366 = v344;
      long long v365 = v343;
      long long v161 = v339;
      long long v162 = v340;
      long long v362 = v340;
      long long v361 = v339;
      long long v163 = v338;
      long long v360 = v338;
      long long v359 = v337;
      long long v165 = v335;
      long long v164 = v336;
      long long v357 = v335;
      long long v358 = v336;
      v166 = (_OWORD *)(v151 + v153);
      v166[2] = v337;
      v166[3] = v163;
      v166[6] = v158;
      v166[7] = v157;
      v166[4] = v161;
      v166[5] = v162;
      v166[11] = v154;
      v166[12] = v156;
      v166[9] = v160;
      v166[10] = v155;
      v166[8] = v159;
      _OWORD *v166 = v165;
      v166[1] = v164;
      uint64_t v167 = v152[16];
      long long v168 = v333;
      long long v376 = v332;
      long long v377 = v333;
      long long v169 = v334;
      long long v378 = v334;
      long long v170 = v328;
      long long v171 = v329;
      long long v372 = v328;
      long long v373 = v329;
      long long v173 = v330;
      long long v172 = v331;
      long long v375 = v331;
      long long v374 = v330;
      v174 = (_OWORD *)(v151 + v167);
      v174[6] = v332;
      v174[7] = v168;
      v174[8] = v169;
      v174[2] = v170;
      v174[3] = v171;
      long long v176 = v326;
      long long v175 = v327;
      long long v178 = v326;
      long long v177 = v327;
      v174[4] = v173;
      v174[5] = v172;
      _OWORD *v174 = v178;
      v174[1] = v177;
      uint64_t v179 = v151 + v152[20];
      *(void *)uint64_t v179 = 0;
      *(unsigned char *)(v179 + 8) = 1;
      *(void *)(v179 + 16) = 0x3FF0000000000000;
      uint64_t v180 = v151 + v152[24];
      long long v371 = v175;
      long long v370 = v176;
      sub_1000125A0(v147, v180, &qword_100022030);
      sub_1000119F8((uint64_t)&v357);
      sub_100011AD8((uint64_t)&v370);
      sub_1000119F8((uint64_t)&v401);
      sub_100011AD8((uint64_t)&v350);
      sub_1000126D8(v147, &qword_100022030);
      long long v385 = v332;
      long long v386 = v333;
      long long v387 = v334;
      long long v381 = v328;
      long long v382 = v329;
      long long v384 = v331;
      long long v383 = v330;
      long long v380 = v327;
      long long v379 = v326;
      sub_100011B8C((uint64_t)&v379);
      long long v398 = v345;
      long long v399 = v346;
      long long v400 = v347;
      long long v394 = v341;
      long long v395 = v342;
      long long v397 = v344;
      long long v396 = v343;
      long long v390 = v337;
      long long v391 = v338;
      long long v393 = v340;
      long long v392 = v339;
      long long v389 = v336;
      long long v388 = v335;
      sub_100011C40((uint64_t)&v388);
      sub_1000126D8(v150, &qword_100022058);
      sub_1000125A0(v151, v314, &qword_100022020);
      swift_storeEnumTagMultiPayload();
      sub_100012944(&qword_1000220D8, &qword_100022020);
      sub_100012944(&qword_1000220E0, &qword_100021FF8);
      uint64_t v181 = (uint64_t)v277;
      _ConditionalContent<>.init(storage:)();
      sub_1000126D8(v151, &qword_100022020);
      sub_1000126D8(v148, &qword_100022030);
      sub_100011B8C((uint64_t)&v350);
      sub_100011C40((uint64_t)&v401);
      uint64_t v182 = v322;
    }
    else
    {
      uint64_t v73 = v289;
      sub_1000125A0(v57 + *(int *)(v61 + 44), v289, &qword_100021E58);
      int v74 = (*v63)(v73, 1, v309);
      uint64_t v75 = v320;
      v76 = v308;
      uint64_t v77 = v291;
      if (v74 == 1)
      {
        sub_1000126D8(v73, &qword_100021E58);
        uint64_t v78 = 1;
      }
      else
      {
        uint64_t v183 = v281;
        sub_1000116D4(v73, v281, type metadata accessor for VideoPlayerUIViewWrapper);
        static Alignment.center.getter();
        _FrameLayout.init(width:height:alignment:)();
        uint64_t v184 = v307;
        sub_10001173C(v183, v307, type metadata accessor for VideoPlayerUIViewWrapper);
        v185 = (_OWORD *)(v184 + *((int *)v76 + 9));
        long long v186 = v427;
        _OWORD *v185 = v426;
        v185[1] = v186;
        v185[2] = v428;
        sub_10000AEA0(v183);
        sub_100011D20(v184, v75, &qword_100022038);
        uint64_t v78 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(void)))(v77 + 56))(v75, v78, 1, v76);
      uint64_t v187 = *(void *)(v57 + 8);
      *(void *)&long long v388 = *(void *)v57;
      *((void *)&v388 + 1) = v187;
      uint64_t v322 = sub_100007428(&qword_100022080);
      State.projectedValue.getter();
      long long v188 = v401;
      uint64_t v189 = v57;
      uint64_t v190 = *(void *)&v402[0];
      swift_getKeyPath();
      long long v388 = v188;
      *(void *)&long long v389 = v190;
      uint64_t v318 = sub_100007428(&qword_100022088);
      Binding.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      long long v388 = v401;
      long long v389 = v402[0];
      *(void *)&long long v317 = sub_100007428(&qword_100022090);
      Binding.wrappedValue.getter();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      long long v388 = v357;
      unint64_t v316 = sub_100011114();
      uint64_t v191 = Text.init<A>(_:)();
      uint64_t v193 = v192;
      char v195 = v194 & 1;
      sub_10000BDEC(v191, v192, v194 & 1, v196, (uint64_t)&v401);
      sub_100011168(v191, v193, v195);
      swift_bridgeObjectRelease();
      v296 = (char *)*((void *)&v401 + 1);
      uint64_t v297 = v401;
      char v197 = v402[0];
      char v198 = v403;
      uint64_t v306 = *((void *)&v403 + 1);
      *(void *)&long long v307 = *((void *)&v402[1] + 1);
      LODWORD(v305) = LOBYTE(v404[0]);
      long long v302 = *(_OWORD *)((char *)v404 + 8);
      uint64_t v298 = v405;
      uint64_t v299 = *((void *)&v404[1] + 1);
      uint64_t v199 = *((void *)&v405 + 1);
      char v200 = *(unsigned char *)(v189 + 48);
      uint64_t v201 = *(void *)(v189 + 56);
      LOBYTE(v388) = v200;
      *((void *)&v388 + 1) = v201;
      State.wrappedValue.getter();
      long long v292 = *(_OWORD *)((char *)v402 + 8);
      if ((_BYTE)v357) {
        double v202 = 1.0;
      }
      else {
        double v202 = 0.0;
      }
      LOBYTE(v401) = v200;
      *((void *)&v401 + 1) = v201;
      State.wrappedValue.getter();
      if ((_BYTE)v388) {
        double v203 = 1.0;
      }
      else {
        double v203 = 0.8;
      }
      static UnitPoint.center.getter();
      uint64_t v205 = v204;
      uint64_t v207 = v206;
      char v425 = v197;
      char v424 = v198;
      uint64_t v208 = static Animation.spring(response:dampingFraction:blendDuration:)();
      LOBYTE(v401) = v200;
      *((void *)&v401 + 1) = v201;
      State.wrappedValue.getter();
      char v209 = v388;
      char v210 = v425;
      char v211 = v424;
      uint64_t v212 = v321;
      v308 = type metadata accessor for ShieldIntervention;
      sub_10001173C(v189, v321, type metadata accessor for ShieldIntervention);
      uint64_t v213 = *(unsigned __int8 *)(v310 + 80);
      uint64_t v310 = (v213 + 16) & ~v213;
      v311 += v310;
      uint64_t v214 = v310;
      uint64_t v309 = v213 | 7;
      uint64_t v215 = swift_allocObject();
      sub_1000116D4(v212, v215 + v214, type metadata accessor for ShieldIntervention);
      *(void *)&long long v401 = v297;
      *((void *)&v401 + 1) = v296;
      LOBYTE(v402[0]) = v210;
      *(_OWORD *)((char *)v402 + 8) = v292;
      *((void *)&v402[1] + 1) = v307;
      LOBYTE(v403) = v211;
      *((void *)&v403 + 1) = v306;
      LOBYTE(v404[0]) = v305;
      *(_OWORD *)((char *)v404 + 8) = v302;
      *((void *)&v404[1] + 1) = v299;
      *(void *)&long long v405 = v298;
      *((void *)&v405 + 1) = v199;
      *(double *)&long long v406 = v202;
      *((double *)&v406 + 1) = v203;
      *(double *)&long long v407 = v203;
      *((void *)&v407 + 1) = v205;
      *(void *)&long long v408 = v207;
      *((void *)&v408 + 1) = v208;
      LOBYTE(v409) = v209;
      *((void *)&v409 + 1) = sub_10001117C;
      long long v410 = (unint64_t)v215;
      *(void *)&long long v411 = 0;
      uint64_t v216 = *(void *)(v189 + 8);
      uint64_t v217 = v189;
      *(void *)&long long v357 = *(void *)v189;
      *((void *)&v357 + 1) = v216;
      State.projectedValue.getter();
      long long v218 = v388;
      uint64_t v219 = v389;
      swift_getKeyPath();
      long long v357 = v218;
      *(void *)&long long v358 = v219;
      Binding.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      long long v357 = v388;
      long long v358 = v389;
      Binding.wrappedValue.getter();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      long long v357 = v335;
      uint64_t v220 = Text.init<A>(_:)();
      uint64_t v222 = v221;
      char v224 = v223 & 1;
      sub_10000C058(v220, v221, v223 & 1, v225, (uint64_t)&v412);
      sub_100011168(v220, v222, v224);
      swift_bridgeObjectRelease();
      uint64_t v226 = v412;
      uint64_t v227 = v413;
      char v228 = v414;
      uint64_t v322 = v416;
      LODWORD(v318) = v417;
      *(void *)&long long v317 = v418;
      LODWORD(v316) = v419;
      long long v307 = v420;
      uint64_t v305 = v422;
      uint64_t v306 = v421;
      uint64_t v229 = v423;
      char v230 = *(unsigned char *)(v217 + 48);
      uint64_t v231 = *(void *)(v217 + 56);
      LOBYTE(v388) = v230;
      *((void *)&v388 + 1) = v231;
      State.wrappedValue.getter();
      if ((_BYTE)v357) {
        double v232 = 1.0;
      }
      else {
        double v232 = 0.0;
      }
      uint64_t v233 = static Animation.spring(response:dampingFraction:blendDuration:)();
      LOBYTE(v388) = v230;
      *((void *)&v388 + 1) = v231;
      State.wrappedValue.getter();
      *(void *)&long long v350 = v226;
      *((void *)&v350 + 1) = v227;
      LOBYTE(v351[0]) = v228;
      *(_OWORD *)((char *)v351 + 8) = v415;
      uint64_t v234 = v321;
      *((void *)&v351[1] + 1) = v322;
      LOBYTE(v352) = v318;
      *((void *)&v352 + 1) = v317;
      LOBYTE(v353[0]) = v316;
      *(_OWORD *)((char *)v353 + 8) = v307;
      *((void *)&v353[1] + 1) = v306;
      *(void *)&long long v354 = v305;
      *((void *)&v354 + 1) = v229;
      *(double *)&long long v355 = v232;
      *((void *)&v355 + 1) = v233;
      LOBYTE(v356) = v357;
      v235 = v308;
      sub_10001173C(v217, v321, v308);
      uint64_t v236 = swift_allocObject();
      uint64_t v237 = sub_1000116D4(v234, v236 + v310, v235);
      __chkstk_darwin(v237);
      v276[-4] = v217;
      *(_OWORD *)&v276[-3] = xmmword_100015070;
      sub_100007428(&qword_1000220A0);
      sub_1000112A0();
      v238 = v293;
      Button.init(action:label:)();
      uint64_t v239 = v300;
      sub_10000CB6C(0, v300);
      (*(void (**)(char *, uint64_t))(v294 + 8))(v238, v295);
      uint64_t v240 = v303;
      sub_100011D20(v239, v303, &qword_100022008);
      v149 = &qword_100022010;
      uint64_t v241 = v301;
      sub_1000125A0(v320, v301, &qword_100022010);
      long long v345 = v409;
      long long v346 = v410;
      *(void *)&long long v347 = v411;
      long long v341 = v405;
      long long v342 = v406;
      long long v343 = v407;
      long long v344 = v408;
      long long v337 = v402[1];
      long long v338 = v403;
      long long v339 = v404[0];
      long long v340 = v404[1];
      long long v335 = v401;
      long long v336 = v402[0];
      long long v332 = v354;
      long long v333 = v355;
      LOBYTE(v334) = v356;
      long long v328 = v351[1];
      long long v329 = v352;
      long long v330 = v353[0];
      long long v331 = v353[1];
      long long v326 = v350;
      long long v327 = v351[0];
      sub_1000125A0(v240, v239, &qword_100022008);
      uint64_t v242 = v304;
      sub_1000125A0(v241, v304, &qword_100022010);
      v243 = (int *)sub_100007428(&qword_1000220D0);
      uint64_t v244 = v243[12];
      long long v246 = v345;
      long long v245 = v346;
      long long v367 = v345;
      long long v368 = v346;
      long long v248 = v341;
      long long v247 = v342;
      long long v363 = v341;
      long long v364 = v342;
      long long v249 = v343;
      long long v250 = v344;
      long long v366 = v344;
      long long v365 = v343;
      long long v251 = v339;
      long long v252 = v340;
      long long v362 = v340;
      long long v361 = v339;
      long long v253 = v338;
      long long v360 = v338;
      long long v359 = v337;
      long long v255 = v335;
      long long v254 = v336;
      long long v357 = v335;
      long long v358 = v336;
      uint64_t v256 = v242 + v244;
      *(_OWORD *)(v256 + 32) = v337;
      *(_OWORD *)(v256 + 48) = v253;
      *(_OWORD *)(v256 + 96) = v248;
      *(_OWORD *)(v256 + 112) = v247;
      uint64_t v257 = v347;
      *(void *)&long long v369 = v347;
      *(_OWORD *)(v256 + 64) = v251;
      *(_OWORD *)(v256 + 80) = v252;
      *(void *)(v256 + 192) = v257;
      *(_OWORD *)(v256 + 160) = v246;
      *(_OWORD *)(v256 + 176) = v245;
      *(_OWORD *)(v256 + 128) = v249;
      *(_OWORD *)(v256 + 144) = v250;
      *(_OWORD *)uint64_t v256 = v255;
      *(_OWORD *)(v256 + 16) = v254;
      uint64_t v258 = v243[16];
      long long v259 = v333;
      long long v376 = v332;
      long long v377 = v333;
      long long v260 = v328;
      long long v261 = v329;
      long long v372 = v328;
      long long v373 = v329;
      long long v263 = v330;
      long long v262 = v331;
      long long v375 = v331;
      long long v374 = v330;
      uint64_t v264 = v242 + v258;
      *(_OWORD *)(v264 + 96) = v332;
      *(_OWORD *)(v264 + 112) = v259;
      *(_OWORD *)(v264 + 32) = v260;
      *(_OWORD *)(v264 + 48) = v261;
      long long v266 = v326;
      long long v265 = v327;
      long long v268 = v326;
      long long v267 = v327;
      *(_OWORD *)(v264 + 64) = v263;
      *(_OWORD *)(v264 + 80) = v262;
      *(_OWORD *)uint64_t v264 = v268;
      *(_OWORD *)(v264 + 16) = v267;
      LOBYTE(v378) = v334;
      *(unsigned char *)(v264 + 128) = v334;
      uint64_t v269 = v242 + v243[20];
      *(void *)uint64_t v269 = 0;
      *(unsigned char *)(v269 + 8) = 1;
      *(void *)(v269 + 16) = 0x3FF0000000000000;
      uint64_t v270 = v242 + v243[24];
      long long v371 = v265;
      long long v370 = v266;
      sub_1000125A0(v239, v270, &qword_100022008);
      sub_1000113B4((uint64_t)&v357);
      sub_1000114AC((uint64_t)&v370);
      sub_1000113B4((uint64_t)&v401);
      sub_1000114AC((uint64_t)&v350);
      sub_1000126D8(v239, &qword_100022008);
      long long v385 = v332;
      long long v386 = v333;
      LOBYTE(v387) = v334;
      long long v381 = v328;
      long long v382 = v329;
      long long v384 = v331;
      long long v383 = v330;
      long long v380 = v327;
      long long v379 = v326;
      sub_100011554((uint64_t)&v379);
      long long v398 = v345;
      long long v399 = v346;
      *(void *)&long long v400 = v347;
      long long v394 = v341;
      long long v395 = v342;
      long long v397 = v344;
      long long v396 = v343;
      long long v390 = v337;
      long long v391 = v338;
      long long v393 = v340;
      long long v392 = v339;
      long long v389 = v336;
      long long v388 = v335;
      sub_1000115FC((uint64_t)&v388);
      sub_1000126D8(v241, &qword_100022010);
      sub_1000125A0(v242, v314, &qword_100021FF8);
      swift_storeEnumTagMultiPayload();
      sub_100012944(&qword_1000220D8, &qword_100022020);
      sub_100012944(&qword_1000220E0, &qword_100021FF8);
      uint64_t v181 = (uint64_t)v277;
      _ConditionalContent<>.init(storage:)();
      sub_1000126D8(v242, &qword_100021FF8);
      sub_1000126D8(v240, &qword_100022008);
      sub_100011554((uint64_t)&v350);
      sub_1000115FC((uint64_t)&v401);
      uint64_t v182 = v320;
    }
    sub_1000126D8(v182, v149);
    uint64_t v72 = (uint64_t)v323;
    uint64_t v71 = v324;
    uint64_t v271 = (uint64_t)v278;
    uint64_t v49 = v279;
    sub_1000125A0(v181, (uint64_t)v278, &qword_100022060);
    sub_1000125A0(v271, v72, &qword_100022060);
    uint64_t v272 = v72 + *(int *)(sub_100007428(&qword_1000220E8) + 48);
    *(void *)uint64_t v272 = 0;
    *(unsigned char *)(v272 + 8) = 1;
    sub_1000126D8(v181, &qword_100022060);
    sub_1000126D8(v271, &qword_100022060);
    uint64_t v273 = sub_100007428(&qword_100022070);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v273 - 8) + 56))(v72, 0, 1, v273);
    sub_100011D20(v72, (uint64_t)v49, &qword_100022068);
  }
  else
  {
    uint64_t v70 = sub_100007428(&qword_100022070);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v49, 1, 1, v70);
    uint64_t v72 = (uint64_t)v323;
    uint64_t v71 = v324;
  }
  sub_1000125A0((uint64_t)v49, v72, &qword_100022068);
  *(void *)uint64_t v71 = 0;
  *(unsigned char *)(v71 + 8) = 1;
  *(void *)(v71 + 16) = 0x3FF0000000000000;
  uint64_t v274 = sub_100007428(&qword_100022078);
  sub_1000125A0(v72, v71 + *(int *)(v274 + 48), &qword_100022068);
  sub_1000126D8((uint64_t)v49, &qword_100022068);
  return sub_1000126D8(v72, &qword_100022068);
}

uint64_t sub_10000FDF8()
{
  return State.wrappedValue.setter();
}

__n128 sub_10000FE50@<Q0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = sub_100007428(&qword_1000221B0);
  __chkstk_darwin(v8 - 8);
  uint64_t v36 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for Font.TextStyle();
  uint64_t v10 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[1];
  *(void *)&long long v38 = *a1;
  *((void *)&v38 + 1) = v13;
  sub_100007428(&qword_100022080);
  State.wrappedValue.getter();
  uint64_t v14 = *(void *)(*(void *)&v37[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString);
  uint64_t v15 = *(void *)(*(void *)&v37[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString + 8);
  swift_bridgeObjectRetain();
  swift_release();
  *(void *)&long long v38 = v14;
  *((void *)&v38 + 1) = v15;
  sub_100011114();
  uint64_t v16 = Text.init<A>(_:)();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  uint64_t v23 = static Alignment.center.getter();
  sub_10000D428(a3, 0, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v37, 0.0, 1, a4, 0, v23, v24, v16, v18, v22, v20);
  sub_100011168(v16, v18, v22);
  swift_bridgeObjectRelease();
  long long v44 = v37[6];
  long long v45 = v37[7];
  long long v46 = v37[8];
  long long v40 = v37[2];
  long long v41 = v37[3];
  long long v42 = v37[4];
  long long v43 = v37[5];
  long long v38 = v37[0];
  __n128 v39 = (__n128)v37[1];
  uint64_t v25 = v35;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Font.TextStyle.body(_:), v35);
  uint64_t v26 = type metadata accessor for Font.Design();
  uint64_t v27 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v36, 1, 1, v26);
  static Font.system(_:design:weight:)();
  sub_1000126D8(v27, &qword_1000221B0);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  uint64_t v28 = Font.bold()();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  long long v30 = v45;
  *(_OWORD *)(a2 + 96) = v44;
  *(_OWORD *)(a2 + 112) = v30;
  *(_OWORD *)(a2 + 128) = v46;
  long long v31 = v41;
  *(_OWORD *)(a2 + 32) = v40;
  *(_OWORD *)(a2 + 48) = v31;
  long long v32 = v43;
  *(_OWORD *)(a2 + 64) = v42;
  *(_OWORD *)(a2 + 80) = v32;
  __n128 result = v39;
  *(_OWORD *)a2 = v38;
  *(__n128 *)(a2 + 16) = result;
  *(void *)(a2 + 144) = 0x3FE0000000000000;
  *(void *)(a2 + 152) = KeyPath;
  *(void *)(a2 + 160) = v28;
  return result;
}

uint64_t sub_100010188()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000101E0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001025C()
{
  return static Published.subscript.setter();
}

__n128 sub_1000102DC@<Q0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = sub_100007428(&qword_1000221B0);
  __chkstk_darwin(v8 - 8);
  uint64_t v36 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for Font.TextStyle();
  uint64_t v10 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[1];
  *(void *)&long long v38 = *a1;
  *((void *)&v38 + 1) = v13;
  sub_100007428(&qword_100022080);
  State.wrappedValue.getter();
  uint64_t v14 = *(void *)(*(void *)&v37[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString);
  uint64_t v15 = *(void *)(*(void *)&v37[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString + 8);
  swift_bridgeObjectRetain();
  swift_release();
  *(void *)&long long v38 = v14;
  *((void *)&v38 + 1) = v15;
  sub_100011114();
  uint64_t v16 = Text.init<A>(_:)();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  uint64_t v23 = static Alignment.center.getter();
  sub_10000D428(a3, 0, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v37, 0.0, 1, a4, 0, v23, v24, v16, v18, v22, v20);
  sub_100011168(v16, v18, v22);
  swift_bridgeObjectRelease();
  long long v44 = v37[6];
  long long v45 = v37[7];
  long long v46 = v37[8];
  long long v40 = v37[2];
  long long v41 = v37[3];
  long long v42 = v37[4];
  long long v43 = v37[5];
  long long v38 = v37[0];
  __n128 v39 = (__n128)v37[1];
  uint64_t v25 = v35;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Font.TextStyle.body(_:), v35);
  uint64_t v26 = type metadata accessor for Font.Design();
  uint64_t v27 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v36, 1, 1, v26);
  static Font.system(_:design:weight:)();
  sub_1000126D8(v27, &qword_1000221B0);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  uint64_t v28 = Font.bold()();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  long long v30 = v45;
  *(_OWORD *)(a2 + 96) = v44;
  *(_OWORD *)(a2 + 112) = v30;
  *(_OWORD *)(a2 + 128) = v46;
  long long v31 = v41;
  *(_OWORD *)(a2 + 32) = v40;
  *(_OWORD *)(a2 + 48) = v31;
  long long v32 = v43;
  *(_OWORD *)(a2 + 64) = v42;
  *(_OWORD *)(a2 + 80) = v32;
  __n128 result = v39;
  *(_OWORD *)a2 = v38;
  *(__n128 *)(a2 + 16) = result;
  *(void *)(a2 + 144) = KeyPath;
  *(void *)(a2 + 152) = v28;
  return result;
}

uint64_t sub_10001060C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v30 = a2;
  uint64_t v27 = a1;
  uint64_t v33 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v36 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ShieldIntervention(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchTime();
  uint64_t v29 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v26 - v18;
  sub_100010CC0();
  uint64_t v26 = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v28(v17, v13);
  sub_10001173C(v27, (uint64_t)v12, type metadata accessor for ShieldIntervention);
  unint64_t v20 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v21 = swift_allocObject();
  sub_1000116D4((uint64_t)v12, v21 + v20, type metadata accessor for ShieldIntervention);
  aBlock[4] = v31;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008AB8;
  aBlock[3] = v32;
  char v22 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100010F80((unint64_t *)&qword_100021B48, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007428(&qword_100021B50);
  sub_100012944((unint64_t *)&qword_100021B58, &qword_100021B50);
  uint64_t v23 = v33;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v24 = (void *)v26;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v23);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v35);
  return ((uint64_t (*)(char *, uint64_t))v28)(v19, v29);
}

uint64_t sub_100010A6C()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100010ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100007428(&qword_100021FA8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v9 = static Alignment.center.getter();
  v9[1] = v10;
  uint64_t v11 = sub_100007428(&qword_100021FB0);
  sub_10000D770(v2, (uint64_t)v9 + *(int *)(v11 + 44));
  sub_10001173C(v2, (uint64_t)v6, type metadata accessor for ShieldIntervention);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = swift_allocObject();
  sub_1000116D4((uint64_t)v6, v13 + v12, type metadata accessor for ShieldIntervention);
  sub_1000125A0((uint64_t)v9, a2, &qword_100021FA8);
  uint64_t v14 = (uint64_t (**)())(a2 + *(int *)(sub_100007428(&qword_100021FB8) + 36));
  unsigned char *v14 = sub_100010C94;
  v14[1] = (uint64_t (*)())v13;
  v14[2] = 0;
  v14[3] = 0;
  return sub_1000126D8((uint64_t)v9, &qword_100021FA8);
}

void *sub_100010C84()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100010C94()
{
  return sub_1000111B0((uint64_t)&unk_10001D1A8, (uint64_t)sub_100010EDC, (uint64_t)&unk_10001D1C0);
}

unint64_t sub_100010CC0()
{
  unint64_t result = qword_100021B40;
  if (!qword_100021B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021B40);
  }
  return result;
}

uint64_t sub_100010D04()
{
  uint64_t v1 = type metadata accessor for ShieldIntervention(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + v3 + 80)) {
    swift_release();
  }
  uint64_t v6 = v5 + *(int *)(v1 + 40);
  uint64_t v7 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48);
  if (!v8(v6, 1, v7))
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v6, v9);
  }
  uint64_t v10 = v5 + *(int *)(v1 + 44);
  if (!v8(v10, 1, v7))
  {
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100010EDC()
{
  return sub_100010EF4((uint64_t (*)(uint64_t))sub_100010A6C);
}

uint64_t sub_100010EF4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ShieldIntervention(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_100010F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010F78()
{
  return swift_release();
}

uint64_t sub_100010F80(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100010FC8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100011048()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000110C4@<X0>(void *a1@<X8>)
{
  return sub_1000101E0(a1);
}

uint64_t sub_1000110EC()
{
  return sub_10001025C();
}

unint64_t sub_100011114()
{
  unint64_t result = qword_100022098;
  if (!qword_100022098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022098);
  }
  return result;
}

uint64_t sub_100011168(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001117C()
{
  return sub_1000111B0((uint64_t)&unk_10001D2E8, (uint64_t)sub_1000126C0, (uint64_t)&unk_10001D300);
}

uint64_t sub_1000111B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for ShieldIntervention(0) - 8);
  return sub_10001060C(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a1, a2, a3);
}

uint64_t sub_10001123C@<X0>(void *a1@<X8>)
{
  return sub_1000101E0(a1);
}

uint64_t sub_100011264()
{
  return sub_10001025C();
}

double sub_100011294@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_1000102DC((void *)*(void *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32)).n128_u64[0];
  return result;
}

unint64_t sub_1000112A0()
{
  unint64_t result = qword_1000220A8;
  if (!qword_1000220A8)
  {
    sub_100008784(&qword_1000220A0);
    sub_100011340();
    sub_100012944(&qword_1000220C0, &qword_1000220C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000220A8);
  }
  return result;
}

unint64_t sub_100011340()
{
  unint64_t result = qword_1000220B0;
  if (!qword_1000220B0)
  {
    sub_100008784(&qword_1000220B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000220B0);
  }
  return result;
}

uint64_t sub_1000113B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v4 = *(void *)(a1 + 184);
  sub_10001148C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10001149C(v2);
  sub_10001149C(v4);
  return a1;
}

uint64_t sub_10001148C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10001149C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000114AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011554(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000115FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v4 = *(void *)(a1 + 184);
  sub_100011168(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_1000083D4(v2);
  sub_1000083D4(v4);
  return a1;
}

uint64_t sub_1000116D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001173C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000117A4@<X0>(void *a1@<X8>)
{
  return sub_1000101E0(a1);
}

uint64_t sub_1000117CC()
{
  return sub_10001025C();
}

uint64_t sub_1000117F8()
{
  return sub_100010EF4((uint64_t (*)(uint64_t))sub_10000FDF8);
}

uint64_t sub_100011810@<X0>(void *a1@<X8>)
{
  return sub_1000101E0(a1);
}

uint64_t sub_100011838()
{
  return sub_10001025C();
}

uint64_t sub_100011864()
{
  uint64_t v1 = type metadata accessor for ShieldIntervention(0);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = *(uint64_t (**)(void))(v0
                           + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                           + 80);
  if (v4) {
    return v4();
  }
  return result;
}

double sub_1000118D0@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_10000FE50((void *)*(void *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32)).n128_u64[0];
  return result;
}

unint64_t sub_1000118DC()
{
  unint64_t result = qword_1000220F8;
  if (!qword_1000220F8)
  {
    sub_100008784(&qword_1000220F0);
    sub_10001197C();
    sub_100012944(&qword_1000220C0, &qword_1000220C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000220F8);
  }
  return result;
}

unint64_t sub_10001197C()
{
  unint64_t result = qword_100022100;
  if (!qword_100022100)
  {
    sub_100008784(&qword_100022108);
    sub_100011340();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022100);
  }
  return result;
}

uint64_t sub_1000119F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 192);
  sub_10001148C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10001149C(v3);
  sub_10001149C(v4);
  return a1;
}

uint64_t sub_100011AD8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011B8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011C40(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 192);
  sub_100011168(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_1000083D4(v3);
  sub_1000083D4(v4);
  return a1;
}

uint64_t sub_100011D20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007428(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011D84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100011DB4()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100011DDC()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100011DEC(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_100011E04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011E30()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_100011E5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011E88()
{
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t sub_100011EB4()
{
  unint64_t result = qword_100022150;
  if (!qword_100022150)
  {
    sub_100008784(&qword_100022138);
    sub_100011F54();
    sub_100012944(&qword_100022190, &qword_100022198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022150);
  }
  return result;
}

unint64_t sub_100011F54()
{
  unint64_t result = qword_100022158;
  if (!qword_100022158)
  {
    sub_100008784(&qword_100022130);
    sub_100011FF4();
    sub_100012944(&qword_100022190, &qword_100022198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022158);
  }
  return result;
}

unint64_t sub_100011FF4()
{
  unint64_t result = qword_100022160;
  if (!qword_100022160)
  {
    sub_100008784(&qword_100022128);
    sub_100012094();
    sub_100012944(&qword_100022180, &qword_100022188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022160);
  }
  return result;
}

unint64_t sub_100012094()
{
  unint64_t result = qword_100022168;
  if (!qword_100022168)
  {
    sub_100008784(&qword_100022120);
    sub_100012504(&qword_100022170, &qword_100022118, &qword_100022178, &qword_100022028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022168);
  }
  return result;
}

uint64_t sub_100012130()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_100012154(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ButtonBorderShape();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues._buttonBorderShape.setter();
}

uint64_t sub_100012220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001224C()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100012278()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100012288()
{
  unint64_t result = qword_1000221F0;
  if (!qword_1000221F0)
  {
    sub_100008784(&qword_1000221D8);
    sub_100012328();
    sub_100012944(&qword_100022190, &qword_100022198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000221F0);
  }
  return result;
}

unint64_t sub_100012328()
{
  unint64_t result = qword_1000221F8;
  if (!qword_1000221F8)
  {
    sub_100008784(&qword_1000221D0);
    sub_1000123C8();
    sub_100012944(&qword_100022190, &qword_100022198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000221F8);
  }
  return result;
}

unint64_t sub_1000123C8()
{
  unint64_t result = qword_100022200;
  if (!qword_100022200)
  {
    sub_100008784(&qword_1000221C8);
    sub_100012468();
    sub_100012944(&qword_100022180, &qword_100022188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022200);
  }
  return result;
}

unint64_t sub_100012468()
{
  unint64_t result = qword_100022208;
  if (!qword_100022208)
  {
    sub_100008784(&qword_1000221C0);
    sub_100012504(&qword_100022210, &qword_1000221B8, &qword_100022218, &qword_100022000);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022208);
  }
  return result;
}

uint64_t sub_100012504(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008784(a2);
    sub_100012944(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000125A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007428(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012604@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100012638()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100012668@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012694()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000126C0()
{
  return sub_100010EF4((uint64_t (*)(uint64_t))sub_100010188);
}

uint64_t sub_1000126D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007428(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void **initializeBufferWithCopyOfBuffer for VisualEffectView(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for VisualEffectView(id *a1)
{
}

void **assignWithCopy for VisualEffectView(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *initializeWithTake for VisualEffectView(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for VisualEffectView(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for VisualEffectView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VisualEffectView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VisualEffectView()
{
  return &type metadata for VisualEffectView;
}

unint64_t sub_1000128A4()
{
  unint64_t result = qword_100022248;
  if (!qword_100022248)
  {
    sub_100008784(&qword_100021FB8);
    sub_100012944(&qword_100022250, &qword_100021FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022248);
  }
  return result;
}

uint64_t sub_100012944(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008784(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001298C()
{
  unint64_t result = qword_100022258;
  if (!qword_100022258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022258);
  }
  return result;
}

unint64_t sub_1000129E0()
{
  unint64_t result = qword_100022260;
  if (!qword_100022260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022260);
  }
  return result;
}

id sub_100012A90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  int v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

void sub_100012B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = (void *)v5;
  uint64_t v34 = a4;
  uint64_t v35 = a3;
  uint64_t v36 = a2;
  uint64_t v28 = a1;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  __chkstk_darwin(v8);
  uint64_t v31 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v30);
  uint64_t v29 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v11 - 8);
  *(void *)(v5 + 32) = 0xD00000000000002DLL;
  *(void *)(v5 + 40) = 0x8000000100016030;
  *(void *)(v5 + 56) = 0;
  *(unsigned char *)(v5 + 64) = 1;
  *(double *)(v5 + 48) = a5;
  *(void *)(v5 + 16) = [objc_allocWithZone((Class)AWAttentionAwarenessClient) init];
  id v12 = [objc_allocWithZone((Class)AWAttentionAwarenessConfiguration) init];
  NSString v13 = String._bridgeToObjectiveC()();
  [v12 setIdentifier:v13];

  [v12 setContinuousFaceDetectMode:1];
  [v12 setNotificationMask:31];
  [v12 setActivateEyeRelief:1];
  [v12 setActivateAttentionDetection:0];
  uint64_t v14 = *(void **)(v5 + 16);
  [v14 setConfiguration:v12];
  sub_100010CC0();
  swift_bridgeObjectRetain();
  static DispatchQoS.unspecified.getter();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_100013FD0(&qword_100022460, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100007428(&qword_100022468);
  sub_100014018(&qword_100022470, &qword_100022468);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v31, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v33);
  uint64_t v15 = v34;
  uint64_t v16 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v6[3] = v16;
  v6[9] = v35;
  v6[10] = v15;
  if (v14)
  {
    uint64_t v17 = (void *)swift_allocObject();
    uint64_t v18 = v28;
    v17[2] = v6;
    v17[3] = v18;
    v17[4] = v36;
    long long v41 = sub_1000140A8;
    long long v42 = v17;
    aBlock = _NSConcreteStackBlock;
    uint64_t v38 = 1107296256;
    __n128 v39 = sub_100004D5C;
    long long v40 = &unk_10001D420;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_retain();
    id v20 = v14;
    id v21 = v16;
    swift_retain();
    swift_retain();
    swift_release();
    [v20 setEventStreamerWithQueue:v21 block:v19];
    _Block_release(v19);

    uint64_t v16 = (void *)v6[3];
    char v22 = (void *)v6[2];
    if (!v22) {
      goto LABEL_7;
    }
  }
  else
  {
    swift_retain();
    char v22 = (void *)v6[2];
    if (!v22) {
      goto LABEL_7;
    }
  }
  if (!v16)
  {
    __break(1u);
    return;
  }
  long long v41 = sub_1000140D4;
  long long v42 = v6;
  aBlock = _NSConcreteStackBlock;
  uint64_t v38 = 1107296256;
  __n128 v39 = sub_100013214;
  long long v40 = &unk_10001D448;
  uint64_t v23 = _Block_copy(&aBlock);
  swift_retain();
  id v24 = v22;
  id v25 = v16;
  swift_release();
  [v24 setNotificationHandlerWithQueue:v25 block:v23];
  _Block_release(v23);

  uint64_t v16 = (void *)v6[3];
LABEL_7:
  if (v16)
  {
    uint64_t v26 = v16;
    dispatch_activate(v26);
  }
  swift_release();
  swift_release();
}

void sub_1000130D8(char a1, uint64_t a2)
{
  if (qword_100021A30 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000074E4(v4, (uint64_t)qword_100022A30);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received AA notification for face detect state", v7, 2u);
    swift_slowDealloc();
  }

  if ((a1 & 5) != 0)
  {
    uint64_t v8 = *(void (**)(uint64_t))(a2 + 72);
    if (v8)
    {
      uint64_t v9 = swift_retain();
      v8(v9);
      sub_1000083D4((uint64_t)v8);
    }
  }
}

uint64_t sub_100013214(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100013268(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = v2;
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() distance];
  double v6 = v5;
  self;
  id v7 = [(id)swift_dynamicCastObjCClassUnconditional() faceState];
  if (qword_100021A30 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_1000074E4(v8, (uint64_t)qword_100022A30);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134218240;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "ER Distance: %f, ER Face State: %llu", (uint8_t *)v11, 0x16u);
    swift_slowDealloc();
  }

  double v12 = *(double *)(v3 + 56);
  if (*(unsigned char *)(v3 + 64)) {
    double v12 = v6;
  }
  double v13 = (v6 + v12) * 0.5;
  *(double *)(v3 + 56) = v6;
  *(unsigned char *)(v3 + 64) = 0;
  if (v13 <= 0.0)
  {
    if (v7 != (id)2) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v14 = 2;
    return a2(v14);
  }
  if (v7 == (id)2) {
    goto LABEL_14;
  }
  if (v7 != (id)1)
  {
LABEL_15:
    uint64_t v14 = 0;
    return a2(v14);
  }
  if (v13 >= *(double *)(v3 + 48)) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  return a2(v14);
}

void sub_10001348C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  double v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void **)(v0 + 24);
  if (v11)
  {
    aBlock[4] = sub_100013FC8;
    aBlock[5] = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008AB8;
    aBlock[3] = &unk_10001D3D0;
    v20[0] = v8;
    double v12 = _Block_copy(aBlock);
    id v13 = v11;
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v20[1] = &_swiftEmptyArrayStorage;
    sub_100013FD0((unint64_t *)&qword_100021B48, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007428(&qword_100021B50);
    sub_100014018((unint64_t *)&qword_100021B58, &qword_100021B50);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, void))(v7 + 8))(v10, v20[0]);
    swift_release();
  }
  else
  {
    if (qword_100021A30 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_1000074E4(v14, (uint64_t)qword_100022A30);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Error: Streaming queue was nil", v17, 2u);
      swift_slowDealloc();
    }

    uint64_t v18 = *(void (**)(uint64_t))(v1 + 72);
    if (v18)
    {
      uint64_t v19 = swift_retain();
      v18(v19);
      sub_1000083D4((uint64_t)v18);
    }
  }
}

void sub_100013834(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    goto LABEL_4;
  }
  id v15 = 0;
  if ([v2 resumeWithError:&v15])
  {
    id v3 = v15;
LABEL_4:
    if (qword_100021A30 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000074E4(v4, (uint64_t)qword_100022A30);
    double v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Resumed distance streaming", v7, 2u);
      swift_slowDealloc();
    }

    return;
  }
  id v8 = v15;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  if (qword_100021A30 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_1000074E4(v9, (uint64_t)qword_100022A30);
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    double v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Couldn't resume distance streaming", v12, 2u);
    swift_slowDealloc();
  }

  id v13 = *(void (**)(uint64_t))(a1 + 72);
  if (v13)
  {
    uint64_t v14 = swift_retain();
    v13(v14);
    swift_errorRelease();
    sub_1000083D4((uint64_t)v13);
  }
  else
  {
    swift_errorRelease();
  }
}

uint64_t sub_100013A88()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v10 = *(void **)(v0 + 24);
  if (v10)
  {
    aBlock[4] = sub_100013FA8;
    aBlock[5] = v0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008AB8;
    aBlock[3] = &unk_10001D3A8;
    v13[0] = result;
    os_log_type_t v11 = _Block_copy(aBlock);
    id v12 = v10;
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v13[1] = &_swiftEmptyArrayStorage;
    sub_100013FD0((unint64_t *)&qword_100021B48, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007428(&qword_100021B50);
    sub_100014018((unint64_t *)&qword_100021B58, &qword_100021B50);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v11);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, void))(v6 + 8))(v9, v13[0]);
    return swift_release();
  }
  return result;
}

void sub_100013D24(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1) {
    goto LABEL_4;
  }
  id v11 = 0;
  if ([v1 cancelFaceDetectStreamWithError:&v11])
  {
    id v2 = v11;
LABEL_4:
    if (qword_100021A30 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_1000074E4(v3, (uint64_t)qword_100022A30);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stopped distance streaming", v6, 2u);
      swift_slowDealloc();
    }
    goto LABEL_13;
  }
  id v7 = v11;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  if (qword_100021A30 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_1000074E4(v8, (uint64_t)qword_100022A30);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v9, "Couldn't stop distance streaming", v10, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();
LABEL_13:
}

uint64_t sub_100013F34()
{
  swift_bridgeObjectRelease();
  sub_1000083D4(*(void *)(v0 + 72));

  return _swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for DistanceStreaming()
{
  return self;
}

void sub_100013FA8()
{
  sub_100013D24(v0);
}

uint64_t sub_100013FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013FC0()
{
  return swift_release();
}

void sub_100013FC8()
{
  sub_100013834(v0);
}

uint64_t sub_100013FD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100014018(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008784(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014068()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000140A8(uint64_t a1)
{
  return sub_100013268(a1, *(uint64_t (**)(uint64_t))(v1 + 24));
}

void sub_1000140D4(char a1)
{
  sub_1000130D8(a1, v1);
}

uint64_t sub_1000140F4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
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

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
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

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.animation(_:)()
{
  return AnyTransition.animation(_:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ButtonBorderShape.capsule.getter()
{
  return static ButtonBorderShape.capsule.getter();
}

uint64_t type metadata accessor for ButtonBorderShape()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues._buttonBorderShape.getter()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t EnvironmentValues._buttonBorderShape.setter()
{
  return EnvironmentValues._buttonBorderShape.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t Font.bold()()
{
  return Font.bold()();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.easeOut(duration:)()
{
  return static Animation.easeOut(duration:)();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
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

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
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

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
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

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
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

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void dispatch_activate(dispatch_object_t object)
{
}

void exit(int a1)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}