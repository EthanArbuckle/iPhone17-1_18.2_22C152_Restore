int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter();
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

void type metadata accessor for HKSPSleepLockScreenState(uint64_t a1)
{
}

uint64_t sub_100002AE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100002B18(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002B24(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002B44(uint64_t result, int a2, int a3)
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

__n128 sub_100002B84(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002B90(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002BB0(uint64_t result, int a2, int a3)
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

void sub_100002C00(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100002C50()
{
  swift_getObjectType();
  uint64_t v6 = _typeName(_:qualified:)();
  v1._countAndFlagsBits = 58;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier);
  char v3 = *(void **)(v0 + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier + 8);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return v6;
}

void sub_100002CD8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  sub_100004984(a1, (uint64_t)v35);
  CGFloat v4 = *(double *)v35;
  CGFloat v5 = *(double *)&v35[1];
  CGFloat v6 = *(double *)&v35[2];
  CGFloat v7 = *(double *)&v35[3];
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (double *)&v2[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  if (v2[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame + 32])
  {
    sub_100004984(a1, (uint64_t)v36);
    if (v37) {
      return;
    }
  }
  else
  {
    CGFloat v13 = *v12;
    CGFloat v14 = v12[1];
    CGFloat v15 = v12[2];
    CGFloat v16 = v12[3];
    sub_100004984(a1, (uint64_t)v36);
    if ((v37 & 1) == 0)
    {
      v38.origin.x = v13;
      v38.origin.y = v14;
      v38.size.width = v15;
      v38.size.height = v16;
      v39.origin.x = v4;
      v39.origin.y = v5;
      v39.size.width = v6;
      v39.size.height = v7;
      if (CGRectEqualToRect(v38, v39)) {
        return;
      }
    }
  }
  static Logger.mode.getter();
  v17 = v2;
  v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v34 = v30;
    *(_DWORD *)uint64_t v20 = 136446466;
    uint64_t v21 = _typeName(_:qualified:)();
    *(void *)&long long v31 = sub_10000DFE0(v21, v22, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    char v23 = *((unsigned char *)v12 + 32);
    long long v24 = *((_OWORD *)v12 + 1);
    long long v31 = *(_OWORD *)v12;
    long long v32 = v24;
    char v33 = v23;
    sub_100004A18(0, &qword_1000193D8, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    uint64_t v25 = String.init<A>(describing:)();
    *(void *)&long long v31 = sub_10000DFE0(v25, v26, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%{public}s] Calculated new visibleContentFrame: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v28 = (void *)Strong;
    sub_1000066B0();
  }
}

id sub_100003050(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGFloat v5 = v4;
  swift_getObjectType();
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  CGFloat v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  CGFloat v14 = &v5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  id result = (id)CGRectEqualToRect(*(CGRect *)&v5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds], v30);
  if ((result & 1) == 0)
  {
    static Logger.mode.getter();
    CGFloat v16 = v5;
    v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v29 = v26;
      *(_DWORD *)uint64_t v19 = 136446466;
      uint64_t v20 = _typeName(_:qualified:)();
      *(void *)&long long v27 = sub_10000DFE0(v20, v21, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      long long v22 = *((_OWORD *)v14 + 1);
      long long v27 = *(_OWORD *)v14;
      long long v28 = v22;
      type metadata accessor for CGRect(0);
      uint64_t v23 = String.init<A>(describing:)();
      *(void *)&long long v27 = sub_10000DFE0(v23, v24, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%{public}s] Received new safeContentBounds: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return [v16 setNeedsLayout];
  }
  return result;
}

uint64_t sub_100003308(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  CGFloat v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004844();
  uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100004884;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004B88;
  aBlock[3] = &unk_100014BA8;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000048A4();
  sub_100004A18(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_1000048FC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_10000359C()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    Swift::String v1 = Strong;
    [Strong setNeedsLayout];
  }
}

uint64_t sub_1000035F8(unsigned char *a1)
{
  sub_100004A18(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t result = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v9 - v4;
  if (*a1 == 1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v7 = (void *)Strong;
      uint64_t v8 = (void *)swift_unknownObjectWeakLoadStrong();

      if (v8)
      {
        dispatch thunk of LockScreenContentModel.alarm.getter();
        sub_100006380((uint64_t)v5);

        sub_1000047B8((uint64_t)v5);
      }
    }
    return dispatch thunk of LockScreenContentModel.alarmButtonPressed.setter();
  }
  return result;
}

void sub_100003720()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    static Logger.mode.getter();
    id v6 = v5;
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      v13[0] = v0;
      uint64_t v10 = (uint8_t *)v9;
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136446210;
      uint64_t v11 = sub_100002C50();
      v13[1] = sub_10000DFE0(v11, v12, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s] traitCollectionDidChange", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, void))(v1 + 8))(v3, v13[0]);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    [v6 setNeedsLayout];
  }
}

void sub_100003990()
{
  if (*(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView])
  {
    [v0 addSubview:];
    uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView];
    if (v1)
    {
      uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView];
      if (v2)
      {
        id v3 = v1;
        id v13 = v2;
        id v4 = [v13 layer];
        uint64_t v5 = self;
        id v6 = [v5 blueColor];
        id v7 = [v6 colorWithAlphaComponent:0.3];

        id v8 = [v7 CGColor];
        [v4 setBackgroundColor:v8];

        [v0 addSubview:v13];
        [v0 sendSubviewToBack:v13];
        id v9 = [v3 layer];
        id v10 = [v5 greenColor];
        id v11 = [v10 colorWithAlphaComponent:0.1];

        id v12 = [v11 CGColor];
        [v9 setBackgroundColor:v12];

        [v0 addSubview:v3];
        [v0 sendSubviewToBack:v3];
      }
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_100003BD4()
{
  uint64_t v88 = type metadata accessor for LockScreenContentState();
  uint64_t v87 = *(void *)(v88 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v86 = (char *)&v84 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v91 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v84 - v7;
  __chkstk_darwin(v6);
  id v10 = (char *)&v84 - v9;
  id v11 = (objc_class *)type metadata accessor for LockScreenContainerView();
  v94.receiver = v0;
  v94.super_class = v11;
  [super layoutSubviews];
  static Logger.mode.getter();
  id v12 = v0;
  id v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v92 = v3;
  v90 = v8;
  if (v15)
  {
    CGFloat v16 = (uint8_t *)swift_slowAlloc();
    double v95 = COERCE_DOUBLE(swift_slowAlloc());
    *(_DWORD *)CGFloat v16 = 136446210;
    uint64_t v17 = sub_100002C50();
    uint64_t v93 = sub_10000DFE0(v17, v18, (uint64_t *)&v95);
    id v8 = v90;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%{public}s] layoutSubviews", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v92;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
  v19(v10, v2);
  uint64_t v20 = *(void **)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView];
  if (v20) {
    [v20 setFrame:*(double *)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds], *(double *)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 8], *(double *)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 16], *(double *)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 24]];
  }
  unint64_t v21 = (CGRect *)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  double v22 = *(double *)&v12[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 16];
  id v85 = self;
  id v23 = [v85 mainScreen];
  [v23 _referenceBounds];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  v97.origin.x = v25;
  v97.origin.double y = v27;
  v97.size.width = v29;
  v97.size.height = v31;
  BOOL v32 = CGRectGetWidth(v97) < 414.0;
  double v33 = 92.0;
  if (!v32) {
    double v33 = 102.0;
  }
  double v34 = v22 - v33;
  double Height = CGRectGetHeight(*v21);
  static Logger.mode.getter();
  v36 = v12;
  char v37 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.debug.getter();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v89 = v2;
  if (v39)
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 136446466;
    uint64_t v41 = sub_100002C50();
    double v95 = COERCE_DOUBLE(sub_10000DFE0(v41, v42, &v93));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2082;
    double v95 = v34;
    double v96 = Height;
    type metadata accessor for CGSize(0);
    uint64_t v43 = String.init<A>(describing:)();
    double v95 = COERCE_DOUBLE(sub_10000DFE0(v43, v44, &v93));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%{public}s] targetSize: %{public}s", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    uint64_t v2 = v89;
    swift_slowDealloc();
    swift_slowDealloc();

    v45 = v90;
  }
  else
  {

    v45 = v8;
  }
  v19(v45, v2);
  v48 = v91;
  uint64_t v49 = OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView;
  v50 = *(void **)&v36[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView];
  if (!v50)
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LODWORD(v46) = 1112014848;
  LODWORD(v47) = 1112014848;
  [v50 systemLayoutSizeFittingSize:v34 withHorizontalFittingPriority:Height verticalFittingPriority:v46 v47];
  double v52 = v51;
  double v54 = v53;
  static Logger.mode.getter();
  v55 = v36;
  v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.debug.getter();
  BOOL v58 = os_log_type_enabled(v56, v57);
  v90 = (char *)v49;
  if (v58)
  {
    uint64_t v59 = swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136446466;
    uint64_t v60 = sub_100002C50();
    double v95 = COERCE_DOUBLE(sub_10000DFE0(v60, v61, &v93));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2082;
    double v95 = v52;
    double v96 = v54;
    type metadata accessor for CGSize(0);
    v84 = v19;
    uint64_t v62 = String.init<A>(describing:)();
    double v95 = COERCE_DOUBLE(sub_10000DFE0(v62, v63, &v93));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "[%{public}s] size: %{public}s", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v84(v91, v89);
  }
  else
  {

    v19(v48, v2);
  }
  CGRect.center.getter();
  double v65 = v64;
  v66 = v86;
  dispatch thunk of LockScreenContentModel.state.getter();
  int v67 = (*(uint64_t (**)(char *, uint64_t))(v87 + 88))(v66, v88);
  if (v67 == enum case for LockScreenContentState.loading(_:)
    || v67 == enum case for LockScreenContentState.windDown(_:)
    || v67 == enum case for LockScreenContentState.bedtime(_:))
  {
    double y = v21->origin.y;
  }
  else
  {
    if (v67 != enum case for LockScreenContentState.wakeUpGreeting(_:))
    {
LABEL_31:
      id result = (id)_assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    id v68 = [v85 mainScreen];
    [v68 _referenceBounds];

    CGRect.center.getter();
    double y = v69 + v54 / -2.5;
  }
  v71 = v90;
  v72 = *(void **)&v90[(void)v36];
  if (!v72) {
    goto LABEL_28;
  }
  [v72 setFrame:v65 + v52 * -0.5, y, v52, v54];
  v73 = *(void **)&v71[(void)v36];
  if (!v73)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  [v73 frame];
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v79 = v78;
  uint64_t v81 = v80;
  v82 = &v55[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  sub_100004984((uint64_t)&v55[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame], (uint64_t)&v95);
  *(void *)v82 = v75;
  *((void *)v82 + 1) = v77;
  *((void *)v82 + 2) = v79;
  *((void *)v82 + 3) = v81;
  v82[32] = 0;
  sub_100002CD8((uint64_t)&v95);
  id result = *(id *)&v55[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView];
  if (!result) {
    return result;
  }
  if (v82[32]) {
    goto LABEL_30;
  }
  return [result setFrame:*((double *)v82) *((double *)v82 + 1) *((double *)v82 + 2) *((double *)v82 + 3)];
}

id sub_100004590(void *a1)
{
  id result = [a1 state];
  if (result == (id)3)
  {
    [a1 translationInView:v1];
    if (fabs(v4) >= fabs(v5))
    {
      if (v4 >= 0.0) {
        return (id)dispatch thunk of LockScreenContentModel.moveDemoStateBackward()();
      }
      else {
        return (id)dispatch thunk of LockScreenContentModel.moveDemoStateForward()();
      }
    }
    else
    {
      return (id)dispatch thunk of LockScreenContentModel.toggleDemoMode()();
    }
  }
  return result;
}

id sub_1000046B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenContainerView();
  return [super dealloc];
}

uint64_t type metadata accessor for LockScreenContainerView()
{
  return self;
}

uint64_t sub_1000047B8(uint64_t a1)
{
  sub_100004A18(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100004844()
{
  unint64_t result = qword_1000193C8;
  if (!qword_1000193C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000193C8);
  }
  return result;
}

void sub_100004884()
{
}

uint64_t sub_10000488C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000489C()
{
  return swift_release();
}

unint64_t sub_1000048A4()
{
  unint64_t result = qword_1000196E0;
  if (!qword_1000196E0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000196E0);
  }
  return result;
}

unint64_t sub_1000048FC()
{
  unint64_t result = qword_1000196F0;
  if (!qword_1000196F0)
  {
    sub_100004A18(255, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000196F0);
  }
  return result;
}

uint64_t sub_100004984(uint64_t a1, uint64_t a2)
{
  sub_100004A18(0, &qword_1000193D8, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100004A18(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_100004A7C()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = 1;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v2 = &v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView____lazy_storage___screenBounds];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  uint64_t v3 = &v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100004B60(uint64_t a1)
{
  return a1;
}

uint64_t sub_100004B88(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100004BCC()
{
  swift_getObjectType();
  uint64_t v6 = _typeName(_:qualified:)();
  v1._countAndFlagsBits = 58;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier + 8);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100004C54()
{
  [*(id *)(v0 + 16) invalidate];

  return _swift_deallocClassInstance(v0, 24, 7);
}

id sub_100004C9C()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::String v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver] = 0;
  uint64_t v9 = &off_100019000;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentStateObserver] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = 0;
  id v10 = v0;
  UUID.init()();
  uint64_t v11 = UUID.uuidString.getter();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000F834(8, v11, v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = static String._fromSubstring(_:)();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  unint64_t v18 = (uint64_t *)&v10[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier];
  uint64_t *v18 = v15;
  v18[1] = v17;
  id v19 = objc_allocWithZone((Class)type metadata accessor for LockScreenContentModel());
  swift_bridgeObjectRetain();
  uint64_t v20 = &off_100019000;
  *(void *)&v10[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model] = LockScreenContentModel.init(debugIdentifier:)();

  unint64_t v21 = (objc_class *)type metadata accessor for LockScreenViewController();
  v37.receiver = v10;
  v37.super_class = v21;
  id v22 = [super initWithNibName:0 bundle:0];
  static Logger.mode.getter();
  id v23 = v22;
  double v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    double v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)double v26 = 136446210;
    uint64_t v34 = v1;
    uint64_t v27 = sub_100004BCC();
    uint64_t v35 = sub_10000DFE0(v27, v28, &v36);
    uint64_t v9 = &off_100019000;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%{public}s] init", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v20 = &off_100019000;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v34);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  id v29 = *(id *)((char *)v20[125] + (void)v23);
  uint64_t v30 = LockScreenContentModel.stateDidChange.getter();

  uint64_t v36 = v30;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1000101DC();
  sub_100010244((unint64_t *)&unk_1000197F0, (void (*)(uint64_t))sub_1000101DC);
  uint64_t v31 = Publisher<>.sink(receiveValue:)();
  swift_release();

  swift_release();
  *(void *)((char *)v9[128] + (void)v23) = v31;
  swift_release();
  return v23;
}

void sub_100005144(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_100006000(a1);
  }
}

id sub_1000051EC()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::String v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  id v5 = v0;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v1;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v10 = sub_100004BCC();
    uint64_t v16 = sub_10000DFE0(v10, v11, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%{public}s] deinit", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v15);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  unint64_t v12 = (objc_class *)type metadata accessor for LockScreenViewController();
  v18.receiver = v5;
  v18.super_class = v12;
  return [super dealloc];
}

void sub_1000054D4()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::String v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (objc_class *)type metadata accessor for LockScreenViewController();
  v46.receiver = v0;
  v46.super_class = v5;
  [super viewDidLoad];
  static Logger.mode.getter();
  uint64_t v6 = v0;
  os_log_type_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v43 = v1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v11 = sub_100004BCC();
    uint64_t v44 = sub_10000DFE0(v11, v12, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s] view did load", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v43);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  unint64_t v13 = *(void **)&v6[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
  uint64_t v14 = *(void *)&v6[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier];
  uint64_t v15 = *(void *)&v6[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier + 8];
  uint64_t v16 = (char *)objc_allocWithZone((Class)type metadata accessor for LockScreenContainerView());
  uint64_t v17 = v6;
  id v18 = v13;
  swift_bridgeObjectRetain();
  id v19 = sub_10000F1C4(v18, v17, v14, v15, v16);
  uint64_t v20 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView;
  unint64_t v21 = *(void **)&v17[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView];
  *(void *)&v17[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView] = v19;

  id v22 = *(void **)&v17[v20];
  if (!v22)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v23 = self;
  id v24 = v22;
  id v25 = [v23 mainScreen];
  [v25 _referenceBounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  [v24 setFrame:v27, v29, v31, v33];
  uint64_t v34 = *(void **)&v17[v20];
  if (!v34)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v35 = v34;
  NSString v36 = String._bridgeToObjectiveC()();
  [v35 setAccessibilityIdentifier:v36];

  id v37 = [v17 view];
  if (!v37)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!*(void *)&v17[v20])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  os_log_type_t v38 = v37;
  [v37 addSubview:];

  id v39 = [v17 view];
  if (v39)
  {
    uint64_t v40 = v39;
    NSString v41 = String._bridgeToObjectiveC()();
    [v40 setAccessibilityIdentifier:v41];

    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_100005990(char a1, SEL *a2, const char *a3)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (objc_class *)type metadata accessor for LockScreenViewController();
  v24.receiver = v3;
  v24.super_class = v11;
  [super a1 & 1];
  static Logger.mode.getter();
  id v12 = v3;
  unint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = a3;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136446210;
    uint64_t v21 = v7;
    uint64_t v17 = sub_100004BCC();
    uint64_t v22 = sub_10000DFE0(v17, v18, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v20, v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_100005C30(double a1, double a2, double a3, double a4)
{
  id v5 = v4;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchPredicate();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  uint64_t *v17 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  char v18 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v15 + 8))(v17, v14);
  if (v18)
  {
    static Logger.mode.getter();
    id v19 = v5;
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446466;
      uint64_t v23 = sub_100004BCC();
      uint64_t v35 = sub_10000DFE0(v23, v24, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      uint64_t v35 = *(void *)&a1;
      double v36 = a2;
      double v37 = a3;
      double v38 = a4;
      type metadata accessor for CGRect(0);
      uint64_t v34 = v10;
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v35 = sub_10000DFE0(v25, v26, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%{public}s] update layout with safe bounds: %{public}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v34);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    double v27 = *(char **)&v19[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView];
    if (v27)
    {
      double v28 = (double *)&v27[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
      CGFloat v29 = *(double *)&v27[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
      CGFloat v30 = *(double *)&v27[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 8];
      CGFloat v31 = *(double *)&v27[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 16];
      CGFloat v32 = *(double *)&v27[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 24];
      double *v28 = a1;
      v28[1] = a2;
      v28[2] = a3;
      v28[3] = a4;
      double v33 = v27;
      sub_100003050(v29, v30, v31, v32);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void *sub_100006000(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for LockScreenContentState();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  CGFloat v32 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v8 = &v25[-v7];
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v25[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Logger.mode.getter();
  CGFloat v31 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16);
  v31(v8, a1, v3);
  id v13 = v1;
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v10;
    uint64_t v18 = v17;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v34 = v28;
    *(_DWORD *)uint64_t v18 = 136446466;
    os_log_t v27 = v14;
    int v26 = v16;
    uint64_t v19 = sub_100004BCC();
    uint64_t v33 = sub_10000DFE0(v19, v20, &v34);
    uint64_t v29 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v31(v32, (uint64_t)v8, v3);
    uint64_t v21 = String.init<A>(describing:)();
    uint64_t v33 = sub_10000DFE0(v21, v22, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v8, v3);
    os_log_t v23 = v27;
    _os_log_impl((void *)&_mh_execute_header, v27, (os_log_type_t)v26, "[%{public}s] updated content state: %{public}s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v30 + 8))(v12, v29);
  }
  else
  {

    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v8, v3);
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return sub_100009C80();
}

void sub_100006380(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_10000DD20(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v17 - v5;
  uint64_t v7 = type metadata accessor for Alarm();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchPredicate();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *uint64_t v14 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  char v15 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v11);
  if (v15)
  {
    sub_10000F144(a1, (uint64_t)v6, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_10000EC40((uint64_t)v6, (uint64_t)&qword_1000193C0, (uint64_t)&type metadata accessor for Alarm, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_10000DD20);
      sub_100007A30();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      sub_1000068DC((uint64_t)v10);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    id v16 = *(id *)(v2 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model);
    dispatch thunk of LockScreenContentModel.didInteractWithAlarm(_:)();
  }
  else
  {
    __break(1u);
  }
}

void *sub_1000066B0()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  id v5 = v0;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v1;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v10 = sub_100004BCC();
    uint64_t v15 = sub_10000DFE0(v10, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%{public}s] contentSizeDidChange", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  unint64_t result = (void *)sub_100008798();
  if (result)
  {
    [result didChangeStyle];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000068DC(uint64_t a1)
{
  uint64_t v105 = a1;
  uint64_t ObjectType = swift_getObjectType();
  sub_10000DD20(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v1 - 8);
  objc_super v94 = (char *)&v83 - v2;
  uint64_t v3 = type metadata accessor for Alarm();
  uint64_t v104 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v87 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v101 = (char *)&v83 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v83 - v9;
  uint64_t v86 = v11;
  __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v83 - v12;
  uint64_t v92 = type metadata accessor for Logger();
  uint64_t v91 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v15 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LockScreenViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v17 = self;
  id v18 = [v17 bundleForClass:ObjCClassFromMetadata];
  v108._object = (void *)0xE000000000000000;
  v19._object = (void *)0x8000000100013100;
  v19._uint64_t countAndFlagsBits = 0xD000000000000012;
  v20._uint64_t countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  v108._uint64_t countAndFlagsBits = 0;
  Swift::String v21 = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, (Swift::String_optional)0, (NSBundle)v18, v20, v108);
  uint64_t countAndFlagsBits = v21._countAndFlagsBits;
  object = v21._object;

  id v22 = [v17 bundleForClass:ObjCClassFromMetadata];
  v109._object = (void *)0xE000000000000000;
  v23._object = (void *)0x8000000100013120;
  v23._uint64_t countAndFlagsBits = 0xD000000000000010;
  v24._uint64_t countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  v109._uint64_t countAndFlagsBits = 0;
  Swift::String v25 = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, (NSBundle)v22, v24, v109);
  uint64_t v95 = v25._countAndFlagsBits;
  CGRect v97 = v25._object;

  id v26 = [v17 bundleForClass:ObjCClassFromMetadata];
  v110._object = (void *)0xE000000000000000;
  v27._object = (void *)0x8000000100013140;
  v27._uint64_t countAndFlagsBits = 0xD000000000000010;
  v28._uint64_t countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  v110._uint64_t countAndFlagsBits = 0;
  Swift::String v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v110);
  uint64_t v88 = v29._countAndFlagsBits;
  double v96 = v29._object;

  id v30 = [v17 bundleForClass:ObjCClassFromMetadata];
  v111._object = (void *)0xE000000000000000;
  CGFloat v31 = v13;
  v32._object = (void *)0x8000000100013160;
  v32._uint64_t countAndFlagsBits = 0xD000000000000012;
  v33._uint64_t countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  v111._uint64_t countAndFlagsBits = 0;
  Swift::String v93 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, (Swift::String_optional)0, (NSBundle)v30, v33, v111);

  static Logger.mode.getter();
  uint64_t v34 = v105;
  uint64_t v35 = v104 + 16;
  double v36 = *(void (**)(char *, uint64_t, uint64_t))(v104 + 16);
  v36(v31, v105, v3);
  uint64_t v89 = v10;
  v36(v10, v34, v3);
  uint64_t v103 = v3;
  v98 = v36;
  v36(v101, v34, v3);
  v90 = v15;
  double v37 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    aBlock[0] = v84;
    *(_DWORD *)uint64_t v39 = 136446978;
    uint64_t v40 = _typeName(_:qualified:)();
    uint64_t v106 = sub_10000DFE0(v40, v41, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 1026;
    char v42 = Alarm.isSleepAlarm.getter();
    uint64_t v43 = v31;
    int v44 = v42 & 1;
    uint64_t ObjectType = v35;
    uint64_t v45 = v103;
    objc_super v46 = *(void (**)(char *, uint64_t))(v104 + 8);
    v46(v43, v103);
    LODWORD(v106) = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v39 + 18) = 1026;
    double v47 = v89;
    int v48 = Alarm.isSnoozed.getter() & 1;
    v46(v47, v45);
    LODWORD(v106) = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v39 + 24) = 1026;
    uint64_t v49 = v101;
    LODWORD(v47) = Alarm.isFiring.getter() & 1;
    v46(v49, v45);
    LODWORD(v106) = v47;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%{public}s] creating remote alert alarm - is sleep: %{BOOL,public}d, is snoozed: %{BOOL,public}d, is firing: %{BOOL,public}d", (uint8_t *)v39, 0x1Eu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v50 = v103;
    double v51 = *(void (**)(char *, uint64_t))(v104 + 8);
    v51(v101, v103);
    v51(v89, v50);
    v51(v31, v50);
  }

  (*(void (**)(char *, uint64_t))(v91 + 8))(v90, v92);
  uint64_t v52 = (uint64_t)v94;
  uint64_t v53 = v103;
  v98(v94, v105, v103);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v104 + 56))(v52, 0, 1, v53);
  static Alarm.statusText(for:includeTime:allowSnoozeCountdown:isShortFormat:)();
  uint64_t v55 = v54;
  sub_10000EC40(v52, (uint64_t)&qword_1000193C0, (uint64_t)&type metadata accessor for Alarm, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_10000DD20);
  if (v55)
  {
    NSString v56 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v56 = 0;
  }
  id v57 = [objc_allocWithZone((Class)SBSRemoteContentAlert) initWithTitle:0 message:v56 preferredStyle:0];

  id v58 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
  swift_bridgeObjectRetain();
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v60 = [v58 initWithTitle:v59 style:0];

  [v57 addAction:v60];
  if (Alarm.isActive.getter() & 1) != 0 || (Alarm.isSleepAlarm.getter())
  {
    id v61 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
    swift_bridgeObjectRetain();
    NSString v62 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v63 = [v61 initWithTitle:v62 style:2];

    [v57 addAction:v63];
  }
  id v64 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
  NSString v65 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v66 = [v64 initWithTitle:v65 style:1];

  [v57 addAction:v66];
  v100[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible] = 1;
  sub_100009C80();
  uint64_t v67 = sub_100008798();
  if (v67)
  {
    id v68 = (void *)v67;
    double v69 = v87;
    uint64_t v70 = v103;
    v98(v87, v105, v103);
    uint64_t v71 = v104;
    unint64_t v72 = (*(unsigned __int8 *)(v104 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80);
    unint64_t v73 = (v86 + v72 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v74 = (char *)swift_allocObject();
    uint64_t v75 = countAndFlagsBits;
    uint64_t v76 = v100;
    *((void *)v74 + 2) = v100;
    *((void *)v74 + 3) = v75;
    *((void *)v74 + 4) = object;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(&v74[v72], v69, v70);
    uint64_t v77 = (uint64_t *)&v74[v73];
    uint64_t v78 = (uint64_t)v97;
    *uint64_t v77 = v95;
    v77[1] = v78;
    uint64_t v79 = (uint64_t *)&v74[(v73 + 23) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v80 = (uint64_t)v96;
    *uint64_t v79 = v88;
    v79[1] = v80;
    aBlock[4] = (uint64_t)sub_10000EED4;
    aBlock[5] = (uint64_t)v74;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100007A28;
    aBlock[3] = (uint64_t)&unk_100014E90;
    uint64_t v81 = _Block_copy(aBlock);
    id v82 = v76;
    swift_release();
    [v68 presentAlert:v57 replyBlock:v81];

    swift_unknownObjectRelease();
    _Block_release(v81);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000073B0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v41 = a8;
  uint64_t v38 = a6;
  uint64_t v39 = a7;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t v37 = a9;
  uint64_t v44 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v47 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v43 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v45 = *(void *)(v13 - 8);
  uint64_t v46 = v13;
  __chkstk_darwin(v13);
  uint64_t v40 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Alarm();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  __chkstk_darwin(v15);
  id v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  uint64_t v42 = static OS_dispatch_queue.main.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a5, v15);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v20 = (v17 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  Swift::String v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = a2;
  *((void *)v21 + 3) = a1;
  uint64_t v22 = v36;
  *((void *)v21 + 4) = v35;
  *((void *)v21 + 5) = v22;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v21[v19], v18, v15);
  Swift::String v23 = &v21[v20];
  uint64_t v24 = v39;
  *(void *)Swift::String v23 = v38;
  *((void *)v23 + 1) = v24;
  Swift::String v25 = &v21[(v20 + 23) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v26 = v37;
  *(void *)Swift::String v25 = v41;
  *((void *)v25 + 1) = v26;
  aBlock[4] = sub_10000F09C;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004B88;
  aBlock[3] = &unk_100014EE0;
  Swift::String v27 = _Block_copy(aBlock);
  id v28 = a2;
  id v29 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  id v30 = v40;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100010244((unint64_t *)&qword_1000196E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000DD20(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_1000048FC();
  Swift::String v32 = v43;
  uint64_t v31 = v44;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  Swift::String v33 = (void *)v42;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v32, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v30, v46);
}

void sub_1000077DC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(unsigned char *)(a1 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible) = 0;
  sub_100009C80();
  id v15 = [a2 title];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    if (v17 == a3 && v19 == a4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        goto LABEL_7;
      }
    }
    Alarm.isSleepAlarm.getter();
    sub_100007A30();
    return;
  }
LABEL_7:
  id v22 = [a2 title];
  if (v22)
  {
    Swift::String v23 = v22;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    if (v24 == a6 && v26 == a7)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0) {
        goto LABEL_13;
      }
    }
    id v37 = *(id *)(a1 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model);
    dispatch thunk of LockScreenContentModel.dismissActiveAlarm(_:)();
    uint64_t v34 = v37;
    goto LABEL_24;
  }
LABEL_13:
  id v29 = [a2 title];
  if (!v29) {
    return;
  }
  id v30 = v29;
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v33 = v32;

  if (v31 == a8 && v33 == a9)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0) {
      return;
    }
  }
  id v38 = *(id *)(a1 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model);
  dispatch thunk of LockScreenContentModel.skipUpcomingOccurrenceAlarm()();
  uint64_t v34 = v38;
LABEL_24:
}

void sub_100007A28(uint64_t a1, void *a2)
{
}

uint64_t sub_100007A30()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v75 = (char *)&v71 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v76 - 8);
  uint64_t v4 = __chkstk_darwin(v76);
  uint64_t v74 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v77 = (char *)&v71 - v6;
  sub_10000DD20(0, &qword_100019770, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v71 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v71 - v15;
  __chkstk_darwin(v14);
  uint64_t v78 = (uint64_t)&v71 - v17;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v19;
  id v21 = objc_allocWithZone((Class)LSApplicationRecord);
  id v22 = sub_10000DD84(v18, v20, 1);
  id v30 = v22;
  if (v22)
  {
    uint64_t v72 = v1;
    uint64_t v71 = v0;
    id v31 = [v22 applicationState];
    unsigned __int8 v32 = [v31 isInstalled];

    if (v32)
    {
      uint64_t v33 = v78;
      URL.init(string:)();
      swift_bridgeObjectRelease();

      uint64_t v0 = v71;
      uint64_t v1 = v72;
      uint64_t v34 = v3;
      uint64_t v35 = v76;
      goto LABEL_14;
    }

    uint64_t v0 = v71;
    uint64_t v1 = v72;
  }
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;
  id v26 = objc_allocWithZone((Class)LSApplicationRecord);
  id v27 = sub_10000DD84(v23, v25, 1);
  uint64_t v36 = v27;
  uint64_t v34 = v3;
  uint64_t v35 = v76;
  if (v27)
  {
    id v37 = [v27 applicationState];
    unsigned __int8 v38 = [v37 isInstalled];

    if (v38)
    {
      id v39 = (id)HKSPSleepURL();
      if (v39)
      {
        uint64_t v40 = v39;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v16, 0, 1, v35);
      }
      else
      {

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v16, 1, 1, v35);
      }
      uint64_t v41 = v77;
      uint64_t v33 = v78;
      sub_10000EBCC((uint64_t)v16, v78, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_10000DD20);
      goto LABEL_15;
    }
  }
  id v28 = (id)HKSPSleepFocusConfigurationURL();
  if (v28)
  {
    id v29 = v28;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v13, 0, 1, v35);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v13, 1, 1, v35);
  }
  uint64_t v33 = v78;
  sub_10000EBCC((uint64_t)v13, v78, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_10000DD20);
LABEL_14:
  uint64_t v41 = v77;
LABEL_15:
  sub_10000F144(v33, (uint64_t)v10, &qword_100019770, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v10, 1, v35) == 1)
  {
    sub_10000EC40(v33, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_10000DD20);
    uint64_t v42 = (uint64_t)v10;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v41, v10, v35);
    id v43 = [self defaultWorkspace];
    uint64_t v72 = v1;
    if (v43)
    {
      uint64_t v44 = v43;
      URL._bridgeToObjectiveC()(&v81);
      uint64_t v46 = v45;
      sub_10000DD20(0, &qword_100019780, (uint64_t (*)(uint64_t))sub_10000ECA0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100011340;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 40) = v48;
      *(void *)(inited + 72) = &type metadata for Bool;
      *(unsigned char *)(inited + 48) = 1;
      *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 88) = v49;
      *(void *)(inited + 120) = &type metadata for Bool;
      *(unsigned char *)(inited + 96) = 1;
      sub_100008644(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      LODWORD(v76) = [v44 openSensitiveURL:v46 withOptions:isa];
    }
    else
    {
      LODWORD(v76) = 2;
    }
    double v51 = v75;
    uint64_t v52 = v74;
    uint64_t v53 = (void *)v73;
    static Logger.mode.getter();
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v52, v41, v35);
    id v54 = v53;
    uint64_t v55 = Logger.logObject.getter();
    NSString v56 = v41;
    os_log_type_t v57 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v55, v57))
    {
      uint64_t v58 = swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      v80[0] = v73;
      *(_DWORD *)uint64_t v58 = 136446722;
      uint64_t v59 = sub_100004BCC();
      uint64_t v79 = sub_10000DFE0(v59, v60, v80);
      uint64_t v71 = v0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      uint64_t v61 = v35;
      uint64_t v62 = v34;
      *(_WORD *)(v58 + 12) = 2082;
      sub_100010244(&qword_100019778, (void (*)(uint64_t))&type metadata accessor for URL);
      id v63 = v74;
      uint64_t v64 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v79 = sub_10000DFE0(v64, v65, v80);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v66 = *(void (**)(char *, uint64_t))(v62 + 8);
      v66(v63, v61);
      *(_WORD *)(v58 + 22) = 2082;
      LOBYTE(v79) = v76;
      uint64_t v67 = String.init<A>(describingOptional:)();
      uint64_t v79 = sub_10000DFE0(v67, v68, v80);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v55, v57, "[%{public}s] opening %{public}s, success: %{public}s", (uint8_t *)v58, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v72 + 8))(v75, v71);
      v66(v77, v61);
    }
    else
    {

      double v69 = *(void (**)(char *, uint64_t))(v34 + 8);
      v69(v52, v35);

      (*(void (**)(char *, uint64_t))(v72 + 8))(v51, v0);
      v69(v56, v35);
    }
    uint64_t v42 = v78;
  }
  return sub_10000EC40(v42, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_10000DD20);
}

unint64_t sub_10000852C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E980();
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10000E9F8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

unint64_t sub_100008644(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000ED0C(0, (unint64_t *)&unk_100019790, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, (uint64_t (*)(void, uint64_t, char *))&type metadata accessor for _DictionaryStorage);
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
    sub_10000ED68(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000E9F8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000DFC8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_100008798()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection) != 1)
  {
    static Logger.mode.getter();
    id v9 = v0;
    char v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136446210;
      v16[0] = v12 + 4;
      uint64_t v13 = sub_100004BCC();
      v21[0] = sub_10000DFE0(v13, v14, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] requested remote content host proxy before configuring connection", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v0;
  uint64_t v19 = sub_10000EB5C;
  uint64_t v20 = v5;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v18 = sub_100008DF4;
  *((void *)&v18 + 1) = &unk_100014E40;
  uint64_t v6 = _Block_copy(&aBlock);
  id v7 = v0;
  swift_release();
  id v8 = [v7 _remoteViewControllerProxyWithErrorHandler:v6];
  _Block_release(v6);
  if (v8)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v18 = 0u;
  }
  sub_10000EBCC((uint64_t)&aBlock, (uint64_t)v21, (uint64_t)&unk_100019758, (uint64_t)&type metadata for Any[8], (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_10000FEF8);
  if (!v21[3])
  {
    sub_10000EC40((uint64_t)v21, (uint64_t)&unk_100019758, (uint64_t)&type metadata for Any[8], (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_10000FEF8);
    return 0;
  }
  sub_100010180(0, &qword_100019760);
  if (swift_dynamicCast()) {
    return v16[1];
  }
  else {
    return 0;
  }
}

uint64_t sub_100008B5C(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  id v8 = a2;
  swift_errorRetain();
  id v9 = v8;
  swift_errorRetain();
  char v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v4;
    uint64_t v13 = v12;
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v14 = sub_100004BCC();
    uint64_t v21 = sub_10000DFE0(v14, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    uint64_t v21 = a1;
    swift_errorRetain();
    sub_10000EB64();
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v21 = sub_10000DFE0(v16, v17, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] error acquiring remote content host proxy: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_100008DF4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100008EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v54 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v52 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  os_log_type_t v11 = (char *)&v50 - v10;
  uint64_t v12 = type metadata accessor for DispatchPredicate();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v15 = (uint64_t *)((char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *unint64_t v15 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  char v16 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    v4[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection] = 1;
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    static Logger.mode.getter();
    swift_unknownObjectRetain_n();
    uint64_t v25 = v4;
    swift_bridgeObjectRetain_n();
    id v26 = v25;
    id v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v53 = v7;
    if (v29)
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v56 = v51;
      *(_DWORD *)uint64_t v30 = 136446978;
      uint64_t v31 = sub_100004BCC();
      v55[0] = sub_10000DFE0(v31, v32, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      v55[0] = a1;
      sub_10000ED0C(0, (unint64_t *)&unk_100019620, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(void, uint64_t, char *))&type metadata accessor for Dictionary);
      swift_bridgeObjectRetain();
      uint64_t v33 = String.init<A>(describingOptional:)();
      v55[0] = sub_10000DFE0(v33, v34, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 22) = 2082;
      *(double *)uint64_t v55 = v18;
      *(double *)&v55[1] = v20;
      *(double *)&v55[2] = v22;
      *(double *)&v55[3] = v24;
      type metadata accessor for CGRect(0);
      uint64_t v35 = String.init<A>(describing:)();
      v55[0] = sub_10000DFE0(v35, v36, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 32) = 2082;
      v55[0] = a3;
      sub_100010180(0, &qword_100019750);
      swift_unknownObjectRetain();
      uint64_t v37 = String.init<A>(describingOptional:)();
      v55[0] = sub_10000DFE0(v37, v38, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%{public}s] configure with userInfo: %{public}s, bounds: %{public}s endpoint: %{public}s", (uint8_t *)v30, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v39 = v53;
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease_n();

      uint64_t v39 = v7;
    }
    uint64_t v40 = *(void (**)(char *, uint64_t))(v39 + 8);
    v40(v11, v54);
    if (a3)
    {
      uint64_t v41 = (void *)swift_unknownObjectRetain();
      sub_10000B62C(v41);
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v42 = v52;
      static Logger.mode.getter();
      id v43 = v26;
      uint64_t v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        v55[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v46 = 136446210;
        uint64_t v47 = sub_100004BCC();
        uint64_t v56 = sub_10000DFE0(v47, v48, v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "[%{public}s] cannot connect to sleepd due to nil endpoint", v46, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v49 = v52;
      }
      else
      {

        uint64_t v49 = v42;
      }
      v40(v49, v54);
    }
    sub_100005C30(v18, v20, v22, v24);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000095F8()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  id v5 = v0;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    v18[0] = v1;
    uint64_t v9 = (uint8_t *)v8;
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v10 = sub_100004BCC();
    v18[1] = sub_10000DFE0(v10, v11, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%{public}s] didChangeContentBounds called, requesting content bounds using ObjC shim", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void))(v2 + 8))(v4, v18[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  uint64_t result = sub_100008798();
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = self;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v5;
    aBlock[4] = (uint64_t)sub_10000EB54;
    aBlock[5] = v15;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100009B58;
    aBlock[3] = (uint64_t)&unk_100014DF0;
    char v16 = _Block_copy(aBlock);
    id v17 = v5;
    swift_release();
    [v14 getContentBoundsWithBlock:v16 interface:v13];
    _Block_release(v16);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000098D4(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  id v14 = a1;
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136446466;
    uint64_t v18 = sub_100004BCC();
    uint64_t v23 = sub_10000DFE0(v18, v19, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v23 = *(void *)&a2;
    double v24 = a3;
    double v25 = a4;
    double v26 = a5;
    type metadata accessor for CGRect(0);
    uint64_t v20 = String.init<A>(describing:)();
    uint64_t v23 = sub_10000DFE0(v20, v21, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%{public}s] received new bounds: %{public}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_100005C30(a2, a3, a4, a5);
}

uint64_t sub_100009B58(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9 = *(void (**)(uint64_t, double, double, double, double))(a1 + 32);
  uint64_t v10 = swift_retain();
  v9(v10, a2, a3, a4, a5);

  return swift_release();
}

void *sub_100009C80()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v157 = *(void *)(v0 - 8);
  uint64_t v1 = __chkstk_darwin(v0);
  v149 = (char *)&v139 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v159 = (char *)&v139 - v3;
  uint64_t v4 = type metadata accessor for LockScreenContentState();
  id v5 = *(void **)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  v147 = (char *)&v139 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v148 = (char *)&v139 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v146 = (char *)&v139 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v156 = (char *)&v139 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v145 = ((char *)&v139 - v15);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v139 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  v144 = (char *)&v139 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v143 = (uint64_t)&v139 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v155 = (char *)&v139 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v158 = (char *)&v139 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  os_log_t v154 = (os_log_t)((char *)&v139 - v28);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v139 - v29;
  uint64_t v31 = type metadata accessor for DispatchPredicate();
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  unint64_t v34 = (uint64_t *)((char *)&v139 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *unint64_t v34 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v32 + 104))(v34, enum case for DispatchPredicate.onQueue(_:), v31);
  char v35 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v34, v31);
  if ((v35 & 1) == 0)
  {
    __break(1u);
    goto LABEL_73;
  }
  v142 = v18;
  uint64_t v153 = v0;
  uint64_t v36 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model;
  id v37 = *(id *)&v160[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
  dispatch thunk of LockScreenContentModel.state.getter();

  unint64_t v38 = (uint64_t (*)(char *, uint64_t))v5[11];
  LODWORD(v37) = v38(v30, v4);
  int v39 = enum case for LockScreenContentState.loading(_:);
  v151 = (void (*)(char *, uint64_t))v5[1];
  v151(v30, v4);
  if (v37 == v39)
  {
    uint64_t v40 = v159;
    static Logger.mode.getter();
    uint64_t v41 = v160;
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      v162[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136446210;
      uint64_t v45 = sub_100004BCC();
      uint64_t v161 = sub_10000DFE0(v45, v46, v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "[%{public}s] skipping updating content preferences while in loading state", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v157 + 8))(v40, v153);
  }
  v139 = v5 + 1;
  uint64_t v47 = v160;
  id v48 = *(id *)&v160[v36];
  os_log_t v49 = v154;
  dispatch thunk of LockScreenContentModel.state.getter();

  uint64_t v140 = v36;
  id v50 = *(id *)&v47[v36];
  char v51 = dispatch thunk of LockScreenContentModel.hideTime.getter();

  uint64_t v52 = (void (*)(char *, char *, uint64_t))v5[2];
  uint64_t v53 = v158;
  v159 = (char *)(v5 + 2);
  uint64_t v54 = v52;
  v52(v158, (char *)v49, v4);
  int v55 = v38(v53, v4);
  v152 = (uint64_t (*)(uint64_t, uint64_t))v38;
  LODWORD(v158) = v39;
  int v150 = enum case for LockScreenContentState.windDown(_:);
  if (v55 == v39)
  {
    uint64_t v141 = 0;
    uint64_t v56 = v160;
    os_log_type_t v57 = (void (*)(os_log_t, uint64_t))v151;
LABEL_16:
    unint64_t v60 = v54;
    uint64_t v59 = v140;
    goto LABEL_17;
  }
  os_log_type_t v57 = (void (*)(os_log_t, uint64_t))v151;
  if (v55 == enum case for LockScreenContentState.windDown(_:)
    || v55 == enum case for LockScreenContentState.bedtime(_:))
  {
    uint64_t v61 = 2;
    if ((v51 & 1) == 0) {
      uint64_t v61 = 0;
    }
    uint64_t v141 = v61;
    uint64_t v56 = v160;
    goto LABEL_16;
  }
  uint64_t v56 = v160;
  uint64_t v59 = v140;
  if (v55 != enum case for LockScreenContentState.wakeUpGreeting(_:)) {
    goto LABEL_73;
  }
  uint64_t v141 = 0;
  unint64_t v60 = v54;
LABEL_17:
  v57(v154, v4);
  id v62 = *(id *)&v56[v59];
  id v63 = v155;
  dispatch thunk of LockScreenContentModel.state.getter();

  uint64_t v64 = v143;
  unint64_t v65 = v60;
  v60((char *)v143, v63, v4);
  int v66 = v152(v64, v4);
  int v67 = enum case for LockScreenContentState.bedtime(_:);
  if (v66 == v158)
  {
    uint64_t v143 = 1;
    unint64_t v68 = v65;
    goto LABEL_26;
  }
  unint64_t v68 = v65;
  if (v66 == v150)
  {
    uint64_t v69 = 2;
  }
  else
  {
    if (v66 == enum case for LockScreenContentState.bedtime(_:))
    {
      uint64_t v143 = 3;
      int v67 = v66;
      goto LABEL_26;
    }
    if (v66 != enum case for LockScreenContentState.wakeUpGreeting(_:)) {
      goto LABEL_73;
    }
    uint64_t v69 = 1;
  }
  uint64_t v143 = v69;
LABEL_26:
  v57((os_log_t)v155, v4);
  id v70 = *(id *)&v160[v59];
  uint64_t v71 = v144;
  dispatch thunk of LockScreenContentModel.state.getter();

  uint64_t v72 = v142;
  v68(v142, v71, v4);
  int v73 = v152((uint64_t)v72, v4);
  LODWORD(v154) = v67;
  if (v73 == v158)
  {
    LODWORD(v155) = 0;
    LODWORD(v142) = enum case for LockScreenContentState.wakeUpGreeting(_:);
  }
  else
  {
    LODWORD(v142) = enum case for LockScreenContentState.wakeUpGreeting(_:);
    LODWORD(v155) = 1;
    if (v73 != v150 && v73 != v67)
    {
      if (v73 != v142) {
        goto LABEL_73;
      }
      LODWORD(v155) = 0;
      LODWORD(v142) = v73;
    }
  }
  v57((os_log_t)v71, v4);
  uint64_t v74 = v160;
  id v75 = *(id *)&v160[v59];
  uint64_t v76 = v145;
  dispatch thunk of LockScreenContentModel.state.getter();

  v57(v76, v4);
  id v77 = *(id *)&v74[v59];
  dispatch thunk of LockScreenContentModel.state.getter();

  v57(v76, v4);
  id v78 = *(id *)&v74[v59];
  dispatch thunk of LockScreenContentModel.state.getter();

  v57(v76, v4);
  id v79 = *(id *)&v74[v59];
  uint64_t v80 = v156;
  dispatch thunk of LockScreenContentModel.state.getter();

  NSURL v81 = v146;
  v68(v146, v80, v4);
  id v82 = (uint64_t (*)(char *, uint64_t))v152;
  int v83 = v152((uint64_t)v81, v4);
  BOOL v85 = v83 == v158 || v83 == v150 || v83 == v154;
  int v86 = v85;
  if (!v85 && v83 != v142) {
    goto LABEL_73;
  }
  v57((os_log_t)v156, v4);
  id v87 = *(id *)&v160[v59];
  uint64_t v88 = v148;
  dispatch thunk of LockScreenContentModel.state.getter();

  uint64_t v89 = v147;
  v68(v147, v88, v4);
  int v90 = v82(v89, v4);
  uint64_t v91 = 3;
  if (v90 == v158 || v90 == v150 || v90 == v154) {
    goto LABEL_48;
  }
  if (v90 != v142)
  {
LABEL_73:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t v91 = 4;
LABEL_48:
  v159 = (char *)v91;
  v151(v88, v4);
  sub_10000DD20(0, &qword_100019728, (uint64_t (*)(uint64_t))sub_10000E8CC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  int v92 = v86;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011350;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v94;
  uint64_t v95 = v141;
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 64) = v96;
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v97;
  int v98 = (int)v155;
  *(NSNumber *)(inited + 96) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 104) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 112) = v99;
  *(NSNumber *)(inited + 120) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v100;
  *(NSNumber *)(inited + 144) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 152) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 160) = v101;
  uint64_t v102 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible;
  uint64_t v103 = v160;
  *(NSNumber *)(inited + 168) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v104;
  *(NSNumber *)(inited + 192) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 200) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 208) = v105;
  *(NSNumber *)(inited + 216) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v106;
  *(NSNumber *)(inited + 240) = Int._bridgeToObjectiveC()();
  sub_10000852C(inited);
  id v107 = objc_allocWithZone((Class)SBSRemoteContentPreferences);
  sub_10000E944(0, &qword_100019738);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v109 = [v107 initWithConfiguration:isa];

  uint64_t v110 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences;
  Swift::String v111 = *(void **)&v103[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences];
  *(void *)&v103[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences] = v109;

  v112 = v149;
  static Logger.mode.getter();
  v113 = v103;
  v114 = Logger.logObject.getter();
  os_log_type_t v115 = static os_log_type_t.default.getter();
  LODWORD(v158) = v115;
  if (os_log_type_enabled(v114, v115))
  {
    uint64_t v116 = swift_slowAlloc();
    os_log_t v154 = v114;
    uint64_t v117 = v116;
    v156 = (char *)swift_slowAlloc();
    v162[0] = (uint64_t)v156;
    *(_DWORD *)uint64_t v117 = 136448770;
    LODWORD(v152) = v92;
    uint64_t v118 = sub_100004BCC();
    uint64_t v161 = sub_10000DFE0(v118, v119, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    v151 = (void (*)(char *, uint64_t))v102;
    LODWORD(v155) = v98;
    *(_WORD *)(v117 + 12) = 2082;
    v120 = *(void **)&v103[v110];
    uint64_t v161 = (uint64_t)v120;
    sub_10000E944(0, &qword_100019740);
    id v121 = v120;
    uint64_t v122 = String.init<A>(describingOptional:)();
    uint64_t v161 = sub_10000DFE0(v122, v123, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 22) = 2082;
    uint64_t v161 = v95;
    uint64_t v124 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v161 = sub_10000DFE0(v124, v125, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 32) = 2082;
    uint64_t v161 = v143;
    uint64_t v126 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v161 = sub_10000DFE0(v126, v127, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 42) = 2082;
    if (v155) {
      uint64_t v128 = 1702195828;
    }
    else {
      uint64_t v128 = 0x65736C6166;
    }
    if (v155) {
      unint64_t v129 = 0xE400000000000000;
    }
    else {
      unint64_t v129 = 0xE500000000000000;
    }
    uint64_t v161 = sub_10000DFE0(v128, v129, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 52) = 2082;
    uint64_t v161 = 4;
    uint64_t v130 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v161 = sub_10000DFE0(v130, v131, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 62) = 2082;
    uint64_t v161 = sub_10000DFE0(1702195828, 0xE400000000000000, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v117 + 72) = 2082;
    if (*((unsigned char *)v151 + (void)v103)) {
      uint64_t v132 = 1702195828;
    }
    else {
      uint64_t v132 = 0x65736C6166;
    }
    if (*((unsigned char *)v151 + (void)v103)) {
      unint64_t v133 = 0xE400000000000000;
    }
    else {
      unint64_t v133 = 0xE500000000000000;
    }
    uint64_t v161 = sub_10000DFE0(v132, v133, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 82) = 2082;
    uint64_t v161 = sub_10000DFE0(1702195828, 0xE400000000000000, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v117 + 92) = 2082;
    if (v152) {
      uint64_t v134 = 0x65736C6166;
    }
    else {
      uint64_t v134 = 1702195828;
    }
    if (v152) {
      unint64_t v135 = 0xE500000000000000;
    }
    else {
      unint64_t v135 = 0xE400000000000000;
    }
    uint64_t v161 = sub_10000DFE0(v134, v135, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v117 + 102) = 2082;
    uint64_t v161 = (uint64_t)v159;
    uint64_t v136 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v161 = sub_10000DFE0(v136, v137, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_t v138 = v154;
    _os_log_impl((void *)&_mh_execute_header, v154, (os_log_type_t)v158, "[%{public}s] updating content preferences %{public}s, dateTime: %{public}s, background: %{public}s, reduceWhitePoint: %{public}s, homeGestureMode: %{public}s, suppressNotifications: %{public}s, suppressBottomEdgeContent: %{public}s, presentInline: %{public}s, dismissOnTap: %{public}s, preferredNotificationListMode: %{public}s", (uint8_t *)v117, 0x70u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v157 + 8))(v149, v153);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v157 + 8))(v112, v153);
  }
  uint64_t result = (void *)sub_100008798();
  if (result)
  {
    [result didChangeStyle];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_10000AFE4(unint64_t a1)
{
  unint64_t v45 = a1;
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v44 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  os_log_type_t v43 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for LockScreenContentState();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v40 - v8;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v13 = type metadata accessor for DispatchPredicate();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t *)((char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *uint64_t v16 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v14 + 104))(v16, enum case for DispatchPredicate.onQueue(_:), v13);
  char v17 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v41 = v1;
  uint64_t v18 = v4;
  uint64_t v19 = v9;
  uint64_t v20 = v6;
  uint64_t v21 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model;
  uint64_t v22 = v42;
  id v23 = *(id *)&v42[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
  dispatch thunk of LockScreenContentModel.state.getter();

  LODWORD(v23) = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v12, v3);
  int v24 = enum case for LockScreenContentState.wakeUpGreeting(_:);
  uint64_t v40 = v18;
  uint64_t v25 = *(void (**)(char *, uint64_t))(v18 + 8);
  v25(v12, v3);
  if (v23 == v24)
  {
    if (v45 > 8) {
      goto LABEL_17;
    }
    if (((1 << v45) & 0x7B) == 0)
    {
      id v26 = *(id *)&v22[v21];
      dispatch thunk of LockScreenContentModel.dismissWakeUpGreeting()();
    }
  }
  id v27 = *(id *)&v22[v21];
  dispatch thunk of LockScreenContentModel.state.getter();

  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v20, enum case for LockScreenContentState.bedtime(_:), v3);
  LOBYTE(v27) = static LockScreenContentState.== infix(_:_:)();
  v25(v20, v3);
  v25(v19, v3);
  unint64_t v28 = v45;
  uint64_t v29 = v43;
  if (v27)
  {
    if (v45 <= 8)
    {
      if (((1 << v45) & 0x17B) == 0)
      {
        id v30 = *(id *)&v22[v21];
        dispatch thunk of LockScreenContentModel.dismissSleepLock()();
      }
      goto LABEL_10;
    }
LABEL_17:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_10:
  static Logger.mode.getter();
  uint64_t v31 = v22;
  uint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 136446466;
    uint64_t v35 = sub_100004BCC();
    uint64_t v46 = sub_10000DFE0(v35, v36, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2082;
    uint64_t v46 = v28;
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v46 = sub_10000DFE0(v37, v38, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%{public}s] did dismiss, type: %{public}s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v41);
  uint64_t result = (void *)sub_10000C95C();
  if (result)
  {
    [result didDismissWithReason:v28];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_10000B62C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v65 = *(void *)(v4 - 8);
  uint64_t v66 = v4;
  __chkstk_darwin(v4);
  uint64_t v64 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v63 = (char *)&v60 - v7;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v60 - v9;
  sub_10000DD20(0, &qword_100019718, (uint64_t (*)(uint64_t))sub_10000DBC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published.Publisher);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v60 - v14;
  uint64_t v16 = type metadata accessor for DispatchPredicate();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (uint64_t *)((char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *uint64_t v19 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v17 + 104))(v19, enum case for DispatchPredicate.onQueue(_:), v16);
  char v20 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v17 + 8))(v19, v16);
  if (v20)
  {
    id v61 = a1;
    type metadata accessor for LockScreenClient();
    uint64_t v21 = swift_allocObject();
    sub_10000DBC8();
    uint64_t aBlock = 0;
    uint64_t v69 = 0;
    Published.init(initialValue:)();
    swift_beginAccess();
    sub_10000DD20(0, &qword_100019608, (uint64_t (*)(uint64_t))sub_10000DBC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
    Published.projectedValue.getter();
    swift_endAccess();
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_10000E70C;
    *(void *)(v23 + 24) = v22;
    sub_10000E77C();
    uint64_t v24 = Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    *(void *)&v2[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver] = v24;
    swift_release();
    static Logger.mode.getter();
    uint64_t v25 = v2;
    id v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      unint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)unint64_t v28 = 136446210;
      uint64_t v29 = sub_100004BCC();
      uint64_t v67 = sub_10000DFE0(v29, v30, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%{public}s] creating connection", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v31 = *(void (**)(char *, uint64_t))(v65 + 8);
    v31(v10, v66);
    id v32 = [objc_allocWithZone((Class)NSXPCListenerEndpoint) init];
    [v32 _setEndpoint:v61];
    id v33 = objc_allocWithZone((Class)NSXPCConnection);
    id v61 = v32;
    id v34 = [v33 initWithListenerEndpoint:v32];
    id v35 = (id)HKSPSleepLockScreenClientInterface();
    [v34 setExportedInterface:v35];

    [v34 setExportedObject:v21];
    id v36 = (id)HKSPSleepLockScreenServerInterface();
    [v34 setRemoteObjectInterface:v36];

    uint64_t v37 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v72 = sub_10000E804;
    uint64_t v73 = v37;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v69 = 1107296256;
    id v70 = sub_100004B88;
    uint64_t v71 = &unk_100014CD8;
    unint64_t v38 = _Block_copy(&aBlock);
    swift_release();
    [v34 setInterruptionHandler:v38];
    _Block_release(v38);
    uint64_t v39 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v72 = sub_10000E844;
    uint64_t v73 = v39;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v69 = 1107296256;
    id v70 = sub_100004B88;
    uint64_t v71 = &unk_100014D00;
    uint64_t v40 = _Block_copy(&aBlock);
    swift_release();
    [v34 setInvalidationHandler:v40];
    _Block_release(v40);
    uint64_t v41 = v63;
    static Logger.mode.getter();
    uint64_t v42 = v25;
    os_log_type_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.default.getter();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v62 = v21;
    if (v45)
    {
      uint64_t v46 = swift_slowAlloc();
      unint64_t v60 = v31;
      uint64_t v47 = (uint8_t *)v46;
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136446210;
      uint64_t v48 = sub_100004BCC();
      uint64_t v67 = sub_10000DFE0(v48, v49, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "[%{public}s] resuming connection", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v31 = v60;
      swift_slowDealloc();
    }
    else
    {
    }
    v31(v41, v66);
    [v34 resume];
    type metadata accessor for LockScreenViewController.DaemonConnectionWrapper();
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = v34;
    *(void *)&v42[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = v50;
    id v51 = v34;
    swift_release();
    uint64_t v52 = v64;
    static Logger.mode.getter();
    uint64_t v53 = v42;
    uint64_t v54 = Logger.logObject.getter();
    os_log_type_t v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 136446210;
      uint64_t v57 = sub_100004BCC();
      uint64_t v67 = sub_10000DFE0(v57, v58, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "[%{public}s] requested connect", v56, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v31(v64, v66);
    }
    else
    {

      v31(v52, v66);
    }
    uint64_t v59 = (void *)sub_10000C95C();
    if (v59)
    {
      [v59 connect];
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000C098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    static Logger.mode.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v10 = v9;
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    int v13 = v12;
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v28 = v5;
      uint64_t v15 = v14;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v31 = v26;
      *(_DWORD *)uint64_t v15 = 136446722;
      uint64_t v27 = v4;
      HIDWORD(v25) = v13;
      uint64_t v16 = sub_100004BCC();
      uint64_t v30 = sub_10000DFE0(v16, v17, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      id v18 = (id)NSStringFromHKSPSleepLockScreenState();
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v29 = a1;
      unint64_t v21 = v20;

      uint64_t v30 = sub_10000DFE0(v19, v21, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2082;
      uint64_t v30 = a2;
      sub_10000ED0C(0, (unint64_t *)&unk_100019620, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(void, uint64_t, char *))&type metadata accessor for Dictionary);
      swift_bridgeObjectRetain();
      uint64_t v22 = String.init<A>(describingOptional:)();
      uint64_t v30 = sub_10000DFE0(v22, v23, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, BYTE4(v25), "[%{public}s] update to state: %{public}s, user info: %{public}s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v27);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    id v24 = *(id *)&v10[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
    dispatch thunk of LockScreenContentModel.lockScreenState.setter();
  }
}

uint64_t sub_10000C428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v14 = (void *)result;
    sub_10000E944(0, (unint64_t *)&qword_1000193C8);
    uint64_t v15 = static OS_dispatch_queue.main.getter();
    uint64_t v21 = v9;
    uint64_t v16 = (void *)v15;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v14;
    aBlock[4] = a3;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004B88;
    aBlock[3] = v22;
    id v18 = _Block_copy(aBlock);
    id v19 = v14;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100010244((unint64_t *)&qword_1000196E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000DD20(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    sub_1000048FC();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v21);
  }
  return result;
}

uint64_t sub_10000C738(void *a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  uint64_t v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = a2;
    os_log_type_t v12 = (uint8_t *)v11;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v12 = 136446210;
    uint64_t v17 = v4;
    uint64_t v13 = sub_100004BCC();
    uint64_t v18 = sub_10000DFE0(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v16, v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(void *)&v8[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = 0;
  return swift_release();
}

uint64_t sub_10000C95C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchPredicate();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *uint64_t v9 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  char v10 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection];
    if (v12)
    {
      uint64_t v13 = *(void **)(v12 + 16);
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v1;
      aBlock[4] = (uint64_t)sub_10000E6B0;
      aBlock[5] = v14;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_10000D050;
      aBlock[3] = (uint64_t)&unk_100014C60;
      uint64_t v15 = _Block_copy(aBlock);
      swift_retain();
      id v16 = v13;
      uint64_t v17 = v1;
      swift_release();
      id v18 = [v16 remoteObjectProxyWithErrorHandler:v15];
      _Block_release(v15);

      _bridgeAnyObjectToAny(_:)();
      swift_release();
      swift_unknownObjectRelease();
      sub_100010180(0, &qword_100019700);
      if (swift_dynamicCast()) {
        return v28;
      }
      else {
        return 0;
      }
    }
    else
    {
      static Logger.mode.getter();
      uint64_t v19 = v1;
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v26 = v3;
        aBlock[0] = v23;
        *(_DWORD *)uint64_t v22 = 136446210;
        uint64_t v24 = sub_100004BCC();
        uint64_t v28 = sub_10000DFE0(v24, v25, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%{public}s] requested remote server proxy before starting sleepd connection", v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v2);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000CDA8(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter();
  id v8 = a2;
  swift_errorRetain();
  id v9 = v8;
  swift_errorRetain();
  char v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v4;
    uint64_t v13 = v12;
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v14 = sub_100004BCC();
    uint64_t v21 = sub_10000DFE0(v14, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    uint64_t v21 = a1;
    swift_errorRetain();
    sub_100010128(0, &qword_100019708);
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v21 = sub_10000DFE0(v16, v17, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] error acquiring remote server proxy: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_10000D050(uint64_t a1, void *a2)
{
}

void sub_10000D058(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t type metadata accessor for LockScreenViewController()
{
  return self;
}

uint64_t type metadata accessor for LockScreenViewController.DaemonConnectionWrapper()
{
  return self;
}

uint64_t sub_10000D158()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000D1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  os_log_type_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  uint64_t v12 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_10000DCFC;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004B88;
  aBlock[3] = &unk_100014C10;
  uint64_t v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100010244((unint64_t *)&qword_1000196E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000DD20(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_1000048FC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

uint64_t sub_10000D4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    sub_10000D560(a3);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_10000D560(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000ED0C(0, &qword_1000196F8, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(void, uint64_t, char *))&type metadata accessor for _DictionaryStorage);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000DF6C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000DFC8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10000DFC8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10000DFC8(v36, v37);
    sub_10000DFC8(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_10000DFC8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10000DFD8();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10000D9E4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SleepLockScreen16LockScreenClient__state;
  sub_10000DD20(0, &qword_100019608, (uint64_t (*)(uint64_t))sub_10000DBC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10000DAB4()
{
  return type metadata accessor for LockScreenClient();
}

uint64_t type metadata accessor for LockScreenClient()
{
  uint64_t result = qword_1000195F8;
  if (!qword_1000195F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000DB08()
{
  sub_10000DD20(319, &qword_100019608, (uint64_t (*)(uint64_t))sub_10000DBC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000DBC8()
{
  if (!qword_100019610)
  {
    type metadata accessor for HKSPSleepLockScreenState(255);
    sub_10000DC38();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100019610);
    }
  }
}

void sub_10000DC38()
{
  if (!qword_100019618)
  {
    sub_10000ED0C(255, (unint64_t *)&unk_100019620, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(void, uint64_t, char *))&type metadata accessor for Dictionary);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100019618);
    }
  }
}

uint64_t sub_10000DCBC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000DCFC()
{
  return sub_10000D4CC(v0[2], v0[3], v0[4]);
}

uint64_t sub_10000DD08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DD18()
{
  return swift_release();
}

void sub_10000DD20(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

id sub_10000DD84(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

double sub_10000DE60@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10000DEE4()
{
  return static Published.subscript.setter();
}

uint64_t sub_10000DF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000DFC8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000DFD8()
{
  return swift_release();
}

uint64_t sub_10000DFE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E0B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000DF6C((uint64_t)v12, *a3);
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
      sub_10000DF6C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000E6B8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E0B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000E270(a5, a6);
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

uint64_t sub_10000E270(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E308(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E508(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E508(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E308(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000E480(v2, 0);
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

void *sub_10000E480(uint64_t a1, uint64_t a2)
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
  sub_10000FEF8(0, &qword_100019710, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E508(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000FEF8(0, &qword_100019710, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  int64_t v13 = a4 + 32;
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

uint64_t sub_10000E678()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000E6B0(uint64_t a1)
{
  return sub_10000CDA8(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000E6B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_10000E70C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000E714()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E74C(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_10000E77C()
{
  unint64_t result = qword_100019720;
  if (!qword_100019720)
  {
    sub_10000DD20(255, &qword_100019718, (uint64_t (*)(uint64_t))sub_10000DBC8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published.Publisher);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019720);
  }
  return result;
}

uint64_t sub_10000E804()
{
  return sub_10000C428(v0, (uint64_t)&unk_100014D88, (uint64_t)sub_10000E8A8, (uint64_t)&unk_100014DA0);
}

uint64_t sub_10000E844()
{
  return sub_10000C428(v0, (uint64_t)&unk_100014D38, (uint64_t)sub_10000E884, (uint64_t)&unk_100014D50);
}

uint64_t sub_10000E884()
{
  return sub_10000C738(*(void **)(v0 + 16), "[%{public}s] invalidation handler called");
}

uint64_t sub_10000E8A8()
{
  return sub_10000C738(*(void **)(v0 + 16), "[%{public}s] interruption handler called");
}

void sub_10000E8CC()
{
  if (!qword_100019730)
  {
    sub_10000E944(255, &qword_100019738);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100019730);
    }
  }
}

uint64_t sub_10000E944(uint64_t a1, unint64_t *a2)
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

void sub_10000E980()
{
  if (!qword_100019748)
  {
    sub_10000E944(255, &qword_100019738);
    unint64_t v0 = type metadata accessor for _DictionaryStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100019748);
    }
  }
}

unint64_t sub_10000E9F8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000EA70(a1, a2, v4);
}

unint64_t sub_10000EA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_10000EB54(double a1, double a2, double a3, double a4)
{
  sub_1000098D4(*(void **)(v4 + 16), a1, a2, a3, a4);
}

uint64_t sub_10000EB5C(uint64_t a1)
{
  return sub_100008B5C(a1, *(void **)(v1 + 16));
}

void sub_10000EB64()
{
  if (!qword_100019768)
  {
    sub_100010128(255, &qword_100019708);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100019768);
    }
  }
}

uint64_t sub_10000EBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a2, a1, v8);
  return a2;
}

uint64_t sub_10000EC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_10000ECA0()
{
  if (!qword_100019788)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100019788);
    }
  }
}

void sub_10000ED0C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, char *))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, &type metadata for Any[8]);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_10000ED68(uint64_t a1, uint64_t a2)
{
  sub_10000ECA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EDCC()
{
  uint64_t v1 = type metadata accessor for Alarm();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10000EED4(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for Alarm() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1000073B0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + v5 + 8), *(void *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000EF8C()
{
  uint64_t v1 = type metadata accessor for Alarm();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

void sub_10000F09C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Alarm() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000077DC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + v3 + 8), *(void *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000F144(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_10000DD20(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

char *sub_10000F1C4(void *a1, void *a2, uint64_t a3, uint64_t a4, char *a5)
{
  sub_10000FEF8(0, &qword_1000197A0, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published.Publisher);
  uint64_t v11 = v10;
  uint64_t v49 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int64_t v13 = (char *)&v48 - v12;
  uint64_t v14 = type metadata accessor for LockScreenContentView();
  __chkstk_darwin(v14 - 8);
  int64_t v15 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  *(_OWORD *)int64_t v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  v15[32] = 1;
  *(void *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber] = 0;
  *(void *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber] = 0;
  *(void *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate + 8] = 0;
  uint64_t v16 = swift_unknownObjectWeakInit();
  uint64_t v17 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView____lazy_storage___screenBounds];
  *(_OWORD *)uint64_t v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  v17[32] = 1;
  uint64_t v18 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  *(_OWORD *)uint64_t v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  uint64_t v19 = OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView;
  *(void *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView] = 0;
  *(void *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_model] = a1;
  *(void *)(v16 + 8) = &off_100014BD0;
  id v50 = a2;
  swift_unknownObjectWeakAssign();
  uint64_t v20 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier];
  *(void *)uint64_t v20 = a3;
  *((void *)v20 + 1) = a4;
  id v21 = a1;
  unint64_t v22 = a5;
  LockScreenContentView.init(model:)();
  sub_10000FF44();
  id v24 = objc_allocWithZone(v23);
  uint64_t v25 = _UIHostingView.init(rootView:)();
  uint64_t v26 = *(void **)&a5[v19];
  *(void *)&a5[v19] = v25;

  int64_t v27 = self;
  id v28 = [v27 hksp_internalUserDefaults];
  unsigned int v29 = [v28 hksp_lockScreenDebugMode];

  id v30 = 0;
  if (v29) {
    id v30 = [objc_allocWithZone((Class)UIView) init];
  }
  *(void *)&v22[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView] = v30;
  id v31 = [v27 hksp_internalUserDefaults];
  unsigned int v32 = [v31 hksp_lockScreenDebugMode];

  if (v32) {
    id v33 = [objc_allocWithZone((Class)UIView) init];
  }
  else {
    id v33 = 0;
  }
  *(void *)&v22[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView] = v33;

  long long v34 = (objc_class *)type metadata accessor for LockScreenContainerView();
  v52.receiver = v22;
  v52.super_class = v34;
  uint64_t v35 = (char *)[v52 initWithFrame:0.0, 0.0, 0.0, 0.0];
  sub_100003990();
  type metadata accessor for LockScreenContentModel();
  sub_100010244(&qword_1000197B8, (void (*)(uint64_t))&type metadata accessor for LockScreenContentModel);
  uint64_t v51 = ObservableObject<>.objectWillChange.getter();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for ObservableObjectPublisher();
  uint64_t v36 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  *(void *)&v35[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber] = v36;
  swift_release();
  dispatch thunk of LockScreenContentModel.$alarmButtonPressed.getter();
  uint64_t v37 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v37;
  *(void *)(v38 + 24) = v21;
  sub_100010060();
  id v39 = v21;
  uint64_t v40 = Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v11);
  *(void *)&v35[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber] = v40;
  swift_release();
  id v41 = [v27 hksp_internalUserDefaults];
  NSString v42 = String._bridgeToObjectiveC()();
  unsigned int v43 = [v41 BOOLForKey:v42];

  if (v43)
  {
    id v44 = [objc_allocWithZone((Class)UIPanGestureRecognizer) initWithTarget:v35 action:"didPan:"];
    [v35 addGestureRecognizer:v44];
  }
  sub_10000DD20(0, &qword_1000197C8, (uint64_t (*)(uint64_t))sub_1000100DC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_100011360;
  *(void *)(v45 + 32) = type metadata accessor for UITraitPreferredContentSizeCategory();
  *(void *)(v45 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100010180(0, &qword_1000197E0);
  uint64_t v46 = v35;
  UIView.registerForTraitChanges<A>(_:handler:)();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return v46;
}

uint64_t sub_10000F834(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = String.index(_:offsetBy:limitedBy:)();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return String.subscript.getter(a1, a2, a3, a4);
}

void sub_10000F8D0()
{
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentStateObserver] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10000F984(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v45 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v43 - v8;
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int64_t v13 = (uint64_t *)((char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  *int64_t v13 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  char v14 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_13:
    _Block_release(v44);
    __break(1u);
    return;
  }
  static Logger.mode.getter();
  int64_t v15 = a1;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  id v44 = a2;
  if (v18)
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    v46[0] = swift_slowAlloc();
    uint64_t v43 = v5;
    *(_DWORD *)uint64_t v19 = 136446210;
    uint64_t v20 = sub_100004BCC();
    uint64_t v47 = sub_10000DFE0(v20, v21, v46);
    uint64_t v5 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%{public}s] getInlinePresentationContentFrame called, returning content size", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v9, v4);
  Class v23 = v45;
  uint64_t v24 = *(void *)&v15[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView];
  if (!v24) {
    goto LABEL_13;
  }
  uint64_t v25 = v24 + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  if ((*(unsigned char *)(v25 + 32) & 1) == 0)
  {
    uint64_t v26 = *(void *)(v25 + 16);
    uint64_t v27 = *(void *)(v25 + 24);
    uint64_t v28 = *(void *)v25;
    uint64_t v29 = *(void *)(v25 + 8);
  }
  static Logger.mode.getter();
  id v30 = v15;
  id v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v43 = v4;
    uint64_t v47 = v34;
    *(_DWORD *)uint64_t v33 = 136446466;
    uint64_t v35 = sub_100004BCC();
    v46[0] = sub_10000DFE0(v35, v36, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2082;
    v46[0] = v28;
    v46[1] = v29;
    v46[2] = v26;
    v46[3] = v27;
    type metadata accessor for CGRect(0);
    uint64_t v37 = String.init<A>(describing:)();
    v46[0] = sub_10000DFE0(v37, v38, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "[%{public}s] frame: %{public}s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v39 = v45;
    uint64_t v40 = v43;
  }
  else
  {

    id v39 = v23;
    uint64_t v40 = v4;
  }
  v22(v39, v40);
  id v41 = (void (**)(const void *, xpc_object_t))v44;
  xpc_object_t v42 = xpc_dictionary_create(0, 0, 0);
  BSSerializeCGRectToXPCDictionaryWithKey();
  v41[2](v41, v42);
  swift_unknownObjectRelease();
}

void sub_10000FEF8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_10000FF44()
{
  if (!qword_1000197A8)
  {
    type metadata accessor for LockScreenContentView();
    sub_100010244(&qword_1000197B0, (void (*)(uint64_t))&type metadata accessor for LockScreenContentView);
    unint64_t v0 = type metadata accessor for _UIHostingView();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000197A8);
    }
  }
}

uint64_t sub_10000FFD8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010010(uint64_t a1)
{
  return sub_100003308(a1, v1);
}

uint64_t sub_100010018()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010058(unsigned char *a1)
{
  return sub_1000035F8(a1);
}

unint64_t sub_100010060()
{
  unint64_t result = qword_1000197C0;
  if (!qword_1000197C0)
  {
    sub_10000FEF8(255, &qword_1000197A0, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published.Publisher);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000197C0);
  }
  return result;
}

unint64_t sub_1000100DC()
{
  unint64_t result = qword_1000197D0;
  if (!qword_1000197D0)
  {
    sub_100010128(255, &qword_1000197D8);
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000197D0);
  }
  return result;
}

uint64_t sub_100010128(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_100010178()
{
}

uint64_t sub_100010180(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_1000101D4(uint64_t a1)
{
}

void sub_1000101DC()
{
  if (!qword_1000197E8)
  {
    type metadata accessor for LockScreenContentState();
    unint64_t v0 = type metadata accessor for PassthroughSubject();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000197E8);
    }
  }
}

uint64_t sub_100010244(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000103DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[LockScreenViewController] received boundsDictionary in ObjC shim", v14, 2u);
  }

  BSDeserializeCGRectFromXPCDictionaryWithKey();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(v6, v8, v10, v12);
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
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

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t LockScreenContentView.init(model:)()
{
  return LockScreenContentView.init(model:)();
}

uint64_t type metadata accessor for LockScreenContentView()
{
  return type metadata accessor for LockScreenContentView();
}

uint64_t dispatch thunk of LockScreenContentModel.lockScreenState.setter()
{
  return dispatch thunk of LockScreenContentModel.lockScreenState.setter();
}

uint64_t dispatch thunk of LockScreenContentModel.dismissSleepLock()()
{
  return dispatch thunk of LockScreenContentModel.dismissSleepLock()();
}

uint64_t LockScreenContentModel.stateDidChange.getter()
{
  return LockScreenContentModel.stateDidChange.getter();
}

uint64_t dispatch thunk of LockScreenContentModel.toggleDemoMode()()
{
  return dispatch thunk of LockScreenContentModel.toggleDemoMode()();
}

uint64_t LockScreenContentModel.init(debugIdentifier:)()
{
  return LockScreenContentModel.init(debugIdentifier:)();
}

uint64_t dispatch thunk of LockScreenContentModel.alarmButtonPressed.setter()
{
  return dispatch thunk of LockScreenContentModel.alarmButtonPressed.setter();
}

uint64_t dispatch thunk of LockScreenContentModel.dismissActiveAlarm(_:)()
{
  return dispatch thunk of LockScreenContentModel.dismissActiveAlarm(_:)();
}

uint64_t dispatch thunk of LockScreenContentModel.$alarmButtonPressed.getter()
{
  return dispatch thunk of LockScreenContentModel.$alarmButtonPressed.getter();
}

uint64_t dispatch thunk of LockScreenContentModel.didInteractWithAlarm(_:)()
{
  return dispatch thunk of LockScreenContentModel.didInteractWithAlarm(_:)();
}

uint64_t dispatch thunk of LockScreenContentModel.moveDemoStateForward()()
{
  return dispatch thunk of LockScreenContentModel.moveDemoStateForward()();
}

uint64_t dispatch thunk of LockScreenContentModel.dismissWakeUpGreeting()()
{
  return dispatch thunk of LockScreenContentModel.dismissWakeUpGreeting()();
}

uint64_t dispatch thunk of LockScreenContentModel.moveDemoStateBackward()()
{
  return dispatch thunk of LockScreenContentModel.moveDemoStateBackward()();
}

uint64_t dispatch thunk of LockScreenContentModel.skipUpcomingOccurrenceAlarm()()
{
  return dispatch thunk of LockScreenContentModel.skipUpcomingOccurrenceAlarm()();
}

uint64_t dispatch thunk of LockScreenContentModel.alarm.getter()
{
  return dispatch thunk of LockScreenContentModel.alarm.getter();
}

uint64_t dispatch thunk of LockScreenContentModel.state.getter()
{
  return dispatch thunk of LockScreenContentModel.state.getter();
}

uint64_t dispatch thunk of LockScreenContentModel.hideTime.getter()
{
  return dispatch thunk of LockScreenContentModel.hideTime.getter();
}

uint64_t type metadata accessor for LockScreenContentModel()
{
  return type metadata accessor for LockScreenContentModel();
}

uint64_t static LockScreenContentState.== infix(_:_:)()
{
  return static LockScreenContentState.== infix(_:_:)();
}

uint64_t type metadata accessor for LockScreenContentState()
{
  return type metadata accessor for LockScreenContentState();
}

uint64_t Alarm.isSleepAlarm.getter()
{
  return Alarm.isSleepAlarm.getter();
}

uint64_t static Alarm.statusText(for:includeTime:allowSnoozeCountdown:isShortFormat:)()
{
  return static Alarm.statusText(for:includeTime:allowSnoozeCountdown:isShortFormat:)();
}

uint64_t Alarm.isActive.getter()
{
  return Alarm.isActive.getter();
}

uint64_t Alarm.isFiring.getter()
{
  return Alarm.isFiring.getter();
}

uint64_t Alarm.isSnoozed.getter()
{
  return Alarm.isSnoozed.getter();
}

uint64_t type metadata accessor for Alarm()
{
  return type metadata accessor for Alarm();
}

uint64_t static Logger.mode.getter()
{
  return static Logger.mode.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for UITraitPreferredContentSizeCategory()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t type metadata accessor for PassthroughSubject()
{
  return type metadata accessor for PassthroughSubject();
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t _UIHostingView.init(rootView:)()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t type metadata accessor for _UIHostingView()
{
  return type metadata accessor for _UIHostingView();
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

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
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

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(describingOptional:)()
{
  return String.init<A>(describingOptional:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
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

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t CGRect.center.getter()
{
  return CGRect.center.getter();
}

uint64_t UIView.registerForTraitChanges<A>(_:handler:)()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
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

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t type metadata accessor for _DictionaryStorage()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return _BSDeserializeCGRectFromXPCDictionaryWithKey();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return _BSSerializeCGRectToXPCDictionaryWithKey();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t HKSPLogForCategory()
{
  return _HKSPLogForCategory();
}

uint64_t HKSPSleepFocusConfigurationURL()
{
  return _HKSPSleepFocusConfigurationURL();
}

uint64_t HKSPSleepLockScreenClientInterface()
{
  return _HKSPSleepLockScreenClientInterface();
}

uint64_t HKSPSleepLockScreenRemoteContentHostInterface()
{
  return _HKSPSleepLockScreenRemoteContentHostInterface();
}

uint64_t HKSPSleepLockScreenRemoteContentServiceInterface()
{
  return _HKSPSleepLockScreenRemoteContentServiceInterface();
}

uint64_t HKSPSleepLockScreenServerInterface()
{
  return _HKSPSleepLockScreenServerInterface();
}

uint64_t HKSPSleepURL()
{
  return _HKSPSleepURL();
}

uint64_t NSStringFromHKSPSleepLockScreenState()
{
  return _NSStringFromHKSPSleepLockScreenState();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return _swift_getExistentialMetatypeMetadata();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

id objc_msgSend_getContentBoundsWithReplyBlock_(void *a1, const char *a2, ...)
{
  return [a1 getContentBoundsWithReplyBlock:];
}