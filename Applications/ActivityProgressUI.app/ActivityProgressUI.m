uint64_t sub_100003E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100056CE8);
  v1 = sub_1000084C0(v0, (uint64_t)qword_100056CE8);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_100003F44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000847C((uint64_t *)&unk_100056F50);
  v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_10002DDDC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

unint64_t sub_100004060(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000847C((uint64_t *)&unk_1000583C0);
  v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002DDDC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_100004184(uint64_t a1)
{
  uint64_t v2 = sub_10000847C(&qword_100056F38);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000847C((uint64_t *)&unk_100056F40);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100008CFC(v12, (uint64_t)v5, &qword_100056F38);
    unint64_t result = sub_10002DF0C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for UUID();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_100004378(uint64_t a1)
{
  return sub_100004390(a1, &qword_100056F30);
}

unint64_t sub_100004384(uint64_t a1)
{
  return sub_100004390(a1, &qword_1000583D0);
}

unint64_t sub_100004390(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000847C(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_10002DDDC(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_1000044A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000847C(&qword_100057050);
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
    sub_100008CFC(v6, (uint64_t)&v15, &qword_100057058);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10002DDDC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100008D60(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1000045E0()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

id sub_1000048E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  return [super dealloc];
}

uint64_t variable initialization expression of APUISystemApertureElement._state()
{
  type metadata accessor for APUISystemApertureLayoutState();
  sub_100005FF4((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);

  return EnvironmentObject.init()();
}

uint64_t variable initialization expression of APUIRemoteAlertPresentationHandle.isDismissing()
{
  return 0;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.preferredLayoutMode()
{
  return 4;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.elementIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.associatedAppBundleIdentifier()
{
  return 0;
}

void *variable initialization expression of APUISystemApertureElementHostingController.backgroundActivitiesToSuppress()
{
  return &_swiftEmptySetSingleton;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.contentRole()
{
  return 2;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding()
{
  return 1;
}

id variable initialization expression of APUISystemApertureElementHostingController.expandedUITransitionCoordinator()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator());

  return [v0 init];
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.expandedUIHostingControllerLayoutState()
{
  type metadata accessor for APUISystemApertureLayoutState();
  uint64_t v0 = swift_allocObject();
  __asm { FMOV            V0.2D, #20.0 }
  Published.init(initialValue:)();
  Published.init(initialValue:)();
  return v0;
}

char *sub_100004AE0(uint64_t a1)
{
  *(void *)&v1[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode] = 0;
  *(void *)&v1[direct field offset for APUISystemApertureElementHostingController.contentRole] = 2;
  *(void *)&v1[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode] = 4;
  *(void *)&v1[direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode] = 4;
  uint64_t v3 = &v1[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  *uint64_t v3 = 0;
  v3[1] = 0;
  *(void *)&v1[direct field offset for APUISystemApertureElementHostingController.elementIdentifier] = 0;
  v1[direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding] = 1;
  *(void *)&v1[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress] = &_swiftEmptySetSingleton;
  uint64_t v4 = qword_100057400;
  id v5 = objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator());
  uint64_t v6 = v1;
  *(void *)&v1[v4] = [v5 init];
  *(void *)&v6[qword_100057408] = 0;
  uint64_t v7 = qword_100057410;
  type metadata accessor for APUISystemApertureLayoutState();
  uint64_t v8 = swift_allocObject();
  __asm { FMOV            V0.2D, #20.0 }
  long long v124 = _Q0;
  long long v125 = _Q0;
  Published.init(initialValue:)();
  long long v123 = 0uLL;
  LOBYTE(v124) = 0;
  Published.init(initialValue:)();
  *(void *)&v6[v7] = v8;
  *(void *)&v6[direct field offset for APUISystemApertureElementHostingController.leadingView] = 0;
  *(void *)&v6[qword_100057418] = 0;
  *(void *)&v6[direct field offset for APUISystemApertureElementHostingController.trailingView] = 0;
  *(void *)&v6[qword_100057420] = 0;
  *(void *)&v6[direct field offset for APUISystemApertureElementHostingController.minimalView] = 0;
  *(void *)&v6[qword_100057428] = 0;
  *(void *)&v6[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors] = 1;

  v111.receiver = v6;
  v111.super_class = (Class)sub_10000847C(&qword_100056F60);
  uint64_t v14 = (char *)[super initWithNibName:0 bundle:0];
  sub_10000A6DC(a1, (uint64_t)v112);
  uint64_t v16 = v112[0];
  uint64_t v15 = v112[1];
  char v17 = v115;
  char v18 = v116;
  long long v96 = v118;
  uint64_t v19 = v117;
  uint64_t v94 = v120;
  uint64_t v95 = v119;
  uint64_t v20 = *(void *)&v14[qword_100057410];
  sub_100005FF4((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
  swift_retain();
  long long v92 = v114;
  long long v93 = v113;
  uint64_t v21 = static ObservableObject.environmentStore.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v23 = swift_getKeyPath();
  v24 = *(void **)&v14[qword_100057400];
  *(void *)&long long v123 = v16;
  *((void *)&v123 + 1) = v15;
  long long v124 = v93;
  long long v125 = v92;
  LOBYTE(v126) = v17;
  BYTE1(v126) = v18;
  *(_DWORD *)((char *)&v126 + 2) = v121;
  WORD3(v126) = v122;
  *((void *)&v126 + 1) = v19;
  long long v127 = v96;
  *(void *)&long long v128 = v95;
  *((void *)&v128 + 1) = v94;
  *(void *)&long long v129 = v21;
  *((void *)&v129 + 1) = v20;
  *(void *)&long long v130 = KeyPath;
  BYTE8(v130) = 1;
  *(void *)&long long v131 = v23;
  *((void *)&v131 + 1) = v24;
  long long v108 = v129;
  long long v109 = v130;
  long long v110 = v131;
  long long v104 = v92;
  long long v105 = v126;
  long long v106 = v96;
  long long v107 = v128;
  long long v102 = v123;
  long long v103 = v93;
  id v25 = v24;
  sub_10000857C((uint64_t)v112);
  sub_100008608((uint64_t)&v123);
  sub_10000847C(&qword_100056F70);
  sub_1000086DC();
  AnyView.init<A>(_:)();
  v26 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryViewController();
  id v27 = objc_allocWithZone(v26);
  v28 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryView();
  objc_allocWithZone(v28);
  v29 = (char *)v27;
  swift_retain();
  *(void *)&v29[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v101.receiver = v29;
  v101.super_class = v26;
  id v30 = [super initWithNibName:0 bundle:0];
  swift_release();
  v31 = *(void **)&v14[qword_100057408];
  *(void *)&v14[qword_100057408] = v30;
  id v32 = v30;

  [v14 addChildViewController:v32];
  unint64_t result = (char *)[v14 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_39;
  }
  v34 = result;
  unint64_t result = (char *)[v32 view];
  if (!result)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v35 = result;
  [v34 addSubview:result];

  [v32 didMoveToParentViewController:v14];
  id v36 = objc_allocWithZone(v26);
  id v37 = objc_allocWithZone(v28);
  swift_retain_n();
  v38 = (char *)v36;
  *(void *)&v38[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v100.receiver = v38;
  v100.super_class = v26;
  id v39 = [super initWithNibName:0 bundle:0];
  swift_release();
  v40 = *(void **)&v14[qword_100057418];
  *(void *)&v14[qword_100057418] = v39;
  v41 = (char *)v39;

  v42 = *(void **)&v41[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v43 = (void **)&v14[direct field offset for APUISystemApertureElementHostingController.leadingView];
  swift_beginAccess();
  v44 = *v43;
  *v43 = v42;
  id v45 = v42;

  [v14 addChildViewController:v41];
  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v46 = result;
  v97 = v32;
  unint64_t result = (char *)[v41 view];
  if (!result)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v47 = result;
  [v46 addSubview:result];

  [v41 didMoveToParentViewController:v14];
  id v48 = objc_allocWithZone(v26);
  id v49 = objc_allocWithZone(v28);
  swift_retain_n();
  v50 = (char *)v48;
  *(void *)&v50[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v99.receiver = v50;
  v99.super_class = v26;
  id v51 = [super initWithNibName:0 bundle:0];
  swift_release();
  v52 = *(void **)&v14[qword_100057420];
  *(void *)&v14[qword_100057420] = v51;
  v53 = (char *)v51;

  v54 = *(void **)&v53[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v55 = (void **)&v14[direct field offset for APUISystemApertureElementHostingController.trailingView];
  swift_beginAccess();
  v56 = *v55;
  *v55 = v54;
  id v57 = v54;

  [v14 addChildViewController:v53];
  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v58 = result;
  unint64_t result = (char *)[v53 view];
  if (!result)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v59 = result;
  [v58 addSubview:result];

  [v53 didMoveToParentViewController:v14];
  id v60 = objc_allocWithZone(v26);
  objc_allocWithZone(v28);
  swift_retain_n();
  v61 = (char *)v60;
  *(void *)&v61[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v98.receiver = v61;
  v98.super_class = v26;
  id v62 = [super initWithNibName:0 bundle:0];
  swift_release();
  v63 = *(void **)&v14[qword_100057428];
  *(void *)&v14[qword_100057428] = v62;
  v64 = (char *)v62;

  v65 = *(void **)&v64[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v66 = (void **)&v14[direct field offset for APUISystemApertureElementHostingController.minimalView];
  swift_beginAccess();
  v67 = *v66;
  *v66 = v65;
  id v68 = v65;

  [v14 addChildViewController:v64];
  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v69 = result;
  unint64_t result = (char *)[v64 view];
  if (!result)
  {
LABEL_45:
    __break(1u);
    return result;
  }
  v70 = result;
  [v69 addSubview:result];

  [v64 didMoveToParentViewController:v14];
  if (v115)
  {
    v71 = &v14[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess();
    if ((*(void *)v71 & 8) == 0) {
      *(void *)v71 |= 8uLL;
    }
  }
  if (v116)
  {
    v72 = &v14[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess();
    if ((*(void *)v72 & 0x40) == 0) {
      *(void *)v72 |= 0x40uLL;
    }
  }
  uint64_t v73 = v117;
  v74 = &v14[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode];
  swift_beginAccess();
  if (v73 != *(void *)v74) {
    *(void *)v74 = v73;
  }
  v75 = (void *)v118;
  v76 = (void **)&v14[direct field offset for APUISystemApertureElementHostingController.elementIdentifier];
  swift_beginAccess();
  v77 = *v76;
  if (!v75)
  {
    if (!v77) {
      goto LABEL_27;
    }
LABEL_26:
    *v76 = v75;
    id v83 = v75;

    goto LABEL_27;
  }
  if (!v77) {
    goto LABEL_26;
  }
  uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v80 = v79;
  if (v78 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v80 == v81)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_27;
  }
  char v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v82 & 1) == 0)
  {
    v77 = *v76;
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v84 = *((void *)&v118 + 1);
  uint64_t v85 = v119;
  v86 = &v14[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  swift_beginAccess();
  uint64_t v87 = *((void *)v86 + 1);
  if (v85)
  {
    if (v87 && (v84 == *(void *)v86 && v85 == v87 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (v87)
  {
LABEL_34:
    *(void *)v86 = v84;
    *((void *)v86 + 1) = v85;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_35:
  uint64_t v88 = v120;
  v89 = (uint64_t *)&v14[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress];
  swift_beginAccess();
  uint64_t v90 = *v89;
  swift_bridgeObjectRetain();
  char v91 = sub_100010330(v88, v90);

  swift_bridgeObjectRelease();
  sub_100008958((uint64_t)&v123);
  swift_release();
  if ((v91 & 1) == 0)
  {
    uint64_t *v89 = v88;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  sub_100008A30((uint64_t)v112);
  return v14;
}

uint64_t variable initialization expression of APUIRemoteAlertPresentationRequest.id()
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v4 = UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t variable initialization expression of APUIRemoteAlertPresentationManager.remoteAlertPresentationHandlesByID()
{
  return sub_100004390((uint64_t)&_swiftEmptyArrayStorage, &qword_1000583D0);
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.delegate@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.systemApertureLayoutModeCustomFrameInScreen()
{
  return 0.0;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.screenWidth()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  double v2 = v1;

  return v2;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.animationPositionTransformYOffset()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  double v2 = v1;

  return v2 / 3.0;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.cornerRadius()
{
  id v0 = [self sharedInstanceForEmbeddedDisplay];
  [v0 maximumContinuousCornerRadius];
  double v2 = v1;

  return v2;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.systemApertureEdgeInset()
{
  id v0 = [self sharedInstanceForEmbeddedDisplay];
  [v0 minimumScreenEdgeInsets];
  double v2 = v1;

  return v2;
}

uint64_t type metadata accessor for SessionSceneDelegate()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for APUISystemApertureElement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for BackgroundActivityProgressView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005944(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005964(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIInterfaceOrientationMask(uint64_t a1)
{
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

void type metadata accessor for STBackgroundActivityIdentifier(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for BackgroundActivityViewControllerFactory()
{
  return &type metadata for BackgroundActivityViewControllerFactory;
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
}

uint64_t sub_100005A2C(uint64_t a1, uint64_t a2)
{
  return sub_100006210(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_100005A5C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100005A64@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100005A78(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100005AA8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100005ABC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100005AD0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_100005AE0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005AF4(uint64_t a1, uint64_t a2)
{
  return sub_100006210(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005B0C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100005B84(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100005C04@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_100005C48(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005C54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_100005C80@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_100005C8C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100005CA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *sub_100005CB4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100005CE0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100005D04(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100005D18@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100005D2C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100005D40(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100005D54(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100005D68()
{
  return *v0 == 0;
}

uint64_t sub_100005D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100005D90(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_100005DA8()
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

uint64_t sub_100005E34(uint64_t a1)
{
  uint64_t v2 = sub_100005FF4(&qword_100056F10, type metadata accessor for STBackgroundActivityIdentifier);
  uint64_t v3 = sub_100005FF4(&qword_100056F18, type metadata accessor for STBackgroundActivityIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005EF0(uint64_t a1)
{
  uint64_t v2 = sub_100005FF4(&qword_100056F20, type metadata accessor for SBUISystemApertureElementIdentifier);
  uint64_t v3 = sub_100005FF4(&qword_100056F28, type metadata accessor for SBUISystemApertureElementIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005FAC()
{
  return sub_100005FF4(&qword_100056EC0, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100005FF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000603C()
{
  return sub_100005FF4(&qword_100056EC8, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100006084()
{
  return sub_100005FF4(&qword_100056ED0, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_1000060CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100008444(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_10000610C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100006154(uint64_t a1)
{
  uint64_t v2 = sub_100005FF4(&qword_100057060, type metadata accessor for ProgressUserInfoKey);
  uint64_t v3 = sub_100005FF4(&qword_100057068, type metadata accessor for ProgressUserInfoKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006210(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100006254()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000062A8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000631C()
{
  return sub_100005FF4(&qword_100056ED8, type metadata accessor for STBackgroundActivityIdentifier);
}

uint64_t sub_100006364()
{
  return sub_100005FF4(&qword_100056EE0, type metadata accessor for STBackgroundActivityIdentifier);
}

uint64_t sub_1000063AC()
{
  return sub_100005FF4(&qword_100056EE8, type metadata accessor for STBackgroundActivityIdentifier);
}

uint64_t sub_1000063F4()
{
  return sub_100005FF4(&qword_100056EF0, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_10000643C()
{
  return sub_100005FF4(&qword_100056EF8, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_100006484()
{
  return sub_100005FF4(&qword_100056F00, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_1000064CC()
{
  return sub_100005FF4(&qword_100056F08, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

char *sub_100006514()
{
  if (qword_100056CE0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084C0(v0, (uint64_t)qword_100056CE8);
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v10 = v4;
    type metadata accessor for UUID();
    sub_100005FF4(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v5 = dispatch thunk of CustomStringConvertible.description.getter();
    sub_10002D634(v5, v6, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Creating system aperture view controller for background activity with ID: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  id v7 = objc_allocWithZone((Class)sub_10000847C(&qword_100056F60));
  uint64_t v8 = swift_retain();
  return sub_100004AE0(v8);
}

char *sub_100006738(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin(v6);
  objc_allocWithZone((Class)sub_10000847C(&qword_100056FE0));
  uint64_t v47 = a2;
  char v48 = a3 & 1;
  id v7 = v3;
  sub_100008AC0();
  uint64_t v8 = (void *)UIHostingController.init(rootView:)();
  sub_10000847C(&qword_100056FE8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10003C710;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  uint64_t v46 = v9;
  sub_100005FF4((unint64_t *)&qword_100056FF0, (void (*)(uint64_t))&type metadata accessor for UIHostingControllerSizingOptions);
  sub_10000847C(&qword_100056FF8);
  sub_100008AC8((unint64_t *)&qword_100057000, &qword_100056FF8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  dispatch thunk of UIHostingController.sizingOptions.setter();
  *(void *)&v7[qword_100058940] = v8;
  id v10 = v8;

  v45.receiver = v7;
  v45.super_class = (Class)sub_10000847C(&qword_100056FD8);
  unint64_t v11 = (char *)[v45 initWithNibName:0 bundle:0];
  uint64_t result = (char *)[v11 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  BOOL v13 = result;
  uint64_t v14 = qword_100058940;
  uint64_t result = (char *)[*(id *)&v11[qword_100058940] view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v15 = result;
  [v13 addSubview:result];

  [v11 addChildViewController:*(void *)&v11[v14]];
  uint64_t result = (char *)[v11 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v16 = result;
  char v17 = self;
  id v18 = [v17 clearColor];
  [v16 setBackgroundColor:v18];

  uint64_t result = (char *)[v10 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v19 = result;
  id v20 = [v17 clearColor];
  [v19 setBackgroundColor:v20];

  uint64_t result = (char *)[v10 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v21 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_10000847C(&qword_100057DD0);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_10003C720;
  uint64_t result = (char *)[v10 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v23 = result;
  id v24 = [result topAnchor];

  uint64_t result = (char *)[v11 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v25 = result;
  id v26 = [result topAnchor];

  id v27 = [v24 constraintEqualToAnchor:v26];
  *(void *)(v22 + 32) = v27;
  uint64_t result = (char *)[v10 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v28 = result;
  id v29 = [result leadingAnchor];

  uint64_t result = (char *)[v11 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v30 = result;
  id v31 = [result leadingAnchor];

  id v32 = [v29 constraintEqualToAnchor:v31];
  *(void *)(v22 + 40) = v32;
  uint64_t result = (char *)[v10 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v33 = result;
  id v34 = [result trailingAnchor];

  uint64_t result = (char *)[v11 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v35 = result;
  id v36 = [result trailingAnchor];

  id v37 = [v34 constraintEqualToAnchor:v36];
  *(void *)(v22 + 48) = v37;
  uint64_t result = (char *)[v10 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v38 = result;
  id v39 = [result bottomAnchor];

  uint64_t result = (char *)[v11 view];
  if (result)
  {
    v40 = result;
    v41 = self;
    id v42 = [v40 bottomAnchor];

    id v43 = [v39 constraintEqualToAnchor:v42];
    *(void *)(v22 + 56) = v43;
    uint64_t v46 = v22;
    specialized Array._endMutation()();
    sub_100008B0C();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v41 activateConstraints:isa];

    return v11;
  }
LABEL_27:
  __break(1u);
  return result;
}

char *sub_100006DE4(uint64_t a1)
{
  if (qword_100056CE0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000084C0(v2, (uint64_t)qword_100056CE8);
  swift_retain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v12 = v6;
    type metadata accessor for UUID();
    sub_100005FF4(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v7 = dispatch thunk of CustomStringConvertible.description.getter();
    sub_10002D634(v7, v8, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Creating live activities view controller for background activity with ID: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  id v9 = objc_allocWithZone((Class)sub_10000847C(&qword_100056FD8));
  swift_retain();
  id v10 = sub_100006738((uint64_t)sub_100008AB8, a1, 0);
  swift_release();
  return v10;
}

void sub_100007034(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100056CE0 != -1) {
LABEL_54:
  }
    swift_once();
  uint64_t v8 = sub_1000084C0(v4, (uint64_t)qword_100056CE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a2;
  id v10 = a1;
  id v11 = v9;
  id v12 = v10;
  BOOL v13 = Logger.logObject.getter();
  int v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    LODWORD(v88) = v14;
    os_log_t v89 = v13;
    uint64_t v87 = v8;
    uint64_t v15 = swift_slowAlloc();
    id v86 = (id)swift_slowAlloc();
    v91[0] = (uint64_t)v86;
    *(_DWORD *)uint64_t v15 = 136315394;
    id v16 = [v11 role];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    unint64_t v92 = sub_10002D634(v17, v19, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    type metadata accessor for ActivityScene();
    if (swift_dynamicCastClass()
      && (swift_getKeyPath(),
          dispatch thunk of ActivityScene.subscript.getter(),
          swift_release(),
          (unint64_t v20 = (unint64_t)v93) != 0))
    {
      uint64_t v21 = v92;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v20 = 0xE500000000000000;
      uint64_t v21 = 0x3E6C696E3CLL;
    }
    os_log_type_t v23 = v88;
    unint64_t v92 = sub_10002D634(v21, v20, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v24 = v89;
    _os_log_impl((void *)&_mh_execute_header, v89, v23, "SessionSceneDelegate: Scene will connect called with role: %s, activity identifier: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v5 += 8;
    v25(v7, v4);
    uint64_t v8 = v87;
  }
  else
  {

    uint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    v5 += 8;
    v22(v7, v4);
  }
  type metadata accessor for ActivityScene();
  uint64_t v26 = swift_dynamicCastClass();
  if (!v26)
  {
    id v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "SessionSceneDelegate: Received a UIScene that is not of type SessionScene.", v41, 2u);
      swift_slowDealloc();
    }
    goto LABEL_59;
  }
  id v27 = (id)v26;
  id v28 = v12;
  id v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  BOOL v31 = os_log_type_enabled(v29, v30);
  id v86 = v27;
  if (v31)
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    unint64_t v92 = v5;
    *(_DWORD *)uint64_t v32 = 136315138;
    os_log_t v89 = (os_log_t)(v32 + 4);
    v33 = v28;
    uint64_t v34 = v8;
    id v35 = [v27 description];
    uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v38 = v37;

    uint64_t v8 = v34;
    id v28 = v33;
    v91[0] = sub_10002D634(v36, v38, (uint64_t *)&v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    id v27 = v86;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "SessionSceneDelegate: Connecting session scene: %s", (uint8_t *)v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_getKeyPath();
  dispatch thunk of ActivityScene.subscript.getter();
  swift_release();
  if (!v93)
  {
LABEL_57:
    id v78 = v28;
    id v39 = Logger.logObject.getter();
    os_log_type_t v79 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v39, v79))
    {

      return;
    }
    uint64_t v80 = (uint8_t *)swift_slowAlloc();
    uint64_t v81 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v80 = 138412290;
    unint64_t v92 = (unint64_t)v27;
    id v82 = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v81 = v27;

    _os_log_impl((void *)&_mh_execute_header, v39, v79, "Unable to find a background activity to represent with session scene: %@", v80, 0xCu);
    sub_10000847C(&qword_100057E60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_59:
    return;
  }
  os_log_t v89 = v93;
  unint64_t v88 = v92;
  if (qword_100056D28 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v42 = sub_1000264F0(v92);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v43 = sub_1000264F0(v92);
  swift_bridgeObjectRelease();
  unint64_t v92 = v42;
  sub_100023A04(v43);
  unint64_t v44 = v92;
  id v84 = v28;
  if (v92 >> 62)
  {
    swift_bridgeObjectRetain();
    a1 = (void *)_CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (a1) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
  a1 = *(void **)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!a1)
  {
LABEL_56:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v28 = v84;
    id v27 = v86;
    goto LABEL_57;
  }
LABEL_20:
  uint64_t v87 = v8;
  uint64_t v7 = (char *)(v44 & 0xC000000000000001);
  uint64_t v45 = 4;
  while (1)
  {
    a2 = (void *)(v45 - 4);
    if (v7)
    {
      uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v46 = (void *)(v45 - 3);
      if (__OFADD__(a2, 1)) {
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v4 = *(void *)(v44 + 8 * v45);
      swift_retain();
      uint64_t v46 = (void *)(v45 - 3);
      if (__OFADD__(a2, 1))
      {
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
    }
    if (*(void *)(v4 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity)) {
      break;
    }
LABEL_21:
    swift_release();
    ++v45;
    if (v46 == a1) {
      goto LABEL_56;
    }
  }
  uint64_t v5 = v4;
  swift_retain();
  uint64_t v47 = Activity.id.getter();
  id v49 = v48;
  swift_release();
  if (v47 != v88 || v89 != v49)
  {
    char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v52 = v5;
    if (v51)
    {
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v52 = v5;
LABEL_36:
  swift_bridgeObjectRelease();
  id v53 = v86;
  unsigned int v54 = [v86 SBUI_isHostedBySystemAperture];
  v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.default.getter();
  BOOL v57 = os_log_type_enabled(v55, v56);
  v58 = v84;
  if (v54)
  {
    if (v57)
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "SessionSceneDelegate: Received ActivityKit scene hosted by system aperture", v59, 2u);
      swift_slowDealloc();
    }

    swift_getKeyPath();
    dispatch thunk of ActivityScene.subscript.getter();
    swift_release();
    uint64_t v60 = (uint64_t)v93;
    if (v93)
    {
      uint64_t v61 = v92;
    }
    else
    {
      id v66 = [v53 session];
      id v67 = [v66 persistentIdentifier];

      uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v60 = v68;
    }
    v69 = (uint64_t *)(v85 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_systemApertureElementProvidersByID);
    swift_beginAccess();
    uint64_t v70 = *v69;
    if (*(void *)(*v69 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v71 = sub_10002DDDC(v61, v60);
      if (v72)
      {
        uint64_t v73 = *(char **)(*(void *)(v70 + 56) + 8 * v71);
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v74 = Logger.logObject.getter();
        os_log_type_t v75 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v74, v75))
        {
          v76 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v76 = 0;
          _os_log_impl((void *)&_mh_execute_header, v74, v75, "SessionSceneDelegate: using cachedSystemApertureElementProvider", v76, 2u);
          swift_slowDealloc();
          swift_unknownObjectRelease();
        }
        else
        {

          swift_unknownObjectRelease();
        }
        goto LABEL_51;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v73 = sub_100006514();
LABEL_51:
    [v53 setSystemApertureElementViewControllerProvider:v73];
    swift_beginAccess();
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = *v69;
    uint64_t *v69 = 0x8000000000000000;
    sub_100023300((uint64_t)v73, v61, v60, isUniquelyReferenced_nonNull_native);
    uint64_t *v69 = v90;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();

    swift_unknownObjectRelease();
    return;
  }
  if (v57)
  {
    id v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v62 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "SessionSceneDelegate: Received ActivityKit scene not hosted in system aperture", v62, 2u);
    swift_slowDealloc();
  }

  v63 = sub_100006DE4(v52);
  id v64 = [objc_allocWithZone((Class)type metadata accessor for APUISecureWindow()) initWithWindowScene:v53];
  [v64 setRootViewController:v63];
  [v64 makeKeyAndVisible];
  v65 = *(void **)(v85 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window);
  *(void *)(v85 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window) = v64;

  swift_release();
}

id sub_100007D08(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100056CE0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000084C0(v2, (uint64_t)qword_100056CE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  uint64_t v8 = Logger.logObject.getter();
  int v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, (os_log_type_t)v9))
  {
    int v22 = v9;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v26 = v23;
    *(_DWORD *)uint64_t v10 = 136315394;
    id v11 = [v7 session];
    id v12 = [v11 role];

    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;

    uint64_t v24 = sub_10002D634(v13, v15, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    type metadata accessor for ActivityScene();
    if (swift_dynamicCastClass()
      && (swift_getKeyPath(), dispatch thunk of ActivityScene.subscript.getter(), swift_release(), (unint64_t v16 = v25) != 0))
    {
      uint64_t v17 = v24;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v16 = 0xE500000000000000;
      uint64_t v17 = 0x3E6C696E3CLL;
    }
    os_log_type_t v18 = v22;
    uint64_t v24 = sub_10002D634(v17, v16, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v18, "SessionSceneDelegate: sceneDidBecomeActive with role: %s, activity identifier: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_100056D28 != -1) {
    id result = (id)swift_once();
  }
  uint64_t v20 = qword_100058B58;
  if (*(unsigned char *)(qword_100058B58
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation) == 1)
  {
    *(unsigned char *)(qword_100058B58
             + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation) = 0;
    return [*(id *)(v20 + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator) notificationOccurred:0];
  }
  return result;
}

uint64_t sub_1000080DC(void *a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100056CE0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000084C0(v4, (uint64_t)qword_100056CE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  uint64_t v10 = Logger.logObject.getter();
  int v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    HIDWORD(v23) = v11;
    uint64_t v24 = a2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v28 = v25;
    *(_DWORD *)uint64_t v12 = 136315394;
    id v13 = [v9 session];
    id v14 = [v13 role];

    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v17 = v16;

    uint64_t v26 = sub_10002D634(v15, v17, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    type metadata accessor for ActivityScene();
    if (swift_dynamicCastClass()
      && (swift_getKeyPath(), dispatch thunk of ActivityScene.subscript.getter(), swift_release(), (unint64_t v18 = v27) != 0))
    {
      uint64_t v19 = v26;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xE500000000000000;
      uint64_t v19 = 0x3E6C696E3CLL;
    }
    uint64_t v20 = v24;
    os_log_type_t v21 = BYTE4(v23);
    uint64_t v26 = sub_10002D634(v19, v18, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v21, v20, (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100008444(uint64_t a1)
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

uint64_t sub_10000847C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000084C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000084F8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000857C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  return a1;
}

uint64_t sub_100008608(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_1000086DC()
{
  unint64_t result = qword_100056F78;
  if (!qword_100056F78)
  {
    sub_10000877C(&qword_100056F70);
    sub_1000087C4();
    sub_100008AC8(&qword_100056FC8, &qword_100056FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100056F78);
  }
  return result;
}

uint64_t sub_10000877C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000087C4()
{
  unint64_t result = qword_100056F80;
  if (!qword_100056F80)
  {
    sub_10000877C(&qword_100056F88);
    sub_100008864();
    sub_100008AC8(&qword_100056FB8, &qword_100056FC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100056F80);
  }
  return result;
}

unint64_t sub_100008864()
{
  unint64_t result = qword_100056F90;
  if (!qword_100056F90)
  {
    sub_10000877C(&qword_100056F98);
    sub_100008904();
    sub_100008AC8(&qword_100056FA8, &qword_100056FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100056F90);
  }
  return result;
}

unint64_t sub_100008904()
{
  unint64_t result = qword_100056FA0;
  if (!qword_100056FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100056FA0);
  }
  return result;
}

uint64_t sub_100008958(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_100008A30(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100008AB8()
{
  return swift_retain();
}

uint64_t sub_100008AC0()
{
  return swift_retain();
}

uint64_t sub_100008AC8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000877C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008B0C()
{
  unint64_t result = qword_100057010;
  if (!qword_100057010)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100057010);
  }
  return result;
}

void type metadata accessor for ProgressUserInfoKey(uint64_t a1)
{
}

__n128 sub_100008B60(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_100008B80(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100008BA0(uint64_t result, int a2, int a3)
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

void sub_100008BDC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100008C24()
{
  return sub_100005FF4(&qword_100057038, type metadata accessor for ProgressUserInfoKey);
}

uint64_t sub_100008C6C()
{
  return sub_100005FF4(&qword_100057040, type metadata accessor for ProgressUserInfoKey);
}

uint64_t sub_100008CB4()
{
  return sub_100005FF4(&qword_100057048, type metadata accessor for ProgressUserInfoKey);
}

uint64_t sub_100008CFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000847C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100008D60(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void APUISystemApertureElementHostingController.expandedUITransitionCoordinator.setter()
{
}

uint64_t sub_100008DB8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100057130);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_100057130);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  char v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100008E80()
{
  type metadata accessor for PillActor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_100058B18 = v0;
  return result;
}

uint64_t sub_100008EBC()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for PillActor()
{
  return self;
}

uint64_t sub_100008F10()
{
  return v0;
}

uint64_t sub_100008F1C()
{
  if (qword_100056D08 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_100008F78()
{
  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

uint64_t sub_100008F80()
{
  uint64_t v0 = sub_10000847C(&qword_1000572A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100056D28 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v11[1] + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v5 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = qword_100056D08;
    swift_retain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_100058B18;
    unint64_t v9 = sub_10000A1A0();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v8;
    v10[3] = v9;
    v10[4] = v6;
    swift_retain();
    swift_release();
    sub_100019898((uint64_t)v2, (uint64_t)&unk_1000572C8, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_100009188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  if (qword_100056D08 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100058B18;
  return _swift_task_switch(sub_100009220, v5, 0);
}

uint64_t sub_100009220()
{
  swift_beginAccess();
  Strong = (void *)swift_weakLoadStrong();
  if (Strong)
  {
    if (!Strong[5])
    {
      id v2 = [objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution) initWithBackgroundActivityIdentifier:Strong[2] activityAttribution:Strong[3] showsWhenForeground:1];
      sub_1000092F0(v2);
    }
    swift_release();
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000092F0(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100056D00 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000084C0(v4, (uint64_t)qword_100057130);
  id v5 = a1;
  swift_retain_n();
  uint64_t v6 = (void **)v5;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v24 = a1;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412546;
    int v11 = *(void **)(v2 + 40);
    if (v11)
    {
      aBlock = *(void ***)(v2 + 40);
      id v12 = v11;
    }
    else
    {
      aBlock = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v10 = v11;
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    a1 = v24;
    if (v24)
    {
      aBlock = v6;
      id v13 = v6;
    }
    else
    {
      aBlock = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v10[1] = v24;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Updating status pill attribution from %@ to %@", (uint8_t *)v9, 0x16u);
    sub_10000847C(&qword_100057E60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  id v25 = *(id *)(v2 + 32);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = a1;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_10000A3E4;
  *(void *)(v16 + 24) = v15;
  os_log_type_t v30 = sub_10000A3FC;
  uint64_t v31 = v16;
  aBlock = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_100009B40;
  id v29 = &unk_10004DDE8;
  unint64_t v17 = _Block_copy(&aBlock);
  unint64_t v18 = v6;
  swift_retain();
  swift_release();
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = a1;
  os_log_type_t v30 = sub_10000A480;
  uint64_t v31 = v20;
  aBlock = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_100014A00;
  id v29 = &unk_10004DE38;
  os_log_type_t v21 = _Block_copy(&aBlock);
  int v22 = v18;
  swift_release();
  [v25 updateData:v17 completion:v21];
  _Block_release(v21);
  _Block_release(v17);
  LOBYTE(v21) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v21) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100009758()
{
  uint64_t v0 = sub_10000847C(&qword_1000572A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100056D28 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v11[1] + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v5 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = qword_100056D08;
    swift_retain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_100058B18;
    unint64_t v9 = sub_10000A1A0();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v8;
    v10[3] = v9;
    v10[4] = v6;
    swift_retain();
    swift_release();
    sub_100019898((uint64_t)v2, (uint64_t)&unk_1000572B8, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_100009960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  if (qword_100056D08 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100058B18;
  return _swift_task_switch(sub_1000099F8, v5, 0);
}

uint64_t sub_1000099F8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (*(void *)(Strong + 40)) {
      sub_1000092F0(0);
    }
    swift_release();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100009A94(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (*(void *)(result + 40)) {
      [a1 removeAttribution:];
    }
    if (a4) {
      [a1 addAttribution:a4];
    }
    [a2 setUserInitiated:1];
    return swift_release();
  }
  return result;
}

void sub_100009B40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

void sub_100009BAC(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void **)(Strong + 40);
    *(void *)(Strong + 40) = a2;
    id v5 = a2;

    if (qword_100056D00 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_1000084C0(v6, (uint64_t)qword_100057130);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Updated status pill attribution", v9, 2u);
      swift_slowDealloc();
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

uint64_t sub_100009CE0()
{
  uint64_t v1 = (id *)v0;
  uint64_t v2 = *(void **)(v0 + 40);
  if (!v2)
  {
    int v11 = 0;
LABEL_9:

    sub_10000A580((uint64_t)v11);
    return (uint64_t)v1;
  }
  uint64_t v3 = qword_100056D00;
  id v4 = v2;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000084C0(v5, (uint64_t)qword_100057130);
  uint64_t v6 = (void **)v4;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    aBlock = v6;
    *(_DWORD *)unint64_t v9 = 138412290;
    uint64_t v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v19 = v2;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Status pill controller deinitialized with non-nil attribution: %@, removing...", v9, 0xCu);
    sub_10000847C(&qword_100057E60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v12 = v1[4];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  uint64_t v14 = swift_allocObject();
  int v11 = sub_10000A5C8;
  *(void *)(v14 + 16) = sub_10000A5C8;
  *(void *)(v14 + 24) = v13;
  id v24 = sub_10000A600;
  uint64_t v25 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256;
  int v22 = sub_100009B40;
  uint64_t v23 = &unk_10004DED8;
  uint64_t v15 = _Block_copy(&aBlock);
  uint64_t v16 = v6;
  swift_retain();
  swift_release();
  id v24 = sub_10000A05C;
  uint64_t v25 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256;
  int v22 = sub_100014A00;
  uint64_t v23 = &unk_10004DF00;
  unint64_t v17 = _Block_copy(&aBlock);
  [v12 updateData:v15 completion:v17];

  _Block_release(v17);
  _Block_release(v15);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v16 & 1) == 0) {
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

void sub_10000A05C()
{
  if (qword_100056D00 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084C0(v0, (uint64_t)qword_100057130);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Status pill attribution removed", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10000A144()
{
  sub_100009CE0();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for BackgroundActivitySystemPillController()
{
  return self;
}

unint64_t sub_10000A1A0()
{
  unint64_t result = qword_1000572A0;
  if (!qword_1000572A0)
  {
    type metadata accessor for PillActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000572A0);
  }
  return result;
}

uint64_t sub_10000A1FC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A238(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000A2EC;
  return sub_100009960(a1, v4, v5, v6);
}

uint64_t sub_10000A2EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  os_log_type_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A3E4(void *a1, void *a2)
{
  return sub_100009A94(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10000A3EC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A3FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A424(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A434()
{
  return swift_release();
}

uint64_t sub_10000A440()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000A480()
{
  sub_100009BAC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000A48C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A4CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000A604;
  return sub_100009188(a1, v4, v5, v6);
}

uint64_t sub_10000A580(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000A590()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000A5C8(void *a1)
{
  return [a1 removeAttribution:*(void *)(v1 + 16)];
}

uint64_t sub_10000A5D8()
{
  return _swift_deallocObject(v0, 32, 7);
}

ValueMetadata *type metadata accessor for TestAppView()
{
  return &type metadata for TestAppView;
}

uint64_t sub_10000A618()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A63C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10000A658@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

void *sub_10000A6D0()
{
  return &protocol witness table for Text;
}

double sub_10000A6DC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for APUISystemApertureLayoutState();
  sub_10000AAB8();
  uint64_t v4 = EnvironmentObject.init()();
  uint64_t v16 = v5;
  uint64_t v17 = v4;
  sub_10000AB10();
  swift_retain();
  uint64_t v6 = AnyView.init<A>(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (qword_100056D88 != -1) {
    swift_once();
  }
  if (qword_100056D90 != -1) {
    swift_once();
  }
  sub_10000ABB8();
  uint64_t v7 = AnyView.init<A>(_:)();
  sub_10000AC0C();
  uint64_t v8 = qword_100056DB0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  swift_retain();
  UIColor.init(_:)();
  if (qword_100056D58 != -1) {
    swift_once();
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10000847C(&qword_1000572E8);
  sub_10000AC4C();
  uint64_t v9 = AnyView.init<A>(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v10 = AnyView.init<A>(_:)();
  sub_10000847C(&qword_100057300);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003C710;
  *(void *)(inited + 32) = String._bridgeToObjectiveC()();
  id v12 = sub_10000AD1C(inited);
  swift_setDeallocating();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  swift_arrayDestroy();
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  uint64_t v14 = swift_bridgeObjectRetain();
  *(void *)a2 = v17;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(_WORD *)(a2 + 48) = 1;
  *(void *)&double result = 4;
  *(_OWORD *)(a2 + 56) = xmmword_10003D190;
  *(void *)(a2 + 72) = v13;
  *(void *)(a2 + 80) = v14;
  *(void *)(a2 + 88) = v12;
  return result;
}

unint64_t sub_10000AAB8()
{
  unint64_t result = qword_100057380;
  if (!qword_100057380)
  {
    type metadata accessor for APUISystemApertureLayoutState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057380);
  }
  return result;
}

unint64_t sub_10000AB10()
{
  unint64_t result = qword_1000572D0;
  if (!qword_1000572D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000572D0);
  }
  return result;
}

double sub_10000AB64@<D0>(_OWORD *a1@<X8>)
{
  sub_10000A6DC(*v1, (uint64_t)v7);
  long long v3 = v7[3];
  a1[2] = v7[2];
  a1[3] = v3;
  long long v4 = v7[5];
  a1[4] = v7[4];
  a1[5] = v4;
  double result = *(double *)v7;
  long long v6 = v7[1];
  *a1 = v7[0];
  a1[1] = v6;
  return result;
}

unint64_t sub_10000ABB8()
{
  unint64_t result = qword_1000572D8;
  if (!qword_1000572D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000572D8);
  }
  return result;
}

unint64_t sub_10000AC0C()
{
  unint64_t result = qword_1000572E0;
  if (!qword_1000572E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000572E0);
  }
  return result;
}

unint64_t sub_10000AC4C()
{
  unint64_t result = qword_1000572F0;
  if (!qword_1000572F0)
  {
    sub_10000877C(&qword_1000572E8);
    sub_10000ACC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000572F0);
  }
  return result;
}

unint64_t sub_10000ACC8()
{
  unint64_t result = qword_1000572F8;
  if (!qword_1000572F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000572F8);
  }
  return result;
}

void *sub_10000AD1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000847C(&qword_100057308);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      long long v6 = *(void **)(v32 + 8 * v4);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      id v7 = v6;
      String.hash(into:)();
      Swift::Int v8 = Hasher._finalize()();
      unint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v17 = v16;
        if (v15 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        unint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v24 = v23;
          if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          unint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

ValueMetadata *type metadata accessor for BackgroundActivitySystemApertureElement()
{
  return &type metadata for BackgroundActivitySystemApertureElement;
}

unint64_t sub_10000AF60(uint64_t a1)
{
  unint64_t result = sub_10000AF88();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000AF88()
{
  unint64_t result = qword_100057310;
  if (!qword_100057310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057310);
  }
  return result;
}

void sub_10000AFDC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 publishedObjectWithName:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10000C220((uint64_t)v9, (uint64_t)v10);
  if (v11)
  {
    sub_10000C2E8(0, &qword_100057370);
    if (swift_dynamicCast())
    {
      [*(id *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress) fractionCompleted];
      double v5 = 0.999 - v4 * 0.999 / 0.999;
      BOOL v6 = v4 < 0.01;
      double v7 = 0.989;
      if (!v6) {
        double v7 = v5;
      }
      [v8 setStrokeStart:v7];
    }
  }
  else
  {
    sub_10000C288((uint64_t)v10);
  }
  sub_10000BC54();
}

void sub_10000B140(id a1)
{
  if (a1)
  {
    id v3 = [a1 identifier];
    double v4 = (id *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    double v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    if (!v5)
    {
      if (!v3) {
        return;
      }
      goto LABEL_15;
    }
  }
  else
  {
    double v4 = (id *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    double v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    if (!v5) {
      return;
    }
    id v3 = 0;
  }
  id v6 = [v5 identifier];
  double v7 = v6;
  if (!v3)
  {
    if (!v6) {
      return;
    }
    goto LABEL_17;
  }
  if (!v6)
  {
LABEL_15:
    double v7 = v3;
LABEL_17:

LABEL_18:
    if (*v4)
    {
      uint64_t v14 = *(void **)(v1
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
      id v15 = *v4;
      [v14 addAction:v15 forControlEvents:0x2000];
      [v14 setHidden:0];
    }
    if (a1)
    {
      uint64_t v16 = *(void **)(v1
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
      id v17 = a1;
      [v16 removeAction:forControlEvents:];
      if (!*v4) {
        [v16 setHidden:1];
      }
    }
    return;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v11)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v13 & 1) == 0) {
    goto LABEL_18;
  }
}

uint64_t sub_10000B33C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  swift_beginAccess();
  return *v1;
}

id sub_10000B388(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  BOOL v4 = 1;
  swift_beginAccess();
  *id v3 = a1;
  sub_10000BC54();
  if (*v3 == 1) {
    BOOL v4 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) == 0;
  }
  return [*(id *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton) setHidden:v4];
}

void (*sub_10000B424(void *a1))(void *a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = APUISystemApertureView.expanded.modify();
  return sub_10000B480;
}

void sub_10000B480(void *a1, char a2)
{
  id v3 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[4];
    sub_10000BC54();
    double v5 = *(void **)(v4 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
    id v6 = (unsigned char *)(v4 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
    swift_beginAccess();
    BOOL v7 = *v6 != 1
      || *(void *)(v3[4] + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) == 0;
    [v5 setHidden:v7];
  }

  free(v3);
}

void sub_10000B550(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for UIButton.Configuration();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress;
  uint64_t v9 = self;
  uint64_t v10 = v4;
  *(void *)&v4[v8] = [v9 progressWithTotalUnitCount:1000];
  uint64_t v11 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction;
  *(void *)&v10[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction] = 0;
  v10[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton] = 0;
  v10[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification] = 0;
  type metadata accessor for BackgroundActivitySession();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = [self bundleForClass:ObjCClassFromMetadata];
  id v14 = objc_allocWithZone((Class)BSUICAPackageView);
  id v15 = v13;
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v14 initWithPackageName:v16 inBundle:v15];

  if (v17)
  {
    v41 = v15;
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (qword_100056DD0 != -1) {
      swift_once();
    }
    [v17 setFrame:0.0, 0.0, *(double *)&static APUISystemApertureView.compactDimension, *(double *)&static APUISystemApertureView.compactDimension];
    NSString v18 = String._bridgeToObjectiveC()();
    [v17 setState:v18];

    *(void *)&v10[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView] = v17;
    sub_10000C2E8(0, &qword_100057378);
    id v19 = v17;
    static UIButton.Configuration.plain()();
    id v20 = a4;
    id v21 = (id)UIButton.init(configuration:primaryAction:)();
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v21 setAccessibilityLabel:v22];

    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    *(void *)&v10[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton] = v21;
    uint64_t v23 = *(void **)&v10[v11];
    *(void *)&v10[v11] = a4;
    id v39 = v20;
    id v24 = v21;

    v45.receiver = v10;
    v45.super_class = (Class)type metadata accessor for BackgroundActivityProgressMicaView();
    [super init];
    [v25 addSubview:v19];
    [v25 addSubview:v24];
    id v26 = v25;
    os_log_type_t v40 = v19;
    APUISystemApertureView.createConstraints(forSubview:offset:alignedToEdge:)(v19, a2, 0.0);

    sub_10000C2E8(0, (unint64_t *)&qword_100057010);
    id v27 = v26;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v27 addConstraints:isa];

    id v29 = v27;
    APUISystemApertureView.createConstraints(forSubview:offset:alignedToEdge:)(v24, a2, 0.0);

    uint64_t v30 = (char *)v29;
    Class v31 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v30 addConstraints:v31];

    uint64_t v32 = *(void **)&v30[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton];
    if (a4)
    {
      v33 = v39;
      id v34 = v39;
      [v32 addAction:v34 forControlEvents:0x2000];
      id v35 = &v30[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded];
      swift_beginAccess();
      [v32 setHidden:(*v35 & 1) == 0];

      uint64_t v36 = a1;
    }
    else
    {
      [*(id *)&v30[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton] setHidden:1];
      uint64_t v36 = a1;
      v33 = v39;
    }
    unint64_t v37 = *(void **)&v30[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton];
    [v37 addTarget:v30 action:@"touchedDownCancelButton" forControlEvents:17];
    unint64_t v38 = v30;
    [v37 addTarget:v38 action:"touchedUpCancelButton" forControlEvents:480];
  }
  else
  {
    __break(1u);
  }
}

void sub_10000BC54()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  id v3 = &v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded];
  swift_beginAccess();
  LODWORD(v3) = *v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress;
  unsigned __int8 v5 = [*(id *)&v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress] isIndeterminate];
  if (v3 == 1)
  {
    if ((v5 & 1) == 0)
    {
      [*(id *)&v0[v4] fractionCompleted];
      if (v6 >= 0.00001)
      {
        [*(id *)&v0[v4] fractionCompleted];
        if (v7 >= 1.0)
        {
          uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton];
          String.LocalizationValue.init(stringLiteral:)();
          static Locale.current.getter();
          String.init(localized:table:bundle:locale:comment:)();
          NSString v12 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          [v11 setAccessibilityLabel:v12];
        }
      }
    }
  }
  else
  {
    if ((v5 & 1) == 0)
    {
      [*(id *)&v0[v4] fractionCompleted];
      if (v8 >= 0.00001) {
        [*(id *)&v0[v4] fractionCompleted];
      }
    }
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(_:)();
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v0 setAccessibilityLabel:v9];

    objc_msgSend(objc_msgSend(v0, "systemApertureElementContext"), "setElementNeedsUpdate");
    swift_unknownObjectRelease();
    uint64_t v10 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification;
    if ((v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification] & 1) == 0)
    {
      UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v0);
      v0[v10] = 1;
    }
  }
  id v13 = *(void **)&v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView];
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v13 setState:v14];
}

void sub_10000C0FC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
}

id sub_10000C15C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackgroundActivityProgressMicaView();
  return [super dealloc];
}

uint64_t type metadata accessor for BackgroundActivityProgressMicaView()
{
  return self;
}

uint64_t sub_10000C220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000847C(&qword_100057E50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C288(uint64_t a1)
{
  uint64_t v2 = sub_10000847C(&qword_100057E50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C2E8(uint64_t a1, unint64_t *a2)
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

char *APUISystemApertureElementHostingController.__allocating_init(elementProvider:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return APUISystemApertureElementHostingController.init(elementProvider:)(a1);
}

uint64_t APUISystemApertureElement.init<A, B, C>(expanded:compactLeading:compactTrailing:)@<X0>(void (*a1)(void)@<X0>, void (*a2)(void)@<X2>, void (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  type metadata accessor for APUISystemApertureLayoutState();
  sub_1000112A4((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
  uint64_t v7 = EnvironmentObject.init()();
  uint64_t v13 = v8;
  uint64_t v14 = v7;
  a1();
  uint64_t v9 = AnyView.init<A>(_:)();
  a2();
  uint64_t v10 = AnyView.init<A>(_:)();
  a3();
  uint64_t v11 = AnyView.init<A>(_:)();
  a2();
  uint64_t result = AnyView.init<A>(_:)();
  *(void *)a4 = v14;
  *(void *)(a4 + 8) = v13;
  *(void *)(a4 + 16) = v9;
  *(void *)(a4 + 24) = v10;
  *(void *)(a4 + 32) = v11;
  *(void *)(a4 + 40) = result;
  *(_WORD *)(a4 + 48) = 0;
  *(void *)(a4 + 56) = 4;
  *(void *)(a4 + 64) = 0;
  *(void *)(a4 + 72) = 0;
  *(void *)(a4 + 80) = 0;
  *(void *)(a4 + 88) = &_swiftEmptySetSingleton;
  return result;
}

__n128 APUISystemApertureElement.showsOnCoverSheet(_:)@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1 + 88);
  long long v11 = *(_OWORD *)(v2 + 56);
  __n128 v12 = *(__n128 *)(v2 + 72);
  char v5 = *(unsigned char *)(v2 + 49);
  uint64_t v6 = *(void *)v2;
  uint64_t v7 = *(void *)(v2 + 8);
  long long v9 = *(_OWORD *)(v2 + 32);
  long long v10 = *(_OWORD *)(v2 + 16);
  sub_10000857C(v2);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 48) = 1;
  *(unsigned char *)(a1 + 49) = v5;
  *(_OWORD *)(a1 + 56) = v11;
  __n128 result = v12;
  *(__n128 *)(a1 + 72) = v12;
  *(void *)(a1 + 88) = v4;
  return result;
}

__n128 APUISystemApertureElement.suppressingBackgroundActivities(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)v2;
  uint64_t v6 = *(void *)(v2 + 8);
  char v7 = *(unsigned char *)(v2 + 48);
  char v8 = *(unsigned char *)(v2 + 49);
  __n128 v9 = *(__n128 *)(v2 + 56);
  uint64_t v10 = *(void *)(v2 + 72);
  uint64_t v11 = *(void *)(v2 + 80);
  uint64_t v16 = *(void *)(v2 + 88);
  long long v14 = *(_OWORD *)(v2 + 16);
  __n128 v15 = v9;
  long long v13 = *(_OWORD *)(v2 + 32);
  sub_10000857C(v2);
  swift_bridgeObjectRetain();
  sub_10000EF00((uint64_t)&v16);
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v13;
  *(unsigned char *)(a2 + 48) = v7;
  *(unsigned char *)(a2 + 49) = v8;
  __n128 result = v15;
  *(__n128 *)(a2 + 56) = v15;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v11;
  *(void *)(a2 + 88) = a1;
  return result;
}

__n128 APUISystemApertureElement.associatedAppBundleIdentifier(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)v3;
  uint64_t v7 = *(void *)(v3 + 8);
  char v8 = *(unsigned char *)(v3 + 48);
  char v9 = *(unsigned char *)(v3 + 49);
  uint64_t v10 = *(void *)(v3 + 56);
  uint64_t v11 = *(void *)(v3 + 64);
  uint64_t v12 = *(void *)(v3 + 88);
  __n128 v14 = *(__n128 *)(v3 + 32);
  long long v15 = *(_OWORD *)(v3 + 16);
  sub_1000102A0(v3 + 72, (uint64_t)v17, &qword_100057388);
  sub_10000857C(v3);
  swift_bridgeObjectRetain();
  sub_10000EF2C((uint64_t)v17);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v7;
  __n128 result = v14;
  *(_OWORD *)(a3 + 16) = v15;
  *(__n128 *)(a3 + 32) = v14;
  *(unsigned char *)(a3 + 48) = v8;
  *(unsigned char *)(a3 + 49) = v9;
  *(void *)(a3 + 56) = v10;
  *(void *)(a3 + 64) = v11;
  *(void *)(a3 + 72) = a1;
  *(void *)(a3 + 80) = a2;
  *(void *)(a3 + 88) = v12;
  return result;
}

void *APUIHostedBySystemAperture.defaultValue.unsafeMutableAddressor()
{
  return &static APUIHostedBySystemAperture.defaultValue;
}

void sub_10000C7B0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10000C7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, &protocol witness table for Bool);
}

uint64_t EnvironmentValues.isHostedBySystemAperture.getter()
{
  sub_10000EF58();
  EnvironmentValues.subscript.getter();
  return v1;
}

uint64_t EnvironmentValues.isHostedBySystemAperture.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t (*EnvironmentValues.isHostedBySystemAperture.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_10000EF58();
  EnvironmentValues.subscript.getter();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_10000C8B0;
}

uint64_t sub_10000C8B0(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return EnvironmentValues.subscript.setter();
}

uint64_t APUISystemApertureElement.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)@<X0>(void (*a1)(void)@<X0>, void (*a2)(void)@<X2>, void (*a3)(void)@<X4>, void (*a4)(void)@<X6>, uint64_t a5@<X8>)
{
  uint64_t v6 = __chkstk_darwin(a1);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v8 = __chkstk_darwin(v7);
  __chkstk_darwin(v8);
  type metadata accessor for APUISystemApertureLayoutState();
  sub_1000112A4((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
  uint64_t v9 = EnvironmentObject.init()();
  uint64_t v11 = v10;
  a1();
  uint64_t v12 = AnyView.init<A>(_:)();
  a2();
  uint64_t v13 = AnyView.init<A>(_:)();
  a3();
  uint64_t v14 = AnyView.init<A>(_:)();
  a4();
  uint64_t result = AnyView.init<A>(_:)();
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v11;
  *(void *)(a5 + 16) = v12;
  *(void *)(a5 + 24) = v13;
  *(void *)(a5 + 32) = v14;
  *(void *)(a5 + 40) = result;
  *(_WORD *)(a5 + 48) = 0;
  *(void *)(a5 + 56) = 4;
  *(void *)(a5 + 64) = 0;
  *(void *)(a5 + 72) = 0;
  *(void *)(a5 + 80) = 0;
  *(void *)(a5 + 88) = &_swiftEmptySetSingleton;
  return result;
}

double APUISystemApertureElement.init<A, B>(expanded:compactLeading:)@<D0>(void (*a1)(void)@<X0>, void (*a2)(void)@<X2>, _OWORD *a3@<X8>)
{
  APUISystemApertureElement.init<A, B, C>(expanded:compactLeading:compactTrailing:)(a1, a2, (void (*)(void))nullsub_1, (uint64_t)v8);
  long long v4 = v8[3];
  a3[2] = v8[2];
  a3[3] = v4;
  long long v5 = v8[5];
  a3[4] = v8[4];
  a3[5] = v5;
  double result = *(double *)v8;
  long long v7 = v8[1];
  *a3 = v8[0];
  a3[1] = v7;
  return result;
}

double APUISystemApertureElement.init<A>(expanded:)@<D0>(void (*a1)(void)@<X0>, _OWORD *a2@<X8>)
{
  APUISystemApertureElement.init<A, B, C>(expanded:compactLeading:compactTrailing:)(a1, (void (*)(void))nullsub_1, (void (*)(void))nullsub_1, (uint64_t)v7);
  long long v3 = v7[3];
  a2[2] = v7[2];
  a2[3] = v3;
  long long v4 = v7[5];
  a2[4] = v7[4];
  a2[5] = v4;
  double result = *(double *)v7;
  long long v6 = v7[1];
  *a2 = v7[0];
  a2[1] = v6;
  return result;
}

uint64_t APUISystemApertureElement.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[2];
  if (*v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    char v4 = static Edge.Set.all.getter();
    uint64_t v5 = static Color.black.getter();
    uint64_t result = static Edge.Set.all.getter();
    *(void *)a1 = v2;
    *(unsigned char *)(a1 + 8) = v4;
    *(_OWORD *)(a1 + 16) = v7;
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v9;
    *(unsigned char *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = v5;
    *(unsigned char *)(a1 + 64) = result;
  }
  else
  {
    type metadata accessor for APUISystemApertureLayoutState();
    sub_1000112A4((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
    swift_retain();
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

__n128 APUISystemApertureElement.undimsScreenIfNecessary(_:)@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1 + 88);
  long long v11 = *(_OWORD *)(v2 + 56);
  __n128 v12 = *(__n128 *)(v2 + 72);
  char v5 = *(unsigned char *)(v2 + 48);
  uint64_t v6 = *(void *)v2;
  uint64_t v7 = *(void *)(v2 + 8);
  long long v9 = *(_OWORD *)(v2 + 32);
  long long v10 = *(_OWORD *)(v2 + 16);
  sub_10000857C(v2);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 49) = 1;
  *(_OWORD *)(a1 + 56) = v11;
  __n128 result = v12;
  *(__n128 *)(a1 + 72) = v12;
  *(void *)(a1 + 88) = v4;
  return result;
}

__n128 APUISystemApertureElement.preferredLayoutMode(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *(void *)(v2 + 80);
  uint64_t v5 = *(void *)(v2 + 88);
  char v7 = *(unsigned char *)(v2 + 49);
  char v8 = *(unsigned char *)(v2 + 48);
  uint64_t v9 = *(void *)v2;
  uint64_t v10 = *(void *)(v2 + 8);
  long long v13 = *(_OWORD *)(v2 + 16);
  __n128 v14 = *(__n128 *)(v2 + 64);
  long long v12 = *(_OWORD *)(v2 + 32);
  sub_10000857C(v2);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(_OWORD *)(a2 + 16) = v13;
  *(_OWORD *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 48) = v8;
  *(unsigned char *)(a2 + 49) = v7;
  *(void *)(a2 + 56) = a1;
  __n128 result = v14;
  *(__n128 *)(a2 + 64) = v14;
  *(void *)(a2 + 80) = v6;
  *(void *)(a2 + 88) = v5;
  return result;
}

__n128 APUISystemApertureElement.elementIdentifier(_:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)v2;
  uint64_t v6 = *(void *)(v2 + 8);
  char v7 = *(unsigned char *)(v2 + 48);
  char v8 = *(unsigned char *)(v2 + 49);
  uint64_t v9 = *(void *)(v2 + 56);
  uint64_t v10 = *(void *)(v2 + 88);
  long long v14 = *(_OWORD *)(v2 + 16);
  __n128 v15 = *(__n128 *)(v2 + 72);
  long long v13 = *(_OWORD *)(v2 + 32);
  sub_1000102A0(v2 + 64, (uint64_t)&v16, &qword_100057398);
  sub_10000857C(v2);
  id v11 = a1;
  sub_100010304(&v16);
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v13;
  *(unsigned char *)(a2 + 48) = v7;
  *(unsigned char *)(a2 + 49) = v8;
  *(void *)(a2 + 56) = v9;
  *(void *)(a2 + 64) = a1;
  __n128 result = v15;
  *(__n128 *)(a2 + 72) = v15;
  *(void *)(a2 + 88) = v10;
  return result;
}

uint64_t sub_10000CFC8()
{
  return APUISystemApertureElementHostingController.activeLayoutMode.getter();
}

uint64_t APUISystemApertureElementHostingController.activeLayoutMode.getter()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000D034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.activeLayoutMode.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.activeLayoutMode.setter(uint64_t a1)
{
  long long v3 = (void *)(v1 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode);
  swift_beginAccess();
  *long long v3 = a1;
  return sub_10000D0B4();
}

uint64_t sub_10000D0B4()
{
  uint64_t v1 = (uint64_t *)(v0 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode);
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *v1;
  if ((unint64_t)(*v1 - 3) <= 1)
  {
    uint64_t v4 = (void *)(v0 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode);
    uint64_t result = swift_beginAccess();
    void *v4 = v3;
  }
  return result;
}

uint64_t (*APUISystemApertureElementHostingController.activeLayoutMode.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_10000D194;
}

uint64_t sub_10000D194(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_10000D0B4();
  }
  return result;
}

uint64_t sub_10000D1C8()
{
  return APUISystemApertureElementHostingController.contentRole.getter();
}

uint64_t APUISystemApertureElementHostingController.contentRole.getter()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.contentRole;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000D234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.contentRole.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.contentRole.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + direct field offset for APUISystemApertureElementHostingController.contentRole);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*APUISystemApertureElementHostingController.contentRole.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_10000D308()
{
  return APUISystemApertureElementHostingController.preferredLayoutMode.getter();
}

uint64_t APUISystemApertureElementHostingController.preferredLayoutMode.getter()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000D374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.preferredLayoutMode.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.preferredLayoutMode.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*APUISystemApertureElementHostingController.preferredLayoutMode.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000D444()
{
  return APUISystemApertureElementHostingController.maximumLayoutMode.getter();
}

uint64_t APUISystemApertureElementHostingController.maximumLayoutMode.getter()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000D4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.maximumLayoutMode.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.maximumLayoutMode.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*APUISystemApertureElementHostingController.maximumLayoutMode.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000D580()
{
  sub_100010660();
  if (v0)
  {
    swift_bridgeObjectRetain();
    NSString v1 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v1 = 0;
  }

  return v1;
}

uint64_t APUISystemApertureElementHostingController.associatedAppBundleIdentifier.getter()
{
  uint64_t v0 = sub_100010660();
  swift_bridgeObjectRetain();
  return v0;
}

void sub_10000D624(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = a1;
  APUISystemApertureElementHostingController.associatedAppBundleIdentifier.setter(v4, v6);
}

uint64_t APUISystemApertureElementHostingController.associatedAppBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*APUISystemApertureElementHostingController.associatedAppBundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000D760()
{
  uint64_t v0 = (void *)sub_1000106A8();

  return v0;
}

void *APUISystemApertureElementHostingController.elementIdentifier.getter()
{
  uint64_t v0 = (void *)sub_1000106A8();
  id v1 = v0;
  return v0;
}

void sub_10000D7C0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  APUISystemApertureElementHostingController.elementIdentifier.setter(a3);
}

void APUISystemApertureElementHostingController.elementIdentifier.setter(void *a1)
{
}

uint64_t (*APUISystemApertureElementHostingController.elementIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000D884()
{
  return APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.getter() & 1;
}

uint64_t APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.getter()
{
  id v1 = (unsigned __int8 *)(v0
                         + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_10000D8F4(uint64_t a1, uint64_t a2, char a3)
{
  return APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1
               + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.modify())()
{
  return j_j__swift_endAccess;
}

Class sub_10000D9C4()
{
  sub_1000106F0();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_1000112A4(&qword_100056F10, type metadata accessor for STBackgroundActivityIdentifier);
  swift_bridgeObjectRetain();
  v0.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v0.super.isa;
}

uint64_t APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.getter()
{
  sub_1000106F0();

  return swift_bridgeObjectRetain();
}

void sub_10000DA94(void *a1)
{
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_1000112A4(&qword_100056F10, type metadata accessor for STBackgroundActivityIdentifier);
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v3 = a1;
  APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.setter(v2);
}

uint64_t APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress);
  swift_beginAccess();
  *id v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000DBF8()
{
  NSSet v0 = (void *)sub_100010738();

  return v0;
}

void *APUISystemApertureElementHostingController.leadingView.getter()
{
  NSSet v0 = (void *)sub_100010738();
  id v1 = v0;
  return v0;
}

void sub_10000DC58(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  APUISystemApertureElementHostingController.leadingView.setter(a3);
}

void APUISystemApertureElementHostingController.leadingView.setter(void *a1)
{
}

uint64_t (*APUISystemApertureElementHostingController.leadingView.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000DD1C()
{
  NSSet v0 = (void *)sub_100010780();

  return v0;
}

void *APUISystemApertureElementHostingController.trailingView.getter()
{
  NSSet v0 = (void *)sub_100010780();
  id v1 = v0;
  return v0;
}

void sub_10000DD7C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  APUISystemApertureElementHostingController.trailingView.setter(a3);
}

void APUISystemApertureElementHostingController.trailingView.setter(void *a1)
{
}

uint64_t (*APUISystemApertureElementHostingController.trailingView.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000DE40()
{
  NSSet v0 = (void *)sub_1000107C8();

  return v0;
}

void *APUISystemApertureElementHostingController.minimalView.getter()
{
  NSSet v0 = (void *)sub_1000107C8();
  id v1 = v0;
  return v0;
}

void sub_10000DEA0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  APUISystemApertureElementHostingController.minimalView.setter(a3);
}

void APUISystemApertureElementHostingController.minimalView.setter(void *a1)
{
}

void sub_10000DF08(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  id v5 = *v4;
  void *v4 = a1;
}

uint64_t (*APUISystemApertureElementHostingController.minimalView.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000DFB4()
{
  id v0 = (id)sub_100010810();

  return v0;
}

id APUISystemApertureElementHostingController.systemApertureElementViewController.getter()
{
  id v0 = (void *)sub_100010810();

  return v0;
}

uint64_t sub_10000E01C()
{
  return APUISystemApertureElementHostingController.presentationBehaviors.getter();
}

uint64_t APUISystemApertureElementHostingController.presentationBehaviors.getter()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors;
  swift_beginAccess();
  return *(void *)v1;
}

void sub_10000E088(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  APUISystemApertureElementHostingController.presentationBehaviors.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.presentationBehaviors.setter(uint64_t a1)
{
  id v3 = (uint64_t *)(v1 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  return sub_10000E138(v4);
}

uint64_t sub_10000E138(uint64_t a1)
{
  id v3 = &v1[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
  uint64_t result = swift_beginAccess();
  if (*(void *)v3 != a1)
  {
    objc_msgSend(objc_msgSend(v1, "systemApertureElementContext"), "setElementNeedsUpdate");
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*APUISystemApertureElementHostingController.presentationBehaviors.modify(void *a1))(uint64_t a1)
{
  id v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = (void *)(v1 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors);
  swift_beginAccess();
  v3[9] = *v4;
  return sub_10000E244;
}

void sub_10000E244(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 72);
  id v3 = (uint64_t *)(*(void *)(*(void *)a1 + 80)
                 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  sub_10000E138(v4);

  free(v1);
}

char *APUISystemApertureElementHostingController.init(elementProvider:)(uint64_t a1)
{
  uint64_t v3 = swift_isaMask & *v1;
  *(void *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode) = 0;
  *(void *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.contentRole) = 2;
  *(void *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode) = 4;
  *(void *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode) = 4;
  uint64_t v4 = (void *)((char *)v1
                + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier);
  void *v4 = 0;
  v4[1] = 0;
  *(void *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.elementIdentifier) = 0;
  *((unsigned char *)v1
  + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding) = 1;
  *(void *)((char *)v1
            + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress) = &_swiftEmptySetSingleton;
  uint64_t v5 = qword_100057400;
  id v6 = objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator());
  id v7 = v1;
  *(void *)((char *)v1 + v5) = [v6 init];
  *(void *)((char *)v7 + qword_100057408) = 0;
  uint64_t v8 = qword_100057410;
  type metadata accessor for APUISystemApertureLayoutState();
  uint64_t v9 = swift_allocObject();
  __asm { FMOV            V0.2D, #20.0 }
  long long v118 = _Q0;
  long long v119 = _Q0;
  Published.init(initialValue:)();
  long long v117 = 0uLL;
  LOBYTE(v118) = 0;
  Published.init(initialValue:)();
  *(void *)((char *)v7 + v8) = v9;
  *(void *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.leadingView) = 0;
  *(void *)((char *)v7 + qword_100057418) = 0;
  *(void *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.trailingView) = 0;
  *(void *)((char *)v7 + qword_100057420) = 0;
  *(void *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.minimalView) = 0;
  *(void *)((char *)v7 + qword_100057428) = 0;
  *(void *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors) = 1;

  uint64_t v15 = *(void *)(v3 + 80);
  v114.receiver = v7;
  v114.super_class = (Class)type metadata accessor for APUISystemApertureElementHostingController();
  id v16 = [super initWithNibName:0 bundle:0];
  uint64_t v91 = a1;
  uint64_t v90 = v15;
  dispatch thunk of View.body.getter();
  uint64_t v17 = v117;
  long long v18 = v118;
  long long v19 = v119;
  LODWORD(v6) = v120;
  LODWORD(a1) = BYTE1(v120);
  *(_OWORD *)objc_super v100 = v121;
  *(void *)&v100[16] = v122;
  uint64_t v98 = *((void *)&v120 + 1);
  uint64_t v99 = *((void *)&v122 + 1);
  uint64_t v95 = *(void *)&v16[qword_100057410];
  uint64_t v96 = *((void *)&v117 + 1);
  sub_1000112A4((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
  swift_retain();
  uint64_t v97 = static ObservableObject.environmentStore.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_getKeyPath();
  NSString v22 = *(void **)&v16[qword_100057400];
  *(void *)&long long v117 = v17;
  *((void *)&v117 + 1) = v96;
  long long v118 = v18;
  long long v119 = v19;
  int v92 = (int)v6;
  int v93 = a1;
  LOBYTE(v120) = (_BYTE)v6;
  BYTE1(v120) = a1;
  *(_DWORD *)((char *)&v120 + 2) = v115;
  WORD3(v120) = v116;
  *((void *)&v120 + 1) = v98;
  long long v121 = *(_OWORD *)v100;
  *(void *)&long long v122 = *(void *)&v100[16];
  *((void *)&v122 + 1) = v99;
  *(void *)&long long v123 = v97;
  *((void *)&v123 + 1) = v95;
  *(void *)&long long v124 = KeyPath;
  BYTE8(v124) = 1;
  *(void *)&long long v125 = v21;
  *((void *)&v125 + 1) = v22;
  long long v111 = v123;
  long long v112 = v124;
  long long v113 = v125;
  long long v109 = *(_OWORD *)v100;
  long long v110 = v122;
  long long v107 = v19;
  long long v108 = v120;
  long long v105 = v117;
  long long v106 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v94 = *(id *)v100;
  sub_100008608((uint64_t)&v117);
  sub_10000847C(&qword_100056F70);
  sub_1000086DC();
  AnyView.init<A>(_:)();
  id v24 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryViewController();
  id v25 = objc_allocWithZone(v24);
  id v26 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryView();
  objc_allocWithZone(v26);
  id v27 = (char *)v25;
  swift_retain();
  *(void *)&v27[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v104.receiver = v27;
  v104.super_class = v24;
  id v28 = [super initWithNibName:0 bundle:0];
  swift_release();
  id v29 = *(void **)&v16[qword_100057408];
  *(void *)&v16[qword_100057408] = v28;
  id v30 = v28;

  [v16 addChildViewController:v30];
  uint64_t result = (char *)[v16 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v32 = result;
  uint64_t result = (char *)[v30 view];
  if (!result)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v33 = result;
  [v32 addSubview:result];

  [v30 didMoveToParentViewController:v16];
  id v34 = objc_allocWithZone(v24);
  id v35 = objc_allocWithZone(v26);
  swift_retain_n();
  uint64_t v36 = (char *)v34;
  *(void *)&v36[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v103.receiver = v36;
  v103.super_class = v24;
  id v37 = [super initWithNibName:0 bundle:0];
  swift_release();
  unint64_t v38 = *(void **)&v16[qword_100057418];
  *(void *)&v16[qword_100057418] = v37;
  id v39 = (char *)v37;

  os_log_type_t v40 = *(void **)&v39[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v41 = (void **)&v16[direct field offset for APUISystemApertureElementHostingController.leadingView];
  swift_beginAccess();
  uint64_t v42 = *v41;
  void *v41 = v40;
  id v43 = v40;

  [v16 addChildViewController:v39];
  uint64_t result = (char *)[v16 view];
  if (!result)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v44 = result;
  os_log_t v89 = v30;
  uint64_t result = (char *)[v39 view];
  if (!result)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  objc_super v45 = result;
  [v44 addSubview:result];

  [v39 didMoveToParentViewController:v16];
  id v46 = objc_allocWithZone(v24);
  id v47 = objc_allocWithZone(v26);
  swift_retain_n();
  char v48 = (char *)v46;
  *(void *)&v48[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v102.receiver = v48;
  v102.super_class = v24;
  [super initWithNibName:0 bundle:0];
  swift_release();
  v50 = *(void **)&v16[qword_100057420];
  *(void *)&v16[qword_100057420] = v49;
  char v51 = (char *)v49;

  uint64_t v52 = *(void **)&v51[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  id v53 = (void **)&v16[direct field offset for APUISystemApertureElementHostingController.trailingView];
  swift_beginAccess();
  unsigned int v54 = *v53;
  char *v53 = v52;
  id v55 = v52;

  [v16 addChildViewController:v51];
  uint64_t result = (char *)[v16 view];
  if (!result)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  os_log_type_t v56 = result;
  uint64_t result = (char *)[v51 view];
  if (!result)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  BOOL v57 = result;
  [v56 addSubview:result];

  [v51 didMoveToParentViewController:v16];
  id v58 = objc_allocWithZone(v24);
  id v59 = objc_allocWithZone(v26);
  swift_retain_n();
  uint64_t v60 = (char *)v58;
  *(void *)&v60[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000FAD4();

  v101.receiver = v60;
  v101.super_class = v24;
  id v61 = [super initWithNibName:0 bundle:0];
  swift_release();
  id v62 = *(void **)&v16[qword_100057428];
  *(void *)&v16[qword_100057428] = v61;
  v63 = (char *)v61;

  id v64 = *(void **)&v63[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v65 = (void **)&v16[direct field offset for APUISystemApertureElementHostingController.minimalView];
  swift_beginAccess();
  id v66 = *v65;
  void *v65 = v64;
  id v67 = v64;

  [v16 addChildViewController:v63];
  uint64_t result = (char *)[v16 view];
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v68 = result;
  uint64_t result = (char *)[v63 view];
  if (!result)
  {
LABEL_45:
    __break(1u);
    return result;
  }
  v69 = result;
  [v68 addSubview:result];

  [v63 didMoveToParentViewController:v16];
  if (v92)
  {
    uint64_t v70 = &v16[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess();
    if ((*(void *)v70 & 8) == 0) {
      *(void *)v70 |= 8uLL;
    }
  }
  if (v93)
  {
    unint64_t v71 = &v16[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess();
    if ((*(void *)v71 & 0x40) == 0) {
      *(void *)v71 |= 0x40uLL;
    }
  }
  char v72 = &v16[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode];
  swift_beginAccess();
  if (v98 != *(void *)v72) {
    *(void *)char v72 = v98;
  }
  uint64_t v73 = (void **)&v16[direct field offset for APUISystemApertureElementHostingController.elementIdentifier];
  swift_beginAccess();
  v74 = *v73;
  if (!*(void *)v100)
  {
    if (!v74) {
      goto LABEL_27;
    }
LABEL_26:
    *uint64_t v73 = *(void **)v100;
    id v80 = v94;

    goto LABEL_27;
  }
  if (!v74) {
    goto LABEL_26;
  }
  uint64_t v75 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v77 = v76;
  if (v75 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v77 == v78)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_27;
  }
  char v79 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v79 & 1) == 0)
  {
    v74 = *v73;
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v81 = &v16[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  swift_beginAccess();
  uint64_t v82 = *((void *)v81 + 1);
  if (*(void *)&v100[16])
  {
    uint64_t v83 = v91;
    id v84 = &qword_100057000;
    uint64_t v85 = v90;
    if (!v82 || *(_OWORD *)&v100[8] != *(_OWORD *)v81 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v83 = v91;
    id v84 = &qword_100057000;
    uint64_t v85 = v90;
    if (v82)
    {
LABEL_33:
      *(void *)uint64_t v81 = *(void *)&v100[8];
      *((void *)v81 + 1) = *(void *)&v100[16];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
  }
  id v86 = (uint64_t *)&v16[v84[123]];
  swift_beginAccess();
  uint64_t v87 = *v86;
  swift_bridgeObjectRetain();
  char v88 = sub_100010330(v99, v87);

  swift_bridgeObjectRelease();
  sub_100008958((uint64_t)&v117);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v85 - 8) + 8))(v83, v85);
  if (v88)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t *v86 = v99;
    swift_bridgeObjectRelease();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v16;
}

uint64_t sub_10000EF00(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000EF2C(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000EF58()
{
  unint64_t result = qword_100057390;
  if (!qword_100057390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057390);
  }
  return result;
}

uint64_t sub_10000EFAC@<X0>(unsigned char *a1@<X8>)
{
  sub_10000EF58();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10000EFFC()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_10000F048@<X0>(void *a1@<X8>)
{
  sub_1000112EC();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10000F098()
{
  return EnvironmentValues.subscript.setter();
}

id APUISystemApertureElementHostingController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_10000F140(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC5coderACyxGSgSo7NSCoderC_tcfc_0();
}

id APUISystemApertureElementHostingController.layoutSystemApertureAccessoryViews()()
{
  uint64_t v1 = &v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode];
  swift_beginAccess();
  if (*(void *)v1 != 4)
  {
    long long v18 = &v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode];
    swift_beginAccess();
    if (*(void *)v18 == 3)
    {
      long long v19 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.leadingView];
      swift_beginAccess();
      if (*v19)
      {
        id v20 = *v19;
        id result = [v0 view];
        if (!result)
        {
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        uint64_t v21 = result;
        id v22 = [result SBUISA_systemApertureLeadingConcentricContentLayoutGuide];

        [v22 layoutFrame];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;

        v50.origin.x = v24;
        v50.origin.y = v26;
        v50.size.width = v28;
        v50.size.height = v30;
        double MidX = CGRectGetMidX(v50);
        [v20 center];
        [v20 setCenter:MidX];
      }
      uint64_t v32 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.trailingView];
      swift_beginAccess();
      if (*v32)
      {
        id v15 = *v32;
        id result = [v0 view];
        if (result)
        {
          v33 = result;
          id v34 = [result SBUISA_systemApertureTrailingConcentricContentLayoutGuide];

          [v34 layoutFrame];
          CGFloat v36 = v35;
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          CGFloat v42 = v41;

          v51.origin.x = v36;
          v51.origin.y = v38;
          v51.size.width = v40;
          v51.size.height = v42;
          double v16 = CGRectGetMidX(v51);
          [v15 center];
          goto LABEL_15;
        }
LABEL_27:
        __break(1u);
        return result;
      }
    }
    goto LABEL_16;
  }
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_24;
  }
  id v3 = result;
  [result bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  long long v12 = *(void **)&v0[qword_100057408];
  if (!v12) {
    goto LABEL_16;
  }
  id result = [v12 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  long long v13 = result;
  [result frame];
  [v13 setFrame:];

  long long v14 = *(void **)&v0[qword_100057408];
  if (v14)
  {
    id result = [v14 view];
    if (result)
    {
      id v15 = result;
      v48.origin.x = v5;
      v48.origin.y = v7;
      v48.size.width = v9;
      v48.size.height = v11;
      double v16 = CGRectGetMidX(v48);
      v49.origin.x = v5;
      v49.origin.y = v7;
      v49.size.width = v9;
      v49.size.height = v11;
      double MidY = CGRectGetMidY(v49);
LABEL_15:
      [v15 setCenter:v16 MidY];

      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_16:
  id v43 = &v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode];
  swift_beginAccess();
  uint64_t v44 = *(void *)v43;
  objc_super v45 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.leadingView];
  swift_beginAccess();
  if (*v45) {
    [*v45 setHidden:v44 == 4];
  }
  id v46 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.trailingView];
  swift_beginAccess();
  if (*v46) {
    [*v46 setHidden:v44 == 4];
  }
  id v47 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.minimalView];
  swift_beginAccess();
  id result = *v47;
  if (*v47) {
    return [result setHidden:v44 == 4];
  }
  return result;
}

void APUISystemApertureElementHostingController.viewWillLayoutSubviews(with:)(void *a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  v6[4] = sub_100010B74;
  v6[5] = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10000F710;
  v6[3] = &unk_10004DFA8;
  double v4 = _Block_copy(v6);
  id v5 = v1;
  swift_release();
  [a1 animateAlongsideTransition:v4 completion:0];
  _Block_release(v4);
}

id sub_10000F648(uint64_t a1, char *a2)
{
  type metadata accessor for APUISystemApertureElementHostingController();
  swift_retain();
  sub_10002AE44(a2);
  swift_release();
  id v3 = *(id *)&a2[qword_100057400];
  sub_1000324B0(a2, (uint64_t)v3);

  return APUISystemApertureElementHostingController.layoutSystemApertureAccessoryViews()();
}

uint64_t sub_10000F710(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_10000F770(void *a1, uint64_t a2, void *a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  APUISystemApertureElementHostingController.viewWillLayoutSubviews(with:)(a3);
  swift_unknownObjectRelease();
}

uint64_t sub_10000F7D8()
{
  return 1;
}

void sub_10000F7E4(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC29preferredContentSizeDidChange08forChildJ9ContainerySo09UIContentP0_p_tF_0();
  swift_unknownObjectRelease();
}

id APUISystemApertureElementHostingController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void APUISystemApertureElementHostingController.init(nibName:bundle:)()
{
}

void sub_10000F8FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;

  sub_100010CE0();
}

id APUISystemApertureElementHostingController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUISystemApertureElementHostingController();
  return [super dealloc];
}

void sub_10000F9E4(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  objc_super v2 = *(void **)(a1 + qword_100057428);
}

char *sub_10000FAD4()
{
  type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin();
  id v1 = objc_allocWithZone((Class)sub_10000847C((uint64_t *)&unk_100057670));
  objc_super v2 = v0;
  swift_retain();
  id v3 = (void *)UIHostingController.init(rootView:)();
  sub_10000847C(&qword_100056FE8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10003C710;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  uint64_t v16 = v4;
  sub_1000112A4((unint64_t *)&qword_100056FF0, (void (*)(uint64_t))&type metadata accessor for UIHostingControllerSizingOptions);
  sub_10000847C(&qword_100056FF8);
  sub_100008AC8((unint64_t *)&qword_100057000, &qword_100056FF8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  dispatch thunk of UIHostingController.sizingOptions.setter();
  *(void *)&v2[OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController] = v3;
  id v5 = v3;
  [v5 preferredContentSize];
  double v7 = v6;
  double v9 = v8;

  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for APUISystemApertureAccessoryView();
  double v10 = (char *)objc_msgSendSuper2(&v15, "initWithFrame:", 0.0, 0.0, v7, v9);
  CGFloat v11 = *(void **)&v10[OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController];
  long long v12 = v10;
  id result = (char *)[v11 view];
  if (result)
  {
    long long v14 = result;
    [v12 addSubview:result];

    swift_release();
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000FF30()
{
  return sub_100010134(type metadata accessor for APUISystemApertureAccessoryView);
}

id sub_10001011C()
{
  return sub_100010134(type metadata accessor for APUISystemApertureAccessoryViewController);
}

id sub_100010134(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

double sub_10001017C@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_100010208()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000102A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000847C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id *sub_100010304(id *a1)
{
  return a1;
}

uint64_t sub_100010330(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v32 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v33 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v35 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v34 = v3;
      unint64_t v8 = v7 | (v3 << 6);
      goto LABEL_27;
    }
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_46;
    }
    if (v9 >= v33) {
      return 1;
    }
    unint64_t v10 = *(void *)(v32 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v33) {
        return 1;
      }
      unint64_t v10 = *(void *)(v32 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v33) {
          return 1;
        }
        unint64_t v10 = *(void *)(v32 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v3 + 4;
          if (v3 + 4 >= v33) {
            return 1;
          }
          unint64_t v10 = *(void *)(v32 + 8 * v11);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v6 = (v10 - 1) & v10;
    int64_t v34 = v11;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_27:
    uint64_t v13 = result;
    long long v14 = *(void **)(*(void *)(result + 48) + 8 * v8);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    id v15 = v14;
    String.hash(into:)();
    Swift::Int v16 = Hasher._finalize()();
    swift_bridgeObjectRelease();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = v16 & ~v17;
    if (((*(void *)(v35 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      goto LABEL_42;
    }
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = v20;
    if (v19 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v21 == v22)
    {
LABEL_7:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
        uint64_t v25 = ~v17;
        while (1)
        {
          unint64_t v18 = (v18 + 1) & v25;
          if (((*(void *)(v35 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
            break;
          }
          uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v28 = v27;
          if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29) {
            goto LABEL_7;
          }
          char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v31) {
            goto LABEL_8;
          }
        }
LABEL_42:

        return 0;
      }
    }
LABEL_8:

    double result = v13;
    int64_t v3 = v34;
  }
  uint64_t v12 = v3 + 5;
  if (v3 + 5 >= v33) {
    return 1;
  }
  unint64_t v10 = *(void *)(v32 + 8 * v12);
  if (v10)
  {
    int64_t v11 = v3 + 5;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v11 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v11 >= v33) {
      return 1;
    }
    unint64_t v10 = *(void *)(v32 + 8 * v11);
    ++v12;
    if (v10) {
      goto LABEL_26;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_100010660()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1000106A8()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.elementIdentifier;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1000106F0()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_100010738()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.leadingView;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_100010780()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.trailingView;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1000107C8()
{
  uint64_t v1 = v0 + direct field offset for APUISystemApertureElementHostingController.minimalView;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_100010810()
{
  return v0;
}

uint64_t type metadata accessor for APUISystemApertureElementHostingController()
{
  return sub_100011340();
}

uint64_t sub_100010830@<X0>(unsigned char *a1@<X8>)
{
  sub_10000EF58();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_100010880()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000108CC@<X0>(void *a1@<X8>)
{
  sub_1000112EC();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for APUISystemApertureAccessoryViewController()
{
  return self;
}

uint64_t type metadata accessor for APUISystemApertureAccessoryView()
{
  return self;
}

void _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC5coderACyxGSgSo7NSCoderC_tcfc_0()
{
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode] = 0;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.contentRole] = 2;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode] = 4;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode] = 4;
  uint64_t v1 = &v0[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  void *v1 = 0;
  v1[1] = 0;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.elementIdentifier] = 0;
  v0[direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding] = 1;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress] = &_swiftEmptySetSingleton;
  uint64_t v2 = qword_100057400;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator()) init];
  *(void *)&v0[qword_100057408] = 0;
  uint64_t v3 = qword_100057410;
  type metadata accessor for APUISystemApertureLayoutState();
  uint64_t v4 = swift_allocObject();
  __asm { FMOV            V0.2D, #20.0 }
  Published.init(initialValue:)();
  Published.init(initialValue:)();
  *(void *)&v0[v3] = v4;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.leadingView] = 0;
  *(void *)&v0[qword_100057418] = 0;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.trailingView] = 0;
  *(void *)&v0[qword_100057420] = 0;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.minimalView] = 0;
  *(void *)&v0[qword_100057428] = 0;
  *(void *)&v0[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors] = 1;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100010B3C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100010B74(uint64_t a1)
{
  return sub_10000F648(a1, *(char **)(v1 + 16));
}

uint64_t sub_100010B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010B8C()
{
  return swift_release();
}

id _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC29preferredContentSizeDidChange08forChildJ9ContainerySo09UIContentP0_p_tF_0()
{
  [v0 preferredContentSize];
  double v2 = v1;
  double v4 = v3;
  uint64_t v5 = *(void *)&v0[qword_100057408];
  if (v5)
  {
    [*(id *)(*(void *)(v5 + OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view)+ OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController) preferredContentSize];
  }
  else
  {
    double v7 = 0.0;
    double v6 = 0.0;
  }
  [v0 setPreferredContentSize:v6, v7];
  id result = [v0 preferredContentSize];
  if (v2 != v10 || v4 != v9)
  {
    id v12 = [v0 systemApertureElementContext];
    v14[4] = nullsub_1;
    v14[5] = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 1107296256;
    v14[2] = sub_100014A00;
    v14[3] = &unk_10004E178;
    uint64_t v13 = _Block_copy(v14);
    [v12 setElementNeedsUpdateWithCoordinatedAnimations:v13];
    _Block_release(v13);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_100010CE0()
{
}

uint64_t sub_100010D10()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for APUIHostedBySystemAperture()
{
  return &type metadata for APUIHostedBySystemAperture;
}

uint64_t destroy for APUISystemApertureElement(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for APUISystemApertureElement(uint64_t a1, uint64_t a2)
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
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  double v6 = *(void **)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v8 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for APUISystemApertureElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for APUISystemApertureElement(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for APUISystemApertureElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  long long v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureElement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureElement()
{
  return &type metadata for APUISystemApertureElement;
}

uint64_t sub_1000110E8()
{
  return swift_initClassMetadata2();
}

unint64_t sub_100011190()
{
  unint64_t result = qword_100057638;
  if (!qword_100057638)
  {
    sub_10000877C(&qword_100057640);
    sub_100011230();
    sub_100008AC8(&qword_100057658, (uint64_t *)&unk_100057660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057638);
  }
  return result;
}

unint64_t sub_100011230()
{
  unint64_t result = qword_100057648;
  if (!qword_100057648)
  {
    sub_10000877C(&qword_100057650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057648);
  }
  return result;
}

uint64_t sub_1000112A4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000112EC()
{
  unint64_t result = qword_1000585D0;
  if (!qword_1000585D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000585D0);
  }
  return result;
}

uint64_t sub_100011340()
{
  return swift_getGenericMetadata();
}

id sub_100011414()
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
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  long long v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t sub_100011508()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100057710);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_100057710);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1000115D0()
{
  return 0;
}

uint64_t sub_1000115DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10001160C()
{
  return 0;
}

void sub_100011618(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100011624(uint64_t a1)
{
  unint64_t v2 = sub_1000171C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011660(uint64_t a1)
{
  unint64_t v2 = sub_1000171C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001169C(uint64_t a1)
{
  return sub_100017134(a1);
}

uint64_t sub_1000116C4(void *a1)
{
  uint64_t v2 = sub_10000847C(&qword_100057AE8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017184(a1, a1[3]);
  sub_1000171C8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int sub_1000117D4()
{
  return Hasher._finalize()();
}

Swift::Int sub_10001180C()
{
  return Hasher._finalize()();
}

uint64_t sub_100011840(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000847C(&qword_100057B20);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017184(a1, a1[3]);
  sub_100017FBC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[1] = a2;
  sub_10000847C(&qword_100057B08);
  sub_100018010(&qword_100057B28, &qword_100057B30);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int sub_1000119C8()
{
  return Hasher._finalize()();
}

void sub_100011A0C()
{
}

Swift::Int sub_100011A34()
{
  return Hasher._finalize()();
}

uint64_t sub_100011A78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100017D48(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100011AA4(uint64_t a1)
{
  unint64_t v2 = sub_100017FBC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011AE0(uint64_t a1)
{
  unint64_t v2 = sub_100017FBC();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100011B1C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100017E0C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100011B48(void *a1)
{
  return sub_100011840(a1, *v1);
}

void *sub_100011B64()
{
  uint64_t result = (void *)sub_100004060((uint64_t)&_swiftEmptyArrayStorage);
  off_100057728 = result;
  return result;
}

uint64_t sub_100011B8C()
{
  return sub_100011BB4();
}

uint64_t sub_100011BA0()
{
  return sub_100011BB4();
}

uint64_t sub_100011BB4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011C20()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011C94()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011D08()
{
  return sub_100011D30();
}

uint64_t sub_100011D1C()
{
  return sub_100011D30();
}

uint64_t sub_100011D30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011D9C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_100011E14()
{
  _StringGuts.grow(_:)(67);
  v1._countAndFlagsBits = 0xD000000000000026;
  v1._object = (void *)0x8000000100042520;
  String.append(_:)(v1);
  type metadata accessor for Date();
  sub_100018710(&qword_100057BA8, (void (*)(uint64_t))&type metadata accessor for Date);
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x3D6469202CLL;
  v3._object = (void *)0xE500000000000000;
  String.append(_:)(v3);
  type metadata accessor for UUID();
  sub_100018710(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._object = (void *)0x8000000100042550;
  v5._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v5);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession)) {
    uint64_t v6 = 1702195828;
  }
  else {
    uint64_t v6 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession)) {
    unint64_t v7 = 0xE400000000000000;
  }
  else {
    unint64_t v7 = 0xE500000000000000;
  }
  unint64_t v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 93;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  return 0;
}

uint64_t sub_100011FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9, unsigned __int8 a10, char *a11)
{
  id v59 = a7;
  uint64_t v12 = v11;
  id v65 = a8;
  id v55 = a5;
  uint64_t v56 = a6;
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  uint64_t v62 = a1;
  v63 = a11;
  LODWORD(v58) = a10;
  uint64_t v14 = type metadata accessor for APKDeviceLockState();
  uint64_t v64 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  id v61 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  BOOL v57 = (char *)&v52 - v17;
  uint64_t v18 = sub_10000847C(&qword_100057B38);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  UUID.init()();
  uint64_t v22 = v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__image;
  uint64_t v68 = 0;
  sub_10000847C(&qword_1000577C0);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v22, v21, v18);
  *(void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity) = 0;
  double v23 = (void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  uint64_t v24 = v53;
  *double v23 = a2;
  v23[1] = v24;
  swift_beginAccess();
  uint64_t v66 = v54;
  id v67 = v55;
  Published.init(initialValue:)();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v66 = v56;
  id v67 = v59;
  Published.init(initialValue:)();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  id v59 = a9;
  v25(v22, v18);
  uint64_t v66 = (uint64_t)a9;
  Published.init(initialValue:)();
  swift_endAccess();
  LOBYTE(a2) = sub_1000128B4();
  swift_beginAccess();
  LOBYTE(v66) = a2 & 1;
  Published.init(initialValue:)();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v66) = 0;
  Published.init(initialValue:)();
  swift_endAccess();
  LOBYTE(v22) = v58;
  *(unsigned char *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) = v58;
  uint64_t v26 = v64;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
  uint64_t v28 = v57;
  v27(v57, (uint64_t)v63, v14);
  swift_beginAccess();
  v27(v61, (uint64_t)v28, v14);
  Published.init(initialValue:)();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v26 + 8);
  id v61 = (char *)v14;
  uint64_t v64 = v26 + 8;
  v29(v28, v14);
  swift_endAccess();
  *(unsigned char *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_systemApertureIsEnabled) = SBUIIsSystemApertureEnabled();
  if (v22)
  {
    *(void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers) = &_swiftEmptyArrayStorage;
    id v30 = [self progressWithTotalUnitCount:0];
    swift_beginAccess();
    uint64_t v66 = (uint64_t)v30;
    sub_10000C2E8(0, &qword_1000577B0);
    Published.init(initialValue:)();
    swift_endAccess();
    uint64_t v31 = v62;
    sub_100014C2C(v62, (uint64_t)v65);
  }
  else
  {
    sub_10000847C(&qword_100057B40);
    uint64_t v32 = type metadata accessor for UUID();
    uint64_t v33 = *(void *)(v32 - 8);
    unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_10003C710;
    unint64_t v36 = v35 + v34;
    uint64_t v31 = v62;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v33 + 16))(v36, v62, v32);
    *(void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers) = v35;
    swift_beginAccess();
    id v37 = v65;
    uint64_t v66 = (uint64_t)v65;
    sub_10000C2E8(0, &qword_1000577B0);
    id v38 = v37;
    Published.init(initialValue:)();
    swift_endAccess();
  }
  if (qword_100056D10 != -1) {
    swift_once();
  }
  uint64_t v39 = type metadata accessor for Logger();
  sub_1000084C0(v39, (uint64_t)qword_100057710);
  swift_retain_n();
  CGFloat v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    CGFloat v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v66 = v58;
    *(_DWORD *)CGFloat v42 = 136315138;
    BOOL v57 = (char *)(v42 + 4);
    swift_beginAccess();
    type metadata accessor for UUID();
    swift_bridgeObjectRetain();
    uint64_t v43 = Array.description.getter();
    unint64_t v45 = v44;
    swift_bridgeObjectRelease();
    uint64_t v69 = sub_10002D634(v43, v45, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Background activity session created for task identifiers %s", v42, 0xCu);
    swift_arrayDestroy();
    uint64_t v31 = v62;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v46 = v60;
  uint64_t v47 = sub_100013128();
  if (v46)
  {
    swift_release();

    v29(v63, (uint64_t)v61);
    uint64_t v48 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v48 - 8) + 8))(v31, v48);
  }
  else
  {
    uint64_t v49 = v47;

    v29(v63, (uint64_t)v61);
    uint64_t v50 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v50 - 8) + 8))(v31, v50);
    *(void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity) = v49;
    swift_release();
  }
  return v12;
}

id sub_1000128B4()
{
  id v1 = [v0 userInfo];
  type metadata accessor for ProgressUserInfoKey(0);
  sub_100018710(&qword_100057060, type metadata accessor for ProgressUserInfoKey);
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v2 + 16))
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  Swift::String v3 = @"HideProgressCircleInUI";
  unint64_t v4 = sub_10002DE78(@"HideProgressCircleInUI");
  if ((v5 & 1) == 0)
  {
    long long v9 = 0u;
    long long v10 = 0u;

    goto LABEL_8;
  }
  sub_1000180A4(*(void *)(v2 + 56) + 32 * v4, (uint64_t)&v9);

  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1))
  {
LABEL_9:
    sub_100018120((uint64_t)&v9, &qword_100057E50);
    return 0;
  }
  sub_10000C2E8(0, &qword_100057B48);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v6 = [v8 BOOLValue];

  return v6;
}

uint64_t sub_100012A40()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ActivityUIDismissalPolicy();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000847C(&qword_100057B58);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity))
  {
    uint64_t v9 = sub_10000847C(&qword_100057B60);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
    swift_retain();
    static ActivityUIDismissalPolicy.immediate.getter();
    dispatch thunk of Activity.endSync(_:dismissalPolicy:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_100018120((uint64_t)v8, &qword_100057B58);
  }
  uint64_t v10 = v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_startTime;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id;
  uint64_t v13 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__title;
  uint64_t v15 = sub_10000847C(&qword_100057BB0);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
  v16(v14, v15);
  v16(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__subtitle, v15);
  uint64_t v17 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__progress;
  uint64_t v18 = sub_10000847C(&qword_100057BB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  uint64_t v19 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__image;
  uint64_t v20 = sub_10000847C(&qword_100057B38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  uint64_t v21 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__shouldHideProgressUI;
  uint64_t v22 = sub_10000847C(&qword_100057BC0);
  double v23 = *(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8);
  v23(v21, v22);
  v23(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__canceling, v22);
  uint64_t v24 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__lockState;
  uint64_t v25 = sub_10000847C(&qword_100057BC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  swift_release();
  return v1;
}

uint64_t sub_100012E3C()
{
  sub_100012A40();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100012E94()
{
  return type metadata accessor for BackgroundActivitySession();
}

uint64_t type metadata accessor for BackgroundActivitySession()
{
  uint64_t result = qword_100057790;
  if (!qword_100057790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100012EE8()
{
  type metadata accessor for Date();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID();
    if (v1 <= 0x3F)
    {
      sub_100016D44(319, &qword_1000577A0);
      if (v2 <= 0x3F)
      {
        sub_100016C80();
        if (v3 <= 0x3F)
        {
          sub_100016CE8();
          if (v4 <= 0x3F)
          {
            sub_100016D44(319, &qword_1000577C8);
            if (v5 <= 0x3F)
            {
              sub_100016D8C();
              if (v6 <= 0x3F) {
                swift_updateClassMetadata2();
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_100013128()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_10000847C(&qword_100057B90);
  __chkstk_darwin(v4 - 8);
  BOOL v57 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000847C(&qword_100057B60);
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  __chkstk_darwin(v6);
  id v59 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ActivityPresentationOptions();
  uint64_t v9 = *(void (***)(char *, uint64_t))(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100056D10 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = sub_1000084C0(v12, (uint64_t)qword_100057710);
  swift_retain_n();
  uint64_t v58 = v13;
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v62 = v11;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v56 = v8;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v54 = swift_slowAlloc();
    v64[0] = v54;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v53 = v18 + 4;
    uint64_t v55 = v1;
    swift_beginAccess();
    type metadata accessor for UUID();
    swift_bridgeObjectRetain();
    uint64_t v19 = v3;
    uint64_t v20 = v9;
    uint64_t v21 = Array.description.getter();
    unint64_t v23 = v22;
    uint64_t v2 = v55;
    swift_bridgeObjectRelease();
    uint64_t v24 = v21;
    uint64_t v9 = v20;
    uint64_t v3 = v19;
    uint64_t v65 = sub_10002D634(v24, v23, v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Creating ActivityKit activity for task identifiers: %s", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v11 = v62;
    swift_slowDealloc();
    uint64_t v8 = v56;
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_systemApertureIsEnabled) == 1)
  {
    int v25 = *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
    sub_10000847C(&qword_100057B98);
    uint64_t v26 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
    uint64_t v27 = *(void *)(v26 - 8);
    unint64_t v28 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10003C710;
    unint64_t v30 = v29 + v28;
    if (v25 == 1) {
      uint64_t v31 = (unsigned int *)&enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:);
    }
    else {
      uint64_t v31 = (unsigned int *)&enum case for ActivityPresentationOptions.ActivityPresentationDestination.lockscreen(_:);
    }
    (*(void (**)(unint64_t, void, uint64_t))(v27 + 104))(v30, *v31, v26);
    uint64_t v11 = v62;
  }
  else
  {
    sub_10000847C(&qword_100057B98);
    uint64_t v32 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
    uint64_t v33 = *(void *)(v32 - 8);
    unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_10003C710;
    (*(void (**)(unint64_t, void, uint64_t))(v33 + 104))(v35 + v34, enum case for ActivityPresentationOptions.ActivityPresentationDestination.lockscreen(_:), v32);
  }
  ActivityPresentationOptions.init(destinations:)();
  unint64_t v36 = (uint64_t *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess();
  uint64_t v37 = *v36;
  sub_10000847C(&qword_100057BA0);
  uint64_t v65 = v37;
  uint64_t v38 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v57, 1, 1, v38);
  sub_100016EA8();
  sub_100016F00();
  sub_100016F58();
  swift_bridgeObjectRetain();
  uint64_t v39 = v59;
  ActivityContent.init(state:staleDate:relevanceScore:)();
  uint64_t v40 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v60 + 8))(v39, v61);
    v9[1](v11, v8);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136315138;
      swift_getErrorValue();
      uint64_t v44 = Error.localizedDescription.getter();
      uint64_t v63 = sub_10002D634(v44, v45, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Error requesting activity %s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_willThrow();
  }
  else
  {
    BOOL v57 = (char *)v9;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v39, v61);
    swift_bridgeObjectRelease();
    swift_retain_n();
    uint64_t v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v56 = v8;
      uint64_t v65 = v49;
      *(_DWORD *)uint64_t v48 = 136315138;
      uint64_t v50 = Activity.id.getter();
      uint64_t v63 = sub_10002D634(v50, v51, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Requested activity successfully: %s", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*((void (**)(char *, uint64_t))v57 + 1))(v62, v56);
    }
    else
    {
      swift_release_n();

      (*((void (**)(char *, uint64_t))v57 + 1))(v62, v8);
    }
  }
  return v40;
}

void sub_100013A60(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v90 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v88 = *(void *)(v7 - 8);
  uint64_t v89 = v7;
  __chkstk_darwin(v7);
  uint64_t v87 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for DispatchTimeInterval();
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  id v80 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = type metadata accessor for DispatchTime();
  uint64_t v86 = *(void *)(v92 - 8);
  uint64_t v10 = __chkstk_darwin(v92);
  char v79 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v85 = (char *)&v70 - v12;
  uint64_t v13 = sub_10000847C((uint64_t *)&unk_100057F90);
  __chkstk_darwin(v13 - 8);
  int v93 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for UUID();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  id v84 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v70 - v19;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  id v21 = aBlock[0];
  sub_10000C2E8(0, &qword_1000577B0);
  char v22 = static NSObject.== infix(_:_:)();

  if (v22) {
    return;
  }
  if (qword_100056D10 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v24 = sub_1000084C0(v23, (uint64_t)qword_100057710);
  swift_retain_n();
  int v25 = a1;
  v74 = (void *)v24;
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.info.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v78 = v6;
  uint64_t v75 = v4;
  uint64_t v91 = v15;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    unint64_t v30 = (void *)swift_slowAlloc();
    uint64_t v73 = (void *)swift_slowAlloc();
    aBlock[0] = v73;
    *(_DWORD *)uint64_t v29 = 136315394;
    uint64_t v76 = v16;
    uint64_t v77 = v20;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v31 = Array.description.getter();
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v96 = sub_10002D634(v31, v33, (uint64_t *)aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2112;
    uint64_t v96 = (uint64_t)v25;
    unint64_t v34 = v25;
    uint64_t v20 = v77;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v30 = v25;

    uint64_t v16 = v76;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Updating progress for task identifiers %s to: %@", (uint8_t *)v29, 0x16u);
    sub_10000847C(&qword_100057E60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  id v35 = aBlock[0];
  [aBlock[0] setTotalUnitCount:[v25 totalUnitCount]];

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  id v36 = aBlock[0];
  [aBlock[0] setCompletedUnitCount:[v25 completedUnitCount]];

  LOBYTE(v36) = sub_1000128B4();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(aBlock[0]) = v36 & 1;
  swift_retain();
  static Published.subscript.setter();
  type metadata accessor for BackgroundActivitySession();
  sub_100018710((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
  ObservableObject<>.objectWillChange.getter();
  ObservableObjectPublisher.send()();
  swift_release();
  if (qword_100056D28 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v37 = v91;
  if (*((void *)aBlock[0] + 2))
  {
    uint64_t v39 = *(void *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
    uint64_t v38 = *(void *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
    swift_bridgeObjectRetain();
    sub_10002DDDC(v39, v38);
    if (v40)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v41 = sub_100016548();
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v77 = v25;
      LOBYTE(aBlock[0]) = v41 & 1;
      swift_retain();
      static Published.subscript.setter();
      int v25 = v77;
      ObservableObject<>.objectWillChange.getter();
      ObservableObjectPublisher.send()();
      swift_release();
      swift_release();
      goto LABEL_14;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_14:
  unsigned __int8 v42 = [v25 isFinished];
  uint64_t v43 = v78;
  if (((v42 & 1) != 0 || [v25 isCancelled])
    && (*(unsigned char *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) & 1) == 0)
  {
    uint64_t v44 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess();
    uint64_t v45 = *v44;
    if (*(void *)(*v44 + 16))
    {
      uint64_t v77 = v20;
      uint64_t v46 = v16;
      uint64_t v47 = *(unsigned __int8 *)(v16 + 80);
      uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      uint64_t v49 = (uint64_t)v93;
      v48(v93, v45 + ((v47 + 32) & ~v47), v37);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v49, 0, 1, v37);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v49, 1, v37) != 1)
      {
        uint64_t v73 = v48;
        uint64_t v71 = ~v47;
        uint64_t v76 = v46;
        uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
        int v93 = (char *)(v46 + 32);
        char v72 = v50;
        v50(v77, (char *)v49, v37);
        swift_retain_n();
        unint64_t v51 = Logger.logObject.getter();
        os_log_type_t v52 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = (uint8_t *)swift_slowAlloc();
          v74 = (void *)swift_slowAlloc();
          aBlock[0] = v74;
          *(_DWORD *)uint64_t v53 = 136315138;
          uint64_t v70 = v53 + 4;
          swift_bridgeObjectRetain();
          uint64_t v54 = Array.description.getter();
          unint64_t v56 = v55;
          swift_bridgeObjectRelease();
          id v94 = (void *)sub_10002D634(v54, v56, (uint64_t *)aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          uint64_t v43 = v78;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Progress completed for task identifiers %s", v53, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_release_n();
        }
        uint64_t v57 = v82;
        uint64_t v58 = v81;
        id v59 = v80;
        uint64_t v60 = v79;
        sub_10000C2E8(0, &qword_100057F00);
        uint64_t v82 = static OS_dispatch_queue.main.getter();
        static DispatchTime.now()();
        void *v59 = 500;
        (*(void (**)(void *, void, uint64_t))(v58 + 104))(v59, enum case for DispatchTimeInterval.milliseconds(_:), v57);
        uint64_t v61 = v85;
        + infix(_:_:)();
        (*(void (**)(void *, uint64_t))(v58 + 8))(v59, v57);
        uint64_t v86 = *(void *)(v86 + 8);
        ((void (*)(char *, uint64_t))v86)(v60, v92);
        uint64_t v62 = v84;
        uint64_t v63 = v91;
        ((void (*)(char *, char *, uint64_t))v73)(v84, v77, v91);
        uint64_t v64 = (v47 + 16) & v71;
        uint64_t v65 = (char *)swift_allocObject();
        v72(&v65[v64], v62, v63);
        aBlock[4] = sub_10001863C;
        aBlock[5] = v65;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_100014A00;
        aBlock[3] = &unk_10004E1F0;
        uint64_t v66 = _Block_copy(aBlock);
        id v67 = v87;
        static DispatchQoS.unspecified.getter();
        id v94 = &_swiftEmptyArrayStorage;
        sub_100018710(&qword_100057B78, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10000847C(&qword_100057B80);
        sub_1000186B4();
        uint64_t v68 = v75;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        uint64_t v69 = (void *)v82;
        OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
        _Block_release(v66);

        (*(void (**)(char *, uint64_t))(v90 + 8))(v43, v68);
        (*(void (**)(char *, uint64_t))(v88 + 8))(v67, v89);
        ((void (*)(char *, uint64_t))v86)(v61, v92);
        (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v63);
        swift_release();
        return;
      }
    }
    else
    {
      uint64_t v49 = (uint64_t)v93;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v93, 1, 1, v37);
    }
    sub_100018120(v49, (uint64_t *)&unk_100057F90);
  }
}

uint64_t sub_1000149A0(uint64_t a1)
{
  if (qword_100056D28 != -1) {
    swift_once();
  }
  return sub_100019C78(a1);
}

uint64_t sub_100014A00(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100014A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v12 == a1 && v13 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
LABEL_12:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_retain();
      static Published.subscript.setter();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      swift_bridgeObjectRetain();
      return static Published.subscript.setter();
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v12 == a3 && v13 == a4) {
    return swift_bridgeObjectRelease();
  }
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    goto LABEL_12;
  }
  return result;
}

char *sub_100014C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v39 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  char v11 = (char *)&v36 - v10;
  uint64_t v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess();
  uint64_t v13 = *v12;
  uint64_t v41 = a1;
  swift_bridgeObjectRetain();
  BOOL v14 = sub_100017654((uint64_t (*)(char *))sub_10001817C, (uint64_t)v40, v13);
  uint64_t result = (char *)swift_bridgeObjectRelease();
  if (!v14)
  {
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v38(v11, a1, v6);
    swift_beginAccess();
    unint64_t v16 = *v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v12 = v16;
    uint64_t v37 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v16 = sub_1000173EC(0, *(void *)(v16 + 16) + 1, 1, v16);
      *uint64_t v12 = v16;
    }
    unint64_t v19 = *(void *)(v16 + 16);
    unint64_t v18 = *(void *)(v16 + 24);
    if (v19 >= v18 >> 1)
    {
      unint64_t v16 = sub_1000173EC(v18 > 1, v19 + 1, 1, v16);
      *uint64_t v12 = v16;
    }
    *(void *)(v16 + 16) = v19 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v19, v11, v6);
    swift_endAccess();
    if (qword_100056D10 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_1000084C0(v20, (uint64_t)qword_100057710);
    id v21 = v39;
    v38(v39, a1, v6);
    char v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      id v43 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v38 = (void (*)(char *, uint64_t, uint64_t))(v24 + 4);
      sub_100018710(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v42 = sub_10002D634(v25, v26, (uint64_t *)&v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v21, v6);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Updating Jindo with new task identifier: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v21, v6);
    }

    os_log_type_t v27 = (void *)sub_100015B98();
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    swift_getKeyPath();
    swift_getKeyPath();
    id v43 = v27;
    uint64_t v44 = v29;
    swift_retain();
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    id v43 = v31;
    uint64_t v44 = v33;
    swift_retain();
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    id v34 = v43;
    uint64_t result = (char *)[v43 totalUnitCount];
    if (__OFADD__(result, 1))
    {
      __break(1u);
    }
    else
    {
      [v34 setTotalUnitCount:result + 1];

      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      id v35 = v43;
      [v43 addChild:v37 withPendingUnitCount:1];

      LOBYTE(v35) = sub_100016548();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v43) = v35 & 1;
      swift_retain();
      static Published.subscript.setter();
      type metadata accessor for BackgroundActivitySession();
      sub_100018710((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
      ObservableObject<>.objectWillChange.getter();
      ObservableObjectPublisher.send()();
      return (char *)swift_release();
    }
  }
  return result;
}

void sub_100015258(uint64_t a1, int a2)
{
  int v32 = a2;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v34 = a1;
  swift_bridgeObjectRetain();
  BOOL v10 = sub_100017654((uint64_t (*)(char *))sub_10001817C, (uint64_t)v33, v9);
  uint64_t v11 = swift_bridgeObjectRelease();
  if (!v10) {
    return;
  }
  __chkstk_darwin(v11);
  v30[-2] = a1;
  swift_beginAccess();
  uint64_t v12 = sub_100017934((uint64_t (*)(unint64_t))sub_100018198, (uint64_t)&v30[-4]);
  int64_t v13 = *(void *)(*v8 + 16);
  if (v13 < v12)
  {
    __break(1u);
  }
  else
  {
    sub_100018320(v12, v13);
    swift_endAccess();
    if (qword_100056D10 == -1) {
      goto LABEL_4;
    }
  }
  swift_once();
LABEL_4:
  uint64_t v14 = type metadata accessor for Logger();
  sub_1000084C0(v14, (uint64_t)qword_100057710);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    id v36 = v31;
    *(_DWORD *)uint64_t v17 = 136315138;
    v30[1] = v17 + 4;
    sub_100018710(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v35 = sub_10002D634(v18, v19, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Updating Jindo with removed task identifier: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  if (*(void *)(*v8 + 16))
  {
    uint64_t v20 = (void *)sub_100015B98();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    swift_getKeyPath();
    swift_getKeyPath();
    id v36 = v20;
    uint64_t v37 = v22;
    swift_retain();
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    id v36 = v24;
    uint64_t v37 = v26;
    swift_retain();
    static Published.subscript.setter();
    if (v32)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      id v27 = v36;
      uint64_t v28 = (char *)[v36 totalUnitCount];
      if (__OFSUB__(v28, 1))
      {
        __break(1u);
        return;
      }
      [v27 setTotalUnitCount:v28 - 1];
    }
    char v29 = sub_100016548();
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v36) = v29 & 1;
    swift_retain();
    static Published.subscript.setter();
    type metadata accessor for BackgroundActivitySession();
    sub_100018710((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
    ObservableObject<>.objectWillChange.getter();
    ObservableObjectPublisher.send()();
    swift_release();
  }
}

uint64_t sub_1000157B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ActivityUIDismissalPolicy();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000847C(&qword_100057B58);
  uint64_t result = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity;
  if (*(void *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity))
  {
    uint64_t v11 = qword_100056D10;
    swift_retain();
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_1000084C0(v12, (uint64_t)qword_100057710);
    swift_retain_n();
    swift_retain_n();
    int64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v27 = v3;
      uint64_t v17 = v16;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v31 = v26;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v28 = v2;
      int v25 = v15;
      uint64_t v18 = Activity.id.getter();
      uint64_t v30 = sub_10002D634(v18, v19, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v24 = v17 + 14;
      swift_beginAccess();
      type metadata accessor for UUID();
      swift_bridgeObjectRetain();
      uint64_t v20 = Array.description.getter();
      unint64_t v22 = v21;
      uint64_t v2 = v28;
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_10002D634(v20, v22, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v25, "Ending activity %s for task identifiers: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v3 = v27;
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
      swift_release_n();
    }
    uint64_t v23 = sub_10000847C(&qword_100057B60);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v9, 1, 1, v23);
    static ActivityUIDismissalPolicy.immediate.getter();
    dispatch thunk of Activity.endSync(_:dismissalPolicy:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_100018120((uint64_t)v9, &qword_100057B58);
    *(void *)(v1 + v10) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_100015B98()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_10000847C((uint64_t *)&unk_100057F90);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) == 1)
  {
    uint64_t v11 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers;
    swift_beginAccess();
    if (*(void *)(*(void *)v11 + 16) != 1) {
      goto LABEL_12;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *(void *)v11 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_100018120((uint64_t)v6, (uint64_t *)&unk_100057F90);
      goto LABEL_12;
    }
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    if (qword_100056D28 != -1) {
      swift_once();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (!*(void *)(v36 + 16) || (sub_10002DF0C((uint64_t)v10), (v13 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
LABEL_12:
      if (qword_100056D18 != -1) {
        swift_once();
      }
      os_log_type_t v14 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_beginAccess();
      uint64_t v17 = off_100057728;
      if (*((void *)off_100057728 + 2))
      {
        swift_bridgeObjectRetain();
        unint64_t v18 = sub_10002DDDC(v15, v16);
        if (v19)
        {
          uint64_t v12 = *(void *)(v17[7] + 16 * v18);
          swift_endAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
LABEL_19:
          String.LocalizationValue.init(stringLiteral:)();
          static Locale.current.getter();
          String.init(localized:table:bundle:locale:comment:)();
          sub_10000847C(&qword_100057B50);
          uint64_t v30 = swift_allocObject();
          *(_OWORD *)(v30 + 16) = xmmword_10003C710;
          uint64_t v31 = *(void *)(*(void *)v11 + 16);
          *(void *)(v30 + 56) = &type metadata for Int;
          *(void *)(v30 + 64) = &protocol witness table for Int;
          *(void *)(v30 + 32) = v31;
          static String.localizedStringWithFormat(_:_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v12;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v34 = v11;
      swift_endAccess();
      uint64_t v20 = *v14;
      uint64_t v21 = v14[1];
      id v22 = objc_allocWithZone((Class)LSApplicationRecord);
      swift_bridgeObjectRetain();
      id v23 = sub_100017310(v20, v21, 1);
      id v24 = [v23 localizedName];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v26 = v25;

      uint64_t v27 = *v14;
      uint64_t v28 = v14[1];
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v35 = off_100057728;
      off_100057728 = (_UNKNOWN *)0x8000000000000000;
      sub_100023470(v12, v26, v27, v28, isUniquelyReferenced_nonNull_native);
      off_100057728 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();

      uint64_t v11 = v34;
      goto LABEL_19;
    }
    swift_retain();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v12 = v36;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v12 = v37;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
  }
  return v12;
}

uint64_t sub_100016548()
{
  uint64_t v1 = sub_10000847C((uint64_t *)&unk_100057F90);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v27 - v5;
  unint64_t v7 = type metadata accessor for UUID();
  unint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v35 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - v11;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) == 1)
  {
    char v13 = (uint64_t *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess();
    if (*(void *)(*v13 + 16) == 1)
    {
      (*(void (**)(char *, unint64_t, unint64_t))(v8 + 16))(v6, *v13 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
      (*(void (**)(char *, void, uint64_t, unint64_t))(v8 + 56))(v6, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v8 + 48))(v6, 1, v7) != 1)
      {
        (*(void (**)(char *, char *, unint64_t))(v8 + 32))(v12, v6, v7);
        if (qword_100056D28 == -1) {
          goto LABEL_7;
        }
        goto LABEL_42;
      }
      sub_100018120((uint64_t)v6, (uint64_t *)&unk_100057F90);
    }
    while (1)
    {
      uint64_t v16 = *v13;
      unint64_t v37 = (unint64_t)&_swiftEmptyArrayStorage;
      uint64_t v17 = *(void *)(v16 + 16);
      uint64_t v29 = v16;
      if (v17)
      {
        unint64_t v18 = *(void (**)(char *, uint64_t *, unint64_t))(v8 + 16);
        v8 += 16;
        char v13 = (uint64_t *)(v16
                        + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64)));
        uint64_t v19 = *(void *)(v8 + 56);
        uint64_t v20 = (void (**)(char *, uint64_t, uint64_t, unint64_t))(v8 + 40);
        uint64_t v33 = (unsigned int (**)(char *, uint64_t, unint64_t))(v8 + 32);
        uint64_t v34 = v18;
        uint64_t v31 = (void (**)(char *, char *, unint64_t))(v8 + 16);
        uint64_t v32 = v19;
        uint64_t v30 = (void (**)(char *, unint64_t))(v8 - 8);
        swift_bridgeObjectRetain_n();
        unint64_t v28 = (v8 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        uint64_t v12 = v35;
        while (1)
        {
          v34(v4, v13, v7);
          uint64_t v21 = *v20;
          (*v20)(v4, 0, 1, v7);
          if ((*v33)(v4, 1, v7) == 1) {
            break;
          }
          (*v31)(v12, v4, v7);
          if (qword_100056D28 != -1) {
            swift_once();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          if (*(void *)(v36 + 16))
          {
            uint64_t v12 = v35;
            sub_10002DF0C((uint64_t)v35);
            if (v22)
            {
              swift_retain();
              swift_bridgeObjectRelease();
              (*v30)(v12, v7);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
              uint64_t v12 = v35;
            }
            else
            {
              swift_bridgeObjectRelease();
              (*v30)(v12, v7);
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v12 = v35;
            (*v30)(v35, v7);
          }
          char v13 = (uint64_t *)((char *)v13 + v32);
          if (!--v17)
          {
            unint64_t v8 = v28;
            v21(v4, 1, 1, v7);
            break;
          }
        }
      }
      else
      {
        id v23 = *(void (**)(char *, uint64_t, uint64_t, unint64_t))(v8 + 56);
        unint64_t v8 = (v8 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        swift_bridgeObjectRetain_n();
        v23(v4, 1, 1, v7);
      }
      swift_bridgeObjectRelease();
      unint64_t v7 = v37;
      swift_bridgeObjectRelease();
      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
        if (!v24)
        {
LABEL_39:
          swift_bridgeObjectRelease_n();
          return 1;
        }
      }
      else
      {
        uint64_t v24 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v24) {
          goto LABEL_39;
        }
      }
      if (v24 >= 1) {
        break;
      }
      __break(1u);
LABEL_42:
      swift_once();
LABEL_7:
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      if (*(void *)(v37 + 16))
      {
        sub_10002DF0C((uint64_t)v12);
        if (v15)
        {
          swift_retain();
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v14 = v37;
          (*(void (**)(char *, unint64_t))(v8 + 8))(v12, v7);
          return v14;
        }
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, unint64_t))(v8 + 8))(v12, v7);
    }
    uint64_t v25 = 0;
    LOBYTE(v14) = 1;
    while (1)
    {
      if ((v7 & 0xC000000000000001) != 0)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        if (v14) {
          goto LABEL_36;
        }
      }
      else
      {
        swift_retain();
        if (v14)
        {
LABEL_36:
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v14 = v37;
          goto LABEL_31;
        }
      }
      swift_release();
      uint64_t v14 = 0;
LABEL_31:
      if (v24 == ++v25)
      {
        swift_bridgeObjectRelease_n();
        return v14;
      }
    }
  }
  return 0;
}

void sub_100016C80()
{
  if (!qword_1000577A8)
  {
    sub_10000C2E8(255, &qword_1000577B0);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000577A8);
    }
  }
}

void sub_100016CE8()
{
  if (!qword_1000577B8)
  {
    sub_10000877C(&qword_1000577C0);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000577B8);
    }
  }
}

void sub_100016D44(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Published();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_100016D8C()
{
  if (!qword_1000577D0)
  {
    type metadata accessor for APKDeviceLockState();
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000577D0);
    }
  }
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes()
{
  return &type metadata for BackgroundActivityAttributes;
}

unint64_t sub_100016DF8()
{
  unint64_t result = qword_100057AB0;
  if (!qword_100057AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AB0);
  }
  return result;
}

unint64_t sub_100016E50()
{
  unint64_t result = qword_100057AB8;
  if (!qword_100057AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AB8);
  }
  return result;
}

unint64_t sub_100016EA8()
{
  unint64_t result = qword_100057AC0;
  if (!qword_100057AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AC0);
  }
  return result;
}

unint64_t sub_100016F00()
{
  unint64_t result = qword_100057AC8;
  if (!qword_100057AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AC8);
  }
  return result;
}

unint64_t sub_100016F58()
{
  unint64_t result = qword_100057AD0;
  if (!qword_100057AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AD0);
  }
  return result;
}

unint64_t sub_100016FB0()
{
  unint64_t result = qword_100057AD8;
  if (!qword_100057AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AD8);
  }
  return result;
}

uint64_t sub_100017004()
{
  return sub_100018710(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_10001704C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BackgroundActivitySession();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001708C()
{
  return sub_100011E14();
}

uint64_t sub_1000170B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

void *sub_100017128()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100017134(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100017184(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000171C8()
{
  unint64_t result = qword_100057AF0;
  if (!qword_100057AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057AF0);
  }
  return result;
}

uint64_t sub_10001721C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001729C()
{
  return static Published.subscript.setter();
}

id sub_100017310(uint64_t a1, uint64_t a2, char a3)
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

uint64_t sub_1000173EC(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    char v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000847C(&qword_100057B40);
  uint64_t v10 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000181C8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

BOOL sub_100017654(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v39 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000847C((uint64_t *)&unk_100057F90);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  if (v12)
  {
    size_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    unint64_t v37 = v14;
    uint64_t v15 = a3 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v34 = v8;
    uint64_t v35 = (uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v31 = v16;
    uint64_t v32 = (void (**)(char *))(v13 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v13 - 8);
    v29[2] = a3;
    swift_bridgeObjectRetain();
    uint64_t v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 40);
    v29[1] = (v13 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      uint64_t v17 = v39;
      uint64_t v18 = v13;
      v37(v11, v15, v39);
      uint64_t v19 = *v36;
      (*v36)(v11, 0, 1, v17);
      int v20 = (*v35)(v11, 1, v17);
      BOOL v21 = v20 != 1;
      if (v20 == 1) {
        break;
      }
      uint64_t v30 = v19;
      char v22 = v11;
      id v23 = v34;
      uint64_t v24 = v22;
      (*v32)(v34);
      char v25 = v38(v23);
      if (v4)
      {
        (*v33)(v23, v17);
        swift_bridgeObjectRelease();
        return v21;
      }
      char v26 = v25;
      (*v33)(v23, v17);
      if (v26) {
        break;
      }
      v15 += v31;
      --v12;
      uint64_t v4 = 0;
      uint64_t v13 = v18;
      uint64_t v11 = v24;
      if (!v12)
      {
        v30(v24, 1, 1, v39);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v27(v11, 1, 1, v39);
LABEL_9:
    BOOL v21 = 0;
  }
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_100017934(uint64_t (*a1)(unint64_t), uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v42 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v41 = (char *)&v33 - v11;
  __chkstk_darwin(v10);
  size_t v14 = (char *)&v33 - v13;
  uint64_t v44 = v4;
  unint64_t v15 = *v4;
  uint64_t v16 = *(void *)(*v4 + 16);
  if (!v16) {
    return 0;
  }
  unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v35 = v12;
  uint64_t v45 = *(void *)(v12 + 72);
  swift_bridgeObjectRetain();
  unint64_t v18 = 0;
  unint64_t v36 = v17;
  while (1)
  {
    char v19 = a1(v15 + v17);
    if (v3)
    {
      swift_bridgeObjectRelease();
      return v18;
    }
    if (v19) {
      break;
    }
    ++v18;
    v17 += v45;
    if (v16 == v18)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v15 + 16);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v18, 1))
  {
    unint64_t v21 = *(void *)(v15 + 16);
    if (v18 + 1 == v21) {
      return v18;
    }
    uint64_t v22 = v45 + v17;
    unint64_t v23 = v18 + 1;
    uint64_t v24 = (void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    uint64_t v39 = a1;
    char v40 = (uint64_t (**)(char *, uint64_t))(v35 + 8);
    uint64_t v33 = (uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 40);
    unint64_t v37 = v14;
    uint64_t v38 = a2;
    id v43 = (void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    while (v23 < v21)
    {
      uint64_t v25 = v15 + v22;
      char v26 = (uint64_t (*)(char *))a1;
      uint64_t v27 = *v24;
      (*v24)(v14, v25, v7);
      LOBYTE(v26) = v26(v14);
      uint64_t result = (*v40)(v14, v7);
      if (v26)
      {
        a1 = v39;
        uint64_t v24 = v43;
      }
      else
      {
        uint64_t v24 = v43;
        if (v23 != v18)
        {
          if ((v18 & 0x8000000000000000) != 0) {
            goto LABEL_32;
          }
          unint64_t v28 = *v44;
          if (v18 >= *(void *)(*v44 + 16)) {
            goto LABEL_33;
          }
          unint64_t v35 = *(void *)(*v44 + 16);
          uint64_t v34 = v18 * v45;
          uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v27)(v41, v28 + v36 + v18 * v45, v7);
          if (v23 >= v35) {
            goto LABEL_34;
          }
          v27(v42, v28 + v22, v7);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          unint64_t *v44 = v28;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_100017D34(v28);
            unint64_t v28 = result;
            unint64_t *v44 = result;
          }
          if (v18 >= *(void *)(v28 + 16)) {
            goto LABEL_35;
          }
          unint64_t v29 = v28 + v36 + v34;
          uint64_t v30 = *v33;
          uint64_t result = (*v33)(v29, v42, v7);
          if (v23 >= *(void *)(*v44 + 16)) {
            goto LABEL_36;
          }
          uint64_t result = v30(*v44 + v22, v41, v7);
          uint64_t v24 = v43;
        }
        BOOL v31 = __OFADD__(v18++, 1);
        a1 = v39;
        if (v31) {
          goto LABEL_31;
        }
      }
      unint64_t v32 = v23 + 1;
      size_t v14 = v37;
      if (__OFADD__(v23, 1)) {
        goto LABEL_30;
      }
      unint64_t v15 = *v44;
      unint64_t v21 = *(void *)(*v44 + 16);
      ++v23;
      v22 += v45;
      if (v32 == v21) {
        return v18;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100017D34(unint64_t a1)
{
  return sub_1000173EC(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100017D48(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6564496B736174 && a2 == 0xEF73726569666974)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100017DE8()
{
  return 0x6E6564496B736174;
}

void *sub_100017E0C(void *a1)
{
  uint64_t v3 = sub_10000847C(&qword_100057AF8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100017184(a1, a1[3]);
  sub_100017FBC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_100017134((uint64_t)a1);
  }
  else
  {
    sub_10000847C(&qword_100057B08);
    sub_100018010(&qword_100057B10, &qword_100057B18);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    sub_100017134((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_100017FBC()
{
  unint64_t result = qword_100057B00;
  if (!qword_100057B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057B00);
  }
  return result;
}

uint64_t sub_100018010(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000877C(&qword_100057B08);
    sub_100018710(a2, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000180A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100018120(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000847C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001817C()
{
  return sub_100018514() & 1;
}

uint64_t sub_100018198()
{
  return static UUID.== infix(_:_:)() & 1;
}

uint64_t sub_1000181C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for UUID() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100018320(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_1000173EC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      unint64_t *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100018514()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t sub_1000185AC()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001863C()
{
  uint64_t v1 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000149A0(v2);
}

uint64_t sub_10001869C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000186AC()
{
  return swift_release();
}

unint64_t sub_1000186B4()
{
  unint64_t result = qword_100057B88;
  if (!qword_100057B88)
  {
    sub_10000877C(&qword_100057B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057B88);
  }
  return result;
}

uint64_t sub_100018710(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t getEnumTagSinglePayload for BackgroundActivityAttributes.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for BackgroundActivityAttributes.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100018860);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes.CodingKeys()
{
  return &type metadata for BackgroundActivityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for BackgroundActivityAttributes.ContentState.CodingKeys;
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes.ContentState()
{
  return &type metadata for BackgroundActivityAttributes.ContentState;
}

unint64_t sub_1000188BC()
{
  unint64_t result = qword_100057BD0;
  if (!qword_100057BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057BD0);
  }
  return result;
}

unint64_t sub_100018914()
{
  unint64_t result = qword_100057BD8;
  if (!qword_100057BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057BD8);
  }
  return result;
}

unint64_t sub_10001896C()
{
  unint64_t result = qword_100057BE0;
  if (!qword_100057BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057BE0);
  }
  return result;
}

unint64_t sub_1000189C4()
{
  unint64_t result = qword_100057BE8;
  if (!qword_100057BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057BE8);
  }
  return result;
}

unint64_t sub_100018A1C()
{
  unint64_t result = qword_100057BF0;
  if (!qword_100057BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057BF0);
  }
  return result;
}

void destroy for BackgroundActivityProgressView(uint64_t a1)
{
  sub_100018AB4();
  int v2 = *(void **)(a1 + 24);
}

uint64_t sub_100018AB4()
{
  return swift_release();
}

uint64_t initializeWithCopy for BackgroundActivityProgressView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_100008AC0();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  uint64_t v7 = (void *)a2[3];
  *(void *)(a1 + 24) = v7;
  id v8 = v7;
  return a1;
}

uint64_t assignWithCopy for BackgroundActivityProgressView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_100008AC0();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_100018AB4();
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  uint64_t v7 = (void *)a2[3];
  id v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for BackgroundActivityProgressView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_100018AB4();
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityProgressView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityProgressView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityProgressView()
{
  return &type metadata for BackgroundActivityProgressView;
}

uint64_t sub_100018CA4(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, id a5)
{
  int v9 = a4 & 1;
  int v34 = a4 & 0x100;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 0x100) != 0)
  {
    uint64_t v15 = type metadata accessor for BackgroundActivitySession();
    sub_100019768();
    uint64_t v32 = v15;
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    id v33 = a5;
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    id v16 = v35;
    unsigned int v17 = [v35 isCancellable];

    a5 = v33;
    uint64_t v14 = 0;
    if (v17)
    {
      sub_1000197C8();
      uint64_t v18 = StateObject.wrappedValue.getter();
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v18 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id, v10);
      swift_release();
      UUID.uuidString.getter();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = a2;
      *(void *)(v19 + 24) = a3;
      *(unsigned char *)(v19 + 32) = v9 != 0;
      *(unsigned char *)(v19 + 33) = 1;
      *(void *)(v19 + 40) = v33;
      sub_100008AC0();
      id v20 = v33;
      a5 = v33;
      uint64_t v14 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  type metadata accessor for BackgroundActivitySession();
  sub_100019768();
  id v21 = a5;
  uint64_t v22 = *(unsigned __int8 *)(StateObject.wrappedValue.getter()
                           + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release();
  objc_allocWithZone((Class)type metadata accessor for BackgroundActivityProgressMicaView());
  id v23 = v14;
  sub_10000B550(v21, 8, v22, v14);
  uint64_t v25 = v24;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  id v26 = v35;
  uint64_t v27 = *(void **)(v25 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress);
  *(void *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress) = v35;
  id v28 = v26;

  sub_10000AFDC();
  unint64_t v29 = (unsigned char *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  BOOL v30 = 1;
  swift_beginAccess();
  unsigned char *v29 = BYTE1(v34);
  sub_10000BC54();
  if (*v29 == 1) {
    BOOL v30 = *(void *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) == 0;
  }
  [*(id *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton) setHidden:v30];

  return v25;
}

void sub_1000190FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, void *a6)
{
  int v34 = a6;
  int v10 = a5 & 1;
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  __chkstk_darwin(v11);
  unint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BackgroundActivitySession();
  sub_100019768();
  uint64_t v35 = a4;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  id v14 = v36;
  uint64_t v15 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress);
  *(void *)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress) = v36;
  id v16 = v14;

  sub_10000AFDC();
  unsigned int v17 = 0;
  if ((a5 & 0x100) != 0)
  {
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    id v18 = v36;
    unsigned int v19 = [v36 isCancellable];

    if (v19)
    {
      BOOL v30 = v10 != 0;
      unint64_t v31 = sub_1000197C8();
      uint64_t v20 = v35;
      uint64_t v21 = StateObject.wrappedValue.getter();
      uint64_t v22 = v32;
      uint64_t v23 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v13, v21 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id, v33);
      swift_release();
      UUID.uuidString.getter();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v23);
      String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = a3;
      *(void *)(v24 + 24) = v20;
      *(unsigned char *)(v24 + 32) = v30;
      *(unsigned char *)(v24 + 33) = 1;
      uint64_t v25 = v34;
      *(void *)(v24 + 40) = v34;
      sub_100008AC0();
      id v26 = v25;
      unsigned int v17 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
    }
    else
    {
      unsigned int v17 = 0;
    }
  }
  uint64_t v27 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
  *(void *)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) = v17;
  id v28 = v17;
  sub_10000B140(v27);
}

uint64_t sub_10001948C()
{
  type metadata accessor for BackgroundActivitySession();
  sub_100019768();
  StateObject.wrappedValue.getter();
  if (qword_100056D28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_10001A274(v0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001956C(uint64_t a1)
{
  if (*(unsigned char *)(v1 + 17)) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  return sub_100018CA4(a1, *(void *)v1, *(void *)(v1 + 8), v2 | *(unsigned __int8 *)(v1 + 16), *(id *)(v1 + 24));
}

void sub_100019598(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 17)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  sub_1000190FC(a1, a2, *(void *)v2, *(void *)(v2 + 8), v3 | *(unsigned __int8 *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1000195D4()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

void *sub_100019618()
{
  return &protocol witness table for Never;
}

uint64_t sub_100019624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100019714();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100019688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100019714();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000196EC()
{
}

unint64_t sub_100019714()
{
  unint64_t result = qword_100057BF8;
  if (!qword_100057BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057BF8);
  }
  return result;
}

unint64_t sub_100019768()
{
  unint64_t result = qword_100057B68;
  if (!qword_100057B68)
  {
    type metadata accessor for BackgroundActivitySession();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057B68);
  }
  return result;
}

unint64_t sub_1000197C8()
{
  unint64_t result = qword_100057C00;
  if (!qword_100057C00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100057C00);
  }
  return result;
}

uint64_t sub_100019814()
{
  sub_100018AB4();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100019858()
{
  return sub_10001948C();
}

uint64_t sub_100019884()
{
  return sub_100019C0C();
}

uint64_t sub_100019898(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100018120(a1, &qword_1000572A8);
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

uint64_t sub_100019A44(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100018120(a1, &qword_1000572A8);
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
  sub_10000847C(&qword_100057ED0);
  return swift_task_create();
}

uint64_t sub_100019BF8()
{
  return sub_100019C0C();
}

uint64_t sub_100019C0C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100019C78(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v8 = v35[0];
  if (!*((void *)v35[0] + 2)) {
    return swift_bridgeObjectRelease();
  }
  unint64_t v9 = sub_10002DF0C(a1);
  if ((v10 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v32 = *(void *)(v8[7] + 8 * v9);
  swift_retain();
  swift_bridgeObjectRelease();
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_1000084C0(v11, (uint64_t)qword_100057C10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v33 = a1;
  if (v14)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    id v16 = (void *)swift_slowAlloc();
    uint64_t v31 = v2;
    v35[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_100028618(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v34 = sub_10002D634(v17, v18, (uint64_t *)v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Ending session for task identifier %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  uint64_t v21 = *(void *)(v32 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  uint64_t v20 = *(void *)(v32 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if ((uint64_t)v35[0])
  {
    int v22 = 1;
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    id v23 = v35[0];
    int v22 = [v35[0] isCancelled];
  }
  sub_1000157B0();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v24 = (void (*)(id *, void))static Published.subscript.modify();
  sub_10002E3A4(v33);
  swift_release();
  v24(v35, 0);
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v25 = v35[0];
  if (*((void *)v35[0] + 2) && (unint64_t v26 = sub_10002DDDC(v21, v20), (v27 & 1) != 0))
  {
    uint64_t v28 = *(void *)(v25[7] + 8 * v26);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100015258(v33, v22);
    uint64_t v29 = v28 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers;
    swift_beginAccess();
    if (*(void *)(*(void *)v29 + 16))
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000157B0();
      swift_getKeyPath();
      swift_getKeyPath();
      BOOL v30 = (void (*)(id *, void))static Published.subscript.modify();
      sub_10002E398(v21, v20);
      swift_release();
      v30(v35, 0);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  sub_100009758();
  return swift_release();
}

uint64_t sub_10001A274(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v82 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v97 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  objc_super v100 = (char *)&v77 - v8;
  __chkstk_darwin(v7);
  int v93 = (char *)&v77 - v9;
  uint64_t v10 = sub_10000847C((uint64_t *)&unk_100057F90);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t KeyPath = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (unint64_t)&v77 - v14;
  if (qword_100056D20 == -1) {
    goto LABEL_2;
  }
LABEL_64:
  swift_once();
LABEL_2:
  uint64_t v16 = type metadata accessor for Logger();
  sub_1000084C0(v16, (uint64_t)qword_100057C10);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v89 = KeyPath;
  uint64_t v90 = v2;
  if (v19)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v101 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v99 = v20 + 4;
    swift_bridgeObjectRetain();
    uint64_t v21 = Array.description.getter();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v24 = v21;
    uint64_t v2 = v90;
    objc_super v103 = (char *)sub_10002D634(v24, v23, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Requested cancel for task identifiers: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t KeyPath = v93;
  objc_super v103 = (char *)&_swiftEmptySetSingleton;
  uint64_t v25 = *(void *)(a1 + 16);
  uint64_t v81 = a1;
  if (v25)
  {
    uint64_t v98 = *(void (***)(char *, uint64_t))(v82 + 16);
    uint64_t v99 = (uint8_t *)(v82 + 16);
    unint64_t v26 = a1 + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
    uint64_t v27 = *(void *)(v82 + 72);
    unint64_t v28 = v82 + 56;
    uint64_t v29 = (unsigned int (**)(unint64_t, uint64_t, uint64_t))(v82 + 48);
    uint64_t v95 = (void (**)(char *, unint64_t, uint64_t))(v82 + 32);
    uint64_t v96 = v27;
    id v94 = (void (**)(char *, uint64_t))(v82 + 8);
    swift_bridgeObjectRetain();
    unint64_t v92 = v28;
    unint64_t v91 = v28 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    do
    {
      ((void (*)(unint64_t, unint64_t, uint64_t))v98)(v15, v26, v4);
      BOOL v30 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))v92;
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))v92)(v15, 0, 1, v4);
      if ((*v29)(v15, 1, v4) == 1)
      {
        a1 = v81;
        uint64_t v39 = v89;
        goto LABEL_16;
      }
      (*v95)(KeyPath, v15, v4);
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v31 = v101;
      if (*(void *)(v101 + 16) && (unint64_t v32 = sub_10002DF0C((uint64_t)KeyPath), (v33 & 1) != 0))
      {
        uint64_t v34 = *(void *)(*(void *)(v31 + 56) + 8 * v32);
        swift_retain();
        swift_bridgeObjectRelease();
        (*v94)(KeyPath, v4);
        swift_getKeyPath();
        swift_getKeyPath();
        LOBYTE(v101) = 1;
        swift_retain();
        static Published.subscript.setter();
        Swift::Int v36 = *(void *)(v34 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
        Swift::Int v35 = *(void *)(v34 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
        swift_bridgeObjectRetain();
        Swift::Int v37 = v36;
        uint64_t v2 = v90;
        Swift::Int v38 = v35;
        uint64_t KeyPath = v93;
        sub_100023BD0(&v101, v37, v38);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        (*v94)(KeyPath, v4);
      }
      v26 += v96;
      --v25;
    }
    while (v25);
    a1 = v81;
    uint64_t v39 = v89;
    v30(v15, 1, 1, v4);
  }
  else
  {
    BOOL v30 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
    unint64_t v92 = v82 + 56;
    swift_bridgeObjectRetain();
    uint64_t v39 = v89;
    v30(v15, 1, 1, v4);
  }
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v40 = 0;
  uint64_t v41 = v103;
  uint64_t v42 = *((void *)v103 + 7);
  int v93 = v103 + 56;
  uint64_t v43 = 1 << v103[32];
  if (v43 < 64) {
    uint64_t v44 = ~(-1 << v43);
  }
  else {
    uint64_t v44 = -1;
  }
  unint64_t v45 = v44 & v42;
  id v94 = (void (**)(char *, uint64_t))((unint64_t)(v43 + 63) >> 6);
  uint64_t v87 = (unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48);
  uint64_t v86 = (void (**)(char *, char *, uint64_t))(v82 + 32);
  uint64_t v98 = (void (**)(char *, uint64_t))(v82 + 8);
  uint64_t v99 = (uint8_t *)(v82 + 16);
  if (v45)
  {
LABEL_20:
    uint64_t v95 = (void (**)(char *, unint64_t, uint64_t))((v45 - 1) & v45);
    uint64_t v96 = v40;
    unint64_t v46 = __clz(__rbit64(v45)) | (v40 << 6);
    goto LABEL_35;
  }
  while (1)
  {
    uint64_t v47 = v40 + 1;
    if (__OFADD__(v40, 1))
    {
      __break(1u);
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v47 >= (uint64_t)v94) {
      goto LABEL_59;
    }
    unint64_t v48 = *(void *)&v93[8 * v47];
    uint64_t v49 = v40 + 1;
    if (!v48)
    {
      uint64_t v49 = v40 + 2;
      if (v40 + 2 >= (uint64_t)v94) {
        goto LABEL_59;
      }
      unint64_t v48 = *(void *)&v93[8 * v49];
      if (!v48)
      {
        uint64_t v49 = v40 + 3;
        if (v40 + 3 >= (uint64_t)v94) {
          goto LABEL_59;
        }
        unint64_t v48 = *(void *)&v93[8 * v49];
        if (!v48) {
          break;
        }
      }
    }
LABEL_34:
    uint64_t v95 = (void (**)(char *, unint64_t, uint64_t))((v48 - 1) & v48);
    uint64_t v96 = v49;
    unint64_t v46 = __clz(__rbit64(v48)) + (v49 << 6);
LABEL_35:
    unint64_t v51 = (uint64_t *)(*((void *)v41 + 6) + 16 * v46);
    uint64_t v52 = *v51;
    unint64_t v15 = v51[1];
    uint64_t KeyPath = (char *)swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v53 = v102;
    if (*(void *)(v102 + 16) && (unint64_t v54 = sub_10002DDDC(v52, v15), (v55 & 1) != 0))
    {
      uint64_t v56 = *(void *)(*(void *)(v53 + 56) + 8 * v54);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v79 = v56;
      uint64_t v57 = (char **)(v56 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
      swift_beginAccess();
      uint64_t KeyPath = *v57;
      unint64_t v15 = sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
      swift_bridgeObjectRetain();
      unint64_t v85 = v15;
      uint64_t v58 = Set.init(minimumCapacity:)();
      uint64_t v59 = *((void *)KeyPath + 2);
      uint64_t v88 = v30;
      uint64_t v84 = v59;
      id v80 = KeyPath;
      if (v59)
      {
        unint64_t v77 = v92 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        uint64_t v78 = v41;
        unint64_t v60 = 0;
        uint64_t v83 = &KeyPath[(*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80)];
        uint64_t v61 = *(void *)(v82 + 72);
        uint64_t v62 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
        v62(v39, v83, v4);
        while (1)
        {
          v30((unint64_t)v39, 0, 1, v4);
          if ((*v87)(v39, 1, v4) == 1)
          {
            a1 = v81;
            uint64_t v41 = v78;
            goto LABEL_55;
          }
          unint64_t v91 = v60;
          (*v86)(v100, v39, v4);
          swift_bridgeObjectRetain();
          uint64_t v65 = dispatch thunk of Hashable._rawHashValue(seed:)();
          uint64_t v66 = -1 << *(unsigned char *)(v58 + 32);
          unint64_t v15 = v65 & ~v66;
          uint64_t KeyPath = (char *)(v58 + 56);
          if ((*(void *)(v58 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
          {
            uint64_t v67 = ~v66;
            while (1)
            {
              uint64_t v68 = v97;
              v62(v97, (char *)(*(void *)(v58 + 48) + v15 * v61), v4);
              sub_100028618(&qword_100057B70, (void (*)(uint64_t))&type metadata accessor for UUID);
              char v69 = dispatch thunk of static Equatable.== infix(_:_:)();
              uint64_t v70 = *v98;
              (*v98)(v68, v4);
              if (v69) {
                break;
              }
              unint64_t v15 = (v15 + 1) & v67;
              if (((*(void *)&KeyPath[(v15 >> 3) & 0xFFFFFFFFFFFFFF8] >> v15) & 1) == 0) {
                goto LABEL_42;
              }
            }
            swift_bridgeObjectRelease();
            v70(v100, v4);
          }
          else
          {
LABEL_42:
            swift_bridgeObjectRelease();
            uint64_t KeyPath = (char *)swift_isUniquelyReferenced_nonNull_native();
            uint64_t v63 = (uint64_t)v97;
            uint64_t v64 = v100;
            v62(v97, v100, v4);
            uint64_t v102 = v58;
            sub_100025250(v63, v15, (char)KeyPath);
            uint64_t v58 = v102;
            swift_bridgeObjectRelease();
            (*v98)(v64, v4);
          }
          uint64_t v39 = v89;
          uint64_t v2 = v90;
          unint64_t v60 = v91 + 1;
          BOOL v30 = v88;
          if (v91 + 1 == v84) {
            break;
          }
          v62(v89, &v83[v61 * v60], v4);
        }
        a1 = v81;
        uint64_t v41 = v78;
      }
      v30((unint64_t)v39, 1, 1, v4);
LABEL_55:
      swift_bridgeObjectRelease();
      uint64_t v71 = *((void *)sub_100023D80(a1, v58) + 2);
      swift_release();
      if (v71)
      {
        swift_release();
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        LOBYTE(v102) = 1;
        static Published.subscript.setter();
      }
      BOOL v30 = v88;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    unint64_t v45 = (unint64_t)v95;
    uint64_t v40 = v96;
    if (v95) {
      goto LABEL_20;
    }
  }
  uint64_t v50 = v40 + 4;
  if (v40 + 4 < (uint64_t)v94)
  {
    unint64_t v48 = *(void *)&v93[8 * v50];
    if (!v48)
    {
      while (1)
      {
        uint64_t v49 = v50 + 1;
        if (__OFADD__(v50, 1)) {
          goto LABEL_63;
        }
        if (v49 >= (uint64_t)v94) {
          goto LABEL_59;
        }
        unint64_t v48 = *(void *)&v93[8 * v49];
        ++v50;
        if (v48) {
          goto LABEL_34;
        }
      }
    }
    uint64_t v49 = v40 + 4;
    goto LABEL_34;
  }
LABEL_59:
  uint64_t result = swift_release();
  uint64_t v73 = *(void **)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient);
  if (v73)
  {
    id v74 = objc_allocWithZone((Class)APKActivityProgressTasksSpecifier);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v76 = [v74 initWithTaskIdentifiers:isa];

    [v73 cancelActivities:v76];
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001AEAC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100057C10);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_100057C10);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  __int16 v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_10001AF74()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for BackgroundActivitySessionsController()) init];
  qword_100058B58 = (uint64_t)result;
  return result;
}

uint64_t sub_10001AFA8@<X0>(void *a1@<X8>)
{
  return sub_10001AFE4(a1);
}

uint64_t sub_10001AFBC(uint64_t a1, void **a2)
{
  return sub_10001B074(a1, a2);
}

uint64_t sub_10001AFD0@<X0>(void *a1@<X8>)
{
  return sub_10001AFE4(a1);
}

uint64_t sub_10001AFE4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001B060(uint64_t a1, void **a2)
{
  return sub_10001B074(a1, a2);
}

uint64_t sub_10001B074(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10001B0E8()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&long long v48 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  *(void *)&long long v47 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  unint64_t v46 = (char *)v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v45);
  v44[1] = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000847C(&qword_100057EF0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000847C(&qword_100057EF8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = 0;
  os_log_type_t v13 = &v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__backgroundActivitySessionsByTaskID];
  uint64_t v14 = v1;
  *(void *)&long long aBlock = sub_100004184((uint64_t)&_swiftEmptyArrayStorage);
  sub_10000847C(&qword_100057CB0);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  unint64_t v15 = &v14[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__jindoSessionsByBundleID];
  *(void *)&long long aBlock = sub_100004378((uint64_t)&_swiftEmptyArrayStorage);
  sub_10000847C(&qword_100057CC0);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v8, v5);
  uint64_t v16 = OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator;
  *(void *)&v14[v16] = [objc_allocWithZone((Class)UINotificationFeedbackGenerator) init];
  v14[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation] = 0;
  uint64_t v17 = OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_queue;
  sub_10000C2E8(0, &qword_100057F00);
  static DispatchQoS.userInitiated.getter();
  *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
  sub_100028618(&qword_100057F08, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000847C(&qword_100057F10);
  sub_100008AC8(&qword_100057F18, &qword_100057F10);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, void))(v47 + 104))(v46, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v48);
  *(void *)&v14[v17] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  type metadata accessor for APKLockStateMonitor();
  swift_allocObject();
  *(void *)&v14[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_lockStateMonitor] = APKLockStateMonitor.init()();
  type metadata accessor for BackgroundActivitySystemPillController();
  os_log_type_t v18 = (void *)swift_allocObject();
  v18[2] = String._bridgeToObjectiveC()();
  BSAuditTokenForCurrentProcess();
  long long v47 = v51;
  long long v48 = aBlock;
  id v19 = objc_allocWithZone((Class)STActivityAttribution);
  long long aBlock = v48;
  long long v51 = v47;
  p_long long aBlock = &aBlock;
  v18[3] = [v19 initWithAuditToken:&aBlock];
  v18[4] = [objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainPublisher) init];
  v18[5] = 0;
  *(void *)&v14[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_pillController] = v18;
  id v21 = [self sharedApplication];
  unint64_t v22 = (unint64_t)[v21 userInterfaceLayoutDirection];

  if ((v22 & 0x8000000000000000) != 0) {
    goto LABEL_11;
  }
  id v23 = [objc_allocWithZone((Class)SFUIPeopleSuggestionImageProvider) initWithTargetSize:v22 layoutDirection:1.0];
  *(void *)&v14[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_appIconProvider] = v23;
  v14[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_isSystemApertureEnabled] = SBUIIsSystemApertureEnabled();

  uint64_t v24 = ObjectType;
  v54.receiver = v14;
  v54.super_class = ObjectType;
  id v25 = [super init];
  sub_100028618(&qword_100057F20, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySessionsController);
  unint64_t v26 = (char *)v25;
  swift_retain();
  dispatch thunk of APKLockStateMonitor.delegate.setter();
  uint64_t v27 = swift_release();
  __chkstk_darwin(v27);
  uint64_t v42 = v26;
  uint64_t v43 = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_100028600;
  *(void *)(v28 + 24) = &v40;
  uint64_t v52 = sub_100028684;
  uint64_t v53 = v28;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v51 = sub_10001BA6C;
  *((void *)&v51 + 1) = &unk_10004E680;
  uint64_t v29 = _Block_copy(&aBlock);
  BOOL v30 = self;
  swift_retain();
  id v31 = [v30 listenerWithConfigurator:v29];
  _Block_release(v29);
  swift_release();
  LOBYTE(v29) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v29)
  {
    __break(1u);
    goto LABEL_9;
  }
  p_long long aBlock = (long long *)OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener;
  unint64_t v32 = *(void **)&v26[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener];
  *(void *)&v26[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener] = v31;

  if (qword_100056D20 != -1) {
LABEL_9:
  }
    swift_once();
  uint64_t v33 = type metadata accessor for Logger();
  sub_1000084C0(v33, (uint64_t)qword_100057C10);
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    Swift::Int v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::Int v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "BackgroundActivitySessionsController listener is activating...", v36, 2u);
    swift_slowDealloc();
  }

  Swift::Int v37 = *(void **)((char *)p_aBlock + (void)v26);
  if (v37)
  {
    id v38 = v37;
    [v38 activate];

    return (uint64_t)v26;
  }
  __break(1u);
LABEL_11:
  LODWORD(v42) = 0;
  uint64_t v41 = 3451;
  char v40 = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_10001B9AC(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 setDomain:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

void sub_10001BA94()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener];
  if (v1)
  {
    ObjectType = (objc_class *)swift_getObjectType();
    [v1 invalidate];
    v3.receiver = v0;
    v3.super_class = ObjectType;
    [super dealloc];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10001BCB8()
{
  return type metadata accessor for BackgroundActivitySessionsController();
}

uint64_t type metadata accessor for BackgroundActivitySessionsController()
{
  uint64_t result = qword_100057C98;
  if (!qword_100057C98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001BD0C()
{
  sub_10001BE30(319, &qword_100057CA8, &qword_100057CB0);
  if (v0 <= 0x3F)
  {
    sub_10001BE30(319, &qword_100057CB8, &qword_100057CC0);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10001BE30(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_10000877C(a3);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10001BE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  long long v48 = a8;
  uint64_t v49 = a1;
  uint64_t v45 = a6;
  unint64_t v46 = a7;
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v11 = type metadata accessor for APKDeviceLockState();
  __chkstk_darwin(v11 - 8);
  os_log_type_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  os_log_type_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v36 - v19;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (*(void *)(v50[0] + 16) && (sub_10002DF0C(v49), (v21 & 1) != 0))
  {
    swift_retain();
    swift_bridgeObjectRelease();
    sub_100013A60(v48);
  }
  else
  {
    char v40 = v18;
    uint64_t v47 = v10;
    swift_bridgeObjectRelease();
    uint64_t v38 = v15;
    Swift::Int v36 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v36(v20, v49, v14);
    uint64_t v39 = v9;
    id v22 = a9;
    uint64_t v23 = v42;
    swift_bridgeObjectRetain();
    uint64_t v37 = v14;
    uint64_t v24 = v44;
    swift_bridgeObjectRetain();
    id v25 = v46;
    swift_bridgeObjectRetain();
    unint64_t v26 = v48;
    dispatch thunk of APKLockStateMonitor.lockState.getter();
    type metadata accessor for BackgroundActivitySession();
    swift_allocObject();
    uint64_t v27 = v47;
    uint64_t result = sub_100011FF0((uint64_t)v20, v41, v23, v43, v24, v45, v25, v26, a9, 0, v13);
    if (v27) {
      return result;
    }
    uint64_t v29 = result;
    uint64_t v30 = (uint64_t)v40;
    uint64_t v31 = v37;
    v36(v40, v49, v37);
    swift_getKeyPath();
    uint64_t v47 = 0;
    swift_getKeyPath();
    swift_retain();
    unint64_t v32 = (void (*)(uint64_t *, void))static Published.subscript.modify();
    uint64_t v34 = v33;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v51 = *v34;
    uint64_t *v34 = 0x8000000000000000;
    sub_1000235F8(v29, v30, isUniquelyReferenced_nonNull_native);
    uint64_t *v34 = v51;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v30, v31);
    v32(v50, 0);
    swift_release();
    swift_release();
    sub_100008F80();
  }
  return swift_release();
}

uint64_t sub_10001C238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  uint64_t v11 = v9;
  uint64_t v42 = a7;
  id v43 = a8;
  char v40 = a5;
  uint64_t v41 = a6;
  uint64_t v39 = a4;
  uint64_t v15 = type metadata accessor for APKDeviceLockState();
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UUID();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t result = __chkstk_darwin(v18);
  id v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v11
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_isSystemApertureEnabled) == 1)
  {
    uint64_t v37 = a2;
    uint64_t v38 = v10;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (*(void *)(v44[0] + 16) && (sub_10002DDDC(v37, a3), (v23 & 1) != 0))
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100014C2C(a1, (uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, a1, v18);
      id v24 = a9;
      swift_bridgeObjectRetain();
      id v25 = v40;
      swift_bridgeObjectRetain();
      unint64_t v26 = v42;
      swift_bridgeObjectRetain();
      id v27 = v43;
      dispatch thunk of APKLockStateMonitor.lockState.getter();
      type metadata accessor for BackgroundActivitySession();
      swift_allocObject();
      os_log_type_t v35 = v17;
      uint64_t v29 = v37;
      uint64_t v28 = v38;
      uint64_t result = sub_100011FF0((uint64_t)v22, v37, a3, v39, v25, v41, v26, v27, a9, 1u, v35);
      if (v28) {
        return result;
      }
      uint64_t v30 = result;
      uint64_t v38 = 0;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v31 = (void (*)(uint64_t *, void))static Published.subscript.modify();
      uint64_t v33 = v32;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v45 = *v33;
      uint64_t *v33 = 0x8000000000000000;
      sub_1000237C0(v30, v29, a3, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_10002EDAC, &qword_100056F30);
      uint64_t *v33 = v45;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v31(v44, 0);
      swift_release();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_10001C5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[14] = a3;
  v6[15] = v5;
  v6[12] = a1;
  v6[13] = a2;
  v6[16] = type metadata accessor for MainActor();
  v6[17] = static MainActor.shared.getter();
  if (a5)
  {
    uint64_t v11 = (void *)swift_task_alloc();
    v6[18] = v11;
    *uint64_t v11 = v6;
    v11[1] = sub_10001C73C;
    return sub_100026A5C(a4, a5);
  }
  else
  {
    os_log_type_t v13 = (void *)swift_task_alloc();
    v6[19] = v13;
    *os_log_type_t v13 = v6;
    v13[1] = sub_10001CB64;
    v13[5] = a3;
    v13[6] = v5;
    v13[4] = a2;
    return _swift_task_switch(sub_10001CFB0, 0, 0);
  }
}

uint64_t sub_10001C73C(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = a1;
  swift_task_dealloc();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001C87C, v4, v3);
}

uint64_t sub_10001C87C()
{
  unint64_t v1 = (void *)v0[3];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (*(void *)(v0[6] + 16) && (sub_10002DF0C(v0[12]), (v2 & 1) != 0))
  {
    swift_retain();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v3 = (void *)v0[10];

    if (v3)
    {
      swift_release();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v0[11] = v1;
      id v8 = v1;
      static Published.subscript.setter();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!*(void *)(v0[7] + 16) || (sub_10002DDDC(v0[13], v0[14]), (v4 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v5 = (void *)v0[8];

  if (v5)
  {
    swift_release();
LABEL_11:

    goto LABEL_12;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v0[9] = v1;
  static Published.subscript.setter();
LABEL_12:
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10001CB64(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v1;
  *(void *)(v2 + 40) = a1;
  swift_task_dealloc();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001CCA4, v4, v3);
}

uint64_t sub_10001CCA4()
{
  unint64_t v1 = (void *)v0[5];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (*(void *)(v0[6] + 16) && (sub_10002DF0C(v0[12]), (v2 & 1) != 0))
  {
    swift_retain();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v3 = (void *)v0[10];

    if (v3)
    {
      swift_release();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v0[11] = v1;
      id v8 = v1;
      static Published.subscript.setter();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!*(void *)(v0[7] + 16) || (sub_10002DDDC(v0[13], v0[14]), (v4 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v5 = (void *)v0[8];

  if (v5)
  {
    swift_release();
LABEL_11:

    goto LABEL_12;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v0[9] = v1;
  static Published.subscript.setter();
LABEL_12:
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10001CF8C(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return _swift_task_switch(sub_10001CFB0, 0, 0);
}

uint64_t sub_10001CFB0()
{
  if (v0[4] == 0xD000000000000026 && v0[5] == 0x8000000100042860
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    NSString v1 = String._bridgeToObjectiveC()();
    id v2 = [self imageNamed:v1];

    uint64_t v3 = (uint64_t (*)(id))v0[1];
    return v3(v2);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v0[7] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_10001D11C;
    uint64_t v7 = v0[4];
    uint64_t v6 = v0[5];
    return SFUIPeopleSuggestionImageProvider.previewCornerIcon(for:)(v7, v6);
  }
}

uint64_t sub_10001D11C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_10001D258, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_10001D258()
{
  os_log_type_t v13 = v0;
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000084C0(v1, (uint64_t)qword_100057C10);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[5];
  if (v4)
  {
    uint64_t v11 = v0[4];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_10002D634(v11, v5, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to get image for background activity with bundle ID %s: %@", (uint8_t *)v6, 0x16u);
    sub_10000847C(&qword_100057E60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9(0);
}

uint64_t sub_10001D510()
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  os_log_type_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000847C(&qword_100057DD8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - v8;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v11 = *(void *)(v35 + 64);
  uint64_t v28 = v35 + 64;
  uint64_t v31 = v1;
  uint64_t v32 = v35;
  uint64_t v12 = 1 << *(unsigned char *)(v35 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v29 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v30 = v1 + 16;
  uint64_t v33 = (void (**)(char *, char *, uint64_t))(v1 + 32);
  int64_t v34 = 0;
  uint64_t v15 = (uint64_t (**)(char *, uint64_t))(v1 + 8);
  int64_t v27 = v29 - 1;
  if ((v13 & v11) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v16 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  unint64_t v17 = v16 | (v34 << 6);
  while (2)
  {
    uint64_t v18 = v32;
    (*(void (**)(char *, unint64_t, uint64_t))(v31 + 16))(v7, *(void *)(v32 + 48) + *(void *)(v31 + 72) * v17, v0);
    uint64_t v19 = *(void *)(v18 + 56);
    uint64_t v20 = sub_10000847C((uint64_t *)&unk_100057DE0);
    *(void *)&v7[*(int *)(v20 + 48)] = *(void *)(v19 + 8 * v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 0, 1, v20);
    swift_retain();
    while (1)
    {
      sub_1000102A0((uint64_t)v7, (uint64_t)v9, &qword_100057DD8);
      uint64_t v25 = sub_10000847C((uint64_t *)&unk_100057DE0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v9, 1, v25) == 1) {
        return swift_release();
      }
      swift_release();
      (*v33)(v3, v9, v0);
      sub_100019C78((uint64_t)v3);
      uint64_t result = (*v15)(v3, v0);
      if (v14) {
        goto LABEL_6;
      }
LABEL_8:
      int64_t v21 = v34 + 1;
      if (__OFADD__(v34, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v21 < v29)
      {
        unint64_t v22 = *(void *)(v28 + 8 * v21);
        if (v22) {
          goto LABEL_11;
        }
        int64_t v23 = v34 + 2;
        ++v34;
        if (v21 + 1 < v29)
        {
          unint64_t v22 = *(void *)(v28 + 8 * v23);
          if (v22) {
            goto LABEL_14;
          }
          int64_t v34 = v21 + 1;
          if (v21 + 2 < v29)
          {
            unint64_t v22 = *(void *)(v28 + 8 * (v21 + 2));
            if (v22)
            {
              v21 += 2;
              goto LABEL_11;
            }
            int64_t v23 = v21 + 3;
            int64_t v34 = v21 + 2;
            if (v21 + 3 < v29) {
              break;
            }
          }
        }
      }
LABEL_25:
      uint64_t v24 = sub_10000847C((uint64_t *)&unk_100057DE0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 1, 1, v24);
      unint64_t v14 = 0;
    }
    unint64_t v22 = *(void *)(v28 + 8 * v23);
    if (v22)
    {
LABEL_14:
      int64_t v21 = v23;
LABEL_11:
      unint64_t v14 = (v22 - 1) & v22;
      unint64_t v17 = __clz(__rbit64(v22)) + (v21 << 6);
      int64_t v34 = v21;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v21 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v21 >= v29)
    {
      int64_t v34 = v27;
      goto LABEL_25;
    }
    unint64_t v22 = *(void *)(v28 + 8 * v21);
    ++v23;
    if (v22) {
      goto LABEL_11;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_10001D968(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_1000102A0((uint64_t)&v6, v3, &qword_100057ED0);
  return swift_continuation_resume();
}

uint64_t sub_10001D9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  type metadata accessor for MainActor();
  v5[5] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001DA68, v7, v6);
}

uint64_t sub_10001DA68()
{
  uint64_t v1 = v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  swift_release();
  *uint64_t v3 = [v2 prepareImageForDescriptor:v1];
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10001DAF4@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001DB34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v41 = a5;
  uint64_t v46 = a4;
  uint64_t v47 = a8;
  uint64_t v37 = a7;
  uint64_t v38 = a3;
  uint64_t v44 = a2;
  uint64_t v45 = a6;
  uint64_t v36 = a9;
  id v42 = a10;
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v39 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  char v40 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000847C(&qword_1000572A8);
  __chkstk_darwin(v14 - 8);
  unint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v43 = v16;
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  type metadata accessor for MainActor();
  swift_bridgeObjectRetain();
  swift_retain();
  id v42 = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v19 = static MainActor.shared.getter();
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = v19;
  *((void *)v25 + 3) = &protocol witness table for MainActor;
  *((void *)v25 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v25[v20], v40, v39);
  *(void *)&v25[v21] = v42;
  uint64_t v26 = &v25[v22];
  uint64_t v27 = v38;
  *(void *)uint64_t v26 = v44;
  *((void *)v26 + 1) = v27;
  uint64_t v28 = &v25[v23];
  uint64_t v29 = v37;
  *(void *)uint64_t v28 = v45;
  *((void *)v28 + 1) = v29;
  uint64_t v30 = &v25[v24];
  uint64_t v31 = v36;
  *(void *)uint64_t v30 = v47;
  *((void *)v30 + 1) = v31;
  uint64_t v32 = &v25[(v24 + 23) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v33 = v41;
  *(void *)uint64_t v32 = v46;
  *((void *)v32 + 1) = v33;
  swift_release();
  sub_100019898((uint64_t)v43, (uint64_t)&unk_100057E98, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_10001DFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 176) = v17;
  *(void *)(v8 + 184) = v18;
  *(_OWORD *)(v8 + 144) = v15;
  *(_OWORD *)(v8 + 160) = v16;
  *(void *)(v8 + 128) = a7;
  *(void *)(v8 + 136) = a8;
  *(void *)(v8 + 112) = a5;
  *(void *)(v8 + 120) = a6;
  *(void *)(v8 + 104) = a4;
  sub_10000847C(&qword_1000572A8);
  *(void *)(v8 + 192) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for UUID();
  *(void *)(v8 + 200) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 208) = v10;
  *(void *)(v8 + 216) = *(void *)(v10 + 64);
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = swift_task_alloc();
  *(void *)(v8 + 240) = swift_task_alloc();
  *(void *)(v8 + 248) = swift_task_alloc();
  *(void *)(v8 + 256) = type metadata accessor for MainActor();
  *(void *)(v8 + 264) = static MainActor.shared.getter();
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v8 + 272) = v12;
  *(void *)(v8 + 280) = v11;
  return _swift_task_switch(sub_10001E124, v12, v11);
}

uint64_t sub_10001E124()
{
  uint64_t v68 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 288) = Strong;
  if (!Strong)
  {
    swift_release();
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v50 = *(uint64_t (**)(void))(v0 + 8);
    return v50();
  }
  uint64_t v2 = (void *)Strong;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v66 = v2;
  if (*(void *)(*(void *)(v0 + 40) + 16))
  {
    sub_10002DF0C(*(void *)(v0 + 112));
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      if (qword_100056D20 != -1) {
        swift_once();
      }
      uint64_t v4 = *(void *)(v0 + 240);
      uint64_t v5 = *(void *)(v0 + 200);
      uint64_t v6 = *(void *)(v0 + 208);
      uint64_t v7 = *(void *)(v0 + 112);
      uint64_t v8 = type metadata accessor for Logger();
      sub_1000084C0(v8, (uint64_t)qword_100057C10);
      type = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      type(v4, v7, v5);
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.error.getter();
      BOOL v11 = os_log_type_enabled(v9, v10);
      uint64_t v12 = *(void *)(v0 + 240);
      uint64_t v13 = *(void *)(v0 + 200);
      uint64_t v14 = *(void *)(v0 + 208);
      if (v11)
      {
        long long v15 = (uint8_t *)swift_slowAlloc();
        v67[0] = swift_slowAlloc();
        *(_DWORD *)long long v15 = 136315138;
        sub_100028618(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v0 + 96) = sub_10002D634(v16, v17, v67);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "BackgroundActivitySessionsController: Received call to start new activity for existing task ID %s, converting to an updateProgress call", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v14 + 8))(*(void *)(v0 + 240), *(void *)(v0 + 200));
      }

      uint64_t v38 = *(void *)(v0 + 232);
      uint64_t v39 = *(void *)(v0 + 208);
      *(void *)unint64_t v60 = *(void *)(v0 + 216);
      char v40 = *(NSObject **)(v0 + 192);
      uint64_t v41 = *(void *)(v0 + 200);
      os_log_t loga = v40;
      uint64_t v42 = *(void *)(v0 + 112);
      id v43 = *(void **)(v0 + 120);
      uint64_t v44 = type metadata accessor for TaskPriority();
      (*(void (**)(NSObject *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v40, 1, 1, v44);
      uint64_t v45 = swift_allocObject();
      swift_unknownObjectWeakInit();
      type(v38, v42, v41);
      swift_retain();
      id v46 = v43;
      uint64_t v47 = static MainActor.shared.getter();
      unint64_t v48 = (*(unsigned __int8 *)(v39 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
      uint64_t v49 = (char *)swift_allocObject();
      *((void *)v49 + 2) = v47;
      *((void *)v49 + 3) = &protocol witness table for MainActor;
      *((void *)v49 + 4) = v45;
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(&v49[v48], v38, v41);
      *(void *)&v49[(*(void *)v60 + v48 + 7) & 0xFFFFFFFFFFFFFFF8] = v46;
      swift_release();
      sub_100019898((uint64_t)loga, (uint64_t)&unk_100057EA8, (uint64_t)v49);
      swift_release();

      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)(v0 + 248);
  uint64_t v19 = *(void *)(v0 + 200);
  uint64_t v20 = *(void *)(v0 + 208);
  uint64_t v21 = *(void *)(v0 + 112);
  uint64_t v22 = type metadata accessor for Logger();
  sub_1000084C0(v22, (uint64_t)qword_100057C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v21, v19);
  swift_bridgeObjectRetain_n();
  unint64_t v23 = Logger.logObject.getter();
  os_log_type_t typea = static os_log_type_t.default.getter();
  BOOL v24 = os_log_type_enabled(v23, typea);
  uint64_t v25 = *(void *)(v0 + 248);
  uint64_t v26 = *(void *)(v0 + 200);
  uint64_t v27 = *(void *)(v0 + 208);
  unint64_t v28 = *(void *)(v0 + 136);
  if (v24)
  {
    uint64_t v58 = *(void *)(v0 + 128);
    uint64_t v29 = swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315394;
    sub_100028618(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v0 + 80) = sub_10002D634(v30, v31, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 88) = sub_10002D634(v58, v28, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v23, typea, "Starting new activity for task ID %s and bundle ID %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    swift_bridgeObjectRelease_n();
  }

  os_log_t log = *(os_log_t *)(v0 + 160);
  typeb = *(void **)(v0 + 168);
  uint64_t v32 = *(void *)(v0 + 144);
  uint64_t v59 = *(void **)(v0 + 152);
  uint64_t v34 = *(void *)(v0 + 128);
  uint64_t v33 = *(void *)(v0 + 136);
  uint64_t v36 = *(void *)(v0 + 112);
  uint64_t v35 = *(void **)(v0 + 120);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  *(void *)(v0 + 296) = *(void *)(*(void *)(v0 + 48) + 16);
  swift_bridgeObjectRelease();
  id v37 = [v35 ns];
  *(void *)(v0 + 304) = v37;
  sub_10001BE80(v36, v34, v33, v32, v59, (uint64_t)log, typeb, v37, 0);
  sub_10001C238(*(void *)(v0 + 112), *(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 144), *(void **)(v0 + 152), *(void *)(v0 + 160), *(void **)(v0 + 168), v37, 0);
  uint64_t v52 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v52;
  void *v52 = v0;
  v52[1] = sub_10001ECAC;
  uint64_t v53 = *(void *)(v0 + 176);
  uint64_t v54 = *(void *)(v0 + 184);
  uint64_t v55 = *(void *)(v0 + 128);
  uint64_t v56 = *(void *)(v0 + 136);
  uint64_t v57 = *(void *)(v0 + 112);
  return sub_10001C5D4(v57, v55, v56, v53, v54);
}

uint64_t sub_10001ECAC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 280);
  uint64_t v3 = *(void *)(v1 + 272);
  return _swift_task_switch(sub_10001EDCC, v3, v2);
}

uint64_t sub_10001EDCC()
{
  uint64_t v1 = v0[37];
  swift_release();
  uint64_t v2 = (void *)v0[38];
  uint64_t v3 = (unsigned char *)v0[36];
  if (v1)
  {
    id v4 = *(id *)&v3[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator];
    [v4 notificationOccurred:0];
  }
  else
  {

    v3[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation] = 1;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10001EEBC(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000847C(&qword_1000572A8);
  __chkstk_darwin(v8 - 8);
  os_log_type_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  type metadata accessor for MainActor();
  swift_retain();
  id v13 = a1;
  uint64_t v14 = static MainActor.shared.getter();
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v16 = (v6 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = v14;
  *((void *)v17 + 3) = &protocol witness table for MainActor;
  *((void *)v17 + 4) = v12;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v17[v15], v7, v4);
  *(void *)&v17[v16] = v13;
  swift_release();
  sub_100019898((uint64_t)v10, (uint64_t)&unk_100057E88, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_10001F2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  uint64_t v7 = type metadata accessor for UUID();
  v6[11] = v7;
  v6[12] = *(void *)(v7 - 8);
  v6[13] = swift_task_alloc();
  type metadata accessor for MainActor();
  v6[14] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F3A4, v9, v8);
}

uint64_t sub_10001F3A4()
{
  uint64_t v29 = v0;
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (*(void *)(v0[5] + 16) && (sub_10002DF0C(v0[9]), (v3 & 1) != 0))
    {
      uint64_t v4 = (void *)v0[10];
      swift_retain();
      swift_bridgeObjectRelease();
      id v5 = [v4 ns];
      sub_100013A60(v5);

      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_100056D20 != -1) {
        swift_once();
      }
      uint64_t v7 = v0[12];
      uint64_t v6 = v0[13];
      uint64_t v9 = (void *)v0[10];
      uint64_t v8 = v0[11];
      uint64_t v10 = v0[9];
      uint64_t v11 = type metadata accessor for Logger();
      sub_1000084C0(v11, (uint64_t)qword_100057C10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v10, v8);
      id v12 = v9;
      id v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.error.getter();
      BOOL v15 = os_log_type_enabled(v13, v14);
      uint64_t v17 = v0[12];
      uint64_t v16 = v0[13];
      uint64_t v18 = (void *)v0[10];
      uint64_t v19 = v0[11];
      if (v15)
      {
        os_log_t log = v13;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v26 = (void *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315394;
        sub_100028618(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
        v0[6] = sub_10002D634(v21, v22, &v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v19);
        *(_WORD *)(v20 + 12) = 2112;
        id v23 = [v18 ns];
        v0[7] = v23;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v26 = v23;

        _os_log_impl((void *)&_mh_execute_header, log, v14, "BackgroundActivitySessionsController: No session found when updating progress for task ID %s to %@", (uint8_t *)v20, 0x16u);
        sub_10000847C(&qword_100057E60);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v17 + 8))(v0[13], v0[11]);
      }
    }
  }
  swift_task_dealloc();
  BOOL v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_10001F8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v31 = a5;
  uint64_t v32 = a1;
  uint64_t v27 = a4;
  uint64_t v28 = a2;
  uint64_t v33 = a3;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v29 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v30 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000847C(&qword_1000572A8);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a6, v7);
  type metadata accessor for MainActor();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v31;
  uint64_t v16 = static MainActor.shared.getter();
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = v16;
  *((void *)v20 + 3) = &protocol witness table for MainActor;
  *((void *)v20 + 4) = v14;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v17], v30, v29);
  uint64_t v21 = &v20[v18];
  uint64_t v22 = v28;
  *(void *)uint64_t v21 = v32;
  *((void *)v21 + 1) = v22;
  id v23 = &v20[v19];
  uint64_t v24 = v27;
  *(void *)id v23 = v33;
  *((void *)v23 + 1) = v24;
  *(void *)&v20[(v19 + 23) & 0xFFFFFFFFFFFFFFF8] = v15;
  swift_release();
  sub_100019898((uint64_t)v12, (uint64_t)&unk_100057E70, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_10001FCBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[22] = v14;
  v8[23] = v15;
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[17] = a4;
  uint64_t v9 = type metadata accessor for UUID();
  v8[24] = v9;
  v8[25] = *(void *)(v9 - 8);
  v8[26] = swift_task_alloc();
  v8[27] = swift_task_alloc();
  type metadata accessor for MainActor();
  v8[28] = static MainActor.shared.getter();
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001FDD4, v11, v10);
}

uint64_t sub_10001FDD4()
{
  uint64_t v72 = v0;
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (char *)Strong;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v3 = *(void *)(v0 + 88);
    if (*(void *)(v3 + 16))
    {
      unint64_t v4 = sub_10002DF0C(*(void *)(v0 + 144));
      if (v5)
      {
        uint64_t v68 = *(void *)(*(void *)(v3 + 56) + 8 * v4);
        swift_retain();
        swift_bridgeObjectRelease();
        if (qword_100056D20 != -1) {
          swift_once();
        }
        uint64_t v7 = *(void *)(v0 + 200);
        uint64_t v6 = *(void *)(v0 + 208);
        uint64_t v8 = *(void *)(v0 + 192);
        uint64_t v9 = *(void *)(v0 + 144);
        uint64_t v10 = type metadata accessor for Logger();
        sub_1000084C0(v10, (uint64_t)qword_100057C10);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v11 = Logger.logObject.getter();
        os_log_type_t v12 = static os_log_type_t.default.getter();
        BOOL v13 = os_log_type_enabled(v11, v12);
        uint64_t v15 = *(void *)(v0 + 200);
        uint64_t v14 = *(void *)(v0 + 208);
        uint64_t v16 = *(void *)(v0 + 192);
        if (v13)
        {
          unint64_t v62 = *(void *)(v0 + 176);
          uint64_t v63 = *(void *)(v0 + 168);
          unint64_t v59 = *(void *)(v0 + 160);
          uint64_t v60 = *(void *)(v0 + 152);
          uint64_t v17 = swift_slowAlloc();
          uint64_t v71 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 136315650;
          sub_100028618(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
          uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
          *(void *)(v0 + 112) = sub_10002D634(v18, v19, &v71);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
          *(_WORD *)(v17 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 120) = sub_10002D634(v60, v59, &v71);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v17 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 128) = sub_10002D634(v63, v62, &v71);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Updating title and subtitle for task identifier %s to title: %s and subtitle: %s", (uint8_t *)v17, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          (*(void (**)(void, void))(v15 + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        uint64_t v38 = *(void *)(v0 + 168);
        uint64_t v39 = *(void *)(v0 + 176);
        uint64_t v41 = *(void *)(v0 + 152);
        uint64_t v40 = *(void *)(v0 + 160);
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        uint64_t v42 = *(void *)(v0 + 48);
        *(void *)uint64_t v66 = *(void *)(v0 + 40);
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        uint64_t v44 = *(void *)(v0 + 56);
        uint64_t v43 = *(void *)(v0 + 64);
        sub_100014A44(v41, v40, v38, v39);
        uint64_t v46 = *(void *)(v68 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
        uint64_t v45 = *(void *)(v68 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
        swift_getKeyPath();
        swift_getKeyPath();
        swift_bridgeObjectRetain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        if (*(void *)(*(void *)(v0 + 104) + 16) && (sub_10002DDDC(v46, v45), (v47 & 1) != 0))
        {
          uint64_t v70 = *(void *)(v0 + 176);
          uint64_t v67 = *(void *)(v0 + 168);
          uint64_t v48 = v42;
          uint64_t v49 = v43;
          uint64_t v50 = v2;
          uint64_t v51 = v44;
          uint64_t v52 = *(void *)(v0 + 152);
          uint64_t v53 = *(void *)(v0 + 160);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v54 = v52;
          uint64_t v44 = v51;
          uint64_t v55 = v53;
          uint64_t v2 = v50;
          uint64_t v43 = v49;
          uint64_t v42 = v48;
          sub_100014A44(v54, v55, v67, v70);
          swift_release();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (![*(id *)(v0 + 184) BOOLValue])
        {

          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
        if (*(void *)v66 == *(void *)(v0 + 152) && v42 == *(void *)(v0 + 160))
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v56 & 1) == 0)
          {
            swift_bridgeObjectRelease();
LABEL_34:
            id v58 = *(id *)&v2[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator];
            [v58 notificationOccurred:0];

            swift_release();
            goto LABEL_14;
          }
        }
        if (v44 == *(void *)(v0 + 168) && v43 == *(void *)(v0 + 176))
        {
          swift_bridgeObjectRelease();
LABEL_32:

          swift_release();
          goto LABEL_14;
        }
        char v57 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v57) {
          goto LABEL_32;
        }
        goto LABEL_34;
      }
    }
    uint64_t v69 = v2;
    swift_bridgeObjectRelease();
    if (qword_100056D20 != -1) {
      swift_once();
    }
    uint64_t v20 = *(void *)(v0 + 216);
    uint64_t v21 = *(void *)(v0 + 192);
    uint64_t v22 = *(void *)(v0 + 200);
    uint64_t v23 = *(void *)(v0 + 144);
    uint64_t v24 = type metadata accessor for Logger();
    sub_1000084C0(v24, (uint64_t)qword_100057C10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v23, v21);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = *(void *)(v0 + 216);
    uint64_t v30 = *(void *)(v0 + 192);
    uint64_t v29 = *(void *)(v0 + 200);
    unint64_t v31 = *(void *)(v0 + 176);
    if (v27)
    {
      uint64_t v64 = *(void *)(v0 + 168);
      os_log_type_t v65 = v26;
      unint64_t v32 = *(void *)(v0 + 160);
      uint64_t v61 = *(void *)(v0 + 152);
      uint64_t v33 = swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315650;
      sub_100028618(&qword_100056F68, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 96) = sub_10002D634(v34, v35, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_10002D634(v61, v32, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 80) = sub_10002D634(v64, v31, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v25, v65, "BackgroundActivitySessionsController: No session found when updating name and description for task ID %s to name: %s and description: %s", (uint8_t *)v33, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v29 + 8))(*(void *)(v0 + 216), *(void *)(v0 + 192));
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

void sub_100020900(void *a1, uint64_t a2, uint64_t a3)
{
  [a1 setTargetQueue:*(void *)(a2 + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_queue)];
  id v6 = [self userInitiated];
  [a1 setServiceQuality:v6];

  [a1 setInterface:a3];
  [a1 setInterfaceTarget:a2];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = sub_100027B74;
  uint64_t v17 = v7;
  os_log_type_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_100020D6C;
  uint64_t v15 = &unk_10004E4B0;
  uint64_t v8 = _Block_copy(&v12);
  swift_release();
  [a1 setActivationHandler:v8];
  _Block_release(v8);
  uint64_t v16 = sub_100020DD4;
  uint64_t v17 = 0;
  os_log_type_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_100020D6C;
  uint64_t v15 = &unk_10004E4D8;
  uint64_t v9 = _Block_copy(&v12);
  [a1 setInterruptionHandler:v9];
  _Block_release(v9);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v16 = sub_100027BB4;
  uint64_t v17 = v10;
  os_log_type_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_100020D6C;
  uint64_t v15 = &unk_10004E528;
  uint64_t v11 = _Block_copy(&v12);
  swift_release();
  [a1 setInvalidationHandler:v11];
  _Block_release(v11);
}

void sub_100020B7C(void *a1)
{
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000084C0(v2, (uint64_t)qword_100057C10);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BackgroundActivitySessionsController: connection activated from client!", v5, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (char *)Strong;
    if ([a1 remoteTarget])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }
    sub_1000102A0((uint64_t)&v9, (uint64_t)v11, &qword_100057E50);
    sub_1000102A0((uint64_t)v11, (uint64_t)&v9, &qword_100057E50);
    if (*((void *)&v10 + 1))
    {
      sub_10000847C(&qword_100057E58);
      if (swift_dynamicCast())
      {
        *(void *)&v7[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = v8;

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {

      sub_100018120((uint64_t)&v9, &qword_100057E50);
    }
  }
}

void sub_100020D6C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100020DD4(void *a1)
{
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000084C0(v2, (uint64_t)qword_100057C10);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BackgroundActivitySessionsController: connection interrupted, reconnecting", v5, 2u);
    swift_slowDealloc();
  }

  return [a1 activate];
}

uint64_t sub_100020ECC()
{
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084C0(v0, (uint64_t)qword_100057C10);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "BackgroundActivitySessionsController: connection invalidated", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  char v5 = *(void **)&Strong[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection];
  *(void *)&Strong[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection] = 0;

  id v6 = (char *)swift_unknownObjectUnownedLoadStrong();
  *(void *)&v6[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = 0;

  return swift_unknownObjectRelease();
}

uint64_t sub_100020FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_1000210E4(uint64_t a1)
{
  os_log_type_t v2 = v1;
  uint64_t v4 = sub_10000847C(&qword_1000572A8);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for APKDeviceLockState();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v29 - v12;
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_1000084C0(v14, (uint64_t)qword_100057C10);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v35 = a1;
  uint64_t v33 = v15;
  v15(v13, a1, v7);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    unint64_t v31 = v1;
    unint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    unint64_t v32 = v6;
    uint64_t v37 = v20;
    uint64_t v30 = v11;
    *(_DWORD *)unint64_t v19 = 136315138;
    v29[1] = v19 + 4;
    sub_100028618(&qword_100057DA0, (void (*)(uint64_t))&type metadata accessor for APKDeviceLockState);
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v36 = sub_10002D634(v21, v22, &v37);
    uint64_t v11 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Lock state changed to %s", v19, 0xCu);
    swift_arrayDestroy();
    id v6 = v32;
    swift_slowDealloc();
    os_log_type_t v2 = v31;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }

  uint64_t v23 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 1, 1, v23);
  v33(v11, v35, v7);
  type metadata accessor for MainActor();
  id v24 = v2;
  uint64_t v25 = static MainActor.shared.getter();
  unint64_t v26 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  BOOL v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = v25;
  *((void *)v27 + 3) = &protocol witness table for MainActor;
  *((void *)v27 + 4) = v24;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v27[v26], v11, v7);
  sub_100019898((uint64_t)v6, (uint64_t)&unk_100057D98, (uint64_t)v27);
  return swift_release();
}

uint64_t sub_1000214F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  uint64_t v6 = type metadata accessor for APKDeviceLockState();
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[10] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000215FC, v8, v7);
}

uint64_t sub_1000215FC()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v1 = (unint64_t)sub_1000264F4(v0[2]);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  os_log_type_t v2 = sub_1000264F4(v0[3]);
  swift_bridgeObjectRelease();
  sub_100023A04((unint64_t)v2);
  unint64_t v3 = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_12;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  unint64_t v19 = v3 & 0xC000000000000001;
  uint64_t v20 = v4;
  uint64_t v7 = v0[7];
  uint64_t v21 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  os_log_type_t v17 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v18 = v0;
  do
  {
    if (v19) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      swift_retain();
    }
    uint64_t v8 = v0[9];
    uint64_t v9 = v0[6];
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_100028618(&qword_100057DB8, (void (*)(uint64_t))&type metadata accessor for APKDeviceLockState);
    char v10 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v11 = *v21;
    (*v21)(v8, v9);
    if ((v10 & 1) == 0)
    {
      uint64_t v13 = v0[8];
      uint64_t v12 = v0[9];
      uint64_t v14 = v0[6];
      uint64_t v15 = *v17;
      (*v17)(v12, v0[5], v14);
      swift_getKeyPath();
      swift_getKeyPath();
      v15(v13, v12, v14);
      uint64_t v0 = v18;
      swift_retain();
      static Published.subscript.setter();
      v11(v12, v14);
    }
    swift_release();
    ++v6;
  }
  while (v20 != v6);
LABEL_12:
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_100021984()
{
  uint64_t v1 = type metadata accessor for APKDeviceLockState();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100021A58(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for APKDeviceLockState() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000A604;
  return sub_1000214F8(a1, v5, v6, v7, v8);
}

id sub_100021B54()
{
  id result = sub_100021B74();
  qword_100057C28 = (uint64_t)result;
  return result;
}

id sub_100021B74()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self interfaceWithIdentifier:v0];

  uint64_t v2 = self;
  id v3 = [v2 protocolForProtocol:&OBJC_PROTOCOL___APKActivityProgressUIServer];
  [v1 setServer:v3];

  id v4 = [v2 protocolForProtocol:&OBJC_PROTOCOL___APKActivityProgressUIClient];
  [v1 setClient:v4];

  [v1 setClientMessagingExpectation:0];
  return v1;
}

uint64_t sub_100021C80@<X0>(void *a1@<X8>)
{
  return sub_100021CBC(a1);
}

uint64_t sub_100021C94()
{
  return sub_100021D4C();
}

uint64_t sub_100021CA8@<X0>(void *a1@<X8>)
{
  return sub_100021CBC(a1);
}

uint64_t sub_100021CBC@<X0>(void *a1@<X8>)
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

uint64_t sub_100021D38()
{
  return sub_100021D4C();
}

uint64_t sub_100021D4C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100021DCC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100021E4C(void **a1)
{
  id v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_100021EC4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100021F44()
{
  return static Published.subscript.setter();
}

uint64_t sub_100021FB8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_100022034(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for APKDeviceLockState();
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
  static Published.subscript.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_1000221A4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100022224(void **a1)
{
  id v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_10002229C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100022378;
  return v6(a1);
}

uint64_t sub_100022378()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100022470(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_1000224A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000224D0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A604;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100057DA8 + dword_100057DA8);
  return v6(a1, v4);
}

uint64_t sub_100022588(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000847C((uint64_t *)&unk_100056F50);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000228A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000847C((uint64_t *)&unk_1000583C0);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100022BC8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10000847C((uint64_t *)&unk_100056F40);
  int v46 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_100022FEC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_10000847C(a3);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_100023300(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10002DDDC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10002EA38();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100022588(v15, a4 & 1);
  unint64_t v21 = sub_10002DDDC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100023470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10002DDDC(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10002EBF0();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000228A0(v17, a5 & 1);
  unint64_t v23 = sub_10002DDDC(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  *BOOL v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000235F8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_10002DF0C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10002EDB8();
    goto LABEL_7;
  }
  sub_100022BC8(v17, a3 & 1);
  unint64_t v23 = sub_10002DF0C(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10002394C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_1000237A0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1000237C0(a1, a2, a3, a4, (void (*)(void))sub_10002F050, &qword_1000583D0);
}

uint64_t sub_1000237C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  uint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_10002DDDC(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    char v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_release();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100022FEC(v19, a4 & 1, a6);
  unint64_t v25 = sub_10002DDDC(a2, a3);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  char v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 16 * v16);
  *uint64_t v27 = a2;
  v27[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v28 = v22[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v22[2] = v30;

  return swift_bridgeObjectRetain();
}

uint64_t sub_10002394C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_100023A04(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000262CC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_100023BD0(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      BOOL v18 = (void *)(v11 + 16 * v10);
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
  sub_1000254F0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void *sub_100023D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000847C((uint64_t *)&unk_100057F90);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v43 = (char *)v33 - v12;
  if (*(void *)(a2 + 16))
  {
    uint64_t v44 = a1;
    unint64_t v45 = 0;
    unint64_t v13 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (v13)
    {
      unint64_t v14 = 0;
      uint64_t v38 = (void (**)(char *, char *, uint64_t))(v8 + 32);
      uint64_t v39 = v8 + 48;
      int64_t v41 = (char *)(a2 + 56);
      uint64_t v42 = v8 + 16;
      Swift::Int v15 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v40 = v8 + 56;
      v33[1] = (v8 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v34 = v6;
      uint64_t v36 = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v37 = v8;
      while (1)
      {
        if (v14 >= v13) {
          __break(1u);
        }
        uint64_t v16 = *(void *)(v8 + 72);
        uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
        v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + v16 * v14, v7);
        unint64_t v45 = v14 + 1;
        BOOL v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
        v18(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
          break;
        }
        int64_t v35 = v18;
        (*v38)(v43, v6, v7);
        sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v19 = dispatch thunk of Hashable._rawHashValue(seed:)();
        uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
        unint64_t v21 = v19 & ~v20;
        if ((*(void *)&v41[(v21 >> 3) & 0xFFFFFFFFFFFFFF8] >> v21))
        {
          uint64_t v22 = a2;
          uint64_t v23 = ~v20;
          while (1)
          {
            v17(v11, *(void *)(v22 + 48) + v21 * v16, v7);
            sub_100028618(&qword_100057B70, (void (*)(uint64_t))&type metadata accessor for UUID);
            char v24 = dispatch thunk of static Equatable.== infix(_:_:)();
            unint64_t v25 = *v15;
            (*v15)(v11, v7);
            if (v24) {
              break;
            }
            unint64_t v21 = (v21 + 1) & v23;
            if (((*(void *)&v41[(v21 >> 3) & 0xFFFFFFFFFFFFFF8] >> v21) & 1) == 0)
            {
              a2 = v22;
              unint64_t v6 = v34;
              goto LABEL_12;
            }
          }
          uint64_t isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v25)(v43, v7);
          char v27 = *(unsigned char *)(v22 + 32);
          unint64_t v28 = (unint64_t)((1 << v27) + 63) >> 6;
          size_t v29 = 8 * v28;
          if ((v27 & 0x3Fu) <= 0xD
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            __chkstk_darwin(isStackAllocationSafe);
            memcpy((char *)v33 - ((v29 + 15) & 0x3FFFFFFFFFFFFFF0), v41, v29);
            uint64_t v30 = sub_1000249E0((void *)((char *)v33 - ((v29 + 15) & 0x3FFFFFFFFFFFFFF0)), v28, v22, v21, &v44);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v31 = (void *)swift_slowAlloc();
            memcpy(v31, v41, v29);
            uint64_t v30 = sub_1000249E0((unint64_t *)v31, v28, v22, v21, &v44);
            swift_release();
            swift_bridgeObjectRelease();
            swift_slowDealloc();
          }
          return v30;
        }
        unint64_t v25 = *v15;
LABEL_12:
        v25(v43, v7);
        a1 = v44;
        unint64_t v14 = v45;
        unint64_t v13 = *(void *)(v44 + 16);
        uint64_t v8 = v37;
        if (v45 == v13)
        {
          v35(v6, 1, 1, v7);
          break;
        }
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    }
    swift_bridgeObjectRelease();
    sub_100018120((uint64_t)v6, (uint64_t *)&unk_100057F90);
  }
  else
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
  return (void *)a2;
}

uint64_t sub_100024304()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  int64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_10000847C(&qword_100057FA8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    int64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      char v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_100024700()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000847C(&qword_100057FA0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v30 = -1 << v29;
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
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

void *sub_1000249E0(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v43 = a2;
  uint64_t v10 = sub_10000847C((uint64_t *)&unk_100057F90);
  __chkstk_darwin(v10 - 8);
  unint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = __chkstk_darwin(v13);
  int64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (void *)__chkstk_darwin(v14);
  uint64_t v20 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v44 = a1;
  uint64_t v45 = v20 - 1;
  uint64_t v21 = *a5;
  unint64_t v22 = a5[1];
  unint64_t v23 = *(void *)(*a5 + 16);
  uint64_t v54 = a3;
  if (v22 == v23)
  {
    uint64_t v24 = v43;
    uint64_t v25 = v45;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v12, 1, 1, v13);
LABEL_22:
    sub_100018120((uint64_t)v12, (uint64_t *)&unk_100057F90);
    uint64_t v41 = v54;
    swift_retain();
    return (void *)sub_100024EC4(v44, v24, v25, v41);
  }
  uint64_t v42 = v5;
  uint64_t v53 = v19 + 56;
  uint64_t v52 = v19 + 48;
  uint64_t v50 = a5;
  uint64_t v51 = (void (**)(char *, char *, uint64_t))(v19 + 32);
  uint64_t v55 = a3 + 56;
  uint64_t v56 = v19 + 16;
  char v57 = (void (**)(char *, uint64_t))(v19 + 8);
  uint64_t v26 = v19;
  int v46 = v12;
  uint64_t v49 = v19;
  id v58 = (char *)&v42 - v18;
  while (v22 < v23)
  {
    uint64_t v28 = *(void *)(v26 + 72);
    uint64_t v29 = *(void (**)(char *, unint64_t, uint64_t))(v26 + 16);
    v29(v12, v21 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80)) + v28 * v22, v13);
    a5[1] = v22 + 1;
    uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
    v48(v12, 0, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v12, 1, v13) == 1)
    {
      uint64_t v24 = v43;
      uint64_t v25 = v45;
      goto LABEL_22;
    }
    (*v51)(v58, v12, v13);
    uint64_t v30 = v54;
    sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v31 = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v32 = v30;
    uint64_t v33 = -1 << *(unsigned char *)(v30 + 32);
    unint64_t v34 = v31 & ~v33;
    if (((*(void *)(v55 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
    {
      BOOL v27 = *v57;
LABEL_5:
      uint64_t result = (void *)((uint64_t (*)(char *, uint64_t))v27)(v58, v13);
      goto LABEL_6;
    }
    uint64_t v47 = (unint64_t)v57 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v35 = v32;
    uint64_t v36 = ~v33;
    while (1)
    {
      v29(v16, *(void *)(v35 + 48) + v34 * v28, v13);
      sub_100028618(&qword_100057B70, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v37 = dispatch thunk of static Equatable.== infix(_:_:)();
      BOOL v27 = *v57;
      (*v57)(v16, v13);
      if (v37) {
        break;
      }
      unint64_t v34 = (v34 + 1) & v36;
      if (((*(void *)(v55 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
      {
        unint64_t v12 = v46;
        goto LABEL_5;
      }
    }
    uint64_t result = (void *)((uint64_t (*)(char *, uint64_t))v27)(v58, v13);
    uint64_t v38 = (v34 >> 3) & 0x1FFFFFFFFFFFFFF8;
    uint64_t v39 = *(unint64_t *)((char *)v44 + v38);
    *(unint64_t *)((char *)v44 + v38) = v39 & ~(1 << v34);
    if ((v39 & (1 << v34)) == 0)
    {
      unint64_t v12 = v46;
LABEL_6:
      uint64_t v26 = v49;
      a5 = v50;
      goto LABEL_7;
    }
    uint64_t v40 = v45 - 1;
    uint64_t v26 = v49;
    a5 = v50;
    if (__OFSUB__(v45, 1)) {
      goto LABEL_24;
    }
    unint64_t v12 = v46;
    --v45;
    if (!v40) {
      return &_swiftEmptySetSingleton;
    }
LABEL_7:
    uint64_t v21 = *a5;
    unint64_t v22 = a5[1];
    unint64_t v23 = *(void *)(*a5 + 16);
    if (v22 == v23)
    {
      uint64_t v24 = v43;
      uint64_t v25 = v45;
      v48(v12, 1, 1, v13);
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_100024EC4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v34 = a1;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v37 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_10000847C(&qword_100057FA8);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v10 = result;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v34;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  uint64_t v35 = (uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32);
  uint64_t v36 = v37 + 16;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v33)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v34[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v33) {
          goto LABEL_37;
        }
        unint64_t v18 = v34[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v33) {
            goto LABEL_37;
          }
          unint64_t v18 = v34[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v33) {
              goto LABEL_37;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_37;
                }
                unint64_t v18 = v34[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = a4;
    uint64_t v21 = *(void *)(a4 + 48);
    uint64_t v22 = *(void *)(v37 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v37 + 16))(v9, v21 + v22 * v16, v7);
    sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v23 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v14 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v14 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    uint64_t result = (*v35)(*(void *)(v10 + 48) + v26 * v22, v9, v7);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v20;
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100025250(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100024304();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10002568C();
      goto LABEL_12;
    }
    sub_100025AE4();
  }
  uint64_t v12 = *v3;
  sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_100028618(&qword_100057B70, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

Swift::Int sub_1000254F0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100024700();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100025930();
      goto LABEL_22;
    }
    sub_100025E94();
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
    uint64_t v15 = (void *)(v14 + 16 * a3);
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
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
  char v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
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

void *sub_10002568C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000847C(&qword_100057FA8);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_100025930()
{
  uint64_t v1 = v0;
  sub_10000847C(&qword_100057FA0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_100025AE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_10000847C(&qword_100057FA8);
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  unint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_100028618(&qword_100057AE0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100025E94()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000847C(&qword_100057FA0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
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

void (*sub_100026144(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000261F4(v6, a2, a3);
  return sub_1000261AC;
}

void sub_1000261AC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_1000261F4(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_100026274;
  }
  __break(1u);
  return result;
}

uint64_t sub_100026274()
{
  return swift_release();
}

uint64_t sub_10002627C@<X0>(void *a1@<X8>)
{
  return sub_10001AFE4(a1);
}

uint64_t sub_1000262A4(uint64_t a1, void **a2)
{
  return sub_10001B074(a1, a2);
}

uint64_t sub_1000262CC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100008AC8(&qword_100057DC8, &qword_100057DC0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000847C(&qword_100057DC0);
          unint64_t v12 = sub_100026144(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for BackgroundActivitySession();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_1000264F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000847C(&qword_100057DD0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_100026640((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100026638();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_1000265E0@<X0>(void *a1@<X8>)
{
  return sub_10001AFE4(a1);
}

uint64_t sub_100026608(uint64_t a1, void **a2)
{
  return sub_10001B074(a1, a2);
}

uint64_t sub_100026638()
{
  return swift_release();
}

uint64_t sub_100026640(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *int64_t v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10002684C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_10002692C;
  return v5(v2 + 16);
}

uint64_t sub_10002692C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  void *v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100026A5C(uint64_t a1, uint64_t a2)
{
  v2[19] = a1;
  v2[20] = a2;
  sub_10000847C(&qword_1000572A8);
  v2[21] = swift_task_alloc();
  v2[22] = type metadata accessor for MainActor();
  v2[23] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[24] = v4;
  v2[25] = v3;
  return _swift_task_switch(sub_100026B28, v4, v3);
}

uint64_t sub_100026B28()
{
  id v1 = [self imageDescriptorNamed:kISImageDescriptorHomeScreen];
  v0[26] = v1;
  id v2 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithType:v3];
  v0[27] = v4;

  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100026CC4;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10001D968;
  v0[13] = &unk_10004E5F0;
  v0[14] = v5;
  [v4 getImageForImageDescriptor:v1 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100026CC4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  uint64_t v2 = *(void *)(*(void *)v0 + 192);
  return _swift_task_switch(sub_100026DCC, v2, v1);
}

uint64_t sub_100026DCC()
{
  uint64_t v1 = (void *)v0[15];
  v0[28] = v1;
  if (!v1) {
    goto LABEL_4;
  }
  id v2 = v1;
  if ([v2 placeholder])
  {

LABEL_4:
    uint64_t v4 = (void *)v0[26];
    NSString v3 = (void *)v0[27];
    uint64_t v5 = v0[21];
    uint64_t v6 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
    id v7 = v3;
    id v8 = v4;
    uint64_t v9 = static MainActor.shared.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = &protocol witness table for MainActor;
    v10[4] = v7;
    v10[5] = v8;
    uint64_t v11 = sub_100019A44(v5, (uint64_t)&unk_100057EC8, (uint64_t)v10);
    v0[29] = v11;
    int64_t v12 = (void *)swift_task_alloc();
    v0[30] = v12;
    uint64_t v13 = sub_10000847C(&qword_100057ED0);
    *int64_t v12 = v0;
    v12[1] = sub_100027028;
    int64_t v14 = v0 + 16;
    uint64_t v15 = v11;
    return Task<>.value.getter(v14, v15, v13);
  }
  swift_release();
  id v16 = [v2 CGImage];
  if (!v16)
  {

    __break(1u);
    return Task<>.value.getter(v14, v15, v13);
  }
  int64_t v17 = v16;
  int64_t v19 = (void *)v0[26];
  unint64_t v18 = (void *)v0[27];
  [v2 scale];
  id v21 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v17 scale:0 orientation:v20];

  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(id))v0[1];
  return v22(v21);
}

uint64_t sub_100027028()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 200);
  uint64_t v3 = *(void *)(v1 + 192);
  return _swift_task_switch(sub_10002716C, v3, v2);
}

void sub_10002716C()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 224);
  swift_release();

  uint64_t v2 = *(void **)(v0 + 128);
  if (v2)
  {
    id v3 = v2;
    if ([v3 placeholder])
    {
      if (qword_100056D20 != -1) {
        swift_once();
      }
      uint64_t v4 = type metadata accessor for Logger();
      sub_1000084C0(v4, (uint64_t)qword_100057C10);
      swift_bridgeObjectRetain_n();
      uint64_t v5 = Logger.logObject.getter();
      os_log_type_t v6 = static os_log_type_t.error.getter();
      BOOL v7 = os_log_type_enabled(v5, v6);
      unint64_t v8 = *(void *)(v0 + 160);
      if (v7)
      {
        uint64_t v25 = *(void *)(v0 + 152);
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 144) = sub_10002D634(v25, v8, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Final image for type %s is still a placeholder", v9, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    id v19 = [v3 CGImage];
    if (!v19)
    {

      __break(1u);
      return;
    }
    double v20 = v19;
    uint64_t v22 = *(void **)(v0 + 208);
    id v21 = *(void **)(v0 + 216);
    [v3 scale];
    id v18 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v20 scale:0 orientation:v23];
  }
  else
  {
    if (qword_100056D20 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_1000084C0(v10, (uint64_t)qword_100057C10);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    int64_t v14 = *(void **)(v0 + 208);
    unint64_t v15 = *(void *)(v0 + 160);
    if (v13)
    {
      uint64_t v16 = *(void *)(v0 + 152);
      unint64_t v26 = *(void **)(v0 + 216);
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)int64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = sub_10002D634(v16, v15, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Could not prepare image for type %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v18 = 0;
  }
  swift_task_dealloc();
  uint64_t v24 = *(void (**)(id))(v0 + 8);
  v24(v18);
}

void sub_1000275C8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100056D20 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000084C0(v4, (uint64_t)qword_100057C10);
  id v5 = a1;
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v25 = v1;
    *(_DWORD *)unint64_t v8 = 138412290;
    aBlock[0] = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BackgroundActivitySessionsController received a connection! %@", v8, 0xCu);
    sub_10000847C(&qword_100057E60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (qword_100056D30 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_100057C28;
  id v12 = [v5 remoteProcess:v25];
  NSString v13 = String._bridgeToObjectiveC()();
  unsigned int v14 = [v12 hasEntitlement:v13];

  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v2;
    *(void *)(v15 + 24) = v11;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_100027AE4;
    *(void *)(v16 + 24) = v15;
    aBlock[4] = sub_100027AFC;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001BA6C;
    aBlock[3] = &unk_10004E460;
    int64_t v17 = _Block_copy(aBlock);
    id v18 = v2;
    id v19 = v11;
    swift_retain();
    swift_release();
    [v5 configureConnection:v17];
    _Block_release(v17);
    LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v17 & 1) == 0)
    {
      [v5 activate];
      double v20 = *(void **)&v18[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection];
      *(void *)&v18[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection] = v5;
      id v21 = v5;

      if ([v21 remoteTarget])
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
      }
      sub_1000102A0((uint64_t)&v27, (uint64_t)aBlock, &qword_100057E50);
      sub_1000102A0((uint64_t)aBlock, (uint64_t)&v27, &qword_100057E50);
      if (*((void *)&v28 + 1))
      {
        sub_10000847C(&qword_100057E58);
        if (swift_dynamicCast())
        {
          *(void *)&v18[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = v26;
LABEL_21:
          swift_release();
          swift_unknownObjectRelease();
          return;
        }
      }
      else
      {
        sub_100018120((uint64_t)&v27, &qword_100057E50);
      }
      *(void *)&v18[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = 0;
      goto LABEL_21;
    }
    __break(1u);
  }
  else
  {
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "BackgroundActivitySessionsController got a connection from an un-entitled process!", v24, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100027AA4()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100027AE4(void *a1)
{
  sub_100020900(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100027AEC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100027AFC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100027B24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100027B34()
{
  return swift_release();
}

uint64_t sub_100027B3C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100027B74(void *a1)
{
}

uint64_t sub_100027B7C()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100027BB4()
{
  return sub_100020ECC();
}

uint64_t sub_100027BBC()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100027CDC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v4;
  uint64_t v10 = *(void *)((char *)v1 + v5);
  uint64_t v11 = *(void *)((char *)v1 + v5 + 8);
  uint64_t v12 = *(void *)((char *)v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  NSString v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *NSString v13 = v2;
  v13[1] = sub_10000A604;
  return sub_10001FCBC(a1, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_100027E4C@<X0>(void *a1@<X8>)
{
  return sub_100021CBC(a1);
}

uint64_t sub_100027E74()
{
  return sub_100021D4C();
}

uint64_t sub_100027E9C@<X0>(void *a1@<X8>)
{
  return sub_100021CBC(a1);
}

uint64_t sub_100027EC4()
{
  return sub_100021D4C();
}

uint64_t sub_100027EF0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000A604;
  return sub_10001F2AC(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_10002801C()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v7 = v3 | 7;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((((((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 16, v7);
}

uint64_t sub_100028170(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = v1[3];
  uint64_t v15 = v1[2];
  uint64_t v12 = (uint64_t)v1 + v4;
  uint64_t v13 = v1[4];
  uint64_t v7 = *(void *)((char *)v1 + v5);
  uint64_t v8 = *(void *)((char *)v1 + v6);
  uint64_t v9 = *(void *)((char *)v1 + v6 + 8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_10000A2EC;
  return sub_10001DFB0(a1, v15, v14, v13, v12, v7, v8, v9);
}

uint64_t sub_100028310()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100028408()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100028450(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000A604;
  return sub_10001D9CC(a1, v4, v5, v7, v6);
}

uint64_t sub_100028510()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028548(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A2EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100057ED8 + dword_100057ED8);
  return v6(a1, v4);
}

id sub_100028600(void *a1)
{
  return sub_10001B9AC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100028608()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028618(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t View.systemApertureAccessoryLayoutMode(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_1000286C0@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LayoutSubviews();
  sub_10002B624(&qword_1000581C8, (void (*)(uint64_t))&type metadata accessor for LayoutSubviews);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  if (v9[4] == v9[0])
  {
    uint64_t v2 = type metadata accessor for LayoutSubview();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    uint64_t v4 = (void (*)(void *, void))dispatch thunk of Collection.subscript.read();
    uint64_t v6 = v5;
    uint64_t v7 = type metadata accessor for LayoutSubview();
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

uint64_t sub_10002885C(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return *(unsigned __int8 *)(a1 + 16) ^ *(unsigned __int8 *)(a2 + 16) ^ 1u;
  }
  return 0;
}

double sub_100028898@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_10002891C(double *a1, double *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return static EdgeInsets.== infix(_:_:)(a1[2], a1[3], a1[4], a1[5], a2[2], a2[3], a2[4], a2[5]);
  }
  else {
    return 0;
  }
}

uint64_t sub_10002894C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000289C4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityProgressUI29APUISystemApertureLayoutState__metrics;
  uint64_t v2 = sub_10000847C(&qword_100058180);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18ActivityProgressUI29APUISystemApertureLayoutState__context;
  uint64_t v4 = sub_10000847C(&qword_100058188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_100028AB0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for APUISystemApertureLayoutState();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100028AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static DynamicProperty._makeProperty<A>(in:container:fieldOffset:inputs:)(a1, a2, a3, a4, a6, a5);
}

uint64_t sub_100028B08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v48 = a2;
  uint64_t v49 = sub_10000847C(&qword_100058110);
  __chkstk_darwin(v49);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000847C(&qword_100058118);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000847C(&qword_100058120);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  int v46 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = *(void *)v2;
  char v15 = *(unsigned char *)(v2 + 8);
  sub_10002A1A8(*(void *)v2, v15);
  char v16 = sub_10002A738(v14, v15);
  sub_10002A1B8(v14, v15);
  if ((v16 & 1) == 0)
  {
    long long v24 = *(_OWORD *)(v2 + 32);
    long long v54 = *(_OWORD *)(v2 + 16);
    long long v55 = v24;
    uint64_t v57 = *(void *)(v2 + 16);
    char v58 = *(unsigned char *)(v2 + 24);
    long long v56 = v24;
    int v46 = *(char **)(v2 + 56);
    uint64_t v25 = (_OWORD *)swift_allocObject();
    long long v26 = *(_OWORD *)(v2 + 16);
    v25[1] = *(_OWORD *)v2;
    v25[2] = v26;
    long long v27 = *(_OWORD *)(v2 + 48);
    v25[3] = *(_OWORD *)(v2 + 32);
    v25[4] = v27;
    uint64_t v28 = sub_10000847C(&qword_100058128);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v4, v47, v28);
    uint64_t v29 = &v4[*(int *)(v49 + 36)];
    *(void *)uint64_t v29 = 0;
    *((void *)v29 + 1) = 0;
    *((void *)v29 + 2) = sub_10002A940;
    *((void *)v29 + 3) = v25;
    sub_100008CFC((uint64_t)v4, (uint64_t)v7, &qword_100058110);
    swift_storeEnumTagMultiPayload();
    sub_10002A1A8(v14, v15);
    sub_10002A968((uint64_t)&v57);
    sub_10002A998((uint64_t)&v56);
    uint64_t v30 = sub_100008AC8(&qword_100058130, &qword_100058128);
    unint64_t v31 = sub_10002A9C4();
    swift_retain();
    uint64_t v50 = v28;
    uint64_t v51 = &type metadata for APUISystemApertureLayoutState.Context;
    uint64_t v52 = v30;
    unint64_t v53 = v31;
    swift_getOpaqueTypeConformance2();
    sub_10002AA18();
    _ConditionalContent<>.init(storage:)();
    return sub_100018120((uint64_t)v4, &qword_100058110);
  }
  uint64_t v43 = v13;
  uint64_t v44 = v9;
  uint64_t v45 = v5;
  uint64_t v42 = v7;
  uint64_t v17 = *(void *)(v2 + 16);
  uint64_t v18 = *(void *)(v2 + 32);
  id v19 = *(ValueMetadata **)(v2 + 40);
  char v20 = *(unsigned char *)(v2 + 24) & 1;
  sub_10002A1A8(v17, v20);
  char v21 = sub_10002A738(v17, v20);
  sub_10002A1B8(v17, v20);
  if (v21)
  {
    if (!v18)
    {
      type metadata accessor for APUISystemApertureLayoutState();
      sub_10002B624((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
      uint64_t result = EnvironmentObject.error()();
      __break(1u);
      return result;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    long long v22 = v54;
    char v23 = v55;
  }
  else
  {
    char v23 = 0;
    long long v22 = 0uLL;
  }
  long long v54 = v22;
  LOBYTE(v55) = v23;
  uint64_t v50 = v18;
  uint64_t v51 = v19;
  uint64_t v33 = (_OWORD *)swift_allocObject();
  long long v34 = *(_OWORD *)(v2 + 16);
  v33[1] = *(_OWORD *)v2;
  void v33[2] = v34;
  long long v35 = *(_OWORD *)(v2 + 48);
  v33[3] = *(_OWORD *)(v2 + 32);
  v33[4] = v35;
  sub_10002A1A8(v14, v15);
  sub_10002A1A8(v17, v20);
  sub_10002A998((uint64_t)&v50);
  swift_retain();
  uint64_t v36 = sub_10000847C(&qword_100058128);
  uint64_t v37 = sub_100008AC8(&qword_100058130, &qword_100058128);
  unint64_t v38 = sub_10002A9C4();
  uint64_t v39 = v46;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  uint64_t v41 = v43;
  uint64_t v40 = v44;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v39, v8);
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v42, v41, v8);
  swift_storeEnumTagMultiPayload();
  *(void *)&long long v54 = v36;
  *((void *)&v54 + 1) = &type metadata for APUISystemApertureLayoutState.Context;
  *(void *)&long long v55 = v37;
  *((void *)&v55 + 1) = v38;
  swift_getOpaqueTypeConformance2();
  sub_10002AA18();
  _ConditionalContent<>.init(storage:)();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v41, v8);
}

uint64_t sub_100029118()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t View.onDismiss(_:)()
{
  return swift_release();
}

uint64_t type metadata accessor for APUISystemApertureLayoutState()
{
  uint64_t result = qword_100057FF8;
  if (!qword_100057FF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000292B4(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v6 = sub_10000847C(&qword_1000581C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for LayoutSubview();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v14[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000286C0((uint64_t)v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_100018120((uint64_t)v8, &qword_1000581C0);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v12, v8, v9);
  v14[24] = a2 & 1;
  v14[16] = a4 & 1;
  LayoutSubview.sizeThatFits(_:)();
  static UnitPoint.topLeading.getter();
  v14[8] = 0;
  v14[0] = 0;
  LayoutSubview.place(at:anchor:proposal:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
}

double sub_1000294D8(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_10002B66C(a1, a2 & 1, a3, a4 & 1);
}

uint64_t sub_1000294F0(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_1000292B4(a1, a2 & 1, a3, a4 & 1);
}

uint64_t sub_100029508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100029578(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_100029540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100029578(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_100029578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_1000295BC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_10002962C;
}

void sub_10002962C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_100029678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a1;
  uint64_t v28 = a6;
  uint64_t v9 = sub_10000847C(&qword_100058148);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000847C(&qword_100058150);
  __chkstk_darwin(v13);
  char v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000847C(&qword_100058158);
  __chkstk_darwin(v27);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3 &= 1u;
  sub_10002A1A8(a2, a3);
  char v18 = sub_10002A738(a2, a3);
  sub_10002A1B8(a2, a3);
  if (v18)
  {
    if (!a4)
    {
      type metadata accessor for APUISystemApertureLayoutState();
      sub_10002B624((unint64_t *)&qword_100057380, (void (*)(uint64_t))type metadata accessor for APUISystemApertureLayoutState);
      uint64_t result = EnvironmentObject.error()();
      __break(1u);
      return result;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    v20.n128_u64[0] = v29;
    v19.n128_u64[0] = 1.0;
    if (*(double *)&v29 >= 1.0)
    {
      v20.n128_u64[0] = *((void *)&v29 + 1);
      if (*((double *)&v29 + 1) >= 1.0)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        long long v21 = v30;
        long long v22 = v31;
        *(_OWORD *)uint64_t v17 = v29;
        *((_OWORD *)v17 + 1) = v21;
        *((_OWORD *)v17 + 2) = v22;
        (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(&v17[*(int *)(v27 + 44)], v26, v9);
        sub_100008CFC((uint64_t)v17, (uint64_t)v15, &qword_100058158);
        swift_storeEnumTagMultiPayload();
        sub_10002AD6C();
        sub_100008AC8(&qword_100058178, &qword_100058148);
        _ConditionalContent<>.init(storage:)();
        return sub_100018120((uint64_t)v17, &qword_100058158);
      }
    }
  }
  long long v24 = *(void (**)(char *, uint64_t, uint64_t, __n128, __n128))(v10 + 16);
  v24(v12, v26, v9, v19, v20);
  ((void (*)(char *, char *, uint64_t))v24)(v15, v12, v9);
  swift_storeEnumTagMultiPayload();
  sub_10002AD6C();
  sub_100008AC8(&qword_100058178, &qword_100058148);
  _ConditionalContent<>.init(storage:)();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100029A90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100029678(a1, *(void *)v2, *(unsigned char *)(v2 + 8), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

BOOL static APUISystemApertureVerticalPlacement.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void APUISystemApertureVerticalPlacement.hash(into:)(uint64_t a1, char a2)
{
}

BOOL sub_100029AE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_100029B00()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int _s18ActivityProgressUI37APUISystemApertureAccessoryLayoutModeO9hashValueSivg_0(char a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_100029B78()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_100029BC0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t View.systemApertureVerticalPlacement(_:)()
{
  return swift_release();
}

unint64_t sub_100029CE0()
{
  unint64_t result = qword_100057FB0;
  if (!qword_100057FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057FB0);
  }
  return result;
}

unint64_t sub_100029D38()
{
  unint64_t result = qword_100057FB8;
  if (!qword_100057FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057FB8);
  }
  return result;
}

uint64_t sub_100029D8C()
{
  return type metadata accessor for APUISystemApertureLayoutState();
}

void sub_100029D94()
{
  sub_100016D44(319, &qword_100058008);
  if (v0 <= 0x3F)
  {
    sub_100016D44(319, (unint64_t *)&unk_100058010);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for APUISystemApertureVerticalPlacement(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_100029E90(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100029E98(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureVerticalPlacement()
{
  return &type metadata for APUISystemApertureVerticalPlacement;
}

uint64_t _s18ActivityProgressUI35APUISystemApertureVerticalPlacementOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s18ActivityProgressUI35APUISystemApertureVerticalPlacementOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x10002A010);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureAccessoryLayoutMode()
{
  return &type metadata for APUISystemApertureAccessoryLayoutMode;
}

uint64_t sub_10002A048(uint64_t a1)
{
  return sub_10002A0E4(a1, (uint64_t)&type metadata for APUISystemApertureDismissalModifier, (void (*)(void))sub_10002A068);
}

unint64_t sub_10002A068()
{
  unint64_t result = qword_100058100;
  if (!qword_100058100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058100);
  }
  return result;
}

uint64_t sub_10002A0BC(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_10002A0C4(uint64_t a1)
{
  return sub_10002A0E4(a1, (uint64_t)&type metadata for APUISystemApertureVerticalPlacementViewModifier, (void (*)(void))sub_10002A154);
}

uint64_t sub_10002A0E4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

unint64_t sub_10002A154()
{
  unint64_t result = qword_100058108;
  if (!qword_100058108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058108);
  }
  return result;
}

uint64_t sub_10002A1A8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10002A1B8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureVerticalPlacementViewModifier()
{
  return &type metadata for APUISystemApertureVerticalPlacementViewModifier;
}

uint64_t destroy for APUISystemApertureDismissalModifier(uint64_t a1)
{
  sub_10002A1B8(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_10002A1B8(*(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_10002A1A8(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  sub_10002A1A8(v6, v7);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_10002A1A8(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002A1B8(v6, v7);
  uint64_t v8 = *(void *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 24);
  sub_10002A1A8(v8, v9);
  uint64_t v10 = *(void *)(a1 + 16);
  char v11 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = v9;
  sub_10002A1B8(v10, v11);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v12;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002A1B8(v6, v7);
  char v8 = *((unsigned char *)a2 + 24);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = v8;
  sub_10002A1B8(v9, v10);
  *(void *)(a1 + 32) = a2[4];
  swift_release();
  *(void *)(a1 + 40) = a2[5];
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureDismissalModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureDismissalModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureDismissalModifier()
{
  return &type metadata for APUISystemApertureDismissalModifier;
}

__n128 initializeBufferWithCopyOfBuffer for APUISystemApertureLayoutState.Context(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureLayoutState.Context(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureLayoutState.Context(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureLayoutState.Context()
{
  return &type metadata for APUISystemApertureLayoutState.Context;
}

__n128 initializeWithCopy for APUISystemApertureLayoutState.Metrics(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureLayoutState.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureLayoutState.Metrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureLayoutState.Metrics()
{
  return &type metadata for APUISystemApertureLayoutState.Metrics;
}

uint64_t sub_10002A5F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002A610()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_10002A62C@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_10002A6B4()
{
  return static Published.subscript.setter();
}

uint64_t sub_10002A738(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  uint64_t v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    char v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)char v11 = 136315138;
    uint64_t v13 = sub_10002D634(1819242306, 0xE400000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_10002A1B8(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_10002A940()
{
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_10002A968(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002A998(uint64_t a1)
{
  return a1;
}

unint64_t sub_10002A9C4()
{
  unint64_t result = qword_100058138;
  if (!qword_100058138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058138);
  }
  return result;
}

unint64_t sub_10002AA18()
{
  unint64_t result = qword_100058140;
  if (!qword_100058140)
  {
    sub_10000877C(&qword_100058110);
    sub_100008AC8(&qword_100058130, &qword_100058128);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058140);
  }
  return result;
}

uint64_t sub_10002AABC()
{
  sub_10002A1B8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  sub_10002A1B8(*(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10002AB14(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 == 3 && *(unsigned char *)(a2 + 16) != 0) {
    return (*(uint64_t (**)(void))(v2 + 64))();
  }
  return result;
}

uint64_t sub_10002AB58(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_unknownObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = static os_log_type_t.fault.getter();
    uint64_t v9 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      char v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)char v11 = 136315138;
      uint64_t v13 = sub_10002D634(0xD00000000000002FLL, 0x80000001000429D0, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_10002AE38(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

unint64_t sub_10002AD6C()
{
  unint64_t result = qword_100058160;
  if (!qword_100058160)
  {
    sub_10000877C(&qword_100058158);
    sub_100008AC8(&qword_100058168, &qword_100058170);
    sub_100008AC8(&qword_100058178, &qword_100058148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058160);
  }
  return result;
}

uint64_t sub_10002AE38(uint64_t a1, char a2)
{
  if (a2) {
    return swift_unknownObjectRelease();
  }
  else {
    return swift_release();
  }
}

id sub_10002AE44(void *a1)
{
  id v2 = [a1 activeLayoutMode];
  id result = [a1 view];
  if (result)
  {
    uint64_t v4 = result;
    id v5 = [result SBUISA_systemApertureObstructedAreaLayoutGuide];

    [v5 layoutFrame];
    double v7 = v6;
    double v9 = v8;

    if (v2 == (id)4)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      if (v21[0] != v7 || v21[1] != v9)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        char v11 = (void (*)(double *, void))static Published.subscript.modify();
        *uint64_t v12 = v7;
        v12[1] = v9;
        v11(v21, 0);
        swift_release();
        swift_release();
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    id result = (id)swift_release();
    if (*(id *)&v21[0] != v2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v13 = (void (*)(double *, void))static Published.subscript.modify();
      *uint64_t v14 = v2;
      v13(v21, 0);
      swift_release();
      swift_release();
      id v15 = objc_msgSend(objc_msgSend(a1, "systemApertureElementContext"), "transitionContext");
      id result = (id)swift_unknownObjectRelease();
      if (v15)
      {
        id v16 = [v15 fromLayoutMode];
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v17 = (void (*)(double *, void))static Published.subscript.modify();
        *(void *)(v18 + 8) = v16;
        v17(v21, 0);
        swift_release();
        swift_release();
        LOBYTE(v16) = [v15 isUserInitiated];
        swift_getKeyPath();
        swift_getKeyPath();
        __n128 v19 = (void (*)(double *, void))static Published.subscript.modify();
        *(unsigned char *)(v20 + 16) = (_BYTE)v16;
        v19(v21, 0);

        swift_release();
        return (id)swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureVerticalPlacementLayout()
{
  return &type metadata for APUISystemApertureVerticalPlacementLayout;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwxx_0(uint64_t a1)
{
  sub_10002A1B8(*(void *)a1, *(unsigned char *)(a1 + 8));

  return swift_release();
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_10002A1A8(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_retain();
  return a1;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_10002A1A8(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002A1B8(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwta_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002A1B8(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)id result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureLayoutMode()
{
  return &type metadata for APUISystemApertureLayoutMode;
}

unint64_t sub_10002B3E0()
{
  unint64_t result = qword_100058190;
  if (!qword_100058190)
  {
    sub_10000877C(&qword_100058198);
    sub_10000877C(&qword_100058128);
    sub_100008AC8(&qword_100058130, &qword_100058128);
    sub_10002A9C4();
    swift_getOpaqueTypeConformance2();
    sub_10002AA18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058190);
  }
  return result;
}

unint64_t sub_10002B4D4()
{
  unint64_t result = qword_1000581A0;
  if (!qword_1000581A0)
  {
    sub_10000877C(&qword_1000581A8);
    sub_10002AD6C();
    sub_100008AC8(&qword_100058178, &qword_100058148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000581A0);
  }
  return result;
}

unint64_t sub_10002B578()
{
  unint64_t result = qword_1000581B0;
  if (!qword_1000581B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000581B0);
  }
  return result;
}

unint64_t sub_10002B5D0()
{
  unint64_t result = qword_1000581B8;
  if (!qword_1000581B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000581B8);
  }
  return result;
}

uint64_t sub_10002B624(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_10002B66C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v6 = sub_10000847C(&qword_1000581C0);
  __chkstk_darwin(v6 - 8);
  double v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for LayoutSubview();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000286C0((uint64_t)v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100018120((uint64_t)v8, &qword_1000581C0);
    return 0.0;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v16[8] = a2 & 1;
    v16[0] = a4 & 1;
    LayoutSubview.sizeThatFits(_:)();
    double v13 = v14;
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v13;
}

uint64_t sub_10002B874()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_1000581D0);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_1000581D0);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t APUIRemoteAlertPresentationRequest.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t APUIRemoteAlertPresentationRequest.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.id.modify())()
{
  return nullsub_1;
}

id APUIRemoteAlertPresentationRequest.viewControllerToPresent.getter()
{
  return *(id *)(v0 + 16);
}

void APUIRemoteAlertPresentationRequest.viewControllerToPresent.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t (*APUIRemoteAlertPresentationRequest.viewControllerToPresent.modify())()
{
  return nullsub_1;
}

uint64_t APUIRemoteAlertPresentationRequest.animated.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t APUIRemoteAlertPresentationRequest.animated.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.animated.modify())()
{
  return nullsub_1;
}

uint64_t APUIRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t APUIRemoteAlertPresentationRequest.contentOverlaysStatusBar.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.contentOverlaysStatusBar.modify())()
{
  return nullsub_1;
}

uint64_t APUIRemoteAlertPresentationRequest.supportedInterfaceOrientations.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t APUIRemoteAlertPresentationRequest.supportedInterfaceOrientations.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.supportedInterfaceOrientations.modify())()
{
  return nullsub_1;
}

uint64_t sub_10002BAA8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t APUIRemoteAlertPresentationHandle.onDismiss.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  sub_10002BB04(v1);
  return v1;
}

uint64_t sub_10002BB04(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t APUIRemoteAlertPresentationHandle.onDismiss.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return sub_10000A580(v5);
}

uint64_t (*APUIRemoteAlertPresentationHandle.onDismiss.modify())()
{
  return j__swift_endAccess;
}

void APUIRemoteAlertPresentationHandle.dismiss(animated:completion:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_100056D38 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = sub_1000084C0(v8, (uint64_t)qword_1000581D0);
  swift_retain();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v28 = a2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v9;
    *(_DWORD *)uint64_t v12 = 136315138;
    char v14 = a1;
    uint64_t v29 = a3;
    aBlock[0] = v13;
    uint64_t v15 = *(void *)(v4 + 16);
    unint64_t v16 = *(void *)(v4 + 24);
    swift_bridgeObjectRetain();
    uint64_t v17 = v15;
    a1 = v14;
    uint64_t v31 = sub_10002D634(v17, v16, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    a3 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received request to dismiss remote alert with ID: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v28;
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  id v18 = *(id *)(v4 + 32);
  id v19 = [v18 presentingViewController];

  if (v19)
  {
    if ((*(unsigned char *)(v4 + 81) & 1) == 0)
    {
      *(unsigned char *)(v4 + 81) = 1;
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = a2;
      *(void *)(v20 + 24) = a3;
      aBlock[4] = (uint64_t)sub_10002DCDC;
      aBlock[5] = v20;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100014A00;
      aBlock[3] = (uint64_t)&unk_10004EB50;
      long long v21 = _Block_copy(aBlock);
      sub_10002BB04(a2);
      swift_release();
      [v18 dismissViewControllerAnimated:a1 & 1 completion:v21];
      _Block_release(v21);
    }
  }
  else
  {
    swift_retain();
    long long v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      long long v24 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)long long v24 = 136315138;
      uint64_t v25 = *(void *)(v4 + 16);
      unint64_t v26 = *(void *)(v4 + 24);
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_10002D634(v25, v26, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Invalidating handle for remote alert which is not yet presented with ID: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    [*(id *)(v4 + 56) invalidate:v27];
  }
}

uint64_t APUIRemoteAlertPresentationHandle.deinit()
{
  swift_bridgeObjectRelease();
  sub_10000A580(*(void *)(v0 + 64));
  return v0;
}

uint64_t APUIRemoteAlertPresentationHandle.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_10000A580(*(void *)(v0 + 64));

  return _swift_deallocClassInstance(v0, 82, 7);
}

id sub_10002C04C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for APUIRemoteAlertPresentationManager()) init];
  static APUIRemoteAlertPresentationManager.shared = (uint64_t)result;
  return result;
}

id APUISystemApertureElementTransitionCoordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t *APUIRemoteAlertPresentationManager.shared.unsafeMutableAddressor()
{
  if (qword_100056D40 != -1) {
    swift_once();
  }
  return &static APUIRemoteAlertPresentationManager.shared;
}

id static APUIRemoteAlertPresentationManager.shared.getter()
{
  if (qword_100056D40 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static APUIRemoteAlertPresentationManager.shared;

  return v0;
}

uint64_t APUIRemoteAlertPresentationManager.present(_:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  if (qword_100056D38 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000084C0(v4, (uint64_t)qword_1000581D0);
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  long long v34 = a1;
  uint64_t v7 = (void *)a1[2];
  swift_bridgeObjectRetain_n();
  id v8 = v7;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  uint64_t v33 = v6;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    v36[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    sub_10002D634(v6, v5, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2112;
    id v12 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v31 = v8;

    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Asked to present remote alert using request: %s view controller to present: %@", (uint8_t *)v11, 0x16u);
    sub_10000847C(&qword_100057E60);
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
  id v13 = [self identityOfCurrentProcess];
  if (v13)
  {
    char v14 = v13;
    id v15 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    swift_bridgeObjectRetain();
    id v16 = v14;
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v32 = [v15 initWithSceneProvidingProcess:v16 configurationIdentifier:v17];

    id v18 = [self newHandleWithDefinition:v32 configurationContext:0];
    type metadata accessor for APUIRemoteAlertPresentationHandle();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 64) = 0;
    *(void *)(v19 + 72) = 0;
    *(_WORD *)(v19 + 80) = 0;
    long long v20 = *((_OWORD *)v34 + 1);
    *(_OWORD *)(v19 + 16) = *(_OWORD *)v34;
    *(_OWORD *)(v19 + 32) = v20;
    *(void *)(v19 + 48) = v34[4];
    *(void *)(v19 + 56) = v18;
    uint64_t v21 = v2;
    long long v22 = (uint64_t *)(v2
                    + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    id v23 = v8;
    id v24 = v18;
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v35 = *v22;
    *long long v22 = 0x8000000000000000;
    sub_1000237A0(v19, v33, v5, isUniquelyReferenced_nonNull_native);
    *long long v22 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    id v26 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
    [v26 setInitialSupportedInterfaceOrientations:v34[4]];
    [v24 registerObserver:v21];
    [v24 activateWithContext:v26];
  }
  else
  {
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to get process identity of the current process, dropping request to present view controller", v29, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return v19;
}

uint64_t APUIRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:)(void *a1, char a2, char a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a1;
  UUID.init()();
  uint64_t v13 = UUID.uuidString.getter();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19[0] = v13;
  v19[1] = v15;
  v19[2] = (uint64_t)v12;
  char v20 = a2;
  char v21 = a3;
  uint64_t v22 = a4;
  uint64_t v16 = APUIRemoteAlertPresentationManager.present(_:)(v19);

  swift_bridgeObjectRelease();
  return v16;
}

uint64_t APUIRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:onDismiss:)(void *a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = a1;
  UUID.init()();
  uint64_t v15 = UUID.uuidString.getter();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v25[0] = v15;
  v25[1] = v17;
  v25[2] = (uint64_t)v14;
  char v26 = a2;
  char v27 = a3;
  uint64_t v28 = a4;
  uint64_t v18 = APUIRemoteAlertPresentationManager.present(_:)(v25);

  uint64_t result = swift_bridgeObjectRelease();
  if (v18)
  {
    swift_beginAccess();
    uint64_t v20 = *(void *)(v18 + 64);
    uint64_t v21 = v23;
    uint64_t v22 = v24;
    *(void *)(v18 + 64) = v23;
    *(void *)(v18 + 72) = v22;
    sub_10002BB04(v21);
    sub_10000A580(v20);
    return swift_release();
  }
  return result;
}

uint64_t APUIRemoteAlertPresentationManager.presentationHandle(for:)(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (!*(void *)(v6 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_10002DDDC(a1, a2);
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_retain();
  }
  else
  {
    uint64_t v9 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

void __swiftcall APUIRemoteAlertPresentationManager.presentationRequest(for:)(ActivityProgressUI::APUIRemoteAlertPresentationRequest_optional *__return_ptr retstr, Swift::String a2)
{
  object = a2._object;
  uint64_t countAndFlagsBits = a2._countAndFlagsBits;
  uint64_t v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v18 = 0;
LABEL_8:
    Swift::UInt v17 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_10002DDDC(countAndFlagsBits, (uint64_t)object);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v18 = 0;
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(*(void *)(v7 + 56) + 8 * v9);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v12 = *(void **)(v11 + 24);
  id v14 = *(void **)(v11 + 32);
  uint64_t v15 = *(unsigned __int8 *)(v11 + 40);
  int v16 = *(unsigned __int8 *)(v11 + 41);
  Swift::UInt v17 = *(void *)(v11 + 48);
  swift_bridgeObjectRetain();
  uint64_t v18 = v14;
  swift_release();
  uint64_t v19 = 256;
  if (!v16) {
    uint64_t v19 = 0;
  }
  uint64_t v8 = v19 | v15;
LABEL_9:
  retstr->value.id._uint64_t countAndFlagsBits = v13;
  retstr->value.id._object = v12;
  retstr->value.viewControllerToPresent.super.super.Class isa = v18;
  *(void *)&retstr->value.animated = v8;
  retstr->value.supportedInterfaceOrientations.rawValue = v17;
}

id APUIRemoteAlertPresentationManager.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID;
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_100004384((uint64_t)&_swiftEmptyArrayStorage);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for APUIRemoteAlertPresentationManager();
  return [super init];
}

id APUIRemoteAlertPresentationManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUIRemoteAlertPresentationManager();
  return [super dealloc];
}

void APUIRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(void *a1)
{
  swift_beginAccess();
  id v2 = a1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_10002F20C(v3);
  swift_bridgeObjectRelease();

  if (v4)
  {
    if (qword_100056D38 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_1000084C0(v5, (uint64_t)qword_1000581D0);
    swift_retain();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v9 = *(void *)(v4 + 16);
      unint64_t v10 = *(void *)(v4 + 24);
      swift_bridgeObjectRetain();
      sub_10002D634(v9, v10, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "RemoteAlertPresentationManager did activate alert for request: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {

      swift_release_n();
    }
  }
}

void APUIRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(void *a1)
{
  swift_beginAccess();
  id v2 = a1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_10002F20C(v3);
  swift_bridgeObjectRelease();

  if (v4)
  {
    if (qword_100056D38 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_1000084C0(v5, (uint64_t)qword_1000581D0);
    swift_retain();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v9 = *(void *)(v4 + 16);
      unint64_t v10 = *(void *)(v4 + 24);
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_10002D634(v9, v10, &v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "RemoteAlertPresentationManager did deactivate for request: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    [v2 invalidate:v11, v12];
    swift_release();
  }
}

void APUIRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(void *a1, uint64_t a2)
{
  swift_beginAccess();
  id v4 = a1;
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_10002F20C(v5);
  swift_bridgeObjectRelease();

  if (v6)
  {
    if (qword_100056D38 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000084C0(v7, (uint64_t)qword_1000581D0);
    swift_retain();
    swift_errorRetain();
    swift_retain();
    swift_errorRetain();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      v21[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v12 = *(void *)(v6 + 16);
      unint64_t v13 = *(void *)(v6 + 24);
      swift_bridgeObjectRetain();
      sub_10002D634(v12, v13, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      if (a2)
      {
        swift_errorRetain();
        uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v14 = 0;
      }
      *uint64_t v11 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "RemoteAlertPresentationManager did invalidate for request: %s with error: %@", (uint8_t *)v10, 0x16u);
      sub_10000847C(&qword_100057E60);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v15 = *(void *)(v6 + 16);
    uint64_t v16 = *(void *)(v6 + 24);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_10002E49C(v15, v16, &qword_1000583D0);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    char v17 = *(unsigned char *)(v6 + 80);
    *(unsigned char *)(v6 + 80) = 1;
    if ((v17 & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v18 = *(void (**)(uint64_t))(v6 + 64);
      if (v18)
      {
        uint64_t v19 = swift_retain();
        v18(v19);
        sub_10000A580((uint64_t)v18);
        uint64_t v20 = *(void *)(v6 + 64);
      }
      else
      {
        uint64_t v20 = 0;
      }
      *(void *)(v6 + 64) = 0;
      *(void *)(v6 + 72) = 0;
      sub_10000A580(v20);
    }
    swift_release();
  }
}

uint64_t sub_10002D518(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10002D528(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10002D564(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t sub_10002D594(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10002D5BC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10002D634(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10002D634(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002D708(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000180A4((uint64_t)v12, *a3);
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
      sub_1000180A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100017134((uint64_t)v12);
  return v7;
}

uint64_t sub_10002D708(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10002D8C4(a5, a6);
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

uint64_t sub_10002D8C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002D95C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002DB3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002DB3C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002D95C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10002DAD4(v2, 0);
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

void *sub_10002DAD4(uint64_t a1, uint64_t a2)
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
  sub_10000847C((uint64_t *)&unk_1000583E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002DB3C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000847C((uint64_t *)&unk_1000583E0);
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
  unint64_t v13 = a4 + 32;
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

unsigned char **sub_10002DC8C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10002DC9C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002DCDC()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_10002DD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002DD1C()
{
  return swift_release();
}

void sub_10002DD24(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
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

unint64_t sub_10002DDDC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10002DF90(a1, a2, v4);
}

uint64_t type metadata accessor for APUIRemoteAlertPresentationManager()
{
  return self;
}

unint64_t sub_10002DE78(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_10002E074(a1, v2);
}

unint64_t sub_10002DF0C(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_10002F604(&qword_100057AE0);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_10002E1EC(a1, v2);
}

unint64_t sub_10002DF90(uint64_t a1, uint64_t a2, uint64_t a3)
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
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002E074(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_10002E1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10002F604(&qword_100057B70);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_10002E398(uint64_t a1, uint64_t a2)
{
  return sub_10002E49C(a1, a2, &qword_100056F30);
}

uint64_t sub_10002E3A4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_10002DF0C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002EDB8();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_10002E57C(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10002E49C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  char v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10002DDDC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  *char v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002F05C(a3);
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_10002E860(v8, v11);
  *char v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_10002E57C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      id v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_10002F604(&qword_100057AE0);
        uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (void *)(v22 + 8 * a1);
            uint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10002E860(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_10002EA38()
{
  uint64_t v1 = v0;
  sub_10000847C((uint64_t *)&unk_100056F50);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002EBF0()
{
  uint64_t v1 = v0;
  sub_10000847C((uint64_t *)&unk_1000583C0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002EDAC()
{
  return sub_10002F05C(&qword_100056F30);
}

void *sub_10002EDB8()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000847C((uint64_t *)&unk_100056F40);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_10002F050()
{
  return sub_10002F05C(&qword_1000583D0);
}

void *sub_10002F05C(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000847C(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002F20C(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t j = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v9 | (j << 6); ; unint64_t i = __clz(__rbit64(v12)) + (j << 6))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    sub_10002F648();
    unint64_t v15 = *(void **)(v14 + 56);
    swift_retain();
    id v16 = v15;
    char v17 = static NSObject.== infix(_:_:)();

    if (v17)
    {
      swift_release();
      return v14;
    }
    uint64_t result = swift_release();
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = j + 1;
    if (__OFADD__(j, 1)) {
      break;
    }
    if (v11 >= v6) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v11);
    ++j;
    if (v12) {
      goto LABEL_19;
    }
    int64_t j = v11 + 1;
    if (v11 + 1 >= v6) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v2 + 8 * j);
    if (v12) {
      goto LABEL_19;
    }
    int64_t j = v11 + 2;
    if (v11 + 2 >= v6) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v2 + 8 * j);
    if (v12) {
      goto LABEL_19;
    }
    int64_t j = v11 + 3;
    if (v11 + 3 >= v6) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v2 + 8 * j);
    if (v12) {
      goto LABEL_19;
    }
    int64_t v13 = v11 + 4;
    if (v13 >= v6)
    {
LABEL_24:
      swift_release();
      return 0;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v13);
    for (int64_t j = v13; !v12; ++v13)
    {
      int64_t j = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_27;
      }
      if (j >= v6) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v2 + 8 * j);
    }
LABEL_19:
    unint64_t v5 = (v12 - 1) & v12;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10002F3BC()
{
  return &protocol witness table for String;
}

void destroy for APUIRemoteAlertPresentationRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for APUIRemoteAlertPresentationRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APUIRemoteAlertPresentationRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APUIRemoteAlertPresentationRequest()
{
  return &type metadata for APUIRemoteAlertPresentationRequest;
}

uint64_t type metadata accessor for APUIRemoteAlertPresentationHandle()
{
  return self;
}

uint64_t sub_10002F604(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UUID();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002F648()
{
  unint64_t result = qword_1000583D8;
  if (!qword_1000583D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000583D8);
  }
  return result;
}

uint64_t destroy for BackgroundActivityDescriptionView()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BackgroundActivityDescriptionView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BackgroundActivityDescriptionView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for BackgroundActivityDescriptionView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityDescriptionView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityDescriptionView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityDescriptionView()
{
  return &type metadata for BackgroundActivityDescriptionView;
}

uint64_t sub_10002F854()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002F870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v9 = sub_10000847C(&qword_1000583F8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  unint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = sub_10000847C(&qword_100058400);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v23 - v19;
  sub_10002FA40(a1, a2, (uint64_t)&v23 - v19);
  sub_10002FE28(a3, v24, (uint64_t)v14);
  sub_100008CFC((uint64_t)v20, (uint64_t)v18, &qword_100058400);
  sub_100008CFC((uint64_t)v14, (uint64_t)v12, &qword_1000583F8);
  sub_100008CFC((uint64_t)v18, a5, &qword_100058400);
  uint64_t v21 = sub_10000847C(&qword_100058408);
  sub_100008CFC((uint64_t)v12, a5 + *(int *)(v21 + 48), &qword_1000583F8);
  sub_100018120((uint64_t)v14, &qword_1000583F8);
  sub_100018120((uint64_t)v20, &qword_100058400);
  sub_100018120((uint64_t)v12, &qword_1000583F8);
  return sub_100018120((uint64_t)v18, &qword_100058400);
}

uint64_t sub_10002FA40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v38 = sub_10000847C(&qword_100058410);
  __chkstk_darwin(v38);
  uint64_t v42 = (uint64_t *)((char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for Text.TruncationMode();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  __chkstk_darwin(v6);
  uint64_t v39 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10000847C(&qword_100058418);
  __chkstk_darwin(v37);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  sub_100030308();
  swift_bridgeObjectRetain();
  uint64_t v10 = Text.init<A>(_:)();
  uint64_t v12 = v11;
  char v14 = v13;
  if (qword_100056DA0 != -1) {
    swift_once();
  }
  uint64_t v15 = Text.font(_:)();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_10003035C(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  static Color.primary.getter();
  uint64_t v20 = Text.foregroundColor(_:)();
  uint64_t v22 = v21;
  char v24 = v23;
  uint64_t v36 = v25;
  swift_release();
  char v26 = v24 & 1;
  sub_10003035C(v15, v17, v19);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  BOOL v29 = v39;
  uint64_t v28 = v40;
  uint64_t v30 = v41;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, enum case for Text.TruncationMode.tail(_:), v41);
  uint64_t v31 = swift_getKeyPath();
  id v32 = v42;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)v42 + *(int *)(v38 + 28), v29, v30);
  *id v32 = v31;
  sub_100008CFC((uint64_t)v32, (uint64_t)&v9[*(int *)(v37 + 36)], &qword_100058410);
  *(void *)uint64_t v9 = v20;
  *((void *)v9 + 1) = v22;
  v9[16] = v26;
  *((void *)v9 + 3) = v36;
  *((void *)v9 + 4) = KeyPath;
  *((void *)v9 + 5) = 1;
  v9[48] = 0;
  sub_1000304C0(v20, v22, v26);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100018120((uint64_t)v32, &qword_100058410);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  sub_10003035C(v20, v22, v26);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v33 = static Alignment.leading.getter();
  sub_1000347E4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v43, 0.0, 1, 0.0, 1, v33, v34);
  return sub_100018120((uint64_t)v9, &qword_100058418);
}

uint64_t sub_10002FE28@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v40 = sub_10000847C(&qword_100058410);
  __chkstk_darwin(v40);
  uint64_t v45 = (uint64_t *)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for Text.TruncationMode();
  uint64_t v43 = *(void *)(v6 - 8);
  uint64_t v44 = v6;
  __chkstk_darwin(v6);
  uint64_t v42 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10000847C(&qword_100058418);
  __chkstk_darwin(v39);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10000847C(&qword_100058420);
  __chkstk_darwin(v41);
  uint64_t v46 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  sub_100030308();
  swift_bridgeObjectRetain();
  uint64_t v11 = Text.init<A>(_:)();
  uint64_t v13 = v12;
  char v15 = v14;
  if (qword_100056DA8 != -1) {
    swift_once();
  }
  uint64_t v16 = Text.font(_:)();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_10003035C(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  static Color.primary.getter();
  uint64_t v21 = Text.foregroundColor(_:)();
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v38 = v26;
  swift_release();
  char v27 = v25 & 1;
  sub_10003035C(v16, v18, v20);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = v42;
  uint64_t v29 = v43;
  uint64_t v31 = v44;
  (*(void (**)(char *, void, uint64_t))(v43 + 104))(v42, enum case for Text.TruncationMode.tail(_:), v44);
  uint64_t v32 = swift_getKeyPath();
  uint64_t v33 = v45;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)v45 + *(int *)(v40 + 28), v30, v31);
  uint64_t *v33 = v32;
  sub_100008CFC((uint64_t)v33, (uint64_t)&v9[*(int *)(v39 + 36)], &qword_100058410);
  *(void *)uint64_t v9 = v21;
  *((void *)v9 + 1) = v23;
  v9[16] = v27;
  *((void *)v9 + 3) = v38;
  *((void *)v9 + 4) = KeyPath;
  *((void *)v9 + 5) = 1;
  v9[48] = 0;
  sub_1000304C0(v21, v23, v27);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100018120((uint64_t)v33, &qword_100058410);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  sub_10003035C(v21, v23, v27);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v34 = v46;
  sub_100008CFC((uint64_t)v9, v46, &qword_100058418);
  *(void *)(v34 + *(int *)(v41 + 36)) = 0x3FE0000000000000;
  sub_100018120((uint64_t)v9, &qword_100058418);
  uint64_t v35 = static Alignment.leading.getter();
  sub_100034840(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v47, 0.0, 1, 0.0, 1, v35, v36);
  return sub_100018120(v34, &qword_100058420);
}

uint64_t sub_10003029C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  *(void *)a1 = static HorizontalAlignment.leading.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v7 = sub_10000847C(&qword_1000583F0);
  return sub_10002F870(v3, v4, v6, v5, a1 + *(int *)(v7 + 44));
}

unint64_t sub_100030308()
{
  unint64_t result = qword_100058428;
  if (!qword_100058428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058428);
  }
  return result;
}

uint64_t sub_10003035C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10003036C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000303A0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000303D0()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_1000303F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Text.TruncationMode();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_1000304C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_1000304D4()
{
  unint64_t result = qword_100058430;
  if (!qword_100058430)
  {
    sub_10000877C(&qword_100058438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058430);
  }
  return result;
}

void sub_100030530()
{
  qword_100058B90 = 0x4028000000000000;
}

void sub_100030540()
{
  qword_100058B98 = 0x4028000000000000;
}

void sub_100030550()
{
  qword_100058BA0 = 0x4038000000000000;
}

double sub_100030560()
{
  double result = 0.0;
  xmmword_100058BB0 = xmmword_10003E8B0;
  *(_OWORD *)&qword_100058BC0 = xmmword_10003E8C0;
  return result;
}

__n128 sub_100030580()
{
  __asm { FMOV            V0.2D, #16.0 }
  xmmword_100058BD0 = (__int128)result;
  *(__n128 *)&qword_100058BE0 = result;
  return result;
}

void sub_100030594()
{
  qword_100058BF0 = 0x4028000000000000;
}

void sub_1000305A4()
{
  qword_100058BF8 = 0x4046000000000000;
}

void sub_1000305B4()
{
  qword_100058C00 = 0x4026000000000000;
}

void sub_1000305C4()
{
  qword_100058C08 = 0x4031000000000000;
}

void sub_1000305D4()
{
  qword_100058C10 = 0x4010000000000000;
}

void sub_1000305E4()
{
  qword_100058C18 = 0x4046000000000000;
}

uint64_t sub_1000305F4()
{
  uint64_t v0 = type metadata accessor for Font.Leading();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Font.headline.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Font.Leading.tight(_:), v0);
  uint64_t v4 = Font.leading(_:)();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_100058C20 = v4;
  return result;
}

uint64_t sub_100030704()
{
  uint64_t v0 = type metadata accessor for Font.Leading();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Font.TextStyle();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Font.TextStyle.subheadline(_:), v4);
  static Font.custom(_:size:relativeTo:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Font.Leading.tight(_:), v0);
  uint64_t v8 = Font.leading(_:)();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_100058C28 = v8;
  return result;
}

uint64_t sub_1000308F0()
{
  type metadata accessor for Color.RGBColorSpace();
  __chkstk_darwin();
  (*(void (**)(char *, void))(v1 + 104))((char *)&v3 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t result = Color.init(_:red:green:blue:opacity:)();
  qword_100058C30 = result;
  return result;
}

uint64_t sub_1000309D0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100058C38);
  sub_1000084C0(v0, (uint64_t)qword_100058C38);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100030A54()
{
  sub_1000112EC();
  EnvironmentValues.subscript.getter();
  return v1;
}

uint64_t sub_100030A90()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100058440);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_100058440);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id APUISystemApertureElementTransitionCoordinator.init()()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureLayoutModeCustomFrameInScreen];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  uint64_t v3 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_screenWidth;
  uint64_t v4 = self;
  uint64_t v5 = v0;
  id v6 = [v4 mainScreen];
  [v6 bounds];
  uint64_t v8 = v7;

  *(void *)&v0[v3] = v8;
  uint64_t v9 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_animationPositionTransformYOffset;
  id v10 = [v4 mainScreen];
  [v10 bounds];
  double v12 = v11;

  *(double *)&v5[v9] = v12 / 3.0;
  uint64_t v13 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_cornerRadius;
  char v14 = self;
  id v15 = [v14 sharedInstanceForEmbeddedDisplay];
  [v15 maximumContinuousCornerRadius];
  uint64_t v17 = v16;

  *(void *)&v5[v13] = v17;
  uint64_t v18 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureEdgeInset;
  id v19 = [v14 sharedInstanceForEmbeddedDisplay];
  [v19 minimumScreenEdgeInsets];
  uint64_t v21 = v20;

  *(void *)&v5[v18] = v21;
  v23.receiver = v5;
  v23.super_class = (Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator();
  return [super init];
}

id APUISystemApertureElementTransitionCoordinator.__deallocating_deinit(uint64_t a1)
{
  return sub_10003177C(a1, type metadata accessor for APUISystemApertureElementTransitionCoordinator);
}

void sub_100030E30(void *a1)
{
  id v3 = [a1 viewControllerForKey:UITransitionContextFromViewControllerKey];
  if (!v3)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v4 = v3;
  id v5 = [a1 viewControllerForKey:UITransitionContextToViewControllerKey];
  if (!v5)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    return;
  }
  id v6 = v5;
  uint64_t v7 = OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay;
  if (v1[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay]) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;
  id v51 = [v9 view];
  if (!v51) {
    goto LABEL_27;
  }
  uint64_t v10 = OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator;
  double v11 = (double *)(*(void *)&v1[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator]
                 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureLayoutModeCustomFrameInScreen);
  double v12 = *v11;
  double v13 = v11[1];
  double v15 = v11[2];
  double v14 = v11[3];
  uint64_t v16 = &selRef_initialFrameForViewController_;
  if (v1[v7]) {
    uint64_t v16 = &selRef_finalFrameForViewController_;
  }
  [a1 *v16 v9];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  id v25 = [self effectWithStyle:8];
  id v26 = [objc_allocWithZone((Class)UIVisualEffectView) init];
  [v26 setFrame:v18, v20, v22, v24];
  [v26 setAutoresizingMask:18];
  uint64_t v50 = v6;
  if (v1[v7] == 1) {
    id v27 = v25;
  }
  else {
    id v27 = 0;
  }
  [v26 setEffect:v27];

  id v28 = [objc_allocWithZone((Class)UIView) init];
  id v29 = [self whiteColor];
  [v28 setBackgroundColor:v29];

  [v28 setClipsToBounds:1];
  id v30 = [v28 layer];
  [v30 setCornerRadius:*(double *)(*(void *)&v1[v10]+ OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_cornerRadius)];

  id v31 = [v28 layer];
  [v31 setCornerCurve:kCACornerCurveID0];

  id v32 = [a1 containerView];
  [v32 addSubview:v51];

  id v33 = [a1 containerView];
  [v33 addSubview:v26];

  [v51 setFrame:v18, v20, v22, v24];
  [v51 frame];
  [v51 setFrame:];
  id v34 = [a1 containerView];
  [v34 setMaskView:v28];

  if (v1[v7]) {
    double v35 = v12;
  }
  else {
    double v35 = v18;
  }
  if (v1[v7]) {
    double v36 = v13;
  }
  else {
    double v36 = v20;
  }
  if (v1[v7]) {
    double v37 = v15;
  }
  else {
    double v37 = v22;
  }
  if (v1[v7]) {
    double v38 = v14;
  }
  else {
    double v38 = v24;
  }
  [v28 setFrame:v35, v36, v37, v38];
  id v48 = self;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v26;
  *(void *)(v39 + 24) = v1;
  *(void *)(v39 + 32) = v25;
  *(void *)(v39 + 40) = v51;
  *(double *)(v39 + 48) = v18;
  *(double *)(v39 + 56) = v20;
  *(double *)(v39 + 64) = v22;
  *(double *)(v39 + 72) = v24;
  *(void *)(v39 + 80) = v28;
  *(double *)(v39 + 88) = v12;
  *(double *)(v39 + 96) = v13;
  *(double *)(v39 + 104) = v15;
  *(double *)(v39 + 112) = v14;
  uint64_t v57 = sub_100032E34;
  char v58 = (void *)v39;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v54 = 1107296256;
  long long v55 = sub_100014A00;
  long long v56 = &unk_10004EE28;
  uint64_t v40 = _Block_copy(&aBlock);
  id v49 = v25;
  id v41 = v26;
  uint64_t v42 = v1;
  id v52 = v51;
  id v43 = v28;
  swift_release();
  uint64_t v44 = (void *)swift_allocObject();
  void v44[2] = v41;
  v44[3] = a1;
  uint64_t v44[4] = v42;
  uint64_t v57 = sub_100032E9C;
  char v58 = v44;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v54 = 1107296256;
  long long v55 = sub_100031674;
  long long v56 = &unk_10004EE78;
  uint64_t v45 = _Block_copy(&aBlock);
  id v46 = v41;
  uint64_t v47 = v42;
  swift_unknownObjectRetain();
  swift_release();
  [v48 _animateUsingSpringWithDuration:0 delay:v40 options:v45 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];

  _Block_release(v45);
  _Block_release(v40);
}

id sub_10003141C(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  uint64_t v23 = OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay;
  if (*(unsigned char *)(a2
                + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay))
    a3 = 0;
  [a1 setEffect:a3];
  [a4 setFrame:a6, a7, a8, a9];
  [a4 frame];
  [a4 setFrame:];
  if (*(unsigned char *)(a2 + v23)) {
    double v24 = a6;
  }
  else {
    double v24 = a10;
  }
  if (*(unsigned char *)(a2 + v23)) {
    double v25 = a7;
  }
  else {
    double v25 = a11;
  }
  if (*(unsigned char *)(a2 + v23)) {
    double v26 = a8;
  }
  else {
    double v26 = a12;
  }
  double v27 = a13;
  if (*(unsigned char *)(a2 + v23)) {
    double v27 = a9;
  }

  return [a5 setFrame:v24, v25, v26, v27];
}

void sub_100031554(char a1, id a2, void *a3, uint64_t a4)
{
  [a2 removeFromSuperview];
  id v7 = [a3 containerView];
  [v7 setMaskView:0];

  [a3 completeTransition:a1 & 1];
  uint64_t v8 = *(void **)(a4
                + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator);
  sub_100032EA8((uint64_t)v8 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate, (uint64_t)v15);
  if (v16)
  {
    sub_100032F70((uint64_t)v15, (uint64_t)v12);
    id v9 = v8;
    sub_100032F10((uint64_t)v15);
    uint64_t v10 = v13;
    uint64_t v11 = v14;
    sub_100017184(v12, v13);
    (*(void (**)(id, uint64_t, uint64_t))(v11 + 24))(v9, v10, v11);
    sub_100017134((uint64_t)v12);
  }
  else
  {
    sub_100032F10((uint64_t)v15);
  }
}

uint64_t sub_100031674(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_100031760()
{
  return sub_10003177C(0, type metadata accessor for APUISystemApertureElementTransition);
}

id sub_10003177C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

void sub_1000317C8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a2 != 1 || (*a1 & 1) != 0) {
    return;
  }
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))(a3 + 40))(v8);
  uint64_t v12 = *(void *)a3;
  char v13 = *(unsigned char *)(a3 + 8);
  sub_100032928(*(void *)a3, v13);
  uint64_t v14 = sub_10002AB58(v12, v13);
  sub_10002AE38(v12, v13);
  if (v14)
  {
    [v11 setModalPresentationStyle:4];
    [v11 setTransitioningDelegate:v14];
    swift_unknownObjectRelease();
    if ((*(unsigned char *)(a3 + 33) & 1) == 0)
    {
LABEL_5:
      if (qword_100056D40 != -1) {
        swift_once();
      }
      v33[1] = static APUIRemoteAlertPresentationManager.shared;
      uint64_t v41 = *(void *)(a3 + 16);
      uint64_t v15 = swift_allocObject();
      long long v16 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v15 + 16) = *(_OWORD *)a3;
      *(_OWORD *)(v15 + 32) = v16;
      *(_OWORD *)(v15 + 48) = *(_OWORD *)(a3 + 32);
      *(void *)(v15 + 64) = *(void *)(a3 + 48);
      sub_100032928(v12, v13);
      double v17 = v11;
      swift_retain();
      swift_retain();
      sub_10002A998((uint64_t)&v41);
      UUID.init()();
      double v18 = (void **)UUID.uuidString.getter();
      uint64_t v20 = v19;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      long long aBlock = v18;
      uint64_t v35 = v20;
      double v36 = v17;
      LOWORD(v37) = 1;
      uint64_t v38 = 2;
      uint64_t v21 = APUIRemoteAlertPresentationManager.present(_:)((uint64_t *)&aBlock);

      swift_bridgeObjectRelease();
      if (v21)
      {
        swift_beginAccess();
        uint64_t v22 = *(void *)(v21 + 64);
        *(void *)(v21 + 64) = sub_100032CA0;
        *(void *)(v21 + 72) = v15;
        swift_retain();
        sub_10000A580(v22);
        swift_release();

        swift_release();
      }
      else
      {
        swift_release();
      }
      return;
    }
  }
  else
  {
    [v11 setModalPresentationStyle:0];
    if ((*(unsigned char *)(a3 + 33) & 1) == 0) {
      goto LABEL_5;
    }
  }
  id v23 = [objc_allocWithZone((Class)SBSLockScreenService) init];
  if (qword_100056DC0 != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  sub_1000084C0(v24, (uint64_t)qword_100058440);
  double v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    double v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Requesting device unlock if necessary", v27, 2u);
    swift_slowDealloc();
  }

  v40[0] = *(void *)(a3 + 16);
  uint64_t v28 = swift_allocObject();
  long long v29 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v28 + 24) = *(_OWORD *)a3;
  *(void *)(v28 + 16) = v11;
  *(_OWORD *)(v28 + 40) = v29;
  *(_OWORD *)(v28 + 56) = *(_OWORD *)(a3 + 32);
  *(void *)(v28 + 72) = *(void *)(a3 + 48);
  *(void *)(v28 + 80) = v23;
  uint64_t v38 = (uint64_t)sub_100032D08;
  uint64_t v39 = v28;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  double v36 = sub_100031674;
  double v37 = &unk_10004EDB0;
  id v30 = _Block_copy(&aBlock);
  sub_100032928(v12, v13);
  id v31 = v11;
  sub_10002A998((uint64_t)v40);
  swift_retain();
  swift_retain();
  id v32 = v23;
  swift_release();
  [v32 requestPasscodeUnlockUIWithOptions:0 withCompletion:v30];

  _Block_release(v30);
}

id sub_100031C80(char a1, void *a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v30[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    if (qword_100056DC0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_1000084C0(v12, (uint64_t)qword_100058440);
    char v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Device was unlocked", v15, 2u);
      swift_slowDealloc();
    }

    if (qword_100056D40 != -1) {
      swift_once();
    }
    uint64_t v16 = *a3;
    char v33 = *((unsigned char *)a3 + 8);
    uint64_t v31 = a3[2];
    uint64_t v32 = v16;
    uint64_t v17 = swift_allocObject();
    long long v18 = *((_OWORD *)a3 + 1);
    *(_OWORD *)(v17 + 16) = *(_OWORD *)a3;
    *(_OWORD *)(v17 + 32) = v18;
    *(_OWORD *)(v17 + 48) = *((_OWORD *)a3 + 2);
    *(void *)(v17 + 64) = a3[6];
    swift_retain();
    swift_retain();
    id v19 = a2;
    sub_100032C10((uint64_t)&v32);
    sub_10002A998((uint64_t)&v31);
    UUID.init()();
    uint64_t v20 = UUID.uuidString.getter();
    uint64_t v22 = v21;
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    *(void *)&long long v34 = v20;
    *((void *)&v34 + 1) = v22;
    id v35 = v19;
    __int16 v36 = 1;
    uint64_t v37 = 2;
    uint64_t v23 = APUIRemoteAlertPresentationManager.present(_:)((uint64_t *)&v34);

    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_beginAccess();
      uint64_t v24 = *(void *)(v23 + 64);
      *(void *)(v23 + 64) = sub_100032CA0;
      *(void *)(v23 + 72) = v17;
      swift_retain();
      sub_10000A580(v24);
      swift_release();
    }
    swift_release();
  }
  else
  {
    if (qword_100056DC0 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    sub_1000084C0(v25, (uint64_t)qword_100058440);
    os_log_type_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Device was not unlocked", v28, 2u);
      swift_slowDealloc();
    }

    long long v34 = *((_OWORD *)a3 + 1);
    LOBYTE(v35) = *((unsigned char *)a3 + 32);
    v30[0] = 0;
    sub_10000847C(&qword_100058550);
    Binding.wrappedValue.setter();
  }
  return [a4 invalidate];
}

uint64_t sub_10003205C()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  char v3 = *((unsigned char *)v0 + 32);
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v11 = v2;
  uint64_t v8 = v2;
  uint64_t v9 = v1;
  char v10 = v3;
  sub_10000847C(&qword_100058550);
  Binding.wrappedValue.getter();
  uint64_t v8 = *v0;
  LOBYTE(v9) = *((unsigned char *)v0 + 8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)v0;
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v1;
  *(unsigned char *)(v6 + 48) = v3;
  *(_DWORD *)(v6 + 49) = *(_DWORD *)((char *)v0 + 33);
  *(_DWORD *)(v6 + 52) = *((_DWORD *)v0 + 9);
  *(void *)(v6 + 56) = v5;
  *(void *)(v6 + 64) = v4;
  sub_100032C10((uint64_t)&v8);
  sub_10002A998((uint64_t)&v11);
  swift_retain();
  swift_retain();
  sub_10000847C(&qword_100058558);
  sub_100032C40();
  View.onChange<A>(of:initial:_:)();
  return swift_release();
}

uint64_t View.remoteAlert(isPresented:requireUnlock:content:)()
{
  return swift_release();
}

uint64_t View.remoteAlert<A>(isPresented:requireUnlock:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  os_log_type_t v14 = (void *)swift_allocObject();
  v14[2] = a7;
  v14[3] = a8;
  v14[4] = a9;
  v14[5] = a10;
  void v14[6] = a5;
  v14[7] = a6;
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  swift_retain();
  View.modifier<A>(_:)();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1000323BC(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  __chkstk_darwin(a1);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for APUISecureHostingController();
  a1();
  uint64_t v9 = sub_10003A0DC((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a4);
  return v9;
}

void sub_1000324B0(void *a1, uint64_t a2)
{
  if ([a1 activeLayoutMode] == (id)4)
  {
    id v4 = [a1 view];
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 frame];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;

      double v14 = *(double *)(a2
                      + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_screenWidth)
          * 0.5;
      v18.origin.x = v7;
      v18.origin.y = v9;
      v18.size.width = v11;
      v18.size.height = v13;
      CGFloat Width = CGRectGetWidth(v18);
      uint64_t v16 = *(void *)(a2
                      + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureEdgeInset);
      uint64_t v17 = a2
          + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureLayoutModeCustomFrameInScreen;
      *(double *)uint64_t v17 = v14 - Width * 0.5;
      *(void *)(v17 + 8) = v16;
      *(CGFloat *)(v17 + 16) = v11;
      *(CGFloat *)(v17 + 24) = v13;
    }
    else
    {
      __break(1u);
    }
  }
}

id _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forPresented10presenting6sourceSo06UIViewJ21AnimatedTransitioning_pSgSo0oJ0C_A2KtF_0()
{
  uint64_t v1 = v0;
  sub_100032EA8((uint64_t)v0 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate, (uint64_t)v12);
  if (v13)
  {
    sub_100032F70((uint64_t)v12, (uint64_t)v8);
    sub_100032F10((uint64_t)v12);
    uint64_t v2 = v9;
    uint64_t v3 = v10;
    sub_100017184(v8, v9);
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 8))(v0, v2, v3);
    sub_100017134((uint64_t)v8);
  }
  else
  {
    sub_100032F10((uint64_t)v12);
  }
  id v4 = (objc_class *)type metadata accessor for APUISystemApertureElementTransition();
  uint64_t v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay] = 1;
  *(void *)&v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator] = v1;
  v11.receiver = v5;
  v11.super_class = v4;
  id v6 = v1;
  return [super init];
}

id _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forDismissedSo06UIViewJ21AnimatedTransitioning_pSgSo0mJ0C_tF_0()
{
  uint64_t v1 = v0;
  sub_100032EA8((uint64_t)v0 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate, (uint64_t)v12);
  if (v13)
  {
    sub_100032F70((uint64_t)v12, (uint64_t)v8);
    sub_100032F10((uint64_t)v12);
    uint64_t v2 = v9;
    uint64_t v3 = v10;
    sub_100017184(v8, v9);
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 16))(v0, v2, v3);
    sub_100017134((uint64_t)v8);
  }
  else
  {
    sub_100032F10((uint64_t)v12);
  }
  id v4 = (objc_class *)type metadata accessor for APUISystemApertureElementTransition();
  uint64_t v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator] = v1;
  v11.receiver = v5;
  v11.super_class = v4;
  id v6 = v1;
  return [super init];
}

uint64_t type metadata accessor for APUISystemApertureElementTransitionCoordinator()
{
  return self;
}

uint64_t sub_10003279C()
{
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000327D4()
{
  return sub_1000323BC(*(void (**)(void))(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t type metadata accessor for APUISystemApertureElementTransition()
{
  return self;
}

uint64_t sub_100032808()
{
  return swift_getWitnessTable();
}

unint64_t sub_10003286C()
{
  unint64_t result = qword_100058548;
  if (!qword_100058548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058548);
  }
  return result;
}

uint64_t sub_1000328C0()
{
  return swift_getWitnessTable();
}

uint64_t sub_100032928(uint64_t a1, char a2)
{
  if (a2) {
    return swift_unknownObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t destroy for RemoteAlertViewModifier(uint64_t a1)
{
  sub_10002AE38(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for RemoteAlertViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_100032928(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RemoteAlertViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_100032928(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002AE38(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RemoteAlertViewModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RemoteAlertViewModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002AE38(v6, v7);
  swift_release();
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  swift_release();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  *(unsigned char *)(a1 + 33) = *((unsigned char *)a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteAlertViewModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteAlertViewModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteAlertViewModifier()
{
  return &type metadata for RemoteAlertViewModifier;
}

uint64_t sub_100032BE8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100032C08(unsigned char *a1, unsigned char *a2)
{
  sub_1000317C8(a1, a2, v2 + 16);
}

uint64_t sub_100032C10(uint64_t a1)
{
  return a1;
}

unint64_t sub_100032C40()
{
  unint64_t result = qword_100058560;
  if (!qword_100058560)
  {
    sub_10000877C(&qword_100058558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058560);
  }
  return result;
}

uint64_t sub_100032CA4()
{
  sub_10002AE38(*(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

id sub_100032D08(char a1)
{
  return sub_100031C80(a1, *(void **)(v1 + 16), (uint64_t *)(v1 + 24), *(void **)(v1 + 80));
}

uint64_t sub_100032D18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100032D28()
{
  return swift_release();
}

uint64_t sub_100032D34()
{
  sub_10002AE38(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100032D88()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100032DDC()
{
  return _swift_deallocObject(v0, 120, 7);
}

id sub_100032E34()
{
  return sub_10003141C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 80), *(double *)(v0 + 48), *(double *)(v0 + 56), *(double *)(v0 + 64), *(double *)(v0 + 72), *(double *)(v0 + 88), *(double *)(v0 + 96), *(double *)(v0 + 104), *(double *)(v0 + 112));
}

uint64_t sub_100032E54()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100032E9C(char a1)
{
  sub_100031554(a1, *(id *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100032EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000847C(&qword_1000585C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100032F10(uint64_t a1)
{
  uint64_t v2 = sub_10000847C(&qword_1000585C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100032F70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for APUIRemoteAlertTransitioningDelegateKey()
{
  return &type metadata for APUIRemoteAlertTransitioningDelegateKey;
}

uint64_t sub_100032FE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100033064()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_1000585E0);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_1000585E0);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100033250(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6 = qword_100056DC8;
  id v12 = a3;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_1000084C0(v8, (uint64_t)qword_1000585E0);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    objc_super v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a4, v11, 2u);
    swift_slowDealloc();
  }
}

id sub_1000333C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WindowSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for WindowSceneDelegate()
{
  return self;
}

void sub_10003342C(void *a1)
{
  uint64_t v2 = v1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    char v5 = (void *)v4;
    uint64_t v6 = qword_100056DC8;
    id v7 = a1;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_1000084C0(v8, (uint64_t)qword_1000585E0);
    id v9 = v7;
    os_log_type_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      id v13 = [v5 description];
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v16 = v15;

      sub_10002D634(v14, v16, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "WindowSceneDelegate: Received windowScene: %s. Hosting debugging UI for ActivityProgressUI Launch Angel.", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v17 = [objc_allocWithZone((Class)type metadata accessor for APUISecureWindow()) initWithWindowScene:v5];
    *(unsigned char *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_testAppView) = 0;
    id v18 = objc_allocWithZone((Class)sub_10000847C(qword_1000586F0));
    id v19 = (void *)UIHostingController.init(rootView:)();
    [v17 setRootViewController:v19];
    [v17 makeKeyAndVisible];
    uint64_t v20 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window) = v17;
    id v21 = v17;

    if (qword_100056D28 != -1) {
      swift_once();
    }
    sub_10001D510();
  }
}

uint64_t *APUISystemApertureView.compactDimension.unsafeMutableAddressor()
{
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  return &static APUISystemApertureView.compactDimension;
}

double APUISystemApertureView.sizeThatFits(_:for:)(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3 && (unint64_t)(a1 - 2) > 1) {
    return 48.3333;
  }
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  return *(double *)&static APUISystemApertureView.compactDimension;
}

uint64_t APUISystemApertureView.createConstraints(forSubview:offset:alignedToEdge:)(void *a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  switch(a2)
  {
    case 1:
    case 4:
      sub_10000847C(&qword_100057DD0);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_10003EAE0;
      id v9 = [a1 widthAnchor];
      id v10 = [v4 widthAnchor];
      id v11 = [v9 constraintEqualToAnchor:v10 constant:-a3];

      *(void *)(v8 + 32) = v11;
      id v12 = [a1 heightAnchor];
      id v13 = [a1 widthAnchor];
      id v14 = [v12 constraintEqualToAnchor:v13];

      *(void *)(v8 + 40) = v14;
      uint64_t v35 = v8;
      specialized Array._endMutation()();
      if (a2 == 1)
      {
        id v15 = [a1 topAnchor];
        id v16 = [v4 topAnchor];
      }
      else
      {
        id v15 = [a1 bottomAnchor];
        id v16 = [v4 bottomAnchor];
      }
      goto LABEL_4;
    case 2:
    case 8:
      sub_10000847C(&qword_100057DD0);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_10003EAE0;
      id v19 = [a1 heightAnchor];
      id v20 = [v4 heightAnchor];
      id v21 = [v19 constraintEqualToAnchor:v20 constant:-a3];

      *(void *)(v18 + 32) = v21;
      id v22 = [a1 widthAnchor];
      id v23 = [a1 heightAnchor];
      id v24 = [v22 constraintEqualToAnchor:v23];

      *(void *)(v18 + 40) = v24;
      uint64_t v35 = v18;
      specialized Array._endMutation()();
      if (a2 == 2)
      {
        id v15 = [a1 leadingAnchor];
        id v16 = [v4 leadingAnchor];
      }
      else
      {
        id v15 = [a1 trailingAnchor];
        id v16 = [v4 trailingAnchor];
      }
LABEL_4:
      id v17 = [v15 constraintEqualToAnchor:v16];
      id v33 = v17;

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      break;
    default:
      sub_10000847C(&qword_100057DD0);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_10003EAE0;
      id v26 = [a1 widthAnchor];
      id v27 = [v4 widthAnchor];
      double v28 = -a3;
      id v29 = [v26 constraintEqualToAnchor:v27 constant:v28];

      *(void *)(v25 + 32) = v29;
      id v30 = [a1 heightAnchor];
      id v31 = [v4 heightAnchor];
      id v32 = [v30 constraintEqualToAnchor:v31 constant:v28];

      *(void *)(v25 + 40) = v32;
      uint64_t v35 = v25;
      specialized Array._endMutation()();
      break;
  }
  return v35;
}

void sub_100033D0C()
{
  static APUISystemApertureView.compactDimension = 0x4037000000000000;
}

double static APUISystemApertureView.compactDimension.getter()
{
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  return *(double *)&static APUISystemApertureView.compactDimension;
}

uint64_t APUISystemApertureView.expanded.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  swift_beginAccess();
  return *v1;
}

uint64_t APUISystemApertureView.expanded.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*APUISystemApertureView.expanded.modify())()
{
  return j__swift_endAccess;
}

id APUISystemApertureView.init()()
{
  v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded] = 0;
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  double v1 = *(double *)&static APUISystemApertureView.compactDimension;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for APUISystemApertureView();
  return [super initWithFrame:0.0, 0.0, v1, v1];
}

void APUISystemApertureView.init(coder:)()
{
  v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

double static APUISystemApertureView.size(forExpanded:)(char a1)
{
  if (a1) {
    return 48.3333;
  }
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  return *(double *)&static APUISystemApertureView.compactDimension;
}

double APUISystemApertureView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)()
{
  if ((*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x58))()) {
    return 48.3333;
  }
  if (qword_100056DD0 != -1) {
    swift_once();
  }
  return *(double *)&static APUISystemApertureView.compactDimension;
}

id APUISystemApertureView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithFrame:a1, a2, a3, a4];
}

void APUISystemApertureView.init(frame:)()
{
}

id APUISystemApertureView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUISystemApertureView();
  return [super dealloc];
}

uint64_t type metadata accessor for APUISystemApertureView()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for BackgroundActivityAppIcon(uint64_t a1, uint64_t a2)
{
  objc_super v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for BackgroundActivityAppIcon(id *a1)
{
}

uint64_t assignWithCopy for BackgroundActivityAppIcon(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  char v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for BackgroundActivityAppIcon(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BackgroundActivityAppIcon(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityAppIcon(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
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

uint64_t storeEnumTagSinglePayload for BackgroundActivityAppIcon(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityAppIcon()
{
  return &type metadata for BackgroundActivityAppIcon;
}

uint64_t destroy for BackgroundActivityView()
{
  return sub_100018AB4();
}

uint64_t _s18ActivityProgressUI22BackgroundActivityViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100008AC0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for BackgroundActivityView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100008AC0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100018AB4();
  return a1;
}

uint64_t assignWithTake for BackgroundActivityView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100018AB4();
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityView()
{
  return &type metadata for BackgroundActivityView;
}

uint64_t sub_1000347C8()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_1000347E4@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10003489C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100058418, &qword_100058400).n128_u64[0];
  return result;
}

double sub_100034840@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10003489C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100058420, &qword_1000583F8).n128_u64[0];
  return result;
}

__n128 sub_10003489C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  id v19 = a17;
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
    double v28 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    id v19 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100008CFC(v17, a9, a16);
  id v29 = (_OWORD *)(a9 + *(int *)(sub_10000847C(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  _OWORD *v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  void v29[2] = v33;
  void v29[3] = v34;
  return result;
}

uint64_t sub_100034A6C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20 = a16;
  uint64_t v21 = a17;
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
    id v30 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    uint64_t v20 = a16;
    uint64_t v21 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = v20;
  *(void *)(a9 + 8) = v21;
  *(void *)(a9 + 16) = a18;
  *(void *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_100034C48()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100058738);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_100058738);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100034D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v42 = a4;
  char v6 = a3 & 1;
  uint64_t v7 = sub_10000847C(&qword_100058750);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10000847C(&qword_100058758);
  __chkstk_darwin(v39);
  uint64_t v38 = (uint64_t)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Locale();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v12 - 8);
  type metadata accessor for BackgroundActivitySession();
  uint64_t v13 = sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
  int v14 = *(unsigned __int8 *)(StateObject.wrappedValue.getter()
                           + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release();
  if (v14 == 1)
  {
    if (qword_100056D60 != -1) {
      swift_once();
    }
    id v15 = &xmmword_100058BB0;
  }
  else
  {
    if (qword_100056D68 != -1) {
      swift_once();
    }
    id v15 = &xmmword_100058BD0;
  }
  uint64_t v16 = *((void *)v15 + 3);
  uint64_t v36 = *((void *)v15 + 2);
  uint64_t v37 = v16;
  uint64_t v17 = *((void *)v15 + 1);
  uint64_t v34 = *(void *)v15;
  uint64_t v35 = v17;
  StateObject.wrappedValue.getter();
  v33[1] = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  if (v43 == 1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    uint64_t v18 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v20 = v19;
  }
  else
  {
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v18 = v43;
    uint64_t v20 = v44;
  }
  uint64_t v21 = static VerticalAlignment.center.getter();
  if (qword_100056D70 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_100058BF0;
  *(void *)id v9 = v21;
  *((void *)v9 + 1) = v22;
  v9[16] = 0;
  uint64_t v23 = sub_10000847C(&qword_100058760);
  sub_100035224(v40, v41, v6, v18, v20, &v9[*(int *)(v23 + 44)]);
  swift_bridgeObjectRelease();
  char v24 = static Edge.Set.all.getter();
  uint64_t v25 = v38;
  sub_100008CFC((uint64_t)v9, v38, &qword_100058750);
  uint64_t v26 = v25 + *(int *)(v39 + 36);
  *(unsigned char *)uint64_t v26 = v24;
  uint64_t v27 = v35;
  *(void *)(v26 + 8) = v34;
  *(void *)(v26 + 16) = v27;
  uint64_t v28 = v37;
  *(void *)(v26 + 24) = v36;
  *(void *)(v26 + 32) = v28;
  *(unsigned char *)(v26 + 40) = 0;
  sub_100018120((uint64_t)v9, &qword_100058750);
  char v29 = *(unsigned char *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release();
  uint64_t v30 = v42;
  sub_100008CFC(v25, v42, &qword_100058758);
  long long v31 = (unsigned char *)(v30 + *(int *)(sub_10000847C(&qword_100058768) + 36));
  unsigned char *v31 = v29;
  v31[1] = 0;
  return sub_100018120(v25, &qword_100058758);
}

uint64_t sub_100035224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  id v74 = (void *)a5;
  uint64_t v71 = a4;
  uint64_t v72 = a6;
  int v8 = a3 & 1;
  uint64_t v9 = type metadata accessor for APKDeviceLockState();
  uint64_t v79 = *(void *)(v9 - 8);
  uint64_t v80 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v78 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v76 = (uint64_t)&v70 - v12;
  uint64_t v86 = sub_10000847C(&qword_100058770);
  uint64_t v73 = *(void *)(v86 - 8);
  uint64_t v13 = __chkstk_darwin(v86);
  unint64_t v85 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v88 = (char *)&v70 - v15;
  uint64_t v16 = sub_10000847C(&qword_100058778);
  uint64_t v83 = *(void *)(v16 - 8);
  uint64_t v84 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v82 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v87 = (char *)&v70 - v19;
  uint64_t v20 = type metadata accessor for BackgroundActivitySession();
  uint64_t v21 = sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
  uint64_t v81 = a1;
  int v22 = v8;
  uint64_t v77 = v20;
  uint64_t v75 = v21;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = v96;
  if (qword_100056D78 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_100058BF8;
  if (qword_100056D80 != -1) {
    swift_once();
  }
  *(void *)&long long v96 = v23;
  *((void *)&v96 + 1) = v24;
  *(void *)&long long v97 = qword_100058C00;
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v81;
  *(void *)(v25 + 16) = v81;
  *(void *)(v25 + 24) = a2;
  *(unsigned char *)(v25 + 32) = v22 != 0;
  sub_100008AC0();
  sub_10000ABB8();
  View.onTapGesture(count:perform:)();
  swift_release();

  uint64_t v27 = static HorizontalAlignment.leading.getter();
  sub_100036594(v71, (uint64_t)v74, (uint64_t)v92);
  *(_OWORD *)((char *)&v94[10] + 7) = v92[10];
  *(_OWORD *)((char *)&v94[11] + 7) = v92[11];
  *(_OWORD *)((char *)&v94[12] + 7) = v92[12];
  *(void *)((char *)&v94[13] + 7) = v93;
  *(_OWORD *)((char *)&v94[6] + 7) = v92[6];
  *(_OWORD *)((char *)&v94[7] + 7) = v92[7];
  *(_OWORD *)((char *)&v94[8] + 7) = v92[8];
  *(_OWORD *)((char *)&v94[9] + 7) = v92[9];
  *(_OWORD *)((char *)&v94[2] + 7) = v92[2];
  *(_OWORD *)((char *)&v94[3] + 7) = v92[3];
  *(_OWORD *)((char *)&v94[4] + 7) = v92[4];
  *(_OWORD *)((char *)&v94[5] + 7) = v92[5];
  *(_OWORD *)((char *)v94 + 7) = v92[0];
  *(_OWORD *)((char *)&v94[1] + 7) = v92[1];
  *(_OWORD *)((char *)&v90[10] + 1) = v94[10];
  *(_OWORD *)((char *)&v90[11] + 1) = v94[11];
  *(_OWORD *)((char *)&v90[12] + 1) = v94[12];
  v90[13] = *(_OWORD *)((char *)&v94[12] + 15);
  *(_OWORD *)((char *)&v90[6] + 1) = v94[6];
  *(_OWORD *)((char *)&v90[7] + 1) = v94[7];
  *(_OWORD *)((char *)&v90[8] + 1) = v94[8];
  *(_OWORD *)((char *)&v90[9] + 1) = v94[9];
  *(_OWORD *)((char *)&v90[2] + 1) = v94[2];
  *(_OWORD *)((char *)&v90[3] + 1) = v94[3];
  *(_OWORD *)((char *)&v90[4] + 1) = v94[4];
  *(_OWORD *)((char *)&v90[5] + 1) = v94[5];
  *(_OWORD *)((char *)v90 + 1) = v94[0];
  char v95 = 0;
  long long v89 = (unint64_t)v27;
  LOBYTE(v90[0]) = 0;
  *(_OWORD *)((char *)&v90[1] + 1) = v94[1];
  char v91 = 0;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v26;
  *(void *)(v28 + 24) = a2;
  *(unsigned char *)(v28 + 32) = v22 != 0;
  sub_100008AC0();
  sub_10000847C(&qword_100058780);
  sub_100038280();
  View.onTapGesture(count:perform:)();
  swift_release();
  long long v108 = v90[11];
  long long v109 = v90[12];
  long long v110 = v90[13];
  char v111 = v91;
  long long v104 = v90[7];
  long long v105 = v90[8];
  long long v106 = v90[9];
  long long v107 = v90[10];
  long long v100 = v90[3];
  long long v101 = v90[4];
  long long v102 = v90[5];
  long long v103 = v90[6];
  long long v96 = v89;
  long long v97 = v90[0];
  long long v98 = v90[1];
  long long v99 = v90[2];
  sub_100038344((uint64_t)&v96);
  uint64_t v70 = a2;
  LODWORD(v71) = v22;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v29 = v76;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  long long v31 = v78;
  uint64_t v30 = v79;
  uint64_t v32 = v80;
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, enum case for APKDeviceLockState.unlocked(_:), v80);
  char v33 = static APKDeviceLockState.== infix(_:_:)();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v30 + 8);
  v34(v31, v32);
  v34((char *)v29, v32);
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  id v74 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  if (v33)
  {
    uint64_t v44 = v70;
    int v45 = v71;
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((v89 & 1) != 0
      || (StateObject.wrappedValue.getter(),
          swift_getKeyPath(),
          swift_getKeyPath(),
          static Published.subscript.getter(),
          swift_release(),
          swift_release(),
          swift_release(),
          (v89 & 1) != 0))
    {
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      id v74 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
    }
    else
    {
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = v26;
      *(void *)(v36 + 24) = v44;
      *(unsigned char *)(v36 + 32) = v45 != 0;
      sub_10000AC0C();
      sub_100008AC0();
      if (qword_100056DB0 != -1) {
        swift_once();
      }
      swift_retain();
      id v74 = (void *)UIColor.init(_:)();
      if (qword_100056D98 != -1) {
        swift_once();
      }
      static Alignment.trailing.getter();
      _FrameLayout.init(width:height:alignment:)();
      uint64_t v38 = (char *)v89;
      uint64_t v39 = BYTE8(v89);
      uint64_t v40 = *(void *)&v90[0];
      uint64_t v41 = BYTE8(v90[0]);
      uint64_t v43 = *((void *)&v90[1] + 1);
      uint64_t v42 = *(void *)&v90[1];
      uint64_t v35 = sub_100038418;
      uint64_t v37 = 256;
    }
  }
  uint64_t v75 = v36;
  uint64_t v76 = v37;
  uint64_t v77 = (uint64_t)v35;
  uint64_t v78 = v38;
  uint64_t v79 = v42;
  uint64_t v80 = v43;
  uint64_t v70 = v39;
  uint64_t v71 = v40;
  uint64_t v81 = v41;
  id v46 = v82;
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
  uint64_t v48 = v84;
  v47(v82, v87, v84);
  uint64_t v49 = v73;
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  id v51 = v85;
  v50(v85, v88, v86);
  id v52 = v72;
  v47(v72, v46, v48);
  uint64_t v53 = sub_10000847C(&qword_1000587B0);
  uint64_t v54 = v86;
  v50(&v52[*(int *)(v53 + 48)], v51, v86);
  long long v55 = &v52[*(int *)(v53 + 64)];
  uint64_t v57 = v76;
  uint64_t v56 = v77;
  unint64_t v59 = v74;
  uint64_t v58 = v75;
  *(void *)long long v55 = v77;
  *((void *)v55 + 1) = v58;
  *((void *)v55 + 2) = v57;
  *((void *)v55 + 3) = v59;
  uint64_t v60 = v79;
  uint64_t v61 = v70;
  uint64_t v62 = v71;
  *((void *)v55 + 4) = v78;
  *((void *)v55 + 5) = v61;
  uint64_t v64 = v80;
  uint64_t v63 = v81;
  *((void *)v55 + 6) = v62;
  *((void *)v55 + 7) = v63;
  *((void *)v55 + 8) = v60;
  *((void *)v55 + 9) = v64;
  sub_100038384(v56, v58, v57, v59);
  os_log_type_t v65 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v66 = v54;
  v65(v88, v54);
  uint64_t v67 = v84;
  uint64_t v68 = *(void (**)(char *, uint64_t))(v83 + 8);
  v68(v87, v84);
  sub_1000383C8(v77, v75, v76, v59);
  v65(v85, v66);
  return ((uint64_t (*)(char *, uint64_t))v68)(v82, v67);
}

void sub_100035D34(uint64_t a1, uint64_t a2, char a3)
{
  int v5 = a3 & 1;
  uint64_t v6 = type metadata accessor for APKDeviceLockState();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v43 - v11;
  uint64_t v13 = type metadata accessor for BackgroundActivitySession();
  uint64_t v14 = sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
  uint64_t v46 = v13;
  uint64_t v45 = v14;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for APKDeviceLockState.unlocked(_:), v6);
  LOBYTE(v13) = static APKDeviceLockState.== infix(_:_:)();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  v15(v12, v6);
  if (v13)
  {
    if (qword_100056DD8 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_1000084C0(v16, (uint64_t)qword_100058738);
    sub_100008AC0();
    sub_100008AC0();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      aBlock[0] = v44;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v43 = v19 + 4;
      uint64_t v20 = StateObject.wrappedValue.getter();
      uint64_t v22 = *(void *)(v20 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      unint64_t v21 = *(void *)(v20 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v48 = sub_10002D634(v22, v21, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100018AB4();
      sub_100018AB4();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Launching app for bundle ID %s", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100018AB4();
      sub_100018AB4();
    }

    sub_10000847C(&qword_1000587B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10003EB40;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v31;
    *(void *)(inited + 72) = &type metadata for Bool;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 88) = v32;
    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 96) = v33;
    *(void *)(inited + 104) = v34;
    sub_1000044A8(inited);
    id v35 = [objc_allocWithZone((Class)_LSOpenConfiguration) init];
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v35 setFrontBoardOptions:isa];

    id v37 = [self defaultWorkspace];
    if (v37)
    {
      uint64_t v38 = v37;
      StateObject.wrappedValue.getter();
      swift_bridgeObjectRetain();
      swift_release();
      NSString v39 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = a1;
      *(void *)(v40 + 24) = a2;
      *(unsigned char *)(v40 + 32) = v5 != 0;
      aBlock[4] = (uint64_t)sub_100038464;
      aBlock[5] = v40;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100036F50;
      aBlock[3] = (uint64_t)&unk_10004F068;
      uint64_t v41 = _Block_copy(aBlock);
      sub_100008AC0();
      id v42 = v35;
      swift_release();
      [v38 openApplicationWithBundleIdentifier:v39 usingConfiguration:v42 completionHandler:v41];
      _Block_release(v41);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_100056DD8 != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    sub_1000084C0(v23, (uint64_t)qword_100058738);
    sub_100008AC0();
    sub_100008AC0();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      aBlock[0] = v44;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v43 = v26 + 4;
      uint64_t v27 = StateObject.wrappedValue.getter();
      uint64_t v28 = *(void *)(v27 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      unint64_t v29 = *(void *)(v27 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v48 = sub_10002D634(v28, v29, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100018AB4();
      sub_100018AB4();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "App launch for bundle ID %s failed because device is locked", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100018AB4();
      sub_100018AB4();
    }
  }
}

uint64_t sub_100036594@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  type metadata accessor for BackgroundActivitySession();
  sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
  int v6 = *(unsigned __int8 *)(StateObject.wrappedValue.getter()
                          + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release();
  uint64_t v35 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  char v34 = v6;
  if (v6 == 1)
  {
    if (qword_100056D48 != -1) {
      swift_once();
    }
    static Alignment.center.getter();
    uint64_t v35 = 1;
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v7 = v49;
    uint64_t v8 = v50;
    uint64_t v9 = v51;
    uint64_t v10 = v52;
    uint64_t v11 = v53;
    uint64_t v12 = v54;
  }
  uint64_t v31 = v11;
  uint64_t v32 = v10;
  uint64_t v33 = v12;
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  uint64_t v15 = v9;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v16 = static Alignment.leading.getter();
  sub_100034A6C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v36, 0.0, 1, 0.0, 1, v16, v17, *(uint64_t *)v46, *(uint64_t *)&v46[8], a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v18 = v42;
  v45[6] = v42;
  v45[7] = v43;
  v45[8] = v44;
  v45[2] = v38;
  v45[3] = v39;
  v45[4] = v40;
  v45[5] = v41;
  long long v19 = v36;
  v45[0] = v36;
  v45[1] = v37;
  *(_OWORD *)&v46[103] = v42;
  long long v21 = v40;
  long long v20 = v41;
  *(_OWORD *)&v46[87] = v41;
  *(_OWORD *)&v46[39] = v38;
  long long v22 = v38;
  long long v23 = v37;
  *(_OWORD *)&v46[23] = v37;
  long long v24 = v43;
  *(_OWORD *)&v46[119] = v43;
  *(_OWORD *)&v46[135] = v44;
  long long v25 = v39;
  *(_OWORD *)&v46[55] = v39;
  *(_OWORD *)&v46[71] = v40;
  *(_OWORD *)&v46[7] = v36;
  long long v26 = *(_OWORD *)&v46[112];
  *(_OWORD *)(a3 + 161) = *(_OWORD *)&v46[96];
  *(_OWORD *)(a3 + 177) = v26;
  *(_OWORD *)(a3 + 193) = *(_OWORD *)&v46[128];
  long long v27 = *(_OWORD *)&v46[48];
  *(_OWORD *)(a3 + 97) = *(_OWORD *)&v46[32];
  *(_OWORD *)(a3 + 113) = v27;
  long long v28 = *(_OWORD *)&v46[80];
  *(_OWORD *)(a3 + 129) = *(_OWORD *)&v46[64];
  *(_OWORD *)(a3 + 145) = v28;
  long long v29 = *(_OWORD *)&v46[16];
  *(_OWORD *)(a3 + 65) = *(_OWORD *)v46;
  *(_OWORD *)(a3 + 81) = v29;
  v48[6] = v18;
  v48[7] = v24;
  v48[8] = v44;
  v48[2] = v22;
  v48[3] = v25;
  v48[4] = v21;
  v48[5] = v20;
  char v47 = v34 ^ 1;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = v35;
  *(void *)(a3 + 16) = v13;
  *(void *)(a3 + 24) = v14;
  *(void *)(a3 + 32) = v15;
  *(void *)(a3 + 40) = v32;
  *(void *)(a3 + 48) = v31;
  *(void *)(a3 + 56) = v33;
  *(unsigned char *)(a3 + 64) = v34 ^ 1;
  *(void *)(a3 + 208) = *(void *)&v46[143];
  v48[0] = v19;
  v48[1] = v23;
  sub_100038490((uint64_t)v45);
  return sub_1000384C8((uint64_t)v48);
}

uint64_t sub_100036904()
{
  type metadata accessor for BackgroundActivitySession();
  sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);

  return StateObject.wrappedValue.getter();
}

void sub_100036998(char a1, uint64_t a2)
{
  if (a1)
  {
    if (qword_100056DD8 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_1000084C0(v2, (uint64_t)qword_100058738);
    sub_100008AC0();
    sub_100008AC0();
    osos_log_t log = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      int v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)int v4 = 136315138;
      type metadata accessor for BackgroundActivitySession();
      sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
      uint64_t v5 = StateObject.wrappedValue.getter();
      uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      unint64_t v6 = *(void *)(v5 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain();
      swift_release();
      sub_10002D634(v7, v6, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100018AB4();
      sub_100018AB4();
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "App launch succeeded for bundle ID %s", v4, 0xCu);
      swift_arrayDestroy();
LABEL_18:
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    sub_100018AB4();
    sub_100018AB4();
  }
  else
  {
    if (qword_100056DD8 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_1000084C0(v9, (uint64_t)qword_100058738);
    sub_100008AC0();
    swift_errorRetain();
    sub_100008AC0();
    swift_errorRetain();
    osos_log_t log = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315394;
      type metadata accessor for BackgroundActivitySession();
      sub_100038FCC((unint64_t *)&qword_100057B68, (void (*)(uint64_t))type metadata accessor for BackgroundActivitySession);
      uint64_t v12 = StateObject.wrappedValue.getter();
      uint64_t v13 = *(void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      unint64_t v14 = *(void *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain();
      swift_release();
      sub_10002D634(v13, v14, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100018AB4();
      sub_100018AB4();
      *(_WORD *)(v11 + 12) = 2112;
      if (a2)
      {
        swift_errorRetain();
        uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v15 = 0;
      }
      *uint64_t v16 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "App launch for bundle ID %s failed: %@", (uint8_t *)v11, 0x16u);
      sub_10000847C(&qword_100057E60);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      goto LABEL_18;
    }
    sub_100018AB4();
    sub_100018AB4();
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_100036F50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100036FC8@<X0>(uint64_t a1@<X8>)
{
  return sub_100034D10(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_100036FD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v6 = sub_10000847C(&qword_1000587C0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_10000847C(&qword_1000587C8);
  __chkstk_darwin(v53);
  os_log_type_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v52);
  uint64_t v12 = (double *)((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for Image.ResizingMode();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_10000847C(&qword_1000587D0);
  __chkstk_darwin(v49);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10000847C(&qword_1000587D8);
  __chkstk_darwin(v51);
  unsigned __int8 v50 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_10000847C(&qword_1000587E0);
  uint64_t v20 = __chkstk_darwin(v54);
  __chkstk_darwin(v20);
  if (a1)
  {
    uint64_t v45 = v22;
    uint64_t v46 = (uint64_t)&v36 - v21;
    id v48 = a1;
    Image.init(uiImage:)();
    uint64_t v47 = a2;
    (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for Image.ResizingMode.stretch(_:), v13);
    uint64_t v42 = Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    long long v44 = v8;
    uint64_t v41 = v55;
    int v40 = v56;
    uint64_t v39 = v57;
    int v38 = v58;
    uint64_t v37 = v59;
    uint64_t v36 = v60;
    uint64_t v23 = (uint64_t)v10;
    uint64_t v24 = v52;
    long long v25 = (char *)v12 + *(int *)(v52 + 20);
    uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v27 = type metadata accessor for RoundedCornerStyle();
    long long v28 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104);
    uint64_t v43 = v6;
    v28(v25, v26, v27);
    *uint64_t v12 = a3;
    v12[1] = a3;
    sub_10003887C((uint64_t)v12, v23);
    uint64_t v29 = v53;
    *(_WORD *)(v23 + *(int *)(v53 + 36)) = 256;
    sub_100008CFC(v23, (uint64_t)&v18[*(int *)(v49 + 36)], &qword_1000587C8);
    *(void *)uint64_t v18 = v42;
    *((void *)v18 + 1) = 0;
    *((_WORD *)v18 + 8) = 257;
    *((void *)v18 + 3) = v41;
    v18[32] = v40;
    *((void *)v18 + 5) = v39;
    v18[48] = v38;
    uint64_t v30 = v36;
    *((void *)v18 + 7) = v37;
    *((void *)v18 + 8) = v30;
    *((_WORD *)v18 + 36) = 0;
    swift_retain();
    sub_100018120(v23, &qword_1000587C8);
    sub_1000388E0((uint64_t)v12);
    swift_release();
    v28((char *)v12 + *(int *)(v24 + 20), v26, v27);
    *uint64_t v12 = a3;
    v12[1] = a3;
    uint64_t v31 = (uint64_t)v50;
    uint64_t v32 = (uint64_t)&v50[*(int *)(v51 + 36)];
    sub_10003887C((uint64_t)v12, v32);
    *(_WORD *)(v32 + *(int *)(v29 + 36)) = 256;
    sub_100008CFC((uint64_t)v18, v31, &qword_1000587D0);
    sub_1000388E0((uint64_t)v12);
    sub_100018120((uint64_t)v18, &qword_1000587D0);
    sub_1000385AC();
    uint64_t v33 = v45;
    View.accessibilityHidden(_:)();
    sub_100018120(v31, &qword_1000587D8);
    uint64_t v34 = v46;
    sub_1000102A0(v33, v46, &qword_1000587E0);
    sub_100008CFC(v34, (uint64_t)v44, &qword_1000587E0);
    swift_storeEnumTagMultiPayload();
    sub_100038500();
    _ConditionalContent<>.init(storage:)();

    return sub_100018120(v34, &qword_1000587E0);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_100038500();
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_100037618@<X0>(uint64_t a1@<X8>)
{
  return sub_100036FD4(*(void **)v1, a1, *(double *)(v1 + 16));
}

uint64_t sub_100037624()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100037640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a1;
  uint64_t v90 = a2;
  uint64_t v91 = sub_10000847C(&qword_100058880);
  __chkstk_darwin(v91);
  os_log_type_t v3 = (char *)&v71 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10000847C(&qword_100058888);
  uint64_t v4 = __chkstk_darwin(v81);
  id v74 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v71 - v6;
  uint64_t v8 = type metadata accessor for DynamicTypeSize();
  uint64_t v9 = *(void **)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v71 - v13;
  uint64_t v79 = sub_10000847C(&qword_100058890);
  uint64_t v15 = __chkstk_darwin(v79);
  uint64_t v72 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v76 = (uint64_t)&v71 - v17;
  uint64_t v78 = sub_10000847C(&qword_100058898);
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v75 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_10000847C(&qword_1000588A0);
  uint64_t v19 = __chkstk_darwin(v84);
  uint64_t v73 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v80 = (uint64_t)&v71 - v21;
  uint64_t v87 = sub_10000847C(&qword_1000588A8);
  __chkstk_darwin(v87);
  uint64_t v89 = (uint64_t)&v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_10000847C(&qword_1000588B0);
  __chkstk_darwin(v83);
  uint64_t v82 = (uint64_t)&v71 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_10000847C(&qword_1000588B8);
  __chkstk_darwin(v88);
  unint64_t v85 = (char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10000847C(&qword_1000588C0);
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10000847C(&qword_1000588C8);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v71 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v35 = (char *)&v71 - v34;
  if (v33)
  {
    uint64_t v39 = v32;
    id v40 = [self mainScreen];
    [v40 bounds];
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;

    v95.origin.x = v42;
    v95.origin.y = v44;
    v95.size.width = v46;
    v95.size.height = v48;
    CGRectGetWidth(v95);
    if (qword_100056D50 != -1) {
      swift_once();
    }
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v49 = sub_10000847C(&qword_1000588D0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16))(v27, v86, v49);
    unsigned __int8 v50 = &v27[*(int *)(v25 + 36)];
    long long v51 = v93;
    *(_OWORD *)unsigned __int8 v50 = v92;
    *((_OWORD *)v50 + 1) = v51;
    *((_OWORD *)v50 + 2) = v94;
    sub_100008CFC((uint64_t)v27, (uint64_t)v31, &qword_1000588C0);
    *(_WORD *)&v31[*(int *)(v39 + 36)] = 256;
    sub_100018120((uint64_t)v27, &qword_1000588C0);
    uint64_t v37 = &qword_1000588C8;
    sub_1000102A0((uint64_t)v31, (uint64_t)v35, &qword_1000588C8);
    sub_100008CFC((uint64_t)v35, v82, &qword_1000588C8);
    swift_storeEnumTagMultiPayload();
    sub_100038D7C();
    sub_100038EA8();
    uint64_t v52 = (uint64_t)v85;
    _ConditionalContent<>.init(storage:)();
    sub_100008CFC(v52, v89, &qword_1000588B8);
    swift_storeEnumTagMultiPayload();
    sub_100038D00();
    sub_100038E10(&qword_100058908, &qword_100058880);
    _ConditionalContent<>.init(storage:)();
    sub_100018120(v52, &qword_1000588B8);
    uint64_t v38 = (uint64_t)v35;
    return sub_100018120(v38, v37);
  }
  if ((v33 & 0x100) == 0)
  {
    uint64_t v36 = sub_10000847C(&qword_1000588D0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16))(v3, v86, v36);
    *(_WORD *)&v3[*(int *)(v91 + 36)] = 256;
    uint64_t v37 = &qword_100058880;
    sub_100008CFC((uint64_t)v3, v89, &qword_100058880);
    swift_storeEnumTagMultiPayload();
    sub_100038D00();
    sub_100038E10(&qword_100058908, &qword_100058880);
    _ConditionalContent<>.init(storage:)();
    uint64_t v38 = (uint64_t)v3;
    return sub_100018120(v38, v37);
  }
  uint64_t v71 = v32;
  uint64_t v53 = (void (*)(char *, void, uint64_t))v9[13];
  v53(v14, enum case for DynamicTypeSize.xSmall(_:), v8);
  v53(v12, enum case for DynamicTypeSize.large(_:), v8);
  sub_100038FCC(&qword_100058910, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if (result)
  {
    uint64_t v55 = v81;
    unsigned __int8 v56 = &v7[*(int *)(v81 + 48)];
    uint64_t v57 = (void (*)(char *, char *, uint64_t))v9[4];
    v57(v7, v14, v8);
    v57(v56, v12, v8);
    unsigned __int8 v58 = v74;
    uint64_t v59 = &v74[*(int *)(v55 + 48)];
    uint64_t v60 = (void (*)(char *, char *, uint64_t))v9[2];
    v60(v74, v7, v8);
    v60(v59, v56, v8);
    uint64_t v61 = (uint64_t)v72;
    v57(v72, v58, v8);
    uint64_t v62 = (void (*)(char *, uint64_t))v9[1];
    v62(v59, v8);
    uint64_t v63 = &v58[*(int *)(v81 + 48)];
    v57(v58, v7, v8);
    v57(v63, v56, v8);
    v57((char *)(v61 + *(int *)(v79 + 36)), v63, v8);
    v62(v58, v8);
    uint64_t v64 = v76;
    sub_1000102A0(v61, v76, &qword_100058890);
    sub_10000847C(&qword_1000588D0);
    sub_100008AC8(&qword_1000588F0, &qword_1000588D0);
    sub_100008AC8(&qword_100058900, &qword_100058890);
    os_log_type_t v65 = v75;
    View.dynamicTypeSize<A>(_:)();
    sub_100018120(v64, &qword_100058890);
    uint64_t v66 = v77;
    uint64_t v67 = (uint64_t)v73;
    uint64_t v68 = v78;
    (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v73, v65, v78);
    *(_WORD *)(v67 + *(int *)(v84 + 36)) = 256;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v68);
    uint64_t v37 = &qword_1000588A0;
    uint64_t v69 = v80;
    sub_1000102A0(v67, v80, &qword_1000588A0);
    sub_100008CFC(v69, v82, &qword_1000588A0);
    swift_storeEnumTagMultiPayload();
    sub_100038D7C();
    sub_100038EA8();
    uint64_t v70 = (uint64_t)v85;
    _ConditionalContent<>.init(storage:)();
    sub_100008CFC(v70, v89, &qword_1000588B8);
    swift_storeEnumTagMultiPayload();
    sub_100038D00();
    sub_100038E10(&qword_100058908, &qword_100058880);
    _ConditionalContent<>.init(storage:)();
    sub_100018120(v70, &qword_1000588B8);
    uint64_t v38 = v69;
    return sub_100018120(v38, v37);
  }
  __break(1u);
  return result;
}

uint64_t sub_100038234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100037640(a1, a2);
}

void sub_100038274()
{
  sub_100035D34(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

unint64_t sub_100038280()
{
  unint64_t result = qword_100058788;
  if (!qword_100058788)
  {
    sub_10000877C(&qword_100058780);
    sub_100008AC8(&qword_100058790, &qword_100058798);
    sub_100008AC8(&qword_1000587A0, &qword_1000587A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058788);
  }
  return result;
}

uint64_t sub_100038344(uint64_t a1)
{
  return a1;
}

void sub_100038384(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    sub_100008AC0();
    id v4 = a4;
  }
}

void sub_1000383C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    sub_100018AB4();
  }
}

uint64_t sub_100038418()
{
  return sub_100036904();
}

uint64_t sub_100038428()
{
  sub_100018AB4();

  return _swift_deallocObject(v0, 33, 7);
}

void sub_100038464(char a1, uint64_t a2)
{
}

uint64_t sub_100038470(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100038480()
{
  return swift_release();
}

uint64_t sub_100038490(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000384C8(uint64_t a1)
{
  return a1;
}

unint64_t sub_100038500()
{
  unint64_t result = qword_1000587E8;
  if (!qword_1000587E8)
  {
    sub_10000877C(&qword_1000587E0);
    sub_1000385AC();
    sub_100038FCC(&qword_100058848, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000587E8);
  }
  return result;
}

unint64_t sub_1000385AC()
{
  unint64_t result = qword_1000587F0;
  if (!qword_1000587F0)
  {
    sub_10000877C(&qword_1000587D8);
    sub_10003864C();
    sub_100008AC8(&qword_100058840, &qword_1000587C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000587F0);
  }
  return result;
}

unint64_t sub_10003864C()
{
  unint64_t result = qword_1000587F8;
  if (!qword_1000587F8)
  {
    sub_10000877C(&qword_1000587D0);
    sub_1000386EC();
    sub_100008AC8(&qword_100058840, &qword_1000587C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000587F8);
  }
  return result;
}

unint64_t sub_1000386EC()
{
  unint64_t result = qword_100058800;
  if (!qword_100058800)
  {
    sub_10000877C(&qword_100058808);
    sub_10003878C();
    sub_100008AC8(&qword_100058830, &qword_100058838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058800);
  }
  return result;
}

unint64_t sub_10003878C()
{
  unint64_t result = qword_100058810;
  if (!qword_100058810)
  {
    sub_10000877C(&qword_100058818);
    sub_100038808();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058810);
  }
  return result;
}

unint64_t sub_100038808()
{
  unint64_t result = qword_100058820;
  if (!qword_100058820)
  {
    sub_10000877C(&qword_100058828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058820);
  }
  return result;
}

uint64_t sub_10003887C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000388E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_WORD *initializeBufferWithCopyOfBuffer for PlatterEnvironmentModifier(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlatterEnvironmentModifier(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlatterEnvironmentModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100038AB8);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlatterEnvironmentModifier()
{
  return &type metadata for PlatterEnvironmentModifier;
}

unint64_t sub_100038AF4()
{
  unint64_t result = qword_100058850;
  if (!qword_100058850)
  {
    sub_10000877C(&qword_100058768);
    sub_100038B70();
    sub_100038C10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058850);
  }
  return result;
}

unint64_t sub_100038B70()
{
  unint64_t result = qword_100058858;
  if (!qword_100058858)
  {
    sub_10000877C(&qword_100058758);
    sub_100008AC8(&qword_100058860, &qword_100058750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058858);
  }
  return result;
}

unint64_t sub_100038C10()
{
  unint64_t result = qword_100058868;
  if (!qword_100058868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058868);
  }
  return result;
}

unint64_t sub_100038C68()
{
  unint64_t result = qword_100058870;
  if (!qword_100058870)
  {
    sub_10000877C(&qword_100058878);
    sub_100038500();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058870);
  }
  return result;
}

uint64_t sub_100038CE4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100038D00()
{
  unint64_t result = qword_1000588D8;
  if (!qword_1000588D8)
  {
    sub_10000877C(&qword_1000588B8);
    sub_100038D7C();
    sub_100038EA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000588D8);
  }
  return result;
}

unint64_t sub_100038D7C()
{
  unint64_t result = qword_1000588E0;
  if (!qword_1000588E0)
  {
    sub_10000877C(&qword_1000588C8);
    sub_100038E10(&qword_1000588E8, &qword_1000588C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000588E0);
  }
  return result;
}

uint64_t sub_100038E10(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000877C(a2);
    sub_100008AC8(&qword_1000588F0, &qword_1000588D0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100038EA8()
{
  unint64_t result = qword_1000588F8;
  if (!qword_1000588F8)
  {
    sub_10000877C(&qword_1000588A0);
    sub_10000877C(&qword_1000588D0);
    sub_10000877C(&qword_100058890);
    sub_100008AC8(&qword_1000588F0, &qword_1000588D0);
    sub_100008AC8(&qword_100058900, &qword_100058890);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000588F8);
  }
  return result;
}

uint64_t sub_100038FCC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100039018()
{
  unint64_t result = qword_100058918;
  if (!qword_100058918)
  {
    sub_10000877C(&qword_100058920);
    sub_100038D00();
    sub_100038E10(&qword_100058908, &qword_100058880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058918);
  }
  return result;
}

char *APUILiveActivitiesHostingController.__allocating_init(rootView:)(uint64_t a1)
{
  int v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_10003A124(a1);
  (*(void (**)(uint64_t))(*(void *)(*((void *)v2 + 10) - 8) + 8))(a1);
  return v5;
}

id APUISecureWindow.__allocating_init(windowScene:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithWindowScene:a1];

  return v3;
}

uint64_t APUISecureHostingController.__allocating_init(rootView:)(uint64_t a1)
{
  uint64_t v3 = sub_10003A0DC(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1
                                                          + class metadata base offset for APUISecureHostingController)
                                              - 8)
                                  + 8))(a1);
  return v3;
}

uint64_t sub_1000391DC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000084F8(v0, qword_100058928);
  uint64_t v1 = sub_1000084C0(v0, (uint64_t)qword_100058928);
  if (qword_100056DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000084C0(v0, (uint64_t)qword_100058C38);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1000392A4()
{
  return 1;
}

uint64_t APUISecureHostingController.init(rootView:)(uint64_t a1)
{
  uint64_t v3 = swift_isaMask & *v1;
  uint64_t v4 = sub_100039FF4(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3
                                                          + class metadata base offset for APUISecureHostingController)
                                              - 8)
                                  + 8))(a1);
  return v4;
}

void *APUISecureHostingController.__allocating_init(coder:rootView:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return APUISecureHostingController.init(coder:rootView:)(a1, a2);
}

void *APUISecureHostingController.init(coder:rootView:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + class metadata base offset for APUISecureHostingController);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  BOOL v7 = (void *)UIHostingController.init(coder:rootView:)();
  int v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id APUISecureHostingController.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for APUISecureHostingController();
  [super initWithCoder:a1];

  return v3;
}

id sub_100039564(uint64_t a1, uint64_t a2, void *a3)
{
  return APUISecureHostingController.init(coder:)(a3);
}

id APUISecureHostingController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUISecureHostingController();
  [super dealloc];
}

id APUISecureWindow.init(windowScene:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  [super initWithWindowScene:a1];

  return v3;
}

id APUISecureWindow.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for APUISecureWindow();
  return [super initWithFrame:a1, a2, a3, a4];
}

id APUISecureWindow.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id APUISecureWindow.__allocating_init(contentRect:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithContentRect:a1, a2, a3, a4];
}

id APUISecureWindow.init(contentRect:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for APUISecureWindow();
  return [super initWithContentRect:a1, a2, a3, a4];
}

id APUISecureWindow.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUISecureWindow();
  [super dealloc];
}

double sub_100039980(void *a1)
{
  id v1 = a1;
  APUILiveActivitiesHostingController.preferredContentSize.getter();
  double v3 = v2;

  return v3;
}

id APUILiveActivitiesHostingController.preferredContentSize.getter()
{
  return [*(id *)(v0 + qword_100058940) preferredContentSize];
}

void sub_1000399DC(void *a1)
{
  id v1 = a1;
  APUILiveActivitiesHostingController.preferredContentSize.setter();
}

id APUILiveActivitiesHostingController.preferredContentSize.setter()
{
  return [*(id *)(v0 + qword_100058940) setPreferredContentSize:];
}

char *APUILiveActivitiesHostingController.init(rootView:)(uint64_t a1)
{
  uint64_t v3 = swift_isaMask & *v1;
  uint64_t v4 = sub_10003A124(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

void APUILiveActivitiesHostingController.init(coder:)()
{
}

void sub_100039B1C()
{
}

uint64_t sub_100039B74(uint64_t a1)
{
  id v3 = v1;
  return a1;
}

uint64_t sub_100039B8C()
{
  return 1;
}

Swift::Void __swiftcall APUILiveActivitiesHostingController.viewIsAppearing(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for APUILiveActivitiesHostingController();
  [super viewIsAppearing:a1];
  _s18ActivityProgressUI35APUILiveActivitiesHostingControllerC29preferredContentSizeDidChange08forChildI9ContainerySo09UIContentO0_p_tF_0_0();
}

void sub_100039C1C(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  APUILiveActivitiesHostingController.viewIsAppearing(_:)(a3);
}

void sub_100039C74(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  _s18ActivityProgressUI35APUILiveActivitiesHostingControllerC29preferredContentSizeDidChange08forChildI9ContainerySo09UIContentO0_p_tF_0();
  swift_unknownObjectRelease();
}

void _s18ActivityProgressUI35APUILiveActivitiesHostingControllerC29preferredContentSizeDidChange08forChildI9ContainerySo09UIContentO0_p_tF_0_0()
{
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    return;
  }
  id v2 = v1;
  objc_super v3 = [v1 window];

  if (v3)
  {
    id v4 = [v3 windowScene];
    if (v4)
    {
      objc_super v10 = v4;
      type metadata accessor for ActivityScene();
      if (swift_dynamicCastClass())
      {
        [v0 preferredContentSize];
        id v5 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
        ActivitySceneMetrics.init(size:cornerRadius:)();
        dispatch thunk of ActivityScene.resolvedMetrics.setter();
        uint64_t v6 = v3;
LABEL_13:

        return;
      }
    }
    if (qword_100056DE0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000084C0(v7, (uint64_t)qword_100058928);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v8, "LiveActivitiesHostingController used in a scene that's not an ActivityScene", v9, 2u);
      swift_slowDealloc();
    }
    objc_super v10 = v3;
    goto LABEL_13;
  }
}

void APUILiveActivitiesHostingController.init(nibName:bundle:)()
{
}

void sub_100039EFC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;

  sub_10003A848();
}

id APUILiveActivitiesHostingController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUILiveActivitiesHostingController();
  return [super dealloc];
}

void sub_100039FE4(uint64_t a1)
{
}

uint64_t sub_100039FF4(uint64_t a1)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return UIHostingController.init(rootView:)();
}

uint64_t sub_10003A0DC(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for APUISecureHostingController());
  return sub_100039FF4(a1);
}

char *sub_10003A124(uint64_t a1)
{
  uint64_t v3 = swift_isaMask & *v1;
  uint64_t v4 = type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin(v4);
  uint64_t v43 = *(void *)(v3 + 80);
  type metadata accessor for APUISecureHostingController();
  id v5 = v1;
  uint64_t v6 = (void *)sub_10003A0DC(a1);
  sub_10000847C(&qword_100056FE8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10003C710;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  uint64_t v45 = v7;
  sub_10003A904();
  sub_10000847C(&qword_100056FF8);
  sub_10003A95C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  dispatch thunk of UIHostingController.sizingOptions.setter();
  *(void *)((char *)v5 + qword_100058940) = v6;
  id v8 = v6;

  v44.receiver = v5;
  v44.super_class = (Class)type metadata accessor for APUILiveActivitiesHostingController();
  id v9 = [super initWithNibName:0 bundle:0];
  unint64_t result = (char *)[v9 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v11 = result;
  uint64_t v12 = qword_100058940;
  unint64_t result = (char *)[*(id *)&v9[qword_100058940] view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v13 = result;
  [v11 addSubview:result];

  [v9 addChildViewController:*(void *)&v9[v12]];
  unint64_t result = (char *)[v9 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = result;
  uint64_t v15 = self;
  id v16 = [v15 clearColor];
  [v14 setBackgroundColor:v16];

  unint64_t result = (char *)[v8 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v17 = result;
  id v18 = [v15 clearColor];
  [v17 setBackgroundColor:v18];

  unint64_t result = (char *)[v8 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v19 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_10000847C(&qword_100057DD0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_10003C720;
  unint64_t result = (char *)[v8 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v21 = result;
  id v22 = [result topAnchor];

  unint64_t result = (char *)[v9 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v23 = result;
  id v24 = [result topAnchor];

  id v25 = [v22 constraintEqualToAnchor:v24];
  *(void *)(v20 + 32) = v25;
  unint64_t result = (char *)[v8 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v26 = result;
  id v27 = [result leadingAnchor];

  unint64_t result = (char *)[v9 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v28 = result;
  id v29 = [result leadingAnchor];

  id v30 = [v27 constraintEqualToAnchor:v29];
  *(void *)(v20 + 40) = v30;
  unint64_t result = (char *)[v8 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v31 = result;
  id v32 = [result trailingAnchor];

  unint64_t result = (char *)[v9 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  __int16 v33 = result;
  id v34 = [result trailingAnchor];

  id v35 = [v32 constraintEqualToAnchor:v34];
  *(void *)(v20 + 48) = v35;
  unint64_t result = (char *)[v8 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v36 = result;
  id v37 = [result bottomAnchor];

  unint64_t result = (char *)[v9 view];
  if (result)
  {
    uint64_t v38 = result;
    uint64_t v39 = self;
    id v40 = [v38 bottomAnchor];

    id v41 = [v37 constraintEqualToAnchor:v40];
    *(void *)(v20 + 56) = v41;
    uint64_t v45 = v20;
    specialized Array._endMutation()();
    sub_100008B0C();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v39 activateConstraints:isa];

    return v9;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for APUISecureHostingController()
{
  return sub_100011340();
}

uint64_t type metadata accessor for APUISecureWindow()
{
  return self;
}

void sub_10003A7D0()
{
}

uint64_t type metadata accessor for APUILiveActivitiesHostingController()
{
  return sub_100011340();
}

void sub_10003A848()
{
}

uint64_t sub_10003A878()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10003A8BC()
{
  return swift_initClassMetadata2();
}

unint64_t sub_10003A904()
{
  unint64_t result = qword_100056FF0;
  if (!qword_100056FF0)
  {
    type metadata accessor for UIHostingControllerSizingOptions();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100056FF0);
  }
  return result;
}

unint64_t sub_10003A95C()
{
  unint64_t result = qword_100057000;
  if (!qword_100057000)
  {
    sub_10000877C(&qword_100056FF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100057000);
  }
  return result;
}

uint64_t sub_10003A9BC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t dispatch thunk of Activity.endSync(_:dismissalPolicy:)()
{
  return dispatch thunk of Activity.endSync(_:dismissalPolicy:)();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination()
{
  return type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
}

uint64_t ActivityPresentationOptions.init(destinations:)()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
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

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t SceneSettingScopes.ActivitySettings.activityIdentifier.getter()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t static APKDeviceLockState.== infix(_:_:)()
{
  return static APKDeviceLockState.== infix(_:_:)();
}

uint64_t type metadata accessor for APKDeviceLockState()
{
  return type metadata accessor for APKDeviceLockState();
}

uint64_t dispatch thunk of APKLockStateMonitor.lockState.getter()
{
  return dispatch thunk of APKLockStateMonitor.lockState.getter();
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.setter()
{
  return dispatch thunk of APKLockStateMonitor.delegate.setter();
}

uint64_t APKLockStateMonitor.init()()
{
  return APKLockStateMonitor.init()();
}

uint64_t type metadata accessor for APKLockStateMonitor()
{
  return type metadata accessor for APKLockStateMonitor();
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

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
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

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t LayoutSubview.sizeThatFits(_:)()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t LayoutSubview.place(at:anchor:proposal:)()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t type metadata accessor for LayoutSubview()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t type metadata accessor for LayoutSubviews()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t static DynamicProperty._propertyBehaviors.getter()
{
  return static DynamicProperty._propertyBehaviors.getter();
}

Swift::Void __swiftcall DynamicProperty.update()()
{
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.truncationMode.getter()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t EnvironmentValues.truncationMode.setter()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
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

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Font.custom(_:size:relativeTo:)()
{
  return static Font.custom(_:size:relativeTo:)();
}

uint64_t type metadata accessor for Font.Leading()
{
  return type metadata accessor for Font.Leading();
}

uint64_t Font.leading(_:)()
{
  return Font.leading(_:)();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t type metadata accessor for Text.TruncationMode()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t dispatch thunk of View.body.getter()
{
  return dispatch thunk of View.body.getter();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.modifier<A>(_:)()
{
  return View.modifier<A>(_:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t static Layout._makeLayoutView(root:inputs:body:)()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t Layout.updateCache(_:subviews:)()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t static Layout.layoutProperties.getter()
{
  return static Layout.layoutProperties.getter();
}

uint64_t Layout.spacing(subviews:cache:)()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t Layout<>.makeCache(subviews:)()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t static UnitPoint.topLeading.getter()
{
  return static UnitPoint.topLeading.getter();
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

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return String.LocalizationValue.init(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
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

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
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

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t static UIButton.Configuration.plain()()
{
  return static UIButton.Configuration.plain()();
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
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

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
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

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t BSAuditTokenForCurrentProcess()
{
  return _BSAuditTokenForCurrentProcess();
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return _SBUIIsSystemApertureEnabled();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}